/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_constructionv2



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
    maps\mp\mp_vc_constructionv2_fx::main();

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

    // setdvar("g_speed" ,"210");

    thread forcefullbright();
    thread music();
    thread messages();
    thread messagescreen();
    thread vistic();
    thread endmap_trig();
    thread rotator1();//rotate trap auto acti at start
    thread rotator2();//second rotate trap at start
    thread vistic1();
    thread compy();
    thread sniproom();
    thread kniferoom();
    thread weaponroom();
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


    precacheItem("ak47_mp");

}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];

    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
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
     start1 = getEnt("fx1", "targetname");
     start2 = getEnt("fx2", "targetname");
     start3 = getEnt("fx3", "targetname");
     start4 = getEnt("fx4", "targetname");
     start5 = getEnt("fx5", "targetname");
     orangebolt = getEnt("fx6", "targetname");
     middle1 = getEnt("middle1", "targetname");
     middle2 = getEnt("middle2", "targetname");
     middle3 = getEnt("middle3", "targetname");
     snd = getEnt("fx7", "targetname");
     snd1 = getEnt("fx8", "targetname");
     snd2 = getEnt("fx9", "targetname");
     snd3 = getEnt("fx10", "targetname");
     snd4 = getEnt("fx11", "targetname");
     snd5 = getEnt("fx12", "targetname");
     snd6 = getEnt("fx13", "targetname");
     snd7 = getEnt("fx19", "targetname");
     snd8 = getEnt("fx20", "targetname");
     snd9 = getEnt("fx16", "targetname");
     snd10 = getEnt("fx17", "targetname");
     snd11 = getEnt("fx18", "targetname");
     end1 = getEnt("end1", "targetname");
     end2 = getEnt("end2", "targetname");
     end3 = getEnt("end3", "targetname");
     end12 = getEnt("end12", "targetname");
     end13 = getEnt("end13", "targetname");
     end14 = getEnt("end14", "targetname");
     fire1 = getEnt("fire1", "targetname");
     fire2 = getEnt("fire2", "targetname");


     maps\mp\_fx::loopfx("effect_1", (start1.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (start2.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (start3.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (start4.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (start5.origin), 1);
     maps\mp\_fx::loopfx("effect_5", (orangebolt.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (middle1.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (middle2.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (middle3.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd1.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd2.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd3.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd4.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd5.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd6.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (snd7.origin), 1);
     maps\mp\_fx::loopfx("effect_4", (snd8.origin), 1);
     maps\mp\_fx::loopfx("effect_4", (snd9.origin), 1);
     maps\mp\_fx::loopfx("effect_4", (snd10.origin), 1);
     maps\mp\_fx::loopfx("effect_4", (snd11.origin), 1);
     maps\mp\_fx::loopfx("effect_3", (end1.origin), 1); //endr
     maps\mp\_fx::loopfx("effect_3", (end2.origin), 1); //endr
     maps\mp\_fx::loopfx("effect_3", (end3.origin), 1); //endr
     maps\mp\_fx::loopfx("effect_1", (end12.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (end13.origin), 1);
     maps\mp\_fx::loopfx("effect_1", (end14.origin), 1);
     maps\mp\_fx::loopfx("effect_2", (fire1.origin), 1);
     maps\mp\_fx::loopfx("effect_2", (fire2.origin), 1);

    level.music = randomint(1);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "speaker1" );
     break;
   }
}

messages()
{

    wait 10;

     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823 / clanlesscompy.");

      wait 10;

     iprintln ("^7Steam: ^5[CIR] eG0sxs");


}

messagescreen()
{
	 level waittill("round_started");
	 wait 1;
	 noti = SpawnStruct();
    noti.TitleText = "^9Map by ^6CoMpy ^9inspired by ^5ERIKK's";
    noti.notifyText = "^9Credits to ^5Death^9.";
	noti.duration = 8;
	noti.glowcolor = (1,1,1);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

vistic()
{
 vistic_logo = getent("vishtick","targetname");
  for(;;)
  {
     vistic_logo rotateyaw (360, 5);
     vistic_logo moveZ (1000, 5);
     wait 5;
     vistic_logo rotateyaw (-360, 5);
     vistic_logo moveZ (-1000, 5);
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

rotator1()
{
 rotator1 = getent("rotator1","targetname");

  for(;;)
  {
  rotator1 rotateYaw (360,7);
  wait 5;
  }

}

rotator2()
{

 rotator2 = getent("rotator2","targetname");

  for(;;)
  {
  rotator2 rotateYaw (360,7);
  wait 5;
  }

}

vistic1()
{
 vistic_logo1 = getent("vistic","targetname");

  for(;;)
  {
   vistic_logo1 rotateYaw (360,5);
   wait 1;
  }

}

compy()
{
 mylogo= getent("compy","targetname");
  for(;;)
  {
     mylogo rotateyaw (360, 5);
     wait 5;
     mylogo rotateyaw (360, 5);
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

trap1()
{
     plat1 = getent("trap1","targetname");
     plat2 = getent("trap1a","targetname");
     trig = getent("trigger_trap1", "targetname");
     trig setHintString("T1: Rotate the 2 squares below");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(-360,3);
     wait 5;
   }

}

trap2()
{
     plat1 = getent("trap2","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate big square");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     wait 0.1;
   }

}

trap3()
{
     plat1 = getent("trap3","targetname");
     plat2 = getent("trap3a","targetname");
     plat3 = getent("trap3b","targetname");
     plat4 = getent("trap3c","targetname");
     plat5 = getent("trap3d","targetname");
     plat6 = getent("trap3e","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate 6 platforms");
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

trap4()
{
     plat1 = getent("trap4","targetname");
     plat2 = getent("trap4a","targetname");
     trig = getent("trigger_trap4", "targetname");
     trig setHintString("T4: Rotate 2 rolls");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotatepitch(360,3);
     plat2 rotatepitch(360,3);
     wait 5;
   }

}

trap5()
{
     plat1 = getent("trap5","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Rotate big square");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(-360,3);
     wait 0.1;
   }

}

trap6()
{
     plat1 = getent("trap6","targetname");
     plat2 = getent("trap6a","targetname");
     trig = getent("trigger_trap6", "targetname");
     trig setHintString("T6: Rotate 2 rolls");
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

trap7()
{
     plat1 = getent("trap7","targetname");
     plat2 = getent("trap7a","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate 2 squares");
     trig waittill ("trigger");
     trig setHintString("^7Activated");

	for(;;)
   {
     wait 0.1;
     plat1 rotateYaw(360,3);
     plat2 rotateYaw(360,3);
     wait 5;
   }

}