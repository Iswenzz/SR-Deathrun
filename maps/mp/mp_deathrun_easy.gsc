/*
//    +========================================================================+
//    I                    ___  _____  _____                                   I
//    I                   /   !!  __ \!  ___!                                  I
//    I                  / /! !! !  \/! !_          ___  ____                  I
//    I                 / /_! !! ! __ !  _!        / __!!_  /                  I
//    I                 \___  !! !_\ \! !      _  ! (__  / /                   I
//    I                     !_/ \____/\_!     (_)  \___!/___!                  I
//    I========================================================================I
//    I                           mp_deathrun_easy                             I
//    I========================================================================I
//    I                      mapped by:  r3mien@4gf.cz                         I
//    I                    scripted by:  mnaauuu@4gf.cz                        I
//    I                         website: www.4GF.cz                            I
//    I========================================================================I
//    I                Compatible with original Deathrun by BraX               I
//    +========================================================================+
*/

main()
{
	maps\mp\_load::main();
	maps\createfx\mp_deathrun_easy_fx::main();
	maps\mp\mp_deathrun_easy_fx::main();
	
	thread maps\mp\mp_deathrun_easy\billboard1::init();
	thread maps\mp\mp_deathrun_easy\billboard2::init();
	thread maps\mp\mp_deathrun_easy\teleport::main();
	thread maps\mp\mp_deathrun_easy\teleport2::main();
	thread maps\mp\mp_deathrun_easy\teleport3::main();
	thread maps\mp\mp_deathrun_easy\teleport4::main();
	thread maps\mp\mp_deathrun_easy\teleport5::main();
	thread maps\mp\mp_deathrun_easy\teleport6::main();
	thread maps\mp\mp_deathrun_easy\door_end::main();
	thread maps\mp\mp_deathrun_easy\door_start::main();
	thread maps\mp\mp_deathrun_easy\servers::main();
	thread maps\mp\mp_deathrun_easy\population::main();
	thread maps\mp\mp_deathrun_easy\death_counter::main();
	thread maps\mp\mp_deathrun_easy\modes::main();
	thread maps\mp\mp_deathrun_easy\coins::main();
	
	thread maps\mp\mp_deathrun_easy\ends\end_1::main();
	thread maps\mp\mp_deathrun_easy\ends\end_2::main();
	thread maps\mp\mp_deathrun_easy\ends\end_3::main();
	thread maps\mp\mp_deathrun_easy\ends\end_4::main();
	thread maps\mp\mp_deathrun_easy\ends\end_5::main();
	thread maps\mp\mp_deathrun_easy\ends\end_6::main();
	thread maps\mp\mp_deathrun_easy\ends\end_7::main();
	thread maps\mp\mp_deathrun_easy\ends\end_8::main();
	
	thread maps\mp\mp_deathrun_easy\traps\trap0::main();
	thread maps\mp\mp_deathrun_easy\traps\trap1::main();
	thread maps\mp\mp_deathrun_easy\traps\trap2::main();
	thread maps\mp\mp_deathrun_easy\traps\trap3::main();
	thread maps\mp\mp_deathrun_easy\traps\trap4::main();
	thread maps\mp\mp_deathrun_easy\traps\trap5::main();
	thread maps\mp\mp_deathrun_easy\traps\trap6::main();
	thread maps\mp\mp_deathrun_easy\traps\trap7::main();
	thread maps\mp\mp_deathrun_easy\traps\trap8::main();
	thread maps\mp\mp_deathrun_easy\traps\trap9::main();
	thread maps\mp\mp_deathrun_easy\traps\trap10::main();
	thread maps\mp\mp_deathrun_easy\traps\trap11::main();
	thread maps\mp\mp_deathrun_easy\traps\trap12::main();
	thread maps\mp\mp_deathrun_easy\traps\trap13::main();
	thread maps\mp\mp_deathrun_easy\traps\trap14::main();
	thread maps\mp\mp_deathrun_easy\traps\trap15::main();
	thread maps\mp\mp_deathrun_easy\traps\trap16::main();
	thread maps\mp\mp_deathrun_easy\traps\trap17::main();
	thread maps\mp\mp_deathrun_easy\traps\trap18::main();
	thread maps\mp\mp_deathrun_easy\traps\trap19::main();
	thread maps\mp\mp_deathrun_easy\traps\trap20::main();
	
	//maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_easy");

	VisionSetNaked( "mp_deathrun_easy" );
	ambientPlay("music_easy");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar("compassmaxrange","2000");
	
	thread SetTimeLimit( 6 );

	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap0", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap1", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap2", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap3", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap4", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap5", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap6", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap7", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap8", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap9", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap10", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap11", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap12", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap13", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap14", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap15", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap16", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap17", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap18", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap19", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "trap20", "targetname" );

}

SetTimeLimit( time )
{
    wait 0.05; //wait for game to load mod script
	if( level.dvar["time_limit"] <= time )
		level.dvar["time_limit"] = time;
}
