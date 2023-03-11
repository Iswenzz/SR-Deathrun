#include sr\sys\_events;
#include sr\utils\_common;
#include sr\utils\_hud;

main()
{
	event("spawn", ::hud);
	event("death", ::clear);
}

hud()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	self clear();

	self.huds["player"] = [];
 	self.huds["player"]["lifes"] = [];

	self.huds["player"]["free"] = addHud(self, 0, 70, 1, "center", "middle", 1.8, 1000, true);
	self.huds["player"]["free_timer"] = addHud(self, 0, 90, 1, "center", "middle", 1.8, 1000, true);

	self freeRunChoice();
}

freeRunChoice()
{
	if (self.pers["team"] != "axis")
		return;

	level endon("kill_free_run_choice");
	self endon("disconnect");
	self endon("death");

	if (!level.dvar["freeRunChoice"] || level.trapsDisabled || !deathrun\game\_game::hasTraps())
		return;

	wait 1;
	if (!level.canCallFreeRun)
		return;

	self.huds["player"]["free"].label = level.texts["call_freeround"];
	self.huds["player"]["free_timer"] setTimer(level.dvar["freeRunChoiceTime"]);

	freeRun = false;
	for (i = 0; i < level.dvar["freeRunChoiceTime"] * 20; i++)
	{
		if (self attackButtonPressed())
		{
			freeRun = true;
			break;
		}
		wait 0.05;
	}
	if (isDefined(self.huds["player"]["free"]))
		self.huds["player"]["free"] destroy();
	if (isDefined(self.huds["player"]["free_timer"]))
		self.huds["player"]["free_timer"] destroy();

	if (!freeRun)
		return;

	level deathrun\game\_game::disableTraps();

	thread braxi\_mod::drawInformation(800, 0.8, 1, "FREE RUN");
	thread braxi\_mod::drawInformation(800, 0.8, -1, "FREE RUN");

	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
	{
		weapon = players[i].pers["weapon"];
		knife = players[i].pers["knife"];

		players[i] takeWeapon(weapon);
		players[i] switchToWeapon(knife);
	}
	level notify("round_freerun");
}

clear()
{
	self endon("disconnect");

	if (!isDefined(self.huds["player"]))
		return;

	keys = getArrayKeys(self.huds["player"]);
	for (i = 0; i < keys.size; i++)
	{
		if (keys[i] == "lifes")
		{
			lifes = getArrayKeys(self.huds["player"]["lifes"]);
			for (j = 0; j < lifes.size; j++)
			{
				if (isDefined(self.huds["player"]["lifes"][lifes[j]]))
					self.huds["player"]["lifes"][lifes[j]] destroy();
			}
			self.huds["player"]["lifes"] = undefined;
		}
		if (isDefined(self.huds["player"][keys[i]]))
			self.huds["player"][keys[i]] destroy();
	}
}

