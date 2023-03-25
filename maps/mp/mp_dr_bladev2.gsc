/*
mp_dr_bladev2 Script - Please ask me if you want to use this (xFire: bladetk17) c:
*/
main()
{
	maps\mp\_load::main();

	precacheItem("winchester1200_grip_mp");
	precacheItem("ak74u_mp");

	ambientPlay("mainsong");

    // setDvar("g_speed", 190 );
	setDvar("r_gamma", 0.8 );


	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";


	thread printCredits();
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
    thread startdoor();
	thread labyrint();
	thread baum_1();
	thread baum_2();
    thread baum_3();
	thread baum_4();
	thread baum_5();
	thread baum_6();
	thread secret_infinity();
	thread secret_infinity_song();
	thread finalfloor();
	thread secretadmins();
	thread secretadmins_leave();
	thread secretadmins_xp();
	thread secretadmins_secret_song();
	thread secretadmins_secret_ak74();
	thread finaldoor();
	thread secret_jumpaZ();
	thread secret_enter();
	thread secretfail();
	thread secretleave();
	thread sniperroom();
	thread oldv2();
	thread jumproom();
	thread jumpfail();
	thread jumpweapon();
	thread jump_fail();

	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
	addTriggerToList( "trap6_trig" );
	addTriggerToList( "trap7_trig" );
	addTriggerToList( "trap8_trig" );
	addTriggerToList( "trap9_trig" );
	addTriggerToList( "trap10_trig" );
	addTriggerToList( "trap11_trig" );

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

printCredits()
{
if( isDefined( self.logoText ) )
self.logoText destroy();

self.logoText = newHudElem();
self.logoText.y = 10;
self.logoText.alignX = "center";
self.logoText.alignY = "middle";
self.logoText.horzAlign = "center_safearea";

self.logoText.alpha = 0;
self.logoText.sort = -3;
self.logoText.fontScale = 1.5;
self.logoText.archieved = true;

for(;;)
{
self.logoText fadeOverTime(1);
self.logoText.alpha = 1;
self.logoText setText("^7-- ^1M^3ap ^1m^3ade ^1b^3y ^1B^3lade ^7--");
wait 5;
self.logoText fadeOverTime(1);
self.logoText.alpha = 0;
wait 1;
self.logoText fadeOverTime(1);
self.logoText.alpha = 1;
self.logoText setText("^7-- ^1B^3ig ^1T^3hanks ^1t^3o ^1L^3ossy ^7& ^1W^3ingzor! ^7--");
wait 5;
self.logoText fadeOverTime(1);
self.logoText.alpha = 0;
wait 1;
self.logoText fadeOverTime(1);
self.logoText.alpha = 1;
self.logoText setText("^7-- ^1T^3hanks ^1t^3o ^1u^3NI ^1f^3or ^1t^3he ^1P^3ictures ^7--");
wait 5;
self.logoText fadeOverTime(1);
self.logoText.alpha = 0;
wait 1;
self.logoText fadeOverTime(1);
self.logoText.alpha = 1;
self.logoText setText("^7-- ^1S^3pecialthanks ^1t^3o ^1y^3Skilly^7, ^1I^3nfinity^7, ^1S^3nitch^7, ^1K^3ater^7, ^1K^3ieluch ^7& ^1F^3reeZer ^7--");
wait 5;
self.logoText fadeOverTime(1);
self.logoText.alpha = 0;
wait 1;
self.logoText fadeOverTime(1);
self.logoText.alpha = 1;
self.logoText setText("^7-- ^1I^3f ^1y^3ou ^1f^3ind ^1a^3ny ^1B^3ug ^1p^3ls ^1r^3eport ^1i^3t ^7- ^5xF: ^1b^3lade^1t^3k17 ^7--");
wait 5;
self.logoText fadeOverTime(1);
self.logoText.alpha = 0;
wait 1;
}
}

startdoor()
{
    door = getEnt ("startdoor", "targetname");
	trig = getEnt ("startdoor_trig", "targetname");

	trig setHintString("^1Press ^0[^3USE^0] ^1to open ^3Startdoor");
	trig waittill ("trigger", player);


	trig delete();
	door moveZ (113, 8);
	wait 10;

}

trap1()
{
  trigger = getent("trap1_trig", "targetname");
  brush = getent("trap_1", "targetname");
  trigger waittill ("trigger", player);

  trigger delete();
  wait 0.1;
  brush delete();

  }

trap2()
{
  trigger = getent("trap2_trig", "targetname");
  bounce = getent("trap_2", "targetname");
  trigger waittill("trigger");
  trigger delete();
  wait 0.1;

  bounce notsolid();
  wait 5;
  bounce solid();
}

trap3()
{
  trigger = getent("trap3_trig", "targetname");
  brush = getent("trap_3", "targetname");
  trigger setHintString("^1Press ^0[^3USE^0] ^1to activate ^3Trap 3");
  trigger waittill ("trigger");
  trigger delete();

  wait 0.1;
  brush moveZ (-145, 0.2);
  wait 10;
  brush moveZ (145, 0.2);

  }

trap4()
{
  trigger = getent("trap4_trig", "targetname");
  brush = getent("trap_4", "targetname");
  trigger waittill ("trigger");
  trigger delete();

  wait 0.1;
  brush rotateRoll(360,2.5);
  wait 3;
  brush rotateRoll(-360,2.5);
  wait 3;
  brush rotateRoll(360,2.5);

  }

trap5()
{
  trigger = getent("trap5_trig", "targetname");
  block = getent("trap_5", "targetname");
  trigger waittill("trigger");
  trigger delete();
  block notsolid();

}

trap6()
{
  trigger = getent("trap6_trig", "targetname");
  brush = getent("trap_6", "targetname");
  trigger waittill("trigger");
  trigger delete();

  wait 0.1;
  brush notsolid();
  wait 10;
  brush solid();

  }

trap7()
{
  trigger = getent("trap7_trig", "targetname");
  object = getent("trap_7", "targetname");
  trigger waittill("trigger");
  trigger delete();

  wait 0.1;
  object moveX (230, 1);
  wait 5;
  object moveX (-230, 1);

  }

trap8()
{
   trig = getent("trap8_trig", "targetname");
   brush = getent("trap_8", "targetname");
   trig waittill("trigger");
   trig delete();

   wait 0.1;
   brush notsolid();

 }

trap9()
{
   trigger = getent("trap9_trig", "targetname");
   floor = getent("trap_9", "targetname");
   trigger waittill("trigger");
   trigger delete();

   wait 0.1;
   while(1)
   {
      floor rotatePitch(360, 6);
	  wait 1;

    }
}

trap10()
{
  trig = getent("trap10_trig", "targetname");
  brush = getent("trap_10", "targetname");
  trig waittill("trigger");
  trig delete();

  wait 0.1;
  while(1)
  {
    brush rotateYaw(360, 2.5);
	wait 1;
	}
}

trap11()
{
  trigger = getent("trap11_trig", "targetname");
  brush = getent("trap_11", "targetname");
  trigger waittill("trigger");
  trigger delete();

  brush movez (280, 0.5);
  wait 10;
  brush delete();

  }

labyrint()
{
    door = getEnt ("laby_1", "targetname");
	trig = getEnt ("laby1_trig", "targetname");
	block = getEnt ("laby1_block", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1pressed wrong ^3Button");

	trig delete();
	door moveZ (140, 0.3);
	block delete();

}

baum_1()
{
  block = getent("baum_1", "targetname");

  block notsolid();

  }

baum_2()
{
    door = getEnt ("baum2_door", "targetname");
	trig = getEnt ("baum2_trig", "targetname");
	block = getEnt ("baum_2", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1pressed wrong ^3Button");

	door moveZ (145, 0.3);
	trig delete();
	block delete();

  }

baum_3()
{
    door = getEnt ("baum3_door", "targetname");
	trig = getEnt ("baum3_trig", "targetname");
	block = getEnt ("baum_3", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1pressed wrong ^3Button");

	door moveZ(145, 0.3);
	trig delete();
	block delete();

  }

baum_4()
{
    door = getEnt ("baum4_door", "targetname");
	trig = getEnt ("baum4_trig", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1found the ^3Button ^1for the ^3Door");

    trig delete();
	door moveZ (-97, 3);
	wait 5;
	door delete();

  }

baum_5()
{
    door = getEnt ("baum5_door", "targetname");
	trig = getEnt ("baum5_trig", "targetname");
	block = getEnt ("baum_5", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1pressed wrong ^3Button");

	door moveZ(145, 0.3);
	trig delete();
	block delete();

  }

baum_6()
{
    trig = getEnt ("baum6_trig", "targetname");
	block = getEnt ("baum_6", "targetname");

	trig waittill ("trigger", player);

	iprintlnbold("^3" + player.name + " ^1found the ^3Button ^1for the ^3Elevator");

	trig delete();
	block moveZ (-145, 3);
	wait 5;

  }

secret_infinity()
{
   secret_trig = getent("secret_infinity_trig", "targetname");
   block = getent("secret_infinity", "targetname");

   while(1)
   {
		secret_trig waittill ("trigger", user);

		if ((user.name == "[-VD-]Blade") || (user.name == "[-VD-]Infinity") || (user.name == "Blade") || (user.name == "Infinity"))
		{
		    block notsolid();
		}
		else
		{
		    block solid();
		}
	}
}

secret_infinity_song()
{
    secret_trigger = getent("secret_infinity_song", "targetname");

	secret_trigger waittill ("trigger", user);
	secret_trigger delete();

  	ambientStop( 1.5 );
	ambientPlay("infinity");
	iprintlnbold("^1No ^3one ^1can ^3hold ^1us!");

	user GiveWeapon( "winchester1200_grip_mp" );
    user setWeaponAmmoClip( "winchester1200_grip_mp", 3 );
    user setWeaponAmmoStock( "winchester1200_grip_mp", 0 );
    user SwitchtoWeapon( "winchester1200_grip_mp" );

}

finalfloor()
{
   trigger = getent("finalfloor_trig", "targetname");
   brush = getent("finalfloor", "targetname");
   trigger waittill ("trigger", player);
   trigger delete();

   iprintlnbold("^3" + player.name + " ^1reached ^3Finalfloor");
   brush moveZ (-185, 10);
   wait 10;
   brush delete();

   }

secretadmins()
{
	trigger = getEnt("secretadmins_trig", "targetname");
	target = getEnt ("secretadmins", "targetname");

    while(1)
    {
		trigger waittill ("trigger", user);

		if ((user.name == "[-VD-]Blade") || (user.name == "[-VD-]uNI") || (user.name == "[-VD-]Snitch") || (user.name == "[RasTa]Kater.") || (user.name == "[RasTa]FreeZer") || (user.name == "[aL]Lossy") || (user.name == "[Raid]Lossy") || (user.name == "Lossy"))
		{
		  user iprintlnbold ("^1Entered ^3Adminlounge");
		  user SetOrigin(target.origin);
		  user SetPlayerAngles( target.angles );
		}
		else
		{
		    trigger delete();
		}
	}
}

secretadmins_leave()
{
   trigger = getent("secretadmins_leave", "targetname");
   target = getent("secretadmins_leave2", "targetname");

   while(1)
   {
     trigger waittill ("trigger", user);

     user iprintlnbold ("^3You ^1are Welcome ^3c:");
     user SetOrigin(target.origin);
     user SetPlayerAngles( target.angles );
	 }
}

secretadmins_secret_song()
{
  trigger = getent("chillsong", "targetname");
  trigger waittill("trigger", user);

  ambientStop( 1.5 );
  ambientPlay("deaglev2");

}

secretadmins_secret_ak74()
{
  trig_ak74 = getEnt("get_ak74", "targetname");

  while(1)
  {
    trig_ak74 waittill ("trigger", user);
	user GiveWeapon( "ak74u_mp" );
	user setWeaponAmmoClip( "ak74u_mp", 30 );
	user setWeaponAmmoStock( "ak74u_mp", 30 );
	user SwitchtoWeapon( "ak74u_mp" );
	}
}

secretadmins_xp()
{
   trigger = getEnt("xp_trig", "targetname");
   trigger waittill("trigger", user);

	while(1)
	{
	trigger waittill("trigger", user);
	wait 0.5;
	user braxi\_rank::giveRankXP("", 100);
	}
 }

finaldoor()
{
    door = getEnt ("finaldoor_rooms", "targetname");
	brush = getent ("finaldoor_elevator", "targetname");
	trig = getEnt ("finaldoor_trigger", "targetname");
	trig waittill ("trigger", player);


	trig delete();
	iprintlnbold("^3" + player.name + " ^9finished at ^31st ^9Place! ^3c:");
	door moveX (209, 5);
	door delete();

	while(1)
	{
	 brush moveZ (160, 5);
	 wait 10;
	 brush moveZ (-160, 5);
	 wait 10;
	 }
}

secret_jumpaZ()
{
   trigger = getent("secret_jumper1", "targetname");
   trig = getent("secret_jumper2", "targetname");
   brush = getent("secret_jumper_brush", "targetname");

   while(1)
  {
    trigger waittill ("trigger");
    trig waittill ("trigger");

	brush moveY (-13, 2);
	wait 3;

   }
}

secret_enter()
{   trigger = getEnt("secret_port", "targetname");
    trig = getEnt("secret_port", "targetname");
	target = getEnt ("secret_origin", "targetname");

    while(1)
    {
		trigger waittill ("trigger", player);
		trig waittill ("trigger", player);

		{
		  player iprintlnbold ("^1Entered ^3S^4e^5c^2r^3e^1t");
		  player SetOrigin(target.origin);
		  player SetPlayerAngles( target.angles );
		}
	}
}

secretfail()
{
    fail_trig = getent("secret_fail","targetname");
	jumperorigin = getEnt("secret_origin","targetname");

	while(1)
	{
	    fail_trig waittill("trigger", player);

		player SetPlayerAngles( jumperorigin.angles );
		player SetOrigin( jumperorigin.origin );
	}
}

secretleave()
{
   trig = getEnt("secret_leave", "targetname");
   target = getEnt("secret_leaveorigin", "targetname");

   while(1)
    {
		trig waittill ("trigger", player);

		{
		  player iprintlnbold ("^1You finished ^3S^4e^5c^2r^3e^1t");
		  player SetOrigin(target.origin);
		  player SetPlayerAngles( target.angles );
		}
	}
}

sniperroom()
{
    level.activ = undefined;

	level.sniper_trigger = getEnt("trig_sniper","targetname");
	actiorigin = getEnt("sniper_origin","targetname");
	jumperorigin = getEnt("sniper2_origin","targetname");

	level.sniper_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Sniper ^1Room");
	level.sniper_trigger waittill("trigger", player );
	level.oldv2_trigger delete();
	level.jump_trigger delete();
	while(1)
	{

	    level.sniper_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Sniper ^1Room");

        if(player.pers["team"] == "axis")
        {
        	player iprintlnbold("^3You ^1can't fight against ^3yourself ^9:c");
        	return;
		}

        if( getTeamPlayersAlive("axis") < 1 )
		{
			player iprintlnbold("^3You ^1can't fight ^3alone ^9:c");
			return;
		}
		else

		ambientStop( 1.5 );
		ambientPlay("sniperv2");

		player SetPlayerAngles( jumperorigin.angles );
		player SetOrigin( jumperorigin.origin );
		level.activ SetPlayerAngles( actiorigin.angles );
		level.activ  SetOrigin( actiorigin.origin );

		player FreezeControls(1);
		level.activ FreezeControls(1);

		wait 0.5;

		player takeallweapons();
		player GiveWeapon( "remington700_mp" );
		player GiveMaxAmmo( "remington700_mp" );
        player SwitchtoWeapon( "remington700_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
        level.activ SwitchtoWeapon( "remington700_mp" );

        player FreezeControls(0);
		level.activ FreezeControls(0);

		iprintlnbold("^1Sniper Fight ^3Snitches");
		while(isAlive(player) && isDefined(player))
		{
			wait 0.1;
		}
		level.sniper_trigger waittill("trigger", player );
	}

}

oldv2()
{
    level.activ = undefined;

	level.oldv2_trigger = getEnt("trig_oldv2","targetname");
	actiorigin = getEnt("originacti_oldv2","targetname");
	jumperorigin = getEnt("originjumper_oldv2","targetname");

	level.oldv2_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Old ^5v2");
	level.oldv2_trigger waittill("trigger", player );
	level.sniper_trigger delete();
	level.jump_trigger delete();
	while(1)
	{

        level.oldv2_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Old ^5v2");

        if(player.pers["team"] == "axis")
        {
        	player iprintlnbold("^3You ^1can't fight against ^3yourself ^1:c");
        	return;
		}

        if( getTeamPlayersAlive("axis") < 1 )
		{
			player iprintlnbold("^3You ^1can't fight ^3alone ^1:c");
			return;
		}
		else

		ambientStop( 1.5 );
		ambientPlay("oldv2");

		player SetPlayerAngles( jumperorigin.angles );
		player SetOrigin( jumperorigin.origin );
		level.activ SetPlayerAngles( actiorigin.angles );
		level.activ  SetOrigin( actiorigin.origin );

		player FreezeControls(1);
		level.activ FreezeControls(1);

		wait 0.5;

		player takeallweapons();
		player GiveWeapon( "knife_mp" );
        player SwitchtoWeapon( "knife_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "knife_mp" );
        level.activ SwitchtoWeapon( "knife_mp" );

        player FreezeControls(0);
		level.activ FreezeControls(0);

		iprintlnbold("^1Old ^5v2 ^3Something New");
		while(isAlive(player) && isDefined(player))
		{
			wait 0.1;
		}
		level.oldv2_trigger waittill("trigger", player );
	}

}

jumproom()
{
    level.activ = undefined;

	level.jump_trigger = getEnt("trig_jump","targetname");
	actiorigin = getEnt("actispawn_jump","targetname");
	jumperorigin = getEnt("jumpaspawn_jump","targetname");

	level.jump_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Jump ^1Room!");
	level.jump_trigger waittill("trigger", player );
	level.sniper_trigger delete();
	level.oldv2_trigger delete();
	while(1)
	{

        level.jump_trigger setHintString("^1Press ^0[^3USE^0] ^1to enter the ^3Jump ^1Room!");

        if(player.pers["team"] == "axis")
        {
        	player iprintlnbold("^3You ^1can't fight against ^3yourself ^1:c");
        	return;
		}

        if( getTeamPlayersAlive("axis") < 1 )
		{
			player iprintlnbold("^3You ^1can't fight ^3alone ^9:c");
			return;
		}
		else

		ambientStop( 1.5 );
		ambientPlay("jumpv2");

		player SetPlayerAngles( jumperorigin.angles );
		player SetOrigin( jumperorigin.origin );
		level.activ SetPlayerAngles( actiorigin.angles );
		level.activ  SetOrigin( actiorigin.origin );

		player FreezeControls(1);
		level.activ FreezeControls(1);

		wait 0.5;

		player takeallweapons();
		player GiveWeapon( "deserteaglegold_mp" );
		player setWeaponAmmoClip( "deserteaglegold_mp", 0 );
		player setWeaponAmmoStock( "deserteaglegold_mp", 0 );
        player SwitchtoWeapon( "deserteaglegold_mp" );

        level.activ takeallweapons();
		level.activ GiveWeapon( "deserteaglegold_mp" );
		level.activ setWeaponAmmoClip( "deserteaglegold_mp", 0 );
		level.activ setWeaponAmmoStock( "deserteaglegold_mp", 0 );
        level.activ SwitchtoWeapon( "deserteaglegold_mp" );

        player FreezeControls(0);
		level.activ FreezeControls(0);

	    thread jumpfail();

		iprintlnbold("^9Good Luck ^3c:");
		while(isAlive(player) && isDefined(player))
		{
			wait 0.1;
		}
		level.jump_trigger waittill("trigger", player );
	}

}

jumpweapon()
{
  trigger = getEnt("jump_weapon", "targetname");
  trigger waittill("trigger", user);

  trigger delete();

  user GiveWeapon( "winchester1200_grip_mp" );
  user setWeaponAmmoClip( "winchester1200_grip_mp", 7 );
  user setWeaponAmmoStock( "winchester1200_grip_mp", 0 );
  user SwitchtoWeapon( "winchester1200_grip_mp" );
 }

 jumpfail()
{
    trig = getent("jumproom_fail","targetname");
	actiorigin = getEnt("actispawn_jump","targetname");

	while(1)
	{
	    trig waittill("trigger", player);

		player SetPlayerAngles( actiorigin.angles );
		player SetOrigin( actiorigin.origin );
	}
}

jump_fail()
{
  fail_trig = getEnt("lets_fail", "targetname");
  jumperorigin = getEnt("jumpaspawn_jump", "targetname");

  while(1)
  {
		fail_trig waittill("trigger", user);

		user SetPlayerAngles( jumperorigin.angles );
		user SetOrigin( jumperorigin.origin );
	}
 }