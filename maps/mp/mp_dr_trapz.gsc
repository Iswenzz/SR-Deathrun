main()
{
	maps\mp\_load::main();
	

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );

	thread message1();
	thread message2();
	thread message3();
	thread music();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread sniper();
	thread bounceroomjumpfail();
	thread bounceroomactifail();
	thread bounce();
	thread jump();
	thread old();
	thread endmap();
	thread porte1();
	thread secretjumpfail();
	thread endsecret();
	thread secret();
	
}

message1()
{
wait 10;
iprintlnBold("^5*^7*** ^1Map ^2by ^7[^1DJS^7]^2Potter^3Z<3 ^5*^7***");
wait 1;
}

message2()
{
wait 15;
iprintlnBold("^5*^7*** ^1Goooood^2Luckkk ^5*^7***");
wait 1;
}

message3()
{
wait 10;
iprintln("^2Special ^5Thanks: ^8MiThyX");
wait 1;
}

music()
{
    level waittill( "round_started" );
    
    wait 1;
    
    ambientPlay( "richtown" );
}

trap1()
{
    block1 = getent("trap1-1","targetname");
	block2 = getent("trap1-2","targetname");
	block3 = getent("trap1-3","targetname");
	trig = getent("trig_trap1","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 50);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(350, 5);
	block2 rotateYaw(350, 5);
	block3 rotateYaw(350, 5);
	wait 8;
	}
	
}

trap2()
{
    block1 = getent("trap2-1","targetname");
	block2 = getent("trap2-2","targetname");
	block3 = getent("trap2-3","targetname");
	trig = getent("trig_trap2","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 50);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(350, 5);
	block2 rotateYaw(350, 5);
	block3 rotateYaw(350, 5);
	wait 8;
	}
	
}

trap3()
{
    block1 = getent("trap3","targetname");
	trig = getent("trig_trap3","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 50);
	
	for(;;)
	{
	block1 moveZ(-100, 2);
	wait 2;
	block1 moveZ(100, 2);
	wait 2;
	}
	
}

trap4()
{
    block1 = getent("trap4-1","targetname");
	block2 = getent("trap4-2","targetname");
	block3 = getent("trap4-3","targetname");
    block4 = getent("trap4-4","targetname");
	block5 = getent("trap4-5","targetname");
	block6 = getent("trap4-6","targetname");
	block7 = getent("trap4-7","targetname");
	block8 = getent("trap4-8","targetname");
	trig = getent("trig_trap4","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 50);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(1440, 4);
	block2 rotateYaw(1440, 6);
	block3 rotateYaw(1440, 4);
	block4 rotateYaw(1440, 6);
	block5 rotateYaw(1440, 4);
	block6 rotateYaw(1440, 6);
	block7 rotateYaw(1440, 4);
	block8 rotateYaw(1440, 6);
	wait 0.1;
	}
	
}

trap5()
{
    block1 = getent("trap5-1","targetname");
	block2 = getent("trap5-2","targetname");
	block3 = getent("trap5-3","targetname");
	trig = getent("trig_trap5","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 50);

    for(;;)
	{
	wait 0.1;
	block1 rotateroll(500, 3);
	block2 rotateroll(500, 5);
	block3 rotateroll(500, 3);
	wait 0.1;
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

   player SetOrigin((-5048, -440, 712));
   player SetPlayerAngles((0,135,0));
   player TakeAllWeapons();
   player GiveWeapon("m40a3_mp");
   player GiveWeapon( "remington700_mp" ); 
   player GiveMaxAmmo("m40a3_mp");
   player GiveMaxAmmo( "remington700_mp" );
   wait .05;
   player SwitchToWeapon("m40a3_mp"); 
   wait(0.05);
   level.activ SetOrigin((-6776, 1320, 672));
   level.activ SetPlayerAngles((0,315,0));
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

bounceroomjumpfail()
{
	sniperjumper = getEnt("bounce_jumper_respawn", "targetname");
	sniperjumper = getEnt("bounce_jumper2_respawn", "targetname");
	origin_jumper_bounce = getEnt("origin_jumper_bounce", "targetname");
	
	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_jumper_bounce.origin);
		player setPlayerAngles(origin_jumper_bounce.angles);
		player iprintln("^1>>^3Respawned^1<<");
	}
}

bounceroomactifail()
{
	sniperjumper = getEnt("bounce_acti_respawn", "targetname");
	sniperjumper = getEnt("bounce_acti2_respawn", "targetname");
	origin_acti_bounce = getEnt("origin_acti_bounce", "targetname");
	
	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_acti_bounce.origin);
		player setPlayerAngles(origin_acti_bounce.angles);
		player iprintln("^1>>^3Respawned^1<<");
	}
}

bounce()
{
   level.bounce_trigger = getent("trig_bounce","targetname");
   level.teleactorigin = getent("bounce_acti_respawn","targetname");
   level.teleactorigin = getent("bounce_acti2_respawn","targetname");
   telejumporigin = getent("bounce_jumper_respawn","targetname");
   telejumporigin = getent("bounce_jumper2_respawn","targetname");

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

   player SetOrigin((-3576, -2792, 648));
   player SetPlayerAngles((0,90,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((-3608, -88, 648));
   level.activ SetPlayerAngles((0,270,0));
   level.activ TakeAllWeapons();
   wait .05;
   level.activ giveweapon("tomahawk_mp");
   player giveweapon("tomahawk_mp");
   level.activ SwitchToWeapon("tomahawk_mp"); 
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

   player SetOrigin((-5948, -2652, 648));
   player SetPlayerAngles((0,360,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((-5940, -936, 656));
   level.activ SetPlayerAngles((0,180,0));
   level.activ TakeAllWeapons();
   wait .05;
   level.activ giveweapon("tomahawk_mp");
   player giveweapon("tomahawk_mp");
   level.activ SwitchToWeapon("tomahawk_mp"); 
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Knife room^8!"); 
   wait(0.05);



   player waittill( "death" );
   level.PlayerInRoom = false;

}
}

old()
{
   level.old_trigger = getent("trig_old","targetname");
   telejumporigin = getent("old_jumper", "targetname");
   
   
   while(1)
   {
      level.old_trigger waittill( "trigger", player );
      if( !isDefined( level.old_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.bounce_trigger delete();
   level.jump_trigger delete();
   level.firstenter=false;
   } 
   wait(0.05);

   player SetOrigin( telejumporigin.origin );
   player setplayerangles( telejumporigin.angles );
   wait(0.05);
   
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

porte1()
{
   block = getent("porte1","targetname");
   trig = getent("trig_porte1","targetname");
   trig SetHintString("^2Press ^7[^1Use^7] ^2to Open^7!");
   trig waittill("trigger",player);
   {
   wait 0.5;
   block moveZ (-224, 5);
   wait 2;
   }
   trig delete();
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
   iprintlnbold(" ^3" + player.name + " ^2 Has Finished The Secret Room!!");
   player braxi\_rank::giveRankXP("", 400);
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
		player iprintln("^3>>^1Respawned^3<<");
	}
}
