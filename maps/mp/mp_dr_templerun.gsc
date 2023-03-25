#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include common_scripts\utility;

/*
Feel free to use any peace of script,no need to credit me.( ͡❛ ͜ʖ ͡❛)
─────────────────────────────────────────────────────────────────────────────────────────────
─██████──────────██████─██████████████─██████████████────██████████████───████████──████████─
─██░░██████████████░░██─██░░░░░░░░░░██─██░░░░░░░░░░██────██░░░░░░░░░░██───██░░░░██──██░░░░██─
─██░░░░░░░░░░░░░░░░░░██─██░░██████░░██─██░░██████░░██────██░░██████░░██───████░░██──██░░████─
─██░░██████░░██████░░██─██░░██──██░░██─██░░██──██░░██────██░░██──██░░██─────██░░░░██░░░░██───
─██░░██──██░░██──██░░██─██░░██████░░██─██░░██████░░██────██░░██████░░████───████░░░░░░████───
─██░░██──██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██────██░░░░░░░░░░░░██─────████░░████─────
─██░░██──██████──██░░██─██░░██████░░██─██░░██████████────██░░████████░░██───────██░░██───────
─██░░██──────────██░░██─██░░██──██░░██─██░░██────────────██░░██────██░░██───────██░░██───────
─██░░██──────────██░░██─██░░██──██░░██─██░░██────────────██░░████████░░██───────██░░██───────
─██░░██──────────██░░██─██░░██──██░░██─██░░██────────────██░░░░░░░░░░░░██───────██░░██───────
─██████──────────██████─██████──██████─██████────────────████████████████───────██████───────
─────────────────────────────────────────────────────────────────────────────────────────────
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
─██████████████─██████──────────██████─██████─████████████───██████████████─██████████████─██████████████─██████──██████─
─██░░░░░░░░░░██─██░░██████████████░░██─██░░██─██░░░░░░░░████─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─██░░██──██░░██─
─██░░██████████─██░░░░░░░░░░░░░░░░░░██─██████─██░░████░░░░██─██░░██████████─██░░██████░░██─██████░░██████─██░░██──██░░██─
─██░░██─────────██░░██████░░██████░░██─────██─██░░██──██░░██─██░░██─────────██░░██──██░░██─────██░░██─────██░░██──██░░██─
─██░░██─────────██░░██──██░░██──██░░██────────██░░██──██░░██─██░░██████████─██░░██████░░██─────██░░██─────██░░██████░░██─
─██░░██─────────██░░██──██░░██──██░░██────────██░░██──██░░██─██░░░░░░░░░░██─██░░░░░░░░░░██─────██░░██─────██░░░░░░░░░░██─
─██░░██─────────██░░██──██████──██░░██────────██░░██──██░░██─██░░██████████─██░░██████░░██─────██░░██─────██░░██████░░██─
─██░░██─────────██░░██──────────██░░██────────██░░██──██░░██─██░░██─────────██░░██──██░░██─────██░░██─────██░░██──██░░██─
─██░░██████████─██░░██──────────██░░██────────██░░████░░░░██─██░░██████████─██░░██──██░░██─────██░░██─────██░░██──██░░██─
─██░░░░░░░░░░██─██░░██──────────██░░██────────██░░░░░░░░████─██░░░░░░░░░░██─██░░██──██░░██─────██░░██─────██░░██──██░░██─
─██████████████─██████──────────██████────────████████████───██████████████─██████──██████─────██████─────██████──██████─
─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
*/

main()
{
 maps\mp\_load::main();

///FX LOAD
 level.water = LoadFx("misc/water_drop");
 level.fireblast = loadfx ("fire/temple_fire2");
 level.fan = loadfx ("fire/temple_fan");
 level.fire = loadfx ("fire/firelp_med_streak_pm_h");
 level.fire_torch = loadfx ("fire/tv_fire");
 level.board = LoadFx("explosions/wall_explosion_round");
 level.sparkle = LoadFx("misc/temple_sparkle");
 level.break_door = LoadFx("breakables/temple_wall_explode");

 game["allies"] = "sas";
 game["axis"] = "russian";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "woodland";
 game["axis_soldiertype"] = "woodland";

///DVARS
	setdvar("r_specularcolorscale", "1");
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);


///TRAP TRIGGERS
    addTriggerToList("trig_fan");
    addTriggerToList("trig_fire");
    addTriggerToList("trig_spinner");
    addTriggerToList("trig_ball");
    addTriggerToList("trig_board");
    addTriggerToList("trig_laser");

///PRECACHE MODEL/ITEM TO SEE MODEL/ITEM IN GAME
    precacheshader("mtl_laraclothes");
    precacheshader("mtl_laraface");
    precacheshader("mtl_eyes_etc");
    precacheshader("mtl_boots_etc");
    precacheshader("mtl_larahair");
    precacheModel("plr_terry_laracroft");


    precacheshader("mtl_ursegor_full");
    precacheModel("plr_terry_ursegor");

    precacheItem("frag_grenade_mp");
    precacheItem("m40a3_mp");
    precacheItem("remington700_mp");
    precacheItem("knife_mp");
    precacheItem("deserteagle_mp");
    precacheItem("beretta_mp");
    precacheItem("ak47_mp");

///THREADS/ACTIVATES SCRIPT
    thread messagescreen();
    thread messages();
    thread randommusic();
    thread jumperskin();
    thread actiskin();
    thread arrow();
    thread coinsmover();
    thread coins();

    thread spinner();

    thread stage2door();
    thread stage2tp();

    thread hints();
    thread enddoorsniper();
    thread enddoorknife();
    thread enddoorrun();
    thread enddoorspin();
    thread enddoormaze();

    thread sectp();
    thread secend();
    thread save_load_logic();

    thread actitp1();
    thread actitp2();

    thread waterfx1();
    thread waterd1_sound();
    thread waterfx2();
    thread waterd2_sound();

    thread fan();
    thread fire();
    thread fire_torch();
    thread fire_torch_sound();
    thread firefx();
    thread fire_statue_sound();
    thread knife_fire();
    thread knife_fire_sound();
    thread knife_vase();
    thread fire_failroom();
    thread fire_fail_sound();
    thread board();
    thread laser();
	thread rope();
    thread ball();
    thread end_wall();


    thread roomselection();
    thread kniferoom();
    thread sniperroom();
    thread sniperfail();
    thread runroom();
    thread run_jumper_fail();
    thread run_acti_fail();
    thread run_jumper_stage();
    thread run_acti_stage();
    thread spinroom();
    thread mazeroom();

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
    level.hud_fight2 setText("^3" + jumper + " ^7VS^7 " + "^3" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

messagescreen()
{
	level waittill("round_started");
	wait 1;
	noti = SpawnStruct();
	noti.TitleText = "^7Welcome to ^3TempleRun^7!";
    noti.notifyText = "^7Mapped and Scripted by ^3CM'death^7!";
	noti.duration = 8;
	noti.glowcolor = (0,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

messages()
{
   wait 4;
   for(;;)
{
   wait 10;
 x = randomint(6);
   if (x==0)
{
   iPrintln("^3Mapped ^7and ^3scripted ^7by ^3CM'death^7!");
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
//    iPrintLn("^3Map speed: ^7[^3"+getDvar("g_speed")+"^7]^7, ^7[^3"+getDvar("dr_jumpers_speed")+"^7]");
}

   if (x==5)
{
   iPrintLn("^7Thanks to ^3CM'Nobody ^7and ^3Ohh Rexy<3 ^7for helping me with the ^3bugs^7!");
}
}
}

randommusic()
{
    wait 5;

    randommusic = randomint(4);

    if (randommusic == 0)
    {
        ambientStop(2);
        AmbientPlay("temple3");
    }
    if (randommusic == 1)
    {
        ambientStop(2);
        AmbientPlay("temple2");
    }
    if (randommusic == 2)
    {
        ambientStop(2);
        AmbientPlay("temple1");
    }
    if (randommusic == 3)
    {
        ambientStop(2);
        AmbientPlay("temple4");
    }
}

jumperskin()
{

for(;;)
{
    level waittill( "player_spawn", player );

    player detachAll();
	player setmodel("plr_terry_laracroft");

}
}

actiskin()
{
trig = getent("trig_actiskin", "targetname");

while(1)
{
 trig waittill("trigger", player);

  wait 0.05;
    if(isDefined(level.activ) && isAlive(level.activ))
    {
        level.activ detachAll();
        level.activ setmodel("plr_terry_ursegor");
    }

 trig delete();

}
}

arrow()
{
   arrow= getent("arrow","targetname");

   level waittill("round_started");

   for(;;)
   {
   arrow moveZ (40,2);
   arrow waittill("movedone");
   arrow moveZ (-40,2);
   arrow waittill("movedone");
   }

}

coinsmover()
{
   coina = getent("coin1", "targetname");
   coinb = getent("coin2", "targetname");
   coinc = getent("coin3", "targetname");
   coind = getent("coin4", "targetname");
   coine = getent("coin5", "targetname");
   coinf = getent("coin6", "targetname");
   coing = getent("coin7", "targetname");
   coinra = getent("coinred1", "targetname");
   coinrb = getent("coinred2", "targetname");
   coinrc = getent("coinred3", "targetname");
   coinba = getent("coinblue1", "targetname");
   coinbb = getent("coinblue2", "targetname");

   for(;;)
 {
    wait 2.05;
    coina rotateYaw (-720,4);
    coina moveZ (-15,2);
    coinb rotateYaw (-720,4);
    coinb moveZ (-15,2);
    coinc rotateYaw (-720,4);
    coinc moveZ (-15,2);
    coind rotateYaw (-720,4);
    coind moveZ (-15,2);
    coine rotateYaw (-720,4);
    coine moveZ (-15,2);
    coinf rotateYaw (-720,4);
    coinf moveZ (-15,2);
    coing rotateYaw (-720,4);
    coing moveZ (-15,2);
    coinra rotateYaw (-720,4);
    coinra moveZ (-15,2);
    coinrb rotateYaw (-720,4);
    coinrb moveZ (-15,2);
    coinrc rotateYaw (-720,4);
    coinrc moveZ (-15,2);
    coinba rotateYaw (-720,4);
    coinba moveZ (-15,2);
    coinbb rotateYaw (-720,4);
    coinbb moveZ (-15,2);
    wait 2.05;
    coina rotateYaw (-720,4);
    coina moveZ (15,2);
    coinb rotateYaw (-720,4);
    coinb moveZ (15,2);
    coinc rotateYaw (-720,4);
    coinc moveZ (15,2);
    coind rotateYaw (-720,4);
    coind moveZ (15,2);
    coine rotateYaw (-720,4);
    coine moveZ (15,2);
    coinf rotateYaw (-720,4);
    coinf moveZ (15,2);
    coing rotateYaw (-720,4);
    coing moveZ (15,2);
    coinra rotateYaw (-720,4);
    coinra moveZ (15,2);
    coinrb rotateYaw (-720,4);
    coinrb moveZ (15,2);
    coinrc rotateYaw (-720,4);
    coinrc moveZ (15,2);
    coinba rotateYaw (-720,4);
    coinba moveZ (15,2);
    coinbb rotateYaw (-720,4);
    coinbb moveZ (15,2);
 }

}

coins()
{
thread coin1();
thread coin2();
thread coin3();
thread coin4();
thread coin5();
thread coin6();
thread coin7();
thread coinred1();
thread coinred2();
thread coinred3();
thread coinblue1();
thread coinblue2();
}

coin1()
{
   coin = getent("coin1", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin1", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[0].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin2()
{
   coin = getent("coin2", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin2", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[1].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin3()
{
   coin = getent("coin3", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin3", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[2].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin4()
{
   coin = getent("coin4", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin4", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[3].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin5()
{
   coin = getent("coin5", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin5", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[4].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin6()
{
   coin = getent("coin6", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin6", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[5].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coin7()
{
   coin = getent("coin7", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coin7", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[6].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 200);

    trig delete();
   }

}

coinred1()
{
   coin = getent("coinred1", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coinred1", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[7].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 1000);

    trig delete();
   }

}

coinred2()
{
   coin = getent("coinred2", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coinred2", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[8].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 1000);

    trig delete();
   }

}

coinred3()
{
   coin = getent("coinred3", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coinred3", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[9].origin);

    player iprintln ("^3You ^7collected a ^3coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 1000);

    trig delete();
   }

}

coinblue1()
{
   coin = getent("coinblue1", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coinblue1", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[10].origin);

    player iprintln ("^3You ^7collected a ^3big coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 5000);

    trig delete();
   }

}

coinblue2()
{
   coin = getent("coinblue2", "targetname");
   sparkle = getentArray("sparkle", "targetname");

   trig = getent("trig_coinblue2", "targetname");

   coin show();
   coin solid();

   trig enablelinkto();
   trig linkto (coin);

   trig waittill ("trigger",player);
   {
    coin hide();
    coin notsolid();

    PlayFX(level.sparkle, sparkle[11].origin);

    player iprintln ("^3You ^7collected a ^3big coin^7!");
    player playlocalSound ("temple_coin");
    player braxi\_rank::giveRankXP("", 5000);

    trig delete();
   }

}

spinner()
{
   spin = getent("spinner", "targetname");

   trig = getent("trig_spinner", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to activate a ^3spinner^7!");

   trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

   for(;;)
 {
    spin rotateYaw (-720,4);
    wait 8;
    spin rotateYaw (720,4);
    wait 8;
 }

}

stage2door()
{
   doora = getent("stage2doora", "targetname");
   doorb = getent("stage2doorb", "targetname");

   trig = getent("trig_stage2door", "targetname");

   trig waittill ("trigger",player);

   wait 0.1;
   doora rotateYaw(100,4);
   doorb rotateYaw(-100,4);
   iprintlnBOld ("^3" + player.name + " ^7opened the ^3gate^7!");
   player braxi\_rank::giveRankXP("", 500);

   trig delete();

}

stage2tp()
{
   trig = getent("trig_stage2tp", "targetname");
   tele = getent ("orig_stage2tp", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
    }
}

hints()
{
thread sniperhint();
thread knifehint();
thread runhint();
thread spinhint();
thread mazehint();
}

enddoorsniper()
{
   door = getent("door_sniper", "targetname");

   trig = getent("trig_door_sniper", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Sniper Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(-95,4);

   trig delete();

}

enddoorknife()
{
   door = getent("door_knife", "targetname");

   trig = getent("trig_door_knife", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Knife Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);

   trig delete();

}

enddoorrun()
{
   door = getent("door_run", "targetname");

   trig = getent("trig_door_run", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Run Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);

   trig delete();

}

enddoorspin()
{
   door = getent("door_spin", "targetname");

   trig = getent("trig_door_spin", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Spin Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(-95,4);

   trig delete();

}

enddoormaze()
{
   door = getent("door_maze", "targetname");

   trig = getent("trig_door_maze", "targetname");

   trig setHintString("^7Press ^3[&&1] ^7to open ^3door for Maze Room^7!");

   trig waittill ("trigger",player);

   wait 0.2;
   door rotateYaw(95,4);

   trig delete();

}

sectp()
{
   trig = getent("trig_sectp", "targetname");
   tele = getent ("orig_sectp", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
     player thread secret_timer();
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player.sc_pos = 0;
     player.insec = true;
     player iprintlnBOld ("^3You ^7entered in ^3Secret Room ^7!");

     player thread secend();
    }
}

secend()
{
    self endon( "spawned_player" );
    self endon( "joined_spectators" );
    self endon( "death" );


   trig = getent("trig_secend", "targetname");
   tele = getent ("orig_secend", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);

      if(player != self)
        continue;

     player notify("secret_done");
	 player.secretTimer destroy();
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player.sc_pos = 0;
     player.insec = false;
     player braxi\_rank::giveRankXP("", 5000);
     iprintln ("^3" + player.name + " ^7finished the ^3Secret Room^7!");

      break;
    }
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
        player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,1) );
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
            player IPrintLn("^3" + " Checkpoint " + "^7" + pos);
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
	self.secretTimer.label = &"^3Time left: ^7&&1";
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

actitp1()
{
   trig = getent("trig_actitp1", "targetname");
   tele = getent ("orig_actitp1", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3teleport^7!");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
    }
}

actitp2()
{
   trig = getent("trig_actitp2", "targetname");
   tele = getent ("orig_actitp2", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);

     wait 0.05;
     if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin(tele.origin);
            level.activ setPlayerAngles(tele.angles);
            level.activ iprintlnBold ("^3Jumper ^7trapped ^3you ^7so you can't ^3run away^7!");
            wait 5;
         }

     trig delete();
    }
}

waterfx1()
{
    origin_effect1 = getEntArray("waterd1", "targetname");

    level waittill("round_started");

    PlayFX(level.water, origin_effect1[0].origin);
    PlayFX(level.water, origin_effect1[1].origin);
    PlayFX(level.water, origin_effect1[2].origin);
    PlayFX(level.water, origin_effect1[3].origin);
    PlayFX(level.water, origin_effect1[4].origin);
    PlayFX(level.water, origin_effect1[5].origin);
    PlayFX(level.water, origin_effect1[6].origin);
    PlayFX(level.water, origin_effect1[7].origin);

}

waterd1_sound()
{
    sound = getentArray ("waterd1","targetname");

    level waittill("round_started");

 {

    sound[3] playloopsound ("temple_waterfall");

 }

}

waterfx2()
{
    origin_effect2 = getEntArray("waterd2", "targetname");

    level waittill("round_started");

    PlayFX(level.water, origin_effect2[0].origin);
    PlayFX(level.water, origin_effect2[1].origin);
    PlayFX(level.water, origin_effect2[2].origin);
    PlayFX(level.water, origin_effect2[3].origin);
    PlayFX(level.water, origin_effect2[4].origin);
    PlayFX(level.water, origin_effect2[5].origin);
    PlayFX(level.water, origin_effect2[6].origin);
    PlayFX(level.water, origin_effect2[7].origin);

}

waterd2_sound()
{
    sound = getentArray ("waterd2","targetname");

    level waittill("round_started");

 {
    sound[3] playloopsound ("temple_waterfall");

 }

}

fan()
{
    fan1 = getEnt("fan1", "targetname");
    fan2 = getEnt("fan2", "targetname");
    fan3 = getEnt("fan3", "targetname");
    fan4 = getEnt("fan4", "targetname");
    hurt = getEntArray("trig_hurt_fan1", "targetname");

    trig = getent("trig_fan", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to activate ^3fans!");

    hurt[0] maps\mp\_utility::triggerOff();
    hurt[1] maps\mp\_utility::triggerOff();
    hurt[2] maps\mp\_utility::triggerOff();
    hurt[3] maps\mp\_utility::triggerOff();

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

   for(;;)
   {

    fan1 RotatePitch(3240, 9);
    fan2 RotatePitch(3240, 9);
    fan3 RotatePitch(3240, 9);
    fan4 RotatePitch(3240, 9);

    thread fan_1();
    thread fan_2();
    thread fan_3();
    thread fan_4();
    thread fan_sound_1();
    thread fan_sound_2();
    thread fan_sound_3();
    thread fan_sound_4();
    thread hurt();

    wait 18;

    }

}

fan_1()
{
    fan = getent ("fanfx1","targetname");
    fan.angles = (-1, 0, 0);
    fx = spawnFX(level.fan, fan.origin,fan.angles);

    triggerFX(fx);
    wait 9;
    fx delete();
}

fan_2()
{
    fan = getent ("fanfx2","targetname");
    fan.angles = (1, 0, 0);
    fx = spawnFX(level.fan, fan.origin,fan.angles);

    triggerFX(fx);
    wait 9;
    fx delete();
}

fan_3()
{
    fan = getent ("fanfx3","targetname");
    fan.angles = (-1, 0, 0);
    fx = spawnFX(level.fan, fan.origin,fan.angles);

    triggerFX(fx);
    wait 9;
    fx delete();
}

fan_4()
{
    fan = getent ("fanfx4","targetname");
    fan.angles = (1, 0, 0);
    fx = spawnFX(level.fan, fan.origin,fan.angles);

    triggerFX(fx);
    wait 9;
    fx delete();
}

fan_sound_1()
{
    sound = getent ("fan1","targetname");

    sound playsound ("temple_fan_wind");
    wait 3;
    sound playsound ("temple_fan_wind");
    wait 3;
    sound playsound ("temple_fan_wind");
    wait 3;
}

fan_sound_2()
{
    sound2 = getent ("fan2","targetname");

    sound2 playsound ("temple_fan_wind");
    wait 3;
    sound2 playsound ("temple_fan_wind");
    wait 3;
    sound2 playsound ("temple_fan_wind");
    wait 3;
}

fan_sound_3()
{
    sound3 = getent ("fan3","targetname");

    sound3 playsound ("temple_fan_wind");
    wait 3;
    sound3 playsound ("temple_fan_wind");
    wait 3;
    sound3 playsound ("temple_fan_wind");
    wait 3;
}

fan_sound_4()
{
    sound4 = getent ("fan4","targetname");

    sound4 playsound ("temple_fan_wind");
    wait 3;
    sound4 playsound ("temple_fan_wind");
    wait 3;
    sound4 playsound ("temple_fan_wind");
    wait 3;
}

hurt()
{
    hurt = getEntArray("trig_hurt_fan1", "targetname");

    hurt[0] maps\mp\_utility::triggerOff();
    hurt[1] maps\mp\_utility::triggerOff();
    hurt[2] maps\mp\_utility::triggerOff();
    hurt[3] maps\mp\_utility::triggerOff();

    for(;;)
    {
    hurt[0] maps\mp\_utility::triggerOn();
    hurt[1] maps\mp\_utility::triggerOn();
    hurt[2] maps\mp\_utility::triggerOn();
    hurt[3] maps\mp\_utility::triggerOn();
    wait 9;
    hurt[0] maps\mp\_utility::triggerOff();
    hurt[1] maps\mp\_utility::triggerOff();
    hurt[2] maps\mp\_utility::triggerOff();
    hurt[3] maps\mp\_utility::triggerOff();
    wait 9;


    }
}

fire()
{
    origin_effect = getEntArray("fireblaster1", "targetname");
    hurta = getent("trig_hurt_fire1", "targetname");
    hurtb = getent("trig_hurt_fire2", "targetname");

    trig = getent("trig_fire", "targetname");

    hurta maps\mp\_utility::triggerOff();
	hurtb maps\mp\_utility::triggerOff();

    trig setHintString("^7Press ^3[&&1] ^7to activate ^3fireburner^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

    for(;;)
    {
    hurta maps\mp\_utility::triggerOn();
	hurtb maps\mp\_utility::triggerOn();

    thread fire_sound_1();
    thread fire_sound_2();
    thread fire_1();
    thread fire_2();
    thread fire_3();
    thread fire_4();
    thread fire_5();
    thread fire_6();
    thread fire_7();
    thread fire_8();
    thread fire_9();
    thread fire_10();
    thread fire_11();
    thread fire_12();
    thread fire_13();
    thread fire_14();
    thread fire_15();
    thread fire_16();
    thread fire_17();
    thread fire_18();
    thread fire_19();
    thread fire_20();
    thread fire_21();
    thread fire_22();
    thread fire_23();
    thread fire_24();
    thread fire_25();
    thread fire_26();
    thread fire_27();
    thread fire_28();
    thread fire_29();
    thread fire_30();
    thread fire_31();
    thread fire_32();
    thread fire_33();
    thread fire_34();
    thread fire_35();
    thread fire_36();
    thread fire_37();
    thread fire_38();
    thread fire_39();
    thread fire_40();
    thread fire_41();
    thread fire_42();
    thread fire_43();
    thread fire_44();
    thread fire_45();
    thread fire_46();
    thread fire_47();
    thread fire_48();
    thread fire_49();
    thread fire_50();
    thread fire_51();
    thread fire_52();
    thread fire_53();
    thread fire_54();
    thread hurt_fire();

    wait 12;
    }
}

fire_sound_1()
{
    trig_sound = getent ("fireblaster15","targetname");

    trig_sound playsound ("temple_burner_fire");
    wait 3;
    trig_sound playsound ("temple_burner_fire");
    wait 3;

}

fire_sound_2()
{
    trig_sound = getent ("fireblaster45","targetname");

    trig_sound playsound ("temple_burner_fire");
    wait 3;
    trig_sound playsound ("temple_burner_fire");
    wait 3;

}

fire_1()
{
    fire = getent ("fireblaster1","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_2()
{
    fire = getent ("fireblaster2","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_3()
{
    fire = getent ("fireblaster3","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_4()
{
    fire = getent ("fireblaster4","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_5()
{
    fire = getent ("fireblaster5","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_6()
{
    fire = getent ("fireblaster6","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_7()
{
    fire = getent ("fireblaster7","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_8()
{
    fire = getent ("fireblaster8","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_9()
{
    fire = getent ("fireblaster9","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_10()
{
    fire = getent ("fireblaster10","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_11()
{
    fire = getent ("fireblaster11","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_12()
{
    fire = getent ("fireblaster12","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_13()
{
    fire = getent ("fireblaster13","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_14()
{
    fire = getent ("fireblaster14","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_15()
{
    fire = getent ("fireblaster15","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_16()
{
    fire = getent ("fireblaster16","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_17()
{
    fire = getent ("fireblaster17","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_18()
{
    fire = getent ("fireblaster18","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_19()
{
    fire = getent ("fireblaster19","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_20()
{
    fire = getent ("fireblaster20","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_21()
{
    fire = getent ("fireblaster21","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_22()
{
    fire = getent ("fireblaster22","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_23()
{
    fire = getent ("fireblaster23","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_24()
{
    fire = getent ("fireblaster24","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_25()
{
    fire = getent ("fireblaster25","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_26()
{
    fire = getent ("fireblaster26","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_27()
{
    fire = getent ("fireblaster27","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_28()
{
    fire = getent ("fireblaster28","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_29()
{
    fire = getent ("fireblaster29","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_30()
{
    fire = getent ("fireblaster30","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_31()
{
    fire = getent ("fireblaster31","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_32()
{
    fire = getent ("fireblaster32","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_33()
{
    fire = getent ("fireblaster33","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_34()
{
    fire = getent ("fireblaster34","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_35()
{
    fire = getent ("fireblaster35","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_36()
{
    fire = getent ("fireblaster36","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_37()
{
    fire = getent ("fireblaster37","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_38()
{
    fire = getent ("fireblaster38","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_39()
{
    fire = getent ("fireblaster39","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_40()
{
    fire = getent ("fireblaster40","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_41()
{
    fire = getent ("fireblaster41","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_42()
{
    fire = getent ("fireblaster42","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_43()
{
    fire = getent ("fireblaster43","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_44()
{
    fire = getent ("fireblaster44","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_45()
{
    fire = getent ("fireblaster45","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_46()
{
    fire = getent ("fireblaster46","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_47()
{
    fire = getent ("fireblaster47","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_48()
{
    fire = getent ("fireblaster48","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_49()
{
    fire = getent ("fireblaster49","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_50()
{
    fire = getent ("fireblaster50","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_51()
{
    fire = getent ("fireblaster51","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_52()
{
    fire = getent ("fireblaster52","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_53()
{
    fire = getent ("fireblaster53","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_54()
{
    fire = getent ("fireblaster54","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fireblast, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

hurt_fire()
{
    hurta = getEnt("trig_hurt_fire1", "targetname");
    hurtb = getEnt("trig_hurt_fire2", "targetname");

    hurta maps\mp\_utility::triggerOff();
    hurtb maps\mp\_utility::triggerOff();

    for(;;)
    {
    hurta maps\mp\_utility::triggerOn();
    hurtb maps\mp\_utility::triggerOn();
    wait 6;
    hurta maps\mp\_utility::triggerOff();
    hurtb maps\mp\_utility::triggerOff();
    wait 6;


    }
}

fire_torch()
{
    origin_effect = getEntArray("temple_torch", "targetname");

    level waittill("round_started");

    PlayFX(level.fire_torch, origin_effect[0].origin);
    PlayFX(level.fire_torch, origin_effect[1].origin);
    PlayFX(level.fire_torch, origin_effect[2].origin);
    PlayFX(level.fire_torch, origin_effect[3].origin);
    PlayFX(level.fire_torch, origin_effect[4].origin);
    PlayFX(level.fire_torch, origin_effect[5].origin);
    PlayFX(level.fire_torch, origin_effect[6].origin);
    PlayFX(level.fire_torch, origin_effect[7].origin);
    PlayFX(level.fire_torch, origin_effect[8].origin);
    PlayFX(level.fire_torch, origin_effect[9].origin);

}

fire_torch_sound()
{
    sound = getentArray ("temple_torch","targetname");

    level waittill("round_started");

 {
    sound[0] playloopsound ("temple_fire_statue");
    sound[1] playloopsound ("temple_fire_statue");
    sound[2] playloopsound ("temple_fire_statue");
    sound[3] playloopsound ("temple_fire_statue");
    sound[4] playloopsound ("temple_fire_statue");
    sound[5] playloopsound ("temple_fire_statue");
    sound[6] playloopsound ("temple_fire_statue");
    sound[7] playloopsound ("temple_fire_statue");
    sound[8] playloopsound ("temple_fire_statue");
    sound[9] playloopsound ("temple_fire_statue");

 }

}

firefx()
{
    origin_effect1 = getEnt("fire_statue1", "targetname");
    origin_effect2 = getEnt("fire_statue2", "targetname");
    origin_effect3 = getEnt("fire_statue3", "targetname");
    origin_effect4 = getEnt("fire_statue4", "targetname");
    origin_effect5 = getEnt("fire_statue5", "targetname");
    origin_effect6 = getEnt("fire_statue6", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);
    PlayFX(level.fire, origin_effect5.origin);
    PlayFX(level.fire, origin_effect6.origin);

}

fire_statue_sound()
{
    sound1 = getent ("fire_statue1","targetname");
    sound2 = getent ("fire_statue2","targetname");
    sound3 = getent ("fire_statue3","targetname");
    sound4 = getent ("fire_statue4","targetname");
    sound5 = getent ("fire_statue5","targetname");
    sound6 = getent ("fire_statue6","targetname");

    level waittill("round_started");

 {
    sound1 playloopsound ("temple_fire_statue");
    sound2 playloopsound ("temple_fire_statue");
    sound3 playloopsound ("temple_fire_statue");
    sound4 playloopsound ("temple_fire_statue");
    sound5 playloopsound ("temple_fire_statue");
    sound6 playloopsound ("temple_fire_statue");
 }

}

knife_fire()
{
    origin_effect1 = getEnt("knife_fire1", "targetname");
    origin_effect2 = getEnt("knife_fire2", "targetname");
    origin_effect3 = getEnt("knife_fire3", "targetname");
    origin_effect4 = getEnt("knife_fire4", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);

}

knife_fire_sound()
{
    sound1 = getent ("knife_fire1","targetname");
    sound2 = getent ("knife_fire2","targetname");
    sound3 = getent ("knife_fire3","targetname");
    sound4 = getent ("knife_fire4","targetname");

    level waittill("round_started");

 {
    sound1 playloopsound ("temple_fire_statue");
    sound2 playloopsound ("temple_fire_statue");
    sound3 playloopsound ("temple_fire_statue");
    sound4 playloopsound ("temple_fire_statue");
 }

}

knife_vase()
{
   vase = getEnt("knife_vase", "targetname");

   level waittill("round_started");

   for(;;)
 {

    vase moveZ (-15,2);
    vase waittill ("movedone");
    wait 2;
    vase moveZ (15,2);
    vase waittill ("movedone");
    wait 2;

 }

}

fire_failroom()
{
    origin_effect0 = getEnt("fire_1_fail", "targetname");
    origin_effect1 = getEnt("fire_2_fail", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect0.origin);
    PlayFX(level.fire, origin_effect1.origin);

}

fire_fail_sound()
{
    sound1 = getent ("fire_1_fail","targetname");
    sound2 = getent ("fire_2_fail","targetname");

    level waittill("round_started");

 {
    sound1 playloopsound ("temple_fire_statue");
    sound2 playloopsound ("temple_fire_statue");

 }

}

board()
{
    origin_effect = getEntArray("orig_boardfx", "targetname");
    boarda = getEnt("board", "targetname");
    board = getEntArray("boardfx", "targetname");
    trig = getent("trig_board", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3crush ^7the ^3board^7!");

    board[0] hide();
    board[0] notsolid();
    board[1] hide();
    board[1] notsolid();
    board[2] hide();
    board[2] notsolid();
    board[3] hide();
    board[3] notsolid();

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

    PlayFX(level.board, origin_effect[0].origin);
    PlayFX(level.board, origin_effect[1].origin);
    PlayFX(level.board, origin_effect[2].origin);
    boarda delete();
    wait 0.2;
    board[0] show();
    board[0] solid();
    board[1] show();
    board[1] solid();
    board[2] show();
    board[2] solid();
    board[3] show();
    board[3] solid();

}

laser()
{
   trig = getent("trig_laser", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to activate ^3lasers^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

  thread laser1();
  thread laser2();
}

laser1()
{
   laser1 = getent("laser1", "targetname");
   hurta = getent("trig_hurt_laser1", "targetname");

   hurta enablelinkto();
   hurta linkto (laser1);

   for(;;)
  {
   laser1 moveZ (-160,0.5);
   laser1 waittill ("movedone");
   laser1 moveZ (160,0.5);
   laser1 waittill ("movedone");
   }
}

laser2()
{
   laser2 = getent("laser2", "targetname");
   hurtb = getent("trig_hurt_laser2", "targetname");

   hurtb enablelinkto();
   hurtb linkto (laser2);

   for(;;)
  {
   laser2 moveZ (-115,0.5);
   laser2 waittill ("movedone");
   laser2 moveZ (115,0.5);
   laser2 waittill ("movedone");
   }
}


rope()
{
	trig = getEnt ("trig_rope", "targetname");
    trig sethintstring("^7Press ^3[&&1] ^7to ^3move over^7!");

	for(;;)
	{
	 trig waittill ("trigger",user);

	 user thread ropeContent();
	}
}

ropeContent()
{
	self.start = (3328,-377,340);
	self.end = (3328,670,70);
    self.disableAntiEle = true;
{
	self.air = spawn ("script_model",(0,0,0));
	self.air.origin = self.origin;
	self.air.angles = self.angles;

	self linkTo (self.air);

	self.air moveTo(self.start, 1);
	wait 1.5;
	self.air moveTo(self.end, 2);
	wait 2;
	self unlink();

	self.air delete();
}
    self.disableAntiEle = undefined;
}

ball()
{
   trig = getent("trig_ball", "targetname");

    trig setHintString("^7Press ^3[&&1] ^7to ^3drop ^7the ^3balls^7!");

    trig waittill ("trigger",player);

    trig setHintString("^1Activated!");

  thread ballmoving1();
  thread ballmoving2();
}

ballmoving1()
{
	self.down1 = (3300,-612,127);
    self.forward1 = (3300,-815,127);
    self.downagain1 = (3300,-815,-120);

	self.ball1 = getEnt ("ball1", "targetname");
    self.hurt1 = getEnt ("trig_hurtball1", "targetname");

    self.hurt1 enablelinkto();
    self.hurt1 linkto (self.ball1);

    wait 0.5;
	self.ball1 moveTo(self.down1, 1);
    self.ball1 rotateRoll (720,2.5);
	wait 1;
	self.ball1 moveTo(self.forward1, 2);
    self.ball1 rotateRoll (720,1.75);
	wait 1.75;
    self.ball1 moveTo(self.downagain1, 3);
    self.ball1 rotateRoll (720,2.5);
    wait 2.5;

}

ballmoving2()
{
	self.down2 = (3360,-612,127);
    self.forward2 = (3360,-815,127);
    self.downagain2 = (3360,-815,-120);

	self.ball2 = getEnt ("ball2", "targetname");
    self.hurt2 = getEnt ("trig_hurtball2", "targetname");

    self.hurt2 enablelinkto();
    self.hurt2 linkto (self.ball2);

    wait 0.5;
	self.ball2 moveTo(self.down2, 1);
    self.ball2 rotateRoll (720,2.5);
	wait 1;
	self.ball2 moveTo(self.forward2, 2);
    self.ball2 rotateRoll (720,1.75);
	wait 1.75;
    self.ball2 moveTo(self.downagain2, 3);
    self.ball2 rotateRoll (720,2.5);
    wait 2.5;

}

end_wall()
{
   plat = getent("end_wall", "targetname");
   origin_effect = getEntArray("end_wall_fx", "targetname");

   trig = getent("trig_end_wall", "targetname");

   trig waittill ("trigger",player);

   iprintlnBOld ("^3" + player.name + " ^7exploded ^3wall^7!");
   player braxi\_rank::giveRankXP("", 500);

    PlayFX(level.break_door, origin_effect[0].origin);
    PlayFX(level.break_door, origin_effect[1].origin);
    PlayFX(level.break_door, origin_effect[2].origin);
    PlayFX(level.break_door, origin_effect[3].origin);

    player playlocalSound("wall_explode");

	plat notsolid();
    plat hide();

    trig delete();

}

///ROOMS
waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    sniper = getent("trig_sniper","targetname");
    run = getent("trig_run","targetname");
    maze = getent("trig_maze","targetname");
    spin = getent("trig_spin","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    run thread maps\mp\_utility::triggerOff();
    maze thread maps\mp\_utility::triggerOff();
    spin thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    level notify ("spin_finished");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    run thread maps\mp\_utility::triggerOn();
    maze thread maps\mp\_utility::triggerOn();
    spin thread maps\mp\_utility::triggerOn();
}

endTimer(text, duration, extra)
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
        self.endTimerHUD setText("^7" + duration);
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
level.room_trig = getEnt( "trig_end", "targetname");
room = getEnt( "origin_end", "targetname" );
level.room_trig setHintString ("^7Press ^3[&&1]^7 to enter ^3Room Selection^7!");

for(;;)
{
level.room_trig waittill( "trigger", player );
if( !isDefined( level.room_trig ) )
return;

acti = GetActivator();
if(level.firstenter == true)
{
	acti freezeControls(1);
	acti iPrintLnBold("^3Jumper ^7is picking a ^3room ^7so don't ^3move^7!");
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
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");

	iPrintln("^3"+self.name+" ^7died^3!");
	wait 0.2;
	iPrintlnBold("^3Room selection opened^7!");
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("knife_jumper", "targetname");
    actik = getEnt ("knife_acti", "targetname");

   for(;;)
    {
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player thread endTimer("^3Kill each other !", 3, 0);
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

knifehint()
{
    trig = getEnt("trig_knife_hint","targetname");
    trig setHintString ("^3Knife Room^7!");

    trig waittill("trigger", player);

}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniper", "targetname");

    jumpersc = getEnt ("sniper_jumper", "targetname");
    actisc = getEnt ("sniper_acti", "targetname");

    for(;;)
    {

        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
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

sniperfail()
{
trigger = getEnt ("sniper_fail", "targetname");
tele1 = getent ("orig_sniper_fail_1", "targetname");
tele2 = getent ("orig_sniper_fail_2", "targetname");


for(;;)
{

    trigger waittill ("trigger", player);

    randomspawn = randomint(2);

    if (randomspawn == 0 )
    {
        player setOrigin(tele1.origin);
        player setPlayerAngles(tele1.angles);
    }
    if (randomspawn == 1 )
    {
        player setOrigin(tele2.origin);
        player setPlayerAngles(tele2.angles);
    }

}

}

sniperhint()
{
    trig = getEnt("trig_sniper_hint","targetname");
    trig setHintString ("^3Sniper Room^7!");

    trig waittill("trigger", player);

}

runroom()
{
    level.trigger_run = getEnt ("trig_run", "targetname");

    jumpersc = getEnt ("run_jumper", "targetname");
    actisc = getEnt ("run_acti", "targetname");

    for(;;)
    {

        level.trigger_run waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Run Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
        // player setClientDvar( "g_speed", 170 );
        // activator setClientDvar( "g_speed", 170 );
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
        thread runend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

runend(who, who2)
{
	trig = getEnt ("trig_run_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
        winner freezeControls (1);
        // winner setClientDvar( "g_speed", 210 );
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^3You won^7!");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
        wait 0.1;

		if (winner == who)
			loser = who2;
		else
			loser = who;

		if (isDefined(loser))
		{
            // loser setClientDvar( "g_speed", 210 );
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
            loser iPrintLnBold("^3You lost ^7!");
		}
	}
}

run_jumper_fail()
{
   trig = getent("trig_run_fail1", "targetname");
   tele = getent ("run_jumper", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3You failed^7!");
    }
}

run_acti_fail()
{
   trig = getent("trig_run_fail2", "targetname");
   tele = getent ("run_acti", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3You failed^7!");
    }
}

run_jumper_stage()
{
   trig = getent("trig_run_jumper_stage", "targetname");
   tele = getent ("orig_run_jumper_stage", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Now strafe ^7to the ^3end^7!");
    }
}

run_acti_stage()
{
   trig = getent("trig_run_acti_stage", "targetname");
   tele = getent ("orig_run_acti_stage", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iprintlnBOld ("^3Now strafe ^7to the ^3end^7!");
    }
}

runhint()
{
    trig = getEnt("trig_run_hint","targetname");
    trig setHintString ("^3Run Room^7!");

    trig waittill("trigger", player);

}

spinroom()
{
   level.trigger_spin = getEnt ("trig_spin", "targetname");

    orig_jumper = getEnt ("spin_jumper", "targetname");
    orig_acti = getEnt ("spin_acti", "targetname");

    for(;;)
    {
        level.trigger_spin waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread spin_wait();
        thread fightHUD("Spin Room", player, activator);
        player SetClientDVAR("cg_thirdperson", 1);
        activator SetClientDVAR("cg_thirdperson", 1);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
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
	trig = getEnt ("trig_spin_fail", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");

	while(1)
	{
		trig waittill("trigger", loser);

        loser freezeControls (1);
        loser setOrigin (origLose.origin);
		loser setPlayerAngles (origLose.angles);
		loser takeAllWeapons();
        loser SetClientDVAR("cg_thirdperson", 0);
        loser iPrintLnBold("^3You lost ^7!");
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
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
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
    spinner = getEnt ("spin", "targetname");
    random_spinner = randomint(3);

    if (random_spinner == 0)
    {
        spinner rotateyaw(-360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    else
    {
        spinner rotateyaw(360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    if (level.spin_speed < 2)
    {
        level.spin_speed = 1.6;
    }

}

spinhint()
{
    trig = getEnt("trig_spin_hint","targetname");
    trig setHintString ("^3Spin Room^7!");

    trig waittill("trigger", player);

}

mazeroom()
{
   level.trigger_maze = getEnt ("trig_maze", "targetname");

    orig_jumper = getEnt ("maze_jumper", "targetname");
    orig_acti = getEnt ("maze_acti", "targetname");

    for(;;)
    {
        level.trigger_maze waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread fightHUD("Maze Room", player, activator);
        player thread endTimer("^3Kill each other !", 3, 0);
        activator thread endTimer("^3Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon ("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
		thread mazeend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

mazeend(who, who2)
{
	trig = getEnt ("trig_maze_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");

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
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
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
            loser iPrintLnBold("^3You lost ^7!");
		}
	}
}

mazehint()
{
    trig = getEnt("trig_maze_hint","targetname");
    trig setHintString ("^3Maze Room^7!");

    trig waittill("trigger", player);

}