#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
precachehelicopter(model,type)
{
    if(!isdefined(type)) type = "blackhawk";
    deathfx = loadfx ("explosions/tanker_explosion");
    precacheModel( model );
    level.vehicle_deathmodel[model] = model;
    precacheitem( "cobra_FFAR_mp" );
    precacheitem( "hind_FFAR_mp" );
    precacheitem( "cobra_20mm_mp" );
    precachemodel("cobra_Hellfire");
    level.heli_sound["allies"]["hit"] = "cobra_helicopter_hit";
    level.heli_sound["allies"]["hitsecondary"] = "cobra_helicopter_secondary_exp";
    level.heli_sound["allies"]["damaged"] = "cobra_helicopter_damaged";
    level.heli_sound["allies"]["spinloop"] = "cobra_helicopter_dying_loop";
    level.heli_sound["allies"]["spinstart"] = "cobra_helicopter_dying_layer";
    level.heli_sound["allies"]["crash"] = "cobra_helicopter_crash";
    level.heli_sound["allies"]["missilefire"] = "weap_cobra_missile_fire";
    level.heli_sound["axis"]["hit"] = "hind_helicopter_hit";
    level.heli_sound["axis"]["hitsecondary"] = "hind_helicopter_secondary_exp";
    level.heli_sound["axis"]["damaged"] = "hind_helicopter_damaged";
    level.heli_sound["axis"]["spinloop"] = "hind_helicopter_dying_loop";
    level.heli_sound["axis"]["spinstart"] = "hind_helicopter_dying_layer";
    level.heli_sound["axis"]["crash"] = "hind_helicopter_crash";
    level.heli_sound["axis"]["missilefire"] = "weap_hind_missile_fire";
}
init()
{
    level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
    precachehelicopter( "vehicle_cobra_helicopter_fly" );
    precachehelicopter( "vehicle_mi24p_hind_desert" );
    precachemodel("weapon_ac130_projectile");
    level.chopper = undefined;
    level.heli_paths = [];
    level.heli_loop_paths = [];
    level.heli_leavenodes = [];
    level.heli_crash_paths = [];
    level.chopper_fx["explode"]["death"] = loadfx ("explosions/helicopter_explosion_cobra");
    level.chopper_fx["explode"]["large"] = loadfx ("explosions/aerial_explosion_large");
    level.chopper_fx["explode"]["medium"] = loadfx ("explosions/aerial_explosion");
    level.chopper_fx["smoke"]["trail"] = loadfx ("smoke/smoke_trail_white_heli");
    level.chopper_fx["fire"]["trail"]["medium"] = loadfx ("smoke/smoke_trail_black_heli");
    level.chopper_fx["fire"]["trail"]["large"] = loadfx ("fire/fire_smoke_trail_L");
    self thread watchDeath();
    self thread giveheli();
}
giveheli()
{
    wait 0.05;
    destination = 0;
	targets = getEntArray("choppa_path", "targetname");
    self thread heli_think( level.activ, targets[RandomInt(targets.size)].origin, self.pers["team"] );
}

spawn_helicopter( level.activ, origin, angles, model, targetname )
{
    chopper = spawnHelicopter( level.activ, origin, angles, model, targetname );
    chopper.attractor = Missile_CreateAttractorEnt( chopper, level.heli_attract_strength, level.heli_attract_range );
    return chopper;
}
heli_think( level.activ, startnode, heli_team, requiredDeathCount )
{
    heliAngles = level.activ.angles;
    heliOrigin = level.activ.origin + (0,0,2000);
    if( heli_team == "allies" )
    {
        chopper = spawn_helicopter( level.activ, heliOrigin, heliAngles, "cobra_mp", "vehicle_mi24p_hind_mp" );
        chopper playLoopSound( "mp_cobra_helicopter" );
    }
    else
    {
        chopper = spawn_helicopter( level.activ, heliOrigin, heliAngles, "cobra_mp", "vehicle_mi24p_hind_mp" );
        chopper playLoopSound( "mp_cobra_helicopter" );
    }
    chopper.requiredDeathCount = level.activ.deathCount;
    chopper.team = heli_team;
    chopper.pers["team"] = heli_team;
    chopper.level.activ = level.activ;
    level.activ.choppa = chopper;
    level.activ.choppa = chopper;
    chopper thread heli_existance();
    if( isDefined( level.firstchopper ) ) level.secondchopper = chopper;
    else level.firstchopper = chopper;
    if( isDefined( level.firstchopper ) && isDefined( level.secondchopper ) ) level.chopper = chopper;
    chopper.reached_dest = false;
    chopper.maxhealth = level.heli_maxhealth;
    chopper.waittime = level.heli_dest_wait;
    chopper.loopcount = 0;
    chopper.health_bulletdamageble = level.heli_armor;
    chopper.health_low = level.heli_maxhealth*0.8;
    chopper.targeting_delay = level.heli_targeting_delay;
    chopper.primaryTarget = undefined;
    chopper.secondaryTarget = undefined;
    chopper.attacker = undefined;
    chopper.missile_ammo = level.heli_missile_max;
    chopper.currentstate = "ok";
    chopper.lastRocketFireTime = -1;
    chopper.angles = level.activ.angles;
    chopper.origin = level.activ.origin + (0,0,1000);
    level.activ hide();
    if( level.activ.pers["team"] == "allies" )
    {
        heli_centroid = chopper.origin + ( 0, 0, -145 );
        heli_forward_norm = anglestoforward( chopper.angles );
        heli_turret_point = heli_centroid + 110*heli_forward_norm;
    }
    else
    {
        heli_centroid = chopper.origin + ( 0, 0, -100 );
        heli_forward_norm = anglestoforward( chopper.angles );
        heli_turret_point = heli_centroid + 120*heli_forward_norm;
    }
    level.activ setorigin( heli_turret_point );
    level.activ.flyingheli = true;
    self.zething = spawn("script_origin", level.activ.origin);
    level.activ linkto( self.zething );
    self.zething linkto( chopper );
    chopper thread heli_fly( level.activ );
    chopper thread heli_damage_monitor();
    chopper thread heli_health();
}
heli_existance()
{
    self waittill_any( "death", "crashing", "leaving" );
    level notify( "helicopter gone" );
}
heli_reset()
{
    self clearTargetYaw();
    self clearGoalYaw();
    self setspeed( 60, 25 );
    self setyawspeed( 75, 45, 45 );
    self setmaxpitchroll( 30, 30 );
    self setneargoalnotifydist( 256 );
    self setturningability(0.9);
}
heli_wait( waittime )
{
    self endon ( "death" );
    self endon ( "crashing" );
    wait( waittime );
}
heli_hover()
{
    self endon( "death" );
    self endon( "stop hover" );
    self endon( "leaving" );
    self endon( "crashing" );
    original_pos = self.origin;
    original_angles = self.angles;
    self setyawspeed( 10, 45, 45 );
    x = 0;
    y = 0;
}
heli_damage_monitor()
{
    self endon( "death" );
    self endon( "crashing" );
    self endon( "leaving" );
    self.damageTaken = 0;
    for(;;)
    {
        self waittill( "damage", damage, attacker, direction_vec, P, type );
        if( !isdefined( attacker ) || !isplayer( attacker ) ) continue;
        heli_friendlyfire = maps\mp\gametypes\_weapons::friendlyFireCheck( self.level.activ, attacker );
        if( !heli_friendlyfire ) continue;
        if( isDefined( self.level.activ ) && attacker == self.level.activ ) continue;
        if ( level.teamBased ) isValidAttacker = (isdefined( attacker.pers["team"] ) && attacker.pers["team"] != self.team);
        else isValidAttacker = true;
        if ( !isValidAttacker ) continue;
        attacker thread maps\mp\gametypes\_damagefeedback::updateDamageFeedback( false );
        self.attacker = attacker;
        if ( type == "MOD_RIFLE_BULLET" || type == "MOD_PISTOL_BULLET" )
        {
            if( self.damageTaken >= self.health_bulletdamageble ) self.damageTaken += damage;
            else self.damageTaken += damage*level.heli_armor_bulletdamage;
        }
        else self.damageTaken += damage;
        if( self.damageTaken > self.maxhealth ) attacker notify( "destroyed_helicopter", self.level.activ );
    }
}
heli_health()
{
    self endon( "death" );
    self endon( "leaving" );
    self endon( "crashing" );
    self.currentstate = "ok";
    self.laststate = "ok";
    self setdamagestage( 3 );
    for (;;)
    {
        if ( self.health_bulletdamageble > self.health_low )
        {
            if ( self.damageTaken >= self.health_bulletdamageble ) self.currentstate = "heavy smoke";
            else if ( self.damageTaken >= self.health_low ) self.currentstate = "light smoke";
        }
        else
        {
            if ( self.damageTaken >= self.health_low ) self.currentstate = "heavy smoke";
            else if ( self.damageTaken >= self.health_bulletdamageble ) self.currentstate = "light smoke";
        }
        if ( self.currentstate == "light smoke" && self.laststate != "light smoke" )
        {
            self setdamagestage( 2 );
            self.laststate = self.currentstate;
        }
        if ( self.currentstate == "heavy smoke" && self.laststate != "heavy smoke" )
        {
            self setdamagestage( 1 );
            self notify ( "stop body smoke" );
            self.laststate = self.currentstate;
        }
        if ( self.currentstate == "heavy smoke" )
        {
            self.damageTaken += level.heli_health_degrade;
            level.heli_rage_missile = 20;
        }
        if ( self.currentstate == "light smoke" )
        {
            self.damageTaken += level.heli_health_degrade/2;
            level.heli_rage_missile = 10;
        }

        if( self.damageTaken > self.maxhealth ) self thread heli_crash();
        wait 1;
    }
}
heli_crash()
{
    self notify( "crashing" );
    self thread heli_spin( 180 );
    playfxontag( level.chopper_fx["explode"]["large"], self, "tag_engine_left" );
    self playSound ( level.heli_sound[self.team]["hitsecondary"] );
    self setdamagestage( 0 );
    self thread trail_fx( level.chopper_fx["fire"]["trail"]["large"], "tag_engine_left", "stop body fire" );
    self thread heli_explode();
}
heli_spin( speed )
{
    self endon( "death" );
    playfxontag( level.chopper_fx["explode"]["medium"], self, "tail_rotor_jnt" );
    self playSound ( level.heli_sound[self.team]["hit"] );
    self thread spinSoundShortly();
    self thread trail_fx( level.chopper_fx["smoke"]["trail"], "tail_rotor_jnt", "stop tail smoke" );
    self setyawspeed( speed, speed, speed );
    while ( isdefined( self ) )
    {
        self settargetyaw( self.angles[1]+(speed*0.9) );
        wait ( 1 );
    }
}
spinSoundShortly()
{
    self endon("death");
    wait .25;
    self stopLoopSound();
    wait .05;
    self playLoopSound( level.heli_sound[self.team]["spinloop"] );
    wait .05;
    self playSound( level.heli_sound[self.team]["spinstart"] );
}
trail_fx( trail_fx, trail_tag, stop_notify )
{
    self notify( stop_notify );
    self endon( stop_notify );
    self endon( "death" );
    for (;;)
    {
        playfxontag( trail_fx, self, trail_tag );
        wait( 0.05 );
    }
}
heli_explode()
{
    self notify( "death" );
    forward = ( self.origin + ( 0, 0, 100 ) ) - self.origin;
    playfx ( level.chopper_fx["explode"]["death"], self.origin, forward );
    self playSound( level.heli_sound[self.team]["crash"] );
    self.level.activ setclientdvar( "cg_thirdperson", "0" );
    self.level.activ setclientdvar( "cg_thirdpersonrange", "120" );
    self.level.activ [[level.onSpawnPlayer]]();
    self.level.activ maps\mp\gametypes\_class::giveLoadout(self.level.activ.pers["team"], self.level.activ.class);
    self.level.activ show();
    self.level.activ.flyingheli = undefined;
    self.level.activ unlink();
    level.chopper = undefined;
    if(isDefined(level.firstchopper ) )
    {
        if( self == level.firstchopper ) level.firstchopper = undefined;
    }
    if(isDefined(level.secondchopper ) )
    {
        if( self == level.secondchopper ) level.secondchopper = undefined;
    }
    if( isDefined( self ) ) self delete();
}
heli_fly( level.activ )
{
    self endon( "death" );
    self notify( "flying");
    self endon( "flying" );
    self endon( "abandoned" );
    level.activ takeallweapons();
    self setturningability(1);
    self.reached_dest = false;
    heli_reset();
    level.activ.isturretsafe = true;
    level.activ.islinked = true;
    self.ispitchedown = false;
    pos = self.origin;
        //change to 1 for third person
    level.activ setclientdvar( "cg_thirdperson", "0" );
    level.activ setclientdvar( "cg_thirdpersonrange", "620" );
    level.activ iprintlnbold( "Flyable Chopper!" );
    level.activ iprintlnbold( "Press MELEE to move forward and FIRE to fire" );
    level.activ iprintlnbold( "rockets." );
    wait( 2 );
    while( isAlive( level.activ ) )
    {
        angle = level.activ getplayerangles();
        if( level.activ meleebuttonpressed() ) level.activ thread moveonangle( angle );
        else
        {
            distance = vecscale( anglestoforward( angle ), 25 );
            if( self.ispitchedown )
            {
                self setvehgoalpos( self.origin + distance, 1 );
                self helirotateto( (self.angles[0], self.angles[1], self.angles[2] ), "up" );
                self.ispitchedown = false;
            }
            self.angles = level.activ.angles;
        }
        if( level.activ attackbuttonpressed() && level.activ.isturretsafe )
        {
            level.activ.isturretsafe = false;
            level.activ thread maketurretsafe();
            level.activ thread GiveMagicBullets("projectile_hellfire_missile", level.heli_sound[self.team]["missilefire"], 100, level.fx_airstrike_contrail, "");
        }
        if( level.activ fragbuttonpressed() )
        {
            level.activ heli_vertical( "down" );
        }
        if( level.activ SecondaryOffhandButtonPressed() )
        {
            level.activ heli_vertical( "up" );
        }
        self.angles = angle;
        wait 0.05;
    }
}
helirotateto( vec, dif )
{
    if( dif == "up" )
    {
        for( i = 0;i < 10;i++ )
        {
            self.angles = self.angles + ( 1.5,0,0 );
            wait 0.05;
        }
    }
    else
    {
        for( i = 0;i < 10;i++ )
        {
            self.angles = self.angles - ( 1.5,0,0 );
            wait 0.05;
        }
    }
}
heli_vertical( dir )
{
    if( dir == "up" )
    {
        if( bullettracepassed( self.choppa.origin, self.choppa.origin + (0,0,25), false, self.choppa ) )
        {
            self.choppa setspeed( 100, 100 );
            self.choppa setvehgoalpos( self.choppa.origin + (0,0,50), 1 );
        }
        else
        {
            self iprintlnbold("WTF? Crash the multi-million dollar chopper?!");
            self iprintlnbold("Jesus Christ, you suck at this stuff man.");
            self.choppa thread heli_explode();
        }
    }
    else
    {
        if( bullettracepassed( self.choppa.origin, self.choppa.origin - (0,0,25), false, self.choppa ) )
        {
            self.choppa setspeed( 100, 100 );
            self.choppa setvehgoalpos( self.choppa.origin - (0,0,50), 1 );
        }
        else
        {
            self iprintlnbold("WTF? Crash the multi-million dollar chopper?!");
            self iprintlnbold("Jesus Christ, you suck at this stuff man.");
            self.choppa thread heli_explode();
        }
    }
}
maketurretsafe()
{
    wait 3;
    self.isturretsafe = true;
}
moveonangle( angle )
{
    distance = vecscale( anglestoforward( angle ), 25 );
    if( bullettracepassed( self.origin, self.origin + distance, false, self.choppa ) )
    {
        if( !isDefined( self.choppa ) ) return;
        if( !self.choppa.ispitchedown )
        {
            self helirotateto( (0,0,0), "down" );
            self.choppa.ispitchedown = true;
        }
        self.choppa setspeed( 50, 50 );
        self.choppa SetTargetYaw( angle[1] );
        self.choppa SetYawSpeed( 180, 60, 60, 0 );
        self.choppa setvehgoalpos( self.choppa.origin + distance, 0 );
    }
    else
    {
        self iprintlnbold("WTF? Crash the multi-million dollar chopper?!");
        self iprintlnbold("Jesus Christ, you suck at this stuff man.");
        self.choppa thread heli_explode();
    }
}

GiveMagicBullets(model, sound, move, geotrail, loop)
{
    self endon("death");
    self endon("disconnect");
    self thread VaderBullet(model, sound, move, geotrail, loop);
}
VaderBullet(model, sound, move, geotrail, loop)
{
    level.activ = self;
    vec = anglestoforward(self getPlayerAngles());
    bullet = spawn("script_model", self.origin+(20,20,20));
    bullet setModel(model);
    bullet.angles = self getPlayerAngles();
    bullet playsound(sound);
    bullet thread BulletFly(level.activ, vec, move, geotrail, loop);
}
BulletFly(level.activ, vec, move, geotrail, loop)
{
    self endon("end");
    self playsound(loop);
    for (i = 350;i > 0;i--)
    {
        speed = (vec[0] * move, vec[1] * move, vec[2] * move)*2.3;
        if (bullettracepassed(self.origin, self.origin + speed, false, undefined))
        {
            self moveto(self.origin + speed, 0.1);
            playFxOnTag( geotrail , self, "tag_origin");
        }
        else
        {
            mark = self.origin;
            self thread BulletExplode(level.activ, mark, loop);
            self notify("end");
        }
        wait 0.01;
    }
    mark = self.origin;
    self thread BulletExplode(level.activ, mark, loop);
    self notify("end");
}
BulletExplode(level.activ, mark, loop)
{
    self stoploopsound(loop);
    wait 0.05;
    self playsound("rocket_explode_default");
    self playsound("car_explode");
    level.expbullt = loadfx("explosions/aerial_explosion");
    Playfx(level.expbullt, mark);
    RadiusDamage(mark, 350, 450, 25, level.activ);
    self delete();
}
watchDeath()
{
    self waittill("death");
    self.choppa thread heli_explode();
}
vecscale(vec, scalar)
{
    return (vec[0]*scalar, vec[1]*scalar, vec[2]*scalar);
}  