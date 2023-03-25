//map by:Lifezor
//script by:Lifezor
//mp_dr_skii

main()
{
	//maps\mp\_load::main();

	level.fire1 = loadFX("fire/firelp_med_pm");
	level.smoke1 = loadFX("smoke/car_damage_blacksmoke");

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	// setdvar("g_speed" ,"190");
    // setdvar("dr_jumpers_speed" ,"1");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	playLoopedFX(level.fire1, 0.05, (-1968,480,-144));
	playLoopedFX(level.smoke1, 0.05, (-1960,480,376));
	playLoopedFX(level.fire1, 0.05, (-1008,-168,-168));
	playLoopedFX(level.fire1, 0.05, (-1008,168,-168));

	thread welcome();
	thread creds();
	thread skiiele();
	thread startdoor();
	thread tele1();
	thread eles();
	thread sniper();
	thread knife();
	thread traps();
	thread bounce();
	thread bouncetps();
	thread bouncewep();
	thread hardsecret();
	thread secretstuff();
	thread musicshit();
	thread mustamies();

	precacheItem ("deserteaglegold_mp");

	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
    addTriggerToList( "trap5_trig" );
	addTriggerToList( "trap6_trig" );

}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

welcome()
{
	level waittill("round_started");
	wait 0.5;
	iPrintLnBold("mp_dr_skii By: ^5Lifezor");
}

creds()
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
	self.logoText.fontScale = 1.6;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5->^4Map Made By Lifezor^5<-");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5->^4Steam:/id/LfezR^5<-");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

skiiele()
{
	brush=getent("skiiele", "targetname");
	trig=getent("skiiele_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		wait 5;
		brush movex(1296,5,1.5,1.5);
		wait 5.1;
		brush movez(-100,3);
		wait 0.1;
		brush movex(2850,7,1.5,1.5);
		wait 16;
		brush movex(-2850,7,1.5,1.5);
		wait 7.1;
		brush movez(100,3);
		wait 0.1;
		brush movex(-1296,5,1.5,1.5);
		wait 10;
	}
}

startdoor()
{
	door=getent("startdoor", "targetname");
	level waittill("round_started");
	wait 5;
	door delete();
}

tele1()
{
    trig = getEnt("tele1", "targetname");
    target = getEnt("tele1_orig", "targetname");

    while(1)
    {
		trig waittill("trigger", player);

            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

eles()
{
	thread ele1();
	thread ele2();
	thread actiele1();
	thread actitele1();
}

ele1()
{
	ele1=getent("ele2", "targetname");
	ele2=getent("ele3", "targetname");
	ele3=getent("ele4", "targetname");
	trig=getent("ele2move", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		wait 1.1;
		ele1 movex(-632,1);
		wait 1.1;
		ele1 movex(632,1);
		wait 1.1;
		ele2 movex(-632,1);
		wait 1.1;
		ele2 movex(632,1);
		wait 1.1;
		ele3 movex(-632,1);
		wait 1.1;
		ele3 movex(632,1);
		wait 1.1;
	}
}

ele2()
{
	ele4=getent("ele5", "targetname");
	ele5=getent("ele6", "targetname");
	ele6=getent("ele7", "targetname");
	trig=getent("ele3move", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		wait 1.1;
		ele4 movex(-632,1);
		wait 1.1;
		ele4 movex(632,1);
		wait 1.1;
		ele5 movex(-632,1);
		wait 1.1;
		ele5 movex(632,1);
		wait 1.1;
		ele6 movex(-632,1);
		wait 1.1;
		ele6 movex(632,1);
		wait 1.1;
	}
}

sniper()
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "sniperplayer", "targetname" );
     sacti = getEnt( "sniperacti", "targetname" );

	 if( !isDefined( level.sniper_trig ) )
         return;

	 while(1)
	 {
		level.sniper_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
			continue;

		if(!isdefined(level.firstenter))
			level.firstenter=false;

		if(level.firstenter==false)
		{
		 level.knife_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.firstenter=true;
		}
			level.activ freezeControls(1);
			player FreezeControls(1);

			player SetPlayerAngles( sjump.angles );
			player setOrigin( sjump.origin );
			level.activ setPlayerangles( sacti.angles );
			level.activ setOrigin( sacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();

			level.activ giveweapon( "m40a3_mp");
			player giveweapon( "m40a3_mp");
			player switchToWeapon( "m40a3_mp" );
			level.activ SwitchToWeapon( "m40a3_mp" );
			player giveMaxAmmo( "m40a3_mp" );
			level.activ giveMaxAmmo( "m40a3_mp" );

			level.activ giveweapon( "remington700_mp");
			player giveweapon( "remington700_mp");
			player switchToWeapon( "remington700_mp" );
			level.activ SwitchToWeapon( "remington700_mp" );
			player giveMaxAmmo( "remington700_mp" );
			level.activ giveMaxAmmo( "remington700_mp" );

			level.activ freezeControls(1);
			player FreezeControls(1);

					noti = SpawnStruct();
					noti.titleText = (player.name + "^3Entered^5Sniper ^2Fight!");
					noti.notifyText = level.activ.name + " ^1VS^5 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);

					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

			wait 2;

			level.activ FreezeControls(0);
			player FreezeControls(0);

			wait 0.1;

			while(isAlive(player))
				wait 1;

		}
}

knife()
{
     level.knife_trig = getEnt( "knife", "targetname");
     kjump = getEnt( "knifeplayer", "targetname" );
     kacti = getEnt( "knifeacti", "targetname" );

	if( !isDefined( level.knife_trig ) )
         return;

	 while(1)
	 {
		level.knife_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
			continue;

		if(!isdefined(level.firstenter))
			level.firstenter=false;

		if(level.firstenter==false)
		{
		 level.sniper_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.firstenter=true;
		}
			level.activ freezeControls(1);
			player FreezeControls(1);

			player SetPlayerAngles( kjump.angles );
			player setOrigin( kjump.origin );
			level.activ setPlayerangles( kacti.angles );
			level.activ setOrigin( kacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();

			level.activ giveweapon( "knife_mp");
			player giveweapon( "knife_mp");
			player switchToWeapon( "knife_mp" );
			level.activ SwitchToWeapon( "knife_mp" );

			level.activ freezeControls(1);
			player FreezeControls(1);

					noti = SpawnStruct();
					noti.titleText = (player.name + "^3Entered ^5Knife ^2Fight.");
					noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);

					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

			wait 2;

			level.activ FreezeControls(0);
			player FreezeControls(0);

			wait 0.1;

			while(isAlive(player))
				wait 1;

		}
}

actiele1()
{
    trig=getent("actimove1", "targetname");
    ele=getent("actiele", "targetname");

    trig enableLinkTo();
    trig linkTo(ele);
    {
        trig waittill("trigger", player);
        ele movex(-1344,3);
        ele waittill("movedone");
        wait 0.5;
        trig waittill("trigger", player);
        ele movex(-1272,3);
        ele waittill("movedone");
        wait 0.5;
        trig waittill("trigger", player);
        ele movex(-5112,6);
        ele waittill("movedone");
        wait 0.5;
        trig waittill("trigger", player);
        ele movex(-1680,6);
        ele waittill("movedone");
        wait 0.5;
        trig waittill("trigger", player);
        ele movex(-700,2);
        trig delete();
    }
}

actitele1()
{
    trig = getEnt("actitele_trig", "targetname");
    target = getEnt("actitele1", "targetname");

    while(1)
    {
		trig waittill("trigger", player);

            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

traps()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
}

trap1()
{
	spin1=getent("spin1", "targetname");
	spin2=getent("spin2", "targetname");
	trig=getent("trap1_trig", "targetname");
	trig waittill ("trigger", player);
	trig delete();

	while(1)
	{
		spin1 rotateyaw(360,1);
		wait 1.5;
		spin1 rotateroll(180,0.5);
		wait 3;
		spin2 rotateyaw(-360,1);
		wait 1.5;
		spin2 rotateroll(-180,0.5);
		wait 3;
	}
}

trap2()
{
	lift1=getent("drop1", "targetname");
	lift2=getent("drop2", "targetname");
	trig=getent("trap2_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		lift1 rotateto((60,0,0),1.5,1);
		wait 2;
		lift1 rotateto((0,0,0),1.5,1);
		wait 0.5;
		lift2 rotateto((60,0,0),1.5,1);
		wait 2;
		lift2 rotateto((0,0,0),1.5,1);
		wait 3;
	}
}

trap3()
{
	trig=getent("trap3_trig", "targetname");
	brush=getent("ground1", "targetname");
	brush2=getent("ground2", "targetname");
	brush3=getent("ground3", "targetname");
	brush4=getent("ground4", "targetname");
	brush5=getent("ground5", "targetname");
	brush6=getent("ground6", "targetname");
	brush7=getent("ground7", "targetname");
	brush8=getent("ground8", "targetname");
	trig waittill ("trigger", player);
	trig delete();

	while(1)
        {
         brush movez(-390,0.5);
         brush2 movez(-390,0.5);
		 brush6 movez(-390,0.5);
		 brush8 movez(-390,0.5);
         wait 4;
         brush3 movez(-390,0.5);
         brush4 movez(-390,0.5);
		 brush5 movez(-390,0.5);
		 brush6 movez(-390,0.5);
         wait 5;
         brush2 movez(390,0.5);
         brush movez(390,0.5);
		 brush6 movez(390,0.5);
		 brush8 movez(390,0.5);
         wait 3;
         brush4 movez(390,0.5);
		 brush3 movez(390,0.5);
		 brush6 movez(390,0.5);
		 brush5 movez(390,0.5);
		 wait 4;
        }
}

trap4()
{
	trig=getent("trap4_trig", "targetname");
	spinner=getent("spinner", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		spinner rotatepitch(360,5,1.5,1.8);
		wait 12;
	}
}

trap5()
{
	trig=getent("trap5_trig", "targetname");
	spinbounce1=getent("spinbounce1", "targetname");
	spinbounce2=getent("spinbounce2", "targetname");
	trig waittill ("trigger", player);
	trig delete();

	while(1)
	{
		spinbounce1 rotateyaw(720,5,1.5,1.5);
		wait 6;
		spinbounce2 rotateyaw(-720,5,1.5,1.5);
		wait 6;
	}
}

trap6()
{
	trig=getent("trap6_trig", "targetname");
	ud1=getent("updown1", "targetname");
	ud2=getent("updown2", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		ud1 movez(40,0.3);
		ud2 movez (-40,0.3);
		wait 0.4;
		ud1 movez(-40,0.3);
		ud2 movez(40,0.3);
		wait 0.4;
	}
}

    bounce()
    {
         level.bounce_trig = getEnt( "bounce", "targetname");
         bjumper = getEnt( "jumpb", "targetname" );
         bacti = getEnt( "actib", "targetname" );

            if( !isDefined( level.bounce_trig ) )
             return;

             while(1)
             {
                    level.bounce_trig waittill( "trigger", player );
                    if(!player sr\api\_deathrun::order())
			continue;

                            if(!isdefined(level.firstenter))
                            level.firstenter=false;

                    if(level.firstenter==false)
                    {
                     level.sniper_trig delete();
                     level.knife_trig delete();
					 level.old_trig delete();
                     level.firstenter=true;
                    }
                            level.activ freezeControls(1);
                            player FreezeControls(1);

                            player SetPlayerAngles( bjumper.angles );
                            player setOrigin( bjumper.origin );
                            level.activ setPlayerangles( bacti.angles );
                            level.activ setOrigin( bacti.origin );

							                    player takeallweapons();
                    player GiveWeapon( "knife_mp" );
            player SwitchtoWeapon( "knife_mp" );
            level.activ takeallweapons();
                    level.activ GiveWeapon( "knife_mp" );
            level.activ SwitchtoWeapon( "knife_mp" );


                            level.activ freezeControls(1);
                            player FreezeControls(1);

                                            noti = SpawnStruct();
                                            noti.titleText = (player.name + "Has Chosen Bounce Room!");
                                            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                            noti.duration = 6;
                                            noti.glowcolor = (0, 0, 1.0);

                                            players = getEntArray("player", "classname");
                                            for(i=0;i<players.size;i++)
                                                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

                            wait 2;

                            level.activ FreezeControls(0);
                            player FreezeControls(0);

                            wait 0.1;

                            while(isAlive(player))
                                    wait 1;

                    }
    }

bouncetps()
{
	thread bounceactitp();
	thread bounceplayertp();
}

bounceactitp()
{
	trig = getEnt("bounceactitp", "targetname");
	target = getEnt("bounceactiside_orig", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

bounceplayertp()
{
	trig = getEnt("bounceplayertp", "targetname");
	target = getEnt("bounceplayerside_orig", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

bouncewep()
{
	trig = getEnt("givewep", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player takeallweapons();
			player giveweapon( "m40a3_mp");
			player giveMaxAmmo( "m40a3_mp");
			player switchToWeapon( "m40a3_mp");
			player giveweapon( "deserteaglegold_mp");
			player giveMaxAmmo( "deserteaglegold_mp");
		}
	}
}

hardsecret()
{
	door=getent("harddoor","targetname");
	trig1=getent("secrethit1","targetname");
	trig2=getent("secrethit2","targetname");
	trig3=getent("secrethit3", "targetname");
	trig4=getent("secrethit4", "targetname");
	while(1)
	{
		trig1 waittill("trigger", player);
		iprintlnbold("^51 Of 4..");
		trig1 delete();
		trig2 waittill("trigger", player);
		iPrintLnBold("^52 Of 4..");
		trig2 delete();
		trig3 waittill("trigger",player);
		iPrintLnBold ("^53 Of 4..");
		trig3 delete();
		trig4 waittill("trigger", player);
		door notsolid();
		iPrintLnBold("^54 Of 4..");
		wait 0.5;
		iPrintLnBold("^1Something happened..?");
		trig4 delete();
	}
}

secretstuff()
{
	thread secretenter();
	thread respawn1();
	thread respawn2();
	thread secretend();
}

secretenter()
{
	trig = getEnt("secretenter", "targetname");
	target = getEnt("secretenter_origin", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
			player iPrintLnBold("Welcome^2!");
			player giveweapon("deserteaglegold_mp");
			player giveMaxAmmo("deserteaglegold_mp");
		}
	}
}

respawn1()
{
	trig = getEnt("respawn1", "targetname");
	target = getEnt("respawn1_origin", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

respawn2()
{
	trig = getEnt("respawn2", "targetname");
	target = getEnt("respawn2_origin", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

secretend()
{
	trig = getEnt("secretend", "targetname");
	target = getEnt("secretend_origin", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
			//iPrintLnBold(player.name "Finished ^5Secret^7!");
			player braxi\_rank::giveRankXP("", 200);
		}
	}
}

musicshit()
{
	x = randomint(4);

		if(x == 0)
		{
			ambientplay("skiisong1");
			iPrintLn("AlunaGeorge - I'm In Control");
		}
		if(x == 1)
		{
			ambientplay("skiisong2");
			iPrintLn("Rebourne & Wasted Penguinz - Univerze");
		}
		if(x == 2)
		{
			ambientplay("skiisong3");
			iPrintLn("Ti-Mo - Howling At The Moon");
		}
		if(x == 3)
		{
			ambientplay("skiisong4");
			iPrintLn("X-Pander - Rampage");
		}
}

mustamies()
{
	trig=getent("mustamies", "targetname");
	trig waittill("trigger", player);
	iPrintLnBold("Feels Like ^0MUSTAMIES!");
	ambientPlay("skiisong5");
}