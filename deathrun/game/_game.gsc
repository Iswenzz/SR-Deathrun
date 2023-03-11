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
	level.trapsDisabled = false;
	level.canCallFreeRun = true;
	level.firstBlood = false;
	level.lastJumper = false;
	level.mapHasTimeTrigger = false;

	event("map", ::start);
	event("map", ::bots);
}

bots()
{
	waitMapLoad(2);
	spawnBots(1);
}

start()
{
	level waittill("round_started");

	thread watchGame();
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
				if (player.pers["team"] == "allies")
				{
					level.jumpers++;
					level.jumper[level.jumper.size] = player;
				}
				if (player.pers["team"] == "axis")
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

pickActivator()
{
	level notify("picking activator");

	players = getPlayingPlayers();
	activator = undefined;

	while (!isDefined(activator) || activator.number == getDvarInt("last_picked_player"))
		activator = players[randomInt(players.size)];

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
}
