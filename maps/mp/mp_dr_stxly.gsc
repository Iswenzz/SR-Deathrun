main()
{
	maps\mp\_load::main();
	game["allies"] = "marines"; 
	game["axis"] = "opfor"; 
	game["attackers"] = "axis"; 
	game["defenders"] = "allies"; 
	game["allies_soldiertype"] = "desert"; 
	game["axis_soldiertype"] = "desert";
	setdvar( "r_specularcolorscale", "1" ); 
	setdvar("compassmaxrange","1600"); 
	setdvar("r_glowbloomintensity0",".1"); 
	setdvar("r_glowbloomintensity1",".1"); 
	setdvar("r_glowskybleedintensity0",".1");
	
	thread tp();
	thread rotate();
	thread lazerwall();
	thread tube();
	
}

tp() 
{ 
	trigger_tp = getEnt("trigger_tp", "targetname"); 
	origin_tp = getEnt("origin_tp", "targetname"); 

	for (;;) 
	{ 
		trigger_tp waittill("trigger", player); 
		player setOrigin(origin_tp.origin); 
	} 
}

rotate()
{
	r1 = getEnt("rotate","targetname");
	
	for (;;)
	{
		r1 rotateYaw(360,5);
		wait 5;
	}
}

tube()
{
	toob = getEnt("tube","targetname");
	
	for(;;)
	{
		toob rotatePitch(28800, 240);
		wait 240;
	}
}

lazerwall()
{	
	lazerwall = getEnt("lazerwall","targetname");
	lazerwallpwnd = getEnt("lazerwallpwnd","targetname"); 
	lazerwallpwnd enablelinkto();
	lazerwallpwnd linkto(lazerwall);
	
	for (;;)
	{	
		lazerwall moveY(640,1.5);
		wait 1.5;
		lazerwall moveY(-640,1.5);
		wait 1.5;
	}	
}
		


/*startdoor()
{
	startdoor = getEnt("startdoor","targetname");
	{
		wait 12;
		startdoor moveZ(-169, 1);
		iprintlnbold("^8Start Door Opened.");
	}
}

StartMessage()
{
	wait 8;
	iprintlnbold("^2Sale merde tu vas te fail");
}

rum()
{ 
	trigger_rum1 = getEnt("trigger_rum1", "targetname"); 
	origin_ruum1 = getEnt("origin_ruum1", "targetname"); 

	for (;;) 
	{ 
		trigger_rum1 waittill("trigger", player); 
		player setOrigin(origin_ruum1.origin); 
	} 
}


s()
{	
	s1 = getent("s1","targetname");
	s2 = getent("s2","targetname");
	s3 = getent("s3","targetname");
	s4 = getent("s4","targetname");
	s5 = getent("s5","targetname");
	s6 = getent("s6","targetname");
	s7 = getent("s7","targetname");
	p1 = getent("p1","targetname");
	p2 = getent("p2","targetname");
	p3 = getent("p3","targetname");
	p4 = getent("p4","targetname");
	
	wait 10;
	s1 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s2 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s3 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s4 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s5 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s6 moveZ(500, 1.5, 0, 0.5);
	wait 0.2;
	s7 moveZ(500, 1.5, 0, 0.5);
	wait 0.4;
	p1 moveZ(500, 1.5, 0, 0.5);
	p1 rotatepitch(360, 1.5);
	wait 0.7;
	p2 moveZ(500, 1.5, 0, 0.5);
	p2 rotatepitch(-360, 1.5);
	wait 0.7;
	p3 moveZ(500, 1.5, 0, 0.5);
	p3 rotatepitch(360, 1.5);
	wait 0.7;
	p4 moveZ(500, 1.5, 0, 0.5);
	p4 rotatepitch(-360, 1.5);
}
*/
	