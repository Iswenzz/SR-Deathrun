main()
{
 maps\mp\_load::main();

 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
 thread messages();
 thread startdoor();
 thread music();
 thread music_tele();
 thread music_tele2();
}
messages()
{
	wait 6;
	iprintlnBold("^1Welcome to MANILA!");
	wait 1;
}

startdoor()
{
	door = getEnt("startDoor","targetname");
	{
	wait 10;
	door moveZ(250,5)
	iprintlnBold("^2Door has opened!");
	wait 2;	
	}

}
music()
{
    level waittill( "round_started" );
    
    wait 1;
    
    ambientPlay( "song1" );
}

music_tele()
{
	trig = getEnt ("music_tele_start", "targetname");
	end = getEnt ("music_tele_end", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
		player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}

music_tele2()
{
	trig = getEnt ("music_tele_start_2", "targetname");
	end = getEnt ("music_tele_end", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}