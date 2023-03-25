main()
{
	maps\mp\_load::main();

	addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
    addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
    addTriggerToList( "trap6_trig" );
	addTriggerToList( "trap7_trig" );
    addTriggerToList( "trap8_trig" );

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	ambientPlay("ambient4");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	precacheItem( "m40a3_acog_mp" );
	PreCacheItem( "uzi_mp" );
	PreCacheItem( "m4_mp" );
	PreCacheItem( "ak47_mp" );
	PreCacheItem( "g3_mp" );
	PreCacheItem( "m60e4_mp" );
	PreCacheItem( "p90_mp" );
	PreCacheItem( "barrett_mp" );
	PreCacheItem( "g36c_silencer_mp" );
	PreCacheItem( "brick_blaster_mp" );
	PreCacheItem( "skorpion_silencer_mp" );
	PreCacheItem( "saw_grip_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "winchester1200_mp" );
	precacheItem( "saw_grip_mp" );
	precacheItem( "mp44_mp" );
	precachemodel( "cs_monitor1" );
	PreCacheShellShock( "tankblast");

	// if( getDvar( "net_ip" ) == "91.121.54.64" || getDvar( "net_ip" ) == "37.59.133.158"){while(1) { iprintlnbold("not for you"); wait 1; } }

	thread main_door();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread fall();
	thread roll();
	thread xp();
	thread oldtele();
	thread sniperroom();
	thread pistolroom();
	thread kniferoom();
	thread knifestuff();
	thread credit();
	thread secrettele();
	thread secretteleback();
	thread actiweapon();
	thread terror();
	thread secret2();
	thread book1();
	thread book2();
	thread book3();
	thread book4();
	thread book5();
	thread book6();
	thread book7();
	thread book8();
	thread book9();
	thread dunk_acti_trig();
	thread dunk_jump_trig();
	thread dunkroom();
	thread dunk_move1();
	thread dunk_move2();
	thread shortcut();
	thread trap8();
	thread acti_ak();

}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}


///////////////////////////////////////////////////////////////////////////


main_door()
{
	main_doorb  =getent( "main_doorb", "targetname" );
	main_doore  =getent( "main_doore", "targetname" );
	main_doora  =getent( "main_doora", "targetname" );
	main_doorc  =getent( "main_doorc", "targetname" );
	main_shot  =getent( "main_shot", "targetname" );

	main_shot enablelinkto();
	main_shot linkto (main_doorb);

	wait 15;
	main_doorb movez (-130,2.5);
	main_doora movez (-130,2.5);
	main_doorc movez (145,3);
	main_doore movez (145,3);
	iPrintLnBold("^5S^7tart ^5D^7oor ^5O^7pened");
	main_doorb waittill ("movedone");
	main_doore waittill ("movedone");
	main_doora waittill ("movedone");
	main_doorc waittill ("movedone");
}


//////////////////////////////////////////////////////////////////////////////////


trap1()
{
	trig = getEnt ("trap1_trig", "targetname");
	a = getEnt ("trap1_a", "targetname");

	trig waittill ("trigger");
	trig delete();

	while (1)
	{
		a rotateroll (360, 7);
		wait 3;
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap2()
{
	trig2 = getent ("trap2_trig","targetname");
	brush_5 = getent ("brush5", "targetname");
	brush_6 = getent ("brush6", "targetname");

	trig2 waittill ("trigger" , player );
	trig2 delete ();
	{
		brush_5 movey ( 96 , 0.5 );
		brush_6 movey ( -96 , 0.5 );
		wait 13;
		brush_5 movey ( -96 , 2.5 );
		brush_6 movey ( 96 , 2.5 );
		wait 4.5 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap3()
{
	trap3 =getent("trap3","targetname");
	trig3 =getent("trap3_trig","targetname");
	trap3_caulk =getent("trap3_caulk","targetname");

	trap3_caulk enablelinkto();
	trap3_caulk linkto (trap3);

	trig3 waittill("trigger");
	trig3 delete();
	{
		trap3 movez (-344,2);
		trap3 waittill ("movedone");
		wait 13 ;
		trap3 movez (344,2);
		trap3 waittill ("movedone");
		wait 4.5 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


roll()
{
	omg = getent("death","targetname");

	while(1)
	{
		omg rotateyaw (-360,4.5);
		wait 1 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap4()
{
	trig4 = getEnt("trap4_trig", "targetname");
	trap4a = getEnt("trap4_a", "targetname");
	trap4b = getEnt("trap4_b", "targetname");
	trap4c = getEnt("trap4_c", "targetname");
	trap4d = getEnt("trap4_d", "targetname");

	trig4 waittill("trigger");
	trig4 delete();

	possibility = randomIntRange(0,11);
	if(possibility == 0)
	{
		trap4a hide();
		trap4a notSolid();
		trap4c hide();
		trap4c notSolid();
	}

	if(possibility == 1)

	{
		trap4b hide();
		trap4b notSolid();
		trap4d hide();
		trap4d notSolid();
	}

	if(possibility == 2)

	{
		trap4a hide();
		trap4c hide();
		trap4c notSolid();
		trap4b notSolid();
	}

	if(possibility == 3)

	{
		trap4b hide();
		trap4d hide();
		trap4d notSolid();
		trap4a notSolid();
	}

	if(possibility == 4)

	{
		trap4d hide();
		trap4c notSolid();
		trap4b hide();
		trap4b notSolid();
	}

	if(possibility == 5)

	{
		trap4c hide();
		trap4d notSolid();
		trap4a hide();
		trap4a notSolid();
	}

	if(possibility == 6)

	{
		trap4c hide();
		trap4d notSolid();
		trap4b hide();
		trap4b notSolid();
	}

	if(possibility == 7)

	{
		trap4d hide();
		trap4a notSolid();
		trap4a hide();
		trap4c notSolid();
	}

	if(possibility == 8)

	{
		trap4b hide();
		trap4b notSolid();
		trap4c hide();
		trap4c notSolid();
	}

	if(possibility == 9)

	{
		trap4a hide();
		trap4a notSolid();
		trap4d hide();
		trap4d notSolid();
	}

	if(possibility == 10)

	{
		trap4b notSolid();
		trap4c notSolid();
	}

	if(possibility == 11)

	{
		trap4a notSolid();
		trap4d notSolid();
	}
}


//////////////////////////////////////////////////////////////////////////////////


credit()
{
	wait(20);
	thread drawInformation( 800, 0.8, 1, "Have Fun :) " );
	wait(4);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (1, 1, 1);
	hud.font = "objective";
	hud.glowColor = (0, 0.570, 1);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}


//////////////////////////////////////////////////////////////////////////////////


trap5()
{
	trig5 = getent("trap5_trig", "targetname");
	trap5 = getent( "trap5", "targetname" );

	trig5 waittill ("trigger");
	trig5 delete();

	trap5 notSolid();
	wait(8);
	trap5 Solid();
}


//////////////////////////////////////////////////////////////////////////////////


secrettele()
{
	trig_secret=getent("trigger_secret","targetname");
	entry=getent("secretentry","targetname");
	while(1)
	{
		trig_secret waittill("trigger", player);
		player SetOrigin( entry.origin );
		player setplayerangles( entry.angles );
	}
}


//////////////////////////////////////////////////////////////////////////////////


secretteleback()
{
	trig_back=getent("sec_back","targetname");
	backmap=getent("backmap","targetname");
	while(1)
	{
		trig_back waittill("trigger", player);
		wait(0.05);
		player SetOrigin( backmap.origin );
		player SetPlayerAngles((0,180,0));
		player GiveWeapon("remington700_mp");
		player SwitchToWeapon("remington700_mp");
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5F^7inished ^5t^7he ^5S^7ecret ^5R^7oom^5!!" );
	}
}


//////////////////////////////////////////////////////////////////////////////////


 actiweapon()
{

    glassbrush=getent("acti_glass","targetname");

	level.currentSequence = 0;
    for( i = 1; i < 5; i++ )
	{
		thread ActiWeapWatchForTrig( getEnt( "acti_weap"+i, "targetname" ), i-1 /*sequence*/ );
	}

	level waittill( "permission granted", player );

    glassbrush movez (-50,3);

    if( isDefined( level.activ ) && player == level.activ )
    {
        level.activ GiveWeapon("ak47_mp");
        level.activ SwitchToWeapon( "ak47_mp" );
    }
}

ActiWeapWatchForTrig( ent, sequence )
{
	level endon( "permission granted" );
	while( isDefined( ent ) )
	{
		ent waittill( "trigger", user );

		if( level.currentSequence != sequence )
		{
			level.currentSequence = 0;
			user iPrintlnBold( "" );
			wait 0.5;
			continue;
		}
		level.currentSequence ++;

		if( level.currentSequence >= 4 )
		{
			user iPrintlnBold( "^5A^7ccess ^5G^7ranted" );
			iPrintLnBold("^5A^7ctivator ^5g^7ot ^5a ^5A^7k47 ^5W^7ooT^5!!");
			level notify( "permission granted", user );
		}

	}
}


//////////////////////////////////////////////////////////////////////////////////


trap6()
{
	trig6 = getent("trap6_trig", "targetname");
	trap6a = getent( "trap6a", "targetname" );

	trig6 waittill ("trigger");
	trig6 delete();

	while(1)
	{
		trap6a rotateyaw (2880,2);
		trap6a movez (192,0.2);
		trap6a waittill ("movedone");
		trap6a movez (-192,0.2);
		trap6a waittill ("movedone");
		trap6a movez (192,0.2);
		trap6a waittill ("movedone");
		trap6a movez (-192,0.2);
		trap6a waittill ("movedone");
		wait(2);
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap7()
{
	trig7 = getent("trap7_trig", "targetname");
	trap7a = getent( "trap7a", "targetname" );

	trig7 waittill ("trigger");
	trig7 delete();

	while(1)
	{
		trap7a rotateyaw (2880,2);
		trap7a movez (192,0.2);
		trap7a waittill ("movedone");
		trap7a movez (-192,0.2);
		trap7a waittill ("movedone");
		trap7a movez (192,0.2);
		trap7a waittill ("movedone");
		trap7a movez (-192,0.2);
		trap7a waittill ("movedone");
		wait(2);
	}
}


//////////////////////////////////////////////////////////////////////////////////


fall()
{
	omg2 = getent("omg2","targetname");

	while(1)
	{
		omg2 notSolid();
		wait 1 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////

oldtele()
{
	level.trig_old=getent("trig_old","targetname");
	spot_old=getent("spot_old","targetname");
	while(1)
	{
		level.trig_old waittill("trigger", player);
		if( !isDefined( level.trig_old ) )
			return;

		level.trig_dunk delete();
		level.trig_pistol delete();
		level.trig_sniper delete();
		level.trig_knife delete();

		player SetOrigin( spot_old.origin );
		player setplayerangles( spot_old.angles );
        wait 0.5 ;
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5e^7ntered ^5O^7ld ^5R^7oom^5!!" );
		wait 1;
	}
}



//////////////////////////////////////////////////////////////////////////////////


Sniperroom()
{
	level.trig_sniper = getEnt( "trig_sniper", "targetname");
	snip_jump = getEnt( "snip_jump", "targetname" );
	snip_acti = getEnt( "snip_acti", "targetname" );

	while(1)
	{
		level.trig_sniper waittill( "trigger", player );
		if( !isDefined( level.trig_sniper ) )
			return;

			level.trig_dunk delete();
			level.trig_pistol delete();
			level.trig_old delete();
			level.trig_knife delete();

		AmbientPlay( "friend" );
		player FreezeControls(1);
		player SetPlayerAngles((0,180,0));
		player setOrigin( snip_jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );
		level.activ FreezeControls(1);
		level.activ setPlayerangles( snip_acti.angles );
		level.activ setOrigin( snip_acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5e^7ntered ^5S^7niper ^5R^7oom^5!!" );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player iprintlnbold("^5F^7IGHT^5!!");
		level.activ iprintlnbold("^5F^7IGHT^5!!");
        while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}


//////////////////////////////////////////////////////////////////////////////////


kniferoom()
{
	level.trig_knife = getEnt( "trig_knife", "targetname");
	knife_jump = getEnt( "knife_jumper", "targetname" );
	knife_acti = getEnt( "knife_acti", "targetname" );

	while(1)
	{
		level.trig_knife waittill( "trigger", player );
		if( !isDefined( level.trig_knife ) )
			return;

		level.trig_dunk delete();
		level.trig_pistol delete();
		level.trig_old delete();
		level.trig_sniper delete();

		AmbientPlay( "friend" );
		player FreezeControls(1);
		player SetPlayerAngles((0,270,0));
		player setOrigin( knife_jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );
		level.activ FreezeControls(1);
		level.activ setPlayerangles( knife_acti.angles );
		level.activ setOrigin( knife_acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5e^7ntered ^5K^7nife ^5R^7oom^5!!" );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player iprintlnbold("^5F^7IGHT^5!!");
		level.activ iprintlnbold("^5F^7IGHT^5!!");
		while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}


//////////////////////////////////////////////////////////////////////////////////


knifestuff()
{
	knife_move1 = getEnt( "knife_move1", "targetname" );
	knife_move2 = getEnt( "knife_move2", "targetname" );

	while(1)
	{
	knife_move1 movez (-100,2);
	wait 10 ;
	knife_move1 movez (100,2);
	wait 5 ;
	knife_move2 movez (-100,2);
	wait 10 ;
	knife_move2 movez (100,2);
	wait 5 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


xp()
{
	trig_xp = getEnt( "xpstuff", "targetname" );

	trig_xp waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 30 );
}


//////////////////////////////////////////////////////////////////////////////////


Pistolroom()
{
	level.trig_pistol = getEnt( "trig_pistol", "targetname");
	pistol_jump = getEnt( "pistol_jump", "targetname" );
	pistol_acti = getEnt( "pistol_acti", "targetname" );

	while(1)
	{
		level.trig_pistol waittill( "trigger", player );
		if( !isDefined( level.trig_pistol ) )
			return;

		level.trig_dunk delete();
		level.trig_old delete();
		level.trig_sniper delete();
		level.trig_knife delete();

		AmbientPlay( "friend" );
		player FreezeControls(1);
		player SetPlayerAngles((0,180,0));
		player setOrigin( pistol_jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "colt45_mp" );
		player giveMaxAmmo( "colt45_mp" );
		level.activ FreezeControls(1);
		level.activ setPlayerangles( pistol_acti.angles );
		level.activ setOrigin( pistol_acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "colt45_mp" );
		level.activ GiveMaxAmmo( "colt45_mp" );
		wait 0.05;
		player switchToWeapon( "colt45_mp" );
		level.activ SwitchToWeapon( "colt45_mp" );
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5e^7ntered ^5P^7istol ^5R^7oom^5!!" );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player iprintlnbold("^5F^7IGHT^5!!");
		level.activ iprintlnbold("^5F^7IGHT^5!!");
        while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}


//////////////////////////////////////////////////////////////////////////////////


terror()
{
	terror = getEnt( "terror", "targetname");

	wait 7 ;
	terror rotateyaw (360,7);
	terror waittill ("rotatedone");
	wait 1 ;
	terror movez (208,5);
	terror rotateyaw (360,5);
	wait 2 ;

	while(1)
	{
		wait 0.5 ;
		terror rotateyaw (360,10);
		wait 0.5 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


secret2()
{
	trig_secret2 = getEnt("trig_secret2","targetname");
	secret2door = getEnt("secret2door","targetname");

	trig_secret2 waittill("trigger",player);
	trig_secret2 delete();

	iPrintlnBold( " ^5S^7ecret ^5R^7oom ^5O^7pened^5!!" );
	secret2door notSolid();
	wait 1 ;
}


//////////////////////////////////////////////////////////////////////////////////


book1()
{
	book1 = getEnt( "book1", "targetname" );
	trig_book1 = getEnt( "trig_book1", "targetname" );

	trig_book1 waittill("trigger", other);
	trig_book1  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book1 moveZ(-50,1);
	book1 rotateYaw(180,1);
	wait 0.7 ;
	book1 moveZ(-50,1);
	book1 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book2()
{
	book2 = getEnt( "book2", "targetname" );
	trig_book2 = getEnt( "trig_book2", "targetname" );

	trig_book2 waittill("trigger", other);
	trig_book2  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book2 moveZ(-50,1);
	book2 rotateYaw(180,1);
	wait 0.7 ;
	book2 moveZ(-50,1);
	book2 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book3()
{
	book3 = getEnt( "book3", "targetname" );
	trig_book3 = getEnt( "trig_book3", "targetname" );

	trig_book3 waittill("trigger", other);
	trig_book3  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book3 moveZ(-50,1);
	book3 rotateYaw(180,1);
	wait 0.7 ;
	book3 moveZ(-50,1);
	book3 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book4()
{
	book4 = getEnt( "book4", "targetname" );
	trig_book4 = getEnt( "trig_book4", "targetname" );

	trig_book4 waittill("trigger", other);
	trig_book4  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book4 moveZ(-50,1);
	book4 rotateYaw(180,1);
	wait 0.7 ;
	book4 moveZ(-50,1);
	book4 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book5()
{
	book5 = getEnt( "book5", "targetname" );
	trig_book5 = getEnt( "trig_book5", "targetname" );

	trig_book5 waittill("trigger", other);
	trig_book5  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book5 moveZ(-50,1);
	book5 rotateYaw(180,1);
	wait 0.7 ;
	book5 moveZ(-50,1);
	book5 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book6()
{
	book6 = getEnt( "book6", "targetname" );
	trig_book6 = getEnt( "trig_book6", "targetname" );

	trig_book6 waittill("trigger", other);
	trig_book6  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book6 moveZ(-50,1);
	book6 rotateYaw(180,1);
	wait 0.7 ;
	book6 moveZ(-50,1);
	book6 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book7()
{
	book7 = getEnt( "book7", "targetname" );
	trig_book7 = getEnt( "trig_book7", "targetname" );

	trig_book7 waittill("trigger", other);
	trig_book7  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book7 moveZ(-50,1);
	book7 rotateYaw(180,1);
	wait 0.7 ;
	book7 moveZ(-50,1);
	book7 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book8()
{
	book8 = getEnt( "book8", "targetname" );
	trig_book8 = getEnt( "trig_book8", "targetname" );

	trig_book8 waittill("trigger", other);
	trig_book8  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book8 moveZ(-50,1);
	book8 rotateYaw(180,1);
	wait 0.7 ;
	book8 moveZ(-50,1);
	book8 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


book9()
{
	book9 = getEnt( "book9", "targetname" );
	trig_book9 = getEnt( "trig_book9", "targetname" );

	trig_book9 waittill("trigger", other);
	trig_book9  delete();

	other braxi\_rank::giveRankXP("kill",5); //Change number of xp u want to earn
	book9 moveZ(-50,1);
	book9 rotateYaw(180,1);
	wait 0.7 ;
	book9 moveZ(-50,1);
	book9 rotateYaw(180,1);
}


//////////////////////////////////////////////////////////////////////////////////


dunkroom()
{
	level.trig_dunk = getEnt( "trig_dunk", "targetname");
	dunk_actitele = getEnt( "dunk_actitele", "targetname" );
	dunk_jumptele = getEnt( "dunk_jumptele", "targetname" );

	while(1)
	{
		level.trig_dunk waittill( "trigger", player );
		if( !isDefined( level.trig_dunk ) )
			return;

		level.trig_pistol delete();
		level.trig_old delete();
		level.trig_sniper delete();
		level.trig_knife delete();

		player SetPlayerAngles( dunk_jumptele.angles );
		player setOrigin( dunk_jumptele.origin );
		player TakeAllWeapons();
		player GiveWeapon( "colt45_mp" );
		player giveMaxAmmo( "colt45_mp" );
		level.activ setPlayerangles( dunk_actitele.angles );
		level.activ setOrigin( dunk_actitele.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "colt45_mp" );
		level.activ GiveMaxAmmo( "colt45_mp" );
		wait 0.05;
		player switchToWeapon( "colt45_mp" );
		level.activ SwitchToWeapon( "colt45_mp" );
		iPrintlnBold( " ^7" + player.name + " ^5h^7as ^5e^7ntered ^5D^7unk ^5R^7oom^5!!" );
                                     while( isAlive( player ) && isDefined( player ) )
			wait 5;
	}
}


//////////////////////////////////////////////////////////////////////////////////


dunk_jump_trig()
{
	dunk_trig_jumper=getent("dunk_trig_jumper","targetname");
	dunk_judoor=getent("dunk_judoor","targetname");
	while(1)
	{
		dunk_trig_jumper waittill("trigger", player);
		player braxi\_rank::giveRankXP("kill",100); //Change number of xp u want to earn
		player iPrintLnBold("^5P^7erfect ^5S^7hot.");
		iPrintLnBold("^5A^7cti ^5G^7oing ^5D^7own^5!!");
		dunk_judoor notsolid();
		wait 1 ;
		dunk_judoor solid();
	}
}


//////////////////////////////////////////////////////////////////////////////////


dunk_acti_trig()
{
	dunk_trig_acti=getent("dunk_trig_acti","targetname");
	dunk_acdoor=getent("dunk_acdoor","targetname");
	while(1)
	{
		dunk_trig_acti waittill("trigger", player);
		player braxi\_rank::giveRankXP("kill",100); //Change number of xp u want to earn
		player iPrintLnBold("^5P^7erfect ^5S^7hot.");
		iPrintLnBold("^5J^7umper ^5G^7oing ^5D^7own^5!!");
		dunk_acdoor notsolid();
		wait 2 ;
		dunk_acdoor solid();
	}
}


//////////////////////////////////////////////////////////////////////////////////


dunk_move1()
{

	dunk_acmove = getEnt ( "dunk_acmove" , "targetname" );
	trig_acti = getEnt ( "dunk_trig_acti" , "targetname" );

	trig_acti enablelinkto();
	trig_acti linkto (dunk_acmove);

	while (1)
	{
	dunk_acmove movey(800,9);
	wait 0.5;
	dunk_acmove movey(-800,9);
	wait 0.5;
	}

}


//////////////////////////////////////////////////////////////////////////////////


dunk_move2()
{

	dunk_acmove2 = getEnt ( "dunk_acmove2" , "targetname" );
	trig_jumper = getEnt ( "dunk_trig_jumper" , "targetname" );

	trig_jumper enablelinkto();
	trig_jumper linkto (dunk_acmove2);

	while (1)
	{
	dunk_acmove2 movey(800,9);
	wait 0.5;
	dunk_acmove2 movey(-800,9);
	wait 0.5;
	}

}


//////////////////////////////////////////////////////////////////////////////////


shortcut()
{
	trig_short = getent ("trig_short","targetname");
	short_move1 = getent ("short_move1", "targetname");
	short_move2 = getent ("short_move2", "targetname");

	trig_short waittill ("trigger" , player );
	trig_short delete ();
	{
		player iPrintLnBold("^5S^7hort^5C^7ut ^5F^7ound^5.");
		wait 1 ;
		player iPrintLnBold("^5Y^7ou ^5H^7ave ^51^75 ^5S^7econds ^5t^7o ^5M^7ove^5.");
		wait 15 ;
		short_move1 movez ( 29 , 4 );
		short_move2 movez ( -29 , 4 );
		short_move1 waittill ("movedone");
		short_move2 waittill ("movedone");
		wait 1 ;
	}
}


//////////////////////////////////////////////////////////////////////////////////


trap8()
{

	trap8_trig = getEnt ( "trap8_trig" , "targetname" );
	dog1 = getEnt ( "dog1" , "targetname" );
	dog1_dmg = getEnt ( "dog1_dmg" , "targetname" );
	dog1_origi = getEnt ( "dog1_origi" , "targetname" );
	dog2 = getEnt ( "dog2" , "targetname" );
	dog2_dmg = getEnt ( "dog2_dmg" , "targetname" );
	dog2_origi = getEnt ( "dog2_origi" , "targetname" );
	dog3 = getEnt ( "dog3" , "targetname" );
	dog3_dmg = getEnt ( "dog3_dmg" , "targetname" );
	dog3_origi = getEnt ( "dog3_origi" , "targetname" );
	dog4 = getEnt ( "dog4" , "targetname" );
	dog4_dmg = getEnt ( "dog4_dmg" , "targetname" );
	dog4_origi = getEnt ( "dog4_origi" , "targetname" );
	dog5 = getEnt ( "dog5" , "targetname" );
	dog5_dmg = getEnt ( "dog5_dmg" , "targetname" );
	dog5_origi = getEnt ( "dog5_origi" , "targetname" );
	dog6 = getEnt ( "dog6" , "targetname" );
	dog6_dmg = getEnt ( "dog6_dmg" , "targetname" );
	dog6_origi = getEnt ( "dog6_origi" , "targetname" );
	dog_door = getEnt ( "dog_door" , "targetname" );

	dog1_dmg enablelinkto();
	dog1_dmg linkto (dog1);
	dog2_dmg enablelinkto();
	dog2_dmg linkto (dog2);
	dog3_dmg enablelinkto();
	dog3_dmg linkto (dog3);
	dog4_dmg enablelinkto();
	dog4_dmg linkto (dog4);
	dog5_dmg enablelinkto();
	dog5_dmg linkto (dog5);
	dog6_dmg enablelinkto();
	dog6_dmg linkto (dog6);

	trap8_trig waittill ("trigger" , player );
	trap8_trig delete();

	while(1)
	{
		dog_door movez(96,2);
		wait 2;
		dog1 movey(-541,2);
		dog2 movey(-541,2);
		dog3 movey(-541,2);
		dog4 movey(-541,2);
		dog5 movey(-541,2);
		dog6 movey(-541,2);
		wait 1;
		dog_door movez(-96,1);
		wait 1;
		dog1 MoveTo( dog1_origi.origin, 0.002 );
		dog2 MoveTo( dog2_origi.origin, 0.002 );
		dog3 MoveTo( dog3_origi.origin, 0.002 );
		dog4 MoveTo( dog4_origi.origin, 0.002 );
		dog5 MoveTo( dog5_origi.origin, 0.002 );
		dog6 MoveTo( dog6_origi.origin, 0.002 );
		wait 5;
	}
}


//////////////////////////////////////////////////////////////////////////////////


acti_ak()
{
	acti_ak = getent("acti_ak", "targetname");

	while(1)
	{
		acti_ak rotateyaw (360,6);
		wait(2);
	}
}


//////////////////////////////////////////////////////////////////////////////////