//////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//     _______     _____     ___    _______________     ___     ___     ___      ___     ___       ___     \\
//    |     \ \   /     |   |   |  |               |   |   |   |   |   |   \    /   |   \   \    /   /     \\
//	  |      \ \ /      |   |   |  |_____     _____|   |   |___|   |    \   \__/   /     \   \__/   /      \\
//	  |   |\  \_/  /|   |   |   |        |   |         |           |     \        /       \        /       \\
//	  |   | \  	  / |   |   |   |        |   |         |    ___    |      \      /        /   __   \       \\
//	  |   | |\___/  |   |   |   |        |   |         |   |   |   |       |    |        /   /  \   \      \\
//	  |___|/        |___|   |___|        |___|         |___|   |___|       |____|       /___/    \___\     \\
//		                                                                                                   \\
//////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//     _______     _____                                                             _______     _____     \\
//    |     \ \   /     |                                                           |     \ \   /     |    \\
//    |      \ \ /      |                        Map by MiThyX                      |      \ \ /      |    \\
//    |   |\  \_/  /|   |                      Script by MiThyX                     |   |\  \_/  /|   |    \\
//    |   | \  	  / |   |                                                           |   | \     / |   |    \\
//    |   | |\___/  |   |                        Steam: MiThyX                      |   | |\___/  |   |    \\
//    |___|/        |___|                                                           |___|/        |___|    \\
//                                                                                                         \\
//////////////////////////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

main()
{
 maps\mp\_load::main();

 // General Stuff
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "allies";
 game["defenders"] = "axis";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 // Players Sprays / Lighting
 setdvar( "r_specularcolorscale", "1" );
 setDvar("r_glowbloomintensity0",".1");
 setDvar("r_glowbloomintensity1",".1");
 setDvar("r_glowskybleedintensity0",".1");
 setdvar("compassmaxrange","1800");

 // Players Speed
//  setdvar("g_speed" ,"190");
//  setdvar("dr_jumpers_speed" ,"1");

	if(!isdefined(level.music))
	level.music=[];

	level.music[0]["song"]	="Sia - Cheap Thrills";
	level.music[0]["alias"]	="music4";
	level.music[1]["song"]	="The Chainsmokers - Closer ft. Halsey";
	level.music[1]["alias"]	="music1";
	level.music[2]["song"]	="Ed Sheeran - Galway Girl";
	level.music[2]["alias"]	="music2";
	level.music[3]["song"]	="In The Name Of Love";
	level.music[3]["alias"]	="music3";
	level.music[4]["song"]	="Faydee - Can't Let Go";
	level.music[4]["alias"]	="music0";
	level.music[5]["song"]	="Mike Posner - I Took A Pill In Ibiza";
	level.music[5]["alias"]	="music5";

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
	thread startdoor();
	thread guidchecking();
	thread credits();
	thread autorotate();
	thread autorotate2();
	thread autorotate3();
	thread autorotate4();
	thread autorotate5();
	thread autorotate6();
	thread automove();
	thread automove2();
	thread automove3();
	thread automove5();
	thread secret();
	thread secretjumpfail();
	thread secretjumpfail2();
	thread secretjumpfail3();
	thread secretjumpfail4();
	thread secretjumpfail5();
	thread endsecret();
	thread endsecret2();
    thread secretactivatorfail();
	thread porteactisecret();
	thread porteactisecret2();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap5();
	thread trap4();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread sniper();
	thread jump();
	thread jumproomjumpfail();
	thread jumproomactifail();
	thread endmap();
	thread knife();
	thread old();
	thread musictrig();

}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

cleanUp()
{
	if( !isDefined( self ) )
		return;

	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
				self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
}

messages()
{
wait 16;
iprintlnBold("^4---- ^2Jump.v2 ^2by ^6M^2i^3T^4h^5y^6X ^4----");
wait 1;
}

startdoor()
{
lootje = getent("startdoor","targetname");
{
wait 20;
lootje moveZ(-400, 5);
iprintlnbold("^4---- ^1G^3o^2o^4d^1L^6u^2c^3k ^4---- ");
wait 2;
}
}

guidchecking()
{
	wait 5.1;
	thread guidcheckgod();
	wait 0.2;
}

guidcheckgod() //CHECK GOD GUID :]
{
god1 = "5b4d3eec";
sanictrig = getent("sanic_check","targetname");
for(;;)
	{
		sanictrig waittill ("trigger",user);
		tempGuid = getSubStr(user getGuid(), 24, 32);
		if(tempGuid == god1)
		{
		wait 5;
		user detachAll();
		iPrintLnBold(user.name + " Map ^5Creator ^7is ^2Connected ^7!!");
		wait 3;
		}
			else
			{
			wait 3;
		}

    sanictrig delete();
}
}

credits()
{
        self endon( "disconnect" );

        if( isDefined( self.credits_text ) )
                self.credits_text Destroy();

        self.credits_text = newHudElem();
        self.credits_text.y = 10;
        self.credits_text.alignX = "center";
        self.credits_text.alignY = "middle";
        self.credits_text.horzAlign = "center";

        self.credits_text.alpha = 0;
        self.credits_text.sort = -3;
        self.credits_text.fontScale = 1.6;
        self.credits_text.archieved = true;

		while(1)
        {
				self credit_roll( "I accept any donation >>> ^1Paypal : ^7MiThyXdeathrun@gmail.com", 5 );
				self credit_roll( "^6Y^2o^3u^4t^5u^6b^2e^7:https://www.youtube.com/channel/UCLPUQ9wxNmnPcNcHxPkblrA", 3 );
				self credit_roll( "^2Skype and Steam: MiThyX", 3 );
				self credit_roll( "^4---- ^2Map ^2by ^6M^2i^3T^4h^5y^6X ^4----", 3);
				self credit_roll( "^2Thank to ^9Potterz ^2 for help me for fix light. ", 10 );
				wait 50;
        }
}

credit_roll( msg, time )
{
        self endon( "disconnect" );

        self.credits_text fadeOverTime(1);
        self.credits_text.alpha = 1;
        self.credits_text setText( msg );
        wait( time );
        self.credits_text fadeOverTime(1);
        self.credits_text.alpha = 0;
        wait 1;
}

autorotate()
{
    block = getent("autorotate1","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(90, 4);
	wait 2;
	}

}

autorotate2()
{
    block = getent("autorotate2","targetname");

    for(;;)
	{
	wait 2;
	block rotateYaw(200, 4);
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
   block = getent("automove1","targetname");

   for(;;)
   {
   wait 11;
   block moveY (1050, 8);
   wait 11;
   block moveY (-1050, 8);
   }

}

automove2()
{
   block = getent("automove2","targetname");

   for(;;)
   {
   wait 10;
   block moveY (4912, 5);
   wait 10;
   block moveY (-4912, 5);
   }

}

automove3()
{
   block = getent("automove3","targetname");

   for(;;)
   {
   wait 8;
   block moveX (848, 8);
   wait 8;
   block moveX (-848, 8);
   }

}

automove5()
{
   block = getent("automove5","targetname");

   for(;;)
   {
   wait 10;
   block moveZ (208, 6);
   wait 10;
   block moveZ (-208, 6);
   }

}

//secret jumper

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

secretjumpfail()
{
	secretjumper = getEnt("secret_trigger_respawn", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

secretjumpfail2()
{
	secretjumper = getEnt("secret_trigger_respawn2", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret2", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

secretjumpfail3()
{
	secretjumper = getEnt("secret_trigger_respawn3", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret2", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

secretjumpfail4()
{
	secretjumper = getEnt("secret_trigger_respawn4", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret2", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

secretjumpfail5()
{
	secretjumper = getEnt("secret_trigger_respawn5", "targetname");
	origin_jumper_secret = getEnt("origin_jumper_secret3", "targetname");

	for (;;)
	{
		secretjumper waittill("trigger", player);
		player setOrigin(origin_jumper_secret.origin);
		player setPlayerAngles(origin_jumper_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

endsecret()
{
   level.endsecret_trigger = getent("trig_endsecret","targetname");
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
   iprintlnbold(" ^9" + player.name + " ^8 has finished the secret room!!");
   player braxi\_rank::giveRankXP("", 400);
   wait(0.05);

}
}

//activator secret

secretactivatorfail()
{
	secretactivator = getEnt("secret_activator_respawn", "targetname");
	origin_activator_secret = getEnt("origin_activator_secret", "targetname");

	for (;;)
	{
		secretactivator waittill("trigger", player);
		player setOrigin(origin_activator_secret.origin);
		player setPlayerAngles(origin_activator_secret.angles);
		player iprintln("^3>>^1Respawned");
	}
}

endsecret2()
{
   level.endsecret3_trigger = getent("trig_tpactisecret","targetname");
   telejumporigin4 = getent("activator_secretend", "targetname");

   while(1)
   {
      level.endsecret3_trigger waittill( "trigger", player );
      if( !isDefined( level.endsecret3_trigger ) )
      return;
      if(level.firstenter==true)
   wait(0.05);

   player SetOrigin( telejumporigin4.origin );
   player setplayerangles( telejumporigin4.angles );
   player braxi\_rank::giveRankXP("", 400);
   wait(0.05);

}
}

porteactisecret()
{
   porte2 = getent("porteactisecret2","targetname");
   trig = getent("trig_porteactisecret","targetname");
   trig waittill("trigger",player);
   {
   wait 0.5;
   porte2 moveZ (170, 2);
   wait 2;
   }
   trig delete();
}

porteactisecret2()
{
   porte2 = getent("porteactisecret","targetname");
   trig = getent("trig_porteactisecret2","targetname");
   trig waittill("trigger",player);
   {
   wait 0.5;
   porte2 moveZ (-400, 5);
   wait 2;
   }
   trig delete();
}

//traps

trap1()
{
    block1 = getent("trap1-1","targetname");
	trig = getent("trig_trap1","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.5;
	block1 rotateYaw(-350, 10);
	wait 2;
	}

}

trap2()
{
    block1 = getent("trap2-1","targetname");
	block2 = getent("trap2-2","targetname");
	trig = getent("trig_trap2","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(360, 5);
	block2 rotateYaw(360, 5);
	wait 8;
	}

}

trap3()
{
   block1 = getent("trap3-1","targetname");
   block2 = getent("trap3-2","targetname");
   block3 = getent("trap3-3","targetname");
   block4 = getent("trap3-4","targetname");
   block5 = getent("trap3-5","targetname");
   block6 = getent("trap3-6","targetname");
   trig = getent("trig_trap3","targetname");
   trig waittill("trigger",player);

   x = randomint(1);

   if (x == 0)
   {
   block1 delete();
   block3 delete();
   block5 delete();
   }

   else if(x == 1)
   {
   block2 delete();
   block4 delete();
   block6 delete();
   }


}

trap4()
{
    block1 = getent("trap4-1","targetname");
	block2 = getent("trap4-2","targetname");
	trig = getent("trig_trap4","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	block1 moveZ (64, 3);
	block2 moveZ (-64, 3);
	wait 3;
	block1 moveZ (-64, 3);
	block2 moveZ (64, 3);
	wait 3;
	}

}

trap5()
{
    block1 = getent("trap5-1","targetname");
	trig = getent("trig_trap5","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(360, 4);
	wait 4;
	}

}

trap6()
{
    block1 = getent("trap6","targetname");
	trig = getent("trig_trap6","targetname");
	trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

	for(;;)
	{
	wait 0.1;
	block1 rotateYaw(360, 4);
	wait 8;
	}

}

trap7()
{
    platform = getent("trap7","targetname");
    trig = getent("trig_trap7","targetname");
    trig waittill("trigger",player);
	player braxi\_rank::giveRankXP("", 60);

    platform delete();

    trig delete();

}

trap8()
{
    block1 = getent("trap8-1","targetname");
	block2 = getent("trap8-2","targetname");
	block3 = getent("trap8-3","targetname");
	trig = getent("trig_trap8","targetname");
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
	trig = getent("trig_trap9","targetname");
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

//rooms

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
   level.jump_trigger delete();
   level.knife_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((5320, 10856, 488));
   player SetPlayerAngles((0,316,0));
   player TakeAllWeapons();
   player GiveWeapon("m40a3_mp");
   player GiveWeapon( "remington700_mp" );
   player GiveMaxAmmo("m40a3_mp");
   player GiveMaxAmmo( "remington700_mp" );
   wait .05;
   player SwitchToWeapon("m40a3_mp");
   wait(0.05);
   level.activ SetOrigin((7848, 9064, 472));
   level.activ SetPlayerAngles((0,130,0));
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

jump()
{
   level.jump_trigger = getent("trig_jump","targetname");

   while(1)
   {
      level.jump_trigger waittill("trigger",player );

      if( !isDefined(level.jump_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.sniper_trigger delete();
   level.knife_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((5288, 6456, 376));
   player SetPlayerAngles((0,360,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((5288, 5640, 376));
   level.activ SetPlayerAngles((0,360,0));
   level.activ TakeAllWeapons();
   wait .05;
   level.activ giveweapon("knife_mp");
   player giveweapon("knife_mp");
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Jump room^8!");
   wait(0.05);



   player waittill( "death" );
   level.PlayerInRoom = false;

}
}

jumproomjumpfail()
{
	sniperjumper = getEnt("jump_jumper_respawn2", "targetname");
	origin_jumper_jump = getEnt("origin_jumper_jump", "targetname");

	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_jumper_jump.origin);
		player setPlayerAngles(origin_jumper_jump.angles);
		player iprintln("^3>>^1Respawned");
	}
}

jumproomactifail()
{
	sniperjumper = getEnt("jump_acti_respawn2", "targetname");
	origin_acti_jump = getEnt("origin_acti_jump", "targetname");

	for (;;)
	{
		sniperjumper waittill("trigger", player);
		player setOrigin(origin_acti_jump.origin);
		player setPlayerAngles(origin_acti_jump.angles);
		player iprintln("^3>>^1Respawned");
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

knife()
{
   level.knife_trigger = getent("trig_knife","targetname");
   level.teleactorigin = getent("origin_acti_knife", "targetname");
   telejumporigin = getent("origin_jumper_knife", "targetname");

   while(1)
   {
      level.knife_trigger waittill("trigger",player );

      if( !isDefined(level.knife_trigger ) )
      return;
      if(level.firstenter==true)
   {
   level.old_trigger delete();
   level.sniper_trigger delete();
   level.knife_trigger delete();
   level.jump_trigger delete();
   level.firstenter=false;
   }
   wait(0.05);

   player SetOrigin((5288, 7144, -24));
   player SetPlayerAngles((0,360,0));
   player TakeAllWeapons();
   wait(0.05);
   level.activ SetOrigin((7176, 7144, -24));
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

old()
{
   block1 = getent("porte1","targetname");
   level.old_trigger = getent("trig_porte1","targetname");
   level.old_trigger waittill("trigger",player);

   level.sniper_trigger delete();
   level.jump_trigger delete();
   level.knife_trigger delete();
   level.firstenter=false;
   {
   wait 2;
   block1 moveZ (-500, 5);
   iPrintlnBold(" ^9" + player.name + " ^4 has entered the Old room^8!");
   wait 2;
   }
   level.old_trigger delete();
}

//music

musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "music thread terminated" );

	self thread onDeath();
	self thread onDisconnect();

	self.hud_music = [];
	self.selection = 0;

	// create huds
	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "black", 320, 160 );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i].glowalpha=1;
	if(isdefined(level.randomcolor))
		self.hud_music[i].glowcolor=level.randomcolor;
	else
		self.hud_music[i].glowcolor=(1,0,0);

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText("Scroll: ^3[{+attack}] ^7| Select: ^3[{+activate}] ^7| Close: ^3[{+frag}]");

	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
		self.hud_music[i].glowalpha=1;
		if(isdefined(level.randomcolor))
			self.hud_music[i].glowcolor=level.randomcolor;
		else
			self.hud_music[i].glowcolor=(1,0,0);

		entry = level.music[j];
		self.hud_music[i] setText(entry["song"]);
	}

	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 306, 17 );

	while(self.sessionstate == "playing")
	{
		wait 0.1;

		if(self attackButtonPressed())
		{
			self.hud_music[3+self.selection].alpha = 0.93;

			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;

			item = self.hud_music[3+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if(self useButtonPressed())
		{
 			iprintln("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
			ambientPlay(level.music[self.selection]["alias"]);
			thread partymusic();
			self freezecontrols(0);
			break;
		}
		else if(self fragButtonPressed())
		{
			self freezecontrols(0);
			break;
		}
	}

	self cleanUp();
}

musictrig()
{
	trig = getEnt ("musicmenu", "targetname");
	trig setHintString("Press [^5&&1^7] to choose Music");

	trig waittill("trigger",player);
	player freezecontrols(1);
	trig delete();
	player musicMenu();
}

	onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

	onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}

partymusic()
{
x = randomint(5);
if(x == 0)
{
wait 240;
ambientplay("music0");
}
if(x == 1)
{
wait 240;
ambientplay("music1");
}
if(x == 2)
{
wait 240;
ambientplay("music2");
}
if(x == 3)
{
wait 240;
ambientplay("music3");
}
if(x == 4)
{
wait 240;
ambientplay("music4");
}if(x == 5)
{
wait 240;
ambientplay("music5");
}
}