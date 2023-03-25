//Map by MiThyX


main()
{
 maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

	// setdvar("g_speed" ,"190");
	// setdvar("dr_jumpers_speed" ,"1");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");


		//TRIGGERS//
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	addTriggerToList( "trig_trap10" );


	thread messages();
	thread messages2();
	thread messages3();
	thread messages4();
	thread messages5();
	thread messages6();
	thread startdoor();
	thread music();
	thread autorotate();
	thread autorotate2();
	thread autorotate3();
	thread autorotate4();
	thread autorotate5();
	thread autorotate6();
	thread automove();
	thread endmap();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap8();
	thread trap7();
	thread trap9();
	thread trap10();
	thread secret();
	thread secretactifail();
	thread secret2();
	thread secretjumpfail();
	thread bounceroomjumpfail();
	thread bounceroomactifail();
	thread endsecret();
	thread endsecret2();
	thread sniper();
	thread old();
	thread bounce();
    thread jump();
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

messages()
{
wait 10;
iprintlnBold("^4---- ^2Jump ^2by ^6M^2i^3T^4h^5y^6X ^4----");
wait 1;
}

messages2()
{
wait 45;
iprintln("^4---- ^2Map ^2by ^6M^2i^3T^4h^5y^6X ^4----");
wait 1;
}

messages3()
{
wait 40;
iprintln("^4---- ^7Bro deathrun: 176.57.143.107:29031 ^4----");
wait 1;
}

messages4()
{
wait 20;
iprintln("^6Y^2o^3u^4t^5u^6b^2e^7:https://www.youtube.com/channel/UCLPUQ9wxNmnPcNcHxPkblrA");
wait 1;
}

messages5()
{
wait 10;
iprintln("^2Special ^5Thanks: ^8[DJS]Deathrun, ^6Rmp");
wait 1;
}

messages6()
{
wait 15;
iprintln("^2Skype and Steam: MiThyX");
wait 1;
}

startdoor()
{
lootje = getent("startdoor","targetname");
{
wait 15;
lootje moveZ(-280, 5);
iprintlnbold("^4---- ^1G^3o^2o^4d^1L^6u^2c^3k ^4---- ");
wait 2;
}
}

music()
{
    level waittill( "round_started" );

    wait 1;

    ambientPlay( "song1" );
}

autorotate()
{
    block = getent("autorotate","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(200, 5);
	wait 2;
	}

}

autorotate2()
{
    block = getent("autorotate2","targetname");

    for(;;)
	{
	wait 2;
	block rotateroll(600, 5);
	wait 2;
	}

}

autorotate3()
{
    block = getent("autorotate3","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(-400, 15);
	wait 2;
	}

}

autorotate4()
{
    block = getent("autorotate4","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(400, 15);
	wait 2;
	}

}

autorotate5()
{
    block = getent("autorotate5","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(400, 15);
	wait 2;
	}

}

autorotate6()
{
    block = getent("autorotate6","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(400, 10);
	wait 2;
	}

}

automove()
{
   block = getent("automove","targetname");

   for(;;)
   {
   wait 10;
   block moveY (-1250, 10);
   wait 10;
   block moveY (1250, 10);
   }

}

endmap()
{
   endmap = getent("trig_endmap","targetname");
   endmap waittill("trigger",player);
   {
   wait 0.5;
   iprintlnBold(" ^9" + player.name + " ^2 has finished the Map at ^4first^2 place ^1!");
   wait 2;
   }
   endmap delete();
}

trap1()
{
    block1 = getent("trap1-1","targetname");
	block2 = getent("trap1-2","targetname");
	block3 = getent("trap1-3","targetname");
    block4 = getent("trap1-4","targetname");
	block5 = getent("trap1-5","targetname");
	block6 = getent("trap1-6","targetname");
	trig = getent("trig_trap1","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(1440, 4);
	block2 rotateYaw(1440, 4);
	block3 rotateYaw(1440, 4);
	block4 rotateYaw(1440, 4);
	block5 rotateYaw(1440, 4);
	block6 rotateYaw(1440, 4);
	wait 0.1;
	}

}

trap2()
{
    block1 = getent("trap2-1","targetname");
	block2 = getent("trap2-2","targetname");
	block3 = getent("trap2-3","targetname");
	trig = getent("trig_trap2","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(360, 5);
	block2 rotateYaw(360, 5);
	block3 rotateYaw(360, 5);
	wait 8;
	}

}

trap3()
{
    block1 = getent("trap3-1","targetname");
	block2 = getent("trap3-2","targetname");
	trig = getent("trig_trap3","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	block1 moveY (350, 3);
	block2 moveY (-350, 3);
	wait 3;
	block1 moveY (-350, 3);
	block2 moveY (350, 3);
	wait 3;
	}

}

trap4()
{
    block1 = getent("trap4","targetname");
	trig = getent("trig_trap4","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotatepitch(360, 5);
	wait 8;
	}

}

trap5()
{
    block1 = getent("trap5","targetname");
	trig = getent("trig_trap5","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotatepitch(360, 5);
	wait 8;
	}

}

trap6()
{
   platform = getent("trap6","targetname");
   trig = getent("trig_trap6","targetname");
   trig waittill("trigger",player);
   player braxi\_rank::giveRankXP("", 60);

   platform delete();

   trig delete();

}

trap8()
{
    block1 = getent("trap8-1","targetname");
	block2 = getent("trap8-2","targetname");
	trig = getent("trig_trap8","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateroll(360, 5);
	block2 rotatepitch(360, 5);
	wait 5;
	}

}

trap7()
{
    block1 = getent("trap7-1","targetname");
	block2 = getent("trap7-2","targetname");
	block3 = getent("trap7-3","targetname");
	trig = getent("trig_trap7","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(1440, 4);
	block2 rotateYaw(1440, 4);
	block3 rotateYaw(1240, 4);
	wait 0.1;
	}

}

trap9()
{
    block1 = getent("trap9-1","targetname");
	block2 = getent("trap9-2","targetname");
	block3 = getent("trap9-3","targetname");
	block4 = getent("trap9-4","targetname");
	block5 = getent("trap9-5","targetname");
	trig = getent("trig_trap9","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(1440, 4);
	block2 rotateYaw(1440, 4);
	block3 rotateYaw(1240, 4);
	block4 rotateYaw(1240, 4);
	block5 rotateYaw(-1240, 4);
	wait 0.1;
	}

}

trap10()
{
    block1 = getent("trap10-1","targetname");
	block2 = getent("trap10-2","targetname");
	block3 = getent("trap10-3","targetname");
	trig = getent("trig_trap10","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.5;
	block1 rotateYaw(-400, 10);
	block2 rotateYaw(400, 10);
	block3 rotateYaw(-400, 10);
	wait 2;
	}

}

secret()
{
   level.secret_trigger = getent("trig_tp1","targetname");
   telejumporigin = getent("secret_jumper", "targetname");

   while(1)
   {
      level.secret_trigger waittill( "trigger", player );
      if( !isDefined( level.secret_trigger ) )
      return;
      if(level.firstenter==true)
   wait(0.05);

   player SetOrigin( telejumporigin.origin );
   player setplayerangles( telejumporigin.angles );
   wait(0.05);

}
}

secretactifail()
{
	sniperjumper2 = getEnt("secret_acti_respawn", "targetname");
	origin_acti_secret = getEnt("origin_acti_secret", "targetname");

	for (;;)
	{
		sniperjumper2 waittill("trigger", player);
		player setOrigin(origin_acti_secret.origin);
		player setPlayerAngles(origin_acti_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

secret2()
{
   level.secret2_trigger = getent("trig_tp4","targetname");
   telejumporigin2 = getent("secret2_jumper", "targetname");

   while(1)
   {
      level.secret2_trigger waittill( "trigger", player );
      if( !isDefined( level.secret2_trigger ) )
      return;
      if(level.firstenter==true)
   wait(0.05);

   player SetOrigin( telejumporigin2.origin );
   player setplayerangles( telejumporigin2.angles );
   wait(0.05);

}
}

secretjumpfail()
{
	secretjumper = getEnt("secret_jumper_respawn", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

bounceroomjumpfail()
{
	sniperjumper = getEnt("bounce_jumper_respawn", "targetname");
	origin_jumper_bounce = getEnt("origin_jumper_bounce", "targetname");

	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_jumper_bounce.origin);
		player setPlayerAngles(origin_jumper_bounce.angles);
		player iprintln("^3>>^1Respawned");
	}
}

bounceroomactifail()
{
	sniperjumper = getEnt("bounce_acti_respawn", "targetname");
	origin_acti_bounce = getEnt("origin_acti_bounce", "targetname");

	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_acti_bounce.origin);
		player setPlayerAngles(origin_acti_bounce.angles);
		player iprintln("^3>>^1Respawned");
	}
}

endsecret()
{
   level.endsecret_trigger = getent("trig_tp2","targetname");
   telejumporigin2 = getent("jumper_secretend", "targetname");

   while(1)
   {
      level.endsecret_trigger waittill( "trigger", player );
      if( !isDefined( level.endsecret_trigger ) )
      return;
      if(level.firstenter==true)
   wait(0.05);

   player SetOrigin( telejumporigin2.origin );
   player setplayerangles( telejumporigin2.angles );
   iprintlnbold(" ^9" + player.name + " ^8 has finished the first secret room!!");
   player braxi\_rank::giveRankXP("", 400);
   wait(0.05);

}
}

endsecret2()
{
   level.endsecret2_trigger = getent("trig_tp3","targetname");
   telejumporigin3 = getent("jumper_secretend2", "targetname");

   while(1)
   {
      level.endsecret2_trigger waittill( "trigger", player );
      if( !isDefined( level.endsecret2_trigger ) )
      return;
      if(level.firstenter==true)
   wait(0.05);

   player SetOrigin( telejumporigin3.origin );
   player setplayerangles( telejumporigin3.angles );
   iprintlnbold(" ^9" + player.name + " ^8 has finished the second secret room!!");
   player braxi\_rank::giveRankXP("", 400);
   wait(0.05);

}
}

sniper()
{
   level.sniper_trigger = getent("trig_sniper","targetname");
   level.teleactorigin = getent("origin_acti_sniper", "targetname");
   telejumporigin = getent("origin_jumper_sniper", "targetname");

   while(1)
   {
      level.sniper_trigger waittill( "trigger", player );

      if( !isDefined( level.sniper_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.bounce_trigger delete();
   level.jump_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((7726, 1208, -84));
   player SetPlayerAngles((0,330,0));
   player TakeAllWeapons();
   player GiveWeapon("m40a3_mp");
   player GiveWeapon( "remington700_mp" );
   player GiveMaxAmmo("m40a3_mp");
   player GiveMaxAmmo( "remington700_mp" );
   wait .05;
   player SwitchToWeapon("m40a3_mp");
   wait(0.05);
   level.activ SetOrigin((10286, -616, -84));
   level.activ SetPlayerAngles((0,150,0));
   level.activ TakeAllWeapons();
   level.activ GiveWeapon( "m40a3_mp" );
   level.activ GiveWeapon( "remington700_mp" );
   level.activ GiveMaxAmmo("m40a3_mp");
   level.activ GiveMaxAmmo( "remington700_mp" );
   wait .05;
   level.activ SwitchToWeapon("m40a3_mp");
   iPrintlnBold( " ^9" + player.name + " ^4 has entered the Sniper room^8!" );
   wait(0.05);
   player switchToWeapon( "m40a3_mp" );
   level.activ SwitchToWeapon( "m40a3_mp" );
   player waittill( "death" );
   level.PlayerInRoom = false;
   }
}

old()
{
   block1 = getent("porte1","targetname");
   level.old_trigger = getent("trig_porte1","targetname");
   level.old_trigger waittill("trigger",player);

   level.bounce_trigger delete();
   level.sniper_trigger delete();
   level.jump_trigger delete();
   level.firstenter=false;
   {
   wait 2;
   block1 moveZ (-500, 5);
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Old room^8!");
   wait 2;
   }
   level.old_trigger delete();
}

bounce()
{
   level.bounce_trigger = getent("trig_bounce","targetname");
   level.teleactorigin = getent("bounce_acti_respawn","targetname");
   telejumporigin = getent("bounce_jumper_respawn","targetname");

   while(1)
   {
      level.bounce_trigger waittill("trigger",player );

      if( !isDefined(level.bounce_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.sniper_trigger delete();
   level.jump_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((7928, 3384, 136));
   player SetPlayerAngles((0,360,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((7928, 5128, 136));
   level.activ SetPlayerAngles((0,360,0));
   level.activ TakeAllWeapons();
   wait .05;
   level.activ giveweapon("knife_mp");
   player giveweapon("knife_mp");
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Bounce room^8!");
   wait(0.05);



   player waittill( "death" );
   level.PlayerInRoom = false;

}
}

jump()
{
   level.jump_trigger = getent("trig_knife","targetname");
   level.teleactorigin = getent("jump_acti_respawn","targetname");
   telejumporigin = getent("jump_jumper_respawn","targetname");


   while(1)
   {
      level.jump_trigger waittill("trigger",player );

      if( !isDefined(level.jump_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.sniper_trigger delete();
   level.bounce_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((8968, 6664, -584));
   player SetPlayerAngles((0,360,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((9544, 6664, -584));
   level.activ SetPlayerAngles((0,180,0));
   level.activ TakeAllWeapons();
   wait .05;
   level.activ giveweapon("knife_mp");
   player giveweapon("knife_mp");
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Knife room^8!");
   wait(0.05);



   player waittill( "death" );
   level.PlayerInRoom = false;

}
}
