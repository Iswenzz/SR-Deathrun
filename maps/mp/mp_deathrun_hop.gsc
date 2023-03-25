/*
##############################################################################################
###|   _____   |######/    \#######|  |###|   _______|###|  |#######|  |###|  |######|  |#####
###|  |#####|  |#####/  __  \######|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  |#####|  |####/  /##\  \#####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  |#####|  |###|  |####|  |####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  |####/  /####|  |####|  |####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  ___    /#####|  |####|  |####|  |###|  |###########|   _______   |###|  |######|  |#####
###|  |##\  \######|   ____   |####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  |###\  \#####|  |####|  |####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|  |####\  \####|  |####|  |####|  |###|  |###########|  |#######|  |###|  |######|  |#####
###|__|#####\__|###|__|####|__|####|__|###|__________|###|__|#######|__|###|____________|#####
##############################################################################################

	Map created by: Raichu
	Xfire: hellovin
	Tested by: Raichu, Atggost, Nagyii
	Youtube channel: MetubeGames 
	Version: v1.1
	
	Coming soon: - Hard mode
				 - Jump room (like epicfail)
	
	If you find any bug please report it on xfire, thanks.
*/

#include maps\mp\_utility; /* necessary for simple trigger settings */
main()
{
	maps\mp\_load::main();
	
	/*Weapons*/
	precacheItem("ak47_mp");
	precacheItem("ak74u_mp");
	precacheItem("m4_mp");
	precacheitem("mp44_mp");
	precacheItem("winchester1200_mp");
	precacheItem("m1014_grip_mp");
	precacheItem("rpd_mp");
	precacheItem("p90_silencer_mp");
	precacheItem("deserteaglegold_mp");
	precacheItem("skorpion_mp");
	precacheitem("uzi_silencer_mp");
	precacheItem("rpg_mp");
	/*Snipers*/
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","2200");

		thread control();
}

	control()
	{
		/*Some brush and trigger controll*/
		thread begin_door();
		thread floor();
		thread bounce_weapon_trig();
		thread speedrun_weapon_trig();
		thread sniper_freeze_trig();
		thread end_trig();
		thread end_move();
		
		/*Traps*/
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
		
		/*Final rooms*/
		thread old();
		thread weapons();
		thread rand_weapons();
		thread bounce();
		thread sniper();
		thread knife();
		thread paper_scissors_rock();
		thread speedrun();
		
		/*Secret*/
		thread secret();
		thread secret_end();
		thread secret_weapon();
		thread secret_music();
		thread secret_lift_a();
		thread secret_lift_b();
		thread secret_fail();
		
		/*Trigger-list*/
		addTriggerToList("trap1_trig");
		addTriggerToList("trap2_trig");
		addTriggerToList("trap3_trig");
		addTriggerToList("trap4_trig");
		addTriggerToList("trap5_trig");
		addTriggerToList("trap6_trig");
		addTriggerToList("trap7_trig");
		addTriggerToList("trap8_trig");
		addTriggerToList("trap9_trig");
		addTriggerToList("trap10_trig");
		
		level waittill ("round_ended");
		AmbientStop();
	}
	
	addTriggerToList(name)
	{
		if(!isDefined(level.trapTriggers))
			level.trapTriggers = [];
		level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
	}
	
	ambient_play( music )
	{
		while ( 1 )
		{
			if ( level.wantmusic == 0 )
			{
				level.wantmusic = 1;
				if ( level.nowmusic == 1 )
				{
					ambientStop();
				}
				ambientPlay( music );
			}
			wait .1;
		}
	}
	
	music ( music , art )
	{
		level.wantmusic = 0;
		thread ambient_play( music , art );
		iPrintLn( art );
	}
	
	begin_door()
	{
		trig = getEnt ("begin_door_trig","targetname");
		door = getEnt ("begin_door","targetname");
		door_activator = getEnt ("begin_door_activator","targetname");
		
		trig waittill ("trigger");
		trig delete();
		
		thread music ( "alap" , "^3Now playing: ^2Adam Lambert: Runnin");
		level.nowmusic = 1;
		
		thread doormove( door_activator , 4 );
		thread doormove( door , 5 );
		
		wait 1;
		iPrintLnBold("^4Map created by: ^3Raichu");
		wait 1;
		iPrintLnBold("^4Have fun!");
	}
	
	doormove( door , time )
	{
		door moveZ (-244,time);
	}

	floor()
	{
		thread floor1();
		thread floor2();
		thread floor3();
		thread floor4();
	}
	
	floor1()
	{
		floor_a = getEnt ("floor_lift_a","targetname");
		while(1)
		{
			floor_a moveX (256,2); floor_a waittill("movedone");
			floor_a moveY (-256,2); floor_a waittill("movedone");
			floor_a moveX (-256,2); floor_a waittill("movedone");
			floor_a moveY (256,2); floor_a waittill("movedone");
		}
	}
	
	floor2()
	{
		floor_b = getEnt ("floor_lift_b","targetname");
		while(1)
		{
			floor_b moveY (-256,2); floor_b waittill("movedone");
			floor_b moveX (-256,2); floor_b waittill("movedone");
			floor_b moveY (256,2); floor_b waittill("movedone");
			floor_b moveX (256,2); floor_b waittill("movedone");
		}
	}
	
	floor3()
	{
		floor_c = getEnt ("floor_lift_c","targetname");
		while(1)
		{
			floor_c moveX (-256,2); floor_c waittill("movedone");
			floor_c moveY (256,2); floor_c waittill("movedone");
			floor_c moveX (256,2); floor_c waittill("movedone");
			floor_c moveY (-256,2); floor_c waittill("movedone");
		}
	}
	
	floor4()
	{
		floor_d = getEnt ("floor_lift_d","targetname");
		while(1)
		{
			floor_d moveY (256,2); floor_d waittill("movedone");
			floor_d moveX (256,2); floor_d waittill("movedone");
			floor_d moveY (-256,2); floor_d waittill("movedone");
			floor_d moveX (-256,2); floor_d waittill("movedone");
		}
	}
	
	GetActivator()
	{
		players = getentarray( "player", "classname" );
		for( i = 0 ; i < players.size ; i++)
		{
			player = players[i];
			if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis")
			return player;
		}
		return "Noactivator";
	}
	
	waitdead()
	{
		speedrun = getEnt("speedrun","targetname");
		weapons = getEnt("weapons","targetname");
		r_weapons = getEnt("rand_weap","targetname");
		bounce = getEnt("bounce","targetname");
		sniper = getEnt("sniper","targetname");
		knife = getEnt("knife","targetname");
		old = getEnt("old_trig","targetname");
		p_s_r = getEnt("paper_scissors_rock","targetname");
		trap01 = getEnt("trap1_trig","targetname");
		trap02 = getEnt("trap2_trig","targetname");
		trap03 = getEnt("trap3_trig","targetname");
		trap04 = getEnt("trap4_trig","targetname");
		trap05 = getEnt("trap5_trig","targetname");
		trap06 = getEnt("trap6_trig","targetname");
		trap07 = getEnt("trap7_trig","targetname");
		trap08 = getEnt("trap8_trig","targetname");
		trap09 = getEnt("trap9_trig","targetname");
		trap10 = getEnt("trap10_trig","targetname");
		trap11 = getEnt("trap11_trig","targetname");
		
		speedrun triggerOff();
		knife triggerOff();
		bounce triggerOff();
		sniper triggerOff();
		weapons triggerOff();
		r_weapons triggerOff();
		old triggerOff();
		p_s_r triggerOff();
		trap01 triggerOff();
		trap02 triggerOff();
		trap03 triggerOff();
		trap04 triggerOff();
		trap05 triggerOff();
		trap06 triggerOff();
		trap07 triggerOff();
		trap08 triggerOff();
		trap09 triggerOff();
		trap10 triggerOff();
		trap11 triggerOff();
		
		self common_scripts\utility::waittill_any("death","disconnect");
		activator = GetActivator();
		activator freezeControls(false);
		
		speedrun triggerOn();
		bounce triggerOn();
		sniper triggerOn();
		weapons triggerOn();
		r_weapons triggerOn();
		knife triggerOn();
		old triggerOn();
		p_s_r triggerOn();
		trap01 triggerOn();
		trap02 triggerOn();
		trap03 triggerOn();
		trap04 triggerOn();
		trap05 triggerOn();
		trap06 triggerOn();
		trap07 triggerOn();
		trap08 triggerOn();
		trap09 triggerOn();
		trap10 triggerOn();
		trap11 triggerOn();
	}
	
	waitdead_end()
	{
		trig = getEnt ("end_tele","targetname");		
		trig triggerOff();
		self common_scripts\utility::waittill_any("death","disconnect");
		activator = GetActivator();
		activator freezeControls(false);
		trig triggerOn();
	}
	
	old()
	{
		old = getent("old_trig","targetname");
		jumper = getent(old.target,"targetname");
		acti = getEnt(jumper.target,"targetname");
		while(1)
		{
			old waittill ("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Classic way (OLD)!");
			activator = GetActivator();
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
		}
	}
	
	speedrun()
	{
		speedrun = getEnt("speedrun","targetname");
		jumper = getEnt(speedrun.target,"targetname");
		acti = getEnt(jumper.target,"targetname");
		
		while( 1 )
		{
			speedrun waittill ("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Speedrun!");
			activator = GetActivator();
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);	
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			player takeallweapons();
			activator takeallweapons();
			start_num_down(player,activator);
			activator giveweapon("tomahawk_mp");
			player giveweapon("tomahawk_mp");
			player freezeControls(false);
			activator freezeControls(false);
			player switchtoweapon("tomahawk_mp");
			activator switchtoweapon("tomahawk_mp");
		}
	}
	
	speedrun_weapon_trig()
	{
		weapon = getEnt("speedrun_weapon","targetname");
		while ( 1 )
		{
			weapon waittill ("trigger",faster);
			faster takeallweapons();
			faster giveweapon("ak74u_mp");
			faster switchtoweapon("ak74u_mp");
			iPrintLnBold(faster.name + " ^3Got a weapon!");
		}
	}
	
	rand_weapons()
	{
		weapons = getEnt("rand_weap","targetname");
		jumper = getEnt(weapons.target,"targetname");
		acti = getEnt(jumper.target,"targetname");
		weapon = "tomahawk_mp";
		while(1)
		{
			weapons waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Random-Weapons!");
			activator = GetActivator();
			
			r = randomintrange(1, 13);
			weap = strTok("tomahawk_mp;ak47_mp;ak74u_mp;m4_mp;mp44_mp;winchester1200_mp;m1014_grip_mp;rpd_mp;p90_silencer_mp;deserteaglegold_mp;skorpion_mp;uzi_silencer_mp;rpg_mp",";");
			weapon = weap[r];
		
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			player takeallweapons();
			activator takeallweapons();
			start_num_down(player,activator);
			player giveweapon(weapon);
			activator giveweapon(weapon);
			activator givemaxammo(weapon);
			player givemaxammo(weapon);
			wait .1;
			player switchtoweapon(weapon);
			activator switchtoweapon(weapon);
			player freezeControls(false);
			activator freezeControls(false);
		}
	}
	
	weapons()
	{
		weapons = getent("weapons","targetname");
		jumper = getent(weapons.target,"targetname");
		acti = getent(jumper.target,"targetname");

		weapon = "tomahawk_mp";
		level.weapon_pointer = 0;
		
		while( 1 )
		{
			weapons waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Weapons!");
			activator = GetActivator();
			
			if (level.weapon_pointer != 1)
				weapon = player select(weapons,player,activator);
			
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			player takeallweapons();
			activator takeallweapons();
			start_num_down(player,activator);
			player giveweapon(weapon);
			activator giveweapon(weapon);
			activator givemaxammo(weapon);
			player givemaxammo(weapon);
			wait .1;
			player switchtoweapon(weapon);
			activator switchtoweapon(weapon);
			player freezeControls(false);
			activator freezeControls(false);
		}
	}
	
	select(weapons,player,activator)
	{
		self endon("round_ended");
		self endon("death");
		self endon("disconected");
		
		weapons triggerOn();
		weapons SetHintString("Press ^1F^7 -> Choose Buttons: ^1Granade^7, ^1Shoot^7 -> Select: ^1Knife");
		
		weap = strTok("tomahawk_mp;ak47_mp;ak74u_mp;m4_mp;mp44_mp;winchester1200_mp;m1014_grip_mp;rpd_mp;p90_silencer_mp;deserteaglegold_mp;skorpion_mp;uzi_silencer_mp;rpg_mp;tomahawk_mp",";");
		weapname = strTok("TomaHawk;AK-47;AK74-U;M4;MP44;Winchester1200;M1014(grip);RPD;P90(silencer);DesertEagleGold;Skorpion;UZI(silencer);RPG;TomaHawk",";");
		
		w = 1;
		
		while ( level.weapon_pointer != 1 )
		{
			if ( player AttackButtonPressed() && player istouching( weapons ) )
			{
				w++;
				if ( w == 14 ) w = 1;
				player iPrintLnBold(weapname[w]);
				activator iPrintLnBold(weapname[w]);
			}
			if( player FragButtonPressed() && player istouching( weapons ) )
			{
				w--;
				if ( w == 0 ) w = 13;
				player iPrintLnBold(weapname[w]);
				activator iPrintLnBold(weapname[w]);
			}
			if (player MeleeButtonPressed() && player istouching( weapons ) )
			{
				level.weapon_pointer = 1;
			}
			wait .1;
		}
		iPrintLnBold(player.name + " ^1 selected ^3" + weapname[w] + "^1 fight!");
		weapons triggerOff();
		weapons SetHintString("Weapons room: ^1" + weapname[w]);
		return weap[w];
	}
	
	bounce()
	{
		bounce = getent("bounce","targetname");
		jumper = getent(bounce.target,"targetname");
		acti = getent(jumper.target,"targetname");
		while(1)
		{
			bounce waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Bounce!");
			activator = GetActivator();
			
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
			
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			
			player takeallweapons();
			activator takeallweapons();
			
			start_num_down(player,activator);
			
			activator giveweapon("tomahawk_mp");
			player giveweapon("tomahawk_mp");
			
			player freezeControls(false);
			activator freezeControls(false);
			
			player switchtoweapon("tomahawk_mp");
			activator switchtoweapon("tomahawk_mp");
			
			level.bounce_jumper = 1;
			level.bounce_activator = 1;
			thread bounce_fail(player,activator);
		}
	}
	
	bounce_weapon_trig()
	{	
		get_weapon_trigger = getEnt("bounce_weapon","targetname");
		while(1)
		{
			get_weapon_trigger waittill ("trigger",pro_jumper);
			pro_jumper takeallweapons();
			pro_jumper giveweapon("remington700_mp");
			pro_jumper switchtoweapon("remington700_mp");
			iPrintLnBold(pro_jumper.name + " ^3Got a sniper!");
		}
	}
	
	bounce_fail(jumper,activator)
	{
		self endon("round_ended");
		self endon("death");
		self endon("disconected");
		
		fail = getEnt ("bounce_fail_trig","targetname");
		jumper_to = getEnt (fail.target,"targetname");
		activator_to = getEnt (jumper_to.target,"targetname");
		jumper_low = getEnt (activator_to.target,"targetname");
		activator_low = getEnt (jumper_low.target,"targetname");
		
		once_knife = 0;
		once_acti_low = 0;
		once_jumper_low = 0;
		
		while ( 1 )
		{
			fail waittill ("trigger",player);
			if ( player == jumper )
			{
				jumper setorigin(jumper_to.origin);
				jumper setPlayerAngles(jumper_to.angles);
				jumper iPrintLnBold("^1You fail: ^3" + level.bounce_jumper + "/20");
				level.bounce_jumper++;
				if ( level.bounce_jumper == 21 )
				{
					jumper setorigin(jumper_low.origin);
					jumper setPlayerAngles(jumper_low.angles);
					jumper freezeControls(true);
				}
			}
			if ( player == activator )
			{
				activator setorigin(activator_to.origin);
				activator setPlayerAngles(activator_to.angles);
				activator iPrintLnBold("^1You fail: ^3" + level.bounce_activator + "/20");
				level.bounce_activator++;
				if ( level.bounce_activator == 21 )
				{
					activator setorigin(activator_low.origin);
					activator setPlayerAngles(activator_low.angles);
					activator freezeControls(true);
				}
			}
			if ( level.bounce_activator == 21 && once_acti_low == 0 )
			{
				once_acti_low = 1;
				player iPrintLnBold ("^1Go, Go, Go, activator now can't move!!!");
			}
			if ( level.bounce_jumper == 21 && level.bounce_activator < 21 && once_jumper_low == 0)
			{
				once_jumper_low = 1;
				activator iPrintLnBold ("^1Your current enemy is too low, he will die within 5 sec!");
				wait 5;
				player suicide();
			}
			if ( once_knife == 0 && level.bounce_jumper == 21 && level.bounce_activator == 21 )
			{
				once_knife = 1;
				knife_pointer = 1;
				player iPrintLnBold("^3Why choose bounce room if you didn't finish it?!?!");
				iPrintLnBold(activator.name + " ^1and " + player.name + "^1 are too low for bounce room!");
				knife = getent("knife","targetname");
				jumper_knife = getent(knife.target,"targetname");
				acti_knife = getent(jumper_knife.target,"targetname");

				player thread waitdead();
				iPrintLnBold(player.name + " ^1 selected Knife!");
				activator = GetActivator();
				player freezeControls(true);
				player setorigin(jumper_knife.origin);
				player setPlayerAngles(jumper_knife.angles);
					
				activator freezeControls(true);
				activator setorigin(acti_knife.origin);
				activator setPlayerAngles(acti_knife.angles);
				
				player takeallweapons();
				activator takeallweapons();
				
				start_num_down(player,activator);
				
				activator giveweapon("tomahawk_mp");
				player giveweapon("tomahawk_mp");
				
				player freezeControls(false);
				activator freezeControls(false);
				player switchtoweapon("tomahawk_mp");
				activator switchtoweapon("tomahawk_mp");
			}
			wait .1;
		}
	}
	
	start_num_down(player,activator)
	{
		player iPrintLnBold("^13");
		activator iPrintLnBold("^13");
		wait 1;
		player iPrintLnBold("^12");
		activator iPrintLnBold("^12");
		wait 1;
		player iPrintLnBold("^11");
		activator iPrintLnBold("^11");
		wait 1;
		player iPrintLnBold("^2Fight!!!.");
		activator iPrintLnBold("^2Fight!!!.");
	}
	
	sniper()
	{
		sniper = getent("sniper","targetname");
		jumper = getent(sniper.target,"targetname");
		acti = getent(jumper.target,"targetname");
		while(1)
		{
			sniper waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Sniper!");
			activator = GetActivator();
			
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
				
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			
			player takeallweapons();
			activator takeallweapons();
			
			start_num_down(player,activator);

			player giveweapon("m40a3_mp");
			activator giveweapon("m40a3_mp");
			player giveweapon("remington700_mp");
			activator giveweapon("remington700_mp");	
			
			activator givemaxammo("m40a3_mp");
			player givemaxammo("m40a3_mp");
			activator givemaxammo("remington700_mp");
			player givemaxammo("remington700_mp");
			wait .1;
			player switchtoweapon("m40a3_mp");
			activator switchtoweapon("m40a3_mp");
			
			player freezeControls(false);
			activator freezeControls(false);
		}
	}
	
	sniper_freeze_trig()
	{
		fail = getEnt("sniper_fail","targetname");
		fail_on = getEnt(fail.target,"targetname");
		fail_off = getEnt(fail_on.target,"targetname");
		
		while ( 1 )
		{
			fail waittill ("trigger", low);
			low freezeControls(true);
			low setorigin(fail_on.origin);
			low setPlayerAngles(fail_on.angles);
			low iPrintLnBold ("^4Wait 3 seconds!");
			wait 3;
			low setorigin(fail_off.origin);
			low setPlayerAngles(fail_on.angles);
			low iPrintLnBold ("^4You can move again!");
			low freezeControls(false);
		}
	}
	
	knife()
	{
		knife = getent("knife","targetname");
		jumper = getent(knife.target,"targetname");
		acti = getent(jumper.target,"targetname");
		while(1)
		{
			knife waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Knife!");
			activator = GetActivator();
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);	
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			player takeallweapons();
			activator takeallweapons();
			start_num_down(player,activator);
			activator giveweapon("tomahawk_mp");
			player giveweapon("tomahawk_mp");
			player freezeControls(false);
			activator freezeControls(false);
			player switchtoweapon("tomahawk_mp");
			activator switchtoweapon("tomahawk_mp");
		}
	}
	
	paper_scissors_rock()
	{
		p_s_r = getent("paper_scissors_rock","targetname");
		jumper = getent(p_s_r.target,"targetname");
		acti = getent(jumper.target,"targetname");
		while(1)
		{
			p_s_r waittill("trigger",player);
			player thread waitdead();
			iPrintLnBold(player.name + " ^1 selected Paper-Scissors-Rock minigame!");
			activator = GetActivator();
			player freezeControls(true);
			player setorigin(jumper.origin);
			player setPlayerAngles(jumper.angles);	
			activator freezeControls(true);
			activator setorigin(acti.origin);
			activator setPlayerAngles(acti.angles);
			player takeallweapons();
			activator takeallweapons();
			start_num_down(player,activator);
			activator giveweapon("tomahawk_mp");
			player giveweapon("tomahawk_mp");
			player freezeControls(false);
			activator freezeControls(false);
			player switchtoweapon("tomahawk_mp");
			activator switchtoweapon("tomahawk_mp");
			
			thread p_s_r_minigame(player,activator,jumper,acti);
		}
	}

	p_s_r_minigame(player,activator,jumper,acti)
	{
		player endon("round_ended");
		player endon("death");
		player endon("disconected");
		
		activator endon("round_ended");
		activator endon("death");
		activator endon("disconected");
		
		/*
		1 - Paper
		2 - Scissors
		3 - Rock
		*/
		
		once_p_s_r = 0;
		get_weapon_acti = 0;
		get_weapon_jumper = 0;
		
		while( get_weapon_acti != 1 && get_weapon_jumper != 1 )
		{
			if ( once_p_s_r == 0 )
			{
				once_p_s_r = 1;
				level.p_s_r_p = 0;
				level.p_s_r_a = 0;
	
				player thread player_answer();
				activator thread activator_answer();
			}
			else if ( (level.p_s_r_p == 1 && level.p_s_r_a == 1) || (level.p_s_r_p == 2 && level.p_s_r_a == 2) || (level.p_s_r_p == 3 && level.p_s_r_a == 3) )
			{
				player iPrintlnBold("^2It's Draw! Try again");
				activator iPrintlnBold("^2It's Draw! Try again");
				
				level.p_s_r_p = 0;
				level.p_s_r_a = 0;
				get_weapon_acti = 0;
				get_weapon_jumper = 0;
				
				player thread player_answer();
				activator thread activator_answer();
			}
			else if ( ((level.p_s_r_p == 1  && level.p_s_r_a == 3) || (level.p_s_r_p == 2 && level.p_s_r_a == 1) || (level.p_s_r_p == 3 && level.p_s_r_a == 2)) && get_weapon_jumper == 0 )
			{
				get_weapon_jumper = 1;
				activator iPrintlnBold(player.name + "^1 win, prepare for the death!");
				player iPrintlnBold("^3You win!");
				player takeallweapons();
				player giveweapon("ak74u_mp");
				player switchtoweapon("ak74u_mp");
				
				activator freezeControls(true);
				activator setorigin(jumper.origin);
				activator setPlayerAngles(jumper.angles);
			}
			else if ( ((level.p_s_r_a == 1  && level.p_s_r_p == 3) || (level.p_s_r_a == 2 && level.p_s_r_p == 1) || (level.p_s_r_a == 3 && level.p_s_r_p == 2)) && get_weapon_acti == 0 )
			{
				get_weapon_acti = 1;
				player iPrintlnBold(activator.name + "^1 win, prepare for the death!");
				activator iPrintlnBold("^3You win!");
				activator takeallweapons();
				activator giveweapon("ak74u_mp");
				activator switchtoweapon("ak74u_mp");
				
				player freezeControls(true);
				player setorigin(acti.origin);
				player setPlayerAngles(acti.angles);
			}
			else wait .1;
		wait .1;
		}
	}
	
	player_answer()
	{
		self endon("round_ended");
		self endon("death");
		self endon("disconected");
		
		p = getEnt("paper_jumper","targetname");
		s = getEnt("scissors_jumper","targetname");
		r = getEnt("rock_jumper","targetname");
		
		while(1)
		{
			if ( self IsTouching(p) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Paper!");
				level.p_s_r_p = 1;
				return;
			}
			if ( self IsTouching(s) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Scissors!");
				level.p_s_r_p = 2;
				return;
			}
			if ( self IsTouching(r) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Rock!");
				level.p_s_r_p = 3;
				return;
			}
			wait .1;
		}
	}
	
	activator_answer()
	{
		self endon("round_ended");
		self endon("death");
		self endon("disconected");
		
		p = getEnt("paper_activator","targetname");
		s = getEnt("scissors_activator","targetname");
		r = getEnt("rock_activator","targetname");
		
		while (1)
		{
			if ( self IsTouching(p) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Paper!");
				level.p_s_r_a = 1;
				return;
			}
			if ( self IsTouching(s) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Scissors!");
				level.p_s_r_a = 2;
				return;
			}
			if ( self IsTouching(r) && self UseButtonPressed() )
			{
				self iPrintLnBold("^2You selected Rock!");
				level.p_s_r_a = 3;
				return;
			}
			wait .1;
		}
	}
	
	end_move()
	{
		trig = getEnt ("end_tele","targetname");
		jumper = getent(trig.target,"targetname");
		while(1)
		{
			trig waittill ("trigger",player);
			player thread waitdead_end();
			player setorigin(jumper.origin);
		}
	}
	
	trap1()
	{
		level endon("traps_disabled");
		trig = getEnt ("trap1_trig","targetname");
		trap = getEnt ("trap1","targetname");
		trig waittill ("trigger");
		trig delete();
		trap moveZ (240,0.5);
		wait 1;
		trap moveZ (-240,4);
	}

	trap2()
	{
		level endon("traps_disabled");
		trig = getEnt ("trap2_trig","targetname");
		trap1 = getEnt ("trap2_a","targetname");	
		trap2 = getEnt ("trap2_b","targetname");
		trig waittill ("trigger");
		trig delete();
		x = RandomIntRange(1,10);
		if (x<5)
		{
			trap1 notsolid();
		}
		else 
		{
			trap2 notsolid();
		}
	}

	trap3()
	{
		level endon("traps_disabled");
		trig = getEnt ("trap3_trig","targetname");
		trig waittill ("trigger");
		trig delete();
		thread trap3_a();
		thread trap3_b();
	}
	
	trap3_a()
	{
		trap = getEnt ("trap3","targetname");
		while(1)
		{
			trap rotateRoll(-180,1);
			trap waittill("rotatedone");
			wait 2;
		}	
	}
	
	trap3_b()
	{
		trap = getEnt ("bounce_trap3","targetname");
		trap moveX (115,1);
		wait 1;
		while(1)
		{
			trap moveX(-230,2);
			trap waittill("movedone");
			wait 1;
			trap moveX(230,2);
			trap waittill("movedone");
			wait 1;
		}
	}
	
	trap4()
	{
		level endon("traps_disabled");
		trig = getEnt ("trap4_trig","targetname");
		pipe_a = getEnt ("rotate_a","targetname");
		pipe_b = getEnt ("rotate_b","targetname");
		trig waittill ("trigger");
		trig delete();
		y = RandomIntRange(1,11);
		if (y<6)
		{
			pipe_a notsolid();
		}
		else 
		{
			pipe_b notsolid();
		}
		
		thread wood_a();
		thread wood_b();
	}
	
	wood_a()
	{
		trap = getEnt ("wood_rotate_a","targetname");
		while(1)
		{
			trap rotateYaw(180,0.5);
			trap waittill("rotatedone");
			wait 1;
		}
	}
	
	wood_b()
	{
		trap = getEnt ("wood_rotate_b","targetname");
		while(1)
		{
			trap rotateYaw(-180,0.5);
			trap waittill("rotatedone");
			wait 1;
		}
	}
	
	trap5()
	{
		level endon("traps_disabled");
		trap1 = getEnt ("trap5_a","targetname");
		trap2 = getEnt ("trap5_b","targetname");
		trig = getEnt ("trap5_trig","targetname");
		trig waittill ("trigger");
		trap1 moveY (-410,2);
		trap1 waittill("movedone");
		trap1 delete();
		trig waittill ("trigger");
		trap2 moveY (-410,2);
		trap2 waittill("movedone");
		trap2 delete();
		trig delete();
	}
	
	trap6()
	{
		level endon("traps_disabled");
		trig = getEnt("trap6_trig","targetname");
		trap_a = getEnt("trap6_a","targetname");
		trap_b = getEnt("trap6_b","targetname");
		trap_c = getEnt("trap6_c","targetname");
		trap_d = getEnt("trap6_d","targetname");
		trap_e = getEnt("trap6_e","targetname");
		trig waittill ("trigger");
		trig delete();
		while( 1 )
		{
			trap_a moveZ (-290,0.3);
			trap_a waittill("movedone"); 
			trap_b moveZ (-290,0.3);
			trap_b waittill("movedone"); 
			trap_c moveZ (-290,0.3);
			trap_c waittill("movedone"); 
			trap_d moveZ (-290,0.3);
			trap_d waittill("movedone");
			trap_e moveZ (-290,0.3);
			trap_e waittill("movedone"); 
			wait 1;
			trap_a moveZ (290,0.5);
			trap_a waittill("movedone"); 
			trap_b moveZ (290,0.5);
			trap_b waittill("movedone"); 
			trap_c moveZ (290,0.5);
			trap_c waittill("movedone"); 
			trap_d moveZ (290,0.5);
			trap_d waittill("movedone"); 
			trap_e moveZ (290,0.5);
			trap_e waittill("movedone");
			wait 1;
		}
	}
	
	trap7()
	{
		level endon("traps_disabled");
		trig = getEnt("trap7_trig","targetname");
		
		trap_l1 = getEnt("trap7_l1","targetname");
		trap_l2 = getEnt("trap7_l2","targetname");
		trap_r1 = getEnt("trap7_r1","targetname");
		trap_r2 = getEnt("trap7_r2","targetname");
		trap_m = getEnt("trap7_m","targetname");
		
		trig waittill ("trigger");
		trig delete();
		
		thread trap7_left(trap_l1);
		thread trap7_left(trap_l2);
		thread trap7_middle(trap_m);
		thread trap7_right(trap_r1);
		thread trap7_right(trap_r2);
	}
		
	trap7_left(trap)
	{
		while( 1 )
		{
			trap rotateYaw(360,2);
			wait 2;
		}
	}
	
	trap7_middle(trap)
	{
		trap rotateYaw(90,2);
		trap waittill("rotatedone");
		while(1)
		{
			trap rotateYaw(180,3);
			trap waittill("rotatedone");
			trap rotateYaw(-180,3);
			trap waittill("rotatedone");
			
		}
	}
	
	trap7_right(trap)
	{
		while(1)
		{
			trap rotateYaw(-360,2);
			wait 2;
		}
	}
	
	trap8()
	{
		level endon("traps_disabled");
		trig = getEnt("trap8_trig","targetname");
		
		trap_a = getEnt("trap8_a","targetname");
		trap_b = getEnt("trap8_b","targetname");
		trap_c = getEnt("trap8_c","targetname");
		trap_d = getEnt("trap8_d","targetname");
		trap_e = getEnt("trap8_e","targetname");
		
		trig waittill ("trigger");
		trig delete();
		
		thread trap8_f(trap_a);
		thread trap8_l(trap_b);
		thread trap8_f(trap_c);
		thread trap8_l(trap_d);
		thread trap8_f(trap_e);
	}
	
	trap8_l(trap)
	{
		while(1)
		{
			trap rotatePitch (-140,1);
			trap waittill ("rotatedone");
			trap rotatePitch (140,1);
			trap waittill ("rotatedone");
		}
	}
	
	trap8_f(trap)
	{
		while(1)
		{
			trap rotatePitch (140,1);
			trap waittill ("rotatedone");
			trap rotatePitch (-140,1);
			trap waittill ("rotatedone");
		}
	}
	
	trap9()
	{
		level endon("traps_disabled");
		trig = getEnt("trap9_trig","targetname");
		
		trap_01 = getEnt("trap9_01","targetname"); 
		trap_02 = getEnt("trap9_02","targetname");
		trap_03 = getEnt("trap9_03","targetname");
		trap_04 = getEnt("trap9_04","targetname");
		trap_05 = getEnt("trap9_05","targetname");
		trap_06 = getEnt("trap9_06","targetname");
		trap_07 = getEnt("trap9_07","targetname");
		trap_08 = getEnt("trap9_08","targetname");
		trap_09 = getEnt("trap9_09","targetname");
		trap_10 = getEnt("trap9_10","targetname");
		trap_11 = getEnt("trap9_11","targetname");
		trap_12 = getEnt("trap9_12","targetname");
			
		trig waittill ("trigger");
		trig delete();
		
		thread trap9_lift_a(trap_01);
		thread trap9_lift_a(trap_03);
		thread trap9_lift_a(trap_05);
		thread trap9_lift_a(trap_07);
		thread trap9_lift_a(trap_09);
		thread trap9_lift_a(trap_11);
		
		thread trap9_lift_b(trap_02);
		thread trap9_lift_b(trap_04);
		thread trap9_lift_b(trap_06);
		thread trap9_lift_b(trap_08);
		thread trap9_lift_b(trap_10);
		thread trap9_lift_b(trap_12);
	}

	trap9_lift_a(trap)
	{
		trap moveZ(50,1);
		trap waittill ("movedone");
		while(1)
		{				
			trap moveZ(-100,2);
			trap waittill ("movedone");
			trap moveZ(100,2);
			trap waittill ("movedone");
		}
	}
	
	trap9_lift_b(trap)
	{
		trap moveZ(-50,1);
		trap waittill ("movedone");
		while(1)
		{				
			trap moveZ(100,2);
			trap waittill ("movedone");
			trap moveZ(-100,2);
			trap waittill ("movedone");
		}
	}
	
	trap10()
	{
		level endon("traps_disabled");
		trig = getEnt("trap10_trig","targetname");
		trig waittill ("trigger");
		trig delete();
		thread trap10_left();
		thread trap10_right();
	}
	
	trap10_left()
	{
		trap = getEnt("trap10_l","targetname");
		while(1)
		{
			trap moveY (210,2);
			trap waittill("movedone");
			wait 1;
			trap moveY (-210,2);
			trap waittill("movedone");
		}
	}
	
	trap10_right()	
	{
		trap = getEnt("trap10_r","targetname");
		while(1)
		{
			trap moveY (-210,2);
			trap waittill("movedone");
			wait 1;
			trap moveY (210,2);
			trap waittill("movedone");
		}
	}

	trap11()
	{
		level endon("traps_disabled");
		trig = getEnt("trap11_trig","targetname");
		trap_a = getEnt("trap11_a","targetname");
		trap_b = getEnt("trap11_b","targetname");
		trap_m = getEnt("trap11_m","targetname");
		
		trap_aside = getEnt("trap11_aside","targetname");
		trap_bside = getEnt("trap11_bside","targetname");
		trap_mside = getEnt("trap11_mside","targetname");
		
		trig waittill("trigger");
		
		h = RandomIntRange(1,11);
		if( h < 6 )
		{
			trap_a delete();
			trap_m delete();
			trap_aside notsolid();
			trap_mside notsolid();
			trap_m delete();
		}
		else
		{
			trap_b delete();
			trap_m delete();
			trap_bside notsolid();
			trap_mside notsolid();
			trap_m delete();
		}
	}
	
	secret_lift_a()
	{
		lift = getEnt("secret_lift","targetname");
		while(1)
		{
			lift moveZ(206,2);
			lift waittill("movedone");
			wait 1;
			lift moveZ(-206,2);
			lift waittill("movedone");
			wait 1;
		}
	}
	
	secret_lift_b()
	{
		lift = getEnt("secret_lift2","targetname");
		while(1)
		{
			lift moveZ(224,2);
			lift waittill("movedone");
			wait 1;
			lift moveZ(-224,2);
			lift waittill("movedone");
			wait 1;
		}
	}
	
	secret_fail()
	{
		secret_fail_trig = getEnt("secret_fail","targetname");
		fail_to = getEnt(secret_fail_trig.target,"targetname");
		while(1)
		{		
			secret_fail_trig waittill ("trigger",noob);
			noob setorigin(fail_to.origin);
			noob setPlayerAngles(fail_to.angles);
		}
	}
	
	secret_music()
	{
		music_selecter = getEnt ("music_trig","targetname");
	
		music_pointer = 0;
		music_player = 0;
		
		if ( music_player == 0 )
		{
			music_player = 1;
			music_selecter waittill ("trigger",player);
			music_selecter SetHintString("Select Button: ^1Granade^7, ^1Shoot^7 -> Press ^1Knife");
			player.point = 1;
		
			if ( music_pointer == 0 && player.point == 1)
			{
				music_pointer = 1;
				music = strTok("none;Music0;Music1;Music2",";");
				musicname = strTok("none;any01;any02;any03",";");
				
				m = 1;
				
				while ( 1 )
				{
					if ( player.point == 1 && player AttackButtonPressed() && player istouching( music_selecter ) )
					{
						m++;
						if ( m == 4 ) m = 1;
						player iPrintLnBold(music[m]);
					}
					if( player.point == 1 && player FragButtonPressed() && player istouching( music_selecter ) )
					{
						m--;
						if ( m == 0 ) m = 3;
						player iPrintLnBold(music[m]);
					}
					if ( player.point == 1 && player MeleeButtonPressed() && player istouching( music_selecter ) )
					{
						break;
					}
					wait .1;
				}
				music = musicname[m];
				iPrintLnBold(player.name + " ^1 changed the music!");
				if ( music[m] != "none")
				{
					thread music ( musicname[m] , music[m] );
				}
				music_selecter SetHintString("^1Sorry! Now you can't change the music!");
			}
		}
	}
	
	secret_weapon()
	{
		weap = getEnt("random_weapon","targetname");
		while(1)
		{
			weap waittill("trigger",player);
			h = randomintrange(2,8);
			if(h == 2)
			{
				weapon_secret = "mp44_mp";
			}
			else if(h == 3)
			{
				weapon_secret = "winchester1200_mp";
			}
			else if(h == 4)
			{
				weapon_secret = "ak47_mp";
			}
			else if(h == 5)
			{
				weapon_secret = "ak74u_mp";
			}
			else if(h == 6)
			{
				weapon_secret = "deserteaglegold_mp";
			}
			else
			{
				weapon_secret = "tomahawk_mp";
				player thread bad_luck();
			}
			player giveweapon(weapon_secret);
			player givemaxammo(weapon_secret);
			player switchtoweapon(weapon_secret);
		}
	}
	
	bad_luck()
	{
		self iPrintLnBold("^1You got BAD luck!!!");
		wait 1;
		self iPrintLnBold("^1Sorry... you will die within 10 seconds...");
		wait 10;
		self suicide();
	}
	
	secret()
	{	
		st_one = getEnt("first_step","targetname");
		st_two = getEnt("second_step","targetname");
		st_thr = getEnt("third_step","targetname");
		st_fou = getEnt("fourth_step","targetname");
		st_fif = getEnt("fifth_step","targetname");
		st_six = getEnt("sixth_step","targetname");
		
		st_one waittill("trigger",who);
		who iPrintLnBold("^4You found the first secret spot!");
		
		st_two waittill("trigger",who);
		who iPrintLnBold("^4You found the next secret spot!");
		
		st_thr waittill("trigger",who);
		who iPrintLnBold("^4You found the next secret spot!");
		
		st_fou waittill("trigger",who);
		who iPrintLnBold("^4You found the next secret spot!");
		
		st_fif waittill("trigger",who);
		who iPrintLnBold("^4You found the next secret spot!");
		
		st_six waittill("trigger",who);
		who iPrintLnBold("^4You found the next secret spot!");
		
		secret_open = getEnt("enter","targetname");
		where_tele = getEnt(secret_open.target,"targetname");
		
		while(1)
		{
			secret_open waittill ("trigger",who);
			if(!who.correct == 1)
			{
				who.correct = 1;
				who setorigin(where_tele.origin);
				who setPlayerAngles(where_tele.angles);
				iPrintLnBold(who.name + " ^4is in the secret!");
			}
			wait .1;
		}
	}
	
	secret_end()
	{
		secret_tele_out = getEnt("tele_out","targetname");
		go = getEnt(secret_tele_out.target,"targetname");
		while(1)
		{
			secret_tele_out waittill ("trigger",player);
			player setorigin(go.origin);
			player setPlayerAngles(go.angles);
		}
	}
	
	end_trig()
	{
		trig = getEnt ("endmap_trig","targetname");
		while(1)
		{
			trig waittill("trigger",player);
			if( !player.end == 1) 
			{
				player.end = 1;
				iPrintLn(player.name + " ^4reached the final door! ^3Congrat!");
			}
			wait .1;
		}
	}