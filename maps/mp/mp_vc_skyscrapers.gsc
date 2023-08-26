/*Map Dedicated to my Beloved Vistic
 Map By CoMpy.
 /devmap mp_vc_skyscrapers


                                                                                                            
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
    maps\mp\mp_vc_skyscrapers_fx::main();

     clip0 = getent ("vistic9938183218931", "targetname");
     clip1 = getent ("91348caiaivistic", "targetname"); 
     clip2 = getent ("9991288fivvvvistic", "targetname"); 
     clip3 = getent ("visticclan33123vv", "targetname"); 
     clip4 = getent ("vvvisticccclan133", "targetname"); 
     clip5 = getent ("vvvvistic3999clan", "targetname"); 
     clip6 = getent ("999vistic66iicclan", "targetname"); 
     clip7 = getent ("vistic991ccccclanckkad", "targetname"); 
     clip8 = getent ("visticmyvistic999123", "targetname"); 
     clip9 = getent ("7secvistic9096", "targetname"); 
     clip10 = getent ("visticfan99383", "targetname"); 
     clip11 = getent ("ouloulouloulou9991", "targetname");

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
    thread vclogos();
    thread endplat();
    thread endmap_trig();
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
    thread move1();//acti tp1
    thread move2();//acti tp2
    thread sniproom();
    thread failsniper();
    thread kniferoom();
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

}

addTriggerToList(name)
{
    if(!isDefined( level.trapTriggers ))
        level.trapTriggers = [];
    
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


music()
{
  
    cloud1 = getEnt("cloud1", "targetname");
    cloud2 = getEnt("cloud2", "targetname");
    f1 = getEnt("f1", "targetname");
    f2 = getEnt("f2", "targetname");
    f3 = getEnt("f3", "targetname");
  
    maps\mp\_fx::loopfx("effect_1", (cloud1.origin), 500);
    maps\mp\_fx::loopfx("effect_1", (cloud2.origin), 500);
    maps\mp\_fx::loopfx("effect_2", (f1.origin), 1);
    maps\mp\_fx::loopfx("effect_2", (f2.origin), 1);
    maps\mp\_fx::loopfx("effect_2", (f3.origin), 1);

    level.music = randomint(2);
    level waittill("round_started");
    switch(level.music)
   {
      case 0:
     AmbientPlay( "lover" );
     break;
      case 1:
     AmbientPlay( "lover1" );
     break;
   }
}

vclogos()
{
 vc = getent("vc5","targetname");   
 vc1 = getent("vc2","targetname");   
 vc2 = getent("vc7","targetname");                            
  for(;;) 
  {
     vc rotateyaw (360, 7);
     vc1 rotateyaw (360, 7);
     vc2 rotateyaw (360, 7);
     vc moveZ (200, 7);
     vc1 moveZ (200, 7);
     vc2 moveZ (200, 7);
     wait 7;
     vc rotateyaw (360, 7);
     vc1 rotateyaw (360, 7);
     vc2 rotateyaw (360, 7);
     vc moveZ (-200, 7);
     vc1 moveZ (-200, 7);
     vc2 moveZ (-200, 7);
     wait 7;
  }
      
}

endplat()
{
  silly = getEnt("cylinderend","targetname");//end platform moving up n down

	while(1)
	{
		  silly moveZ(50, 5, 0.5, 0.5);
      
		 wait 5;
		  silly moveZ(-50, 5, 0.5, 0.5);
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

trap1()
{
    platform = getent("trap1", "targetname");
    trig = getent("trigger_trap1", "targetname");
    trig setHintString("T1: Unstable the platform for 5sec.");
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

trap2()//x3
{
     plankt1 = getent("trap2a","targetname");
     plankt2 = getent("trap2b","targetname");
     plankt3 = getent("trap2c","targetname");
     trig = getent("trigger_trap2", "targetname");
     trig setHintString("T2: Rotate x3 cylinders");
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

trap3()
{
     plankt1 = getent("trap3","targetname");
     trig = getent("trigger_trap3", "targetname");
     trig setHintString("T3: Rotate bounce");
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

trap5()//x4
{
     plankt1 = getent("trap5","targetname");
     plankt2 = getent("trap5a","targetname");
     plankt3 = getent("trap5b","targetname");
     plankt4 = getent("trap5c","targetname");
     trig = getent("trigger_trap5", "targetname");
     trig setHintString("T5: Rotate x4 cylinders");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     plankt2 rotateYaw(-360,3);
     plankt3 rotateYaw(360,3);
     plankt4 rotateYaw(-360,3);
     wait 10;

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
     plankt1 = getent("trap7","targetname");
     trig = getent("trigger_trap7", "targetname");
     trig setHintString("T7: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap8()//x3
{
     plankt1 = getent("trap8a","targetname");
     plankt2 = getent("trap8b","targetname");
     plankt3 = getent("trap8c","targetname");
     trig = getent("trigger_trap8", "targetname");
     trig setHintString("T8: Rotate x3 cylinders");
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

trap9()//x3
{
     plankt1 = getent("trap9a","targetname");
     plankt2 = getent("trap9b","targetname");
     plankt3 = getent("trap9c","targetname");
     trig = getent("trigger_trap9", "targetname");
     trig setHintString("T9: Rotate x3 cylinders");
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

trap10()
{
     plankt1 = getent("trap10","targetname");
     trig = getent("trigger_trap10", "targetname");
     trig setHintString("T10: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

trap11()
{
     plankt1 = getent("trap11","targetname");
     trig = getent("trigger_trap11", "targetname");
     trig setHintString("T11: Rotate bounce");
     trig waittill ("trigger");
     trig setHintString("^7Activated");
    
	for(;;)
   { 
     wait 0.1;
     plankt1 rotateYaw(360,3);
     wait 10;
   }
      
}

move1()//Move to next area acti
{
   trig = getent("trigger_acti1", "targetname");
   tele1 = getent ("origin_acti1", "targetname");
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
   trig = getent("trigger_acti2", "targetname");
   tele1 = getent ("origin_acti2", "targetname");
   trig setHintString ("Move to other area");
   
   for (;;)
    {   
     trig waittill ("trigger", player);
	   player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
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
    scope thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    scope thread maps\mp\_utility::triggerOn();
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

messages()
{    
    wait 15;

     iprintln ("^7Map Dedicated to my forever Beloved ^6Vistic.");

    wait 10;
     
     iprintln ("^7Diskord ^5[CIR] eG0sxs#1823");

    wait 10;
     
     iprintln ("^5Vistic ^7Discord: https://discord.gg/JKwXV3h ");
    
}