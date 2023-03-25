main()
{

	//***************************//
    maps\mp\_load::main();

	//***** script ******//
	maps\mp\mp_dr_jurapark\traps::main();
	maps\mp\mp_dr_jurapark\visual::main();
	//maps\mp\mp_dr_jurapark\mp_dr_jurapark::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_jurapark");	
	setdvar("compassmaxrange","1750");

	AmbientPlay( "song1" );
	
	//***************************//

        game["allies"] = "sas";
        game["axis"] = "opfor";
        game["attackers"] = "axis";
        game["defenders"] = "allies";
        game["allies_soldiertype"] = "woodland";
        game["axis_soldiertype"] = "woodland";

	//setdvar( "r_specularcolorscale", "1" );
	
	//setdvar("r_glowbloomintensity0",".25");
	//setdvar("r_glowbloomintensity1",".25");
	//setdvar("r_glowskybleedintensity0",".3");
	//setdvar("compassmaxrange","1800");
}