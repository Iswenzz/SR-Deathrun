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
//Map by Lolz      |      Scripted by Lolz\\
//        Nickname i have in game :       \\
//   Lolz :] -SuX Lolz :] -#FNRP#Lolz :]  \\
//xFire:  alex1528  -  Report any bugs :D \\
//Ty To  Cold Coffe & LOSSY for Helping me\\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

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

	setdvar("compassmaxrange","1600");

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000000000 );
	setDvar("bg_falldamageminheight", 15000000000 );

	thread lolzlogo5();
	thread speedon();
	thread speedoff();

}

lolzlogo5()
{
    lolz1 = getent("lolz_turn_5","targetname");

    while(1)
    {
        lolz1 rotateYaw(360, 5);
		wait 1;
    }
}

speedon()
{
speedon = getEnt("trigger_hard_speed_on","targetname");

for(;;)
{
speedon waittill("trigger", player);
player endon("disconnect");
// player setClientDvar("g_speed", 500 );
// player setClientDvar("g_gravity", 500 );
player antiglitch2();

while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}
antiglitch2() //ng2
{
// self common_scripts\utility::waittill_any("death","disconnect");
// self setClientDvar("g_gravity", 800 );
// self iPrintlnBold("^1Anti Glitch System...");
// wait 2;
// self thread braxi\_common::clientCmd( "reconnect" );
}

speedoff()
{
speedoff = getEnt("trigger_hard_speed_off","targetname");

for(;;)
{
speedoff waittill("trigger", player);
player endon("disconnect");
// player setClientDvar("g_speed", 220 );
// player setClientDvar("g_gravity", 800 );
player antiglitch1();

while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}
antiglitch1() //ng2
{
// self common_scripts\utility::waittill_any("death","disconnect");
// self setClientDvar("g_gravity", 800 );
// self iPrintlnBold("^1Anti Glitch System...");
// wait 2;
// self thread braxi\_common::clientCmd( "reconnect" );
}

