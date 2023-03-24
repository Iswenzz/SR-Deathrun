#include maps\mp\_utility;
#include common_scripts\utility;
main()
{
	///External scripts///
	maps\mp\_load::main();

	///Team Setup///
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	///Set Dvars///
	VisionSetNaked( "mp_dr_sunset3");
	setdvar( "r_gamma", "1" );
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0","1");
	setdvar("r_glowbloomintensity1","1");
	setdvar("r_glowskybleedintensity0","1");
	setdvar("compassmaxrange","1800");
	setDvar("bg_fallDamageMinHeight", "9999");
	setDvar("bg_fallDamageMaxHeight", "99999");

	///Precache///
	PrecacheMenu("speedex_music_menu");
	preCacheItem("artillery_mp");
	PreCacheModel("com_laptop_generic_open");
	PreCacheModel("vehicle_mig29_desert");
	preCacheRumble("artillery_rumble");
	PreCacheModel("vehicle_blackhawk_sas");

	preCacheItem("rpg_mp");

	///PrecacheFX///
	///Ambient///
	level._fx["Ambient"]["Speedex_Portal_FX"] = loadfx ("speedex/speedex_portal_fx");
	///Water///
	level._fx["Water"]["Trap2_Mortar_Water_Impact"] = loadfx ("explosions/mortarExp_water");
	level._fx["Water"]["Splash"] = loadfx ("explosions/grenadeExp_water");
	///Air Strike///
	level.fx_airstrike_afterburner = loadfx ("fire/jet_afterburner");
	level.fx_airstrike_contrail = loadfx ("smoke/jet_contrail");
	level.airstrikefx = loadfx ("explosions/clusterbomb");



	///Course Trap Threads///
	//thread devtest();
	thread freeround_check();
	thread add_trap_to_triggers();
	thread player_water_splash();
	thread musicmenu();
	thread ambientfx();
	thread startdoor();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread secret_enter();
	thread secret_exit();
	thread secret_respawn();
	///End Room Threads///
	thread endroom_selection();
	thread knife_room();
	thread sniper_room();
	thread rpg_room();
	thread rpg_ammo();
	thread pistol_room();
	thread endroom_respawn();
	thread bounce_room();
	thread bounce_respawn();
	thread bounce_weapon();
	//Variables
	level.trapturretused = 0;
}

freeround_check()
{
	level waittill("traps_disabled");
	level.trap1_laptop SetModel("com_laptop_generic_open");
	level.trap2_laptop SetModel("com_laptop_generic_open");
	level.trap3_laptop SetModel("com_laptop_generic_open");
	level.trap4_laptop SetModel("com_laptop_generic_open");
	level.trap5_laptop SetModel("com_laptop_generic_open");
	level.trap6_laptop SetModel("com_laptop_generic_open");
	level.trap7_laptop SetModel("com_laptop_generic_open");
	level.trap8_laptop SetModel("com_laptop_generic_open");
	level.trap9_laptop SetModel("com_laptop_generic_open");
	level.trap10_laptop SetModel("com_laptop_generic_open");
	level.trap12_laptop SetModel("com_laptop_generic_open");
}

musicmenu()
{
	level.music_trigger = getent( "music_trig","targetname" );
	level.music_laptop = getent( "music_laptop","targetname" );
	level.haschosenmusic = false;
	level.music_trigger setHintString( "^3 Press [USE] to open the Music Menu!" );
	level.music_trigger waittill( "trigger", player );
	wait 0.1;

	player openMenu( "speedex_music_menu" );
	player thread music_function();
}

music_function()
{
	self endon( "disconnect" );
	self endon( "death" );

	for(;;)
	{
	   self waittill( "menuresponse", menu, response );

	   if(menu == "speedex_music_menu")
	   {
		    if(response == "song1")
		    {
		    	AmbientStop();
		    	wait 0.5;
		    	ambientPlay("song1");
		    	level.music_trigger delete();
		    	level.haschosenmusic = true;
		    	level.music_laptop SetModel("com_laptop_generic_open");
		    	iprintln( " ^3Tatanka - Don't Give Up" );
		    }
		    if(response == "song2")
		    {
		    	AmbientStop();
		    	wait 0.5;
		    	ambientPlay("song2");
		    	level.music_trigger delete();
		    	level.haschosenmusic = true;
		    	level.music_laptop SetModel("com_laptop_generic_open");
		    	iprintln( " ^2Ellie Goulding - Love Me Like You Do (ATB Remix)" );
		    }
		    if(response == "song3")
		    {
		    	AmbientStop();
		    	wait 0.5;
		    	ambientPlay("song3");
		    	level.music_trigger delete();
		    	level.haschosenmusic = true;
		    	level.music_laptop SetModel("com_laptop_generic_open");
		    	iprintln( " ^3Galantis - Runaway (U & I)" );
		    }
		    if(response == "song4")
		    {
		    	AmbientStop();
		    	wait 0.5;
		    	ambientPlay("song4");
		    	level.music_trigger delete();
		    	level.haschosenmusic = true;
		    	level.music_laptop SetModel("com_laptop_generic_open");
		    	iprintln( " ^2DJ Tiesto - Silence" );
		    }
		    if(response == "song5")
		    {
		    	AmbientStop();
		    	wait 0.5;
		    	ambientPlay("song5");
		    	level.music_trigger delete();
		    	level.haschosenmusic = true;
		    	level.music_laptop SetModel("com_laptop_generic_open");
		    	iprintln( " ^3Myst - Fire and Ice" );
		    }
	   }
	}

	level waittill("round_ended");
	AmbientStop();
}

music_random()
{
	switch(randomint(4))
	{
		case 0:
			ambientPlay("song1");
			wait 2;
			iprintln( " ^3Tatanka - Don't Give Up" );
			break;
		case 1:
			ambientPlay("song2");
			wait 2;
			iprintln( " ^2Ellie Goulding - Love Me Like You Do (ATB Remix)" );
			break;
		case 2:
			ambientPlay("song3");
			wait 2;
			iprintln( " ^3Galantis - Runaway (U & I)" );
			break;
		case 3:
			ambientPlay("song4");
			wait 2;
			iprintln( " ^2DJ Tiesto - Silence" );
			break;
		case 4:
			ambientPlay("song5");
			wait 2;
			iprintln( " ^3Myst - Fire and Ice" );
			break;
	}


}

ambientfx()
{
	secret_portal_fx = getent("speedex_portal_fx1", "targetname");
	course_end_portal_fx = getent("speedex_portal_fx2", "targetname");

	playLoopedFX(level._fx["Ambient"]["Speedex_Portal_FX"],2.4,secret_portal_fx.origin + (0,0,0),0,anglesToForward(secret_portal_fx.angles));
	playLoopedFX(level._fx["Ambient"]["Speedex_Portal_FX"],2.4,course_end_portal_fx.origin + (0,0,0),0,anglesToForward(course_end_portal_fx.angles));
}

trap1()
{
	trap1_trigger = getent("trap1_trigger","targetname");
	level.trap1_laptop = getent("trap1_laptop","targetname");

	level.trap1_laptop SetModel("com_laptop_generic_open_obj");

	level.plane_start = getent("trap5_jet_node2","targetname");
	level.plane_end = getent("trap5_jet_node1","targetname");
	level.strikecoord = getent("strike_coord","targetname");
	level.trap5_airstrike_hurt = getent("trao5_airstrike_hurt","targetname");

	level.trap5_airstrike_hurt thread maps\mp\_utility::triggerOff();
	trap1_trigger SetHintString("^3Press [USE] to activate trap!");
	trap1_trigger waittill("trigger", who);

	trap1_trigger SetHintString("^1Trap activated!");
 	level.trap1_laptop SetModel("com_laptop_generic_open");

	braxi\_common::playSoundOnAllPlayers( "UK_1mc_enemyair" );
	wait 0.1;
	thread callStrike();
}

callStrike()
{
	// Get starting and ending point for the plane
	owner = level.activ;
	direction = level.plane_start.angles;
	planeBombExplodeDistance = 1500;
	planeFlyHeight = 850;
	planeFlySpeed = 7000;

	startpoint = level.plane_start;
	endPoint = level.plane_end;

	// Make the plane fly by
	flyTime = ( 14816 / planeFlySpeed );

	level thread doPlaneStrike(startPoint, endPoint, flyTime, direction);
	wait 1;
}

doPlaneStrike(startPoint, endPoint, flyTime, direction)
{
	if(isDefined(level.activ))
	{
		owner = level.activ;
	}
	else
	{
		owner = getentarray( "player", "classname" )[0];
	}


	// Spawn the planes
	plane = spawnplane(owner, "script_model", startpoint.origin );
	plane setModel( "vehicle_mig29_desert" );
	plane.angles = direction;
	wait 0.1;
	playfxontag( level.fx_airstrike_afterburner , plane, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner , plane, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, plane, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, plane, "tag_left_wingtip" );

	wait 0.1;

	plane moveTo( endPoint.origin, flyTime, 0, 0 );

	plane thread play_loop_sound_on_entity( "veh_mig29_close_loop" );

	wait flyTime / 2;

	plane thread play_sound_in_space( "veh_mig29_sonic_boom" );
	thread bomb_effect();

	// Delete the plane after its flyby
	wait flyTime / 2;
	plane notify( "delete" );
	plane delete();
}

bomb_effect()
{
	fx1 = getent("trap5_airstrike_fx1","targetname");
	fx2 = getent("trap5_airstrike_fx2","targetname");
	fx3 = getent("trap5_airstrike_fx3","targetname");

	fx1 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx3.origin);
	fx3 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx3 );
	earthquake( 0.7, 0.75, fx3.origin, 2000 );
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx1.origin);
	level.trap5_airstrike_hurt thread maps\mp\_utility::triggerOn();
	thread killplayers();
	fx1 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx1 );
	earthquake( 0.7, 0.75, fx1.origin, 2000 );
	wait 0.2;
	fx2 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx2.origin);
	fx2 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx2 );
	earthquake( 0.7, 0.75, fx2.origin, 2000 );
	wait 0.2;
	level.trap5_airstrike_hurt thread maps\mp\_utility::triggerOff();
}

killplayers()
{
	while(1)
	{
    	level.trap5_airstrike_hurt  waittill ("trigger",user);
		if (user istouching(level.trap5_airstrike_hurt) && isDefined(level.activ))
			{
				user FinishPlayerDamage( level.activ, level.activ, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
			}
			wait 0.05;
		if (user istouching(level.trap5_airstrike_hurt) && !isDefined(level.activ))
		{
			user FinishPlayerDamage( self, self, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
		}
	}
}

play_loop_sound_on_entity(alias, offset)
{
	org = spawn ("script_origin",(0,0,0));
	org endon ("death");
	thread delete_on_death (org);
	if (isdefined (offset))
	{
		org.origin = self.origin + offset;
		org.angles = self.angles;
		org linkto (self);
	}
	else
	{
		org.origin = self.origin;
		org.angles = self.angles;
		org linkto (self);
	}
//	org endon ("death");
	org playloopsound (alias);
//	println ("playing loop sound ", alias," on entity at origin ", self.origin, " at ORIGIN ", org.origin);
	self waittill ("stop sound" + alias);
	org stoploopsound (alias);
	org delete();
}


delete_on_death (ent)
{
	ent endon ("death");
	self waittill ("death");
	if (isdefined (ent))
		ent delete();
}

flat_origin(org)
{
	rorg = (org[0],org[1],0);
	return rorg;

}


flat_angle(angle)
{
	rangle = (0,angle[1],0);
	return rangle;
}


targetisclose(other, target)
{
	infront = targetisinfront(other, target);
	if(infront)
		dir = 1;
	else
		dir = -1;
	a = flat_origin(other.origin);
	b = a+vector_scale(anglestoforward(flat_angle(other.angles)), (dir*100000));
	point = pointOnSegmentNearestToPoint(a,b, target);
	dist = distance(a,point);
	if (dist < 3000)
		return true;
	else
		return false;
}


targetisinfront(other, target)
{
	forwardvec = anglestoforward(flat_angle(other.angles));
	normalvec = vectorNormalize(flat_origin(target)-other.origin);
	dot = vectordot(forwardvec,normalvec);
	if(dot > 0)
		return true;
	else
		return false;
}

callStrike_planeSound( plane, bombsite )
{
	plane thread play_loop_sound_on_entity( "veh_mig29_dist_loop" );
	while( !targetisclose( plane, bombsite ) )
		wait .05;
	plane notify ( "stop sound" + "veh_mig29_dist_loop" );
	plane thread play_loop_sound_on_entity( "veh_mig29_close_loop" );
	while( targetisinfront( plane, bombsite ) )
		wait .05;
	wait .5;
	plane thread play_sound_in_space( "veh_mig29_sonic_boom" );
	while( targetisclose( plane, bombsite ) )
		wait .05;
	plane notify ( "stop sound" + "veh_mig29_close_loop" );
	plane thread play_loop_sound_on_entity( "veh_mig29_dist_loop" );
	plane waittill( "delete" );
	plane notify ( "stop sound" + "veh_mig29_dist_loop" );
}

playSoundinSpace (alias, origin, master)
{
	org = spawn ("script_origin",(0,0,1));
	if (!isdefined (origin))
		origin = self.origin;
	org.origin = origin;
	if (isdefined(master) && master)
		org playsoundasmaster (alias);
	else
		org playsound (alias);
	wait ( 10.0 );
	org delete();
}
///End artillery trap

trap2()
{
	trap2_trigger = getent("trap2_trigger","targetname");
	level.trap2_laptop = getent("trap2_laptop","targetname");

	trap2_steps1 = getent("trap2_steps1","targetname");
	trap2_steps2 = getent("trap2_steps2","targetname");


	trap2_trigger SetHintString("^3Press [USE] to activate trap!");
	trap2_trigger waittill("trigger", player);

 	trap2_trigger SetHintString("^1Trap activated!");
 	level.trap2_laptop SetModel("com_laptop_generic_open");

 	switch(randomint(2))
	{
		case 0:
			trap2_steps1 MoveZ(-1000, 1, 0.2, 0.0);
			trap2_steps1 waittill("movedone");
			break;
		case 1:
			trap2_steps2 MoveZ(-1000, 1, 0.2, 0.0);
			trap2_steps2 waittill("movedone");
			break;
	}
}

trap3()
{
	trap3_trigger = getent("trap3_trigger","targetname");
	level.trap3_laptop = getent("trap3_laptop","targetname");

	trap3_steps1 = getent("trap3_steps1","targetname");
	trap3_steps2 = getent("trap3_steps2","targetname");


	trap3_trigger SetHintString("^3Press [USE] to activate trap!");
	trap3_trigger waittill("trigger", player);

 	trap3_trigger SetHintString("^1Trap activated!");
 	level.trap3_laptop SetModel("com_laptop_generic_open");

 	switch(randomint(2))
	{
		case 0:
			trap3_steps1 Hide();
			trap3_steps1 NotSolid();
			break;
		case 1:
			trap3_steps2 Hide();
			trap3_steps2 NotSolid();
			break;
	}
}

trap4()
{
	trap4_trigger = getent("trap4_trigger","targetname");
	level.trap4_laptop = getent("trap4_laptop","targetname");

	level.trap4_laptop SetModel("com_laptop_generic_open_obj");

	level.plane_start2 = getent("trap4_jet_node2","targetname");
	level.plane_end2 = getent("trap4_jet_node1","targetname");
	level.strikecoord2 = getent("strike_coord2","targetname");
	level.trap4_airstrike_hurt = getent("trao4_airstrike_hurt","targetname");

	level.trap4_airstrike_hurt thread maps\mp\_utility::triggerOff();
	trap4_trigger SetHintString("^3Press [USE] to activate trap!");
	trap4_trigger waittill("trigger", who);

	trap4_trigger SetHintString("^1Trap activated!");
 	level.trap4_laptop SetModel("com_laptop_generic_open");

	braxi\_common::playSoundOnAllPlayers( "UK_1mc_enemyair" );
	wait 0.1;
	thread callStrike2();
}

callStrike2()
{
	// Get starting and ending point for the plane
	owner = level.activ;
	direction = level.plane_start.angles;
	planeBombExplodeDistance = 1500;
	planeFlyHeight = 850;
	planeFlySpeed = 7000;

	startpoint = level.plane_start2;
	endPoint = level.plane_end2;

	// Make the plane fly by
	flyTime = ( 14816 / planeFlySpeed );

	level thread doPlaneStrike2(startPoint, endPoint, flyTime, direction);
	wait 1;
}

doPlaneStrike2(startPoint, endPoint, flyTime, direction)
{
	if(isDefined(level.activ))
	{
		owner = level.activ;
	}
	else
	{
		owner = getentarray( "player", "classname" )[0];
	}


	// Spawn the planes
	plane2 = spawnplane(owner, "script_model", startpoint.origin );
	plane2 setModel( "vehicle_mig29_desert" );
	plane2.angles = direction;
	wait 0.1;
	playfxontag( level.fx_airstrike_afterburner , plane2, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner , plane2, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, plane2, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, plane2, "tag_left_wingtip" );

	wait 0.1;

	plane2 moveTo( endPoint.origin, flyTime, 0, 0 );

	plane2 thread play_loop_sound_on_entity( "veh_mig29_close_loop" );

	wait flyTime / 2;

	plane2 thread play_sound_in_space( "veh_mig29_sonic_boom" );
	thread bomb_effect2();

	// Delete the plane after its flyby
	wait flyTime / 2;
	plane2 notify( "delete" );
	plane2 delete();
}

bomb_effect2()
{
	fx1 = getent("trap4_airstrike_fx1","targetname");
	fx2 = getent("trap4_airstrike_fx2","targetname");
	fx3 = getent("trap4_airstrike_fx3","targetname");

	fx1 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx3.origin);
	fx3 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx3 );
	earthquake( 0.7, 0.75, fx3.origin, 2000 );
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx1.origin);
	level.trap4_airstrike_hurt thread maps\mp\_utility::triggerOn();
	thread killplayers2();
	fx1 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx1 );
	earthquake( 0.7, 0.75, fx1.origin, 2000 );
	wait 0.2;
	fx2 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], fx2.origin);
	fx2 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx2 );
	earthquake( 0.7, 0.75, fx2.origin, 2000 );
	wait 0.2;
	level.trap4_airstrike_hurt thread maps\mp\_utility::triggerOff();
}

killplayers2()
{
	while(1)
	{
    	level.trap4_airstrike_hurt  waittill ("trigger",user);
		if (user istouching(level.trap4_airstrike_hurt) && isDefined(level.activ))
			{
				user FinishPlayerDamage( level.activ, level.activ, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
			}
			wait 0.05;
		if (user istouching(level.trap4_airstrike_hurt) && !isDefined(level.activ))
		{
			user FinishPlayerDamage( self, self, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
		}
	}
}

trap5()
{
	trap5_trigger = getent("trap5_trigger","targetname");
	level.trap5_laptop = getent("trap5_laptop","targetname");
	level.trap5_fx1 = getent("trap5_fx1_orig","targetname");
	level.trap5_fx2 = getent("trap5_fx2_orig","targetname");
	trap5_hurt = getent("trap5_hurt","targetname");

	trap5_hurt thread maps\mp\_utility::triggerOff();

	level.trap5_fx2 hide();

	trap5_trigger SetHintString("^3Press [USE] to activate trap!");
	trap5_trigger waittill("trigger");

	trap5_trigger SetHintString("^1Trap activated!");
	level.trap5_laptop SetModel("com_laptop_generic_open");

	trap5_hurt thread maps\mp\_utility::triggerOn();

	trap5_hurt enableLinkTo();
	trap5_hurt linkto(level.trap5_fx1);

	thread trap5_fx();

	level.trap5_fx1 playLoopSound("fire_sound");

}

trap5_fx()
{
	level.trap5_fx1_ent = spawn( "script_model", level.trap5_fx1.origin );
	level.trap5_fx1_ent setModel( "tag_origin" );
	level.trap5_fx1_ent linkto( level.trap5_fx1);
	level.trap5_fx2_ent = spawn( "script_model", level.trap5_fx2.origin );
	level.trap5_fx2_ent setModel( "tag_origin" );
	level.trap5_fx2_ent linkto( level.trap5_fx2);

	level.trap5_fx2 rotateYaw(180,0.1);

	wait 0.5;

	level.trap5_fx1 thread trap_rotate();
	level.trap5_fx2 thread trap_rotate();

	playfxontag (level.fx_airstrike_afterburner, level.trap5_fx1_ent, "tag_origin");
	playfxontag (level.fx_airstrike_afterburner, level.trap5_fx2_ent, "tag_origin");
	wait 4;
}

trap6()
{
	trap6_trigger = getent("trap6_trigger","targetname");
	level.trap6_laptop = getent("trap6_laptop","targetname");
	level.trap6_fx1 = getent("trap6_fx1_orig","targetname");
	level.trap6_fx2 = getent("trap6_fx2_orig","targetname");
	trap6_hurt = getent("trap6_hurt","targetname");

	trap6_hurt thread maps\mp\_utility::triggerOff();

	level.trap6_fx2 hide();

	trap6_trigger SetHintString("^3Press [USE] to activate trap!");
	trap6_trigger waittill("trigger");

	trap6_trigger SetHintString("^1Trap activated!");
	level.trap6_laptop SetModel("com_laptop_generic_open");

	trap6_hurt thread maps\mp\_utility::triggerOn();

	trap6_hurt enableLinkTo();
	trap6_hurt linkto(level.trap6_fx1);

	thread trap6_fx();

	level.trap6_fx1 playLoopSound("fire_sound");

}

trap6_fx()
{
	level.trap6_fx1_ent = spawn( "script_model", level.trap6_fx1.origin );
	level.trap6_fx1_ent setModel( "tag_origin" );
	level.trap6_fx1_ent linkto( level.trap6_fx1);
	level.trap6_fx2_ent = spawn( "script_model", level.trap6_fx2.origin );
	level.trap6_fx2_ent setModel( "tag_origin" );
	level.trap6_fx2_ent linkto( level.trap6_fx2);

	level.trap6_fx2 rotateYaw(180,0.1);

	wait 0.5;

	level.trap6_fx1 thread trap_rotate();
	level.trap6_fx2 thread trap_rotate();

	playfxontag (level.fx_airstrike_afterburner, level.trap6_fx1_ent, "tag_origin");
	playfxontag (level.fx_airstrike_afterburner, level.trap6_fx2_ent, "tag_origin");
	wait 4;
}

trap7()
{
	trap7_trigger = getent("trap7_trigger","targetname");
	level.trap7_laptop = getent("trap7_laptop","targetname");
	level.trap7_fx1 = getent("trap7_fx1_orig","targetname");
	level.trap7_fx2 = getent("trap7_fx2_orig","targetname");
	trap7_hurt = getent("trap7_hurt","targetname");

	trap7_hurt thread maps\mp\_utility::triggerOff();

	level.trap7_fx2 hide();

	trap7_trigger SetHintString("^3Press [USE] to activate trap!");
	trap7_trigger waittill("trigger");

	trap7_trigger SetHintString("^1Trap activated!");
	level.trap7_laptop SetModel("com_laptop_generic_open");

	trap7_hurt thread maps\mp\_utility::triggerOn();

	trap7_hurt enableLinkTo();
	trap7_hurt linkto(level.trap7_fx1);

	thread trap7_fx();

	level.trap7_fx1 playLoopSound("fire_sound");

}

trap7_fx()
{
	level.trap7_fx1_ent = spawn( "script_model", level.trap7_fx1.origin );
	level.trap7_fx1_ent setModel( "tag_origin" );
	level.trap7_fx1_ent linkto( level.trap7_fx1);
	level.trap7_fx2_ent = spawn( "script_model", level.trap7_fx2.origin );
	level.trap7_fx2_ent setModel( "tag_origin" );
	level.trap7_fx2_ent linkto( level.trap7_fx2);

	level.trap7_fx2 rotateYaw(180,0.1);

	wait 0.5;

	level.trap7_fx1 thread trap_rotate();
	level.trap7_fx2 thread trap_rotate();

	playfxontag (level.fx_airstrike_afterburner, level.trap7_fx1_ent, "tag_origin");
	playfxontag (level.fx_airstrike_afterburner, level.trap7_fx2_ent, "tag_origin");
	wait 4;
}

trap8()
{
	trap8_trigger = getent("trap8_trigger","targetname");
	level.trap8_laptop = getent("trap8_laptop","targetname");

	level.trap8_heli_spawn = 	getent("trap8_heli_spawn","targetname");
	level.trap8_heli_hover =	getent("trap8_heli_hover","targetname");
	level.trap8_heli_begin = 	getent("trap8_heli_begin","targetname");
	level.trap8_heli_low = 		getent("trap8_heli_low","targetname");
	level.trap8_heli_after = 	getent("trap8_heli_after","targetname");
	level.trap8_heli_between = 	getent("trap8_heli_between","targetname");

	level.trap8_heli_hurt = 	getent("trap8_heli_hurt","targetname");

	level waittill("round_started");
	thread helicopter_spawn();
	wait 1;

	level.trap8_heli_hurt EnableLinkTo();
	level.trap8_heli_hurt LinkTo(level.chopper);
	wait 1;
	level.chopper thread helicopter_movement();
	wait 1;

	trap8_trigger SetHintString("^3Press [USE] to activate trap!");
	trap8_trigger waittill("trigger", player);

 	trap8_trigger SetHintString("^1Trap activated!");
 	level.trap8_laptop SetModel("com_laptop_generic_open");

 	level.chopper notify("trap8_acti");
}

helicopter_spawn()
{
	if(isDefined(level.activ))
	{
		heliowner = level.activ;
	}
	else
	{
		heliowner = getentarray( "player", "classname" )[0];
	}

	level.chopper = spawnHelicopter( heliowner, level.trap8_heli_spawn.origin, level.trap8_heli_spawn.angles, "cobra_mp", "vehicle_blackhawk_sas" );
	level.chopper playLoopSound( "heli" );
	level.chopper helicopter_set_defaults();
	wait 1;
}

helicopter_set_defaults()
{
	self clearTargetYaw();
	self clearGoalYaw();
	self setspeed( 40, 25 );
	self setyawspeed( 75, 45, 45 );
	self setmaxpitchroll( 30, 30 );
	self setneargoalnotifydist( 32 );
	self setturningability(1.0);
	self.maxhealth = 1500;
	self.health = self.maxhealth;
	self setDamageStage( 3 );
}

helicopter_movement()
{
	level.chopper SetVehGoalPos(level.trap8_heli_hover.origin, true);
	level.chopper waittill("goal");
	level.chopper waittill("trap8_acti");
	level.chopper SetVehGoalPos(level.trap8_heli_begin.origin, true);
	level.chopper SetLookAtEnt(level.trap8_heli_low);
	level.chopper waittill("goal");
	level.chopper SetVehGoalPos(level.trap8_heli_low.origin, false);
	level.chopper waittill("goal");
	level.chopper SetVehGoalPos(level.trap8_heli_after.origin, true);
	level.chopper waittill("goal");
	level.chopper SetVehGoalPos(level.trap8_heli_between.origin, true);
	level.chopper waittill("goal");
	level.chopper SetVehGoalPos(level.trap8_heli_hover.origin, true);
	level.chopper SetLookAtEnt(level.trap8_heli_low);
	level.chopper waittill("goal");
	wait 2;
}

trap9()
{
	trap9_trigger = getent("trap9_trigger","targetname");
	level.trap9_laptop = getent("trap9_laptop","targetname");

	trap9 = getent("trap9","targetname");
	trap9_fx = getent("trap9_water_fx","targetname");


	trap9_trigger SetHintString("^3Press [USE] to activate trap!");
	trap9_trigger waittill("trigger", player);

 	trap9_trigger SetHintString("^1Trap activated!");
 	level.trap9_laptop SetModel("com_laptop_generic_open");

	trap9 MoveZ(-1000, 1, 0.3, 0.0);
	trap9 PlaySound ("stone_move");
	wait 0.6;
	PlayFX(level._fx["Water"]["Trap2_Mortar_Water_Impact"], trap9_fx.origin);
	trap9_fx PlaySound ("mortar_impact_water");
	wait 2;
}

trap_rotate()
{
	while(1)
	{
	self rotateYaw(360,2.8);
	wait 1.8;
	}
}

trap10()
{
	trap10_trigger = getent("trap10_trigger","targetname");
	level.trap10_laptop = getent("trap10_laptop","targetname");

	trap10_steps1 = getent("trap10_steps1","targetname");
	trap10_steps2 = getent("trap10_steps2","targetname");


	trap10_trigger SetHintString("^3Press [USE] to activate trap!");
	trap10_trigger waittill("trigger", player);

 	trap10_trigger SetHintString("^1Trap activated!");
 	level.trap10_laptop SetModel("com_laptop_generic_open");

 	switch(randomint(2))
	{
		case 0:
			trap10_steps1 MoveZ(-1000, 1, 0.2, 0.0);
			trap10_steps1 waittill("movedone");
			break;
		case 1:
			trap10_steps2 MoveZ(-1000, 1, 0.2, 0.0);
			trap10_steps2 waittill("movedone");
			break;
	}
}

trap11()
{
	trap11_trigger = getent("trap11_trigger","targetname");
	trapturret = getent("trap11_turret","targetname");
	trap11_clip = getent("trap11_clip","targetname");
	trap11_trigger SetHintString("^3Press [USE] to activate trap!");
	trap11_trigger waittill("trigger", player);
	trap11_trigger SetHintString("^1Trap activated!");

	if(level.trapsDisabled)
	{
		trap11_trigger SetHintString("^1The turret seems to be broken!");
		return;
	}

	if(level.trapturretused == 0)
	{
		trap11_clip NotSolid();
		trapturret UseBy(player);
		level.trapturretused = 1;
		player iPrintlnBold( "^2You have 10 seconds before the MG will only shoot blanks!!" );
		wait 1;
	}
	wait 9;
	trap11_clip Solid();
	wait 1;
}

trap12()
{
	trap12_trigger = getent("trap12_trigger","targetname");
	level.trap12_laptop = getent("trap12_laptop","targetname");

	level.trap12_laptop SetModel("com_laptop_generic_open_obj");

	level.plane_start3 = getent("trap12_jet_node2","targetname");
	level.plane_end3 = getent("trap12_jet_node1","targetname");
	level.strikecoord3 = getent("strike_coord3","targetname");
	level.trap12_airstrike_hurt = getent("trao11_airstrike_hurt","targetname");

	level.trap12_airstrike_hurt thread maps\mp\_utility::triggerOff();
	trap12_trigger SetHintString("^3Press [USE] to activate trap!");
	trap12_trigger waittill("trigger", who);

	trap12_trigger SetHintString("^1Trap activated!");
 	level.trap12_laptop SetModel("com_laptop_generic_open");

	braxi\_common::playSoundOnAllPlayers( "UK_1mc_enemyair" );
	wait 0.1;
	thread callStrike3();
}

callStrike3()
{
	// Get starting and ending point for the plane
	owner = level.activ;
	direction = level.plane_end.angles;
	planeBombExplodeDistance = 1500;
	planeFlyHeight = 850;
	planeFlySpeed = 7000;

	startpoint = level.plane_start3;
	endPoint = level.plane_end3;

	// Make the plane fly by
	flyTime = ( 14816 / planeFlySpeed );

	level thread doPlaneStrike3(startPoint, endPoint, flyTime, direction);
	wait 1;
}

doPlaneStrike3(startPoint, endPoint, flyTime, direction)
{
	if(isDefined(level.activ))
	{
		owner = level.activ;
	}
	else
	{
		owner = getentarray( "player", "classname" )[0];
	}


	// Spawn the planes
	plane3 = spawnplane(owner, "script_model", startpoint.origin );
	plane3 setModel( "vehicle_mig29_desert" );
	plane3.angles = direction;
	wait 0.1;
	playfxontag( level.fx_airstrike_afterburner , plane3, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner , plane3, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, plane3, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, plane3, "tag_left_wingtip" );

	wait 0.1;

	plane3 moveTo( endPoint.origin, flyTime, 0, 0 );

	plane3 thread play_loop_sound_on_entity( "veh_mig29_close_loop" );

	wait flyTime / 2;

	plane3 thread play_sound_in_space( "veh_mig29_sonic_boom" );
	thread bomb_effect3();

	// Delete the plane after its flyby
	wait flyTime / 2;
	plane3 notify( "delete" );
	plane3 delete();
}

bomb_effect3()
{
	fx1 = getent("trap12_airstrike_fx1","targetname");
	fx2 = getent("trap12_airstrike_fx2","targetname");
	fx3 = getent("trap12_airstrike_fx3","targetname");

	fx1 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level.airstrikefx, fx3.origin);
	fx3 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx3 );
	earthquake( 0.7, 0.75, fx3.origin, 2000 );
	wait 0.2;
	PlayFX(level.airstrikefx, fx1.origin);
	level.trap12_airstrike_hurt thread maps\mp\_utility::triggerOn();
	thread killplayers2();
	fx1 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx1 );
	earthquake( 0.7, 0.75, fx1.origin, 2000 );
	wait 0.2;
	fx2 PlaySound("artillery_incoming");
	wait 0.2;
	PlayFX(level.airstrikefx, fx2.origin);
	fx2 PlaySound("mortar_impact_water");
	playRumbleOnPosition( "artillery_rumble", fx2 );
	earthquake( 0.7, 0.75, fx2.origin, 2000 );
	wait 0.2;
	level.trap12_airstrike_hurt thread maps\mp\_utility::triggerOff();
}

killplayers3()
{
	while(1)
	{
    	level.trap12_airstrike_hurt  waittill ("trigger",user);
		if (user istouching(level.trap12_airstrike_hurt) && isDefined(level.activ))
			{
				user FinishPlayerDamage( level.activ, level.activ, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
			}
			wait 0.05;
		if (user istouching(level.trap12_airstrike_hurt) && !isDefined(level.activ))
		{
			user FinishPlayerDamage( self, self, 1000, 0, "MOD_PROJECTILE_SPLASH", "artillery_mp", self.origin, self.origin, "none", 0 );
		}
	}
}

player_water_splash()
{
	player_watersplash_trig = getent("water_splash", "targetname");

	while(true)
	{
		player_watersplash_trig waittill ("trigger", player);
		player PlaySound ("player_water_splash_sound");
		PlayFX( level._fx["Water"]["Splash"], player.origin );
		wait 1;
	}
}

add_trap_to_triggers()
{
	addTriggerToList("trap1_trigger");
	addTriggerToList("trap2_trigger");
	addTriggerToList("trap3_trigger");
	addTriggerToList("trap4_trigger");
	addTriggerToList("trap5_trigger");
	addTriggerToList("trap6_trigger");
	addTriggerToList("trap7_trigger");
	addTriggerToList("trap8_trigger");
	addTriggerToList("trap9_trigger");
	addTriggerToList("trap10_trigger");
	addTriggerToList("trap12_trigger");
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
 	level.trapTriggers = [];

	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

secret_enter()
{
	secret_enter_trig = getent("secret_enter_trig", "targetname");
	secret_enter_orig = getent("secret_enter_orig", "targetname");

	while(true)
	{
		secret_enter_trig waittill ("trigger", player);
		player.checkpoint = 0;
		player SetPlayerAngles(secret_enter_orig.angles);
		player SetOrigin(secret_enter_orig.origin);
		wait 0.2;
	}
}

secret_exit()
{
	secret_exit_trig = getent("secret_exit", "targetname");
	secret_exit_orig = getent("secret_exit_orig", "targetname");

	while(true)
	{
		secret_exit_trig waittill ("trigger", player);
		player.checkpoint = 0;
		player SetPlayerAngles(secret_exit_orig.angles);
		player SetOrigin(secret_exit_orig.origin + (-100,0,0));
		wait 0.2;
	}
}

secret_respawn()
{
	secret_respawn_trig = getent("secret_reset", "targetname");

	secret_checkpoint1 = getent("secret_checkpoint1", "targetname");
	secret_checkpoint1_orig = getent("secret_checkpoint1_orig", "targetname");

	secret_checkpoint2 = getent("secret_checkpoint2", "targetname");
	secret_checkpoint2_orig = getent("secret_checkpoint2_orig", "targetname");

	secret_checkpoint3 = getent("secret_checkpoint3", "targetname");
	secret_checkpoint3_orig = getent("secret_checkpoint3_orig", "targetname");

	secret_enter_trig = getent("secret_enter_trig", "targetname");
	secret_enter_orig = getent("secret_enter_orig", "targetname");

	secret_checkpoint1 thread checkpoint1_check();
	secret_checkpoint2 thread checkpoint2_check();
	secret_checkpoint3 thread checkpoint3_check();

	while(true)
	{
		secret_respawn_trig waittill ("trigger", player);
		if(player.checkpoint == 0)
		{
			player SetPlayerAngles(secret_enter_orig.angles);
			player SetOrigin(secret_enter_orig.origin);
			wait 0.2;
		}
		if(player.checkpoint == 1)
		{
			player SetPlayerAngles(secret_checkpoint1_orig.angles);
			player SetOrigin(secret_checkpoint1_orig.origin);
			wait 0.2;
		}
		if(player.checkpoint == 2)
		{
			player SetPlayerAngles(secret_checkpoint2_orig.angles);
			player SetOrigin(secret_checkpoint2_orig.origin);
			wait 0.2;
		}
		if(player.checkpoint == 3)
		{
			player SetPlayerAngles(secret_checkpoint3_orig.angles);
			player SetOrigin(secret_checkpoint3_orig.origin);
			wait 0.2;
		}
	}
}

checkpoint1_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 1;
		wait 0.2;
	}
}

checkpoint2_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 2;
		wait 0.2;
	}
}

checkpoint3_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 3;
		wait 0.2;
	}
}

startdoor()
{
	start_door = getent("startdoor","targetname");
	start_door_trig = getent("startdoor_open","targetname");


	start_door_trig SetHintString("^3Press [USE] to open the startdoor!");
	start_door_trig waittill("trigger", player);

 	start_door_trig Delete();

 	wait 1;

 	noti = SpawnStruct();
	noti.titleText = "\n\n^1Map made by";
	noti.notifyText = "\n\n\n^3 Speedex";
	noti.glowcolor = (0,0.1,0.9);
	noti.duration = 4;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 2;
	if(level.haschosenmusic == false)
	{
		thread music_random();
	}

	start_door MoveZ(-600, 3, 1, 0);
	start_door waittill("movedone");
}

endroom_selection()
{
    endroom_trigger = getent("endroom_selection", "targetname");
    endroom_orig = getent("endroom_selection_orig", "targetname");

    endroom_trigger sethintstring("^3Enter the room selection");

    level waittill("round_started");

    while(1)
    {
    	if(game["roundsplayed"] == 1)
		{
   	 		endroom_trigger sethintstring("^1Room Selection not available on the first round!");
   	 		break;
		}

        endroom_trigger waittill("trigger",player);

        endroom_trigger sethintstring("^1Currently occupied, wait your turn!");

		noti = SpawnStruct();
		noti.titleText = "\n\n^2" + player.name;
		noti.notifyText = "\n\n\n^2  Has entered the room selection!";
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

        player setorigin(endroom_orig.origin);
        player setplayerangles(endroom_orig.angles);

        while(isAlive(player)&&isDefined(player))
            wait 1;

		noti = SpawnStruct();
		noti.titleText = "\n\n^2" + player.name + " has been killed!";
		noti.notifyText = "\n\n\n^2Room selection is now open again!";
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    }
}

knife_room()
{
	level.endroom_knife = getEnt("endroom_knife", "targetname");

	level.island_jumper = getEnt("island_jumper_orig", "targetname");
	level.island_acti = getEnt("island_acti_orig", "targetname");

	level.endroom_knife sethintstring("^2 Press [USE] to enter the knife room!");

	while(1)
	{
		level.endroom_knife waittill("trigger", player);

		player.endroom_sniper = 0;
		player.endroom_island = 1;
		level.activ.endroom_sniper = 0;
		level.activ.endroom_island = 1;

		noti = SpawnStruct();
		noti.titleText = "\n\n^5Knife ^5Room";
		noti.notifyText = "\n\n\n^1" + level.activ.name + " ^5VS^1 " + player.name;
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti ); //something

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		player takeAllWeapons();
		level.activ takeAllWeapons();

		player giveWeapon("knife_mp");
		player giveMaxAmmo("knife_mp");
		level.activ giveWeapon("knife_mp");
		level.activ giveMaxAmmo("knife_mp");

		player switchToWeapon("knife_mp");
		level.activ switchToWeapon("knife_mp");

		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin (level.island_jumper.origin);
		player setPlayerAngles (level.island_jumper.angles);

		level.activ setOrigin (level.island_acti.origin);
		level.activ setPlayerAngles (level.island_acti.angles);
		wait 2;

		player iPrintLnBold("^13");
		level.activ iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^21");
		level.activ iPrintLnBold("^21");
		wait 1;
		player iPrintLnBold("^5Go!");
		level.activ iPrintLnBold("^5Go!");

		player freezeControls(0);
		level.activ freezeControls(0);

		if( !isDefined( level.activ ) )
			return;

		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" && player != level.activ )
			wait 0.15;
	}
}

sniper_room()
{
	level.endroom_sniper = getEnt("endroom_sniper", "targetname");

	level.sniper_jumper_origin = getEnt("sniper_jumper_orig", "targetname");
	level.sniper_acti_origin = getEnt("sniper_acti_orig", "targetname");

	level.endroom_sniper sethintstring("^2 Press [USE] to enter the sniper room!");

	while(1)
	{
		level.endroom_sniper waittill("trigger", player);

		player.endroom_sniper = 1;
		player.endroom_island = 0;
		level.activ.endroom_sniper = 1;
		level.activ.endroom_island = 0;

		noti = SpawnStruct();
		noti.titleText = "\n\n^5Sniper ^5Room";
		noti.notifyText = "\n\n\n^1" + level.activ.name + " ^5VS^1 " + player.name;
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		player takeAllWeapons();
		level.activ takeAllWeapons();

		player giveWeapon("m40a3_mp");
		player giveWeapon("remington700_mp");
		player giveMaxAmmo("m40a3_mp");
		player giveMaxAmmo("remington700_mp");
		level.activ giveWeapon("m40a3_mp");
		level.activ giveWeapon("remington700_mp");
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ giveMaxAmmo("remington700_mp");

		player switchToWeapon("m40a3_mp");
		level.activ switchToWeapon("m40a3_mp");

		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin (level.sniper_jumper_origin.origin);
		player setPlayerAngles (level.sniper_jumper_origin.angles);

		level.activ setOrigin (level.sniper_acti_origin.origin);
		level.activ setPlayerAngles (level.sniper_acti_origin.angles);
		wait 2;

		player iPrintLnBold("^13");
		level.activ iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^21");
		level.activ iPrintLnBold("^21");
		wait 1;
		player iPrintLnBold("^5Go!");
		level.activ iPrintLnBold("^5Go!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player thread sniper_ammo();
		level.activ thread sniper_ammo();

		if( !isDefined( level.activ ) )
			return;

		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" && player != level.activ )
			wait 0.15;
	}
}

sniper_ammo()
{
	self endon("disconnect");
	self endon("death");
	self endon("round_ended");

	if (isDefined(self) && isAlive(self))
	{
		self giveMaxAmmo("m40a3_mp");
		self giveMaxAmmo("remington700_mp");
		wait 10;
		self thread sniper_ammo();
	}
}

rpg_room()
{

	level.endroom_rpg = getEnt("endroom_rpg", "targetname");

	level.endroom_rpg sethintstring("^2 Press [USE] to enter the RPG room!");

	while(1)
	{
		level.endroom_rpg waittill("trigger", player);

		player.endroom_sniper = 1;
		player.endroom_island = 0;
		level.activ.endroom_sniper = 1;
		level.activ.endroom_island = 0;

		noti = SpawnStruct();
		noti.titleText = "\n\n^5Rpg ^5Room";
	    noti.notifyText = "\n\n\n^1" + level.activ.name + " ^5VS^1 " + player.name;
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;


		player takeAllWeapons();
		level.activ takeAllWeapons();

		player giveWeapon("rpg_mp");
		player giveMaxAmmo("rpg_mp");
		level.activ giveWeapon("rpg_mp");
		level.activ giveMaxAmmo("rpg_mp");


		player switchToWeapon("rpg_mp");
		level.activ switchToWeapon("rpg_mp");


		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin (level.sniper_jumper_origin.origin);
		player setPlayerAngles (level.sniper_jumper_origin.angles);

		level.activ setOrigin (level.sniper_acti_origin.origin);
		level.activ setPlayerAngles (level.sniper_acti_origin.angles);
		wait 2;

		player iPrintLnBold("^13");
		level.activ iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^21");
		level.activ iPrintLnBold("^21");
		wait 1;
		player iPrintLnBold("^5Go!");
		level.activ iPrintLnBold("^5Go!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player thread rpg_ammo();
		level.activ thread rpg_ammo();

		if( !isDefined( level.activ ) )
			return;

		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" && player != level.activ )
			wait 0.15;
	}
}

rpg_ammo()
{
	self endon("disconnect");
	self endon("death");
	self endon("round_ended");

	if (isDefined(self) && isAlive(self))
	{
		self giveMaxAmmo("rpg_mp");
		wait 3;
		self thread rpg_ammo();
	}
}

pistol_room()
{
	level.endroom_pistol = getEnt("endroom_pistol", "targetname");

	level.endroom_pistol sethintstring("^2 Press [USE] to enter the pistol room!");

	while(1)
	{
		level.endroom_pistol waittill("trigger", player);

		player.endroom_sniper = 0;
		player.endroom_island = 1;
		level.activ.endroom_sniper = 0;
		level.activ.endroom_island = 1;

		noti = SpawnStruct();
		noti.titleText = "\n\n^5Pistol ^5Room";
		noti.notifyText = "\n\n\n^1" + level.activ.name + " ^5VS^1 " + player.name;
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		player takeAllWeapons();
		level.activ takeAllWeapons();

		player giveWeapon("deserteaglegold_mp");
		player giveMaxAmmo("deserteaglegold_mp");
		level.activ giveWeapon("deserteaglegold_mp");
		level.activ giveMaxAmmo("deserteaglegold_mp");

		player switchToWeapon("deserteaglegold_mp");
		level.activ switchToWeapon("deserteaglegold_mp");

		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin (level.island_jumper.origin);
		player setPlayerAngles (level.island_jumper.angles);

		level.activ setOrigin (level.island_acti.origin);
		level.activ setPlayerAngles (level.island_acti.angles);
		wait 2;

		player iPrintLnBold("^13");
		level.activ iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^21");
		level.activ iPrintLnBold("^21");
		wait 1;
		player iPrintLnBold("^5Go!");
		level.activ iPrintLnBold("^5Go!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player thread pistol_ammo();
		level.activ thread pistol_ammo();

		if( !isDefined( level.activ ) )
			return;

		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" && player != level.activ )
			wait 0.15;
	}
}

pistol_ammo()
{
	self endon("disconnect");
	self endon("death");
	self endon("round_ended");

	if (isDefined(self) && isAlive(self))
	{
		self giveMaxAmmo("deserteaglegold_mp");
		wait 10;
		self thread pistol_ammo();
	}
}

bounce_room()
{
	level.endroom_bounce = getEnt("endroom_bounce", "targetname");

	level.bounce_jump_origin = getEnt("bounce_jumper_orig", "targetname");
	level.bounce_acti_origin = getEnt("bounce_acti_orig", "targetname");

	level.endroom_bounce sethintstring("^2 Press [USE] to enter the bounce room!");

	while(1)
	{
		level.endroom_bounce waittill("trigger", player);

		player.endroom_sniper = 0;
		player.endroom_island = 0;
		level.activ.endroom_sniper = 0;
		level.activ.endroom_island = 0;

		noti = SpawnStruct();
		noti.titleText = "\n\n^5Bounce ^5Room";
		noti.notifyText = "\n\n\n^1" + level.activ.name + " ^5VS^1 " + player.name;
		noti.glowcolor = (0,0.1,0.9);
		noti.duration = 4;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti ); //something

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		player takeAllWeapons();
		level.activ takeAllWeapons();

		player giveWeapon("knife_mp");
		player giveMaxAmmo("knife_mp");
		level.activ giveWeapon("knife_mp");
		level.activ giveMaxAmmo("knife_mp");

		player switchToWeapon("knife_mp");
		level.activ switchToWeapon("knife_mp");

		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin (level.bounce_jump_origin.origin);
		player setPlayerAngles (level.bounce_jump_origin.angles);

		level.activ setOrigin (level.bounce_acti_origin.origin);
		level.activ setPlayerAngles (level.bounce_acti_origin.angles);

		wait 5;

		player iPrintLnBold("^5Use mantle when reaching the last platform!");
		level.activ iPrintLnBold("^5Use mantle when reaching the last platform!");

		wait 1;

		player iPrintLnBold("^13");
		level.activ iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^21");
		level.activ iPrintLnBold("^21");
		wait 1;
		player iPrintLnBold("^5Go!");
		level.activ iPrintLnBold("^5Go!");

		player freezeControls(0);
		level.activ freezeControls(0);

		if( !isDefined( level.activ ) )
			return;

		while( isDefined( player ) && isAlive( player ) && player.sessionstate == "playing" && player != level.activ )
			wait 0.15;
	}
}

bounce_respawn()
{
	trigger = getent ( "bounce_respawn_trig", "targetname" );

	for(;;)
	{
		trigger waittill ( "trigger", player );

		if( player.pers[ "team" ] != "spectator" )
		{
			if( player.pers[ "team" ] == "allies" )
			{
				player SetPlayerAngles ( level.bounce_jump_origin.angles );
				player SetOrigin ( level.bounce_jump_origin.origin );
			}
			if( player.pers[ "team" ] == "axis" )
			{
				player SetPlayerAngles ( level.bounce_acti_origin.angles );
				player SetOrigin ( level.bounce_acti_origin.origin );
			}
		}
		wait 1;
	}
}

bounce_weapon()
{
	trig = getent("bounce_wep","targetname");
	trig sethintstring("^2 Press [USE] to get some weapons!");

	while(1)
	{
		trig waittill("trigger", player);
		player takeallweapons();
		player giveWeapon("m40a3_mp");
		player giveWeapon("remington700_mp");
		player giveMaxAmmo("m40a3_mp");
		player giveMaxAmmo("remington700_mp");
		player switchToWeapon("m40a3_mp");
		wait 10;
	}
}

endroom_respawn()
{
	endroom_respawn_trig = getent("endrooms_respawn", "targetname");

	while(true)
	{
		endroom_respawn_trig waittill ("trigger", player);
		if(player.endroom_sniper == 1)
		{
			if( player.pers[ "team" ] != "spectator" )
			{
				if( player.pers[ "team" ] == "allies" )
				{
					player SetPlayerAngles ( level.sniper_jumper_origin.angles );
					player SetOrigin ( level.sniper_jumper_origin.origin );
				}
				if( player.pers[ "team" ] == "axis" )
				{
					player SetPlayerAngles ( level.sniper_acti_origin.angles );
					player SetOrigin ( level.sniper_acti_origin.origin );
				}
			}
			wait 1;
		}
		if(player.endroom_island == 1)
		{
			if( player.pers[ "team" ] != "spectator" )
			{
				if( player.pers[ "team" ] == "allies" )
				{
					player SetPlayerAngles ( level.island_jumper.angles );
					player SetOrigin ( level.island_jumper.origin );
				}
				if( player.pers[ "team" ] == "axis" )
				{
					player SetPlayerAngles ( level.island_acti.angles );
					player SetOrigin ( level.island_acti.origin );
				}
			}
			wait 1;
		}
	}
}

addTestClients()
{
	ent = [];
	testclients = 3;
	for(i = 0; i < testclients+1; i++)
	{
		ent[i] = addTestClient();
		wait .05;
		if( isDefined( ent[i] ) )
			ent[i] thread TestClient();
		wait 0.5;
	}
}

TestClient()
{
	while(!isdefined(self.pers["team"]))
		wait .05;

//	level waittill( "game started" );
	wait 0.05;
	self notify( "menuresponse", game["menu_team"], "axis" );
//	wait 0.5;
}

// devtest()
// {
// 	wait 5;
// 	if(game["roundsplayed"] == 1)
// 		thread addTestClients();

// 	devtest_trig = getent("startdoor_open","targetname");
// 	devtest_trig waittill ("trigger",player);

// 	if(game["roundsplayed"] == 1)
// 	{
//    	 	braxi\_mod::endRound( "Speedex ending round..", "jumpers" );
// 	}
// }