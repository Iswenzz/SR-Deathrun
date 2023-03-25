main()
{
	maps\mp\_load::main();
	maps\mp\industryv3\_intart_objs::main();

	level._fire = loadfx( "industryv3/fire" );
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	setdvar("bg_fallDamageMaxHeight","99999");
	setdvar("bg_fallDamageMinHeight","99998");

	thread onroundstart();
	thread teleports();
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
	thread room_selection();
	thread sniper_room();
	thread knife_room();
	thread bounce_room();
	thread bounce_room_fail_trig();
	thread bounce_room_weapon();

	for(i=1;i<13;i++)
		addTriggerToList("trap"+i+"trig");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

onroundstart()
{
	startdoors = getentarray("startdoors","targetname");
	level waittill("round_started");

	wait 2;
	startdoors[0] movex(-80,2);
	startdoors[1] movex(80,2);
}

teleports()
{       
 	entTransporter = getentarray( "telepor_trig", "targetname" );

	for( i = 0; i < entTransporter.size; i++ )
		entTransporter[i] thread transporter();
}
 
transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	}
}

trap1()
{
	flame_org = getentarray("flame_org_trap1","targetname");
	trig = getEnt("trap1trig","targetname");
	dmg_trig = getEnt("trap1_dmgtrig","targetname");

	orgpos = dmg_trig.origin;
	dmg_trig.origin = dmg_trig.origin+(0,0,10000);

	trig waittill("trigger",player);
	trig delete();

	dmg_trig.origin = orgpos;
	for(i=0;i<flame_org.size;i++)
	{
		tmp_model = spawn("script_model",flame_org[i].origin);
		tmp_model.angles = (-90,-90,90);
		tmp_model SetModel("tag_origin");
		wait 0.05;
		PlayFXOnTag( level._fire, tmp_model, "tag_origin" );
		tmp_model thread deleteme();
	}

	wait 5;
	dmg_trig delete();
	for(i=0;i<flame_org.size;i++)
		flame_org[i] delete();
}

deleteme() //dont ask, looped fxes are retarded
{
	wait 5;
	self delete();
}

trap2()
{
	trig = getEnt("trap2trig","targetname");
	plats = getentarray("trap2plats","targetname");
	trig waittill("trigger",player);
	trig delete();

	for(i=0;i<plats.size;i++)
		plats[i] thread trap2moves();
}

trap2moves()
{
	x = randomint(3);
	for(;;)
	{
		self movey(-384,2);
		wait (x+1);
		self movey(384,2);
		wait (x+1);
	}
}

trap3()
{
	trig = getent("trap3trig","targetname");
	obj = getEnt("trap3obj","targetname");
	trig waittill("trigger",player);
	trig delete();

	obj hide();
	obj notsolid();
	wait randomint(5)+1;
	obj show();
	obj solid();
}

trap4()
{
	trig = getent("trap4trig","targetname");
	obj = getent("trap4bounce","targetname");

	trig waittill("trigger",player);
	trig delete();

	obj movex(-336,1);
	wait 3;
	obj movex(336,1);
}

trap5()
{
	trig = getent("trap5trig","targetname");
	obj = getentarray("pillars_trap5","targetname");

	trig waittill("trigger",player);
	trig delete();

	for(;;)
	{
		ang = randomintrange(-180,180);
		obj[0] rotateyaw(ang,1);
		obj[1] rotateyaw(ang-(ang*2),1);
		wait 3;
	}
}

trap6()
{
	trig = getent("trap6trig","targetname");
	obj_group1 = getentarray("pillars_trap6g1","targetname");
	obj_group2 = getentarray("pillars_trap6g2","targetname");

	trig waittill("trigger",player);
	trig delete();

	for(;;)
	{
		for(i=0;i<obj_group1.size;i++)
		{
			obj_group1[i] rotateyaw(-180,2);
			obj_group2[i] rotateyaw(180,2);
		}

		wait 4;

		for(i=0;i<obj_group1.size;i++)
		{
			obj_group1[i] rotateyaw(180,2);
			obj_group2[i] rotateyaw(-180,2);
		}

		wait 4;
	}
}

trap7()
{
	trig = getent("trap7trig","targetname");
	plats = getentarray("trap7plats","targetname");

	trig waittill("trigger",player);
	trig delete();

	for(i=0;i<plats.size;i++)
		plats[i] thread trap7action();
}

trap7action()
{
	for(;;)
	{
		ang = randomintrange(90,360);
		self rotateyaw(ang,1.5);
		wait 3;
	}
}

trap8()
{
	trig = getent("trap8trig","targetname");
	plat = getent("trap8plat","targetname");

	dmgtrig = getent("trap8plat_dmgtrig","targetname");
	dmgtrig enablelinkto();
	dmgtrig linkto(plat);

	trig waittill("trigger",player);
	trig delete();

	plat movez(144,0.5);
	wait 3;
	plat movez(-144,0.5);
}

trap9()
{
	trig = getent("trap9trig","targetname");
	plats = getentarray("trap9plats","targetname");

	trig waittill("trigger",player);
	trig delete();

	plats[0] movey(176,0.5);
	plats[1] movex(112,0.5);
	plats[2] movey(128,0.5);

	plats[0] waittill("movedone");

	for(;;)
	{
		plats[0] movey(-352,1);
		plats[1] movex(-224,1);
		plats[2] movey(-256,1);
		wait 1.5;
		plats[0] movey(352,1);
		plats[1] movex(224,1);
		plats[2] movey(256,1);
		wait 1.5;
	}
}

trap10()
{
	trig = getent("trap10trig","targetname");
	plats = getentarray("trap10plats","targetname");

	trig waittill("trigger",player);
	trig delete();

	for(;;)
	{
		ang = randomintrange(180,360);
		for(i=0;i<plats.size;i++)
			plats[i] rotateyaw(ang,1);

		wait 2.5;
	}
}

trap11()
{
	trig = getent("trap11trig","targetname");
	plat = getEnt("trap11plat","targetname");

	trig waittill("trigger",player);
	trig delete();

	plat hide();
	plat notsolid();

	wait randomintrange(1,4);

	plat show();
	plat solid();
}

trap12()
{
	trig = getent("trap12trig","targetname");
	plat = getEnt("trap12plat","targetname");
	killtrig = getEnt("trap12killtrig","targetname");
	plat notsolid();

	killtrig enablelinkto();
	killtrig linkto(plat);

	trig waittill("trigger",player);
	trig delete();

	plat movey(432,1);
	wait 4;
	plat movey(-432,1);
}

room_selection()
{
	level endon("round_ended");
	level endon("game over");

	trig = getEnt("room_selection_trig","targetname");
	org = getEnt("room_selection_org","targetname");
	trig SetHintString("Press [^5&&1^7] To ^5Enter Room ^7Selection");
	for(;;)
	{
		trig waittill("trigger",player);
		player TakeAllWeapons();
		trig SetHintString("^1Wait Your Turn");
		player setOrigin(org.origin);
		while(player.sessionstate == "playing")
			wait 0.05;

		iprintlnbold("^5Room Selection ^2Open");
		trig SetHintString("Press [^5&&1^7] To ^5Enter Room ^7Selection");
		wait 0.05;
	}
}

sniper_room()
{
	trig = getEnt("sniper_room","targetname");
	player_org = getentarray("player_org_sniper","targetname");
	acti_org = getentarray("acti_org_sniper","targetname");

	for(;;)
	{
		trig waittill("trigger",player);

		thread room_funk(player, player_org[randomint(player_org.size)], "remington700_mp", "m40a3_mp");

		if(isDefined(level.activ))
			thread room_funk(level.activ, acti_org[randomint(acti_org.size)], "remington700_mp", "m40a3_mp");
	}
}

knife_room()
{
	trig = getEnt("knife_room","targetname");
	player_org = getEnt("player_org_knife","targetname");
	acti_org = getEnt("acti_org_knife","targetname");

	for(;;)
	{
		trig waittill("trigger",player);

		thread room_funk(player, player_org, "knife_mp", undefined);

		if(isDefined(level.activ))
			thread room_funk(level.activ, acti_org, "knife_mp", undefined);
	}
}

bounce_room()
{
	trig = getEnt("bounce_room","targetname");
	player_org = getEnt("player_org_bounce","targetname");
	acti_org = getEnt("acti_org_bounce","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		level.bweapon_taken = false;

		thread room_funk(player, player_org, "knife_mp", undefined);

		if(isDefined(level.activ))
			thread room_funk(level.activ, acti_org, "knife_mp", undefined);
	}
}

bounce_room_fail_trig()
{
	trig = getEnt("bounce_room_fail_trig","targetname");
	player_org = getEnt("player_org_bounce","targetname");
	acti_org = getEnt("acti_org_bounce","targetname");
	while(1)
	{
		trig waittill("trigger",player);
		if(player.pers["team"] == "allies")
		{
			player setOrigin(player_org.origin);
			player setplayerangles(player_org.angles);
		}
		else
		{
			player setOrigin(acti_org.origin);
			player setplayerangles(acti_org.angles);
		}
	}
}

bounce_room_weapon()
{
	trig = getEnt("bounce_room_weapon","targetname");
	trig SetHintString("Press [&&1] To Take Weapon");
	level.bweapon_taken = false;
	weap = [];

	weap[0] = "ak47_mp";
	weap[1] = "remington700_mp";
	weap[2] = "g3_mp";
	weap[3] = "mp5_mp";

	while(1)
	{
		trig waittill("trigger",player);

		if(level.bweapon_taken == false)
		{
			gun = weap[randomint(weap.size)];
			player giveWeapon(gun);
			player GiveMaxAmmo(gun);
			player switchtoweapon(gun);
			level.bweapon_taken = true;
		}
		else
			player iprintlnbold("^1Weapon Taken");
	}
}

room_funk(entity, position, weapon, weapon2)
{
	entity TakeAllWeapons();
	entity setOrigin(position.origin);
	entity setplayerangles(position.angles);

	entity giveWeapon(weapon);
	entity GiveMaxAmmo(weapon);
	entity switchtoweapon(weapon);

	if(isDefined(weapon2))
	{
		entity giveWeapon(weapon2);
		entity GiveMaxAmmo(weapon2);
	}

	entity freezeControls(true);

	wait 3;

	entity freezeControls(false);
}