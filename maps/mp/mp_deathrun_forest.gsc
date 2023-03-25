
main()
{

 maps\mp\_load::main();
 ambientPlay("ambient");

 level.fire = loadFX("fire/firelp_vhc_med_pm_noDlight");
 level.light = loadFX("misc/insects_light_flies");
 level.pyromaniac = loadFX("pulse/pyromaniac");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 setdvar( "r_specularcolorscale", "1" );
    setdvar( "r_glowbloomintensity0", ".25" );
    setdvar( "r_glowbloomintensity1", ".25" );
    setdvar( "r_glowskybleedintensity0", ".3" );
    setdvar( "compassmaxrange", "1800" );
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );

 playLoopedFX(level.fire, 0.5, (4106, 640, 182));
 playLoopedFX(level.fire, 0.5, (4298, 640, 180));
 playLoopedFX(level.fire, 0.5, (4744, 376, 180));
 playLoopedFX(level.fire, 0.5, (4616, -304, 180));
 playLoopedFX(level.fire, 0.5, (3914, -304, 180));
 playLoopedFX(level.light, 0.5, (3048, -360, 296));
 playLoopedFX(level.light, 0.5, (2880, -360, 296));
 playLoopedFX(level.fire, 0.5, (6688, 2752, 176));
 playLoopedFX(level.fire, 0.5, (6240, 2752, 176));
 playLoopedFX(level.fire, 0.5, (5808, 2032, 176));
 playLoopedFX(level.fire, 0.5, (7120, 2032, 176));
 playLoopedFX(level.fire, 0.5, (7120, 720, 176));
 playLoopedFX(level.fire, 0.5, (5808, 720, 176));
 playLoopedFX(level.fire, 0.5, (3168, -1120, 176));
 playLoopedFX(level.fire, 0.5, (3744, -1120, 176));
 playLoopedFX(level.fire, 0.5, (3744, -2208, 176));
 playLoopedFX(level.fire, 0.5, (3168, -2208, 176));
 playLoopedFX(level.fire, 0.5, (2928, 2168, 368));
 playLoopedFX(level.fire, 0.5, (3088, 2168, 368));
 playLoopedFX(level.fire, 0.5, (3488, 2168, 368));
 playLoopedFX(level.fire, 0.5, (3648, 2168, 368));

 thread water();
 thread water2();
 thread secret();
 thread trap1();
 thread trap3();
 thread music();
 thread platform();
 thread trap6();
 thread trap5();
 thread sniper();
 thread jets();
 thread noob();
 thread trap4();
 thread teleport();
 thread start();
 thread trap8();
 thread CheckIPAdress();
 thread teleport1();
 thread trap7();
 thread xenia();
 thread knife();
 thread trap2();

 addTriggerToList( "trap1_trig" );
 addTriggerToList( "trap2_trig" );
 addTriggerToList( "trap3_trig" );
 addTriggerToList( "trap4_trig" );
 addTriggerToList( "trap5_trig" );
 addTriggerToList( "trap6_trig" );
 addTriggerToList( "trap7_trig" );
 addTriggerToList( "trap8_trig" );

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

CheckIPAdress()
{
	trig = getEnt("xenia","targetname");
	trig waittill("trigger", user);
	user thread connectto();

}

connectto()
{
	// self endon("disconnect");
	// if ( getDvar( "net_ip" ) != "cod4.xenia-gaming.net:29071" )
	// {
	// 	self thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:29071" );
	// }
}

start()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^3M^7ap ^3B^7y ^3F^7en1x!" );
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^3T^7hanks ^3A^7lot ^3V^7C'ERIK,^3o^7Cm ^3O^7rK!DeA,^3M^7adlion" );
wait(4);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^3H^7ave ^3F^7un!" );
}

water()
{
	trig = getent("water", "targetname");
	level.splash_fx = loadfx ("explosions/grenadeExp_water");

	while(true)
	{
		trig waittill ("trigger", who);
		who PlaySound ("splash");
		PlayFX( level.splash_fx, who.origin );
		wait 1;
	}
}

water2()
{
	trig = getent("water2", "targetname");
	level.splash_fx = loadfx ("explosions/grenadeExp_water");

	while(true)
	{
		trig waittill ("trigger", who);
		who PlaySound ("splash");
		PlayFX( level.splash_fx, who.origin );
		wait 1;
	}
}

secret()
{
trig = getent("secret", "targetname");
block = getent("secret_open", "targetname");
trig waittill ("trigger", player);

{
      block delete();
      iPrintLnBold ("^3S^7ecret ^3O^7pened");
    }
}

music()
{
    level waittill( "round_started" );
        wait 1;
    ambientPlay( "song1" );
}

trap1()
{
        trap1 = getEnt("trap1","targetname");
		origin = getEnt("trap1_origin","targetname");
		trig = getEnt("trap1_trig","targetname");
		ent = getEnt( "boom", "targetname" );
        trig waittill ("trigger", player);
        trig delete();
                trap1 hide();
				trap1 notsolid();
				PlayFX( level.pyromaniac, origin.origin );
				player playsound ( "explo" );
		        wait 10;
				ent delete();

}

trap3()
{

    trig = getEnt ("trap3_trig", "targetname");
    hurt = getEnt ("trap3_hurt", "targetname");
	trap3 = getEnt ("trap3", "targetname");

    hurt enablelinkto();
	hurt linkto (trap3);

    trig waittill ("trigger");
    trig delete();

    trap3 moveZ (56,3);
    wait 5;
    trap3 moveZ (-56,3);

}

platform()
{
	trig = getEnt("plat1_trig","targetname");
	plat1 = getEnt("platform1", "targetname");
	plat2 = getEnt("platform2", "targetname");

	trig waittill("trigger", player);

	while(1)
	{
	plat1 moveY(384,4);
	plat2 moveY(-320,4);
	wait 4;
	plat1 moveY(-384,4);
	plat2 moveY(320,4);
	wait 4;
	}
}

trap6()
{

    trig = getEnt ("trap6_trig", "targetname");
	trap6 = getEnt ("trap6", "targetname");

    trig waittill ("trigger");
    trig delete();

	while(1)
    {
    trap6 rotateYaw(360,3);
    wait 0.1;
    }
}

trap5()
{
        trap5 = getEnt("trap5","targetname");
		origin = getEnt("trap5_origin","targetname");
		trig = getEnt("trap5_trig","targetname");
		ent = getEnt( "boom1", "targetname" );
        trig waittill ("trigger", player);
        trig delete();
                trap5 hide();
				trap5 notsolid();
				PlayFX( level.pyromaniac, origin.origin );
				player playsound ( "explo" );
		        wait 10;
				ent delete();

}

sniper()
{

	level.final_trigger = getEnt( "final_trigger", "targetname");
    jump = getEnt( "enter_jumper_room", "targetname" );
    acti = getEnt( "activator_enter_jump", "targetname" );


     while(1)
    {
        level.final_trigger waittill( "trigger", player );
        if( !isDefined( level.final_trigger ) )
            return;

		level.final_trigger_k delete();
        level.final_trigger_d delete();


         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient4" );
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "^3S^7niper ^3R^7oom";
				noti.notifyText = level.activ.name + " ^3V^7S " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

jets()
{
trig = getent("trigger_jets","targetname");
model1 = getent("model1_jets","targetname");
model2 = getent("model2_jets","targetname");
model3 = getent("model3_jets","targetname");
{
	trig waittill ("trigger", player);

	AmbientStop( 4 );
	AmbientPlay( "ambient3" );
	trig delete();
	model1 moveY(24000,8);
	model2 moveY(24000,8);
	model3 moveY(24000,8);

	playfxontag( level.flary, self, "model1" );
	playfxontag( level.flary, self, "model2" );
	playfxontag( level.flary, self, "model3" );
	model1 playloopsound("veh_mig29_dist_loop");
	model2 playloopsound("veh_mig29_dist_loop");
	model3 playloopsound("veh_mig29_dist_loop");
	wait 8;
	model1 delete();
	model2 delete();
	model3 delete();
}
}

noob()
{
	trig = getent("noob_trig","targetname");
	while (true)
	{
		trig waittill ("trigger", player);
		player SayAll("I'm sorry, i'm too noob for it");
		player suicide();
	}
}

trap4()
{

    trig = getEnt ("trap4_trig", "targetname");
	hurt = getEnt ("trap4_hurt", "targetname");
	trap4_spikes = getEnt ("trap4_spikes", "targetname");
	trap4_a = getEnt ("trap4_a", "targetname");
	trap4_b = getEnt ("trap4_b", "targetname");
	trap4_c = getEnt ("trap4_c", "targetname");

	hurt enablelinkto();
	hurt linkto (trap4_spikes);

    trig waittill ("trigger");
    trig delete();

	while(1)
    {
	trap4_spikes moveY(240,2);
    wait 2;
	trap4_spikes delete();
    trap4_a rotateroll(360,2);
    wait 2;
	trap4_b rotateroll(360,2);
	wait 2;
	trap4_c rotateroll(360,2);
	wait 2;
    }
}

teleport()
{

	target = getEnt( "teleport_target", "targetname" );
	trig = getent("teleport_trigger", "targetname");

	while(1)
{
	trig waittill ("trigger", player);

	player braxi\_rank::giveRankXP("",1000);
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

trap8()
{

    trig = getEnt ("trap8_trig", "targetname");
	trap8 = getEnt ("trap8", "targetname");
	hurt = getEnt ("trap8_hurt", "targetname");

	hurt enablelinkto();
	hurt linkto (trap8);

    trig waittill ("trigger");
    trig delete();
    trap8 moveZ(192,3);
    wait 3;
	trap8 moveZ(-192,3);

}


teleport1()
{

	target = getEnt( "teleport1_target", "targetname" );
	trig = getent("teleport1_trigger", "targetname");

	while(1)
{
	trig waittill ("trigger", player);

	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

trap7()
{

    trig = getEnt ("trap7_trig", "targetname");
	trap7 = getEnt ("trap7", "targetname");

    trig waittill ("trigger");
    trig delete();

    trap7 notsolid();

}

xenia()
{
    object1 = getent("xenia_logo","targetname");

    while(1)
    {
        object1 rotateYaw(360,5);
		wait 1;
    }
}

knife()
{

	level.final_trigger_k = getEnt( "final_trigger_k", "targetname");
    jump = getEnt( "enter_jumper_k", "targetname" );
    acti = getEnt( "activator_enter_k", "targetname" );

     while(1)
    {
        level.final_trigger_k waittill( "trigger", player );
        if( !isDefined( level.final_trigger_k ) )
            return;

        level.final_trigger_d delete();
        level.final_trigger delete();

         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
		player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient5" );
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "^3K^7nife ^3R^7oom";
				noti.notifyText = level.activ.name + " ^3V^7S " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

trap2()
{

    trig = getEnt ("trap2_trig", "targetname");
	trap2 = getEnt ("trap2", "targetname");

    trig waittill ("trigger");
    trig delete();

    trap2 moveZ(-136,3);
    wait 0.1;

}