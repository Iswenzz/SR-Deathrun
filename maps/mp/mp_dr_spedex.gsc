main()
{
	maps\mp\_load::main();
 	ambientPlay("ambient1");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	
	addTriggerToList( "trap1_trigger" );
	addTriggerToList( "trap2_trigger" );
	addTriggerToList( "trap3_trigger" );	
	addTriggerToList( "trap4_trigger" );	
	addTriggerToList( "trap5_trigger" );	
	addTriggerToList( "trap6_trigger" );
	addTriggerToList( "trap7_trigger" );	
	addTriggerToList( "trap8_trigger" );	
	
	thread begin();
	
	thread screen();
	thread screen2();
	
	thread Secret_song();
	thread Secret_opening1();
	thread Secret_opening2();
	thread Secret_exit();
	thread TheSecret1();
	thread TheSecret2();
	thread TheSecret3();
	
	thread yes();
	thread no();
	thread back();
	
	thread	jump1();
	thread	jump2();
	thread	jump3();

	thread Teleport1();
	thread Teleport2();
	thread Teleport3();	
	
	thread blockje1();
	thread blokje2();
	thread blokje3();
	
	thread Acti_Teleport1();
	thread Acti_Teleport2();
	thread Acti_Teleport3();
	
	thread trap1();	
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	
	thread Jumproom1();
	thread Jumproom2();

	thread go_sniper();
	thread sniper();
	thread knife();
	thread fail_acti();
	thread fail_jumper();
	
	thread ammo1();
	thread ammo2();
	thread ammo3();
	thread ammo4();
	
	thread Credits();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 

screen()
{
trig = getent("screen_trigger","targetname");
brush = getent("screen_brush","targetname");

trig waittill( "trigger" );
{
brush moveX(-200,1);
}
}


screen2()
{
trig = getent("screen2_trigger","targetname");
brush = getent("screen2_brush","targetname");

trig waittill( "trigger" );
{
brush moveX(200,1);
}
}


blockje1()
{
elevator = getent("brick","targetname");
while(1)
{
elevator moveX(-33,1);
elevator waittill("movedone");
elevator moveX(33,1);
elevator waittill("movedone");
}
}

blokje2()
{
elevator1 = getent("blokje2_brush1","targetname");

while(1)
{
elevator1 moveZ(176,2);

wait 4;

elevator1 moveZ(-176,2);

wait 4;
}
}


blokje3()
{
brush1 = getent("blokje4_1","targetname");
brush2 = getent("blokje4_2","targetname");
brush3 = getent("blokje4_3","targetname");
brush4 = getent("blokje4_4","targetname");

while(1)
{
brush1 moveY(608,2);
brush2 moveY(-608,2);
brush3 moveY(-608,2);
brush4 moveY(608,2);
brush1 waittill("movedone");
brush1 moveY(-608,2);
brush2 moveY(608,2);
brush3 moveY(608,2);
brush4 moveY(-608,2);
brush1 waittill("movedone");
}
}


trap1()
{
    trig = getEnt( "trap1_trigger", "targetname" );
    fly1 = getEnt( "trap1_brush1", "targetname" );
    fly2 = getEnt( "trap1_brush2", "targetname" );
    fly3 = getEnt( "trap1_brush3", "targetname" );
    fly4 = getEnt( "trap1_brush4", "targetname" );	
	
	trig waittill( "trigger" );
	
	while(1)
{
	trig delete();
	
    fly1 moveZ( 73, 2 );
    fly2 moveZ( 73, 3 );
    fly4 moveZ( -73, 3 );
	
	wait 1;

    fly3 moveZ( 73, 2 );

	wait 1;
	
    fly1 moveZ( -73, 2 );
    fly2 moveZ( -73, 3 );
    fly4 moveZ( 73, 3 );

	wait 1;

    fly3 moveZ( -73, 2 );

	wait 1;
}
}


trap2()
{
	trig = getEnt( "trap2_trigger", "targetname" );
	brush = getEnt( "trap2_brush", "targetname" );

	
	trig waittill( "trigger" );
while(1)
{
	trig delete();
	brush rotateyaw (1080,3);
	brush waittill ("rotatedone");
	wait 3 ;

}
}


trap3()
{
    trig = getEnt( "trap3_trigger", "targetname" );
    panel = getEnt( "trap3_panel", "targetname" );
    brush = getEnt( "trap3_brush", "targetname" );
	
    trig waittill( "trigger" );
	
	brush moveY( 272, 5 );
	
	trig delete();
}


trap4()
{
	trig = getEnt( "trap4_trigger", "targetname" );
	brush1 = getEnt( "trap4_brush1", "targetname" );
	brush2 = getEnt( "trap4_brush2", "targetname" );

	trig waittill( "trigger" );
	
	while(1)
{
	trig delete();

	brush1 moveY( 130, 1 );	
	brush2 moveY( -130, 1 );
	
	wait 3;
	
	brush1 moveY( -130, 1 );	
	brush2 moveY( 130, 1 );

	wait 3;
}
}


trap5()
{
	trig = getEnt( "trap5_trigger", "targetname" );
	brush1 = getEnt( "trap5_brush1", "targetname" );
	brush2 = getEnt( "trap5_brush2", "targetname" );

	trig waittill( "trigger" );
	
	while(1)
	{
	trig delete();
	
	brush1 moveZ(50,1);
	brush2 moveZ(-50,1);
	brush1 waittill("movedone");
	brush1 moveZ(-100,1);
	brush2 moveZ(100,1);
	brush1 waittill("movedone");
	brush1 moveZ(100,1);
	brush2 moveZ(-100,1);
	brush1 waittill("movedone");
	brush1 moveZ(-50,1);
	brush2 moveZ(50,1);
	brush1 waittill("movedone");
}
}

trap6()
{
	trig = getEnt( "trap6_trigger", "targetname" );
	brush1 = getEnt( "trap6_brush1", "targetname" );
	brush2 = getEnt( "trap6_brush2", "targetname" );

	trig waittill( "trigger" );
	
	trig delete();
	
	while(1)
	{
	brush1 moveX(100,1.5);
	brush2 moveX(-100,1.5);
	brush1 waittill("movedone");
	brush1 moveX(-100,1.5);
	brush2 moveX(100,1.5);
	brush1 waittill("movedone");
}
}

trap7()
{
	trig = getEnt( "trap7_trigger", "targetname" );
	brush1 = getEnt( "trap7_brush1", "targetname" );
	brush2 = getEnt( "trap7_brush2", "targetname" );

	trig waittill( "trigger" );
	
	while(1)
	{
	trig delete();
	
	brush1 moveZ(90,1.5);
	brush2 moveZ(-90,1.5);
	brush1 waittill("movedone");
	wait 1;
	brush1 moveZ(-90,1.5);
	brush2 moveZ(90,1.5);
	brush1 waittill("movedone");
	wait 1;
	brush1 moveZ(-90,1.5);
	brush2 moveZ(90,1.5);
	brush1 waittill("movedone");
	wait 1;
	brush1 moveZ(90,1.5);
	brush2 moveZ(-90,1.5);
	brush1 waittill("movedone");
	wait 1;
}
}

trap8()
{
	trig = getEnt( "trap8_trigger", "targetname" );
	brush1 = getEnt( "trap8_brush1", "targetname" );
	brush2 = getEnt( "trap8_brush2", "targetname" );
	brush3 = getEnt( "trap8_brush3", "targetname" );
	brush4 = getEnt( "trap8_brush4", "targetname" );
	brush5 = getEnt( "trap8_brush5", "targetname" );
	brush6 = getEnt( "trap8_brush6", "targetname" );
	brush7 = getEnt( "trap8_brush7", "targetname" );
	brush8 = getEnt( "trap8_brush8", "targetname" );
	brush9 = getEnt( "trap8_brush9", "targetname" );
	brush10 = getEnt( "trap8_brush10", "targetname" );
	brush11 = getEnt( "trap8_brush11", "targetname" );
	brush12 = getEnt( "trap8_brush12", "targetname" );
	brush13 = getEnt( "trap8_brush13", "targetname" );
	brush14 = getEnt( "trap8_brush14", "targetname" );
	brush15 = getEnt( "trap8_brush15", "targetname" );
	brush16 = getEnt( "trap8_brush16", "targetname" );
	brush17 = getEnt( "trap8_brush17", "targetname" );
	brush18 = getEnt( "trap8_brush18", "targetname" );

	trig waittill( "trigger" );
	
	while(1)
	{
	trig delete();
	
	brush1 rotateyaw (360,1);
	brush2 rotateyaw (360,1);
	brush3 rotateyaw (360,1);
	brush4 rotateyaw (360,1);
	brush5 rotateyaw (360,1);
	brush6 rotateyaw (360,1);
	brush7 rotateyaw (360,1);
	brush8 rotateyaw (360,1);
	brush9 rotateyaw (360,1);
	brush1 waittill ("rotatedone");
	
	brush10 rotateyaw (360,1);
	brush11 rotateyaw (360,1);
	brush12 rotateyaw (360,1);
	brush13 rotateyaw (360,1);
	brush14 rotateyaw (360,1);
	brush15 rotateyaw (360,1);
	brush16 rotateyaw (360,1);
	brush17 rotateyaw (360,1);
	brush18 rotateyaw (360,1);
	brush10 waittill ("rotatedone");
}
}


begin()
{
brush1 = getent("begin_brush1","targetname");
brush2 = getent("begin_brush2","targetname");
brush3 = getent("begin_brush3","targetname");
brush4 = getent("begin_brush4","targetname");
brush5 = getent("begin_brush7","targetname");
trig = getent("begin_trigger","targetname");

for(;;)
{
trig waittill ("trigger", player);

trig delete();
brush5 notsolid();
brush1 moveX(4,3);
wait 1 ;
brush2 moveX(6,2);
wait 1 ;
brush3 moveZ(-112,3);
brush4 moveZ(-112,3);
}
}

Secret_song()
{
trig = getent("secretsong_trigger","targetname");
brush = getent("secretsong_brush","targetname");
for(;;)
{
	trig waittill ("trigger", player);
	
	trig delete();
	brush moveZ(200,3);
	AmbientStop( 4 );
	wait 1 ;
	AmbientPlay( "ambient4" );

	iPrintlnBold( " ^9" + player.name + " ^4 Opend the ^1SECRET" );
}
}

Secret_opening1()
{
trig = getent("secret_open1","targetname");
brush = getent("secret_open_brush1","targetname");

for(;;)
{
trig waittill ("trigger", player);
	
brush notsolid();
}
}


Secret_opening2()
{
trig = getent("secret_open2","targetname");
brush = getent("secret_open_brush2","targetname");

for(;;)
{
trig waittill ("trigger", player);
	
brush notsolid();
}
}


Secret_exit()
{
	trig = getEnt ("secret_exit", "targetname");
	target = getEnt ("secret_orgin", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}

TheSecret1()
{
	trig = getEnt ("TheSecret_trigger1", "targetname");
	brush1 = getEnt ("TheSecret_door1", "targetname");
	brush2 = getEnt ("TheSecret_door2", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);

	trig delete();
	
	player iprintlnbold( " ^2Hello ^1"+ player.name );
	wait 1;
	AmbientStop( 4 );
	AmbientPlay( "ambient6" );
	
	brush1 moveY(80,3);
	brush2 moveY(-80,3);
	wait 5;
	brush1 moveY(-80,3);
	brush2 moveY(80,3);
	}
}

TheSecret2()
{
	trig = getEnt ("TheSecret_trigger2", "targetname");
	brush = getEnt ("TheSecret_up", "targetname");
	brush2 = getEnt ("TheSecret_door3", "targetname");
	brush3 = getEnt ("TheSecret_door4", "targetname");
	for(;;)
	{
	trig waittill ("trigger", player);
	
	wait 2;
	brush2 moveY(-80,3);
	brush3 moveY(80,3);
	wait 3;
	brush moveZ(144,2);
	
	brush2 moveY(80,3);
	brush3 moveY(-80,3);
	}
}

TheSecret3()
{
	trig = getEnt ("TheSecret_trigger3", "targetname");
	target = getEnt ("TheSecret_target", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);

	player braxi\_rank::giveRankXP("", 1000);
	
        hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.5;
	hud_clock.glowalpha = 4;
	hud_clock.glowcolor = (7,7,7);
	hud_clock.label = &"^9We got a WINNER!!!";
                   hud_clock SetPulseFX( 40, 5400, 200 );

	wait 3;
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}

yes()
{
yes = getent("trigger_yes","targetname");

yes waittill ("trigger", player);

iPrintlnBold( " ^1" + player.name + " ^3 found the last ^2SNIPER" );

player GiveWeapon( "m40a3_mp" );
	
wait 0.5 ;
	
player switchToWeapon( "m40a3_mp" );
}



no()
{
yes = getent("trigger_yes","targetname");

}

jump1()
{
	trig = getEnt ("jump1_trigger", "targetname");
	target = getEnt ("jump1_target", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );

}
}

Back()
{
	trig = getEnt ("back_trigger", "targetname");
	target = getEnt ("back_target", "targetname");
	brush = getEnt ("TheSecret_brush1", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);

	iPrintlnBold( " ^8" + player.name + " ^4 Cant finish the ^1SECRET" );
	
	brush notsolid();
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );

}
}

jump2()
{
	trig = getEnt ("jump2_trigger", "targetname");
	target = getEnt ("jump2_target", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );

}
}

jump3()
{
	trig = getEnt ("jump3_trigger", "targetname");
	target = getEnt ("jump3_target", "targetname");

	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );

}
}


Teleport1()
{
	trig = getEnt ("teleport_trigger1", "targetname");
	target = getEnt ("teleport_target1", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}

Teleport2()
{
	trig = getEnt ("teleport_trigger2", "targetname");
	target = getEnt ("teleport_target2", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}


Teleport3()
{
	trig = getEnt ("teleport_trigger3", "targetname");
	target = getEnt ("teleport_target3", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}

Acti_Teleport1()
{
	trig = getEnt ("acti_trigger1", "targetname");
	target = getEnt ("acti_target1", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}


Acti_Teleport2()
{
	trig = getEnt ("acti_trigger2", "targetname");
	target = getEnt ("acti_target2", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}


Acti_Teleport3()
{
	trig = getEnt ("acti_trigger3", "targetname");
	target = getEnt ("acti_target3", "targetname");
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
	}
}


ammo1()
{
	trig = getEnt( "ammo1", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player iprintlnbold("^1Loading Ammo...");
	player TakeAllWeapons();
	wait 4;
	player iprintlnbold("^2Ammo Loaded...");
	player GiveWeapon( "m40a3_mp" );
	player switchToWeapon( "m40a3_mp" );
	}
}

ammo2()
{
	trig = getEnt( "ammo2", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player iprintlnbold("^1Loading Ammo...");
	player TakeAllWeapons();
	wait 4;
	player iprintlnbold("^2Ammo Loaded...");
	player GiveWeapon( "m40a3_mp" );
	player switchToWeapon( "m40a3_mp" );
	}
}

ammo3()
{
	trig = getEnt( "ammo3", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player iprintlnbold("^1Loading Ammo...");
	player TakeAllWeapons();
	wait 4;
	player iprintlnbold("^2Ammo Loaded...");
	player GiveWeapon( "m40a3_mp" );
	player switchToWeapon( "m40a3_mp" );
	}
}

ammo4()
{
	trig = getEnt( "ammo4", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
	
	player iprintlnbold("^1Loading Ammo...");
	player TakeAllWeapons();
	wait 4;
	player iprintlnbold("^2Ammo Loaded...");
	player GiveWeapon( "m40a3_mp" );
	player switchToWeapon( "m40a3_mp" );
	}
}

Credits()
{
        trig = getEnt("credits_trigger","targetname");

		trig waittill("trigger",players);
        trig delete();
          {
				wait 1;
        hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 5;
	hud_clock.glowcolor = (9,9,9);
	hud_clock.label = &"^9Map Made By ERIK";
                   hud_clock SetPulseFX( 40, 5400, 200 );
                   wait 3;
}
}

go_sniper()
{
	trig = getent("go_sniper_trigger", "targetname");
	sniper = getEnt( "go_sniper", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
	player SetPlayerAngles( sniper.angles );
    player setOrigin( sniper.origin ); 
}
}


sniper()
{
   
	level.final_trigger = getEnt( "sniper_trigger", "targetname");
    jump = getEnt( "sniper_jump_target", "targetname" );
    acti = getEnt( "sniper_acti_target", "targetname" );
	

     while(1)
    {
        level.final_trigger waittill( "trigger", player );
        if( !isDefined( level.final_trigger ) )
            return;
        
		level.final_trigger_k delete();
        level.final_trigger_d delete();
		
		
         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient5" );
        player switchToWeapon( "remington700_mp" ); 
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Sniper Room";
				noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
			
    }

}

knife()
{
   
	level.final_trigger_k = getEnt( "final_trigger", "targetname");
    jump = getEnt( "final_jumper_teleport", "targetname" );
    acti = getEnt( "final_activator_teleport", "targetname" );
	
     while(1)
    {
        level.final_trigger_k waittill( "trigger", player );
        if( !isDefined( level.final_trigger_k ) )
            return;
        
        level.final_trigger_d delete();
        level.final_trigger delete();
      
         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
		player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient3" );
        player switchToWeapon( "knife_mp" ); 
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Knife Room";
				noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
			
    }

}

Jumproom1()
{
	level.final_trigger_d = getent("jump_trigger", "targetname");
	jump = getEnt( "jump_target", "targetname" );
	
	for(;;)
	{
	level.final_trigger_d waittill ("trigger", player);
	player SetPlayerAngles( jump.angles );
    player setOrigin( jump.origin );
    player TakeAllWeapons();
    player GiveWeapon( "knife_mp" );
	player GiveWeapon( "knife_mp" );        
}
}

Jumproom2()
{
	trig = getent("acti_trigger4", "targetname");
	acti = getEnt( "acti_target4", "targetname" );
	
	for(;;)
	{
	trig waittill ("trigger", player);
   
    level.activ setPlayerangles( acti.angles );
    level.activ setOrigin( acti.origin );
	level.activ TakeAllWeapons();
    level.activ GiveWeapon( "knife_mp" );
	level.activ GiveWeapon( "knife_mp" );    
	AmbientStop( 4 );
	AmbientPlay( "ambient2" );
	trig delete();
}
}

fail_acti()
{
	trig = getent("fail1_trigger", "targetname");
    acti = getEnt( "acti_target4", "targetname" );

	while (1)
	{
	trig waittill( "trigger", player );
	if(player == level.activ)
	{
	wait (0.05);
	level.activ setPlayerangles( acti.angles );
    level.activ setOrigin( acti.origin );
	}	
}
}

fail_jumper()
{
	trig = getent("fail2_trigger", "targetname");
	jump = getEnt( "jump_target", "targetname" );

	while (1)
	{
	trig waittill( "trigger", player );
	{
	wait (0.05);
	player setPlayerangles( jump.angles );
    player setOrigin( jump.origin );
	}	
}
}