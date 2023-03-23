#include sr\utils\_common;
#include sr\utils\_hud;
#include sr\utils\_math;
#include sr\sys\_events;
#include sr\sys\_dvar;

main()
{
	game["scoreboard"] = IfUndef(game["scoreboard"], []);
	game["scoreboard_records"] = IfUndef(game["scoreboard_records"], []);

	setDvar("g_TeamName_Allies", "^5Jumpers");
	setDvar("g_TeamIcon_Allies", "");
	setDvar("g_TeamColor_Allies", "0.86 0.86 0.88");
	setDvar("g_ScoresColor_Allies", "0 0 0");

	setDvar("g_TeamName_Axis", "^8Activators");
	setDvar("g_TeamIcon_Axis", "");
	setDvar("g_TeamColor_Axis", "0.9 0.7 0.5");
	setDvar("g_ScoresColor_xis", "0 0 0");

	setDvar("g_ScoresColor_Spectator", ".25 .25 .25");
	setDvar("g_ScoresColor_Free", ".76 .78 .10");
	setDvar("g_teamColor_MyTeam", "0 0.9 1");
	setDvar("g_teamColor_EnemyTeam", "0.6 0.6 0.6");

	score("kills", "killiconsuicide", "Kills");
	score("headshots", "killiconheadshot", "Headshots");
	score("score", "score_icon", "Score");
	score("knifes", "killiconmelee", "Knifes");
	score("time", "hudstopwatch", "Time");

	event("map", ::load);
	event("map", ::updateScoreboard);
}

score(id, shader, name)
{
	score = [];
	score["id"] = id;
	score["name"] = name;
	score["shader"] = shader;
	score["player"] = undefined;
	score["playerId"] = undefined;
	score["value"] = 0;
	score["display"] = "";
	score["record"] = false;

	if (!isDefined(game["scoreboard"][id]))
	{
		game["scoreboard"][id] = score;
		game["scoreboard_records"][id] = score;
	}
}

load()
{
	critical_enter("mysql");

	request = SQL_Prepare("SELECT player, name, score, value FROM scores WHERE map = ?");
	SQL_BindParam(request, level.map, level.MYSQL_TYPE_STRING);
	SQL_BindResult(request, level.MYSQL_TYPE_STRING, 36);
	SQL_BindResult(request, level.MYSQL_TYPE_STRING, 36);
	SQL_BindResult(request, level.MYSQL_TYPE_STRING, 30);
	SQL_BindResult(request, level.MYSQL_TYPE_LONG);
	SQL_Execute(request);
	AsyncWait(request);

	rows = SQL_FetchRowsDict(request);
	SQL_Free(request);
	critical_release("mysql");

	for (i = 0; i < rows.size; i++)
	{
		row = rows[i];
		id = row["score"];

		game["scoreboard_records"][id]["player"] = row["name"];
		game["scoreboard_records"][id]["playerId"] = row["player"];
		game["scoreboard_records"][id]["value"] = row["value"];
		game["scoreboard_records"][id]["display"] = ToString(row["value"]);
		game["scoreboard_records"][id]["record"] = true;

		if (id == "time")
		{
			time = originToTime(row["value"]);
			game["scoreboard_records"][id]["display"] = "" + time.min + ":" + time.sec + "." + time.ms;
		}
	}
}

save()
{
	critical_enter("mysql");

	scores = getArrayKeys(game["scoreboard"]);
	for (i = 0; i < scores.size; i++)
	{
		score = game["scoreboard"][scores[i]];
		record = game["scoreboard_records"][scores[i]];

		if (!isDefined(score["player"]) || !isDefined(score["playerId"])
			|| !score["record"] || score["value"] == record["value"])
			continue;

		request = SQL_Prepare("UPDATE scores SET player = ?, name = ?, value = ? WHERE map = ? AND score = ?");
		SQL_BindParam(request, score["playerId"], level.MYSQL_TYPE_STRING);
		SQL_BindParam(request, score["player"], level.MYSQL_TYPE_STRING);
		SQL_BindParam(request, score["value"], level.MYSQL_TYPE_LONG);
		SQL_BindParam(request, level.map, level.MYSQL_TYPE_STRING);
		SQL_BindParam(request, score["id"], level.MYSQL_TYPE_STRING);
		SQL_Execute(request);
		AsyncWait(request);

		affected = SQL_AffectedRows(request);
		SQL_Free(request);

		if (!affected)
		{
			request = SQL_Prepare("INSERT INTO scores (map, player, name, score, value) VALUES (?, ?, ?, ?, ?)");
			SQL_BindParam(request, level.map, level.MYSQL_TYPE_STRING);
			SQL_BindParam(request, score["playerId"], level.MYSQL_TYPE_STRING);
			SQL_BindParam(request, score["player"], level.MYSQL_TYPE_STRING);
			SQL_BindParam(request, score["id"], level.MYSQL_TYPE_STRING);
			SQL_BindParam(request, score["value"], level.MYSQL_TYPE_LONG);
			SQL_Execute(request);
			AsyncWait(request);
			SQL_Free(request);
		}
	}
	critical_release("mysql");
}

updateScoreboard()
{
	level waittills("game_ended", "round_ended");

	wait 1;

	players = getAllPlayers();
	scores = getArrayKeys(game["scoreboard"]);

	for (i = 0; i < scores.size; i++)
	{
		for (j = 0; j < players.size; j++)
		{
			score = game["scoreboard"][scores[i]];
			record = game["scoreboard_records"][scores[i]];
			entry = players[j] makeEntry();

			id = score["id"];
			if (!isDefined(entry[id]))
				continue;

			// Scores
			if ((id == "time" && entry[id] < score["value"])
				|| entry[id] > score["value"])
				updateScore(id, entry);

			// Records
			if (!record["record"]
				|| (id == "time" && score["value"] < record["value"])
				|| (score["value"] > record["value"]))
				game["scoreboard"][id]["record"] = true;
		}
	}
}

updateScore(id, entry)
{
	game["scoreboard"][id]["player"] = entry["name"];
	game["scoreboard"][id]["playerId"] = entry["player"];
	game["scoreboard"][id]["value"] = entry[id];
	game["scoreboard"][id]["display"] = ToString(entry[id]);

	if (id == "time")
	{
		time = originToTime(entry[id]);
		game["scoreboard"][id]["display"] = "" + time.min + ":" + time.sec + "." + time.ms;
	}
}

makeEntry()
{
	entry = [];

	entry["player"] = self.id;
	entry["name"] = self.name;
	entry["kills"] = self.pers["kills"];
	entry["headshots"] = self.pers["headshots"];
	entry["score"] = self.pers["score"];
	entry["knifes"] = self.pers["knifes"];
	entry["time"] = self.pers["time"];

	return entry;
}

showBestScores()
{
	level.huds["score"] = [];
	level.huds["score"]["scores"] = [];
	level.huds["score"]["title"] = addHud(level, 0, -130, 1, "center", "middle", 2.5, 1000, true);
	level.huds["score"]["title"].label = &"BEST PLAYERS OF THIS MAP";
	level.huds["score"]["title"] thread fadeIn(0, 1);

	scores = getArrayKeys(game["scoreboard"]);
	for (i = 0; i < scores.size; i++)
	{
		score = game["scoreboard"][scores[i]];
		id = score["id"];

		spacing = 65;
		x = spacing * 2 + (i * neg(spacing));

		level.huds["score"][id] = [];
		level.huds["score"][id]["icon"] = addHud(level, x, -80, 1, "center", "middle", 1.4, 1000, true);
		level.huds["score"][id]["icon"] setShader(score["shader"], 40, 40);
		level.huds["score"][id]["icon"] thread fadeIn(0, 1);
		level.huds["score"][id]["player"] = addHud(level, x, -50, 1, "center", "middle", 1.4, 1000, true);
		level.huds["score"][id]["player"] setText(IfUndef(score["player"], "-"));
		level.huds["score"][id]["player"] thread fadeIn(0, 1);
		level.huds["score"][id]["value"] = addHud(level, x, -25, 1, "center", "middle", 2.2, 1000, true);
		level.huds["score"][id]["value"] setText(score["display"]);
		level.huds["score"][id]["value"] thread fadeIn(0, 1);
		y = 100 - (i * 20);

		level.huds["score"]["scores"][id] = addHud(level, 0, y, 1, "center", "middle", 1.6, 1000, true);
		level.huds["score"]["scores"][id] setText(stringBestScore(score));
		level.huds["score"]["scores"][id] thread fadeIn(0, 1);
	}
	thread save();
	wait 8;

	level clear();
	wait 1;
}

stringBestScore(score)
{
	id = score["id"];
	record = Ternary(score["record"], "^2NEW ", "");

	if (!score["record"])
		score = game["scoreboard_records"][id];

	if (!isDefined(score["player"]))
		return fmt("This map doesn't have a ^5%s Record ^7yet", score["name"]);
	return fmt("%s^7%s Record ^5%s ^7%s", record, score["name"], score["display"], score["player"]);
}

playerStringBestScore(score)
{
	return fmt("%s\n%s", IfUndef(score["player"], "-"), score["display"]);
}

clear()
{
	if (!isDefined(level.huds["score"]))
		return;

	huds = getArrayKeys(level.huds["score"]);
	for (i = 0; i < huds.size; i++)
	{
		if (!isDefined(level.huds["score"][huds[i]]))
			continue;

		if (huds[i] == "scores")
		{
			scores = getArrayKeys(game["scoreboard"]);
			for (j = 0; j < scores.size; j++)
				level.huds["score"]["scores"][scores[j]] thread fadeOut(0, 1);
			continue;
		}
		if (GetType(level.huds["score"][huds[i]]) == "ARRAY")
		{
			level.huds["score"][huds[i]]["icon"] thread fadeOut(0, 1);
			level.huds["score"][huds[i]]["player"] thread fadeOut(0, 1);
			level.huds["score"][huds[i]]["value"] thread fadeOut(0, 1);
			continue;
		}
		level.huds["score"][huds[i]] thread fadeOut(0, 1);
	}
}
