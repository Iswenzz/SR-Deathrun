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
// Map by ImJustBad, Design by SuX Lolz, Scripted by SuX Lolz

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
 maps\mp\_load::main();
 maps\mp\_compass::setupMiniMap("compass_map_mp_dr_caution");
 
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
	thread mapzor();
	thread messages();
	thread trapsetup();
	thread acti_tp();
	thread ele();
	thread lift();
	thread rooms();
	thread initMusic();
	thread credits();
	thread games();
	thread gay();
	thread secret();
	//THREAD*

	//PRECACHE**
	precacheitem ("m40a3_mp");
	precacheitem ("remington700_mp");
	precacheitem ("knife_mp");
	precacheitem ("tomahawk_mp");
	precacheitem ("uzi_silencer_mp");
	precacheItem ("ak74u_mp");
	precacheItem ("rpg_mp");
	precacheItem ("winchester1200_mp");
	precacheItem ("ak47_mp");
	precacheItem ("rpd_mp");
	precacheItem ("m1014_grip_mp");
	precacheItem ("deserteaglegold_mp");
	precacheItem ("p90_silencer_mp");
	precacheItem ("saw_grip_mp");
	//PRECACHE*

	//ACTI TRIGGER
	addTriggerToList( "trap_1_t" );
	addTriggerToList( "trap_2_t" );
	addTriggerToList( "trap_3_t" );
	addTriggerToList( "trap_4_t" );
	addTriggerToList( "trap_5_t" );
	addTriggerToList( "trap_6_t" );
	//ACTI TRIGGER
	
	visionSetNaked( "mp_dr_caution", 0 );

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

secret()
{
	thread end_tp();
}

end_tp()
{
	t = getent("secret_finish","targetname");
	o = getent("secret_ori","targetname");
	
	for(;;)
	{
		t waittill("trigger",p);
		p braxi\_rank::giveRankXP("", 600);
		iprintlnbold( p.name + " Finished the CJ Secret !");
		p setOrigin(o.origin);
		p setPlayerAngles(o.angles);
		p freezeControls(true);
		wait .1;
		p freezeControls(false);
	}
}

gay() 
{
	t = getEnt("jax_is_gay","targetname");
	
	t waittill("trigger");
	iprintlnbold("Jax is ^6gay <3 ImJustBad");
}

lift()
{
	b = getEnt("lift","targetname");
	
	level waittill("round_started");
	wait 3;
	iprintlnbold("^1Start door opened :]");
	b moveZ(-300, 4);
	wait 4;
	b delete();
}

ele()
{
	b = getEnt("ele_1_b","targetname");
	t = getEnt("ele_1_t_1","targetname");
	
	t waittill("trigger");
	
	while(1)
	{
		b moveZ(448, 5);
		wait 8;
		b moveZ(-448, 5);
		wait 8;
	}
}

acti_tp()
{
	thread a_tp_1();
	thread a_tp_2();
}

a_tp_1()
{
	t = getEnt("acti_tp_1_t","targetname");
	o = getEnt("acti_tp_1_o","targetname");

	for(;;)
	{
	t waittill("trigger",player);
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	player freezeControls(true);
	wait .1;
	player freezeControls(false);
	}
}

a_tp_2()
{
	t = getEnt("acti_tp_2_t","targetname");
	o = getEnt("acti_tp_2_o","targetname");

	for(;;)
	{
	t waittill("trigger",player);
	player setOrigin(o.origin);
	player setPlayerAngles(o.angles);
	player freezeControls(true);
	wait .1;
	player freezeControls(false);
	}
}

trapsetup()
{
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
}

trap1()
{
trig = getent("trap_1_t","targetname");
trig waittill("trigger" , user );

b1 = getent("trap_1_1","targetname");
b2 = getent("trap_1_2","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	random = randomint(2);
	
	if(random == 1)
	{
		b1 notsolid();
	}
	if(random != 1)
	{
		b2 notsolid();
	}
}

trap2()
{
trig = getent("trap_2_t","targetname");
trig waittill("trigger" , user );

b1 = getEnt("trap_2","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	while(1)
	{
		b1 rotateYaw(360, 4);
		wait 7;
	}
}

trap3()
{
trig = getent("trap_3_t","targetname");
trig waittill("trigger" , user );

b1_n = getEnt("trap_3_1_n","targetname");
b2_n = getEnt("trap_3_2_n","targetname");
b3_n = getEnt("trap_3_3_n","targetname");

b1_y = getEnt("trap_3_1_y","targetname");
b2_y = getEnt("trap_3_2_y","targetname");
b3_y = getEnt("trap_3_3_y","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	while(1)
	{
		b1_n rotateYaw(1440, 5);
		b2_n rotateYaw(1440, 5);
		b3_n rotateYaw(1440, 5);
		b1_y rotateYaw(1440, 5);
		b2_y rotateYaw(1440, 5);
		b3_y rotateYaw(1440, 5);
		wait 7.5;
	}
}

trap4()
{
trig = getent("trap_4_t","targetname");
trig waittill("trigger" , user );

b1 = getent("trap_4_1","targetname");
b2 = getent("trap_4_2","targetname");
b3 = getent("trap_4_3","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	while(1)
	{
		b1 rotatePitch(360, 2);
		wait 2;
		b2 rotatePitch(360, 2);
		wait 2;
		b3 rotatePitch(360, 2);
		wait 2;
	}
}

trap5()
{
trig = getent("trap_5_t","targetname");
trig waittill("trigger" , user );

b1 = getEnt("trap_5","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	b1 notsolid();
	wait 5;
	b1 solid();
}

trap6()
{
trig = getent("trap_6_t","targetname");
trig waittill("trigger" , user );

b_up = getent("trap_6_up","targetname");
b_down = getent("trap_6_down","targetname");

if(user.pers["team"] != "axis")
{
	wait 0.2;
}
else if(level.trapsdisabled)
{

}
else
trig delete();
user braxi\_rank::giveRankXP("", 150);
trig SetHintString("^2Activated");

	while(1)
	{
		b_up moveZ(100,1);
		b_down moveZ(-100,1);
		wait 1;
		b_up moveZ(-100,1);
		b_down moveZ(100,1);
		wait 1;
	}
}

messages()
{

while(1)
	{
		iPrintLn("Map Made by ^1ImJustBad^7 & ^5SuX Lolz");
		wait 4;
		iPrintLn("^5RvS' ^7Deathrun");
		wait 4;
		iPrintLn("Check out our website rvs-gmaing.tk");
		wait 4;
		iPrintLn("youtube.com/exoticchris");
		wait 4;
		iPrintLn("^1RIP ^2Raid-Gaming.");
		wait 4;
	}
}

mapzor()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "^5mp_dr_caution" );
wait(6);
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

	hud.color = (0.8, 1.0, 0.8);
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

credits()
{
        self endon( "disconnect" );
 
        if( isDefined( self.credits_text ) )
                self.credits_text Destroy();
 
        self.credits_text = newHudElem();
        self.credits_text.y = 10;
        self.credits_text.alignX = "center";
        self.credits_text.alignY = "middle";
        self.credits_text.horzAlign = "center";
 
        self.credits_text.alpha = 0;
        self.credits_text.sort = -3;
        self.credits_text.fontScale = 1.6;
        self.credits_text.archieved = true;
 
        {
                self credit_roll( "Map Made by ^1ImJustBad^7 & ^5SuX Lolz", 5 );
                self credit_roll( "^5RvS' ^7Deathrun", 5 );
                self credit_roll( "^1RIP ^2Raid-Gaming.", 3.5 );
				self credit_roll( "Check out our website rvs-gmaing.tk", 5);
				self credit_roll( "youtube.com/exoticchris", 5 );
        }
}

credit_roll( msg, time )
{
        self endon( "disconnect" );
 
        self.credits_text fadeOverTime(1);
        self.credits_text.alpha = 1;
        self.credits_text setText( msg );
        wait( time );
        self.credits_text fadeOverTime(1);
        self.credits_text.alpha = 0;
        wait 1;
}

initMusic()
{
	level waittill("round_started");
	
	random = randomint(4);
	wait 0.05;
	
	if(random == 0)
	{
		AmbientPlay("music1");
		iprintln("^5Now Playing: ^7Cyber Posix - Sun Kissed");
	}
	if(random == 1)
	{
		AmbientPlay("music2");
		iprintln("^5Now Playing: ^7Liquid Memoirs - Lucid");
	}
	if(random == 2)
	{
		AmbientPlay("music3");
		iprintln("^5Now Playing: ^7Changing Faces ft. Charli Brix - Everything Is Gone (Basik Remix)");
	}
	if(random == 3)
	{
		AmbientPlay("music4");
		iprintln("^5Now Playing: ^7Liquid Memoirs - Lucid");
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
wait 7;
if(isdefined(hud_start))
	hud_start destroy();
}

endtrigantibug(trig)
{
self common_scripts\utility::waittill_any("death","disconnect");
level.jatekosend = 0;
trig SetHintString("^1Press &&1 !..");
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

games()
{
level.games_trig = getEnt( "minigames", "targetname");
games = getEnt( "minigames_ori", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if( !isDefined( level.games_trig ) )
return;

player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
iPrintlnBold( " ^5" + player.name + " ^7has ^5entered ^7the ^5game ^7selection !^5!^7!" );
player TakeAllWeapons();
player antiglitch();


while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}
antiglitch()
{ 
self common_scripts\utility::waittill_any("death","disconnect");
iPrintlnBold("^5"+self.name+" ^7is ^5dead"); 
iPrintlnBold("^5Selection ^7Room ^5is ^5now ^7open^5!!"); 
}

waitdead()
{
old = getent("old_trig","targetname");
bounce = getent("bounce_trig","targetname");
sniper = getent("sniper_trig","targetname");

bounce triggerOff();
sniper triggerOff();
old delete();

self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);

bounce triggerOn();
sniper triggerOn();
}

rooms()
{
	thread sniper();
	thread sniper_respawn();
	thread old();
	thread bounce();
	thread bounce_respawn_acti();
	thread bounce_respawn_jumper();
	thread bounce_get_snip();
}

bounce_get_snip()
{
	givesnip = getent("bounce_getsnip","targetname");
	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("m40a3_mp");
		player giveweapon("deserteaglegold_mp");
		player switchtoweapon("m40a3_mp");
		player givemaxammo("m40a3_mp");
		player givemaxammo("deserteaglegold_mp");
	}
}

old()
{
	old = getent("old_trig","targetname");
	jumper = getent("old_ori","targetname");
	r = getent("old_lift","targetname");
	
	old waittill("trigger", player);
	player thread waitdead();
	level.activ.health=100;
	player.health=100;
	wait 0.5;
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	thread createhud(player.name + " ^1selected ^7OLD ^1way ^7!");
	wait 3;
	r delete();
}

sniper_respawn()
{
	t = getEnt("sniper_respawn","targetname");
	jumper = getent("sniper_jump","targetname");
	acti = getent("sniper_acti","targetname");

	while(1)
	{
		t waittill("trigger",player);
		random = randomint(2);
		if(random == 1)
		{
			player setOrigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
		}
		if(random != 1)
		{
			player setOrigin(acti.origin);
			player setPlayerAngles(acti.angles);
		}
	}
}

bounce_respawn_acti()
{
	a_t = getent("bounce_respawn_acti","targetname");
	a_o = getent("bounce_acti","targetname");

	for(;;)
	{
	a_t waittill("trigger",player);
	player setOrigin(a_o.origin);
	player setPlayerAngles(a_o.angles);
	player freezeControls(true);
	wait .05;
	player freezeControls(false);
	}
}

bounce_respawn_jumper()
{
	j_t = getent("bounce_respawn_jump","targetname");
	j_o = getent("bounce_jump","targetname");

	for(;;)
	{
	j_t waittill("trigger",player);
	player setOrigin(j_o.origin);
	player setPlayerAngles(j_o.angles);
	player freezeControls(true);
	wait .05;
	player freezeControls(false);
	}
}

bounce()
{
bounce = getent("bounce_trig","targetname");
jumper = getent("bounce_jump","targetname");
acti = getent("bounce_acti","targetname");
for(;;)
{
	bounce waittill("trigger", player);
	player thread waitdead();
	level.activ.health=100;
	player.health=100;
	wait 0.5;
	player takeallweapons();
	level.activ takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	level.activ freezeControls(true);
	level.activ setorigin(acti.origin);
	level.activ setPlayerAngles(acti.angles);
	level.activ giveweapon("knife_mp");
	player giveweapon("knife_mp");
	thread createhud(player.name + " ^1Selected ^7bounce ^1Room ^7!");
	wait 5;
	player iprintlnbold("GO^3!^7!^3!");
	level.activ iprintlnbold("GO^3!^7!^3!");
	player freezeControls(false);
	level.activ freezeControls(false);
	player switchtoweapon("knife_mp");
	level.activ switchtoweapon("knife_mp");
	}
}

sniper()
{
sniper = getent("sniper_trig","targetname");
jumper = getent("sniper_jump","targetname");
acti = getent("sniper_acti","targetname");
for(;;)
{
	sniper waittill("trigger", player);
	player thread waitdead();
	level.activ.health=100;
	player.health=100;
	wait 0.5;
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	level.activ freezeControls(true);
	level.activ setorigin(acti.origin);
	level.activ setPlayerAngles(acti.angles);
	player takeallweapons();
	level.activ takeallweapons();
	player giveweapon("m40a3_mp");
	level.activ giveweapon("m40a3_mp");
	player giveweapon("remington700_mp");
	level.activ giveweapon("remington700_mp");
	thread createhud(player.name + " ^1selected ^7snipah ^1war ^7!");
	wait 5;
	player iprintlnbold("^1FIGHT ^7!!!");
	level.activ iprintlnbold("^1FIGHT ^7!!!");
	player freezeControls(false);
	level.activ freezeControls(false);
	player switchtoweapon("m40a3_mp");
	level.activ switchtoweapon("m40a3_mp");
	player givemaxammo("m40a3_mp");
	level.activ givemaxammo("m40a3_mp");
	}
}

//END\\


