/*
---------------------------------------------------
# ____              __                            #
#/\  _`\           /\ \__                         #
#\ \ \L\ \     __  \ \ ,_\  ____      __     __   #
# \ \ ,  /   /'__`\ \ \ \/ /\_ ,`\  /'__`\ /'__`\ #
#  \ \ \\ \ /\ \L\.\_\ \ \_\/_/  /_/\  __//\  __/ #
#   \ \_\ \_\ \__/.\_\\ \__\ /\____\ \____\ \____\#
#    \/_/\/ /\/__/\/_/ \/__/ \/____/\/____/\/____/#
#						  #
---------------------------------------------------
	Special Thanks for Braxi and Rycoon!
---------------------------------------------------
*/

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
	setdvar("compassmaxrange","1800");

	level.afterburn_fx = LoadFx("smoke/tribute");
	level.exp_fx = LoadFx("explosions/default_explosion");
	level.barrel_fx = LoadFx("explosions/fuel_med_explosion");
	level.c4_fx = LoadFx("misc/light_c4_blink");
	level.barret_fx = LoadFx("trail");
	level.boom_fx = LoadFx("explosions/suitcase_explosion");
	level.runner_fx = LoadFx("explosions/powerline_runner_large");
	level.crash_fx = LoadFx("dust/powerTower_crash");


	PreCacheShellShock( "tabun_gas_mp");
	PreCacheShellShock( "tankblast");

	
	precacheItem( "p90_mp" );
	precacheItem( "ak47_mp" );
	precacheItem( "ak74u_mp" );
	precacheItem( "m40a3_mp" );
	precacheItem( "mp5_mp" );
	precacheItem( "m14_mp" );

	thread secret1();
	thread secret2();
	thread elevator();
	thread main_door();	
	thread trap1();
	thread trap2();
	thread door1();
	thread trap3();
	thread trap3_1();
	thread trap3_2();
	thread trap4();
	thread door2();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap7_1();
	thread trap8();
	thread trap8_1();
	thread trap8_2();
	thread trap8_3();
	thread trap8_4();
	thread trap8_5();
	thread trap8_6();
	thread trap8_7();
	thread trap8_8();
	thread trap8_9();
	thread trap8_10();
	thread trap8_11();
	thread trap8_12();
	thread trap8_13();
	thread trap8_14();
	thread trap8_15();
	thread door3();
	thread trap9();
	thread door4();
	thread trap10();
	thread door5();

	thread teleport1();
	thread teleport2_1();
	thread teleport_down();
	thread teleport_back_end();

	thread addTestClients();
	thread addtrapstofreerun();

	wait 0.05; 
	level.dvar["bunnyhoop"] = 0;
	level.dvar["roundSound"] = 0;
	level.dvar["lastalive"] = 0;
}


console()
{
	trig1  =getent("button","targetname");
	trig2 = getent("button2", "targetname");
	bomb = getent("bomb", "targetname");
	inc10 = getent("inc10", "targetname");
	crash = getent("crash", "targetname");
	tower1  =getent("tower1","targetname");	
	tower2  =getent("tower2","targetname");
	rotate =getent("rotate_tower","targetname");


	tower2 linkto(rotate);
	tower2 hide();

	
	
	noti = SpawnStruct();
	noti.titleText = "^7"+ self.name + "^7 FOUND A DESTRUCTION SITE!";
	noti.duration = 7;
	noti.glowColor = (1, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	

	wait 6;

	trig1 waittill ("trigger",acti);
	trig1 delete();

	tower1  PlayloopSound ("tick");

	noti = SpawnStruct();
	noti.titleText = "^7 FUSE IS ACTIVE!";
	noti.duration = 4.5;
	noti.glowColor = (1, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 10;
	tower1 stoploopsound();
	tower1  PlaySound ("boom1");
	PlayFX( level.boom_fx, inc10.origin );
	Earthquake( 0.6,0.5, inc10.origin, 12000 );
	tower1 hide();
	tower2 show();
	tower2 PlaySound ("tower");
	Earthquake( 0.5,15, inc10.origin, 12000 );
	wait 3;

	rotate rotateroll (94.3, 6);
	wait 5.8;
	Earthquake( 0.8,3, inc10.origin, 12000 );
	PlayFX( level.crash_fx, crash.origin );
	wait 0.2;
	self shellshock( "tankblast", 3 );

	trig2 waittill ("trigger",who);
	who setorigin ( (-3864, 968, 16) );
	who SetPlayerAngles( ( 0, 0, 0) ); 	
}

secret1()
{
	trig1  =getent("secret1_1","targetname");	
	trig2  =getent("secret1_2","targetname");	
	trig3  =getent("secret1_3","targetname");	
	trig4  =getent("secret1_4","targetname");	
	trig5  =getent("secret1_5","targetname");	
	trig6  =getent("secret1_6","targetname");

	trig1 waittill ("trigger");
	trig2 waittill ("trigger");	
	trig3 waittill ("trigger");	
	trig4 waittill ("trigger");	
	trig5 waittill ("trigger");	
	trig6 waittill ("trigger", who);

	noti = SpawnStruct();
	noti.titleText = "^7"+ who.name + "^7 FOUND A SECRET!";
	noti.duration = 4.5;
	noti.glowColor = (1, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	

	AmbientPlay( "secret" );
		
	PlayFxOnTag( level.barret_fx, who, "j_spinelower" );
}

secret2()
{
	trig1  =getent("s1","targetname");	
	trig2  =getent("s2","targetname");	
	trig3  =getent("s3","targetname");	
	trig4  =getent("s4","targetname");	
	trig5  =getent("s5","targetname");	
	trig6  =getent("s6","targetname");
	trig7  =getent("s7","targetname");

	trig1 waittill ("trigger");

	trig1 delete();
	trig2 waittill ("trigger");
	trig2 delete();	
	trig3 waittill ("trigger");
	trig3 delete();
	trig4 waittill ("trigger");
	trig4 delete();
	trig5 waittill ("trigger");
	trig5 delete();
	trig6 waittill ("trigger");
	trig6 delete();
	trig7 waittill ("trigger", who);
	trig7 delete();

	who setorigin ( ( 48, 2772, 44) );
	who SetPlayerAngles( ( 0, 90, 0) );

	who thread console();

}

elevator()
{
	level waittill("connected", player);

	thread WatchIfAllDead();


	elevator  =getent("elevator","targetname");
	sound      =getent( "main_door_sound", "targetname" );

	elevator  PlayloopSound ("elevator_move");
	elevator  PlayloopSound ("elevator_move");
	elevator  PlayloopSound ("elevator_move");
	elevator  PlayloopSound ("elevator_move");
	wait 2;
	Earthquake( 0.3,7, elevator.origin, 400 );
	wait 6;
	elevator StopLoopSound();
	sound  PlaySound ("elevator_stop");
	sound  PlaySound ("elevator_stop");
	sound  PlaySound ("elevator_stop");
	sound  PlaySound ("elevator_stop");
	sound  PlaySound ("elevator_stop");
	Earthquake( 1,1.5, elevator.origin, 400 );
}

main_door()
{
	level waittill("connected", player);
	main_door  =getent( "main_door", "targetname" );
	sound      =getent( "main_door_sound", "targetname" );
	main_door movex (16,0.01);	
	wait 11;
	sound  playsound ("bell");
	sound  playsound ("bell");
	sound  playsound ("bell");
	sound  playsound ("bell");
	sound  playsound ("bell");
	wait 1;
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	main_door movez (-112,2.3);
	main_door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}


trap1()
{
	trap =getent("trap1","targetname");
	trig  =getent("trig_trap1","targetname");
	sound  = getent( "trap1_sound", "targetname" );
	touch = getent("touch_trap1", "targetname");

	
		trig waittill("trigger");
		trig delete();
		thread trap1_1();
		sound playsound ("trap1_sound");
		sound playsound ("trap1_sound");
		sound playsound ("trap1_sound");
		sound playsound ("trap1_sound");
		sound playsound ("trap1_sound");
		trap movez (20,0.1);
		trap waittill ("movedone");
		wait(0.1);
		trap movez (-20,0.1);
		trap waittill ("movedone");
		level notify ("trap1_stop");
}

trap1_1()
{
	level endon ("trap1_stop");
	touch = getent("touch_trap1", "targetname");	

	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( touch ) && players[i].sessionstate == "playing" )
			{		
			players[i] thread trap1_push();
			}
		}
}

trap1_push()
{
	start = getent("trap1_start", "targetname");
	end = getent("trap1_end", "targetname");

	self LinkTo(start);
	start moveto ( end.origin, 0.2, .02, .02 );
	wait 0.30;
	self UnLink();
}

trap2()
{
	trap1  =getent("trap2_1","targetname");
	trap2  =getent("trap2_2","targetname");
	trap3  =getent("trap2_3","targetname");
	trap4  =getent("trap2_4","targetname");
	trap5  =getent("trap2_5","targetname");
	trap6  =getent("trap2_6","targetname");
	trig  =getent("trig_trap2","targetname");
	floor =getent("trap2_floor", "targetname");
	sound  = getent( "trap2_sound", "targetname" );
	dmg1  =getent("trap2_dmg1","targetname");
	dmg2  =getent("trap2_dmg2","targetname");
	dmg3  =getent("trap2_dmg3","targetname");
	dmg4  =getent("trap2_dmg4","targetname");
	dmg5  =getent("trap2_dmg5","targetname");
	dmg6  =getent("trap2_dmg6","targetname");	


	dmg1 enablelinkto();
	dmg1 linkto(trap1);
	dmg2 enablelinkto();
	dmg2 linkto(trap2);	
	dmg3 enablelinkto();
	dmg3 linkto(trap3);	
	dmg4 enablelinkto();
	dmg4 linkto(trap4);	
	dmg5 enablelinkto();
	dmg5 linkto(trap5);	
	dmg6 enablelinkto();
	dmg6 linkto(trap6);

	trap1 movez ( 160, 0.1);
	trap2 movez ( 160, 0.1);
	trap3 movez ( 160, 0.1);
	trap4 movez ( 160, 0.1); 
	trap5 movez ( 160, 0.1);
	trap6 movez ( 160, 0.1); 


	floor movex (-384,0.1);	


	trig waittill("trigger");
	trig delete();
	

	sound playsound ("trap2_sound1");
	sound playsound ("trap2_sound1");
	sound playsound ("trap2_sound1");
	sound playsound ("trap2_sound1");

	x = RandomInt(160);

		
	if( x  < 20 )
	{
	trap1 movez ( -160, 0.3, 0.1, 0,1);
	trap3 movez ( -160, 0.3, 0.1, 0,1);
	trap5 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap1 movez ( 160, 0.3);
	trap3 movez ( 160, 0.3);
	trap5 movez ( 160, 0.3);
	}

	if( x > 19 && x < 40  )
	{
	trap1 movez ( -160, 0.3, 0.1, 0,1);
	trap3 movez ( -160, 0.3, 0.1, 0,1);
	trap6 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap1 movez ( 160, 0.3, 0.1, 0,1);
	trap3 movez ( 160, 0.3, 0.1, 0,1);
	trap6 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 39 && x < 60  )
	{
	trap1 movez ( -160, 0.3, 0.1, 0,1);
	trap4 movez ( -160, 0.3, 0.1, 0,1);
	trap5 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap1 movez ( 160, 0.3, 0.1, 0,1);
	trap4 movez ( 160, 0.3, 0.1, 0,1);
	trap5 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 59 && x < 80  )
	{
	trap1 movez ( -160, 0.3, 0.1, 0,1);
	trap4 movez ( -160, 0.3, 0.1, 0,1);
	trap6 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap1 movez ( 160, 0.3, 0.1, 0,1);
	trap4 movez ( 160, 0.3, 0.1, 0,1);
	trap6 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 79 && x < 100  )
	{
	trap2 movez ( -160, 0.3, 0.1, 0,1);
	trap3 movez ( -160, 0.3, 0.1, 0,1);
	trap5 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap2 movez ( 160, 0.3, 0.1, 0,1);
	trap3 movez ( 160, 0.3, 0.1, 0,1);
	trap5 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 99 && x < 120  )
	{
	trap2 movez ( -160, 0.3, 0.1, 0,1);
	trap3 movez ( -160, 0.3, 0.1, 0,1);
	trap6 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap2 movez ( 160, 0.3, 0.1, 0,1);
	trap3 movez ( 160, 0.3, 0.1, 0,1);
	trap6 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 119 && x < 140  )
	{
	trap2 movez ( -160, 0.3, 0.1, 0,1);
	trap4 movez ( -160, 0.3, 0.1, 0,1);
	trap5 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap2 movez ( 160, 0.3, 0.1, 0,1);
	trap4 movez ( 160, 0.3, 0.1, 0,1);
	trap5 movez ( 160, 0.3, 0.1, 0,1);
	}

	if( x > 139  )
	{
	trap2 movez ( -160, 0.3, 0.1, 0,1);
	trap4 movez ( -160, 0.3, 0.1, 0,1);
	trap6 movez ( -160, 0.3, 0.1, 0,1);
	wait 0.3;
	Earthquake( 1, 1, sound.origin, 400);
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	sound playsound ("trap2_sound2");
	
	wait 0.7;
	trap2 movez ( 160, 0.3, 0.1, 0,1);
	trap4 movez ( 160, 0.3, 0.1, 0,1);
	trap6 movez ( 160, 0.3, 0.1, 0,1);
	}
	
	dmg1 unlink();
	dmg2 unlink();
	dmg3 unlink();
	dmg4 unlink();
	dmg5 unlink();
	dmg6 unlink();
	dmg1 delete();
	dmg2 delete();
	dmg3 delete();
	dmg4 delete();
	dmg5 delete();
	dmg6 delete();
		
}

door1()
{
	door  =getent( "door1", "targetname" );
	trig  =getent("door1_trig","targetname");
	sound      =getent( "door1_sound", "targetname" );
	
	door movex (16,0.1);
	trig waittill ("trigger");
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	door movez (-112,2.3);
	door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}

trap3()
{
	trig  =getent("trig_trap3","targetname");
	sound1      =getent( "trap3_1_sound", "targetname" );
	sound2      =getent( "trap3_2_sound", "targetname" );

	sound1 PlayloopSound ("trap3_sound");
	sound2 PlayloopSound ("trap3_sound");

	trig waittill ("trigger");
	trig delete();
	level notify ("check_stop");
	thread trap3_3();
}

trap3_1()
{
	trap  =getent("trap3","targetname");
	dmg   =getent("dmg_trap3","targetname");

	dmg enablelinkto();
	dmg linkto(trap);

	while(1)
	{
	wait 0.1;
	trap movex ( -310, 3);
	trap waittill ("movedone");
	trap movex (310, 3);
	trap waittill ("movedone");
	}
}

trap3_2()
{
	level endon ("check_stop");
	trap  =getent("trap3","targetname");

	while(1)
	{
	wait 0.1;
	trap rotatePitch (720, 3);
	}
}

trap3_3()
{
	trap  =getent("trap3","targetname");

	while(1)
	{
	wait 0.1;
	trap rotatePitch (-720, 3);
	}
}

trap4()
{
	trig = getent("trig_trap4", "targetname");
	point1 = getent("smoke1", "targetname");
	dmg   =getent("dmg_trap4","targetname");
	sound   =getent("trap4_sound","targetname");

	fxObj1 = SpawnFx( level.afterburn_fx, point1.origin);

	trig waittill ("trigger");
	trig delete();
	thread trap4_1();
	sound PlaySound ("steam");
	triggerFx (fxObj1);
	
	wait 5;
	dmg delete();
	level notify ("trap4_stop");
	wait 2;
	fxObj1 delete();
		
}

trap4_1()
{
	level endon ("trap4_stop");
	dmg   =getent("dmg_trap4","targetname");


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( !isDefined( players[i].gas ) && players[i] isTouching( dmg ) && players[i].sessionstate == "playing")
			{		
			players[i] thread kill();
			players[i].gas =true;
			}
		}
	}
}

kill()
{
	level endon ("kill_stop");
	self endon("disconnect");
	self endon("death");

	while(1)
	{
	self shellshock( "tabun_gas_mp", 7 );
	self PlayLocalSound( "gas" );
	self PlayLocalSound( "gas" );
	self PlayLocalSound( "gas" );
	self PlayLocalSound( "gas" );
	self PlayLocalSound( "gas" );
	self PlayLocalSound( "gas" );

	wait 7.8;
	self suicide();
	}
}

door2()
{
	door  =getent( "door2", "targetname" );
	trig  =getent("door2_trig","targetname");
	sound      =getent( "door2_sound", "targetname" );
	
	door movex (16,0.1);
	trig waittill ("trigger");
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	door movez (-112,2.3);
	door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}


trap5()
{	
	trig = getent("trig_trap5", "targetname");
	c1_1 = getent ("trap5_c4_1_1", "targetname");
	c1_2 = getent ("trap5_c4_1_2", "targetname");
	c2_1 = getent ("trap5_c4_2_1", "targetname");
	c2_2 = getent ("trap5_c4_2_2", "targetname");
	fxObj1 = SpawnFx( level.c4_fx, c1_1.origin+(0,0,4) );
	fxObj2 = SpawnFx( level.c4_fx, c1_2.origin+(0,0,4) );
	fxObj3 = SpawnFx( level.c4_fx, c2_1.origin+(0,0,4) );
	fxObj4 = SpawnFx( level.c4_fx, c2_2.origin+(0,0,4) );

	triggerFx (fxObj1);
	triggerFx (fxObj2);
	triggerFx (fxObj3);
	triggerFx (fxObj4);

	trig waittill ("trigger");

	x = RandomInt(100);
		if( x < 50 )
		{
		c1_1 PlaySound ("exp");
		PlayFX( level.exp_fx, c1_1.origin );
		RadiusDamage( c1_1.origin, 135, 150, 40);
		Earthquake( 2, 1, c1_1.origin, 250);
		fxObj1 delete();
		c1_1 delete();
		}
		if( x > 49  )
		{
		c1_2 PlaySound ("exp");
		PlayFX( level.exp_fx, c1_2.origin );
		RadiusDamage( c1_2.origin, 135, 150, 40);
		Earthquake( 2, 1, c1_2.origin, 250);
		fxObj2 delete();
		c1_2 delete();
		}

	trig waittill ("trigger");

	x = RandomInt(100);
		if( x < 50 )
		{
		c2_1 PlaySound ("exp");
		PlayFX( level.exp_fx, c2_1.origin );
		RadiusDamage( c2_1.origin, 135, 150, 40);
		Earthquake( 2, 1, c2_1.origin, 250);
		fxObj3 delete();
		c2_1 delete();
		}
		if( x > 49  )
		{
		c2_2 PlaySound ("exp");
		PlayFX( level.exp_fx, c2_2.origin );
		RadiusDamage( c2_2.origin, 135, 150, 40);
		Earthquake( 2, 1, c2_2.origin, 250);
		fxObj4 delete();
		c2_2 delete();
		}
	trig delete();
}

trap6()
{
	trap  =getent("trap6","targetname");
	trig  =getent("trig_trap6","targetname");
	dmg  =getent("trap6_dmg","targetname");
	sound  = getent( "trap6_sound", "targetname" );

	dmg enablelinkto();
	dmg linkto(trap);

		trig waittill("trigger");
		trap movez (-176,0.3);
		trap waittill ("movedone");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		Earthquake( 1, 1, sound.origin, 600);
		wait 1;
		trap movez (176,0.3);
		trap waittill ("movedone");
		trig waittill("trigger");
		trap movez (-176,0.3);
		trap waittill ("movedone");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		Earthquake( 1, 1, sound.origin, 600);
		wait 1;
		trap movez (176,0.3);
		trap waittill ("movedone");
		trig waittill("trigger");
		trap movez (-176,0.3);
		trap waittill ("movedone");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		Earthquake( 1, 1, sound.origin, 600);
		wait 1;
		trap movez (176,0.3);
		trap waittill ("movedone");
		trig waittill("trigger");
		trap movez (-176,0.3);
		trap waittill ("movedone");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		sound playsound ("hit_metal");
		Earthquake( 1, 1, sound.origin, 600);
		wait 1;
		trap movez (176,0.3);
		trig delete();
}

trap7()
{
	trap  =getent("trap7","targetname");
	dmg  =getent("trap7_dmg","targetname");
	model1  =getent("trap7_model1","targetname");
	model2  =getent("trap7_model2","targetname");
	model3  =getent("trap7_model3","targetname");
	model4  =getent("trap7_model4","targetname");
	model5  =getent("trap7_model5","targetname");
	model6  =getent("trap7_model6","targetname");


	dmg enablelinkto();
	dmg linkto(trap);

	model1 linkto(trap);
	model2 linkto(trap);
	model3 linkto(trap);
	model4 linkto(trap);
	model5 linkto(trap);
	model6 linkto(trap);

	model1 PlayloopSound ("trap7_sound");
	model4 PlayloopSound ("trap7_sound");

	trig  =getent("trig_trap7","targetname");
	trig waittill ("trigger");
	trig delete();
	
	level notify ("trap7_stop");
	thread trap7_2();

}

trap7_1()
{
	level endon ("trap7_stop");
	trap  =getent("trap7","targetname");

	while(1)
	{
	wait 1;
	trap rotateyaw (-150,1);
	}	
}

trap7_2()
{
	trap  =getent("trap7","targetname");

	while(1)
	{
	wait 0.1;
	trap rotateyaw (15,0.1);
	}	
}

trap8()
{
	trap =getent("trap8", "targetname");
	
	trap rotateRoll(-180,1);
}

trap8_1()
{
	touch  =getent("trig_trap8_1","targetname");
	barrel =getent("trap8_1","targetname");
	origin =getent("trap8_origin_1","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}


trap8_2()
{
	touch  =getent("trig_trap8_2","targetname");
	barrel =getent("trap8_2","targetname");
	origin =getent("trap8_origin_2","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_3()
{
	touch  =getent("trig_trap8_3","targetname");
	barrel =getent("trap8_3","targetname");
	origin =getent("trap8_origin_3","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_4()
{
	touch  =getent("trig_trap8_4","targetname");
	barrel =getent("trap8_4","targetname");
	origin =getent("trap8_origin_4","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_5()
{
	touch  =getent("trig_trap8_5","targetname");
	barrel =getent("trap8_5","targetname");
	origin =getent("trap8_origin_5","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_6()
{
	touch  =getent("trig_trap8_6","targetname");
	barrel =getent("trap8_6","targetname");
	origin =getent("trap8_origin_6","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_7()
{
	touch  =getent("trig_trap8_7","targetname");
	barrel =getent("trap8_7","targetname");
	origin =getent("trap8_origin_7","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_8()
{
	touch  =getent("trig_trap8_8","targetname");
	barrel =getent("trap8_8","targetname");
	origin =getent("trap8_origin_8","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_9()
{
	touch  =getent("trig_trap8_9","targetname");
	barrel =getent("trap8_9","targetname");
	origin =getent("trap8_origin_9","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_10()
{
	touch  =getent("trig_trap8_10","targetname");
	barrel =getent("trap8_10","targetname");
	origin =getent("trap8_origin_10","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_11()
{
	touch  =getent("trig_trap8_11","targetname");
	barrel =getent("trap8_11","targetname");
	origin =getent("trap8_origin_11","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_12()
{
	touch  =getent("trig_trap8_12","targetname");
	barrel =getent("trap8_12","targetname");
	origin =getent("trap8_origin_12","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_13()
{
	touch  =getent("trig_trap8_13","targetname");
	barrel =getent("trap8_13","targetname");
	origin =getent("trap8_origin_13","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_14()
{
	touch  =getent("trig_trap8_14","targetname");
	barrel =getent("trap8_14","targetname");
	origin =getent("trap8_origin_14","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

trap8_15()
{
	touch  =getent("trig_trap8_15","targetname");
	barrel =getent("trap8_15","targetname");
	origin =getent("trap8_origin_15","targetname");

	touch waittill ("trigger",who);
	who suicide();
	touch delete();

	barrel delete();
	PlayFX( level.barrel_fx, origin.origin );
	Earthquake( 2, 1, origin.origin, 70);
	origin playsound ("exp");
}

door3()
{
	door  =getent( "door3", "targetname" );
	trig  =getent("door3_trig","targetname");
	sound      =getent( "door3_sound", "targetname" );
	
	door movex (16,0.1);
	trig waittill ("trigger");
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	door movez (-112,2.3);
	door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}

trap9()
{
	trig  =getent("trig_trap9","targetname");

	trig waittill ("trigger");

	thread trap9_1();

	trig waittill ("trigger");
	thread trap9_2();
	trig delete();

	
}

trap9_1()
{
	trap1 =getent("trap9_1","targetname");
	trap2 =getent("trap9_2","targetname");

	x = RandomInt(100);
	if( x < 50 )
	{
	trap1 PlaySound ("elevator_down");
	trap1 movey ( -184, 0.5);
	wait 4;
	trap1 PlaySound ("elevator_down");
	trap1 movey ( 184, 0.5);
	}
	if( x > 49 )
	{
	trap2 PlaySound ("elevator_down");
	trap2 movey ( 199, 0.5);
	wait 4;
	trap2 PlaySound ("elevator_down");
	trap2 movey ( -199, 0.5);
	}
}

trap9_2()
{
	trap3 =getent("trap9_3","targetname");
	trap4 =getent("trap9_4","targetname");

	x = RandomInt(100);
	if( x < 50 )
	{
	trap3 PlaySound ("elevator_down");
	trap3 movey ( -184, 0.5);
	wait 4;
	trap3 PlaySound ("elevator_down");
	trap3 movey ( 184, 0.5);
	}
	if( x > 49 )
	{
	trap4 PlaySound ("elevator_down");
	trap4 movey ( 199, 0.5);
	wait 4;
	trap4 PlaySound ("elevator_down");
	trap4 movey ( -199, 0.5);
	}
}

door4()
{
	door  =getent( "door4", "targetname" );
	trig  =getent("door4_trig","targetname");
	sound      =getent( "door4_sound", "targetname" );
	
	door movex (16,0.1);
	trig waittill ("trigger");
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	door movez (-112,2.3);
	door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}

getPlayers()
{
	return getEntArray( "player", "classname" );
}

trap10()  // Thx for BraXi
{
	activator = getEnt( "trig_trap10", "targetname" ); 
	area = getEnt( "trap10_check", "targetname" ); 
	
	trafficLightRed = getEnt( "lamp_red", "targetname" ); 
	trafficLightYellow = getEnt( "lamp_yellow", "targetname" ); 
	trafficLightGreen = getEnt( "lamp_green", "targetname" ); 
	
	trafficLightRed hide();
	trafficLightYellow hide();

	activator waittill( "trigger" ); // wait for trigger

	trafficLightGreen hide();
	trafficLightRed show(); //red light now
	trafficLightRed PlaySound ("stuck");
	wait 0.2;

	timeElapsed = 0;
	seconds = 5; //ppl cant move for 5 seconds
	yellowTime = 4;

	while( timeElapsed != seconds*10 )
	{
		players = getPlayers();

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( area ) && players[i].sessionstate == "playing" )
			{
				if( !isDefined( players[i].safePosition ) )
					players[i].safePosition = players[i].origin;
				else
				{
					if( distance( players[i].safePosition, players[i].origin ) > 3 ) 
					{	
						players[i] suicide();
						players[i].safePosition = undefined;
					}
				}
			}
		}
		wait 0.1;
		timeElapsed++;

		if( (timeElapsed/10) == yellowTime )
		{
			trafficLightRed hide();
			trafficLightYellow show();
			trafficLightRed PlaySound ("stuck");
		}
	}

	trafficLightRed delete();
	trafficLightYellow delete();
	trafficLightGreen show();
	trafficLightGreen PlaySound ("stuck");

	area delete();

}

door5()
{
	door  =getent( "door5", "targetname" );
	door1 = getent ("end_door1","targetname");
	trig  =getent("door5_trig","targetname");
	sound      =getent( "door5_sound", "targetname" );
	
	door movex (16,0.1);
	door1 movex (16,0.1);
	trig waittill ("trigger", who );

	thread end_door();

	noti = SpawnStruct();
	noti.titleText = "NICE" + ", " + "^2"+ who.name + "^7 FINISHED FIRST!";
	noti.duration = 4.5;
	noti.glowColor = (0.3, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	

	AmbientPlay( "win" );
	sound playsound ("door_open");
	sound playsound ("door_open");
	sound playsound ("door_open");
	door movez (-112,2.3);
	door waittill ("movedone");
	sound playsound ("door_close");
	sound playsound ("door_close");
	sound playsound ("door_close");
}

end_door()
{
	level endon ("check_stop_a");
	door1 = getent ("end_door1","targetname");
	
	while(true)
	{
		if( getTeamPlayersAlive("allies") == 1 )
		{
		door1 playsound ("door_open");
		door1 movez ( -112,2.3);
		wait 0.5;
		door1 playsound ("door_close");
		door1 waittill ("movedone");
		wait 3;
		thread end_door1();
		level notify ("check_stop_a");
		wait 0.5;
		}
		wait 3;
	}
}

end_door1()
{
	level endon ("check_stop_b");
	door1 = getent ("end_door1","targetname");
	
	while(true)
	{
		if( getTeamPlayersAlive("allies") != 1 )
		{
		door1 playsound ("door_open");
		door1 movez ( 112,2.3);
		wait 0.5;
		door1 playsound ("door_close");
		door1 waittill ("movedone");
		wait 3;
		thread end_door();
		level notify ("check_stop_b");
		wait 0.5;
		}
		wait 3;
	}
}

teleport1()
{
	trig = getent ("trig_teleport1","targetname");
	tele = getent ("door5_sound","targetname");
	while(1)
	{
		trig waittill("trigger", who );
		if( getTeamPlayersAlive("axis") < 1 )
			return;
		if( getTeamPlayersAlive("allies") == 1 )
		{
			trig thread weapon();
			trig thread ammobox();
			break;
		}
		if( getTeamPlayersAlive("allies") > 1 )
		{
			who iprintlnbold("^1 Only in 1v1!");
			who SetOrigin(tele.origin);
		}
	}
}

teleport2_1()
{
	trig = getent ("trig_teleport2_1","targetname");
	trig waittill ("trigger", player);
	trig thread end_knife();
	wait 0.001;
	thread teleport2_2();
	trig delete();

}

teleport2_2()
{
	trig = getent ("trig_teleport2_2","targetname");
	t = getent ("t_tele","targetname");
	while (1)
	{
	trig waittill ("trigger",player);
	player SetOrigin(t.origin);
	player.health = 100;
	player SetMoveSpeedScale(1);
	player TakeAllWeapons();
	player GiveWeapon("tomahawk_mp");
	player SetSpawnWeapon("tomahawk_mp");
	}
}

teleport_down()
{
	trig = getent ("teleport_down","targetname");
	trig thread end_knife();
	return;
}

teleport_back_end()
{
	trig = getent ("trig_tele_back_end","targetname");
	tele = getent ("door5_sound","targetname");

	while(1)
	{
	trig waittill ("trigger",who);
	who setorigin ( tele.origin );
	who SetPlayerAngles( ( 0, 0, 0) ); 
	}
}


ammobox()
{
	trig = getent ("ammo_trig","targetname");
	while(isDefined(trig))
	{
	trig waittill( "trigger", player );
	player PlayLocalSound( "ammo" );
	player PlayLocalSound( "ammo" );
	player PlayLocalSound( "ammo" );
	player PlayLocalSound( "ammo" );
    	player SetWeaponAmmoStock( "p90_mp", 300 );
	player SetWeaponAmmoStock( "ak47_mp", 300 );
	player SetWeaponAmmoStock( "ak74u_mp", 300 );
        player SetWeaponAmmoStock( "m40a3_mp", 300 );
	player SetWeaponAmmoStock( "mp5_mp", 300 );
	player SetWeaponAmmoStock( "m14_mp", 300 );
	wait 5;
	}
}


////////////////////////// In this part thanks for Rycoon ///////////////////////////////

WatchIfAllDead()
{
	level waittill("activator", who );
	tower2  =getent("tower2","targetname");	
	wait 2;
	while(1)
	{
		if( getTeamPlayersAlive("allies") < 1 )
		{
			AmbientStop();
			MusicStop();
			//StopSounds();
			x = RandomInt(70);
			if( x < 10 )
			{
			tower2  PlaySound ("end1");
			}
			if( x > 9 && x < 20  )
			{
			tower2  PlaySound ("end2");
			}
			if( x > 19 && x < 30  )
			{
			tower2  PlaySound ("end3");
			}
			if( x > 29 && x < 40  )
			{
			tower2  PlaySound ("end4");
			}
			if( x > 39 && x < 50  )
			{
			tower2  PlaySound ("end5");
			}
			if( x > 49 && x < 60  )
			{
			tower2  PlaySound ("end6");
			}
			if( x > 59 )
			{
			tower2  PlaySound ("end7");
			}	
		break;
		}
		if( getTeamPlayersAlive("axis") < 1 )
		{
			AmbientStop();
			MusicStop();
			//StopSounds();
			x = RandomInt(70);
			if( x < 10 )
			{
			tower2  PlaySound ("end1");
			}
			if( x > 9 && x < 20  )
			{
			tower2  PlaySound ("end2");
			}
			if( x > 19 && x < 30  )
			{
			tower2  PlaySound ("end3");
			}
			if( x > 29 && x < 40  )
			{
			tower2  PlaySound ("end4");
			}
			if( x > 39 && x < 50  )
			{
			tower2  PlaySound ("end5");
			}
			if( x > 49 && x < 60  )
			{
			tower2  PlaySound ("end6");
			}
			if( x > 59 )
			{
			tower2  PlaySound ("end7");
			}	
		break;
		}
		wait 0.2;
	}
}


weapon()
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


	startj = getent("weap_acti", "targetname");
	starta = getent("weap_jump", "targetname");
	
	
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
		acti GiveWeapon( "m14_mp" );
		jumper GiveWeapon( "m14_mp" );
		wait 0.01;
		acti SwitchToWeapon( "m14_mp" ); 
		jumper SwitchToWeapon( "m14_mp" );
		}
	if( x > 9 && x < 20 )
		{
		acti GiveWeapon( "p90_mp" );
		jumper GiveWeapon( "p90_mp" );
		wait 0.01;
		acti SwitchToWeapon( "p90_mp" );
		jumper SwitchToWeapon( "p90_mp" );
		}
	if( x > 19 && x < 30 )
		{
		acti GiveWeapon( "mp5_mp" );
		jumper GiveWeapon( "mp5_mp" );
		wait 0.01;
		acti SwitchToWeapon( "mp5_mp" );
		jumper SwitchToWeapon( "mp5_mp" );
		}
	if( x > 29 && x < 40  )
		{
		acti GiveWeapon( "ak47_mp" );
		jumper GiveWeapon( "ak47_mp" );
		wait 0.01;
		acti SwitchToWeapon( "ak47_mp" );
		jumper SwitchToWeapon( "ak47_mp" );
		}
	if( x > 39 && x < 50  )
		{
		acti GiveWeapon( "m40a3_mp" );
		jumper GiveWeapon( "m40a3_mp" );
		wait 0.01;
		acti SwitchToWeapon( "m40a3_mp" );
		jumper SwitchToWeapon( "m40a3_mp" );
		}
	if( x > 49  )
		{
		acti GiveWeapon( "ak74u_mp" );
		jumper GiveWeapon( "ak74u_mp" );
		wait 0.01;
		acti SwitchToWeapon( "ak74u_mp" );
		jumper SwitchToWeapon( "ak74u_mp" );
		}

	wait 0.001;
	jumper FreezeControls(1);
	acti FreezeControls(1);
	acti SetPlayerAngles( starta.angles );
	acti SetOrigin( starta.origin );
	jumper SetPlayerAngles( startj.angles );
	jumper SetOrigin( startj.origin );
	
	wait 2;
	
	
	noti = SpawnStruct();
	noti.titleText = "^1!!!^7FINAL 1VS1 FIGHT^1!!!";
	noti.notifyText = acti.name + " ^1VS ^7" + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait 5;
	jumper FreezeControls(0);
	acti FreezeControls(0);
}

end_knife() 
{
	level.acti_enemy = undefined;
	acti = undefined;
	startj = getent("t_jump", "targetname");
	starta = getent("t_acti", "targetname");
	t = getent ("t_tele","targetname");

	while(1)
	{
		self waittill("trigger", who );
		if( getTeamPlayersAlive("axis") < 1 )
			return;
		if( getTeamPlayersAlive("allies") == 1 )
		{
			who thread knife_1v1();
			//self delete();
			break;
		}
		else if( getTeamPlayersAlive("allies") > 1 )
		{
			if( isDefined( level.acti_enemy ) && isAlive(level.acti_enemy) && level.acti_enemy != who )
			{
				who iprintlnbold("^1!!!1 VS 1!!!");
				who setorigin ( (t.origin) );
				who SetPlayerAngles( t.angles );
				
			}
			if( !isDefined(level.acti_enemy) || !isAlive(level.acti_enemy))
			{
				level.acti_enemy = who;
				who SetPlayerAngles( startj.angles );
				who SetOrigin( startj.origin );
				who SetMoveSpeedScale(1);
				who SetOrigin( startj.origin );
				who SetPlayerAngles( startj.angles );
				who FreezeControls(1);
				wait 0.001;
				who TakeAllWeapons();
				who GiveWeapon("tomahawk_mp");
				who SetSpawnWeapon("tomahawk_mp");
				acti = undefined;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
				{
					if( players[i].pers["team"] == "axis" )
					{
						players[i] SetOrigin( starta.origin );
						players[i] SetPlayerAngles( starta.angles );
						players[i] SetMoveSpeedScale(1);
						players[i] SetOrigin( starta.origin );
						players[i] SetPlayerAngles( starta.angles );
						players[i] FreezeControls(1);
						wait 0.001;
						players[i] TakeAllWeapons();
						players[i] GiveWeapon("tomahawk_mp");
						players[i] SetSpawnWeapon("tomahawk_mp");
					}
					if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
					{
					acti = players[i];
					break;
					}
				}
			
			

				noti = SpawnStruct();
				noti.titleText = "^7TOMAHAWK FIGHT";
				noti.notifyText = who.name + " ^1VS ^7" + acti.name;
				noti.duration = 5;
				noti.glowcolor = (1, 0.6, 0.3);
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			
				wait 5;
				who FreezeControls(0);
				acti FreezeControls(0);
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
	
	startj = getent("t_jump", "targetname");
	starta = getent("t_acti", "targetname");
	
	jumper SetPlayerAngles( startj.angles );
	jumper SetOrigin( startj.origin );
	jumper TakeAllWeapons();
	jumper GiveWeapon("tomahawk_mp");
	jumper SetSpawnWeapon("tomahawk_mp");
	jumper SetMoveSpeedScale(1);
	acti SetPlayerAngles( starta.angles );
	acti SetOrigin( starta.origin );
	acti TakeAllWeapons();
	acti GiveWeapon("tomahawk_mp");
	acti SetSpawnWeapon("tomahawk_mp");
	acti SetMoveSpeedScale(1);

	wait 0.001;
	jumper FreezeControls(1);
	acti FreezeControls(1);
	jumper SetPlayerAngles( startj.angles );
	jumper SetOrigin( startj.origin );
	acti SetPlayerAngles( starta.angles );
	acti SetOrigin( starta.origin );
	
	wait 2;
	
	
	noti = SpawnStruct();
	noti.titleText = "^1!!!^7FINAL 1VS1 FIGHT^1!!!";
	noti.notifyText = acti.name + " ^1VS^7 " + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1, 0.6, 0.3);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait 5;
	jumper FreezeControls(0);
	acti FreezeControls(0);
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
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
}


//////////////////////////////////////////////////////////////////////////////////