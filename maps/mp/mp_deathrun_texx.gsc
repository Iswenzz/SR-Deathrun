main()
{
	maps\mp\_load::main();
	maps\mp\_minefields::minefields();
	
	precacheItem("claymore_mp");
	precacheItem("m40a3_acog_mp");
	precacheItem("colt45_silencer_mp");

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
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	
	MakeTriggers();
	thread startdoor();
	thread addTestClients();
	thread move1();
    thread move2();
    thread move3();
	thread high();
	thread move5();
	thread move6();
	thread move7();
	thread enddoor();
	thread findpoyser();
	thread tanker();
	thread ac130();
	thread light();
	thread findsachael();
	thread findgohan();
}
MakeTriggers()
{
	wait 0.5;
	level.trapTriggers[0] = getent("trap1_trig", "targetname");
	level.trapTriggers[1] = getent("trap2_trig", "targetname");
	level.trapTriggers[2] = getent("trap3_trig", "targetname");
	level.trapTriggers[3] = getent("trap4_trig", "targetname");
	level.trapTriggers[4] = getent("trap5_trig", "targetname");
	level.trapTriggers[5] = getent("trap6_trig", "targetname");
	level.trapTriggers[6] = getent("trollgun_trig", "targetname");
	
	
	
	level.trapTriggers[0] thread trap1();
	level.trapTriggers[1] thread trap2();
	level.trapTriggers[2] thread trap3();
	level.trapTriggers[3] thread trap4();
	level.trapTriggers[4] thread trap5();
	level.trapTriggers[5] thread trap6();
	level.trapTriggers[6] thread trollgun();
}
trap1()
{
    trig = getEnt ("trap1_trig", "targetname");
	brush = getEnt ("trap1_brush", "targetname");
	mantle = getEnt ("mantle", "targetname");
	
    trig waittill("trigger");
	trig delete();
	iprintln ("^9Activated!");
	
	brush rotateyaw(360,5);
	mantle rotateyaw(360,5);
	
	wait 5;
    
}
trap2()
{
    trig = getEnt( "trap2_trig", "targetname" );
	brushGroup1 = getEntArray( "trap2.1", "targetname" );
	brushGroup2 = getEntArray( "trap2.2", "targetname" );

	trig waittill("trigger");
	trig delete();
	iprintln ("^9Activated!");
	
	brushGroup1[randomInt(brushGroup1.size)] delete();
	while(1)
	{
	brushGroup2[randomInt(brushGroup2.size)] rotateyaw(360,3);
	wait 2;
	}
}
trap3()
{
trig = getEnt( "trap3_trig", "targetname" );
	brushGroup1 = getEntArray( "trap3_brush", "targetname" );

	trig waittill("trigger");
	trig delete();
	iprintln ("^9Activated!");
	
	brushGroup1[randomInt(brushGroup1.size)] notsolid();
	wait 1;
}
trap4()
{
    brush1 = getEnt("nosolid1", "targetname");
    trig = getEnt( "trap4_trig", "targetname" );

brush1 notsolid();

trig waittill("trigger");
trig delete();
iprintln ("^9Activated!");

brush1 solid();
wait 3;
brush1 notsolid();
}
trap5()
{
    brush3 = getEnt( "move1", "targetname" );
	brush2 = getEnt( "move2", "targetname" );
	brush1 = getEnt( "move3", "targetname" );
	trig = getEnt( "trap5_trig", "targetname" );
	
	trig waittill("trigger");
	trig delete();
	iprintln ("^9Activated!");
	
	brush3 rotateyaw(360,3);
	wait .05;
	brush2 rotateyaw(360,3);
	wait .05;
	brush1 rotateyaw(360,3);
}
trap6()
{
	brush1 = getEnt( "move5", "targetname" );
	brush2 = getEnt( "move6", "targetname" );
	trig = getEnt( "trap6_trig", "targetname" );
	
	trig waittill("trigger");
	trig delete();
	iprintln ("^9Activated!");
	
	brush1 rotateyaw(180,1);
	brush2 rotateyaw(180,1);
}
trollgun()
{
trigger = getEnt("trollgun_trig", "targetname");	
while(1)
{
trigger waittill("trigger", player);
player GiveWeapon("m40a3_acog_mp");
player SwitchToWeapon( "m40a3_acog_mp" );
}
}
startdoor()
{
           trig = getEnt ("startdoor_trig", "targetname");
	       brush = getEnt ("startdoor_brush", "targetname");
		   
		   trig waittill("trigger" ,player);
           trig delete();
		   {
		     brush moveZ (100,1);
			 wait 1;
			 brush delete();
			ambientPlay("amb_element");

             iPrintlnBold( " ^2" + player.name + " ^3 Opened The Door" );
             wait 10;      
			 			 hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (0,9,0);
	hud_clock.label = &" ^2Map by ^9Poyser";
                   hud_clock SetPulseFX( 40, 5400, 200 );
                   wait 1;
          }
}
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
move1()
{
	brush = getEnt( "move1", "targetname" );

	while(1)
	{
		brush moveY( 870,3);
		brush waittill("movedone");
		wait 1;
		brush moveY( -870,3);
		brush waittill("movedone");
		wait 1;
	}
	
}

move2()
{
	brush = getEnt( "move2", "targetname" );

	while(1)
	{
		brush moveY( 870,3);
		brush waittill("movedone");
		wait 1;
		brush moveY( -870,3);
		brush waittill("movedone");
		wait 1;
	}
	
}

move3()
{
	brush = getEnt( "move3", "targetname" );

	while(1)
	{
		brush moveY( -870,3);
		brush waittill("movedone");
		wait 1;
		brush moveY( 870,3);
		brush waittill("movedone");
		wait 1;
	}
	
}
high()
{
trigger = getEnt("claymore", "targetname");	
while(1)
{
trigger waittill("trigger", player);
player GiveWeapon("claymore_mp");
player SwitchToWeapon( "claymore_mp" );
}
}
move5()
{
	brush = getEnt( "move5", "targetname" );

	while(1)
	{
		brush moveY( -490,3);
		wait 2;
		brush moveY( 490,3);
		wait 2;
	}
	
}
move6()
{
	brush = getEnt( "move6", "targetname" );

	while(1)
	{
		brush moveY( 490,3);
		wait 2;
		brush moveY( -490,3);
		wait 2;
	}
	
}
move7()
{
	brush = getEnt( "mover7", "targetname" );

	while(1)
	{
		brush moveZ( 644,2);
		brush waittill("movedone");
		wait 2;
		brush moveZ( -644,2);
		brush waittill("movedone");
		wait 2;
	}
	
}
enddoor() //Rycoon's script xD
{
	door = getEnt("enddoor_brush", "targetname");
	trig = getEnt("enddoor_trig", "targetname");
	
	trig waittill("trigger", player );
	trig delete();
	iprintln ("^9Final ^2Door ^3Opened^0!");
	
	noti = SpawnStruct();
	noti.notifyText = "^2"+player.name+" ^9Finished ^3The ^4Map ^0First!";
	noti.duration = 6;
	noti.glowcolor = (0.3,1,0.3);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	door RotateYaw( 90, 2, 1, 0.5, 0.5 );
}
findpoyser()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "f42436e6" )
		{
			players[i] iprintLnBold("^4Murdaa! ^5DEMMM");
			players[i] GiveWeapon("colt45_silencer_mp");
			players[i] SwitchToWeapon( "colt45_silencer_mp" );
		}
	}
}
tanker()
{
       tanker = getEnt("auto12","target");

       while(true)
       {
                tanker moveX(4392,20);
				tanker waittill("movedone");
                wait 1;
                tanker rotateYaw(90,8);
				tanker waittill("rotatedone");
                wait 1;
                tanker moveY(2500,20);
				tanker waittill("movedone");
                wait 1;
                tanker rotateYaw(90,2);
				tanker waittill("rotatedone");
                wait 1;
                tanker moveX(-4392,20);
				tanker waittill("movedone");
                wait 1;
                tanker rotateYaw(90,2);
				tanker waittill("rotatedone");
                wait 1; 
                tanker moveY(-2500,20);
				tanker waittill("movedone");
                wait 1;
                tanker rotateYaw(90,2);
				tanker waittill("rotatedone");
                wait 1;
				
         }
}
ac130()
{
        ac130 = getEnt("ac130","target");
	    trig = getEnt ("startdoor_trig", "targetname");
		
		trig waittill("trigger" ,player);

       while(true)
       {        
                ac130 moveX(15000,15);
				trig Playsound("amb_ac130");
				ac130 waittill("movedone");
                wait 1;
                ac130 rotateYaw(180,8);
				ac130 waittill("rotatedone");
                wait 120;
                ac130 moveX(-20000,5);
				ac130 waittill("movedone");
                wait 1;
				ac130 rotateYaw(180,8);
				ac130 waittill("rotatedone");
				wait 120;
		}
}
light()
{
       light = getEnt("light","target");

       while(true)
       {
                light rotatepitch(1360,5);
				wait 5;
        }     
}
findsachael()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "380d9c1c" )
		{
			players[i] iprintLnBold("^2Bitch ^3PLZ");
			players[i] GiveWeapon("colt45_silencer_mp");
			players[i] SwitchToWeapon( "colt45_silencer_mp" );
			wait 1;
		}
	}
}
findgohan()
{
	wait 10;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "4cbc57e6" )
		{
			players[i] iprintLnBold("^2Im ^9Poyser's ^3#1 ^5Bitch ");
			players[i] GiveWeapon("colt45_silencer_mp");
			players[i] SwitchToWeapon( "colt45_silencer_mp" );
		}
	}
}