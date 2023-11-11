/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_ethereal3



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

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // setdvar("g_speed" ,"210");

    thread forcefullbright();
    thread music();
    thread endmap_trig();
    thread vistic();
    thread sniproom();
    thread rotator1();//auito trap in the beginning
    thread rotator2();//auto trap inside 'cave' shit
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread messages();


   addTriggerToList( "trigger_trap1" );
   addTriggerToList( "trigger_trap2" );
   addTriggerToList( "trigger_trap3" );
   addTriggerToList( "trigger_trap4" );
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
        wait 0.1;
    }
}

music()
{
    level.music = randomint(2);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "cern" );
     break;

     case 1:
     AmbientPlay( "cern1" );
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

vistic()
{
 vc = getent("visticlogo3","targetname");

  for(;;)
  {
  vc rotateYaw (360,7);
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

rotator1()
{
 rotator1 = getent("rotator1","targetname");

  for(;;)
  {
  rotator1 rotateYaw (360,4);
  wait 4;
  }

}

rotator2()
{
   plata = getent("auto1", "targetname");//upndown
   platb = getent("auto2", "targetname");//upndown

  for(;;)
	{
	 plata moveZ (-50,3);
     platb moveZ (50,3);

     wait 3;

     plata moveZ (50,3);
     platb moveZ (-50,3);
     wait 3;
	 }
}

trap1()
{
 part1 = getentarray("trap1a","targetname");
 part2 = getentarray("trap1b","targetname");
 part3 = getentarray("trap1c","targetname");
 part4 = getentarray("trap1d","targetname");
 trig = getent("trigger_trap1","targetname");
 trig  setHintString("T1: Make unstable 4 platforms");
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
 trig SetHintString("Activated");
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

trap2()
{
 part1 = getentarray("trap2","targetname");
 part2 = getentarray("trap2a","targetname");
 part3 = getentarray("trap2b","targetname");
 trig = getent("trigger_trap2","targetname");
 trig  setHintString("T2: Randomly unstable 1 platform");
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
 trig SetHintString("Activated");
 random = randomint(3);
	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;

		case 1:
				part2[randomInt(part2.size)] notsolid();
                break;

		case 2:
				part3[randomInt(part3.size)] notsolid();
                break;

		default: return;
	}
}

trap3()
{
     plankt1 = getent("trap3","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate thje white platform");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plankt1 rotateroll(360,3);
     wait 5;
   }

}

trap4()
{
     plat1 = getent("trap4","targetname");
     plat2 = getent("trap4a","targetname");
     plat3 = getent("trap4b","targetname");
     plat4 = getent("trap4c","targetname");
     plat5 = getent("trap4d","targetname");
     plat6 = getent("trap4e","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate 6 platforms");
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
     wait 0.1;
   }

}

messages()
{

    wait 10;

     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823 / clanlesscompy.");

      wait 10;

     iprintln ("^7Steam: ^5[CIR] eG0sxs");


}