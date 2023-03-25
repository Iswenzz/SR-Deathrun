/*
	Traps: 7
	
	Size: small

	Difficult: Easy(without traps :D ) Do not give Free for jumpers :p

	Map made by nexuS|Team
	Add helps: kkk35
*/
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
main()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread part2();
	thread part3();
	thread trap5();
	thread trap6();
	thread trap7();
	thread room();
	thread bounce();
	thread v1();
	thread v2();
	thread knife();
	thread sniper();
	thread deagle();
	thread create();
	thread zene();

		addTriggerToList("trap1_t");
		addTriggerToList("trap2_t");
		addTriggerToList("trap3_t");
		addTriggerToList("trap4_t");
		addTriggerToList("trap5_t");
		addTriggerToList("trap6_t");
		addTriggerToList("trap7_t");

}

create()
{

	for(;;)
	{
	wait 10;
	iprintln ("^1>> ^5Map created by ^2Nexus Team");
	wait 10;
	iprintln ("^1>> ^5xfire: ^2kovacsakos23");
	wait 10;
	iprintln ("^1>> ^5Good Luck & Have Fun :)");
	wait 10;
	iprintln ("^1>> ^5Additional Help by: ^2kkk35");
	wait 10;
	iprintln ("^1>> ^5Thanks for playing on the map!");
	}
}

zene()
{
	songs = [];
	songs[songs.size] = "forever";
	songs[songs.size] = "redlights";
	songs[songs.size] = "secrets";

	selected = songs[ Randomint( songs.size ) ];
	AmbientPlay( selected );
}


trap1()
{
	trig =getent("trap1_t", "targetname");
	trap1_a = getent("trap1_a","targetname");
	trap1_b = getent("trap1_b","targetname");
	trap1_c = getent("trap1_c","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap1_c delete();

	while(1)
	{
	trap1_a rotatePitch (360, 2.5);
	wait 0.5;
	trap1_b rotatePitch (-360, 2.5);
	wait 0.05;
	}

}

trap2()
{

	trig =getent("trap2_t", "targetname");
	trap2 = getent("trap2","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap2 rotateYaw (360, 2.3);
	wait 5;
	trap2 rotateYaw (-360, 2.3);
	wait 5;
	}
}

trap3()
{

	trig =getent("trap3_t", "targetname");
	trap3_a = getent("trap3_a","targetname");
	trap3_b = getent("trap3_b","targetname");
	trap3_c = getent("trap3_c","targetname");
	trap3_d = getent("trap3_d","targetname");
	trap3_e = getent("trap3_e","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	trap3_a rotateYaw (360, 1);
	wait 0.05;
	trap3_b rotateYaw (360, 1);
	wait 0.05;
	trap3_c rotateYaw (360, 1);
	wait 0.05;
	trap3_d rotateYaw (360, 1);
	wait 0.05;
	trap3_e rotateYaw (360, 1);
	wait 0.05;
	}
}

trap4()
{
	trap4 = GetEnt("trap4","targetname");
	trig = GetEnt("trap4_t","targetname");

	trap4 NotSolid();
	trap4 Hide();

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");;

	trap4 Show();
	trap4 Solid();

	wait 5;

	trap4 Delete();
}

part2()
{
	trig = getent ("part", "targetname");
	end = getent ("part2", "targetname");

	while(1)
	{
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	player freezeControls(1);
	wait 1;
	player freezeControls(0); 
	wait 0.1;
	}
}

part3()
{
	trig = getent ("out", "targetname");
	end = getent ("out2", "targetname");

	while(1)
	{	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	player freezeControls(1);
	wait 1;
	player freezeControls(0);
	wait 0.1;
	}
}

trap5()
{
	trig =getent("trap5_t", "targetname");
	trap5_a = getent("trap5_a","targetname");
	trap5_b = getent("trap5_b","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap5_a notsolid();
	wait 0.5;
	trap5_b Hide();
}

trap6()
{
	trap6 = GetEnt("trap6","targetname");
	hurt = GetEnt("trap6_dmg","targetname");
	trig = GetEnt("trap6_t","targetname");

	hurt Triggeroff();
	trap6 NotSolid();
	trap6 Hide();

	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	while(1)
	{
	hurt Triggeron();
	trap6 Show();
	trap6 Solid();

	wait 3;

	hurt Triggeroff();
	trap6 NotSolid();
	trap6 Hide();
	wait 0.5;
	}

}

trap7()
{
	trig =getent("trap7_t", "targetname");
	trap7 = getent("trap7","targetname");
	
	trig sethintstring("Press ^3&&1 ^7for activate.");
	trig waittill ("trigger", player);
	trig sethintstring("^1Activated^2!");

	trap7 Hide();
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

room()
{
	trig = getent ("room", "targetname");
	end = getent ("valaszt", "targetname");

	while(1)
	{
	trig setHintstring("Press ^3&&1 ^7for ^1Choose");	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	iprintLnbold ("^1" + player.name + " ^7has enetered the ^1Minigames ^7selections^1!!");
	while( isAlive( player ) && isDefined( player ) )
	wait 1;
	}
}

bounce()
{
	level.bounce_trig = getEnt( "bou_t", "targetname");
	jump = getEnt( "bou_j", "targetname" );
	acti = getEnt( "bou_a", "targetname" );
	
	while(1)
	{
		level.bounce_trig SetHintstring ("Press ^3&&1 ^7for ^1Bounce RooM!");
		level.bounce_trig waittill( "trigger", player );
		if( !isDefined( level.bounce_trig ) )
			return;


		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^7has chosen ^1Bounce^7!");
		wait 1;
		iPrintLnBold("^1[^73^1]");
		wait 1;
		iPrintLnBold("^1[^72^1]");
		wait 1;
		iPrintLnBold("^1[^71^1]");
		wait 1;
		iPrintLnBold("^1[^7FIGHT!^1]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	}
}

v1()
{
	trig = getent ("visszab2", "targetname");
	end = getent ("bvissza2", "targetname");

	while(1)
	{	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}

v2()
{
	trig = getent ("visszab", "targetname");
	end = getent ("bvissza", "targetname");

	while(1)
	{	
	trig waittill ("trigger", player);
	player SetOrigin (end.origin);
	player SetPlayerAngles (end.angles);
	wait 0.1;
	}
}

knife()
{
	level.knife_trig = getEnt( "knife_t", "targetname");
	jump = getEnt( "knife_j", "targetname" );
	acti = getEnt( "knife_a", "targetname" );
	
	while(1)
	{
		level.knife_trig SetHintstring ("Press ^3&&1 ^7for ^1Knife RooM!");
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;


		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );
		player giveMaxAmmo( "knife_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );
		level.activ GiveMaxAmmo( "knife_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^7has chosen ^1Knife^7!");
		wait 1;
		iPrintLnBold("^1[^73^1]");
		wait 1;
		iPrintLnBold("^1[^72^1]");
		wait 1;
		iPrintLnBold("^1[^71^1]");
		wait 1;
		iPrintLnBold("^1[^7FIGHT!^1]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	}
}

sniper()
{
	level.sniper_trig = getEnt( "sniper_t", "targetname");
	jump = getEnt( "sniper_j", "targetname" );
	acti = getEnt( "sniper_a", "targetname" );
	
	while(1)
	{
		level.sniper_trig SetHintstring ("Press ^3&&1 ^7for ^1Sniper RooM!");
		level.sniper_trig waittill( "trigger", player );
		if( !isDefined( level.sniper_trig ) )
			return;

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		level.activ GiveMaxAmmo( "m40a3_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		player switchToWeapon( "m40a3_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		level.activ switchToWeapon( "m40a3_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^7has choosen ^1Sniper^7!");
		wait 1;
		iPrintLnBold("^1[^73^1]");
		wait 1;
		iPrintLnBold("^1[^72^1]");
		wait 1;
		iPrintLnBold("^1[^71^1]");
		wait 1;
		iPrintLnBold("^1[^7FIGHT!^1]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	}
}

deagle()
{
	level.deagle_trig = getEnt( "deagle_t", "targetname");
	jump = getEnt( "deagle_j", "targetname" );
	acti = getEnt( "deagle_a", "targetname" );
	
	while(1)
	{
		level.deagle_trig SetHintstring ("Press ^3&&1 ^7for ^1Deagle RooM!");
		level.deagle_trig waittill( "trigger", player );
		if( !isDefined( level.deagle_trig ) )
			return;

		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "deserteagle_mp" );
		player giveMaxAmmo( "deserteagle_mp" );;
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "deserteagle_mp" );
		level.activ GiveMaxAmmo( "deserteagle_mp" );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait 0.05;
		player switchToWeapon( "deserteagle_mp" );
		level.activ switchToWeapon( "deserteagle_mp" );
		level.activ setclientDvar("cg_fovscale", 1.3);
		player setclientDvar("cg_fovscale", 1.3);
  		iPrintLnBold("^1" + player.name + " ^7has choosen ^1Deagle^7!");
		wait 1;
		iPrintLnBold("^1[^73^1]");
		wait 1;
		iPrintLnBold("^1[^72^1]");
		wait 1;
		iPrintLnBold("^1[^71^1]");
		wait 1;
		iPrintLnBold("^1[^7FIGHT!^1]");
		player freezeControls(0);
		level.activ freezeControls(0);
	
	}
}