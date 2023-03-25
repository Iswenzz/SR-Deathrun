#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include common_scripts\utility;
main()
{
 maps\mp\_load::main();

 level.fire_tv = LoadFx("fire/tv_fire");
 level.break_rock = LoadFx("breakables/exp_wall_cinderblock_96");
 level.break_door = LoadFx("explosions/wall_explosion_round");

 game["allies"] = "sas";
 game["axis"] = "russian";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "woodland";
 game["axis_soldiertype"] = "woodland";

///DVARS
	// setdvar("g_speed" ,"210");
	// setdvar("dr_jumpers_speed" ,"1.12");
	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);


///TRAP TRIGGERS
    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addTriggerToList("trig_trap7");
    addTriggerToList("trig_trap8");
    addTriggerToList("trig_trap9");
    addTriggerToList("trig_trap10");
    addTriggerToList("trig_trap10extra");
    addTriggerToList("trig_trap11");
    addTriggerToList("trig_trap12");
    addTriggerToList("trig_trap13");


///PRECACHEMODEL/ITEM TO SEE MODEL/ITEM IN GAME
    precachemodel("ap_airbus_seat_1");
    precachemodel("ch_corkboard_woodtrim_3x4");
    precachemodel("bathroom_plunger");
    precachemodel("me_box_citrusfruitopen_1");
    precachemodel("streetsign_melee");
    precacheModel("brigitte");
    precacheModel("weapon_aw_m1_irons");
    precacheModel("viewmodel_aw_m1_irons");
    precacheModel("plr_terry_zombie");
    precacheModel("plr_terry_scorpion");
    precacheModel("plr_terry_helldemon");

    precacheshader("mtl_ww2_zombie");
    precacheshader("mtl_scorpion");
    precacheshader("mtl_helldemon_full");

    precacheItem("frag_grenade_mp");
    precacheItem("m40a3_mp");
    precacheItem("remington700_mp");
    precacheItem("knife_mp");
    precacheItem("deserteagle_mp");
    precacheItem("beretta_mp");
    precacheItem("ak47_mp");
    precacheItem("streetsign_mp");
    precacheItem("deserteaglegold_mp");
    precacheItem("ice_pick_mp");

    level.vipisplaying = false;

    level.firstenter = true;

///MESSAGES
   thread messages();
   thread messagescreen1();
   thread messagescreen2();
   thread messagescreen3();
///FX
   thread effect();
///DOORS AND MOVING PLATFORM
   thread startdoor();
   thread doorexplode();
   thread platform();
///STUCKFIX
   thread glitchfix();
///FREE XP
   thread freexp();
///MUSIC PLAYS RANDOMLY
   thread randommusic();
///RTD SYSTEM
   thread RTDcheck();
///VIPSTUFF
   thread boss();
   thread vip();
   thread party();
///CUSTOM SKINS ON PLAYER_SPAWN
   thread actiskin();
   thread jumperskin();
///JUMPER SECRET
   thread secstephint();
   thread secret_step1();
   thread sechints();
   thread save_load_logic();
   thread shortcut();
///ACTIVATOR SECRET
   thread actisectp();
   thread actireturn();
   thread actisechints();
///PICKUPABLE MODELS ROOM
   thread epicroomentrance();
   thread epicroomexit();
   thread maps\mp\pickuppable_models::initializeModelPickup();
///MOVING PLATFORMS
   thread endplata();
   thread endplatb();
///TRAPS
   thread trap1();
   thread trap2();
   thread trap3();
   thread trap4();
   thread trap5();
   thread trap4hint();
   thread trap6();
   thread trap7();
   thread trap8();
   thread trap9();
   thread trap10();
   thread trap10extra();
   thread trap11();
   thread trap12();
   thread trap13();
///ROOM QUEUE AND ROOMS
   thread roomselection();
   thread sniperroom();
   thread snipertriangles();
   thread kniferoom();
   thread mazeroom();
   thread spinball();
   thread spinroom();
   thread oldroom();

 maps\mp\pickuppable_models::spawnPickuppableModel((-6656,-2248,176),(0,270,0),"ap_airbus_seat_1");
 maps\mp\pickuppable_models::spawnPickuppableModel((-6400,-2240,176),(0,270,0),"ch_corkboard_woodtrim_3x4");
 maps\mp\pickuppable_models::spawnPickuppableModel((-6656,-2880,176),(0,270,0),"bathroom_plunger");
 maps\mp\pickuppable_models::spawnPickuppableModel((-6400,-2880,176),(0,46,0),"me_box_citrusfruitopen_1");
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
}

removehudsondeath()
{
    self endon ("death");
    self.owner waittill_any("death", "disconnect");

    if( isDefined( self ) )
    {
        self destroy();
    }

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

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^3" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^3" + jumper + " ^0VS^0 " + "^3" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

///MESSAGES
messages()
{
   wait 4;
   for(;;)
{
   wait 10;
 x = randomint(6);
   if (x==0)
{
   iPrintln("^3Mapped ^7and ^3scripted ^7by ^3CM'death^7,officially started by ^3CM'Probz ^7and ^3Sr- Noodle^7!");
}

   if (x==1)
{
   iPrintln("^7Visit ^3CM'Discord Server: ^7dv82mEHCY7");
}

   if (x==2)
{
   iPrintln("^3CM'Deathrun IP: ^7cm-clan.com:28960");
}

   if (x==3)
{
   iPrintln("^7Feel free to report any ^3bugs^7.");
}

   if (x==4)
{
//    iPrintLn("^3Map speed: ^0[^3"+getDvar("g_speed")+"^0]^0, ^0[^3"+getDvar("dr_jumpers_speed")+"^0]");
}

   if (x==5)
{
   iPrintLn("^7Thanks to ^3CM'ArnArt ^7for awesome loadscreen!");
}
}
}

messagescreen1()
{
	level waittill("round_started");
	wait 1;
	noti = SpawnStruct();
	noti.TitleText = "^3Map Finished and Scripted by ^3CM'Death^0!";
    noti.notifyText = "^3Officially started by CM'Probz and Noodle^0!";
	noti.duration = 8;
	noti.glowcolor = (7,7,7);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

messagescreen2()
{
	level waittill("round_started");
	wait 10;
	noti = SpawnStruct();
    noti.notifyText = "^3Thanks to Ohh'Rexy<3 for helping me with the bugs^0!";
	noti.duration = 7;
	noti.glowcolor = (7,7,7);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

messagescreen3()
{
	level waittill("round_started");
	wait 18;
	noti = SpawnStruct();
    noti.notifyText = "^3Thanks to CM'Nobody for testing map^0!";
	noti.duration = 6;
	noti.glowcolor = (7,7,7);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

///FX
effect()
{
    origin_effect1 = getEnt("fxfire1", "targetname");
    origin_effect2 = getEnt("fxfire2", "targetname");
    origin_effect3 = getEnt("fxfire3", "targetname");
    origin_effect4 = getEnt("fxfire4", "targetname");
    origin_effect5 = getEnt("fxfire5", "targetname");
    origin_effect6 = getEnt("fxfire6", "targetname");
    origin_effect7 = getEnt("fxfire7", "targetname");
    origin_effect8 = getEnt("fxfire8", "targetname");
    origin_effect9 = getEnt("fxfire9", "targetname");
    origin_effect10 = getEnt("fxfire10", "targetname");
    origin_effect11 = getEnt("fxfire11", "targetname");
    origin_effect12 = getEnt("fxfire12", "targetname");
    origin_effect13 = getEnt("fxfire13", "targetname");
    origin_effect14 = getEnt("fxfire14", "targetname");
    origin_effect15 = getEnt("fxfire15", "targetname");
    origin_effect16 = getEnt("fxfire16", "targetname");

    level waittill("round_started");

    PlayFX(level.fire_tv, origin_effect1.origin);
    PlayFX(level.fire_tv, origin_effect2.origin);
    PlayFX(level.fire_tv, origin_effect3.origin);
    PlayFX(level.fire_tv, origin_effect4.origin);
    PlayFX(level.fire_tv, origin_effect5.origin);
    PlayFX(level.fire_tv, origin_effect6.origin);
    PlayFX(level.fire_tv, origin_effect7.origin);
    PlayFX(level.fire_tv, origin_effect8.origin);
    PlayFX(level.fire_tv, origin_effect9.origin);
    PlayFX(level.fire_tv, origin_effect10.origin);
    PlayFX(level.fire_tv, origin_effect11.origin);
    PlayFX(level.fire_tv, origin_effect12.origin);
    PlayFX(level.fire_tv, origin_effect13.origin);
    PlayFX(level.fire_tv, origin_effect14.origin);
    PlayFX(level.fire_tv, origin_effect15.origin);
    PlayFX(level.fire_tv, origin_effect16.origin);
}

startdoor()
{
door = getent("startdoor","targetname");
{
wait 10;
iprintlnbold("^3Start door ^0is ^3openning^0...");
door moveZ(-160,2);
wait 2;
door hide();
door notsolid();
}
}

doorexplode()
{
   plat = getent("rockdoor", "targetname");
   origin_effect1 = getEnt("explosionfx4", "targetname");
   origin_effect2 = getEnt("explosionfx5", "targetname");
   origin_effect3 = getEnt("explosionfx6", "targetname");
   origin_effect4 = getEnt("explosionfx7", "targetname");

   trig = getent("trig_rockdoor", "targetname");

   trig waittill ("trigger",player);

   iprintlnBOld ("^3" + player.name + " exploded door^0!");
   player braxi\_rank::giveRankXP("", 500);

    PlayFX(level.break_door, origin_effect1.origin);
    PlayFX(level.break_door, origin_effect2.origin);
    PlayFX(level.break_door, origin_effect3.origin);
    PlayFX(level.break_door, origin_effect4.origin);

    player playlocalSound("rockexplosion");

	plat notsolid();
    plat hide();

    trig delete();

}

platform()
{
plat = getent("movingplat", "targetname");
trig = getent("trig_movingplat", "targetname");

while(1)
{
   trig waittill ( "trigger", player );
   wait 0.5;
   plat moveY (-928, 1);
   wait 2;
   plat moveY (928, 1);
   wait 2;
}
}

glitchfix()
{
   trig = getent("trig_fixglitch", "targetname");
   tele = getent ("orig_fixglitch", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^1Don't try to glitch^0!");
    }
}

freexp()
{
    trig = getent("freexp", "targetname");

for(;;)
{
 trig waittill("trigger", player);
 player braxi\_rank::giveRankXP("", 4000);
 player iprintlnBOld ("^7You ^3found ^7hidden ^3XP^7!")
 iPrintLn("^3" + player.name + " ^0found some ^3XP^0!");
 trig delete();
 wait 0.5;
}
}

randommusic()
{
    wait 4;
    randommusic = randomint(7);

    if (level.vipisplaying)
        return;

    if (randommusic == 0 )
    {
        ambientStop(2);
        AmbientPlay("sad");
        iprintln("^0Music: ^3XXXTENTACION - SAD");
    }
    if (randommusic == 1)
    {
        ambientStop(2);
        AmbientPlay("astronomiav2");
        iprintln("^0Music: ^3Astronomia Remix");
    }
    if (randommusic == 2)
    {
        ambientStop(2);
        AmbientPlay("lovely");
        iprintln("^0Music: ^3Billie Eilish, Khalid - lovely");
    }
    if (randommusic == 3)
    {
        ambientStop(2);
        AmbientPlay("credo");
        iprintln("^0Music: ^3SEMARGL - Credo Revolution (Zardonic Remix)");
    }
    if (randommusic == 4)
    {
        ambientStop(2);
        AmbientPlay("lostinecho");
        iprintln("^0Music: ^3Linkin Park - Lost in the Echo");
    }
    if (randommusic == 5)
    {
        ambientStop(2);
        AmbientPlay("belong");
        iprintln("^0Music: ^3Linkin Park - Somewhere I Belong");
    }
    if (randommusic == 6)
    {
        ambientStop(2);
        AmbientPlay("reminder");
        iprintln("^0Music: ^32Scratch - REMINDER feat. Young Jae");
    }
}

///RTD SYSTEM
RTDcheck()
{
trig = getent("trig_rtd", "targetname");

    while(1)
    {
    trig waittill("trigger", player);
    if(!isDefined(player.RTDused))
    {
        player.RTDused = true;
        player thread RTDitem();
    }
    else
    {
        player iprintlnbold("^3Told you not to use ^0RTD ^7again...");
        wait 2;
        player suicide();
    }
}
}

RTDitem()
{
    self iPrintLnBold ("^3RTD is opening...");
    self iPrintLnBold ("^3When you get ^7item^3, ^7don't use ^3RTD ^7again or you will ^3die^7!");
    wait 3;
    randomitem = randomint(5);

    if (randomitem == 0)
    {
        self setmodel("brigitte");
        iPrintLn("^3" + self.name + " ^7changed ^5clothes^6!");
        self iPrintLnBold("^3New ^7clothes^3,nice^3!");
    }
    if (randomitem == 1)
    {
        self takeAllWeapons();
        self giveWeapon("deserteaglegold_mp");
        self switchToWeapon("deserteaglegold_mp");
        iPrintLn("^3" + self.name + " ^7got ^3AW M1 IRONS ^7from ^3RTD^7!");
    }
    if (randomitem == 2)
    {
        self takeAllWeapons();
        self giveWeapon("streetsign_mp");
        self switchToWeapon("streetsign_mp");
        iPrintLn("^3" + self.name + " ^7got ^3STOP sign ^7from ^3RTD^7!");
    }
    if (randomitem == 3)
    {
        self thread braxi\_mod::givelife();
        iPrintLn("^3" + self.name + " ^7got ^3life ^7from ^3RTD^7!");
        self iPrintLnBold("^3You got ^7a ^3Life ^7from ^3RTD^7!");
    }
    if (randomitem == 4)
    {
        self braxi\_rank::giveRankXP("", 9000);
        iPrintLnBold("^3" + self.name + " ^7won ^3RTD XP Jackpot ^0:o");
    }
}

boss()
{
	trigger = getEnt ("trig_boss", "targetname");
	trigger setHintString ("^3Mapper Access^0!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("mapper")) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "CM'Probz"||  gametag == "Probz"||  gametag == "Sr-Noodle" || gametag == "Noodle")

		{
		wait 0.5;
        player TakeAllWeapons();
        player giveWeapon("deserteaglegold_mp");
        player SwitchToWeapon("deserteaglegold_mp");
	   }
		else
		{
			player iPrintLnBold("^3You ^0aren't ^3Mapper^0!");
		}
	}
}

vip()
{
	trigger = getEnt ("trig_vip", "targetname");
	trigger setHintString ("^3VIP Access^0!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("VIP")) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "Ohh Rexy<3" ||  gametag == "CM'ArnArt" ||  gametag == "ArnArt" ||  gametag == "CM'Nobody" || gametag == "Nobody" || gametag == "DarkSTEP" || gametag == "CAR DarkSTEP" || gametag == "CM'Probz" || gametag == "Probz" || gametag == "Noodle" || gametag == "Sr-Noodle")

		{
		wait 0.5;
        player TakeAllWeapons();
        player giveWeapon("streetsign_mp");
        player SwitchToWeapon("streetsign_mp");
        player Setviewmodel("viewhands_marine_gloves_col");
        player setmodel("brigitte");
	   }
		else
		{
			player iPrintLnBold("^3You ^0aren't ^3VIP^0!");
		}
	}
}

party()
{
	trigger = getEnt ("trig_party", "targetname");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death") ) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death")

		{
        level.vipisplaying = true;
    	AmbientStop(2);
		MusicStop(2);
		AmbientStop(0);
		MusicStop(0);
        thread partymode();
        thread partyrandommmusic();

        trigger delete();
	   }
	}
}

partymode()
{
    iPrintLnBold("^1P^2A^3R^4T^5Y ^6M^7O^8D^9E^0!");
    for(;;)
    {
        SetExpFog(1000, 1000, 1, 0, 0, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 0, 1, 0, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 0, 0, 1, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 1, 1, 0, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 1, 1, 1, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 1, 0, 1, 0);
        wait 0.5;
        SetExpFog(1000, 1000, 0, 1, 1, 0);
        wait 0.5;
    }
}

partyrandommmusic()
{

    partyrandommusic = randomint(3);

    if (partyrandommusic == 0 )
    {
        ambientStop(2);
        AmbientPlay("roses");
        iprintln("^0VIP Music: ^3SAINt JHN - Roses (Imanbek Remix)");
    }
    if (partyrandommusic == 1)
    {
        ambientStop(2);
        AmbientPlay("kamaz");
        iprintln("^0VIP Music: ^3DJ Blyatman - Kamaz");
    }
    if (partyrandommusic == 2)
    {
        ambientStop(2);
        AmbientPlay("dance");
        iprintln("^0VIP Music: ^3Dance With Me (feat. Nova Scotia)");
    }
}

actiskin()
{
    trig = getent("trig_actiskin", "targetname");

for(;;)
{
 trig waittill("trigger", player);

 player TakeAllWeapons();
 player giveWeapon("ice_pick_mp");
 player SwitchToWeapon("ice_pick_mp");
 player setmodel("plr_terry_scorpion");

 wait 0.5;

 trig delete();

}
}

jumperskin()
{
	trigger = getEnt ("trig_jumperskin", "targetname");
for(;;)
{
    level waittill( "player_spawn", player );
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death") ) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "CM'Probz"||  gametag == "Probz"||  gametag == "Sr-Noodle" || gametag == "Noodle")

		{
		wait 0.1;
        player detachAll();
        player setmodel("plr_terry_helldemon");
        level.vipisplaying = true;
	   }
		else
		{
        player detachAll();
		player setmodel("plr_terry_zombie");
		}
	}
}

///SECRET ROOM
secstephint()
{
    trig = getEnt("trig_sechint","targetname");
    trig setHintString ("^0Find ^36 steps ^0to open ^3Secret^0!");

    trig waittill("trigger", player);

}

secret_step1()
{
	trig = getEnt("trig_secstep1","targetname");

	trig waittill("trigger",player);

	iPrintLn("^0[^3S^0]");
    player braxi\_rank::giveRankXP("", 500);

	trig delete();

	player thread secret_step2();
}

secret_step2()
{
	trig = getEnt("trig_secstep2","targetname");

	trig waittill("trigger",player);

	iPrintLn("^0[^3E^0]");
    player braxi\_rank::giveRankXP("", 500);

	trig delete();

	player thread secret_step3();
}

secret_step3()
{
	trig = getEnt("trig_secstep3","targetname");

	trig waittill("trigger",player);

	iPrintLn("^0[^3C^0]");
    player braxi\_rank::giveRankXP("", 500);

	trig delete();

	player thread secret_step4();
}


secret_step4()
{
	trig = getEnt("trig_secstep4","targetname");
	trig waittill("trigger",player);

	iPrintLn("^0[^3R^0]");
    player braxi\_rank::giveRankXP("", 500);

	trig delete();

	player thread secret_step5();
}


secret_step5()
{
	trig = getEnt("trig_secstep5","targetname");

	trig waittill("trigger",player);

	iPrintLn("^0[^3E^0]");
    player braxi\_rank::giveRankXP("", 500);

	trig delete();


   player thread secret_step6();

}

secret_step6()
{
	trig = getEnt("trig_secstep6","targetname");
    trig2 = getEnt("trig_sechint","targetname");
	brush = getEnt("secopena","targetname");
   brush2 = getEnt("secopenb","targetname");


	trig waittill("trigger",player);

   iPrintLn("^0[^3T^0]");
   iPrintLn("^0[^3Secret Opened^0.^0]");
   player braxi\_rank::giveRankXP("", 500);

	trig delete();
    trig2 delete();

	brush moveZ(-300,4);
   brush2 moveZ(300,4);

	player thread sectp();
}

sectp()
{
   trig = getent("trig_sectp", "targetname");
   tele1 = getent ("orig_sectp", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
     player playlocalSound("tp");
     player thread secret_timer();
	 player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player.sc_pos = 0;
     player.insec = true;
     player iPrintLn("^3" + player.name + " ^0entered ^3Secret Room^0!");

     player thread secfinish();
    }
}

secfinish()
{
    self endon( "spawned_player" );
    self endon( "joined_spectators" );
    self endon( "death" );

   trig = getent("trig_secfinish", "targetname");
   tele1 = getent ("orig_secfinish", "targetname");
   brush = getEnt("cutstep","targetname");

   for(;;)
    {
     trig waittill("trigger", player);

     if(player != self)
        continue;

    player notify("secret_done");
	player.secretTimer destroy();
	player setOrigin(tele1.origin);
    player setPlayerAngles(tele1.angles);
    player.sc_pos = 0;
    player.insec = false;
    player iprintlnBOld ("^3You ^0finished ^3Secret Room^0.");
    iPrintLn("^3" + player.name + " ^0finished ^3Secret Room^0!");
    player braxi\_rank::giveRankXP("", 7000);

    brush hide();
	brush notsolid();

    break;
    }

}

sechints()
{
   thread sechint1();
   thread sechint2();
   thread sechint3();
   thread sechint4();
   thread sechint5();
   thread sechint6();

}

sechint1()
{
    trig = getEnt("trig_sechint1","targetname");
    trig setHintString ("^3Use ^73 2-3 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

sechint2()
{
    trig = getEnt("trig_sechint2","targetname");
    trig setHintString ("^3Fall down on platform with ^7333^3.");

    trig waittill("trigger", player);

}

sechint3()
{
    trig = getEnt("trig_sechint3","targetname");
    trig setHintString ("^3Use ^73 2-3 ^3or ^71 3 2-3 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

sechint4()
{
    trig = getEnt("trig_sechint4","targetname");
    trig setHintString ("^3Use ^73 2(5)-3 2 1 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

sechint5()
{
    trig = getEnt("trig_sechint5","targetname");
    trig setHintString ("^3Use ^73 2-3 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

sechint6()
{
    trig = getEnt("trig_sechint6","targetname");
    trig setHintString ("^3Just jump in hole with ^7333 ^3lmao^7.");

    trig waittill("trigger", player);

}

save_load_logic()
{
    fail_trigger = getent("trig_fail","targetname");
    save_triggers = GetEntArray("save_triggers","targetname");

    for(i=0;i<save_triggers.size;i++)
        thread save_pos(save_triggers[i],i);

    while(1)
    {
        fail_trigger waittill("trigger",player);
        player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,50) );
    }
}

save_pos(trig,pos)
{
    while(1)
    {
        trig waittill("trigger",player);

        if(!IsDefined(player.sc_pos))
            player.sc_pos = pos;

        else if(IsDefined(player.sc_pos) && player.sc_pos < pos)
        {
            player.sc_pos = pos;
            //IPrintLnBold(pos+" save");
        }

        wait 0.1;
    }
}

secret_timer()
{
	self endon("secret_done");
	self endon("death");
	self endon("round_ended");
	self thread destroyOnDeath();

	if(isdefined(self.secretTimer))
	self.secretTimer destroy();

	self.secretTimer = newclienthudelem(self);
	self.secretTimer.foreground = true;
	self.secretTimer.alignX = "center";
	self.secretTimer.alignY = "bottom";
	self.secretTimer.horzAlign = "center";
	self.secretTimer.vertAlign = "bottom";
	self.secretTimer.x = 0;
	self.secretTimer.y = -7;
	self.secretTimer.sort = 5;
	self.secretTimer.fontScale = 1.4;
	self.secretTimer.font = "default";
	self.secretTimer.glowAlpha = 0;
	self.secretTimer.hidewheninmenu = true;
	self.secretTimer.label = &"^3Time left: ^0&&1";
	if(isdefined(level.randomcolor))
	self.secretTimer.glowColor = level.randomcolor;
	else
	self.secretTimer.glowColor = (1,0,0);

	time = 120;
	for(i=0;i<time;i++)
		{
			self.secretTimer setvalue(time-i);
			wait 1;
		}
		self.secretTimer setvalue(0);
		self suicide();

		if(isdefined(self.secretTimer))
		self.secretTimer destroy();
}

destroyOnDeath()
{

	self waittill("death");

	if(isDefined(self.secretTimer))

	self.secretTimer destroy();
}

shortcut()
{
   trig = getent("shortcut", "targetname");
   tele = getent ("orig_shortcut", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3You ^0found ^3Shortcut^0!");
     iPrintLn("^3" + player.name + " ^0found ^3Shortcut^0!");
     player braxi\_rank::giveRankXP("", 500);
    }
}

actisectp()
{
   trig = getent("trig_actisecret", "targetname");
   tele = getent ("orig_actisec", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to enter ^3Activator Secret^0!");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Good Luck ^0:)");

     player thread actisecfail();
     player thread actisecfinish();
    }
}

actisecfail()
{
   trig = getent("trig_actisecfail", "targetname");
   tele = getent ("orig_actisec", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);

	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Try again ^0:/");

    }
}

actireturn()
{
   trig = getent("trig_actisecleave", "targetname");
   tele = getent ("orig_actifinish", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to leave ^3Activator Secret^0!");

   for(;;)
    {
     trig waittill("trigger", player);
     level notify("secret_done");
     level notify("disconnect");
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Well...try next ^0time^3!");
    }
}

actisecfinish()
{
    self endon( "spawned_player" );
    self endon( "joined_spectators" );
    self endon( "death" );

   trig = getent("trig_actisecfinish", "targetname");
   tele = getent ("orig_actifinish", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);

     if(player != self)
        continue;

    player notify("secret_done");
	player.secretTimer destroy();
	player setOrigin(tele.origin);
    player setPlayerAngles(tele.angles);
    player iprintlnBOld ("^3Nice! You finished ^3Activator Secret ^0!");
    iPrintLn("^3" + player.name + " ^0finished ^3Activator Secret^0!");
    player braxi\_rank::giveRankXP("", 1000);

    break;
    }

}

actisechints()
{
   thread actisechint1();
   thread actisechint2();
   thread actisechint3();
   thread actisechint4();

}

actisechint1()
{
    trig = getEnt("trig_actisechint1","targetname");
    trig setHintString ("^3Use ^71-3 ^3or ^71-3 2 1 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

actisechint2()
{
    trig = getEnt("trig_actisechint2","targetname");
    trig setHintString ("^3Use ^73 2-3 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

actisechint3()
{
    trig = getEnt("trig_actisechint3","targetname");
    trig setHintString ("^3Use ^73 2-3 2 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

actisechint4()
{
    trig = getEnt("trig_actisechint4","targetname");
    trig setHintString ("^3Use ^73 2-3 ^3or ^71 3 2-3 ^3for this bounce^7.");

    trig waittill("trigger", player);

}

epicroomentrance()
{
   trig = getent("trig_epicroom", "targetname");
   tele1 = getent ("orig_epicentrance", "targetname");

   while(1)
    {
    trig setHintString("^3Tf you doing here^0...");
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
      player iprintlnBOld ("^3WoW^0! You found ^3Epic ^0room!");
       player iprintlnBOld ("^0Pickup any ^3model ^0you like and leave area!");
     trig delete();
    }
}

epicroomexit()
{
   trig = getent("trig_epicexit", "targetname");
   tele1 = getent ("orig_epicexit", "targetname");

   while(1)
    {
      trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     player iprintlnBOld ("^0Welcome back to ^3real world^0!");
     player braxi\_rank::giveRankXP("", 500);
     trig delete();
    }
}

initializeModelPickup()
{
    level.modelcount=0;

    while(1)
    {
        level waittill("player_spawn", player);
        player.pickup = false;
    }
}

spawnPickuppableModel(origin, angles, model, origin_offset, acceleration_time, radius, height, hintstring, collision_radius, collision_height)
{
    if (!isDefined(origin_offset))
        origin_offset = (0,0,0);

    if (!isDefined(acceleration_time))
        acceleration_time = 0.15;

    if (!isDefined(radius))
        radius = 30;

    if (!isDefined(height))
        height = 30;

    if (!isDefined(hintstring))
        hintstring = "^0Press ^3[{+activate}] ^0to ^3pickup^0!";

    level.modelcount ++;
    xmodel = spawn( "script_model", origin+origin_offset );
	xmodel.angles = angles;
	xmodel setModel( model );

    trigg = spawn( "trigger_radius", origin, 0, radius, height);

    info = spawnStruct();

    info.xmodel = xmodel;
    info.trigg = trigg;
    info.id = level.modelcount;
    info.origin_offset = origin_offset;
    info.acceleration_time = acceleration_time;
    info.radius = radius;
    info.height = height;
    info.hintstring = hintstring;

    //-----EXPERIMENTAL-----

    if (isDefined(collision_radius)&&isDefined(collision_height))
    {
        solid = spawn( "trigger_radius", origin, 0, collision_radius, collision_height );
        solid.angles = angles;
        solid setContents( 1 );
        info.collisionmodel = solid;
        info.collision_radius = collision_radius;
        info.collision_height = collision_height;
    }

    //-----EXPERIMENTAL-----

    thread checkPickup(info);

    return info;
}

destroyPickuppableModel(info)
{
    self notify(info.id+"_mdl");
    info.xmodel delete();
    info.trigg delete();

    if (isDefined(info.collisionmodel))
        info.collisionmodel delete();

    info = undefined;
}

pickUp(info)
{
    self endon(info.id+"button_pressed");

    xmodel = spawn( "script_model", self.origin );
	xmodel setModel( info.xmodel.model );

    cycles = 0;

    while(1)
    {
        trace = bulletTrace(self getPlayerEyePosition(), self getPlayerEyePosition() + vector_scale(anglesToForward(self getPlayerAngles()), 80), false, xmodel);
        xmodel.origin = trace["position"];
        xmodel.angles = self getPlayerAngles();

        if ((self useButtonPressed() && cycles == 5) || !isAlive(self))
        {
            self enableWeapons();
            self.pickup = false;

            xmodel.angles = (0,self.angles[1],0);
            trace = bulletTrace(xmodel.origin+info.origin_offset,xmodel.origin-(0,0,9999999)+info.origin_offset,false,undefined);
            xmodel moveTo(trace["position"]+info.origin_offset, distance((0,0,xmodel.origin[2])+info.origin_offset, (0,0,trace["position"][2]+1))/30*info.acceleration_time, 0, 0);
            xmodel waittill ("movedone");
            xmodel moveTo(xmodel.origin+(0,0,10)+info.origin_offset,0.4,0,0.4);
            xmodel waittill ("movedone");
            xmodel moveTo(trace["position"]+info.origin_offset, 0.4, 0.4, 0);
            xmodel waittill ("movedone");

            spawnPickuppableModel(xmodel.origin-info.origin_offset,xmodel.angles,xmodel.model,info.origin_offset,info.acceleration_time,info.radius,info.height,info.hintstring,info.collision_radius,info.collision_height);

            xmodel delete();

            self notify(info.id+"button_pressed");
        }

        if (cycles!=5)
            cycles++;

        wait 0.001;
    }
}

checkPickup(info)
{
    self endon(info.id+"_mdl");
    while(1)
	{
		info.trigg waittill ( "trigger", player );

        if (!player.pickup)
        {
            if (info.hintstring!="")
                player thread genhud(info.hintstring);

            if (player useButtonPressed())
                {
                    player.pickup = true;
                    player thread pickUp(info);
                    player disableWeapons();
                    thread destroyPickuppableModel(info);
                }
        }
        wait 0.01;
	}
}

getPlayerEyePosition()
{
    if(self getStance() == "prone")
        vector = self.origin + (0, 0, 11);
    else if(self getStance() == "crouch")
        vector = self.origin + (0, 0, 40);
    else
        vector = self.origin + (0, 0, 60);

    return vector;
}

genHud(string)
{
    hud_mdl = newClientHudElem( self );
    hud_mdl setText(string);
    hud_mdl.fontScale = 1.6;
    hud_mdl.x = 0;
    hud_mdl.y = 25;
    hud_mdl.horzAlign = "center";
    hud_mdl.vertAlign = "middle";
    hud_mdl.alignX = "center";
    hud_mdl.alignY = "middle";

    wait 0.1;

    hud_mdl destroy();
}

endplata()
{
   plata = getent("endplata", "targetname");

   trig = getent("trig_endplata", "targetname");

   trig waittill ("trigger",player);

  while(1)
	{
    wait 1;
	 plata moveY (-928,2);
    wait 4;
    plata moveY (928,2);
    wait 4;
	}
}

endplatb()
{
   platb = getent("endplatb", "targetname");

   trig = getent("trig_endplatb", "targetname");

   trig waittill ("trigger",player);

  while(1)
	{
    wait 1;
	 platb moveY (-928,2);
    wait 4;
    platb moveY (928,2);
    wait 4;
	}
}

trap1()
{
   plat = getent("trap1", "targetname");

   trig = getent("trig_trap1", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

  for(;;)
	{
    plat  rotateYaw (360,5);
    wait 5;
    plat  rotateYaw (-360,5);
    wait 5;
	}
}

trap2()
{
   plat = getent("trap2", "targetname");

   trig = getent("trig_trap2", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");


  for(;;)
	{
	plat moveZ (80,0.7);
    wait 0.7;
    plat moveZ (-80,0.7);
    wait 0.7;
    plat moveZ (80,0.7);
    wait 0.7;
    plat moveZ (-80,0.7);
    wait 0.7;
	}
}

trap3()
{
   plata = getent("trap3a", "targetname");
   platb = getent("trap3b", "targetname");

   trig = getent("trig_trap3", "targetname");
   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");

   trig waittill ("trigger", player);
   trig setHintString("^1Activated");


   for(;;)
	{
	 plata notsolid();
    plata hide();
    platb solid();
    platb show();
    wait 3;
	 plata solid();
    plata show();
    platb solid();
    platb show();
	wait 2;
	 plata solid();
    plata show();
    platb notsolid();
    platb hide();
	wait 3;
    plata solid();
    plata show();
    platb solid();
    platb show();
	wait 2;
	}
}

trap4()
{
   ladder = getent("trap4a", "targetname");
   fence = getent("trap4b", "targetname");
   rock = getent("trap4c", "targetname");

   trig = getent("trig_trap4", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

    ladder solid();
    ladder show();

    fence solid();
    fence show();

    rock notsolid();
    rock hide();

  for(;;)
	{
    ladder notsolid();
    ladder hide();
    fence notsolid();
    fence hide();
    rock solid();
    rock show();
    iprintln ("^3Ladder disappeared^0!");
    wait 7;
    ladder solid();
    ladder show();
    fence solid();
    fence show();
    rock notsolid();
    rock hide();
    iprintln ("^3Ladder appeared^0!");
    wait 7;

	}
}

trap4hint()
{
    trig = getEnt("trig_ladderhint","targetname");
    trig setHintString ("^3Trap might be ^0activated ^3so watch out at ^0bottom left ^3for hint^0!");

    trig waittill("trigger", player);

}

trap5()
{
   cylinder = getent("trap5", "targetname");

   trig = getent("trig_trap5", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   for(;;)
  {
    wait 0.1;
   cylinder rotateYaw (-720,4);
   }
}

trap6()
{
trig = getEnt ("trig_trap6", "targetname");
trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
plata = getent ("trap6a", "targetname");
platb = getent ("trap6b", "targetname");

    plata notsolid();
    plata hide();
    platb notsolid();
    platb hide();

for(;;)
{
   trig waittill ("trigger", player);
    trig setHintString("^1Activated");

    randomplat = randomint(2);

    if (randomplat == 0 )
    {
    plata notsolid();
    plata hide();
    platb solid();
    platb show();
    }
    if (randomplat == 1)
    {
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    }

}

}

trap7()
{
trig = getEnt ("trig_trap7", "targetname");
trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
plata = getent ("trap7a", "targetname");
platb = getent ("trap7b", "targetname");

    plata notsolid();
    plata hide();
    platb notsolid();
    platb hide();

for(;;)
{
   trig waittill ("trigger", player);
    trig setHintString("^1Activated");

    randomplat = randomint(2);

    if (randomplat == 0 )
    {
    plata notsolid();
    plata hide();
    platb solid();
    platb show();
    }
    if (randomplat == 1)
    {
    plata solid();
    plata show();
    platb notsolid();
    platb hide();
    }

}

}

trap8()
{
   cylinder = getent("trap8a", "targetname");
   bounce = getent("trap8b", "targetname");
   modela = getent("lightdeletea", "targetname");
   modelb = getent("lightdeleteb", "targetname");

   trig = getent("trig_trap8", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

   for(;;)
  {
    wait 0.1;
   cylinder rotateYaw (360,5);
   bounce hide();
   bounce notsolid();
   modela hide();
   modela notsolid();
   modelb hide();
   modelb notsolid();
   }
}

trap9()
{
   plata = getent("trap9a", "targetname");
   platb = getent("trap9b", "targetname");
   platc = getent("trap9c", "targetname");
   hurta = getent("trig_hurt9a", "targetname");
   hurtb = getent("trig_hurt9b", "targetname");
   hurtc = getent("trig_hurt9c", "targetname");

   trig = getent("trig_trap9", "targetname");
   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");

   hurta enablelinkto();
   hurta linkto (plata);

   hurtb enablelinkto();
   hurtb linkto (platb);

   hurtc enablelinkto();
   hurtc linkto (platc);

   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

  for(;;)
	{
	 plata moveX (402,0.7);
    platb moveX (-402,0.7);
    platc moveX (402,0.7);
    wait 0.7;
    plata moveX (-402,0.7);
    platb moveX (402,0.7);
    platc moveX (-402,0.7);
    wait 0.7;
	}
}

trap10()
{
   cylindera = getent("trap10a", "targetname");
   cylinderb = getent("trap10b", "targetname");

   trig = getent("trig_trap10", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

   for(;;)
  {
    wait 0.1;
   cylindera rotateYaw (360,4);
   cylinderb rotateYaw (-360,4);
   }
}

trap10extra()
{
   plat = getent("trap10extra", "targetname");
   origin_effect1 = getEnt("explosionfx1", "targetname");
   origin_effect2 = getEnt("explosionfx2", "targetname");
   origin_effect3 = getEnt("explosionfx3", "targetname");

   level.trig = getent("trig_trap10extra", "targetname");

   level.trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   level.trig waittill ("trigger", player);
   level.trig setHintString("^1Activated");

    PlayFX(level.break_rock, origin_effect1.origin);
    PlayFX(level.break_rock, origin_effect2.origin);
    PlayFX(level.break_rock, origin_effect3.origin);

    player playlocalSound("rockexplosion");

	plat notsolid();
    plat hide();

}

trap11()
{
   plata = getent("trap11a", "targetname");
   platb = getent("trap11b", "targetname");
   platc = getent("trap11c", "targetname");
   platd = getent("trap11d", "targetname");
   plate = getent("trap11e", "targetname");

   trig = getent("trig_trap11", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");


  for(;;)
	{
	 plata moveZ (100,1);
    platb moveZ (-100,1);
    platc moveZ (100,1);
    platd moveZ (-100,1);
    plate moveZ (100,1);
    wait 2;
    plata moveZ (-100,1);
    platb moveZ (100,1);
    platc moveZ (-100,1);
    platd moveZ (100,1);
    plate moveZ (-100,1);
    wait 2;
    plata moveZ (100,1);
    platb moveZ (-100,1);
    platc moveZ (100,1);
    platd moveZ (-100,1);
    plate moveZ (100,1);
    wait 2;
    plata moveZ (-100,1);
    platb moveZ (100,1);
    platc moveZ (-100,1);
    platd moveZ (100,1);
    plate moveZ (-100,1);
    wait 2;
	}
}

trap12()
{
   cylinder = getent("trap12", "targetname");

   trig = getent("trig_trap12", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

   for(;;)
  {
    wait 0.1;
   cylinder rotateRoll (-360,3.5);
   }
}

trap13()
{
   bouncea = getent("trap13a", "targetname");
   bounceb = getent("trap13b", "targetname");
   plat = getent("trap13c", "targetname");

   plat hide();
   plat notsolid();

   trig = getent("trig_trap13", "targetname");

   trig setHintString("^0Press ^3[&&1] ^0to activate a ^3trap^0!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

   for(;;)
  {
   bouncea rotateRoll (360,2);
   bounceb rotateRoll (-360,2);
   plat show();
   plat solid();
   wait 4;
   bouncea rotateRoll (360,2);
   bounceb rotateRoll (-360,2);
   wait 4;

   }
}

///ROOMS
waitdead()
{
    activator = GetActivator();
    knife = getent("trig_kniferoom","targetname");
    sniper = getent("trig_sniperroom","targetname");
    spin = getent("trig_spinningroom","targetname");
    maze = getent("trig_mazeroom","targetname");
    old = getent("trig_oldroom","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    spin thread maps\mp\_utility::triggerOff();
    maze thread maps\mp\_utility::triggerOff();
    old thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    level notify ("spin_finished");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    spin thread maps\mp\_utility::triggerOn();
    maze thread maps\mp\_utility::triggerOn();
    old thread maps\mp\_utility::triggerOn();
}

endTimerPure(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^0" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

roomselection()
{
level.room_trig = getEnt( "trig_roomselection", "targetname");
room = getEnt( "orig_roomselection", "targetname" );
level.room_trig setHintString ("^0Press ^3[&&1]^0 to enter ^3Room Selection^0!");

for(;;)
{
level.room_trig waittill( "trigger", player );
if( !isDefined( level.room_trig ) )
return;

iPrintlnBold( " ^3" + player.name + " ^0is picking a room" );
acti = GetActivator();
if(level.firstenter == true)
{
	acti freezeControls(1);
	acti iPrintLnBold("^1Player is picking room so don't move^0!");
	level notify("acti_antiglitch");
	level.firstenter = false;
}
player SetPlayerAngles( room.angles );
player setOrigin( room.origin );
player TakeAllWeapons();
player antiglitcher();
}
}

antiglitcher()
{
level.activator1 = GetActivator();
level.activ = GetActivator();
self common_scripts\utility::waittill_any("death","disconnect");
//self waittill("death");
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		//wait 3;
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");
//level.activKills++;
//thread killstreak();
	iPrintln("^3"+self.name+" ^0died");
	wait 0.2;
	iPrintlnBold("^3Room selection opened^0!");
}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniperroom", "targetname");

    jumpersc = getEnt ("orig_sniperjumper", "targetname");
    actisc = getEnt ("orig_sniperacti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^0Press ^3[&&1]^0 to enter ^3Sniper Room^0!");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread endTimerPure("^3Kill each other !", 3, 0);
        activator thread endTimerPure("^3Kill each other !", 3, 0);
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");
        player.maxhealth = 100;


        while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

snipertriangles()
{
   trianglea = getent("trianglejumper", "targetname");
   triangleb = getent("triangleacti", "targetname");

   for(;;)
   {
    wait 0.1;
   trianglea rotateYaw (-360,6);
   triangleb rotateYaw (-360,6);
   wait 0.1;
   }

}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_kniferoom", "targetname");

    jumperk = getEnt ("orig_knifejumper", "targetname");
    actik = getEnt ("orig_knifeacti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("^0Press ^3[&&1]^0 to enter ^3Knife Room^0!");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimerPure("^3Kill each other !", 3, 0);
        player thread endTimerPure("^3Kill each other !", 3, 0);
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

mazeroom()
{
   level.trigger_maze = getEnt ("trig_mazeroom", "targetname");

    orig_jumper = getEnt ("orig_mazejumper", "targetname");
    orig_acti = getEnt ("orig_mazeacti", "targetname");

    for(;;)
    {
	    level.trigger_maze setHintString ("^0Press ^3[&&1]^0 to enter ^3Maze Room^0!");
        level.trigger_maze waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread fightHUD("Maze Room", player, activator);
        player thread endTimerPure("^3Kill each other !", 3, 0);
        activator thread endTimerPure("^3Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon ("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
		thread mazeend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

mazeend(who, who2)
{
	trig = getEnt ("trig_mazefinish", "targetname");
	origWin = getEnt ("orig_mazewinner", "targetname");
	origLose = getEnt ("orig_mazelooser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
        winner freezeControls (1);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("frag_grenade_mp");
        winner giveMaxAmmo("frag_grenade_mp");
        winner switchToWeapon("frag_grenade_mp");
        winner thread frag_ammo();
        wait 0.1;

		if (winner == who)
			loser = who2;
		else
			loser = who;

		if (isDefined(loser))
		{
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
            loser iPrintLnBold("^3You have lost ^7!");
		}
	}
}

spinball()
{
   balla = getent("spinballa", "targetname");
   ballb = getent("spinballb", "targetname");
   ballc = getent("spinballc", "targetname");
   balld = getent("spinballd", "targetname");

   for(;;)
 {
    wait 2.5;
    balla rotateYaw (-720,2);
    balla moveZ (-550,2);
    ballb rotateYaw (-720,2);
    ballb moveZ (-550,2);
    ballc rotateYaw (-720,2);
    ballc moveZ (-550,2);
    balld rotateYaw (-720,2);
    balld moveZ (-550,2);
    wait 2.5;
    balla rotateYaw (720,2);
    balla moveZ (550,2);
    ballb rotateYaw (720,2);
    ballb moveZ (550,2);
    ballc rotateYaw (720,2);
    ballc moveZ (550,2);
    balld rotateYaw (720,2);
    balld moveZ (550,2);
 }

}

spinroom()
{
   level.trigger_spin = getEnt ("trig_spinningroom", "targetname");

    orig_jumper = getEnt ("orig_spinjumper", "targetname");
    orig_acti = getEnt ("orig_spinacti", "targetname");

    for(;;)
    {
	    level.trigger_spin setHintString ("^0Press ^3[&&1]^0 to enter ^3Spinning Room^0!");
        level.trigger_spin waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread spin_wait();
        thread fightHUD("Spin Room", player, activator);
        player SetClientDVAR("cg_thirdperson", 1);
        activator SetClientDVAR("cg_thirdperson", 1);
        player thread endTimerPure("^3Kill each other !", 3, 0);
        activator thread endTimerPure("^3Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player.maxhealth = 100;
		thread spinend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

spinend(who, who2)
{
	trig = getEnt ("trig_spinfinish", "targetname");
	origWin = getEnt ("orig_spinwinner", "targetname");
	origLose = getEnt ("orig_spinlooser", "targetname");

	while(1)
	{
		trig waittill("trigger", loser);

        loser freezeControls (1);
        loser setOrigin (origLose.origin);
		loser setPlayerAngles (origLose.angles);
		loser takeAllWeapons();
        loser SetClientDVAR("cg_thirdperson", 0);
        loser iPrintLnBold("^3You have lost ^7!");
        level notify ("spin_finished");

		if (loser == who)
			winner = who2;
		else
			winner = who;

		if (isDefined(winner))
		{
        winner freezeControls (1);
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner SetClientDVAR("cg_thirdperson", 0);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("frag_grenade_mp");
        winner giveMaxAmmo("frag_grenade_mp");
        winner switchToWeapon("frag_grenade_mp");
        winner thread frag_ammo();
        wait 0.1;
		}
	}
}

spin_wait()
{
    wait 8;
    thread spin_launch();

}

spin_launch()
{
    level endon ("spin_finished");
    level.spin_on = 1;
    level.spin_speed = 6;
    for(;;)
    {
        if (level.spin_on == 1)
        {
            thread spin_script();
        }
        wait(level.spin_speed);
    }
}

spin_script()
{
    spinner = getEnt ("spinup", "targetname");
    random_spinner = randomint(3);

    if (random_spinner == 0)
    {
        spinner rotateyaw(-360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.20;
    }
    else
    {
        spinner rotateyaw(360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.20;
    }
    if (level.spin_speed < 2)
    {
        level.spin_speed = 1.6;
    }

}

frag_ammo()
{
	self endon("disconnect");
	self endon("death");

	for (;;)
	{
		if (self getCurrentWeapon() == "frag_grenade_mp")
			self giveMaxAmmo("frag_grenade_mp");

		wait 5;
	}
}

oldroom()
{
   level.trigger_old = getEnt ("trig_oldroom", "targetname");

    jumpero = getEnt ("orig_oldjumper", "targetname");
    actio = getEnt ("orig_oldacti", "targetname");

   for(;;)
    {
        level.trigger_old setHintString ("^0Press ^3[&&1]^0 to enter ^3Old Room^0!");
        level.trigger_old waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Old Room", player, activator);
        player thread endTimerPure("^3Kill the ^0Activator ^3!", 3, 0);
        activator thread endTimerPure("^3Kill the ^0Jumper ^3!", 3, 0);
	    player setOrigin (jumpero.origin);
        player setPlayerAngles (jumpero.angles);
        activator setOrigin (actio.origin);
        activator setPlayerAngles (actio.angles);
        player takeAllWeapons();
        player giveWeapon("ice_pick_mp");
        player switchToWeapon("ice_pick_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}
