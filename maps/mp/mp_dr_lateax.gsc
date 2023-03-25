/// Map by LateAX and CM'death ///

main()
{
maps\mp\_load::main();

/// Fx load ///
level.fire = LoadFx("fire/tv_fire2");
level.fire_trap7 = LoadFx("fire/tv_fire2");
level.explode_trap2 = LoadFx("breakables/temple_wall_explode");

game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

/// Dvars ///
setdvar("r_specularcolorscale", "1");
setdvar("r_glowbloomintensity0",".1");
setdvar("r_glowbloomintensity1",".1");
setdvar("r_glowskybleedintensity0",".1");
setDvar("bg_falldamagemaxheight", 99999); /* This removes fall damage */
setDvar("bg_falldamageminheight", 99998); /* This removes fall damage */


/// Trap triggers ///
addTriggerToList("trig_trap1");
addTriggerToList("trig_trap2");
addTriggerToList("trig_trap3");
addTriggerToList("trig_trap4");
addTriggerToList("trig_trap5");
addTriggerToList("trig_trap6");
addTriggerToList("trig_trap7");
addTriggerToList("trig_trap8");

///  Precache custom models,weapons,skins ///
precacheshader("mtl_domino_body");
precacheshader("mtl_domino_eyelashes");
precacheshader("mtl_domino_hair");
precacheshader("mtl_domino_head");
precacheModel("plr_terry_domino");

precacheshader("mtl_necris_body");
precacheModel("plr_terry_necris");

precacheItem("m40a3_mp");
precacheItem("remington700_mp");
precacheItem("knife_mp");
precacheItem("rpg_mp");

/// Fx scripts ///
thread fx_vase_start();
thread fx_vase_normal();
thread fx_vase_end();
thread fx_vase_finish();

/// Texts ///
thread messages();
thread welcome();

/// Startdoor opening ///
thread startdoor();

/// Moving platform ///
thread elevator();

/// Music ///
thread randommusic();

/// VIP stuff ///
thread vip_music();
thread vip_stuff();
thread mapper_stuff();

/// Activator teleport ///
thread actitp();

/// Rescues you if you fail ///
thread end_rescue();

/// Traps ///
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();

/// Ending rooms ///
thread sniper();
thread knife();
thread simonsaysroom();
thread purestraferoom();
thread rpgroom();
thread rpg_pad();
thread bounceroom();
thread bounce_weapon();
thread bounce_acti_fail();
thread bounce_jumper_fail();

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
    level.hud_fight setText("^6" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^6" + jumper + " ^5VS^5 " + "^6" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

}

/// Fx scripts ///
fx_vase_start()
{
    origin_effect1 = getEnt("fx_vase_start_1", "targetname");
    origin_effect2 = getEnt("fx_vase_start_2", "targetname");
    origin_effect3 = getEnt("fx_vase_start_3", "targetname");
    origin_effect4 = getEnt("fx_vase_start_4", "targetname");
    origin_effect5 = getEnt("fx_vase_start_5", "targetname");
    origin_effect6 = getEnt("fx_vase_start_6", "targetname");
    origin_effect7 = getEnt("fx_vase_start_7", "targetname");
    origin_effect8 = getEnt("fx_vase_start_8", "targetname");
    origin_effect9 = getEnt("fx_vase_start_9", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);
    PlayFX(level.fire, origin_effect5.origin);
    PlayFX(level.fire, origin_effect6.origin);
    PlayFX(level.fire, origin_effect7.origin);
    PlayFX(level.fire, origin_effect8.origin);
    PlayFX(level.fire, origin_effect9.origin);

}

fx_vase_normal()
{
    origin_effect1 = getEnt("fx_vase_1", "targetname");
    origin_effect2 = getEnt("fx_vase_2", "targetname");
    origin_effect3 = getEnt("fx_vase_3", "targetname");
    origin_effect4 = getEnt("fx_vase_4", "targetname");
    origin_effect5 = getEnt("fx_vase_5", "targetname");
    origin_effect6 = getEnt("fx_vase_6", "targetname");
    origin_effect7 = getEnt("fx_vase_7", "targetname");
    origin_effect8 = getEnt("fx_vase_8", "targetname");
    origin_effect9 = getEnt("fx_vase_9", "targetname");
    origin_effect10 = getEnt("fx_vase_10", "targetname");
    origin_effect11 = getEnt("fx_vase_11", "targetname");
    origin_effect12 = getEnt("fx_vase_12", "targetname");
    origin_effect13 = getEnt("fx_vase_13", "targetname");
    origin_effect14 = getEnt("fx_vase_14", "targetname");
    origin_effect15 = getEnt("fx_vase_15", "targetname");
    origin_effect16 = getEnt("fx_vase_16", "targetname");
    origin_effect17 = getEnt("fx_vase_17", "targetname");
    origin_effect18 = getEnt("fx_vase_18", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);
    PlayFX(level.fire, origin_effect5.origin);
    PlayFX(level.fire, origin_effect6.origin);
    PlayFX(level.fire, origin_effect7.origin);
    PlayFX(level.fire, origin_effect8.origin);
    PlayFX(level.fire, origin_effect9.origin);
    PlayFX(level.fire, origin_effect10.origin);
    PlayFX(level.fire, origin_effect11.origin);
    PlayFX(level.fire, origin_effect12.origin);
    PlayFX(level.fire, origin_effect13.origin);
    PlayFX(level.fire, origin_effect14.origin);
    PlayFX(level.fire, origin_effect15.origin);
    PlayFX(level.fire, origin_effect16.origin);
    PlayFX(level.fire, origin_effect17.origin);
    PlayFX(level.fire, origin_effect18.origin);


}

fx_vase_end()
{
    origin_effect1 = getEnt("fx_vase_end_1", "targetname");
    origin_effect2 = getEnt("fx_vase_end_2", "targetname");
    origin_effect3 = getEnt("fx_vase_end_3", "targetname");
    origin_effect4 = getEnt("fx_vase_end_4", "targetname");
    origin_effect5 = getEnt("fx_vase_end_5", "targetname");
    origin_effect6 = getEnt("fx_vase_end_6", "targetname");
    origin_effect7 = getEnt("fx_vase_end_7", "targetname");
    origin_effect8 = getEnt("fx_vase_end_8", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);
    PlayFX(level.fire, origin_effect5.origin);
    PlayFX(level.fire, origin_effect6.origin);
    PlayFX(level.fire, origin_effect7.origin);
    PlayFX(level.fire, origin_effect8.origin);

}

fx_vase_finish()
{
    origin_effect1 = getEnt("fx_fire1", "targetname");
    origin_effect2 = getEnt("fx_fire2", "targetname");
    origin_effect3 = getEnt("fx_fire3", "targetname");
    origin_effect4 = getEnt("fx_fire4", "targetname");
    origin_effect5 = getEnt("fx_fire5", "targetname");
    origin_effect6 = getEnt("fx_fire6", "targetname");

    level waittill("round_started");

    PlayFX(level.fire, origin_effect1.origin);
    PlayFX(level.fire, origin_effect2.origin);
    PlayFX(level.fire, origin_effect3.origin);
    PlayFX(level.fire, origin_effect4.origin);
    PlayFX(level.fire, origin_effect5.origin);
    PlayFX(level.fire, origin_effect6.origin);

}

/// Texts ///
messages()
{
   level waittill("round_started");
   for(;;)
{
   wait 8;
 x = randomintrange(0,3);

   if (x==0)
{
   iPrintln("^6Map by ^5CM'Death ^6and ^5LateAX^6!");
}

   if (x==1)
{
   iPrintln("^6Feel free ^5to report any ^6bugs^5!");
}

   if (x==2)
{
   iPrintln("^6Discord: ^5Death#7416; ^6Discord: ^5LateAX:5786");
}

   if (x==3)
{
//    iPrintLn("^6Map speed: ^5[^6"+getDvar("g_speed")+"^5]");
}

}

}

welcome()
{
    level waittill("round_started");
    noti = SpawnStruct();
    wait 2;
    noti.titleText = "^5Welcome ^6to ^5mp_dr_LateAX^6!";
    noti.notifyText = "^5Map By ^6LateAX ^5and ^6CM'Death^5!";
    noti.duration = 8;
    noti.glowcolor = (7,7,7);
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)
    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}


/// Stardoor opening ///
startdoor()
{
    level waittill("round_started");
    door = getent("startdoor","targetname");

{
    door moveZ(-1000, 10);
    door waittill("movedone");
    door delete();
}

}


/// Moving platform ///
elevator()
{
    trig = getEnt("trig_elevator", "targetname");
    ele = getEnt("elevator1", "targetname");

    trig waittill("trigger", player);
    wait 2;

    while(1)
    {
        ele moveX( -1465, 4);
        ele waittill("movedone");
        ele moveX( 1465, 2);
        ele waittill("movedone");
        wait 2;
    }
}


/// Music ///
randommusic()
{
    wait 2;
    randommusic = randomint(6);

    if (randommusic == 0 )
    {
        ambientStop(2);
        AmbientPlay("stillalive");
    }
    if (randommusic == 1)
    {
        ambientStop(2);
        AmbientPlay("rockstarog");
    }
    if (randommusic == 2)
    {
        ambientStop(2);
        AmbientPlay("dayafterday");
    }
    if (randommusic == 3)
    {
        ambientStop(2);
        AmbientPlay("justdance");
    }
    if (randommusic == 4)
    {
        ambientStop(2);
        AmbientPlay("timebomb");
    }
    if (randommusic == 5)
    {
        ambientStop(2);
        AmbientPlay("nogutsnoglory");
    }
}


/// Vip stuff ///
vip_music()
{
	trigger = getEnt ("trig_vip_music", "targetname");
	trigger setHintString ("^6VIP ^5Music^6!");

while(1)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death")) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "LateAX"  || gametag == "Lateax" ||  gametag == "ABPrice" || gametag == "Mist"  || gametag == "Ohh Rexy<3")

		{
		wait 0.1;
        player braxi\_rank::giveRankXP("", 1000);
        iPrintLnBold("^6VIP ^5is ^6here^5!");
        iPrintLn("^6VIP ^5just changed ^6song^5!");
        AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
        AmbientPlay("lootmachine");
        trigger delete();
	   }
		else
		{
			player iPrintLnBold("^6You ^5aren't ^6VIP^5!");
		}
	}
}

vip_stuff()
{
	trigger = getEnt ("trig_vip", "targetname");
	trigger setHintString ("^6VIP ^5Access^6!");

for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death")) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "LateAX" || gametag == "Lateax" ||  gametag == "ABPrice" || gametag == "Mist"  || gametag == "Ohh Rexy<3")

		{
		wait 0.5;
        player setmodel("plr_terry_domino");
	   }
		else
		{
			player iPrintLnBold("^6You ^5aren't ^6VIP^5!");
		}
	}
}

mapper_stuff()
{
	trigger = getEnt ("trig_mapper", "targetname");
	trigger setHintString ("^6Mapper ^5Access^6!");

for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
    gametag = player.name;

	if ( isSubStr( toLower(gametag), toLower("Death")) || gametag == "CM'Death" || gametag == "CM'death" || gametag == "Death" || gametag == "death" || gametag == "LateAX" || gametag == "Lateax")

		{
		wait 0.5;
        player setmodel("plr_terry_necris");
	   }
		else
		{
			player iPrintLnBold("^6You ^5aren't ^6Mapper^5!");
		}
	}
}

/// Activator teleport ///
actitp()
{
   trig = getent("acti_tp1", "targetname");
   tele = getent ("orig_actitp1", "targetname");

   for(;;)
    {
     trig setHintString ("^6Teleport to the next ^5Part^6!");
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player freezeControls(1);
     wait 0.1;
     player freezeControls(0);
    }
}

/// It rescues you if you fail ///
end_rescue()
{
   trig = getent("trig_end_rescue", "targetname");
   tele = getent ("orig_end_rescue", "targetname");

   for(;;)
    {
     trig waittill("trigger", player);
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player iPrintLnBold ("^6You ^5have been ^6rescued^5!");
     player freezeControls(1);
     wait 0.1;
     player freezeControls(0);
    }
}


/// Traps ///
trap1()
{
    trig = getEnt("trig_trap1", "targetname");

    plat1 = getEnt("trap1_1", "targetname");
    plat2 = getEnt("trap1_2", "targetname");
    plat3 = getEnt("trap1_3", "targetname");
    plat4 = getEnt("trap1_4", "targetname");
    plat5 = getEnt("trap1_5", "targetname");

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    while(1)
    {
        plat1 moveZ( -600, 2);
        plat5 moveZ( -600, 2);
        wait 1;
        plat2 moveZ( -600, 2);
        wait 1;
        plat3 moveZ( -600, 2);
        wait 1;
        plat4 moveZ( -600, 2);
        wait 5;
        plat1 moveZ( 600, 2);
        plat5 moveZ( 600, 2);
        wait 1;
        plat2 moveZ( 600, 2);
        wait 1;
        plat3 moveZ( 600, 2);
        wait 1;
        plat4 moveZ( 600, 2);
        wait 8;
    }
}

trap2()
{
    trig = getEnt("trig_trap2", "targetname");
    ele = getEnt ("trap2", "targetname");
    origin_effect1 = getEnt("trap2_fx_1", "targetname");
    origin_effect2 = getEnt("trap2_fx_2", "targetname");
    origin_effect3 = getEnt("trap2_fx_3", "targetname");

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    {
    PlayFX(level.explode_trap2, origin_effect1.origin);
    PlayFX(level.explode_trap2, origin_effect2.origin);
    PlayFX(level.explode_trap2, origin_effect3.origin);
    wait 0.1;
    ele hide();
    ele notsolid();
    }

}

trap3()
{
   hurta = getent("trap3_1_hurt", "targetname");
   hurtb = getent("trap3_2_hurt", "targetname");
   hurtc = getent("trap3_3_hurt", "targetname");
   hurtd = getent("trap3_4_hurt", "targetname");
   laser1 = getent("trap3_1_laser", "targetname");
   laser2 = getent("trap3_2_laser", "targetname");
   laser3 = getent("trap3_3_laser", "targetname");
   laser4 = getent("trap3_4_laser", "targetname");
   trig = getent("trig_trap3", "targetname");

    hurta maps\mp\_utility::triggerOff();
	hurtb maps\mp\_utility::triggerOff();
    hurtc maps\mp\_utility::triggerOff();
    hurtd maps\mp\_utility::triggerOff();

    laser1 hide();
    laser2 hide();
    laser3 hide();
    laser4 hide();

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

{
    hurta maps\mp\_utility::triggerOn();
	hurtb maps\mp\_utility::triggerOn();
    hurtc maps\mp\_utility::triggerOn();
	hurtd maps\mp\_utility::triggerOn();

    laser1 show();
    laser2 show();
    laser3 show();
    laser4 show();

    thread laser1();
    thread laser2();
    thread laser3();
    thread laser4();
}
}

laser1()
{
   laser = getent("trap3_1_laser", "targetname");
   block = getent("trap3_1", "targetname");
   hurta = getent("trap3_1_hurt", "targetname");

   hurta enablelinkto();
   hurta linkto (laser);

   hurta maps\mp\_utility::triggerOff();
   laser hide();

   for(;;)
  {
   hurta maps\mp\_utility::triggerOn();
   laser show();

   laser moveZ (-120,1.5);
   block moveZ (-120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   laser moveZ (120,1.5);
   block moveZ (120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   }
}

laser2()
{
   laser = getent("trap3_2_laser", "targetname");
   block = getent("trap3_2", "targetname");
   hurtb = getent("trap3_2_hurt", "targetname");

   hurtb enablelinkto();
   hurtb linkto (laser);

   hurtb maps\mp\_utility::triggerOff();
   laser hide();

   for(;;)
  {
   hurtb maps\mp\_utility::triggerOn();
   laser show();

   laser moveZ (120,1.5);
   block moveZ (120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   laser moveZ (-120,1.5);
   block moveZ (-120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   }
}

laser3()
{
   laser = getent("trap3_3_laser", "targetname");
   block = getent("trap3_3", "targetname");
   hurtc = getent("trap3_3_hurt", "targetname");

   hurtc enablelinkto();
   hurtc linkto (laser);

   hurtc maps\mp\_utility::triggerOff();
   laser hide();

   for(;;)
  {
   hurtc maps\mp\_utility::triggerOn();
   laser show();

   laser moveZ (-120,1.5);
   block moveZ (-120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   laser moveZ (120,1.5);
   block moveZ (120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   }
}

laser4()
{
   laser = getent("trap3_4_laser", "targetname");
   block = getent("trap3_4", "targetname");
   hurtd = getent("trap3_4_hurt", "targetname");

   hurtd enablelinkto();
   hurtd linkto (laser);

   hurtd maps\mp\_utility::triggerOff();
   laser hide();

   for(;;)
  {
   hurtd maps\mp\_utility::triggerOn();
   laser show();

   laser moveZ (120,1.5);
   block moveZ (120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   laser moveZ (-120,1.5);
   block moveZ (-120,1.5);
   laser rotatePitch (360,2);
   laser waittill ("movedone");
   }
}

trap4()
{
    trig = getEnt("trig_trap4", "targetname");
    plat1 = getEnt("trap4_1", "targetname");
    plat2 = getEnt("trap4_2", "targetname");

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    while(1)
    {
    plat1 moveY(70, 4);
    plat2 moveX(-70, 4);
    wait 4;
    plat1 delete();
    plat2 delete();
    }
}

trap5()
{
    trig = getEnt("trig_trap5", "targetname");
    spinner = getEnt("trap5_rotate", "targetname");

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    for(;;)
    {
        spinner rotateYaw(720, 3);
        wait 3;
        spinner rotateYaw(-720, 3);
        wait 3;
    }
}

trap6()
{
    trig = getEnt("trig_trap6", "targetname");

    pusher = getEnt("trap6_push", "targetname");
    pusher_hurt = getEnt("trap6_hurt", "targetname");

    pusher_hurt enablelinkto();
    pusher_hurt linkto (pusher);

    pusher_hurt maps\mp\_utility::triggerOff();

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    for(;;)
    {
        pusher_hurt maps\mp\_utility::triggerOn();
        pusher moveY(-576, 4);
        wait 6;
        pusher_hurt maps\mp\_utility::triggerOn();
        pusher moveY(576, 4);
        wait 6;
    }
}


trap7()
{
    hurta = getent("trap7_hurt_1", "targetname");
    hurtb = getent("trap7_hurt_2", "targetname");
    hurtc = getent("trap7_hurt_3", "targetname");
    hurtd = getent("trap7_hurt_4", "targetname");

    trig = getent("trig_trap7", "targetname");

    hurta maps\mp\_utility::triggerOff();
	hurtb maps\mp\_utility::triggerOff();
    hurtc maps\mp\_utility::triggerOff();
    hurtd maps\mp\_utility::triggerOff();

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");

    trig waittill("trigger", player);

    trig setHintString("^6Activated^5!");

    for(;;)
    {
    hurta maps\mp\_utility::triggerOn();
	hurtb maps\mp\_utility::triggerOn();
    hurtc maps\mp\_utility::triggerOn();
	hurtd maps\mp\_utility::triggerOn();

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
    thread fire_1_2();
    thread fire_2_2();
    thread fire_3_2();
    thread fire_4_2();
    thread fire_5_2();
    thread fire_6_2();
    thread fire_7_2();
    thread fire_8_2();
    thread fire_9_2();
    thread fire_10_2();
    thread fire_1_3();
    thread fire_2_3();
    thread fire_3_3();
    thread fire_4_3();
    thread fire_5_3();
    thread fire_6_3();
    thread fire_7_3();
    thread fire_8_3();
    thread fire_9_3();
    thread fire_10_3();
    thread fire_1_4();
    thread fire_2_4();
    thread fire_3_4();
    thread fire_4_4();
    thread fire_5_4();
    thread fire_6_4();
    thread fire_7_4();
    thread fire_8_4();
    thread fire_9_4();
    thread fire_10_4();
    thread hurt_fire();

    wait 12;
    }
}

fire_1()
{
    fire = getent ("trap7_fx_1_1","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_2()
{
    fire = getent ("trap7_fx_1_2","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_3()
{
    fire = getent ("trap7_fx_1_3","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_4()
{
    fire = getent ("trap7_fx_1_4","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_5()
{
    fire = getent ("trap7_fx_1_5","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_6()
{
    fire = getent ("trap7_fx_1_6","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_7()
{
    fire = getent ("trap7_fx_1_7","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_8()
{
    fire = getent ("trap7_fx_1_8","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_9()
{
    fire = getent ("trap7_fx_1_9","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_10()
{
    fire = getent ("trap7_fx_1_10","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_1_2()
{
    fire = getent ("trap7_fx_2_1","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_2_2()
{
    fire = getent ("trap7_fx_2_2","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_3_2()
{
    fire = getent ("trap7_fx_2_3","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_4_2()
{
    fire = getent ("trap7_fx_2_4","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_5_2()
{
    fire = getent ("trap7_fx_2_5","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_6_2()
{
    fire = getent ("trap7_fx_2_6","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_7_2()
{
    fire = getent ("trap7_fx_2_7","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_8_2()
{
    fire = getent ("trap7_fx_2_8","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_9_2()
{
    fire = getent ("trap7_fx_2_9","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_10_2()
{
    fire = getent ("trap7_fx_2_10","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_1_3()
{
    fire = getent ("trap7_fx_3_1","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_2_3()
{
    fire = getent ("trap7_fx_3_2","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_3_3()
{
    fire = getent ("trap7_fx_3_3","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_4_3()
{
    fire = getent ("trap7_fx_3_4","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_5_3()
{
    fire = getent ("trap7_fx_3_5","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_6_3()
{
    fire = getent ("trap7_fx_3_6","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_7_3()
{
    fire = getent ("trap7_fx_3_7","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_8_3()
{
    fire = getent ("trap7_fx_3_8","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_9_3()
{
    fire = getent ("trap7_fx_3_9","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_10_3()
{
    fire = getent ("trap7_fx_3_10","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_1_4()
{
    fire = getent ("trap7_fx_4_1","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_2_4()
{
    fire = getent ("trap7_fx_4_2","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_3_4()
{
    fire = getent ("trap7_fx_4_3","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_4_4()
{
    fire = getent ("trap7_fx_4_4","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_5_4()
{
    fire = getent ("trap7_fx_4_5","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_6_4()
{
    fire = getent ("trap7_fx_4_6","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_7_4()
{
    fire = getent ("trap7_fx_4_7","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_8_4()
{
    fire = getent ("trap7_fx_4_8","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_9_4()
{
    fire = getent ("trap7_fx_4_9","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

fire_10_4()
{
    fire = getent ("trap7_fx_4_10","targetname");
    fire.angles = (1, 0, 0);
    fx = spawnFX(level.fire_trap7, fire.origin,fire.angles);

    triggerFX(fx);
    wait 6;
    fx delete();
}

hurt_fire()
{
    hurta = getent("trap7_hurt_1", "targetname");
    hurtb = getent("trap7_hurt_2", "targetname");
    hurtc = getent("trap7_hurt_3", "targetname");
    hurtd = getent("trap7_hurt_4", "targetname");

    hurta maps\mp\_utility::triggerOff();
    hurtb maps\mp\_utility::triggerOff();
    hurtc maps\mp\_utility::triggerOff();
    hurtd maps\mp\_utility::triggerOff();

    for(;;)
    {
    hurta maps\mp\_utility::triggerOn();
    hurtb maps\mp\_utility::triggerOn();
    hurtc maps\mp\_utility::triggerOn();
    hurtd maps\mp\_utility::triggerOn();
    wait 6;
    hurta maps\mp\_utility::triggerOff();
    hurtb maps\mp\_utility::triggerOff();
    hurtc maps\mp\_utility::triggerOff();
    hurtd maps\mp\_utility::triggerOff();
    wait 6;


    }
}

trap8()
{
    trig = getEnt("trig_trap8", "targetname");
    spinners = getEnt("trap8", "targetname");

    trig setHintString("^5Press ^6&&1 ^5To Activate^6!");
    trig waittill("trigger", player);
    trig setHintString("^6Activated^5!");

    for(;;)
    {
        spinners rotateYaw(720, 10);
        spinners moveZ(-170,10);
        spinners waittill ("movedone");
        spinners rotateYaw(-720, 10);
        spinners moveZ(170,10);
        wait 15;
    }
}

/// Ending Rooms ///
waitdead() /* this script fixes respect order queue */
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    sniper = getent("trig_sniper","targetname");
    pure = getent("trig_pure","targetname");
    simon = getent("trig_ss","targetname");
    rpg = getent("trig_rpg","targetname");
    bounce = getent("trig_bounce","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    pure thread maps\mp\_utility::triggerOff();
    simon thread maps\mp\_utility::triggerOff();
    rpg thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    pure thread maps\mp\_utility::triggerOn();
    simon thread maps\mp\_utility::triggerOn();
    rpg thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
}

end_countdown(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.end_countdownHUD)) self.end_countdownHUD destroy();
    self.end_countdownHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.end_countdownHUD setText("^5" + duration);
        self.end_countdownHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.end_countdownHUD setText(text);
    self.end_countdownHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.end_countdownHUD)) self.end_countdownHUD destroy();
}

sniper()
{
    level.trigger_scope = getEnt ("trig_sniper", "targetname");

    jumpersc = getEnt ("orig_sniper_jumper", "targetname");
    actisc = getEnt ("orig_sniper_acti", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^6Press ^5[&&1]^6 to enter ^5Sniper Room^6!");
        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("Sniper Room", player, activator);
        player thread end_countdown("^6Kill each other !", 3, 0);
        activator thread end_countdown("^6Kill each other !", 3, 0);
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

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Sniper Room^5!");

    }
}

knife()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("orig_knife_jumper", "targetname");
    actik = getEnt ("orig_knife_acti", "targetname");

   for(;;)
    {
        level.trigger_knife setHintString ("^6Press ^5[&&1]^6 to enter ^5Knife Room^6!");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Knife Room", player, activator);
        activator thread end_countdown("^6Kill each other !", 3, 0);
        player thread end_countdown("^6Kill each other !", 3, 0);
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

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Knife Room^5!");
    }
}

simonsaysroom()
{
    level.race = getent("trig_ss", "targetname");
	level.race_acti_tp = getent("orig_ss_acti","targetname");
	level.race_jumper_tp = getent("orig_ss_jumper","targetname");

    one = getent("ss_ss_one", "targetname");
	two = getent("ss_ss_two", "targetname");
	tree = getent("ss_ss_three", "targetname");
	four = getent("ss_ss_four", "targetname");
	five = getent("ss_ss_five", "targetname");
	six = getent("ss_ss_six", "targetname");
	seven = getent("ss_ss_seven", "targetname");
	eight = getent("ss_ss_eight", "targetname");
	nine = getent("ss_ss_nine", "targetname");

    one hide();
	two hide();
	tree hide();
	four hide();
	five hide();
	six hide();
	seven hide();
	eight hide();
	nine hide();

	while(1)
    {
    	level.race setHintString ("^6Press ^5[&&1]^6 to enter ^5SimonSays Room^6!");
        level.race waittill( "trigger", player );

    if(isDefined(level.actiBusy) && level.actiBusy == 1)
			player iprintlnbold("^6Activator is ^5busy^6, wait a few ^5seconds^6!");
		else
		{
        if(!isDefined(level.race))
            return;

        if(!isdefined(level.activKills))
			level.playername = player.name;

		//player
		player freezeControls(1);
        player setOrigin(level.race_jumper_tp.origin);
		player setPlayerangles(level.race_jumper_tp.angles);
		player TakeAllWeapons();
		player SetClientDVAR("cg_thirdperson", 1);
        player thread end_countdown("^6Kill each other !", 3, 0);

		//acti
		if (isDefined(level.activ) && isAlive(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.race_acti_tp.origin );
			level.activ setPlayerangles( level.race_acti_tp.angles );
			level.activ TakeAllWeapons();
			level.activ SetClientDVAR("cg_thirdperson", 1);
			level.activ thread end_countdown("^6Kill each other !", 3, 0);
		}
        thread fightHUD("Simon Says Room", player, level.activ);

		wait 3;
		thread ss_game(player);
		thread ss_check(player);
		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Simon Says Room^5!");
		}
    }
}

ss_check(player)
{
	trig = getent("trig_ss_fail", "targetname");
	level.winner = getent("orig_winner", "targetname");
	level.loser = getent("orig_looser", "targetname");
	trig waittill("trigger", loser);
	level.wall hide();
	level.ss_on = 0;

	if (isDefined(level.activ) && loser == level.activ) //jumper wins
	{
		loser freezeControls(1);
		loser setOrigin( level.loser.origin );
		loser setPlayerAngles( level.loser.angles );
		loser iPrintLnBold("^1You have lost!");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");

		player freezeControls(1);
		player setOrigin(level.winner.origin);
		player setPlayerAngles(level.winner.angles);
		player iPrintLnBold("^4You won!");
		player SetClientDVAR("cg_thirdperson", 0);
		wait 4;
		player freezeControls(0);

		player giveWeapon("knife_mp");
		player giveMaxAmmo("knife_mp");
		player switchToWeapon("knife_mp");
	}
	else //activator wins
	{
		loser freezeControls(1);
		loser setOrigin(level.loser.origin);
		loser setPlayerAngles(level.loser.angles);
		loser iPrintLnBold("^1You have lost!");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");

		if (isDefined(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
			level.activ iPrintLnBold("^4You won!");
			level.activ SetClientDVAR("cg_thirdperson", 0);
			wait 4;
			level.activ freezeControls(0);

			level.activ giveWeapon("knife_mp");
			level.activ giveMaxAmmo("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		else
			player iPrintLnBold("^1No activator ?!");
	}
}


ss_game(player)
{
    one = getent("ss_one", "targetname");
	two = getent("ss_two", "targetname");
	three = getent("ss_three", "targetname");
	four = getent("ss_four", "targetname");
	five = getent("ss_five", "targetname");
	six = getent("ss_six", "targetname");
	seven = getent("ss_seven", "targetname");
	eight = getent("ss_eight", "targetname");
	nine = getent("ss_nine", "targetname");

    ss_one = getent("ss_ss_one", "targetname");
	ss_two = getent("ss_ss_two", "targetname");
	ss_three = getent("ss_ss_three", "targetname");
	ss_four = getent("ss_ss_four", "targetname");
	ss_five = getent("ss_ss_five", "targetname");
	ss_six = getent("ss_ss_six", "targetname");
	ss_seven = getent("ss_ss_seven", "targetname");
	ss_eight = getent("ss_ss_eight", "targetname");
	ss_nine = getent("ss_ss_nine", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1)
	{
	    ss_one hide();
		ss_two hide();
		ss_three hide();
		ss_four hide();
		ss_five hide();
		ss_six hide();
		ss_seven hide();
		ss_eight hide();
		ss_nine hide();

		colour = randomint(9);
		if (colour == 0)
		{
			hide = one;
			level.wall = one;
		    ss_one show();
		}
		if (colour == 1)
		{
			hide = two;
			ss_two show();
			level.wall = two;
		}
		if (colour == 2)
		{
			hide = three;
			ss_three show();
			level.wall = three;
		}
		if (colour == 3)
		{
			hide = four;
			ss_four show();
			level.wall = four;
		}
		if (colour == 4)
		{
			hide = six;
			ss_six show();
			level.wall = six;
		}
		if (colour == 5)
		{
			hide = seven;
			ss_seven show();
			level.wall = seven;
		}
		if (colour == 6)
		{
			hide = five;
			ss_five show();
			level.wall = five;
		}
		if (colour == 7)
		{
			hide = eight;
			ss_eight show();
			level.wall = eight;
		}
		if (colour == 8)
		{
			hide = nine;
			ss_nine show();
			level.wall = nine;
		}

		wait(length);

        one hide();
		two hide();
		three hide();
		four hide();
		five hide();
		six hide();
		seven hide();
		eight hide();
		nine hide();

		one notsolid();
		two notsolid();
		three notsolid();
		four notsolid();
		five notsolid();
		six notsolid();
		seven notsolid();
		eight notsolid();
		nine notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

        one show();
		two show();
		three show();
		four show();
		five show();
		six show();
		seven show();
		eight show();
		nine show();

		one solid();
		two solid();
		three solid();
		four solid();
		five solid();
		six solid();
		seven solid();
		eight solid();
		nine solid();

		time += 1;
		length -= 0.25;


        if(time == 14 && isAlive(player))
		{
			player iprintlnbold("^6You finished ^5SimonSays Room ^6, now kill the ^5Activator^6!");
            player setOrigin(level.loser.origin);
            player setPlayerAngles(level.loser.angles);
            player SetClientDVAR("cg_thirdperson", 0);
			level.activ iprintlnbold("^6You finished ^5SimonSays Room ^6, now kill the ^5Jumper^6.");
            level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
            level.activ SetClientDVAR("cg_thirdperson", 0);
			player giveWeapon("knife_mp");
			level.activ giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}

purestraferoom()
{
    level.trigger_pure = getEnt ("trig_pure", "targetname");

    orig_jumper = getEnt ("orig_pure_jumper", "targetname");
    orig_acti = getEnt ("orig_pure_acti", "targetname");

    for(;;)
    {
	    level.trigger_pure setHintString ("^6Press ^5[&&1]^6 to enter ^5PureStrafe Room");
        level.trigger_pure waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread fightHUD("PureStrafe Room", player, activator);
        player thread end_countdown("^6Kill each other !", 3, 0);
        activator thread end_countdown("^6Kill each other !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("beretta_mp");
        activator giveWeapon("beretta_mp");
        player switchToWeapon ("beretta_mp");
        activator switchToWeapon("beretta_mp");
        player.maxhealth = 100;
		thread pureend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait 0.05;

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6PureStrafe Room!");
    }
}

pureend(who, who2)
{
	trig = getEnt ("trig_pure_finish", "targetname");
	origWin = getEnt ("orig_winner", "targetname");
	origLose = getEnt ("orig_looser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");

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
		}
	}
}

rpgroom()
{
    level.trigger_rpg = getEnt ("trig_rpg", "targetname");

    jumperr = getEnt ("orig_rpg_jumper", "targetname");
    actir = getEnt ("orig_rpg_acti", "targetname");

    for(;;)
    {
        level.trigger_rpg setHintString ("^6Press ^5[&&1]^6 to enter ^5RPG Room^6!");
        level.trigger_rpg waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        thread fightHUD("RPG Room", player, activator);
        player thread end_countdown("^6Kill each other !", 3, 0);
        activator thread end_countdown("^6Kill each other !", 3, 0);
        player setOrigin (jumperr.origin);
        player setPlayerAngles (jumperr.angles);
        activator setOrigin (actir.origin);
        activator setPlayerAngles (actir.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("rpg_mp");
        activator giveWeapon("rpg_mp");
        player giveMaxAmmo("rpg_mp");
        activator giveMaxAmmo("rpg_mp");
        player switchToWeapon("rpg_mp");
        activator switchToWeapon("rpg_mp");
        player.maxhealth = 100;
        player thread rpg_ammo();
        activator thread rpg_ammo();


        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6RPG Room^5!");

    }
}

rpg_ammo()
{
	self endon("disconnect");
	self endon("death");

	for (;;)
	{
		if (self getCurrentWeapon() == "rpg_mp")
			self giveMaxAmmo("rpg_mp");

		wait 5;
	}
}

rpg_pad()
{
	trig = getent("trig_rpg_pad", "targetname");

	while(1)
	{
    	trig waittill ( "trigger", player );

	    player thread pad();
	}
}

pad()
{
    for(i = 0; i < 4; i++)
	{
	    self.health += 250;
        self finishPlayerDamage(self, level.jumpattacker, 250, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}

bounceroom()
{
    level.trigger_jump = getEnt ("trig_bounce", "targetname");

    jumperb = getEnt ("orig_bounce_jumper", "targetname");
    actib = getEnt ("orig_bounce_acti", "targetname");

    for(;;)
    {
        level.trigger_jump setHintString ("^6Press ^5[&&1]^6 to enter ^5Bounce Room^6!");
        level.trigger_jump waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        thread fightHUD("Bounce Room", player, activator);
        activator thread end_countdown("^6Kill each other !", 3, 0);
        player thread end_countdown("^6Kill each other !", 3, 0);
		player setOrigin (jumperb.origin);
        player setPlayerAngles (jumperb.angles);
        activator setOrigin (actib.origin);
        activator setPlayerAngles (actib.angles);
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

        iPrintLnBold ("^6" + player.name + " ^5has died in ^6Bounce Room^5!");
    }
}

bounce_weapon()
{
    trig = getEnt ("trig_bounce_sniper", "targetname");
    trig setHintString ("^6Press ^5[&&1]^6 to get ^5Snipers^6!");
    while (1)
    {
        trig waittill ("trigger", player);
        player takeAllWeapons();
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
		player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player switchToWeapon("m40a3_mp");
    }
}

bounce_acti_fail()
{
   trig = getent("trig_bounce_acti_fail", "targetname");
   tele = getent ("orig_bounce_acti", "targetname");

   for(;;)
    {
	  trig waittill("trigger", player);
	  player setOrigin(tele.origin);
	  player setPlayerAngles (tele.angles);
    }
}

bounce_jumper_fail()
{
   trig = getent("trig_bounce_jumper_fail", "targetname");
   tele = getent ("orig_bounce_jumper", "targetname");

   for(;;)
    {
      trig waittill("trigger", player);
	  player setOrigin(tele.origin);
	  player setPlayerAngles (tele.angles);
    }
}