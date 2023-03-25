 main()
{
	
maps\mp\_load::main();


	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	thread jumper();
    thread rotate1();
    thread dest1();
    thread dest2();
    thread dest3();
	thread pad1();
	thread pad2();
	thread pad3();
	thread pad4();
	thread pad5();
	thread pad6();
	thread transporter();
	thread teleport();
	thread transporter1();
	thread transporter2();
	thread transporter3();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread transporter4();
	thread transporter5();
	thread teleport5();
	thread water();

	
}


jumper()
{
	jumpx = getent ("jump","targetname");
	glow = getent ("glow","targetname");
	air1 = getent ("air1","targetname");
	air2 = getent ("air2","targetname");
	air3 = getent ("air3","targetname");
	air4 = getent ("air4","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = 1;
	for(;;)
	{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 1;
			air moveto (air2.origin, time);
			wait .5;
			air moveto (air3.origin, time);
			wait .5;
			air moveto (air4.origin, time);
			wait 1;
			user unlink();
			wait 1;
		}
	}
}


rotate1()
{
   trig = getEnt ("rotatetrig" , "targetname");
   brush = getEnt ("rotate" ,"targetname" );
   trig waittill ("trigger",player);  
   trig delete ();  
  
   for( i = 0; i < 90; i++ )
	{
		brush rotatePitch( 360, 12 );
		wait 1;
	}
}


dest1()
{
	trig = getEnt( "dest1trig", "targetname" );
	brush = getEnt( "dest1", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-200, 20 );
	wait 0.01;
	brush moveY(-10000, 0.1 );
}


dest2()
{
	trig = getEnt( "dest2trig", "targetname" );
	brush = getEnt( "dest2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-200, 20 );
	wait 0.01;
	brush moveY(-10000, 0.1 );
}


dest3()
{
	trig = getEnt( "dest3trig", "targetname" );
	brush = getEnt( "dest3", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush moveZ(-200, 8 );
	wait 0.01;
	brush moveY(-10000, 0.1 );
}


pad1()
{
	trig = getEnt( "pad1trig", "targetname" );
	brush = getEnt( "pad1", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 1;
	brush moveZ(-200, 2 );
	wait 3;
	brush moveZ(200, 2 );
}

pad2()
{
	trig = getEnt( "pad2trig", "targetname" );
	brush = getEnt( "pad2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 1;
	brush moveZ(-200, 2 );
	wait 3;
	brush moveZ(200, 2 );
}

pad3()
{
	trig = getEnt( "pad3trig", "targetname" );
	brush = getEnt( "pad3", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 1;
	brush moveZ(-200, 3 );
	wait 3;
	brush moveZ(200, 3 );
}

pad4()
{
	trig = getEnt( "pad4trig", "targetname" );
	brush = getEnt( "pad4", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 1;
	brush moveZ(-200, 3 );
	wait 3;
	brush moveZ(200, 3 );
}


pad5()
{
	trig = getEnt( "pad5trig", "targetname" );
	brush = getEnt( "pad5", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 1;
	brush moveZ(-200, 3 );
	wait 3;
	brush moveZ(200, 3 );
}

pad6()
{
	trig = getEnt( "pad6trig", "targetname" );
	brush = getEnt( "pad6", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	wait 0.1;
	brush moveZ(-200, 3 );
	wait 3;
	brush moveZ(200, 3 );
}



teleport()
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
		wait 0.3;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.3;
    }
	
}


teleport1()
{
	entTransporter = getentarray( "enter1", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter1()
{
for(;;)
    {
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.3;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.3;
    }
	
}


teleport2()
{
	entTransporter = getentarray( "enter2", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter2()
{
for(;;)
    {
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.3;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.3;
    }
	
}


teleport3()
{
	entTransporter = getentarray( "enter3", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter3()
{
for(;;)
    {
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.3;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.3;
    }
	
}


teleport4()
{
	entTransporter = getentarray( "enter4", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter4()
{
for(;;)
    {
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.3;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.3;
    }
	
}


teleport5()
{
	entTransporter = getentarray( "enter5", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter5()
{
for(;;)
    {
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
		player iprintlnbold ("^1Fast!!!Kill him!");
    }
	
}



water()
{
	trig = getEnt( "trigger3", "targetname" );
	hurt = getEnt( "watertrig", "targetname" );
	brush1 = getEnt( "water", "targetname" );
	brush2 = getEnt( "water1", "targetname" );
						
	trig waittill( "trigger", who );
	trig waittill( "trigger", player );
	trig delete();
    iprintlnbold ("^5RUN!!!Toxic water coming!");
	hurt enablelinkto();
	hurt linkto (brush1);
		brush1 moveZ( 8000, 430 );
		brush2 moveZ( 8000, 430 );
}