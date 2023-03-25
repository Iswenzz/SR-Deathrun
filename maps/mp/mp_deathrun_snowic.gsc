main()
{
        maps\mp\_load::main(); 
       
 
        //setExpFog(500, 2200, 0.81, 0.75, 0.63, 0);
        //VisionSetNaked( "mp_backlot" );
 
        game["allies"] = "marines";
        game["axis"] = "opfor";
        game["attackers"] = "axis";
        game["defenders"] = "allies";
        game["allies_soldiertype"] = "desert";
        game["axis_soldiertype"] = "desert";
 
entTransporter = getentarray( "knife_jt", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread knife_jt();
 
entTransporter = getentarray( "knife_at", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread knife_at();

entTransporter = getentarray( "secret_fail", "targetname" );
        if(isdefined(entTransporter))
                for( i = 0; i < entTransporter.size; i++ )
                        entTransporter[i] thread secret_fail();


 
 
        setdvar( "r_specularcolorscale", "1" );
 
        setdvar("r_glowbloomintensity0",".25");
        setdvar("r_glowbloomintensity1",".25");
        setdvar("r_glowskybleedintensity0",".3");
        setdvar("compassmaxrange","1800");

	precacheItem( "remington700_mp" );
	precacheItem( "mp44_mp" );
	precacheItem( "knife_mp" );
	precacheItem( "ak47_mp" );
 
 	addTriggerToList("trap_01");
        addTriggerToList("trap_02");
        addTriggerToList("trap_03_1");
        addTriggerToList("trap_03_2");
        addTriggerToList("trap_04");
        addTriggerToList("trap_05_1");
        addTriggerToList("trap_05_2_1");
	addTriggerToList("trap_05_2_2");
	addTriggerToList("trap_05_2_4");
        addTriggerToList("trap_06");
        addTriggerToList("trap_07");
        addTriggerToList("trap_08");
        addTriggerToList("trap_09");
        addTriggerToList("trap_10");
       	addTriggerToList("trap_11");
       	addTriggerToList("trap_12");
        addTriggerToList("trap_13");
        addTriggerToList("trap_14_1");
        addTriggerToList("trap_14_2");

 
	thread shortcut_1();
        thread map_starter();
        thread speedforacti();
        thread trap_01();
	thread trap_02_mover();
	thread trap_02();
        thread trap_03_1();
        thread trap_03_2();
        thread trap_04();
        thread trap_05_1();
        thread trap_05_2_1();
	thread trap_05_2_2();
	thread trap_05_2_4();
        thread trap_06();
        thread trap_07();
        thread trap_08();
        thread trap_09();
        thread trap_10();
        thread trap_11();
        thread trap_12();
        thread trap_13();
        thread trap_14_1();
        thread trap_14_2();
        thread knife_room_BATTLE();
        thread old_room_BATTLE();
        thread sniper_room_BATTLE();
        thread jump_room_BATTLE();
        thread jump_room_gun();
        thread end_trigger();
        thread creators();
	thread end_tp_rooms();
	thread open_secret();
	thread secret_teleport();
	thread bouncedat();
	thread secret_finish();
	
}

	addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}
	shortcut_1()
{
	trigger = getent("trigger_shortcut_1","targetname");
	object = getent("shortcut_1","targetname");
	trigger waittill ("trigger" , player );
	object movez(246, 0.1);
	iprintln( "^5W^1h^3y ^4Y^7o^2u ^6P^8r^9e^5s^1s ^3U^4s^7e ^2O^6b^8v^9i^5u^1s^3?" );
}

        map_starter()
{      
        door = getent("map_starter","targetname");
	wait(5);
	ambientplay("BGmusic");
        iprintln("<<< ^3Now playing ^2[[^5 Theory Of Everything 2 - Dj-Nate^2]] ^1>>>");
        iprintln("<<< ^3Now playing ^2[[^5 Theory Of Everything 2 - Dj-Nate^2]] ^1>>>");
        iprintln("<<< ^3Now playing ^2[[^5 Theory Of Everything 2 - Dj-Nate^2]] ^1>>>");
        wait(11);
	door movez(-700, 7);
        door waittill("movedone");
}
       
        speedforacti()
{
        trig = getent ("actispeed", "targetname");
 
        trig waittill ("trigger", player);
        if(player.pers["team"] == "axis")
        {
                player SetMoveSpeedScale(2);
        }
}
 
        trap_01()
{
        trigger = getent("trigger_trap_01","targetname");
        object = getent("trap_01","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        object delete();
}

       trap_02_mover()
{
	mover = getent ("trap_02_mover","targetname");
	while(1)
	{
		mover movex(1168,6);
		mover waittill("movedone");
		wait (2);
		mover movex(-1168,6);
		mover waittill("movedone");
		wait (2);
	}
}

	trap_02()
{
	trigger = getent("trigger_trap_02","targetname");
        object = getent("trap_02","targetname");
        killtrigger1 = getent ("kill_trig_2_1" , "targetname");
	killtrigger2 = getent ("kill_trig_2_2" , "targetname");
	killtrigger3 = getent ("kill_trig_2_3" , "targetname");
	killtrigger4 = getent ("kill_trig_2_4" , "targetname");
	killtrigger5 = getent ("kill_trig_2_5" , "targetname");
	killtrigger6 = getent ("kill_trig_2_6" , "targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        killtrigger1 enablelinkto ();
        killtrigger1 linkto (object);
	killtrigger2 enablelinkto ();
        killtrigger2 linkto (object);
	killtrigger3 enablelinkto ();
        killtrigger3 linkto (object);
	killtrigger4 enablelinkto ();
        killtrigger4 linkto (object);
	killtrigger5 enablelinkto ();
        killtrigger5 linkto (object);
	killtrigger6 enablelinkto ();
        killtrigger6 linkto (object);
	object movez(255,1);
        object waittill("movedone");
}

        trap_03_1()
{
        trigger = getent("trigger_trap_03","targetname");
        object = getent("trap_03_1","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        object movex(-93, 0.1);
        object waittill("movedone");
        for(;;)
        {
                object movex(93, 4);
                object waittill("movedone");
                object movex(-93, 4);
                object waittill("movedone");
        }
}
 
        trap_03_2()
{
        trigger = getent("trigger_trap_03","targetname");
        object = getent("trap_03_2","targetname");
        trigger waittill ("trigger" , player );
        trigger SetHintString("^1Activated");
        object movex(105, 0.1);
        object waittill("movedone");
        for(;;)
        {
                object movex(-105, 4);
                object waittill("movedone");
                object movex(105, 4);
                object waittill("movedone");
        }
}
 
        trap_04()
{
        trigger = getent("trigger_trap_04","targetname");
        object = getent("trap_04","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        object delete();
}
 
        trap_05_1()
{
        trigger = getent("trigger_trap_05_1","targetname");
        object = getent("trap_05_1","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
	trigger SetHintString("^1Activated");
        for(;;)
        {
                object rotateYaw(360, 1);
                object waittill("rotatedone");
                wait(3);
        }
}
 
        trap_05_2_1()
{
        trigger = getent("trigger_trap_05_2","targetname");
        object = getent("trap_05_2_1","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        for(;;)
        {
                object movex(270, 2);
		object waittill("movedone");
		wait (2);
		object movex(-270, 2);
		object waittill("movedone");
                wait (2);
        }
}

	trap_05_2_2()
{
	trigger = getent("trigger_trap_05_2","targetname");
        object = getent("trap_05_2_2","targetname");
        trigger waittill ("trigger" , player );
	for(;;)
	{
		wait (2);
		object movex(271, 2);
		object waittill("movedone");
		wait (2);
		object movex(-271, 2);
		object waittill("movedone");
	}
}

	trap_05_2_4()
{
	trigger = getent("trigger_trap_05_2","targetname");
        object = getent("trap_05_2_4","targetname");
        trigger waittill ("trigger" , player );
	for(;;)
	{
		wait (2);
		object movey(271, 1);
		object waittill("movedone");
		wait (2);
		object movey(-271, 1);
		object waittill("movedone");
	}
}
        trap_06()
{
        trigger = getent("trigger_trap_06","targetname");
        object = getent("trap_06_bounce","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        for(;;)
        {      
                object rotateYaw(720, 3);
                object waittill ("rotatedone");
                wait (3);
        }
}
 
        trap_07()
{
        trigger = getent("trigger_trap_07","targetname");
        object = getent("trap_07","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        object movez(1131, 0.5);
        object waittill("movedone");
        for(;;)
        {
                object movex(1141, 2);
                object waittill("movedone");
                object movex(-1141, 2);
                object waittill("movedone");
        }
}
 
        trap_08()
{
        trigger = getent("trigger_trap_08","targetname");
        object = getent("trap_08","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        for(;;)
        {
                object rotateYaw(720,5);
                object waittill("rotatedone");
                wait (3);
        }
}
 
        trap_09()
{
        trigger = getent("trigger_trap_09","targetname");
        object = getent("trap_09","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        object delete();
}
 
        trap_10()
{
        trigger = getent("trigger_trap_10","targetname");
        object = getent("trap_10","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        object delete();
}
 
                trap_11()
{
        trigger = getent("trigger_trap_11","targetname");
        object = getent("trap_11","targetname");
        killtrigger = getent ("killtrig" , "targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        killtrigger enablelinkto ();
        killtrigger linkto (object);
        object movez(64, 1);
        object waittill("movedone");
        wait(6);
        object movez(-64, 1);
        object waittill("movedone");
        wait(1);
}
 
        trap_12()
{
        trigger = getent("trigger_trap_12","targetname");
        object = getent("trap_12","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        for(;;)
        {
                object rotateYaw(360,4);
                object waittill("rotatedone");
                object rotateYaw(360,4);
        }
}
 
        trap_13()
{
        trigger = getent("trigger_trap_13","targetname");
        object1 = getent("trap_13_1","targetname");
        object2 = getent("trap_13_2","targetname");
        object3 = getent("trap_13_3","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        trigger SetHintString("^1Activated");
        for(;;)
        {
                object1 rotateRoll(720,2);
                object1 waittill("rotatedone");
                object2 rotateRoll(720,2);
                object2 waittill("rotatedone");
                object3 rotateRoll(720,2);
                object3 waittill("rotatedone");
        }
}
 
        trap_14_1()
{
        trigger = getent("trigger_trap_14","targetname");
        object = getent("trap_14_1","targetname");
        trigger waittill ("trigger" , player );
	player braxi\_rank::giveRankXP("", 50);
        for(;;)
        {
                object rotateYaw(-10,2);
                object waittill("rotatedone");
                object rotateYaw(10,2);
                object waittill("rotatedone");
        }
}
 
                trap_14_2()
{
        trigger = getent("trigger_trap_14","targetname");
        object = getent("trap_14_2","targetname");
        trigger waittill ("trigger" , player );
        trigger SetHintString("^1Activated");
        for(;;)
        {
                object rotateYaw(10,2);
                object waittill("rotatedone");
                object rotateYaw(-10,2);
                object waittill("rotatedone");
        }
}
 
        knife_jt()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
                wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                wait 0.1;
        }
}
 
                knife_at()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
                wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                wait 0.1;
        }
}
 
               
 
                jump_room_gun()
{
        trigger = getEnt ( "jumproom_weapon", "targetname" );
        for(;;)
        {
                trigger waittill ( "trigger", player );
                wait 0.05;
                player giveWeapon ( "remington700_mp" );
                player giveMaxAmmo ( "remington700_mp" );
                player switchToWeapon ( "remington700_mp" );
                wait 1;
        }
}
 
         end_tp_rooms()
{
        level.rooms_trig = getEnt ("end_door","targetname");
	jump = getEnt("end_go","targetname");

	while(1)
	{
   		level.rooms_trig waittill( "trigger", player );
                if( !isDefined( level.rooms_trig ) )
                return;

		player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
		player died();
	}
}

	died()
{
        self endon("disconnect");
 
        self waittill("death");
        iPrintlnBold("^2"+self.name+" ^5died^1!");
}

       
        knife_room_BATTLE()
{
        level.knife_trig = getEnt( "kniferoom_ent", "targetname");
        jump = getEnt( "kniferoom_go", "targetname" );
        acti = getEnt( "kniferoom_acti", "targetname" );
 
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                return;
 
                ambientStop("0");
                wait 0.05 ;
                ambientPlay("fukyou");
 
                level.canPlaySound = false;
 
                iprintln("<<< ^3Now playing ^2[[^5I Dont Fuck With You - Big Sean^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5I Dont Fuck With You - Big Sean^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5I Dont Fuck With You - Big Sean^2]] ^1>>>");
 
                level.old_trig delete();
       
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" );
               
 
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ SetMoveSpeedScale(1);
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "knife_mp" );
                iPrintlnBold( " ^6" + player.name + " ^5Entered Knife room." );
                wait 0.05;
                player switchToWeapon( "knife_mp" );
                level.activ SwitchToWeapon( "knife_mp" );
                player freezecontrols(true);
                level.activ freezecontrols(true);
		player.health=100;
		level.activ.health=100;
                wait 1;
                player iPrintlnBold( "^53" );
                level.activ iPrintlnBold( "^53" );
                wait 1;
                player iPrintlnBold( "^52" );
                level.activ iPrintlnBold( "^52" );
                wait 1;
                player iPrintlnBold( "^51" );
                level.activ iPrintlnBold( "^51" );
                wait 1;
                player iPrintlnBold( "^1FIGHT^9!" );
                level.activ iPrintlnBold( "^1Finish his throat^9!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
       
        }
}
 
        old_room_BATTLE()
{
        level.old_trig = getEnt( "oldroom_ent", "targetname");
        jump = getEnt( "oldroom_go", "targetname" );
        acti = getEnt( "oldroom_acti", "targetname" );
 
        while(1)
        {
                level.old_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                return;
 
                ambientStop("0");
                wait 0.05 ;
                ambientPlay("trololo");
 
                level.canPlaySound = false;
 
                iprintln("^1Rest In Peace ^5 Eduard Hil - ^6Song - ^6Trololo");
                iprintln("^1Rest In Peace ^5 Eduard Hil - ^6Song - ^6Trololo");
                iprintln("^1Rest In Peace ^5 Eduard Hil - ^6Song - ^6Trololo");
 
 
                level.jump_trig delete();
                level.sniper_trig delete();
                level.knife_trig delete();
       
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" );
		player.health=100;
		level.activ.health=100;
 
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ GiveWeapon( "ak47_mp" );
		level.activ givemaxammo( "ak47_mp" );
                iPrintlnBold( " ^6" + player.name + " ^5OLD ROOM IS FOR ^1PUSSIES^2!" );
                wait 0.05;
                player switchToWeapon( "knife_mp" );
                level.activ SwitchToWeapon( "ak47_mp" );
                player iPrintlnBold( "^1T^2R^3O^4L^5O^6L^7O^8L^9O^9!" );
                level.activ iPrintlnBold( "^1You got Weapon ^7And Jumper Doesn't Have One^9!" );
        }
}
 
        sniper_room_BATTLE()
{
        level.sniper_trig = getEnt( "sniproom_ent", "targetname");
        jump = getEnt( "sniproom_go", "targetname" );
        acti = getEnt( "sniproom_acti", "targetname" );
 
        while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                level.activ thread snip_fail();
                thread snip_fail();
                if( !isDefined( level.sniper_trig ) )
                return;
 
                ambientStop("0");
                wait 0.05;
                ambientPlay("oldwar");
 
                level.canPlaySound = false;
 
                iprintln("<<< ^3Now playing ^2[[^5 Same Old War - Our Last Night^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5 Same Old War - Our Last Night^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5 Same Old War - Our Last Night^2]] ^1>>>");
 
                level.old_trig delete();
       
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "remington700_mp" );
                player givemaxammo( "remington700_mp" );      
 
 
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ SetMoveSpeedScale(1);
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "remington700_mp" );
                level.activ givemaxammo( "remington700_mp" );
 
                iPrintlnBold( " ^6" + player.name + " ^5Entered Sniper room." );
                wait 0.05;
                player switchToWeapon( "remington700_mp" );
                level.activ SwitchToWeapon( "remington700_mp" );
                player freezecontrols(true);
                level.activ freezecontrols(true);
		player.health=100;
		level.activ.health=100;
                wait 1;
                player iPrintlnBold( "^53" );
                level.activ iPrintlnBold( "^53" );
                wait 1;
                player iPrintlnBold( "^52" );
                level.activ iPrintlnBold( "^52" );
                wait 1;
                player iPrintlnBold( "^51" );
                level.activ iPrintlnBold( "^51" );
                wait 1;
                player iPrintlnBold( "^1FIGHT^9!" );
                level.activ iPrintlnBold( "^1FIGHT^9!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
        }
}
 
        snip_fail()
{
        level.sniperfail = getent ("snip_alltp","targetname");
        level.js = getent ("snip_jt_go","targetname");
        level.as = getent ("snip_at_go","targetname");
        while(1)
        {
                level.sniperfail waittill ("trigger",player);
                if( player.pers["team"] == "allies" )
                {
                        player SetPlayerAngles(level.js.angles);
                        player SetOrigin(level.js.origin);
                }
                else
                {
                        player SetPlayerAngles(level.as.angles);
                        player SetOrigin(level.as.origin);
                }
        }
}
 
        jump_room_BATTLE()
{
        level.jump_trig = getEnt( "jumproom_ent", "targetname");
        jump = getEnt( "jumproom_go", "targetname" );
        acti = getEnt( "jumproom_acti", "targetname" );
 
        while(1)
        {
                level.jump_trig waittill( "trigger", player );
                thread jump_fail();
                if( !isDefined( level.jump_trig ) )
                return;
 
                ambientStop("0");
                wait 0.05 ;
                ambientPlay("dubbie");
 
                level.canPlaySound = false;
 
                iprintln("<<< ^3Now playing ^2[[^5Too Late - Major Look^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5Too Late - Major Look^2]] ^1>>>");
                iprintln("<<< ^3Now playing ^2[[^5Too Late - Major Look^2]] ^1>>>");
 
                level.old_trig delete();
       
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" );
               
 
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ SetMoveSpeedScale(1);
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "knife_mp" );
                iPrintlnBold( " ^6" + player.name + " ^5Entered Jump room." );
                wait 0.05;
                player switchToWeapon( "knife_mp" );
                level.activ SwitchToWeapon( "knife_mp" );
                player freezecontrols(true);
                level.activ freezecontrols(true);
		player.health=100;
		level.activ.health=100;
                wait 1;
                player iPrintlnBold( "^53" );
                level.activ iPrintlnBold( "^53" );
                wait 1;
                player iPrintlnBold( "^52" );
                level.activ iPrintlnBold( "^52" );
                wait 1;
                player iPrintlnBold( "^51" );
                level.activ iPrintlnBold( "^51" );
                wait 1;
                player iPrintlnBold( "^1FIGHT^9!" );
                level.activ iPrintlnBold( "^1FIGHT^9!" );
                player freezecontrols(false);
                level.activ freezecontrols(false);
        }
}
 
        jump_fail()
{
        level.jumpfail = getent ("jump_alltp","targetname");
        level.js = getent ("jump_jt_go","targetname");
        level.as = getent ("jump_at_go","targetname");
        while(1)
        {
                level.jumpfail waittill ("trigger",player);
                if( player.pers["team"] == "allies" )
                {
                        player SetPlayerAngles(level.js.angles);
                        player SetOrigin(level.js.origin);
                }
                else
                {
                        player SetPlayerAngles(level.as.angles);
                        player SetOrigin(level.as.origin);
                }
        }
}
	
	end_trigger()
{
        trigger = getent("end_trigger","targetname");
		trigger waittill ("trigger" , player );
		player braxi\_rank::giveRankXP("", 250);
		iprintln( " ^6" + player.name + " ^5Finished  the map ^1first ^5!" );
}
 
        creators()
{
	wait(15);
	iPrintlnBold ("Map by ^5TheLixfe");
        wait(12);
        iprintln("Huge thanks to SHoT for helping me on scripts");
	wait(6);
	iprintln("Thanks BW|Chax for making the loading screen!");
	wait(6);
	iprintln("Thanks BW|Cloudeyes for reporting bugs!");
	wait(6);
	iprintln("Thanks Krispy for that awesome preview video.");
	wait(6);
	iprintln("Map by ^5TheLixfe");

}

	open_secret()
{
	trigger = getent("secret_open","targetname");
	object = getent("secret_door","targetname");
        trigger waittill ("trigger" , player );
	iprintln( "What Are You Doing With that ^5Icicle?" );
	object delete();
}

	secret_teleport()
{
	trig = getEnt ("secret_teleport", "targetname");
	end = getEnt ("secret_teleport_go", "targetname");    
	while(1)
	{
        	trig waittill ("trigger", player);     
		player SetOrigin(end.origin);
        	player SetPlayerAngles( end.angles );
		iPrintlnBold (" ^5" + player.name + " ^7 Entered the secret!");
    }
}

	bouncedat()
{ 
	trigger = getent ("music2","targetname");
	trigger waittill ("trigger" , player );
	ambientStop("0");
        wait 0.05 ;
        ambientPlay("trumpetto");
	iprintln("<<< ^3Now playing ^2[[^5 Freaks - Timmy Trumpet & Savage^2]] ^1>>>");
        iprintln("<<< ^3Now playing ^2[[^5 Freaks - Timmy Trumpet & Savage^2]] ^1>>>");
        iprintln("<<< ^3Now playing ^2[[^5 Freaks - Timmy Trumpet & Savage^2]] ^1>>>");
}

	secret_fail()
{
        for(;;)
        {
                self waittill( "trigger", player );
                entTarget = getEnt( self.target, "targetname" );
                wait 0.1;
                player setOrigin( entTarget.origin );
                player setplayerangles( entTarget.angles );
                wait 0.1;
        }
}

	secret_finish()
{
	trig = getEnt ("secret_finish", "targetname");
	end = getEnt ("secret_finish_go", "targetname");
	while(1)
    	{
        trig waittill ("trigger", player);          
	player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	iPrintlnBold (" ^5" + player.name + " ^7 Was Too ^6MLG ^7and Finished the secret!");
	player braxi\_rank::giveRankXP("", 2069);
	player GiveWeapon( "mp44_mp" );
	player givemaxammo( "mp44_mp" );
	player switchToWeapon( "mp44_mp" );
	}
}