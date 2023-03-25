//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//    __              ___                 \\
//   /\ \            /\_ \                \\
//   \ \ \        ___\//\ \    ____       \\
//    \ \ \  __  / __`\\ \ \  /\_ ,`\     \\
//     \ \ \L\ \/\ \L\ \\_\ \_\/_/  /_    \\
//      \ \____/\ \____//\____\ /\____\   \\
//       \/___/  \/___/ \/____/ \/____/   \\
// 								          \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//Map by Lolz      |      Scripted by Lolz\\
//        Nickname i have in game :       \\
//   Lolz :] -SuX Lolz :] -#FNRP#Lolz :]  \\
//            xFire: alex1528             \\
//    Steam: iswenzz1528 / SuX Lolz :]    \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_common;

main()
{
 maps\mp\_load::main();
 maps\mp\mp_dr_portal_p::main();
 maps\mp\_compass::setupMiniMap("compass_map_mp_dr_portal");
 
 level._effect[ "spawnlight" ] = loadFX("light/spawn_l");
 level._effect[ "spawnlight_ora" ] = loadFX("light/spawn_l_ora");
 level._effect[ "dust" ] = loadFX("dust/abrams_desk_dust");
 level._effect[ "dustwind" ] = loadFX("dust/dust_wind_fast");
 level._effect[ "ash" ] = loadFX("dust/ash_spiral01");
 level._effect[ "debri1" ] = loadFX("portal/debri1");
 level._effect[ "debri2" ] = loadFX("portal/debri2");
 
 SetExpFog( 768, 1500, 123/255, 155/255, 175/255, 3 );
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
	//SETDVAR**
	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","1600");

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 2000000000 );
	setDvar("bg_falldamageminheight", 1500000000 );
	//SETDVAR*

	//THREAD**
	thread onPlayerConnected();
	thread onRound();
	thread spawnsetup();
	thread lightbridge();
	thread portalsetup();
	//thread spawnng1();
	//THREAD*

	//PRECACHE**
	//PRECACHE*

	//ACTI TRIGGER
	//ACTI TRIGGER

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

portalsetup()
{
	thread portal1();
}

portal1()
{
	p1b_FX = getEnt("portal_1_blue","targetname");
	p1r_FX = getEnt("portal_1_red","targetname");
	p1b_wat = getEnt("portal_1_blue_wat","targetname");
	p1r_wat = getEnt("portal_1_red_wat","targetname");
	wait .5;
	p1b = spawn("script_model", p1b_FX.origin -(0,5,0));
	p1r = spawn("script_model", p1r_FX.origin -(0,-5,0));
	p1b.dummy = spawn("script_model", p1b_FX.origin-(0,5,0));
	p1r.dummy = spawn("script_model", p1r_FX.origin-(0,-5,0));
	
	p1b.angles = (0,90,0);
	p1b.dummy.angles = (0,90,0);
	p1r.angles = (0,270,0);
	p1r.dummy.angles = (0,270,0);

	level waittill("round_started");
	
	/*ent = maps\mp\_utility::createOneshotEffect( "blueportal_open" );
	ent.v[ "origin" ] = (176.2, 1492.2, -2048); 
	ent.v[ "angles" ] = (0 ,90 ,0);
	ent.v[ "fxid" ] = "blueportal_open"; 
	ent.v[ "delay" ] = -15;
	
	ent = maps\mp\_utility::createOneshotEffect( "redportal_open" );
	ent.v[ "origin" ] = p1r.origin; 
	ent.v[ "angles" ] = p1r.angles;
	ent.v[ "fxid" ] = "redportal_open";
	ent.v[ "delay" ] = -1;*/
	
	wait 0.75;
	p1b setmodel( "portal_blue" );
	p1b.dummy setmodel( "portal_dummy_blue" );
	p1r setmodel( "portal_red" );
	p1r.dummy setmodel( "portal_dummy_red" );
	iprintlnbold("portal 1 created");
	
	p1b_wat delete();
	p1r_wat delete();
	
	thread p1btp();
	thread p1rtp();
}

p1btp()
{
	ent = getEnt("portal_1_blue_enter","targetname");
	out = getEnt("portal_1_red_out","targetname");
	
	for(;;)
	{
		ent waittill("trigger",player);
		player freezeControls(true);
		player setOrigin(out.origin);
		player setPlayerAngles(out.angles);
		player freezeControls(false);
	}
}

p1rtp()
{
	ent = getEnt("portal_1_red_enter","targetname");
	out = getEnt("portal_1_blue_out","targetname");
	
	for(;;)
	{
		ent waittill("trigger",player);
		player freezeControls(true);
		player setOrigin(out.origin);
		player setPlayerAngles(out.angles);
		player freezeControls(false);
	}
}

lightbridge()
{
	thread bridge1();
	//thread delbridge1();
}

delbridge1()
{
	level waittill("round_started");
	
	b1 = [];
	i = 0;
	
	wait .05;
	
	while(isDefined(getEnt("bridge_1_" + i ,"targetname"))) {
		b1[i] = getEnt("bridge_1_" + i ,"targetname");
		b1[i] delete();
		i++;
	}
}

bridge1()
{
	level waittill("round_started");
	
	b1 = [];
	i = 0;
	time = 0;
	coord = 0;
	
	wait .05;
	
	while(isDefined(getEnt("bridge_1_" + i ,"targetname"))) {
		b1[i] = getEnt("bridge_1_" + i ,"targetname");
		if(!isDefined(b1[0].realOrigin))
			b1[0].realOrigin = b1[1].origin;
		if(!isDefined(b1[1].realOrigin))
			b1[1].realOrigin = b1[1].origin;
		if(!isDefined(b1[2].realOrigin))
			b1[2].realOrigin = b1[1].origin;
		
		if(!isDefined(b1[0].del))
			b1[0].del = true;
		
		time += 40; //speed
		coord += 1344; //bridge size
		
		b1[i] thread bmove(coord,time,80,2688);
		i++;
	}
}

bmove(coord,time,time2,coord2)
{
	if(self.script_noteworthy == "x")
		self moveX(coord, time);
	if(self.script_noteworthy == "y")
		self moveY(coord, time);
	if(self.script_noteworthy == "z")
		self moveZ(coord, time);
	wait time; //movedone make a little gap between bridge
	if(isDefined(self.realOrigin))
			self.origin = self.realOrigin;
	if(isDefined(self.del)) {
		if(self.del == true)
			self delete();
	}
	
	while(1) {
		if(self.script_noteworthy == "x")
			self moveX(coord2, time2);
		if(self.script_noteworthy == "y")
			self moveY(coord2, time2);
		if(self.script_noteworthy == "z")
			self moveZ(coord2, time2);
		wait time; //movedone make a little gap between bridge
		if(isDefined(self.realOrigin))
			self.origin = self.realOrigin;
	}
}

onPlayerConnected()
{
	for(;;)
	{
	level waittill("connected", player);
	player thread onPlayer();
	}
}

onRound()
{
	for(;;)
	{
	level waittill("round_started",player);
	player thread onPlayer(); //ng
	}
}

onPlayer()
{
	for(;;)
	{
	level waittill("player_spawn",player);
	player thread forcedvar( player ); //if not forced some traps / thing on the map will not work
	player thread giveportal( player );
	}
}

giveportal(player)
{
	wait 0.1;
	player giveweapon("portalgun");
	//player switchtoweapon("portalgun");
	player givemaxammo("portalgun");
	
	wait .05;
	weap = player getCurrentWeapon();
	wait .05;
	
	while(1) {
		wait .5;
		if(weap == level.portal)
			player.portalweap = true;
		if(weap != level.portal)
			player.portalweap = false;
	}
}

forcedvar( p )
{
	while(1)
	{
		p setClientDvar("dynent_active","1");
		p setClientDvar("r_detail","1");
		p setClientDvar("r_specular","1");
		p setClientDvar("r_normal","1");
		wait 1;
	}
}

spawnng1()
{
	ng1 = getEnt("spawn_ng","targetname");
	level common_scripts\utility::waittill_any("round_started","game started");
	wait 0.05;
	
	for(;;) {
	ng1 waittill("trigger",player);
	player disableWeapons();
		if(!isDefined (ng1))
			break;
	wait 0.05;
	}
}

spawnsetup()
{
	level.orig = getEnt("orig_spawn","targetname");
	level common_scripts\utility::waittill_any("round_started","game started");
	//self disableWeapons();
	//self iprintlnbold("weapon disabled for intro");
	//ambientPlay("sp_a1_intro1_b1");
	//thread roomlink();
	thread light();
	//wait 5;
	//iprintlnbold("intro start");
	//thread b1();
}

phys()
{
	p = getEntArray("phy_spawn","targetname");
	wait 0.2;
	for(i=0;i<p.size;i++)
	PhysicsExplosionCylinder( p[i].origin, 50, 40, 1 );
}

b1()
{
	fx1 = getEnt("fx_spawn_1","targetname");
	fx2 = getEnt("fx_spawn_2","targetname");
	fx3 = getEnt("fx_spawn_3","targetname");
	fx4 = getEnt("fx_spawn_4","targetname");
	fx5 = getEnt("fx_spawn_5","targetname");
	l = getEnt("fx_light","targetname");
	st = getEntArray("struct_spawn","targetname");
	mclip = getEntArray("clip_del_spawn","targetname");
	move1 = getEnt("move1","targetname");
	move2 = getEnt("move2","targetname");
	move3 = getEnt("move3","targetname");
	move4 = getEnt("move4","targetname");
	clipfin = getEnt("clip_fin_spawn","targetname");
	dynspawn = getEnt("dynent_spawn","targetname");
	ng1 = getEnt("spawn_ng","targetname");
	ng2 = getEnt("spawn_ng2","targetname");
	
	fx1 linkTo(level.orig);
	fx2 linkTo(level.orig);
	fx3 linkTo(level.orig);
	fx4 linkTo(level.orig);
	fx5 linkTo(level.orig);
	
	thread playerlink();
	wait 1.8;
	dynspawn delete();
	wait 0.2;
	Earthquake( 0.6, 8, level.orig.origin, 2000 );
	level.orig moveto(move1.origin, 8, 2, 2);
	thread phys();
	playFx(level._effect[ "debri1" ], fx2.origin);
	playFx(level._effect[ "debri2" ], fx1.origin);
	playFx(level._effect[ "dustwind" ], fx4.origin);
	playFx(level._effect[ "dust" ], fx5.origin);
	PhysicsJitter( l.origin, 200, 150, 1.0, 5.0 );
	PhysicsExplosionCylinder( l.origin, 100, 80, 2 );
	PhysicsExplosionSphere( l.origin, 100, 80, 1 );
	wait 2;
	level.orig rotateRoll(10, 2, 1, 1);
	wait 2;
	playFx(level._effect[ "dustwind" ], fx2.origin);
	playFx(level._effect[ "dustwind" ], fx4.origin);
	Earthquake( 0.3, 8, level.orig.origin, 2000 );
	level.orig rotateRoll(-10, 2, 1, 1);
	wait 2;
	level.orig rotatePitch(-10, 2, 1, 1);
	wait 2;
	Earthquake( 0.3, 8, level.orig.origin, 2000 );
	level.orig rotatePitch(10, 1.5, 1, 0.4);
	wait 1.5;
	Earthquake( 0.3, 6, level.orig.origin, 2000 );
	level.orig rotatePitch(20, 2, 0.9, 0.9);
	wait 2;
	level.orig moveto(move2.origin, 2.15, 0.8, 0);
	level.orig rotatePitch(-25, 3, 1, 0);
	wait 2.05;
	PhysicsExplosionCylinder( move2.origin, 50, 40, 1 );
	Earthquake( 0.8, 3, level.orig.origin, 2000 );
	playFx(level._effect[ "debri1" ], fx2.origin);
	playFx(level._effect[ "debri2" ], fx1.origin);
	playFx(level._effect[ "dustwind" ], fx3.origin);
	wait 0.4;
	level.orig moveto(move3.origin, 6, 1, 0);
	level.orig rotatePitch(5, 1, 0.4, 0.4);
	wait 1;
	level.orig rotateRoll(-10, 2, 0.6, 0.6);
	wait 2;
	level.orig rotateRoll(10, 2, 0.4, 0.4);
	wait 3;
	Earthquake( 0.5, 12, level.orig.origin, 2000 );
	playFx(level._effect[ "dustwind" ], fx1.origin);
	playFx(level._effect[ "ash" ], fx1.origin);
	playFx(level._effect[ "dustwind" ], fx5.origin);
	wait 3;
	level.orig rotateRoll(-20, 2.8, 2, 0.4);
	level.orig moveto(move4.origin, 3, 1.5, 0);
	wait 1.88;
	for(i=0;i<st.size;i++)
		st[i] unlink();
	wait 0.6;
	level.orig rotateRoll(15, 0.3, 0.2, 0);
	wait 0.3;
	Earthquake( 1, 3, level.orig.origin, 2000 );
	playFx(level._effect[ "debri1" ], fx1.origin);
	playFx(level._effect[ "dustwind" ], fx1.origin);
	playFx(level._effect[ "ash" ], fx4.origin);
	for(i=0;i<mclip.size;i++)
		mclip[i] delete();
	PhysicsExplosionCylinder( move4.origin, 50, 40, 1 );
	level.orig rotatePitch(10, 0.6, 0.2, 0);
	ng1 delete();
	thread playerunlink();
	thread playerng1(ng2);
}

playerng1(ng2)
{
	player = getAllPlayers();
	for(i=0;i<player.size;i++) {
	player[i] setOrigin(ng2.origin);
	player[i] setPlayerAngles(ng2.angles);
	}
}

playerlink()
{
	player = getAllPlayers();
	for(i=0;i<player.size;i++) {
	player[i] thread lp();
	}
}

playerunlink()
{
	player = getAllPlayers();
	for(i=0;i<player.size;i++) {
	player[i] thread ulp();
	}
}

lp()
{
	self.linker = spawn("script_origin", self getOrigin());
	self linkTo(self.linker);
	self.linker linkTo(level.orig);
	self iprintlnbold("linked");
}

ulp()
{
	self.linker unlink();
	self unlink();
	wait .05;
	self.linker delete();
	self enableWeapons();
	self iprintlnbold("unlinked");
}

roomlink()
{
	b = getEntArray("wall_b_spawn","targetname");
	r = getEntArray("wall_r_spawn","targetname");
	l = getEntArray("wall_l_spawn","targetname");
	u = getEntArray("wall_u_spawn","targetname");
	d = getEntArray("wall_d_spawn","targetname");
	o2 = getEntArray("other2_spawn","targetname");
	o2e = getEntArray("other2_ent_spawn","targetname");
	st = getEntArray("struct_spawn","targetname");
	dyn = getEntArray("dyn1_spawn","targetname");
	bar = getEntArray("bars_spawn","targetname");
	grid = getEntArray("grid_spawn","targetname");
	
	for(i=0;i<dyn.size;i++) {
		dyn[i] enableLinkTo();
		dyn[i] linkTo(level.orig);
	}
	
	for(i=0;i<grid.size;i++) {
		grid[i] enableLinkTo();
		grid[i] linkTo(level.orig);
	}
	
	for(i=0;i<bar.size;i++) {
		bar[i] enableLinkTo();
		bar[i] linkTo(level.orig);
	}
	
	for(i=0;i<o2e.size;i++) {
		o2e[i] enableLinkTo();
		o2e[i] linkTo(level.orig);
	}
	
	for(i=0;i<o2.size;i++) {
		o2[i] enableLinkTo();
		o2[i] linkTo(level.orig);
	}
	
	for(i=0;i<st.size;i++) {
		st[i] enableLinkTo();
		st[i] linkTo(level.orig);
	}
	
	for(i=0;i<b.size;i++) {
		b[i] enableLinkTo();
		b[i] linkTo(level.orig);
	}
	
	for(i=0;i<r.size;i++) {
		r[i] enableLinkTo();
		r[i] linkTo(level.orig);
	}
	
	for(i=0;i<l.size;i++) {
		l[i] enableLinkTo();
		l[i] linkTo(level.orig);
	}
	
	for(i=0;i<u.size;i++) {
		u[i] enableLinkTo();
		u[i] linkTo(level.orig);
	}
	
	for(i=0;i<d.size;i++) {
		d[i] enableLinkTo();
		d[i] linkTo(level.orig);
	}
	
}

light()
{
	l = getEnt("fx_light","targetname");
	l2 = getEnt("fx_light_2","targetname");
	l linkTo(level.orig);
	l2 linkTo(level.orig);
	iprintlnbold("light");
	
	while(1) {
	playFX( level._effect[ "spawnlight" ], l.origin);
	playFX( level._effect[ "spawnlight_ora" ], l2.origin);
	wait 0.4;
	//iprintlnbold(l.origin);
	}
}


//END
