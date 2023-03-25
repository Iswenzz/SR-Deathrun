//////////////////////////////////////////////////////////////
/////Do not use any of these scripts with out my permission///
////xfire:xlossx steam:xlossxftw//////////////////////////////
////My website: www.lossycreation.weebly.com//////////////////
////These scripts are copyright material//////////////////////
////do not edit or change anything. Copyright © 2012-2013/////
/////////////////////////////////////////////////////////////

main()
{

    maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	PreCacheItem("mp44_mp");
	PreCacheItem("mp5_silencer_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("g36c_mp");
	PreCacheItem("m60e4_grip_mp");
	PreCacheItem("p90_silencer_mp");
	PreCacheItem("ak74u_mp");
	PreCacheItem("brick_blaster_mp");

	level.effect1 = LoadFX("fire/credit_rain");
	
	thread Lastman();
	thread start();
	thread mapfinish();
	
	//traps
	thread trap1();
	thread trap2();
	thread vanish();
	thread trap4();
	thread trap5();
	thread trap6_1();
	thread trap6_2();
	thread trap7_1();
	thread trap7_2();
	thread trap9();
	thread trap10();
	thread trap_red();
	thread trap_blue();

	//credits
	thread printCredits();
	thread credit();
	
	//secret
	thread secret_one();
	thread secret_two();
	
	//minigames
	thread sniper();
	thread knife();
	thread weapon();
	
	//weapons
	thread activator_ammo();
	thread activator_p90();
	thread activator_ak47();
	thread activator_g36c();
	thread activator_ak74u();
	thread activator_m60e4();
	thread activator_mp5();
	thread activaor_mp44();
	thread jumper_ammo();
	thread jumper_p90();
	thread jumper_ak47();
	thread jumper_g36c();
	thread jumper_ak74u();
	thread jumper_m60e4();
	thread jumper_mp5();
	thread jumper_mp44();
	
	//exp
	thread exp();
	thread exp1();
	thread exp2();
	thread exp3();
	thread exp4();
	thread big_exp();
	thread big_exp2();
	
	//freerun
	thread addtrapstofreerun();
}

credit()
{
	rain = getEnt ("credit_rain", "targetname");
	
	while(1)
	{
		playFx( level.effect1, rain.origin);
		wait .1;
	}
}

mapfinish()
{
	trigger = getEnt( "end_trig", "targetname" );
	
	trigger waittill ("trigger", who);
	iprintlnbold (who.name + " Finished First^1!");
	
	trigger delete();
}

LastMan()
{
	jump = undefined;
	acti = undefined;

	trigger = getEnt( "last", "targetname" );
	
	trigger waittill("trigger");
	while(1)
	{
		if( getTeamPlayersAlive( "allies" ) == 1 && getTeamPlayersAlive("allies") == 1 )
		{
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			{
				if( players[i].pers["team"] == "allies" && isAlive( players[i] ) && !isDefined( jump ) )
				jump = players[i];
				else if( players[i].pers["team"] == "axis" && isAlive( players[i] ) && !isDefined( acti ) )
				acti = players[i];
			}
				
				teleA = getent("teleporter_activators", "targetname");
				teleJ = getent("teleporter_jumpers", "targetname");
				
				jump SetPlayerAngles( teleJ.angles );
				jump SetOrigin( teleJ.origin );
				jump FreezeControls(1);
				acti SetPlayerAngles( teleA.angles );
				acti SetOrigin( teleA.origin );
				acti FreezeControls(1);
				wait 3;
				thread minigame();
				wait 9;
				acti FreezeControls(0);
				jump FreezeControls(0);
				break;
			
		}
		
	break;
	}
}

minigame()
{
	{
	bar = getEnt ("roll", "targetname");
	
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 3;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Welcome to Jumper";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 2;
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,1,0);
	hud_clock.label = &"You must jump over the bar and try to survive longer than your opponent";
	hud_clock SetPulseFX( 40, 5400, 200 );
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,1,0);
	hud_clock.label = &"Jumper starts in: &&1...";
	hud_clock SetTimer(6);
	hud_clock SetPulseFX( 40, 5400, 200 );	
	wait 6;
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,1,0);
	hud_clock.label = &"Start Jumping!!";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 1;
	
	thread DoJumpRoll();
	}
}

DoJumpRoll()
{
	jump = getEnt("roll", "targetname");
	
	jump rotateYaw( 2880, 40);
	wait 15;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;	
	jump RotateYaw( 2880, 30 );
	wait 15;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;	
	jump RotateYaw( 2880, 20 );
	wait 15;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 15);
	wait 10;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 14 );
	wait 9;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 13);
	wait 8;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 12 );
	wait 7;
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"Speed increasing in: &&1...";
	hud_clock SetTimer(5);
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	jump RotateYaw( 2880, 11.5 );
	wait 6.5;	
	hud_clock = NewHudElem();
	hud_clock.alignX = "left";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "left";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.4;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"This is the final speed, good luck !";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
	
	while(1)
	{
		jump RotateYaw( 2880, 11 );
		wait 11;
	}
}

start()
{
	door = getEnt ("pac_door", "targetname");
	trig = getEnt ("pac_door_trig", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger");
		trig delete();
		wait 2;
		door moveZ (-256, 10);
		wait 10;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 2;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"The door has opened!";
		hud_clock SetPulseFX( 40, 5400, 200 );
	}
}

//////////////////////////////Traps//////////////////////////////////////

trap1()
{
	brush = getEnt ("trap1", "targetname");
	hurt = getEnt ("trap1_hurt", "targetname");
	trig = getEnt ("trap1_trig", "targetname");
	
	hurt enablelinkto();
    hurt linkto (brush);
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		brush moveZ (-472, 1.5);
		wait 5;
		brush moveZ(472, 1.5);
		
	}
}

trap2()
{
	swing = getEnt ("trap2_turn", "targetname");
	trig = getEnt ("trap2_trig", "targetname");
	
	trig waittill ("trigger");
	trig setHintString("Trap Activated^1!");
	
	while( 1 )
	{
		swing rotateroll(360,3); 
		wait 5; 
	}
}

vanish()
{
	trig = getEnt( "vanish_trig", "targetname" );
	brushGroup1 = getEntArray( "vanish_part1", "targetname" );
	brushGroup2 = getEntArray( "vanish_part2", "targetname" );

	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
}

trap4()
{
	brush = getEnt ("trap4", "targetname");
	trig = getEnt ("trap4_trig", "targetname");
	
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	
	{
		brush moveX (-432, 0.5);
		wait 5;
		brush moveX(432, 0.5);
		
	}
}

trap5()
{
	brush = getEnt ("trap5", "targetname");
	trig = getEnt ("trap5_trig", "targetname");
	
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		brush moveZ (228, 0.5);
		wait 5;
		brush moveZ(-228, 1);
		
	}
}

trap6_1()
{
	brush = getEnt ("trap6_1", "targetname");
	trig = getEnt ("trap6_spin", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		brush rotateYaw(-360,1.5);
			
		wait 120;
	}
}

trap6_2()
{
	spike = getEnt ("trap6_spike", "targetname");
	hurt = getEnt ("spike_trig", "targetname");
	trig = getEnt ("trap6_spikes", "targetname");
	
	hurt enablelinkto();
    hurt linkto (spike);
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		spike moveZ (80,1.5);
		wait 5;
		spike moveZ (-80,1.5);
	}
}

trap7_1()
{
	brush = getEnt ("trap7_1", "targetname");
	trig = getEnt ("trap7_spin", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		brush rotateYaw(-360,1.5);
			
		wait 120;
	}
}

trap7_2()
{
	spike = getEnt ("trap7_spike", "targetname");
	hurt = getEnt ("trap7_hurt", "targetname");
	trig = getEnt ("trap7_spikes", "targetname");
	
	hurt enablelinkto();
    hurt linkto (spike);
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		spike moveZ (80,1.5);
		wait 5;
		spike moveZ (-80,1.5);
	}
}

trap_red()
{
	brush = getEnt ("trap8_red", "targetname");
	trig = getEnt ("red_trig", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	while ( 1 )
	{
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
	}
}

trap_blue()
{
	brush = getEnt ("trap9_blue", "targetname");
	trig = getEnt ("blue_trig", "targetname");
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	while ( 1 )
	{
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
		brush moveX (-383, 1);
		wait 1;
		brush moveX(383, 1);
		wait 1;
	}
}

trap9()
{
	trig = getEnt( "trap9_trig", "targetname" );
	brushGroup1 = getEntArray( "trap9_1", "targetname" );
	brushGroup1 = getEntArray( "trap9_1", "targetname" );
	brushGroup1 = getEntArray( "trap9_1", "targetname" );
	brushGroup2 = getEntArray( "trap9_2", "targetname" );
	brushGroup2 = getEntArray( "trap9_2", "targetname" );
	brushGroup2 = getEntArray( "trap9_2", "targetname" );

	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	brushGroup1[randomInt(brushGroup1.size)] delete();
	brushGroup2[randomInt(brushGroup2.size)] delete();
}

trap10()
{
	trig = getEnt ( "trap10_trig", "targetname");
	door = getEnt ( "trap10_door", "targetname");
	spike1 = getEnt ( "trap10_left", "targetname");
	spike2 = getEnt ( "trap10_right", "targetname");
	hurt1 = getEnt ( "hurt_left", "targetname");
	hurt2= getEnt ( "hurt_right", "targetname");
	
	hurt1 enablelinkto();
    hurt1 linkto (spike1);
	hurt2 enablelinkto();
    hurt2 linkto (spike2);
	
	trig waittill("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	{
		door moveZ (192, 1);
		wait 3;
		spike1 moveY (512, 10);
		spike2 moveY (-512, 10);
		wait 15;
		spike2 moveY (512, 10);
		spike1 moveY (-512, 10);
		wait 10;
		door moveZ (-192, 3);
	}
}

////////////////////////////traps////////////////////////////////////////////

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
	self.logoText.fontScale = 1.4;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5mp_dr_pacrun ^8by Lossy^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^4My xfire: ^2xlossx, report any bugs there^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^4Visit ^8www.lossycreation.weebly.com^1!");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

secret_one()
{
	trig = getEnt( "secret_trig", "targetname");
	brush = getEnt( "secret_exp", "targetname");
	brush1 = getEnt( "secret_exp2", "targetname");
	
	trig waittill("trigger", user);
	{
	

		user braxi\_rank::giveRankXp( "kill", 100 );
		user iprintlnbold ("^3Nice, you found some yummy yellow squares enjoy the 100xp!");
		brush delete();
		brush1 delete();
		trig delete();
	}
}

secret_two()
{
	trig = getEnt( "morg_secret", "targetname");
	brush = getEnt( "morg_exp", "targetname");
	brush1 = getEnt( "morg_exp2", "targetname");
	
	trig waittill("trigger", user);
	{
	

		user braxi\_rank::giveRankXp( "kill", 300 );
		user iprintlnbold ("^3Nice, you found some yummy yellow squares enjoy the 200xp!");
		brush delete();
		brush1 delete();
		trig delete();
		
	}
}
	
////////////////////////MINIGAMES/////////////////////////////////////
sniper()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	sniper_originj = getEnt ("jumper_sniper", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	
	sniper_trigger waittill ("trigger", player);
	thread sniper_acti();
	weapon_trigger delete();
	knife_trig delete();
	
	iprintlnbold (player.name + " chose sniper!");
	
	player FreezeControls (1);
	player SetOrigin(sniper_originj.origin);	
	player SetPlayerAngles( sniper_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("remington700_mp");
	wait 0.01;
	player SwitchToWeapon("remington700_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper();
}

sniper_acti()
{
	sniperacti = getEnt ("activator_sniper", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(sniperacti.origin);
			players[i] SetPlayerAngles( sniperacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("remington700_mp");
			wait 0.01;
			players[i] SwitchToWeapon("remington700_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

knife()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	knife_trigger = getEnt ("trigger_knife", "targetname");
	knife_originj = getEnt ("jumper_knife", "targetname");
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	
	knife_trigger waittill ("trigger", player);
	thread knife_acti();
	weapon_trigger delete();
	sniper_trigger delete();
	
	iprintlnbold (player.name + " chose knife!");
	
	player FreezeControls (1);
	player SetOrigin(knife_originj.origin);	
	player SetPlayerAngles( knife_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("tomahawk_mp");
	wait 0.05;
	player SwitchToWeapon("tomahawk_mp");
	
	wait 4;
	iPrintlnbold ("3");
	wait 3;
	iPrintlnbold ("2");
	wait 2;
	iPrintlnbold ("1");
	wait 1;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath_knife();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife();
}

knife_acti()
{
	knifeacti = getEnt ("activator_knife", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(knifeacti.origin);
			players[i] SetPlayerAngles( knifeacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("tomahawk_mp");
			wait 0.05;
			players[i] SwitchToWeapon("tomahawk_mp");
			wait 10;
			players[i] FreezeControls (0);
		}
	}
}

weapon()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	weapon_trigger = getEnt ("trigger_weapon", "targetname");
	weapon_originj = getEnt ("jumper_weapon", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	
	weapon_trigger waittill ("trigger", player);
	thread weapon_acti();
	knife_trig delete();
	sniper_trigger delete();
	
	iprintlnbold (player.name + " chose weapon!");
	
	player FreezeControls (1);
	player SetOrigin(weapon_originj.origin);	
	player SetPlayerAngles( weapon_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("deserteagle_mp");
	player setWeaponAmmoClip( "deserteagle_mp", 0 );
	player setweaponammostock( "deserteagle_mp", 0 );
	wait 0.05;
	player SwitchToWeapon("deserteagle_mp");
	
	wait 2;
	player FreezeControls (0);
	iPrintlnbold ("Go!");
	
	player thread onDeath_weapon();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}


onDeath_weapon()
{
	self endon("disconnect");
	
	self waittill("death");
	thread weapon();
}

weapon_acti()
{
	weaponacti = getEnt ("activator_weapon", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(weaponacti.origin);
			players[i] SetPlayerAngles( weaponacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("deserteagle_mp");
			players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
			players[i] setweaponammostock( "deserteagle_mp", 0 );
			wait 0.05;
			players[i] SwitchToWeapon("deserteagle_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

////////////////////////MINIGAMES/////////////////////////////////////

////////////////////////WEAPONS/////////////////////////////////////
activator_ammo()
{	
	trig = getEnt( "acti_ammo", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("remington700_mp");
		who GiveMaxAmmo("remington700_mp");
		who SwitchToWeapon("remington700_mp");
		
		wait 5;

	}
}

activator_p90()
{	
	trig = getEnt( "activator_p90", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

activator_ak47()
{	
	trig = getEnt( "activator_ak47", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("ak47_mp");
		who GiveMaxAmmo("ak47_mp");
		who SwitchToWeapon("ak47_mp");
		
		wait 5;

	}
}

activator_g36c()
{	
	trig = getEnt( "activator_carbine", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("g36c_mp");
		who GiveMaxAmmo("g36c_mp");
		who SwitchToWeapon("g36c_mp");

	}
}

activator_ak74u()
{	
	trig = getEnt( "activator_ak47u", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("ak74u_mp");
		who GiveMaxAmmo("ak74u_mp");
		who SwitchToWeapon("ak74u_mp");
		
		wait 5;

	}
}

activator_m60e4()
{	
	trig = getEnt( "activator_m60e4", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);;
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

activator_mp5()
{	
	trig = getEnt( "activator_mp5", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("mp5_silencer_mp");
		who GiveMaxAmmo("mp5_silencer_mp");
		who SwitchToWeapon("mp5_silencer_mp");
		
		wait 5;

	}
}

activaor_mp44()
{	
	trig = getEnt( "activator_mp44", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("mp44_mp");
		who GiveMaxAmmo("mp44_mp");
		who SwitchToWeapon("mp44_mp");
	
		wait 5;
	}
}

//////////////////////////jumper weapons///////////////////////////////////////////////

jumper_ammo()
{	
	trig = getEnt( "jump_ammo", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("remington700_mp");
		who GiveMaxAmmo("remington700_mp");
		who SwitchToWeapon("remington700_mp");
		
		wait 5;

	}
}

jumper_p90()
{	
	trig = getEnt( "jump_p90", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("p90_silencer_mp");
		who GiveMaxAmmo("p90_silencer_mp");
		who SwitchToWeapon("p90_silencer_mp");
		
		wait 5;

	}
}

jumper_ak47()
{	
	trig = getEnt( "jump_ak47", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("ak47_mp");
		who GiveMaxAmmo("ak47_mp");
		who SwitchToWeapon("ak47_mp");
		
		wait 5;

	}
}

jumper_g36c()
{	
	trig = getEnt( "jump_carbine", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("g36c_mp");
		who GiveMaxAmmo("g36c_mp");
		who SwitchToWeapon("g36c_mp");
		
		wait 5;

	}
}

jumper_ak74u()
{	
	trig = getEnt( "jump_ak47u", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("ak74u_mp");
		who GiveMaxAmmo("ak74u_mp");
		who SwitchToWeapon("ak74u_mp");

	}
}

jumper_m60e4()
{	
	trig = getEnt( "jump_m60e4", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("m60e4_grip_mp");
		who GiveMaxAmmo("m60e4_grip_mp");
		who SwitchToWeapon("m60e4_grip_mp");
		
		wait 5;

	}
}

jumper_mp5()
{	
	trig = getEnt( "jump_mp5", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("mp5_silencer_mp");
		who GiveMaxAmmo("mp5_silencer_mp");
		who SwitchToWeapon("mp5_silencer_mp");
		
		wait 5;

	}
}

jumper_mp44()
{	
	trig = getEnt( "jump_mp44", "targetname" );
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); //take weapon from player

		who giveWeapon("mp44_mp");
		who GiveMaxAmmo("mp44_mp");
		who SwitchToWeapon("mp44_mp");
	
		wait 5;
	}
}

/////////////////EXP//////////////////
exp()
{
	trig = getEnt( "exp", "targetname");
	brush = getEnt( "xp_brush", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("^3You got 5xp!");
	trig delete();
	brush delete();
}

exp1()
{
	trig = getEnt( "exp2", "targetname");
	brush = getEnt( "xp2_brush", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("^3You got 5xp!");
	trig delete();
	brush delete();
}

exp2()
{
	trig = getEnt( "exp3", "targetname");
	brush = getEnt( "xp3_brush", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("^3You got 5xp!");
	trig delete();
	brush delete();
}

exp3()
{
	trig = getEnt( "exp4", "targetname");
	brush = getEnt( "xp4_brush", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("^3You got 5xp!");
	trig delete();
	brush delete();
}

exp4()
{
	trig = getEnt( "exp5", "targetname");
	brush = getEnt( "xp5_brush", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 5 );
	user iprintlnbold ("^3You got 5xp!");
	trig delete();
	brush delete();
}

big_exp()
{
	trig = getEnt( "xp_big", "targetname");
	brush = getEnt( "big_coin", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 20 );
	user iprintlnbold ("^3You got 20xp!");
	trig delete();
	brush delete();
}

big_exp2()
{
	trig = getEnt( "xp_big2", "targetname");
	brush = getEnt( "big_coin2", "targetname");
	
	trig waittill( "trigger", user );
	user braxi\_rank::giveRankXp( "kill", 20 );
	user iprintlnbold ("^3You got 20xp!");
	trig delete();
	brush delete();
}

/////////////////END Of EXP//////////////////

/////////////////traps for free run//////////////////
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1_trig");
	addTriggerToList("trap2_trig");
	addTriggerToList("vanish_trig");
	addTriggerToList("trap4_trig");
	addTriggerToList("trap5_trig");
	addTriggerToList("trap6_spin");
	addTriggerToList("trap6_spikes");
	addTriggerToList("trap7_spin");
	addTriggerToList("trap7_spikes");
	addTriggerToList("red_trig");
	addTriggerToList("blue_trig");
	addTriggerToList("trap9_trig");
	addTriggerToList("trap10_trig");
}
/////////////////traps for free run//////////////////