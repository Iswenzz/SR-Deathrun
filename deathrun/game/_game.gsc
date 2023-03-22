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
	event("map", ::specialRound);
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

			if (player isPlaying())
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
		if(!level.jumpers && level.activators)
			thread deathrun\game\_map::endRound("Jumpers died", "activators");
		else if(!level.activators && level.jumpers && !level.freeRun)
			thread deathrun\game\_map::endRound("Activator died", "jumpers");
		else if(!level.activators && !level.jumpers)
			thread deathrun\game\_map::endRound("Everyone died", "activators");
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

specialRound()
{
	if (level.freeRun)
		return;

	level waittill("round_started");
	wait 1;

	if (randomIntRange(0, 100) > 1)
		return;

	mode = randomIntRange(0, 2) + 1;
	switch (mode)
	{
		case 1:
			mode = deathrun\player\run\_defrag::start;
			thread braxi\_mod::drawInformation(800, 0.8, 1, "^3DEFRAG ROUND");
			thread braxi\_mod::drawInformation(800, 0.8, -1, "^3DEFRAG ROUND");
			break;
		case 2:
			mode = deathrun\player\run\_portal::start;
			thread braxi\_mod::drawInformation(800, 0.8, 1, "^5PORTAL ROUND");
			thread braxi\_mod::drawInformation(800, 0.8, -1, "^5PORTAL ROUND");
			break;
	}
	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread [[mode]]();
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

	player sr\game\_rank::giveRankXP("trap_activation");
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

	activator sr\game\_teams::setTeam("axis");
	activator sr\game\_rank::giveRankXp("activator");
	activator eventSpawn(true);

	setDvar("last_picked_player", activator.number);
	level notify("activator", activator);
	level.activ = activator;
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
	self thread deathrun\player\huds\_player::addLife();
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

	if (!level.dvar["afk"] || self isAxis())
		return;

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
