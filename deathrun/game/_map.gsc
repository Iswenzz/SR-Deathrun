#include sr\sys\_events;
#include sr\sys\_file;
#include sr\utils\_common;

main()
{
	level.spawn = [];
	level.spawn["allies"] = getEntArray("mp_jumper_spawn", "classname");
	level.spawn["axis"] = getEntArray("mp_activator_spawn", "classname");
	level.colliders = [];
	level.tempEntity = spawn("script_model", (0, 0, 0));
	level.files["rotation"] = PATH_Mod("sr/data/match/rotation.txt");
	level.rotation = sr\game\_map::getRotation(false);
	level.randomizedMaps = [];

	thread sr\game\_map::randomizeMaps(5);

	event("map", ::placeSpawns);
	event("map", ::deleteUnsupportedWeapons);
}

placeSpawns()
{
	level.spawn["allies"] = getEntArray("mp_jumper_spawn", "classname");
	level.spawn["axis"] = getEntArray("mp_activator_spawn", "classname");

	if (getEntArray("mp_global_intermission", "classname").size == 0)
	{
		level.spawn["spectator"] = spawn("script_origin", (0, 0, 0));
		level.spawn["spectator"].angles = (0, 0, 0);
	}
	else
		level.spawn["spectator"] = getEntArray("mp_global_intermission", "classname")[0];

	if (!level.spawn["allies"].size)
		level.spawn["allies"] = getEntArray("mp_dm_spawn", "classname");
	if (!level.spawn["axis"].size)
		level.spawn["axis"] = getEntArray("mp_tdm_spawn", "classname");

	for (i = 0; i < level.spawn["allies"].size; i++)
		level.spawn["allies"][i] placeSpawnPoint();
	for (i = 0; i < level.spawn["axis"].size; i++)
		level.spawn["axis"][i] placeSpawnPoint();

	x = 0;
	y = 0;
	z = 0;

	angles = (0, 180, 0);

	for (i = 0; i < level.spawn["allies"].size; i++)
	{
		x += level.spawn["allies"][i].origin[0];
		y += level.spawn["allies"][i].origin[1];
	}
	if (level.spawn["allies"].size)
	{
		x /= level.spawn["allies"].size;
		y /= level.spawn["allies"].size;
		z = level.spawn["allies"][0].origin[2];

		angles = level.spawn["allies"][0].angles;
	}
	if (!isDefined(level.spawn["player"]))
	{
		level.spawn["player"] = spawn("script_origin", (x, y, z));
		level.spawn["player"].angles = angles;

		if (!level.spawn["player"] placeSpawnPoint())
		{
			level.spawn["player"].origin = level.spawn["allies"][0].origin;
			level.spawn["player"] placeSpawnPoint();
		}
	}
	if (!isDefined(level.spawn["activator"]))
	{
		axis = level.spawn["player"];
		if (level.spawn["axis"].size)
			axis = level.spawn["axis"][0];

		level.spawn["activator"] = spawn("script_origin", axis.origin);
		level.spawn["activator"].angles = axis.angles;
		level.spawn["activator"] placeSpawnPoint();
	}
}

end(map)
{
	if (game["state"] == "end")
		return;

	game["state"] = "end";
	level notify("intermission");
	level notify("game over");
	level notify("game_ended");

	wait 3;

	// Sequence
	endSpectate();
	displayMapScores();
	endMusic();

	if (IsNullOrEmpty(map))
		map = voteNextMap();

	credits();
	intermission();

	// Next map
	setDvar("sv_maprotationcurrent", fmt("gametype %s map %s", getDvar("g_gametype"), map));
	levelExit(false);
}

endRound(text, team)
{
	level endon("end");

	text = ifUndef(text, "Round ended");
	team = ifUndef(team, "jumpers");

	level notify("round_ended", text, team);
	level notify("endround");
	level notify("kill logic");
	game["state"] = "round ended";

	if (game["roundsplayed"] >= level.dvar["round_limit"])
		return end();

	level thread deathrun\game\_scoreboard::updateScoreboard();
	level thread announcement(text, (0.7, 0, 1));
	ambientStop(1);
	ambientPlay("end_round_" + (randomInt(11) + 1), 0.5);

	wait 11.5;
	ambientStop(0.5);
	wait 0.5;
	levelRestart(true);
}

endMusic()
{
	alias = fmt("end_map%d", randomIntRange(1, 9));
	thread sr\game\music\_main::play(alias);
}

endSpectate()
{
	setDvar("g_deadChat", 1);

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
	{
		players[i] closeMenu();
		players[i] closeInGameMenu();
		players[i] freezeControls(true);
		players[i] cleanUp();
		players[i] suicide();
	}
	wait .05;

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
	{
		players[i] sr\game\_teams::setSpectator();
		players[i] allowSpectateTeam("allies", true);
		players[i] allowSpectateTeam("axis", true);
		players[i] allowSpectateTeam("freelook", false);
		players[i] allowSpectateTeam("none", true);
	}
}

displayMapScores()
{
	if (!level.dvar["map_scores"])
		return;

	deathrun\game\_scoreboard::showBestScores();
}

voteNextMap()
{
	maps = level.randomizedMaps;
	autoPick = maps[randomInt(maps.size)];

	if (level.dvar["map_vote"])
	{
		result = sr\game\_poll::poll("Next map", maps);
		if (isDefined(result))
		{
			level sr\sys\_notifications::show(fmt("^5Next map: ^7%s", result.label));
			return result.label;
		}
		return autoPick;
	}
	wait 18;
	return autoPick;
}

credits()
{
	sr\game\_credits::start();
}

intermission()
{
	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i].sessionstate = "intermission";
	wait 10;
}

announcement(text, color)
{
	notifyData = spawnStruct();
	notifyData.titleText = text;
	notifyData.notifyText = fmt("Starting round ^5%d^7 out of ^5%d", game["roundsplayed"] + 1, level.dvar["round_limit"]);
	notifyData.glowColor = color;
	notifyData.duration = 9;

	players = getAllPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
}

deleteUnsupportedWeapons()
{
	weapons = strTok("knife_mp,m16_gl_mp,ak74u_reflex_mp,ak74u_acog_mp,ak74u_silencer_mp,dog_mp,shovel_mp", ",");

	for (i = 0; i < weapons.size; i++)
	{
		ents = getEntArray("weapon_" + weapons[i], "classname");
		if (!isDefined(ents) || !ents.size)
			continue;

		for (j = 0; j < ents.size; j++)
			ents[j] delete();
	}
}
