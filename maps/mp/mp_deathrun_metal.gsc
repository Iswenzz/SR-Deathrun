main()
{
	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setDvar( "compassmaxrange", "1024" );

	level.fire_fx = LoadFX("fire/firelp_barrel_pm");
	level.splash_fx = LoadFX("explosions/grenadeExp_water");
	level.nuke_flash_fx = LoadFx("explosions/nuke_flash");
	level.nuke_exp_fx = LoadFx("explosions/nuke_explosion");
	level.nuke_shock_fx = LoadFx("explosions/nuke_dirt_shockwave");
	level.nuke_smoke_fx = LoadFx("explosions/nuke_smoke_fill");
	level.flare_fx = LoadFx("misc/flare_gun");
	level.spark_fx = LoadFx("misc/helicopter_tail_sparks");
	level.tracer_fx = LoadFx("misc/tracer_incoming");

	precacheItem( "deserteaglegold_mp" );
	precacheItem( "m40a3_acog_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "winchester1200_mp" );
	precacheItem( "saw_grip_mp" );
	precacheItem( "mp44_mp" );
	precachemodel( "cs_monitor1" );
	PreCacheShellShock( "tankblast");

	thread main_door();
	thread onPlayerConnect();
	thread water1();
	thread water2();
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
	thread roller();
	thread final_door();
	thread teleport();
	thread teleport1();
	thread teleport3();
	thread teleport_down();
	thread addtrapstofreerun();
	thread enddoors1();
	thread enddoors2();
	thread enddoors3();
	thread AddTestClients();
	thread secret();
}

///////////////////////////////////////////////////////////////////////////


onPlayerConnect()
{
	while(1)
	{
		level waittill("connected", player);
		player thread onDeath();
	}
}

onDeath()
{
	self endon("disconnect");
	
	while(1)
	{
		self waittill("death");
		x = RandomInt(200);
		if( x < 10 )
		{
		self PlaySound ("death1");
		}
		if( x > 9 && x < 20  )
		{
		self PlaySound ("death2");
		}
		if( x > 19 && x < 30  )
		{
		self PlaySound ("death3");
		}
		if( x > 29 && x < 40  )
		{
		self PlaySound ("death4");
		}
		if( x > 39 && x < 50  )
		{
		self PlaySound ("death5");
		}
		if( x > 49 && x < 60  )
		{
		self PlaySound ("death6");
		}
		if( x > 59 && x < 70  )
		{
		self PlaySound ("death7");
		}	
		if( x > 69 && x < 80 )
		{
		self PlaySound ("death8");
		}
		if( x > 79 && x < 90 )
		{
		self PlaySound ("death9");
		}
		if( x > 89 && x < 100 )
		{
		self PlaySound ("death10");
		}	
		if( x > 99 && x < 110 )
		{
		self PlaySound ("death11");
		}	
		if( x > 109 && x < 120 )
		{
		self PlaySound ("death12");
		}	
		if( x > 119 && x < 130 )
		{
		self PlaySound ("death13");
		}	
		if( x > 129 && x < 140 )
		{
		self PlaySound ("death14");
		}	
		if( x > 139 && x < 150 )
		{
		self PlaySound ("death15");
		}	
		if( x > 149 && x < 160 )
		{
		self PlaySound ("death16");
		}	
		if( x > 159 && x < 170 )
		{
		self PlaySound ("death17");
		}	
		if( x > 169 && x < 180 )
		{
		self PlaySound ("death18");
		}	
		if( x > 179 && x < 190 )
		{
		self PlaySound ("death19");
		}	
		if( x > 189 )
		{
		self PlaySound ("death8");
		}	
	}
}

///////////////////////////////////////////////////////////////////////////


main_door()
{
	main_door  =getent( "main_door", "targetname" );
	sound      =getent( "main_door_sound", "targetname" );
	wait 7;
	sound playsound ("door_gate_chainlink_slow_open");
	main_door movez (-115,2.5);
	main_door waittill ("movedone");
}

water1()
{
	trig = getent("hurt_water1", "targetname");
	while(true)
	{
	trig waittill ("trigger", who);	
	x = RandomInt(30);
	if( x < 10 )
		{
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		PlayFX( level.splash_fx, who.origin );
		}
	if( x > 9 && x < 20  )
		{
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		PlayFX( level.splash_fx, who.origin );
		}
	if( x > 19 )
		{
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		PlayFX( level.splash_fx, who.origin );
		}
	}
}

water2()
{
	trig = getent("hurt_water2", "targetname");
	while(true)
	{
	trig waittill ("trigger", who);	
	x = RandomInt(30);
	if( x < 10 )
		{
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		who PlaySound ("splash1");
		PlayFX( level.splash_fx, who.origin );
		}
	if( x > 9 && x < 20  )
		{
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		who PlaySound ("splash2");
		PlayFX( level.splash_fx, who.origin );
		}
	if( x > 19 )
		{
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		who PlaySound ("splash3");
		PlayFX( level.splash_fx, who.origin );
		}
	}
}

//////////////////////////////////////////////////////////////////////////////////


trap1()
{
	trap1  = getent( "trap1", "targetname" ); 
	trap1_2 =getent ( "trap1_2", "targetname");
	trig   = getent( "trig_trap1", "targetname" );
	sound  = getent( "spinn_sound", "targetname" );
	trap1 movey ( -16,0.01);
	trap1_2 movey ( -32,0.01);
	trig waittill("trigger");
	trig delete();
	trap1_2 movex (240,0.01);
	sound playsound ("metal_door_kick_layer");
	trap1 movey ( 336, 0.5);
	trap1 waittill ("movedone");
	wait 3;
	sound playsound ("metal_door_kick_layer");
	trap1 movey ( -336, 0.5);
}


//////////////////////////////////////////////////////////////////////////////////


trap2()
{
	trap2 =getent("trap2","targetname");
	trig  =getent("trig_trap2","targetname");
	sound  = getent( "elevator_sound", "targetname" );

	while(1)
		{
		trig waittill("trigger");
		trig delete();
		sound playsound ("elevator_down");
		trap2 movez (-500,2,0.5,0.5);
		trap2 waittill ("movedone");
		wait(1);
		trap2 movez (500,2,0.5,0.5);
		trap2 waittill ("movedone");
		}
}


//////////////////////////////////////////////////////////////////////////////////


roller()
{
	roller_1 = getent( "roller_1", "targetname");
	roller_2 = getent( "roller_2", "targetname");
	sound1  =getent( "roller_stop1", "targetname");
	sound2  =getent( "roller_stop2", "targetname");
	sound3  =getent( "roller_move", "targetname");

	roller_2 movex ( -464, 1);
	roller_2 waittill ("movedone");
 
while(1)
	{
	wait 2.7;
	sound2 playsound ("roller_stop");
	sound1 playsound ("roller_stop");
	sound3 playsound ("roller_move");
	roller_1 movex ( -464, 4);
	roller_2 movex ( 464, 4);
	wait 2;
	sound3 playsound ("roller_move");
	wait 2;
	sound1 playsound ("roller_stop");
	sound2 playsound ("roller_stop");
	wait 2.7;
	roller_1 movex ( 464, 4);
	roller_2 movex ( -464, 4);
	sound1 playsound ("roller_stop");
	sound2 playsound ("roller_stop");
	sound3 playsound ("roller_move");
	wait 2;
	sound3 playsound ("roller_move");
	wait 2;
	sound1 playsound ("roller_stop");
	sound2 playsound ("roller_stop");
	}

}


//////////////////////////////////////////////////////////////////////////////////



trap3() 
{ 
	trap3  =getent( "trap3", "targetname" ); 
	trig   =getent( "trig_trap3", "targetname" );
	sound  =getent( "fan_sound", "targetname" );
 

	while(true)
		{	
		trig waittill("trigger");
		trig delete();
		trap3 rotateYaw(4680,10);
		sound playloopsound ("fan1");
		wait 10;
		sound delete();
		}
}


//////////////////////////////////////////////////////////////////////////////////

 
trap4()
{
	trig = getEnt( "trig_trap4", "targetname" );
	brushGroup1 = getEntArray( "trap4_1", "targetname" );
	brushGroup2 = getEntArray( "trap4_2", "targetname" );

	trig waittill( "trigger");
	trig delete();
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
}


//////////////////////////////////////////////////////////////////////////////////


trap5()
{
	trap5  =getent( "trap5", "targetname" ); 
	trig   =getent( "trig_trap5", "targetname" );
	sound  = getent( "spin_sound", "targetname" );
 

	while(true)
		{	
		trig waittill("trigger");
		trig delete();

		sound playloopsound ("spin_loop");		
		trap5 rotateYaw(3000,6);
		wait 0.12;
		trap5 movez (135,0.8);
		trap5 waittill ("movedone");
		wait 3;
		trap5 movez (-135,0.8);
		trap5 waittill ("movedone");
		wait 1.38;
		sound delete();
		}
}


//////////////////////////////////////////////////////////////////////////////////


trap6()
{
	trap6_1  =getent( "trap6_1", "targetname" );
	trap6_2  =getent( "trap6_2", "targetname" );
	trap6_3  =getent( "trap6_3", "targetname" );
	sound  = getent( "hammer_sound", "targetname" );

	while(true)
		{
		sound playloopsound ("hammer_loop");
		trap6_1 rotatePitch(-190,1);
		trap6_2 rotatePitch( 190,1);
		trap6_3 rotatePitch(-190,1);
		wait 1;
		}
}


//////////////////////////////////////////////////////////////////////////////////


trap7()
{
	brushGroup1 = getEntArray( "trap7_1", "targetname" );
	brushGroup2 = getEntArray( "trap7_2", "targetname" );
	sound  = getent( "break_sound", "targetname" );
	trig = getEnt( "trig_trap7", "targetname" );


	trig waittill( "trigger");
	trig delete();

	sound playsound ("metal_break");

	brushGroup1[randomInt(brushGroup1.size)] delete();
	brushGroup2[randomInt(brushGroup2.size)] delete();
}


//////////////////////////////////////////////////////////////////////////////////


trap8()
{
	trap8_1  =getent( "trap8_1", "targetname" ); 
	trap8_2  =getent( "trap8_2", "targetname" ); 
	trig   =getent( "trig_trap8", "targetname" );
	sound  = getent( "double_sound", "targetname" );
	trig waittill("trigger");
	trig delete();
 

	while(true)
		{
		sound playsound ("double_open");
		trap8_1 rotatePitch(-90,1);
		trap8_2 rotatePitch(90,1);
		wait 4;
		sound playsound ("double_open");
		trap8_1 rotatePitch(90,1);
		trap8_2 rotatePitch(-90,1);
		trap8_1 waittill ("movedone");
		trap8_2 waittill ("movedone");
		}
}


//////////////////////////////////////////////////////////////////////////////////

trap9()
{
	trap9_1  =getent( "trap9_1", "targetname" ); 
	trap9_5  =getent( "trap9_5", "targetname" );
	trap9_6  =getent( "trap9_6", "targetname" ); 
	hurt  =getent( "trap9_hurt", "targetname" ); 
	trig  =getent( "trig_trap9", "targetname" );
	sound  = getent( "fire_place", "targetname" );

	trap9_5 hide();

	hurt enablelinkto();
	hurt linkto (trap9_6);

	fxObj1 = SpawnFx( level.fire_fx, ( -4160, 2616, 12 ));
	fxObj2 = SpawnFx( level.fire_fx, ( -4160, 2692, 12 ));
	fxObj3 = SpawnFx( level.fire_fx, ( -4160, 2768, 12 ));
	fxObj4 = SpawnFx( level.fire_fx, ( -4160, 2844, 12 ));
	fxObj5 = SpawnFx( level.fire_fx, ( -4160, 2920, 12 ));

	trig waittill ("trigger");
	trig delete ();


	wait 0.3;
	trap9_5 show();
	trap9_6 movez (80,0.1);
	sound playsound ("fire1");
	triggerFx (fxObj1);
	triggerFx (fxObj2);
	triggerFx (fxObj3);
	triggerFx (fxObj4);
	triggerFx (fxObj5);
	wait 1;
	sound playloopsound ("fire_barrel");
	wait 6;
	sound playsound ("fire3");
	fxObj1 delete();
	fxObj2 delete();
	fxObj3 delete();
	fxObj4 delete();
	fxObj5 delete();
	trap9_6 movez (-80,0.1);
	wait 0.5;
	sound delete();
}


//////////////////////////////////////////////////////////////////////////////////


trap10()
{
	trap10_1  =getent( "trap10_1", "targetname" ); 
	trap10_2  =getent( "trap10_2", "targetname" );
	trap10_3  =getent( "trap10_3", "targetname" );
	trap10_4  =getent( "trap10_4", "targetname" );
	trap10_5  =getent( "trap10_5", "targetname" );
	trap10_6  =getent( "trap10_6", "targetname" );
	trig  =getent( "trig_trap10", "targetname" );
	hurt1  =getent( "trig_trap10_1", "targetname" );
	hurt2  =getent( "trig_trap10_2", "targetname" );
	hurt3  =getent( "trig_trap10_3", "targetname" );
	hurt4  =getent( "trig_trap10_4", "targetname" );
	hurt5  =getent( "trig_trap10_5", "targetname" );
	hurt6  =getent( "trig_trap10_6", "targetname" );
	hurt7  =getent( "trap10_door1_hurt", "targetname" );
	hurt8  =getent( "trap10_door2_hurt", "targetname" );
	trap10_door1  =getent( "trap10_door1", "targetname" );
	trap10_door2  =getent( "trap10_door2", "targetname" );
	sound  = getent( "trap10_sound", "targetname" );
	


	trap10_1 notsolid();
	trap10_2 notsolid();
	trap10_3 notsolid();
	trap10_4 notsolid();
	trap10_5 notsolid();
	trap10_6 notsolid();

	hurt1 enablelinkto();
	hurt1 linkto (trap10_1);
	hurt2 enablelinkto();
	hurt2 linkto (trap10_2);
	hurt3 enablelinkto();
	hurt3 linkto (trap10_3);
	hurt4 enablelinkto();
	hurt4 linkto (trap10_4);
	hurt5 enablelinkto();
	hurt5 linkto (trap10_5);
	hurt6 enablelinkto();
	hurt6 linkto (trap10_6);
	hurt7 enablelinkto();
	hurt7 linkto (trap10_door1);
	hurt8 enablelinkto();
	hurt8 linkto (trap10_door2);

	trap10_1 movez ( -600, 0.1);
	trap10_2 movez ( -600, 0.1);
	trap10_3 movez ( -600, 0.1);
	trap10_4 movez ( -600, 0.1);
	trap10_5 movez ( -600, 0.1);
	trap10_6 movez ( -600, 0.1);
	trap10_door1 movez ( 125,1);
	trap10_door2 movez ( 125,1);

	trig waittill ("trigger");
	trig delete ();

	sound playsound ("door_start");
	trap10_door1 movez ( -125,1);
	trap10_door2 movez ( -125,1);
	wait 1;
	sound playsound ("door_close");


	wait 2;
	sound playloopsound ("laser");

	trap10_1 movez ( 600, 0.01);
	trap10_2 movez ( 600, 0.01);
	trap10_3 movez ( 600, 0.01);
	trap10_4 movez ( 600, 0.01);
	trap10_5 movez ( 600, 0.01);
	trap10_6 movez ( 600, 0.01);

	

	wait 2;
	trap10_1 movey ( -368, 1.5);
	trap10_2 movey ( -368, 1.5);
	trap10_3 movey ( -368, 1.5);
	trap10_4 movey ( -368, 1.5);
	trap10_5 movey ( -368, 1.5);
	trap10_6 movey ( -368, 1.5);	

	wait 1.5;
	trap10_1 MoveTo( (-4160, 3390, 144), 1.5);
	trap10_2 MoveTo( (-4160, 3390, 48), 1.5);
	trap10_3 MoveTo( (-3968, 3390, 96), 1.5);
	trap10_4 MoveTo( (-4096, 3390, 96), 1.5);
	trap10_5 MoveTo( (-4224, 3390, 96), 1.5);
	trap10_6 MoveTo( (-4352, 3390, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3486, 48), 1.5);
	trap10_2 MoveTo( (-4160, 3486, 144), 1.5);
	trap10_3 MoveTo( (-4224, 3502, 96), 1.5);
	trap10_4 MoveTo( (-4352, 3502, 96), 1.5);
	trap10_5 MoveTo( (-3968, 3502, 96), 1.5);
	trap10_6 MoveTo( (-4096, 3502, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3582, 144), 1.5);
	trap10_2 MoveTo( (-4160, 3582, 48), 1.5);
	trap10_3 MoveTo( (-3968, 3598, 96), 1.5);
	trap10_4 MoveTo( (-4096, 3598, 96), 1.5);
	trap10_5 MoveTo( (-4224, 3598, 96), 1.5);
	trap10_6 MoveTo( (-4352, 3598, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3678, 48), 1.5);
	trap10_2 MoveTo( (-4160, 3678, 144), 1.5);
	trap10_3 MoveTo( (-4224, 3678, 96), 1.5);
	trap10_4 MoveTo( (-4352, 3678, 96), 1.5);
	trap10_5 MoveTo( (-3968, 3678, 96), 1.5);
	trap10_6 MoveTo( (-4096, 3678, 96), 1.5);
	wait 1.5;
	trap10_1 movey ( -368, 1.5);
	trap10_2 movey ( -368, 1.5);
	trap10_3 movey ( -368, 1.5);
	trap10_4 movey ( -368, 1.5);
	trap10_5 movey ( -368, 1.5);
	trap10_6 movey ( -368, 1.5);	
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3390, 144), 1.5);
	trap10_2 MoveTo( (-4160, 3390, 48), 1.5);
	trap10_3 MoveTo( (-3968, 3390, 96), 1.5);
	trap10_4 MoveTo( (-4096, 3390, 96), 1.5);
	trap10_5 MoveTo( (-4224, 3390, 96), 1.5);
	trap10_6 MoveTo( (-4352, 3390, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3486, 48), 1.5);
	trap10_2 MoveTo( (-4160, 3486, 144), 1.5);
	trap10_3 MoveTo( (-4224, 3502, 96), 1.5);
	trap10_4 MoveTo( (-4352, 3502, 96), 1.5);
	trap10_5 MoveTo( (-3968, 3502, 96), 1.5);
	trap10_6 MoveTo( (-4096, 3502, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3582, 144), 1.5);
	trap10_2 MoveTo( (-4160, 3582, 48), 1.5);
	trap10_3 MoveTo( (-3968, 3598, 96), 1.5);
	trap10_4 MoveTo( (-4096, 3598, 96), 1.5);
	trap10_5 MoveTo( (-4224, 3598, 96), 1.5);
	trap10_6 MoveTo( (-4352, 3598, 96), 1.5);
	wait 1.5;
	trap10_1 MoveTo( (-4160, 3678, 48), 1.5);
	trap10_2 MoveTo( (-4160, 3678, 144), 1.5);
	trap10_3 MoveTo( (-4224, 3678, 96), 1.5);
	trap10_4 MoveTo( (-4352, 3678, 96), 1.5);
	trap10_5 MoveTo( (-3968, 3678, 96), 1.5);
	trap10_6 MoveTo( (-4096, 3678, 96), 1.5);
	wait 1.5;
	trap10_1 movey ( -1, 2.6);
	trap10_2 movey ( -1, 2.6);
	trap10_3 movey ( -1, 2.6);
	trap10_4 movey ( -1, 2.6);
	trap10_5 movey ( -1, 2.6);
	trap10_6 movey ( -1, 2.6);	
	wait 1.5;
	sound playsound ("door_start");
	trap10_door1 movez ( 125,1);
	trap10_door2 movez ( 125,1);
	wait 1;
	sound playsound ("door_close");
	sound delete();
	trap10_1 movez ( -600, 0.01);
	trap10_2 movez ( -600, 0.01);
	trap10_3 movez ( -600, 0.01);
	trap10_4 movez ( -600, 0.01);
	trap10_5 movez ( -600, 0.01);
	trap10_6 movez ( -600, 0.01);
	


}


//////////////////////////////////////////////////////////////////////////////////


final_door()
{
	trig  =getent( "trig_end", "targetname" );
	trig waittill("trigger", player);
	iprintlnbold ("NICE" + ", " + "^2"+ player.name + "^7 FINISHED FIRST!");
	trig delete();
}


//////////////////////////////////////////////////////////////////////////////////


teleport()
{
	trig = getent ("trig_teleport","targetname");
	trig thread end_knife();
	trig thread teleport2();
	while (1)
	{
  	trig waittill ("trigger",player);
	trig delete();

	player.health = 100;
	player TakeAllWeapons();
	player GiveWeapon("knife_mp");
	player SetSpawnWeapon("knife_mp");
	iprintlnbold(player.name + " ^1choosed the knife fight!");
	
	y = RandomInt(40);
	if( y < 10 )
	{
	musicplay ("airplane_alt_music");
	}
	if( y > 9 && y < 20  )
	{
	musicplay ("launch_a_action_music");
	}
	if( y > 19 && y < 30 )
	{
	musicplay ("scoutsniper_dash_music");
	}
	if( y > 29 )
	{
	musicplay ("sniperescape_run_music");
	}
	}
}

teleport1()
{
	trig = getent ("trig_teleport1","targetname");
	while(1)
	{
		trig waittill("trigger", who );
		if( getTeamPlayersAlive("axis") < 1 )
			return;
		if( getTeamPlayersAlive("allies") == 1 )
		{
			trig thread weapon();
			trig thread ammobox();
			iprintlnbold(who.name + " ^1choosed the weapon fight!");
			//self delete();
			break;
		}
		if( getTeamPlayersAlive("allies") > 1 )
		{
			who iprintlnbold("^1 Only in 1v1!");
		}
	}
}

ammobox()
{
	trig = getent ("ammo_trig","targetname");
	while(isDefined(trig))
	{
	trig waittill( "trigger", player );
    	player SetWeaponAmmoStock( "rpg_mp", 300 );
	player SetWeaponAmmoStock( "deserteaglegold_mp", 300 );
	player SetWeaponAmmoStock( "winchester1200_mp", 300 );
        player SetWeaponAmmoStock( "m40a3_acog_mp", 300 );
	player SetWeaponAmmoStock( "mp44_mp", 300 );
	player SetWeaponAmmoStock( "saw_grip_mp", 300 );
	wait 5;
	}

}


weapon()
{
	y = RandomInt(40);
	if( y < 10 )
	{
	musicplay ("airplane_alt_music");
	}
	if( y > 9 && y < 20  )
	{
	musicplay ("launch_a_action_music");
	}
	if( y > 19 && y < 30 )
	{
	musicplay ("scoutsniper_dash_music");
	}
	if( y > 29 )
	{
	musicplay ("sniperescape_run_music");
	}
	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}


	startj = getent("wep_jump_start", "targetname");
	starta = getent("wep_acti_start", "targetname");
	
	
	jumper SetPlayerAngles( startj.angles );
	jumper SetOrigin( startj.origin );
	jumper TakeAllWeapons();
	jumper.maxhealth = 100;
	jumper.health = jumper.maxhealth;
	acti SetPlayerAngles( starta.angles );
	acti SetOrigin( starta.origin );
	acti TakeAllWeapons();
	acti.maxhealth = 100;
	acti.health = acti.maxhealth;

	x = RandomInt(60);
	if( x < 10 )
		{
		acti GiveWeapon( "rpg_mp" );
		jumper GiveWeapon( "rpg_mp" );
		wait 0.01;
		acti SwitchToWeapon( "rpg_mp" );
		jumper SwitchToWeapon( "rpg_mp" );
		}
	if( x > 9 && x < 20 )
		{
		acti GiveWeapon( "winchester1200_mp" );
		jumper GiveWeapon( "winchester1200_mp" );
		wait 0.01;
		acti SwitchToWeapon( "winchester1200_mp" );
		jumper SwitchToWeapon( "winchester1200_mp" );
		}
	if( x > 19 && x < 30 )
		{
		acti GiveWeapon( "m40a3_acog_mp" );
		jumper GiveWeapon( "m40a3_acog_mp" );
		wait 0.01;
		acti SwitchToWeapon( "m40a3_acog_mp" );
		jumper SwitchToWeapon( "m40a3_acog_mp" );
		}
	if( x > 29 && x < 40  )
		{
		acti GiveWeapon( "mp44_mp" );
		jumper GiveWeapon( "mp44_mp" );
		wait 0.01;
		acti SwitchToWeapon( "mp44_mp" );
		jumper SwitchToWeapon( "mp44_mp" );
		}
	if( x > 39 && x < 50  )
		{
		acti GiveWeapon( "deserteaglegold_mp" );
		jumper GiveWeapon( "deserteaglegold_mp" );
		wait 0.01;
		acti SwitchToWeapon( "deserteaglegold_mp" );
		jumper SwitchToWeapon( "deserteaglegold_mp" );
		}
	if( x > 49  )
		{
		acti GiveWeapon( "saw_grip_mp" );
		jumper GiveWeapon( "saw_grip_mp" );
		wait 0.01;
		acti SwitchToWeapon( "saw_grip_mp" );
		jumper SwitchToWeapon( "saw_grip_mp" );
		}

	wait 0.1;
	jumper FreezeControls(1);
	acti FreezeControls(1);
	
	wait 2;
	
	
	noti = SpawnStruct();
	noti.titleText = "^1!!!^7FINAL ^11VS1 ^7FIGHT^1!!!";
	noti.notifyText = acti.name + " ^1VS ^7" + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait 5;
	jumper FreezeControls(0);
	acti FreezeControls(0);
	
	iprintlnbold("^1GOOD LUCK!");
}



teleport2()
{
	trig = getent ("trig_teleport2","targetname");
	while (1)
	{
	trig waittill ("trigger",player);
	wait 1;
	player SetPlayerAngles(( 0,0,0 ));
	player SetOrigin((-3560, 2320, 200));
	player.health = 100;
	player SetMoveSpeedScale(1);
	player TakeAllWeapons();
	player GiveWeapon("knife_mp");
	player SetSpawnWeapon("knife_mp");
	}
}

teleport_down()
{
	trig = getent ("teleport_down","targetname");
	trig thread end_knife();
	return;
}

teleport3()
{
	trig = getent ("trig_teleport3","targetname");

	while (1)
	{
	trig waittill ("trigger",player);
	player setorigin ( (-3800, 3992, 56) );
	player SetPlayerAngles ( (0,270,0) );
	}
	
}

enddoors1()
{
		
	door2 = getent ("end_door3","targetname");
	trig = getent ("trig_teleport2_doors","targetname");	
	trig2 = getent ("trig_teleport2","targetname");	
	trig2 enablelinkto();
	trig2 linkto (door2);
	door2 movez ( -114,1);
  	trig waittill ("trigger",player);
	trig delete();
	door2 movez ( 114,1);
}

enddoors2()
{
	door2 = getent ("end_door2","targetname");
	door4 = getent ("door_old","targetname");
	sound  = getent( "sound_old_door", "targetname" );
	trig = getent ("trig_teleport3_doors","targetname");
	
	door2 movez ( -114,1);
	trig waittill ("trigger",who);
	trig delete();
	iprintlnbold(who.name + " ^1choosed the old way!");
	door2 movez ( 114,0.1);
	wait 2;
	sound playsound ("door_start");
	door4 movez ( -94,1.5);
	wait 1.5;
	sound playsound ("door_close");
}

enddoors3()
{
	level endon ("check_stop");
	door1 = getent ("end_door1","targetname");
	sound  = getent( "sound_weapon_door", "targetname" );
	while(true)
	{
		if( getTeamPlayersAlive("allies") == 1 )
		{
		sound playsound ("door_start");
		door1 movez ( -114,0.5);
		wait 0.5;
		sound playsound ("door_close");
		level notify ("check_stop");
		}
		wait 5;
	}
}

////////////////////////// In this part thanks for Rycoon ///////////////////////////////

end_knife() 
{
	level.acti_enemy = undefined;
	acti = undefined;
	startj = getent("jumpstart", "targetname");
	starta = getent("actistart", "targetname");

	while(1)
	{
		self waittill("trigger", who );
		if( getTeamPlayersAlive("axis") < 1 )
			return;
		if( getTeamPlayersAlive("allies") == 1 )
		{
			thread knife_1v1();
			//self delete();
			break;
		}
		else if( getTeamPlayersAlive("allies") > 1 )
		{
			if( isDefined( level.acti_enemy ) && isAlive(level.acti_enemy) && level.acti_enemy != who )
			{
				who iprintlnbold("^1!!!1 VS 1!!!");
				who setorigin ( (-3512, 2312, 232) );
				who SetPlayerAngles ( (0,0,0) );
				
			}
			if( !isDefined(level.acti_enemy) || !isAlive(level.acti_enemy))
			{
				level.acti_enemy = who;
				wait 0.5;
				who SetPlayerAngles( startj.angles );
				who SetOrigin( startj.origin );
				acti = undefined;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
				{
					if( players[i].pers["team"] == "axis" )
					{
						players[i] SetOrigin( starta.origin );
						players[i] SetMoveSpeedScale(1);
						players[i] TakeAllWeapons();
						players[i] GiveWeapon("knife_mp");
						players[i] SetSpawnWeapon("knife_mp");
					}
					if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
					{
					acti = players[i];
					break;
					}
				}
				noti = SpawnStruct();
				noti.notifyText = who.name + " ^1VS ^7" + acti.name;
				noti.duration = 5;
				noti.glowcolor = (1,0,0);
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			}
		}
	}
}


knife_1v1()
{
	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}
	
	startj = getent("jumpstart", "targetname");
	starta = getent("actistart", "targetname");
	
	jumper SetPlayerAngles( startj.angles );
	jumper SetOrigin( startj.origin );
	jumper TakeAllWeapons();
	jumper GiveWeapon("knife_mp");
	jumper SetSpawnWeapon("knife_mp");
	acti SetPlayerAngles( starta.angles );
	acti SetOrigin( starta.origin );
	acti TakeAllWeapons();
	acti GiveWeapon("knife_mp");
	acti SetSpawnWeapon("knife_mp");

	wait 0.1;
	jumper FreezeControls(1);
	acti FreezeControls(1);
	
	wait 2;
	
	
	noti = SpawnStruct();
	noti.titleText = "^1!!!^7FINAL ^11VS1 ^7FIGHT^1!!!";
	noti.notifyText = acti.name + " ^1VS ^7" + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait 5;
	jumper FreezeControls(0);
	acti FreezeControls(0);
	
	iprintlnbold("^1GOOD LUCK!");
}



//////////////////// In this part thank for Rednose ////////////////////////


addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
	addTriggerToList("trig_end");
}


//////////////////////////////////////////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////////


secret()
{
	
	trig = getent("button", "targetname");
	trig2 = getent("button2", "targetname");
	rocket = getent ("rocket", "targetname");
	bomb = getent("bomb", "targetname");
	secret1 = getent("secret1", "targetname");
	secret2 = getent("secret2", "targetname");
	secret3 = getent("secret3", "targetname");
	secret_door = getent("secret_door","targetname");
	tele = getent("secret_tele", "targetname");

	secret1 waittill ("trigger",who);
	secret1 delete();
	secret2 waittill ("trigger",who);
	secret2 delete();
	secret3 waittill ("trigger",who);
	secret3 delete();
	
	secret_door notsolid();

	tele waittill ("trigger", who);
	secret_door solid();
	who setorigin ( ( 48, 2772, 44) );
	who SetPlayerAngles( ( 0, 90, 0) );
	iprintlnbold( who.name + "^2 found a secret nuke launcher!");
	

	trig waittill ("trigger",acti);
	trig delete();
	AmbientPlay( "alert" );
	PlayFX( level.sparks_fx, bomb.origin );
	PlayFX( level.flare_fx, bomb.origin );
	noti = SpawnStruct();
	noti.titleText = acti.name + " LAUNCHED A NUKE!";
	noti.notifyText = "10 SECONDS BEFORE DETONATION";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 5;
	noti = SpawnStruct();
	noti.titleText = "10";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "9";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "8";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "7";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "6";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "5";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "4";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "3";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "2";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "1";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	AmbientPlay( "incom" );
	wait 1;
	PlayFX( level.tracer_fx, bomb.origin );
	wait 1;
	AmbientPlay( "boom" );
	thread nuke();
	wait 7;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{						
	players[i] shellshock( "tankblast", 6 );
	}
	wait 3;
	AmbientStop();
	
	
	
	trig2 waittill ("trigger",who);
	who setorigin ( (-4148, 16, 80) );
	who SetPlayerAngles( ( 0, 90, 0) ); 
	
}


nuke()
{
	bomb = getent("bomb", "targetname");
	PlayFX( level.nuke_flash_fx, bomb.origin );
	PlayFX( level.nuke_exp_fx, bomb.origin );
	wait 3;
	PlayFX( level.nuke_shock_fx, bomb.origin );
	PlayFX( level.nuke_smoke_fx, bomb.origin );
	wait 2;
	Earthquake( 0.93,5, bomb.origin, 10000 );
}