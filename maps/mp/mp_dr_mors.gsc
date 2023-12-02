/*
disc : clanlesscompy.
/devmap mp_dr_mors
*/

main()
{
    maps\mp\_load::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // setdvar("g_speed" ,"210");

    thread music();
    thread endmap_trig();
	thread sniproom();
	thread weaponroom();
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
    thread trap11();
	thread trap12();

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

	 precacheItem("m40a3_mp");
     precacheItem("remington700_mp");
     precacheItem("knife_mp");
     precacheItem("ak47_mp");
     precacheItem("deserteagle_mp");
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music()
{
     insidesnip1 = getEnt("fx1", "targetname");
     insidesnip2 = getEnt("fx2", "targetname");
     insidesnip3 = getEnt("fx3", "targetname");
     insideweap4 = getEnt("fx4", "targetname");
     insideweap5 = getEnt("fx5", "targetname");
	 insideweap6 = getEnt("sniperfx", "targetname");
     maps\mp\_fx::loopfx("effect_1", (insidesnip1.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (insidesnip2.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (insidesnip3.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (insideweap4.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (insideweap5.origin), 1);
     maps\mp\_fx::loopfx("effect_2", (insideweap6.origin), 1);


  level.music = randomint(3);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "sleeper1" );
     break;
           case 1:
     AmbientPlay( "sleeper2" );
     break;
                case 2:
     AmbientPlay( "sleeper3" );
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
    jump = getent("trigger_jumproom","targetname");
    weapon = getEnt ("trigger_weaponroom", "targetname");
    scope thread maps\mp\_utility::triggerOff();
    jump thread maps\mp\_utility::triggerOff();
    weapon thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    jump thread maps\mp\_utility::triggerOn();
    weapon thread maps\mp\_utility::triggerOn();
}

sniproom()
{

    level.trigger_scope = getEnt ("trigger_sniproom", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    for(;;)
    {
		level.trigger_scope setHintString ("Press [&&1] to enter Snip Room");
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

weaponroom()
{

   level.trigger_weapon = getEnt ("trigger_weaponroom", "targetname");

    jumperk = getEnt ("origin_jumperw", "targetname");
    actik = getEnt ("origin_actiw", "targetname");

   for(;;)
    {
		level.trigger_weapon setHintString ("Press [&&1] to enter weaponroom");
        level.trigger_weapon waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("ak47_mp");
        activator giveWeapon("ak47_mp");
        player switchToWeapon("ak47_mp");
        activator switchToWeapon("ak47_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("" + player.name + " has died in Weapon Room");
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
     trig setHintString("t1: rotate plat");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 0.1;
   }

}

trap2()
{
    platform = getent("trap2", "targetname");
    trig = getent("trigger_trap2", "targetname");
    trig setHintString("t2: unstable middle plat");
    trig waittill ("trigger");
    trig setHintString("^7Activated");


   for(;;)
	{
	 platform notsolid();
	 wait 10;
	 platform solid();
	wait 2000;
	}
}

trap3()
{
     plat1 = getent("trap3","targetname");
     plat2 = getent("trap3a","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate 2 pl;atforms");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateroll(360,3);
     plat2 rotateroll(360,3);
     wait 5;
   }

}

trap4()
{
     plat1 = getent("trap4","targetname");
     plat2 = getent("trap4a","targetname");
	 plat3 = getent("trap4b","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate 3 platforms below");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(360,3);
	 plat3 rotateYaw(360,3);
     wait 0.1;
   }

}

trap5()
{
     plankt1 = getent("trap5","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("t5: rotate plat below");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap6()
{
   plata = getent("trap6", "targetname");
   platb = getent("trap6a", "targetname");

   trig = getent("trigger_trap6", "targetname");

   trig setHintString("t6: shjrink 3 plats below");
   trig waittill ("trigger");
   trig setHintString("^7Activated");
  for(;;)
	{
	 plata moveZ (-100,4);
     platb moveZ (100,4);
     wait 4;

     plata moveZ (-100,4);
     platb moveZ (100,4);
     wait 4;
	 }
}

trap7()
{
   plata = getent("trap7", "targetname");
   platb = getent("trap7a", "targetname");
   platc = getent("trap7b", "targetname");

   trig = getent("trigger_trap7", "targetname");

   trig setHintString("t7; Move up n down the 3 platforms");
   trig waittill ("trigger");
   trig setHintString("^7Activated");
  for(;;)
	{
	 plata moveZ (-100,4);
     platb moveZ (100,4);
     platc moveZ (-100,4);

     wait 4;

     plata moveZ (100,4);
     platb moveZ (-100,4);
     platc moveZ (100,4);
     wait 4;
	 }
}

trap8()
{
     plat1 = getent("trap8","targetname");
     plat2 = getent("trap8a","targetname");
     plat3 = getent("trap8b","targetname");
     trig = getent("trigger_trap8","targetname");
	 trig setHintString("t8; rotate 4 squares");
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

trap9()
{
     plankt1 = getent("trap9","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("t9; rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}

trap10()
{
     plankt1 = getent("trap10","targetname");
     trig = getent("trigger_trap10", "targetname");
     trig setHintString("t10; rotate plat below");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 0.1;
   }

}


trap11()
{
     plankt1 = getent("trap11","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("t11; rotate bounce");
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
     trig setHintString("rotate plat");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }

}