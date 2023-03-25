main()
{
	//maps\mp\mp_strike_fx::main();
	//maps\createart\mp_strike_art::main();
	maps\mp\_load::main();
	
	//aps\mp\_compass::setupMiniMap("compass_map_mp_strike");

	//setExpFog(500, 2700, .46, 0.49, 0.47, 0);
	//setExpFog(0, 7000, 168/255, 158/255, 135/255, 3.0);	
	ambientPlay("ambient_strike_day");
	//VisionSetNaked( "mp_strike" );

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1900");

	setdvar( "r_specularcolorscale", "1.86" );
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread lastdoor();
	thread welcomemsg ();
}

trap1 ()
	{
		trig_1 = getent("trig_1","targetname");
		brush1 = getent("brush1","targetname");
		trig_1 waittill("trigger");
		trig_1 delete ();
		while(1)
			{
			brush1 rotatepitch (360,7);
			wait 0.5;
			}
	}
	
trap2 ()
	{
	trig_2 = getent ("trig_2","targetname");
	brush2 = getent("brush2","targetname");
	killing = getent ("killing","targetname");
	trig_2 waittill("trigger");
	trig_2 delete ();
	killing enablelinkto();
	killing linkto (brush2);
	brush2 moveZ (76,0.5);
	wait 5 ;
	brush2 moveZ (-76,0.5);
	wait 5 ;
	}
	
trap3 ()
	{
		trig_3 = getent("trig_3","targetname");
		brush3 = getent("brush3","targetname");
		trig_3 waittill("trigger");
		trig_3 delete ();
		while(1)
			{
			brush3 rotateyaw (360,4);
			wait 0.5;
			}
	}
	
trap4 ()
{
	part1 = getentarray ("part1" ,"targetname");
	part2 = getentarray ("part2" ,"targetname");
	trig_4 = getent ("trig_4" , "targetname");

	trig_4 waittill ("trigger" , player );
	trig_4 delete ();

	part1[randomInt(part1.size)] notsolid();
	part2[randomInt(part2.size)] notsolid();
			
}

trap5 ()
{
	brush5 = getent ("brush5","targetname");
	orgi = getent (brush5.target,"targetname");
	trig_5 = getent ("trig_5","targetname");
	oldorigin = brush5.origin ;
	trig_5 waittill ("trigger",player);
	trig_5 delete ();
	brush5 moveto (orgi.origin , 1);
	wait 3 ;
	brush5 moveto (oldorigin,2);
}


trap6()
{
	door = getent ("brush6","targetname");
	kill = getent ("kill","targetname");
	trig_6 = getent ("trig_6","targetname");
	
	kill.origin = kill.origin - (0,0,10000); //deactivate kill trigger

	trig_6 waittill ("trigger");
	trig_6 delete ();
	
	kill.origin = kill.origin + (0,0,10000); //activate
	door MoveZ (-120,0.5);

	wait 5;

	kill.origin = kill.origin - (0,0,10000); //deactivate
	door MoveZ (120,0.5); // and open doors again
}

trap7 ()
{
	brush7 = getent ("brush7","targetname");
	trig_7 = getent ("trig_7","targetname");
	trig_7 waittill ("trigger");
	trig_7 delete ();
	while (1)
		{
		brush7 rotateyaw (360,randomfloat(4)+1);
		wait 6 ;
		}
}

trap8 ()
	{
	brush8 = getent ("brush8","targetname");
	while (1)
		{
		brush8 rotateroll (30,0.25);
		wait 0.25;
		brush8 rotateroll (-60,0.5);
		wait 0.5 ;
		brush8 rotateroll (30,0.25);
		wait 0.25;
		}
	}

lastdoor ()
	{
	door1 = getent ("dooropen","targetname");
	door2 = getent ("door1","targetname");
	door1 waittill ("trigger");
	door1 delete ();
	door2 moveZ (200,3);
	wait 0.5;
	}
	
welcomemsg ()
	{
	level waittill ("spawned",player);
	level endon ("disconnect");
	level endon ("joined_spectator");
	wait 5 ;
	player iprintlnbold ("^2 T^7his map was created by ^1 iNext,xfears ^7Script by ^0iNext,Mr-X");
	wait 0.2 ;
	player iprintlnbold ("^0Shotgun^7 Down");
	}