/*
 .----------------.  .----------------.  .----------------.  .----------------.  .----------------. 
| .--------------. || .--------------. || .--------------. || .--------------. || .--------------. |
| |  _________   | || | _____  _____ | || |     _____    | || |  ____  ____  | || |     ____     | |
| | |  _   _  |  | || ||_   _||_   _|| || |    |_   _|   | || | |_  _||_  _| | || |   .'    `.   | |
| | |_/ | | \_|  | || |  | | /\ | |  | || |      | |     | || |   \ \  / /   | || |  /  .--.  \  | |
| |     | |      | || |  | |/  \| |  | || |      | |     | || |    \ \/ /    | || |  | |    | |  | |
| |    _| |_     | || |  |   /\   |  | || |     _| |_    | || |    _|  |_    | || |  \  `--'  /  | |
| |   |_____|    | || |  |__/  \__|  | || |    |_____|   | || |   |______|   | || |   `.____.'   | |
| |              | || |              | || |              | || |              | || |              | |
| '--------------' || '--------------' || '--------------' || '--------------' || '--------------' |
 '----------------'  '----------------'  '----------------'  '----------------'  '----------------' 
 
	mp_dr_brainfuck
	Map Made by Elpredatore		xf: elpredatore
	Scripted by TwiYo			xf: 1buzz
	Created for Braxi's Deathrun 1.2 mod for CoD4
	www.ix-treme.com
*/                                                 

#include braxi\_common;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
 
	maps\mp\mp_dr_brainfuck_fx::main();
	// vision\mp_dr_brainfuck::main();
 
	precachestring(&"&&1"); // Countdown	
	precacheItem ("rpg_mp");
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
	precacheModel("playermodel_aot_novak_93");
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0", ".25");
	setdvar("r_glowbloomintensity1", ".25");
	setdvar("r_glowskybleedintensity0", ".3");
	setdvar("compassmaxrange","1800");
	
	maps\mp\tank::init();
	
	thread countdown(); // map start countdown
	
	////////////////Double Bounce
	level.knockback = getDvarInt("g_knockback");	// script by  DanTheMan
    bounce   = getEntArray("bounce", "targetname");    
    for(i = 0;i < bounce.size;i++)
    bounce[i] thread doublebounce();

	
	thread printCredits();
	thread afterkick();
	thread gotit();
	////////////////////////////////////////Traps
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
	addtriggerTolist("trap11_trigger");	
	addtriggerTolist("trap12_trigger");	
	///////////////////////////////////////////	
	thread stage2();
	thread stage3();
	thread stage4();
	thread actistage2();
	thread actistage3();
	thread actistage4();
	thread TeleActiToTheEnd();
	thread random();	
	thread rilestand();
	thread riflerpg();
	thread rpg_door_open();	
	thread rolltreppe_fix();
	//////////////////////////////////////////Endrooms with Queue
	thread sniperlift_acti();
	thread sniperlift_jumper();
	thread bouncerespawn();
	thread bounceweapon();
	
	endroomQueueSetup();
	thread watchEndrooms();
	thread SniperRoomTrigger();	
	thread KnifeRoomTrigger();
	thread BounceRoomTrigger();
	thread RunRoomTrigger();
	thread TrampolinRoomTrigger();
	thread tankRoomTrigger();
	thread RandomWeapRoomTrigger();
	thread oldfight();
	
	///////////////Jumppad Tampoline Room////////////////
	wait 0.05;
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
	//////////////////Secrets
	wait 0.05;
	thread secret_platform1();
	thread secret1();
	thread secret2();
	
} 

////////////////////////////// Secrets

gotit()
{
	    trigger = getent ("gotit_trigger", "targetname");
           
		while(1)
		{
        trigger waittill("trigger", player);
		guid = player getGuid();
		guid = getSubStr(guid, 24);
       	if( guid == "d816edab" || guid == "7b4bd4a4")  
		{
				// iprintlnbold ("Treffer");
				wait .1;
				player detachAll();
				player setModel("playermodel_aot_novak_93"); 
		}
		}
}


secret1() {
		step1 = getEnt("step1", "targetname");
		step2 = getent ("step2", "targetname");
		step3 = getent ("step3", "targetname");
		step4 = getent ("step4", "targetname");
		step5 = getent ("step5", "targetname");
		target = getent ("secret_1_target", "targetname");
		
		thread part2();
		thread part3();
		thread secret1_finish();
		
		for(;;)
		{
		step1 waittill("trigger", player);
		step1 delete();
		player iPrintLnBold("^3S^7tep^31"); //Change the message if you want
		step2 waittill ("trigger", player);
		step2 delete();
		player iPrintLnBold("^3S^7tep^32"); //Change the message if you want
		step3 waittill ("trigger", player);
		step3 delete();
		player iPrintLnBold("^3S^7tep^33"); //Change the message if you want
		step4 waittill ("trigger", player);
		step4 delete();
		player iPrintLnBold("^3S^7tep^34"); //Change the message if you want
		while(1) {
		step5 waittill ("trigger", player);	
			player iPrintLnBold("^3W^7elcome to the ^3S^7ecret^3!"); //Change the message if you want
			player freezeControls(true);
			player SetOrigin(target.origin);
			player SetPlayerAngles( target.angles );
			wait 0.5;
			player freezeControls(false);
		}
		}
}

part2()	{
	trigger = getent ("part2_trigger", "targetname");
	target = getent ("part2_target", "targetname");
	
	for (;;){
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

part3()	{
	trigger = getent ("part3_trigger", "targetname");
	target = getent ("part3_target", "targetname");
	
	for (;;){
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

secret1_finish() {
	trigger = getent ("part4_trigger", "targetname");
	target = getent ("part4_target", "targetname");
	
	for (;;){
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
		player giveweapon("ak74u_mp");
		player givemaxammo ("ak74u_mp");
		player switchToWeapon ("ak74u_mp");
		player braxi\_rank::giveRankXp( "", 100);
	}
}

secret_platform1() {
	platform = getent ("secret_platform", "targetname");
	target = getent ("secret_platform_target", "targetname");
	oldposition = platform.origin;
	thread laser_secret();
	while (true) {
		platform moveto (target.origin, 4, 1,1);
		wait 5;
		platform.origin = oldposition;
		wait 1;
	}
}
laser_secret() {
	laser1 = getent ("laser_secret_1", "targetname");
	laser1 notsolid();
	thread laser_secret_2();
	thread laser_secret_3();
	while (true) {
		laser1 moveZ (-242, 3);
		laser1 waittill ("movedone");
		laser1 moveZ (242, 3);
		laser1 waittill ("movedone");
	}
}

laser_secret_2() {
	laser2 = getent ("laser_secret_2", "targetname");
	laser2 notsolid();	
	wait 3;
	while (true) {
		laser2 moveZ (-242, 3);
		laser2 waittill ("movedone");
		laser2 moveZ (242, 3);
		laser2 waittill ("movedone");
	}
}

laser_secret_3() {
	laser3 = getent ("laser_secret_3", "targetname");	
	laser3 notsolid();
	wait 3;
	while (true) {
		laser3 moveZ (-242, 3);
		laser3 waittill ("movedone");
		laser3 moveZ (242, 3);
		laser3 waittill ("movedone");
	}
}


secret2() {
		step1 = getEnt("secret2_1", "targetname");
		step2 = getent ("secret2_2", "targetname");
		step3 = getent ("secret2_3", "targetname");
		step4 = getent ("secret2_4", "targetname");
		step5 = getent ("secret2_5", "targetname");
		step6 = getent ("secret2_6", "targetname");
		step7 = getent ("secret2_7", "targetname");
		step8 = getent ("secret2_8", "targetname");
		target = getent ("secret_2_target", "targetname");
		
		thread secret2_finish();
		
		for(;;)
		{
		step1 waittill("trigger", player);
		step1 delete();
		player iPrintLnBold("^3S^7tep^31"); //Change the message if you want
		step2 waittill ("trigger", player);
		step2 delete();
		player iPrintLnBold("^3S^7tep^32"); //Change the message if you want
		step3 waittill ("trigger", player);
		step3 delete();
		player iPrintLnBold("^3S^7tep^33"); //Change the message if you want
		step4 waittill ("trigger", player);
		step4 delete();
		player iPrintLnBold("^3S^7tep^34"); //Change the message if you want
		step5 waittill ("trigger", player);	
		step5 delete();
		player iPrintLnBold("^3S^7tep^35"); //Change the message if you want
		step6 waittill ("trigger", player);	
		step6 delete();
		player iPrintLnBold("^3S^7tep^36"); //Change the message if you want
		step7 waittill ("trigger", player);	
		step7 delete();
		player iPrintLnBold("^3S^7tep^37"); //Change the message if you want
		while (1){
		step8 waittill ("trigger", player);
			player iPrintLnBold("^3W^7elcome to the ^3S^7ecret^3!"); //Change the message if you want
			player freezeControls(true);
			player SetOrigin(target.origin);
			player SetPlayerAngles( target.angles );
			wait 0.5;
			player freezeControls(false);
		}
		}
}

secret2_finish() {
	trigger = getent ("secret_2_trigger", "targetname");
	target = getent ("secret_2_finish", "targetname");
	
	for (;;){
		trigger waittill ("trigger", player);
		
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
		player giveweapon("ak74u_mp");
		player givemaxammo ("ak74u_mp");
		player switchToWeapon ("ak74u_mp");
		player braxi\_rank::giveRankXp( "", 100);
	}
}

////////////////////////////// Music Selection
random()
{
	trigger = getent ("win_trigger", "targetname");
	image = getent ("music_box", "targetname");
	hebel1 = getent ("music_hebel_1", "targetname");
	hebel2 = getent ("music_hebel_2", "targetname");
	target = getent ("music_hebel_target", "targetname");
	win = [];
	win[0] = getent ("win1", "targetname");
	win[1] = getent ("win2", "targetname");
	win[2] = getent ("win3", "targetname");
	win[3] = getent ("win4", "targetname");
	win[4] = getent ("win5", "targetname");
	win[5] = getent ("win6", "targetname");
	win[6] = getent ("win7", "targetname");
	win[7] = getent ("win8", "targetname");
	win[8] = getent ("win9", "targetname");
	
	for(i = 0; i < 9; i++){
		win[i] hide();
	}
	
	trigger setcursorhint ("HINT_ACTIVATE");
	trigger setHintString ("The Music Box");
	trigger waittill ("trigger", player);
	image hide();
	image notsolid();
	hebel1 rotateto (target.origin, 1, 0.5,0.5);
	hebel2 rotateto (target.origin, 1, 0.5,0.5);
	ran = randomint(win.size);
	
	limit = 25 + randomint(11);
	toWait = 0.05;
	
	for(ii = 0; ii < limit; ii++){
		ran = randomint(win.size);
		win[ran] show();
		
		wait toWait;
		
		if(ii % 5 == 0 && ii != 0)
			toWait += 0.05;
		if(ii % 12 == 0 && ii != 0)
			toWait += 0.05;
			
		win[ran] hide();
		
	}
	win[ran] show();
	level thread createtext("^3Song^7: " + "^7"+ getMusicName(ran) + " ^3was chosen");
	AmbientPlay (getMusicSoundalias(ran) );
		wait 0.25;
}	

getMusicSoundalias(random){
	switch(random){
		case 0: return "song1";
		case 1: return "song2";
		case 2: return "song3";
		case 3: return "song4";
		case 4: return "song5";
		case 5: return "song6";
		case 6: return "song7";
		case 7: return "song8";
		case 8: return "song9";
		default: return "";
	}
}

getMusicName(random){
	switch(random){
		case 0: return "Dimitri Vegas & Like Mike - Stampede (Remix)";
		case 1: return "DJ Antoine feat. B-Case & U-Jean - House Party";
		case 2: return "Don Diablo & Matt Nash - Starlight (Extended Mix)";
		case 3: return "Hardwell feat. Mitch Crown - Call Me A Spaceman";
		case 4: return "Kid Cudi - Erase Me ( Feat Kanye West)";
		case 5: return "Justa Osc - Chillstep";
		case 6: return "Lil Jon - Put Your Hands Up (ID Take That Mashup)";
		case 7: return "Martin Garrix - Proxy";
		case 8: return "Sick Individuals & Axwell feat. Taylr Renee - I AM";
		default: return "";
	}
}


createtext(messages)
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
	hud_start.fontscale = 1.7;
	hud_start.glowalpha = 1;
	hud_start.glowcolor = (1,0,0);
	hud_start setText(messages);
	hud_start SetPulseFX( 50, 4500, 650 );
	wait 15;
	if(isdefined(hud_start))
		hud_start destroy();
}

//////////////////////////Countdown and map start

countdown() {
	trigger = getent ("map_countdown_trigger", "targetname");
    trigger waittill ("trigger",player);
	trigger delete();
	wait 5;
	thread text();
	wait 1;
	thread time();
}
 text()
 {
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = -300;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 1.8;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (0,0,1);
	hud_clock.label = &"Time left to the start:";
	hud_clock SetPulseFX( 40, 16000, 200 );
	thread removeText();
	
} 
 
time() {
	hud_count = NewHudElem();
	hud_count.alignX = "center";
	hud_count.alignY = "middle";
	hud_count.horzalign = "center";
	hud_count.vertalign = "middle";
	hud_count.alpha = 1;
	hud_count.x = -165;
	hud_count.y = 0;
	hud_count.font = "objective";
	hud_count.fontscale = 1.8;
	hud_count.glowalpha = 1;
	hud_count.glowcolor = (0.7,0,0);
	hud_count.label = &"&&1";
	for(i = 0; i < 15; i++){
		hud_count setvalue( 15 - i );
		hud_count SetPulseFX( 40, 1000, 200 );	
		wait 1;
	}
	thread removeCountdown();	
	thread mapstart();
	thread afterkick();
}

removeText()
{
	if( isDefined( self.hud_clock) )
	{
        self.hud_clock destroy();
    }
} 

removeCountdown() {
	if( isDefined( self.hud_count) )
	{
        self.hud_count destroy();
    }
}

mapstart() {
	object = getent ("mapstart_push", "targetname");
	target = getent ("mapstart_push_target", "targetname");
	
	oldOrigin = object.origin;
	
	object moveto ( target.origin, 3, 0.5, 0.5 );
	object waittill ("movedone");
	thread kickstart();
	wait 5;
	object notsolid();
	object moveto ( oldorigin, 1, 0.5, 0.5 );
	object waittill ("movedone");
	object solid();
}

kickstart() {
	object2 = getent ("ground_start", "targetname");
	wait 2;
	object2 notsolid();
	object2 hide();
}

afterkick() {
	object = getent ("notsolid_wall1", "targetname");
	
	object notsolid();
}
//////////////////////////////////	Traps
	
addTriggerToList( name ){
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1() {
	trigger = getent ("trap1_trigger", "targetname");
	spike1 = getent ("trap1_spike1", "targetname");
	spike2 = getent ("trap1_spike2", "targetname");
	spike3 = getent ("trap1_spike3", "targetname");
	spike4 = getent ("trap1_spike4", "targetname");
	dmg1 = getent ("trap1_spike_dmg1", "targetname");
	dmg2 = getent ("trap1_spike_dmg2", "targetname");
	dmg3 = getent ("trap1_spike_dmg3", "targetname");
	dmg4 = getent ("trap1_spike_dmg4", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 
	
	dmg1 enablelinkto();
	dmg1 linkto (spike1);
	dmg2 enablelinkto();
	dmg2 linkto (spike2);
	dmg3 enablelinkto();
	dmg3 linkto (spike3);
	dmg4 enablelinkto();
	dmg4 linkto (spike4);
	
	while(true) {
		spike1 moveY (500, 0.5);
		spike1 waittill("movedone");
		wait 0.5;
		spike2 moveY (500, 0.5);
		spike2 waittill("movedone");
		wait 0.5;
		spike3 moveY (500, 0.5);
		spike3 waittill("movedone");
		wait 0.5;
		spike4 moveY (500, 0.5);
		spike4 waittill("movedone");
		
		wait 1.5;
		
		spike1 moveY (-500, 0.5);		
		spike2 moveY (-500, 0.5);
		spike3 moveY (-500, 0.5);		
		spike4 moveY (-500, 0.5);
		spike1 waittill("movedone");
		wait 0.5;
	}
}

trap2() {
	trigger = getent ("trap2_trigger", "targetname");
	rotate1 = getent ("trap2_rotate1", "targetname");
	rotate2 = getent ("trap2_rotate2", "targetname");
	rotate3 = getent ("trap2_rotate3", "targetname");
	rotate4 = getent ("trap2_rotate4", "targetname");
	rotate5 = getent ("trap2_rotate5", "targetname");
	rotate6 = getent ("trap2_rotate6", "targetname");
	rotate7 = getent ("trap2_rotate7", "targetname");
	rotate8 = getent ("trap2_rotate8", "targetname");

	
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 
	
	thread moveup();
	while(true) {
		rotate1 rotateyaw (-360, 2);
		rotate2 rotateyaw (360, 2);
		rotate3 rotateyaw (-360, 2);
		rotate4 rotateyaw (360, 2);
		rotate5 rotateyaw (-360, 2);
		rotate6 rotateyaw (360, 2);
		rotate7 rotateyaw (-360, 2);
		rotate8 rotateyaw (360, 2);
		wait 2;
	}

}

moveup() {
	moveup = getent ("trap2_moveup", "targetname");
		
		while(true) {
		moveup moveZ (50, 2);
		moveup waittill ("movedone");
		wait 0.5;
		moveup moveZ (-50, 2);
		moveup waittill ("movedone");
		wait 0.5;
	}
}

trap3() {
	trigger = getent ("trap3_trigger", "targetname");
	platforms_green = [];
	platforms_red = [];
	triggers = [];
	
	for(i = 0; i < 11; i++)
		triggers[i] = getEnt("trap3_triggers"+i, "targetname");
		
	
	for(i = 0; i < 40; i++)
		platforms_green[i] = getEnt("trap3_plat"+i, "targetname");
	
	for(i = 0; i < 40; i++){
		platforms_red[i] = getent("trap3_plat_red"+i, "targetname");
		platforms_red[i] hide();
		platforms_red[i] notsolid();
	}
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 
	
	temp_green = platforms_green;
	temp_red = platforms_red;

	for( i = 0; i < 11; i++ ){
		ran = randomint(temp_green.size);
		
		green = temp_green[ran];
		red = temp_red[ran];
		
		green hide();
		green notsolid();
		
		red show();
		red solid();
		
		triggers[i].origin = red.origin;
		
		temp_green = removeFromArray( temp_green, green );
		temp_red   = removeFromArray( temp_red,   red   );
	}
}	

trap4() {
	trigger = getent ("trap4_trigger", "targetname");
	object = getent ("trap4_spikes", "targetname");
	dmg = getent ("trap4_dmg", "targetname");
	
	dmg enablelinkto();
	dmg linkto (object);
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object moveZ (-272, 1);
	object waittill ("movedone");
	wait 2;
	object moveZ (272, 1);
	object waittill ("movedone");
}

trap5() {
	trigger = getent ("trap5_trigger", "targetname");
	object = getent ("trap5_pusher", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object moveY (635, 1);
	object waittill("movedone");
	wait 2;
	object moveY (-635, 1);
	object waittill("movedone");
}

trap6() {
	trigger = getent ("trap6_trigger", "targetname");
	object = getent ("trap6_bounce", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object notsolid();
	wait 4;
	object solid();
}

trap7() {
	trigger = getent ("trap7_trigger", "targetname");
	object = getent ("trap7_spike", "targetname");
	dmg = getent ("trap7_dmg", "targetname");
	
	dmg enablelinkto();
	dmg linkto (object);
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object moveY (-836, 1);
	object waittill ("movedone");
	wait 1.4;
	object moveY (836, 1);
	object waittill ("movedone");
}
		
trap8() {
	trigger = getent ("trap8_trigger", "targetname");
	object = getent ("trap8_wall", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	while(true) {
		object moveZ (-92, 0.05);
		object waittill ("movedone");
		wait 2;
		object moveZ (92, 2);
		object waittill ("movedone");
		wait 4;
	}
}

trap9() {
	trigger = getent ("trap9_trigger", "targetname");
	object = getent ("trap9_wall", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object notsolid();
	object hide();
	
	wait 2;
	
	object solid();
	object show();
}

trap10() {
	trigger = getent ("trap10_trigger", "targetname");
	object1 = getent ("trap10_wall1", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 
	
	thread trap10_2();	
	thread trap10_3();	
		
	while(true) {
		object1 moveZ (-45, 0.5);
		object1 waittill ("movedone");
		object1 moveZ (45, 0.5);
		object1 waittill ("movedone");
	}
}

trap10_2() {
	object2 = getent ("trap10_wall2", "targetname");

	while(true) {
		object2 moveY (45, 0.5);
		object2 waittill ("movedone");
		object2 moveY (-45, 0.5);
		object2 waittill ("movedone");
	}
}

trap10_3() {
	object3 = getent ("trap10_wall3", "targetname");

	while(true) {
		object3 moveX (-45, 0.5);
		object3 waittill ("movedone");
		object3 moveX (45, 0.5);
		object3 waittill ("movedone");
	}
}

trap11() {
	trigger = getent ("trap11_trigger", "targetname");
	object = getent ("trap11_bounce", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 

	object moveZ (150, 1);
	object waittill ("movedone");
	wait 2;
	object moveZ (-150, 1);
	object waittill ("movedone");
	wait 4;
	object hide();
	object notsolid();
	wait 2;
	object show();
	object solid();
}


trap12() {
	trigger = getent ("trap12_trigger", "targetname");
	roll = getent ("trap12_roll1", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Activate!");
	trigger waittill ("trigger", Player);
	trigger setHintString ("^1Trap Activated!"); 
	
	thread trap12_roll();
	
	while(true) {
		roll rotatepitch (15550, 2);
		wait 6.5;		
	}
}

trap12_roll() {
	roll = getent ("trap12_roll2", "targetname");
	
	while(true) {
		roll rotatepitch (-15550, 2);
		wait 6.5;		
	}
}


////////////////////////// Double Bounce

doublebounce()	// script by  DanTheMan
{
    for(;;){
		self waittill("trigger", player);
		
		if(!isDefined(player.bouncing))
		player thread player_bounce(self);
    }
}

player_bounce(trigger)
{
    self.bouncing = true;
    vel = self getVelocity();
    temp0 = (((vel[0] < 350 && vel[0] > 0) || (vel[0] > -350 && vel[0] < 0)));
    temp1 = (((vel[1] < 350 && vel[1] > 0) || (vel[1] > -350 && vel[1] < 0)));

    if((!temp0 && !temp1) || vel[2] > -350)
    {
        wait 1;
        self.bouncing = undefined;
        return;
    }

    health    = self.health;
    maxHealth = self.maxHealth;
    self.health    = 1000000;
    self.maxhealth = 1000000;
    setDvar("g_knockback", (vel[2]*-9)-500);
    self finishPlayerDamage(self, self, 1000, 0, "MOD_UNKNOWN", "bounce", self.origin, (0,0,1) , "none", 0);
    wait 0.05;
    setDvar("g_knockback", level.knockback);
    self.health    = health;
    self.maxhealth = maxHealth;
    while(self isTouching(trigger))
    wait 0.05;
    self.bouncing = undefined;
}	

/////////////////////////// Teleports

stage2() {
	trigger = getent ("stage2_teleport", "targetname");
	target = getent ("stage2_target", "targetname");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}
	
stage3() {
	trigger = getent ("stage3_teleport", "targetname");
	target = getent ("stage3_target", "targetname");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}
	
stage4() {
	trigger = getent ("stage4_teleport", "targetname");
	target = getent ("stage4_target", "targetname");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

actistage2() {
	trigger = getent ("activator_stage2", "targetname");
	target = getent ("activator_stage2_target", "targetname");
	
	trigger setHintString ("^7Press ^3[Use] ^7to Teleport to next Stage!");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

actistage3() {
	trigger = getent ("activator_stage3", "targetname");
	target = getent ("activator_stage3_target", "targetname");

	trigger setHintString ("^7Press ^3[Use] ^7to Teleport to next Stage!");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

actistage4() {
	trigger = getent ("activator_stage4", "targetname");
	target = getent ("activator_stage4_target", "targetname");

	trigger setHintString ("^7Press ^3[Use] ^7to Teleport to next Stage!");
	
	for(;;)	{
		trigger waittill ("trigger", player);
		player freezeControls(true);
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		wait 0.5;
		player freezeControls(false);
	}
}

TeleActiToTheEnd() {
		level.trigger = getent ("acti_teleport_jumper_trigger", "targetname");
		target = getent ("acti2_teleport_target", "targetname");
		
		level.trigger waittill( "trigger", player );
		level.trigger delete();
		
		if( isDefined( level.activ) ){
		level.activ freezeControls(true);
		level.activ SetOrigin( target.origin );
		level.activ setplayerangles( target.angles );
		wait 0.5;
		level.activ freezeControls(false);
		
	}
}

sniperlift_acti() {
	trigger = getent ("acti_lift","targetname");
	fly1 = getent ("acti_fly1","targetname");
	fly2 = getent ("acti_fly2","targetname");
	fly3 = getent ("acti_fly3","targetname");
	fly4 = getent ("acti_fly4","targetname");

	while(1)
	{
	for(;;)
	{
		trigger waittill ("trigger", player);
		if (player istouching(trigger))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly1.origin, 0.5);
			wait 0.5;
			fly moveto (fly2.origin, 0.5);
			wait 0.5;
			fly moveto (fly3.origin, 0.5);
			wait 0.5;
			fly moveto (fly4.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	

sniperlift_jumper() {
	trigger = getent ("jumper_lift","targetname");
	fly1 = getent ("jumper_fly1","targetname");
	fly2 = getent ("jumper_fly2","targetname");
	fly3 = getent ("jumper_fly3","targetname");
	fly4 = getent ("jumper_fly4","targetname");

	while(1)
	{
	for(;;)
	{
		trigger waittill ("trigger", player);
		if (player istouching(trigger))
		{
			fly = spawn ("script_model",(0,0,0));
			fly.origin = player.origin;
			fly.angles = player.angles;
			player linkto (fly);
			fly moveto (fly1.origin, 0.5);
			wait 0.5;
			fly moveto (fly2.origin, 0.5);
			wait 0.5;
			fly moveto (fly3.origin, 0.5);
			wait 0.5;
			fly moveto (fly4.origin, 0.5);
			wait 1;
			player unlink();
			wait 1;
		}
	}
}
}	


bouncerespawn() {
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

bounceweapon() {
	trigger = getent ("bounce_room_weapon", "targetname");
	
	while(true) {
		trigger waittill ("trigger", user);
		
		user giveWeapon("remington700_mp", 100, 500 );
		user switchToWeapon("remington700_mp");	
	}	
}


removeFromArray(array, item)
{
	for (i=0; i<array.size; i++)
	{
		if (array[i] == item)
		{
			for (; i<array.size - 1; i++)
			{
				array[i] = array[i+1];
			}
			array[array.size-1] = undefined;
			return array;
		}
	}
	return array;
}

arrayContains(array, item){
	for(i = 0; i < array.size; i++){
		if(array[i] == item)
			return true;
	}
	return false;
}
//////////////////////////Rifle Stand

rilestand() {
	trigger = getent ("riflestand_trigger", "targetname");
	level.object = getent  ("riflestand", "targetname");
	target1 = getent ("riflestand_target1", "targetname");
	target2 = getent ("riflestand_target2", "targetname");
	target3 = getent ("riflestand_target3", "targetname");
	target4 = getent ("riflestand_target4", "targetname");
	
	

	oldorigin = level.object.origin;
	
	trigger waittill ("trigger", player);
	thread nodmg();
	trigger delete();
	wait 3;
	while(true) {
		level.object moveto (target1.origin, 2, 1, 1);
		level.object waittill ("movedone");
		level.object rotateyaw (-90, 1);
		level.object waittill ("rotatedone");
		level.object moveto (target2.origin, 2, 1, 1);
		level.object waittill ("movedone");
		level.object rotateyaw (-90, 1);
		level.object waittill ("rotatedone");
		level.object moveto (target3.origin, 4, 2, 2);
		level.object waittill ("movedone");
		level.object rotateyaw (-90, 1);
		level.object waittill ("rotatedone");
		level.object moveto (target4.origin, 2, 1, 1);
		level.object waittill ("movedone");
		level.object rotateyaw (-90, 1);
		level.object waittill ("rotatedone");
		level.object moveto (oldorigin, 2, 1, 1);
		level.object waittill ("movedone");
		wait 3;
	}
}

nodmg() {
	target1 = getent ("riflestand_target1", "targetname");
	target2 = getent ("riflestand_target2", "targetname");
	target3 = getent ("riflestand_target3", "targetname");
	target4 = getent ("riflestand_target4", "targetname");
	level.nodmg = getent ("rifle_nodmg", "targetname");
	
	oldorigin = level.nodmg.origin;
	wait 3;
	while(true) {
		level.nodmg moveto (target1.origin, 2, 1, 1);
		level.nodmg waittill ("movedone");
		level.nodmg rotateyaw (-90, 1);
		level.nodmg waittill ("rotatedone");
		level.nodmg moveto (target2.origin, 2, 1, 1);
		level.nodmg waittill ("movedone");
		level.nodmg rotateyaw (-90, 1);
		level.nodmg waittill ("rotatedone");
		level.nodmg moveto (target3.origin, 4, 2, 2);
		level.nodmg waittill ("movedone");
		level.nodmg rotateyaw (-90, 1);
		level.nodmg waittill ("rotatedone");
		level.nodmg moveto (target4.origin, 2, 1, 1);
		level.nodmg waittill ("movedone");
		level.nodmg rotateyaw (-90, 1);
		level.nodmg waittill ("rotatedone");
		level.nodmg moveto (oldorigin, 2, 1, 1);
		level.nodmg waittill ("movedone");
		wait 3;
	}
}

riflerpg() {
	trigger = getent ("riflestand_rpg_trigger", "targetname");
	object = getent ("riflestand_rpg", "targetname");
	// object thread rpgRotate();
	object linkto(level.object);
	trigger enablelinkto();
	trigger linkto(level.object);
	
	step1 = getent ("rpg_step1", "targetname");
	step2 = getent ("rpg_step2", "targetname");
	step3 = getent ("rpg_step3", "targetname");
	platform = getent ("rpg_platform", "targetname");
	wall = getent ("rpg_wall", "targetname");
	rpgs = getent ("rpg_rpgs", "targetname");
	rahmen = getent ("rpg_rahmen", "targetname");
	moreobject = getent ("more_more_rpgs_brush", "targetname");
	model1 = getent ("rpg_model1", "targetname");
	model2 = getent ("rpg_model2", "targetname");
	model3 = getent ("rpg_model3", "targetname");
	model4 = getent ("rpg_model4", "targetname");
	model5 = getent ("rpg_model5", "targetname");
	model6 = getent ("rpg_model6", "targetname");
	model7 = getent ("rpg_model7", "targetname");
	model8 = getent ("rpg_model8", "targetname");
	model9 = getent ("rpg_model9", "targetname");
	model10 = getent ("rpg_model10", "targetname");
	model11 = getent ("rpg_model11", "targetname");
	model12 = getent ("rpg_model12", "targetname");
	model13 = getent ("rpg_model13", "targetname");
	model14 = getent ("rpg_model14", "targetname");
	
	step1 notsolid();
	step1 hide();
	step2 notsolid();
	step2 hide();
	step3 notsolid();
	step3 hide();
	platform notsolid();
	platform hide();
	rahmen hide();
	rahmen notsolid();
	moreobject hide();
	moreobject notsolid();
	rpgs hide();
	rpgs notsolid();
	wall notsolid();
	wall hide();
	model1 hide();
	model2 hide();
	model3 hide();
	model4 hide();
	model5 hide();
	model6 hide();
	model7 hide();
	model8 hide();
	model9 hide();
	model10 hide();
	model11 hide();
	model12 hide();
	model13 hide();
	model14 hide();
		
	trigger waittill ("trigger", player);

	thread morerpgshow();
	player giveWeapon("rpg_mp", 100, 500 );
	player switchToWeapon("rpg_mp");
	object delete();
	trigger delete();

}

rpgRotate(){
	self endon("death");
	
	while(true) {
		self rotateyaw (360, 2);
		wait 2;
	}
}


rpg_door_open() {
	trigger = getent ("rpg_door_open", "targetname");
	object = getent ("rpg_door", "targetname");
	
	trigger waittill ("trigger", player);
	trigger delete();
	iprintlnbold ("Door opened^3!");
	
	object moveZ (-435, 1);
}

morerpgshow() {
	step1 = getent ("rpg_step1", "targetname");
	step2 = getent ("rpg_step2", "targetname");
	step3 = getent ("rpg_step3", "targetname");
	platform = getent ("rpg_platform", "targetname");
	wall = getent ("rpg_wall", "targetname");
	rpgs = getent ("rpg_rpgs", "targetname");
	rahmen = getent ("rpg_rahmen", "targetname");
	moreobject = getent ("more_more_rpgs_brush", "targetname");
	model1 = getent ("rpg_model1", "targetname");
	model2 = getent ("rpg_model2", "targetname");
	model3 = getent ("rpg_model3", "targetname");
	model4 = getent ("rpg_model4", "targetname");
	model5 = getent ("rpg_model5", "targetname");
	model6 = getent ("rpg_model6", "targetname");
	model7 = getent ("rpg_model7", "targetname");
	model8 = getent ("rpg_model8", "targetname");
	model9 = getent ("rpg_model9", "targetname");
	model10 = getent ("rpg_model10", "targetname");
	model11 = getent ("rpg_model11", "targetname");
	model12 = getent ("rpg_model12", "targetname");
	model13 = getent ("rpg_model13", "targetname");
	model14 = getent ("rpg_model14", "targetname");
	thread getmuchrpg();
	thread getrpg1();
	thread getrpg2();
	thread getrpg3();
	thread getrpg4();
	thread getrpg5();
	thread getrpg6();
	thread getrpg7();
	thread getrpg8();
	thread getrpg9();
	thread getrpg10();
	thread getrpg11();
	thread getrpg12();
	thread getrpg13();
	thread getrpg14();
	wait 4;	
	step1 show();
	step1 solid();	
	wait 0.5;	
	step2 show();
	step2 solid();	
	wait 0.5;	
	step3 show();
	step3 solid();	
	wait 0.5;	
	platform show();
	platform solid();	
	wait 0.5;
	rahmen show();
	moreobject show();
 	rpgs show();
	wall show();
	wall solid();	
	wait 0.5;	
	model1 show();	
	wait 0.2;	
	model2 show();	
	wait 0.2;	
	model3 show();	
	wait 0.2;	
	model4 show();	
	wait 0.2;	
	model5 show();	
	wait 0.2;	
	model6 show();	
	wait 0.2;		
	model7 show();	
	wait 0.2;	
	model8 show();	
	wait 0.2;	
	model9 show();	
	wait 0.2;	
	model10 show();
	wait 0.2;	
	model11 show();	
	wait 0.2;	
	model12 show();	
	wait 0.2;	
	model13 show();	
	wait 0.2;		
	model14 show();
}	

getmuchrpg() {
	trigger = getent ("more_more_rpgs_trigger", "targetname");
	while(1) {
	
	trigger setcursorhint ("HINT_ACTIVATE");
	trigger setHintString ("Get an RPG");	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	}

}	
	
getrpg1() {
	trigger = getent ("rpg_trigger1", "targetname");
	model = getent ("rpg_model1", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg2() {
	trigger = getent ("rpg_trigger2", "targetname");
	model = getent ("rpg_model2", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg3() {
	trigger = getent ("rpg_trigger3", "targetname");
	model = getent ("rpg_model3", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg4() {
	trigger = getent ("rpg_trigger4", "targetname");
	model = getent ("rpg_model4", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg5() {
	trigger = getent ("rpg_trigger5", "targetname");
	model = getent ("rpg_model5", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg6() {
	trigger = getent ("rpg_trigger6", "targetname");
	model = getent ("rpg_model6", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg7() {
	trigger = getent ("rpg_trigger7", "targetname");
	model = getent ("rpg_model7", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg8() {
	trigger = getent ("rpg_trigger8", "targetname");
	model = getent ("rpg_model8", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}		
getrpg9() {
	trigger = getent ("rpg_trigger9", "targetname");
	model = getent ("rpg_model9", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
			
getrpg10() {
	trigger = getent ("rpg_trigger10", "targetname");
	model = getent ("rpg_model10", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
			
getrpg11() {
	trigger = getent ("rpg_trigger11", "targetname");
	model = getent ("rpg_model11", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
			
getrpg12() {
	trigger = getent ("rpg_trigger12", "targetname");
	model = getent ("rpg_model12", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
			
getrpg13() {
	trigger = getent ("rpg_trigger13", "targetname");
	model = getent ("rpg_model13", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
			
getrpg14() {
	trigger = getent ("rpg_trigger14", "targetname");
	model = getent ("rpg_model14", "targetname");
	
	trigger waittill ("trigger", player);

	player giveWeapon("rpg_mp", 100, 500 );
	player givemaxammo ("rpg_mp");
	player switchToWeapon("rpg_mp");
	model delete();
	trigger delete();	
}	
	
////////////////////////////////////////////// Rolltreppe
rolltreppe_fix(){
	object = getent ("rolltreppe", "targetname");
	wait 2;
	object moveZ (-20, 1);
	wait 1;
	thread rolltreppe_move();
	}


rolltreppe_move()
{
	rolltreppe = getent ("rolltreppe","targetname");
	rolltreppe thread move();
}

move()
{
	stufe = [];
	speed = .3; // Geschwindigkeit der Rolltreppe (je niedriger der Wert, desto schneller)
	anzahl = 36; // Anzahl aller Treppenstufen
	stufe[0] = getent(self.target,"targetname");
	for (i = 0; i < anzahl; i++)
		stufe[i+1] = getent(stufe[i].target,"targetname");
	 
	while(1)
	{
		self moveto(stufe[0].origin,speed);
		for (j = 0; j < anzahl; j++)
			stufe[j] moveto(stufe[j+1].origin,speed);
		stufe[anzahl-1] waittill ("movedone");
	}
}

/////////////////////////Endrooms + Queue

endroomQueueSetup(){
	level.sniper_endroom = getent ("sniper_trigger", "targetname");
	level.knife_trigger = getent ("knife_trigger", "targetname");
	level.bounce_trigger = getent ("bounce_trigger", "targetname");
	level.run_trigger = getent ("run_trigger", "targetname");
	level.trampolin_trigger = getent ("trampolin_trigger", "targetname");
	level.tank_trigger = getent ("tank_trigger", "targetname");
	level.randomweap_trigger = getent ("randomweap_trigger", "targetname");
	
	players = getPlayingPlayers();
	for( i = 0; i < players.size; i++)
		players[i] thread removePlayerOnStuff();
	
	level.playerQueue = [];
	level.selectedEndroom = "";
	
}

watchEndrooms(){
	
	while(1){
		level waittill("start_endroom_fight", player);
		
		switch( level.selectedEndroom ){
			case "sniper": player thread SniperFight(); break;
			case "knife": player thread KnifeFight(); break;
			case "bounce": player thread BounceFight(); break;
			case "run": player thread RunFight(); break;
			case "trampolin": player thread TeampolinFight(); break;
			case "tank": player thread maps\mp\tank::startTank(); break;
			case "randomweap": player thread RandomWeapFight(); break;
			
		}
	}
}

sniperRoomTrigger(){
	level.sniper_endroom endon( "death" );
	self endon( "kill afk monitor" );

	while( 1 ){
		 level.sniper_endroom waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "sniper" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.knife_trigger delete();
			level.bounce_trigger delete();
			level.run_trigger delete();
			level.trampolin_trigger delete();
			level.tank_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "sniper";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the sniper room!");
			warteraum = getent ("warteschlange_eins", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}


KnifeRoomTrigger(){
	level.knife_trigger endon("death");

	while( 1 ){
		level.knife_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "knife" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.bounce_trigger delete();
			level.run_trigger delete();
			level.trampolin_trigger delete();
			level.tank_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "knife";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the knife room!");
			warteraum = getent ("warteschlange_zwei", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}

BounceRoomTrigger(){
	level.bounce_trigger endon("death");

	while( 1 ){
		level.bounce_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "bounce" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.knife_trigger delete();
			level.run_trigger delete();
			level.trampolin_trigger delete();
			level.tank_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "bounce";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the bounce room!");
			warteraum = getent ("warteschlange_drei", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}

RunRoomTrigger(){
	level.run_trigger endon("death");

	while( 1 ){
		level.run_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "run" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.knife_trigger delete();
			level.bounce_trigger delete();
			level.trampolin_trigger delete();
			level.tank_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "run";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the run room!");
			warteraum = getent ("warteschlange_vier", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}

TrampolinRoomTrigger(){
	level.trampolin_trigger endon("death");

	while( 1 ){
		level.trampolin_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "trampolin" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.knife_trigger delete();
			level.bounce_trigger delete();
			level.run_trigger delete();
			level.tank_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "trampolin";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the trampolin room!");
			warteraum = getent ("warteschlange_fuenf", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}

tankRoomTrigger(){
	level.tank_trigger endon("death");

	while( 1 ){
		level.tank_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "tank" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.knife_trigger delete();
			level.bounce_trigger delete();
			level.run_trigger delete();
			level.trampolin_trigger delete();
			level.randomweap_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "tank";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the tank room!");
			warteraum = getent ("warteschlange_sechs", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}
	}
}

RandomWeapRoomTrigger(){
	level.randomweap_trigger endon("death");

	while( 1 ){
		level.randomweap_trigger waittill("trigger", player);
		
		if( level.selectedEndroom != "" && level.selectedEndroom != "randomweap" ){
			iprintlnbold("Other room was chosen and this text should not be visible!"); 
			return;
		}
		
		if( level.selectedEndroom == ""){
			level.sniper_endroom delete();
			level.knife_trigger delete();
			level.bounce_trigger delete();
			level.run_trigger delete();
			level.trampolin_trigger delete();
			level.tank_trigger delete();
			level.oldway_trigger delete();
			level.selectedEndroom = "randomweap";
		}
		
		if( arrayContains(level.playerQueue, player) ){
			continue;
		}
			
		if( level.playerQueue.size > 0 ){
			player notify("kill afk monitor");
			level.playerQueue[level.playerQueue.size] = player;
			player iprintlnbold("You are now on place " + level.playerQueue.size + " for the random weapons room!");
			warteraum = getent ("warteschlange_sieben", "targetname");
			player setOrigin(warteraum.origin);
		}
		else{
			level.playerQueue[level.playerQueue.size] = player;			
			level notify("start_endroom_fight", player);
		}		
	}
}


SniperFight(){
	
	self endon("disconnect");
	self endon("player_spectator");

	level.actiorigin = getent ("snip_acti_teleport", "targetname");
	teleorigin = getent ("sniper_jumper_teleport", "targetname");
	
				
	wait(0.05);
	
	self freezeControls(true);
	self setorigin (teleorigin.origin);
	self setplayerangles (teleorigin.angles);
	wait 0.5;
	self freezeControls(false);
	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3 HAS ENTERED THE SNIPER ROOM^7!"); // change the massage if you want
	self takeallweapons();
	self GiveWeapon("m40a3_mp");
	self GiveWeapon("remington700_mp");
	self SwitchToWeapon( "m40a3_mp" );
	
	if( isDefined( level.activ ) ){
		level.activ freezeControls(true);
		level.activ SetOrigin( level.actiorigin.origin );
		level.activ setplayerangles( level.actiorigin.angles );
		wait 0.5;
		level.activ freezeControls(false);
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ takeallweapons();	
		level.activ GiveWeapon("m40a3_mp");
		level.activ GiveWeapon("remington700_mp");
		level.activ SwitchToWeapon( "m40a3_mp" );
	}
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}

knifeFight(){
	
	self endon("disconnect");
	self endon("player_spectator");

	level.actiorigin = getent ("knife_acti_teleport", "targetname");
	teleorigin = getent ("knife_jumper_teleport", "targetname");
	
				
	wait(0.05);
	
	self freezeControls(true);
	self setorigin (teleorigin.origin);
	self setplayerangles (teleorigin.angles);
	wait 0.5;
	self freezeControls(false);
	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3 HAS ENTERED THE KNIFE ROOM^7!"); // change the massage if you want
	self takeallweapons();
	self GiveWeapon("knife_mp");
	self SwitchToWeapon( "knife_mp" );
	
	if( isDefined( level.activ ) ){
		level.activ freezeControls(true);
		level.activ SetOrigin( level.actiorigin.origin );
		level.activ setplayerangles( level.actiorigin.angles );
		wait 0.5;
		level.activ freezeControls(false);
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ takeallweapons();	
		level.activ GiveWeapon("knife_mp");
		level.activ SwitchToWeapon( "knife_mp" );
	}
	
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}

BounceFight(){
	
	self endon("disconnect");
	self endon("player_spectator");

	level.actiorigin = getent ("bounce_acti_teleport", "targetname");
	teleorigin = getent ("bounce_jumper_teleport", "targetname");
	
				
	wait(0.05);
	
	self freezeControls(true);
	self setorigin (teleorigin.origin);
	self setplayerangles (teleorigin.angles);
	wait 0.5;
	self freezeControls(false);
	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3 HAS ENTERED THE BOUNCE ROOM^7!"); // change the massage if you want
	self takeallweapons();
	self GiveWeapon("tomahawk_mp");
	self SwitchToWeapon( "tomahawk_mp" );
	
	if( isDefined( level.activ ) ){
		level.activ SetOrigin( level.actiorigin.origin );
		level.activ setplayerangles( level.actiorigin.angles );
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ freezeControls(true);
		level.activ takeallweapons();	
		level.activ GiveWeapon("tomahawk_mp");
		level.activ SwitchToWeapon( "tomahawk_mp" );
		wait 0.5;
		level.activ freezeControls(false);
	}
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}

RandomWeapFight(){
	
	self endon("disconnect");
	self endon("player_spectator");
	
	level.actiorigin1 = getent ("randomweap_acti_teleport_1", "targetname");
	level.actiorigin2 = getent ("randomweap_acti_teleport_2", "targetname");
	level.actiorigin3 = getent ("randomweap_acti_teleport_3", "targetname");
	teleorigin1 = getent ("randomweap_jumper_teleport_1", "targetname");
	teleorigin2 = getent ("randomweap_jumper_teleport_2", "targetname");
	teleorigin3 = getent ("randomweap_jumper_teleport_3", "targetname");
	
				
	wait(0.05);

	random = randomInt(3);	
	switch(random){
		case 0: self freezeControls(true);
				self setorigin (teleorigin1.origin);
				self setplayerangles (teleorigin1.angles);
				wait 0.5;
				self freezeControls(false); 
				break;
		case 1: self freezeControls(true);
				self setorigin (teleorigin2.origin);
				self setplayerangles (teleorigin2.angles);
				wait 0.5;
				self freezeControls(false);
				break;
		case 2: self freezeControls(true);
				self setorigin (teleorigin3.origin);
				self setplayerangles (teleorigin3.angles); 
				wait 0.5;
				self freezeControls(false);
				break;
	}
	self thread jumperweap();

	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3 HAS ENTERED THE RANDOM WEAPON ROOM^7!"); // change the massage if you want
	
	
	random = randomInt(3);	
	switch(random){
		case 0: if( isDefined( level.activ ) ){
				level.activ freezeControls(true);
				level.activ SetOrigin (level.actiorigin1.origin);
				level.activ setplayerangles (level.actiorigin1.angles);
				wait 0.5;
				level.activ freezeControls(false);
				}
				break;
		case 1: if( isDefined( level.activ ) ){
				level.activ freezeControls(true);
				level.activ SetOrigin (level.actiorigin2.origin);
				level.activ setplayerangles (level.actiorigin2.angles);
				wait 0.5;
				level.activ freezeControls(false);
				}
				break;
		case 2: if( isDefined( level.activ ) ){
				level.activ freezeControls(true);
				level.activ SetOrigin (level.actiorigin3.origin);
				level.activ setplayerangles (level.actiorigin3.angles); 
				wait 0.5;
				level.activ freezeControls(false);
				}
				break;
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ thread actiweap();
	}
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}

jumperweap()
{
	wait 0.25;
	random = randomInt(14);
	
	switch(random){
		case 0: self takeallweapons();
				self giveWeapon("deserteagle_mp", 100, 500 );
				self switchToWeapon("deserteagle_mp"); break;
				
		case 1: self takeallweapons();
				self giveWeapon("uzi_mp", 100, 500 );
				self switchToWeapon("uzi_mp"); break;
				
		case 2: self takeallweapons();
				self giveWeapon("m4_mp", 100, 500 );
				self switchToWeapon("m4_mp"); break;
				
		case 3: self takeallweapons();
				self giveWeapon("ak47_mp", 100, 500 );
				self switchToWeapon("ak47_mp"); break;
				
		case 4: self takeallweapons();
				self giveWeapon("g3_mp", 100, 500 );
				self switchToWeapon("g3_mp"); break;
				
		case 5: self takeallweapons();
				self giveWeapon("m60e4_mp", 100, 500 );
				self switchToWeapon("m60e4_mp"); break;
				
		case 6: self takeallweapons();
				self giveWeapon("p90_mp", 100, 500 );
				self switchToWeapon("p90_mp"); break;
				
		case 7: self takeallweapons();
				self giveWeapon("m40a3_mp", 100, 500 );
				self switchToWeapon("m40a3_mp"); break;
				
		case 8: self takeallweapons();
				self giveWeapon("barrett_mp", 100, 500 );
				self switchToWeapon("barrett_mp"); break;
				
		case 9: self takeallweapons();
				self giveWeapon("g36c_silencer_mp", 100, 0 );
				self switchToWeapon("g36c_silencer_mp"); break;
				
		case 10: self takeallweapons();
			 	 self giveWeapon("skorpion_silencer_mp", 100, 500 );
				 self switchToWeapon("skorpion_silencer_mp"); break;
				
		case 11: self takeallweapons();
				 self giveWeapon("saw_grip_mp", 100, 500 );
			 	 self switchToWeapon("saw_grip_mp"); break;
				
		case 12: self takeallweapons();
				 self giveWeapon("remington700_mp", 100, 500 );
				 self switchToWeapon("remington700_mp"); break;
				
		case 13: self takeallweapons();
				 self giveWeapon("ak74u_mp", 100, 500 );
				 self switchToWeapon("ak74u_mp"); break;

		}
}


actiweap()
{
	wait 0.25;
	random = randomInt(14);
	
	switch(random){
		case 0: self takeallweapons();
				self giveWeapon("deserteagle_mp", 100, 500 );
				self switchToWeapon("deserteagle_mp"); break;
				
		case 1: self takeallweapons();
				self giveWeapon("uzi_mp", 100, 500 );
				self switchToWeapon("uzi_mp"); break;
				
		case 2: self takeallweapons();
				self giveWeapon("m4_mp", 100, 500 );
				self switchToWeapon("m4_mp"); break;
				
		case 3: self takeallweapons();
				self giveWeapon("ak47_mp", 100, 500 );
				self switchToWeapon("ak47_mp"); break;
				
		case 4: self takeallweapons();
				self giveWeapon("g3_mp", 100, 500 );
				self switchToWeapon("g3_mp"); break;
				
		case 5: self takeallweapons();
				self giveWeapon("m60e4_mp", 100, 500 );
				self switchToWeapon("m60e4_mp"); break;
				
		case 6: self takeallweapons();
				self giveWeapon("p90_mp", 100, 500 );
				self switchToWeapon("p90_mp"); break;
				
		case 7: self takeallweapons();
				self giveWeapon("m40a3_mp", 100, 500 );
				self switchToWeapon("m40a3_mp"); break;
				
		case 8: self takeallweapons();
				self giveWeapon("barrett_mp", 100, 500 );
				self switchToWeapon("barrett_mp"); break;
				
		case 9: self takeallweapons();
				self giveWeapon("g36c_silencer_mp", 100, 0 );
				self switchToWeapon("g36c_silencer_mp"); break;
				
		case 10: self takeallweapons();
			 	 self giveWeapon("skorpion_silencer_mp", 100, 500 );
				 self switchToWeapon("skorpion_silencer_mp"); break;
				
		case 11: self takeallweapons();
				 self giveWeapon("saw_grip_mp", 100, 500 );
			 	 self switchToWeapon("saw_grip_mp"); break;
				
		case 12: self takeallweapons();
				 self giveWeapon("remington700_mp", 100, 500 );
				 self switchToWeapon("remington700_mp"); break;
				
		case 13: self takeallweapons();
				 self giveWeapon("ak74u_mp", 100, 500 );
				 self switchToWeapon("ak74u_mp"); break;

		}
}


RunFight(){
	
	self endon("disconnect");
	self endon("player_spectator");

	level.actiorigin = getent ("run_acti_teleport", "targetname");
	teleorigin = getent ("run_jumper_teleport", "targetname");
	
				
	wait(0.05);
	
	self setorigin (teleorigin.origin);
	self setplayerangles (teleorigin.angles);

	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3HAS ENTERED THE WALLRUN ROOM^7!"); // change the massage if you want
	self takeallweapons();
	self GiveWeapon("knife_mp");
	self SwitchToWeapon( "knife_mp" );
	self freezeControls(true);
	self thread starttime_jumper();
	
	if( isDefined( level.activ ) ){
		level.activ SetOrigin( level.actiorigin.origin );
		level.activ setplayerangles( level.actiorigin.angles );
		
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ takeallweapons();	
		level.activ GiveWeapon("knife_mp");
		level.activ SwitchToWeapon( "knife_mp" );
		level.activ freezeControls(true);
		level.activ thread starttime_acti();
	}

	self thread runanimat();
	self thread wallrunfalldown();
	self thread wallrunfinish();
	
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}

starttime_jumper() {
	wait 2;
	self iprintlnbold("^3P^7repare yourself to run^3!");
	wait 1;
	self iprintlnbold("^13");
	wait 1;
	self iprintlnbold("^32");
	wait 1;
	self iprintlnbold("^21");
	wait 1;
	self iprintlnbold("^2RUUUUUUUN");
	self freezeControls(false);
}

starttime_acti() {
	wait 2;
	level.activ iprintlnbold("^3P^7repare yourself to run^3!");
	wait 1;
	level.activ iprintlnbold("^13");
	wait 1;
	level.activ iprintlnbold("^32");
	wait 1;
	level.activ iprintlnbold("^21");
	wait 1;
	level.activ iprintlnbold("^2RUUUUUUUN");
	level.activ freezeControls(false);
}

runanimat() {

	level endon ("game_ended");
	level notify ("kill_runanimat");
	level endon ("kill_runanimat");
	self endon ("death");
	self endon ("disconnect");
	self endon ("joined_spectators");
	
	sensor = getent ("wallrun_sensor", "targetname");
	wall = getent ("wallrun_wall", "targetname");
	end = getent ("wallrun_end", "targetname");
	
	jumper = getent ("wallrun_end_jumper", "targetname");
	acti = getent ("wallrun_end_acti", "targetname");
	
	if( isDefined( level.oldposition ) )
		wall.origin = level.oldposition;
	else
		level.oldposition = wall.origin;
	
	sensor enablelinkto();
	sensor linkto(wall);
	wait 6.5;
	wall moveto (end.origin, 25, 7, 2 );
	
	sensor waittill ("trigger", player);
	if( level.activ != player ) // Jumper
	{
		self SetOrigin(jumper.origin);
		self SetPlayerAngles( jumper.angles );
		self freezeControls(true);
		
		if( isDefined( level.activ ) && isAlive( level.activ ) ){
			level.activ setOrigin( acti.origin );
			level.activ setPlayerangles( acti.angles );
		}
	}
	else	// Acti
	{
		if( isDefined( player ) ){
			level.activ SetOrigin(acti.origin);
			level.activ SetPlayerAngles( acti.angles );	
			level.activ freezeControls(true);
			
			self SetOrigin(jumper.origin);
			self SetPlayerAngles( jumper.angles );
		}
			
		
			
	}

}


wallrunfalldown() {
	sensor = getent ("wallrun_sensor_bottum", "targetname");
	jumper = getent ("wallrun_end_jumper", "targetname");
	acti = getent ("wallrun_end_acti", "targetname");	

	sensor waittill ("trigger", player);
	if( level.activ != player ) // Jumper
	{
		self SetOrigin(jumper.origin);
		self SetPlayerAngles( jumper.angles );
		self freezeControls(true);
		
		if( isDefined( level.activ ) && isAlive( level.activ ) ){
			level.activ setOrigin( acti.origin );
			level.activ setPlayerangles( acti.angles );
		}
	}
	else	// Acti
	{
		if( isDefined( player ) ){
			level.activ SetOrigin(acti.origin);
			level.activ SetPlayerAngles( acti.angles );	
			level.activ freezeControls(true);
			
			self SetOrigin(jumper.origin);
			self SetPlayerAngles( jumper.angles );
		}
			
		
			
	}
	
}

wallrunfinish() {
	sensor = getent ("wallrun_sensor_finish", "targetname");
	jumper = getent ("wallrun_end_jumper", "targetname");
	acti = getent ("wallrun_end_acti", "targetname");	
	
	sensor waittill ("trigger", player);
	if( level.activ != player ) // Jumper
	{
		self SetOrigin(jumper.origin);
		self SetPlayerAngles( jumper.angles );
		
		
		if( isDefined( level.activ ) && isAlive( level.activ ) ){
			level.activ setOrigin( acti.origin );
			level.activ setPlayerangles( acti.angles );
			level.activ freezeControls(true);
		}
	}
	else	// Acti
	{
		if( isDefined( player ) ){
			level.activ SetOrigin(acti.origin);
			level.activ SetPlayerAngles( acti.angles );	
			
			
			self SetOrigin(jumper.origin);
			self SetPlayerAngles( jumper.angles );
			self freezeControls(true);
		}
			
		
			
	}
	
}
	
TeampolinFight(){
	
	self endon("disconnect");
	self endon("player_spectator");

	level.actiorigin = getent ("trampolin_acti_teleport", "targetname");
	teleorigin = getent ("trampolin_jumper_teleport", "targetname");
	
				
	wait(0.05);
	
	self freezeControls(true);
	self setorigin (teleorigin.origin);
	self setplayerangles (teleorigin.angles);
	wait 0.5;
	self freezeControls(false);
	
	wait(0.05);
	
	thread createSelectedRoom(self.name + " ^3 HAS ENTERED THE TRAMPOLIN ROOM^7!"); // change the massage if you want
	self takeallweapons();
	self GiveWeapon("knife_mp");
	self SwitchToWeapon( "knife_mp" );
	
	if( isDefined( level.activ ) ){
		level.activ freezeControls(true);
		level.activ SetOrigin( level.actiorigin.origin );
		level.activ setplayerangles( level.actiorigin.angles );
		wait 0.5;
		level.activ freezeControls(false);
		
	}
	
	wait(0.05);
	if( isDefined( level.activ ) ){
		level.activ takeallweapons();	
		level.activ GiveWeapon("knife_mp");
		level.activ SwitchToWeapon( "knife_mp" );
	}

	
	while( isDefined( self ) && isAlive( self )  )
		wait 1;
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
	if(level.playerQueue.size > 0)
		level notify("start_endroom_fight", level.playerQueue[0]);
}


oldfight()
{
	
   	level.oldway_trigger = getEnt( "oldway_trigger", "targetname");
	object = getent ("old_door", "targetname");
			
		level.oldway_trigger waittill( "trigger", player );
       
		level.sniper_endroom delete();
		level.knife_trigger delete();
		level.bounce_trigger delete();
		level.run_trigger delete();
		level.trampolin_trigger delete();
		level.tank_trigger delete();	
		level.randomweap_trigger delete();
		level.oldway_trigger delete();
		thread createSelectedRoom(player.name + " ^3 HAS OPENED THE OLD WAY^7!" );		
		object moveZ (-165, 2.5);
		object waittill ("movedone");
		object hide();
		object notsolid();
		thread old_door2();
		

}

old_door2()
{
		
		object = getent ("old_door2", "targetname");
		
		wait 4;
		object moveZ (-195, 2.5);
}


removePlayerOnStuff(){
	self notify("stop_removeonstuff");
	self endon("stop_removeonstuff");
	
	if( !isAlive( self ) )
		return;
	
	self waittill_any("disconnect", "death", "player_spectator");
	
	level.playerQueue = removeFromArray(level.playerQueue, self);
	
}

createSelectedRoom(messages)
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
	hud_start SetPulseFX( 50, 4500, 650 );
	wait 7;
	if(isdefined(hud_start))
		hud_start destroy();
}	

//Trampolin 
setupJumppads() {
	level.jumppads = [];
	
	//Origin #1
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -3216.61, 2961.41, -4264 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;     
	
	//Origin #2
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -1863.59, 2979.29, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;     
	
	//Origin #3
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -1911.3, 1779.54, -4232);  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;       
	
	//Origin #4
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -3121.25, 1787.2, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;   
	
	//Origin #5
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -2486.41, 1785.79, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;     
	
	//Origin #6
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -3157.79, 2407.59, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;     
	
	//Origin #7
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -2474.96, 2995.05, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;     
	
	//Origin #8
	level.jumppads[level.jumppads.size] = spawnStruct();
	level.jumppads[level.jumppads.size - 1].origin = ( -1879.87, 2369.44, -4232 );  //Cords
	level.jumppads[level.jumppads.size - 1].angles = ( 0 , 0 , 0 );           
	level.jumppads[level.jumppads.size - 1].height = 10;                   
	level.jumppads[level.jumppads.size - 1].radius = 64;                     
	level.jumppads[level.jumppads.size - 1].dirPos = ( -2001 , 292 , 132 );
	level.jumppads[level.jumppads.size - 1].power = 5;                      
	 
	level.jumppads[level.jumppads.size] = spawnStruct();                    
	level.jumppads[level.jumppads.size - 1].origin = ( 2342 , 123 , 73 );          
	 
	level.jumppads[level.jumppads.size] = spawnStruct();                      
	level.jumppads[level.jumppads.size - 1].origin = ( 3434 , 32 , -17 );          
}
 
spawnJumppad( origin , angles , height , radius , dirPos , model , power , sound )
{
if( !isDefined( radius ) )      radius = 64;
if( !isDefined( height ) )      height = 32;
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
power = 1;
 
// player iPrintLnBold( "Yippieeeh!" );
 
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
				self.logoText fadeOverTime(1);
				self.logoText.alpha = 1;
				self.logoText setText("^7---^1S^7pecial ^1T^7hanks to our ^1T^7riggerfriend ^1L^7uk^7---");
				wait 3;
				self.logoText fadeOverTime(1);
				self.logoText.alpha = 0;
				wait 1;
				self.logoText fadeOverTime(1);
				self.logoText.alpha = 1;
				self.logoText setText("^7---^1S^7pecial ^1T^7hanks to ^1T^73rroR^7---");
				wait 3;
				self.logoText fadeOverTime(1);
				self.logoText.alpha = 0;
				wait 1;
		}
	
	}	