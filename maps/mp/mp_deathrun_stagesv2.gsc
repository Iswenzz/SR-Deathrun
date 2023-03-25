#include maps\mp\_utility;

main()
{
	level._effect["startfx"] = loadfx( "stagesv2/startfx" );

	precacheitem("ak47_mp");
	precacheitem("deserteagle_mp");
	precacheitem("remington700_mp");
	precacheitem("ak74u_mp");
	precacheitem("m4_mp");
	precacheitem("mp5_mp");
	precacheitem("usp_mp");
	precacheitem("rpg_mp");

	precacheMenu("stagesv2_music");

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

	level.traptrigmsg = "Press [&&1] To Activate";

	thread teleporters();
	thread afterroundstarts();
	thread wall_bouncer();
	thread platform_bouncer();
	thread roomselection();
	thread musicmenu();

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5auto_start();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8auto_start();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();

	thread targetshooting_room();
	thread sniper_room();
	thread knife_room();
	thread strafe_room();
	thread gap_room();
	thread weapons_room();
	thread rpg_room();
	thread bounce_room();

	for(i=1;i<16;i++)
		addTriggerToList("trap"+i+"trig");


}

addTriggerToList( name ) 
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name , "targetname" );
}

teleporters()
{       
 	entTransporter = getentarray( "teleporters", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	if(self.classname == "trigger_use_touch")
		self sethintstring(">> ^5Press ^1[^7&&1^1] ^5To Teleport ^7 <<");

	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.01;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.01;
	}
}

afterroundstarts()
{
	level waittill("round_started");
	PlayFX(level._effect["startfx"],(0, 0, 280));
	thread globalmsgs();
	thread randommusic();
	wait 7;
	thread startdoors();
}

globalmsgs()
{
	level endon("game over");

	msgs = [];
	msgs[0] = color()+">> "+color()+"Map made by VC' Legend";
	msgs[1] = color()+">> "+color()+"Tested by VC' Fox";
	msgs[2] = color()+">> "+color()+"Credits to VC' Fox, VC' Blade for the music menu";
	msgs[3] = color()+">> "+color()+"Discord: Legend#9805";
	for(;;)
	{
		x = randomint(4);
		iprintln(msgs[x]);
		wait 10;
	}
}

color()
{
	x = randomint(9);
	switch(x)
	{
		case 0:
		return "^1";
		case 1:
		return "^2";
		case 2:
		return "^3";
		case 3:
		return "^4";
		case 4:
		return "^5";
		case 5:
		return "^6";
		case 6:
		return "^7";
		case 7:
		return "^8";
		case 8:
		return "^9";
	}
}

startdoors()
{
	door_b = getEnt("blue_door","targetname");
	door_r = getEnt("red_door","targetname");
	door_y = getEnt("yellow_door","targetname");
	door_g = getEnt("green_door","targetname");
	
	door_b movex(48, 3,1,2);
	door_r movey(48, 3,1,2);
	door_y movey(-48, 3,1,2);
	door_g movex(-48, 3,1,2);
}

musicmenu()
{
	level endon("randommusic");

	trig = getEnt("music_menu","targetname");
	//trig setHintString("Press [^2&&1^7] ^7to Select Music");

	trig waittill("trigger",who);
	who thread onmenuresponse();
	who openMenu("stagesv2_music");
	trig delete();
}

onmenuresponse()
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse",menu,response);

		if(menu == "stagesv2_music")
		{
			switch(response)
			{
				case "0":
					thread play_ambient_song(0,"Ava Max - Sweet But Psycho (SixCap Remix) (Hardstyle)");
					break;
				case "1":
					thread play_ambient_song(1,"Blasterjaxx & Bassjackers - Switch");
					break;
				case "2":
					thread play_ambient_song(2,"Calvin Harris & R3hab - Burnin");
					break;
				case "3":
					thread play_ambient_song(3,"Firebeatz & DubVision ft. Ruby Prophet - Invincible");
					break;
				case "4":
					thread play_ambient_song(4,"R3HAB & Skytech - Everything");
					break;
				case "5":
					thread play_ambient_song(5,"Sick Individuals - Alive (Tom & Jame 2018 Bootleg)");
					break;
			}
		}
	}
}

play_ambient_song(song,name)
{
	self closeingamemenu();
	self closeMenu();

	ambientStop();
	musicStop();

	switch(song)
	{
		case 0:	
			ambientPlay("music1");	
			break;
		case 1:	
			ambientPlay("music2");	
			break;
		case 2:	
			ambientPlay("music3");	
			break;
		case 3:	
			ambientPlay("music4");	
			break;
		case 4:	
			ambientPlay("music5");	
			break;
		case 5:	
			ambientPlay("music6");	
			break;
	}

	level notify("musicwaschosen");
	thread now_playing(name);
}

now_playing(name)
{
	level.nowplaying = newHudElem();
	level.nowplaying.x = 0;
	level.nowplaying.y = -5;
	level.nowplaying.horzAlign = "center";	
	level.nowplaying.vertAlign = "bottom";
	level.nowplaying.alignX = "center"; 
	level.nowplaying.alignY = "bottom"; 
	level.nowplaying.archived = false;
	level.nowplaying.alpha = 0;
	level.nowplaying.fontScale = 1.5;
	level.nowplaying.hidewheninmenu = true;
	level.nowplaying.glowAlpha = 0;
	level.nowplaying.label = &"Music: ^2";
	level.nowplaying settext(name);

	if(isdefined(level.randomcolor))
		level.nowplaying.glowcolor=level.randomcolor;
	else 
		level.nowplaying.glowcolor = (1,1,0);

	level.nowplaying fadeovertime(.5);
	wait .5;
	level.nowplaying.alpha = 1;
	wait 8;
	level.nowplaying fadeovertime(.5);
	wait .5;
	level.nowplaying.alpha = 0;
}

randommusic()
{
	level endon("musicwaschosen");

	wait 12;
	level notify("randommusic");

	rnd = RandomInt(6);

	switch(rnd)
	{
		case 0:
			thread play_ambient_song(0,"Ava Max - Sweet But Psycho (SixCap Remix) (Hardstyle)");
			break;
		case 1:
			thread play_ambient_song(1,"Blasterjaxx & Bassjackers - Switch");
			break;
		case 2:
			thread play_ambient_song(2,"Calvin Harris & R3hab - Burnin");
			break;
		case 3:
			thread play_ambient_song(3,"Firebeatz & DubVision ft. Ruby Prophet - Invincible");
			break;
		case 4:
			thread play_ambient_song(4,"R3HAB & Skytech - Everything");
			break;
		case 5:
			thread play_ambient_song(5,"Sick Individuals - Alive (Tom & Jame 2018 Bootleg)");
			break;
	}
}

wall_bouncer()
{
	trig = getEnt("wall_bouncer","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		for(i=0;i<5;i++)
		{
		player.health += 1000;
		player finishPlayerDamage(player, player, 1000, 0, "MOD_UNKNOWN", "bounce", player.origin, (0,1,0) , "none", 0);
		}

		while(player isTouching(trig))
			wait 0.01;

	}
}

platform_bouncer()
{
	trig = getEnt("platform_bouncer","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		for(i=0;i<9;i++)
		{
		player.health += 1000;
		player finishPlayerDamage(player, player, 1000, 0, "MOD_UNKNOWN", "bounce", player.origin, (0,0,90) , "none", 0);
		}

		while(player isTouching(trig))
			wait 0.01;

	}
}

trap1()
{
	pillars = getentarray("t1pillars","targetname");
	trig = getEnt("trap1trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	for(i=0;i<pillars.size;i++)
		pillars[i] rotateroll(360,2);
}

trap2()
{
	bounce = getEnt("t2bounce","targetname");
	trig = getEnt("trap2trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	x = randomint(3);
	switch(x)
	{
		case 0:
		bounce hide();
		wait 2;
		bounce show();
		break;

		case 1:
		bounce notsolid();
		wait 2;
		bounce solid();
		break;

		case 2:
		bounce hide();
		bounce notsolid();
		wait 2;
		bounce show();
		bounce solid();
		break;
	}
}

trap3()
{
	circles = getentarray("t3circles","targetname");
	trig = getEnt("trap3trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	for(i=0;i<circles.size;i++)
		circles[i] thread trap3rotations();
}

trap3rotations()
{
	for(;;)
	{
		angle = RandomIntRange(180, 360);
		time = RandomFloatRange(0.5, 2.0);
		self rotateyaw(angle,time);
		wait time*1.5;
	}
}

trap4()
{
	plat = getEnt("t4plat","targetname");
	trig  = getEnt("trap4trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	if(randomint(2) == 0)
	{
		plat movez(-272,1);
		wait 3;
		plat movez(272,1);
	}
	else
	{
		thread trap4tper();
		wait 5;
		level.trap4tper delete();
	}
}

trap4tper()
{
	level.trap4tper = getEnt("trap4tper","targetname");
	pos = getEnt("tppos","targetname");
	while(isdefined(level.trap4tper))
	{
		level.trap4tper waittill("trigger",player);
		player setOrigin(pos.origin);
		wait 0.01;
	}
}

trap5auto_start()
{
	level endon("t5as_rot");
	roter = getEnt("t5as","targetname");
	for(;;)
	{
		roter rotateyaw(180,3);
		wait 3;
	}
}

trap5()
{
	roter = getEnt("t5as","targetname");
	trig = getEnt("trap5trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	level notify("t5as_rot");
	for(;;)
	{
		roter rotateyaw(-180,3);
		wait 3;
	}
}

trap6()
{
	platgroup1 = getEnt("pg1","targetname");
	platgroup2 = getEnt("pg2","targetname");
	trig = getEnt("trap6trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	for(;;)
	{
		time = RandomFloatRange(1.0, 3.0);
		platgroup1 movey(96,time);
		platgroup2 movey(-96,time);
		wait time*2;
		platgroup1 movey(-96,time);
		platgroup2 movey(96,time);
		wait time*2;
	}
}

trap7()
{
	spikes = getEnt("t7s","targetname");
	spikes notsolid();
	spikes hide();

	killtrig = getEnt("t7kt","targetname");
	killtrig maps\mp\_utility::triggerOff();

	trig = getEnt("trap7trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();

	spikes show();
	killtrig maps\mp\_utility::triggerOn();

	wait 3;

	spikes hide();
	killtrig delete();
}

trap8auto_start()
{
	plat = getEnt("t8as","targetname");
	orgpos = plat.origin;
	organg = plat.angles;

	pos = getEnt("t8as_moveto","targetname");
	for(;;)
	{
		plat moveto(pos.origin,3);
		plat rotateto(pos.angles,3);
		wait 4;
		plat moveto(orgpos,3);
		plat rotateto(organg,3);
		wait 5;
	}
}

trap8()
{
	plat = getEnt("t8as","targetname");
	trig = getEnt("trap8trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();

	plat notsolid();
	wait 6;
	plat solid();
}

trap9()
{
	level.trap9activ = false;
	trap9trigs = getentarray("trap9trigs","targetname");
	for(i=0;i<trap9trigs.size;i++)
		trap9trigs[i] thread jumppad();

	trig = getEnt("trap9trig","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	level.trap9activ = true;
	trig delete();
	wait RandomFloatRange(3.0, 6.0);
	level.trap9activ = false;
}

jumppad()
{
	for(;;)
	{
		self waittill("trigger",player);
		tempobj = spawn("script_model",player.origin);
		player linkto(tempobj);
		tempobj thread placemover(player,tempobj);

		while(player isTouching(self))
			wait 0.01;
	}
}

placemover(jumper,org)
{
	pos1 = getEnt("jpp1","targetname");
	pos2 = getEnt("jpp2","targetname");
	trappos = getEnt("trappos","targetname");

	self moveto(pos1.origin,1);
	wait 1.5;

	if(level.trap9activ == false)
		self moveto(pos2.origin,1);
	else
	{
		self moveto(trappos.origin,1);
		jumper iprintlnbold("better luck next time, trap was activ");
	}

	wait 1.5;
	jumper unlink();
	org delete();
}

trap10()
{
	trig = getEnt("trap10trig","targetname");
	plat = getEnt("trap10plat","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	plat movez(-208,2);
	wait 5;
	plat movez(208,2);
}

trap11()
{
	trig = getEnt("trap11trig","targetname");
	wall = getEnt("trap11wall","targetname");
	killtrig = getEnt("trap11killtrig","targetname");
	killtrig enablelinkto();
	killtrig linkto(wall);
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	wall movez(-32,1);
	wait 3;
	wall movez(32,2);
}

trap12()
{
	trig = getEnt("trap12trig","targetname");
	plats = getEnt("trap12plats","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();	
	plats thread trap12moves();
}

trap12moves()
{
	for(;;)
	{
		if(randomint(2) == 0)
		{
			self rotateyaw(180,2);
			wait 4;
		}
		else
		{
			self rotateroll(180,2);
			wait 4;
		}
		wait 1;
	}
}

trap13()
{
	trig = getEnt("trap13trig","targetname");
	plat = getEnt("trap13plat","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	plat notsolid();
	wait 3;
	plat solid();
}

trap14()
{
	trig = getEnt("trap14trig","targetname");
	wall1 = getEnt("t14w1","targetname");
	wall2 = getEnt("t14w2","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	wall1 movex(-248,1);
	wall2 movex(248,1);
	wait 4;
	wall1 delete();
	wall2 delete();
}

trap15()
{
	trig = getEnt("trap15trig","targetname");
	plat = getEnt("t15plat","targetname");
	trig sethintstring(level.traptrigmsg);
	trig waittill("trigger",player);
	trig delete();
	plat hide();
	plat notsolid();
	wait 5;
	plat show();
	plat solid();
}

roomselection()
{
	trig = getEnt("roomselection","targetname");
	trig sethintstring("Press ^1[^7&&1^1]^7 To Enter Room Selection");
	spot = getent("selectionspot","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setOrigin(spot.origin);

		while(isdefined(player) && isalive(player) && player.sessionstate == "playing")
			wait 0.01;
	}
}

targetshooting_room()
{
	trig = getEnt("targetshooting_trig","targetname");
	trig sethintstring("^1>>^7 Target Shooting Room^1 <<");
	jumperspot = getEnt("tsjs","targetname");
	actispot = getEnt("tsas","targetname");
	door = getent("targetshotdoor","targetname");
	door_orgpos = door.origin;
	thread targets_setup();
	for(;;)
	{
		trig waittill("trigger",player);

		if(door.origin != door_orgpos)
			door moveto(door_orgpos,0.1);

		player setOrigin(jumperspot.origin);
		player setplayerangles(jumperspot.angles);
		level.activ setOrigin(actispot.origin);
		level.activ setplayerangles(actispot.angles);

		player takeallweapons();
		level.activ takeallweapons();

		player giveweapon("ak47_mp");
		level.activ giveweapon("ak47_mp");
		player switchtoweapon("ak47_mp");
		level.activ switchtoweapon("ak47_mp");
		player givemaxammo("ak47_mp");
		level.activ givemaxammo("ak47_mp");

		player.targetpoints = 0;
		player.shottarget = false;
		level.activ.targetpoints = 0;
		level.activ.shottarget = false;

		player setperk( "specialty_fastreload" );
		level.activ setperk( "specialty_fastreload" );

		level.tsplayer = player;

		wait 3;
		player iprintlnbold("Get Ready!");
		level.activ iprintlnbold("Get Ready!");
		wait 1;
		player iprintlnbold("Set!");
		level.activ iprintlnbold("Set!");
		wait 1;
		player iprintlnbold("Start!");
		level.activ iprintlnbold("Start!");

		level notify("minigamestarted");

		level waittill("allroundsdone");

		if(player.targetpoints > level.activ.targetpoints)
		{
			level.activ freezeControls(true);
			iprintlnbold(player.name+" Won");
			iprintlnbold(player.targetpoints+":"+level.activ.targetpoints);
			door movez(80,2);
		}
		if(player.targetpoints < level.activ.targetpoints)
		{
			player freezeControls(true);
			iprintlnbold(level.activ.name+" Won");
			iprintlnbold(level.activ.targetpoints+":"+player.targetpoints);
			door movez(80,2);

		}
		if(player.targetpoints == level.activ.targetpoints || level.activ.targetpoints == player.targetpoints)
		{
			iprintlnbold(player.targetpoints+":"+level.activ.targetpoints);
			iprintlnbold("Tie, knife it out!");
			player takeallweapons();
			level.activ takeallweapons();
			player giveweapon("knife_mp");
			level.activ giveweapon("knife_mp");
			player switchtoweapon("knife_mp");
			level.activ switchtoweapon("knife_mp");
			door movez(80,2);
		}

		level.tsplayer = undefined;
	}
}

targets_setup()
{
	level.canshottarget = false;
	obj = getentarray("target_obj","targetname");
	trig = getentarray("target_trig","targetname");
	for(i=0;i<obj.size;i++)
	{
		trig[i] enablelinkto();
		trig[i] linkto(obj[i]);
		trig[i] thread points();
	}
	for(;;)
	{
		level waittill("minigamestarted");
		rounds = RandomIntRange( 5, 30 );

		for(i=0;i<rounds;i++)
		{
			x = randomint(12);
			time = RandomFloatRange(0.5, 0.7);

			obj[x] rotatepitch(-90,time);
			obj[x] waittill("rotatedone");
			level.canshottarget = true;

			wait time/2;

			level.canshottarget = false;
			obj[x] rotatepitch(90,time);
			obj[x] waittill("rotatedone");

			level.tsplayer.shottarget = false;
			level.activ.shottarget = false;

			wait time*2;
		}

		level notify("allroundsdone");
	}
}

points()
{
	for(;;)
	{
		self waittill("trigger",who);
		if(level.canshottarget == true && who.shottarget == false)
		{
			who.targetpoints++;
			who.shottarget = true;
			who iprintlnbold("Points: "+who.targetpoints);
		}
	}
}

sniper_room()
{
	trig = getent("sniper_room_trig","targetname");
	trig sethintstring("^1>> ^7Sniper Room ^1<<");
	jumperss = getent("jsspot","targetname");
	actiss = getent("asspot","targetname");
	for(;;)
	{
		trig waittill("trigger",player);

		player takeallweapons();
		level.activ takeallweapons();

		player freezeControls(true);
		player setOrigin(jumperss.origin);
		player setplayerangles(jumperss.angles);
		level.activ freezeControls(true);
		level.activ setOrigin(actiss.origin);
		level.activ setplayerangles(actiss.angles);

		player giveweapon("remington700_mp");
		player givemaxammo("remington700_mp");
		player switchtoweapon("remington700_mp");
		level.activ giveweapon("remington700_mp");
		level.activ givemaxammo("remington700_mp");
		level.activ switchtoweapon("remington700_mp");

		//hud shit

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

knife_room()
{
	trig = getent("knife_room_trig","targetname");
	trig sethintstring("^1>> ^7Knife Room^1 <<");
	jumperks = getent("jkspot","targetname");
	actiks = getent("akspot","targetname");
	for(;;)
	{
		trig waittill("trigger",player);

		player takeallweapons();
		level.activ takeallweapons();
		
		player freezeControls(true);
		player setOrigin(jumperks.origin);
		player setplayerangles(jumperks.angles);
		level.activ freezeControls(true);
		level.activ setOrigin(actiks.origin);
		level.activ setplayerangles(actiks.angles);

		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		//hud shit

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

strafe_room()
{
	trig = getent("strafe_room_trig","targetname");
	trig sethintstring("^1>> ^7Strafe Room ^1<<");
	jumperks = getent("jstrafespot","targetname");
	actiks = getent("astragespot","targetname");
	thread strafer_endtrig();
	for(;;)
	{
		trig waittill("trigger",player);

		player takeallweapons();
		level.activ takeallweapons();
		
		player freezeControls(true);
		player setOrigin(jumperks.origin);
		player setplayerangles(jumperks.angles);
		level.activ freezeControls(true);
		level.activ setOrigin(actiks.origin);
		level.activ setplayerangles(actiks.angles);

		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		//hud shit

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

strafer_endtrig()
{
	trig = getEnt("strafer_endtrig_jumper","targetname");
	jspot = getEnt("strafespotend1","targetname");
	aspot = getEnt("strafespotend2","targetname");
	{
		for(;;)
		{
			trig waittill("trigger",player);

			if(player == player)
				level.activ freezeControls(true);
			if(player == level.activ)
				player freezeControls(true);
				
			player setOrigin(jspot.origin);
			level.activ setOrigin(aspot.origin);

			wait 1;
		}
	}
}

gap_room()
{
	trig = getEnt("gap_room_trig","targetname");
	trig sethintstring("^1>> ^7Gap Room ^1<<");
	spot1 = getEnt("gapacti","targetname");
	spot2 = getEnt("gapplayer","targetname");
	thread gap_failtrig();
	thread gap_endweapon();
	for(;;)
	{
		trig waittill("trigger",player);
		level.gapweapontrig maps\mp\_utility::triggerOn();
		player freezeControls(true);
		player setOrigin(spot2.origin);
		player setplayerangles(spot2.angles);
		level.activ freezeControls(true);
		level.activ setOrigin(spot1.origin);
		level.activ setplayerangles(spot1.angles);

		player takeallweapons();
		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");
		level.activ takeallweapons();
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		//hud shit

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}

}

gap_failtrig()
{
	trig = getEnt("gap_failtrig","targetname");
	spot1 = getEnt("gapacti","targetname");
	spot2 = getEnt("gapplayer","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{
			player setOrigin(spot2.origin);
			player setplayerangles(spot2.angles);
		}
		if(player == level.activ)
		{
			level.activ setOrigin(spot1.origin);
			level.activ setplayerangles(spot1.angles);
		}
	}

}

gap_endweapon()
{
	weapons = [];
	weapons[0] = "ak47_mp";
	weapons[1] = "deserteagle_mp";
	weapons[2] = "remington700_mp";
	level.gapweapontrig = getEnt("gap_endweapon_trig","targetname");
	for(;;)
	{
		level.gapweapontrig waittill("trigger",player);
		iprintlnbold(player.name+" Finished Gaps First");
		x = randomint(3);
		player giveweapon(weapons[x]);
		player switchtoweapon(weapons[x]);
		player givemaxammo(weapons[x]);
		level.gapweapontrig maps\mp\_utility::triggerOff();
	}
}

weapons_room()
{
	trig = getEnt("weapons_room_trig","targetname");
	trig sethintstring("^1>> ^7Random Weapons Room ^1<<");
	spot1 = getEnt("jsspot","targetname");
	spot2 = getEnt("asspot","targetname");
	weapons = [];
	weapons[0] = "ak47_mp";
	weapons[1] = "deserteagle_mp";
	weapons[2] = "remington700_mp";
	weapons[3] = "ak74u_mp";
	weapons[4] = "m4_mp";
	weapons[5] = "mp5_mp";
	weapons[6] = "usp_mp";
	for(;;)
	{
		trig waittill("trigger",player);
		x = randomint(7);

		player takeallweapons();
		level.activ takeallweapons();

		player giveweapon(weapons[x]);
		player switchtoweapon(weapons[x]);
		player givemaxammo(weapons[x]);
		level.activ giveweapon(weapons[x]);
		level.activ switchtoweapon(weapons[x]);
		level.activ givemaxammo(weapons[x]);
		
		player freezeControls(true);
		player setOrigin(spot1.origin);
		player setplayerangles(spot1.angles);
		level.activ freezeControls(true);
		level.activ setOrigin(spot2.origin);
		level.activ setplayerangles(spot2.angles);

		wait 5;

		//hud shit

		player freezeControls(false);
		level.activ freezeControls(false);
	}

}

rpg_room()
{
	jumperspot = getentarray("rpg_jumper","targetname");
	actispot = getentarray("rpg_acti","targetname");
	trig = getent("rpg_room_trig","targetname");
	trig sethintstring("^1>> ^7RPG Room ^1<<");
	thread rpg_room_bouncers();
	for(;;)
	{
		trig waittill("trigger",player);

		js = randomint(3);
		as = randomint(3);

		player takeallweapons();
		level.activ takeallweapons();
		player freezeControls(true);
		level.activ freezeControls(true);

		player giveweapon("rpg_mp");
		player givemaxammo("rpg_mp");
		player switchtoweapon("rpg_mp");
		level.activ giveweapon("rpg_mp");
		level.activ givemaxammo("rpg_mp");
		level.activ switchtoweapon("rpg_mp");

		player setOrigin(jumperspot[js].origin);
		player setplayerangles(jumperspot[js].angles);
		level.activ setOrigin(actispot[as].origin);
		level.activ setplayerangles(actispot[as].angles);

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}

}

rpg_room_bouncers()
{
	trig = getEnt("rpg_room_bouncers","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		for(i=0;i<4;i++)
		{
		player.health += 1000;
		player finishPlayerDamage(player, player, 1000, 0, "MOD_UNKNOWN", "bounce", player.origin, (0,0,90) , "none", 0);
		}

		while(player isTouching(trig))
			wait 0.01;

	}
}

bounce_room()
{
	trig = getEnt("bounce_room_trig","targetname");
	trig sethintstring("^1>> ^7Bounce Room ^1<<");
	jumperspots = getentarray("jumperspots_bounce","targetname");
	actispots = getentarray("actispots_bounce","targetname");
	thread bounce_failtrig();
	thread bounce_endsniper();
	for(;;)
	{
		trig waittill("trigger",player);
		x =randomint(3);
		player freezeControls(true);
		player takeallweapons();
		player setOrigin(jumperspots[x].origin);
		player setplayerangles(jumperspots[x].angles);
		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");

		level.activ freezeControls(true);
		level.activ takeallweapons();
		level.activ setOrigin(actispots[x].origin);
		level.activ setplayerangles(actispots[x].angles);
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		wait 5;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

bounce_failtrig()
{
	trig = getent("bounce_failtrig","targetname");
	jumperspots = getentarray("jumperspots_bounce","targetname");
	actispots = getentarray("actispots_bounce","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		x =randomint(3);
		if(player == player)
		{
			player setOrigin(jumperspots[x].origin);
			player setplayerangles(jumperspots[x].angles);
		}
		if(player == level.activ)
		{
			level.activ setOrigin(actispots[x].origin);
			level.activ setplayerangles(actispots[x].angles);
		}
	}
}

bounce_endsniper()
{
	trig = getent("bounce_endsniper","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player takeallweapons();
		player giveweapon("remington700_mp");
		player switchtoweapon("remington700_mp");
		player givemaxammo("remington700_mp");
	}
}