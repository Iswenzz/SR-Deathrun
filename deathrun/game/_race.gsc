#include sr\sys\_file;
#include sr\sys\_events;
#include sr\utils\_common;
#include sr\utils\_hud;

main()
{
	level.files["race"] = fmt(PATH_Mod("sr/data/race/%s.txt"), level.map);

	level.racePoints = [];
	level.raceEndTrig = getEnt("endmap_trig", "targetname");
	level.racePlayersFinished = [];

	event("map", ::race);
	event("spawn", ::onSpawn);
	event("death", ::clear);
}

race()
{
	level endon("end map");
	level endon("game over");
	level endon("intermission");

	load();

	level waittill("round_started");
	if (level.freeRun || !level.racePoints.size)
		return;

	watchRace();
}

onSpawn()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");
	self clear();

	if (level.freeRun || !level.racePoints.size)
		return;

	self.huds["race"] = addHud(self, 100, 0, 1, "left", "bottom", 1.6, 100, true);
	self.huds["race"].font = "objective";

	self.raceFinish = false;
	self.raceClosestPoint = 0;
	self.racePrevPlacement = 0;
}

load()
{
	if (!FILE_Exists(level.files["race"]))
		return;

	file = FILE_Open(level.files["race"], "r+");

	while (true)
	{
		line = FILE_ReadLine(file);
		tkn = strTok(line, "/");

		if (IsNullOrEmpty(line) || tkn.size < 3)
			break;

		origin = (ToFloat(tkn[0]), ToFloat(tkn[1]), ToFloat(tkn[2]));
		level.racePoints[level.racePoints.size] = origin;
	}
	FILE_Close(file);
}

watchRace()
{
	level endon("end map");
	level endon("game over");
	level endon("intermission");

	thread watchRaceEndTrig();

	while (true)
	{
		// Get players closest point
		players = getPlayingPlayers();
		for (i = 0; i < players.size; i++)
		{
			for (z = 0; z < level.racePoints.size; z++)
			{
				if (!isInRace(players[i]))
					continue;

				newDist = distance2D(players[i] getOrigin(), level.racePoints[z]);
				oldDist = distance2D(players[i] getOrigin(), level.racePoints[players[i].raceClosestPoint]);

				if (newDist < oldDist)
					players[i].raceClosestPoint = z;
			}
		}

		// See who is closest to the highest point
		order = [];
		players = getPlayingPlayers();
		for (z = level.racePoints.size; z >= 0; z--)
		{
			for (i = 0; i < players.size; i++)
			{
				if (isInRace(players[i]) && players[i].raceClosestPoint == z)
					order[order.size] = players[i];
			}
		}

		// Check if multiple players have the same highest point
		temp = 0;
		for (t = 0; t < order.size; t++)
		{
			for (i = 0; i < order.size - 1; i++)
			{
				if (isInRace(order[i]) && order[i].raceClosestPoint == order[i + 1].raceClosestPoint)
				{
					dist1 = undefined;
					dist2 = undefined;

					if (isDefined(level.racePoints[order[i].raceClosestPoint + 1]))
						dist1 = distance2D(order[i] getOrigin(), level.racePoints[order[i].raceClosestPoint + 1]);
					if (isDefined(level.racePoints[order[i + 1].raceClosestPoint + 1]))
						dist2 = distance2D(order[i + 1] getOrigin(), level.racePoints[order[i + 1].raceClosestPoint + 1]);

					if (isDefined(dist1) && isDefined(dist2) && dist1 > dist2)
					{
						temp = order[i + 1];
						order[i + 1] = order[i];
						order[i] = temp;
					}
				}
			}
		}
		for (i = 0; i < order.size; i++)
			order[i] updateRaceHud(level.racePlayersFinished.size + i + 1);
		wait 0.1;
	}
}

watchRaceEndTrig()
{
	level endon("end map");
	level endon("game over");
	level endon("intermission");
	level endon("race ended");

	while (true)
	{
		level.raceEndTrig waittill("trigger", player);
		if (!player.raceFinish)
			player thread playerFinish();
	}
}

playerFinish()
{
	self.raceFinish = true;
	self updateRaceHud(level.racePlayersFinished.size + 1);
	level.racePlayersFinished[level.racePlayersFinished.size] = self;
}

updateRaceHud(placement)
{
	text = getPlacementString(placement);

	if (isDefined(self.huds["race"]) && self.racePrevPlacement != placement && !self.raceFinish)
	{
		self.huds["race"] setText(text);
		self.racePrevPlacement = placement;
	}
}

getPlacementString(index)
{
	switch (index)
	{
		case 1: 	return "^31st";
		case 2: 	return "^82nd";
		case 3: 	return "^93rd";
		default: 	return "^7" + index + "th";
	}
}

isInRace(player)
{
	return player isPlaying() && !player.raceFinish && player.pers["team"] == "allies";
}

clear()
{
	if (isDefined(self.huds["race"]))
	{
		self.huds["race"] destroy();
		self.huds["race"] = undefined;
	}
}
