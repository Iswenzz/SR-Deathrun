/*			  
  /\\  /\\  
  //\\_//\\     ____
  \_     _/    /   /
   / ^ ^ \    /^^^|
   \_\O/_/    |   |
    /   \_    |   /
    \     \_  /  /
    | | | /  \/ _/
    |_| | \__/_/               				  
	By VC'Fox.
		___    __  _       _______        
	| | / (_)__/ /_(_)___  / ___/ /__ ____ 
	| |/ / (_-< __/ / __/ / /__/ / _ `/ _ \
	|___/_/___|__/_/\__/  \___/_/\_,_/_//_/ 

	Thanks to VC'Blade for his Secret Timer Script and the original idea for this map.
*/


main()
{
	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	ambientPlay("ambient_backlot_ext");

	setdvar("r_gamma", "1");
	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
 	setdvar("bg_fallDamageMaxHeight", "99999"); 
	setDvar("bg_FallDamageMinHeight","99998"); 

	thread elevator();
	thread elevator2();
	thread precacheFX();
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
	thread jumper_tp1();
	thread acti_tp();
	thread acti_tp2();
	thread startdoor();
	thread secret_step1();
	thread first_place();
	thread secret_respawn();
	thread secret_leave();
	thread sniper_room_fail();
	thread bounce_room_fail();
	thread bounce_room_weapon();
	thread race_room_fail();
	thread race_winner();
	thread foxlol();
	thread room_selection();
	thread bounce_room();
	thread sniper_room();
	thread magnum_room();
	thread race_room();
	thread shotgun_room();
	thread music();
	thread secret_respawn_hard();
	thread secret_hard_tp();
	thread hard_secret_leave();
	thread messages();
	thread vistic_vip();
	thread ambient_sounds();
	thread sec_weapon();
	thread sec_weapon2();
	thread acti_reset();
	thread acti_leave();
	thread acti_step1();
  	thread onConnect();
	
	precacheItem("remington700_mp"); 
	precacheItem("m40a3_mp"); 
	precacheItem("knife_mp");
	precacheItem("deserteagle_mp");
	preCacheItem("ak74u_mp"); 
	preCacheItem("357_mp"); 
	preCacheItem("barrett_mp");
	preCacheItem("rpd_mp");
	preCacheItem("m1014_mp");


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

}

addTriggerToList(name) 
{
    if(!isDefined(level.trapTriggers))
    level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name , "targetname");
}

precacheFX()
{
	level._effect["c4"] = loadfx("explosions/grenadeexp_default");
	level._effect["c4_light"] = loadfx("misc/light_c4_blink");
	level._effect["sentry_fire"] = loadfx("muzzleflashes/minigun_flash_view");
	level._effect["sentry_brass"] = loadfx("shellejects/20mm_cargoship"); 
	level._effect["sentry_smoke"] = loadfx("smoke/car_damage_blacksmoke"); 
	level._effect["teleport"] = loadfx("fox/teleport2"); 
	level._effect["barrel"] = loadfx("fire/firelp_barrel_pm");
}

ambient_sounds()
{   
    barrel = getEnt("barrel","targetname");

	barrel playLoopSound("fire_wood_medium");

	playLoopedFX(level._effect["barrel"], 0.05, (9472, -4774, -490)); 
}

music()
{
	trig = getEnt("trig_music","targetname");

	trig setHintString("^5>> ^7Music ^5<<");

	trig waittill("trigger",player);

	trig delete();

	    
    music = randomInt(7);

    switch(music)
    {
    
        case 0:
            ambientStop(2);
			ambientPlay("antihero", 2);
        break;
             
        case 1:
            ambientStop(2);
			ambientPlay("cry", 2);
        break;
                
        case 2:
            ambientStop(2);
			ambientPlay("koven", 2);
        break;     

		case 3:
            ambientStop(2);
			ambientPlay("leaves", 2);
        break;
                   
        case 4:
            ambientStop(2);
			ambientPlay("sine", 2);
        break;
                
        case 5:
            ambientStop(2);
			ambientPlay("stars", 2);
        break;    
		                
        case 6:
            ambientStop(2);
			ambientPlay("granite", 2);
        break;          
    }
}

sec_weapon()
{
	trig = getEnt("trig_sec_wep1","targetname");
	teddy = getEnt("sec_teddy1","targetname");
	weap = getEnt("sec_barret","targetname");

    wep = randomInt(2);

    switch(wep)
    {
    
        case 0:
            teddy hide();
			trig setHintString("Press [^5&&1^7] For Barrett .50 cal");
			trig waittill("trigger",player);
			player braxi\_rank::giveRankXp(undefined, 25);
			trig delete();
			weap delete();
			player playSoundToPlayer("weap_pickup", player);
			player GiveWeapon("barrett_mp");
			player switchToWeapon("barrett_mp");
			player giveMaxAmmo("barrett_mp");
        break;
             
        case 1:
            weap hide();
			trig setHintString("^7[^1Come Back Next Round^7]");
        break;
	}
}

sec_weapon2()
{
	trig = getEnt("trig_sec_wep2","targetname");
	teddy = getEnt("sec_teddy2","targetname");
	weap = getEnt("sec_rpd","targetname");

    wep = randomInt(2);

    switch(wep)
    {
    
        case 0:
            teddy hide();
			trig setHintString("Press [^5&&1^7] For RPD");
			trig waittill("trigger",player);
			player braxi\_rank::giveRankXp(undefined, 25);
			trig delete();
			weap delete();
			player playSoundToPlayer("weap_pickup", player);
			player GiveWeapon("rpd_mp");
			player switchToWeapon("rpd_mp");
			player giveMaxAmmo("rpd_mp");
        break;
             
        case 1:
            weap hide();
			trig setHintString("^7[^1Come Back Next Round^7]");
        break;
	}
}

elevator()
{
	ele = getEnt("ele","targetname");
	trig = getEnt("trig_ele","targetname");

	trig waittill("trigger",player);

	trig delete();

	while(1)
	{
		ele moveY(-740, 2);
		ele waittill("movedone");
		wait 4;
		ele moveY(740, 2);
		ele waittill("movedone");
		wait 4;
	}
}

elevator2()
{
	ele = getEnt("ele2","targetname");
	trig = getEnt("trig_ele2","targetname");

	trig waittill("trigger",player);

	trig delete();

	while(1)
	{
		ele moveX(576, 2);
		ele waittill("movedone");
		wait 2;
		ele moveX(-576, 2);
		ele waittill("movedone");
		wait 2;
	}
}

startdoor()
{
	door = getEnt("startdoor","targetname");

	level waittill("round_started");

	thread vistic_hud();

	wait 5;

	door delete();
}

vistic_hud()
{ 

	vistic = newHudElem();
	vistic.foreground = true;
	vistic.alpha = 1;
	vistic.alignX = "left";
	vistic.alignY = "middle";
	vistic.horzAlign = "left";
	vistic.vertAlign = "middle"; 
	vistic.x = -500;
	vistic.y = 0;
	vistic.sort = 0;
	vistic.font = "default";
	vistic.fontScale = 1.4;
	vistic.hidewheninmenu = false;
	vistic.glowAlpha = 1;
	vistic.glowColor = (.2,.2,1);
	vistic settext("^7Map By ^3VC'Fox");
	vistic moveOverTime(2); 
	vistic.x = 5;
	wait 5;
	vistic moveOverTime(2); 
	vistic.x = -500;
	wait 5;
	vistic destroy(); 
}

messages()
{

	for(;;)
	{
		wait 30;
		iprintln("^7Map By ^3VC'Fox");
		wait 30;
		iprintln("^5Vistic - Clan"); 
		wait 30;
		iprintln("^7Discord: ^3VC'Fox#0001"); 
		wait 30;
	}
}


trap1()
{
	brush = getEnt("trap1","targetname");
	trig = getEnt("trig_trap1","targetname");

	trig setHintString("Press [^5&&1^7] To Rotate");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);
	trig delete();

	while(1)
	{
		brush rotateRoll(-360,2);
		wait 5;
		brush rotateRoll(360,2);
		wait 5;
		brush rotateRoll(-720,2);
		wait 5;
	}
}

trap2()
{
	brush = getEnt("trap2","targetname");
	trig = getEnt("trig_trap2","targetname");

	trig setHintString("Press [^5&&1^7] To Delete");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);
	trig delete();

	brush delete();
}

trap3()
{
	brush = getEnt("trap3","targetname");
	trig = getEnt("trig_trap3","targetname");
	kill = getEnt("trap3_kill","targetname");

	kill maps\mp\_utility::triggerOff();

	kill enableLinkTo();
	kill linkTo(brush);

	brush hide();

	trig setHintString("Press [^5&&1^7] To Activate Death Barrier");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);

	kill maps\mp\_utility::triggerOn();

	brush show();
	brush MoveY(1024, 1);
	brush waittill("movedone");
	brush delete();
	kill delete();
	trig delete();
}

trap4()
{
	brush = getEnt("trap4","targetname");
	trig = getEnt("trig_trap4","targetname");

	trig setHintString("Press [^5&&1^7] To Drop Floor");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);

	brush MoveZ(-400, 0.5);
	brush waittill("movedone");
	wait 2;
	brush MoveZ(400, 2);
	trig delete();
}

trap5()
{
	brush = getEnt("trap5","targetname");
	brush2 = getEnt("trap5a","targetname");
	trig = getEnt("trig_trap5","targetname");

	trig setHintString("Press [^5&&1^7] To Rotate");

	trig waittill("trigger",player);

	trig delete();

	player braxi\_rank::giveRankXp(undefined, 25);

	while(1)
	{
		brush rotatePitch(180, 1);
		brush2 rotatePitch(-180, 1);
		wait 3;
		brush rotatePitch(-180, 1);
		brush2 rotatePitch(180, 1);
		wait 3;
		brush rotatePitch(360, 2);
		brush2 rotatePitch(360, 2);
		wait 4;
		brush rotatePitch(-360, 2);
		brush2 rotatePitch(-360, 2);
		wait 5;
	}
}

trap6()
{
	brush = getEnt("trap6","targetname");
	trig = getEnt("trig_trap6","targetname");

	trig setHintString("Press [^5&&1^7] To Move Barriers");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);

	brush moveZ(100, 1);
	brush waittill("movedone");
	wait 2;
	brush moveZ(-100, 2);
	trig delete();
}

trap7()
{
	brush = getEnt("trap7","targetname");
	brush2 = getEnt("trap7a","targetname");
	brush3 = getEnt("trap7b","targetname");
	trig = getEnt("trig_trap7","targetname");

	trig setHintString("Press [^5&&1^7] To Rotate");

	trig waittill("trigger",player);


	trig delete();

	player braxi\_rank::giveRankXp(undefined, 25);

	while(1)
	{
		brush rotateRoll(360, 2);
		wait 0.2;
		brush2 rotateRoll(360, 2);
		wait 0.2;
		brush3 rotateRoll(360, 2);
		wait 5;
	}
}

trap8()
{
	c4 = getEnt("trap8_c4","targetname");
	c41 = getEnt("trap8_c41","targetname");
	trig = getEnt("trig_trap8","targetname");
	kill = getEnt("trap8_kill","targetname");

	kill maps\mp\_utility::triggerOff();

	thread c4_light();

	trig setHintString("Press [^5&&1^7] To Detonate C4");

	trig waittill("trigger",player);

	player braxi\_rank::giveRankXp(undefined, 25);

	kill maps\mp\_utility::triggerOn();

	earthquake (2, 1, c4.origin, 200);
	earthquake (2, 1, c41.origin, 200); 

	c4 playSound("detpack_explo_default");
	c41 playSound("detpack_explo_default");

	playFx(level._effect["c4"],c4.origin);
	playFx(level._effect["c4"],c41.origin);

	wait 0.2;

	kill delete();
	trig delete();
	c4 delete();
	c41 delete();
	c4 = undefined;
}

c4_light()
{
	c4 = getEnt("trap8_c4","targetname");
	c41 = getEnt("trap8_c41","targetname");

	while(isdefined(c4))
	{
		fx = playFXOnTag(level._effect["c4_light"], c4, "tag_fx");
		fx2 = playFXOnTag(level._effect["c4_light"], c41, "tag_fx"); 
		wait 2;
	}
}


trap9()
{
	sentry = getEnt("trap9_sentry","targetname");
	sentry_obj = getEnt("trap9_sentry_obj","targetname");
	sentry_des = getEnt("sentry_des","targetname");
	trig = getEnt("trig_trap9","targetname");
	kill = getEnt("trap9_kill","targetname");

	kill maps\mp\_utility::triggerOff();

	sentry hide();
	sentry_des hide();

	trig setHintString("Press [^5&&1^7] To Activate Sentry Gun");

	trig waittill("trigger",player);

	sentry show();
	sentry_obj delete();

	player braxi\_rank::giveRankXp(undefined, 25);

	kill maps\mp\_utility::triggerOn();

	sentry playSound("sentry_fire");
	thread sentry_fx();
	wait 1;
	sentry playSound("sentry_fire");  
	wait 1;
	sentry playSound("sentry_fire");  
	wait 1;
	sentry playSound("sentry_fire");  
	wait 1;
	sentry playSound("sentry_fire");  
	wait 2;
	kill delete();
	trig delete();
	playFx(level._effect["c4"],sentry.origin);
	sentry playSound("sentry_des"); 
	sentry delete(); 
	sentry = undefined;
	sentry_des show();
	thread sentry_des_fx();
}

sentry_fx()
{
	sentry = getEnt("trap9_sentry","targetname");

	while(isdefined(sentry))
	{
		fx = playFXOnTag(level._effect["sentry_fire"], sentry, "tag_flash");
		fx2 = playFXOnTag(level._effect["sentry_brass"], sentry, "tag_brass"); 
		wait 0.01;
	}
}

sentry_des_fx()
{
	sentry = getEnt("sentry_des","targetname");

	while(1)
	{
		fx = playFXOnTag(level._effect["sentry_smoke"], sentry, "tag_smoke");
		wait 0.1;
	}
}

trap10()
{
	brush = getEnt("trap10","targetname");
	kill = getEnt("trap10_kill","targetname");
	trig = getEnt("trig_trap10","targetname");

	brush hide();
	brush notSolid();

	kill maps\mp\_utility::triggerOff();

	trig setHintString("Press [^5&&1^7] To Activate Lasers");

	trig waittill("trigger",player);

  brush playSound("laser");

	kill maps\mp\_utility::triggerOn();

	player braxi\_rank::giveRankXp(undefined, 25);

	trig delete();

	brush show();
	brush solid();

	wait 5;

	brush delete();
	kill delete();
}

trap11()
{
	brush = getEnt("trap11","targetname");
	kill = getEnt("trap11_kill","targetname");
	trig = getEnt("trig_trap11","targetname");

	brush hide();
	brush notSolid();

	kill maps\mp\_utility::triggerOff();

	trig setHintString("Press [^5&&1^7] To Activate Spikes");

	trig waittill("trigger",player);

	kill maps\mp\_utility::triggerOn();

	player braxi\_rank::giveRankXp(undefined, 25);

	kill enableLinkTo();
	kill linkTo(brush);

	trig delete();

	brush show();
	brush solid();

	brush MoveZ(-192, 0.2);

	wait 4;

	brush delete();
	kill delete();
}


jumper_tp1()
{
	trig = getEnt("trig_tp1","targetname");
	here = getEnt("here1","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		playFx(level._effect["teleport"],trig.origin);
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

acti_tp()
{
	trig = getEnt("trig_acti_tp","targetname");
	here = getEnt("here2","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		playFx(level._effect["teleport"],trig.origin);
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

acti_tp2()
{
	trig = getEnt("trig_acti_tp2","targetname");
	here = getEnt("here3","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		playFx(level._effect["teleport"],trig.origin);
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}


acti_reset()
{
	trig = getEnt("acti_sec_fail","targetname");
	here = getEnt("acti_sec","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

secret_step1()
{
	trig = getEnt("trig_step1","targetname");
	brush = getEnt("step1","targetname");
	brush2 = getEnt("step2","targetname");
	brush3 = getEnt("step3","targetname");

	brush hide();
	brush notSolid();
	
	brush2 hide();
	brush2 notSolid();

	brush3 hide();
	brush3 notSolid();

	trig waittill("trigger",player);

	iPrintLn("^7[^51^7]");

	trig delete();
	brush show();
	brush solid();

	player thread secret_step2();
}

secret_step2()
{
	trig = getEnt("trig_step2","targetname");
	brush = getEnt("step2","targetname");

	brush hide();
	brush notSolid();

	trig waittill("trigger",player);

	iPrintLn("^7[^52^7]");

	trig delete();
	brush show();
	brush solid();

	player thread secret_step3();
}

secret_step3()
{
	trig = getEnt("trig_step3","targetname");
	trig_easy = getEnt("trig_sec","targetname");
	trig_hard = getEnt("trig_hard_enter","targetname");
	brush = getEnt("step3","targetname");

	trig_easy maps\mp\_utility::triggerOff();
	trig_hard maps\mp\_utility::triggerOff();

	brush hide();
	brush notSolid();

	trig waittill("trigger",player);

	iPrintLn("^7[^5Secret Open^7]");

	trig_easy maps\mp\_utility::triggerOn();
	trig_hard maps\mp\_utility::triggerON();

	trig delete();
	brush show();
	brush solid();

	player thread secret_easy_tp();
}

secret_easy_tp()
{
	trig = getEnt("trig_sec","targetname");
	here = getEnt("easy_here","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player thread secret_timer();
		player.checkpoint = 0;
		player.hard_checkpoint = 0;
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

secret_hard_tp()
{
	trig = getEnt("trig_hard_enter","targetname");
	here = getEnt("hard_here","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player thread secret_timer();
		player.checkpoint = 0;
		player.hard_checkpoint = 0;
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

first_place()
{ 
	trig = getEnt("endmap_trig", "targetname"); 
	
	trig waittill ("trigger",player );

	firstPlace = newHudElem();
	firstPlace.foreground = true;
	firstPlace.alpha = 1;
	firstPlace.alignX = "left";
	firstPlace.alignY = "middle";
	firstPlace.horzAlign = "left";
	firstPlace.vertAlign = "middle"; 
	firstPlace.x = -400;
	firstPlace.y = 0;
	firstPlace.sort = 0;
	firstPlace.font = "default";
	firstPlace.fontScale = 1.4;
	firstplace.hidewheninmenu = false;
	firstPlace.glowAlpha = 1;
	firstPlace.glowColor = (.2,.2,1);
	firstPlace settext("^3"+ player.name+ " ^7Finished First!");
	firstPlace moveOverTime(2); 
	firstPlace.x = 5;
	wait 5;
	firstPlace moveOverTime(2); 
	firstPlace.x = -500;
	wait 5;
	firstPlace destroy(); 
}

secret_respawn()
{
	secret_fail = getent("trig_fail", "targetname");
	secret_reset_origin0 = getent("easy_here", "targetname");

	secret_reset_trig1 = getent("trig_reset1", "targetname");
	secret_reset_origin1 = getent("reset_1", "targetname");

	secret_reset_trig2 = getent("trig_reset2", "targetname");
	secret_reset_origin2 = getent("reset2", "targetname");

	secret_reset_trig3 = getent("trig_reset3", "targetname");
	secret_reset_origin3 = getent("reset3", "targetname");

	secret_reset_trig4 = getent("trig_reset4", "targetname");
	secret_reset_origin4 = getent("reset4", "targetname");

	secret_reset_trig1 thread reset1_check();
	secret_reset_trig2 thread reset2_check();
	secret_reset_trig3 thread reset3_check();
	secret_reset_trig4 thread reset4_check();

	while(true)
	{
		secret_fail waittill ("trigger", player);	
		if(player.checkpoint == 0)
		{
			player SetPlayerAngles(secret_reset_origin0.angles);
			player SetOrigin(secret_reset_origin0.origin);
			wait 0.2;
		}
		if(player.checkpoint == 1)
		{
			player SetPlayerAngles(secret_reset_origin1.angles);
			player SetOrigin(secret_reset_origin1.origin);
			wait 0.2;
		}
		if(player.checkpoint == 2)
		{
			player SetPlayerAngles(secret_reset_origin2.angles);
			player SetOrigin(secret_reset_origin2.origin);
			wait 0.2;
		}
		if(player.checkpoint == 3)
		{
			player SetPlayerAngles(secret_reset_origin3.angles);
			player SetOrigin(secret_reset_origin3.origin);
			wait 0.2;
		}
		if(player.checkpoint == 4)
		{
			player SetPlayerAngles(secret_reset_origin4.angles);
			player SetOrigin(secret_reset_origin4.origin);
			wait 0.2;
		}
	}
}

reset1_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 1;	
		wait 0.2;
	}
}

reset2_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 2;	
		wait 0.2;
	}
}

reset3_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 3;	
		wait 0.2;
	}
}

reset4_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.checkpoint = 4;	
		wait 0.2;
	}
}

secret_respawn_hard()
{
	hard_secret_fail = getent("trig_hard_fail", "targetname");
	hard_secret_reset_origin0 = getent("hard_here", "targetname");

	hard_secret_reset_trig1 = getent("trig_hard_reset1", "targetname");
	hard_secret_reset_origin1 = getent("hard_reset1", "targetname");

	hard_secret_reset_trig2 = getent("trig_hard_reset2", "targetname");
	hard_secret_reset_origin2 = getent("hard_reset2", "targetname");

	hard_secret_reset_trig3 = getent("trig_hard_reset3", "targetname");
	hard_secret_reset_origin3 = getent("hard_reset3", "targetname");

	hard_secret_reset_trig1 thread hard_reset1_check();
	hard_secret_reset_trig2 thread hard_reset2_check();
	hard_secret_reset_trig3 thread hard_reset3_check();


	while(true)
	{
		hard_secret_fail waittill ("trigger", player);	
		if(player.hard_checkpoint == 0)
		{
			player SetPlayerAngles(hard_secret_reset_origin0.angles);
			player SetOrigin(hard_secret_reset_origin0.origin);
			wait 0.2;
		}
		if(player.hard_checkpoint == 1)
		{
			player SetPlayerAngles(hard_secret_reset_origin1.angles);
			player SetOrigin(hard_secret_reset_origin1.origin);
			wait 0.2;
		}
		if(player.hard_checkpoint == 2)
		{
			player SetPlayerAngles(hard_secret_reset_origin2.angles);
			player SetOrigin(hard_secret_reset_origin2.origin);
			wait 0.2;
		}
		if(player.hard_checkpoint == 3)
		{
			player SetPlayerAngles(hard_secret_reset_origin3.angles);
			player SetOrigin(hard_secret_reset_origin3.origin);
			wait 0.2;
		}
	}
}

hard_reset1_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.hard_checkpoint = 1;	
		wait 0.2;
	}
}

hard_reset2_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.hard_checkpoint = 2;	
		wait 0.2;
	}
}

hard_reset3_check()
{
	while(true)
	{
		self waittill ("trigger", player);
		player.hard_checkpoint = 3;	
		wait 0.2;
	}
}

acti_step1()
{
	
	trig = getEnt("trig_acti_step1","targetname");
	brush = getEnt("acti_brush","targetname");
  model = getEnt("acti_model","targetname");
	trig_enter = getEnt("trig_acti_enter","targetname");

	brush notSolid();
	brush hide();

	model hide();

	trig_enter maps\mp\_utility::triggerOff();

	trig waittill("trigger",player);

	thread acti_step2();

}

acti_step2()
{
	
	trig = getEnt("trig_acti_step2","targetname");
  here = getEnt("acti_sec","targetname");
	brush = getEnt("acti_brush","targetname");
  model = getEnt("acti_model","targetname");
  trig_enter = getEnt("trig_acti_enter","targetname");

  trig_enter maps\mp\_utility::triggerOff();

	trig waittill("trigger",player);

  trig_enter maps\mp\_utility::triggerOn();

  brush show();
  brush solid();
  model show();

	player iPrintLn("^7[^5Activator Secret Open^7]");

	trig delete();

	thread acti_step3();

}

acti_step3()
{
	trig = getEnt("trig_acti_enter","targetname");
	here = getEnt("acti_sec","targetname");
	brush = getEnt("acti_brush","targetname");
  model = getEnt("acti_model","targetname");

  trig setHintString("Press [^5&&1^7] To Enter Activator Secret");

	trig waittill("trigger",player);

	trig delete();
	brush delete();
  model delete();
	
	player freezeControls(1);
	player setOrigin(here.origin);
	player setPlayerAngles(here.angles);
	wait 0.2;
	player freezeControls(0);
	wait 0.1;
}



acti_leave()
{
	trig = getEnt("acti_leave","targetname");
	here = getEnt("here7","targetname");

	trig waittill("trigger",player);
	player braxi\_rank::giveRankXp(undefined, 500);
	iPrintLnBold("^3"+ player.name+ " ^7Completed Activator ^7Secret!");
	player freezeControls(1);
	player setOrigin(here.origin);
	player setPlayerAngles(here.angles);
	wait 0.2;
	player freezeControls(0);
	wait 0.1;
}

secret_leave()
{
	trig = getEnt("trig_sec_leave","targetname");
	here = getEnt("here1","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		playFx(level._effect["teleport"],trig.origin);
		player braxi\_rank::giveRankXp(undefined, 500);
		iPrintLnBold("^3"+ player.name+ " ^7Completed ^5Easy ^7Secret!");
		player notify("secret_done");
		player.secretTimer destroy();
		player.checkpoint = 0;
		player.hard_checkpoint = 0;
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
		wait 0.1;
	}
}

hard_secret_leave()
{
	trig = getEnt("trig_hard_leave","targetname");
	here = getEnt("hard_leave","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		playFx(level._effect["teleport"],trig.origin);
		player braxi\_rank::giveRankXp(undefined, 750);
		iPrintLnBold("^3"+ player.name+ " ^7Completed ^1Hard ^7Secret!");
		player notify("secret_done");
		player.secretTimer destroy();
		player.checkpoint = 0;
		player.hard_checkpoint = 0;
		player freezeControls(1);
		player setOrigin(here.origin);
		player setPlayerAngles(here.angles);
		wait 0.2;
		player freezeControls(0);
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
	self.secretTimer.label = &"^7Time in Secret: ^5&&1";
	if(isdefined(level.randomcolor))
	self.secretTimer.glowColor = level.randomcolor;
	else 
	self.secretTimer.glowColor = (1,0,0);

	time = 90; 
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


sniper_room_fail()
{
	trig = getEnt("trig_s_fail","targetname");
	acti_f = getEnt("s2","targetname");
	jumper_f = getEnt("s1","targetname");

	while(1)
	{
		trig waittill("trigger",player);
		if(player.pers["team"] == "allies")
		{
			player freezeControls(1);
			player setOrigin(jumper_f.origin);
			player setPlayerAngles(jumper_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
		else
		{
			player freezeControls(1);
			player setOrigin(acti_f.origin);
			player setPlayerAngles(acti_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
	}
}

bounce_room_fail()
{
	trig = getEnt("trig_b_fail","targetname");
	acti_f = getEnt("b2","targetname");
	jumper_f = getEnt("b1","targetname");

	while(1)
	{
		trig waittill("trigger",player);
		if(player.pers["team"] == "allies")
		{
			player freezeControls(1);
			player setOrigin(jumper_f.origin);
			player setPlayerAngles(jumper_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
		else
		{
			player freezeControls(1);
			player setOrigin(acti_f.origin);
			player setPlayerAngles(acti_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
	}
}

race_room_fail()
{
	trig = getEnt("trig_race_fail","targetname");
	acti_f = getEnt("r2","targetname");
	jumper_f = getEnt("r1","targetname");

	while(1)
	{
		trig waittill("trigger",player);
		if(player.pers["team"] == "allies")
		{
			player freezeControls(1);
			player setOrigin(jumper_f.origin);
			player setPlayerAngles(jumper_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
		else
		{
			player freezeControls(1);
			player setOrigin(acti_f.origin);
			player setPlayerAngles(acti_f.angles);
			wait 0.2;
			player freezeControls(0);
			wait 0.1;
		}
	}
}

bounce_room_weapon()
{
	trig = getEnt("trig_b_wep","targetname");

	trig setHintString("Press [^5&&1^7] For Barrett .50 cal");

	while(1)
	{
		trig waittill("trigger",player);
		player takeAllWeapons();
		player giveWeapon("barrett_mp");
		player switchToWeapon("barrett_mp");
		player giveMaxAmmo("barrett_mp");
		wait 0.1;
	}
}

race_winner()
{
	trig = getEnt("trig_race_winner","targetname");
	winner = getEnt("winner","targetname");
	loser = getEnt("loser","targetname");

	while(1)
	{
		trig waittill("trigger",player);
		if(player.pers["team"] == "allies") //if jumper wins 
		{
			level.race_jumper setOrigin(winner.origin);
			level.race_jumper setPlayerAngles(winner.angles);

			iPrintLn("^5Jumper: ^7"+level.race_jumper.name+" Won The Race!");
			level.activ iPrintLnBold("^1You Lost The Race");

			level.activ freezeControls(1);
			level.activ setOrigin(loser.origin);
			level.activ setPlayerAngles(loser.angles);

			level.race_jumper giveMaxAmmo("deserteagle_mp");
			wait 0.1;
		}
		else //if acti wins
		{
			level.activ setOrigin(winner.origin);
			level.activ setPlayerAngles(winner.angles);

			iPrintLn("^1Activator: ^7"+level.activ.name+" Won The Race!");
			level.race_jumper iPrintLnBold("^1You Lost The Race");

			level.race_jumper freezeControls(1);
			level.race_jumper setOrigin(loser.origin);
			level.race_jumper setPlayerAngles(loser.angles);

			level.activ giveMaxAmmo("deserteagle_mp");
			wait 0.1;
		}
	}
}



foxlol()
{
	trig = getEnt("trig_fox","targetname");
	here = getEnt("herefox","targetname");

	while(1)
	{
		trig waittill("trigger", player);

		if(player getGuid() == "2310346615434407089") 
		{
			player setOrigin(here.origin);
			player setPlayerAngles(here.angles);
			wait 0.1;
		}
		else
		{
			return;
		}
		wait 1;
	}
}



room_selection()
{
    trig = getent("trig_endroom", "targetname"); 
    here = getent("here_endroom", "targetname"); 

    while(1)
    {
		trig setHintString("Press [^5&&1^7] To Enter Endroom Selection");
        trig waittill("trigger",player);
		trig setHintstring("^1Wait Your Turn");

		iPrintLnBold("^3"+player.name+" ^7Entered Endroom Selection");
		
        player takeallweapons(); 

        player setorigin(here.origin); 
        player setplayerangles(here.angles); 

        while(isAlive(player)&&isDefined(player))
        wait 1;

		iPrintLnBold("Endroom Selection Is Open!");
		level.race_jumper = undefined;
    }
}

bounce_room()
{
	level.bounce = getEnt("trig_bounce", "targetname");
	acti = getEnt("b2", "targetname");
	jumper = getEnt("b1", "targetname");
	
	while(1)
	{
		level.bounce SetHintstring("^5Bounce ^7Room");
		level.bounce waittill("trigger", player);

		thread endroom_music();

		player SetPlayerAngles(jumper.angles);
		player setOrigin(jumper.origin);
		player TakeAllWeapons();
		player GiveWeapon("knife_mp");
		player switchToWeapon("knife_mp");

		level.activ setPlayerangles (acti.angles);
		level.activ setOrigin(acti.origin);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("knife_mp");
		level.activ SwitchToWeapon("knife_mp");

		player freezeControls(1);
		level.activ freezeControls(1);
		
  		iPrintLnBold("^3" + player.name + " ^7Choose: ^7Bounce");
		wait 1;
		player iPrintLnBold("^73");
		level.activ iPrintLnBold("^73");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^71");
		level.activ iPrintLnBold("^71");
		wait 1;
		player iPrintLnBold("^5FIGHT");
		level.activ iPrintLnBold("^5FIGHT");

		player freezeControls(0);
		level.activ freezeControls(0);

		wait 1;
	}
}

magnum_room()
{
	level.magnum = getEnt("trig_magnum", "targetname");
	acti = getEnt("m2", "targetname");
	jumper = getEnt("m1", "targetname");
	
	while(1)
	{
		level.magnum SetHintstring("^5Magnum ^7Room");
		level.magnum waittill("trigger", player);

		thread endroom_music();

		player SetPlayerAngles(jumper.angles);
		player setOrigin(jumper.origin);
		player TakeAllWeapons();
		player GiveWeapon("357_mp");
		player switchToWeapon("357_mp");
		player giveMaxAmmo("357_mp");

		level.activ setPlayerangles (acti.angles);
		level.activ setOrigin(acti.origin);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("357_mp");
		level.activ SwitchToWeapon("357_mp");
		level.activ giveMaxAmmo("357_mp");

		player freezeControls(1);
		level.activ freezeControls(1);
		
  		iPrintLnBold("^3" + player.name + " ^7Choose: ^7Magnum");
		wait 1;
		player iPrintLnBold("^73");
		level.activ iPrintLnBold("^73");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^71");
		level.activ iPrintLnBold("^71");
		wait 1;
		player iPrintLnBold("^5FIGHT");
		level.activ iPrintLnBold("^5FIGHT");

		player freezeControls(0);
		level.activ freezeControls(0);
		
		wait 1;
	}
}

sniper_room()
{
	level.sniper = getEnt("trig_sniper", "targetname");
	acti = getEnt("s_acti", "targetname");
	jumper = getEnt("s_jumper", "targetname");
	
	while(1)
	{
		level.sniper SetHintstring("^5Sniper ^7Room");
		level.sniper waittill("trigger", player);

		thread endroom_music();

		player SetPlayerAngles(jumper.angles);
		player setOrigin(jumper.origin);
		player TakeAllWeapons();
		player GiveWeapon("remington700_mp");
		player GiveMaxAmmo("remington700_mp");
		player GiveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");

		level.activ setPlayerangles (acti.angles);
		level.activ setOrigin(acti.origin);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("remington700_mp");
		level.activ GiveMaxAmmo("remington700_mp");
		level.activ GiveWeapon("m40a3_mp");
		level.activ GiveMaxAmmo("m40a3_mp");
		level.activ SwitchToWeapon("m40a3_mp");

		player freezeControls(1);
		level.activ freezeControls(1);
		
  		iPrintLnBold("^3" + player.name + " ^7Choose: ^7Sniper");
		wait 1;
		player iPrintLnBold("^73");
		level.activ iPrintLnBold("^73");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^71");
		level.activ iPrintLnBold("^71");
		wait 1;
		player iPrintLnBold("^5FIGHT");
		level.activ iPrintLnBold("^5FIGHT");

		player freezeControls(0);
		level.activ freezeControls(0);
		
		wait 1;
	}
}

race_room()
{
	level.race = getEnt("trig_race", "targetname");
	acti = getEnt("r2", "targetname");
	jumper = getEnt("r1", "targetname");
	
	while(1)
	{
		level.race SetHintstring("^5Race ^7Room");
		level.race waittill("trigger", player);
	
		thread endroom_music();

		level.race_jumper = player; 

		player SetPlayerAngles(jumper.angles);
		player setOrigin(jumper.origin);
		player TakeAllWeapons();
		player GiveWeapon("deserteagle_mp");
		player SwitchToWeapon("deserteagle_mp");
		player setWeaponAmmoStock("deserteagle_mp", 0);
		player setWeaponAmmoClip("deserteagle_mp", 0);  

		level.activ setPlayerangles(acti.angles);
		level.activ setOrigin(acti.origin);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("deserteagle_mp");
		level.activ SwitchToWeapon("deserteagle_mp");
		level.activ setWeaponAmmoStock("deserteagle_mp", 0);
		level.activ setWeaponAmmoClip("deserteagle_mp", 0); 

		player freezeControls(1);
		level.activ freezeControls(1);
		
  		iPrintLnBold("^3" + player.name + " ^7Choose: ^7Race");
		wait 1;
		player iPrintLnBold("^73");
		level.activ iPrintLnBold("^73");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^71");
		level.activ iPrintLnBold("^71");
		wait 1;
		player iPrintLnBold("^5FIGHT");
		level.activ iPrintLnBold("^5FIGHT");

		player freezeControls(0);
		level.activ freezeControls(0);

		wait 1;
	}
}


shotgun_room()
{
	level.shotgun = getEnt("trig_shotgun", "targetname");
	acti = getEnt("m2", "targetname");
	jumper = getEnt("m1", "targetname");
	
	while(1)
	{
		level.shotgun SetHintstring("^5Shotgun ^7Room");
		level.shotgun waittill("trigger", player);

		thread endroom_music();

		player SetPlayerAngles(jumper.angles);
		player setOrigin(jumper.origin);
		player TakeAllWeapons();
		player GiveWeapon("m1014_mp");
		player switchToWeapon("m1014_mp");
		player giveMaxAmmo("m1014_mp");

		level.activ setPlayerangles (acti.angles);
		level.activ setOrigin(acti.origin);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("m1014_mp");
		level.activ SwitchToWeapon("m1014_mp");
		level.activ giveMaxAmmo("m1014_mp");

		player freezeControls(1);
		level.activ freezeControls(1);
		
  		iPrintLnBold("^3" + player.name + " ^7Choose: ^7Shotgun");
		wait 1;
		player iPrintLnBold("^73");
		level.activ iPrintLnBold("^73");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^71");
		level.activ iPrintLnBold("^71");
		wait 1;
		player iPrintLnBold("^5FIGHT");
		level.activ iPrintLnBold("^5FIGHT");

		player freezeControls(0);
		level.activ freezeControls(0);
		
		wait 1;
	}
}

endroom_music()
{
  if(!isdefined(level.endroom_music))
  	level.endroom_music = false;
  if(level.endroom_music == true)
  {
    return;
  }
  else
  {
	level.endroom_music = true;

	endroom = randomInt(5);

    switch(endroom)
    {
    
        case 0:
            ambientStop(2);
			ambientPlay("endroom1", 2);
        break; 
                
        case 1:
            ambientStop(2);
			ambientPlay("endroom2", 2);
        break;
                
        case 2:
            ambientStop(2);
			ambientPlay("endroom3", 2);
        break;     

		case 3:
            ambientStop(2);
			ambientPlay("endroom4", 2);
        break;
                   
        case 4:
            ambientStop(2);
			ambientPlay("endroom5", 2);
        break;  
  }
}
}

vistic_vip()
{
	while(1)
	{

  trig = getEnt("trig_vip","targetname");

  trig setHintString("^5>> ^7[Use] ^5<<");

  trig waittill("trigger",player);

  player  iPrintLnBold("^5Vistic Discord: ^7https://discord.gg/JKwXV3h");
  }
}

onConnect()
{
	for(;;)
	{
		level waittill("connected",player);
		player thread onSpawn();
	}
}

onSpawn()
{
	for(;;)
	{
		self waittill("spawned_player");
		self thread tweaks();
	}
}

tweaks()
{
	self notify("tweaks");
	wait 0.05;
	self endon("tweaks");
	self endon("death");
	self endon("disconnect");

	while(isDefined(self))
	{
    self setClientDvar("r_drawDecals",1);
		wait 1;
	}
}