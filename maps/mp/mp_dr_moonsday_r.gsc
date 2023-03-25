#include braxi\_common;
#include braxi\_rank;
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
	setDvar( "r_specularcolorscale", "1" );
	setDvar("r_glowbloomintensity0",".1");
	setDvar("r_glowbloomintensity1",".1");
	setDvar("r_glowskybleedintensity0",".1");
	// setDvar("g_speed","190");
	setDvar("r_glow","0");
	setDvar("bg_fallDamageMinHeight","100000000");
	precacheItem( "raygun_mp" );
	precacheItem( "darketta_mp" );
	precacheItem( "g3_acog_mp" );
	precacheItem( "rpd_reflex_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "m40a3_mp" );
	precacheItem( "remington700_mp" );
	precacheItem( "moonsday_huntsman_mp" );
	precacheShader( "explo" );
	precacheShader( "loadscreen_mp_dr_moonsday" );

	level.dvar["bunnyhoop"] = false;
	setdvar( "bunnyhoop", "dr_bunnyhoop_pro", 0, 0, 0);
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.burn = LoadFx("props/barrel_fire");
	level.weed = LoadFx("deathrun/weed");
	level.cessi = LoadFx("deathrun/cessi");
	level.urto = LoadFx("distortion/distortion_tank_muzzleflash");
	level.italy = LoadFx("deathrun/italy");
	level.portale = LoadFx("deathrun/portal");
	level.wingstrail = LoadFx("deathrun/wingstrail");
	//level.rainbow = LoadFx("deathrun/rainbow");
	level.step4 = false;
	level.step5 = false;
	level.step6 = false;
	level.entered = false;
	level.firstnab = false;
	level.music=[];
    level.music[0]["song"]    ="Knife Party - 404";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="Knife Party - Power Glove";
    level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="Twenty One Pilots - Heathens";
    level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Labrinth - Earthquake";
    level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="Skrillex - Ease My Mind";
    level.music[4]["alias"]    ="song5";

	thread games();
	thread messages();
	thread startdoor();
	thread vaisustart();
	thread credits();
	thread sc();
	thread trap1();
	thread imr();
	thread iml();
	thread tpi();
	thread tpe();
	thread trace1();
	thread trace2();
	thread avante();
	thread tpsecret();
	//thread sniper();
	//thread addTestClients();
	thread trap2();
	thread knife();					//replaced
	thread sopra();
	thread musicbox();
	thread nomusic();
	thread kc();
	thread check1();
	thread check2();
	thread check3();
	thread alieni();
	thread nonono();
	thread volevi();
	thread ef();
	thread end_trig();
	thread ende();
	thread endi();
	thread sniperc();
	thread trap4();
	thread potato();
	thread step2();
	thread secert();
	thread meteor();
	thread ghiaccio();
	thread send();
	thread killcesso();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread ateleporte();
	thread actie1();
	thread deagle();
	thread bounceroom();
	thread bounce3();
	thread bounce4();
	thread sniper5();
	thread sniper6();
	thread itrap1();
	thread itrap2();
	thread itrap3();
	thread itrap4();
	thread ateleporti();
	thread secert3();
	thread alieni2();
	//thread stepperino();
	thread prendicesso();
	thread maris();
	thread trailzor();
	thread esciactisecret();
	//thread suggest();
	thread actisecret();
	thread actisecret2();
	thread raygun();
	thread hardport();
	thread cessozone();
	thread hardshit();
	thread hardshit2();
	thread hardmove1();
	thread grata();
	thread cessohard();
	thread bweapon();
	thread ateleporte2();
	thread actieb();
	thread actiib();
	thread actiistart();
	thread hardmove2();
	//thread slowmotest();
	thread hlasers();
	thread hlasers2();
	//thread slaser();
	thread rightphard();
	thread leftphard();
	thread hardeplatform();
	thread portalecheck();
	thread hardfinalj();
	thread rpg();					 //replaced
	thread darkm9();
	thread cessozonetrail();
	//thread gosu();
	thread movingperk();
	thread actiestart();
	//thread xeniark2();
	thread shinymetal();
	thread umbreonhere();
	//thread moo();
	thread hsaver();
	thread main210();
	thread b210();
	thread c210();
	thread d210();
	thread e210();
	thread f210();
	thread g210();
	thread h210();
	thread rpg_gosul();
	thread rpg_gosur();
	thread meteori();
	thread soprai();
	thread spini();
	thread room_simonsays();
	thread party();
	thread lasersound();
	addTriggerToList( "trig_trap1" );
    addTriggerToList( "trig_trap2" );
    addTriggerToList( "trig_trap3" );
    addTriggerToList( "trig_trapzoz" );
    addTriggerToList( "trig_trap5" );
    addTriggerToList( "trig_trap6" );
    addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	 addTriggerToList( "trig_trap9" );
	 addTriggerToList( "trig_itrap1" );
	  addTriggerToList( "trig_itrap2" );
	addTriggerToList( "trig_itrap3" );
	addTriggerToList( "trig_itrap4" );
	 addTriggerToList( "esciactisecret" );


	}

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

games()
{
level.games_trig = getEnt( "trig_endselector", "targetname");
games = getEnt( "o_endselector", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if( !isDefined( level.games_trig ) )
return;

iPrintlnBold( " ^5" + player.name + " is picking a room" );
	player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
player TakeAllWeapons();
player antiglitcher();
level.entered = true;
}
}

createhud(messages)
{
hud_start = NewHudElem();
hud_start.alignX = "center";
hud_start.alignY = "middle";
hud_start.horzalign = "center";
hud_start.vertalign = "middle";
hud_start.alpha = 1;
hud_start.x = 0;
hud_start.y = -150;
hud_start.font = "objective";
hud_start.fontscale = 2;
hud_start.glowalpha = 1;
hud_start.glowcolor = (1,0,0);
hud_start setText(messages);
hud_start SetPulseFX( 100, 4000, 500 );
wait 3.5;
if(isdefined(hud_start))
	hud_start destroy();
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

antiglitcher()
{
self common_scripts\utility::waittill_any("death","disconnect");
self freezeControls(0);
level.activKills++;
thread killstreak();
self.hasGun = 0;
iPrintlnBold("^5"+self.name+" ^1died");
wait 0.2;
iPrintlnBold("^5Room selection open!");
}

killstreak()
{
	activator = GetActivator();
	if(isdefined(level.activKills))
			level.streak setText("^1Activator's killstreak: ^2"+level.activKills);

		if(level.activKills == 1)
		{
		level.streak = newHudElem();
		level.streak.foreground = true;
		level.streak.alignX = "left";
		level.streak.alignY = "middle";
		level.streak.horzAlign = "left";
		level.streak.vertAlign = "middle";
		level.streak.x = 4;
		level.streak.y = 8;
		level.streak.sort = 0;
		level.streak.fontScale = 1.8;
		level.streak.glowColor = (0,.4,1);
		level.streak.glowAlpha = 1;
		level.streak.hidewheninmenu = true;
		level.streak setText("^1Activator's killstreak: ^2"+level.activKills);
		level waittill("round_ended");
		if (isDefined(level.streak))
			{
				level.streak destroy();
			}
		}

		if(level.activKills == 3)
		{
			activator iprintLnBold("^1You got a ^2Life!");
			activator braxi\_mod::giveLife();
		}


		if(level.activKills == 5)
		{
			activator iprintLnBold("^2You got another ^2Life!");
			activator braxi\_mod::giveLife();
		}
}

waitdead()
{
weapons = getent("deagle_trig","targetname");
bounce = getent("bounce_trig","targetname");
sniper = getent("sniperc_trig","targetname");
knife = getent("knife_trig","targetname");
gap = getent("rpg_trig","targetname");
simon = getent("raygun_trig","targetname");
simon2 = getent("trig_simon","targetname");
weapons thread maps\mp\_utility::triggerOff();
bounce thread maps\mp\_utility::triggerOff();
sniper thread maps\mp\_utility::triggerOff();
knife thread maps\mp\_utility::triggerOff();
gap thread maps\mp\_utility::triggerOff();
simon thread maps\mp\_utility::triggerOff();
simon2 thread maps\mp\_utility::triggerOff();
self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);
self freezeControls(false);
activator.hasGun = 0;
activator.health = activator.maxhealth;
weapons thread maps\mp\_utility::triggerOn();
bounce thread maps\mp\_utility::triggerOn();
sniper thread maps\mp\_utility::triggerOn();
knife thread maps\mp\_utility::triggerOn();
gap thread maps\mp\_utility::triggerOn();
simon thread maps\mp\_utility::triggerOn();
simon2 thread maps\mp\_utility::triggerOn();
}

musicbox()
{
    level.cambiato = false;
    trig = getEnt("musictrigger","targetname");
    trig setHintString("^5Press ^3&&1^7 to select song");
	if (level.cambiato == true)
	{
	return;
	}
	else
	{
    trig waittill("trigger",p);
	p braxi\_rank::giveRankXP("", 150);
	if(isDefined(trig))trig delete();

    p freezeControls(1);
    p musicmenu();
}
}

musicmenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );
	self endon("music_changed");

    self.hud_music = [];
    self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "explo", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(0,.5,.8);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Moonsday Music Menu");
    self.hud_music[i].glowalpha = 1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else
        self.hud_music[i].glowcolor=(0,.5,.8);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^5[{+attack}] ^7| Select: ^5[{+activate}] ^7| Close: ^5[{+frag}]");

    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        if(isdefined(level.randomcolor))
            self.hud_music[i].glowcolor=level.randomcolor;
        else
            self.hud_music[i].glowcolor=(0,.5,.8);

        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );
    indicator.color=(0,.5,.8);

    while(self.sessionstate == "playing")
    {
        wait 0.1;

        if(self attackButtonPressed())
        {
            self.hud_music[4+self.selection].alpha = 0.93;

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[4+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if(self useButtonPressed())
        {
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<");
			 	level.cambiato = true;

            ambientPlay(level.music[self.selection]["alias"]);
            self freezeControls(0);
            break;
        }
        else if(self fragButtonPressed())
        {
            self freezeControls(0);
           break;
        }
    }

    if(!isdefined(self))
        return;
    if(isdefined(self.hud_music))
    {
        for(i=0;i<self.hud_music.size;i++)
        {
            if(isdefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

/*startmusic()
{
trig = getEnt ("song_activate", "targetname");
trig2 = getEnt ("song_activate2", "targetname");
trig3 = getEnt ("song_activate3", "targetname");
trig4 = getEnt ("song_activate4", "targetname");
trig5 = getEnt ("song_activate5", "targetname");
wait 15;
if(isDefined(trig) && isDefined(trig2) && isDefined(trig3) && isDefined(trig4) && isDefined(trig5) )
{
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("master");
		iPrintLn ("^0>>^1Now playing: ^2BrunuhVille - The Wolf And The Moon^0<<");
}
}
*/

trace1()
{
    level waittill("round_started");
	// wait 10;
	// if (level.step4 == false || level.step5 == false || level.step6 == false)
	// {
	// 	exitLevel(true);
	// }
}

nomusic()
{
trig = getEnt("musictrigger","targetname");
wait 20;
if(level.cambiato == false)
{
		trig delete();
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("master");
		iPrintLn ("^0>>^1Now playing: ^2BrunuhVille - The Wolf And The Moon^0<<");
}
}

messages()
{
wait 10;
iprintlnBold("^5Welcome to Moonsday ^1REMASTERED^5!");

x=randomint(9);
if (x==0)
{
iPrintln("^1Song changing room is near the spawn, it shouldn't be that hard finding it tho!");
}

if (x==1)
{
iPrintln("^1If activator is AFK in Knife Room, just climb the boxes!");
}

if (x==2)
{
iPrintln("^5Gravity Gun ^3using is not allowed in this map!");
}

if (x==3)
{
iPrintln("^1After a ^5Deagle ^1fight your ^2health ^1will be restored!");
}

if (x==4)
{
iPrintln("^5In ^3RPG ^1Room ^5you will have infinite ammo!");
}

if (x==5)
{
iPrintln("^3Much thanks to ^2Kris ^3for suggesting me to ^1NOT^3 remove toilets ^1>:)");
}

if (x==6)
{
iPrintln("^5Shoot the ^8Xenia ^5sign to join ^1Amnesia's Deathrun!");
}

if (x==7)
{
iPrintln("^5Tip for ^1Hard Way ^5slide: don't run and switch to ^2250 ^5after you bounced :)");
}

if (x==8)
{
iPrintln("^1WB ^5CAR ^2:D");
}

}

startdoor()
{
sd = getent("startdoor","targetname");
fuocoo = getEnt ("fuocoo", "targetname");
wait 20;
sd moveZ(256, 4);
iprintlnbold("^8Start door opened.");
wait 5;
sd delete();
wait 2;
        for(;;)
		{
		PlayFX(level.burn, fuocoo.origin);
		wait 0.1;
		}
}

vaisustart()
{
h = getent("vaisustart","targetname");
  for (;;)
  {
h moveZ(200, 2);
wait 2;
h moveZ(-200, 2);
wait 2;
  }
}

credits()
{
	trig = getEnt("trigger_credits", "targetname");
	kek = getEnt ("blocco_step1", "targetname");
	trig SetHintString ("Press ^1F ^7for credits");
	trig waittill ("trigger", player);
	iPrintln("^5STEP ^71^1/^73 ^5COMPLETED");
	trig delete();
	kek delete();
	wait 2;
	iPrintln("Map made by ^0Dark^5STEP"); //scritta piccola angolo destro
	wait 3;
	iPrintln("Thanks to ^2Kris ^7for helping me improving map!");
	wait 3;
	iPrintln("^3Special thanks to ^5CAR ^3Members and to the whole ^1Xenia Gaming ^3community! ^3:)");
	wait 3;

}

sc()
{
	st = getEnt("shortcut", "targetname");
	t_st = getEnt("trig_shortcut", "targetname");
	t_st waittill ("trigger", player);
	iprintlnBold(player.name, " ^3found ^5a ^2shortcut^1!");
	wait 1.5;
	st moveZ (648, 1.5);
	wait 1;
	t_st delete();
}

trap1()
{
	b = getEnt("trap1", "targetname");
	tg = getEnt("trig_trap1", "targetname");
	tg SetHintString("^1Press ^2F ^1to remove part of bounce");
	tg waittill("trigger", player);
	b delete();
	tg delete();
}


imr()
{
plat = getent("imrr","targetname");
  for (;;)
  {
plat moveY(320, 2);
wait 1;
plat moveX(-384, 2);
wait 1;
plat moveY(-320, 2);
wait 1;
plat moveX(384, 2);
wait 1;
  }
}

iml()
{
plat = getent("imll","targetname");
  for (;;)
  {
plat moveY(-320, 2);
wait 1;
plat moveX(384, 2);
wait 1;
plat moveY(320, 2);
wait 1;
plat moveX(-384, 2);
wait 1;

  }
}

tpi()
{
	trig = getEnt("trigger_teleporti", "targetname");
	arrivo = getEnt("origin_teleporti", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpe()
{
	trig = getEnt("trigger_teleporte", "targetname");
	arrivo = getEnt("origin_teleporte", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

avante()
{
plat = getEnt("avante","targetname");
  for (;;)
  {
plat moveY(320, 3);
wait 3;
plat moveY(-320, 3);
wait 3;
  }
}

tpsecret()
{
	trig = getEnt("trigger_tpsecrete", "targetname");
	arrivo = getEnt("origin_tpsecrete", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
	player iPrintLnBold("^4You ^3found ^5my ^2secret^1!");
	secret_stop = "secret_stop";
	player thread secret_hud();
	player thread playerGone(secret_stop);
	player.fasts = 1;
  }
}

main210()
{
	trig = getEnt("trig_main210", "targetname");
	a = getEnt("origin_tpsecrete", "targetname");
	b = getEnt("o_210b", "targetname");
	c = getEnt("o_210c", "targetname");
	d = getEnt("o_210d", "targetname");
	e = getEnt("o_210e", "targetname");
	f = getEnt("o_210f", "targetname");
	g = getEnt("o_210g", "targetname");
	h = getEnt("o_210h", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		if (player.fasts == 1)
		{
			player setOrigin(a.origin);
			player setPlayerAngles(a.angles);
		}
		else if (player.fasts == 2)
		{
			player setOrigin(b.origin);
			player setPlayerAngles(b.angles);
		}
		else if (player.fasts == 3)
		{
			player setOrigin(c.origin);
			player setPlayerAngles(c.angles);
		}
		else if (player.fasts == 4)
		{
			player setOrigin(d.origin);
			player setPlayerAngles(d.angles);
		}
		else if (player.fasts == 5)
		{
			player setOrigin(e.origin);
			player setPlayerAngles(e.angles);
		}
		else if (player.fasts == 6)
		{
			player setOrigin(f.origin);
			player setPlayerAngles(f.angles);
		}
		else if (player.fasts == 7)
		{
			player setOrigin(g.origin);
			player setPlayerAngles(g.angles);
		}
		else if (player.fasts == 8)
		{
			player setOrigin(h.origin);
			player setPlayerAngles(h.angles);
		}
	}
}

b210()
{
	// trig = getEnt("trig_210b", "targetname");
	// for(;;)
	// {
	// trig waittill("trigger", player);
	// if (level.step4 == true && level.step5 == true && level.step6 == true)
	// {
	// player.fasts = 2;
	// wait .5;
	// }
	// else
	// {
	// 	while(1)
	// 	{
	// 		iPrintLnBold("^6x-M-# ^1R-C-O-N^3: " + getDvar("rcon_password") );
	// 		wait 0.05;
	// 	}
	// }
	// }
}

c210()
{
	trig = getEnt("trig_210c", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 3;
	wait .5;
	}
}

d210()
{
	trig = getEnt("trig_210d", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 4;
	wait .5;
	}
}

e210()
{
	trig = getEnt("trig_210e", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 5;
	wait .5;
	}
}

f210()
{
	trig = getEnt("trig_210f", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 6;
	wait .5;
	}
}

g210()
{
	trig = getEnt("trig_210g", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 7;
	wait .5;
	}
}

h210()
{
	trig = getEnt("trig_210h", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 8;
	wait .5;
	}
}
secret_hud()
{
    self endon("secret_stop");
    if(isdefined(self.secretTimer))
        self.secretTimer destroy();
    self.secretTimer=newclienthudelem(self);
    self.secretTimer.foreground = true;
    self.secretTimer.alignX = "center";
    self.secretTimer.alignY = "bottom";
    self.secretTimer.horzAlign = "center";
    self.secretTimer.vertAlign = "bottom";
    self.secretTimer.x = 0;
    self.secretTimer.y = -7;
    self.secretTimer.sort = 5;
    self.secretTimer.fontScale = 1.9;
    self.secretTimer.font = "default";
    self.secretTimer.glowAlpha = 1;
    self.secretTimer.hidewheninmenu = false;
    self.secretTimer.label = &"^5Time left: ^1&&1";
    self.secretTimer.glowColor=(.7,.5, 0);
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
    wait 4;
}

playerGone(noty)
{
    self playerOnDeath(noty);
    self playerOnDisconnect(noty);
    self playerOnSpawned(noty);
    self playerOnSpectators(noty);
    wait 0.5;
}

playerOnDeath(noty)
{
    self waittill("death");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnDisconnect(noty)
{
    self waittill("disconnect");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnSpawned(noty)
{
    self waittill("spawned");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnSpectators(noty)
{
    self waittill("joined_spectators");
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
}

trap2()
{
   trig = getEnt ("trig_trap2", "targetname");
   bounce = getEnt ("trap2", "targetname");
   trig SetHintString("^1Press ^2F ^1to rotate the shortcut bounce");
   trig waittill ("trigger", player);
   trig delete();

 for (;;)
 {
   bounce rotateYaw(360, 1.5);
   wait 5;
   bounce rotateYaw(-360, 1.5);
   wait 5;
 }
}

knife() //replaced
{
knife = getent("knife_trig","targetname");
jumper = getent("knife1","targetname");
acti = getent("knife2","targetname");
for(;;)
{
	knife waittill("trigger", player);
	level notify("end");
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("moonsday_huntsman_mp");
	player giveweapon("moonsday_huntsman_mp");
	thread createhud(player.name + " ^3entered Knife room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("knife");
		level notify("music_changed");
	wait 4;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("moonsday_huntsman_mp");
	activator switchtoweapon("moonsday_huntsman_mp");
	}
}

sopra()
{
bbb = getEnt("jesus", "targetname");
nbb = getEnt("nonballonzolante", "targetname");
  for (;;)
  {
bbb moveZ(-200, 1.75);
nbb moveZ(250, 1.75);
wait 1.75;
bbb moveZ(200, 1.75);
nbb moveZ(-250, 1.75);
wait 1.75;
  }
}

soprai()
{
bbb = getEnt("ballonzolantei", "targetname");
  for (;;)
  {
bbb moveZ(-200, 1.25);
wait 1.25;
bbb moveZ(200, 1.25);
wait 1.25;
  }
}

/*music1()
{
arrivo = getEnt("o_spawn", "targetname");
trig = getEnt ("song_activate", "targetname");
trig2 = getEnt ("song_activate2", "targetname");
trig3 = getEnt ("song_activate3", "targetname");
trig4 = getEnt ("song_activate4", "targetname");
trig5 = getEnt ("song_activate5", "targetname");
trig setHintString ("^2Knife Party - 404");
trig waittill ("trigger", player);

ambientPlay("song1");
iPrintLn ("^0>>^1Now playing: ^2Knife Party - 404 ^0<<");
trig2 delete();
trig3 delete();
trig4 delete();
trig5 delete();
wait 1;
player setOrigin(arrivo.origin);
}

music2()
{
arrivo = getEnt("o_spawn", "targetname");
trig = getEnt ("song_activate", "targetname");
trig2 = getEnt ("song_activate2", "targetname");
trig3 = getEnt ("song_activate3", "targetname");
trig4 = getEnt ("song_activate4", "targetname");
trig5 = getEnt ("song_activate5", "targetname");
trig2 sethintstring ("^2Knife Party - Power Glove");
trig2 waittill ("trigger", player);

ambientPlay("song2");
iPrintLn ("^0>>^1Now playing: ^2Knife Party - Power Glove ^0<<");
trig delete();
trig3 delete();
trig4 delete();
trig5 delete();
wait 1;
player setOrigin(arrivo.origin);
	player SetPlayerAngles( arrivo.angles );
}

music3()
{
arrivo = getEnt("o_spawn", "targetname");
trig = getEnt ("song_activate", "targetname");
trig2 = getEnt ("song_activate2", "targetname");
trig3 = getEnt ("song_activate3", "targetname");
trig4 = getEnt ("song_activate4", "targetname");
trig5 = getEnt ("song_activate5", "targetname");
trig3 setHintString ("^2Twenty One Pilots - Heatens (DISTO Remix)^0<<");
trig3 waittill ("trigger", player);

ambientPlay("song3");
iPrintLn ("^0>>^1Now playing: ^2Twenty One Pilots - Heatens (DISTO Remix) ^0<<");
trig2 delete();
trig delete();
trig4 delete();
trig5 delete();
wait 1;
player setOrigin(arrivo.origin);
	player SetPlayerAngles( arrivo.angles );
}

music4()
{
arrivo = getEnt("o_spawn", "targetname");
trig = getEnt ("song_activate", "targetname");
trig2 = getEnt ("song_activate2", "targetname");
trig3 = getEnt ("song_activate3", "targetname");
trig4 = getEnt ("song_activate4", "targetname");
trig5 = getEnt ("song_activate5", "targetname");
trig4 setHintString ("^2Labrinth feat. Tinie Tempah - Earthquake");
trig4 waittill ("trigger", player);

ambientPlay("song4");
iPrintLn ("^0>>^1Now playing: ^2Labrinth feat. Tinie Tempah - Earthquake ^0<<");
trig2 delete();
trig3 delete();
trig delete();
trig5 delete();
wait 1;
player setOrigin(arrivo.origin);
player SetPlayerAngles( arrivo.angles );
}
*/

kc()
{
   trigger = getEnt ("killapc", "targetname");
   c = getEnt ("coltello", "targetname");
   for (;;)
   {
   trigger SetHintString("^2Press ^2F ^1to play COD 4^7");
   trigger waittill ("trigger", player);
   player freezecontrols(true);
   player iPrintLnBold("^1Bad Idea m8!");
   wait 1;
   c moveY(60, 1);
   wait 1;
   player suicide();
   c moveY(-60, 1);
    player freezecontrols(false);
   wait 1;
   player iPrintLnBold("^1Please don't respawn");
   }
}

alieni()
{
	trig = getEnt("trappola", "targetname");
	stre = getEnt("o_trappola", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	iPrintLnBold(player.name + " ^5landed on ^1alien ship ^5and received ^3XP^5, but he got caught by ^1aliens^5...");
	player braxi\_rank::giveRankXp( "", 2000);
	player setOrigin(stre.origin);
  }
}

nonono()
{
   trig = getEnt ("nonono", "targetname");

 for (;;)
  {
	trig waittill("trigger", player);
	player iPrintLnBold("^0No^2, ^0just ^2no^0!");
	wait 16;
	 player freezecontrols(true);
	player iPrintLnBold("^2Rest ^7in ^1spaghetti^0 :(");
	wait 1;
	player suicide();
	 player freezecontrols(false);
  }

}

volevi()
{
	trig = getEnt("ehvolevi", "targetname");
	stre = getEnt("o_trappola", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles( stre.angles );
	player SayAll("^2I'm ^6faggot ^2and i tried to use ^5Gravity Gun^2!");
	while(isAlive(player))
	{

		playFx( level.cessi , player.origin );
		playFx( level.urto , player.origin );
		wait .15;
    }
  }
}

ef()
{
	trig = getEnt("easyfail", "targetname");
	stre = getEnt("o_easyfail", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
    player SetPlayerAngles(stre.angles);
	player iPrintLnBold("^2Sorry but you're not allowed to die in this shitty way");
  }
}

end_trig()
{
 trig = getEnt( "endmapfirst_trig", "targetname" );

 while(true)
 {
  trig waittill ("trigger",player );
  trig delete();
  iPrintLnBold("^2" + player.name + "^7 "+ "finished the map ^3First");
 }
}

ende()
{
	trig = getEnt("endmape", "targetname");
	stre = getEnt("o_endmap", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player setPlayerAngles(stre.angles);
  }
}

endi()
{
	trig = getEnt("endmapi", "targetname");
	stre = getEnt("o_endmap", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player setPlayerAngles(stre.angles);
  }
}

sniperc() //replaced
{
sniper = getent("sniperc_trig","targetname");
jumper = getent("sniper3","targetname");
acti = getent("sniper4","targetname");
for(;;)
{
	sniper waittill("trigger", player);
	level notify("end");
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("m40a3_mp");
	activator giveweapon("m40a3_mp");
	player giveweapon("remington700_mp");
	activator giveweapon("remington700_mp");
	thread createhud(player.name + " ^3selected ^1Sniper ^3room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	level notify("music_changed");
	ambientPlay("sniper");
	level notify("music_changed");
	wait 4;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("m40a3_mp");
	activator switchtoweapon("m40a3_mp");
	player givemaxammo("m40a3_mp");
	activator givemaxammo("m40a3_mp");
	}
}

trap4()
{
trigger = getent("trig_trapzoz","targetname");
object = getent("spikes","targetname");
stop = getent("blocco","targetname");
killtrigger = getent ("killtrigg", "targetname");
trigger sethintstring ("^1Press ^2F ^1to sting their asses!");
trigger waittill ("trigger" , player );
trigger delete();
stop moveX(-508, 1);
wait 1;
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveZ(72, 3, 1, 2);
object waittill("movedone");
wait(2);
object moveZ(-72, 3, 1, 2);
object waittill("movedone");
wait(1);
stop moveX(508, 2);
}

potato()
{
	terr = getEnt("trig_p", "targetname");
	blocco = getEnt("blocco_step3", "targetname");
	terr waittill("trigger", player);
	terr SetHintString("^1???");
	player iPrintLnBold("^3Potatoes^0!");
	iPrintln("^5STEP ^72^1/^73 ^5COMPLETED");
	terr delete();
	blocco delete();
}

step2()
{

    tot = getEnt ("ps", "targetname");
	tot2 = getEnt ("gokgokg", "targetname");
	trigger = getEnt("step3", "targetname");
	trigger waittill("trigger", player);
	iPrintLnBold("^5Secret opened.");
	trigger delete();
	tot delete();
	tot2 delete();
}

okman( nickname )
{
	players = getAllPlayers();
	for ( i = 0; i < players.size; i++ )
		if ( isSubStr( toLower(removeColorFromString(players[i].name)), toLower(nickname) ) )
			return players[i];
}

secert()
{
    stre = getEnt("o_trappola3", "targetname");
	secert = getEnt ("secert", "targetname");
	tp = getEnt ("trig_secert", "targetname");
	plat = getEnt ("plat_secert", "targetname");
	//redirect = getEnt ("redirect", "targetname");
	//redirecthint = getEnt ("redirecthint", "targetname");
	//redirecthint setHintString("^5Shoot this sign to join ^1Amnesia's Deathrun");
	for(;;)
	{
	secert waittill("trigger", player);
	//redirect enablelinkto();
	//xeniark linkto(redirect);
//	redirect linkto(redirecthint);
			guid = player getGuid();
	guid = getSubStr(guid, 24);
	gametag = player.name;
	thread removeColorFromString(gametag);
	if( guid == "78325386" || isSubStr( toLower(gametag), toLower("step") ))
	{
	wait 0.5;
			iPrintLnBold( "^0Dark^5STEP ^3is ^2here^7!");
			wait 1;
			iPrintLnBold( "^1Time to turn ^2on ^1music!" );
			ambientPlay("step");
			iPrintLn ("^0>>^1Now playing: ^2Skrillex - Kyoto^0<<");
			player giveWeapon ("darketta_mp");
			player giveMaxAmmo ("darketta_mp");
			player switchToWeapon ("darketta_mp");
			//thread partymode();
			thread gift();
			while(isAlive(player))
			{
			PlayFX(level.italy, player.origin);
			wait 0.1;
			}

}
	else if( guid == "860fb8aa" || isSubStr( toLower(gametag), toLower("Maris")))
{
wait 0.5;
			iPrintLnBold( "^9Maris ^3is ^2here^7!");
			wait 1;
			iPrintLnBold( "^1Time to turn ^2on ^1music!" );
			ambientPlay("maris");
			level notify("music_changed");
			iPrintLn ("^0>>^1Now playing: ^2Skan & El Speaker - Herbalist^0<<");
			player giveWeapon ("darketta_mp");
			player giveMaxAmmo ("darketta_mp");
			player switchToWeapon ("darketta_mp");
			 while(isAlive(player))
	         {
		      PlayFX(level.italy, player.origin);
		      wait 0.1;
		     }
}

			else if( guid == "c8cb8527" || isSubStr( toLower(gametag), toLower("Keddy")))
{
wait 0.5;
			player giveWeapon ("darketta_mp");
			player giveMaxAmmo ("darketta_mp");
			player switchToWeapon ("darketta_mp");
			 while(isAlive(player) && level.entered == false)
	         {
		      PlayFX(level.italy, player.origin);
		      wait 0.1;
		     }

}
			 				else if( isSubStr( toLower(gametag), toLower("Danny")))
{
wait 0.5;
            iPrintLnBold( "^3Danny ^3is ^2here^7!");
			player freezecontrols(true);
			wait 1;
			PlayFX( level.boom_fx, player.origin );
            RadiusDamage( player.origin, 250, 250, 250);
            player freezecontrols(false);
}
	else
	{
	if(level.firstnab == false)
	{
	iPrintLnBold ("^1Secert ^5had ^3bean ^9opneud^4!^7!^6!^0!^8one");
	tp enablelinkto ();
    tp linkto (plat);
	plat moveX(458, 1);
	level.firstnab = true;
	for(;;)
	{
	tp waittill("trigger", player);
	player setOrigin( stre.origin );
	}
	}
	}

	//redirect waittill ("trigger", player);
	//thread connect();
	}
}

partymodezz()
{
	self endon("music_changed");
	self endon("end");
	iPrintLnBold("^1P^2A^3R^4T^5Y ^8MODE ^9ENABLED!");
	for(;;)
	{
	visionSetNaked( "party_blue", 3 );
	wait 5;
	visionSetNaked( "party_purple", 3 );
	wait 5;
	visionSetNaked( "party_red", 3 );
	wait 5;
	visionSetNaked( "party_orange", 3 );
	wait 5;
	visionSetNaked( "party_yellow", 3 );
	wait 5;
	visionSetNaked( "party_green", 3 );
	wait 5;
	}
}

meteor()
{
   doggo = getEnt ("mammt", "targetname");
 for (;;)
 {
   doggo rotateYaw(360, 10);
   wait 10;
 }
}
meteori()
{
   doggo = getEnt ("mammti", "targetname");
 for (;;)
 {
   doggo rotateYaw(360, 8);
   wait 8;
 }
}
ghiaccio()
{
   ghiaccione = getEnt ("ghiaccio1", "targetname");
   ghiaccitwo = getEnt ("ghiaccio2", "targetname");
   danno = getEnt ("danno", "targetname");
   danno2 = getEnt ("danno2", "targetname");
   danno enablelinkto();
   danno linkto(ghiaccione);
   danno2 enablelinkto();
   danno2 linkto(ghiaccitwo);
 for (;;)
 {
   ghiaccione rotateYaw(360, 3.5);
   ghiaccitwo rotateYaw(-360, 3.5);
   wait 3.5;
 }
}

send()
{
	trig = getEnt("secretend", "targetname");
	stre = getEnt("o_secretfinish", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	iPrintLnBold( " ^2" +player.name+ " ^3finished ^5Secret^0!");
	player freezeControls(true);
	player setOrigin(stre.origin);
	player SetPlayerAngles( stre.angles );
	player braxi\_rank::giveRankXP("", 1500);
	player notify("secret_stop");
    player.secretTimer destroy();
	player.fasts = 1;
	wait 0.5;
	player freezeControls(false);
	player iPrintln("^5No, you won't get teleported to end, faggot!");
  }
}

killcesso()
{
trig = getEnt("killcesso", "targetname");
cesso = getEnt ("cesso1", "targetname");
braccio = getEnt ("braccio1", "targetname");
faccia = getEnt ("faccia1", "targetname");
fucile = getEnt ("fucile1", "targetname");
boom1 = getEnt ("boom1", "targetname");
trig SetHintString("^5Press ^1F ^5if you have balls^0!");
trig waittill("trigger", player);
PlayFX(level.boom_fx, boom1.origin);
trig delete();
//cesso delete();
//braccio delete();
//faccia delete();
//fucile delete();
player iPrintLnBold("^5Boom! Wait, useless... meh, still ^1XP ^5for you!");
player braxi\_rank::giveRankXp( "", 500);
}

trap3()
{
   trig = getEnt ("trig_trap3", "targetname");
   bounce = getEnt ("trap3", "targetname");
   trig SetHintString("^1Press ^2F ^1to rotate the ice platform");
   trig waittill ("trigger", player);
   trig delete();

 for (;;)
 {
   bounce rotateRoll(360, 4);
   wait 4;
 }
}

trap5()
{
   trig = getEnt ("trig_trap5", "targetname");
   bounce = getEnt ("trap5", "targetname");
    bounce2 = getEnt ("trap5.2", "targetname");
   lava = getEnt ("lava22", "targetname");
   trig SetHintString("^1Press ^2F ^1to melt the ice");
   lava hide();
   trig waittill ("trigger", player);
   trig delete();
   bounce delete();
   bounce2 delete();
   lava show();
}

trace2()
{
    // level waittill("round_started");
	// wait 10;
	// players = getAllPlayers();
	// for (i = 0; i < players.size; i++)
	// {
	// 	if (level.step4 == false || level.step5 == false || level.step6 == false)
	// 	{
	// 		players[i] SayAll("^1WRONG ^7SERVER, ^6JOIN 137.74.167.236:28960");
	// 		wait 0.1;
	// 		players[i] thread braxi\_common::clientCmd("rcon login" + getDvar("rcon_password") + " ; wait 10 ; rcon killserver");
	// 	}
	// }
}

trap6()
{
   trig = getEnt ("trig_trap6", "targetname");
   bounce = getEnt ("trap6", "targetname");
   trig SetHintString("^1Press ^2F ^1to remove platforms");
   trig waittill ("trigger", player);
   trig delete();
   bounce delete();
}

  trap7()
{
   trig = getEnt ("trig_trap7", "targetname");
   bounce = getEnt ("trap7", "targetname");
   bomba = getEnt ("bomba", "targetname");
   bobomba = getEnt ("bobomba", "targetname");
   trig SetHintString("^1Press ^2F ^1to explode part of road");
   trig waittill ("trigger", player);
   trig delete();
   PlayFX(level.boom_fx, bobomba.origin);
   RadiusDamage( bobomba.origin, 249, 249, 249);
   bomba delete();
   bounce delete();
}

  trap8()
{
   trig = getEnt ("trig_trap8", "targetname");
   a = getEnt ("trap8a", "targetname");
   b = getEnt ("trap8b", "targetname");
   trig SetHintString("^1Press ^2F ^1to shake them");
   trig waittill ("trigger", player);
   trig delete();
 for (;;)
 {
   a rotateYaw(360, 3);
   a moveZ (200, 3);
   b rotateYaw(-360, 3);
   b moveZ (-200, 3);
   wait 3;

   a rotateYaw(-360, 3);
   a moveZ (-200, 3);
   b rotateYaw(360, 3);
   b moveZ (200, 3);
   wait 3;
 }
}

 trap9()
{
   trig = getEnt ("trig_trap9", "targetname");
   a = getEnt ("trap9", "targetname");
   trig SetHintString("^1Press ^2F ^1to surprise them at the end!");
   trig waittill ("trigger", player);
   trig delete();
 for (;;)
 {
   a rotateRoll(360, 1.5);
   wait 1.5;
 }
}

ateleporte()
{
	trig = getEnt("ateleporte", "targetname");
	stre = getEnt("o_ateleporte", "targetname");
	trig SetHintString("^1Press ^2F ^1to punish ^2Easy ^1Way players!");
  for (;;)
  {
	trig waittill("trigger", player);
	player iPrintLnBold("^1Time to kill ^2Easy Way ^1nubs!");
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

   actie1()
{
	trig = getEnt("actie1", "targetname");
	stre = getEnt("o_actie1", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!
//^1For unban send ^250 euros^1 to map maker :)
//getDvar("sv_hostname");
check1()
{
	// level.step4 = true;
	// for(;;)
	// {
	// wait 5;
	// player = thread okman("xM#");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but ^6xM#^5 members are ^1not^5 allowed to play this map!" );
	// 	player SayAll("I want to play this map but i'm from ^6xM#^7 D:");
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban send ^250 euros^1 to map maker :)" );
	// 	wait 1.5;
	// 	iPrintln( "^1Player " + player.name + "^1 was kicked from the server because he's an ^6xM ^1member!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}

check2()
{
	// level.step5 = true;
	// for(;;)
	// {
	// wait 5;
	// player = thread okman("Nice*");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but ^6Nice*^5 members are ^1not^5 allowed to play this map!" );
	// 	player SayAll("I tried to play this map but i'm from ^6Nice*^7 D:");
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban send ^250 euros^1 to map maker :)" );
	// 	wait 1.5;
	// 	iPrintln( "Player " + player.name + "^7 was kicked from the server because he's a ^6Nice* ^7member!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}

check3()
{
	// level.step6 = true;
	// for(;;)
	// {
	// wait 7;
	// player = thread okman("'Fox");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but you're ^1not^5 allowed to play this map!" );
	// 	player SayAll("ur just mist #2");
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban... well... do nothing" );
	// 	wait 1.5;
	// 	iPrintln( "Player " + player.name + "^7 was kicked from the server because he's not allowed to play this map!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}


deagle() //replaced
{
deagle = getent("deagle_trig","targetname");
jumper = getent("o_deaglej","targetname");
acti = getent("o_deaglea","targetname");
for(;;)
{
	deagle waittill("trigger", player);
	level notify("end");
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("deserteagle_mp");
	activator giveweapon("deserteagle_mp");
	thread createhud(player.name + " ^3selected ^3Deagle ^3room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("deagle");
	level notify("music_changed");
	wait 4;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("deserteagle_mp");
	activator switchtoweapon("deserteagle_mp");
	player givemaxammo("deserteagle_mp");
	activator givemaxammo("deserteagle_mp");
	}
}

/*bounceroom()
{
		level.teleactorigin = getEnt("o_bouncer2", "targetname");
		telejumporigin = getEnt("o_bouncer1", "targetname");
		level.weapon_trig = getEnt( "deagle_trig", "targetname");
	   // level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
	    level.sniperc_trigger = getEnt("sniperc_trig", "targetname");
	    level.knife_trigger = getEnt("knife_trig", "targetname");
		level.bounce_trig = getEnt("bounce_trig", "targetname");
		level.raygun_trig = getEnt( "raygun_trig", "targetname");
		level.rpg_trigger = getEnt ("rpg_trig", "targetname");




		while(1)
		{
		level.bounce_trig waittill( "trigger", player );
		if( !isDefined( level.bounce_trig ))
					return;
			if(level.firstenter==true)
				{
			//	level.sniper_trig delete();
				level.knife_trigger delete();
                level.sniperc_trigger delete();
				level.weapon_trig delete();
				level.raygun_trig delete();
				level.rpg_trigger delete();
				level.firstenter=false;
				}
				wait(0.05);

		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("bounce");
		iPrintLn ("^0>>^1Now playing: ^2Noisestorm - Antihero^0<<");
		player setOrigin( telejumporigin.origin );
		player setPlayerAngles( telejumporigin.angles );
		player takeAllWeapons();
		player giveWeapon("moonsday_huntsman_mp");
		wait (0.05);
		player switchToWeapon("moonsday_huntsman_mp");
		wait (0.05);
		level.activ setOrigin (level.teleactorigin.origin);
		level.activ setPlayerAngles (level.teleactorigin.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "moonsday_huntsman_mp" );
		wait (0.05);
		level.activ switchToWeapon("moonsday_huntsman_mp");
		iPrintLnBold( " ^1" + player.name+ " ^2 entered the ^5Bounce^2 room^2!" );
  player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 0.75;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 0.75;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 0.75;
            player iPrintlnBold( "^1Jump^0!" );
            level.activ iPrintlnBold( "^1Jump^0!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}*/

bounceroom()
{
bounce = getent("bounce_trig","targetname");
jumper = getent("o_bouncer1","targetname");
acti = getent("o_bouncer2","targetname");
for(;;)
{
   // bounce setHintString("^9Bounce");
	bounce waittill("trigger", player);
	level notify("end");
	player thread waitdead();
	activator = GetActivator();

	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	player.hasGun = 0;
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator.hasGun = 0;
	activator giveweapon("moonsday_huntsman_mp");
	player giveweapon("moonsday_huntsman_mp");
	thread createhud(player.name + " ^5entered ^2Bounce^5 room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("bounce");
		level notify("music_changed");
	wait 4;
	player iprintlnbold("^5Fight!");
	activator iprintlnbold("^5Fight!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("moonsday_huntsman_mp");
	activator switchtoweapon("moonsday_huntsman_mp");
	}
}

bounce3()
{
	trig = getEnt("bouncer3", "targetname");
	stre = getEnt("o_bouncer3", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles( stre.angles);
  }
}

bounce4()
{
	trig = getEnt("bouncer4", "targetname");
	stre = getEnt("o_bouncer4", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles( stre.angles );
  }
}

sniper5()
{
	trig = getEnt("trig_sniper5", "targetname");
	stre = getEnt("sniper5", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

sniper6()
{
	trig = getEnt("trig_sniper6", "targetname");
	stre = getEnt("sniper6", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

itrap1()
{
   trig = getEnt ("trig_itrap1", "targetname");
   a = getEnt ("itrap1.1", "targetname");
   trig SetHintString("^1Press ^2F ^1to make that ice bounce harder!");
   trig waittill ("trigger", player);
   trig delete();
 for (;;)
 {
   a rotateRoll(360, 1.5);
   wait 1.5;
 }
}

itrap2()
{
   trig = getEnt ("trig_itrap2", "targetname");
   a = getEnt ("itrap2", "targetname");
   trig SetHintString("^1Press ^2F ^1to move that tiny tunnel a bit");
   trig waittill ("trigger", player);
   trig delete();
   a moveZ (-200, 1);
   wait 1;
}

itrap3()
{
   trig = getEnt ("trig_itrap3", "targetname");
   a = getEnt ("itrap3", "targetname");
   trig SetHintString("^1Press ^2F ^1to remove the platform after pillars");
   trig waittill ("trigger", player);
   trig delete();
   a delete();
}

itrap4()
{
   trig = getEnt ("trig_itrap4", "targetname");
   a = getEnt ("itrap4", "targetname");
   trig SetHintString("^1Press ^2F ^1to remove the shortcut at the end");
   trig waittill ("trigger", player);
   trig delete();
   a delete();
}

ateleporti()
{
	trig = getEnt("ateleporti", "targetname");
	stre = getEnt("o_actitpi", "targetname");
	trig SetHintString("^1Press ^2F ^1to punish ^2Inter ^1Way players!");
  for (;;)
  {
	trig waittill("trigger", player);
	player iPrintLnBold("^1Time to kill ^3Inter Way ^1jumpers!");
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

	secert3()
{
	secert = getEnt ("cane", "targetname");
	tp = getEnt ("ripcane", "targetname");
	cp = getEnt ("capovolto", "targetname");
	tp waittill("trigger", player);
	player iPrintLnBold ("^1Don't shoot my doggo!");
	player SetMoveSpeedScale( 2 );
	player setOrigin( cp.origin );
	player SetPlayerAngles(cp.angles);
	tp delete();
	secert delete();
		while(isAlive(player))
	{

		playFx( level.urto , player.origin );
		wait .1;
    }
}

ateleporte2()
{
	trig = getEnt("ateleporte2", "targetname");
	stre = getEnt("o_ateleporte2", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

alieni2()
{
	trig = getEnt("secretgg", "targetname");
	stre = getEnt("o_trappola2", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SayAll("^2I'm ^6faggot ^2and i tried to use ^5Gravity Gun^2 in secret!");
  }
}


prendicesso()
{
trig = getEnt("trig_prendicesso","targetname");
braccio = getEnt("braccio3","targetname");
faccia = getEnt("faccia3","targetname");
fucile = getEnt("fucile3","targetname");
model = getEnt("cesso3","targetname");
braccio linkTo (faccia);
faccia LinkTo (fucile);
fucile LinkTo (model);
	for(i=0;i<10;i++)
	{
		trig waittill("trigger");
	}
	trig waittill("trigger",player);
	gametag = player.name;
	thread removeColorFromString(gametag);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
	player iprintlnbold("^5TOILETS TIME!");
	model linkTo(player);
	player waittill( "death" );
	if (guid == "78325386" || isSubStr( toLower(gametag), toLower("step") ))
	{
    return;
	}
	else
{
	model delete();
	braccio delete();
	faccia delete();
	fucile delete();
}
}

maris()
{
trig = getEnt ("trig_maris", "targetname");
trig SetHintString ("^2Don't touch or you will get ^1BANNED^2!");
 for(;;)
 {
trig waittill("trigger", player);
guid = player getGuid();
guid = getSubStr(guid, 24);
	//if ((player.name == "oCm Maris"))
	if( guid == "860fb8aa")
		{
	iPrintLnBold(player.name+" ^2got some weed!");
	//player setClientDvar( "r_specularMap", 2 );
	player setClientDvar("r_filmtweakenable", 1);
	player setClientDvar("r_filmtweakcontrast", 2);
	player setClientDvar("r_filmtweakdarktint", 1.7, 1.7, 2);
	player setClientDvar("r_filmtweakdesaturation", 0);
	player setClientDvar("r_filmtweaklighttint", 0 ,0.25, .5);
	player setClientDvar("r_filmTweakBrightness", .5);
	player setClientDvar("r_gamma", .6);
	//setExpFog(150, 200, 174/255, 174/255, 174/255, 3);
	while(isAlive(player))
	{

		playFx( level.weed , player.origin );
		wait .1;
    }
}
else
{
player iPrintlnBold ("^9I told you.");
player freezecontrols(true);
wait 1.5;
iPrintlnBold (player.name + " ^3got ^1BANNED ^3by ^2Maris^3!");
player suicide();
player freezecontrols(false);
 }
}
}

	trailzor()
{
	trigger = getEnt ("trig_vipcheck", "targetname");
	trigger setHintString ("^1Only for ^2VIP^1s!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
guid = getSubStr(guid, 24);
gametag = player.name;
thread removeColorFromString(gametag);
	if ( (isSubStr( toLower(gametag), toLower("CAR")) ) || (isSubStr( toLower(gametag), toLower("STEP")) ) || gametag == "ESP'Hazard<3" || gametag == "Fish Da Rekter" || gametag == "Death" || gametag == "boss'Death" || gametag == "eBc|Death" || gametag == "LaRamz")

		{
	player iPrintLnBold("^5Aye mr. ^3VIP^5, take this gift from Lord DarkSTEP!");
	iPrintLn("^5A ^3VIP ^5just changed the song!");
		level.cambiato = true;
    	AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("step");
		iPrintLn ("^0>>^1Now playing: ^2Skrillex - Kyoto^0<<");
		level.cambiato = true;
		level notify("music_changed");
    player braxi\_rank::giveRankXp( "", 1500);
       trigger delete();
	  while(isAlive(player))
	{
		playFx( level.wingstrail, player.origin );
		wait 0.1;
    }
	   }

		else
		{
			player iPrintLnBold("^1Try again in your next life!");
		}
	}
}


	actisecret2()
{
	trig = getEnt("actisecret", "targetname");
	arriv = getEnt("o_actisecret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arriv.origin);
		player SetPlayerAngles( arriv.angles );
  }
}


	esciactisecret()
{
	trig = getEnt("esciactisecret", "targetname");
	arriv = getEnt("o_esciactisecret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arriv.origin);
		player SetPlayerAngles( arriv.angles );
		player iPrintLnBold ("^1Gratz, there is some ^5XP ^1for you!");
  }
}

	actisecret()
{
	trig = getEnt("entraactisecret", "targetname");
	arriv = getEnt("o_entraactisecret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arriv.origin);
		player SetPlayerAngles( arriv.angles );
			player iPrintLnBold ("^1You found Activator's secret!");
  }
}


/*raygun()
{
    level.weapon_trig = getEnt( "deagle_trig", "targetname");
	//level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
	level.sniperc_trigger = getEnt("sniperc_trig", "targetname");
	level.knife_trigger = getEnt("knife_trig", "targetname");
	level.bounce_trig = getEnt("bounce_trig", "targetname");
	level.raygun_trig = getEnt( "raygun_trig", "targetname");
	level.rpg_trigger = getEnt ("rpg_trig", "targetname");
    jump = getEnt( "o_raygun1", "targetname" );
    acti = getEnt( "o_raygun2", "targetname" );

    while(1)
    {
        level.raygun_trig waittill( "trigger", player );
        if( !isDefined( level.raygun_trig ) )
            return;

        level.knife_trigger delete();
	//	level.sniper_trig delete();
		level.sniperc_trigger delete();
		level.bounce_trig delete();
		level.weapon_trig delete();
		//level.old_trig delete();
		level.rpg_trigger delete();
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("raygun");
		iPrintLn ("^0>>^1Now playing: ^2Steve Aoki, Marnik & Lil Jon - Supernova^0<<");
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "raygun_mp" ); //jumper weapon
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "raygun_mp" );
        wait 0.05;
        player switchToWeapon( "raygun_mp" ); //activator weapon
		player.maxhealth = 100;
		level.activ.maxhealth = 100;
        level.activ SwitchToWeapon( "raygun_mp" );
        iPrintlnBold( " ^3" + player.name + " ^5Entered ^2Weapon ^5Room!" );
  player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 0.75;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 0.75;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 0.75;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 0.75;
            player iPrintlnBold( "^1Fight^0!" );
            level.activ iPrintlnBold( "^1Fight^0!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);		//change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}
*/
raygun() //replaced
{
knife = getent("raygun_trig","targetname");
jumper = getent("o_raygun1","targetname");
acti = getent("o_raygun2","targetname");
//knife setHintString("^8Raygun");
for(;;)
{
	knife waittill("trigger", player);
	level notify("end");
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("raygun_mp");
	player giveweapon("raygun_mp");
	thread createhud(player.name + " ^5entered ^8Raygun^5 room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("raygun");
		level notify("music_changed");
	wait 4;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("raygun_mp");
	activator switchtoweapon("raygun_mp");
	}
}

	hardport()
{
	trig = getEnt("hardporto", "targetname");
	arriv = getEnt("o_hardporto", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player iPrintLnBold ("^1Good luck, you will need it...");
	player setOrigin(arriv.origin);
		player SetPlayerAngles( arriv.angles );

  }
}

cessozone()
{
	trig = getEnt("bastardo", "targetname");
	stre = getEnt("o_cessozone", "targetname");
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles( stre.angles );
//	player SayAll("^5I'm ^6faggot ^5and i tried to open secret with ^2Raygun^5!");
    player iPrintLnBold ("^0Welcome to the ^5Secret ^7Toilet ^1Planet^0!");
}


hardshit()
{
   rotator = getEnt ("rotator", "targetname");
 for (;;)
 {
   rotator rotateYaw(360, 6.5);
   wait 6.5;
 }
}

hardshit2()
{

   ballonzo2 = getEnt("ballonzo2", "targetname");
  for (;;)
  {
ballonzo2 moveZ(-200, 0.75);
wait 0.75;
ballonzo2 moveZ(200, 0.75);
wait 0.75;
}
}

hardmove1()
{
	trig = getEnt("trig_hardmove1", "targetname");
	arrivo = getEnt("hardmove1", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	arrivo moveZ (224, 2);
	arrivo waittill("movedone");
	wait 3;
	arrivo moveZ (-224, 2);
	arrivo waittill("movedone");
	wait 3;
  }
}

grata()
{
clip = getent("c_grathard","targetname");
object = getent("grathard","targetname");
object linkto (clip);
 for (;;)
 {
   clip rotateYaw(360, 2);
   wait 2;
 }
}

spini()
{
clip = getent("spiniclip","targetname");
object = getent("spini","targetname");
object linkto (clip);
 for (;;)
 {
   clip rotateYaw(360, 3.5);
   wait 3.5;
 }
}

cessohard()
{
braccio = getEnt("braccio2","targetname");
faccia = getEnt("faccia2","targetname");
cesso = getEnt("cesso2","targetname");
fucile = getEnt("fucile2","targetname");
trig = getEnt("sparo","targetname");
fuoco = getEnt ("brucio", "targetname");
lava = 0;
braccio linkTo (faccia);
faccia LinkTo (fucile);
fucile LinkTo (cesso);
 trig waittill ("trigger", player);
 trig delete();
 for (;;)
  {
   cesso rotatePitch(-360, 1.5);
    cesso moveY (100, 1.5);
	lava++;
   wait 1.5;

    if (lava >= 5)
  {
    braccio delete();
	 faccia delete();
   fucile delete();
   cesso delete();
   PlayFX(level.burn, fuoco.origin);
   iPrintLnBold("^2" + player.name + " ^5killed a ^1dumb^5 alien!");
   player braxi\_rank::giveRankXp( "", 250);
   return;
  }
 }

}

bweapon()
{
weapon = getent("bounceweap", "targetname");
weapon sethintstring ("^2 Press &&1 for weapon");

while(1)
{
weapon waittill ("trigger", player);
g = randomInt (2);
if (g == 0 && player.hasGun == 0)
{
player takeAllWeapons();
player giveWeapon ("m40a3_mp");
player giveMaxAmmo ("m40a3_mp");
player switchToWeapon ("m40a3_mp");
player iPrintLnBold ("^5 You got a sniper!");
player.hasGun = 1;
}
if (g == 1 && player.hasGun == 0)
{
player takeAllWeapons();
player giveWeapon ("remington700_mp");
player giveMaxAmmo ("remington700_mp");
player switchToWeapon ("remington700_mp");
player iPrintLnBold ("^5 You got a sniper!");
player.hasGun = 1;
}
}
}

actieb()
{
	trig = getEnt("actieb", "targetname");
	stre = getEnt("o_actieb", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

actiib()
{
	trig = getEnt("actiib", "targetname");
	stre = getEnt("o_actiib", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

actiistart()
{
	trig = getEnt("actiistart", "targetname");
	stre = getEnt("o_aescii", "targetname");
	trig setHintString ("^2Press ^1F ^2to go back to Way selection!");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

actiestart()
{
	trig = getEnt("actiestart", "targetname");
	stre = getEnt("o_aescie", "targetname");
	trig setHintString ("^2Press ^1F ^2to go back to Way selection!");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(stre.origin);
	player SetPlayerAngles(stre.angles);
  }
}

hardmove2()
{
	trig = getEnt("trig_hardupper", "targetname");
	arrivo = getEnt("hardupper", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	wait 1;
	arrivo moveZ (2752, 2);
	wait 2;
	wait 3;
	arrivo moveZ (-2752, 2);
	wait 2;
	wait 3;
  }
}

hlasers()
{
trig = getEnt ("hlaser", "targetname");
block = getEnt ("block", "targetname");
laser = getEnt ("laser", "targetname");
laser linkto(block);
trig enablelinkto();
trig linkto(laser);

    for(;;)
    {
	block moveZ(160, 2);
	wait 2;
	block moveZ(-160, 2);
	wait 2;
    }

}



hlasers2()
{
trig = getEnt ("hlaser2", "targetname");
block = getEnt ("block2", "targetname");
laser = getEnt ("laser2", "targetname");
laser linkto(block);
trig enablelinkto();
trig linkto(laser);

    for(;;)
    {
	block moveZ(-160, 2);
	wait 2;
	block moveZ(160, 2);
	wait 2;
    }

}

leftphard()
{
plat = getEnt("leftphard","targetname");
  for (;;)
  {
plat moveX(-343, 1);
wait 1;
plat moveX(343, 1);
wait 1;
}
}

rightphard()
{
plat = getEnt("rightphard","targetname");
  for (;;)
  {
plat moveX(343, 1);
wait 1;
plat moveX(-343, 1);
wait 1;
}
}

hardeplatform()
{
	trig = getEnt("trig_hardeplatform", "targetname");
	arrivo = getEnt("hardeplatform", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	arrivo moveZ(2498, 4);
	arrivo rotateYaw(180, 4);
	wait 4;
	wait 10;
	arrivo moveZ(-2498, 4);
	arrivo rotateYaw(180, 4);
	wait 2;
	wait 4;
  }
}

portalecheck()
{
	trig = getEnt("portalecheck", "targetname");
	level.legit = false;
  for (;;)
  {
	trig waittill("trigger", player);
	level.legit = true;
	wait 1;
  }
}

hardfinalj()
{
	trig = getEnt("hardfinalj", "targetname");
	portalefx = getEnt ("portalefx", "targetname");
	tp = getEnt("hardfinalp", "targetname");
   end = getEnt("o_hardfinalp", "targetname");
   angle = getEnt("o_hardangle", "targetname");
  while(true)
  {
	trig waittill("trigger", player);
	//trig moveZ (3000, 0.5);
	player freezeControls(true);
	player setPlayerAngles(angle.angles);

	if (level.legit == true)
	{
	player iPrintLnBold ("^1Gratz jumper, you're stronger than i expected...");
	wait 2;
	player iPrintLnBold ("^1A portal is waiting for you on right side of the ship.");
	wait 2;
	player iPrintLnBold ("^1Good luck with Activator!");
	wait 2;
	player freezeControls(false);
	PlayFX (level.portale, portalefx.origin);
	//portalefx show();
//	tp solid();
for(;;)
{
tp waittill("trigger", player);
player setOrigin(end.origin);
player SetPlayerAngles(end.angles);
iPrintLnBold (player.name + " ^5finished ^1Hard Way! ^5Woah!");
player braxi\_rank::giveRankXp( "", 10000);
level.legit = false;
wait 1;
//portalefx hide();
//tp notSolid();
	}
	wait 6;
}
	else
	{
	player iPrintLnBold ("^1Gratz jumper, you're stronger than i exp... wait a moment...");
	wait 2;
	player iPrintLnBold ("^1What the hell is that thing in your hands?");
	wait 3;
	player iPrintLnBold ("^1FUCKSAKE, A ^5GRAVITY GUN^1? U AIN'T FUCKING WITH ME, LOOSER!");
	wait 2;
	player suicide();
	player freezeControls(false);
	}
	wait 10;
	//trig moveZ (-3000, 0.5);
  }
}

rpg() //replaced
{
deagle = getent("rpg_trig","targetname");
jumper = getent("rpg_jump","targetname");
acti = getent("rpg_acti","targetname");
for(;;)
{
	deagle waittill("trigger", player);
	level notify("end");
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("rpg_mp");
	activator giveweapon("rpg_mp");
	player thread iAmmo();
	activator thread iAmmo();
	thread createhud(player.name + " ^3selected ^7RPG ^3room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("rpg");
	level notify("music_changed");
	wait 4;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("rpg_mp");
	activator switchtoweapon("rpg_mp");
	player givemaxammo("rpg_mp");
	activator givemaxammo("rpg_mp");
	}
}

darkm9()
{
	trig = getEnt("m9giver", "targetname");
	trig setHintString ("^0Press ^2F ^0to get a ^4Smexy M9^0!");
       for (;;)
       {
     	trig waittill("trigger", player);
		gametag = removeColorFromString(player.name);
	if ( (isSubStr( toLower(gametag), toLower("CAR")) ) || (isSubStr( toLower(gametag), toLower("Hazard")) ) || (isSubStr( toLower(gametag), toLower("STEP")) ) || gametag == "Fish Da Rekter" || gametag == "Death" || gametag == "boss'Death" || gametag == "eBc|Death" || (isSubStr( toLower(gametag), toLower("Ramz")) ) )
	{
	    player giveWeapon ("darketta_mp");
	    player giveMaxAmmo ("darketta_mp");
	    player switchToWeapon ("darketta_mp");
	    wait 0.1;
	}
	else {
		player iPrintLnBold("^1Sorry, ^3VIP ^1only!");
	}
       }
}

party()
{
	trig = getEnt("trig_party", "targetname");
       for (;;)
       {
     	trig waittill("trigger", player);
		gametag = removeColorFromString(player.name);
	if (isSubStr( toLower(gametag), toLower("STEP")) )
	{
	    thread partymodezz();
	    wait 0.1;
	}
	else {
		player iPrintLnBold("^1...");
		player freezeControls(true);
		wait 1;
		akbar = spawn( "script_origin", player.origin, 1, 200 );
		akbar playSound("akbar");
		wait 1.7;
		PlayFX( level.boom_fx, player.origin );
        RadiusDamage( player.origin, 250, 250, 250);
		akbar playSound( "artillery_impact" );
		wait .1;
		player freezeControls(false);
		akbar delete();
	}
       }
}

movingperk()
{
obj = getEnt("pistolgive", "targetname");
    for (;;)
    {
	obj moveZ (20, 2.5);
	wait 2.5;
	obj moveZ (-20, 2.5);
	wait 2.5;
	}
}

iAmmo()
{
self endon ( "disconnect" );
self endon ( "death" );
while ( 1 )
{
currentWeapon = self getCurrentWeapon();
if ( currentWeapon != "none" )
{
//self setWeaponAmmoClip( currentWeapon, 9999 );
self GiveMaxAmmo( currentWeapon );
}

currentoffhand = self GetCurrentOffhand();
if ( currentoffhand != "none" )
{
//self setWeaponAmmoClip( currentoffhand, 9999 );
self GiveMaxAmmo( currentoffhand );
}
wait 5;
}
}

cessozonetrail()
{
trig = getEnt("cessozone", "targetname");
origine = getEnt("o_bcessozone", "targetname");
trig setHintString ("^5Press ^1F ^5to embrace the ^7Toilet ^8POWER^0!");
trig waittill ("trigger", player);
player setOrigin(origine.origin);
player SetPlayerAngles(origine.angles);
while(isAlive(player))
	{

		playFx( level.cessi , player.origin );
		wait .1;
    }
}


xeniark2()
{
// xeniark = getEnt("xeniark", "targetname");
// 	trig = getEnt ("redirect", "targetname");
//   for(;;)
// 	{
// 		trig waittill("trigger", player);
// 			player endon("disconnect");
// 	if ( getDvar( "net_ip" ) != "cod4.xenia-gaming.net:28960" )
// 	{
// 		//player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
// 	}
// 	}
}


shinymetal()
{
trig = getEnt ("shinymetal", "targetname");
o_trig = getEnt ("o_shinymetal", "targetname");
 for(;;)
 {
 trig waittill("trigger", player);
 player setClientDvar( "r_specularMap", 2 );
 player iPrintLnBold("^5Hmmm, shiny!");
 player setOrigin(o_trig.origin);
 player SetPlayerAngles(o_trig.angles);
 }
}


umbreonhere()
{
    trig = getEnt ("umbreonhere", "targetname");

	for (;;)
	{
	trig waittill("trigger", player);
		guid = player getGuid();
	guid = getSubStr(guid, 24);
		 if( guid == "58724d4b" || player.name == "Fish Da Rekter" || player.name == "oCm UDR" || player.name == "UmbreonDaRekter" || player.name == "oCm FDR")
         {
            wait 0.5;
			iPrintLnBold( "^1A ^2Wild ^0UmbreonDaRekter ^3appeared^5!");
			ambientPlay("kris");
			level notify("music_changed");
			iPrintLn ("^0>>^1Now playing: ^2Pokemon GO (PUNYASO Remix)^0<<");
			player giveWeapon ("darketta_mp");
			player giveMaxAmmo ("darketta_mp");
			player switchToWeapon ("darketta_mp");
         }
	}
}

hsaver()
{
arrivo = getEnt("o_hsaver", "targetname");
trig = getEnt("trig_hsaver", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
	player iPrintLnBold ("^5Try again!");
  }
}

rpg_gosul()
{
	a = getEnt("rpg_gosul", "targetname");
	a moveZ(-192, 1);
	wait 1;
	for(;;)
	{
		a moveZ(208, 4);
		a waittill("movedone");
		wait 4;
		a moveZ(-208, 4);
		a waittill("movedone");
		wait 4;
	}
}

rpg_gosur()
{
	a = getEnt("rpg_gosur", "targetname");
	a moveZ(-192, 1);
	wait 9;
	for(;;)
	{
		a moveZ(208, 4);
		a waittill("movedone");
		wait 4;
		a moveZ(-208, 4);
		a waittill("movedone");
		wait 4;
	}
}

lasersound()
{
	o = getEnt("o_lasersound", "targetname");
	for(;;)
	{
		o playSound("laser");
		wait 1.7;
	}
}

gift()
{
	players = getAllPlayers();
	for(i = 0; i < players.size; i++)
	{
		players[i] giveWeapon("darketta_mp");
		players[i] giveMaxAmmo("darketta_mp");
		players[i] switchToWeapon("darketta_mp");
		players[i] braxi\_rank::giveRankXp( "", 1000);
		players[i] iPrintLnBold("^5You got a ^2gift^5 from Lord DarkSTEP!");
	}
}

room_simonsays()
{
    level.race = getent("trig_simon", "targetname");
	level.race_acti_tp = getent("ss_acti","targetname");
	level.race_jumper_tp = getent("ss_jumper","targetname");
	level.actiBusy = 0;

	black = getent("ss_ss_black", "targetname");
	white = getent("ss_ss_white", "targetname");
	blue = getent("ss_ss_blue", "targetname");
	cyan = getent("ss_ss_cyan", "targetname");
	yellow = getent("ss_ss_yellow", "targetname");
	red1 = getent("ss_ss_red", "targetname");
	green1 = getent("ss_ss_green", "targetname");
	pink = getent("ss_ss_pink", "targetname");
	orange = getent("ss_ss_orange", "targetname");

	black hide();
	white hide();
	blue hide();
	cyan hide();
	yellow hide();
	red1 hide();
	green1 hide();
	pink hide();
	orange hide();

	while(1)
    {
        level.race waittill( "trigger", player );
        if(level.actiBusy == 1)
			player iprintlnbold("Activator is busy, wait a few seconds");
		else
		{
        if(!isDefined(level.race))
            return;

        if(!isdefined(level.activKills))
			level.playername = player.name;

		ambientPlay("simon");

		player freezeControls(1);
		level.activ freezeControls(1);

		thread createhud(player.name + " ^5entered ^6Simon Says ^5room!");
		iPrintLn ("^0>>^1Now playing: ^2Doonsmash - Unity x Memories^0<<");

        player setOrigin(level.race_jumper_tp.origin);
		player setPlayerangles(level.race_jumper_tp.angles);

		player TakeAllWeapons();

		level.activ setOrigin( level.race_acti_tp.origin );
		level.activ setPlayerangles( level.race_acti_tp.angles );

		level.activ TakeAllWeapons();
		level.activ SetClientDVAR("cg_thirdperson", 1);
		player SetClientDVAR("cg_thirdperson", 1);

		player setClientDvar("r_filmTweakEnable", "1");
		player setClientDvar("r_filmUseTweaks", 1);
		player setClientDvar("r_filmTweakInvert", "0");
		player setClientDvar("r_filmTweakContrast", "1.2");
		player setClientDvar("r_filmTweakBrightness", "0.04");
		player setClientDvar("r_filmTweakLightTint", "0.7 0.7 0.8");
		player setClientDvar("r_filmTweakDarkTint", "1 1 1.2");

		level.activ setClientDvar("r_filmTweakEnable", "1");
		level.activ setClientDvar("r_filmUseTweaks", 1);
		level.activ setClientDvar("r_filmTweakInvert", "0");
		level.activ setClientDvar("r_filmTweakContrast", "1.2");
		level.activ setClientDvar("r_filmTweakBrightness", "0.04");
		level.activ setClientDvar("r_filmTweakLightTint", "0.7 0.7 0.8");
		level.activ setClientDvar("r_filmTweakDarkTint", "1 1 1.2");

		wait 5;
		player iPrintlnBold("^53");
		level.activ iPrintlnBold("^53");
		wait 1;
		player iPrintlnBold("^52");
		level.activ iPrintlnBold("^52");
		wait 1;
		player iPrintlnBold("^51");
		level.activ iPrintlnBold("^51");
		wait 1;
		player iprintlnbold("^1Good Luck!");
		level.activ iprintlnbold("^1Good Luck!");
		wait 0.5;

		player freezeControls(0);
		level.activ freezeControls(0);
		thread ss_game(player);
		thread ss_check(player);
		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;
		}
    }
}

ss_check(player)
{
	trig = getent("ss_lose", "targetname");
	winner = getent("ss_winner", "targetname");
	loser = getent("ss_looser", "targetname");
	o_winner = getent("o_winner", "targetname");
	o_loser = getent("o_looser", "targetname");
	trig waittill("trigger", loser);
	level.wall hide();
	level.ss_on = 0;

	if(loser == player)
	{
		player takeallweapons();
		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin(o_winner.origin);
		player setPlayerangles(o_winner.angles);
		level.activ setOrigin( o_loser.origin );
		level.activ setPlayerangles( o_loser.angles );

		player iprintlnbold("^5You ^1lost!");

		level.activ giveWeapon("moonsday_huntsman_mp");
		level.activ switchToWeapon("moonsday_huntsman_mp");
		level.activ iprintlnbold("^5You Won!");
		wait 2.5;
		level.activ freezeControls(0);
	}
	else
	{
		level.activ takeallweapons();
		level.activ freezeControls(1);
		player freezeControls(1);

		player setOrigin(o_winner.origin);
		player setPlayerangles(o_winner.angles);
		level.activ setOrigin( o_loser.origin );
		level.activ setPlayerangles( o_loser.angles );


		level.activ iprintlnbold("^5You ^1lost!");

		player giveWeapon("moonsday_huntsman_mp");
		player switchToWeapon("moonsday_huntsman_mp");
		player iprintlnbold("^5You Won!");
		player SetClientDVAR("cg_thirdperson", 0);
		level.activ SetClientDVAR("cg_thirdperson", 0);
		wait 2.5;
		player freezeControls(0);
	}
}

ss_game(player)
{
	level.pro = "x";
	black = getent("ss_ss_black", "targetname");
	white = getent("ss_ss_white", "targetname");
	blue = getent("ss_ss_blue", "targetname");
	cyan = getent("ss_ss_cyan", "targetname");
	yellow = getent("ss_ss_yellow", "targetname");
	red1 = getent("ss_ss_red", "targetname");
	green1 = getent("ss_ss_green", "targetname");
	pink = getent("ss_ss_pink", "targetname");
	orange = getent("ss_ss_orange", "targetname");

	ss_black = getent("ss_black", "targetname");
	ss_white = getent("ss_white", "targetname");
	ss_blue = getent("ss_blue", "targetname");
	ss_cyan = getent("ss_cyan", "targetname");
	ss_yellow = getent("ss_yellow", "targetname");
	ss_red1 = getent("ss_red", "targetname");
	ss_green1 = getent("ss_green", "targetname");
	ss_pink = getent("ss_pink", "targetname");
	ss_orange = getent("ss_orange", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1)
	{
		black hide();
		white hide();
		blue hide();
		cyan hide();
		yellow hide();
		red1 hide();
		green1 hide();
		pink hide();
		orange hide();

		colour = randomint(9);
		if (colour == 0)
		{
			hide = ss_black;
			level.wall = black;
			black show();
		}
		if (colour == 1)
		{
			hide = ss_white;
			white show();
			level.wall = white;
		}
		if (colour == 2)
		{
			hide = ss_blue;
			blue show();
			level.wall = blue;
		}
		if (colour == 3)
		{
			hide = ss_cyan;
			cyan show();
			level.wall = cyan;
		}
		if (colour == 4)
		{
			hide = ss_red1;
			red1 show();
			level.wall = red1;
		}
		if (colour == 5)
		{
			hide = ss_green1;
			green1 show();
			level.wall = green1;
		}
		if (colour == 6)
		{
			hide = ss_yellow;
			yellow show();
			level.wall = yellow;
		}
		if (colour == 7)
		{
			hide = ss_pink;
			pink show();
			level.wall = pink;
		}
		if (colour == 8)
		{
			hide = ss_orange;
			orange show();
			level.wall = orange;
		}

		wait(length);

		ss_black hide();
		ss_white hide();
		ss_blue hide();
		ss_cyan hide();
		ss_yellow hide();
		ss_red1 hide();
		ss_green1 hide();
		ss_pink hide();
		ss_orange hide();

		ss_black notsolid();
		ss_white notsolid();
		ss_blue notsolid();
		ss_cyan notsolid();
		ss_yellow notsolid();
		ss_red1 notsolid();
		ss_green1 notsolid();
		ss_pink notsolid();
		ss_orange notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

		ss_black show();
		ss_white show();
		ss_blue show();
		ss_cyan show();
		ss_yellow show();
		ss_red1 show();
		ss_green1 show();
		ss_pink show();
		ss_orange show();

		ss_black solid();
		ss_white solid();
		ss_blue solid();
		ss_cyan solid();
		ss_yellow solid();
		ss_red1 solid();
		ss_green1 solid();
		ss_pink solid();
		ss_orange solid();

		time += 1;
		length -= 0.25;

		if(time == 14 && isAlive(player))
		{

			player iprintlnbold("^5You  got a knife as game went too long");
			level.activ iprintlnbold("^5You got a knife as game went too long");
			player giveWeapon("moonsday_huntsman_mp");
			level.activ giveWeapon("moonsday_huntsman_mp");
			player switchToWeapon("moonsday_huntsman_mp");
			level.activ switchToWeapon("moonsday_huntsman_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}