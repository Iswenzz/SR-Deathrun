/*   __        _____  __  __ ______ _____  _____  
    / _| /\   |  __ \|  \/  |  ____|  __ \|  __ \ 
   | |_ /  \  | |__) | \  / | |__  | |__) | |__) |
   |  _/ /\ \ |  _  /| |\/| |  __| |  _  /|  _  / 
   | |/ ____ \| | \ \| |  | | |____| | \ \| | \ \ 
   |_/_/    \_\_|  \_\_|  |_|______|_|  \_\_|  \_\

  Mapped and Scripted: fARMERR and Speedex
  Biggest thanks to Speedex for help!

  ( Do not COPY without permissions! )
  If you use these scripts put me in credits please ( fARMERR )

  mp_dr_sunset_v2 is coming soon!

*/


#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

main()
{
	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	SetDvar( "r_specularcolorscale", "1" );

	AmbientPlay( "ambient" );

	PreCacheItem( "remington700_mp" );

	thread Traps();
	thread secret();
	thread Old();
	thread wall();

}

addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}

secret()
{
	thread secretin();
	thread secretout();
}

Traps()
{
	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
}

trap1()
{
	wall = getEnt("trap1","targetname");
	trig = getEnt("trap1_trig","targetname");

	wall Hide();
	wall NotSolid();

	trig SetHintString("Press ^1F ^7to activate the trap!");
    trig waittill( "trigger" );
    trig Delete();

    wall Show();
    wall Solid();
    wait 5;
    wall Hide();
    wall NotSolid();
}

trap2()
{
	trap = getEnt("trap2","targetname");
	trig = getEnt("trap2_trig","targetname");

	trig SetHintString("Press ^1F ^7to activate the trap!");
    trig waittill( "trigger" );
    trig Delete();

    for(;;)
    {
    	trap RotateYaw(360, 2);
        trap waittill( "rotatedone" );
        trap RotateYaw(360, 2);
    }
}

trap3()
{
	spikes = getEnt("trap3","targetname");
	trig = getEnt("trap3_trig","targetname");
	hurt = getEnt("trap3_hurt","targetname");

	hurt EnableLinkTo();
	hurt LinkTo( spikes );

	spikes Hide();

	trig SetHintString("Press ^1F ^7to activate the trap!");
    trig waittill( "trigger" );
    trig Delete();

    spikes Show();
    spikes moveZ(64, 3);
    spikes waittill( "movedone" );
    wait 3;
    spikes moveZ(-64, 3);
    spikes Hide();
}

trap4()
{
	platforms = getEnt("trap4","targetname");
	trig = getEnt("trap4_trig","targetname");

	trig SetHintString("Press ^1F ^7to activate the trap!");
    trig waittill( "trigger" );
    trig Delete();

    platforms NotSolid();
}

trap5()
{
	splatter = getEnt("trap5","targetname");
	trig = getEnt("trap5_trig","targetname");
	hurt = getEnt("trap5_hurt","targetname");

	hurt EnableLinkTo();
	hurt LinkTo( splatter );

	splatter Hide();

	trig SetHintString("Press ^1F ^7to activate the trap!");
    trig waittill( "trigger" );
    trig Delete();

    splatter Show();
    splatter moveZ(-208, 1);
    splatter waittill( "movedone" );
    wait 2;
    splatter moveZ(208, 3);
    splatter waittill( "movedone" );
    splatter Hide();
}

secretin()
{
	trig = getEnt("secret_trig","targetname");
	tele = getEnt("secret","targetname");

	trig waittill("trigger", player);
	trig Delete();

	player SetOrigin( tele.origin );

	wait 0.1;

	IPrintLnBold( player.name + " ^2has found my secret!" );
}

secretout()
{
	trig = getEnt("secretout_trig","targetname");
	tele = getEnt("secretout","targetname");

	trig waittill("trigger", player);
	trig Delete();

	player SetOrigin( tele.origin );

	wait 0.1;

	IPrintLnBold( player.name + " ^2has finished my secret!" );

	player GiveWeapon( "remington700_mp" );
	player SwitchToWeapon( "remington700_mp" );
	player GiveMaxAmmo();
}

wall()
{
	wall = getEnt("acti_wall","targetname");

	wall Hide();
}

Old()
{
	door = getEnt("old_door","targetname");
	trig = getEnt("old_trig","targetname");

	trig waittill("trigger", player);
	trig Delete();

	IPrintLnBold( player.name + " ^2opened the door!" );

	door moveZ(-184, 2);
	door waittill( "movedone" );
	door Delete();
}