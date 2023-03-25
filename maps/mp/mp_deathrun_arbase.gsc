//Dr. Uzi Helped (Undefinedno1)
main()
{
	maps\mp\_load::main();
	maps\mp\_teleport::main();
	ambientPlay("ambient_middleeast_ext");
	
	thread start();
	thread traps();
	thread ending();
	thread msg();
	thread portal();
	thread lift();
	thread addtrapstofreerun();
	
		precacheItem( "remington700_mp" );
		precacheItem( "uzi_mp" );
		
	    level.trig = GetEnt("teletrigger", "targetname");
    thread TeleportTrigger();
	level.trig waittill("trigger");
}
start()
{
	obj = getent("start","targetname");
	wait 2;
	obj movez(-250, 3);
	obj waittill("movedone");
	obj delete();
}
traps()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
}
trap1()
{
	trig = getent("trap1acti", "targetname");
	obj1 = getent("trap_1","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 1 ^2Activated");
	while(1)
	{
    obj1 movez(-90,1);
	obj1 waittill("movedone");
	obj1 movez(90,1);
	obj1 waittill("movedone");
	}
}

trap2()
{
	trig = getent("trap2acti", "targetname");
	obj = getent("trap22","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 2 ^2Activated");
	obj movey(-400, 1);
	obj waittill("movedone");
	obj delete();

}

trap3()
{
	trig = getent("trap3acti", "targetname");
	obj1 = getent("trap3_1","targetname");
	obj2 = getent("trap3_2","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 3 ^2Activated");
	obj1 movez(-50, 3);
	obj2 movez(50, 3);
	obj1 waittill("movedone");
	obj2 waittill("movedone");
	obj1 movez(50, 5);
	obj2 movez(-50, 5);
}

trap4()
{
	trig = getent("trap4acti", "targetname");
	obj1 = getent("trap4","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 4 ^2Activated");
	obj1 delete();

}

trap5()
{
	trig = getent("trap5acti", "targetname");
	obj1 = getent("trap5","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	iprintln ("^1Trap 5 ^2Activated");
	wait 0.1;
	obj1 movez(-100, 1);
	wait 4;
	obj1 movez(100, 1);
}

trap6()
{
	trig = getent("trap6acti", "targetname");
	obj1 = getent("trap6","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	iprintln ("^1Trap 6 ^2Activated");
	wait 0.1;
	while(1)
	{
		obj1 rotateYaw(360,1);
		wait 3;
	}
}
trap7()
{
	trig = getent("trap7acti", "targetname");
	obj1 = getent("trap7","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 7 ^2Activated");
	while(1)
	{
		obj1 rotatePitch (360 , 2 );
		obj1 waittill("rotatedone");
		wait 2;
	}
}
trap8()
{
	trig = getent("trap8acti", "targetname");
	obj1 = getent("trap8","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 8 ^2Activated");
	while(1)
	{
		obj1 rotatePitch (360 , 2 );
		obj1 waittill("rotatedone");
		wait 2;
	}
}

ending()
{
	trig = getent("endingtrig", "targetname");
	obj1 = getent("ending","targetname");
	trig waittill( "trigger", player );
	trig delete();
	obj1 movez(-100, 5);
	noti = SpawnStruct();
	noti.titleText = "" + " " + "^1"+ player.name + " "+ "^7Ended the Map!";
	noti.notifyText = "^3The Old Way!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 3;
	obj1 delete();
}
msg()
{
	iprintln ("^1Map by ^2Angry ^3& ^2Dr.Uzi");
	wait 10;
	iprintln ("^1Xfire: ^2skateboy6^3, ^2undefinedno1");
}
portal()
{ 
	 seta = getent ("seta","targetname");
	 sets = getent ("seta.target","targetname");
	 
	 while (1)
		{
		seta waittill ("trigger",Mrx); // ;D
		Mrx setorigin (sets.origin , 0.5);
				Mrx TakeAllWeapons();
				Mrx GiveWeapon("uzi_mp");
				wait 0.01;
				Mrx SwitchToWeapon("uzi_mp");
	noti = SpawnStruct();
	noti.titleText = "^1OMG!";
	noti.notifyText = "^2Secret has been FOUND!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		wait 0.5 ;
		}
}
lift()
{
	obj = getent("lift","targetname");
	obj1 = getent("lift1","targetname");
	obj2 = getent("lift2","targetname");
	obj3 = getent("lift3","targetname");
	obj4 = getent("lift4","targetname");
	obj5 = getent("lift11","targetname");
	while(1)
	{
	obj movez(-420, 3);
    obj1 movez(-420, 3);
	obj2 movez(-420, 3);
	obj3 movez(-420, 3);
	obj4 movez(-420, 3);
	obj5 movez(-420, 3);
	wait 9;
	obj movez(420, 1);
    obj1 movez(420, 1);
	obj2 movez(420, 1);
	obj3 movez(420, 1);
	obj4 movez(420, 1);
	obj5 movez(420, 1);
	wait 9;
	}
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getent( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1acti");
	addTriggerToList("trap2acti");
	addTriggerToList("trap3acti");
	addTriggerToList("trap4acti");
	addTriggerToList("trap5acti");
	addTriggerToList("trap6acti");
	addTriggerToList("trap7acti");
	addTriggerToList("trap8acti");
}

TeleportTrigger()
{
	level.trig waittill("trigger");
	level.trig delete();
	thread port();
}

port()
{
	if( GetTeamPlayersAlive("allies") == 1)
	{
		iprintlnbold("^2SNIPER ^11 ^7VS ^11!");
		wait 2;
		iprintlnbold("^1 F   I   G   H   T   ^7!");
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( isAlive(players[i]) && players[i].pers["team"] != "spectator" )
			{
				if( players[i].pers["team"] == "allies" )
				{
					players[i] SetPlayerAngles(( players[i].angles[0],0, players[i].angles[2] ));
					players[i] SetOrigin((496,-424,75));
				}
				if( players[i].pers["team"] == "axis" )
				{
					players[i] SetPlayerAngles( players[i].angles[0], 0, players[i].angles[2] );
					players[i] SetOrigin((-2634,-633,104));
				}
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("remington700_mp");
				wait 0.01;
				players[i] SwitchToWeapon("remington700_mp");
			}
		}
		return;
	}
}