/*
###############################
                       _  __ ##
 ____           ____  | |/ / ##
|  _ \   / \   |  _ \ | ' /  ##
| | | | / _ \  | |_) ||  <   ##
| |_| |/ ___ \ |  _ <|| . \  ##
|____//_/   \_\|_| \_\|_|\_\ ##
###############################
*/
main()
{
    maps\mp\_load::main();
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	
	
	thread GetActivator();
	thread MakeTriggers();
	
	
}

MakeTriggers()
{
	level.trapTriggers[0] = getent("trigger1", "targetname");

}

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}

trapN1()
{
	while(1)
	{
		self waittill("trigger");

		maps\mp\dr_trap_1::main();
		self delete();
		break;
	}
	
}

trap2()
{
trap = getEnt("trap2","targetname");

	while( 1 )
	{
	trap rotateYaw(360, 1);
	trap waittill("movedone");
	wait 4; 
	}
}

trap3()
{
trap = getEnt("trap3","targetname");

	while( 1 )
	{
	trap rotateYaw(360, 1);
	trap waittill("movedone");
	wait 6; 
	}
}