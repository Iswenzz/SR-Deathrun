/*
 disc; clanlessckmpoy
 /devmap mp_dr_old_fucktory
*/

main()
{
    maps\mp\_load::main();
    maps\mp\mp_dr_old_fucktory_fx::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // setdvar("g_speed" ,"210");

    thread forcefullbright();
    thread music();
    thread sniproom();
    thread kniferoom();
    thread weaponroom();
    thread weaponfail();
    thread compy();
    thread endmap_trig();
    thread acti1();
    thread acti2();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread startdoor();
    thread messages();

     addTriggerToList( "trigger_trap1" );
     addTriggerToList( "trigger_trap2" );
     addTriggerToList( "trigger_trap3" );
     addTriggerToList( "trigger_trap4" );
     addTriggerToList( "trigger_trap5" );

    precacheItem("ak47_mp");
}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

forcefullbright()
{
    level waittill("round_started");
    while(1)
    {
        players = getEntArray( "player", "classname" );
        for(i = 0; i < players.size; i++){
            players[i] setClientDvar("r_fullbright", 0);
        }
        wait 1;
    }
}

music()
{

    fogcover = getEnt("coverfog", "targetname");
    maps\mp\_fx::loopfx("effect_1", (fogcover.origin), 40);
    level.music = randomint(2);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "anomaly" );
     break;
      case 1:
     AmbientPlay( "anomaly2" );
     break;
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
    weapon = getEnt ("trigger_weaponroom", "targetname");
    scope thread maps\mp\_utility::triggerOff();
    knife thread maps\mp\_utility::triggerOff();
    weapon thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
    knife thread maps\mp\_utility::triggerOn();
    weapon thread maps\mp\_utility::triggerOn();
}

sniproom()
{

    level.trigger_scope = getEnt ("trigger_sniproom", "targetname");

    jumpersc = getEnt ("origin_sniperjumper", "targetname");
    actisc = getEnt ("origin_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("Press [&&1] to enter scope Room.");
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

weaponroom()
{

   level.trigger_weapon = getEnt ("trigger_weaponroom", "targetname");

    jumperk = getEnt ("origin_jumperw", "targetname");
    actik = getEnt ("origin_actiw", "targetname");

   for(;;)
    {
        level.trigger_weapon setHintString ("Press [&&1] to enter Waeapon Room.");
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

weaponfail()//respawn in fweapon sroom
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

compy()
{
 mylogo= getent("mylogo","targetname");
  for(;;)
  {
     mylogo rotateyaw (360, 5);
     wait 5;
     mylogo rotateyaw (360, 5);
     wait 5;
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

acti1()//Move to next area acti
{
   trig = getent("trigger_acti1", "targetname");
   tele1 = getent ("origin_acti1", "targetname");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

acti2()//Move to next area acti
{
   trig = getent("trigger_acti2", "targetname");
   tele1 = getent ("origin_acti2", "targetname");

   for (;;)
    {
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
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
     plankt1 = getent("trap2","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate thing");
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
     plankt1 = getent("trap3","targetname");
     plankt2 = getent("trap3a","targetname");
     plankt3 = getent("trap3b","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate 3 plats");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateYaw(360,3);
     plankt2 rotateYaw(-360,3);
     plankt3 rotateYaw(360,3);
     wait 10;
   }

}

trap4()
{
     plankt1 = getent("trap4","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate thing");
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
    platform = getent("trap5", "targetname");
    trig = getent("trigger_trap5", "targetname");
    trig setHintString("T5:unstable the bounce");
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

startdoor()
{
 startdoor = getent("startdoor", "targetname");

 wait 15;

 startdoor moveZ(-350, 5);

 wait 15;
}
messages()
{

    wait 10;

     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823 / clanlesscompy.");


}