/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_construction



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

    clip0 = getent ("ioivoaidi1238938dxzvbb", "targetname");
    clip1 = getent ("iiaoduaisdvcaxczb44", "targetname");
    clip2 = getent ("88ifiadsdovzx", "targetname");
    clip3 = getent ("99vxasdiklllzodi", "targetname");
    clip4 = getent ("98cmvmnzvistic", "targetname");
    clip5 = getent ("998f9asd9vzxcvistic22", "targetname");
    clip6 = getent ("vistic9999481", "targetname");
    clip7 = getent ("vistic99131asdx", "targetname");
    clip8 = getent ("998visticaiksdkasdvc", "targetname");
    clip9 = getent ("visticllkvasd991d", "targetname");
    clip10 = getent ("vvvvistic999913c", "targetname");
    clip11 = getent ("oo99a99dsd", "targetname");

    clip0 delete();
    clip1 delete();
    clip2 delete();
    clip3 delete();
    clip4 delete();
    clip5 delete();
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
    thread vistic();
    thread trap0();//auto rotate
    thread beamlight();
    thread startdoor();
    thread elevatorupndown();
    thread beamlight1();
    thread trap01();//auto trap up huigh
    thread endmap_trig();
    thread kniferoom();
    thread sniproom();
    thread sniperfail();//return if fall in snip r
    thread jumproom();
    thread jumperfailb();
    thread bounceactif();
    thread givesniper();
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
    thread move1();
    thread trap11();
    thread trap12();
    thread move2();
    thread return1();

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

}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


music()
{

     lightsmoke1 = getEnt("lightsmoke1", "targetname");
     lightsmoke2 = getEnt("lightsmoke2", "targetname");
     lightsmoke3 = getEnt("lightsmoke3", "targetname");
     green1 = getEnt("green1", "targetname");
     fire1 = getEnt("fire1", "targetname");
     fire2 = getEnt("fire2", "targetname");
     fire3 = getEnt("fire3", "targetname");
     fire4 = getEnt("fire4", "targetname");

     maps\mp\_fx::loopfx("effect_1", (lightsmoke1.origin), 5);
     maps\mp\_fx::loopfx("effect_1", (lightsmoke2.origin), 5);
     maps\mp\_fx::loopfx("effect_1", (lightsmoke3.origin), 5);
     maps\mp\_fx::loopfx("effect_2", (green1.origin), 15);
     maps\mp\_fx::loopfx("effect_3", (fire1.origin), 25);
     maps\mp\_fx::loopfx("effect_3", (fire2.origin), 25);
     maps\mp\_fx::loopfx("effect_3", (fire3.origin), 25);
     maps\mp\_fx::loopfx("effect_3", (fire4.origin), 25);

    level.music = randomint(3);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "dark" );
     break;

     case 1:
     AmbientPlay( "dark1" );
     break;

     case 2:
     AmbientPlay( "dark2" );
     break;
   }
}

vistic()
{
 vc = getent("vishtick","targetname");

  for(;;)
  {
  vc rotateYaw (360,7);
  wait 1;
  }

}

trap0()
{
    cyli = getent("cyli","targetname");
    for(;;)
    {
        cyli rotateYaw (360,7);
        wait 6.95;
    }
}


beamlight()//rotating beam and light
{

    light = getent("round1","targetname");
    beam = getent("round2","targetname");

    for (;;)
   {
     wait 0.1;

     light rotateYaw (10, 1);
     beam rotateYaw (10, 1);

     wait 2;

     light rotateYaw (10, 1);
     beam rotateYaw (10, 1);

   }
}

startdoor()

{
  door = getent("porta","targetname");
  wait 15;
  door moveZ(150, 5);
}

elevatorupndown()
{
   elevator = getent("elevator1", "targetname");
   trig = getent("trigger_elevator1", "targetname");

   while(1)
   {
    trig waittill ("trigger");
    elevator moveZ (1081,5,1,1);
    wait 10;
    elevator moveZ (-1081,5,1,1);
    wait 10;

   }
}

beamlight1()//rotating beam and light up high
{

    light = getent("beam1","targetname");
    beam = getent("beam11","targetname");

    for (;;)
   {
     wait 0.1;

     light rotateYaw (10, 1);
     beam rotateYaw (10, 1);

     wait 2;

     light rotateYaw (10, 1);
     beam rotateYaw (10, 1);

   }
}

trap01()//auto trap up higj
{
    cyli = getent("cyli1","targetname");
    for(;;)
    {
        cyli rotateYaw (360,7);
        wait 6.95;
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
    jump = getent("trigger_bounceroom","targetname");
    scope thread maps\mp\_utility::triggerOff();
    knife thread maps\mp\_utility::triggerOff();
    jump thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    knife thread maps\mp\_utility::triggerOn();
    jump thread maps\mp\_utility::triggerOn();
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

sniperfail()//respawn in siniper sroom
{
   trigb = getent("trigger_failer1", "targetname");
   teleb = getent ("origin_failer1", "targetname");

   for(;;)
    {
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}


jumproom()
{
   level.trigger_jump = getEnt ("trigger_bounceroom", "targetname");

    jumperk = getEnt ("origin_bouncejumper", "targetname");
    actik = getEnt ("origin_bounceactif", "targetname");

  for(;;)
    {
        level.trigger_jump setHintString ("Press [&&1] to enter JumpRoom");
        level.trigger_jump waittill ("trigger", player);

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

        iPrintLnBold ("" + player.name + " has died in Jump Room");
    }
}

jumperfailb()//jumper respawn bounce r
{
   trigb = getent("trigger_jumperf", "targetname");
   teleb = getent ("origin_bouncejumper", "targetname");

   for(;;)
    {
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

bounceactif()// acti respawn bounce r
{
   trigb = getent("trigger_bounceactif", "targetname");
   teleb = getent ("origin_bounceactif", "targetname");

   for(;;)
    {
	  trigb waittill("trigger", player);
	  player setOrigin(teleb.origin);
	  player setPlayerAngles (teleb.angles);
    }
}

givesniper()// give snip in jump r
{
givesnip = getEnt("givesnip_trig","targetname");

	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("deserteagle_mp");
		player giveweapon("m40a3_mp");
		player switchtoweapon("deserteagle_mp");
		player givemaxammo("deserteagle_mp");
		player givemaxammo("m40a3_mp");
	}
}

trap1()
{
     plankt1 = getent("trap1","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap2()
{
     plat1 = getent("trap2","targetname");
     plat2 = getent("trap2a","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate 2 cylinders.");
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

trap3()
{
     plankt1 = getent("trap3","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate the O");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap4()
{
     plankt1 = getent("trap4","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate 2 platforms");
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
     plankt1 = getent("trap5","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Unstable platform for 5 sec");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
	 plankt1 notsolid();
	 wait 5;
	 plankt1 solid();
	wait 2000;
   }

}

trap6()
{
     plankt1 = getent("trap6","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("T6: Rotate 1 cylinder");
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
     plankt1 = getent("trap7","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate 1 cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap8()
{
    platform = getent("trap8", "targetname");
    trig = getent("trigger_trap8", "targetname");
    trig setHintString("T8: unstable the blocks for 5 sec");
    trig waittill ("trigger");
    trig setHintString("^7Activated");


   for(;;)
	{
	 platform notsolid();
	 wait 5;
	 platform solid();
	wait 2000;
	}
}

trap9()
{
     plat1 = getent("trap9","targetname");
     plat2 = getent("trap9a","targetname");
     plat3 = getent("trap9b","targetname");
     plat4 = getent("trap9c","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("T9: Rotate 4 platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     plat3 rotateYaw(360,3);
     plat4 rotateYaw(-360,3);
     wait 5;
   }

}

trap10()
{
    platform = getent("trap10", "targetname");
    trig = getent("trigger_trap10", "targetname");
    trig setHintString("T10: Remove a part of the ground");
    trig waittill ("trigger");
    trig setHintString("^7Activated");


   for(;;)
	{
	 platform notsolid();
   platform hide();
	 wait 2000;
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

trap11()
{
     plankt1 = getent("trap11","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("T1: Rotate the bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap12()
{
     plankt1 = getent("trap12","targetname");
     trig = getent("trigger_trap12", "targetname");
     trig setHintString("T12: Rotate the cylinder");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
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

return1()//return the idiots that tried to block the elevator back
{
   trig = getent("trigger_returnele1", "targetname");
   tele1 = getent ("origin_returnele1", "targetname");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}