#include sr\sys\_events;
#include sr\utils\_common;
#include sr\utils\_hud;

main()
{
	level.mapName = toLower(getDvar("mapname"));
	level.jumpers = 0;
	level.activators = 0;
	level.activatorKilled = false;
	level.freeRun = false;
	level.allowSpawn = true;
	level.trapTriggers = [];
	level.trapsDisabled = false;
	level.canCallFreeRun = true;
	level.firstBlood = false;
	level.lastJumper = false;
	level.mapHasTimeTrigger = false;

	event("map", ::start);
	event("map", ::bots);
	event("spawn", ::playerAFK);
	event("spawn", ::playerWeapon);
}

bots()
{
	if (!level.dvar["debug"])
		return;

	waitMapLoad(2);
	spawnBots(1);
}

start()
{
	level waittill("round_started");

	thread watchGame();
	thread watchTraps();
	thread specialRound();
	// thread autoRespawn();
}

watchGame()
{
	level endon("end");
	level endon("endround");
	level endon("kill logic");

	while (game["state"] == "playing")
	{
		wait 0.05;

		level.jumper = [];
		level.jumpers = 0;
		level.activators = 0;
		level.totalPlayers = 0;
		level.totalPlayingPlayers = 0;

		players = getAllPlayers();
		if (!players.size)
			continue;

		for (i = 0; i < players.size; i++)
		{
			player = players[i];
			level.totalPlayers++;

			if (player isPlaying() && !player isDead())
			{
				level.totalPlayingPlayers++;
				if (player isAllies())
				{
					level.jumpers++;
					level.jumper[level.jumper.size] = player;
				}
				if (player isAxis())
					level.activators++;
			}
		}
		if (level.jumpers == 1 && !level.freeRun)
			level.jumper[0] thread lastJumper();
		if (level.jumpers > 1 && !level.activators && !level.activatorKilled && !level.freeRun)
		{
			pickActivator();
			continue;
		}
		if (level.jumpers <= 1 && !level.activators && !level.activatorKilled && !level.freeRun)
		{
			game["roundsplayed"]--;
			levelRestart(true);
			return;
		}
		else if(!level.jumpers && level.activators)
			thread deathrun\core\_map::endRound("Jumpers died", "activators");
		else if(level.jumpers && !level.activators && !level.freeRun)
			thread deathrun\core\_map::endRound("Activator died", "jumpers");
		else if(!level.jumpers && !level.activators)
			thread deathrun\core\_map::endRound("Everyone died", "activators");
	}
}

watchTraps()
{
	for (i = 0; i < level.trapTriggers.size; i++)
	{
		if (level.dvar["freeRunChoice"] == 2)
			level.trapTriggers[i] thread trapFreeRun();
		if (level.dvar["giveXpForActivation"])
			level.trapTriggers[i] thread trapActivation();
	}
}

autoRespawn()
{
	level endon("end");
	level endon("endround");
	level endon("kill logic");

	while (true)
	{
		players = getDeadPlayers();
		for (i = 0; i < players.size; i++)
			players[i] respawn();

		iPrintLn("^5All players respawned.");
		wait 120;
	}
}

specialRound()
{
	if (level.freeRun)
		return;

	level waittill("round_started");
	wait 1;

	if (randomIntRange(0, 100) > 1)
		return;

	modes = strTok("190;Q3;Q3CPM;Q3CPMW;CS;Portal", ";");
	startSpecialRound(modes[randomInt(modes.size)]);
}

startSpecialRound(mode)
{
	color = "^7";
	mode = undefined;
	modeIndex = 0;

	switch (mode)
	{
		case "190":
			mode = deathrun\core\_run::start_190;
			modeIndex = 1;
			break;
		case "Q3":
			mode = deathrun\core\_run::start_Q3;
			modeIndex = 3;
			break;
		case "Q3CPM":
			mode = deathrun\core\_run::start_Q3CPM;
			modeIndex = 4;
			break;
		case "Q3CPMW":
			mode = deathrun\core\_run::start_Q3CPMW;
			modeIndex = 5;
			break;
		case "CS":
			mode = deathrun\core\_run::start_CS;
			modeIndex = 6;
			break;
		case "Portal":
			mode = deathrun\core\_run::start_Portal;
			modeIndex = 7;
			break;
	}
	msg = fmt("%s%s ROUND", color, toUpper(mode));
	thread braxi\_mod::drawInformation(800, 0.8, 1, msg);
	thread braxi\_mod::drawInformation(800, 0.8, -1, msg);

	if (!isDefined(mode))
		return;

	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
	{
		players[i] setStat(1700, modeIndex);
		players[i] thread [[mode]]();
	}
}

trapFreeRun()
{
	if (!isDefined(self))
		return;

	level endon("kill_free_run_choice");

	self endon("death");
	self endon("delete");
	self endon("deleted");

	self waittill("trigger", player);
	level.canCallFreeRun = false;

	if (isDefined(player.huds["player"]["free"]))
		player.huds["player"]["free"] destroy();
	if (isDefined(player.huds["player"]["free_timer"]))
		player.huds["player"]["free_timer"] destroy();

	level notify("kill_free_run_choice");
}

trapActivation()
{
	if (!isDefined(self))
		return;

	self endon("death");
	self endon("delete");
	self endon("deleted");

	self waittill("trigger", player);

	if (!player isAxis())
		return;

	player sr\core\_rank::giveRankXP("trap_activation");
}

disableTraps()
{
	level.trapsDisabled = true;
	for (i = 0; i < level.trapTriggers.size; i++)
	{
		if (isDefined(level.trapTriggers[i]))
			level.trapTriggers[i].origin = level.trapTriggers[i].origin - (0, 0, 10000);
	}
	level notify("traps_disabled");
}

pickActivator()
{
	level notify("picking activator");

	players = getPlayingPlayers();
	activator = undefined;

	while (!isDefined(activator) || activator.number == getDvarInt("last_picked_player"))
		activator = players[randomInt(players.size)];

	if (isDefined(level.forceActivator))
		activator = level.forceActivator;

	activator thread actiGodmode();
	activator sr\core\_teams::setTeam("axis");
	activator sr\core\_rank::giveRankXp("activator");
	activator eventSpawn(true);

	setDvar("last_picked_player", activator.number);
	level notify("activator", activator);
	level.activ = activator;
}

actiGodmode()
{
	self endon("disconnect");
	self.godmode = true;
	wait 1;
	self.godmode = undefined;
}

lastJumper()
{
	if (!level.dvar["lastalive"] || level.lastJumper)
		return;

	level.lastJumper = true;
	level thread playSoundOnAllPlayers("last_alive");

	hud = addHud(level, 320, 240, 0, "center", "middle", 1.4);
	hud setText(self.name + " is the last Jumper alive");
	hud.glowColor = (0, 0.7, 0.7);
	hud.glowAlpha = 1;
	hud SetPulseFX(30, 100000, 700);
	hud fadeOverTime(0.5);
	hud.alpha = 1;
	wait 2.6;
	hud fadeOverTime(0.4);
	hud.alpha = 0;
	wait 0.4;

	hud destroy();
}

giveLife()
{
	if (!level.dvar["allowLifes"] || self.pers["lifes"] >= 3)
		return;

	self.pers["lifes"]++;
	self thread deathrun\huds\_player::addLife();
}

useLife()
{
	if (!self.pers["lifes"])
		return;

	self.usedLife = true;
	self.pers["lifes"]--;
	self respawn();
}

hasTraps()
{
	return level.trapTriggers.size;
}

playerAFK()
{
	self endon("spawn");
	self endon("death");
	self endon("disconnect");

	if (!level.dvar["afk"] || self isAxis() || level.freeRun)
		return;

	if (game["state"] != "playing")
		level waittill("round_started");

	time = 0;
	previousOrigin = self.origin - (0, 0, 50);
	while (isAlive(self))
	{
		wait 0.2;

		time = Ternary(distance(previousOrigin, self.origin) <= 10, time + 1, 0);
		if (time == int(level.dvar["afk_warn"] * 5))
			self iPrintlnBold("Move or you will be killed due to AFK");
		if (time == int(level.dvar["afk_time"] * 5))
		{
			iPrintln(self.name + " was killed due to AFK.");
			self suicide();
		}
		previousOrigin = self.origin;
	}
}

playerWeapon()
{
	self endon("spawn");
	self endon("death");
	self endon("disconnect");

	while (true)
	{
		wait 0.2;

		weapon = self getCurrentWeapon();
		if (weapon == "none")
			continue;

		self.droppableWeapon = weapon;
	}
}

dropWeapon()
{
	if (!isDefined(self.droppableWeapon))
		return;

	self dropItem(self.droppableWeapon);
}
