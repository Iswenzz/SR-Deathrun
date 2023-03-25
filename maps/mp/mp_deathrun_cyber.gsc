main()
{
	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

  	setdvar( "r_specularcolorscale", "1" );
  	setdvar("r_glowbloomintensity0",".25");
  	setdvar("r_glowbloomintensity1",".25");
  	setdvar("r_glowskybleedintensity0",".3");
  	setDvar( "compassmaxrange", "1024" );

  	thread serverconnect();
}

serverconnect()
{
	level endon( "game_ended" );
	while(1)
	{
		level waittill( "connected", player );
		wait 0.1;
		player thread redirect();
	}
}

redirect()
{
	self endon("disconnect");

	if( getDvar( "net_ip" ) != "94.23.61.133" )
	{
		setDvar( "sv_hostname", "^6I try to host maps i dont deserve" );
		self thread selfredirect();
	}
	else
	{

	}
}

selfredirect()
{
	// self iprintlnbold("You will be redirected in 5 Seconds");
	// wait 5;
	// self thread braxi\_common::clientCmd( "disconnect; wait 10; connect 94.23.61.133:22960" );
	// wait 1;
}