/* Map fully made and scripted by S1ck*/
/* add me on xfire: Liromir123*/
/* 6848 */

main()
{
level.spawn["player"] = spawn("script_origin", (-205,-1343,82));
level.spawn["player"].angles = level.spawn["allies"][0].angles;
level.spawn["player"] placeSpawnPoint();
	maps\mp\_load::main();
PreCacheItem("s1ck_crossbow_mp");
PreCacheItem("lol_remington700_mp");
PreCacheItem("s1ck_m14_mp");
precacheItem("rpg_mp");

thread trap1();
thread trap20();
thread trap21();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap7();
thread trap10();
thread trap11();
thread trap12();
thread trap15();
thread trap16();
thread hammer();
thread start();
thread start2();
thread teleport();
thread teleport2();
thread solid();
thread laser();
thread finish();
thread deagle();
thread finalknife();
thread finalsniper();
thread final3();
thread finalold();
thread finalrace();
thread vending();
thread fire();
thread fire2();
thread fire3();
thread fire4();
thread teleport5();
thread teleport6();
thread teleport7();
thread teleport8();
thread teleport9();
thread teleport10();
thread plane();
thread respawn();
thread rpg();
thread rpg1();
thread rpg2();
thread secretexp();
thread kill1();
thread messages();



addTriggerToList( "trigger_trap1" );
addTriggerToList( "trigger_trap2" );
addTriggerToList( "trigger_trap3" );
addTriggerToList( "trigger_trap4" );
addTriggerToList( "trigger_trap5" );
addTriggerToList( "trigger_trap7" );
addTriggerToList( "trigger_solid" );
addTriggerToList( "trigger_trap15" );
addTriggerToList( "trigger_deagle" );
addTriggerToList( "trigger_trap11" );
addTriggerToList( "trigger_trap16" );
addTriggerToList( "trigger_hammer" );


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


superpowers()  //Originally Written by Wingzor and i took it from mp_deathrun_cherry.gsc
{
    self SetMoveSpeedScale( 3 );
    self jumpheight( 5 );
}

superpowers1()  //Originally Written by Wingzor and i took it from mp_deathrun_cherry.gsc
{
   self SetMoveSpeedScale( 2 );
}
jumpheight( strenght ) //Originally Written by Wingzor (Thanks buddy :>)
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");

	oldpos = self.origin;
	jumped = false;

	if( !isDefined( strenght ) || strenght < 1 )
		strenght = 1;

	while(1)
	{
		if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
		{
			if(jumped)
				continue;
			for(i=0;i<strenght;i++)
			{
				self.health += 100;
				self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
			jumped = false;
		oldpos = self.origin;
		wait 0.1;
	}
}


messages()
{
    while(1)
	{
		wait 10;
		iprintln ("^3Map created by ^2S1ck");
		wait 10;
		iprintln ("^3Xfire: liromir123");
		wait 110;
    }
}



respawn()
{
	trigger = getEnt ("respawn", "targetname");
	target = getEnt ("respawn1", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^1Anti fail-spawn ^3Activated");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}





teleport()
{
	trigger = getEnt ("teleport_trigger", "targetname");
	target = getEnt ("teleport_target", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^1WTF?");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport2()
{
	trigger = getEnt ("teleport_trigger2", "targetname");
	target = getEnt ("teleport_target2", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^1Welcome back");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport5()
{
	trigger = getEnt ("teleport_trigger5", "targetname");
	target = getEnt ("teleport_target5", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^1Good luck!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport7()
{
	trigger = getEnt ("teleport_trigger7", "targetname");
	target = getEnt ("teleport_target7", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^3Fail!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport8()
{
	trigger = getEnt ("teleport_trigger8", "targetname");
	target = getEnt ("teleport_target8", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^3Fail!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport9()
{
	trigger = getEnt ("teleport_trigger9", "targetname");
	target = getEnt ("teleport_target9", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^3Fail!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

teleport10()
{
	trigger = getEnt ("teleport_trigger10", "targetname");
	target = getEnt ("teleport_target10", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^6Fail!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secretexp()

{
	trigger = getEnt ("secretexp", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);



				player iprintlnbold ("^3Nice, u found secret 1/5 50xp!");

		trigger delete();

	}
}

trap99()
	{
		b1 = getent ("trap99","targetname");

	while (1)
		{
		wait 0.1;
		b1 rotateyaw (360 , 1);
				wait 2;
}
}

teleport6()
{
	trigger = getEnt ("teleport_trigger6", "targetname");
	target = getEnt ("teleport_target6", "targetname");

	while(1)
	{
		trigger waittill ("trigger", player);

							player iprintlnbold ("^150xp!");


		iPrintlnBold( " ^6" + player.name + " ^5 FINISHED SECRET ^7WHAT A PRO JUMPER!^1!" );






		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );

	}
}

laser()
{
hurt = getEnt ("laserdmg", "targetname");
spikes = getEnt ("laser", "targetname");

hurt enablelinkto();
hurt linkto (spikes);
while(1)
{

		spikes moveY(300,6);
		wait 0.1;
		spikes waittill ("movedone");
		spikes moveY(-300,6);
		wait 0.1;
		spikes waittill ("movedone");
}
}


fire()

{

fire1 = getent("fire1","targetname");
level._effect[ "fire" ] = loadfx( "fire/firelp_large_pm" );
maps\mp\_fx::loopfx("fire", (fire1.origin), 3, (fire1.origin) + (0, 0, 90));


}

fire2()

{

fire2 = getent("fire2","targetname");
level._effect[ "fire" ] = loadfx( "fire/firelp_large_pm" );
maps\mp\_fx::loopfx("fire", (fire2.origin), 3, (fire2.origin) + (0, 0, 90));


}

fire3()

{

fire3 = getent("fire3","targetname");
level._effect[ "fire" ] = loadfx( "fire/firelp_large_pm" );
maps\mp\_fx::loopfx("fire", (fire3.origin), 3, (fire3.origin) + (0, 0, 90));


}

fire4()

{

fire4 = getent("fire4","targetname");
level._effect[ "fire" ] = loadfx( "fire/firelp_large_pm" );
maps\mp\_fx::loopfx("fire", (fire4.origin), 3, (fire4.origin) + (0, 0, 90));


}

rpg()
{
trigger = getEnt ("rpg", "targetname");
while(1)
{
trigger waittill ("trigger", player);
player GiveWeapon("rpg_mp");
player GiveMaxAmmo("rpg_mp");
player SwitchToWeapon( "rpg_mp" );

}
}

rpg1()
{
trigger = getEnt ("rpg1", "targetname");
while(1)
{
trigger waittill ("trigger", player);
player GiveWeapon("rpg_mp");
player GiveMaxAmmo("rpg_mp");
player SwitchToWeapon( "rpg_mp" );

}
}

rpg2()
{
trigger = getEnt ("rpg2", "targetname");
while(1)
{
trigger waittill ("trigger", player);
player GiveWeapon("rpg_mp");
player GiveMaxAmmo("rpg_mp");
player SwitchToWeapon( "rpg_mp" );

}
}

vending()
{
trigger = getEnt ("vending", "targetname");
while(1)
{
trigger waittill ("trigger", player);
		player giveweapon( "deserteagle_mp", 10 );
		player SwitchToWeapon( "deserteagle_mp" );
}
}



finish()
{
drzwi1 = getEnt ("drzwi1", "targetname");
drzwi2 = getEnt ("drzwi2", "targetname");
trigger = getEnt ("finish", "targetname");

{
trigger waittill ("trigger", player);
iPrintLnBold(player.name+ " ^1Finished first!");
		drzwi1 movey(-60,10,1,9);
		wait 0.1;
		drzwi2 movey(60,10,1,9);
		wait 0.1;
trigger delete();
}
}


trap21()
	{
		b2 = getent ("b2","targetname");
				b4 = getent ("b4","targetname");
						b6 = getent ("b6","targetname");
								b8 = getent ("b8","targetname");

	while (1)
		{
				wait 0.01;
		b2 rotateyaw (360 , 1);
				wait 0.01;
						b4 rotateyaw (360 , 1);
								wait 0.01;
										b6 rotateyaw (360 , 1);
												wait 0.01;
														b8 rotateyaw (360 , 1);
																wait 0.01;

		}

	}

trap1()
{
trigger = getEnt("trigger_trap1", "targetname");
brush = getEnt("trap1","targetname");
trigger waittill("trigger", player);
trigger delete();
{
wait(0.01);
brush movez(-3000,3);
}

}

trap2()
{
	trigger = getEnt("trigger_trap2","targetname");
	c1 = getEnt("c1","targetname");
		c2 = getEnt("c2","targetname");
			c3 = getEnt("c3","targetname");
				c4 = getEnt("c4","targetname");
					c5 = getEnt("c5","targetname");
	trigger waittill("trigger");
	while(1)
	{
wait(0.1);
c1 rotateroll(-360,1);
wait(0.1);
c2 rotateroll(-360,1);
wait(0.1);
c3 rotateroll(-360,1);
wait(0.1);
c4 rotateroll(-360,1);
wait(0.1);
c5 rotateroll(-360,1);
wait(5);
	}
}

trap12()
{
brush = getent("trap12","targetname");
while (1)
{
brush rotateyaw (360 , 1);
wait (2);
}

}


plane()
{
wait(5);
plane = getent("plane","targetname");
wait(5);
musicPlay("planesound");
iprintlnbold ("^7We are near destiny runners!");
plane movey(6848,8);
plane waittill ("movedone");
wait 2;
musicstop ( 1 );
}


start()
{
wait(12);
right = getent("open1","targetname");
wait(12);
musicPlay("start");
right movey(70,10,1,9);
right waittill ("movedone");
wait 2;
musicstop ( 1 );
}

start2()
{
wait(12);
ambientPlay("dub");
left = getent("open2","targetname");
wait(12);
left movey(-70,10,1,9);
left waittill ("movedone");
wait 0.5;
}

trap3()
{
trigger = getEnt("trigger_trap3", "targetname");
brush = getEnt("trap3","targetname");
trigger waittill("trigger", player);
trigger delete();
{
wait(0.01);
brush movez(-3000,3);
}

}

	deagle()
	{
	trigger = getent ("trigger_deagle","targetname");
	brush = getent ("deagle","targetname");

	trigger waittill ("trigger",player);
	trigger delete ();

		{
		brush moveZ(100,1);
		wait 0.5;
		}

	}


trap4()
	{
	trigger = getent ("trigger_trap4","targetname");
	brush = getent ("trap4","targetname");

	trigger waittill ("trigger",player);
	trigger delete ();

	while (1)
		{
		brush rotateyaw (360 , 1);
		wait 0.5 ;
		brush moveZ(-200,.2);
		wait 0.5;
		brush moveZ(200,.2);
		wait 2;


		}

	}

trap5()
{
	trigger = getEnt("trigger_trap5","targetname");
	brush = getEnt("trap5","targetname");
	brush1 = getEnt("trap6","targetname");
	trigger waittill("trigger");
	while(1)
	{
		brush rotateroll(-100,.2);
		wait 0.5;
		brush rotateroll(100,.2);
		wait 0.5;
		brush1 rotateroll(-100,.2);
		wait 0.5;
		brush1 rotateroll(100,.2);
		wait 5;
	}
}

trap7()
{
	trigger = getEnt("trigger_trap7","targetname");
	brush = getEnt("trap7","targetname");
	bol = getEnt("bol","targetname");
	bol1 = getEnt("bol1","targetname");
	brush1 = getEnt("trap8","targetname");
	trigger waittill("trigger");
	bol enablelinkto();
	bol linkto (brush);
	bol1 enablelinkto();
	bol1 linkto (brush1);
	while(1)
	{
		brush rotateroll(180 , 1);
brush waittill ("movedone");
		brush rotateroll(180 , 1);
brush waittill ("movedone");
		brush1 rotateroll(180 , 1);
brush1 waittill ("movedone");
		brush1 rotateroll(180 , 1);
brush1 waittill ("movedone");
	}
}



trap10()
{
trigger1 = getEnt("d1", "targetname");
trigger2 = getEnt("d2", "targetname");
trigger3 = getEnt("d3", "targetname");
trigger4 = getEnt("d4", "targetname");
trigger5 = getEnt("d5", "targetname");
trigger6 = getEnt("d6", "targetname");
trigger7 = getEnt("d7", "targetname");
a1 = getEnt("a1","targetname");
a2 = getEnt("a2","targetname");
a3 = getEnt("a3","targetname");
a4 = getEnt("a4","targetname");
a5 = getEnt("a5","targetname");
a6 = getEnt("a6","targetname");
a7 = getEnt("a7","targetname");
a8 = getEnt("a8","targetname");
a9 = getEnt("a9","targetname");
a10 = getEnt("a10","targetname");
a11 = getEnt("a11","targetname");
a12 = getEnt("a12","targetname");
a13 = getEnt("a13","targetname");
trigger1 waittill("trigger", player);
trigger2 waittill("trigger", player);
trigger3 waittill("trigger", player);
trigger4 waittill("trigger", player);
trigger5 waittill("trigger", player);
trigger6 waittill("trigger", player);
trigger7 waittill("trigger", player);
{
wait(0.1);
a1 movez(-210,1);
wait(0.1);
a2 movez(-195,1);
wait(0.1);
a3 movez(-180,1);
wait(0.1);
a4 movez(-165,1);
wait(0.1);
a5 movez(-150,1);
wait(0.1);
a6 movez(-135,1);
wait(0.1);
a7 movez(-120,1);
wait(0.1);
a8 movez(-105,1);
wait(0.1);
a9 movez(-90,1);
wait(0.1);
a10 movez(-75,1);
wait(0.1);
a11 movez(-60,1);
wait(0.1);
a12 movez(-45,1);
wait(0.1);
a13 movez(-30,1);
wait(0.1);
}
}

solid()
{
trigger = getEnt("trigger_solid", "targetname");
brush = getEnt("solid","targetname");
trigger waittill("trigger", player);
trigger delete();
{
wait(0.01);
brush rotateroll(360,1);
}
}

trap11()
	{
	trigger = getEnt ("trigger_trap11","targetname");
	brush = getEnt ("trap11","targetname");

	trigger waittill ("trigger",player);
	trigger delete ();

	while (1)
		{
		wait(0.01);
		brush rotateyaw (360 , 5);

		}

	}


	trap15()
{
	trigger = getEnt("trigger_trap15","targetname");
	brush = getEnt("trap15","targetname");
	trigger waittill("trigger");
	{
		brush movex(250,0.1);
		wait 0.5;
		brush movex(-250,0.1);
		wait 0.5;

	}
}

trap16()
{
	trigger = getEnt("trigger_trap16","targetname");
	brush = getEnt("trap16","targetname");
	trigger waittill("trigger");
	while(1)
	{
		brush rotatepitch(180 , 1);
		wait 1;
		brush rotatepitch(180 , 1);
		wait 1;

	}
}

hammer()
{
	trigger = getEnt("trigger_hammer","targetname");
	hammer = getEnt("hammer","targetname");
	hurt = getEnt ("hammerhurt", "targetname");
	trigger waittill("trigger");
	hurt enablelinkto();
	hurt linkto (hammer);
	while(1)
	{
		hammer rotateRoll(360,3);
		wait 1;
	}
	}




trap20()
{
brush = getent("trap20","targetname");
while (1)
{
brush rotateyaw (360 , 5);
wait (0.1);
}
}




finalknife()
{
    level.knife_trig = getEnt( "final1", "targetname");
    jump = getEnt( "final_jumper_teleport", "targetname" );
    acti = getEnt( "final_activator_teleport", "targetname" );

    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
			continue;
        if( !isDefined( level.knife_trig ) )
            return;

				level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );


        level.sniper_trig delete();
        level.lata_trig delete();
		level.old_trig delete();
		level.race_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "deserteagle_mp" ); //jumper weapon
		player setWeaponAmmoClip( "deserteagle_mp", 0 );
		player setweaponammostock( "deserteagle_mp", 0 );
		player thread superpowers();
	if( isDefined( level.activ ) && isAlive( level.activ ) )
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );
level.activ thread superpowers();
        wait 0.05;
        player switchToWeapon( "deserteagle_mp" ); //activator weapon
        level.activ SwitchToWeapon( "deserteagle_mp" );
        iPrintlnBold( " ^6" + player.name + " ^7 HAS ENTERED KNIFE^1!" );     //change to what you want it to be
        				ambientstop ( 1 );
ambientPlay("blue");
						player freezeControls(true);
						level.activ freezeControls(true);
            wait 2;
					player freezeControls(false);
					 level.activ freezeControls(false);
		while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}


finalsniper()
{
    level.sniper_trig = getEnt( "final2", "targetname");
    jump = getEnt( "final_jumper_teleport1", "targetname" );
    acti = getEnt( "final_activator_teleport1", "targetname" );

    while(1)
    {
        level.sniper_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
			continue;
        if( !isDefined( level.sniper_trig ) )
            return;

        level.knife_trig delete();
        level.lata_trig delete();
		level.old_trig delete();
		level.race_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "lol_remington700_mp" ); //jumper weapon
		player GiveMaxAmmo("lol_remington700_mp");
	if( isDefined( level.activ ) && isAlive( level.activ ) )
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "lol_remington700_mp" );
		level.activ GiveMaxAmmo("lol_remington700_mp");
        wait 0.05;
        player switchToWeapon( "lol_remington700_mp" ); //activator weapon
        level.activ SwitchToWeapon( "lol_remington700_mp" );
        iPrintlnBold( " ^6" + player.name + " ^5 HAS ENTERED SNIPER^1!" );     //change to what you want it to be
        				ambientstop ( 1 );
ambientPlay("blue");
						player freezeControls(true);
						level.activ freezeControls(true);
            wait 2;
					player freezeControls(false);
											level.activ freezeControls(false);

		while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

final3()
{
	 level.lata_trig = getEnt( "final3", "targetname");
	 jump = getEnt( "final_jumper_teleport2", "targetname" );
	 acti = getEnt( "final_activator_teleport2", "targetname" );

	 while(1)
	 {
		level.lata_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
			continue;
		if( !isDefined( level.lata_trig ) )
			return;

		level.knife_trig delete();
		level.sniper_trig delete();
		level.old_trig delete();
		level.race_trig delete();

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "s1ck_m14_mp" );
		player GiveMaxAmmo("s1ck_m14_mp");
		if( isDefined( level.activ ) && isAlive( level.activ ) )
		{
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "s1ck_crossbow_mp" );
			level.activ GiveMaxAmmo("s1ck_crossbow_mp");
			wait 0.05;
			level.activ SwitchToWeapon( "s1ck_crossbow_mp" );
		}
		wait 0.05;
		player switchToWeapon( "s1ck_m14_mp" );
		iPrintlnBold( " ^6" + player.name + " ^8 HAS ENTERED LIGHTHOUSE RUSH^1!" );
ambientstop ( 1 );
ambientPlay("blue");
            wait 2;

			wait 1;
	 }
 }



finalold()
{
    level.old_trig = getEnt( "final4", "targetname");
    jump = getEnt( "final_jumper_teleport4", "targetname" );

    while(1)
    {
        level.old_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
			continue;
        if( !isDefined( level.old_trig ) )
            return;

        level.knife_trig delete();
        level.lata_trig delete();
		level.sniper_trig delete();
		level.race_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );

        wait 0.05;
        iPrintlnBold( " ^6" + player.name + " ^5 HAS ENTERED OLD^1!" );     //change to what you want it to be
            wait 2;


            wait 1;
    }
}

finalrace()
{
    level.race_trig = getEnt( "final5", "targetname");
    jump = getEnt( "final_jumper_teleport5", "targetname" );
    acti = getEnt( "final_activator_teleport5", "targetname" );
	finishacti = getEnt ( "finishactivator", "targetname");



    while(1)
    {

        level.race_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
			continue;
        if( !isDefined( level.race_trig ) )
            return;

        level.knife_trig delete();
        level.lata_trig delete();
		level.old_trig delete();
		level.sniper_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
		player thread superpowers1();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );
		level.activ thread superpowers1();
        wait 0.05;
        iPrintlnBold( " ^6" + player.name + " ^5 HAS ENTERED RACE^1!" );     //change to what you want it to be

						player freezeControls(true);
						level.activ freezeControls(true);
							iPrintLnBold( "^1>> 3 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^32 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^21 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^2Start ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^2Run ASAP to the end ^1<<" );
					player freezeControls(false);
											level.activ freezeControls(false);
											        				ambientstop ( 1 );
ambientPlay("blue");








while( isAlive( player ) && isDefined( player ) )
wait 1;


}
}


kill1()
{
finishjump = getEnt ( "finishjumper", "targetname");

while (1)
{
finishjump waittill ("trigger", player);
level.activ FinishPlayerDamage(player, player, 99999, 0, "MOD_PISTOL_BULLET", "deserteagle_mp", level.activ.origin, level.activ.angles, "head", 0);
wait 1;
musicPlay("head");
wait 2;
musicstop ( 1 );
}
}









