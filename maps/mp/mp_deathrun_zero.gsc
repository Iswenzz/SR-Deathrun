main()
{
	maps\mp\_load::main();
	maps\createfx\mp_deathrun_zero_fx::main();
	maps\mp\mp_deathrun_zero_fx::main();
	
	maps\mp\mp_deathrun_zero\fx_load::main();
	maps\mp\mp_deathrun_zero\teleport::main();
	maps\mp\mp_deathrun_zero\teleport2::main();//pridat hlasku o dverich
	maps\mp\mp_deathrun_zero\door::main();
	maps\mp\mp_deathrun_zero\population::main();
	
	maps\mp\mp_deathrun_zero\traps\rotor1::main();
	maps\mp\mp_deathrun_zero\traps\rotor2::main();
	maps\mp\mp_deathrun_zero\traps\mackac1::main();
	maps\mp\mp_deathrun_zero\traps\mackac2::main();
	maps\mp\mp_deathrun_zero\traps\blesky1::main();//dodelat
	maps\mp\mp_deathrun_zero\traps\fire1::main();//dodelat
	maps\mp\mp_deathrun_zero\traps\propadlo::main();
	
	maps\mp\mp_deathrun_zero\auto\mover1::main();
	maps\mp\mp_deathrun_zero\auto\tlacic1::main();
	maps\mp\mp_deathrun_zero\auto\fan1::main();
	maps\mp\mp_deathrun_zero\auto\fan2::main();
	maps\mp\mp_deathrun_zero\auto\pady1::main();//dodelat
	
	//maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_zero");

	//setExpFog(500, 2200, 0.81, 0.75, 0.63, 0);
	VisionSetNaked( "mp_deathrun_zero" );
	ambientPlay("music_zero");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
/*
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
*/
	setdvar("compassmaxrange","2000");
	
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( "tmackac1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "tfire1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trotor1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "tblesky1", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "trotor2", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "tmackac2", "targetname" );
    level.trapTriggers[level.trapTriggers.size] = getEnt( "tpropadlo1", "targetname" );
	level.trapTriggers[level.trapTriggers.size] = getEnt( "tpropadlo2", "targetname" );
}
