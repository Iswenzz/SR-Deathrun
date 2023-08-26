/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_ruins



     ***** *      **           *****  *       *******      ****           *         *****  *       * ***
  ******  *    *****        ******  *       *       ***   *  *************       ******  *       *  ****  *
 **   *  *       *****     **   *  *       *         **  *     *********        **   *  *       *  *  ****
*    *  **       * **     *    *  *        **        *   *     *  *            *    *  *       *  **   **
    *  ***      *             *  *          ***           **  *  **                *  *       *  ***
   **   **      *            ** **         ** ***            *  ***               ** **      **   **
   **   **      *            ** **          *** ***         **   **               ** **      **   **
   **   **     *           **** **            *** ***       **   **             **** **      **   **
   **   **     *          * *** **              *** ***     **   **            * *** **      **   **
   **   **     *             ** **                ** ***    **   **               ** **      **   **
    **  **    *         **   ** **                 ** **     **  **          **   ** **       **  **
     ** *     *        ***   *  *                   * *       ** *      *   ***   *  *         ** *      *
      ***     *         ***    *          ***        *         ***     *     ***    *           ***     *
       *******           ******          *  *********           *******       ******             *******
         ***               ***          *     *****               ***           ***                ***
                                        *
                                         **


*/

main()
{
    maps\mp\_load::main();

     clip0 = getent ("brushvistic818231", "targetname");
     clip1 = getent ("visticscriptmodel22", "targetname");
     clip2 = getent ("modelbvistic99123", "targetname");
     clip3 = getent ("ioofi28viisticx", "targetname");
     clip4 = getent ("targetvisticclan23", "targetname");
     clip5 = getent ("666vistic599clan", "targetname");
     clip6 = getent ("nametarget9", "targetname");
     clip7 = getent ("fillvistic123", "targetname");
     clip8 = getent ("scriptvistic913", "targetname");
     clip9 = getent ("194299fdvic", "targetname");
     clip10 = getent ("keyvalue99321", "targetname");
     clip11 = getent ("scriptkey9993vc", "targetname");

     clip0 delete();
     clip1 delete();
     clip2 delete();
     clip3 delete();
     clip4 delete();
    //  clip5 delete();
     clip6 delete();
     clip7 delete();
     clip8 delete();
     clip9 delete();
     clip10 delete();
     clip11 delete();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // setdvar("g_speed" ,"210");

    thread music();
    thread endmap_trig();
    thread vclogos();
    thread sniproom();
    thread failsniper();
    thread kniferoom();
    thread trap1();
    thread trap2();
    thread trap3();
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
    thread move1();
    thread move2();
    thread move3();
    thread move4();
    thread messages();


  addTriggerToList( "trigger_trap1" );
  addTriggerToList( "trigger_trap2" );
  addTriggerToList( "trigger_trap3" );
  addTriggerToList( "trigger_trap4" );
  addTriggerToList( "trigger_trap5" );
  addTriggerToList( "trigger_trap6" );
  addTriggerToList( "trigger_trap7" );
  addTriggerToList( "trigger_trap8" );
  addTriggerToList( "trigger_trap9" );
  addTriggerToList( "trigger_trap10" );
  addTriggerToList( "trigger_trap11" );
  addTriggerToList( "trigger_trap12" );
  addTriggerToList( "trigger_trap13" );
  addTriggerToList( "trigger_trap14" );
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music()
{
    level.music = randomint(2);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "seven" );
     break;
      case 1:
     AmbientPlay( "seven1" );
     break;
   }
}

endmap_trig()
{
	trig = getEnt("endmap_trig", "targetname");
	trig waittill ("trigger",player );
	firstPlace = newHudElem();
	firstPlace.foreground = true;
	firstPlace.alpha = 1;
	firstPlace.alignX = "left";
	firstPlace.alignY = "middle";
	firstPlace.horzAlign = "left";
	firstPlace.vertAlign = "middle";
	firstPlace.x = -400;
	firstPlace.y = 0;
	firstPlace.sort = 0;
	firstPlace.font = "default";
	firstPlace.fontScale = 1.4;
	firstplace.hidewheninmenu = false;
	firstPlace.glowAlpha = 1;
	firstPlace.glowColor = (.3,.0,3);
	firstPlace settext("^6"+ player.name+ " ^7Finished ^7First");
	firstPlace moveOverTime(2);
	firstPlace.x = 5;
	wait 5;
	firstPlace moveOverTime(2);
	firstPlace.x = -500;
	wait 7;
	firstPlace destroy();
}

vclogos()
{
 vc = getent("vistic1","targetname");
 vc2 = getent("vistic2","targetname");
  vc3 = getent("vistic3","targetname");
  for(;;)
  {
     vc rotateyaw (360, 5);
     vc2 rotateyaw (360, 5);
     vc3 rotateyaw (360, 5);
     vc moveZ (200, 5);
     vc2 moveZ (200, 5);
     vc3 moveZ (200, 5);
     wait 5;
     vc rotateyaw (360, 5);
     vc2 rotateyaw (360, 5);
     vc3 rotateyaw (360, 5);
     vc moveZ (-200, 5);
     vc2 moveZ (-200, 5);
     vc3 moveZ (-200, 5);
     wait 5;
  }

}

GetActivator()
{
	players = getentarray( "player", "classname" );

	for(i = 0;i < players.size;i++)
	{
		player = players[i];

		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}

	return "Noactivator";
}

waitdead()
{
    activator = GetActivator();
    scope = getent("trigger_sniproom","targetname");
    knife = getent("trigger_kniferoom","targetname");
    scope thread maps\mp\_utility::triggerOff();
    knife thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    knife thread maps\mp\_utility::triggerOn();
}

sniproom()
{

    level.trigger_scope = getEnt ("trigger_sniproom", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("Press [&&1] to enter Sniper Room");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");
        player.maxhealth = 100;


        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("" + player.name + " died in scope room");
    }
}

failsniper()//respawn sniper
{
   trigb = getent("trigger_stopsuck", "targetname");
   teleb = getent ("origin_stopsucky", "targetname");

   for(;;)
    {
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

kniferoom()
{

   level.trigger_knife = getEnt ("trigger_kniferoom", "targetname");

    jumperk = getEnt ("origin_knifejumper", "targetname");
    actik = getEnt ("origin_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("Press [&&1] to enter Knife Room.");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("" + player.name + " has died in Knife Room");
    }
}

trap1()
{
     plat1 = getent("trap1","targetname");
     plat2 = getent("trap1a","targetname");
     plat3 = getent("trap1b","targetname");
     plat4 = getent("trap1c","targetname");
     plat5 = getent("trap1d","targetname");
     plat6 = getent("trap1e","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate 6 cylinders");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     plat4 rotateYaw(-360,3);
     plat5 rotateYaw(360,3);
     plat6 rotateYaw(-360,3);
     wait 5;
   }

}

trap2()
{
     plankt1 = getent("trap2","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap3()
{
 part1 = getentarray("trap3","targetname");
 part2 = getentarray("trap3a","targetname");
 trig = getent("trigger_trap3","targetname");
 trig  setHintString("^7Make unstable 1 platform");
 trig waittill("trigger" , user );
 if(user.pers["team"] != "axis")
{
	wait 0.2;
}
 else if(level.trapsdisabled)
{

}
 else
 trig delete();
 trig SetHintString("^7Activated");
 random = randomint(2);
	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;

		case 1:
				part2[randomInt(part2.size)] notsolid();
                break;

		default: return;
	}
}

trap4()
{
     plankt1 = getent("trap4","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap5()
{
     plat1 = getent("trap5","targetname");
     plat2 = getent("trap5a","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Rotate 2 cylinders.");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateroll(360,3);
     plat2 rotateroll(-360,3);
     wait 5;
   }

}


trap6()
{
     plankt1 = getent("trap6","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("T6: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap7()
{
     plat1 = getent("trap7","targetname");
     plat2 = getent("trap7a","targetname");
     plat3 = getent("trap7b","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate 3 platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     wait 5;
   }

}

trap8()
{
     plankt1 = getent("trap8","targetname");
     trig = getent("trigger_trap8", "targetname");
     trig setHintString("T8: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap9()
{
     plankt1 = getent("trap9","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("T9: Rotate the cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateyaw(360,3);
     wait 10;
   }

}

trap10()
{
     plankt1 = getent("trap10","targetname");
     trig = getent("trigger_trap10", "targetname");
     trig setHintString("T10: Rotate the cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateroll(360,3);
     wait 10;
   }

}

trap11()
{
     plat1 = getent("trap11","targetname");
     plat2 = getent("trap11a","targetname");
     plat3 = getent("trap11b","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("T11: Rotate 3 platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     wait 5;
   }

}

trap12()
{
     plankt1 = getent("trap12","targetname");
     trig = getent("trigger_trap12", "targetname");
     trig setHintString("T12: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap13()
{
     plankt1 = getent("trap13","targetname");
     trig = getent("trigger_trap13", "targetname");
     trig setHintString("T13: Rotate the cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateroll(360,3);
     wait 10;
   }

}

trap14()
{
 part1 = getentarray("trap14","targetname");
 part2 = getentarray("trap14a","targetname");
 part3 = getentarray("trap14b","targetname");
 part4 = getentarray("trap14c","targetname");
 trig = getent("trigger_trap14","targetname");
 trig  setHintString("^14Make unstable 2 platforms");
 trig waittill("trigger" , user );
 if(user.pers["team"] != "axis")
{
	wait 0.2;
}
 else if(level.trapsdisabled)
{

}
 else
 trig delete();
 trig SetHintString("^7Activated");
 random = randomint(2);
	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
                part2[randomInt(part2.size)] notsolid();
				break;

		case 1:
				part3[randomInt(part3.size)] notsolid();
                part4[randomInt(part4.size)] notsolid();
                break;

		default: return;
	}
}

move1()//Move to next area acti
{
   trig = getent("trigger_move1", "targetname");
   tele1 = getent ("origin_move1", "targetname");
   trig setHintString ("Move to other area");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

move2()//Move to next area acti
{
   trig = getent("trigger_move2", "targetname");
   tele1 = getent ("origin_move2", "targetname");
   trig setHintString ("Move to other area");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

move3()//Move to next area acti
{
   trig = getent("trigger_move3", "targetname");
   tele1 = getent ("origin_move3", "targetname");
   trig setHintString ("Move to other area");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

move4()//Move to next area acti
{
   trig = getent("trigger_move4", "targetname");
   tele1 = getent ("origin_move4", "targetname");
   trig setHintString ("Move to other area");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

messages()
{

    wait 10;

     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823");

}
