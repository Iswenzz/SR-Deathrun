#include maps\mp\gametypes\_hud_util;

/*
mp_dr_steelv2
Map Made by Elpredatore		xf: elpredatore
Scripted by TwiYo				xf: 1buzz
Created for Braxi's Deathrun 1.2 mod for CoD4
www.ix-treme.com and www.deathrun.org

/////////////////////////////////////////////////////////////////////
//[][][][][][][][]/[]////////////////[] []//[]//////[]///////////////
/////////[]/////////[]//////////////[]///////[]////[]////////////////
/////////[]//////////[]////////////[]///[]////[]//[]///[][][][][][]//
/////////[]///////////[]////[]////[]////[]/////[][]////[]////////[]//
/////////[]////////////[]//[][]//[]/////[]//////[]/////[]////////[]//
/////////[]/////////////[][]//[][]//////[]//////[]/////[][][][][][]//
/////////////////////////////////////////////////////////////////////
*/

main()
	{
	maps\mp\_load::main();
	//maps\mp\mp_dr_steelv2_sound_fx::main();
	//maps\createfx\mp_dr_steelv2_fx::main();

	thread Ambient();
	thread jukeBox();

	setExpFog(500, 2200, 0.81, 0.75, 0.63, 0.5);
	precacheItem("ak74u_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
	precacheItem("tomahawk_mp");
	precacheItem("deserteagle_mp");
	precacheItem("uzi_mp");
	precacheItem("m4_mp");
	precacheItem("ak47_mp");
	precacheItem("g3_mp");
	precacheItem("m60e4_mp");
	precacheItem("p90_mp");
	precacheItem("m40a3_mp");
	precacheItem("barrett_mp");
	precacheItem("g36c_silencer_mp");
	precacheItem("skorpion_silencer_mp");
	precacheItem("saw_grip_mp");
	precacheModel("Yuusha_2");
	level.rainbowfire = loadFX("deathrun/rainbowfire");
	level.fire1 = loadFX("deathrun/fire1");
	playLoopedFX(level.fire1, 0.05, (7520.62, 663.391, 1270));
	playLoopedFX(level.rainbowfire, 0.05, (7520.2, 661 , 1226));
	playLoopedFX(level.rainbowfire, 0.05, (8892.29, 676.901, 1288));
	level.fire = loadfx("test/jeepride_smokeblind");

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	thread startdoor();
	thread setupServers();
	thread printCredits();
	thread extracredits();
	/////////////////////TRAPS/////////////////
	thread trap1();
	thread knopf();
	thread exit();
	thread trap2();
	thread trap3platten();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	addTriggerToList("trap1_trigger");
	addTriggerToList("trap2_trigger");
    addTriggerToList("trap3_trigger");
	addTriggerToList("trap4_trigger");
	addtriggerTolist("trap5_trigger");
	addtriggerTolist("trap6_trigger");
	addtriggerTolist("trap7_trigger");
	addtriggerTolist("trap8_trigger");
	addtriggerTolist("trap9_trigger");
	addtriggerTolist("trap10_trigger");
	/////////////////////LIFTS/////////////////
	thread liftdoor();
	thread liftjumper();
	thread liftacti();
	////////////////////Secret's/////////////////
	thread secret3();
	thread secret3respawn1();
	thread secret3_respawn2();
	thread secret3_teil2();
	thread secret3_respawn3();
	thread secret3_ausgang();
	thread jukesecret();
	thread secret();
	thread secretdoor();
	thread ausgang();
	//thread secrettrap();
	thread respawn1();
	thread respawn2();
	thread secret2();
	thread secret2respawn();
	thread secret2exit_1();

	setupJumppads();

if( isDefined( level.jumppads ) && level.jumppads.size )
{
for( i = 0 ; i < level.jumppads.size ; i++ )
{
pad = level.jumppads[i];
if( !isDefined( pad ) )
continue;
spawnJumppad( pad.origin , pad.angles , pad.height , pad.radius , pad.dirPos , pad.model , pad.power , pad.sound );

jumppads = getEntArray( "jumppad" , "targetname" );
if( isDefined( jumppads ) && jumppads.size )
{
for( i = 0 ; i < jumppads.size ; i++ )
{
pad = jumppads[i];
if( !isDefined( pad ) )
continue;
pad thread monitorUsage();
}
}
}
}
	///////////////////////////////////////////
	thread actiteleport();
	thread actiteleportjumper();
	///////////////////////////////////////////
	thread tunnel1();
	thread tunnel2();
	thread tunnel3();
	thread tunnel4();
	thread tunnel5();
	thread tunnel6();
	thread tunnel7();
	thread tunnel8();
	thread tunnel9();
	thread tunnel10();
	thread tunnel11();
	thread tunnel12();
	thread tunnel13();
	thread tunnel14();
	thread tunnel15();
	thread tunnel16();
	thread tunnel17();
	thread tunnel18();
	thread train();
	///////////////////////ENDROOMS////////////
	thread sniperfight();
	thread ammobox1();
	thread ammobox2();
	thread knifefight();
	thread bouncefight();
	thread KnifeRotateFight();
	thread oldfight();
	thread bounceweapon();
	thread knife_respawn();
	thread bouncerespawn();
	thread disco();
	thread deko();
}

exit2()
{
		trigger = getent ("exit2_trigger", "targetname");
		target  = getent ("spawn", "targetname");

		trigger waittill("trigger", Player);
		wait .1;
		player detachAll();
		player setModel("Yuusha_2");
		wait .1;
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
}



setupJumppads() //3 als beispiel
{
//precacheModel( "xmodel/serthy_buildzone" );                         //falls model erw�nscht, unbeding precachen! sonst crasht der server

level.jumppads = [];                                            // ganz wichtig! muss zuerst stehen!

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2104,-4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2136 ,-4600, 1368 );          //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2168 ,-4600, 1368  );          //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2200 ,-4600, 1368   );          //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2232,-4600, 1368  );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2264  ,-4600, 1368 );          //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2296 ,-4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2328 ,-4600,  1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );          //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = (  2360  , -4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2392 ,-4600, 1368   );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2424  ,-4600, 1368   );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );           //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = (2456, -4600,1368   );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2488, -4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2520, -4600, 1368  );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );             //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2552, -4600, 1368  );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2584, -4600, 1368  );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );            //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2616, -4600, 1368  );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );              //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2648, -4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );         //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //muss immer zuerst stehen bei jedem neuen jumppad
level.jumppads[level.jumppads.size - 1].origin = ( 2680, -4600, 1368 );        //wo?
level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );             //winkel?
level.jumppads[level.jumppads.size - 1].height =  1;                       //trigger h�he
level.jumppads[level.jumppads.size - 1].radius = 5;                        //trigger radius
level.jumppads[level.jumppads.size - 1].dirPos = ( 9341 , -9837 , 4696 );         //richtung, sollte im bereich von +/- 50 neben dem origin sich befinden: origin + ( 50 , -30 , 32 )
//level.jumppads[level.jumppads.size - 1].model = "xmodel/serthy_buildzone";      //damit man es erkennt? muss precached werden!!!
level.jumppads[level.jumppads.size - 1].power = 150000;                      //wie stark das jumppad ist
//level.jumppads[level.jumppads.size - 1].sound = "minefield_click";          //sound welcher abgespielt wird

level.jumppads[level.jumppads.size] = spawnStruct();                        //minimale anforderungen
level.jumppads[level.jumppads.size - 1].origin = ( 2342 , 123 , 73 );           //minimale anforderungen

level.jumppads[level.jumppads.size] = spawnStruct();                        //minimale anforderungen
level.jumppads[level.jumppads.size - 1].origin = ( 3434 , 32 , -17 );           //minimale anforderungen
}

spawnJumppad( origin , angles , height , radius , dirPos , model , power , sound )
{
if( !isDefined( radius ) )      radius = 5;
if( !isDefined( height ) )      height = 1;
if( !isDefined( angles ) )      angles = ( 0 , 0 , 0 );

jumppad = spawn( "trigger_radius" , origin , 0 , radius , height );
jumppad.angles = angles;
jumppad.targetname = "jumppad";
jumppad.jumpSound = sound;
jumppad.power = power;

if( isDefined( model ) )
{
jumppad.vis = spawn( "script_model" , origin );
jumppad.vis setmodel( model );
}

if( isDefined( dirPos ) )
jumppad.dir = vectorNormalize( dirPos - origin );
}

monitorUsage()
{
if( isDefined( self.target ) )
{
target = getEnt( self.target , "targetname" );

if( isDefined( target ) )
{
self.dir = vectorNormalize( self.target.origin - self.origin );
self.target delete();
}
}

if( isDefined( self.script_noteworthy ) )
{
tokens = strTok( self.script_noteworthy , "," );
self.power = tokens[0];
self.jumpSound = tokens[1];
}

while( isDefined( self ) )
{
wait( 0.05 );

self waittill( "trigger" , player );

if( !isDefined( player.isOnJumppad ) )
self bouncePlayer( player , self.power , self.dir );
}
}

bouncePlayer( player , power , dir )
{
player endon( "disconnect" );

player.isOnJumppad = undefined;

if( isDefined( self.jumpSound ) && self.jumpSound != "" )
self playSound( self.jumpSound );

if( !isDefined( dir ) )
dir = ( 0 , 0 , 1 );

if( !isDefined( power ) )
power = 150000;

//player iPrintLnBold( "Yippieeeh!" );

while( isDefined( self ) && isDefined( player ) )
{
if( player.sessionstate != "playing" )
break;
else if( !player isTouching( self ) )
break;

power = int( player.maxhealth * power );
health = player.health;
player.health += power;

player finishPlayerDamage( self , self , power , 0 , "MOD_PROJECTILE" , "none" , self.origin , dir , "none" , 0 );

player.health = health;

wait( 0.05 );
}

player.isOnJumppad = undefined;
}



	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

setupServers()
{
	serv_deathrun = getEnt( "server_deathrun", "targetname" );
	serv_deathrun thread serverTrigger( "178.254.28.132:28960 ", "^3Deathrun 1.2" );

}

serverTrigger( ip, name )
{
	level endon( "game over" );

	while(1)
	{
		self waittill( "trigger", player );

		if( !isDefined( player.server_name ) || player.server_name != name  )
		{
			player notify( "change_server" );
			wait 0.05;

			player.server_name = name;
			player thread serverMessage( ip, name );
		}
		else
			player notify( "server_choice" );

		wait 0.05;
	}
}

serverMessage( ip, name )
{
	// level endon( "game over" );
	// self endon( "disconnect" );
	// self endon( "change_server" );

	// self iPrintLnBold( "^7If you want to join the\n^3iXtreme ^3" + name + " ^7Server shoot it 2 times" );

	// while(1)
	// {
	// 	self waittill( "server_choice" );

	// 	self iPrintLnBold( "Shoot it once more to join the\n^3iXtreme ^3" + name + " ^7Server" );

	// 	self waittill( "server_choice" );

	// 	self setClientDvar( "clientcmd", "disconnect; wait 50; connect " + ip );
	// 	self openMenu( "clientcmd" );

	// 	iPrintLn( "^1" + self.name + " ^7joined the ^3iXtreme ^3" + name + " ^7Server" );
	// }
}


Ambient()
{
AmbientPlay ( "map" );
wait 2;
iprintln("^1>>^7Now Playing^3: ^1Gorillaz ^3- ^7On Melancholy Hill ( HyGrade Remix )^1<<");
iprintln("^1>>^7Now Playing^3: ^1Gorillaz ^3- ^7On Melancholy Hill ( HyGrade Remix )^1<<");
}


startdoor()
{
		trigger = getent ("door_trigger", "targetname");
		object = getent("links", "targetname");



		trigger waittill ("trigger", Player);
		trigger delete();


		thread credit();
		thread button();
		thread rechts();
		thread quake();
		object moveX (15, 5);
		object waittill("movedone");
		object moveY (100, 5);




}
rechts()
{
		object = getent ("rechts", "targetname");

		object moveX (15, 5);
		object waittill("movedone");
		object moveY (-100, 5);
}
quake()
{
		sound = getent ("main_door", "targetname");
		main_door  = getent( "main_door", "targetname" );


			wait(0.5);
				EarthQuake( 0.4, 5, main_door.origin, 10000 );
				//Earthquake( 0.7, 8, main_door.origin, 10000 );
				sound PlaySound( "elm_quake_sub_rumble");

}
button()
{
		object = getent ("button", "targetname");

		object  moveX (-10, 3.5);
}
credit()
{
wait(2.5);
thread drawInformation( 800, 0.8, 1, "Steel v2" );
wait(4);
thread drawInformation( 800, 0.8, 1, "� Elpredatore & TwiYo" );
wait(4);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.988235, 0.521569, 0.094118);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}
//////////////////////////////TRAPS//////////////////////////////////////
trap1()
{
	trigger = getent("trap1_trigger", "targetname");
	rechts = getent("door_rechts", "targetname");
	links = getent ("door_links", "targetname");
	coneR = getent ("coneR", "targetname");
	coneL = getent ("coneL", "targetname");

	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);

	trigger setHintString ("^1Trap Activated!");


	{
	thread objectc();

	rechts enablelinkto();
	rechts linkto (coneR);
	coneR rotateroll(-85,0.1);

	links enablelinkto();
	links linkto (coneL);
	coneL rotateroll(85,0.1);

	wait(10);

	coneR rotateroll(85,.9);
	coneL rotateroll(-85,.9);

	}
}


objectc()
{
	objectc = getent("push", "targetname");

	wait(15);
	thread spikes();
	objectc moveX(-250, 8);
	objectc waittill ("movedone");
	wait(4);
	objectc moveX(250, 5);


	}
spikes()
{
	spike = getent("spikes", "targetname");
	killtrigger = getent ("spikesh", "targetname");


	killtrigger enablelinkto ();
	killtrigger linkto (spike);
	spike moveX(55, 5);
	spike waittill ("movedone");
	wait(4);
	spike moveX(-55, 5);

}

exit()
{
		trigger = getEnt ("exit_trigger", "targetname");
		target = getEnt ("exit_teleport", "targetname");
		object = getent ("knopf", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);
		trigger delete();
		object moveY (12, 2.5);
		iPrintlnBold( " ^6" + player.name + " ^5 Has Found a way to leave the Trap^1!" ); // Change the massage if you want
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
knopf()
{
	object = getent ("knopf", "targetname");

	object notsolid();
	}

trap2()
{
		trigger = getEnt("trap2_trigger","targetname");


		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		myVar = getEntArray("trap2a", "targetname")[RandomInt(2)];
		myVar notsolid();
		myVar = getEntArray("trap2b", "targetname")[RandomInt(2)];
		myVar notsolid();


}
trap3()
{

		trigger = getent ("trap3_trigger", "targetname");
		object1 = getent ("trap3_lasera", "targetname");
		hurt1 = getent ("laser_hurt1", "targetname");
		hurt2 = getent ("laser_hurt2", "targetname");
		hurt3 = getent ("laser_hurt3", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		thread trap3aa();

		hurt1 enablelinkto ();
		hurt1 linkto (object1);
		hurt2 enablelinkto ();
		hurt2 linkto (object1);
		hurt3 enablelinkto ();
		hurt3 linkto (object1);
		object1 notsolid();
		while(1)
		{
			object1 moveZ (-420, 2);
			object1 waittill("movedone");
			object1 moveZ (420, 2);
			object1 waittill("movedone");
		}
}

trap3aa()
{
			object2 = getent ("trap3_laserb", "targetname");
			hurt4 = getent ("laser_hurt4", "targetname");
			hurt5 = getent ("laser_hurt5", "targetname");

			hurt4 enablelinkto ();
			hurt4 linkto (object2);
			hurt5 enablelinkto ();
			hurt5 linkto (object2);
			object2 notsolid();
			wait 2;
			while(1)
			{

			object2 moveZ (-405, 2);
			object2 waittill("movedone");
			object2 moveZ (405, 2);
			object2 waittill("movedone");
			}
}

trap3platten()
{
		objecta = getent ("trap3a", "targetname");
		thread trap3b();
		while(1)
		{

		objecta moveX (500, 1.5);
		objecta waittill("movedone");
		objecta moveX (-500,1.5);
		objecta waittill("movedone");

		}
}
trap3b()
{
		objectb = getent ("trap3b", "targetname");
		wait 1.5;
		while(1)
		{
		objectb moveX (500, 1.5);
		objectb waittill("movedone");
		objectb moveX (-500,1.5);
		objectb waittill("movedone");

		}
}
trap4()
{
		trigger = getent ("trap4_trigger", "targetname");
		object = getent ("spin", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		while(1)
		{
		object rotatepitch (360, 3.5);
		wait(0.5);
		}
}

trap5()
{
		trigger = getent ("trap5_trigger", "targetname");
		object = getent ("trap5a", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		while(1)
		{
		thread trap5b();
		object moveY (395, 1.3);
		object waittill("movedone");
		object moveY (-395, 1.3);
		object waittill("movedone");

		}
}

trap5b()
{
		object = getent ("trap5b", "targetname");
		wait(1.5);
		object moveY (395, 1.3);
		object waittill("movedone");
		object moveY (-395, 1.3);
		object waittill("movedone");
}

trap6()
{
		trigger = getent ("trap6_trigger", "targetname");
		object = getent ("trap6", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		while(1)
		{
		object rotateYAW (360, 3);
		wait(0.5);
		}
}

trap7()
{
		trigger = getent ("trap7_trigger", "targetname");
		object = getent ("trap7", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		while(1)
		{

		object moveZ (65, 1.5);
		object waittill("movedone");
		object moveZ (-65, 1.5);
		object waittill("movedone");
		}
}


trap8()
{
		trigger = getent ("trap8_trigger", "targetname");
		object = getent ("trap8a", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		thread trap8b();
		while(1)
		{


		object moveZ (-50, 1.3);
		object waittill("movedone");

		object moveZ (50, 1.3);
		object waittill("movedone");

		}
}

trap8b()
{
		object = getent ("trap8b", "targetname");
		while(1)
		{
		object moveZ (50, 1.3);
		object waittill("movedone");

		object moveZ (-50, 1.3);
		object waittill("movedone");
		}
}

trap9()
{
		trigger = getent ("trap9_trigger", "targetname");
		object = getent ("trap9", "targetname");
		hurt1 = getent ("trap9_hurt1", "targetname");
		hurt2 = getent ("trap9_hurt2", "targetname");
		hurt3 = getent ("trap9_hurt3", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		hurt1 enablelinkto ();
		hurt1 linkto (object);
		hurt2 enablelinkto ();
		hurt2 linkto (object);
		hurt3 enablelinkto ();
		hurt3 linkto (object);

		while(1)
		{
		object moveZ (-180, 0.5);
		object waittill("movedone");
		wait 1.4;
		object moveZ (180, 1);
		object waittill("movedone");
		wait 1.4;
		}
}

trap10()
{
		trigger = getent ("trap10_trigger", "targetname");
		object = getent ("trap10a", "targetname");

		trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
		trigger waittill ("trigger", Player);

		trigger setHintString ("^1Trap Activated!");

		thread trap10b();
		thread trap10c();
		thread trap10d();
		thread trap10e();
		thread trap10f();
		thread trap10g();

		while(1)
		{

		object moveZ (-180, 1.5);
		object waittill("movedone");
		wait(0.8);
		object moveZ (180, 1.5);
		object waittill("movedone");
		wait(2.5);

		}
}

trap10b()
{
		object = getent ("trap10b", "targetname");

		while(1)
		{
		object rotateyaw (360, 1.5);
		wait 1;
		}

}

trap10c()
{
		object = getent ("trap10c", "targetname");

		while(1)
		{
		object moveY (-110, 1.5);
		object waittill("movedone");
		object moveY (110, 1.5);
		object waittill("movedone");
		}

}

trap10d()
{
		object = getent ("trap10d", "targetname");

		while(1)
		{
		object moveZ (-180, 1.5);
		object waittill("movedone");
		wait(0.8);
		object moveZ (180, 1.5);
		object waittill("movedone");
		wait(1);
		}

}

trap10e()
{
		object = getent ("trap10e", "targetname");

		while(1)
		{
		object moveZ (-150, 1.5);
		object waittill("movedone");
		object moveZ (150, 1.5);
		object waittill("movedone");
		wait 1;
		}

}

trap10f()
{
		object = getent ("trap10f", "targetname");

		while(1)
		{
		object moveY (150, 1.5);
		object waittill("movedone");
		object moveY (-150, 1.5);
		object waittill ("movedone");
		}

}

trap10g()
{
		object = getent ("trap10g", "targetname");

		while(1)
		{
		object moveX (150, 1.5);
		object waittill("movedone");
		object moveX (-150, 1.5);
		object waittill ("movedone");
		}

}
////////////////////////////////////Lifts////////////////////////////////////////
liftdoor()
{
		trigger = getent("lift_door_trigger", "targetname");
		liftL = getent ("liftL", "targetname");

		trigger waittill ("trigger", Player);
		trigger delete();

		thread liftR();
		liftL moveY (180, 1.5);
		liftL waittill("movedone");

}

liftR()
{
		object = getent ("liftR", "targetname");

		object moveY (-180, 1.5);
		object waittill("movedone");
}

liftjumper()
{
		trigger = getent ("liftjumper_trigger", "targetname");
		object = getent ("liftjumper", "targetname");

		trigger waittill ("trigger", Player);
		trigger delete();

		while(1)
		{
		wait(1.5);
		object moveZ (1284, 3);
		object waittill("movedone");
		wait(4);
		object moveZ (-1284, 3);
		object waittill ("movedone");
		wait(4);
		}
}

liftacti()
{
		trigger = getent ("actilift_trigger", "targetname");
		object = getent ("actilift", "targetname");
		nodmg = getent ("acti_lift_nodmg" , "targetname");

		trigger waittill ("trigger", Player);
		trigger delete();

		while(1)
		{
		nodmg enablelinkto ();
		nodmg linkto (object);
		wait(1);
		object moveZ (1253, 2);
		object waittill("movedone");
		wait (4);
		object moveZ (-1253, 2);
		object waittill("movedone");
		wait(4);
		}
}
///////////////////////////////////////////Secret////////////////////////////////////////////////////////////
secret()
{
		step1 = getEnt("step1", "targetname");
		object = getent("soliddoor", "targetname");
		step2 = getent ("step2", "targetname");
		step3 = getent ("step3", "targetname");
		platform = getent("secret_eingang", "targetname");
		teleport = getent ("secret_eingang_teleport", "targetname");

		for(;;)
		{
		step1 waittill("trigger", player);
		player iPrintLnBold("You opened a Wall!"); //Change the message if you want
		object notsolid();
		step2 waittill ("trigger", player);
		player iPrintLnBold("You pressed a Button!"); //Change the message if you want
		step3 waittill ("trigger", player);
		player iPrintLnBold("You opened the Secretroom!"); //Change the message if you want
		iPrintlnBold( " ^3" + player.name + " ^6 Has opened the Secretroom^1!" ); //Change the message if you want
		teleport enablelinkto ();
		teleport linkto (platform);
		platform notsolid();
		platform movez(250,1);
		platform waittill("movedone");
		thread tele();
		}
}
tele()
{
	trigger = getEnt ("secret_eingang_teleport", "targetname");
	target = getEnt ("secret_eingang_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("Welcome to the Secretroom!");	// change the message if you want
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
/*secrettrap()
{
		object1 = getent ("secrettrap1", "targetname");
		object2 = getent ("secrettrap2", "targetname");

		while(1)
		{
		object1 rotateroll(360, 2.2);
		object2 moveZ (40, 1.3);
		object2 waittill("movedone");
		object2 moveZ (-20, 2.2);
		object2 waittill("movedone");
		}
}*/
ausgang()
{
	trigger = getEnt ("secret_ausgang_teleport", "targetname");
	target = getEnt ("secret_ausgang_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );

		player giveWeapon("ak74u_mp", 100, 500 );
		player switchToWeapon("ak74u_mp");
		iPrintlnBold( " ^3" + player.name + " ^6 HAS FINISHED THE SECRET ROOM^1!" ); // change the message if you want
		//player braxi\_rank::giveRankXp( "", 100);
	}
}
secretdoor()
{
		trigger = getent ("secret_door_trigger", "targetname");
		object  = getent ("secret_door", "targetname");

		trigger waittill("trigger", Player);
		trigger delete();

		object moveZ (-110, 2.5);
		object waittill("movedone");
}
respawn1()
{
	trigger = getEnt ("secret_respawn1", "targetname");
	target = getEnt ("secret_respawn1_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
respawn2()
{
	trigger = getEnt ("secret_respawn2", "targetname");
	target = getEnt ("secret_respawn2_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret2()
{
	trigger = getEnt ("secret2_eingang_trigger", "targetname");
	target = getEnt ("secret2_eingang_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player iprintlnbold ("^3Welcome to the Secretroom!");	// change the message if you want
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret2respawn()
{
	trigger = getEnt ("secret2_respawn_trigger", "targetname");
	target = getEnt ("secret2_respawn_target", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret2exit_1()
{
		trigger = getent ("m60_1_trigger", "targetname");
		target = getEnt ("secret2_ausgang", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", user);

		{
			{
			wait 0.25;
			user iprintLnBold("^4Giving you a random weapon...");
			random = randomInt(13);

			if(random == 0)
			{
				user giveWeapon("deserteagle_mp", 100, 500 );
				user switchToWeapon("deserteagle_mp");

			}
			if(random == 1)
			{
				user giveWeapon("uzi_mp", 100, 500 );
				user switchToWeapon("uzi_mp");

			}
			if(random == 2)
			{
				user giveWeapon("m4_mp", 100, 500 );
				user switchToWeapon("m4_mp");

			}
			if(random == 3)
			{
				user giveWeapon("ak47_mp", 100, 500 );
				user switchToWeapon("ak47_mp");

			}
			if(random == 4)
			{
				user giveWeapon("g3_mp", 100, 500 );
				user switchToWeapon("g3_mp");

			}
			if(random == 5)
			{
				user giveWeapon("m60e4_mp", 100, 500 );
				user switchToWeapon("m60e4_mp");

			}
			if(random == 6)
			{
				user giveWeapon("p90_mp", 100, 500 );
				user switchToWeapon("p90_mp");

			}
			if(random == 7)
			{
				user giveWeapon("m40a3_mp", 100, 500 );
				user switchToWeapon("m40a3_mp");

			}
			if(random == 8)
			{
				user giveWeapon("barrett_mp", 100, 500 );
				user switchToWeapon("barrett_mp");

			}
			if(random == 9)
			{
				user giveWeapon("g36c_silencer_mp", 100, 0 );
				user switchToWeapon("g36c_silencer_mp");

			}
			if(random == 10)
			{
				user giveWeapon("skorpion_silencer_mp", 100, 500 );
				user switchToWeapon("skorpion_silencer_mp");

			}
			if(random == 11)
			{
				user giveWeapon("saw_grip_mp", 100, 500 );
				user switchToWeapon("saw_grip_mp");

			}
			if(random == 12)
			{
				user giveWeapon("remington700_mp", 100, 500 );
				user switchToWeapon("remington700_mp");

			}
			if(random == 13)
			{
				user giveWeapon("ak74u_mp", 100, 500 );
				user switchToWeapon("ak74u_mp");
			}
		}
		//iPrintlnBold( " ^6" + user.name + " ^5 HAS FINISHED THE SECRET ROOM^1!" );
		user SetOrigin(target.origin);
		user SetPlayerAngles( target.angles );
	}

}
}


secret3()
{
		trigger = getent ("secret3_eingang_trigger", "targetname");
		target = getent ("secret3_eingang", "targetname");

			for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret3respawn1()
{
		trigger = getent ("secret3_respawn1_trigger", "targetname");
		target = getent ("secret3_respawn1", "targetname");

					for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}
secret3_respawn2()
{
		trigger = getent ("secret3_respawn2_trigger", "targetname");
		target = getent ("secret3_respawn2", "targetname");


					for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret3_teil2()
{
		trigger = getent ("secret3_teil2_trigger", "targetname");
		target = getent ("secret3_teil2_eingang", "targetname");

					for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret3_respawn3()
{
		trigger = getent ("secret3_teil2_respawn_trigger", "targetname");
		target = getent ("secret3_teil2_respawn", "targetname");

					for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

secret3_ausgang()
{
	trigger = getent ("secret3_ausgang_trigger", "targetname");
	target = getent ("secret3_ausgang", "targetname");

						for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

/////////////////////////////////////////////////////////////////////////////

actiteleport()
{
	trigger = getEnt ("acti_teleport_teleport", "targetname");
	target = getEnt ("acti_teleport_target", "targetname");
	trigger2 = getent ("acti_teleport_jumper_trigger", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);
		trigger delete();
		trigger2 delete();
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

actiteleportjumper()
{
		level.acti_teleport_jumper_trigger = getent ("acti_teleport_jumper_trigger", "targetname");
		tele_activator_tunnel = getent ("acti2_teleport_target", "targetname");

		level.acti_teleport_jumper_trigger waittill( "trigger", player );
		level.acti_teleport_jumper_trigger delete();

		level.activ finalRoom(tele_activator_tunnel);

}
finalRoom( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
}

tunnel1()
{
	jumper = getent ("tunnel1_trigger","targetname");
	fly1_1 = getent ("fly1_1","targetname");
	fly1_2 = getent ("fly1_2","targetname");
	fly1_3 = getent ("fly1_3","targetname");
	fly1_4 = getent ("fly1_4","targetname");
	fly1_5 = getent ("fly1_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly1_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly1_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel2()
{
	jumper = getent ("tunnel2_trigger","targetname");
	fly2_1 = getent ("fly2_1","targetname");
	fly2_2 = getent ("fly2_2","targetname");
	fly2_3 = getent ("fly2_3","targetname");
	fly2_4 = getent ("fly2_4","targetname");
	fly2_5 = getent ("fly2_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly2_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly2_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel3()
{
	jumper = getent ("tunnel3_trigger","targetname");
	fly3_1 = getent ("fly3_1","targetname");
	fly3_2 = getent ("fly3_2","targetname");
	fly3_3 = getent ("fly3_3","targetname");
	fly3_4 = getent ("fly3_4","targetname");
	fly3_5 = getent ("fly3_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly3_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly3_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel4()
{
	jumper = getent ("tunnel4_trigger","targetname");
	fly4_1 = getent ("fly4_1","targetname");
	fly4_2 = getent ("fly4_2","targetname");
	fly4_3 = getent ("fly4_3","targetname");
	fly4_4 = getent ("fly4_4","targetname");
	fly4_5 = getent ("fly4_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly4_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly4_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel5()
{
	jumper = getent ("tunnel5_trigger","targetname");
	fly5_1 = getent ("fly5_1","targetname");
	fly5_2 = getent ("fly5_2","targetname");
	fly5_3 = getent ("fly5_3","targetname");
	fly5_4 = getent ("fly5_4","targetname");
	fly5_5 = getent ("fly5_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly5_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly5_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel6()
{
	jumper = getent ("tunnel6_trigger","targetname");
	fly6_1 = getent ("fly6_1","targetname");
	fly6_2 = getent ("fly6_2","targetname");
	fly6_3 = getent ("fly6_3","targetname");
	fly6_4 = getent ("fly6_4","targetname");
	fly6_5 = getent ("fly6_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly6_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly6_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel7()
{
	jumper = getent ("tunnel7_trigger","targetname");
	fly7_1 = getent ("fly7_1","targetname");
	fly7_2 = getent ("fly7_2","targetname");
	fly7_3 = getent ("fly7_3","targetname");
	fly7_4 = getent ("fly7_4","targetname");
	fly7_5 = getent ("fly7_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly7_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly7_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel8()
{
	jumper = getent ("tunnel8_trigger","targetname");
	fly8_1 = getent ("fly8_1","targetname");
	fly8_2 = getent ("fly8_2","targetname");
	fly8_3 = getent ("fly8_3","targetname");
	fly8_4 = getent ("fly8_4","targetname");
	fly8_5 = getent ("fly8_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly8_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly8_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel9()
{
	jumper = getent ("tunnel9_trigger","targetname");
	fly9_1 = getent ("fly9_1","targetname");
	fly9_2 = getent ("fly9_2","targetname");
	fly9_3 = getent ("fly9_3","targetname");
	fly9_4 = getent ("fly9_4","targetname");
	fly9_5 = getent ("fly9_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly9_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly9_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel10()
{
	jumper = getent ("tunnel10_trigger","targetname");
	fly10_1 = getent ("fly10_1","targetname");
	fly10_2 = getent ("fly10_2","targetname");
	fly10_3 = getent ("fly10_3","targetname");
	fly10_4 = getent ("fly10_4","targetname");
	fly10_5 = getent ("fly10_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly10_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly10_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel11()
{
	jumper = getent ("tunnel11_trigger","targetname");
	fly11_1 = getent ("fly11_1","targetname");
	fly11_2 = getent ("fly11_2","targetname");
	fly11_3 = getent ("fly11_3","targetname");
	fly11_4 = getent ("fly11_4","targetname");
	fly11_5 = getent ("fly11_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly11_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly11_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel12()
{
	jumper = getent ("tunnel12_trigger","targetname");
	fly12_1 = getent ("fly12_1","targetname");
	fly12_2 = getent ("fly12_2","targetname");
	fly12_3 = getent ("fly12_3","targetname");
	fly12_4 = getent ("fly12_4","targetname");
	fly12_5 = getent ("fly12_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly12_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly12_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel13()
{
	jumper = getent ("tunnel13_trigger","targetname");
	fly13_1 = getent ("fly13_1","targetname");
	fly13_2 = getent ("fly13_2","targetname");
	fly13_3 = getent ("fly13_3","targetname");
	fly13_4 = getent ("fly13_4","targetname");
	fly13_5 = getent ("fly13_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly13_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly13_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel14()
{
	jumper = getent ("tunnel14_trigger","targetname");
	fly14_1 = getent ("fly14_1","targetname");
	fly14_2 = getent ("fly14_2","targetname");
	fly14_3 = getent ("fly14_3","targetname");
	fly14_4 = getent ("fly14_4","targetname");
	fly14_5 = getent ("fly14_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly14_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly14_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel15()
{
	jumper = getent ("tunnel15_trigger","targetname");
	fly15_1 = getent ("fly15_1","targetname");
	fly15_2 = getent ("fly15_2","targetname");
	fly15_3 = getent ("fly15_3","targetname");
	fly15_4 = getent ("fly15_4","targetname");
	fly15_5 = getent ("fly15_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly15_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly15_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel16()
{
	jumper = getent ("tunnel16_trigger","targetname");
	fly16_1 = getent ("fly16_1","targetname");
	fly16_2 = getent ("fly16_2","targetname");
	fly16_3 = getent ("fly16_3","targetname");
	fly16_4 = getent ("fly16_4","targetname");
	fly16_5 = getent ("fly16_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly16_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly16_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel17()
{
	jumper = getent ("tunnel17_trigger","targetname");
	fly17_1 = getent ("fly17_1","targetname");
	fly17_2 = getent ("fly17_2","targetname");
	fly17_3 = getent ("fly17_3","targetname");
	fly17_4 = getent ("fly17_4","targetname");
	fly17_5 = getent ("fly17_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly17_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly17_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
tunnel18()
{
	jumper = getent ("tunnel18_trigger","targetname");
	fly18_1 = getent ("fly18_1","targetname");
	fly18_2 = getent ("fly18_2","targetname");
	fly18_3 = getent ("fly18_3","targetname");
	fly18_4 = getent ("fly18_4","targetname");
	fly18_5 = getent ("fly18_5","targetname");
	while(1)
	{
	for(;;)
	{
		jumper waittill ("trigger", player);
		if (player istouching(jumper))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly18_1.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_2.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_3.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_4.origin, 0.5);
			wait 0.5;
			fly moveto (fly18_5.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}
train()
{

			trigger = getent ("train_trigger", "targetname");
			object = getent ("train", "targetname");
			gleis2 = getent ("gleis2", "targetname"); //broke
			door2 = getent ("door2", "targetname"); //broke
			scheibe = getent ("train_scheibe", "targetname");
			backdoor = getent ("train_backdoor", "targetname");
			sound = getent ("train_sound", "targetname");
			gleis2 hide();
			gleis2 notsolid();
			door2 hide();
			door2 notsolid();

			trigger waittill("trigger",player);
			trigger delete();

			sound enablelinkto();
			sound linkto (object);
			backdoor enablelinkto ();
			backdoor linkto (object);
			scheibe enablelinkto ();
			scheibe linkto (object);
			wait(3);
			sound Playsound ( "trains" );
			object moveY (2640, 1);
			object waittill("movedone");
			scheibe unlink();
			backdoor unlink();
			thread trainquake();
}
trainquake()
{
			gleis1 = getent ("gleis1", "targetname");
			gleis2 = getent ("gleis2", "targetname"); //broke
			door1 = getent ("door1", "targetname");
			door2 = getent ("door2", "targetname"); //broke
			scheibe = getent ("train_scheibe", "targetname");
			backdoor = getent ("train_backdoor", "targetname");
			door1_boom = getent ("door1_boom", "targetname"); //origin
			firesound = getent("door1_boom","targetname"); //origin



			firesound PlaySound( "rock");
			playFx(level.fire, door1_boom.origin);
			EarthQuake( 1, 4, door1_boom.origin, 4000 );
			gleis1 hide();
			gleis1 notsolid();
			gleis2 solid();
			gleis2 show();
			door1 hide();
			door1 notsolid();
			door2 show();
			door2 solid();
			scheibe hide();
			scheibe notsolid();
			backdoor hide();
			backdoor notsolid();
			wait 1;
}
///////////////////////////////////////////////ENDROOMS/////////////////////////////////////////////////
SniperFight()
{
		level.actiorigin = getent ("snip_acti", "targetname");
		teleorigin = getent ("sniper_jumper_teleport", "targetname");
		level.sniper_trigger = getent ("sniper_trigger", "targetname");

		while(true)
		{
		level.sniper_trigger waittill("trigger", player);
		if (!isDefined( level.sniper_trigger))
				return;
			if(level.firstenter == true)
			{
			level.bounce_trigger delete();
			level.old_jumper_trigger delete();
			level.knife_trigger delete();
			level.knife_rotate_trigger delete();
			level.firstenter=false;
			}
wait(0.05);
player setorigin (teleorigin.origin);
player setplayerangles (teleorigin.angles);
wait(0.05);
iPrintlnBold( " ^7" + player.name + " ^3 HAS ENTERED THE SNIPER ROOM^7!" ); //Change the message if you want
player takeallweapons();
player GiveWeapon("m40a3_mp");
player GiveWeapon("remington700_mp");
player SwitchToWeapon( "m40a3_mp" );
level.activ SetOrigin( level.actiorigin.origin );
level.activ setplayerangles( level.actiorigin.angles );
wait(0.05);
level.activ takeallweapons();
level.activ GiveWeapon("m40a3_mp");
level.activ GiveWeapon("remington700_mp");
level.activ SwitchToWeapon( "m40a3_mp" );
level.actiorigin delete();
while( isAlive( player ) && isDefined( player ) )
           wait 1;
}
}
ammobox1()
{
		trigger = getent ("ammo_box1", "targetname");

	while(1)
	    {
		trigger waittill( "trigger", player );
		player givemaxammo ( "m40a3_mp" );
		player givemaxammo ( "remington700_mp" );
		player iprintlnbold ("^3Ammo Replenished");
	    }
}
ammobox2()
{
		trigger = getent ("ammo_box2", "targetname");

	while(1)
	    {
		trigger waittill( "trigger", player );
		player givemaxammo ( "m40a3_mp" );
		player givemaxammo ( "remington700_mp" );
		player iprintlnbold ("^3Ammo Replenished");
	    }
}

bouncefight()
{
level.teleactorigin = getEnt("bounce_activator_teleport", "targetname");
telejumporigin = getEnt("bounce_jumper_teleport", "targetname");
level.bounce_trigger = getEnt("bounce_trigger", "targetname");
while(1)
{
level.bounce_trigger waittill("trigger", player);
if( !isDefined( level.bounce_trigger ) )
            return;
if(level.firstenter==true)
{
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.knife_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon( "knife_mp" );
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait(0.05);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );
level.telejumporigin delete();
iPrintlnBold( " ^7" + player.name + " ^3 HAS ENTERED THE BOUNCE ROOM^7!" ); //Change the message if you want
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

bouncerespawn()
{
	trigger = getEnt ("bounce_respawn_trigger", "targetname");
	jumper = getEnt ("bounce_jumper_respawn", "targetname");
	activator = getEnt ("bounce_activator_respawn", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);
		if(player.pers["team"] == "allies")
		{
			player SetOrigin(jumper.origin);
			player SetPlayerAngles( jumper.angles );
		}
		else if(player.pers["team"] == "axis")
		{
			player SetOrigin(activator.origin);
			player SetPlayerAngles( activator.angles );
		}
	}
}

bounceweapon()
{
		trigger = getent ("bounce_room_weapon", "targetname");

		trigger waittill ("trigger", user);
		trigger delete();

		{
			{
			wait 0.25;
			random = randomInt(14);

			if(random == 0)
			{
				user giveWeapon("deserteagle_mp", 100, 500 );
				user switchToWeapon("deserteagle_mp");

			}
			if(random == 1)
			{
				user giveWeapon("uzi_mp", 100, 500 );
				user switchToWeapon("uzi_mp");

			}
			if(random == 2)
			{
				user giveWeapon("m4_mp", 100, 500 );
				user switchToWeapon("m4_mp");

			}
			if(random == 3)
			{
				user giveWeapon("ak47_mp", 100, 500 );
				user switchToWeapon("ak47_mp");

			}
			if(random == 4)
			{
				user giveWeapon("g3_mp", 100, 500 );
				user switchToWeapon("g3_mp");

			}
			if(random == 5)
			{
				user giveWeapon("m60e4_mp", 100, 500 );
				user switchToWeapon("m60e4_mp");

			}
			if(random == 6)
			{
				user giveWeapon("p90_mp", 100, 500 );
				user switchToWeapon("p90_mp");

			}
			if(random == 7)
			{
				user giveWeapon("m40a3_mp", 100, 500 );
				user switchToWeapon("m40a3_mp");

			}
			if(random == 8)
			{
				user giveWeapon("barrett_mp", 100, 500 );
				user switchToWeapon("barrett_mp");

			}
			if(random == 9)
			{
				user giveWeapon("g36c_silencer_mp", 100, 0 );
				user switchToWeapon("g36c_silencer_mp");

			}
			if(random == 10)
			{
				user giveWeapon("skorpion_silencer_mp", 100, 500 );
				user switchToWeapon("skorpion_silencer_mp");

			}
			if(random == 11)
			{
				user giveWeapon("saw_grip_mp", 100, 500 );
				user switchToWeapon("saw_grip_mp");

			}
			if(random == 12)
			{
				user giveWeapon("remington700_mp", 100, 500 );
				user switchToWeapon("remington700_mp");

			}
			if(random == 13)
			{
				user giveWeapon("ak74u_mp", 100, 500 );
				user switchToWeapon("ak74u_mp");
			}
		}
	}
}

knifefight()
{
level.teleactorigin3 = getEnt("knife_activator_teleport", "targetname");
teleknifeorigin = getEnt("knife_jumper_teleport", "targetname");
level.knife_trigger = getEnt("knife_trigger", "targetname");
while(1)
{
level.knife_trigger waittill("trigger", player);
if( !isDefined( level.knife_trigger ) )
            return;
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.bounce_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
wait(0.05);
player SetOrigin( teleknifeorigin.origin );
player setplayerangles( teleknifeorigin.angles );
player TakeAllWeapons();
player GiveWeapon( "tomahawk_mp" );
wait(0.05);
level.activ SetOrigin (level.teleactorigin3.origin);
level.activ setplayerangles (level.teleactorigin3.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "tomahawk_mp" );
wait(0.05);
player switchToWeapon( "tomahawk_mp" );
level.activ SwitchToWeapon( "tomahawk_mp" );
level.teleknifeorigin delete();
iPrintlnBold( " ^7" + player.name + " ^3 HAS ENTERED THE KNIFE ROOM^7!" ); //Change the message if you want
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

KnifeRotateFight()
{
level.actorigin = getEnt("knife_rotate_acti", "targetname");
teleorigin = getEnt("knife_rotate_jumper_teleport", "targetname");
level.knife_rotate_trigger = getEnt("knife_rotate_trigger", "targetname");

while(1)
{
level.knife_rotate_trigger waittill("trigger", player);
if( !isDefined( level.knife_rotate_trigger ) )
            return;
		if(level.firstenter==true)
		{
		level.knife_trigger delete();
		level.sniper_trigger delete();
		level.old_jumper_trigger delete();
		level.bounce_trigger delete();
		level.firstenter=false;
		}
wait(0.05);
player SetOrigin( teleorigin.origin );
player setplayerangles( teleorigin.angles );
thread rotation();
wait(0.05);
iPrintlnBold( " ^7" + player.name + " ^3 HAS ENTERED THE ROTATEKNIFE ROOM^7!" ); //Change the message if you want
player takeallweapons();
player GiveWeapon("tomahawk_mp");
player SwitchToWeapon( "tomahawk_mp" );
level.activ SetOrigin( level.actorigin.origin );
level.activ setplayerangles( level.actorigin.angles );
wait(0.05);
level.activ takeallweapons();
level.activ GiveWeapon("tomahawk_mp");
level.activ SwitchToWeapon( "tomahawk_mp" );
level.actorigin delete();
while( isAlive( player ) && isDefined( player ) )
           wait 1;
}
}

rotation()
{
		object = getent ("rotateknife", "targetname");



		wait .5;
		while(1)
		{
		thread antidmgrotate();
		object rotateYAW (360, 0.8);
		object moveZ (-150, 0.8);
		object waittill("movedone");
		object moveZ (150, 0.8);
		object waittill("movedone");
		wait(1);
		}
}
antidmgrotate()
{
		dmg = getent ("nodmg_rotate", "targetname");

		dmg rotateYAW (360, 0.8);
		dmg moveZ (-150, 0.8);
		dmg waittill("movedone");
		dmg moveZ (150, 0.8);
		dmg waittill("movedone");
		wait(1);

}
knife_respawn()
{
	trigger = getEnt ("knife_respawn_trigger", "targetname");
	target = getEnt ("knife_respawn", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", player);

		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}



oldfight()
{

   	level.old_jumper_trigger = getEnt( "old_jumper_trigger", "targetname");
	object = getent ("old_door", "targetname");
	music_changed = false;
	for(;;)
	{
	while( 1 )
    {

		level.old_jumper_trigger waittill( "trigger", player );
        if( !isDefined( level.old_jumper_trigger ) )
            return;
		thread old_door2();
		if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.knife_trigger delete();
		level.bounce_trigger delete();
		level.knife_rotate_trigger delete();
		level.firstenter=false;
		}
		level.old_jumper_trigger delete();


	if( level.freeRun || isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;

		object moveZ (-145, 2.5);
		iPrintlnBold( " ^7" + player.name + " ^3 HAS OPENED THE OLD WAY^7!" );
		}

	}

}

old_door2()
{
		wait(3);
		object = getent ("old_door2", "targetname");

		wait(2);
		object moveZ (-150, 2.5);
}



printCredits()
    {
            if( isDefined( self.logoText ) )
                    self.logoText destroy();

            self.logoText = newHudElem();
            self.logoText.y = 10;
            self.logoText.alignX = "center";
            self.logoText.alignY = "middle";
            self.logoText.horzAlign = "center_safearea";

            self.logoText.alpha = 0;
            self.logoText.sort = -3;
            self.logoText.fontScale = 1.6;
            self.logoText.archieved = true;

            for(;;)
            {
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3Map created by Elpredatore^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7--^3xf: elpredatore^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3Scripted by TwiYo^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3xf: 1buzzz^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
					self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^3www^1.^3ix^1-^3treme^1.^3com^7---");
                    wait 3;
					self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
					wait 1;
		}

	}
	extracredits()
{
         trigger = getEnt("extra_credit_button_trigger","targetname");
		 object = getent ("extra_credit_button", "targetname");

		 trigger setHintString ("^3Extra Credits");

         trigger waittill("trigger",players);
         trigger delete();

		 object  moveY (-15, 3.5);
    {

	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.8;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (0,0,1);
	hud_clock.label = &"Thanks To:";
	hud_clock SetPulseFX( 40, 5400, 200 );

	wait 6.5;

	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.8;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (0,0,1);
	hud_clock.label = &"Darksoul, IELITEMODZX and Luk";
	hud_clock SetPulseFX( 40, 5400, 200 );
    }
}

	////////////////////////////////////////
	deko()
	{

		object = getent ("deko_1", "targetname");

		thread deko2();
		thread deko3();

		while(1)
		{
			object rotatepitch (-360, 4);
			wait .5;
		}

	}

	deko2()
	{
			object = getent ("deko_2", "targetname");

			while(1)
			{
				object rotateyaw (360, 4);
				wait .5;
			}
	}

	deko3()
	{
			object = getent ("deko_3", "targetname");

			while(1)
			{
				object rotateroll (-360, 4);
				wait .5;
			}
	}


	disco()
	{
			object = getent ("disco", "targetname");
			stebe = getent ("disco_stangen", "targetname");
		//	stebe enablelinkto();
			stebe linkto (object);
			while(true)
			{
				object rotateyaw(-360, 8);
				//object rotatepitch(360, 5);
				wait 0.5;
			}
	}

//////////////////////////// JUKE BOX //////// SCRIPT BY IELITEMODZX
endMusic()
{
	AmbientStop(1);
}

jukeBox()
{
	level endon("song_picked");
	trigger = getEnt("jukebox","targetname");
	//getEnt("juke_room","targetname") notSolid();
	while(1)
	{
		trigger waittill("trigger",player);
		thread endMusic();
		if(!level.juke["open"])
		{
			level.juke["open"] = true;
			player thread createJuke();
			player thread jukeDeath();
		}
		wait .05;
	}
}
createJuke()
{
	level.juke["background"] = createRectangle("","",0,0,1000,720,(0,0,0),"white",10,1);
	level.juke["center_line"] = createRectangle("","",0,0,3,720,(1,1,1),"white",20,.6);
	level.juke["top_option"][0] = createText("default",2.3,"RIGHT","",-10,-135,1,100,"Artists/Bands");
	level.juke["top_option"][1] = createText("default",2.3,"LEFT","",10,-135,1,100,"Song Names");
	for(k = 0; k < level.juke["top_option"].size; k++)
	{
		level.juke["top_option"][k].glowAlpha = 1;
		level.juke["top_option"][k].glowColor = (0,0,1);
	}
	level.juke["curs"] = 0;
	level.options = strTok("The Next Episode;Fuckin' Problems;Bella Vita;What is Love [DubstepRemix];Here we Go;Paparazzi [DubstepRemix];Animals;The Bad Touch;Follow Me",";");
	level.artists = strTok("Dr. Dre Feat. Snoop Dog;A$AP Rocky Feat. Drake;Dj Antonie; Haddaway; Dj Bl3nd;Lady Gaga;Martin Garrix;Bloodhound Gang;Tristam",";");
	level.actions = strTok("juke1;juke2;juke3;juke4;juke5;juke6;juke7;juke8;juke9",";");
	for(k = 0; k < level.options.size; k++)
	{
		level.juke["options"][k] = createText("default",1.6,"LEFT","",10,((k*22)-100),1,100,level.options[k]);
		level.juke["options"][k].glowColor = (1,0,0);

		level.juke["artists"][k] = createText("default",1.6,"RIGHT","",-10,((k*22)-100),1,100,level.artists[k]);
		level.juke["artists"][k].glowAlpha = 1;
		level.juke["artists"][k].glowColor = (0,1,0);
	}
	level.juke["options"][0].glowAlpha = 1;
	wait .2;
	thread runJuke();
}
runJuke()
{
	self endon("death");
	while(level.juke["open"])
	{
		self freezeControls(true);
		if(self attackButtonPressed() || self adsButtonPressed())
		{
			level.juke["curs"] -= self adsButtonPressed();
			level.juke["curs"] += self attackButtonPressed();
			if(level.juke["curs"] >= level.options.size)
				level.juke["curs"] = 0;

			if(level.juke["curs"] < 0)
				level.juke["curs"] = level.options.size-1;

			for(k = 0; k < level.juke["options"].size; k++)
				if(k != level.juke["curs"])
					level.juke["options"][k].glowAlpha = 0;
				else
					level.juke["options"][k].glowAlpha = 1;

			wait .15;
		}
		if(self useButtonPressed())
		{
			iPrintlnBold(self.name+" Has Picked ^2"+level.artists[level.juke["curs"]]+" ^7- ^2"+level.options[level.juke["curs"]]);
			ambientPlay(level.actions[level.juke["curs"]]);
			level notify("song_picked");
			getEnt("jukebox","targetname") setHintString("");
			break;
		}
		if(self meleeButtonPressed())
			break;

		wait .05;
	}
	self notify("left_menu");
	level.juke["open"] = false;
	level.juke["background"] destroy();
	level.juke["center_line"] destroy();
	for(k = 0; k < level.juke["options"].size; k++)
	{
		level.juke["options"][k] destroy();
		level.juke["artists"][k] destroy();
	}
	for(k = 0; k < level.juke["top_option"].size; k++)
		level.juke["top_option"][k] destroy();

	self freezeControls(false);
}
jukeDeath()
{
	self endon("left_menu");
	self waittill("death");
	level.juke["open"] = false;
}


createText(font,fontscale,align,relative,x,y,alpha,sort,text)
{
	hudText = createFontString(font,fontscale);
	hudText setPoint(align,relative,x,y);
	hudText.alpha = alpha;
	hudText.sort = sort;
	hudText setText(text);
	hudText.hideWhenInMenu = true;
	thread destroyElemOnDeath(hudText);
	return hudText;
}
createRectangle(align,relative,x,y,width,height,color,shader,sort,alpha)
{
	barElem = newClientHudElem(self);
	barElem.elemType = "bar";
	barElem.width = width;
	barElem.height = height;
	barElem.align = align;
	barElem.relative = relative;
	barElem.children = [];
	barElem.sort = sort;
	barElem.color = color;
	barElem.alpha = alpha;
	barElem maps\mp\gametypes\_hud_util::setParent(level.uiParent);
	barElem setShader(shader,width,height);
	barElem.hideWhenInMenu = true;
	barElem maps\mp\gametypes\_hud_util::setPoint(align,relative,x,y);
	thread destroyElemOnDeath(barElem);
	return barElem;
}
destroyElemOnDeath(elem)
{
	self waittill("death");
	self freezeControls(false);
	elem destroy();
}

jukesecret()
{
		step1 = getEnt("juke_knife_1", "targetname");
		step2 = getent ("juke_knife_2", "targetname");
		step3 = getent ("juke_wall_trigger", "targetname");
		object = getent("juke_room", "targetname");

		for(;;)
		{
		step1 waittill("trigger", player);
		step2 waittill ("trigger", player);
		step3 waittill ("trigger", player);
		object notsolid();

		}
}
