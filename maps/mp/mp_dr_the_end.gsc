/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_dr_the_end

#FF7E00FF


     ***** *      **           *****  *       *******      ****           *         *****  *       * ***
  ******  *    *****        ******  *       *       ***   *  *************       ******  *       *  ****  *
 **   *  *       *****     **       *  *       *         **  *     *********        **   *  *       *  *  ****
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

setExpFog(10, 4500, 0.13, 0.1, 0.05, 0.0);
*/

main()
{
    maps\mp\_load::main();
    maps\mp\mp_dr_the_end_fx::main();
    setExpFog(10, 6500, 0.05, 0.05, 0.05, 0.0);

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    setdvar("bg_falldamageminheight" , "99998");
    setdvar("bg_falldamagemaxheight" , "99999");

    thread fire_effect();
    thread fire_effect2();
    thread fire_effect3();
    thread fire_effect4();
    thread fire_effect5();
    thread fire_effect6();
    thread fire_effect7();
    thread fire_effect8();
    thread fire_effect9();
    thread credits();
    thread music();
    thread secretsong();
    thread secretsong2();
    thread endmap_trig();
    thread sniproom();
    thread bounceroom();
    thread givesniper();
    thread runroom();
    thread runend();
    thread run_jumper_fail();
    thread run_acti_fail();
    thread autorotation();
    thread secret();
    thread secretend();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();

     addTriggerToList( "trigger_trap1" );
     addTriggerToList( "trigger_trap2" );
     addTriggerToList( "trigger_trap3" );
     addTriggerToList( "trigger_trap4" );
     addTriggerToList( "trigger_trap5" );
     addTriggerToList( "trigger_trap6" );
     addTriggerToList( "trigger_trap7" );
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

fire_effect()
{
    fire = getentarray("room1","targetname");
    fire1 = getentarray("room2","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect2()
{
    fire = getentarray("pump10","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect3()
{
    fire = getentarray("pump12","targetname");
    fire = getentarray("pump14","targetname");
    fire = getentarray("pump16","targetname");
    fire = getentarray("pump18","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect4()
{
    fire = getentarray("mainfire","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect5()
{
    fire = getentarray("redember","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect6()
{
    fire = getentarray("fire1","targetname");
    fire = getentarray("fire2","targetname");
    fire = getentarray("fire3","targetname");
    fire = getentarray("fire4","targetname");
    fire = getentarray("fire5","targetname");
    fire = getentarray("fire6","targetname");
    fire = getentarray("fire7","targetname");
    fire = getentarray("fire8","targetname");
    fire = getentarray("fire9","targetname");
    fire = getentarray("fire10","targetname");
    fire = getentarray("fire11","targetname");
    fire = getentarray("fire12","targetname");
    fire = getentarray("fire13","targetname");
    fire = getentarray("fire14","targetname");
    fire = getentarray("fire15","targetname");
    fire = getentarray("fire16","targetname");
    fire = getentarray("fire17","targetname");

    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect7()
{
    fire = getentarray("wtflava","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect8()
{
    fire = getentarray("treelife","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}

fire_effect9()
{
    fire = getentarray("jetpurple","targetname");
    hfx = undefined;
    level waittill("round_started");

    for(i=0;i<fire.size;i++)
    {
        hfx[i] = spawnfx(level.fire_effect,fire[i].origin);
        triggerfx(hfx[i]);
    }
}


credits()
{

  while(1)
	{
        wait 15;
		iPrintln("^0Thanks to ^5Lentava/Eryk ^0For the race room + skyboxes.");
		wait 5;
		iPrintln("^0Thanks to ^5Blade ^0for the fire fx script.");
         wait 5;
		iPrintln("^0Thanks to ^5Erik1337 ^0for testing the secret.");
		wait 5000;
    }
}

music()
{
    music = randomint(2);
    level waittill("round_started");
    switch(music)
   {
      case 0:
	        AmbientStop(2);
     AmbientPlay( "sight" );
	 iPrintLN("^0ice nine kills - stabbing in the dark");
     break;
           case 1:
	        AmbientStop(2);
     AmbientPlay( "sight1" );
	 iPrintLN("^0in fear and faith - taste of regret");
     break;
	}
}


secretsong()//
{
    trig = getEnt("trigger_sightsecret","targetname");
    trig waittill("trigger", player );
    AmbientStop( 2 );
    wait 2.5;
    ambientPlay("compysecret");
    iPrintlnBold( player.name + "^0 Activated Fear and Faith");
}

secretsong2()//
{
    trig = getEnt("trigger_sightsecret2","targetname");
    trig waittill("trigger", player );
    AmbientStop( 2 );
    wait 2.5;
    ambientPlay("sightsecret2");
    iPrintlnBold( player.name + "^0 Activated The Shining");
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

waitdead()
{
    activator = GetActivator();

    sniper = getent("trigger_sniproom","targetname");
    bounce = getent("trigger_bounceroom","targetname");
    run = getent("trigger_runroom","targetname");
    sniper thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    run    thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    sniper thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
    run thread maps\mp\_utility::triggerOn();
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


sniproom()
{

    level.trigger_scope = getEnt ("trigger_sniproom", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("Press [&&1] to enter ^0Sniper Room");
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

bounceroom()
{
   level.trigger_jump = getEnt ("trigger_bounceroom", "targetname");

    jumperk = getEnt ("origin_bouncejumper", "targetname");
    actik = getEnt ("origin_bounceactif", "targetname");

  for(;;)
    {
        level.trigger_jump setHintString ("Press [&&1] to enter ^0JumpRoom");
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

givesniper()//bounceroom
{
 givesnip = getEnt("givesnip_trig","targetname");
 givesnip setHintString ("^0Press F for weapons");

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

runroom()//script taken from mp_dr_templerun
{
    level.trigger_run = getEnt ("trigger_runroom", "targetname");

    jumpersc = getEnt ("run_jumper", "targetname");
    actisc = getEnt ("run_acti", "targetname");

    for(;;)
    {
       level.trigger_run setHintString ("Press [&&1] to enter ^0Run Room");
        level.trigger_run waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        player setClientDvar( "g_speed", 210 );
        activator setClientDvar( "g_speed", 210 );
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
        thread runend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

runend(who, who2)
{
	trig = getEnt ("trig_run_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
        winner freezeControls (1);
        winner setClientDvar( "g_speed", 210 );
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^0You won");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
        wait 0.1;

		if (winner == who)
			loser = who2;
		else
			loser = who;

		if (isDefined(loser))
		{
            loser setClientDvar( "g_speed", 210 );
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
            loser iPrintLnBold("^0You lost");
		}
	}
}


run_jumper_fail()
{
   trig = getent("trig_run_fail1", "targetname");
   tele = getent ("run_jumper", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^0Failed");
    }
}

run_acti_fail()
{
   trig = getent("trig_run_fail2", "targetname");
   tele = getent ("run_acti", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^0Failed");
    }
}

autorotation()
{
    rotate1 = getent("rotate1","targetname");
    runrotate = getent("runrotate","targetname");
    runrotate1 = getent("runrotate1","targetname");
  for(;;)
  {
   rotate1 rotateYaw (360,5);
   runrotate rotateRoll (360,5);
   runrotate1 rotateRoll (360,5);
   wait 4;
  }
}

secret()//secret room
{
   trig = getent("trigger_secret", "targetname");
   tele1 = getent ("origin_secret", "targetname");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

secretend()//secret end
{
   trig = getent("trigger_endsecret", "targetname");
   tele1 = getent ("origin_secretend", "targetname");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

trap1()
{
     bounce1 = getent("trap1","targetname");
     bounce2 = getent("trap1a","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate 2 bounces");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     bounce1 rotateRoll(360,3);
     bounce2 rotateRoll(-360,3);
     wait 5;
   }

}

trap2()
{
    platform = getent("trap2", "targetname");
    trig = getent("trigger_trap2", "targetname");
    trig setHintString("T2: Delete part of 2 platforms");
	trig waittill("trigger", player);
	trig setHintString("^1Activated.");

	platform delete();
}

trap3()
{
     bounce1 = getent("trap3","targetname");
     bounce2 = getent("trap3a","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate 2 bounces");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     bounce1 rotateYaw(-360,3);
     bounce2 rotateYaw(360,3);
     wait 5;
   }

}

trap4()
{
     bounce1 = getent("trap4","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate 2 bounces as whole");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     bounce1 rotateRoll(360,3);
     wait 5;
     bounce1 rotateRoll(-360,3);
     wait 5;
   }

}

trap5()
{
     plankt1 = getent("trap5","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Unstable bounce for 3 sec");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
	 plankt1 notsolid();
	 wait 4;
	 plankt1 solid();
	wait 2000;
   }

}

trap6()
{
     plat1 = getent("trap6a","targetname");
     plat2 = getent("trap6b","targetname");
     plat3 = getent("trap6c","targetname");
     plat4 = getent("trap6d","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("T6: Rotate 4 platforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateRoll(-360,3);
     plat2 rotateRoll(360,3);
     plat3 rotateRoll(-360,3);
     plat4 rotateRoll(360,3);
     wait 5;
   }

}

trap7()
{
     plat1 = getent("trap7a","targetname");
     plat2 = getent("trap7b","targetname");
     plat3 = getent("trap7c","targetname");
     plat4 = getent("trap7d","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate 4 platforms at ^0the end");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateRoll(-360,3);
     plat2 rotateRoll(360,3);
     plat3 rotateRoll(-360,3);
     plat4 rotateRoll(360,3);
     wait 5;
   }

}