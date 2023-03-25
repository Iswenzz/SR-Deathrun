main()
{
    addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
	addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
	addTriggerToList("trig_trap11");
	
	maps\mp\_load::main();
	maps\mp\_teleport1::main();
	maps\mp\_teleport2::main();
	maps\mp\_teleport3::main();
	maps\mp\_teleport4::main();
	level._effect["car_damage_blacksmoke"] = loadfx( "mp_dr_theshack/car_damage_blacksmoke" );
	level._effect["car_damage_blacksmoke"] = loadfx( "mp_dr_theshack/car_damage_blacksmoke" );
	level._effect["car_damage_blacksmoke"] = loadfx( "mp_dr_theshack/car_damage_blacksmoke" );
    ambientPlay("song1");
    
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
	
	thread credit();
	thread trap1();
	thread trap2();
	thread trap3();
	thread lelz();
	thread house();
	thread secret_weapon();
	thread secret_weapon2();
	thread secret_door();
	thread lever4secret();
	thread trap4();
	thread trap5();
	thread trap6();
	thread basement();
	thread trap7();
	thread trap8();
	thread trap9();
	thread pendrek();
	thread trap10();
	thread rucka();
	thread hitler();
	thread pustajplin();
	thread trap11();
	thread messages1();
	thread messages2();
	thread messages3();
	thread oldroom();
	thread sniperoom();
	thread kniferoom();
	thread bounceroom();
	thread takesniper();
	thread msg();
	
}

msg()
{
iprintln( "^1>>^1Playing: ^9Linking Park-Became a part of me");	
}
addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

credit()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "^2The Shack" );
wait(6);
thread drawInformation( 800, 0.8, 1, "^3Xplosive" );
wait(6);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}

trap1()
{
trigger = getent("trig_trap1","targetname");
object1 = getent("trap1_1","targetname");
object2 = getent("trap1_2","targetname");
object3 = getent("trap1_3","targetname");
object4 = getent("trap1_4","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 RotateYaw(360, 1);
object2 RotateYaw(-360, 1);
wait(1.9);
object3 RotateYaw(360, 1);
object4 RotateYaw(-360, 1);
wait(1.9);
}
}

trap2()
{
	part1 = getentarray ("trap2_1" ,"targetname");
	part2 = getentarray ("trap2_2" ,"targetname");
	trig = getent ("trig_trap2" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				part1[randomInt(part1.size)] hide();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();
                part2[randomInt(part2.size)] hide();				
				
		default: return;
	}
}

trap3()
{
trigger = getent("trig_trap3","targetname");
object1 = getent("trap3_1","targetname");
object2 = getent("trap3_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 notsolid();
object1 hide();
wait(1);
object2 moveZ(144, 1);
wait(1);
object2 RotateYaw(360, 1);
wait(1);
object2 RotateYaw(-360, 1);
wait(1);
object2 moveZ(-144, 1);
object1 solid();
object1 show();
}
}

lelz()
{
object1 = getent("rotate_1","targetname");
object2 = getent("rotate_2","targetname");
while(1)
{
object1 rotateYaw(360, 3);
object1 notsolid();
object2 rotateYaw(360, 3);
object2 notsolid();
wait(1);
}
}

house()
{
trigger = getent("open_door","targetname");
object1 = getent("door_1","targetname");
object2 = getent("door_2","targetname");
object3 = getent("door_3","targetname");
object4 = getent("door_4","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
iprintlnbold(" ^3" + player.name + " ^4Entered The Shack");
wait(0.1);
object1 moveX(72, 1);
object2 moveX(-72, 1);
object3 moveX(72, 1);
object4 moveX(-72, 1);
}
}

secret_weapon()
{
trigger = getent("take_weapon","targetname");
trigger waittill ("trigger" , player );
{
iprintlnbold(" ^3" + player.name + " ^4Took secret weapon");
player GiveWeapon( "remington700_mp" );
player switchToWeapon( "remington700_mp" );
}
}

secret_weapon2()
{
trigger = getent("take_weapon1","targetname");
trigger waittill ("trigger" , player );
{
iprintlnbold(" ^3" + player.name + " ^4Took secret weapon");
player GiveWeapon( "m40a3_mp" );
player switchToWeapon( "m40a3_mp" );
}
}

secret_door()
{
trigger = getent("secret_open","targetname");
trigger waittill ("trigger" , player );
object = getent("secret_door","targetname");
trigger delete();
{
iprintlnbold(" ^3" + player.name + " ^4Opened secret!");
wait(0.1);
object notsolid();
wait(1);
}
}

lever4secret()
{
trigger = getent("lever","targetname");
trigger waittill ("trigger" , player );
object1 = getent("lever_down","targetname");
object2 = getent("doorsss","targetname");
object3 = getent("wall_back","targetname");
trigger delete();
{
object1 MoveZ(-20, 1);
wait(1);
object2 moveZ(144, 1);
wait(0.1);
object3 moveY(-64, 1);
wait(0.1);
}
}

trap4()
{
trigger = getent("trig_trap4","targetname");
object1 = getent("trap4","targetname");
object2 = getent("trap4_1","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object2 MoveX(-20, 1);
wait(0.1);
object1 notsolid();
object1 hide();
}
}

trap5()
{
trigger = getent("trig_trap5","targetname");
object2 = getent("trap5_1","targetname");
object3 = getent("trap5_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object2 moveX(192, 1);
object3 moveX(-192, 1);
wait(3);
object2 moveX(-192, 1);
object3 moveX(192, 1);
wait(2);
}
}

trap6()
{
trigger = getent("trig_trap6","targetname");
object1 = getent("trap6","targetname");
object2 = getent("trap6_1","targetname");
killtrigger = getent ("killtrig_6" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(0.1);
killtrigger enablelinkto ();
killtrigger linkto (object1);
object2 moveZ(-188, 1);
object2 waittill("movedone");
wait(1);
object2 moveZ(188, 1);
object2 waittill("movedone");
}
}

basement()
{
trigger = getent("open_basement","targetname");
object1 = getent("basement_lever","targetname");
object2 = getent("basement_door1","targetname");
object3 = getent("basement_door2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
iprintlnbold(" ^3" + player.name + " ^4Opened Basement!");
object1 MoveZ(-16, 1);
wait(0.1);
object2 moveX(110, 0.1);
object2 rotatePitch(90, 1);
object3 moveX(-110, 0.1);
object3 rotatePitch(-90, 1);
}
}

trap7()
{
trigger = getent("trig_trap7","targetname");
object1 = getent("trap7","targetname");
object2 = getent("trap7_1","targetname");
object3 = getent("trap7_2","targetname");
object4 = getent("trap7_3","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(1);
object4 hide();
object4 notsolid();
wait(0.1);
object2 moveX(-316, 0.5);
object3 moveX(316, 0.5);
wait(0.5);
object2 moveX(316, 0.5);
object3 moveX(-316, 0.5);
wait(0.1);
object4 show();
object4 solid();
}
}

trap8()
{
trigger = getent("trig_trap8","targetname");
object1 = getent("trap8","targetname");
object2 = getent("trap8_1","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(1);
object2 rotateYaw(360, 1);
object2 waittill("movedone");
wait(1);
object2 rotateYaw(-360, 1);
object2 waittill("movedone");
}
}

trap9()
{
    object1 = getent("trap9","targetname");
	part1 = getentarray ("trap9_1" ,"targetname");
	part2 = getentarray ("trap9_2" ,"targetname");
	part3 = getentarray ("trap9_3" ,"targetname");
	part4 = getentarray ("trap9_4" ,"targetname");
	trig = getent ("trig_trap9" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);
	object1 MoveX(-20, 1);
    wait(1);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				part4[randomInt(part4.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();
				part3[randomInt(part3.size)] notsolid();		
				
		default: return;
	}
}

pendrek()
{
object = getent("pendrek","targetname");
while(1)
{
object moveY(524, 3);
object waittill("movedone");
wait(0.5);
object moveY(-524, 3);
object waittill("movedone");
wait(0.5);
}
}

trap10()
{
trigger = getent("trig_trap10","targetname");
object1 = getent("trap10","targetname");
object2 = getent("trap10_1","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(1);
object2 moveZ(497, 0.1);
object2 waittill("movedone");
wait(1);
object2 moveZ(-497, 3);
object2 waittill("movedone");
}
}

rucka()
{
trigger = getent("trig_trap5","targetname");
object1 = getent("rucka","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(0.1);
}
}

trap11()
{
trigger = getent("trig_trap11","targetname");
object1 = getent("trap11","targetname");
object2 = getent("plinskakomora","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 MoveX(-20, 1);
wait(1);
object2 moveZ(-288, 0.1);
object2 waittill("movedone");
wait(15);
object2 moveZ(288, 3);
object2 waittill("movedone");
}
}

hitler()
{
trig = getent("pliin","targetname");
trig waittill("trigger", user );
{
PlayFX(level._effect["car_damage_blacksmoke"],(-160, 10612, -764));
PlayFX(level._effect["car_damage_blacksmoke"],(-244, 10612, -768));
PlayFX(level._effect["car_damage_blacksmoke"],(-348, 10612, -764));
}
}

pustajplin()
{
object = getent("pustajplin","targetname");
{
object notsolid();
wait(1);
}
}

messages1()
{
while (1)
	{
		{
		iprintln( "^1>>^7Map Creator ^5Xplosive");
		wait 30;
		}
	}
}

messages2()
{
while (1)
	{
		{
		iprintln( "^1>>^7Xfire: ^5seljofk13");
		wait 30;
		}
	}
}

messages3()
{
while (1)
	{
		{
		iprintln( "^1>>^7Thaks to ^5eBc|Legend ^7for effects");
		wait 30;
		}
	}
}

oldroom()
{
level.old_trig = getent("old_trig","targetname"); 
door = getent ("old","targetname");
{
level.old_trig waittill ("trigger" , user );
level.old_trig delete();
level.hh_trig delete();
level.snipe_trig delete();
level.knife_trig delete();
level.bounce_trig delete();
{
door moveZ(-200, 3);
door waittill("movedone");
wait 1;
}
}
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniper", "targetname");
    jump = getEnt( "jump_sniper", "targetname" );
    acti = getEnt( "acti_sniper", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.hh_trig delete();
        level.bounce_trig delete();
		level.knife_trig delete();
		level.old_trig delete();
		level.firstenter=false;
		}
		ambientplay("sniperv2");
		iprintln("^1Playng:^7 Hollywood Undead - Undead");
        iPrintlnBold( "^7" + player.name + " ^9Chose ^2Sniper^7!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
	    player freezeControls(true);
		level.activ freezeControls(true);
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
	    wait 0.1;
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon( "m40a3_mp" );
		player switchToWeapon( "remington700_mp" );
	    wait 0.1;
		level.activ GiveWeapon( "remington700_mp" );
                level.activ GiveWeapon( "m40a3_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
	    player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
    }
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jump_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.hh_trig delete();
        level.snipe_trig delete();
        level.bounce_trig delete();
		level.old_trig delete();
		level.firstenter=false;
		}
		ambientplay("knifev2");
		iprintln("^1Playng:^7 DJ Snake, Lil Jon - Turn Down for What");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );     
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( "^7" + player.name + " ^2Chose ^3Knife^7!" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

bounceroom()
{
    level.bounce_trig = getEnt( "bounce", "targetname");
    jump = getEnt( "jump_bounce", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );
    
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if( !isDefined( level.bounce_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.hh_trig delete();
        level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
		ambientplay("jumpv2");
		iprintln("^1Playng:^7 I'm an Albatraoz - AronChupa - DJ Mark");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );     
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( "^7" + player.name + " ^2Chose ^3Bounce^7!" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}


takesniper()
{
trigger = getent("takesniper","targetname");
trigger waittill ("trigger" , player );
{
player GiveWeapon( "remington700_mp" );
player switchToWeapon( "remington700_mp" );
}
}