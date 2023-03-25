//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//    __              ___                 \\
//   /\ \            /\_ \                \\
//   \ \ \        ___\//\ \    ____       \\
//    \ \ \  __  / __`\\ \ \  /\_ ,`\     \\
//     \ \ \L\ \/\ \L\ \\_\ \_\/_/  /_    \\
//      \ \____/\ \____//\____\ /\____\   \\
//       \/___/  \/___/ \/____/ \/____/   \\
// 								          \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//Map by Demonic    |     Scripted by Lolz\\
//        Nickname i have in game :       \\
//   Lolz :] -SuX Lolz :] -#FNRP#Lolz :]  \\
//xFire:  alex1528  -  Report any bugs :D \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
 maps\mp\_load::main();
 maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_slowwalk");
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
	//SETDVAR**
	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","1600");

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 2000000000 );
	setDvar("bg_falldamageminheight", 1500000000 );
	//SETDVAR*

	//THREAD**
	thread messages();
	//THREAD*

	//PRECACHE**
	//PRECACHE*

	//ACTI TRIGGER
	//ACTI TRIGGER

}

addTestClients()
{
setDvar("scr_testclients", "");
wait 1;
for(;;)
{
if(getdvarInt("scr_testclients") > 0)
break;
wait 1;
}
testclients = getdvarInt("scr_testclients");
setDvar( "scr_testclients", 0 );
for(i=0;i<testclients;i++)
{
ent[i] = addtestclient();
 
if (!isdefined(ent[i]))
{
println("Could not add test client");
wait 1;
continue;
}
ent[i].pers["isBot"] = true;
ent[i] thread TestClient("autoassign");
}
thread addTestClients();
}
TestClient(team)
{
self endon( "disconnect" );
 
while(!isdefined(self.pers["team"]))
wait .05;
 
self notify("menuresponse", game["menu_team"], team);
wait 0.5;
//scr_testclients 4
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

cleanUp()
{
	if( !isDefined( self ) )
		return;
 
	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
				self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
}

messages() //Start Message :]
{
wait 10;
iprintlnBold("^5Welcome ^7to .........");
wait 1;
}

