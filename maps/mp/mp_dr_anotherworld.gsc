//////////////////////\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//    __              ___                 \\//                                   ____    ____         \\
//   /\ \            /\_ \                \\//         __                       /\  _`\ /\  _`\       \\
//   \ \ \        ___\//\ \    ____       \\//    ____/\_\   __  _  ____     ___\ \ \L\ \ \ \L\ \     \\
//    \ \ \  __  / __`\\ \ \  /\_ ,`\     \\//   /',__\/\ \ /\ \/'\/\_ ,`\  / __`\ \ ,  /\ \ ,  /     \\
//     \ \ \L\ \/\ \L\ \\_\ \_\/_/  /_    \\//  /\__, `\ \ \\/>  </\/_/  /_/\ \L\ \ \ \\ \\ \ \\ \    \\
//      \ \____/\ \____//\____\ /\____\   \\//  \/\____/\ \_\/\_/\_\ /\____\ \____/\ \_\ \_\ \_\ \_\  \\
//       \/___/  \/___/ \/____/ \/____/   \\//   \/___/  \/_/\//\/_/ \/____/\/___/  \/_/\/ /\/_/\/ /  \\
// 								          \\// 								                          \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\//////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
				 //////////////////////////\////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
				 //  Map by 'sixzoRR (edited by Lolz) | Scripted by Lolz / 'sixzoRR  \\
				 //                  All textures & Skybox by Lolz                   \\
				 //                     'sixzoRR Skype: dinac777                     \\
				 //               Lolz Steam: iswenzz1528 / SuX Lolz :]              \\
				 ///////////////////////////////////\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\   
					  
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
 maps\mp\_load::main();
 maps\mp\_teleport::main();
	
 level._effect[ "firepartic" ] = loadfx( "fire/custom_fire_r" );
	
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
	thread guidchecking();
	thread mapzor();
	thread messages();
	thread lift();
	thread fireparticles();
	thread music();
	thread startdoor();
	thread secret1();
	thread mapper();
	thread mrotate();
	thread credits();
	thread sniperactifail();
	thread end();
	thread games();
	thread sniper();
	thread bounce();
	thread deagle();
	thread bounceactifail();
	thread bouncejumperfail();
	thread givesniper();
	thread run();
	thread runwaysetup();
	thread knife();
	thread shotgun();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	//THREAD*
	
	//PRECACHE**
	precacheitem ("m40a3_mp");
	precacheitem ("remington700_mp");
	precacheitem ("knife_mp");
	precacheitem ("raygun_mp");
	precacheitem ("intervention_mp");
	precacheitem ("tomahawk_mp");
	precacheItem ("m1014_grip_mp");
	precacheItem ("deserteaglegold_mp");
	precacheModel("shadow");
	precacheShader("mtl_shadow_fur");
	precacheShader("mtl_shadow_clothes");
	precacheShader("mtl_shadow_shoes");
	precacheShader("mtl_shadow_body");
	precacheShader("mtl_shadow_eyes");
	//PRECACHE*
	
	//ACTI TRIGGER
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
	//ACTI TRIGGER
	
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

end() //First D:
{
trigger = GetEnt( "end", "targetname" );
	{
	trigger waittill ("trigger", user);
		{
		iprintlnbold( "^7 " + user.name + " ^5Finished First^7!!");
		wait 0.1;
		}
	}
}

games() //Select Rooms
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
antiglitch() //ng1
{ 
self common_scripts\utility::waittill_any("death","disconnect");
iPrintlnBold("^5"+self.name+" ^7is ^5dead"); 
iPrintlnBold("^5Selection ^7Room ^5is ^5now ^7open^5!!"); 
}

waitdead() //ng2
{
deagle = getent("deagle_trig","targetname");
bounce = getent("bounce_trig","targetname");
sniper = getent("sniper_trig","targetname");
knife = getent("knife_trig","targetname");
run = getent("run_trig","targetname");
shotgun = getent("shotgun_trig","targetname");
deagle triggerOff();
bounce triggerOff();
sniper triggerOff();
knife triggerOff();
run triggerOff();
shotgun triggerOff();
self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);
deagle triggerOn();
shotgun triggerOn();
bounce triggerOn();
sniper triggerOn();
knife triggerOn();
run triggerOn();
}

sniper() //Sniper Room
{
sniper = getent("sniper_trig","targetname");
jumper = getent("origin_jumper_snip","targetname");
acti = getent("origin_acti_snip","targetname");
noobsnip = getEnt("trigger_noob_snip", "targetname");
for(;;)
{
	sniper waittill("trigger", player);
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
	player giveweapon("intervention_mp");
	activator giveweapon("intervention_mp");
	thread createhud(player.name + " ^5selected ^7snipah ^4war!");
	noobsnip triggerOn();
	wait 5;
	player iprintlnbold("^5FIGHT ^7!!!");
	activator iprintlnbold("^5FIGHT ^7!!!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("m40a3_mp");
	activator switchtoweapon("m40a3_mp");
	player switchtoweapon("intervention_mp");
	activator switchtoweapon("intervention_mp");
	player givemaxammo("m40a3_mp");
	activator givemaxammo("m40a3_mp");
	player givemaxammo("intervention_mp");
	activator givemaxammo("intervention_mp");
	}
}

sniperactifail()
{
	sniperactifail = getEnt("trigger_acti_fail_sniper", "targetname");
	tpsniperactifail = getEnt("origin_acti_snip", "targetname");
	
	for (;;)
	{
		sniperactifail waittill("trigger", player);
		player setOrigin(tpsniperactifail.origin);
		player setPlayerAngles(tpsniperactifail.angles);
	}
}

deagle() //deagle room :)
{
deagle = getent("deagle_trig","targetname");
jumper = getent("origin_jumper_deagle","targetname");
acti = getent("origin_acti_deagle","targetname");
for(;;)
{
	deagle waittill("trigger", player);
	player thread waitdead();
	thread createhud(player.name + " ^5Selected ^7Deagle ^5Room ^7!^5!^7!");
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	wait 5;
	IPrintLnbold("^2Fight!!!.");
	i = randomintrange(0, 8);
	player giveweapon("deserteaglegold_mp");
	player givemaxammo("deserteaglegold_mp");
	activator giveweapon("deserteaglegold_mp");
	activator givemaxammo("deserteaglegold_mp");
	wait .1;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("deserteaglegold_mp");
	activator switchtoweapon("deserteaglegold_mp");
	}
}

bounce() //bounce room :p
{
bounce = getent("bounce_trig","targetname");
jumper = getent("origin_jumper_bounce","targetname");
acti = getent("origin_acti_bounce","targetname");
for(;;)
{
	bounce waittill("trigger", player);
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
	thread createhud(player.name + " ^5Selected ^7bounce ^5Room ^7:]");
	wait 5;
	player iprintlnbold("^5GO^5!!!");
	activator iprintlnbold("^5GO^5!!!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("knife_mp");
	activator switchtoweapon("knife_mp");
	}
}

givesniper() //bounce room s
{
givesnip = getEnt("givesnip_trig","targetname");

	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("intervention_mp");
		player giveweapon("deserteaglegold_mp");
		player switchtoweapon("intervention_mp");
		player switchtoweapon("deserteaglegold_mp");
		player givemaxammo("intervention_mp");
		player givemaxammo("deserteaglegold_mp");
	}
}

bouncejumperfail() // when jumper fail in jump room
{
	bouncejumperfail = getEnt("trigger_respawnjumper_bounce", "targetname");
	tpbouncejumperfail = getEnt("origin_jumper_bounce", "targetname");
	
	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

bounceactifail() // when acti fail in jump room
{
	bounceactifail = getEnt("trigger_respawnacti_bounce", "targetname");
	tpbounceactifail = getEnt("origin_acti_bounce", "targetname");
	
	for (;;)
	{
		bounceactifail waittill("trigger", player);
		player setOrigin(tpbounceactifail.origin);
		player setPlayerAngles(tpbounceactifail.angles);
	}
}

run() //Speedrun room
{
run = getent("run_trig","targetname");
jumper = getent("origin_jumper_run","targetname");
acti = getent("origin_acti_run","targetname");
for(;;)
{
	run waittill("trigger", player);
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
	activator giveweapon("deserteaglegold_mp");
	player giveweapon("deserteaglegold_mp");
	thread createhud(player.name + " ^5Selected ^7spe^5ed ^7Ru^5n ^7Way !^5!^7!");
	wait 5;
	player iprintlnbold("^5GO^5!!!");
	activator iprintlnbold("^5GO^5!!!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("deserteaglegold_mp");
	activator switchtoweapon("deserteaglegold_mp");
	}
}

//RUNWAY\\

runwaysetup()
{

thread ifactiwin();
thread ifjumperwin();

}

ifactiwin() //defined who win*
{
tpactirun4 = getEnt("origin_acti_end_lvl4", "targetname");
tpjumperrun4 = getEnt("origin_jumper_end_lvl4", "targetname");
actiwinrun = getEnt("trigger_acti_win_run","targetname");
definedjumper = getEnt("trigger_jumper_test_run","targetname");

for (;;)
{
	definedjumper waittill("trigger", player);
	actiwinrun waittill("trigger", activator);
	activator = GetActivator();
	wait 0.2;
	activator setOrigin(tpactirun4.origin);
	activator setPlayerAngles(tpactirun4.angles);
	player setOrigin(tpjumperrun4.origin);
	player setPlayerAngles(tpjumperrun4.angles);
	wait 0.2;
	activator giveweapon("intervention_mp");
	activator givemaxammo("intervention_mp");
	activator switchtoweapon("intervention_mp");
	player freezeControls(true);
	player takeallweapons();
	wait 0.2;
}
}

ifjumperwin() // defined who win**
{
tpactirun4 = getEnt("origin_acti_end_lvl4", "targetname");
tpjumperrun4 = getEnt("origin_jumper_end_lvl4", "targetname");
jumperwinrun = getEnt("trigger_jumper_win_run","targetname");

for (;;)
{
	jumperwinrun waittill("trigger", player);
	activator = GetActivator();
	wait 0.2;
	player setOrigin(tpjumperrun4.origin);
	player setPlayerAngles(tpjumperrun4.angles);
	activator setOrigin(tpactirun4.origin);
	activator setPlayerAngles(tpactirun4.angles);
	wait 0.2;
	player giveweapon("intervention_mp");
	player givemaxammo("intervention_mp");
	player switchtoweapon("intervention_mp");
	activator freezeControls(true);
	activator takeallweapons();
	wait 0.2;
}
}

//RUNWAY\\

knife() //Knife room lel
{
knife = getent("knife_trig","targetname");
jumper = getent("origin_jumper_knife","targetname");
acti = getent("origin_acti_knife","targetname");
for(;;)
{
	knife waittill("trigger", player);
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
	activator giveweapon("tomahawk_mp");
	player giveweapon("tomahawk_mp");
	thread createhud(player.name + " ^5Selected ^7Knife ^5room^7!!");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("tomahawk_mp");
	activator switchtoweapon("tomahawk_mp");
	}
}

shotgun() //Shot.G room
{
shotgun = getent("shotgun_trig","targetname");
jumper = getent("origin_jumper_shotgun","targetname");
acti = getent("origin_acti_shotgun","targetname");
for(;;)
{
	shotgun waittill("trigger", player);
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
	activator giveweapon("m1014_grip_mp");
	player giveweapon("m1014_grip_mp");
	player givemaxammo("m1014_grip_mp");
	activator givemaxammo("m1014_grip_mp");
	thread createhud(player.name + " ^5Selected ^7Shotgun ^5room :^7D");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("m1014_grip_mp");
	activator switchtoweapon("m1014_grip_mp");
	}
}

guidchecking()
{
	wait 5.1;
	thread guidcheckgod1();
	thread guidcheckgod2();
	wait 0.2;
}

messages()
{
wait 1;

while(1)
	{
	
		iPrintLn("^1Report any bugs");
		wait 4;
		iPrintLn("^1'sixzoRR Skype: ^7dinac555");
		wait 1;
		iPrintLn("^1 Lolz Steam: ^7iswenzz1528 / SuX Lolz :]");
		wait 4;
		iPrintLn("^3Map Made By: ^5'sixzoRR");
		wait 4;
		iPrintLn("^3Script by : ^1'sixzoRR ^7| ^5SuX ^7Lolz :]");
		wait 4;
		iPrintLn("Texture by : ^5SuX ^7Lolz :]");
		wait 8;
	
	}
}

guidcheckgod1() //CHECK GOD GUID :]
{
god1 = "caa5eb5cf6bc6e1dadbcae1d5b7631e9";
sanictrig = getent("sanic_check","targetname");
for(;;)
	{
		sanictrig waittill ("trigger",user);
		tempGuid = user getGUID();
		if(tempGuid == god1)
		{
		user detachAll();
		user setModel("shadow");  //Model Here
		user GiveWeapon( "raygun_mp" );
		user GiveMaxAmmo( "raygun_mp" );
		iPrintLnBold(user.name + " ^7is ^2Connected ^7!!^^5:^7D");
		wait 3;
		}
			else
			{
			wait 3;
		}

	
}
}

guidcheckgod2() //CHECK GOD GUID2 :]
{
god1 = "0000000009c767d0333bd5b6b715e0763"; //'sixzoRR? (Keygen)
god2 = "000000009c767d0333bd5b6b715e0763"; //'sixzoRR? (Keygen)
sanictrig = getent("sanic_check_2","targetname");
for(;;)
	{
		sanictrig waittill ("trigger",user);
		tempGuid = user getGUID();
		if((tempGuid == god1) || (tempGuid == god2))
		{
		user detachAll();
		user setModel("shadow");  //Model Here
		user GiveWeapon( "raygun_mp" );
		iPrintLnBold(user.name + " ^7is ^2Connected ^7!!^^5:^7D");
		wait 3;
		}
			else
			{
			wait 3;
		}

	
}
}

mapzor()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "^5mp_dr_anotherworld" );
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
                self credit_roll( "^7Mapped by ^1'sixzoRR, ^7Scripted by ^1'sixzoRR ^7 & ^5SuX ^7Lolz :]", 5 );
                self credit_roll( "^7Texture by ^5SuX ^7Lolz :]", 5 );
                self credit_roll( "^7'sixzoRR Skype : dinac555 ", 5 );
				self credit_roll( "^7Lolz Steam: iswenzz1528 / SuX Lolz :]", 5);
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

mrotate()
{
rotate1 = getEnt("m_turn1", "targetname");
rotate2 = getEnt("m_turn2", "targetname");
rotate3 = getEnt("m_turn3", "targetname");

	while(1)
	{
	rotate1 rotateYaw(360, 4);
	rotate2 rotateYaw(-360, 4);
	rotate3 rotateYaw(360, 4);
	wait 3;
	}
}

fireparticles()
{
fire1 = getEnt("fx_fire1", "targetname");
fire2 = getEnt("fx_fire2", "targetname");
fire3 = getEnt("fx_fire3", "targetname");
fire4 = getEnt("fx_fire4", "targetname");
fire5 = getEnt("fx_fire5", "targetname");
fire6 = getEnt("fx_fire6", "targetname");
fire7 = getEnt("fx_fire7", "targetname");
fire8 = getEnt("fx_fire8", "targetname");
fire9 = getEnt("fx_fire9", "targetname");
fire10 = getEnt("fx_fire10", "targetname");
fire11 = getEnt("fx_fire11", "targetname");
fire12 = getEnt("fx_fire12", "targetname");
level._effect[ "firepartic" ] = loadfx( "fire/custom_fire_r" );
	
	while(1)
	{
	playFx(level._effect["firepartic"],fire1.origin);
	playFx(level._effect["firepartic"],fire2.origin);
	playFx(level._effect["firepartic"],fire3.origin);
	playFx(level._effect["firepartic"],fire4.origin);
	playFx(level._effect["firepartic"],fire5.origin);
	playFx(level._effect["firepartic"],fire6.origin);
	playFx(level._effect["firepartic"],fire7.origin);
	playFx(level._effect["firepartic"],fire8.origin);
	playFx(level._effect["firepartic"],fire9.origin);
	playFx(level._effect["firepartic"],fire10.origin);
	playFx(level._effect["firepartic"],fire11.origin);
	playFx(level._effect["firepartic"],fire12.origin);
	wait 1;
	}
}

lift()
{
elev4 = getent("lift","targetname");
trigger = getent("lift_trigger","targetname"); 
trigger waittill ("trigger", player );
trigger delete();
while(1)
{
elev4 moveY(400, 4, 1, 0);
elev4 waittill ("movedone");
wait 0.05;
elev4 moveY(7378, 3, 0, 1);
elev4 waittill ("movedone");
wait 2;
elev4 moveY(-7778, 2, 0.5, 0.5);
elev4 waittill ("movedone");
wait 3;
}
}

Music()
{
x = randomint(4);

	if(x == 0)
	{
	ambientplay("music1");
	iPrintLn("Music Name: ^3DJ Coone ft. Scope DJ ^7- ^2Traveling");
	}
	if(x == 1)
	{
	ambientplay("music2");
	iPrintLn("Music Name: ^3Major Lazer & DJ Snake ^7- ^2Lean On");
	}	
	if(x == 2)
	{
	ambientplay("music3");
	iPrintLn("Music Name: ^3Sia ^7- ^2Chandelier");
	}
	if(x == 3)
	{
	ambientplay("music4");
	iPrintLn("Music Name: ^3CMA ^7- ^2It Is What It Is");
	}
}

startdoor()
{
	door=getent("startdoor","targetname");
	wait 20;
	door delete();
}

secret1()
{
secret = getEnt("secret_1", "targetname");
trig = getEnt("startdoor3_trig", "targetname");

	{
	trig waittill("trigger", player);
	iPrintLnBold("^5Something Moved...");
	secret hide();
	secret notsolid();
	wait 0.2;
	}
}

mapper()
{
	object1 = getent("mapper","targetname");
       
     while(1)
    {
	    object1 rotateYaw(360, 4);
		wait 3;
    }
}

trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getent("trap1a","targetname");
	object2 = getent("trap1b","targetname");
	object3 = getent("trap1c","targetname");
	object4 = getent("trap1d","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateroll(360, 2);
		wait 2;
		object2 rotateroll(360, 2);
		wait 2;
		object3 rotateroll(360, 2);
		wait 2;
		object4 rotateroll(360, 2);
		wait 5;
		object1 rotateroll(360, 2);
		wait 2;
		object2 rotateroll(360, 2);
		wait 2;
		object3 rotateroll(360, 2);
		wait 2;
		object4 rotateroll(360, 2);
		wait 5;
    }
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    part1 = getEntArray("trap2_a","targetname");
	part2 = getEntArray("trap2_b","targetname");
	part3 = getEntArray("trap2_c","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
	random = randomint(3);
	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();
                break;
				
		case 2:	
				part3[randomInt(part3.size)] notsolid();
                break;
				
		default: return;
	}
}

trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getent("trap3","targetname");
	object2 = getent("trap3a","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateroll(360, 2);
		object2 rotateroll(360, 2);
		wait 2;
	}
}

trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
	object1 = getent("trap4","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(360, 5);
	}
}

trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getent("trap5","targetname");
	object2 = getent("trap5a","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateroll(-360, 5);
		object2 rotateYaw(360, 5);
		wait 10;
		object2 rotateroll(-360, 5);
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		object2 rotateYaw(360, 5);
		wait 10;
		object2 rotateroll(-360, 5);
		object1 rotateYaw(360, 5);
		wait 10;
	}
}

trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateYaw(360, 2);
		wait 5;
		object1 rotateYaw(360, 2);
		wait 5;
		object1 rotateYaw(360, 2);
		wait 5;
	}
}

trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
	object2 = getent("trap7a","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		object2 rotateYaw(-360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		object2 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		object2 rotateYaw(-360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		object2 rotateroll(360, 5);
		wait 10;
	}
}

trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getEnt( "trap8a", "targetname" );
	object2 = getEnt( "trap8b", "targetname" );

    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
 
    while(1)
    {
	object1 rotatePitch(360, 2);
	object2 rotatePitch(360, 2);
	wait 2;
    }
}

trap9()
{
    trig = getEnt( "trig_trap9", "targetname" );
    object1 = getEnt( "trap9a", "targetname" );
	object2 = getEnt( "trap9b", "targetname" );
	object3 = getEnt( "trap9c", "targetname" );

    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
 
    while(1)
    {
        object1 rotateroll(-360, 2);
		wait 2;
		object2 rotateYaw(360, 2);
		wait 2;
		object3 rotateroll(360, 2);
		wait 2;
		object1 rotateroll(360, 2);
		wait 2;
		object2 rotateYaw(360, 2);
		wait 2;
		object3 rotateroll(-360, 2);
		wait 2;
    }
}

trap10()
{
    trig = getEnt( "trig_trap10", "targetname" );
    object1 = getent("trap10","targetname");
	object2 = getent("trap10a","targetname");
 
    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		object2 rotateYaw(-360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		object2 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		object2 rotateYaw(-360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		object2 rotateroll(360, 5);
		wait 10;
	}
}

trap11()
{
    trig = getEnt( "trig_trap11", "targetname" );
    object1 = getEnt( "trap11a", "targetname" );
	object2 = getEnt( "trap11b", "targetname" );

    trig waittill ("trigger",user);
    trig delete();
	trig SetHintString("^2Activated");
	user braxi\_rank::giveRankXP("", 60);
 
    while(1)
    {
        object1 movez(170, 0.5);
		object2 movez(-170, 0.5);
        wait 1;
        object1 movez(-170, 0.5);
		object2 movez(170, 0.5);
        wait 1;
		object1 movez(170, 0.5);
		object2 movez(-170, 0.5);
        wait 1;
        object1 movez(-170, 0.5);
		object2 movez(170, 0.5);
        wait 1;
    }
}


//END\\
