main()
{
     maps\mp\_load::main();
	 
	 //LOADFX\\
	 
	 game["allies"] = "sas";
	 game["axis"] = "opfor";
	 game["attackers"] = "axis";
	 game["defenders"] = "allies";
	 game["allies_soldiertype"] = "woodland";
	 game["axis_soldiertype"] = "woodland";

	 //DVARS\\
	 
	 //PRECACHE\\
	 game["menu_route_1"] = "route_1";
     precacheMenu(game["menu_route_1"]);
	 
	 //THREADS\\
	 thread lift_1();
	 
}

//GAMESTUFF\\
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

gettrigger(trigname, hint)
{
trig = getent(trigname, "targetname");
trig setHintString( hint );
trig waittill("trigger", player);
trig setHintString("^1Activated");
}

lift_1()//route 3
{
    brush1 = getent("lift_1", "targetname");
	brush2 = getent("lift_1_a", "targetname");
	trig = getent("lift_1_trig", "targetname");
	
	trig waittill("trigger");
	trig delete();
	while(1)
	{
	    brush1 movex(1168,3.5,0.4,0.4);
	    brush2 movex(1168,3.5,0.4,0.4);
		brush1 waittill("movedone");
		wait 0.2;
		brush1 movez(-128,1,0.3,0.2);
		brush1 waittill("movedone");
		wait 1.5;
		brush1 movez(128,1,0.3,0.2);
		brush1 waittill("movedone");
		wait 0.2;
		brush1 movex(-1168,3.5,0.4,0.4);
	    brush2 movex(-1168,3.5,0.4,0.4);
		brush1 waittill("movedone");
		wait 3;
	}
}
	


//TRAPS\\
//ROUTE1\\
//ROUTE2\\
//ROUTE3\\
//ROUTE4\\
//ROUTE5\\
//ROUTE6\\

//ENDROOMS\\