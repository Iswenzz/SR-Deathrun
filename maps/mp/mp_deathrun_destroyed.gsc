main()
{
	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_destroyed");
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("compassmaxrange","1600");

	setExpFog(100, 1000, 0.4, 0.425, 0.44, 0.0);

	thread door();
	thread trap();
	thread noob();
	thread fearz();
	thread cool();
	thread troll();
	thread ohhi();
	thread vanish();
	thread roll();
	thread here();
	thread harry();
	thread truck();
	thread final();
	thread text();
	
	addTriggerToList( "vanish_trigger" );
	addTriggerToList( "trap2_trigger" );
	addTriggerToList( "trap3_trigger" );
	addTriggerToList( "trap4_trigger" ); 
	addTriggerToList( "trap5_trigger" );
	addTriggerToList( "trap6_trigger" );
	addTriggerToList( "trap7_trigger" );
	addTriggerToList( "trap9_trigger" );
	addTriggerToList( "trap10_trigger" );
	addTriggerToList( "trap11_trigger" );
	
}

addTriggerToList( name ) 
{
	if( !isdefined( level.trapTriggers) )
		level.trapTriggers = [];
		
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

door()
{
	door = getEnt( "door", "targetname" );
	trigger = getEnt( "door_trigger", "targetname" );

	trigger waittill( "trigger", who ); // wait for user
	iPrintlnBold( who.name + " ^3finished first!" );
	door moveZ(-128,1 ); // move brush -128 units to the left (open doors)

	wait 5;

	//door moveX( 128,1 ); // move brush 128 units to the right (close doors)
}

trap()
{
	trap8 = getEnt ( "trap8", "targetname");
	
	while (1) // this is a loop so it can stay forever
	{
		trap8 movex (-980,5); // the 980 = unitis to move 5 the time :)
		wait 7;
		
		trap8 movex (980,5); // moveback
		wait 7;
	}
}

noob()
{
    trap3 = getEnt ( "trap3", "targetname");
	trap3_trigger = getEnt( "trap3_trigger", "targetname");
	trap3_trigger waittill( "trigger", who );
	trap3_trigger delete();
	{
	    trap3 moveZ (636,1); // move up
        wait 5;
        trap3 moveZ (-636,1); // move down
	}
}	

fearz()
{
	trap4 = getEnt ( "trap4", "targetname");
	trap4_trigger = getEnt ( "trap4_trigger", "targetname");
	trap4_hurt = getEnt ( "trap4_hurt", "targetname");
	trap4_hurt enablelinkto();
	trap4_hurt linkto(trap4);
	trap4_trigger waittill( "trigger", who );
	trap4_trigger delete();
	{
		trap4 moveZ( 56, 1 );
		wait 5;
		trap4 moveZ( -56, 1 );
	}
}

cool()
{
	trap6 =getEnt ( "trap6", "targetname");
	trap6_trigger = getEnt ( "trap6_trigger", "targetname");
	trap6_trigger waittill( "trigger", who );
	trap6_trigger delete();
	
	while (1)
	{
		trap6 rotatepitch (-360,5);
		wait 5;
	}
}

troll()
{
	trap7 =getEnt ( "trap7", "targetname");
	trap7_trigger =getEnt ( "trap7_trigger", "targetname");
	trap7_trigger waittill( "trigger", who );
	trap7_trigger delete();
	
	while(1)
	{
		trap7 rotateroll (360,5);
		wait 5;
	}
}	

ohhi()
{
	trap5 = getEnt ( "trap5", "targetname");
	trap5_trigger = getEnt ( "trap5_trigger", "targetname");
	trap5_hurt = getEnt ( "trap5_hurt", "targetname");
	trap5_spike = getEnt ( "trap5_spike", "targetname");
	trap5_hurt enablelinkto();
	trap5_hurt linkto (trap5_spike);
	trap5_trigger waittill( "trigger", who );
	trap5_trigger delete();
	{
		trap5 moveZ (-96,1);
		wait 1;
		trap5_spike  moveZ (52,1);
		wait 3;
		trap5_spike moveZ (-52,1);
		wait 6;
		trap5 moveZ (96,1);
	}
}

vanish()
{
	vanish_trigger = getent("vanish_trigger", "targetname");
    vanish1 = getentarray("vanish_part1", "targetname");
    vanish2 = getentarray("vanish_part2", "targetname");
    vanish_trigger waittill( "trigger" );
    vanish_trigger delete();

    {
		vanish1[RandomInt(vanish1.size)] Notsolid();
		vanish2[RandomInt(vanish2.size)] Notsolid();
	}
}

roll()
{
    pendulum1 = getEnt("pendulum1", "targetname");
    pendulum2 = getEnt("pendulum2", "targetname");
    trap2_trigger = getEnt ("trap2_trigger", "targetname");
    trap2_trigger waittill( "trigger", who );
    trap2_trigger delete();
    
    while(1)
	{
        pendulum1 rotateroll (360,3);
        pendulum2 rotateroll (-360,3);
		wait 3;
    }
}

here()
{
	trap11b = getEnt ("trap11b", "targetname");
	trap11a = getEnt ("trap11a", "targetname");
	trap11_trigger = getEnt ("trap11_trigger", "targetname");
	trap11_trigger waittill( "trigger", who );
	trap11_trigger delete();
	{
		trap11b moveZ (-355,1);
		wait 3;
		trap11b moveZ (355,1);
		wait 2;
		trap11a moveZ (-355,1);
		wait 3;
		trap11a moveZ (355,1);
	}
}

harry()
{
	smile = getEnt ( "smile", "targetname" );
	harry_trigger = getEnt( "harry_trigger", "targetname" );

	harry_trigger waittill( "trigger", who ); // wait for user
	iPrintlnBold( who.name + " ^3Found iNext.Harry! But Harry killed him :<" );
	
	smile moveY (1,1);
	who suicide();
}

truck()
{
	trap9a = getEnt ( "trap9a", "targetname");
	trap9a_hurt = getEnt ( "trap9a_hurt", "targetname");
	trap9b = getEnt ( "trap9b", "targetname");
	trap9b_hurt = getEnt ( "trap9b_hurt", "targetname");
	trap9c = getEnt ( "trap9c", "targetname");
	trap9c_hurt = getEnt ( "trap9c_hurt", "targetname");
	trap9d = getEnt ( "trap9d", "targetname");
	trap9d_hurt = getEnt ( "trap9d_hurt", "targetname"); 
	trap9_trigger = getEnt ( "trap9_trigger", "targetname");
	trap9a_hurt enablelinkto();
	trap9a_hurt linkto(trap9a);
	trap9b_hurt enablelinkto();
	trap9b_hurt linkto(trap9b);
	trap9c_hurt enablelinkto();
	trap9c_hurt linkto(trap9c);
	trap9d_hurt enablelinkto();
	trap9d_hurt linkto(trap9d);
	trap9_trigger waittill( "trigger", who );
	trap9_trigger delete();
	{
		trap9a moveY (404,2);
		trap9b moveY (404,2);
		trap9c moveY (-404,2);
		trap9d moveY (-404,2);
		wait 5;
		trap9a moveY (-404,2);
		trap9b moveY (-404,2);
		trap9c moveY (404,2);
		trap9d moveY (404,2);
	}
}

final()
{
	trap10a = getEnt ( "trap10a", "targetname");
	trap10a_hurt = getEnt ( "trap10a_hurt", "targetname");
	trap10b = getEnt ( "trap10b", "targetname");
	trap10b_hurt = getEnt ( "trap10b_hurt", "targetname");
	trap10c = getEnt ( "trap10c", "targetname");
	trap10c_hurt = getEnt ( "trap10c_hurt", "targetname");
	trap10d = getEnt ( "trap10d", "targetname");
	trap10d_hurt = getEnt ("trap10d_hurt", "targetname");
	trap10_trigger = getEnt ("trap10_trigger", "targetname");
	trap10a_hurt enablelinkto();
	trap10a_hurt linkto(trap10a);
	trap10b_hurt enablelinkto();
	trap10b_hurt linkto(trap10b);
	trap10c_hurt enablelinkto();
	trap10c_hurt linkto(trap10c);
	trap10d_hurt enablelinkto();
	trap10d_hurt linkto(trap10d);
	trap10_trigger waittill( "trigger", who );
	trap10_trigger delete();
	{
		trap10a moveY (2748,2);
		trap10c moveY (-2548,2);
		wait 2;
		trap10b moveY (2748,4);
		trap10d moveY (-2548,4);
	}
}

text()
{
    for(;;)
    {
		wait 60;
        iPrintln("Map made by ^1iNext.FearZ");
    }
}