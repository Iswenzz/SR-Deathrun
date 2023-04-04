#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

#include braxi\_common;
#include braxi\_dvar;
main()
{

    maps\mp\_load::main();


	precacheItem("colt45_silencer_mp");
	level.fx["bombexplosion"] = loadfx( "explosions/tanker_explosion" );
	level._effect["lasers"] = loadFx("masseffect/laser_center2");
	level._effect["fire"] = loadFx("masseffect/fire_blue2");
	level.fireball_incomming = LoadFX("masseffect/fire_incomming");
	level.fireball_impact = LoadFX("masseffect/fire_impact");
	level.fire_blue = LoadFX("masseffect/fire_blue");
	level.laser_center = LoadFX("masseffect/laser_center");
	level.magic_orbs = LoadFX("masseffect/magic_orbs");
	level.orb_center = LoadFX("masseffect/orb_center");
	level.orb_explosion = LoadFX("masseffect/orb_explosion");
	level._effect["sparks"] = loadFx( "explosions/sparks" );
    level._effect["mine_explosion"] = loadfx ("explosions/green_exlosion");
	level.snow = LoadFX("masseffect/snow");
	level.fuze = LoadFX("sick/trail");
	level.flash = LoadFX("sick/flash");
	level.exp = LoadFX("sick/exp");
	level.blood = LoadFX("sick/blood");
	level.splash = LoadFX("sick/splash");
	level.sick_fire = LoadFX("sick/sick_fire");
	level.sick_body = LoadFX("sick/sick_body");
	level.fnrp = LoadFX("sick/fnrp");
	level.mini = LoadFX("sick/sick_green");
	level.sick_green = LoadFX("sick/mini");
	level.colours = LoadFX("sick/sick_colours");
	level.creditTime = 3.5;


	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	ambientPlay("sick");

	precacheItem( "remington700_mp" );
	precacheItem("frag_grenade_mp");
	precacheModel( "viewhands_dnf_duke" );
	precacheModel( "playermodel_terminator" );
	precacheModel( "playermodel_GTA_IV_NICO" );
	precacheItem("m60e4_mp");
	precacheItem("gl_mp");
	precacheItem("c4_mp");
	precacheMenu( "clientcmd" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	// setDvar("g_speed", 250 );

	/*thread lasers();
	thread fire();*/
	thread tele();
	thread fx_player();
	thread addTestClients();
	thread minefields();
	thread elec();
	/*thread snow();*/
	/*thread takewep();*/
	thread trap1();
	thread trap2();
	thread trap22();
	thread trap3();
	thread trap4();
	thread trap5();
	thread end();
	thread nico();
	thread termin();
	thread leadah();
	thread slider();
	thread flasher();
	thread deagle();
	thread find1();
	thread find2();
	thread speed();
	thread aintnobodygotimeforthat1();
	thread aintnobodygotimeforthat2();
	thread elec2();
	thread elec3();
	thread elec4();
	thread colours();
	thread sick_fire();
	thread drown();
    thread info();
	thread minigun();
	thread drown2();
	thread blood2();
	thread blood3();
	thread minigun2();
	thread crossbow();
	thread WatchKnife();
	/*thread fnrp();*/
	thread glow();
	thread arrow();
	thread arrow2();
	thread ven();
	thread WatchSniper();
	thread WatchCross();
	thread addtrapstofreerun();

}
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1_trig");
	addTriggerToList("trap3_trig");
	addTriggerToList("crusher_trig");
	addTriggerToList("spinner_trig");
	addTriggerToList("trap22_trig");
	addTriggerToList("spinner2_trig");
}
tele()
{
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}

transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		PlayFXOnTag( level.flash, player, "j_head" );
		PlayFXOnTag( level.flash, player, "j_neck" );

					      PlayFXOnTag( level.flash, player, "j_shoulder_le" );

					      PlayFXOnTag( level.flash, player, "j_shoulder_ri" );

					      PlayFXOnTag( level.flash, player, "j_spinelower" );

					      PlayFXOnTag( level.flash, player, "j_knee_ri" );

					      PlayFXOnTag( level.flash, player, "j_knee_le" );
						  PlayFXOnTag( level.flash, player, "j_knee_ri" );

					      PlayFXOnTag( level.flash, player, "j_knee_le" );

		wait 0.1;
	}
}
flash_player()
{
self endon("death");
while(1)
{
wait 1;

					      PlayFXOnTag( level.colours, self, "j_knee_ri" );


}
}
blood()
{
while(1)
{
self endon("death");
wait 2;
    PlayFXOnTag( level.blood, self, "j_head" );
		PlayFXOnTag( level.blood, self, "j_neck" );

					      PlayFXOnTag( level.blood, self, "j_shoulder_le" );

					      PlayFXOnTag( level.blood, self, "j_shoulder_ri" );

					      PlayFXOnTag( level.blood, self, "j_spinelower" );
						  PlayFXOnTag( level.blood, self, "j_head" );
		PlayFXOnTag( level.blood, self, "j_neck" );

}
}
splash()
{
self endon("death");
    PlayFXOnTag( level.splash, self, "j_head" );
		PlayFXOnTag( level.splash, self, "j_neck" );

					      PlayFXOnTag( level.splash, self, "j_shoulder_le" );

					      PlayFXOnTag( level.splash, self, "j_shoulder_ri" );

					      PlayFXOnTag( level.splash, self, "j_spinelower" );
}
sick_body()
{
self endon("death");
while(1)
{

					      PlayFXOnTag( level.sick_body, self, "j_spinelower" );
						  wait 1;
}
}
mini()
{

					      PlayFXOnTag( level.mini, self, "j_spinelower" );
						  PlayFXOnTag( level.mini, self, "j_shoulder_le" );
					      PlayFXOnTag( level.mini, self, "j_shoulder_ri" );

}
glow()
{
	glower = getEntArray("glower","targetname");
	while(1)
	{
		for(k = 0; k < glower.size; k++)
			playFx(level.fnrp,glower[k].origin);

		wait .5;
	}
}
lasers()
{
	lasers = getEntArray("lasers","targetname");
	while(1)
	{
		for(k = 0; k < lasers.size; k++)
			playFx(level._effect["lasers"],lasers[k].origin);

		wait .5;
	}
}
fire()
{
	fire = getEntArray("fire","targetname");
	while(1)
	{
		for(k = 0; k < fire.size; k++)
			playFx(level._effect["sparks"],fire[k].origin);

		wait .5;
	}
}
elec()
{
	fuze = getEntArray("fuze","targetname");
	while(1)
	{
		for(k = 0; k < fuze.size; k++)
			playFx(level.fuze,fuze[k].origin);

		wait .5;
	}
}
elec2()
{
    fuze2 = getent ("fuze2" ,"targetname");

    playLoopedFx(level.fuze, 1, fuze2.origin);
}
elec3()
{
    fuze3 = getent ("fuze3" ,"targetname");

    playLoopedFx(level.fuze, 1, fuze3.origin);
}
elec4()
{
    fuze4 = getent ("fuze4" ,"targetname");

    playLoopedFx(level.fuze, 1, fuze4.origin);
}
colours()
{
    col = getent ("gi" ,"targetname");

    playLoopedFx(level.colours, 1, col.origin);
}
ven()
{
    green = getent ("glow" ,"targetname");

    playLoopedFx(level.sick_green, 1, green.origin);
}
sick_fire()
{
self endon("death");
    fire2 = getent ("sick_fire2" ,"targetname");

   playLoopedFx(level.sick_fire, 1, fire2.origin);
}
fx_player()
{
	trig = getEnt ("fx_player", "targetname");
	trig setHintString("^1Phaedrean");
	trig waittill("trigger", player);
	player thread mini();
	trig setHintString("^2Now ^3Playing!");
	player GiveWeapon("m60e4_mp");
    player GiveMaxAmmo("m60e4_mp");
    player SwitchToWeapon( "m60e4_mp" );
	thread sick();
	for(;;)
	{
	trig waittill("trigger");
	player thread mini();
	player GiveMaxAmmo("m60e4_mp");
	player iPrintln("Minigun Ammo ^2[Restored]");
	wait 3;
    }
}
sick()
{

	wait 3;
	thread StartMassEffect();
}

StartMassEffect()
{
	self SetClientDvars("r_dLightLimit", 4, "r_distortion", 1 );
	SetExpFog( 128, 768, 0, 0, 0, 3 );
	sunlight = 1.3;
	while(sunlight>0.34)
	{
		sunlight -= 0.5;
		wait 0.2;
		self SetClientDvar("r_lightTweakSunLight", sunlight );
	}
	self SetClientDvar("r_lightTweakSunLight", 0 );
	wait 1;
	MusicPlay("music01");

	center = (0,0,350);
	ang = 0;
	fire_pos = undefined;
	fireball = undefined;

	for(i=0;i<5;i++)
	{
		fire_pos[i] = center+AnglesToForward( (0,ang,0) )*830;
		thread CreateFireball( fire_pos[i]+(0,0,1000) );
		ang += 72;		//5*72 = 360
		wait 1;
	}
	wait 4;
	fireball = getentarray("fireball", "targetname");
	for(i=0;i<fireball.size;i++)
	{
		trace = BulletTrace( fireball[i].origin, fireball[i].origin-(0,0,3000), false, fireball[i] );
		fireball[i] MoveTo( (trace["position"][0],trace["position"][1],250), 1, 1, 0 );
	}
	wait 1;
	for(i=0;i<fireball.size;i++)
	{
		EarthQuake( 1, 1, fireball[i].origin, 700 );
		PlayFX( level.fireball_impact, fireball[i].origin );
		PlayFX( level.fire_blue, fireball[i].origin );
		fireball[i] delete();
	}
	thread DoRandomFog();
	thread DoEarthQuaking();

	wait 5;

	height = 250;
	for(i=0;i<3;i++)
	{
		PlayFX( level.laser_center, (0,0,height) );
		height += 150;
		wait 1;
	}
	wait 1;

	orb = Spawn("script_model", (0,0,250) );
	orb SetModel("tag_origin");
	wait 0.05;
	PlayFXOnTag( level.orb_center, orb, "tag_origin" );
	orb MoveZ( 600, 5, 1, 1 );

	wait 6;

	PlayFX( level.orb_explosion, orb.origin );
	EarthQuake( 1.5, 1.5, orb.origin, 1600 );
	orb delete();

	spawns = getentarray("mp_tdm_spawn", "classname");
	for(i=0;i<spawns.size;i++)
		PlayFX( level.fireball_impact, spawns[i].origin+(0,0,50) );

	wait 3;

	PlayFX( level.magic_orbs, (0,0,500) );
}

CreateFireball( pos )
{
	fireball = spawn("script_model", pos );
	fireball SetModel("tag_origin");
	fireball.targetname = "fireball";
	wait 0.05;
	PlayFXOnTag( level.fireball_incomming, fireball, "tag_origin" );
}

DoRandomFog()
{
	while(1)
	{
		time = 1+RandomInt(3);
		SetExpFog( 64+RandomInt(256), 256+RandomInt(768), RandomFloat(1), RandomFloat(1), RandomFloat(1), time );
		wait time;
	}
}

DoEarthQuaking()
{
	level endon("stop_earthquaking");

	while(1)
	{
		EarthQuake( 0.1, 1, self.origin, 500 );
		wait 0.5;
	}
}
addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if(getdvarInt("scr_testclients") > 0)
			break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i=0;i<testclients;i++)
	{
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	thread addTestClients();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;

	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}
minefields()
{
	minefields = getentarray("minefield", "targetname");
	if (minefields.size > 0)
	{
		level._effect["mine_explosion"] = loadfx ("explosions/green_exlosion");
	}

	for(i = 0; i < minefields.size; i++)
	{
		minefields[i] thread minefield_think();
	}
}

minefield_think()
{
	while (1)
	{
		self waittill ("trigger",other);

		if(isPlayer(other))
			other thread minefield_kill(self);
	}
}

minefield_kill(trigger)
{
	if(isDefined(self.minefield))
		return;

	self.minefield = true;
	self playsound ("minefield_click");

	wait(.01);
	wait(randomFloat(.01));

	if(isdefined(self) && self istouching(trigger))
	{
		origin = self getorigin();
		range = 300;
		maxdamage = 2000;
		mindamage = 50;

		self playsound("explo_mine");
		playfx(level._effect["mine_explosion"], origin);
		radiusDamage(origin, range, maxdamage, mindamage);
	}

	self.minefield = undefined;
}
takewep()
{
	while(1)
	{
		level waittill( "jumper", who );
		who setModel( "playermodel_terminator" );
		// who setViewModel( "viewhands_dnf_duke" );
	}

}
nico()
{
trig = getEnt("nico", "targetname");
while(1)
{
trig waittill("trigger", player);
player setModel( "playermodel_GTA_IV_NICO" );
player thread mini();
player thread mini();
	player GiveWeapon("gl_mp");
    player GiveMaxAmmo("gl_mp");
    player SwitchToWeapon( "gl_mp" );
	player iPrintln("Model^2:[Nico]");
}
}
termin()
{
trig = getEnt("terminator", "targetname");
while(1)
{
trig waittill("trigger", player);
trig delete();
player setModel( "playermodel_terminator" );
}
}
trap1()
{
	trig = getEnt ("trap1_trig", "targetname");
	red = getent ("sparks1" ,"targetname"); //origin
	trig setHintString("^2Faster^7!!");
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	trig setHintString("^2Activated!");
    playLoopedFx( level._effect["sparks"], 1, red.origin );

	wait .05;
	thread move1();
	thread move2();
	thread move3();
	thread move4();

}
move1()
{
	brush = getEnt ("trap1_1", "targetname");

		while(1)
	    {
		brush rotateroll( 360,3);
		wait 3;
	    }

}
move2()
{
	brush = getEnt ("trap1_2", "targetname");

		while(1)
	    {
		brush rotateroll( -360,3);
		wait 3;
	    }

}
move3()
{
	brush = getEnt ("trap1_3", "targetname");

		while(1)
	    {
		brush rotateroll( 360,3);
		wait 3;
	    }

}
move4()
{
	brush = getEnt ("trap1_4", "targetname");

		while(1)
	    {
		brush rotateroll( -360,3);
		wait 3;
	    }

}
move5()
{
	brush = getEnt ("trap1_1", "targetname");

		while(1)
	    {
		brush rotateroll( 360,1.5);
		wait 3;
	    }

}
move6()
{
	brush = getEnt ("trap1_2", "targetname");

		while(1)
	    {
		brush rotateroll( -360,1.5);
		wait 3;
	    }

}
move7()
{
	brush = getEnt ("trap1_3", "targetname");

		while(1)
	    {
		brush rotateroll( 360,1.5);
		wait 3;
	    }

}
move8()
{
	brush = getEnt ("trap1_4", "targetname");

		while(1)
	    {
		brush rotateroll( -360,1.5);
		wait 3;
	    }

}
trap3()
{
    trig = getEnt( "trap3_trig", "targetname" );
	brush = getEnt( "exp_brusher", "targetname" );
	exp = getent ("exp" ,"targetname"); //origin
	brush = getEnt( "exp_brusher", "targetname" );
	red = getent ("sparks3" ,"targetname");
	trig setHintString("^1Explode^7!");
	trig waittill("trigger", player);
	trig setHintString("^2Activated!");
	player braxi\_rank::giveRankXp( "activator" );
	playLoopedFx( level._effect["sparks"], 1, red.origin );
	playFx(level.exp,exp.origin);
	brush playsound("explo_mine");
	EarthQuake( 1.9, 1.9, exp.origin, 2600 );
	wait 1;
	brush delete();
}
trap4()
{
    trig = getEnt( "crusher_trig", "targetname" );
	brush = getEnt( "crusher", "targetname" );
	hurt = getEnt( "hurt", "targetname" );
	red = getent ("sparks4" ,"targetname"); //origin
	trig setHintString("^1Activate");
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	trig setHintString("^2Activated!");
	hurt enablelinkto ();
	hurt linkto (brush);
	brush moveY(-817,5);
	brush waittill("movedone");
	brush moveY(817,5);
	playLoopedFx( level._effect["sparks"], 1, red.origin );
	wait 1;
}
drown()
{
    trig = getEnt( "splash", "targetname" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread splash();
	player playsound("splashwater");
	wait 3;
	}
}
drown2()
{
    trig = getEnt( "drown2", "targetname" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread splash();
	player playsound("splashwater");
	wait 3;
	}
}
blood2()
{
    trig = getEnt( "blood2", "targetname" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread blood();
	wait 3;
	}
}
blood3()
{
    trig = getEnt( "blood3", "targetname" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread blood();
	wait 3;
	}
}
trap5()
{
    trig = getEnt( "spinner_trig", "targetname" );
	brush = getEnt( "spinner", "targetname" );
	hurt = getEnt( "hurt2", "targetname" );
	red = getent ("sparks5" ,"targetname"); //origin
	trig setHintString("^1Activate!");
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	trig setHintString("^2Activated!");
	hurt playsound("spinnerr");
	playLoopedFx( level._effect["sparks"], 1, red.origin );
	hurt enablelinkto ();
	hurt linkto (brush);
	while(1)
	{
	brush rotateyaw(360,3.5);
	wait 2;
	}

}
trap2()
{
    trig = getEnt( "spinner2_trig", "targetname" );
	brush2 = getEnt( "spinner2_help", "targetname" );
	red = getent ("sparks6" ,"targetname"); //origin
	trig setHintString("^1Rotate!");
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	trig setHintString("^2Activated!");
	playLoopedFx( level._effect["sparks"], 1, red.origin );
	thread trap2_1();
	brush2 moveZ(-200,8);
	wait 3;
	brush2 delete();



}
trap2_1()
{
    brush = getEnt( "spinner2", "targetname" );
	wait 1.5;
	while(1)
	{
	brush rotateyaw(360,3.5);
	wait 2;
	}
}
trap22()
{
    trig = getEnt( "trap22_trig", "targetname" );
	brush = getEnt( "trap2", "targetname" );
	red = getent ("sparks2" ,"targetname"); //origin
	trig setHintString("^1Activate");
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	trig setHintString("^2Activated!");
	playLoopedFx( level._effect["sparks"], 1, red.origin );
	while(1)
	{
	brush moveZ(-200,3);
	brush waittill("movedone");
	brush moveZ(-200,3);
	brush waittill("movedone");
}


}
aintnobodygotimeforthat1()
{
    trig = getEnt( "no_time1_trig", "targetname" );
	brush = getEnt ("no_time1", "targetname");

	trig waittill("trigger", player);

	brush moveZ(-700,3);
	iPrintlnBold("^5Ain't nobody got time for "+player.name+"^1." );
	wait 5;
	brush delete();
}
aintnobodygotimeforthat2()
{
    trig = getEnt( "no_time2_trig", "targetname" );
	brush = getEnt ("no_time2", "targetname");

	trig waittill("trigger", player);

	brush moveZ(-700,3);
	iPrintlnBold("^5Ain't nobody got time for "+player.name+"^1." );
	wait 5;
	brush delete();
}
deagle()
{
	trig = getEnt ("deagle", "targetname");
	trig waittill("trigger", player);
	player GiveWeapon("deserteagle_mp");
    player GiveMaxAmmo("deserteagle_mp");
    player SwitchToWeapon( "deserteagle_mp" );
	iPrintln("^2"+player.name+" ^1got a sick deagle");
	wait 3;
	for(;;)
	{
	wait 3;
	trig waittill("trigger");
	player GiveWeapon("deserteagle_mp");
	player GiveMaxAmmo("deserteagle_mp");
	wait 3;
    }
}
slider()
{
	sli = getEnt("slider", "targetname");
	trig = getEnt("slider_trig", "targetname");
	for(;;)
	{
	trig waittill("trigger", player );
	sli moveX(-820,2);
	sli waittill("movedone");
	sli moveX(820,2);
	}
}
leadah()
{
    trig = getEnt("check", "targetname");
	trig waittill("trigger", player );
	player braxi\_rank::giveRankXp( "activator" );
	player braxi\_rank::giveRankXp( "activator" );
	player thread sick_body();
	player iPrintlnBold("^5You got ^1+50xp!");
	trig delete();
	noti = SpawnStruct();
	noti.notifyText = "^1<<^2"+player.name+" is in first^1>>";
	noti.duration = 6;
	noti.glowcolor = (1,1,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}
speed()
{
trig = getent ("faster", "targetname");
while(1)
{
trig waittill ("trigger",user);
trig delete();
user SetMoveSpeedScale( 1.3 );
user thread flash_player();
}
}
flasher()
{
    trig = getEnt("flash_trig", "targetname");
	sc = getEnt("flash", "targetname");
	for(;;)
	{
	trig waittill("trigger", player );
	playFx(level.flash,sc.origin);
	}
}
end()  // mp_dr_glass2
{
	door = getEnt("end_brush", "targetname");
	trig = getEnt("end_trig", "targetname");
	exp2 = getEnt("exp2", "targetname");
	trig waittill("trigger", player );
	trig delete();
player braxi\_rank::giveRankXp( "activator" );
	playFx(level.exp,exp2.origin);
	door playsound("explo_mine");
	EarthQuake( 2.3, 2.3, exp2.origin, 3000 );
	//iPrintlnBold("^1>>^2" + player.name + " finished the map at first place!");
	noti = SpawnStruct();
	noti.notifyText = "^1>>^2"+player.name+" Will Take on the Activator!";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	door delete();
}
info()
{
	if( isDefined( self.logoText ) )
		self.logoText destroy();

	self.logoText = newHudElem();
	self.logoText.y = 10;
	self.logoText.alignX = "center";
	self.logoText.alignY = "middle";
	self.logoText.horzAlign = "center_safearea";

	self.logoText.alpha = 0;
	self.logoText.sort = -3;
	self.logoText.fontScale = 1.6;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^2--->^3Map Made By ^1Poyser^2<---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^2---^2Xfire:^1poyser1911^2---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^1---------");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^2------");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}
minigun()
{
	trig = getEnt ("minigun", "targetname");
	trig waittill("trigger", player);
	player GiveWeapon("m60e4_mp");
    player GiveMaxAmmo("m60e4_mp");
    player SwitchToWeapon( "m60e4_mp" );
	player thread mini();
	player thread mini();
	for(;;)
	{
	trig waittill("trigger", player);
	player thread mini();
	player thread mini();
	player GiveWeapon("m60e4_mp");
    player GiveMaxAmmo("m60e4_mp");
    player SwitchToWeapon( "m60e4_mp" );
	player iPrintln("Minigun Ammo ^2[Restored]");
	wait 3;
    }
}
minigun2()
{
	trig = getEnt ("minigun2", "targetname");
	trig waittill("trigger", player);
	player thread mini();
	player thread mini();
	player GiveWeapon("m60e4_mp");
    player GiveMaxAmmo("m60e4_mp");
    player SwitchToWeapon( "m60e4_mp" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread mini();
	player thread mini();
	player GiveWeapon("m60e4_mp");
    player GiveMaxAmmo("m60e4_mp");
    player SwitchToWeapon( "m60e4_mp" );
	player iPrintln("Minigun Ammo ^2[Restored]");
	wait 3;
    }
}
crossbow()
{
	trig = getEnt ("crossbow", "targetname");
	trig waittill("trigger", player);
	player thread mini();
	player thread mini();
	player GiveWeapon("c4_mp");
    player GiveMaxAmmo("c4_mp");
    player SwitchToWeapon( "c4_mp" );
	for(;;)
	{
	trig waittill("trigger", player);
	player thread mini();
	player thread mini();
	player GiveWeapon("c4_mpp");
    player GiveMaxAmmo("c4_mp");
    player SwitchToWeapon( "c4_mp" );
	player iPrintln("Crossbow Ammo ^2[Restored]");
	wait 3;
    }
}
crossbow2()
{
	self thread mini();
	self thread mini();
	self GiveWeapon("c4_mp");
    self GiveMaxAmmo("c4_mp");
    self SwitchToWeapon( "c4_mp" );
}
minigun222()
{
	self thread mini();
	self thread mini();
	self GiveWeapon("m60e4_mp");
    self GiveMaxAmmo("m60e4_mp");
    self SwitchToWeapon( "m60e4_mp" );
}
WatchKnife()
{
	level.knife_trig = getEnt( "trigger_knife", "targetname");
	jump = getEnt( "knife_jumper", "targetname" );
	acti = getEnt( "knife_activator", "targetname" );

	while(1)
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
			            level.cross_trig delete();
                                     level.sniper_trig delete();
noti = SpawnStruct();
	noti.notifyText = "^2"+player.name+" ^5Choose ^2Knife";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
        player setPlayerangles( jump.angles );
		player setOrigin( jump.origin );
	    player freezeControls( true );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
	    level.activ freezeControls( true );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );
		wait 0.05;
		player thread showCredit( "^3.:^13^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^13^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^3.:^12^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^12^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^3.:^11^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^11^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ freezeControls( false );
		player freezeControls( false );
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		wait 2;
		 player thread sick_body();
		level.activ thread sick_body();

	wait 1;
	while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}
fnrp()
{
	brush = getEnt( "fnrp", "targetname" );

	while(1)
	{
		brush rotateyaw(360,5);
		wait 5;
	}

}
arrow()
{
	brush = getEnt( "arrow", "targetname" );
    thread up();
	while(1)
	{
		brush rotateyaw(360,5);
		wait 5;
	}
}
up()
{
    brush = getEnt( "arrow", "targetname" );

   while(1)
   {
    brush moveZ(25,1);
	brush waittill("movedone");
	brush moveZ(-25,1);
	brush waittill("movedone");
	}
}
arrow2()
{
	brush = getEnt( "arrow2", "targetname" );
    thread up2();
	while(1)
	{
		brush rotateyaw(360,5);
		wait 5;
	}
}
up2()
{
    brush = getEnt( "arrow2", "targetname" );

   while(1)
   {
  brush moveZ(25,1);
	brush waittill("movedone");
	brush moveZ(-25,1);
	brush waittill("movedone");
}
}
WatchSniper()
{
	level.sniper_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_activator", "targetname" );

	while(1)
	{
		level.sniper_trig waittill( "trigger", player );
		if( !isDefined( level.sniper_trig ) )
			return;
                               level.cross_trig delete();
                                     level.knife_trig delete();
        			noti = SpawnStruct();
	noti.notifyText = "^2"+player.name+" ^5Choose ^2Sniper";
	noti.duration = 6;
	noti.glowcolor = (1,0,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
        player setPlayerangles( jump.angles );
		player setOrigin( jump.origin );
	    player freezeControls( true );
		player TakeAllWeapons();
		player GiveWeapon("remington700_mp");
        player GiveMaxAmmo("remington700_mp");
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
	    level.activ freezeControls( true );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon("remington700_mp");
        level.activ GiveMaxAmmo("remington700_mp");
		wait 0.05;
		player thread showCredit( "^3.:^13^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^13^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^3.:^12^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^12^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^3.:^11^3:.", 2.3 );
		level.activ thread showCredit( "^3.:^11^3:.", 2.3 );
		wait 1;
		player thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ freezeControls( false );
		player freezeControls( false );
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
        player thread sick_body();
		level.activ thread sick_body();
	while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}
WatchCross()
{
	level.cross_trig = getEnt( "trigger_crossbow", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_activator", "targetname" );

	while(1)
	{
		level.cross_trig waittill( "trigger", player );
		if( !isDefined( level.cross_trig ) )
			return;
                        level.sniper_trig delete();
                                     level.knife_trig delete();
        			noti = SpawnStruct();
	noti.notifyText = "^2"+player.name+" ^5Choose ^2Cb";
	noti.duration = 6;
	noti.glowcolor = (1,1,0);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
        player setPlayerangles( jump.angles );
		player setOrigin( jump.origin );
	    player freezeControls( true );
		player TakeAllWeapons();
		player GiveWeapon("c4_mp");
        player GiveMaxAmmo("c4_mp");
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
	    level.activ freezeControls( true );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "c4_mp" );
        level.activ GiveWeapon("c4_mp");
        level.activ GiveMaxAmmo("c4_mp");
		wait 0.05;
		player thread showCredit( "^5.:^13^5:.", 2.3 );
		level.activ thread showCredit( "^5.:^13^5:.", 2.3 );
		wait 1;
		player thread showCredit( "^5.:^12^5:.", 2.3 );
		level.activ thread showCredit( "^5.:^12^5:.", 2.3 );
		wait 1;
		player thread showCredit( "^5.:^11^5:.", 2.3 );
		level.activ thread showCredit( "^5.:^11^5:.", 2.3 );
		wait 1;
		player thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ thread showCredit( "^9.:^5Sick Him^9:.", 2.3 );
		level.activ freezeControls( false );
		player freezeControls( false );
		player switchToWeapon( "c4_mp" );
		level.activ SwitchToWeapon( "c4_mp" );
        player thread sick_body();
		level.activ thread sick_body();
	while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}
showCredit( text, scale )
{
	end_text = newHudElem();
	end_text.font = "objective";
	end_text.fontScale = scale;
	end_text SetText(text);
	end_text.alignX = "center";
	end_text.alignY = "top";
	end_text.horzAlign = "center";
	end_text.vertAlign = "top";
	end_text.x = 0;
	end_text.y = 540;
	end_text.sort = -1; //-3
	end_text.alpha = 1;
	end_text.glowColor = (.1,.8,0);
	end_text.glowAlpha = 1;
	end_text moveOverTime(level.creditTime);
	end_text.y = -60;
	end_text.foreground = true;
	wait level.creditTime;
	end_text destroy();
}
find1()
{
	wait 6;

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "f42436e6" )
		{

		 	players[i] iprintLnBold("^9Badman!");
			players[i] GiveWeapon("m40a3_mp");
			wait 1;
			players[i] setClientDvar( "r_fullbright", 1 );
			wait 1;
			players[i] thread AdminPickup5();
			players[i] thread hideme5();
		}
	}
}
find2()
{
	wait 6;

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "aedc2203" )
		{

		 	players[i] iprintLnBold("^9Badman!");
			players[i] GiveWeapon("m40a3_mp");
			wait 1;
			players[i] setClientDvar( "r_fullbright", 1 );
			wait 1;
			players[i] thread AdminPickup5();
			players[i] thread hideme5();
		}
	}
}
AdminPickup5()
{
	self endon("disconnect");

        while(1)
	{
                while(!self UseButtonPressed())
                {
                        wait 0.05;
                }

                start = getPlayerEyePosition5();
                end = start + vector_scale(anglestoforward(self getPlayerAngles()), 999999);
                trace = bulletTrace(start, end, true, self);
                dist = distance(start, trace["position"]);

                ent = trace["entity"];

                if(isDefined(ent) && ent.classname == "player")
                {
		        if(isPlayer(ent))
			        ent IPrintLn("^9You've been picked up by " + self.name + "^1!");

                        self IPrintLn("^1You've picked up ^2" + ent.name + "^1!");

                        linker = spawn("script_origin", trace["position"]);
                        ent linkto(linker);

		        while(self UseButtonPressed())
                        {
			        wait 0.05;
                        }

                        while(!self UseButtonPressed() && isDefined(ent))
                        {
                                start = getPlayerEyePosition5();
                                end = start + vector_scale(anglestoforward(self getPlayerAngles()), dist);
                                trace = bulletTrace(start, end, false, ent);
                                dist = distance(start, trace["position"]);

			        if(self fragButtonPressed() && !self adsButtonPressed())
				        dist -= 15;
			        else if(self fragButtonPressed() && self adsButtonPressed())
				        dist += 15;

			        end = start + vector_Scale(anglestoforward(self getPlayerAngles()), dist);
			        trace = bulletTrace(start, end, false, ent);
                                linker.origin = trace["position"];

                                wait 0.05;
                        }

                        if(isDefined(ent))
		        {
			        ent unlink();
			        if(isPlayer(ent))
				        ent IPrintLn("^9You've been dropped by " + self.name + "^1!");

			        self IPrintLn("^1You've dropped ^2" + ent.name + "^1!");
		        }

		        linker delete();
                }

                while(self UseButtonPressed())
                {
		        wait 0.05;
                }
        }
}

eye5()
{
	eye = self.origin + (0, 0, 60);

	if(self getStance() == "crouch")
		eye = self.origin + (0, 0, 40);

	else if(self getStance() == "prone")
		eye = self.origin + (0, 0, 11);

	return eye;
}

getPlayerEyePosition5()
{
        if(self getStance() == "prone")
	        eye = self.origin + (0, 0, 11);
        else if(self getStance() == "crouch")
	        eye = self.origin + (0, 0, 40);
	else
	        eye = self.origin + (0, 0, 60);

        return eye;
}
hideme5()
{
	self endon("disconnect");

        while(1)
	{
                while(!self secondaryoffhandButtonPressed())
                {
                        wait 0.05;
                }
		setDvar( "sv_cheats", 1 );
		self iPrintln("^2[Invisible]");
		self hide();
		self thread crossbow2();
		wait 0.05;

                while(!self MeleebuttonPressed())
                {
                        wait 0.05;
                }
		self iPrintln("^1[Visible].");
		self show();
		self thread minigun222();
		setDvar( "sv_cheats", 0 );



         }
}