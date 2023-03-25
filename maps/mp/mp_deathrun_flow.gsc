main()
{


	level.c4_fx = LoadFX("explosions/aa_explosion");
	level.barrel_fx = LoadFX("masseffect/orb_explosion");
	level.fire_fx = LoadFX("fire/firelp_large_pm");
	level.fire_blue_fx = LoadFX("masseffect/fire_changed");
	level.orbs_fx = LoadFX("masseffect/magic_orbs");
	level.incomming = LoadFX("masseffect/fire_incomming");
	level.blue = LoadFX("masseffect/fire_blue");
	level.orb = LoadFX("masseffect/orb_center");
	level.orb_expl = LoadFX("masseffect/orb_explosion");
	level.flow_trans = LoadFX("rednose/flow_trans");
	level.finalfight_fx = LoadFX("rednose/1vs1finish");
	level.lightshow_fx = LoadFX("custom/light_showx2");
	level.lightshow_big_fx = LoadFX("custom/light_show");
	level.def_exp_fx = LoadFX("rednose/def_exp");
	level.orb_up = LoadFX("custom/orb_up");
	level.shoot_fx = LoadFX("custom/winch");
	level.smoke_fx = LoadFX("masseffect/magic_orbs");
	level._effect[ "orbs" ] = loadfx( "masseffect/magic_orbs" );
	level.sperm = LoadFX("misc/wavebreak_01_cargoship");
	level.trap["lightning"] = LoadFX("rednose/lightning_col");
	level.trap["lightning_dirt"] = LoadFX("rednose/lightning_dirt");

	maps\mp\_load::main();
	maps\mp\_rotateme_trap18_secondway::main();
	maps\mp\_rotateme_trap25::main();
	maps\mp\_telescars::main();
	maps\mp\_teleflow1::main();
	maps\mp\_teleflow2::main();
	maps\mp\_teleflow3::main();
	maps\mp\_teleflow4::main();
	maps\mp\_teleflow5::main();
	maps\mp\_teleflow6::main();
//	braxi\_common::mapAuthor( "rednose", "3377db6e" );



	precacheItem( "ak47_mp" );
	precacheItem( "barrett_mp" );
	precacheItem( "deserteagle_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "dragunov_acog_mp" );
	PrecacheShellShock("frag_grenade_mp");
	precacheModel( "viewhands_dnf_duke" );
	precacheModel( "playermodel_dnf_duke" );




//////////////////////////////////////////////////////////////////////
/////////////////////////\ \//////////////////////////////////////////
////////// _ __    __   \_\ \    ___     ___     ____     __  ////////
///////////\`'__\/'__`\ /'_` \ /' _ `\  / __`\  /',__\  /'__`\ ///////
//////////\ \ \//\  __//\ \r\ \/\ \/\ \/\ \e\ \/\__, `\/\ d__/ ///////
////////// \ \_\\ \____\ \___,_\ \_\ \_\ \____/\/\____/\ \____\ //////
//////////  \/_/ \/____/\/__,_ /\/_/\/_/\/___/  \/___/  \/____/ //////
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////


	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setDvar( "compassmaxrange", "1024" );


	thread scars();
	thread waitTillGameStart();
	thread moveme();
	thread transformers();
	thread scarywall();
	thread GraphicSettings();
	thread player_shock();
	thread ambienty();
	thread addtestclients();
	thread avoidscraay();
	thread getak();
	thread within();
	thread credits_beg();
	thread pedotime();
	thread dukemodel_jumper();
	thread levels();
	thread drop_it();
	thread movetogether();
	thread dragon();
	thread text();
	thread enter35();
	thread teargas();
	thread finaltele1();
	thread finaltele2();
	thread finaltele3();
	thread finaltele4();
	thread finaltele5();
	thread finaltele1_way2();
	thread finaltele2_way2();
	thread finaltele3_way2();
	thread finaltele4_way2();
	thread finaltele5_way2();
	thread finaltele1_way3();
	thread finaltele2_way3();
	thread finaltele3_way3();
	thread finaltele4_way3();
	thread finaltele5_way3();
	thread finaltele1_way4();
	thread finaltele2_way4();
	thread finaltele3_way4();
	thread finaltele4_way4();
	thread finaltele5_way4();
	thread finaltele1_way5();
	thread finaltele2_way5();
	thread finaltele3_way5();
	thread finaltele4_way5();
	thread finaltele5_way5();
	thread jump_height_trig();
	thread addtrapstofreerun();
	thread avoidbug();
	thread act2();
	thread expandTimeLimit();
	/////////////////
	thread movearound();
	thread trap_01();
	thread trap_02();
	thread trap_03();
	thread trap_04();
	thread trap_05();
	thread trap_07();
	thread trap_08();
	thread trap_09();
	thread trap_10();
	thread trap_11();
	thread trap_12();
	thread trap_13();
	thread trap_14();
	thread trap_15();
	thread trap_16();
	thread trap_17();
	thread trap_18();
	thread trap_19();
	thread trap_20();
	thread trap_21();
	thread trap_22();
	thread trap_23();
	thread trap_24();
	thread trap_26();
	thread trap_27();
	thread trap_28();
	thread trap_29();
	thread trap_30();
	thread trap_31();
	thread trap_32();
	thread trap_33();
	thread trap_34();
	thread trap_35();
	thread trap_36();
	thread trap_37();
	thread trap_38();
	thread trap_39();
	thread trap_40();
	thread trap_41();
	thread trap_42();
}



//*******************************************GAME*******************************************//




addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trigger1");
	addTriggerToList("trigger2");
	addTriggerToList("trigger3");
	addTriggerToList("trigger4");
	addTriggerToList("trigger5");
	addTriggerToList("trigger6");
	addTriggerToList("trigger7");
	addTriggerToList("trigger8");
	addTriggerToList("trigger9");
	addTriggerToList("trigger10");
	addTriggerToList("trigger11");
	addTriggerToList("trigger12");
	addTriggerToList("trigger13");
	addTriggerToList("trigger14");
	addTriggerToList("trigger15");
	addTriggerToList("trigger16");
	addTriggerToList("trigger17");
	addTriggerToList("trigger18");
	addTriggerToList("trigger19");
	addTriggerToList("trigger19_fixed");
	addTriggerToList("trigger20");
	addTriggerToList("trigger21");
	addTriggerToList("trigger22");
	addTriggerToList("trigger23");
	addTriggerToList("trigger24");
	addTriggerToList("trigger25");
	addTriggerToList("trigger26");
	addTriggerToList("trigger27");
	addTriggerToList("trigger28");
	addTriggerToList("trigger29");
	addTriggerToList("trigger30");
	addTriggerToList("trigger31");
	addTriggerToList("trigger32");
	addTriggerToList("trigger33");
	addTriggerToList("trigger34");
	addTriggerToList("trigger35");
	addTriggerToList("trigger36");
	addTriggerToList("trigger37");
	addTriggerToList("trigger38");
	addTriggerToList("trigger39");
	addTriggerToList("trigger40");
	addTriggerToList("trigger41");
	addTriggerToList("trigger42");



}



dukemodel_jumper()

{
	while(1)
	{
		level waittill( "jumper", who );
		who setModel( "playermodel_dnf_duke" ); // adds the Duke model
	}

}

//thx to braxi for that one :*

ambienty()
{
	trig = getent ("ambienty","targetname");

	trig waittill( "trigger", player );
	trig delete();

	ambientPlay("ambient");


}

enter35()
{
	trig = getent ("enter35","targetname");
	brush = getent ("enter35del","targetname");

	trig waittill( "trigger", player );
	trig delete();

	brush delete();


}


avoidscraay()
{
	trig = getent ("avoidscraay","targetname");
	dmg = getent ("avoidscraay_dmg","targetname");

	dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", player );
	trig delete();

	wait 60;
	dmg maps\mp\_utility::triggerOn();
}

act2()
{
	trig = getent ("act2","targetname");
	floor1 = getent ("act2_floor","targetname");
	trig waittill( "trigger", player );
	trig delete();

	wait 5;

	floor1 delete();
}


jump_height_trig()
{
	trig = getent ("jump_height_trig","targetname");


	// setdvar( "jump_height", "39" );
	level.dvar[ "afk_warn" ] = 15;

	trig waittill( "trigger", player );
	trig delete();

}


scars()
{
	trig = getEnt( "scars", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	player TakeAllWeapons();

}


scarywall()
{
	trig = getent ("scarywalltrig","targetname");
	upme = getEnt( "scarywall", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	wait 10;
	upme movex( 224, 15 );

	player SetClientDvar( "cg_drawhud", "0" );
//	player SayAll( "Help me im dying!" );
}


avoidbug()
{
	trig = getent ("avoidbugtrig","targetname");
	brush1 = getEnt( "avoidbug1", "targetname" );
	brush2 = getEnt( "avoidbug2", "targetname" );
	brush3 = getEnt( "avoidbug3", "targetname" );
	brush4 = getEnt( "avoidbug4", "targetname" );
	brush5 = getEnt( "avoidbug5", "targetname" );


	trig waittill( "trigger", player );
	trig delete();


	wait 2;
	brush1 movez( -200, 2 );
	brush2 movez( -2000, 2 );
	brush3 movez( -150, 2 );
	brush4 movez( -300, 2 );
	brush5 movez( -800, 2 );

}



//////////////////			 //////////////////
//////////////////FINALFIGHTS//////////////////
//////////////////			 //////////////////

within()
{
	trig = getent ("within","targetname");
	brush = getEnt( "roller1vs1", "targetname" );
	fabricclip = getEnt( "fabricclip", "targetname" );

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

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	wait 0.1;

	level.blackhud.alpha = 0;


	AmbientPlay("within");
	VisionSetNaked( "icbm", 2 );

	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;

	acti FreezeControls(1);
	player FreezeControls(1);

	wait 13.6;
	brush movez( 305, 5 );

	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );



	wait 10;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 15.7;
	PlayFX( level.lightshow_fx, (-9208,2564,326) );
	wait 12.7;
	PlayFX( level.lightshow_big_fx, (-8064,2564,326) );
	acti FreezeControls(0);
	player FreezeControls(0);
	fabricclip delete();

}

expandTimeLimit() //seconds
{
    wait 0.05; //wait for game to load mod script
    level.dvar["time_limit"] += 10;
}

drop_it()
{
	trig = getent ("drop_it","targetname");
	brush = getent ("240_up","targetname");


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
	AmbientPlay("drop");


	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );


	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );


	wait 10;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );


	wait 3.2;

	PlayFX( level.finalfight_fx, (-7152,2585,258) );

	brush movez( 224, 10 );

}


dragon()
{
	trig = getent ("dragon","targetname");
	brush1 = getEnt( "finalfightdoor1", "targetname" );
	brush2 = getEnt( "finalfightdoor2", "targetname" );
	brush3 = getEnt( "finalfightdoor3", "targetname" );
	brush4 = getEnt( "finalfightdoor4", "targetname" );
	brush5 = getEnt( "finalfightdoor5", "targetname" );
	brush6 = getEnt( "finalfightdoor6", "targetname" );
	bigboom = getEnt( "bigboom", "targetname" );
	dragonclip = getEnt( "dragonclip", "targetname" );


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
	AmbientPlay("dragon");


	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	// setdvar( "jump_height", "250" );


	acti FreezeControls(1);
	player FreezeControls(1);

	brush4 movez( -305, 5 );
	wait 1;
	brush1 movez( 200, 5 );

	wait 2.9;

	PlayFX( level.blue, (-5656,2408,144) );
	PlayFX( level.blue, (-5664,2656,144) );
	PlayFX( level.blue, (-4524,2656,144) );
	PlayFX( level.blue, (-4524,2392,144) );


	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );


	brush2 movex( -400, 5 );
	brush3 movex( 400, 5 );
	wait 1;
	brush5 movez( -400, 5 );
	brush6 movez( -400, 5 );

	wait 10;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	PlayFX( level.orb, (-5088,2528,328) );

	wait 13.8;

	PlayFX( level.orb_expl, (-5088,2528,328) );
	bigboom PlaySound("lightning");


	acti FreezeControls(0);
	player FreezeControls(0);
	dragonclip delete();

	level waittill( "intermission" );


}




levels()
{
	trig = getent ("levels","targetname");
	bum = getEnt( "bum", "targetname" );
	portalclip = getEnt( "portalclip", "targetname" );

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
	AmbientPlay("levels");


	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	setDvar("cg_thirdperson", 1 );


	acti FreezeControls(1);
	player FreezeControls(1);


	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );


	PlayFX( level.orb_up, (-3584,2582,408) );
	PlayFX( level.orb_up, (-3579,2543,399) );
	PlayFX( level.orb_up, (-3579,1407,408) );
	PlayFX( level.orb_up, (-3536,3864,320) );


	wait 6.5;
	PlayFX( level.def_exp_fx, (-3584,2582,408) );
	bum PlaySound("lightning");


	wait 10;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 11;
	PlayFX( level.def_exp_fx, (-3584,2582,408) );
	bum PlaySound("lightning");
	wait 0.8;
	PlayFX( level.def_exp_fx, (-3584,2582,408) );
	bum PlaySound("lightning");
	wait 0.8;
	wait 4.5;
	PlayFX( level.def_exp_fx, (-3584,2582,408) );
	bum PlaySound("lightning");
	wait 0.4;
	PlayFX( level.def_exp_fx, (-3584,2582,408) );
	bum PlaySound("lightning");

	acti FreezeControls(0);
	player FreezeControls(0);
	portalclip delete();

}


transformers()
{
	trig = getent ("transformers","targetname");
	shine = getent ("1728","targetname");
	palmtrig = getent ("palmtrig","targetname");

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
	AmbientPlay("transformers");
	VisionSetNaked( "mpIntro", 5 );

	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	// setdvar( "jump_height", "250" );


	acti FreezeControls(1);
	player FreezeControls(1);

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	shine movez( -1728, 15 );

	wait 5;

	level.blackhud.alpha = 0;

	noti = SpawnStruct();
	noti.titleText = "1 VS 1";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 10;
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 5;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 19;

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );
	wait 0.1;
	level.blackhud.alpha = 0;

	PlayFX( level.orbs_fx, (-1522,4624,811) );
	wait 26.5;

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	wait 0.1;
	level.blackhud.alpha = 0;

	wait 3.25;

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	wait 0.1;
	level.blackhud.alpha = 0;
	PlayFX( level.flow_trans, (-1656,4600,800) );

	wait 3.25;

	level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	wait 0.1;
	level.blackhud.alpha = 0;
	PlayFX( level.flow_trans, (-1656,4600,800) );

	wait 13.25;

	wait 9.75;
	acti FreezeControls(0);
	player FreezeControls(0);
	palmtrig delete();

	VisionSetNaked( "icbm", 2 );

		level waittill( "intermission" );
}

getak()
{
	trig = getEnt("getak", "targetname");

	trig waittill("trigger", player);
	trig delete();


		player TakeAllWeapons();
		player GiveWeapon( "ak47_mp" );
		wait 0.01;
		player SwitchToWeapon( "ak47_mp" );

}




text()
{
    for(;;)
    {
        wait 60;
        iPrintln("^1>> ^2Map made by ^1red^7nose");
	    wait 60;
		iPrintln("^1>> ^2Thanks for the huge help by Ratzee!");
    }
}


//////////RANDOMWAY/////////

waitTillGameStart()
{
	for(;;)
	{
		level waittill( "connected" );
		wait 4;
		thread randomRoute();
		break;
	}
}


randomRoute()
{
	for(;;)
	{
		activator = undefined;
		players = getentarray( "player", "classname" );

		for( i = 0; i < players.size; i++ )
		{
			if( players[i].pers["team"] == "axis" )
			{
				activator = players[i];
				break;
			}
		}

		if( isDefined(activator) )
			break;

		wait(0.1);
	}

	door = [];
	door[0] = getEnt( "door1", "targetname" );
	door[1] = getEnt( "door2", "targetname" );
	door[2] = getEnt( "door3", "targetname" );
	door[3] = getEnt( "door4", "targetname" );
	door[4] = getEnt( "door5", "targetname" );

	origin = [];
	origin[0] = (-1840, 1648, -32);
	origin[1] = (-1528, 2896, 400);
	origin[2] = (-580, 2547, 504);
	origin[3] = (192, 1920, 56);
	origin[4] = (588, 2164, 360);

	route = randomInt( 5 );

	door[route] moveZ( 500, 5 );		// 100 ist die h�he der T�r, kannst du noch �ndern...oder auch auf nen negativen wert damit die t�r nach unten wegbewegt wird

	activator setOrigin( origin[route] );

	iprintlnbold( "Way "+(route+1)+" unlocked!" );
}

movetogether()
{
	trig = getEnt( "movetogethertrig", "targetname" );
	movetogether1 = getEnt( "movetogether1", "targetname" );
	movetogether2 = getEnt( "movetogether2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

while(1)
	{
	movetogether1 movey( -2112, 25 );
	movetogether2 movey( 2112, 25 );
	movetogether1 waittill ("movedone");
	movetogether2 waittill ("movedone");
	movetogether1 movey( 2112, 25 );
	movetogether2 movey( -2112, 25 );
	movetogether1 waittill ("movedone");
	movetogether2 waittill ("movedone");
	}
}


pedotime()
{
	trig = getEnt( "pedotimetrig", "targetname" );
	pedotime1 = getEnt( "pedotime", "targetname" );
	pedotime2 = getEnt( "pedotime2", "targetname" );
	pedotime3 = getEnt( "pedotime3", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	pedotime1 movez( 112, 5 );


	pedotime2 movez( 112, 5 );


	pedotime3 movez( 112, 5 );

}

credits_beg()
{
	trig = getEnt( "credits_beg", "targetname" );

	trig waittill( "trigger", who );
	trig delete();


	wait(5);
	players = getentarray("player", "classname");
	noti = SpawnStruct();
	noti.titleText = "Map by";
	noti.notifyText = "^1red^7nose";
	noti.duration = 10;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}





////BOTS////
////for test/////

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
			println("Could not add test client fucktard");
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


GraphicSettings()
{

	SetDvar( "r_specularcolorscale", "10" );
	SetDvar( "r_glowTweakEnable", 1 );
	SetDvar( "r_glowUseTweaks", 1 );
	SetDvar( "r_glowTweakBloomCutoff", 0.65 );
//	SetDvar( "r_glowTweakBloomIntensity", 1 );
	SetDvar( "r_specular", 1 );
	SetDvar( "r_dlightLimit", 4 );
	SetDvar( "r_distortion", 1 );
}

player_shock()
{

	trig = getent ("player_shock","targetname");
	players = getentarray("player", "classname");


	trig waittill( "trigger", player );

	player ShellShock("frag_grenade_mp", 60 );

}

teargas()
{

	trig = getent ("teargas","targetname");
	players = getentarray("player", "classname");


	trig waittill( "trigger", player );

	player ShellShock("teargas", 60 );

}

finaltele1()
{
	trig = getEnt("finaltele1", "targetname");
	porterA = getEnt("porter_activator_1", "targetname");
	porterJ = getEnt("porter_jumper_1", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "barrett_mp", 130 );
		level.activ room( porterA, "barrett_mp", 130 );
	}

	trig delete();
}

finaltele2()
{
	trig = getEnt("finaltele2", "targetname");
	porterA = getEnt("porter_activator_2", "targetname");
	porterJ = getEnt("porter_jumper_2", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "deserteagle_mp", 130 );
		level.activ room( porterA, "deserteagle_mp", 130 );
	}

	trig delete();
}


finaltele3()
{
	trig = getEnt("finaltele3", "targetname");
	porterA = getEnt("porter_activator_3", "targetname");
	porterJ = getEnt("porter_jumper_3", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "ak47_mp", 130 );
		level.activ room( porterA, "ak47_mp", 130 );
	}

	trig delete();
}

finaltele4()
{
	trig = getEnt("finaltele4", "targetname");
	porterA = getEnt("porter_activator_4", "targetname");
	porterJ = getEnt("porter_jumper_4", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "dragunov_acog_mp", 130 );
		level.activ room( porterA, "dragunov_acog_mp", 130 );
	}

	trig delete();
}

finaltele5()
{
	trig = getEnt("finaltele5", "targetname");
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "rpg_mp", 130 );
		level.activ room( porterA, "rpg_mp", 130 );
	}

	trig delete();
}

//***********//

finaltele1_way2()
{
	trig = getEnt("finaltele1_way2", "targetname");
	porterA = getEnt("porter_activator_1", "targetname");
	porterJ = getEnt("porter_jumper_1", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "barrett_mp", 130 );
		level.activ room( porterA, "barrett_mp", 130 );
	}

	trig delete();
}

finaltele2_way2()
{
	trig = getEnt("finaltele2_way2", "targetname");
	porterA = getEnt("porter_activator_2", "targetname");
	porterJ = getEnt("porter_jumper_2", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "deserteagle_mp", 130 );
		level.activ room( porterA, "deserteagle_mp", 130 );
	}

	trig delete();
}


finaltele3_way2()
{
	trig = getEnt("finaltele3_way2", "targetname");
	porterA = getEnt("porter_activator_3", "targetname");
	porterJ = getEnt("porter_jumper_3", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "ak47_mp", 130 );
		level.activ room( porterA, "ak47_mp", 130 );
	}

	trig delete();
}

finaltele4_way2()
{
	trig = getEnt("finaltele4_way2", "targetname");
	porterA = getEnt("porter_activator_4", "targetname");
	porterJ = getEnt("porter_jumper_4", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "dragunov_acog_mp", 130 );
		level.activ room( porterA, "dragunov_acog_mp", 130 );
	}

	trig delete();
}

finaltele5_way2()
{
	trig = getEnt("finaltele5_way2", "targetname");
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "rpg_mp", 130 );
		level.activ room( porterA, "rpg_mp", 130 );
	}

	trig delete();
}


finaltele1_way3()
{
	trig = getEnt("finaltele1_way3", "targetname");
	porterA = getEnt("porter_activator_1", "targetname");
	porterJ = getEnt("porter_jumper_1", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "barrett_mp", 130 );
		level.activ room( porterA, "barrett_mp", 130 );
	}

	trig delete();
}

finaltele2_way3()
{
	trig = getEnt("finaltele2_way3", "targetname");
	porterA = getEnt("porter_activator_2", "targetname");
	porterJ = getEnt("porter_jumper_2", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "deserteagle_mp", 130 );
		level.activ room( porterA, "deserteagle_mp", 130 );
	}

	trig delete();
}


finaltele3_way3()
{
	trig = getEnt("finaltele3_way3", "targetname");
	porterA = getEnt("porter_activator_3", "targetname");
	porterJ = getEnt("porter_jumper_3", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "ak47_mp", 130 );
		level.activ room( porterA, "ak47_mp", 130 );
	}

	trig delete();
}

finaltele4_way3()
{
	trig = getEnt("finaltele4_way3", "targetname");
	porterA = getEnt("porter_activator_4", "targetname");
	porterJ = getEnt("porter_jumper_4", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "dragunov_acog_mp", 130 );
		level.activ room( porterA, "dragunov_acog_mp", 130 );
	}

	trig delete();
}

finaltele5_way3()
{
	trig = getEnt("finaltele5_way3", "targetname");
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "rpg_mp", 130 );
		level.activ room( porterA, "rpg_mp", 130 );
	}

	trig delete();
}

finaltele1_way4()
{
	trig = getEnt("finaltele1_way4", "targetname");
	porterA = getEnt("porter_activator_1", "targetname");
	porterJ = getEnt("porter_jumper_1", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "barrett_mp", 130 );
		level.activ room( porterA, "barrett_mp", 130 );
	}

	trig delete();
}

finaltele2_way4()
{
	trig = getEnt("finaltele2_way4", "targetname");
	porterA = getEnt("porter_activator_2", "targetname");
	porterJ = getEnt("porter_jumper_2", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "deserteagle_mp", 130 );
		level.activ room( porterA, "deserteagle_mp", 130 );
	}

	trig delete();
}


finaltele3_way4()
{
	trig = getEnt("finaltele3_way4", "targetname");
	porterA = getEnt("porter_activator_3", "targetname");
	porterJ = getEnt("porter_jumper_3", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "ak47_mp", 130 );
		level.activ room( porterA, "ak47_mp", 130 );
	}

	trig delete();
}

finaltele4_way4()
{
	trig = getEnt("finaltele4_way4", "targetname");
	porterA = getEnt("porter_activator_4", "targetname");
	porterJ = getEnt("porter_jumper_4", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "dragunov_acog_mp", 130 );
		level.activ room( porterA, "dragunov_acog_mp", 130 );
	}

	trig delete();
}

finaltele5_way4()
{
	trig = getEnt("finaltele5_way4", "targetname");
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "rpg_mp", 130 );
		level.activ room( porterA, "rpg_mp", 130 );
	}

	trig delete();
}


finaltele1_way5()
{
	trig = getEnt("finaltele1_way5", "targetname");
	porterA = getEnt("porter_activator_1", "targetname");
	porterJ = getEnt("porter_jumper_1", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "barrett_mp", 130 );
		level.activ room( porterA, "barrett_mp", 130 );
	}

	trig delete();
}

finaltele2_way5()
{
	trig = getEnt("finaltele2_way5", "targetname");
	porterA = getEnt("porter_activator_2", "targetname");
	porterJ = getEnt("porter_jumper_2", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "deserteagle_mp", 130 );
		level.activ room( porterA, "deserteagle_mp", 130 );
	}

	trig delete();
}


finaltele3_way5()
{
	trig = getEnt("finaltele3_way5", "targetname");
	porterA = getEnt("porter_activator_3", "targetname");
	porterJ = getEnt("porter_jumper_3", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "ak47_mp", 130 );
		level.activ room( porterA, "ak47_mp", 130 );
	}

	trig delete();
}

finaltele4_way5()
{
	trig = getEnt("finaltele4_way5", "targetname");
	porterA = getEnt("porter_activator_4", "targetname");
	porterJ = getEnt("porter_jumper_4", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "dragunov_acog_mp", 130 );
		level.activ room( porterA, "dragunov_acog_mp", 130 );
	}

	trig delete();
}

finaltele5_way5()
{
	trig = getEnt("finaltele5_way5", "targetname");
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");


	level.finalJumper = undefined;

	while( 1 )
	{
		trig waittill( "trigger", player );

		if( level.freeRun )
			continue;

		if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
			continue;

		level.finalJumper = player;

		level.finalJumper thread monitor();
		level.finalJumper room( porterJ, "rpg_mp", 130 );
		level.activ room( porterA, "rpg_mp", 130 );
	}

	trig delete();
}


monitor()
{
	self endon( "disconnect" );
	self thread monitorDisconnect();

	while( self.sessionstate == "playing" )
		wait 0.05;
	level.finalJumper = undefined;
}

monitorDisconnect()
{
	self waittill( "disconnect" );
	level.finalJumper = undefined;
}

room( tp, weap, health )
{
	self SetPlayerAngles( tp.angles );
	self SetOrigin( tp.origin );

	self TakeAllWeapons();
	self GiveWeapon( weap );
	self GiveMaxAmmo( weap );
	self SwitchToWeapon( weap );

	self.maxhealth = health;
	self.health = self.maxhealth;
}





//*******************************************TRAPS*******************************************//


trap_01()
{
	trig = getent ("trigger1","targetname");
	dmg = getent ("trap1_dmg","targetname");
	c41 = getEnt( "c41", "targetname" );
	c42 = getEnt( "c42", "targetname" );
	c43 = getEnt( "c43", "targetname" );
	c44 = getEnt( "c44", "targetname" );
	c45 = getEnt( "c45", "targetname" );
	c46 = getEnt( "c46", "targetname" );


		dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", player );
	trig delete();



		dmg maps\mp\_utility::triggerOn();

		PlayFX( level.c4_fx, (-1765,2098,-153) );
		c41 PlaySound("c4");
			wait 0.1;
		PlayFX( level.c4_fx, (-1886,2090,-196) );
		c42 PlaySound("c4");





	wait 0.1;
	c41 delete();
	c42 delete();
	c43 delete();
	c44 delete();
	c45 delete();
	c46 delete();

	dmg delete();


}




trap_02()
{
	trig = getEnt( "trigger2", "targetname" );
	squeeze1 = getEnt( "squeeze1", "targetname" );
	squeeze2 = getEnt( "squeeze2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	squeeze1 movex( 240, 3 );
	squeeze2 movex( -240, 3 );
	wait 4;
	squeeze1 movex( -240, 3 );
	squeeze2 movex( 240, 3 );

}


trap_03()
{
	trig = getent ("trigger3","targetname");
	brush = getent ("trap_03brush","targetname");

	trig waittill( "trigger", who );
	trig delete();

	brush PlaySound ("lightning_hit");
	brush delete();

}


trap_04()
{
	slid1 =getent("slid1","targetname");
	slid2 =getent("slid2","targetname");

	while(1)
		{
		slid1 movex( -192, 1 );
		slid1 waittill ("movedone");
		slid2 movex( 192, 1 );
		slid2 waittill ("movedone");
		wait(1);
		slid1 movex( 192, 1 );
		slid1 waittill ("movedone");
		slid2 movex( -192, 1 );
		slid2 waittill ("movedone");
		}
}


trap_05()
{
	trig = getent ("trigger5","targetname");
	dmg = getent ("trap05_dmg","targetname");
	safe = getent ("safe","targetname");
	firesound =	getent("firesound","targetname");


	dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", player );
	trig delete();


	PlayFX( level.fire_fx, (-1952,4368,-240) );
	firesound PlayLoopSound ("fire_loop");
	PlayFX( level.fire_fx, (-1674,4525,-240) );
	PlayFX( level.fire_fx, (-1952,4525,-240) );
	PlayFX( level.fire_fx, (-1674,4368,-240) );


	dmg maps\mp\_utility::triggerOn();

	wait 5;

	safe movez( 32, 3 );
	dmg delete();


}


trap_07()
{
	trig = getEnt( "trigger7", "targetname" );
	brushGroup1 = getEntArray( "trap07_1", "targetname" );
	brushGroup2 = getEntArray( "trap07_2", "targetname" );
	clip1 = getent("clip1","targetname");
	clip2 = getent("clip2","targetname");
	block1 = getent("block1","targetname");
	block2 = getent("block2","targetname");



	trig waittill( "trigger", who );
	trig delete();


	clip1 movez( 208, 1 );
	clip2 movez( 208, 1 );
	block1 movez( 112, 2 );
	block2 movez( 112, 2 );


	wait 7.5;


	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();




	wait 5;

	clip1 movez( -208, 1 );
	clip2 movez( -208, 1 );
	block1 movez( -112, 2 );
	block2 movez( -112, 2 );

}


trap_08()
{
	trig = getEnt( "trigger8", "targetname" );
	updown1 =getent("updown1","targetname");
	updown2 =getent("updown2","targetname");
	updown3 =getent("updown3","targetname");
	updown4 =getent("updown4","targetname");
	updown5 =getent("updown5","targetname");
	updown6 =getent("updown6","targetname");
	updown7 =getent("updown7","targetname");
	updown8 =getent("updown8","targetname");



	trig waittill( "trigger", who );
	trig delete();


	while(1)
		{
		wait(2);

		updown1 movez( -500, 3 );
		updown2 movez( -500, 3 );
		updown3 movez( -500, 3 );
		updown4 movez( -500, 3 );
		updown5 movez( -500, 3 );
		updown6 movez( -500, 3 );
		updown7 movez( -500, 3 );
		updown8 movez( -500, 3 );

		wait(5);

		updown1 movez( 500, 5 );
		updown2 movez( 500, 5 );
		updown3 movez( 500, 5 );
		updown4 movez( 500, 5 );
		updown5 movez( 500, 5 );
		updown6 movez( 500, 5 );
		updown7 movez( 500, 5 );
		updown8 movez( 500, 5 );

		wait(7);
		}
}


trap_09()
{
	trig = getEnt( "trigger9", "targetname" );
	movingdown =getent("movingdown","targetname");
	clip112 =getent("clip112","targetname");
	dmg = getent ("trap9_dmg","targetname");

	dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", who );
	trig delete();

		movingdown movez( -152, 2 );
		clip112 movez( 160, 0.5 );
		wait(1);
		dmg maps\mp\_utility::triggerOn();
		wait(3);
		movingdown movez( 152, 5 );
		clip112 movez( -160, 0.5 );

	dmg delete();

}


trap_10()
{
	trig = getent ("trigger10","targetname");
	dmg = getent ("trap10_dmg","targetname");
	clips = getEnt( "clips", "targetname" );
	be1 = getEnt( "be1", "targetname" );
	be2 = getEnt( "be2", "targetname" );
	be3 = getEnt( "be3", "targetname" );
	be4 = getEnt( "be4", "targetname" );
	be5 = getEnt( "be5", "targetname" );
	be6 = getEnt( "be6", "targetname" );
	be7 = getEnt( "be7", "targetname" );
	be8 = getEnt( "be8", "targetname" );
	be9 = getEnt( "be9", "targetname" );
	be10 = getEnt( "be10", "targetname" );
	be11 = getEnt( "be11", "targetname" );
	be12 = getEnt( "be12", "targetname" );
	be13 = getEnt( "be13", "targetname" );
	be14 = getEnt( "be14", "targetname" );
	be15 = getEnt( "be15", "targetname" );
	be16 = getEnt( "be16", "targetname" );
	be17 = getEnt( "be17", "targetname" );

		dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", player );
	trig delete();

		dmg maps\mp\_utility::triggerOn();

		PlayFX( level.barrel_fx, (-1818,8510,-216) );
		be8 PlaySound("c4");
			wait 0.1;
		be8 PlaySound("c4");
			wait 0.1;
		be8 PlaySound("c4");

	wait 0.1;

	be1 delete();
	be2 delete();
	be3 delete();
	be4 delete();
	be5 delete();
	be6 delete();
	be7 delete();
	be8 delete();
	be9 delete();
	be10 delete();
	be11 delete();
	be12 delete();
	be13 delete();
	be14 delete();
	be15 delete();
	be16 delete();
	be17 delete();
	clips delete();
	dmg delete();


}


trap_11()
{
	slid1_1 =getent("slid1_1","targetname");

	while(1)
		{
		slid1_1 movey( 284, 3 );
		slid1_1 waittill ("movedone");
		wait(2);
		slid1_1 movey( -284, 3 );
		slid1_1 waittill ("movedone");
		}
}


trap_12()
{
	trig = getEnt( "trigger12", "targetname" );
	brush = getEnt( "trap12", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( 180, 8 );
		wait 4;
	}
}



trap_13()
{
	trig = getEnt( "trigger13", "targetname" );
	catshit = getEnt( "catshit", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	catshit movez( -232, 2 );
	wait 5;
	catshit movez( 232, 2 );
}


moveme()
{
	moveme = getEnt( "moveme", "targetname" );

	while(1)
	{
	wait 2;
	moveme movey( 780, 10 );
	moveme waittill ("movedone");
	wait 2;
	moveme movey( -780, 10 );
	moveme waittill ("movedone");
	}
}


trap_14()
{
	trig = getent ("trigger14","targetname");
	dmg = getent ("trap14_dmg","targetname");
	firesound112 =getent("firesound112","targetname");
	help1 = getEnt( "help1", "targetname" );
	help2 = getEnt( "help2", "targetname" );


	dmg maps\mp\_utility::triggerOff();

	trig waittill( "trigger", player );
	trig delete();

	PlayFX( level.fire_blue_fx, (-1314,4758,-99) );
	firesound112 PlayLoopSound("fire_loop");

	dmg maps\mp\_utility::triggerOn();

	wait 5;

	help1 movez( 256, 1 );
	help2 movez( 256, 1 );


}


trap_15()
{
	trig = getent ("trigger15","targetname");
	moveme1 = getEnt( "moveme1", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	moveme1 movez( 384, 2 );
	wait 5;
	moveme1 movez( -384, 2 );

}

trap_16()
{
	trig = getent ("trigger16","targetname");
	upme = getEnt( "upme", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	upme movez( 240, 1 );
	wait 2.5;
	upme movez( -240, 1 );

}

trap_17()
{
	trapdoor1 = getent( "trapdoor1", "targetname" );
	trapdoor2 = getent( "trapdoor2", "targetname" );
	goup = getent( "goup", "targetname" );
	trig = getent( "trigger17", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

		trapdoor1 rotateto( ( -90, 0, 0 ), 1);
		trapdoor1 waittill ("rotatedone");
		trapdoor2 rotateto( ( -90, 0, 0 ), 1);
		trapdoor2 waittill ("rotatedone");

		wait 3;

		trapdoor1 rotateto( ( 0, 0, 0 ), 1.7);
		trapdoor1 waittill ("rotatedone");
		trapdoor2 rotateto( ( 0, 0, 0 ), 1.7);
		trapdoor2 waittill ("rotatedone");

		goup movez( 240, 5 );

}


trap_18()
{
	trig = getEnt( "trigger18", "targetname" );
	brush = getent ("delette","targetname");

	trig waittill( "trigger", who );
	trig delete();

	brush PlaySound ("lightning_hit");
	brush delete();

}


trap_19()
{
	trig = getEnt( "trigger19_fixed", "targetname" );
	brush = getEnt( "trap19_fixed", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	brush PlaySound ("lightning_hit");
	brush delete();
}

movearound()
{
	movearound =getent("movearound","targetname");

	while(1)
		{
		movearound movey( 1275, 10 );
		movearound waittill ("movedone");
		wait(1);
		movearound movey( -1275, 10 );
		movearound waittill ("movedone");
		}
}

trap_20()
{
	trig = getent ("trigger20","targetname");
	trap_20 = getEnt( "trap_20", "targetname" );

	trig waittill( "trigger", player );
	trig delete();

	trap_20 movez( 120, 2 );
	trap_20 movey( 850, 2.5 );
	trap_20 movez( -120, 5 );
}



trap_21()
{
	trig = getEnt( "trigger21", "targetname" );
	brush = getEnt( "trap21", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 2; i++ )
	{
		brush rotateYaw( 512, 3 );
		wait 3;
		brush rotateYaw( -512, 3 );
		wait 3;
	}
}

trap_22()
{
	trig = getEnt( "trigger22", "targetname" );

	trig waittill( "trigger", who );
	height = 559;
	for(i=0;i<5;i++)
	{
		trace = BulletTrace( (-799,8253,height), (-799,8008,height), true, undefined );
		if( isPlayer(trace["entity"]))
			trace["entity"] finishPlayerDamage( trace["entity"], trace["entity"], 1000, 0, "MOD_PROJECTILE", "winchester1200_mp", (-799,8253,height), (-799,8253,height), "none", 0);
		height -= 2;
	}
//	PlayFX( level.shoot_fx, (-799,8253,559) );
	PlayFX( level.shoot_fx, (-799,8253,559), (-799,8243,559));

	who PlaySound("shot");
	trig delete();

}

trap_23 ()
{
	trigger23 = getent ("trigger23","targetname");
	brush_3 = getent ("brush_3","targetname");
	killa = getent ("kill","targetname");

	trigger23 waittill ("trigger");
	trigger23 delete ();

	killa enablelinkto ();
	killa linkto (brush_3);

	brush_3 movez( 12, 0.5 );
	wait 4 ;
	brush_3 movez( -12, 0.5 );
	wait 4 ;
}
//thx to mrx

trap_24 ()
{
	trigger = getent ("trigger24","targetname");
	brush = getent ("olotrolo","targetname");


	trigger waittill ("trigger");
	trigger delete ();


	brush movez( 286, 2 );
	wait 4 ;
	brush movez( -286, 2 );

}

trap_26()
{
	trigger = getent ("trigger26","targetname");
	brush1 =getent("brushyt1","targetname");
	brush2 =getent("brushyt2","targetname");
	brush3 =getent("brushyt3","targetname");
	brush4 =getent("brushyt4","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	while(1)
		{
		brush1 movex( -320, 3 );
		brush1 waittill ("movedone");
		brush2 movex( 320, 3 );
		brush2 waittill ("movedone");
		brush3 movex( -320, 3 );
		brush3 waittill ("movedone");
		brush4 movex( 320, 3 );
		brush4 waittill ("movedone");
		wait(1);
		brush1 movex( 320, 3 );
		brush1 waittill ("movedone");
		brush2 movex( -320, 3 );
		brush2 waittill ("movedone");
		brush3 movex( 320, 3 );
		brush3 waittill ("movedone");
		brush4 movex( -320, 3 );
		brush4 waittill ("movedone");
		}
}

trap_27()
{
	trigger = getent ("trigger27","targetname");
	brush1 =getent("brushz1","targetname");
	brush2 =getent("brushz2","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	while(1)
		{
		brush1 movex( 490, 3 );
		brush1 waittill ("movedone");
		brush2 movex( -490, 3 );
		brush2 waittill ("movedone");
		wait(1);
		brush1 movex( -490, 3 );
		brush1 waittill ("movedone");
		brush2 movex( 490, 3 );
		brush2 waittill ("movedone");
		}
}

trap_28()
{
	trig = getEnt("trigger28", "targetname");

	trig waittill("trigger", player);
	trig delete();

	player TakeAllWeapons();
	player GiveWeapon( "deserteaglegold_mp" );
	wait 0.01;
	player SwitchToWeapon( "deserteaglegold_mp" );


}

trap_29()
{
	trigger = getent ("trigger29","targetname");
	brush =getent("spikestogether","targetname");
	dmg1 =getent("linkeddmg","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	dmg1 enablelinkto();
	dmg1 linkto(brush);

	brush movex( -656, 5 );
	wait 5;
	brush movex( 656, 5 );

}

trap_30()
{
	trigger = getent ("trigger30","targetname");
	blocklooping = getent ("blocklooping","targetname");
	dmg = getent ("trigger_dmg_30","targetname");
	dmg maps\mp\_utility::triggerOff();

	trigger waittill ("trigger");
	trigger delete ();

	dmg maps\mp\_utility::triggerOn();
	PlayFX( level.blue, (-112,7456,80) );
	PlayFX( level.blue, (-288,7456,80) );
	PlayFX( level.blue, (-464,7456,80) );
	dmg PlayLoopSound ("fire_loop");
	wait(3);
	blocklooping movez( -1000, 2 );

}

trap_31()
{
	trigger = getent ("trigger31","targetname");
	brush =getent("removertrap31","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	while(1)
		{
		brush movex( 600, 5 );
		brush waittill ("movedone");
		wait(3);
		brush movex( -600, 5 );
		brush waittill ("movedone");
		wait(3);
		}
}

trap_32()
{
	trigger = getent ("trigger32","targetname");
	dmg = getent ("trigger_dmg_32","targetname");
	dmg maps\mp\_utility::triggerOff();

	trigger waittill ("trigger");
	trigger delete ();

	dmg maps\mp\_utility::triggerOn();
	PlayFX( level.sperm, (-360,8904,72) );
	wait(3);
	dmg maps\mp\_utility::triggerOff();
}

trap_33()
{
	trigger = getent ("trigger33","targetname");
	brush = getent ("smasher33","targetname");
	dmg = getent ("trigger_dmg_33","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	dmg enablelinkto();
	dmg linkto(brush);

		while(1)
		{
		brush movez( -200, 0.5 );
		brush PlaySound ("stoneimpact");
//		EarthQuake( 1, 0.5, smasher.origin, 500 );
		brush waittill ("movedone");
		wait(1);
		brush PlaySound ("stonemove");
		brush movez( 200, 2 );
		brush waittill ("movedone");
		wait(2);
		}

}

trap_34()
{
	trigger = getent ("trigger34","targetname");
	brush = getent("pushmeup","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	wait(0.5);
	brush movez( -800, 2 );
	brush PlaySound ("lightning_hit");
}

trap_35()
{
	trigger = getent ("trigger35","targetname");
	brush = getent("spikesrot","targetname");
	dmg = getent ("dmg_rot","targetname");

	trigger waittill ("trigger");
	trigger delete ();


	dmg enablelinkto();
	dmg linkto(brush);

	brush rotatepitch( 360, 2 );
	brush movex( 288, 2 );
	brush PlaySound ("doormove2");
	wait(2);
	brush movex( -288, 2 );
	brush PlaySound ("doormove2");
}

trap_36()
{
	trigger = getent ("trigger36","targetname");
	brush1 = getent("smasha1","targetname");
	brush2 = getent("smasha2","targetname");
	brush3 = getent("smasha3","targetname");
	brush4 = getent("smasha4","targetname");
	brush5 = getent("smasha5","targetname");
	dmg1 = getent ("dmg_smasha1","targetname");
	dmg2 = getent ("dmg_smasha2","targetname");
	dmg3 = getent ("dmg_smasha3","targetname");
	dmg4 = getent ("dmg_smasha4","targetname");
	dmg5 = getent ("dmg_smasha5","targetname");


	trigger waittill ("trigger");
	trigger delete ();


	dmg1 enablelinkto();
	dmg1 linkto(brush1);
	dmg2 enablelinkto();
	dmg2 linkto(brush2);
	dmg3 enablelinkto();
	dmg3 linkto(brush3);
	dmg4 enablelinkto();
	dmg4 linkto(brush4);
	dmg5 enablelinkto();
	dmg5 linkto(brush5);

while(1)
	{
	brush1 movez( -204, 0.5 );
	brush1 PlaySound ("stoneimpact");

	wait(2);
	brush1 movez( 204, 2 );
	brush1 PlaySound ("stonemove");

	brush2 movez( -204, 0.5 );
	brush2 PlaySound ("stoneimpact");

	wait(2);

	brush2 movez( 204, 2 );
	brush2 PlaySound ("stonemove");

	brush3 movez( -204, 0.5 );
	brush3 PlaySound ("stoneimpact");

	wait(2);

	brush3 movez( 204, 2 );
	brush3 PlaySound ("stonemove");

	brush4 movez( -204, 0.5 );
	brush4 PlaySound ("stoneimpact");

	wait(2);

	brush4 movez( 204, 2 );
	brush4 PlaySound ("stonemove");

	brush5 movez( -204, 0.5 );
	brush5 PlaySound ("stoneimpact");

	wait(2);

	brush5 movez( 204, 2 );
	brush5 PlaySound ("stonemove");
	}
}


trap_37()
{
	trigger = getent ("trigger37","targetname");
	brush = getent("rotaspikes","targetname");
	dmg = getent ("dmg_sikes","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	dmg enablelinkto();
	dmg linkto(brush);

	brush rotateyaw( 18000, 150 );
	brush waittill ("movedone");
}

trap_38()
{
	trigger = getent ("trigger38","targetname");
	brush = getent("deletelie","targetname");

	trigger waittill ("trigger");
	trigger delete ();

	brush delete();

}

trap_39 ()
{
	trigger = getent ("trigger39","targetname");
	brush = getent ("trap_39","targetname");
	killa = getent ("trap_39_dmg","targetname");

	killa maps\mp\_utility::triggerOff();

	trigger waittill ("trigger");
	trigger delete ();

	killa maps\mp\_utility::triggerOn();

	killa enablelinkto ();
	killa linkto (brush);

	brush movez( 36, 0.5 );
	wait 10 ;
	brush movez( -36, 0.5 );
}

trap_40()
{
	trig = getEnt("trigger40", "targetname");

	trig waittill("trigger", who );
	trig delete();

	thread StartFiringLightnings();
}

StartFiringLightnings()
{
	center = (283,8629,354);
	count = 20;

	soundObj = Spawn("script_origin", center );
	wait 0.1;
	while(1)
	{
		if( count > 0 )
		{
			count --;
			x = center+(RandomIntRange(-125,125),RandomIntRange(-125,125),0);
			trace = BulletTrace( x, x-(0,0,1000), false, undefined );
			PlayFX( level.trap["lightning"], trace["position"] );
			PlayFX( level.trap["lightning_dirt"], trace["position"] );
			soundObj.origin = trace["position"];
			soundObj PlaySound("lightning");
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			{
				if( players[i].pers["team"] == "allies" && isAlive( players[i] ) && Distance( trace["position"], players[i].origin ) <= 100 )
					players[i] suicide();
			}
		}
		else
			break;
		wait 0.25+RandomFloat(0.25);
	}
	if( isDefined( soundObj ) )
		soundObj delete();
}

//Written by Rycoon :]

trap_41 ()
{
	trigger = getent ("trigger41","targetname");
	brush = getent ("trap41","targetname");
	brushsound = getent ("trap41_sound","targetname");
	killaa = getent ("trap41_dmg","targetname");


	trigger waittill ("trigger");
	trigger delete ();


	killaa enablelinkto ();
	killaa linkto (brush);

	brush movez( -104, 1 );
	wait 0.5 ;
	brushsound PlaySound ("stoneimpact");
	wait 1.5 ;
	brush movez( 104, 1 );
	wait 2.5 ;
	brush movez( -104, 1 );
	wait 0.5 ;
	brushsound PlaySound ("stoneimpact");
	wait 1.5 ;
	brush movez( 104, 1 );
	wait 2.5 ;
	brush movez( -104, 1 );
	wait 0.5 ;
	brushsound PlaySound ("stoneimpact");
	wait 1.5 ;
	brush movez( 104, 1 );
}

trap_42()
{
	trig = getent ("trigger42","targetname");
	brush = getEnt( "trap42", "targetname" );
	dmg1 = getent ("trap42_dmg_1","targetname");
	dmg2 = getent ("trap42_dmg_2","targetname");
	dmg3 = getent ("trap42_dmg_3","targetname");
	dmg4 = getent ("trap42_dmg_4","targetname");

	dmg1 enablelinkto ();
	dmg1 linkto (brush);

	dmg2 enablelinkto ();
	dmg2 linkto (brush);

	dmg3 enablelinkto ();
	dmg3 linkto (brush);

	dmg4 enablelinkto ();
	dmg4 linkto (brush);

	trig waittill( "trigger", who );
	trig delete();



while(1)
	{
	brush movex( 72, 2 );
	brush waittill ("movedone");
	wait 0.5 ;
	brush movex( -72, 2 );
	brush waittill ("movedone");
	}

}
