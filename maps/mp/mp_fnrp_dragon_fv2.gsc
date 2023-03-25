main()
{


	maps\mp\_load::main();

	maps\mp\_compass::setupMiniMap("compass_map_mp_fnrp_dragon_fv2");

	//ambientPlay("ambient_crossfire");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("compassmaxrange","2000");
}