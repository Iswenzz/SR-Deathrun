/* Script map supermario by MR-X and rednose*/
main()
{
trigger = spawn("trigger_radius", (1156, -1447, 68), 0, 300, 300);
trigger.targetname = "endmap_trig";
trigger.radius = 300;
	maps\mp\_load::main();
	// maps\mp\_effectsounds_mario::main();

	ambientPlay("ambient");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	precacheItem( "remington700_mp" );
	precacheItem( "deserteagle_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "knife_mp" );
	precacheModel( "playermodel_baa_joker" );
	level.mario = LoadFX("rednose/mario_go");

	level.orderNoRespawn = true;


	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1500");
	thread message1();
	thread trap1  ();
	thread trap2  ();
	thread trap3  ();
	thread plat   ();
	thread trap4  ();
	thread trap5  ();
	thread trap6  ();
	thread joker_jumper  ();
	thread versuswep  ();
	thread moving ();
	thread trap7  ();
	thread removeme  ();
	thread lightfix  ();
	thread trap8  ();
	thread castle  ();
	thread trap9  ();
	thread secret  ();
	thread givesecret  ();
	thread teleportertoflag ();
	thread lastmsg ();
	thread removalclips ();
	thread dubstep ();
	thread addtrapstofreerun();
	thread addtestclients  ();
    level.trig = GetEnt("teletrigger", "targetname");
    thread TeleportTrigger();
	level.trig waittill("trigger");
}

message1()
	{
	so = getent ("write","targetname");

	so waittill ("trigger",player);
	player iprintln ("^3This map was created by ^2iNext'Mr-X");
	wait 1;
	player iprintln ("^4Add me in Xfire ^1mousasalem");
	wait 1;
	player iprintln ("^3V2 by ^1red^7nose");

	wait 100;

	}


joker_jumper()
{
	trig = getent ("joker","targetname");

	trig waittill ("trigger",player);
	trig delete ();

	while(1)
	{
		level waittill( "jumper", who );
		who setModel( "playermodel_baa_joker" ); // adds the joker model
	}

}

trap1 ()
	{
	trig_1 = getent ("trig1","targetname");
	brush_1 = getent ("brush_1","targetname");
	coin_1 = getent ("coin_1","targetname");
	trig_1 waittill ("trigger");
	trig_1 PlaySound("coin");
	trig_1 delete ();
	coin_1 movez (12 , 0.1);
	wait 0.1;
	coin_1 movez (-12 , 0.1);

	while (1)
		{
		brush_1 rotatePitch (360 , 8 );
		wait 1 ;
		}
	}

trap2 ()
	{
	part1 = getentarray ("part_1" ,"targetname");
	part2 = getentarray ("part_2" ,"targetname");
	trig_2 = getent ("trig2" , "targetname");
	coin_2 = getent ("coin_2","targetname");
	trig_2 waittill ("trigger" , player );
	trig_2 PlaySound("coin");
	trig_2 delete ();
	coin_2 movez (12 , 0.1);
	wait 0.1;
	coin_2 movez (-12 , 0.1);
	part1[randomInt(part1.size)] notsolid();
    part2[randomInt(part2.size)] notsolid();
	}

trap3 ()
	{
	trig_3 = getent ("trig3","targetname");
	brush_3 = getent ("brush_3","targetname");
	coin_3 = getent ("coin_4","targetname");
	killa = getent ("kill","targetname");
	//brush = getent (brush_3.target, "targetname");

	trig_3 waittill ("trigger");
	trig_3 PlaySound("coin");
	trig_3 delete ();

	coin_3 movez (12 , 0.1);
	wait 0.1;
	coin_3 movez (-12 , 0.1);

	//oldorigin = brush_3.origin ;

	killa enablelinkto ();
	killa linkto (brush_3);

	brush_3 rotateroll(180,1);
	wait 4 ;
	brush_3 rotateroll (-180, 1 );
	wait 4 ;
	}
plat ()
	{
	platform = getent ("platform","targetname");
	mov = getent (platform.target , "targetname");

	oldorigin = platform.origin ;

	while (1)
		{
		platform moveto (mov.origin , 2 );
		wait 2.5 ;
		platform moveto (oldorigin , 2 );
		wait 2.5 ;
		}

	}

trap4 ()
	{
	trig_4 = getent ("trig4","targetname");
	spikes = getent ("spikes","targetname");
	kill1 = getent ("kill1","targetname");
	coin_4 = getent ("coin_3","targetname");

	trig_4 waittill ("trigger",player);
	trig_4 PlaySound("coin");
	trig_4 delete ();

	coin_4 movez (12 , 0.1);
	wait 0.1;
	coin_4 movez (-12 , 0.1);

	kill1 enablelinkto();
	kill1 linkto (spikes);
	spikes movez (24 , 0.1);
	wait 2;

	spikes movez (-24 , 0.5 );
	wait 2 ;

	}

trap5 ()
	{
	trig_5 = getent ("trig5","targetname");
	brush_5 = getent ("brushro","targetname");
	coin_5 = getent ("coin_5","targetname");

	trig_5 waittill ("trigger",player);
	trig_5 PlaySound("coin");
	trig_5 delete ();

	coin_5 movez (12 , 0.1);
	wait 0.1;
	coin_5 movez (-12 , 0.1);

	while (1)
		{
		brush_5 rotateyaw (360 , 4);
		wait 1 ;
		}

	}

trap6 ()
	{
	half_1 = getentarray ("half_1" ,"targetname");
	half_2 = getentarray ("half_2" ,"targetname");
	coin_6 = getent ("coin_6","targetname");
	trig_6 = getent ("trig6" , "targetname");
	trig_6 waittill ("trigger" , player );
	trig_6 PlaySound("coin");
	trig_6 delete ();

	coin_6 movez (12 , 0.1);
	wait 0.1;
	coin_6 movez (-12 , 0.1);

	half_1[randomInt(half_1.size)] delete();
    half_2[randomInt(half_2.size)] delete();
	}

moving ()
	{
	br1 = getent ("br1","targetname");
	br2 = getent ("br2","targetname");
	b3 = getent (br1.target,"targetname");
	b4 = getent (br2.target,"targetname");

	oldorigin1 = br1.origin;
	oldorigin2 = br2.origin;

	while (1)
		{
		br1 moveto(b3.origin , 1.5);
		br2 moveto (b4.origin , 1.5);
		wait 1.51;
		br1 moveto(oldorigin1 , 1.5);
		br2 moveto (oldorigin2 , 1.5);
		wait 1.51;
		}
	}

trap7 ()
	{
	hid = getent ("hid","targetname");
	hid hide ();

	sh = getent ("sh","targetname");
	fill = getent ("fill","targetname");
	trig_7 = getent ("trig7","targetname");
	coin_7 = getent ("coin_7","targetname");
	dmg123 = getent ("dmg_trappy","targetname");

	dmg123 maps\mp\_utility::triggerOff();


	trig_7 waittill ("trigger",player);
	trig_7 PlaySound("coin");
	trig_7 delete ();

	dmg123 maps\mp\_utility::triggerOn();


	wait 0.1 ;
	hid show ();
	sh hide ();
	wait 10 ;
	hid hide ();
	sh show ();
	dmg123 delete();
	}


trap8 ()
	{
	trig_8 = getent ("trig8","targetname");
	brush_8 = getent ("fall1","targetname");
	dmg1 = getent ("dmg_1","targetname");
	dmg2 = getent ("dmg_2","targetname");
	coin_8 = getent ("coin_8","targetname");

	trag = getent (brush_8.target , "targetname");

	dmg1 maps\mp\_utility::triggerOff();
	dmg2 maps\mp\_utility::triggerOff();

	trig_8 waittill ("trigger");
	trig_8 PlaySound("coin");
	trig_8 delete ();

	coin_8 movez (12 , 0.1);
	wait 0.1;
	coin_8 movez (-12 , 0.1);

	dmg1 maps\mp\_utility::triggerOn();
	dmg2 maps\mp\_utility::triggerOn();

	oldorigin = brush_8.origin ;


	brush_8 moveto (trag.origin , 0.01 );
	wait 4 ;
	brush_8 delete ();
	dmg1 delete();
	dmg2 delete();

	}

trap9 ()
	{
	trig_9 = getent ("trig9","targetname");
	brush_9 = getent ("fall2","targetname");
	trag1 = getent (brush_9.target , "targetname");
	dmg = getent ("dmg","targetname");
	coin_9 = getent ("coin_9","targetname");

	dmg maps\mp\_utility::triggerOff();

	trig_9 waittill ("trigger");
	trig_9 PlaySound("coin");
	trig_9 delete ();

	coin_9 movez (12 , 0.1);
	wait 0.1;
	coin_9 movez (-12 , 0.1);


	dmg maps\mp\_utility::triggerOn();

	oldorigin = brush_9.origin ;

	brush_9 moveto (trag1.origin , 0.01 );
	wait 4 ;
	brush_9 delete ();
	dmg delete();
	}

teleportertoflag ()
	{
	 seta = getent ("seta","targetname");
	 sets = getent (seta.target,"targetname");

	 while (1)
		{
		seta waittill ("trigger",player); // ;D
		if(!player sr\api\_deathrun::order())
			continue;
		player setorigin (sets.origin , 0.5);
		wait 0.5 ;
		}
	}

lastmsg ()
	{
	ms = getent ("ms","targetname");
	ms waittill ("trigger",player );
	ms delete ();


	iprintlnbold ("Gratz" + "." + "^2"+ player.name + "^7."+ "finished SuperMario_v2 map at 1st place");
	wait 1 ;
	}

removalclips ()
	{
	flas = getent ("flas","targetname");
	fla = getent (flas.target,"targetname");
	oldorigin = flas.origin;
	ma = fla.origin;

	clips = getent ("remove","targetname");
	trigdown = getent ("down","targetname");

	trigdown waittill ("trigger",player);
	trigdown delete ();

	player PlaySound ("endofgame");
	flas moveto (ma , 1.5);
	wait 1 ;

	clips delete ();
	}


	addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trig1");
	addTriggerToList("trig2");
	addTriggerToList("trig3");
	addTriggerToList("trig4");
	addTriggerToList("trig5");
	addTriggerToList("trig6");
	addTriggerToList("trig7");
	addTriggerToList("trig8");
	addTriggerToList("trig9");
	addTriggerToList("clip1337_trig");

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



dubstep()
{
	trig = getent ("dubstep","targetname");


	trig waittill( "trigger", player );
	trig delete();



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




	AmbientStop(3);
	MusicStop(3);
//    level notify( "addtime",  "240" );
	AmbientPlay("dubstep");
	jumper TakeAllWeapons();
	acti TakeAllWeapons();

		jumper GiveWeapon("knife_mp");
		acti GiveWeapon("knife_mp");
		wait 0.01;
		jumper SwitchToWeapon("knife_mp");
		acti SwitchToWeapon("knife_mp");

	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;

	wait 5;

	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 5;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + jumper.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );




	wait 43.5;
	PlayFX( level.mario, (-1408,-1440,60) );
	PlayFX( level.mario, (-1408,-864,60) );


}

TeleportTrigger()
{
	level.trig waittill("trigger");
	level.trig delete();
	wait 1.5;
	thread port();
}

port()
{
	if( GetTeamPlayersAlive("allies") == 1)
	{
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( isAlive(players[i]) && players[i].pers["team"] != "spectator" )
			{
				if( players[i].pers["team"] == "allies" )  //jumper
				{
				//	players[i] SetPlayerAngles(( players[i].angles[0],0, players[i].angles[2] ));
					players[i] SetOrigin((-704,-1152,16));
				}
				if( players[i].pers["team"] == "axis" )  //activator
				{
				//	players[i] SetPlayerAngles( players[i].angles[0], 0, players[i].angles[2] );
					players[i] SetOrigin((-2112,-1152,16));
				}
			//	players[i] TakeAllWeapons();
			//	players[i] GiveWeapon("remington700_mp");
			//	wait 0.01;
			//	players[i] SwitchToWeapon("remington700_mp");
			}
		}
	    return;
	}
}

castle()
{
	trig = getEnt( "castle", "targetname" );
	trig waittill( "trigger", who );
	trig delete();

	AmbientStop(3);
	MusicStop(3);

	AmbientPlay("castle");

}


removeme()
{
	trig = getent ("removemetrig","targetname");
	brush = getEnt( "removeme", "targetname" );
	brush2 = getEnt( "removeme2", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	brush movez( -1000, 2 );
	brush2 movez( -1000, 2 );
}

secret()
{
	trig = getent ("secretentrancetrig1","targetname");
	trig = getent ("secretentrancetrig2","targetname");
	trig = getent ("secretentrancetrig3","targetname");
	brush1 = getEnt( "secretentrance1", "targetname" );
	brush2 = getEnt( "secretentrance2", "targetname" );
	brush3 = getEnt( "secretentrance3", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	brush1 movez( 150, 3 );
	brush2 movez( 150, 3 );
	brush3 movez( 150, 3 );
}

lightfix()
{
	trig = getent ("lightfix","targetname");
	brush1 = getEnt( "secretentrance1", "targetname" );
	brush2 = getEnt( "secretentrance2", "targetname" );
	brush3 = getEnt( "secretentrance3", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	brush1 movez( -150, 0.1 );
	brush2 movez( -150, 0.1 );
	brush3 movez( -150, 0.1 );
}

givesecret()
{
	trig = getent ("givesecret","targetname");
	trig waittill( "trigger", player );
	trig delete();

	player TakeAllWeapons();
	player GiveWeapon("rpg_mp");
	wait 0.01;
	player SwitchToWeapon("rpg_mp");
}

versuswep()
{
	trig = getent ("versuswep","targetname");
	trig waittill( "trigger", player );
	trig delete();

	player TakeAllWeapons();
	player GiveWeapon("deserteagle_mp");
	wait 0.01;
	player SwitchToWeapon("deserteagle_mp");
}