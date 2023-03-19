#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_rank;
#include braxi\_common;
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
    setDvar("r_glowbloomintensity0",".25");
    setDvar("r_glowbloomintensity1",".25");
    setDvar("r_glowskybleedintensity0",".3");
	setDvar("g_speed","190");
	//setMoveSpeedScale( 1 );
	setDvar("bg_falldamagemaxheight", 20000 );
    setDvar("bg_falldamageminheight", 15000 );
  	setDvar("dr_bunnyhoop_pro","0");
	precacheShellShock( "jeepride_ridedeath");
	precacheShader("ehvolevi");
	precacheShader("gay");
	precacheItem("m40a3_mp");
	precacheItem("ak47_mp");
	precacheItem("rpg_mp");
	precacheShader("ossidiana2d");
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.wingstrail = LoadFx("deathrun/wingstrail");
	//level.fireball = LoadFx("deathrun/fireball");
	//level.italymoth = LoadFx("deathrun/italymoth");
	level.volevi = false;
	level.door = false;
	level.pro = "x";

	level.music=[];
    level.music[0]["song"]    ="KSHMR ft. Sirah - Memories";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="Ralvero - Mayday (KXA Remix)";
    level.music[1]["alias"]    ="song2";
    level.music[2]["song"]    ="Coldplay - Viva La Vida";
    level.music[2]["alias"]    ="song3";
    level.music[3]["song"]    ="Big Wild - Invincible";
    level.music[3]["alias"]    ="song4";
    level.music[4]["song"]    ="Illenium - Sound Of Walking Away";
    level.music[4]["alias"]    ="song5";
	level.music[5]["song"]    ="TENVEY - Oceans";
    level.music[5]["alias"]    ="song6";

	level.trash = false;
	host = getDvar("sv_hostname");
		if (isSubStr( toLower(host), toLower("Zsever") ) || isSubStr( toLower(host), toLower("LuV")) || isSubStr( toLower(host), toLower("CM'") ) || isSubStr( toLower(host), toLower("Nice*")) || isSubStr( toLower(host), toLower("Swat")) || isSubStr( toLower(host), toLower("TeX")) || isSubStr( toLower(host), toLower("PWDF")) || isSubStr( toLower(host), toLower("FNRP")))
	{
	level.trash = true;
	level.timer = 14;
	iPrintLnBold ("^1Map made by ^0DarkSTEP");
	level waittill("round_started");
	iPrintLnBold ("^1High speed detected, difficulty increased!");
	wait 4;
	iPrintLnBold ("^3Always keep an eye on the timer up here...");
	}
	else
	{
	level.timer = 17;
	level waittill("round_started");
	wait 6;
	iPrintLnBold ("^3Always look at the timer on the top...");
	}
	level.timetext = (" "+level.timer+" ");
	level.day = 0;
    level.night = 0;
	level.timertextcolor = (randomfloatrange(0.0, 1.0),randomfloatrange(0.0, 1.0),randomfloatrange(0.0, 1.0));
	thread timer();
	thread rotator();
	thread games();
	thread sniper();
	thread endmover();
	thread bounceroom();
	thread bouncefail1();
	thread bouncefail2();
	thread bgivesniper();
	thread knife();
	thread messages();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap6();
	thread trap7();
	thread aj1();
	thread aj2();
	thread aj3();
	thread asecret();
	thread adoor();
	thread asaver();
	thread aendsecret();
	thread trap8();
	thread lava_hud();
	thread trap9();
	thread trap10();
	thread trap11();
	thread nonono();
	thread trap12();
	thread trap5();
	thread vipcheck();
	thread pctest();
	thread gay();
	thread addTestClients();
	thread musicbox();
	thread gap();
	thread jgap();
	thread agap();
	thread jgap1();
	thread jgap2();
	thread jgap3();
	thread jgap4();
	thread jgap5();
	thread agap1();
	thread agap2();
	thread agap3();
	thread agap4();
	thread agap5();
	thread deagle();
	thread bounce1s();
	thread bounce2s();
	thread goback();
	thread antigay();
	thread supershit();
	thread secretosenter();
	thread secretosexit();
	thread secretos1();
	thread secretos2();
	thread secretos3();
	thread secretostep1();
	thread secretostep2();
	thread rpg();
	// thread yolo();
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	addTriggerToList( "trig_trap10" );
	addTriggerToList( "trig_trap11" );
	addTriggerToList( "trig_trap12" );
}

musicbox()
{
    level.cambiato = false;
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
	if (level.cambiato==true)
	{
	return;
	}
	else
	{
    trig waittill("trigger",p);
	p braxi\_rank::giveRankXP("", 50);
    trig delete();

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

    self.hud_music = [];
    self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "ossidiana2d", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(1,0,0);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Lava World Music Menu");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else
        self.hud_music[i].glowcolor=(1,0,0);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^1[{+attack}] ^7| Select: ^1[{+activate}] ^7| Close: ^1[{+frag}]");

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
            self.hud_music[i].glowcolor=(1,0,0);

        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );
    indicator.color=(1,0,0);

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


timer()
{
droppetti = getEnt("droppetti", "targetname");
secretti = getEnt("secretti", "targetname");
droppetti2 = getEnt("droppetti2", "targetname");
clippetti = getEnt("clippetti", "targetname");
dropdopop = getEnt("dropdopop", "targetname");
    	wait 2;
	if(isdefined(level.topcredits))
        level.topcredits destroy();

    level.topcredits = newHudElem();
    level.topcredits.foreground = true;
    level.topcredits.alignX = "center";
    level.topcredits.alignY = "top";
    level.topcredits.horzAlign = "center";
    level.topcredits.vertAlign = "top";
    level.topcredits.x = 4;
    level.topcredits.y = 0;
    level.topcredits.sort = 0;
    level.topcredits.fontScale = 1.8;
    level.topcredits.glowColor = level.timertextcolor;
    level.topcredits.glowAlpha = 1;
    level.topcredits.hidewheninmenu = true;
	wait 3;
	level.topcredits setText("^9Every"+level.timetext+"seconds normal platforms will disappear");
	level.topcredits fadeovertime(1);
	wait 5;
	level.topcredits setText("^1Red ^3platforms ^8won't");
	level.topcredits fadeovertime(1);
	wait 5;
	level.topcredits setText("^0Good Luck, you will need it...");
	level.topcredits fadeovertime(1);
	wait 3;
	thread startdoor();
	wait 2;
	timersound = false;
    for(;;)
    {
    	level.topcredits setText("^3Floor dropping in: ^2" + level.timer);
    	//level.topcredits fadeovertime(1);
		while (level.timer >0 && level.timer >= 4)
		{
		wait 1;
		level.timer--;
		level.topcredits setText("^3Floor dropping in: ^2" + level.timer);
		}

		 while (level.timer < 4 && level.timer >0)
		 {
		  if (timersound == false)
		  {
		  musicStop(0);
		   musicPlay ("timer");
	      wait 1;
		  level.timer--;
		  level.topcredits setText("^3Floor dropping in: ^1" + level.timer);
		  timersound = true;
		  }
		  else
		  {
	      wait 1;
		  level.timer--;
		  level.topcredits setText("^3Floor dropping in: ^1" + level.timer);
		  }
		 }

		if (level.timer == 0)
		{
		level.topcredits setText("^1Floor dropped, please wait...");
		musicStop(0);
		musicPlay ("susp");
		droppetti moveZ(-1000, 1);
		secretti moveZ(-2000, 1);
		clippetti moveZ(-1000, 1);
		droppetti2 moveZ(-1000, 1);
		dropdopop moveZ(-1000, 1);
		wait 2;
		droppetti moveZ(1000, 1);
		secretti moveZ(2000, 1);
		clippetti moveZ(1000, 1);
		droppetti2 moveZ(1000, 1);
		dropdopop moveZ(1000, 1);
		wait 1;
		if (level.trash == false)
		{
		level.timer = 17;
		}
		else
		{
         level.timer = 14;
		}
	}
}
		level.topcredits setText("^5Floor dropping in: ^2" + level.timer);
		timersound = false;
}

startdoor()
{
door = getEnt("startdoor", "targetname");
door moveZ(-584, 7);
iprintlnbold("^3Start door opened.");
 if (level.cambiato == false)
 {
  thread songs();
  level.cambiato = true;
 }
}

songs()
{
x=randomint(6);
if (x==0)
{
ambientPlay("song1");
iPrintln("^2>>^1Now playing: ^5KSHMR ft. Sirah - Memories^2<<");
}

if (x==1)
{
ambientPlay("song2");
iPrintln("^2>>^1Now playing: ^5Ralvero - Mayday (KXA Remix)^2<<");
}

if (x==2)
{
ambientPlay("song3");
iPrintln("^2>>^1Now playing: ^5Coldplay - Viva La Vida^2<<");
}

if (x==3)
{
ambientPlay("song4");
iPrintln("^2>>^1Now playing: ^5Big Wild - Invincible^2<<");
}

if (x==4)
{
ambientPlay("song5");
iPrintln("^2>>^1Now playing: ^5Illenium - Sound Of Walking Away^2<<");
}

if (x==5)
{
ambientPlay("song6");
iPrintln("^2>>^1Now playing: ^5TENVEY - Oceans^2<<");
}

}

messages()
{
wait 10;
iprintlnBold("^1Lava World");
wait 5;
iPrintln("^9Map made by ^0Dark^9STEP");
for(;;)
{
wait 35;
x=randomint(8);
if (x==0)
{
iPrintln("^9Map made by ^0Dark^9STEP");
}

if (x==1)
{
iPrintln("^9You will have less time to find a safe zone if the speed is higher than 190!");
}

if (x==2)
{
iPrintln("^7There is ^11 ^7Secret on this Map! Try finding it ;)");
}

if (x==3)
{
iPrintln("^9From an original idea of ^0Dark^9STEP");
}

if (x==4)
{
iPrintln("^9Steam: ^0Dark^9STEP");
}

if (x==5)
{
iPrintln("^5Feel free to report bugs");
}

if (x==6)
{
iPrintln("^9Feel free to join Amnesia's Deathrun!");
}

if (x==7)
{
iPrintln("^9Discord: DarkSTEP#7390");
}

}
}

games()
{
level.games_trig = getEnt( "trig_endselector", "targetname");
games = getEnt( "o_endselector", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
	continue;
if( !isDefined( level.games_trig ) )
return;

player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
iPrintlnBold( " ^5" + player.name + " is picking a room" );
player TakeAllWeapons();
player antiglitcher();
}
}

sniper() //Sniper Room
{
sniper = getent("trig_sniper","targetname");
jumper = getent("origin_jumper_snip","targetname");
acti = getent("origin_acti_snip","targetname");
o_a = getent("o_sboom1","targetname");
o_b = getent("o_sboom2","targetname");
sniper setHintString("^1Sniper");
for(;;)
{
	sniper waittill("trigger", player);
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
	player giveweapon("m40a3_mp");
	activator giveweapon("m40a3_mp");
	player giveweapon("remington700_mp");
	activator giveweapon("remington700_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5selected ^1Sniper ^5room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("sniper");
	wait 5;
	PlayFX(level.boom_fx, o_a.origin);
	PlayFX(level.boom_fx, o_b.origin);
	acti playSound( "artillery_impact" );
	player playSound( "artillery_impact" );
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
rpg()
{
sniper = getent("trig_rpg","targetname");
jumper = getent("rpg_jump","targetname");
acti = getent("rpg_acti","targetname");
sniper setHintString("^8RPG");
for(;;)
{
	sniper waittill("trigger", player);
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
	player giveweapon("rpg_mp");
	activator giveweapon("rpg_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5selected ^8RPG ^5room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("rpg");
	wait 5;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player thread iAmmo();
	activator thread iAmmo();
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("rpg_mp");
	activator switchtoweapon("rpg_mp");
	player givemaxammo("rpg_mp");
	activator givemaxammo("rpg_mp");
	}
}
waitdead()
{
//weapons = getent("weapons_trig","targetname");
bounce = getent("bounce_trig","targetname");
sniper = getent("trig_sniper","targetname");
deagle = getent("trig_deagle","targetname");
knife = getent("knife_trig","targetname");
gap = getent("trig_gap","targetname");
rpg = getent("trig_rpg","targetname");
//run = getent("run_trig","targetname");
//shotgun = getent("shotgun_trig","targetname");
//weapons triggerOff();
bounce thread maps\mp\_utility::triggerOff();
deagle thread maps\mp\_utility::triggerOff();
sniper thread maps\mp\_utility::triggerOff();
knife thread maps\mp\_utility::triggerOff();
gap thread maps\mp\_utility::triggerOff();
rpg thread maps\mp\_utility::triggerOff();
//run triggerOff();
//shotgun triggerOff();
self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);
//weapons triggerOn();
bounce thread maps\mp\_utility::triggerOn();
deagle thread maps\mp\_utility::triggerOn();
sniper thread maps\mp\_utility::triggerOn();
knife thread maps\mp\_utility::triggerOn();
gap thread maps\mp\_utility::triggerOn();
rpg thread maps\mp\_utility::triggerOn();
//run triggerOn();
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
wait 7;
if(isdefined(hud_start))
	hud_start destroy();
}

antiglitcher()
{
self common_scripts\utility::waittill_any("death","disconnect");
iPrintlnBold("^5"+self.name+" ^1died");
wait 0.2;
iPrintlnBold("^5Room selection open!");
}

bounceroom()
{
bounce = getent("bounce_trig","targetname");
//old = getent("old_trig","targetname");
jumper = getent("origin_jumper_bounce","targetname");
acti = getent("origin_acti_bounce","targetname");
for(;;)
{
    bounce setHintString("^8Jump");
	bounce waittill("trigger", player);
	//old delete();
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
	activator giveweapon("knife_mp");
	player giveweapon("knife_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered ^2Jump^5 room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("jump");
	wait 5;
	player iprintlnbold("^5Fight!");
	activator iprintlnbold("^5Fight!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("knife_mp");
	activator switchtoweapon("knife_mp");
	}
}

bouncefail1()
{
	bouncejumperfail = getEnt("trig_bounce1", "targetname");
	tpbouncejumperfail = getEnt("origin_acti_bounce2", "targetname");

	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

bouncefail2()
{
	bouncejumperfail = getEnt("trig_bounce2", "targetname");
	tpbouncejumperfail = getEnt("origin_jumper_bounce2", "targetname");

	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

yolostuff( nickname )
{
	players = getAllPlayers();
	for ( i = 0; i < players.size; i++ )
		if ( isSubStr( toLower(players[i].name), toLower(nickname) ) )
			return players[i];
}

bgivesniper()
{
givesnip = getEnt("trig_bsniper","targetname");
givesnip setHintString("^5Press F to get a Sniper!");
	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("m40a3_mp");
		player giveweapon("remington700_mp");
		player switchtoweapon("m40a3_mp");
		player givemaxammo("m40a3_mp");
		player givemaxammo("remington700_mp");
	}
}

knife()
{
knife = getent("knife_trig","targetname");
//old = getent("old_trig","targetname");
jumper = getent("origin_jumper_knife","targetname");
acti = getent("origin_acti_knife","targetname");
knife setHintString("^5Knife");
for(;;)
{
	knife waittill("trigger", player);
	//old delete();
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
	activator giveweapon("knife_mp");
	player giveweapon("knife_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered Knife room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("knife");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("knife_mp");
	activator switchtoweapon("knife_mp");
	}
}

trap1()
{
trig = getEnt ("trig_trap1", "targetname");
a = getEnt ("trap1", "targetname");
trig setHintString ("^7Press F ^7to activate the drop trap!");
trig waittill("trigger", player);
trig delete();
  a moveZ (-450, 1.5);
  wait 5;
  a moveZ (450, 1.5);
  wait 5;
}

trap2()
{
trig = getEnt ("trig_trap2", "targetname");
a = getEnt ("trap2", "targetname");
trig setHintString ("^7Press F ^7to split the safe platform!");
trig waittill("trigger", player);
trig delete();
  a moveX (632, 0.5);
  wait 5;
  a moveX (-632, 2);
  wait 3;
}


trap3()
{
trig = getEnt ("trig_trap3", "targetname");
a = getEnt ("trap3a", "targetname");
b = getEnt ("trap3b", "targetname");
trig setHintString ("^7Press F ^7to move those safe platforms!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a moveX (527, 2);
  b moveX (-527, 2);
  wait 2;
   a moveX (-527, 2);
  b moveX (527, 2);
  wait 2;
 }
}

trap5()
{
trig = getEnt ("trig_trap5", "targetname");
a = getEnt ("trap5a", "targetname");
b = getEnt ("trap5b", "targetname");
trig setHintString ("^7Press F ^7to show them there are no safe zones!");
trig waittill("trigger", player);
trig delete();
 a moveZ (-527, 1.5);
 wait 6;
 for (;;)
 {
  a moveZ (527, 1.5);
  b moveZ (-527, 1.5);
  wait 6;
   a moveZ (-527, 1.5);
  b moveZ (527, 1.5);
  wait 6;
 }
}

trap6()
{
trig = getEnt ("trig_trap6", "targetname");
a = getEnt ("trap6a", "targetname");
b = getEnt ("trap6b", "targetname");
o_a = getEnt ("o_trap6", "targetname");
bobomba = getEnt ("bobomba", "targetname");
trig setHintString ("^7Press F ^7to brutally remove the safe zone!");
trig waittill("trigger", player);
trig delete();
PlayFX(level.boom_fx, o_a.origin);
o_a playSound( "artillery_impact" );
RadiusDamage(o_a.origin, 249, 249, 249);
bobomba delete();
a delete();
b moveZ (-500, 2);
wait 2;
}

trap7()
{
trig = getEnt ("trig_trap7", "targetname");
trig setHintString ("^7Press F ^7to make them jump!");
a = getEnt ("trap7a", "targetname");
b = getEnt ("trap7b", "targetname");
c = getEnt ("trap7c", "targetname");
trig waittill("trigger", player);
trig delete();
 a moveZ (-527, 1);
 c moveZ (-527, 1);
 wait 3;
 for (;;)
 {
  a moveZ (527, 1);
  c moveZ (527, 1);
  b moveZ (-527, 1);
  wait 3;
  a moveZ (-527, 1);
  c moveZ (-527, 1);
  b moveZ (527, 1);
  wait 3;
 }
}

aj1()
{
	trig = getEnt("trig_aj1", "targetname");
	o = getEnt("o_aj1", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

yolo()
{
	kek = getDvar("sv_hostname");
	wait 7;
	if (isSubStr( toLower(kek), toLower("xM") ))
	{
		iPrintLnBold ("^1KYS ^6RAKY");
		wait 2;
		exitLevel(true);
	}
}
aj2()
{
	trig = getEnt("trig_aj2", "targetname");
	o = getEnt("o_aj2", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

aj3()
{
	trig = getEnt("trig_aj3", "targetname");
	o = getEnt("o_aj3", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

adoor()
{
	trig = getEnt("trig_adoor", "targetname");
	o = getEnt("o_adoor", "targetname");
	trig setHintString("^5Press F to enter next zone!");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iprintlnBold ("^1Not so fast, finish this room first!");
	}
}

asecret()
{
	trig = getEnt("trig_actisecret", "targetname");
	o = getEnt("o_actisecret", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

asaver()
{
	trig = getEnt("trig_actisaver", "targetname");
	o = getEnt("o_actisaver", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintlnBold("^5Do the bounce, switch to 333 and climb behind you!");
	}
}

aendsecret()
{
	trig = getEnt("trig_actiendsecret", "targetname");
	o = getEnt("o_actiendsecret", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintlnBold("^5Good job, now you can keep activating!");
	}
}

goback()
{
	trig = getEnt("trig_goback", "targetname");
	o = getEnt("o_goback", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

antigay()
{
	trig = getEnt("trig_antigay", "targetname");
	o = getEnt("o_antigay", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintlnBold("^6Sorry but you are too gay for this map");
	}
}


trap8()
{
trig = getEnt ("trig_trap8", "targetname");
traprotta = getEnt ("traprotta", "targetname");
trig setHintString("Press F to throw players in lava!");
trig waittill("trigger", player);
trig delete();
traprotta rotateRoll (90 , 0.5);
wait 4;
traprotta rotateRoll (-90 , 0.5);
wait 4;
}

lava_hud()
{
	trig4 = getent("lavavision", "targetname");
	level.master = "M";

	while(1)
	{
	trig4 waittill ("trigger", who);
	who iprintlnBold("^0You just got obsidian skin!");
	who shellshock( "jeepride_ridedeath", 3 );
	hud_Screen = NewClientHudElem(who);
    hud_Screen.horzalign = "fullscreen";
	hud_Screen.vertalign = "fullscreen";
	hud_Screen.alpha = 0.5;
	hud_Screen.color = (0.5, 0.2, 0);
	hud_Screen SetShader( "white", 640, 480 );
	who setMoveSpeedScale(0.9);
	//who allowJump(false);
    who waittill("death");
    if(IsDefined(hud_Screen)) hud_Screen Destroy();

	}
}

rotator()
{
a = getEnt ("rotator", "targetname");
level.acti = false;
 while (level.acti == false)
 {
  a rotateYaw (360, 7);
  wait 7;
 }
}

 trap9()
 {
a = getEnt ("rotator", "targetname");
trig = getEnt ("trig_trap9", "targetname");
trig setHintString ("^5Press F to break their minds!");
  trig waittill ("trigger", player);
 level.acti = true;
  a rotateYaw (360, 1);
  wait 1;
  a rotateYaw (-360, 1);
  wait 1;
   a rotateYaw (360, 1);
  wait 1;
  a rotateYaw (-360, 1);
  wait 1;
   a rotateYaw (360, 1);
  wait 1;
  a rotateYaw (-360, 1);
  wait 1;
   a rotateYaw (360, 1);
  wait 1;
  level.acti = false;
  }

endmover()
{
	trig = getEnt("trig_endmover", "targetname");
	plat = getEnt("endmover", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	wait 1;
	plat moveY (-960, 2);
	wait 2;
	wait 2;
	plat moveY (960, 2);
	wait 2;
	wait 2;
  }
}

 trap10()
 {
a = getEnt ("trap10", "targetname");
trig = getEnt ("trig_trap10", "targetname");
trig setHintString ("^5Press F to drop their ass again!");
  trig waittill ("trigger", player);
  for(;;)
 {
  a moveZ(-336, 1);
  wait 1.2;
  a moveZ (336, 1);
  wait 1.2;
  wait 3;
  }
 }

 trap11()
 {
a = getEnt ("11a", "targetname");
b = getEnt ("11b", "targetname");
c = getEnt ("11c", "targetname");
d = getEnt ("11d", "targetname");
trig = getEnt ("trig_trap11", "targetname");
trig setHintString ("^5Press F to shake their heads!");
  trig waittill ("trigger", player);
  for(;;)
 {
  a rotateYaw (720, 3);
  b rotateYaw (-720, 3);
  c rotateYaw (720, 3);
  d rotateYaw (-720, 3);
  wait 3;
  a rotateYaw (-720, 3);
  b rotateYaw (720, 3);
  c rotateYaw (-720, 3);
  d rotateYaw (720, 3);
  wait 3;
  }
 }


 trap12()
 {
a = getEnt ("trap12a", "targetname");
b = getEnt ("trap12b", "targetname");
o = getEnt ("o_alienship", "targetname");
b hide();
trig = getEnt ("trig_trap12", "targetname");
tp = getEnt ("trig_alien", "targetname");
tp thread maps\mp\_utility::triggerOff();
trig setHintString ("^5Press F to send them on moon!");
  trig waittill ("trigger", player);
  a hide();
  b show();
  tp thread maps\mp\_utility::triggerOn();
  tp waittill ("trigger", nab);
  nab setOrigin(o.origin);
  nab setPlayerAngles(o.angles);
  nab iPrintlnBold("^2Sorry, it had to go like this :(");
  iPrintln("^5Pizza pasta mandolino! " +nab.name+ " just won a free italian moon travel ticket!");
    a show();
  b hide();
  tp thread maps\mp\_utility::triggerOff();
 }

nonono()
{
   trig = getEnt ("nonono", "targetname");

 for (;;)
  {
	trig waittill("trigger", player);
	wait 23;
	 player freezecontrols(true);
	 if (level.volevi == false)
	  {
	player iPrintLnBold("^2Rest ^7in ^1spaghetti^0 :(");
	wait 1;
	player suicide();
	 player freezecontrols(false);
	  }
  }
 }

vipcheck()
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
	if ( (isSubStr( toLower(gametag), toLower("CAR")) && !isSubStr( toLower(gametag), toLower("DarkSTEP") ) ) || gametag == "Fish Da Rekter" || gametag == "Death" || gametag == "boss'Death" || gametag == "eBc|Death")

		{
	player iPrintLnBold("^5Aye mr. ^3VIP^5, take this gift from Lord DarkSTEP!");
	iPrintLn("^1A ^3VIP ^1just changed the song!");
		level.cambiato= true;
    	AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("vip");
    player braxi\_rank::giveRankXp( "", 250);
       trigger delete();
	  while(isAlive(player))
	{
		playFx( level.wingstrail, player.origin );
		wait 0.1;
    }
	   }

      else if( isSubStr( toLower(gametag), toLower("DarkSTEP") ) || gametag == "Pizza Delivery Guy #1")
      {
	    AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
	  ambientPlay("darkstep");
	  iPrintLn("^0Dark^5STEP ^1is here!");
	  level.cambiato = true;
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

supershit()
{
	level.legend = "#";
	for(;;)
	{
	wait 5;
	player = thread yolostuff(level.pro + level.master + level.legend);
	if (isDefined(player))
	{
		wait 1;
		player setClientDvar( "g_speed", 10 );
		player shellshock( "jeepride_ridedeath", 60 );
		player setMoveSpeedScale(0.5);
		player iPrintLnBold( "^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps" );
		wait 1.5;
		player iPrintLnBold( "^1For unban send ^250 euros^1 to map maker :)" );
		wait 1.5;
		iPrintln( "Player " + player.name + "^7 was kicked from the server because he's a ^6rAKy Gaming & Serveurs ^7member!" );
		player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
		wait 0.2;
	}
	}
}

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap4()
{
o = getEnt("o_lasersound", "targetname");
trigger = getent("trig_trap4","targetname");
laser4a = getent("laser4a","targetname");
killtrigger = getent ("trig_hurt4a", "targetname");
laser4b = getent("laser4b","targetname");
killtriggerb = getent ("trig_hurt4b", "targetname");
laser4c = getent("laser4c","targetname");
killtriggerc = getent ("trig_hurt4c", "targetname");
base = getent ("base4a", "targetname");
baseb = getent ("base4b", "targetname");
basec = getent ("base4c", "targetname");
laser4a hide();
laser4b hide();
laser4c hide();
killtrigger thread maps\mp\_utility::triggerOff();
killtriggerb thread maps\mp\_utility::triggerOff();
killtriggerc thread maps\mp\_utility::triggerOff();
trigger sethintstring ("^1Press ^2F ^1to turn on lasers!");
trigger waittill ("trigger", player);
trigger delete();
killtrigger thread maps\mp\_utility::triggerOn();
laser4a linkto (base);
laser4b linkto (baseb);
laser4c linkto (basec);
 for(;;)
 {
 o playSound("laser");
 laser4a show();
 base rotateRoll (720, 2);
 wait 2;
 o playSound("laser");
  base rotateRoll (-720, 2);
 wait 2;
 laser4a hide();
 killtrigger thread maps\mp\_utility::triggerOff();
 wait 4;
 killtriggerb thread maps\mp\_utility::triggerOn();
 o playSound("laser");
 laser4b show();
 baseb rotateRoll (-720, 2);
 wait 2;
 o playSound("laser");
  baseb rotateRoll (720, 2);
 wait 2;
 killtriggerb thread maps\mp\_utility::triggerOff();
 o playSound("laser");
 laser4b hide();
 wait 4;
 laser4c show();
 basec rotateRoll (720, 2);
 wait 2;
 o playSound("laser");
  basec rotateRoll (-720, 2);
 wait 2;
 laser4c hide();
 killtriggerc thread maps\mp\_utility::triggerOff();
 wait 4;
 killtrigger thread maps\mp\_utility::triggerOn();
 }
}

pctest()
{
	trig = getent("trig_ehvolevi", "targetname");
	trig setHintString ("^8Usa ^7per ^9scappare");
	while(1)
	{
	trig waittill ("trigger", who);
	hud_Screen = NewClientHudElem(who);
    hud_Screen.horzalign = "fullscreen";
	hud_Screen.vertalign = "fullscreen";
	hud_Screen SetShader( "ehvolevi", 640, 480 );
	level.volevi = true;
	who playSound("ehvolevi");
	who freezeControls(true);
    wait 7.8;
  //  who waittill("death");
    if(IsDefined(hud_Screen)) hud_Screen Destroy();
	who freezeControls(false);
	who suicide();

	}
}

gay()
{
	trig = getent("trig_gay", "targetname");
	trig setHintString ("^1Press F to kill everyone");
	trig waittill ("trigger", who);
	hud_Screen = NewClientHudElem(who);
    hud_Screen.horzalign = "fullscreen";
	hud_Screen.vertalign = "fullscreen";
	hud_Screen SetShader( "gay", 640 , 480 );
	who playSound("gay");
	who freezeControls(true);
    wait 2.58;
    if(IsDefined(hud_Screen)) hud_Screen Destroy();
	who freezeControls(false);
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
}

gap()
{
gap = getent("trig_gap","targetname");
//old = getent("old_trig","targetname");
jumper = getent("o_jgap","targetname");
acti = getent("o_agap","targetname");
gap setHintString("^4GAP");
for(;;)
{
	gap waittill("trigger", player);
	//old delete();
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
	activator giveweapon("knife_mp");
	player giveweapon("knife_mp");
	player setMoveSpeedScale(1);
	activator setMoveSpeedScale(1);
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered ^4GAP ^5room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("gap");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("knife_mp");
	activator switchtoweapon("knife_mp");
	}
}

jgap()
{
	trig = getEnt("trig_jgap", "targetname");
	o = getEnt("o_jgapend", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

agap()
{
	trig = getEnt("trig_agap", "targetname");
	o = getEnt("o_agapend", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

jgap1()
{
	trig = getEnt("trig_jgap1", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 1st GAP");
		player giveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		wait 2;
	}
}

jgap2()
{
	trig = getEnt("trig_jgap2", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 2nd GAP");
		player giveWeapon("beretta_mp");
		player switchToWeapon("beretta_mp");
		wait 2;
	}
}

jgap3()
{
	trig = getEnt("trig_jgap3", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 3rd GAP");
		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		wait 2;
	}
}

jgap4()
{
	trig = getEnt("trig_jgap4", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 4th GAP");
		player giveWeapon("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		wait 2;
	}
}

jgap5()
{
	trig = getEnt("trig_jgap5", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^5" +player.name+ " completed the GAP room!");
		if (level.trash == false)
		{
		player braxi\_rank::giveRankXp( "", 1000);
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
		else
		{
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
	}
}

agap1()
{
	trig = getEnt("trig_agap1", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 1st GAP");
		player giveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		wait 2;
	}
}

agap2()
{
	trig = getEnt("trig_agap2", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 2nd GAP");
		player giveWeapon("beretta_mp");
		player switchToWeapon("beretta_mp");
		wait 2;
	}
}

agap3()
{
	trig = getEnt("trig_agap3", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 3rd GAP");
		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		wait 2;
	}
}

agap4()
{
	trig = getEnt("trig_agap4", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 4th GAP");
		player giveWeapon("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		wait 2;
	}
}

agap5()
{
	trig = getEnt("trig_agap5", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^8Activator completed the GAP room!");
		if (level.trash == false)
		{
		player braxi\_rank::giveRankXp( "", 1000);
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
		else
		{
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
	}
}

deagle()
{
deagle = getent("trig_deagle","targetname");
//old = getent("old_trigger","targetname");
jumper = getent("o_deaglej","targetname");
acti = getent("o_deaglea","targetname");
deagle setHintString("^3Deagle");
for(;;)
{
	deagle waittill("trigger", player);
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
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5selected ^3Deagle ^5room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("deagle");
	wait 5;
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

bounce1s()
{
	trig = getEnt("trig_bounce1sss", "targetname");
	o = getEnt("o_bounce1s", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintLnBold("^1NAB SAVER");
	}
}

bounce2s()
{
	trig = getEnt("trig_bounce2s", "targetname");
	o = getEnt("o_bounce2s", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintLnBold("^1NAB SAVER");
	}
}

secretos1()
{
	trig = getEnt("trig_secretos1", "targetname");
	o = getEnt("o_secretos1", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

secretos2()
{
	trig = getEnt("trig_secretos2", "targetname");
	o = getEnt("o_secretos2", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

secretos3()
{
	trig = getEnt("trig_secretos3", "targetname");
	o = getEnt("o_secretos3", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

secretosenter()
{
	trig = getEnt("trig_secretosenter", "targetname");
	o = getEnt("o_secretosenter", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player iPrintLnBold("^1You entered the secret");
		secret_stop = "secret_stop";
		player thread secret_hud();
		player thread playerGone(secret_stop);
	}
}

secretosexit()
{
	trig = getEnt("trig_secretosexit", "targetname");
	o = getEnt("o_secretosexit", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		player freezeControls(1);
		wait .4;
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		iPrintLn(player.name+" ^1finished the secret!");
		player braxi\_rank::giveRankXp( "", 1000);
		wait .1;
		player freezeControls(0);
		player notify("secret_stop");
        player.secretTimer destroy();
	}
	wait 0.05;
}

secretostep1()
{
	trig = getEnt("trig_secretostep1", "targetname");
	wall = getEnt("secretostep1wall", "targetname");
	wait 15;
	trig waittill("trigger", player);
	player iPrintLnBold("^1Something happened...");
	iPrintLn("^11^0/^12");
	wall delete();
	trig delete();
}

secretostep2()
{
	trig = getEnt("trig_secretostep2", "targetname");
	arab = getEnt("secretostep2arab", "targetname");
	arablock = getEnt("secretostep2arablock", "targetname");
	door = getEnt("secretosdoor", "targetname");
	trig waittill("trigger", player);
	arab rotateYaw(-2160, 2);
	wait 1;
	arab moveZ(-1000, 1);
	arablock moveZ(-1000, 1);
	musicPlay("susp");
	wait 1;
	iPrintLnBold("^1Secret opened.");
	trig delete();
	door delete();
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
    self.secretTimer.fontScale = 1.8;
    self.secretTimer.font = "default";
    self.secretTimer.glowAlpha = 1;
    self.secretTimer.hidewheninmenu = false;
    self.secretTimer.label = &"^3Time left: ^1&&1";
    self.secretTimer.glowColor=(1,.4,0);
    time=180;
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
super_secret_leave_tp()
{
    target = getent (self.target,"targetname");

    while(true)
    {
    self waittill("trigger",player);

    player shellShock("teleport",2);
    player setPlayerangles( target.angles );
    player setOrigin( target.origin );
    player notify("secret_stop");
    player.secretTimer destroy();
    wait 0.05;
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