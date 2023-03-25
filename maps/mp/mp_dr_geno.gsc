// /$$      /$$                           /$$
//| $$$    /$$$                          | $$
//| $$$$  /$$$$  /$$$$$$   /$$$$$$       | $$$$$$$  /$$   /$$
//| $$ $$/$$ $$ |____  $$ /$$__  $$      | $$__  $$| $$  | $$
//| $$  $$$| $$  /$$$$$$$| $$  \ $$      | $$  \ $$| $$  | $$
//| $$\  $ | $$ /$$__  $$| $$  | $$      | $$  | $$| $$  | $$
//| $$ \/  | $$|  $$$$$$$| $$$$$$$/      | $$$$$$$/|  $$$$$$$
//|__/     |__/ \_______/| $$____/       |_______/  \____  $$
//                       | $$                       /$$  | $$
//                       | $$                      |  $$$$$$/
//                       |__/                       \______/
//  /$$$$$$                                 /$$$$$$
// /$$__  $$                               /$$__  $$
//| $$  \__/  /$$$$$$  /$$$$$$$   /$$$$$$ | $$  \__/  /$$$$$$  /$$$$$$$
//| $$ /$$$$ /$$__  $$| $$__  $$ /$$__  $$|  $$$$$$  /$$__  $$| $$__  $$
//| $$|_  $$| $$$$$$$$| $$  \ $$| $$  \ $$ \____  $$| $$$$$$$$| $$  \ $$
//| $$  \ $$| $$_____/| $$  | $$| $$  | $$ /$$  \ $$| $$_____/| $$  | $$
//|  $$$$$$/|  $$$$$$$| $$  | $$|  $$$$$$/|  $$$$$$/|  $$$$$$$| $$  | $$
// \______/  \_______/|__/  |__/ \______/  \______/  \_______/|__/  |__/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

#include braxi\_common;
#include braxi\_dvar;

main() {
	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	// setdvar("g_speed" ,"210");
	// setdvar("dr_jumpers_speed" ,"1.12");

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	precacheItem( "rpg_mp" );
	precacheItem( "winchester1200_grip_mp" );
	precacheItem( "skorpion_silencer_mp" );
	precacheItem( "m4_reflex_mp" );
	precacheItem( "g36c_silencer_mp" );
	precacheItem( "ak47_reflex_mp" );
	precacheItem( "m14_acog_mp" );
	precacheItem( "deserteagle_mp" );

	//initTestClients(2);

	thread messages();
	thread startdoors();
	thread playSong(-1);
	thread initMusic();
	thread MusicTrig();
	thread wallrun();
	thread rotate_squares();
	acti_sec_wall = getEnt("glass_notsolid", "targetname");
	acti_sec_wall notSolid();
	if (isDefined(level.activ)) level.active.is_ghost = 0;

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
	thread trap12();
	thread trap13();
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
	addTriggerToList("trig_trap11");
	addTriggerToList("trig_trap12");
	addTriggerToList("trig_trap13");
	addTriggerToList("trig_hardmode");

	thread teleportTo("trig_elev", "ele_tp");
	thread teleportTo("endtrig_easy_sec", "endtele_too");
	thread teleportTo("trig_easy_endroom", "endtele_too");
	thread teleportTo("trig_hard_endroom", "endtele_too");
	thread teleportTo("trig_elevator_endroom", "endtele_too");
	thread teleportTo("trig_exp_endroom", "endtele_too");
	thread teleportTo("trig_acti", "tp_acti");
	thread teleportTo("trig_acti2", "acti_tp2");
	thread teleportTo("trig_acti_sec", "tp_acti3");
	thread teleportTo("acti_sec_floortrig", "tp_acti3");
	thread teleportTo("trig_acti_sec2", "tp_acti4");
	thread teleportTo("trig_bounce_acti", "bounce_activator");
	thread teleportTo("trig_bounce_jumper", "bounce_jumper");
	thread teleportTo("ss_failtrig", "ss_jumper");
	thread teleportTo("rotate_failtrig", "rotate_jumper");

	thread acti_picks_room();
	thread xp_secret();
	thread gay_secret();
	thread hardmode();

	thread secret_steps();
	thread combined_secret_way();
	thread easy_secret_checkpoints();
	thread experimental_way();

	thread games();
	thread room_simonsays();
	thread room_rotate();
	thread room_surf();
	thread bounce_weapon();
	thread createEndroom( "Sniper", "trig_sniper", "sniper_activator", "sniper_jumper", "m40a3_mp", "remington700_mp", 0, 7 );
	thread createEndroom( "RPG", "trig_rpg", "rpg_activator", "rpg_jumper", "rpg_mp", "none", 0, 2);
	thread createEndroom( "Bounce", "trig_bounce", "bounce_activator", "bounce_jumper", "knife_mp", "none", 0, 6 );
	thread createEndroom( "Knife", "trig_knife", "knife_activator", "knife_jumper", "knife_mp", "none", 0, 5 );
	thread createEndroom( "Weapon", "trig_slide_weapon", "slide_weapon_activator", "slide_weapon_jumper", "random", "none", 0, 3 );
	thread createEndroom( "Old", "trig_old", "acti_tp2", "old_jumper_tp", "deserteagle_mp", "none", 1, -1 );
}

// ------------------ //
// ----- Setup ----- //
// ------------------ //

createHud(messages) {
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

teleportTo(from, too){
	trigger = getEnt(from,"targetname");
	tp = getEnt(too, "targetname");

	while(1) {
		trigger waittill( "trigger", player );

		player SetOrigin( tp.origin );
		player setplayerangles( tp.angles );
	}
}

addTriggerToList( name ) {
     if( !isDefined( level.trapTriggers ) )
         level.trapTriggers = [];
     level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
 }

messages() {
	wait (10);
	thread createHud("^7Welcome to ^1mp_dr_geno");
	wait (7);
	thread createHud("^7Map by ^1GenoSen");
	wait (1);

	while(1) {
		iPrintLn("^1Please Report any bugs!");
		wait 4;
		iPrintLn("^1Discord: ^7GenoSen#6375");
		wait 1;
		iPrintLn("^1Steam: ^7GenoSen");
		wait 4;
		iPrintLn("^1My YouTube Channel: ^7GenoSen");
		wait 1;
		iPrintLn("https://www.youtube.com/channel/UCTW5JjbD_N0jEoeTlbEtxmg");
		wait 4;
		iPrintLn("^5Thanks to NitroFire for and others helping!");
		wait 4;
		iPrintLn("^1Map Made By: ^7GenoSen");
		wait 4;
		iPrintLn("^7There are ^13 Secret Ways^7, and ^16 Ways in total ^7on this map!\nTry and find them all!");
		wait 4;
		iPrintLn("As ^1activator ^7you can activate ^1Hardmode ^7by Knifing the red button!");
		wait 4;
		iPrintLn("If you are ^1Activator^7, try and find the ^1Secret Bounce Room!");
		wait 4;
		iPrintLn("^5Thanks to Boat and DuBCraft21 for helping make the hard/normal secret way!");
		wait 4;
		iPrintLn("^5Thanks to AtrX for porting Surf to Cod4!!");
		wait 4;
		iPrintLn("^5Finally, thank you for playing my map!! :)");
		wait 14;
	}
}

startdoors() {
	startdoor_1 = getent("startdoor1", "targetname");
	startdoor_2 = getent("startdoor2", "targetname");

	wait(24);

	thread createHud("^7Start Doors are now ^1Opening");
	startdoor_1 moveZ(-400, 5);
	startdoor_2 moveZ(-400, 5);
	wait (5);
	startdoor_1 hide();
	startdoor_2 hide();
}

acti_picks_room() {
	thread pick("req_snip", "Sniper");
	thread pick("req_bounce", "Bounce");
	thread pick("req_rotate", "Rotate");
	thread pick("req_slide", "Weapon");
	thread pick("req_knife", "Knife");
	thread pick("req_rpg", "Rpg");
	thread pick("req_old", "Old");
	thread pick("req_ss", "Simon Says");
}

pick(room, print) {
	trig1 = getent("req_snip", "targetname");
	trig2 = getent("req_knife", "targetname");
	trig3 = getent("req_bounce", "targetname");
	trig4 = getent("req_rotate", "targetname");
	trig5 = getent("req_old", "targetname");
	trig6 = getent("req_slide", "targetname");
	trig7 = getent("req_ss", "targetname");
	trig8 = getent("req_rpg", "targetname");

	selected_room = getent(room, "targetname");
	selected_room setHintString("^7Press ^1>^7Use^1<^7 to Request ^1" + print + " Room");
	selected_room waittill("trigger", player);

	trig1 delete();
	trig2 delete();
	trig3 delete();
	trig4 delete();
	trig5 delete();
	trig6 delete();
	trig7 delete();
	trig8 delete();

	iprintLnBold("^1Activator ^7Wants The Room ^1>> ^7[^6" + print + "^7]");
}

rotate_squares(){
	square1 = getEnt("hollow_square1", "targetname");
	square2 = getEnt("hollow_square2", "targetname");
	square3 = getEnt("hollow_square3", "targetname");
	square4 = getEnt("hollow_square4", "targetname");
	square5 = getEnt("hollow_square5", "targetname");
	square6 = getEnt("hollow_square6", "targetname");
	square7 = getEnt("hollow_square7", "targetname");
	square1 notSolid();
	square2 notSolid();
	square3 notSolid();
	square4 notSolid();
	square5 notSolid();
	square6 notSolid();
	square7 notSolid();

	while(1){
		square1 rotatePitch(360, 6);
		square2 rotatePitch(360, 6);
		square3 rotatePitch(360, 6);
		square4 rotatePitch(360, 6);
		square5 rotatePitch(360, 6);
		square6 rotatePitch(360, 6);
		square7 rotatePitch(360, 6);
		wait (6);
	}
}

// -------------------------//
// -------- Traps --------- //
// -------------------------//

hardmode() {
	trigger = getEnt("trig_hardmode", "targetname");
	button = getEnt("hardmode_button", "targetname");

	lasers = getEnt("hardmode_lasers", "targetname");
	killtrig = getEnt("hardmode_laser_kill", "targetname");
	source = getEnt("hardmode_laser_source", "targetname");
	lasers notSolid();
	lasers hide();
	source notSolid();
	source hide();
	killtrig triggerOff();

	trigger waittill("trigger", player);
	iprintlnbold("^1Activator ^7has activated ^1HARDMODE!");

	button moveX(5, 1);
	wait (1);
	button moveX(-5, 1);

	thread hm_circles();
	thread hm_platform1();
	thread hm_platform2();
	thread hm_lasers();
	thread hm_bounce();
	thread hm_water();
}

hm_circles() {
	circle1 = getEnt("hardmode_circle1", "targetname");
	circle2 = getEnt("hardmode_circle2", "targetname");
	circle3 = getEnt("hardmode_circle3", "targetname");

	for (;;) {
		circle1 rotateYaw(1080, 3);
		wait (3);
		circle2 rotateYaw(1080, 3);
		wait (3);
		circle3 rotateYaw(1080, 3);
		wait (3);
	}
}

hm_platform1() {
	plat = getEnt("hardmode_platform1", "targetname");

	plat rotateRoll(15, 2);
	wait (2);
	for (;;) {
		plat rotateRoll(-30, 2);
		wait (2);
		plat rotateRoll(30, 2);
		wait (2);
	}
}

hm_platform2() {
	plat = getEnt("hardmode_platform2", "targetname");
	for (;;) {
		plat moveY(64, .5);
		wait (.5);
		plat moveY(-64, .5);
		wait (.5);
	}
}

hm_lasers() {
	source = getEnt("hardmode_laser_source", "targetname");
	lasers = getEnt("hardmode_lasers", "targetname");
	killtrig = getEnt("hardmode_laser_kill", "targetname");
	killtrig triggerOn();
	killtrig enableLinkTo();
	killtrig linkTo(lasers);
	lasers show();
	source show();
	source solid();

	for (;;) {
		lasers moveY(1414, 2);
		source moveY(1414, 2);
		wait (4);
		lasers moveY(-1414, 2);
		source moveY(-1414, 2);
		wait (4);
	}
}

hm_bounce() {
	bounce = getent("hardmode_bounce1", "targetname");

	for(;;) {
		bounce rotatePitch(360, 1);
		wait 2;
	}
}

hm_water() {
	water = getEnt("hardmode_water", "targetname");
	trig = getEnt("hardmode_waterHurt", "targetname");
	trig2 = getEnt("water_dmg", "targetname");
	barrier1 = getEnt("water_barrier1", "targetname");
	barrier2 = getEnt("water_barrier2", "targetname");

	trig2 enableLinkTo();
	barrier1 enableLinkTo();
	barrier2 enableLinkTo();

	trig2 linkTo(water);
	barrier1 linkTo(water);
	barrier2 linkTo(water);

	thread waterFX();
	thread timer();
}

waterFX() {
	drown_waterage = getEnt("water_dmg", "targetname");
	if (isDefined("drown_waterage")) {
		precacheShader("black");
		precacheShader("white");

		level.barsize = 288;
		level.drown_watertime = 5;
		level.hurttime = 4;

		drown_waterage thread water();
	}
}

Water() {
	while (1) {
		self waittill("trigger", other);

		if(isPlayer(other) && other istouching(self))
			other thread drown_water(self);
	}
}

drown_water(trigger) {
	dceiling = getent(trigger.target,"targetname");
	water_vision = undefined;
	while (self istouching(trigger) && !self istouching(dceiling)) {
		wait .125;
		if(isDefined(self.drown_watering))
			return;
		self.drown_watering = true;

		if(!isDefined(water_vision)) {
			water_vision = newClientHudElem(self);
			water_vision.x = 0;
			water_vision.y = 0;
			water_vision setshader ("white", 640, 480);
			water_vision.alignX = "left";
			water_vision.alignY = "top";
			water_vision.horzAlign = "fullscreen";
			water_vision.vertAlign = "fullscreen";
			water_vision.color = (.16, .38, .5);
			water_vision.alpha = .75;
		}

		level.barincrement = (level.barsize / (20.0 * level.drown_watertime));
	//	level.player allowProne(false);
		if(!isDefined(self.progressbackground)) {
			self.progressbackground = newClientHudElem(self);
			self.progressbackground.alignX = "center";
			self.progressbackground.alignY = "middle";
			self.progressbackground.x = 320;
			self.progressbackground.y = 385;
			self.progressbackground.alpha = 0.5;
		}
		self.progressbackground setShader("black", (level.barsize + 4), 14);

		if(!isDefined(self.progressbar)) {
			self.progressbar = newClientHudElem(self);
			self.progressbar.alignX = "left";
			self.progressbar.alignY = "middle";
			self.progressbar.x = (320 - (level.barsize / 2.0));
			self.progressbar.y = 385;
		}
		self.progressbar setShader("white", 0, 8);
		self.progressbar scaleOverTime(level.drown_watertime, level.barsize, 8);

		self.progresstime = 0;
		d = 0;
		f = 0;

		while(isalive(self) && self istouching(trigger) && !self istouching(dceiling) && (self.progresstime < level.drown_watertime)) {
			d ++;
			f ++;

			wait 0.05;
			self.progresstime += 0.05;


			if(self.progresstime >= level.hurttime) {
				if(f >= 4) {
					radiusDamage(self.origin,9, 1, 1);
					f = 0;
				}
			}
		}

		if(isalive(self) && self istouching(trigger) && !self istouching(dceiling) && (self.progresstime >= level.drown_watertime)) {
			self.progressbackground destroy();
			self.progressbar destroy();

			wait 0.025;
			radiusDamage(self.origin,22, 3000, 3000);

			self.drown_watering = undefined;
			self.sounder = undefined;

			randb = randomInt(2);
			deathmethod1 = " Drowned";
			deathmethod2 = " That's water, It Kills.";
			deathmethod3 = " Swallowed Some Water";
			deathmethod4 = " That's water, It Kills.";

			if (randb == 0)
			iPrintLn( self.name, deathmethod1);
			if (randb == 1)
			iPrintLn( self.name, deathmethod2);
			if (randb == 2)
			iPrintLn( self.name, deathmethod3);
			if (randb == 3)
			iPrintLn( self.name, deathmethod4);
			wait .05;
			water_vision destroy();
		}
		else {
			water_vision.alpha = .5;
			water_vision fadeOverTime(3);
			water_vision.alpha = 0;
			wait 0.05;
			self.progressbackground destroy();
			self.progressbar destroy();
			self.drown_watering = undefined;
			self.sounder = undefined;
		}
		wait .05;
	}
}

timer() { // Timer from darkSTEPs LavaWorld Map
	water = getEnt("hardmode_water", "targetname");
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
    level.topcredits.fontScale = 1.5;
    level.topcredits.glowColor = level.timertextcolor;
    level.topcredits.glowAlpha = 1;
    level.topcredits.hidewheninmenu = true;

	timersound = false;
	level.timer = 14;

    for(;;) {
    	level.topcredits setText("^7Water rising in: ^2" + level.timer);
    	//level.topcredits fadeovertime(1);

		while (level.timer > 0 && level.timer >= 4) {
			wait 1;
			level.timer--;
			level.topcredits setText("^7Water rising in: ^2" + level.timer);
		}

		while (level.timer < 4 && level.timer >0) {
			if (timersound == false) {
				  //musicStop(0);
				  //musicPlay ("timer");
				  wait 1;
				  level.timer--;
				  level.topcredits setText("^7Water rising in: ^1" + level.timer);
				  //timersound = true;
			}

			else {
				  wait 1;
				  level.timer--;
				  level.topcredits setText("^7Water rising in: ^1" + level.timer);
			}
		}

		if (level.timer == 0) {
			level.topcredits setText("^1Water rising...");
			//musicStop(0);
			//musicPlay ("susp");

			water moveZ(310, 3);
			wait (14);
			water moveZ(-310, 3);
			wait (3);

			level.timer = 14;
		}
	}

	level.topcredits setText("^5Water Rising in: ^2" + level.timer);
	timersound = false;
}

trapPrint(statment){
	string = "^7Press ^1>^7Use^1<^7 to ^1" + statment;
	return string;
}

trap1(){
	bounce_left = getent("trap1_left", "targetname");
	bounce_right = getent("trap1_right", "targetname");
	trigger1 = getent("trig_trap1", "targetname");
	trigger1 SetHintString(trapPrint("split the bounce!"));
	trigger1 waittill("trigger", player);
	trigger1 delete();

	x = RandomInt( 2 );
	if( x == 0 ) {
		bounce_left delete();
	}

	if( x == 1 ) {
		bounce_right delete();
	}
}

trap2(){
	beam_first = getent("trap2_first", "targetname");
	beam_second = getent("trap2_second", "targetname");
	beam_third = getent("trap2_third", "targetname");

	trigger2 = getent("trig_trap2", "targetname");
	trigger2 SetHintString(trapPrint("rotate the brush!"));
	trigger2 waittill("trigger", player);
	trigger2 delete();

	while(1) {
		beam_first rotateRoll(360, 2);
		wait(2);
		beam_second rotateRoll(360, 2);
		wait(2);
		beam_third rotateRoll(360, 2);
		wait(2);
	}
}

trap3() {
	ladder_left = getent("trap3_left", "targetname");
	ladder_right = getent("trap3_right", "targetname");
	trigger3 = getent("trig_trap3", "targetname");
	trigger3 SetHintString(trapPrint("delete a random ladder!"));
	trigger3 waittill("trigger", player);
	trigger3 delete();

	x = RandomInt( 2 );
	if( x == 0 )
		ladder_left delete();
	if( x == 1 )
		ladder_right delete();
}

trap4() {
	bounce = getent("trap4", "targetname");
	trigger4 = getent("trig_trap4", "targetname");
	trigger4 SetHintString(trapPrint("rotate the bounce!"));
	trigger4 waittill("trigger", player);
	trigger4 delete();

	for(;;) {
		bounce rotatePitch(360, 1);
		wait 2;
	}
}

trap5() {
	white = getent("trap5_white", "targetname");
	red = getent("trap5_red", "targetname");
	trigger5 = getent("trig_trap5", "targetname");
	trigger5 SetHintString(trapPrint("move the pillars!"));
	trigger5 waittill("trigger", player);
	trigger5 delete();

	for(;;){
		white moveZ(-32, 1);
		red moveZ(32, 1);
		wait 2;
		red moveZ(-32, 1);
		white moveZ(32, 1);
		wait 2;
	}
}

trap6() {
	white = getent("trap6_white", "targetname");
	red = getent("trap6_red", "targetname");
	trigger6 = getent("trig_trap6", "targetname");
	trigger6 SetHintString(trapPrint("move the columns!"));
	trigger6 waittill("trigger", player);
	trigger6 delete();

	for(;;){
		white moveZ(64, 1);
		red moveZ(-64, 1);
		wait 2;
		white moveZ(-64, 1);
		red moveZ(64, 1);
		wait 2;
	}
}

trap7() {
	plat1 = getent("trap7_plat2", "targetname");
	plat2 = getent("trap7_plat1", "targetname");
	trigger7 = getent("trig_trap7", "targetname");
	trigger7 SetHintString(trapPrint("rotate the cylinders!"));
	trigger7 waittill("trigger", player);
	trigger7 delete();

	for(;;){
		plat1 rotatePitch(1080, 4);
		wait 4;
		plat2 rotatePitch(1080, 4);
		wait 4;
	}
}

trap8() {
	plat1 = getent("trap8_first", "targetname");
	plat2 = getent("trap8_second", "targetname");
	trigger8 = getent("trig_trap8", "targetname");
	trigger8 SetHintString(trapPrint("move the beams!"));
	trigger8 waittill("trigger", player);
	trigger8 delete();

	for(;;){
		plat1 moveZ(64, 1);
		wait 2;
		plat1 moveZ(-64, 1);
		plat2 moveZ(64, 1);
		wait 2;
		plat2 moveZ(-64, 1);
	}
}

trap9() {
	plat = getent("trap9", "targetname");
}

trap10(){
	plat1 = getent("wallruntest1", "targetname");
	plat2 = getent("wallruntest2", "targetname");
	trigger10 = getent("trig_trap10", "targetname");
	trigger10 SetHintString(trapPrint("hide the walls!"));
	trigger10 waittill("trigger", player);
	trigger10 delete();

	for(;;){
		plat1 hide();
		plat1 notsolid();
		wait 2;
		plat1 show();
		plat1 solid();

		plat2 hide();
		plat2 notsolid();
		wait 2;
		plat2 show();
		plat2 solid();
	}
}

trap11() {
	white = getent("trap11_white", "targetname");
	red = getent("trap11_red", "targetname");
	trigger11 = getent("trig_trap11", "targetname");
	trigger11 SetHintString(trapPrint("shake the platforms!"));
	trigger11 waittill("trigger", player);
	trigger11 delete();

		for(;;){
			red moveX(32, .5);
			white moveY(32, .5);
			wait (.5);
			red moveX(-32, .5);
			white moveY(-32, .5);
			wait (.5);
		}
}

trap12() {
	trigger12 = getent("trig_trap12", "targetname");
	trigger12 SetHintString(trapPrint("boobytrap a random pipe!"));
	trigger12 waittill("trigger", player);
	trigger12 delete();

	x = RandomInt(3);
	switch( int(x) ) {
		case 0:
	thread killer("trap12_pipe1");
		break;
		case 1:
	thread killer("trap12_pipe2");
		break;
		case 2:
	thread killer("trap12_pipe3");
		break;

		default:
			break;
	}
}

killer(threadelni) {
	killtrig = getent(threadelni, "targetname");
	while(1) {
		killtrig waittill( "trigger", who );
		wait .1;
		who suicide();
	}
}

trap13() {
	platform = getent("trap12_plat", "targetname");
	clip = getent("trap12_clip", "targetname");
	trigger13 = getent("trig_trap13", "targetname");
	trigger13 SetHintString(trapPrint("rotate the platform!"));
	trigger13 waittill("trigger", player);
	trigger13 delete();
	for(;;){
		platform rotateYaw(360, 1);
		clip rotateYaw(360, 1);
		wait(1);
	}
}

// ------------------------//
// ----- Endrooms ------ //
// ------------------------//

games() {
	door = getEnt("trig_enddoor", "targetname");
	tp = getEnt("endroom_jumper_tp", "targetname");

	while (1){
		door waittill( "trigger", player );
		level.room_selector = player;

		if (level.activ.is_ghost) {
			level.active show();
			level.active clientCmd("god");
			level.active.is_ghost = 0;
		}

		if( !isDefined( door ))
			return;

		player SetOrigin ( tp.origin );
		player SetPlayerAngles ( tp.angles );
		iPrintlnBold( " ^1" + player.name + "^7 is picking a room" );

		player TakeAllWeapons();
		player antiGlitcher();
	}
}

antiGlitcher()  {
	self common_scripts\utility::waittill_any("death","disconnect");
	iPrintlnBold("^7"+self.name+" ^1 has died");
	wait 0.2;
	iPrintlnBold("^7Room selection is ^1open!");

	self.canSurf = 0;
	level.activ.canSurf = 0;
}

doorsPrint(statment){
	return "^7Press ^1>^7Use^1<^7 for the ^1" + statment + " Room";
}

countdown(player){
	player iPrintlnBold(" ^1>>^73^1<<");
	level.activ iPrintlnBold(" ^1>>^73^1<<");
	wait 1;
	player iPrintlnBold(" ^1>>^72^1<<");
	level.activ iPrintlnBold(" ^1>>^72^1<<");
	wait 1;
	player iPrintlnBold(" ^1>>^71^1<<");
	level.activ iPrintlnBold(" ^1>>^71^1<<");
	wait 1;
	player iPrintlnBold(" ^1>>^7F^1ight^1<<");
	level.activ iPrintlnBold(" ^1>>^7F^1ight^1<<");

	player freezeControls(0);
	level.activ freezeControls(0);
}

refreshAmmo(weapon_name) {
	while(isalive(self)&&isdefined(self)) {
		self givemaxammo(weapon_name);
		wait 4;
	}
}

createEndroom( room_name, trigger_name, acti_tp_name, jumper_tp_name, weapon1, weapon2, old, song_number ) {
	room_trigger = getEnt(trigger_name, "targetname");
	activator_tp = getEnt(acti_tp_name, "targetname");
	jumper_tp = getEnt(jumper_tp_name, "targetname");

	while(1) {
		room_trigger setHintString(doorsPrint(room_name));
		room_trigger waittill("trigger", player);

		thread createHud( "^1" + player.name + " ^7has entered the ^1" + room_name + " Room^7!" );
		if (song_number >= 0) thread playSong( song_number );
		player freezeControls(1);
		level.activ freezeControls(1);
		wait(3);

		thread countDown( player );
		player SetOrigin( jumper_tp.origin );
		player setplayerangles( jumper_tp.angles );

		level.activ SetOrigin ( activator_tp.origin );
		level.activ setplayerangles ( activator_tp.angles );

		player.health = player.maxhealth;
        level.activ.health = level.activ.maxhealth;

		player TakeAllWeapons();
		level.activ TakeAllWeapons();

		for ( i = 0; i < 2; i++) {
			weapon_name = weapon1;
			if (i) {
				weapon_name = weapon2;
			}

			weapon = "knife_mp";
			if ( weapon_name == "none") {
				continue;
			}

			else if ( weapon_name == "random" ) {
				random_weapon = undefined;
				x = RandomInt( 51 );

				if( x < 10 )
					weapon = "winchester1200_grip_mp";
				if( x > 9 && x < 20 )
					weapon = "skorpion_silencer_mp";
				if( x > 20 && x < 30 )
					weapon = "m4_reflex_mp";
				if( x > 30 && x < 40 )
					weapon = "g36c_silencer_mp";
				if( x > 40 && x < 50 )
					weapon = "ak47_reflex_mp";
				if( x == 50 )
					weapon = "m14_acog_mp";
			}

			else {
				weapon = weapon_name;
			}

			player GiveWeapon( weapon );
			player switchToWeapon( weapon );
			player giveMaxAmmo( weapon );
			player thread refreshAmmo( weapon );

			if (!old) {
				level.activ GiveWeapon( weapon );
				level.activ switchToWeapon( weapon );
				level.activ givemaxammo( weapon );
				level.active thread refreshAmmo( weapon );
			}
		}
	}
}

room_rotate() {
	level.rotate_trigger = getEnt("trig_rotate","targetname");
	level.old_trigger = getEnt("oldroom","targetname");

	level.rotate_acti_tp = getEnt("rotate_activator", "targetname");
	level.rotate_jumper_tp = getEnt("rotate_jumper", "targetname");

	rotating_beam = getent("rotating_beam", "targetname");
	while(1) {

		level.rotate_trigger setHintString(doorsPrint("Rotating Room!"));
		level.rotate_trigger waittill( "trigger", player );
		level.firstenter = false;

		Ambientplay("song4");
		iprintln(">^1Song^7<");
		iprintln("Veorra ^1- ^7The City");

		player freezeControls(1);
		level.activ freezeControls(1);

		if( !isDefined( level.rotate_trigger ) )
			return;

		thread createHud(" ^7" + player.name + " ^1 has entered the Rotating room^7!" );
		wait 0.05;

		player SetOrigin( level.rotate_jumper_tp.origin );
		player setplayerangles( level.rotate_jumper_tp.angles );

		level.activ SetOrigin ( level.rotate_acti_tp.origin );
		level.activ setplayerangles ( level.rotate_acti_tp.angles );
		wait 1.5;

		player TakeAllWeapons();
		wait 0.05;

		player GiveWeapon( "knife_mp" );

		level.activ TakeAllWeapons();
		wait 0.05;

		level.activ GiveWeapon( "knife_mp" );
		wait 0.05;

		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );

		countdown(player);

		player freezeControls(0);
		level.activ freezeControls(0);

		level.winner = 0;
		thread rotating_beam_game(player);
		thread check_c(player);

		while( isAlive( player ) && isDefined( player ) )
		wait 0.1;
		level.cycle_on = 0;

		rotating_beam solid();
		rotating_beam show();
	}
}

rotating_beam_game(player) {
	rotating_beam = getent("rotating_beam", "targetname");
	time = 5;
	level.cycle_on = 1;

	while (level.cycle_on) {
		rotating_beam rotateYaw(360, time);
		wait time;
		time -= 0.50;
		if (time == 1){
			level.cycle_on = 0;
		}
	}

	rotating_beam hide();
	rotating_beam notsolid();
	wait (2);

	if (level.winner == 0) {
		wait 2;
		iPrintLnBold( "^7Both ^1Jumper ^7and ^1Activator ^7have survived the ^1Rotate Room!" );
		wait 0.5;

		random_weapon = "";
		x = RandomInt( 51 );

		if( x < 10 )
			random_weapon = "winchester1200_grip_mp";
		if( x > 9 && x < 20 )
			random_weapon = "skorpion_silencer_mp";
		if( x > 20 && x < 30 )
			random_weapon = "m4_reflex_mp";
		if( x > 30 && x < 40 )
			random_weapon = "g36c_silencer_mp";
		if( x > 40 && x < 50 )
			random_weapon = "ak47_reflex_mp";
		if( x == 50 )
			random_weapon = "m14_acog_mp";

		player GiveWeapon( random_weapon );
		level.activ GiveWeapon( random_weapon );
		player givemaxammo( random_weapon );
		level.activ givemaxammo( random_weapon );
		wait 0.05;

		player switchToWeapon( random_weapon );
		level.activ switchToWeapon( random_weapon );
	}
}

check_c(player) {
	level.rotate_acti_tp = getEnt("rotate_activator", "targetname");
	level.rotate_jumper_tp = getEnt("rotate_jumper", "targetname");
	trig = getent("c_lose", "targetname");
	trig waittill("trigger", loser);
	level.cycle_on = 0;

	if ( loser == player ) {
		level.winner = 1;
		player takeallweapons();
		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin( level.rotate_jumper_tp.origin );
		player setPlayerangles( level.rotate_jumper_tp.angles );
		level.activ setOrigin( level.rotate_acti_tp.origin );
		level.activ setPlayerangles( level.rotate_acti_tp.angles );

		player iprintlnbold("^1You ^7lost to the ^1Activator");

		level.activ giveWeapon("deserteagle_mp");
		level.activ switchToWeapon("deserteagle_mp");
		level.activ iprintlnbold("^1You Win! ^7now kill the ^1Jumper");
		wait 2.5;
		level.activ freezeControls(0);

	}
	else {
		level.winner = 2;
		level.activ takeallweapons();
		level.activ freezeControls(1);
		player freezeControls(1);

		player setOrigin( level.rotate_jumper_tp.origin );
		player setPlayerangles( level.rotate_jumper_tp.angles );
		level.activ setOrigin( level.rotate_acti_tp.origin );
		level.activ setPlayerangles( level.rotate_acti_tp.angles );

		level.activ iprintlnbold("^1You ^7lost to the ^1Jumper");

		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		player iprintlnbold("^1You Win! ^7now kill the ^1Activator");
		player SetClientDVAR("cg_thirdperson", 0);
		level.activ SetClientDVAR("cg_thirdperson", 0);
		wait 2.5;
		player freezeControls(0);
	}
}

room_simonsays() { // Simon Says Game Mode Scripted by Mewen
	level.ss_trigger = getent("trig_ss", "targetname");
	level.old_trigger = getEnt("oldroom","targetname");

	level.ss_acti_tp = getent("ss_activator", "targetname");
	level.ss_jumper_tp = getent("ss_jumper", "targetname");

	black = getent("ss_black", "targetname");
	brown = getent("ss_brown", "targetname");
	blue = getent("ss_blue", "targetname");
	blue2 = getent("ss_blue2", "targetname");
	yellow = getent("ss_yellow", "targetname");
	red1 = getent("ss_red", "targetname");
	green1 = getent("ss_green", "targetname");
	purple = getent("ss_purple", "targetname");
	orange = getent("ss_orange", "targetname");

	black hide();
	brown hide();
	blue hide();
	blue2 hide();
	yellow hide();
	red1 hide();
	green1 hide();
	purple hide();
	orange hide();

	while(1) {
		level.ss_trigger setHintString(doorsPrint("Simon Says Room!"));
		level.ss_trigger waittill( "trigger", player );
		level.firstenter = false;

		Ambientplay("song5");
		iprintln(">^1Song^7<");
		iprintln("Dua Lipa ^1- ^7New Rules (Alison Wonderland Remix)");

		player freezeControls(1);
		level.activ freezeControls(1);

		if( !isDefined( level.ss_trigger ) )
			return;

		thread createHud( " ^7" + player.name + " ^1 has entered the Simon Says room^7!" );
		wait 0.05;

		player SetOrigin( level.ss_jumper_tp.origin );
		player setplayerangles( level.ss_jumper_tp.angles );

		level.activ SetOrigin ( level.ss_acti_tp.origin );
		level.activ setplayerangles ( level.ss_acti_tp.angles );
		wait 1.5;

		player TakeAllWeapons();
		wait 0.05;

		level.activ TakeAllWeapons();
		wait 0.05;

		level.activ SetClientDVAR("cg_thirdperson", 1);
		player SetClientDVAR("cg_thirdperson", 1);

		countdown(player);

		player freezeControls(0);
		level.activ freezeControls(0);

		thread ss_game(player);
		thread ss_check(player);

		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;
	}
}

ss_check(player) {
	trig = getent("ss_lose", "targetname");
	trig waittill("trigger", loser);
	level.ss_on = 0;

	if ( loser == player ) {
		player takeallweapons();
		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin( level.ss_jumper_tp.origin );
		player setPlayerangles( level.ss_jumper_tp.angles );
		level.activ setOrigin( level.ss_acti_tp.origin );
		level.activ setPlayerangles( level.ss_acti_tp.angles );

		player iprintlnbold("^1You ^7lost to the ^1Activator");

		level.activ giveWeapon("deserteagle_mp");
		level.activ switchToWeapon("deserteagle_mp");
		level.activ iprintlnbold("^1You Win! ^7now kill the ^1Jumper");
		wait 2.5;
		level.activ freezeControls(0);
	}
	else {
		level.activ takeallweapons();
		level.activ freezeControls(1);
		player freezeControls(1);

		player setOrigin( level.ss_jumper_tp.origin );
		player setPlayerangles( level.ss_jumper_tp.angles );
		level.activ setOrigin( level.ss_acti_tp.origin );
		level.activ setPlayerangles( level.ss_acti_tp.angles );

		level.activ iprintlnbold("^1You ^7lost to the ^1Jumper");

		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		player iprintlnbold("^1You Win! ^7now kill the ^1Activator");
		player SetClientDVAR("cg_thirdperson", 0);
		level.activ SetClientDVAR("cg_thirdperson", 0);
		wait 2.5;
		player freezeControls(0);
	}
}

ss_game(player) {
	black = getent("ss_black", "targetname");
	brown = getent("ss_brown", "targetname");
	blue = getent("ss_blue", "targetname");
	blue2 = getent("ss_blue2", "targetname");
	yellow = getent("ss_yellow", "targetname");
	red1 = getent("ss_red", "targetname");
	green1 = getent("ss_green", "targetname");
	purple = getent("ss_purple", "targetname");
	orange = getent("ss_orange", "targetname");

	ss_black = getent("ss_ss_black", "targetname");
	ss_brown = getent("ss_ss_brown", "targetname");
	ss_blue = getent("ss_ss_blue", "targetname");
	ss_blue2 = getent("ss_ss_blue2", "targetname");
	ss_yellow = getent("ss_ss_yellow", "targetname");
	ss_red1 = getent("ss_ss_red", "targetname");
	ss_green1 = getent("ss_ss_green", "targetname");
	ss_purple = getent("ss_ss_purple", "targetname");
	ss_orange = getent("ss_ss_orange", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1) {
		black hide();
		brown hide();
		blue hide();
		blue2 hide();
		yellow hide();
		red1 hide();
		green1 hide();
		purple hide();
		orange hide();

		colour = randomint(9);
		if (colour == 0) {
			hide = ss_black;
			level.wall = black;
			black show();
		}
		if (colour == 1) {
			hide = ss_brown;
			brown show();
			level.wall = brown;
		}
		if (colour == 2) {
			hide = ss_blue;
			blue show();
			level.wall = blue;
		}
		if (colour == 3) {
			hide = ss_blue2;
			blue2 show();
			level.wall = blue2;
		}
		if (colour == 4) {
			hide = ss_red1;
			red1 show();
			level.wall = red1;
		}
		if (colour == 5) {
			hide = ss_green1;
			green1 show();
			level.wall = green1;
		}
		if (colour == 6) {
			hide = ss_yellow;
			yellow show();
			level.wall = yellow;
		}
		if (colour == 7) {
			hide = ss_purple;
			purple show();
			level.wall = purple;
		}
		if (colour == 8) {
			hide = ss_orange;
			orange show();
			level.wall = orange;
		}

		wait(length);

		ss_black hide();
		ss_brown hide();
		ss_blue hide();
		ss_blue2 hide();
		ss_yellow hide();
		ss_red1 hide();
		ss_green1 hide();
		ss_purple hide();
		ss_orange hide();

		ss_black notsolid();
		ss_brown notsolid();
		ss_blue notsolid();
		ss_blue2 notsolid();
		ss_yellow notsolid();
		ss_red1 notsolid();
		ss_green1 notsolid();
		ss_purple notsolid();
		ss_orange notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

		ss_black show();
		ss_brown show();
		ss_blue show();
		ss_blue2 show();
		ss_yellow show();
		ss_red1 show();
		ss_green1 show();
		ss_purple show();
		ss_orange show();

		ss_black solid();
		ss_brown solid();
		ss_blue solid();
		ss_blue2 solid();
		ss_yellow solid();
		ss_red1 solid();
		ss_green1 solid();
		ss_purple solid();
		ss_orange solid();

		time += 1;
		length -= 0.25;

		if(time == 14 && isAlive(player)) {
			player iprintlnbold("^1You've been given a knife as game went on too long");
			level.activ iprintlnbold("^1You've been given a knife as game went on too long");
			player giveWeapon("knife_mp");
			level.activ giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}

bounce_weapon() {
	bounce_weapon_trigger = getent ("give_wep_trig", "targetname");
	bounce_weapon_trigger  waittill ("trigger", user);

	user iPrintLnBold("^1" + user.name + "^7 has gotten the ^1Sniper!");
	wait 0.01;

	user giveWeapon ("m40a3_mp");
	wait 0.1;

	user switchToWeapon ("m40a3_mp");
	user givemaxammo( "m40a3_mp");
}

room_surf() {
	level.surf_trigger = getEnt("trig_surf","targetname");
	level.surf_tp = getEnt("tp_surf_no1", "targetname");

	// Door Triggers
	thread teleportTo("trig_surf_no1", "tp_surf_no2");
	thread teleportTo("trig_surf_no2", "tp_surf_no3");
	//thread teleportTo("trig_surf_no3", "tp_surf_win");

	// Fail Triggers
	thread teleportTo("trig_surf_fail1", "tp_surf_no1");
	thread teleportTo("trig_surf_fail2", "tp_surf_no2");
	thread teleportTo("trig_surf_fail3", "tp_surf_no3");
	thread teleportTo("trig_surf_fail4", "tp_surf_no3");
	thread teleportTo("trig_surf_fail5", "tp_surf_no3");
	thread teleportTo("trig_surf_fail6", "tp_surf_no3");
	thread teleportTo("trig_surf_fail7", "tp_surf_no3");
	thread teleportTo("trig_surf_fail8", "tp_surf_no3");
	thread teleportTo("trig_surf_fail9", "tp_surf_no3");
	thread teleportTo("trig_surf_fail10", "tp_surf_no3");

	while(1) {
		level.surf_trigger setHintString(doorsPrint("Surf Room!"));
		level.surf_trigger waittill( "trigger", player );
		level.firstenter = false;

		//Ambientplay("song4");
		//iprintln(">^1Song^7<");
		//iprintln("Nurko ^1- ^7Let Me Go ft. Alina Renae");

		player freezeControls(1);
		level.activ freezeControls(1);

		if( !isDefined( level.surf_trigger ) )
			return;

		thread createHud(" ^7" + player.name + " ^1 has entered the Surf room^7!");
		wait 0.05;

		player SetOrigin( level.surf_tp.origin );
		player setplayerangles( level.surf_tp.angles );
		level.activ SetOrigin ( level.surf_tp.origin );
		level.activ setplayerangles ( level.surf_tp.angles );
		wait 1.5;

		player TakeAllWeapons();
		level.activ TakeAllWeapons();
		wait 0.05;

		countdown(player);

		player freezeControls(0);
		level.activ freezeControls(0);

		player.canSurf = 1;
		level.active.canSurf = 1;
		player thread surf();
		if (isDefined(player)){
			iprintLnBold("player is defined");
		}
		if (isDefined(level.activ)){
			level.active thread surf();
		}

		thread surf_race(player);
	}
}

surf_race(player) {
	endtele = getEnt("trig_surf_no3","targetname");
	loser_tp = getEnt("tp_surf_lose","targetname");
	winner_tp = getEnt("tp_surf_win","targetname");
	endtele waittill("trigger", who);

	player.canSurf = 0;
	level.activ.canSurf = 0;

	if (who == player) {
		level.activ takeallweapons();
		level.activ freezeControls(1);
		player freezeControls(1);

		level.activ setOrigin( loser_tp.origin );
		level.activ setPlayerangles( loser_tp.angles );
		player setOrigin( winner_tp.origin );
		player setPlayerangles( winner_tp.angles );

		level.activ iprintlnbold("^1You ^7lost to the ^1Jumper");

		player giveWeapon("deserteagle_mp");
		player switchToWeapon("deserteagle_mp");
		player iprintlnbold("^1You Win! ^7now kill the ^1Activator");

		wait 2.5;
		player freezeControls(0);
	}
	else {
		player takeallweapons();
		player freezeControls(1);
		level.activ freezeControls(1);

		level.activ setOrigin( winner_tp.origin );
		level.activ setPlayerangles( winner_tp.angles );
		player setOrigin( loser_tp.origin );
		player setPlayerangles( loser_tp.angles );

		player iprintlnbold("^1You ^7lost to the ^1Activator");

		level.activ giveWeapon("deserteagle_mp");
		level.activ switchToWeapon("deserteagle_mp");
		level.activ iprintlnbold("^1You Win! ^7now kill the ^1Jumper");

		wait 2.5;
		level.activ freezeControls(0);
	}
}

// ---------------------------//
// ----- Secret Ways ------ //
// ---------------------------//

// ----- Activator Secrets ----- //

xp_secret() {
	xp_trig = getEnt("trig_xp", "targetname");
	gay_trig = getEnt("trig_gay", "targetname");

	xp_trig setHintString(trapPrint("recieve 500 XP!"));
	xp_trig waittill("trigger", player);

	player iprintlnbold("^7Heres some ^1XP ^7man...");
	player braxi\_rank::giveRankXP("", 500);

	gay_trig delete();
	xp_trig delete();
}

gay_secret() {
	xp_trig = getEnt("trig_xp", "targetname");
	gay_trig = getEnt("trig_gay", "targetname");

	gay_trig setHintString(trapPrint("use the Gay Detector!"));
	gay_trig waittill("trigger", player);

	players = getAllPlayers();

	if( !isDefined( players ) || isDefined( players ) && !players.size )
		return;

	num = randomInt( players.size );
	guy = players[num];

	if( !isDefined( guy ) && !isPlayer( guy ) || guy.sessionstate == "spectator" || guy.pers["team"] == "axis") {
		thread gay_secret();
		return;
	}

	iPrintlnBold( "^1 " + guy.name + " ^7was killed cause hes ^1gay." );
	guy Suicide();

	gay_trig delete();
	xp_trig delete();
}

// ----- Jumper Secrets ----- //

secret_steps() {
	step("secret_s", "S");
	step("secret_e", "E");
	step("secret_c", "C");
	step("secret_r", "R");
	step("secret_e", "E");
	step("secret_t", "T");
	iprintln("^5Secret is now Open!");

	thread teleportTo("trig_sec", "sec_bounce1");
}

step(letter_name, print_statement) {
	trigger = getEnt (letter_name,"targetname");
	trigger waittill ("trigger", player);

	iprintln( "^5" + print_statement);
}

// ----- Combined Secret Way ----- //

combined_secret_way(){
	bounce1 = getEnt("hiddenbounce", "targetname");
	bounce2 = getEnt("hiddenbounce2", "targetname");
	bounce3 = getEnt("hiddenbounce3", "targetname");
	wall = getEnt("hiddenwall", "targetname");

	//bounce1 hide();
	//bounce2 hide();
	//bounce3 hide();
	wall notSolid();
}

// ----- Easy Secret Way ----- //

easy_secret_checkpoints() { // Checkpoint system by GenoSen
	start_trigger = getEnt("start_trig", "targetname");

	// Pair checkpoint triggers with their teleport location
	thread checkpoint("start_trig", "sec_bounce1");
	thread checkpoint("sec_cp1_trig", "sec_cp1");
	thread checkpoint("sec_cp2_trig", "sec_cp2");
	thread checkpoint("sec_cp3_trig", "sec_cp3");
	thread checkpoint("sec_cp4_trig", "sec_cp4");
	thread checkpoint("sec_cp5_trig", "sec_cp5");
	thread checkpoint("sec_cp6_trig", "sec_cp6");

	// Set these triggers to teleport the player to the location of 'player.cp'
	thread tp_triggers("sec_trig");
	thread tp_triggers("sec_trig2");
	thread tp_triggers("sec_trig3");
	thread tp_triggers("sec_trig4");
	thread tp_triggers("sec_trig5");
	thread tp_triggers("sec_trig6");
	/*
	while(1) {
		// Initialize player.cp
		start_trigger waittill( "trigger", player );
		player.cp = "sec_bounce1";
	}
	*/
}

tp_triggers(trigger_name){
	tp_trigger = getEnt(trigger_name, "targetname");

	while (1){
		tp_trigger waittill( "trigger", player );
		tp = getEnt(player.cp, "targetname");

		player SetOrigin ( tp.origin );
		player SetPlayerAngles ( tp.angles );
	}
}

checkpoint(trig, cp){
	cp_trigger = getEnt(trig, "targetname");
	tp = cp;

	while (1){
		cp_trigger waittill( "trigger", player );
		player.cp = cp;
	}
}

// ----- Experimental Secret Way ----- //

experimental_way() {
	thread flashing_beam();
	thread hints();

	thread setBhopTrigger("bhop_trigger");
	thread setBhopTrigger("bhop_trigger2");
	thread setBhopTrigger("bhop_trigger3");
	thread setBhopTrigger("bhop_trigger4");
	thread setBhopTrigger("bhop_trigger5");

	thread experimental_way_xp();
	experimental_secret_checkpoints();
}

experimental_secret_checkpoints() { // Checkpoint system by GenoSen
	start_trigger = getEnt("start_trig", "targetname");

	// Pair checkpoint triggers with their teleport location
	thread checkpoint("exp_cp0_trig", "exp_cp0");
	thread checkpoint("exp_cp1_trig", "exp_cp1");
	thread checkpoint("exp_cp2_trig", "exp_cp2");
	thread checkpoint("exp_cp3_trig", "exp_cp3");
	thread checkpoint("exp_cp4_trig", "exp_cp4");

	// Set these triggers to teleport the player to the location of 'player.cp'
	thread tp_triggers("exp_trig0");
	thread tp_triggers("exp_trig1");
	thread tp_triggers("exp_trig2");
	thread tp_triggers("exp_trig3");
	thread tp_triggers("exp_trig4");
}

flashing_beam() {
	platform = getEnt("flashing_beam","targetname");
	for(;;) {
		platform hide();
		platform notsolid();
		wait(3);
		platform solid();
		platform show();
		wait(3);
	}
}

experimental_way_xp() {
	xp_trig = getEnt("trig_experimental_xp", "targetname");

	xp_trig waittill("trigger", player);
	player iprintlnbold("^7Congats on finishing! Heres^1 10,000 XP!");
	player braxi\_rank::giveRankXP("", 10000);
	xp_trig delete();
}

hints() {
	thread hintMessage("exp_intro", "^1>>^7 This is the Experimental Secret Way!\n^1>>^7 To complete it you must do 10 rare, old and new deathrun/cj techs\n^1>>^7 If you complete it you will receive 10,000 XP!");
	thread hintMessage("exp_hint1", "^1>>^7 Use ^11000 FPS ^7to climb the wall.\n^1>>^7 If you cannot reach 1000 FPS, try ^1'/cg_nopredict 1'^7, and set it back to ^10 ^7when done.");
	thread hintMessage("exp_hint2", "^1>>^7 The floor below has ^1Fall-Damage^7. To survive: \n^1>>^7 Switch to 333 \n^1>>^7 Jump and hug the wall \n^1>>^7 About halfway down start holding A and turn slightly to the right");
	thread hintMessage("exp_hint3", "^1>>^7 The floor below has ^1Fall-Damage^7. To survive: \n- Switch to ^11000 FPS^7 \n^1>>^7 Hold ^1A ^7while facing the left wall, and walking down");
	thread hintMessage("exp_hint4", "^1>>^7 To climb this wall you must do a ^1Crouch Elevator^7.");
	thread hintMessage("exp_hint5", "^1>>^7 You cannot prone, and you cannot jump. To pass this area, try to do ^1both ^7at the same time. ^1:)");
	thread hintMessage("exp_hint6", "^1>>^7 You must do a ^1'Wallglitch' ^7and lunge forward after clearing the hole in the floor. To do this: \n^1>>^7 Switch to ^1333 ^7and jump stationary in place \n^1>>^7 After ^1landing ^7sprint toward the hole");
	thread hintMessage("exp_hint7", "^1>>^7 The water infront of you will ^1kill you^7. You can bypass the death-trigger by switching to ^11 FPS^7. \n^1>>^7 But be cautious because the floor below the trigger has ^1fall damage^7. \n^1>>^7 Start sprinting ^1the moment before ^7you switch to 1 FPS.");
	thread hintMessage("exp_hint8", "^1>>^7 This bounce is a ^1500 FPS Height-Bounce^7. \n^1>>^7 Hit the bottom of the bounce, and while you are still touching the bounce use ^1500^7. Switch to ^1333 ^7when in the ^1air^7.");
	thread hintMessage("exp_hint9", "^1>>^7 This platform is impossible to cross without falling into the water... \n^1>>^7 Before it disappears, jump and execute the command ^1'/ping lag' ^7to freeze mid-air");
	thread hintMessage("exp_hint10", "^1>>^7 Jump and hold ^1F ^7to ^1bunny-hop^7. To reach the platform above you must do a ^1lagjump^7. As you land, and when the bhop script starts, switch to ^11 FPS ^7to bounce yourself.");
}

hintMessage(trigger_name, message) {
	hint_trigger = getEnt(trigger_name, "targetname");

	while(1) {
		hint_trigger waittill("trigger", player);
		player iprintln(message);
	}
}

// ------------------ //
// ----- Music ----- //
// ------------------ //

MusicTrig() {
    level.trigger = getEnt ( "musicmenu", "targetname" ); //musicmenu is the trigger to pick songs
    level.trigger setHintString( "^7Press ^1>^7USE^1<^7to ^1Choose Music" );
	level.trigger waittill( "trigger", player );

	level.triggerr delete();
	level endon ( "song_picked" );
	player thread musicMenu();
	player freezeControls(1);
}

onDeath() {
    self endon( "disconnect" );
    self endon( "music thread terminated" );
    self waittill( "death" );
    self cleanUp();
}

onDisconnect() {
    self endon( "music thread terminated" );
    self waittill( "disconnect" );
    self cleanUp();
}

cleanUp() {
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

musicMenu() {
    self endon( "death" );

    self thread onDeath();
    self thread onDisconnect();

    self.hud_music = [];
    self.selection = 0;

    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
    self.hud_music[i].sort = 883;
    self.hud_music[i] setText( ">^5>^7> Music ^5Menu ^7<^5<^7<" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText( ">^5>^7> ^7Select ^7a ^7Song ^5<^7<^5<" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
    self.hud_music[i].sort = 885;
    self.hud_music[i] setText( "Press ^5[^7USE^5]^7: ^5Play ^7Song" );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;

    for( j = 0; j < level.music.size; j++ ) {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";

        entry = level.music[j];
        self.hud_music[i] setText( entry["artist"] + " ^2-^7 " + entry["title"] );
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    while( self.sessionstate == "playing" ) {
        wait 0.1;

        if( self attackButtonPressed() ) {
            self.hud_music[5+self.selection].alpha = 0.93;

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[5+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if( self useButtonPressed() ) {
            iPrintln( "^5Now playing: ^7" + level.music[self.selection]["artist"]+" - ^2" +level.music[self.selection]["title"] );

            ambientPlay( level.music[self.selection]["alias"], 3 );
            self freezeControls(0);
            level notify ( "song_picked" );
            self braxi\_rank::giveRankXp( "trap_activation" );
            break;
        }
        else if( self meleeButtonPressed() ) {
            self freezeControls(0);
            break;
        }
    }

    self cleanUp();
}

initMusic() {
		level.music = [];

        i = 0;
		level.music[i]["artist"] = "Alan Walker";
		level.music[i]["title"] = "Faded";
		level.music[i]["alias"] = "song1";

		i++;
		level.music[i]["artist"] = "Raj Chrome";
		level.music[i]["title"] = "The Key";
		level.music[i]["alias"] = "song2";

		i++;
		level.music[i]["artist"] = "Veorra";
		level.music[i]["title"] = "Run";
		level.music[i]["alias"] = "song3";

		i++;
		level.music[i]["artist"] = "Veorra";
		level.music[i]["title"] = "The City";
		level.music[i]["alias"] = "song4";

		i++;
		level.music[i]["artist"] = "Dua Lipa";
		level.music[i]["title"] = "New Rules";
		level.music[i]["alias"] = "song5";

		i++;
		level.music[i]["artist"] = "DROELOE";
		level.music[i]["title"] = "Kintsugi";
		level.music[i]["alias"] = "song6";

		i++;
		level.music[i]["artist"] = "Nurko";
		level.music[i]["title"] = "Let Me Go";
		level.music[i]["alias"] = "song7";

		i++;
		level.music[i]["artist"] = "Grace";
		level.music[i]["title"] = "You Don't Own Me";
		level.music[i]["alias"] = "song8";

		precacheShader( "black" );
		precacheShader( "white" );
}

playSong(song_number) {
	if (song_number == -1) {
		song = randomint (8);
	}

	else {
		song = song_number;
	}

	switch (song) {
		case 0: Ambientplay("song1");
		{
			iprintln(">^1Song^7<");
			iprintln("Alan Walker ^1- ^7Faded (Dino Roc Remix)");
			break;
		}
		case 1: Ambientplay("song2");
		{
			iprintln(">^1Song^7<");
			iprintln("Raj Chrome ^1- ^7The Key");
			break;
		}
		case 2: Ambientplay("song3");
		{
			iprintln(">^1Song^7<");
			iprintln("Veorra ^1- ^7Run");
			break;
		}
		case 3: Ambientplay("song4");
		{
			iprintln(">^1Song^7<");
			iprintln("Veorra ^1- ^7The City");
			break;
		}
		case 4: Ambientplay("song5");
		{
			iprintln(">^1Song^7<");
			iprintln("Dua Lipa ^1- ^7New Rules (Alison Wonderland Remix)");
			break;
		}
		case 5: Ambientplay("song6");
		{
			iprintln(">^1Song^7<");
			iprintln("DROELOE ^1- ^7Kintsugi");
			break;
		}
		case 6: Ambientplay("song7");
		{
			iprintln(">^1Song^7<");
			iprintln("Nurko ^1- ^7Let Me Go ft. Alina Renae");
			break;
		}
		case 7: Ambientplay("song8");
		{
			iprintln(">^1Song^7<");
			iprintln("Grace ^1- ^7You Don't Own Me ft. G-Eazy");
			break;
		}
	}
}

// ------------------------------------------- //
// ----- Game Bugs and Mechanics -------- //
// ------------------------------------------- //

// ----- Bunnyhop ----- //

setBhopTrigger(trigger) {
	bhop_trigger = getEnt(trigger,"targetname");

	while (1) {
		bhop_trigger waittill( "trigger", player );

		if (!player.is_bhopping || !isDefined(player.is_bhopping)) {
			player.is_bhopping = true;
			thread _bunnyHop(player, trigger);
			player iPrintln("^7Jump and hold ^1>^7Use^1<^7 to start ^1Bhopping!");
		}
	}
}

_bunnyHop(player, trig) {
	_trigger = getEnt(trig,"targetname");
	_guid = player getGuid();

    _last = player.origin;
    _lastBH = 0;
    _lastCount = 0;

    while(player isTouching(_trigger)) {
		_dist = distance(player.origin, _last);
        _last = player.origin;

        if ( _dist > 450 && _lastBH && _lastCount > 5)  {
            _num = player getEntityNumber();
            _guid = player getGuid();
            logPrint( "LJ;" + _guid + ";" + _num + ";" + player.name + ";\n" );
            player iprintln("^3Lagjump? ^1DIE!");
            player suicide();
        }

        _lastBH = player._doingBH;
        wait 0.1;

        // player setClientDvar( "com_maxfps", 125 );
		// ----- //

        _stance = player getStance();
        _useButton = player useButtonPressed();
        _onGround = player isOnGround();
        _fraction = bulletTrace( player getEye(), player getEye() + vector_scale(anglesToForward(player.angles), 32 ), true, player )["fraction"];

        // Begin
        if ( !player._doingBH && _useButton && !_onGround && _fraction == 1 ) {
            player setClientDvars( "bg_viewKickMax", 0, "bg_viewKickMin", 0, "bg_viewKickRandom", 0, "bg_viewKickScale", 0 );
            player._doingBH = true;
            lastCount = 0;
        }

        // Accelerate
        if ( player._doingBH && _useButton && _onGround && _stance != "prone" && _fraction == 1 ) {
            _lastCount++;
            if( player._bh < 120 )
                player._bh += 30;
        }

        // Finish
        if ( player._doingBH && !_useButton || player._doingBH && _stance == "prone" || player._doingBH && _fraction < 1 ) {
            player setClientDvars( "bg_viewKickMax", 90, "bg_viewKickMin", 5, "bg_viewKickRandom", 0.4, "bg_viewKickScale", 0.2 );
            player._doingBH = false;
            player._bh = 0;
            _lastCount = 0;
            continue;
        }

        // Bounce
        if ( player._bh && player._doingBH && _onGround && _fraction == 1 ) {
            _bounceFrom = (player.origin - vector_scale( anglesToForward( player.angles ), 50 )) - (0,0,42);
            _bounceFrom = vectorNormalize( player.origin - _bounceFrom );
            player _bounce( _bounceFrom, player._bh, player );
            player _bounce( _bounceFrom, player._bh, player );
            wait 0.1;
        }
    }
	player.is_bhopping = false;
}

_bounce( _pos, _power, player ) { //This function doesnt require to thread it

	_oldhp = player.health;
	player.health = player.health + _power;
	player setClientDvars( "bg_viewKickMax", 0, "bg_viewKickMin", 0, "bg_viewKickRandom", 0, "bg_viewKickScale", 0 );
	player finishPlayerDamage( player, player, _power, 0, "MOD_PROJECTILE", "none", undefined, _pos, "none", 0 );
	player.health = _oldhp;
	player thread _bounce2(player);
}

_bounce2(player) {
	player endon( "disconnect" );
	wait .05;
	player setClientDvars( "bg_viewKickMax", 90, "bg_viewKickMin", 5, "bg_viewKickRandom", 0.4, "bg_viewKickScale", 0.2 );
}


// ----- Wallrun Bug ----- //

wallrun() {
    object = getEnt ("wallruntest1","targetname");
	object2 = getEnt ("wallruntest2","targetname");
    wait 1;
    object rotateRoll (-110, 1);
	object2 rotateRoll (-110, 1);
}

// ----- Surf Mechanics ----- //
/*
surf(){
	if (self.canSurf) {
		iprintLnBold("Now I can Surf!");
	}
	while(self.canSurf){
		wait(10);
		iprintLnBold("test!");
	}
	iprintLnBold("Cant Surf anymore!");
}
*/

surf() { // Surf by AtrX
	self endon( "disconnect" );
	self endon( "spawned" );

	self.isSurfing = false;

	self thread stopAirStrafe();

	while(self.canSurf) {
		wait .05;

		if( !self isOnRamp() ) {
			self.isSurfing = false;
			self airStrafe();
			continue;
		}

		if( self useButtonPressed() ) {
			self.isSurfing = false;
			self setVelocity( self getVelocity() * ( 0, 0, 1 ) );
			continue;
		}

		if( self forwardButtonPressed() ) {
			self.isSurfing = false;
			continue;
		}


		self.isSurfing = true;
		self airStrafe();
	}
}

isOnRamp() {
	if( self isOnRampLeft() || self isOnRampRight() )
		return true;

	return false;
}

isOnRampLeft() {
	dist = physicsTrace(
		self.origin,
		self.origin + vectorScale(
			anglesToRight( self getPlayerAngles() ),
			-25
		)
	);

	if( distanceSquared( dist, self.origin ) < 256 )
		return true;

	return false;
}

isOnRampRight() {
	dist = physicsTrace(
		self.origin,
		self.origin + vectorScale(
			anglesToRight( self getPlayerAngles() ),
			25
		)
	);

	if( distanceSquared( dist, self.origin ) < 256 )
		return true;

	return false;
}

airStrafe() {
	dot = vectorDot(
		anglesToForward( ( 0, self getPlayerAngles()[1], 0 ) ),
		vectorNormalize( self getVelocity() )
	) + .01;

	velMatchingDir = 1;
	if( dot < 0 )
		velMatchingDir = -1;

	if( self isOnGround())
		return;

	vel = self getVelocity();
	newVel = vectorScale(
		anglesToForward( ( 0, self getPlayerAngles()[1], 0 ) ),
		length( ( vel[0], vel[1], 0 ) )
	);
	self setVelocity( ( newVel[0] * velMatchingDir, newVel[1] * velMatchingDir, vel[2] ) );
}

stopAirStrafe() {
	self endon( "disconnect" );
	self endon( "spawned_player" );

	for(;;) {
		airTime = 0;

		while( self isOnGround() ) {
			wait .05;
		}

		while( ( !isDefined( self.isSurfing ) || !self.isSurfing ) && airTime < 1.5 ) {
			if( self isOnGround() )
				airTime = 0;
			else
				airTime += .05;

			wait .05;
		}

		// At this point we've been on a surf or been in the air for long enough
		while( !self isOnGround() || self.isSurfing ) {
			if( self useButtonPressed() )
				self setVelocity( self getVelocity() * ( 0, 0, 1 ) );
			wait .05;
		}

		wait .05;
	}
}

// ------------------------------ //
// ---------- Testing ----------- //
// ------------------------------ //

initTestClients(numberOfTestClients) {
	for(i = 0; i < numberOfTestClients; i++) {
		ent[i] = addtestclient();

		if (!isdefined(ent[i])) {
			wait 1;
			continue;
		}
		//ent[i].pers["isBot"] = true;
		ent[i] thread initIndividualBot("allies"); //This can be replaced with initIndividualBot("allies"); or initIndividualBot("axis");
		wait 0.1;
	}
}

initIndividualBot(team) {// Leave this alone if you didnt change initIndividualBot(); otherwise change this to initIndividualBot(team)
	self endon("disconnect");
	while(!isdefined(self.pers["team"]))
		wait .05;
	self notify("menuresponse", game["menu_team"], team); // Leave this alone unless you changed the above otherwise change "autoassign" to team
	self waittill("spawned_player");
}

enableGhost(){
	iprintLnBold(self.name + " is now a ghost!");
	self hide();
	self clientCmd("god");
	self.is_ghost = 1;
	self iprintln("You are now a ghost and cannot die, have fun in the secret!");

	self common_scripts\utility::waittill_any("death","disconnect");

	self show();
	self clientCmd("god");
	self.is_ghost = 0;
}