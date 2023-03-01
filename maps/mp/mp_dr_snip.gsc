 main()
{
	maps\mp\_load::main();



	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	trig = spawn("trigger_radius",(-155,-1059,44),0,150,250);
	trig.radius = 150;
	trig.targetname = "endmap_trig";

	thread end_sr();

	thread trap_3();
	thread pickaxe();
	thread togglespeed();
	thread joker();
	thread freezing();
	thread togglespeed1();
	thread togglespeed2();
    precacheItem( "usp_silencer_mp" );
	precacheItem( "remington700_mp");
	thread togglespeed3();
	thread gravity();
	thread bold();
	thread gravity2();
	thread trap8();
	thread pickaxe1();
	thread teleport();
	thread transporter();
	thread jumper();

	
}

end_sr()
{
	t1 = spawn("trigger_radius",(-401,933,492-40),0,100,200);
	t1 thread endmap();
}

endmap()
{
	while(1)
	{
		self waittill("trigger",player);

		if(player.pers["team"] == "axis")
    		continue;

		if(isDefined(player.already_check) && player.already_check)
			continue;

		if(!player sr\api\_deathrun::order())
			player thread endmap_sefe();
        else
        {
        	player.already_check = true;
        	player thread already_check_reset();
        }
	}
}

endmap_sefe()
{
	self endon("death");
	self endon("disconnect");

	self freezeControls(1);
	self setOrigin((-678,1157,492));
	wait 0.05;
	self freezeControls(0);
}

already_check_reset()
{
	self endon("disconnect");
	self waittill("death");

	self.already_check = undefined;
}
 
 joker()
{
	trig = getEnt( "joker", "targetname" );


	trig waittill( "trigger", player );
	
	players = getentarray("player","classname");
	for(i=0;i<players.size;i++)
		players[i] PlayLocalSound("joker");
	iprintlnbold ("^1Escape from the acti! ^5Acti CAN´T SHOOT IN FREE!");

}

trap_3()
{
	trig = getEnt( "trigger3", "targetname" );
	brush1 = getEnt( "block1", "targetname" );
	brush2 = getEnt( "block2", "targetname" );
	brush3 = getEnt( "block3", "targetname" );
	brush4 = getEnt( "block4", "targetname" );
	brush5 = getEnt( "block5", "targetname" );
	brush6 = getEnt( "block6", "targetname" );
						
	trig waittill( "trigger", who );
	trig waittill( "trigger", player );
	trig delete();
	player iprintlnbold ("^1Camera detects your movements");
	
	while(1)
	{
		brush1 moveX( -200, 1 );
		brush2 moveX( -200, 1 );
		brush3 moveX( -200, 1 );
		brush4 moveX( 200, 1 );
		brush5 moveX( 200, 1 );
		brush6 moveX( 200, 1 );
		wait 1;
		brush1 moveX( 200, 1 );
		brush2 moveX( 200, 1 );
		brush3 moveX( 200, 1 );
		brush4 moveX( -200, 1 );
		brush5 moveX( -200, 1 );
		brush6 moveX( -200, 1 );
		wait 1;
	}
}
pickaxe()
{
	trig = getEnt("weap", "targetname");
	trig waittill( "trigger", player);
    players = getentarray("player","classname");	
	for(i=0;i<players.size;i++)
	    {
	      		players[i] TakeAllWeapons();
				players[i] GiveWeapon("usp_silencer_mp");
				wait 0.01;
				players[i] SwitchToWeapon("usp_silencer_mp");
		}
}


togglespeed()
{
	trig = getEnt( "speed", "targetname" );

	trig waittill( "trigger", player);
	trig delete();
	
	player setMoveSpeedScale(1.5);
}

freezing()
{
	trig = getEnt("freeze", "targetname");
	prop1 = getent ("prop1" ,"targetname" );
	prop2 = getent ("prop2" ,"targetname" );
	trig waittill("trigger", player);
	trig delete();
		player iprintlnbold("^5 You are freeze now!");
	player freezeControls( true );
	prop1 moveZ (-20 , 2);
	prop2 moveZ (-20 , 2);
	wait 2.1;
	prop1 moveY (100 , 2);
	prop2 moveY (-100 , 2);
	wait 5;
	player freezeControls( false );
	prop1 moveY (-100 , 2);
	prop2 moveY (100 , 2);
	wait 2.1;
	prop1 moveZ (20 , 2);
	prop2 moveZ (20 , 2);
		

	
	

}


togglespeed1()
{
	trig = getEnt( "speed2", "targetname" );

	trig waittill( "trigger", player);
		
	player setMoveSpeedScale(0.1);
}

togglespeed2()
{
	trig = getEnt( "speed1", "targetname" );
	

	trig waittill( "trigger", player);
		
	player setMoveSpeedScale(1.1);
}

togglespeed3()
{
	trig = getEnt( "speed8", "targetname" );

	trig waittill( "trigger", player);
		
	player setMoveSpeedScale(1.4);
	iprintlnbold ("^1" + " " + "^1"+ player.name + " "+ "^5escaped activator^1!!^5Now ^1KILL ^5him!");
}

gravity2()
{
	trig = getEnt( "pes", "targetname" );

	trig waittill( "trigger", player);
	iprintlnbold ("^5" + " " + "^1"+ player.name + " "+ "^5discover the ^8TURBO boost!");
	wait 3;
    player iprintlnbold ("^8Ready for TURBO! ");
	wait 3;
	player iprintlnbold ("^5 3 ");
	wait 1;
	player iprintlnbold ("^1 2 ");
	wait 1;
	player iprintlnbold ("^5 1 ");
	wait 1;
	player iprintlnbold ("^1 TURBOOOOOOOO.... ");
	player setMoveSpeedScale(8);
	wait 1;
	player iprintlnbold ("^5 3 ");
	wait 1;
	player iprintlnbold ("^5 2 ");
	wait 1;
	player iprintlnbold ("^5 1 ");
	wait 1;
	player iprintlnbold ("^5 Speed set to normal... ");
	player setMoveSpeedScale(1);
	
}

gravity()
{
	trig = getEnt( "gravity", "targetname" );

	trig waittill( "trigger", player);
	setDvar( "g_gravity", 300 );
	iprintlnbold ("^1OMG ^2YOU ^3DISCOVER ^4THE ^5LADDER ^6WITH ^7SMALL ^8GRAVITY! ");	

}

bold()
{
	trig = getEnt( "bold", "targetname" );
	

	trig waittill( "trigger", player);
    player.maxhealth = 500;
	player.health = player.maxhealth;
	player iprintlnbold ("^8Do NOT FREERUN! You can´t shoot in free run! ");	

}





trap8()
{
	trig = getEnt( "trap8trigger", "targetname" );
	brush = getEnt( "trap8", "targetname" );
	trig waittill( "trigger", player);

	trig waittill( "trigger", who );
	trig delete();

	brush moveX( -8000, 20 );
	player iprintlnbold ("^1Death machine detects your movements");

}

pickaxe1()
{
	trig = getEnt("weap1", "targetname");
	trig waittill( "trigger", player);
	    {
	      		player TakeAllWeapons();
				player GiveWeapon("remington700_mp");
				wait 0.01;
				player SwitchToWeapon("remington700_mp");
		}
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

