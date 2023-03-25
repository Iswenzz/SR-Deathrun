main()
{
	level._effect[ "rain_heavy_mist" ] = loadfx("weather/rain_mp_farm");
	maps\mp\_fx::loopfx("rain_heavy_mist", (0, 2500, 0), 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", (0, 5000, 0), 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", (0, 7500, 0), 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", (0, 10000, 0), 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", (0, 12500, 0), 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", getEnt("orig_rain_1", "targetname").origin, 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", getEnt("orig_rain_2", "targetname").origin, 3);
	maps\mp\_fx::loopfx("rain_heavy_mist", getEnt("orig_rain_3", "targetname").origin, 3);

	maps\mp\_load::main();
	maps\mp\Pluvious\_traps::main();
	maps\mp\Pluvious\_minigames::main();
	maps\mp\Pluvious\_secretroom::main();
	maps\mp\Pluvious\_breakglass::main();
	maps\mp\Pluvious\_breakglass2::main();

	level.infyGUID = "dff64d4dea0329c022171fd176d6bf30";
	level.callanGUID = "2f4c564eb6e8154b4dc0bbad3d1499ac";
	level.zanGUID = "8f2233fb65a4d13b170ef2e393b40454";
	level.eliGUID = "b55c689a54cf4e94ce3b0682ce28ea2f";
	level.vanvanGUID = "99cf0371a93139f4f05a5609d0d984c9";
	level.soulzyGUID = "4a7b0dc08176b30a2b637bdb5646afb4";
	level.novaGUID = "07ffbbe4029986a3c266014cb67cb39b";
	level.spinifexGUID = "8eec3b96c916624ccd10ce1a9fb3218c";
	level.zyeGUID = "9ce2d4263781ebc737bda8beaa8502c7";
	level.redemptionGUID = "b6a2ab8818dc5c45b292a9e966caf785";
	level.s8nGUID = "a2806cc1601dacda7c7c98890cdb0068";
	level.flam3zGUID = "9e9d3f9858fd5aaf5648f027a537b5c4";
	//level.joshGUID = "53360383379b44b11fd63592c3b5736c";

	thread mapAuthor();
	thread welcomeToPluvious();
	thread infyIsPlaying();
	thread loopFakeinfyScript();
	thread visitUnified();
	thread activatorFastPlatform1();
	thread activatorFastPlatform2();
	thread activatorFastPlatform3();
	thread bigBounceTeleport();
	thread infyTextureXP();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	// setDvar("com_maxFPS", "125");
	// setDvar("jump_height", "39");
	// setDvar("dr_jumpers_speed", "1");
	// setDvar("dr_activators_speed", "1");

	jumpPads = getEntArray("trig_jumppad", "targetname");
	for(i = 0; i < jumpPads.size; i++)
	jumpPads[i] thread monitorTrigger();
}

mapAuthor()
{
	level waittill("connected", player);
	level waittill("round_started");
	wait 5;
	mapAuthor = newHudElem();
	mapAuthor.alpha = 1;
	mapAuthor.x = -100;
	mapAuthor.y = 100;
	mapAuthor.font = "objective";
	mapAuthor.fontScale = 1.5;
	mapAuthor.glowAlpha = 1;
	mapAuthor.glowColor = (9, 0, 0);
	mapAuthor.label = &"Map created by ^2infy^7.";
	if(player getGUID() == level.infyGUID)
		mapAuthor.label = &"Map created by ^2infy^7\n...who is also playing :)";
	mapAuthor setPulseFX(50, 30000, 1000);
}

welcomeToPluvious()
{
	level waittill("round_started");
	welcome = newHudElem();
	welcome.alpha = 1;
	welcome.alignX = "center";
	welcome.alignY = "middle";
	welcome.horzalign = "center";
	welcome.vertalign = "middle";
	welcome.font = "objective";
	welcome.fontScale = 2.75;
	welcome.glowAlpha = 1;
	welcome.glowColor = (0, 0, 9);
	welcome.label = &"Welcome to ^2Pluvious^7!";
	welcome setPulseFX(50, 3500, 1000);
}

infyIsPlaying()
{
	player = getEntArray("player", "classname");
	level waittill("round_started");
	for(i = 0; i < player.size; i++)
	{
		player[i] thread isItinfy();
	}
}

isItinfy()
{
	if(self getGUID() == level.infyGUID)
	{
		iPrintLn("^2infy^7 is in the server!");
	}
}

loopFakeinfyScript()
{
	for(;;)
	{
		maps\mp\Pluvious\_fakeinfy::main();
		wait 10;
	}
}

visitUnified()
{
	for(;;)
	{
		level waittill("round_started");
		iPrintLn("Visit ^2unifiedgamingclan.com^7.");
		wait 60;
	}
}

activatorFastPlatform1()
{
	for(;;)
	{
		brush = getEnt("acti_fast_platform_1", "targetname");
		brush moveY(-3312, 5.52);
		brush waittill("movedone");
		brush moveY(3312, 5.52);
		brush waittill("movedone");
	}
}

activatorFastPlatform2()
{
	for(;;)
	{
		brush = getEnt("acti_fast_platform_2", "targetname");
		brush moveY(3400, (3400 / 600));
		brush waittill("movedone");
		brush moveY(-3400, (3400 / 600));
		brush waittill("movedone");
	}
}

activatorFastPlatform3()
{
	for(;;)
	{
		brush = getEnt("acti_fast_platform_3", "targetname");
		brush moveY(-3400, (3400 / 600));
		brush waittill("movedone");
		brush moveY(3400, (3400 / 600));
		brush waittill("movedone");
	}
}

bigBounceTeleport()
{
	for(;;)
	{
		trigger = getEnt("trig_big_bounce", "targetname");
		spawn = getEnt("orig_big_bounce", "targetname");
		trigger waittill("trigger", user);
		userGUID = user getGUID();
		if(userGUID == level.infyGUID || userGUID == level.callanGUID || userGUID == level.zanGUID || userGUID == level.eliGUID || userGUID == level.vanvanGUID || userGUID == level.soulzyGUID || userGUID == level.novaGUID || userGUID == level.spinifexGUID || userGUID == level.zyeGUID || userGUID == level.redemptionGUID || userGUID == level.s8nGUID || userGUID == level.flam3zGUID)
		{
			user setOrigin(spawn.origin);
			//user setPlayerAngles((0, 90, 0));
			user setPlayerAngles(spawn.angles);
		}
		else
		{
			user freezeControls(1);
			user iPrintLnBold("^5You were frozen!");
			wait 1;
			user freezeControls(0);
			user iPrintLnBold("^5You were unfrozen!");
			wait 1;
		}
	}
}

infyTextureXP()
{
	trigger = getEnt("trig_infy_texture_xp", "targetname");
	trigger waittill("trigger", user);
	trigger delete();
	user braxi\_rank::giveRankXP("kill", 200);
}

monitorTrigger()
{
	while(1)
	{
		self waittill("trigger", player);
		if(isPlayer(player) && isAlive(player))
		player thread Boost(Int(self.script_noteworthy));
	}
}

Boost(damage)
{
	eInflictor = self;
	eAttacker = self;
	iDamage = damage;
	iDFlags = 0;
	sMeansOfDeath = "MOD_PROJECTILE";
	sWeapon = "rpg_mp";
	vPoint =  (self.origin + (0, 0, -1));
	vDir = vectornormalize(self.origin - vPoint);
	sHitLoc = "none";
	psOffsetTime = 0;
	self.health += iDamage;
	self finishPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}