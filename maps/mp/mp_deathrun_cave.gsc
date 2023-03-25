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
	addTriggerToList("trig_trap12");
	addTriggerToList("trig_trap13");
	addTriggerToList("trig_trap14");
	addTriggerToList("trig_trap15");
	addTriggerToList("trig_trap16");
    addTriggerToList("trig_trap17");
	addTriggerToList("trig_trap18");
	addTriggerToList("trig_trap19");
	addTriggerToList("trig_trap20");
	addTriggerToList("trig_trap21");
	addTriggerToList("trig_trap22");
	addTriggerToList("trig_trap23");
	addTriggerToList("trig_trap24");
	addTriggerToList("trig_trap25");
	addTriggerToList("trig_trap26");
	addTriggerToList("trig_trap27");
	
	precacheitem("rpg_mp");
	
	maps\mp\_load::main();
	maps\mp\_teleport1::main(); 
	maps\mp\_teleport2::main();
	maps\mp\_teleport3::main(); 
	maps\mp\_teleport4::main();
	maps\mp\_teleport5::main();
	maps\mp\_teleport6::main();
	maps\mp\_teleport7::main();
	maps\mp\_teleport8::main();
	maps\mp\_teleport9::main();
	
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
	thread start_door();
	thread trap1();
	thread trap2();
	thread trap3();
	thread elev();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread trap17();
	thread trap18();
	thread trap19();
	thread trap20();
	thread trap21();
	thread trap22();
	thread trap23();
	thread trap24();
	thread trap25();
	thread trap26();
	thread trap27();
	thread final_door();
	thread sniperoom();
	thread shotgunroom();
	thread kniferoom();
	thread rpgroom();
	thread kniferoom();
	thread bounceroom();
	thread old();
	thread crazyfloor();
	thread messages1();
	thread messages2();
	
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
thread drawInformation( 800, 0.8, 1, "^1Cave" );
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

start_door()
{
object1 = getent("start_door1","targetname");
object2 = getent("start_door2","targetname");
{
wait(10);
ambientPlay("music3");
iprintln( "^1>>^1Playing: ^9Make it Bun Dem - Skrillex & Damian Marley");
object1 moveY(50, 3);
object2 moveY(-50, 3);
wait(4);
}
}	

trap1()
{
trigger = getent("trig_trap1","targetname");
object = getent("trap1","targetname");
killtrigger = getent ("killtrig_1" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveY(300, 1.5);
object waittill("movedone");
wait(2);
object moveY(-300, 3);
object waittill("movedone");
wait(1);
}
}

trap2()
{
trigger = getent("trig_trap2","targetname");
object1 = getent("trap2_1","targetname");
object2 = getent("trap2_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 moveY(68, 1);
object2 moveY(-68, 1);
wait(1);
object1 moveY(-68, 2.5);
object2 moveY(68, 2.5);
wait(2.5);
}
}

trap3()
{
trigger = getent("trig_trap3","targetname");
object = getent("trap3","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object rotateYaw(360, 1);
wait(2);
object rotateYaw(-360, 1);
wait(2);
}
}

elev()
{
object = getent("elev","targetname");
while(1)
{
object moveX(-704, 1);
object waittill("movedone");
wait(4);
object moveX(704, 4);
object waittill("movedone");
wait(1);
}
}

trap4()
{
trigger = getent("trig_trap4","targetname");
object = getent("trap4","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(236, 0.1);
wait(4);
object moveY(-236, 4);
wait(1);
}
}

trap5()
{
trigger = getent("trig_trap5","targetname");
object = getent("trap5","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object notsolid();
object hide();
wait(4);
object solid();
object show();
wait(1);
}
}

trap6()
{
trigger = getent("trig_trap6","targetname");
object1 = getent("trap6_1","targetname");
object2 = getent("trap6_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 moveZ(48, 1);
object2 moveZ(-48, 1);
wait(1);
object1 moveZ(-48, 2.5);
object2 moveZ(48, 2.5);
wait(2.5);
}
}

trap7()
{
trigger = getent("trig_trap7","targetname");
object1 = getent("trap7_1","targetname");
object2 = getent("trap7_2","targetname");
object3 = getent("trap7_3","targetname");
object4 = getent("trap7_4","targetname");
killtrigger1 = getent ("killtrig_7_1" , "targetname");
killtrigger2 = getent ("killtrig_7_2" , "targetname");
killtrigger3 = getent ("killtrig_7_3" , "targetname");
killtrigger4 = getent ("killtrig_7_4" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
killtrigger1 enablelinkto ();
killtrigger1 linkto (object1);
object1 moveZ(-140, 1.5);
object1 waittill("movedone");
wait(2);
object1 moveZ(140, 3);
object1 waittill("movedone");
wait(1);
killtrigger2 enablelinkto ();
killtrigger2 linkto (object2);
object2 moveZ(-140, 1.5);
object2 waittill("movedone");
wait(2);
object2 moveZ(140, 3);
object2 waittill("movedone");
wait(1);
killtrigger3 enablelinkto ();
killtrigger3 linkto (object3);
object3 moveZ(-140, 1.5);
object3 waittill("movedone");
wait(2);
object3 moveZ(140, 3);
object3 waittill("movedone");
wait(1);
killtrigger4 enablelinkto ();
killtrigger4 linkto (object4);
object4 moveZ(-140, 1.5);
object4 waittill("movedone");
wait(2);
object4 moveZ(140, 3);
object4 waittill("movedone");
wait(1);
}
}

trap8()
{
	part1 = getentarray ("trap8_1" ,"targetname");
	part2 = getentarray ("trap8_2" ,"targetname");
	part3 = getentarray ("trap8_3" ,"targetname");
	part4 = getentarray ("trap8_4" ,"targetname");
	trig = getent ("trig_trap8" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);

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

trap9()
{
trigger = getent("trig_trap9","targetname");
object1 = getent("trap9_1","targetname");
object2 = getent("trap9_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 rotateRoll(360, 1);
wait(2);
object1 rotateRoll(-360, 1);
wait(2);
object2 rotateRoll(360, 1);
wait(2);
object2 rotateRoll(-360, 1);
wait(2);
}
}

trap10()
{
trigger = getent("trig_trap10","targetname");
object = getent("trap10","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object notsolid();
object hide();
wait(4);
}
}

trap11()
{
trigger = getent("trig_trap11","targetname");
object = getent("trap11","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object notsolid();
object hide();
wait(4);
object solid();
object show();
wait(1);
}
}

trap12()
{
	part1 = getentarray ("trap12_1" ,"targetname");
	part2 = getentarray ("trap12_2" ,"targetname");
	trig = getent ("trig_trap12" , "targetname");

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

trap13()
{
trigger = getent("trig_trap13","targetname");
object = getent("trap13","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveZ(-208, 0.1);
wait(4);
object moveZ(208, 4);
wait(1);
}
}

trap14()
{
trigger = getent("trig_trap14","targetname");
object1 = getent("trap14_1","targetname");
object2 = getent("trap14_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 moveY(48, 1);
object2 moveY(-48, 1);
wait(1);
object1 moveY(-48, 1);
object2 moveY(48, 1);
wait(1);
}
}

trap15()
{
trigger = getent("trig_trap15","targetname");
object1 = getent("trap15_1","targetname");
object2 = getent("trap15_2","targetname");
object3 = getent("trap15_3","targetname");
object4 = getent("trap15_4","targetname");
object5 = getent("trap15_5","targetname");
object6 = getent("trap15_6","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 notsolid ();
object1 hide ();
wait(0.1);
object2 rotateYaw(360, 1);
wait(2);
object3 notsolid ();
object3 hide ();
wait(0.1);
object4 rotateYaw(360, 1);
wait(2);
object5 notsolid ();
object5 hide ();
wait(0.1);
object6 rotateYaw(360, 1);
wait(2);
}
}

trap16()
{
trigger = getent("trig_trap16","targetname");
object1 = getent("trap16_1","targetname");
object2 = getent("trap16_2","targetname");
object3 = getent("trap16_3","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 rotateYaw(360, 1);
object2 rotateYaw(360, 1);
object3 rotateYaw(360, 1);
wait(2);
}
}

trap17()
{
trigger = getent("trig_trap17","targetname");
object1 = getent("trap17_1","targetname");
object2 = getent("trap17_2","targetname");
object3 = getent("trap17_3","targetname");
object4 = getent("trap17_4","targetname");
killtrigger1 = getent ("killtrig_17_1" , "targetname");
killtrigger2 = getent ("killtrig_17_2" , "targetname");
killtrigger3 = getent ("killtrig_17_3" , "targetname");
killtrigger4 = getent ("killtrig_17_4" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
killtrigger1 enablelinkto ();
killtrigger1 linkto (object1);
object1 moveZ(42, 1);
object1 waittill("movedone");
wait(1);
object1 moveZ(-42, 1);
object1 waittill("movedone");
wait(1);
killtrigger2 enablelinkto ();
killtrigger2 linkto (object1);
object2 moveZ(42, 1);
object2 waittill("movedone");
wait(1);
object2 moveZ(-42, 1);
object2 waittill("movedone");
wait(1);
killtrigger2 enablelinkto ();
killtrigger2 linkto (object1);
object2 moveZ(42, 1);
object2 waittill("movedone");
wait(1);
object2 moveZ(-42, 1);
object2 waittill("movedone");
wait(1);
killtrigger4 enablelinkto ();
killtrigger4 linkto (object1);
object4 moveZ(42, 1);
object4 waittill("movedone");
wait(1);
object4 moveZ(-42, 1);
object4 waittill("movedone");
wait(1);
}
}

trap18()
{
trigger = getent("trig_trap18","targetname");
object = getent("trap18","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object rotateYaw(360, 1);
wait(2);
}
}

trap19()
{
trigger = getent("trig_trap19","targetname");
object1 = getent("trap19_1","targetname");
object2 = getent("trap19_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 rotatePitch(360, 1);
object2 rotatePitch(360, 1);
wait(2);
}
}

trap20()
{
trigger = getent("trig_trap20","targetname");
object = getent("trap20","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(236, 0.1);
wait(4);
object moveY(-236, 4);
wait(1);
}
}

trap21()
{
trigger = getent("trig_trap21","targetname");
object1 = getent("trap21_1","targetname");
object2 = getent("trap21_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 moveY(200, 1);
object2 moveY(200, 1);
wait(1);
object1 moveY(-200, 1);
object2 moveY(-200, 1);
wait(1);
}
}

trap22()
{
trigger = getent("trig_trap22","targetname");
object1 = getent("trap22_1","targetname");
object2 = getent("trap22_2","targetname");
object3 = getent("trap22_3","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 moveY(192, 1);
object2 moveY(192, 1);
object3 moveY(192, 1);
}
}

trap23()
{
trigger = getent("trig_trap23","targetname");
object1 = getent("trap23_1","targetname");
object2 = getent("trap23_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 moveY(-121, 1);
object2 moveY(121, 1);
wait(1);
object1 moveY(121, 1);
object2 moveY(-121, 1);
wait(1);
}
}

trap24()
{
trigger = getent("trig_trap24","targetname");
object = getent("trap24","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object RotateYaw(360, 1);
wait(1);
object RotateYaw(-360, 1);
wait(1);
}
}

trap25()
{
trigger = getent("trig_trap25","targetname");
object1 = getent("trap25_1","targetname");
object2 = getent("trap25_2","targetname");
object3 = getent("trap25_3","targetname");
object4 = getent("trap25_4","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 RotateRoll(360, 0.5);
wait(1);
object1 RotateRoll(-360, 0.5);
wait(1);
object2 RotateRoll(360, 0.5);
wait(1);
object2 RotateRoll(-360, 0.5);
wait(1);
object3 RotateRoll(360, 0.5);
wait(1);
object3 RotateRoll(-360, 0.5);
wait(1);
object4 RotateRoll(360, 0.5);
wait(1);
object4 RotateRoll(-360, 0.5);
wait(1);
}
}

trap26()
{
trigger = getent("trig_trap26","targetname");
object = getent("trap26","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object moveY(-141, 0.5);
object waittill("movedone");
wait(0.5);
object moveY(141, 0.5);
object waittill("movedone");
wait(0.5);
}
}

trap27()
{
trigger = getent("trig_trap27","targetname");
object1 = getent("trap27_1","targetname");
object2 = getent("trap27_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 hide();
object1 notsolid();
wait(0.1);
object2 hide();
object2 notsolid();
wait(0.1);
}
}

final_door()
{
trigger = getent("final_door","targetname");
object1 = getent("door1","targetname");
object2 = getent("door2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
iprintlnbold(" ^3" + player.name + " Escaped Cave at ^3 1st Place");
wait(0.1);
object1 moveY(-67, 1);
object2 moveY(67, 1);
wait(0.1);
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
        level.bounce_trig delete();
		level.knife_trig delete();
		level.rpg_trig delete();
		level.shotgun_trig delete();
		level.old_trig delete();
		level.firstenter=false;
		}
		ambientplay("sniper");
		iprintln("^1Playng:^7 Olly Murs feat. Flo Rida - Troublemaker");
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

shotgunroom()
{
    level.shotgun_trig = getEnt( "shotroom", "targetname");
    jump = getEnt( "jump_shotgun", "targetname" );
    acti = getEnt( "acti_shotgun", "targetname" );
    
    while(1)
    {
        level.shotgun_trig waittill( "trigger", player );
        if( !isDefined( level.shotgun_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
        level.bounce_trig delete();
		level.knife_trig delete();
		level.rpg_trig delete();
		level.old_trig delete();
		level.firstenter=false;
		}
		ambientplay("shotgun");
		iprintln("^1Playng:^7 Macklemore & Ryan Lewis - Can't Hold Us Dubstep");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "m1014_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "m1014_mp" );     
        wait 0.05;
        player switchToWeapon( "m1014_mp" );
        level.activ SwitchToWeapon( "m1014_mp" );
        iPrintlnBold( "^7" + player.name + " ^2Chose ^3Shotgun^7!" );
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
        level.snipe_trig delete();
        level.bounce_trig delete();
		level.old_trig delete();
		level.shotgun_trig delete();
		level.rpg_trig delete();
		level.firstenter=false;
		}
		ambientplay("knife");
		iprintln("^1Playng:^7 Macklemore & Ryan Lewis - Thrift Shop Dubstep");
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

rpgroom()
{
    level.rpg_trig = getEnt( "rpg", "targetname");
    jump = getEnt( "jump_rpg", "targetname" );
    acti = getEnt( "acti_rpg", "targetname" );
    
    while(1)
    {
        level.rpg_trig waittill( "trigger", player );
        if( !isDefined( level.rpg_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
        level.bounce_trig delete();
		level.old_trig delete();
		level.shotgun_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
		ambientplay("rpg");
		iprintln("^1Playng:^7 Avicii - Wake Me Up Dubstep");
		player givemaxammo("rpg_mp");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "rpg_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "rpg_mp" );     
        wait 0.05;
        player switchToWeapon( "rpg_mp" );
        level.activ SwitchToWeapon( "rpg_mp" );
        iPrintlnBold( "^7" + player.name + " ^2Chose ^3RPG^7!" );
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
        level.snipe_trig delete();
        level.rpg_trig delete();
		level.old_trig delete();
		level.shotgun_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
		ambientplay("jump");
		iprintln("^1Playng:^7 *Dubstep* House of Pain - Jump Around");
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

old()
{
level.old_trig = getent("old_trig","targetname"); 
door = getent ("old","targetname");
{
level.old_trig waittill ("trigger" , user );
level.old_trig delete();
level.snipe_trig delete();
level.knife_trig delete();
level.rpg_trig delete();
level.bounce_trig delete();
level.shotgun_trig delete();
{
door moveZ(-208, 3);
door waittill("movedone");
wait 1;
}
}
}

crazyfloor()
{
object = getent("crazyfloor","targetname");
while(1)
{
object RotateYaw(360, 1);
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