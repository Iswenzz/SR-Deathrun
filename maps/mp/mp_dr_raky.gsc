/*

  _|_|_|            _|      _|      _|                  _|            
_|        _|    _|    _|  _|        _|          _|_|    _|  _|_|_|_|  
  _|_|    _|    _|      _|          _|        _|    _|  _|      _|    
      _|  _|    _|    _|  _|        _|        _|    _|  _|    _|      
_|_|_|      _|_|_|  _|      _|      _|_|_|_|    _|_|    _|  _|_|_|_|  

Map and GSC Made By SuX Lolz.

Steam: http://steamcommunity.com/id/iswenzz
Discord: https://discord.gg/76aHfGF
Youtube: https://www.youtube.com/c/iswenzz
Email Pro: suxlolz@outlook.fr
Website: https://iswenzz.com/

*/

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	maps\mp\_teleport::main();
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
 
	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","1600");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 3000000 );
	setDvar("bg_falldamageminheight", 1280000 );

	precacheItem("knife_mp");
	precacheItem("slashnburn_mp");
	precacheItem("ak47_mp");
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheitem("uzi_silencer_mp");
	precacheItem("p90_silencer_mp");
	precacheItem("mp5_mp");
	precacheItem("skorpion_silencer_mp");

	block_brush = getEnt("trap_6_brush","targetname");
	block_brush delete();

	level.player_in_room = undefined;

	thread traps();
	thread rooms();
	thread secrets();
	thread music();
	thread onConnect();
	thread games();
}

traps()
{
	addTriggerToList("trap_1_trig");
	addTriggerToList("trap_2_trig");
	addTriggerToList("trap_3_trig");
	addTriggerToList("trap_4_trig");
	addTriggerToList("trap_5_trig");
	addTriggerToList("trap_6_trig");
	addTriggerToList("trap_7_trig");

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{
	trap_1 = getEntArray("trap_1","targetname");

	trig = getent("trap_1_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	player braxi\_rank::giveRankXP("", 50);

	trap_1[0].up = randomInt(2);
	trap_1[1].up = randomInt(2);
	trap_1[2].up = randomInt(2);
	trap_1[3].up = randomInt(2);

	while(1)
	{
		if(trap_1[0].up) trap_1[0] moveZ(100,1);
		if(!trap_1[0].up) trap_1[0] moveZ(-100,1);
		if(trap_1[1].up) trap_1[1] moveZ(100,1);
		if(!trap_1[1].up) trap_1[1] moveZ(-100,1);
		if(trap_1[2].up) trap_1[2] moveZ(100,1);
		if(!trap_1[2].up) trap_1[2] moveZ(-100,1);
		if(trap_1[3].up) trap_1[3] moveZ(100,1);
		if(!trap_1[3].up) trap_1[3] moveZ(-100,1);

		wait 1;

		if(trap_1[0].up) trap_1[0] moveZ(-100,1);
		if(!trap_1[0].up) trap_1[0] moveZ(100,1);
		if(trap_1[1].up) trap_1[1] moveZ(-100,1);
		if(!trap_1[1].up) trap_1[1] moveZ(100,1);
		if(trap_1[2].up) trap_1[2] moveZ(-100,1);
		if(!trap_1[2].up) trap_1[2] moveZ(100,1);
		if(trap_1[3].up) trap_1[3] moveZ(-100,1);
		if(!trap_1[3].up) trap_1[3] moveZ(100,1);

		wait 1;
	}
}

trap2()
{
	trap_2 = getEnt("trap_2","targetname");

	trig = getent("trap_2_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	player braxi\_rank::giveRankXP("", 50);

	while(1)
	{
		trap_2 moveZ(200,2);
		wait 3;
		trap_2 moveZ(-200,2);
		wait 10;
	}
}

trap3()
{
	trap_3 = getEnt("trap_3","targetname");

	trig = getent("trap_3_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	player braxi\_rank::giveRankXP("", 50);

	while(1)
	{
		trap_3 rotateYaw(360,2);
		wait 1.8;
	}
}

trap4()
{
	trap_4 = getEntArray("moving_plat","targetname");

	trig = getent("trap_4_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	player braxi\_rank::giveRankXP("", 50);

	trap_4[randomIntRange(0,3)] delete();
	trap_4[randomIntRange(0,3)] delete();
}

trap5()
{
	trap_5 = getEnt("trap_5","targetname");

	trig = getent("trap_5_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	while(1)
	{
		trap_5 moveZ(-400,1,0.5,0);
		wait 5;
		trap_5 moveZ(400,3,0.5,0);
		wait 20;
	}
}

trap6()
{
	trap_6 = getEnt("trap_6","targetname");

	trig = getent("trap_6_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	trap_6 delete();
}

trap7()
{
	trap_7 = getEntArray("trap_7","targetname");

	trig = getent("trap_7_trig","targetname");
	trig waittill("trigger" , player );
	trig SetHintString("^2Activated!");

	if(player.pers["team"] != "axis" && !level.freerun || level.trapsdisabled)
		return;

	while(1)
	{
		trap_7[randomIntRange(0,4)] rotatePitch(360,1,0.3,0.3);
		trap_7[randomIntRange(0,4)] rotatePitch(360,1,0.3,0.3);
		trap_7[randomIntRange(0,4)] rotatePitch(360,1,0.3,0.3);

		wait 2.5;
	}
}

rooms()
{
	room = [];

	for(i = 0; i < 6; i++)
		room[i] = SpawnStruct();

	room[0].name = "sniper";
	room[1].name = "bounce";
	room[2].name = "knife";
	room[3].name = "run";
	room[4].name = "weapons";
	room[5].name = "old";

	room[0].weapons = "m40a3_mp;remington700_mp;";
	room[1].weapons = "slashnburn_mp;knife_mp;";
	room[2].weapons = "slashnburn_mp;knife_mp;";
	room[3].weapons = "slashnburn_mp;knife_mp;";
	room[4].weapons = "uzi_silencer_mp;p90_silencer_mp;mp5_mp;ak47_mp;skorpion_silencer_mp;";
	room[5].weapons = "";

	for(i = 0; i < room.size; i++)
		thread rooms_setup(room[i]);

	thread run_room();
	thread get_sniper();
}

run_room()
{
	trig_jumper = getEnt("run_finish_jumper","targetname");
	trig_acti = getEnt("run_finish_acti","targetname");
	jumper = getEnt("run_finish_jumper_ori","targetname");
	acti = getEnt("run_finish_acti_ori","targetname");

	trig_jumper thread run_room_do(jumper,acti);
	trig_acti thread run_room_do(jumper,acti);
}

run_room_do(jumper,acti)
{
	while(1)
	{
		self waittill("trigger",player);

		if(!isDefined(level.player_in_room))
		{
			wait 1;
			continue;
		}

		if(player == level.activ)
		{
			level.activ setOrigin(acti.origin);
			level.player_in_room setOrigin(jumper.origin);
			level.activ setPlayerAngles(acti.angles);
			level.player_in_room setPlayerAngles(jumper.angles);
			level.player_in_room freezeControls(true);
			level.activ freezeControls(false);

			level.activ giveWeapon("ak74u_mp");
			level.activ giveMaxAmmo("ak74u_mp");
			wait 0.05;
			level.activ switchToWeapon("ak74u_mp");
		}
		else
		{
			level.activ setOrigin(acti.origin);
			level.player_in_room setOrigin(jumper.origin);
			level.activ setPlayerAngles(acti.angles);
			level.player_in_room setPlayerAngles(jumper.angles);
			level.activ freezeControls(true);
			level.player_in_room freezeControls(false);

			level.player_in_room giveWeapon("ak74u_mp");
			level.player_in_room giveMaxAmmo("ak74u_mp");
			wait 0.05;
			level.player_in_room switchToWeapon("ak74u_mp");
		}
	}
}

room_respawn(room)
{
	trig = getEnt("trigger_fail_"+room.name,"targetname");
	jumper = getEnt("origin_jumper_"+room.name,"targetname");
	acti = getEnt("origin_acti_"+room.name,"targetname");

	while(1)
	{
		if(!isDefined(trig))
			return;

		trig waittill("trigger",player);

		if(player.pers["team"] == "axis")
		{
			player setOrigin(acti.origin);
			player setPlayerAngles(acti.angles);
		}

		else
		{
			player setOrigin(jumper.origin);
			player setPlayerAngles(jumper.angles);
		}
	}
}

get_sniper()
{
	trig = getEnt("get_sniper","targetname");

	while(1)
	{
		trig waittill("trigger",player);

		player giveWeapon("m40a3_mp");
		player giveWeapon("remington700_mp");
		player giveMaxAmmo("m40a3_mp");
		player giveMaxAmmo("remington700_mp");
		wait 0.05;
		player switchToWeapon("m40a3_mp");
	}
}

rooms_setup(room)
{
	trig = getEnt(room.name+"_trig","targetname");
	jumper = getEnt("origin_jumper_"+room.name,"targetname");
	acti = getEnt("origin_acti_"+room.name,"targetname");

	thread room_respawn(room);

	while(1)
	{
		trig waittill("trigger",player);

		if(!isDefined(level.activ))
			continue;

		if(!player sr\api\_deathrun::order())
			continue;

		level.player_in_room = player;
		player thread room_on_dead();

		notif = SpawnStruct();
		notif.notifyText = "^5>> ^7"+player.name+" ^5Entered "+room.name+" room!";
		notif.duration = 4;
		notif.glowcolor = (0.3,1,1);

		players = getEntArray("player", "classname");

		for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(notif);

		player setOrigin(jumper.origin);
		level.activ setOrigin(acti.origin);
		player setPlayerAngles(jumper.angles);
		level.activ setPlayerAngles(acti.angles);

		if(room.name == "old")
			continue;

		player takeAllWeapons();
		level.activ takeAllWeapons();

		player freezeControls(true);
		level.activ freezeControls(true);

		player iPrintLnBold("^53");
		level.activ iPrintLnBold("^53");
		wait 1;
		player iPrintLnBold("^52");
		level.activ iPrintLnBold("^52");
		wait 1;
		player iPrintLnBold("^51");
		level.activ iPrintLnBold("^51");
		wait 1;
		player iPrintLnBold("^5GO!");
		level.activ iPrintLnBold("^5GO!");

		player freezeControls(false);
		level.activ freezeControls(false);

		if(room.name == "weapons")
		{
			weap = strTok(room.weapons,";");
			rng = randomIntRange(0,weap.size);

			player giveWeapon(weap[rng]);
			level.activ giveWeapon(weap[rng]);
			player giveMaxAmmo(weap[rng]);
			level.activ giveMaxAmmo(weap[rng]);
			wait 0.05;
			player switchToWeapon(weap[rng]);
			level.activ switchToWeapon(weap[rng]);
			continue;
		}

		if(room.weapons != "")
		{
			weap = strTok(room.weapons,";");

			for(i = 0; i < weap.size; i++)
			{
				player giveWeapon(weap[i]);
				level.activ giveWeapon(weap[i]);
				player giveMaxAmmo(weap[i]);
				level.activ giveMaxAmmo(weap[i]);

				if(i == 0)
				{
					wait 0.05;
					player switchToWeapon(weap[i]);
					level.activ switchToWeapon(weap[i]);
				}
			}
		}
	}
}

room_on_dead()
{
	self endon("disconnect");
	self waittill("death");
	level.player_in_room = undefined;
}

secrets()
{
	secret = [];

	for(i = 0; i < 2; i++)
		secret[i] = SpawnStruct();

	secret[0].name = "easy";
	secret[1].name = "hard";

	secret[0].xp = 75;
	secret[1].xp = 300;

	thread secrets_setup(secret[0]);
	thread secrets_setup(secret[1]);
}

secrets_setup(secret)
{
	trig = getEnt(secret.name+"_trig","targetname");
	trig_checkpoint = getEntArray(secret.name+"_respawn_trig","targetname");
	ori = getEntArray(secret.name+"_respawn_ori","targetname");

	thread secret_enter(secret);
	thread secret_finish(secret);

	for(i = 0; i < trig_checkpoint.size; i++)
		trig_checkpoint[i] thread secret_checkpoint(secret,i);

	while(1)
	{
		trig waittill("trigger",player);

		if(!isDefined(player.secret_checkpoint[secret.name]))
			player thread safe_tp(getEnt(secret.name+"_ori","targetname"));
		else
			player thread safe_tp(ori[player.secret_checkpoint[secret.name]]);
	}
}

secret_checkpoint(secret,i)
{
	for(;;)
	{
		self waittill("trigger",player);

		if(!isDefined(player.secret_checkpoint[secret.name]) ||
			isDefined(player.secret_checkpoint[secret.name]) &&
			player.secret_checkpoint[secret.name] != i)
			player.secret_checkpoint[secret.name] = i;
		else
			wait 1;
	}
}

secret_enter(secret)
{
	trig = getEnt(secret.name+"_enter","targetname");
	ori = getEnt(secret.name+"_ori","targetname");

	for(;;)
	{
		trig waittill("trigger",player);

		player thread safe_tp(ori);
		player.secret_checkpoint = [];
		player.secret_checkpoint[secret.name] = undefined;
		player iPrintLnBold("^5You entered the ^7"+secret.name+" ^5secret!");
	}
}

secret_finish(secret)
{
	trig = getEnt(secret.name+"_finish","targetname");
	ori = getEnt(secret.name+"_finish_ori","targetname");

	for(;;)
	{
		trig waittill("trigger",player);

		player thread safe_tp(ori);
		player.secret_checkpoint = [];
		player.secret_checkpoint[secret.name] = undefined;
		iPrintLnBold(player.name+" ^5Finished the ^7"+secret.name+" ^7secret!");
	}
}

safe_tp(ori)
{
	self endon("death");
	self endon("disconnect");

	self freezeControls(true);
	self setOrigin(ori.origin);
	self setPlayerAngles(ori.angles);
	wait 0.05;
	self freezeControls(false);
}

music()
{
	music = [];

	for(i = 0; i < 5; i++)
		music[i] = SpawnStruct();

	music[0].name = "009 Sound System - Born To Be Wasted";
	music[1].name = "ID - ID";
	music[2].name = "Manu Da Bas - Taratrumpet ";
	music[3].name = "Steve Aoki & Chris Lake & Tujamo - Boneless";
	music[4].name = "FazH Olmez - Mor";

	music[0].alias = "song4";
	music[1].alias = "song2";
	music[2].alias = "song3";
	music[3].alias = "song1";
	music[4].alias = "song5";

	thread music_trig(music);
}

music_trig(music)
{
	trig = getEnt("music_trig","targetname");

	while(isDefined(trig))
	{
		if(isDefined(trig)) 
			trig waittill("trigger",player);
		else 
			break;

		if(!isDefined(level.in_music_menu))
			player thread music_setup(music);
		else
			wait 0.2;
	}
}

music_setup(music)
{
	level.in_music_menu = true;
	self thread music_clean();

	self endon("death");
	self endon("disconnect");

	self.music_hud = [];
	self.selection = 0;

	i = 0;
	self.music_hud[i] = braxi\_mod::addTextHud(self, 160, 200, 0.35, "left", "top", 2);
	self.music_hud[i].sort = 880;
	self.music_hud[i] setShader("black", 320, 160);

	i++;
	self.music_hud[i] = braxi\_mod::addTextHud(self, 270, 204, 1, "left", "top", 1.8);
	self.music_hud[i].sort = 884;
	self.music_hud[i] setText(">^5>^7> ^7Select ^7a ^7Song ^5<^7<^5<");

	i++;
	self.music_hud[i] = braxi\_mod::addTextHud(self, 288, 360, 1, "center", "top", 1.4);
	self.music_hud[i].sort = 885;
	self.music_hud[i] setText("Press ^5[^7USE^5]^7: ^5Play ^7Song");

	for( j = 0; j < music.size; j++ )
	{
		i++;
		self.music_hud[i] = braxi\_mod::addTextHud(self, 172, 230+(j*16), 1, "left", "top", 1.4);
		self.music_hud[i].sort = 882;
		self.music_hud[i].font = "objective";
		self.music_hud[i] setText( music[j].name );
	}

	i++;
	self.music_hud[i] = braxi\_mod::addTextHud(self, 167, 230, 0.4, "left", "top", 1.4);
	self.music_hud[i].sort = 881;
	indicator = self.music_hud[i];
	indicator setShader("white", 306, 17);

	self freezeControls(true);

	while(1)
	{
		wait 0.1;

		if(self attackButtonPressed())
		{
			self.selection++;

			if( self.selection >= music.size )
				self.selection = 0;
 
			indicator.y = self.music_hud[3+self.selection].y;
		}

		if(self useButtonPressed())
		{
			iPrintLn("^5Now playing: ^7"+music[self.selection].name);
			ambientPlay( music[self.selection].alias, 3 );
			getEnt("music_trig","targetname") delete();
			break;
		}

		if(self meleeButtonPressed())
		{
			level.in_music_menu = undefined;
			break;
		}
	}

	self notify("music_thread");
}

music_wait(a,b,c)
{
	self endon(a);
	self endon(b);
	self endon(c);

	self waittill(a);
}

music_clean()
{
	self music_wait("death","disconnect","music_thread");
	
	if(isDefined(self.music_hud))
	{
		for(i = 0; i < self.music_hud.size; i++)
			self.music_hud[i] Destroy();

		self.music_hud = undefined;
	}

	self freezeControls(false);
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
		self setClientDvar("r_filmTweakLightTint","0.736 1.092 1.618");
		self setClientDvar("r_filmTweakDarkTint","0.697 0.697 0.618");
		self setClientDvar("r_filmTweakBrightness",0.05);
		self setClientDvar("r_filmTweakContrast",1.312);
		self setClientDvar("r_lightTweakSunLight",0.9);
		self setClientDvar("r_filmTweakEnable",1);
		self setClientDvar("r_filmUseTweaks",1);
		self setClientDvar("r_specularMap",3);

		wait 1;
	}
}

games()
{
	thread startdoor();
	thread elevator();
	thread moving_plat();
	thread adv();
}

adv()
{
	brush = getEntArray("adv","targetname");

	brush[0] thread rotate_Yaw();
	brush[1] thread rotate_Roll();
}

rotate_Roll()
{
	while(1)
	{
		self rotateRoll(360,4);
		wait 3.9;
	}
}

rotate_Pitch()
{
	while(1)
	{
		self rotatePitch(360,4);
		wait 3.9;
	}
}

rotate_Yaw()
{
	while(1)
	{
		self rotateYaw(360,4);
		wait 3.9;
	}
}

startdoor()
{
	level waittill("round_started");

	startdoor = getEnt("startdoor","targetname");

	notif = SpawnStruct();
	notif.notifyText = "^5xM^0#^7rAKy Map :)";
	notif.duration = 6;
	notif.glowcolor = (0.3,1,1);

	players = getEntArray("player", "classname");

	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(notif);

	wait 3;

	startdoor moveZ(-600,5,1,0);
	startdoor waittill("movedone");
	startdoor delete();
}

elevator()
{
	trig = getEnt("elevator_trig","targetname");
	brush = getEnt("elevator","targetname");

	while(1)
	{
		trig waittill("trigger");

		brush moveTo(brush.origin + (0,0,-640),2);
		brush waittill("movedone");

		wait 3;

		brush moveTo(brush.origin + (0,0,640),2);
		brush waittill("movedone");
	}
}

moving_plat()
{
	ori = [];
	getEntArray("moving_ori","targetname")[0] hide();
	getEntArray("moving_ori","targetname")[1] hide();
	getEntArray("moving_ori","targetname")[2] hide();
	ori[0] = getEntArray("moving_plat","targetname")[0].origin;
	ori[1] = getEntArray("moving_ori","targetname")[0].origin;
	ori[2] = getEntArray("moving_ori","targetname")[1].origin;
	ori[3] = getEntArray("moving_ori","targetname")[2].origin;

	brush = getEntArray("moving_plat","targetname");

	for(i = 0; i < brush.size; i++)
	{
		wait 2;
		brush[i] thread moving_plat_do(ori);
	}
}

moving_plat_do(ori)
{
	while(isDefined(self))
	{
		if(isDefined(self)) self moveTo(ori[1],2);
		wait 2;
		if(isDefined(self)) self moveTo(ori[2],2);
		wait 2;
		if(isDefined(self)) self moveTo(ori[3],2);
		wait 2;
		if(isDefined(self)) self moveTo(ori[0],2);
		wait 2;
	}
}