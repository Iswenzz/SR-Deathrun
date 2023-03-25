/*
__________________________________________________
  /   /  ___/    __ /   ___// \ \_____/ / /  ___  \
 /   /  /__     /___   /__ / / \ \ __/ / /  /  /  /
/   /  ___/  __    /  ___// /   \ \ / / /  /  /  /
  _/  /__   /_/   /	 /__ / /     \ \ / /  /__/  /
___\____/________/\____//_/	      \_/ /________/

Credit: Blade, Wingzor

Give me credit if you use any of my scripts... thx...

*/
main()
{
	maps\mp\_load::main();
	maps\mp\evangelion\extra::main();
	maps\mp\evangelion\musicmenu::main();
	maps\mp\mp_dr_evangelion_fx::main();
	maps\createfx\mp_dr_evangelion_fx::main();

	precachemodel("Masterchief_Halo3");
	precachemodel("playermodel_terminator");
	precachemodel("wraith");
	precachemodel("vehicle_mig29_desert");

	level.rpgtrail = loadfx("smoke/smoke_geotrail_rpg");
	level.explosion = loadfx("explosions/default_explosion");
	level.glassfx = loadfx("evangelion/glassfx");
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1.8" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	thread creator_entered();

	level waittill("round_started");

	thread modelchange();
	thread secretlab();

	thread startdoor();
	thread bodycontainers();
	thread doors();
	thread door1();
	thread teleport();
	thread actidoors();
	thread tp1();
	thread tp2();
	thread tp3();
	thread plat_mover();
	thread ropeslide();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9setup();
	thread trap10();
	thread trap11setup();
	thread trap12();
	thread trap13();
	thread trap14();
	thread room_doors_setup();
	wait 15;
	iprintln("This is a public releas of the map");
	iprintln("Full releas is on ^1VC'Deathrun");
}

creator_entered()
{
	level.me="c8d2d25c"; 
	for(;;)
	{
		level waittill("connected",player);
		if(isdefined(player.pers["legend"]))
			return;

		creator=getSubStr( player.guid, 24, 32 );

		wait 2;
		if(creator==level.me && !player.pers["legend"])
		{
			player.pers["legend"]=true;
			iprintlnbold("^5* * ^2Creator ^3" + player.name + " ^2has Joined^1!^5 * *");
			iprintlnbold("^5* * ^2Maybe Say ^3HELLO^5! ^2To The Creator!^5 * *");
		}
	}
}

modelchange()
{
	players = getentarray("player","classname");
	for(i=0;i<=players.size;i++)
	{
		players[i] detachall();
		players[i] setmodel("Masterchief_Halo3");
		players[i].usedfxtrig = false;
	}
	wait 1;
	level.activ setmodel("playermodel_terminator");
	for(;;)
	{
		level waittill("spawned",player);
		if(player == player)
		{player setmodel("Masterchief_Halo3");}
		if(player == level.activ)
		{level.activ setmodel("playermodel_terminator");}	//just in case
	}
}

bodycontainers()
{
	bodys = [];
	bodys[0] = getent("start1","targetname");
	bodys[1] = getent("start2","targetname");
	bodys[2] = getent("start3","targetname");
	bodys[3] = getent("lab1","targetname");
	bodys[4] = getent("lab2","targetname");
	bodys[5] = getent("lab3","targetname");
	bodys[6] = getent("lab4","targetname");
	for(i=0;i<=bodys.size;i++)
	{
		bodys[i] thread moveinc(i);
	}
}

moveinc(num)
{
	for(;;)
	{
		if(num == 3 || num == 4 || num == 5 || num == 6)
		{
			self movez(-12,2);
			wait 2;
			self movez(12,2);
			wait 2;
			self movez(12,2);
			wait 2;
			self movez(-12,2);
			wait 2;
		}
		
		if(num == 0 || num == 1 || num == 2)
		{
			self movez(-32,2);
			wait 2;
			self movez(32,2);
			wait 2;
			self movez(32,2);
			wait 2;
			self movez(-32,2);
			wait 2;
		}
	}
}

ropeslide()
{
	trig = getent("ropeslide","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player thread slide();
		player DisableWeapons();
	}
}

slide()
{
	m1 = getent("m1","targetname");
	m2 = getent("m2","targetname");
	m3 = getent("m3","targetname");
	m4 = getent("m4","targetname");
	m5 = getent("m5","targetname");
	m6 = getent("m6","targetname");
	ad = spawn("script_model",(0,0,0));
	ad.origin = self.origin;
	ad.angles = self.angles;
	self linkto(ad);
	ad moveto(m1.origin-(0,0,50),1);
	wait 1;
	ad moveto(m2.origin-(0,0,50),.9);
	wait .91;
	ad moveto(m3.origin-(0,0,50),.7);
	wait .71;
	ad moveto(m4.origin-(0,0,50),.5);
	wait .51;
	ad moveto(m5.origin-(0,0,50),.3);
	wait .31;
	ad moveto(m6.origin-(0,0,50),.1);
	wait .11;
	self unlink();
	self EnableWeapons();
}

secretlab()
{
	door = getent("secretlab","targetname");
	trig = getent("secretlab_trig","targetname");
	ladders = getent("ladderstolab","targetname");
	ladders notsolid();
	trig waittill("trigger", player);
	{
		trig delete();
		door rotateRoll(30, 1,0.1,0.5);
		ladders solid();
	}
}

startdoor()
{
	door1 = getent("startdoor1","targetname");
	door2 = getent("startdoor2","targetname");
	wait randomint(10)+2;
	door1 moveX(80,1,0.1,0.5);
	door2 moveX(-80,1,0.1,0.5);
}

doors()
{
	door1 = getent("door2_1","targetname");
	door2 = getent("door2_2","targetname");
	trig = getent("doorstrig","targetname");
	trig waittill("trigger",player);
	{
		trig delete();
		door1 playsound("ele_door");
		door2 PlaySound("ele_door");
		door1 moveY(-56,2,0.5);
		door2 moveY(56,2,0.5);
	}
}

door1()
{
	door = getent("door3_1","targetname");
	trig = getent("doorstrig2nd","targetname");
	trig waittill("trigger",player);
	{
		trig delete();
		door moveX(56,2,0.5);
		door PlaySound("ele_door");
	}
}

teleport()
{
	spot = getent("tp_spot","targetname");
	trig = getent("tp_spott","targetname");
	{
		trig waittill("trigger",player);
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
	}
}

actidoors()
{
	door1 = getent("dooracti1","targetname");
	door2 = getent("dooracti2","targetname");
	trig = getent("dooractitrig","targetname");
	trig waittill("trigger",player);
	{
		trig delete();
		door1 moveY(-56,2,0.5);
		door2 moveY(56,2,0.5);
		door1 PlaySound("ele_door");
		door2 PlaySound("ele_door");
	}
}

tp1()
{
	trig = getent("tp1","targetname");
	spot = getent("spot1","targetname");
	trig waittill("trigger", player);
	{
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
	}
}

tp2()
{
	trig = getent("tp2","targetname");
	spot = getent("spot2","targetname");
	trig waittill("trigger", player);
	{
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
	}
}

tp3()
{
	trig = getent("tp3","targetname");
	spot = getent("spot3","targetname");
	trig waittill("trigger",player);
	trig delete();
	{
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
	}
}

plat_mover()
{
	for(i=1;i<=2;i++)
	{
		thread movers(i);
	}
}

movers(num)
{
	trig = getent("actimover_"+num,"targetname");
	obj = getent("plat_mover_"+num,"targetname");
	position = getent("movers_position_"+num,"targetname");
	trig waittill("trigger",player);
	trig delete();
	oldpos = obj getorigin();
	{
		for(;;)
		{
			obj moveto(position.origin,5);
			obj waittill("movedone");
			wait 2;
			obj moveto(oldpos,5);
			obj waittill("movedone");
			wait 2;
		}
	}
}

trap1()
{
	bounce1 = getent("bounce1","targetname");
	bounce2 = getent("bounce2","targetname");
	trig = getent("trap1trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		x = randomint(5);
		switch(x)
		{
			case 0:
			bounce1 delete();
			break;

			case 1:
			bounce1 rotateYaw(360,3,1,2);
			break;

			case 2:
			bounce2 delete();
			break;

			case 3:
			bounce2 rotateYaw(360,3,1,2);
			break;

			case 4:
			bounce1 rotateYaw(360,3,1,2);
			bounce2 rotateYaw(-360,3,1,2);
			break;
		}
	}
}

trap2()
{
	plat1 = getent("plat1","targetname");
	plat2 = getent("plat2","targetname");
	trig = getent("trap2trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		x = randomint(2);
		switch(x)
		{
			case 0:
			plat1 hide();
			plat1 notsolid();
			wait randomint(10);
			plat1 show();
			plat1 solid();
			break;

			case 1:
			plat2 hide();
			plat2 notsolid();
			wait randomint(10);
			plat2 show();
			plat2 solid();
			break;

		}
	}
}

trap3()
{
	level.plat = getent("plat_trap3","targetname");
	level.balls = getent("balls","targetname");
	trig = getent("trap3trig","targetname");
	level.onplat = getent("onplat_trig","targetname");
	level.onplat enablelinkto();
	level.onplat linkto(level.plat);
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		thread removetrig();
		thread rotateballs();
		trig delete();
		thread trap3on();
		level.plat moveX(-192,2);
		level.plat waittill("movedone");
		for(;;)
		{
			level.plat moveX(384, 2,0.5,1);
			level.plat waittill("movedone");
			level.plat moveX(-384, 2,0.5,1);
			level.plat waittill("movedone");
		}
	}
}

rotateballs()
{
	for(;;)
	{
		level.balls rotateYaw(360,2);
		wait 2;
	}
}

trap3on()
{
	for(;;)
	{
		level.onplat waittill("trigger", player);
		level.plat rotatePitch(180,1);
		wait 2;
		level.plat rotatePitch(180,1);
	}
}

removetrig()
{
	wait randomint(15)+5;
	level.onplat delete();
	level.balls delete();
}	

trap4()
{
	rpg_rocket = getent("trap4","targetname");
	trig = getent("trap4trig","targetname");
	position = getent("position","targetname");
	destroypart = getent("destroypart","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger", player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		rpg_rocket moveto(position.origin, 1);
		rpg_rocket PlayLoopSound( "weap_rpg_loop" );
		PlayFXOnTag ( level.rpgtrail, rpg_rocket, "tag_clip" );
		rpg_rocket waittill("movedone");
		destroypart delete();
		PlayFX(level.explosion,(-224, -3720, 24));
		Earthquake( 0.6, 2, position.origin, 850 );
		rpg_rocket delete();
		RadiusDamage( position.origin, 500, 90, 50 );
		position playsound("grenade_explode_layer");
	}
}

trap5()
{
	bridge_1 = getent("bridge_1","targetname");
	bridge_2 = getent("bridge_2","targetname");
	c4_1 = getent("c4_1","targetname");
	c4_2 = getent("c4_2","targetname");
	c4_3 = getent("c4_3","targetname");
	bridgepart = getent("bridgepart","targetname");
	trig = getent("trap5trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger", player);
	if (level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		PlayFX(level.explosion,(-1488, -3104, 145));
		c4_1 playsound("grenade_explode_layer");
		c4_2 playsound("grenade_explode_layer");
		c4_3 playsound("grenade_explode_layer");
		Earthquake( 0.6, 2, c4_2.origin, 850 );
		bridgepart delete();
		c4_1 hide();
		c4_2 hide();
		c4_3 hide();
		bridge_1 rotateRoll(-32,2);
		bridge_2 rotateRoll(57,2);
		bridge_1 moveZ(-592,2.5,1);
		bridge_2 moveZ(-592,2.5,1);
	}
}

trap6()
{
	trig = getent("trap6trig","targetname");
	obj = getent("mover","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		obj moveX(-52,1);
		obj waittill("movedone");
		for(;;)
		{
			obj moveX(120,1,0.5);
			obj waittill("movedone");
			obj moveX(-120,1,0.5);
			obj waittill("movedone");
		}
	}
}

trap7()
{
	wall1 = getent("wall1","targetname");
	trig = getent("trap7trig","targetname");
	rot1 = getent("rot1","targetname");
	rot2 = getent("rot2","targetname");
	dmg1 = getent("dmg1trig","targetname");
	dmg2 = getent("dmg2trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		wall1 hide();
		dmg1 enablelinkto();
		dmg1 linkto(rot1);
		dmg2 enablelinkto();
		dmg2 linkto(rot2);
		roted = 0;
		while(roted<=5)
		{
			x = randomint(2);
			switch(x)
			{
				case 0:
				rot1 rotateYaw(180,1,0.3,0.5);
				wait randomint(3);
				rot2 rotateYaw(-180,1,0.3,0.5);
				roted++;
				wait randomint(5);
				break;

				case 1:
				rot1 rotateYaw(-180,1,0.3,0.5);
				wait randomint(3);
				rot2 rotateYaw(180,1,0.3,0.5);
				roted++;
				wait randomint(5);
				break;
			}
		}
		wall1 show();
	}
}

trap8()
{
	trig = getent("trap8trig","targetname");
	bounce = getent("movingbounce","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger", player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		bounce moveY(112,1,0.2);
		bounce waittill("movedone");
		for(;;)
		{
			bounce moveY(-224,2,0.5,1);
			bounce waittill("movedone");
			bounce moveY(224,2,0.5,1);
			bounce waittill("movedone");
		}
	}
}

trap9setup()
{
	trig = getent("trap9trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		for(i=1;i<=60;i++)
		{
			thread trap9(i);
		}
	}
}

trap9(num)
{
	obj = getent("p_"+num,"targetname");
	trig = getent("t_"+num,"targetname");
	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp( undefined, 50 );
	x = randomint(2);
	switch(x)
	{
		case 0:
		obj delete();
		trig delete();
		break;

		case 1:
		trig delete();
		break;
	}
}

trap10()
{
	plat = getent("trap10plat","targetname");
	tper = getent("tper","targetname");
	trig = getent("trap10trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		tper thread ktp();
		tper enablelinkto();
		tper linkto(plat);
		plat moveY(144,2);
		wait randomint(10)+2;
		plat moveY(-144,3);
		plat waittill("movedone");
		plat delete();
		tper delete();
	}
}

ktp()
{
	point = getent("tps_point","targetname");
	for(;;)
	{
		self waittill("trigger",player);
		player setorigin(point.origin);
		player setplayerangles(point.angles);
		wait .0001;
	}
}

trap11setup()
{
	trig = getent("trap11trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		for(i=1;i<=8;i++)
		{
			thread trap11(i);
		}
		wait 10;
	}
}

trap11(num)
{
	glass = getent("glass_"+num,"targetname");
	damage = getent("damage_p_"+num,"targetname");
	wait randomint(5);
	PlayFX(level.glassfx,(glass.origin));
	damage PlaySound("bullet_large_glass");
	wait .001;
	glass delete();
	RadiusDamage( damage.origin, 500, 90, 50 );
}

trap12()
{
	trig = getent("trap12trig","targetname");
	trig sethintstring("Press [&&1] To Activate The Spiner");
	dmgtrig = getent("trap12dmg","targetname");
	obj = getent("trap12","targetname");
	trig waittill("trigger",player);
	if(level.trapsDisabled == true)
	{
		trig sethintstring("Its freerun");
	}
	else
	{
		player braxi\_rank::giveRankXp( undefined, 50 );
		trig delete();
		dmgtrig enablelinkto();
		dmgtrig linkto(obj);
		for(;;)
		{
			obj rotateYaw(-360,3);
			wait 3;
		}
	}
}

trap13()
{
	trig = getent("trap13trig","targetname");
	trig sethintstring("Press [&&1] To Activate The Jump Blocker");
	dmgtrig = getent("trap13dmg","targetname");
	obj = getent("trap13","targetname");
	trig waittill("trigger",player);
	{
		if(level.trapsDisabled == true)
		{
			trig sethintstring("Its freerun");
		}
		else
		{
			player braxi\_rank::giveRankXp( undefined, 50 );
			dmgtrig enablelinkto();
			dmgtrig linkto(obj);
			trig delete();
			for(;;)
			{
				time = randomint(3);
				obj moveX(104,time);
				wait time;
				obj moveX(-104,time);
				wait time;
			}
		}
	}
}

trap14()
{
	breakingball = getent("breakingball","targetname");
	wall = getent("trap14wall","targetname");
	m1 = getent("trap14_1","targetname");
	m2 = getent("trap14_2","targetname");
	m3 = getent("trap14_3","targetname");//origins to move
	trig = getent("trap14trig","targetname");
	trig sethintstring("Press [&&1] To Activate The Breaking Ball");
	trig waittill("trigger",player);
	{
		if(level.trapsDisabled == true)
		{
			trig sethintstring("Its freerun");
		}
		else
		{
			player braxi\_rank::giveRankXp( undefined, 50 );
			trig delete();
			breakingball moveto(m1.origin,1);
			wait 1;
			breakingball moveto(m2.origin,0.7);
			wait .6;
			wall playsound("grenade_explode_layer");
			PlayFX(level.explosion,(wall.origin));
			Earthquake( 0.5, 1, m2.origin, 850 );
			RadiusDamage( m2.origin, 500, 100, 90 );
			wall delete();
			wait .1;
			breakingball moveto(m3.origin, 0.5);
			wait .3;
			Earthquake( 0.6, 2, m3.origin, 850 );
			RadiusDamage( m3.origin, 300, 100, 90 );
		}
	}
}

room_doors_setup()
{
	thread room_doors_s();
	thread room_doors_k();
	thread room_doors_b();
	thread room_doors_o();
}

room_doors_s()
{
	door = getent("room_door_1","targetname");
	level.doors_trig_s = getent("rooms_door_trig_1","targetname");
	level.doors_trig_s waittill("trigger",player);
	{
		level.doors_trig_s delete();
		level.doors_trig_k delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		door rotateYaw(70,1,0.2,0.8); 
		door PlaySound("normal_door");
		thread sniperoom();
	}
}

room_doors_k()
{
	door = getent("room_door_2","targetname");
	level.doors_trig_k = getent("rooms_door_trig_2","targetname");
	level.doors_trig_k waittill("trigger",player);
	{
		level.doors_trig_s delete();
		level.doors_trig_k delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		door rotateYaw(70,1,0.2,0.8); 
		door PlaySound("normal_door");
		thread kniferoom();
	}
}

room_doors_b()
{
	level.doors_trig_b = getent("rooms_door_trig_3","targetname");
	door = getent("room_door_3","targetname");
	level.doors_trig_b waittill("trigger",player);
	{
		level.doors_trig_s delete();
		level.doors_trig_k delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		door rotateYaw(-70,1,0.2,0.8); 
		door PlaySound("normal_door");
		thread jumproom();
		thread jumproom_failtrig();
		thread jumproom_sniper();
	}
}

room_doors_o()
{
	level.doors_trig_o = getent("rooms_door_trig_4","targetname");
	door = getent("room_door_4","targetname");
	tp_acti = getEnt("tp_acti","targetname");
	entrance = getEnt("entrancew","targetname");
	level.doors_trig_o waittill("trigger",player);
	{
		entrance delete();
		level.activ setOrigin(tp_acti.origin);
		level.doors_trig_s delete();
		level.doors_trig_k delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		thread acticantleavroom();
		thread roomhud(0,-100,player.name+" Opened Old Door");
		door moveZ(112,2,1,.5); 
		door PlaySound("ele_door");
	}
}

acticantleavroom()
{
	trig = getent("acticantleavroom_trig","targetname");
	inold = getent("inold","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{}
	
		if(player == level.activ)
		{
			level.activ setOrigin(inold.origin);
			level.activ iprintlnbold("^1Activator Can Not Leav This Room");
		}
		wait .1;
	}
}

roomhud(x,y,text)
{
	roomhud = NewHudElem();
	roomhud.alignX = "center";
	roomhud.alignY = "middle";
	roomhud.horzalign = "center";
	roomhud.vertalign = "middle";
	roomhud.alpha = 1;
	roomhud.x = x;
	roomhud.y = -500;
	roomhud.font = "default";
	roomhud.fontscale = 1.6;	
	roomhud.glowalpha = 1;
	roomhud.glowcolor = (1,0,0);
	roomhud settext(text);
	wait .1;
	roomhud moveovertime(2);
	roomhud.y = y;
	wait 4;
	roomhud fadeovertime(1);
	roomhud.alpha = 0;
	wait 2;
	roomhud destroy();
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.doors_trig_s delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		level.firstenter=false;
		}
		thread roomhud(0,-100,"Knife Room");
		thread roomhud(-100,-50,player.name);
		thread roomhud(0,-50,"^1VS");

		if(isDefined(level.activ) && isAlive(level.activ))
		{thread roomhud(100,-50,level.activ.name);}
		else
		{thread roomhud(100,-50,"Activator Isnt Alive");}

		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );

        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" ); 

        wait 0.05;

        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        wait 5;
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniper", "targetname");
    jump = getEnt( "jumper_sniper", "targetname" );
    acti = getEnt( "acti_sniper", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.doors_trig_k delete();
		level.doors_trig_b delete();
		level.doors_trig_o delete();
		level.firstenter=false;
		}
		thread roomhud(0,-100,"Sniper Room");
		thread roomhud(-100,-50,player.name);
		thread roomhud(0,-50,"^1VS");

		if(isDefined(level.activ) && isAlive(level.activ))
		{thread roomhud(100,-50,level.activ.name);}
		else
		{thread roomhud(100,-50,"Activator Isnt Alive");}

        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );

        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );

	    player freezeControls(true);
		level.activ freezeControls(true);

		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		wait 5;
	    player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproom()
{
    level.jump_trig = getEnt( "jump", "targetname");
    jump = getEnt( "jumper_jump", "targetname" );
    acti = getEnt( "acti_jump", "targetname" );

    
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
			
		if(level.firstenter==true)
		{
        level.doors_trig_s delete();
		level.doors_trig_k delete();
		level.doors_trig_o delete();
		level.firstenter=false;
		}
		thread roomhud(0,-100,"Jump Room");
		thread roomhud(-100,-50,player.name);
		thread roomhud(0,-50,"^1VS");
		
		if(isDefined(level.activ) && isAlive(level.activ))
		{thread roomhud(100,-50,level.activ.name);}
		else
		{thread roomhud(100,-50,"Activator Isnt Alive");}

        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );

        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );

	    player freezeControls(true);
		level.activ freezeControls(true);

		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
		wait 5;
	    player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproom_failtrig()
{
	trig = getEnt("fail_trig","targetname");
	acti_load = getEnt("acti_load","targetname");
	jumper_load = getEnt("jumper_load","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{
			player setOrigin(jumper_load.origin);
			player setPlayerangles(jumper_load.angles);
		}
		if(player == level.activ)
		{
			level.activ setOrigin(acti_load.origin);
			level.activ setPlayerangles(acti_load.angles);
		}
		wait .1;
	}
}

jumproom_sniper()
{
	s_model = getEnt("s_model","targetname");
	trig = getEnt("s_trig","targetname");
	s_model thread rotatesniper();
	for(;;)
	{
		trig waittill("trigger",player);
		player GiveWeapon("remington700_mp");
		player givemaxammo("remington700_mp");
		wait .1;
		player switchToWeapon("remington700_mp");
	}
}

rotatesniper()
{
	for(;;)
	{
		self rotateYaw(360,5);
		wait 5;
	}
}