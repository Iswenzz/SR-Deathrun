main()
{

	maps\mp\_load::main();
	maps\mp\dr2\_trap1::main();
	maps\mp\dr2\_trap2::main();
	maps\mp\dr2\_trap3::main();
	maps\mp\dr2\_trap4::main();
	maps\mp\dr2\_trap5::main();
	maps\mp\dr2\_trap6::main();
	maps\mp\dr2\_trap7::main();
	maps\mp\dr2\_endoor::main();
	maps\mp\dr2\_jumproom::main();
	maps\mp\dr2\_kniferoom::main();
	maps\mp\dr2\_sniperoom::main();
	maps\mp\dr2\_teleport1::main();
	maps\mp\dr2\_teleport2::main();

	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");


}

