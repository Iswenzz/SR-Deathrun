#include sr\sys\_events;
#include sr\utils\_hud;
#include sr\utils\_common;

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

	self.huds["speedrun"] = [];
 	self.huds["speedrun"]["background"] = addHud(self, 0, -40, 1, "left", "top", 1.8, 90, true);
	self.huds["speedrun"]["background"] setShader("time_hud", 142, 80);
	self.huds["speedrun"]["background"].color = (0, 0, 0);
	self.huds["speedrun"]["background"].glowAlpha = 1;

	self.huds["speedrun"]["name"] = addHud(self, 3, 0, 1, "left", "top", 1.4, 99, true);
 	self.huds["speedrun"]["name"] setText(fmt("^2%d/%d", game["roundsplayed"], level.dvar["round_limit"]));

	self.huds["speedrun"]["players"] = addHud(self, 120, 0, 1, "left", "top", 1.4, 99, true);
	self.huds["speedrun"]["players"] setValue(0);
	self.huds["speedrun"]["players"].label = &"Players  ^8";
	self.huds["speedrun"]["players"].alignX = "right";

 	self.huds["speedrun"]["mode"] = addHud(self, 4, 18, 1, "left", "top", 1.8, 99, true);
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self.huds["speedrun"]["row1"] = addHud(self, 72, 18, 1, "left", "top", 1.8, 99, true);
	self.huds["speedrun"]["row1"] setText("^50:00.0");

 	self.huds["speedrun"]["role"] = addHud(self, 142, 18, 1, "left", "top", 1.8, 99, true);
	self.huds["speedrun"]["vip"] = addHud(self, 171, -1, 1, "left", "top", 1.8, 99, true);
	self.huds["speedrun"]["wr_icon"] = addHud(self, 198, 1, 1, "left", "top", 1.4, 99, true);
	self.huds["speedrun"]["wr_icon_count"] = addHud(self, 208, 5, 1, "left", "top", 1.4, 100, true);

	if (self.pers["prestige"] > 0)
		self.huds["speedrun"]["rank"] = addHud(self, 154, 5, 1, "left", "top", 1.4, 81, true);
	self.huds["speedrun"]["rank_icon"] = addHud(self, 144, 1, 1, "left", "top", 1.4, 80, true);

	self updateWay();
	self updateRank();
	self updateAdmin();
	self updateTAS();

	self thread updatePlayers();

	self notify("speedrun");
}

updatePlayers()
{
	self endon("death");
	self endon("disconnect");

	if (!isHud("players"))
		return;

	while (true)
	{
		players = Ternary(level.jumpers, level.jumpers, getPlayingPlayers().size);
		self.huds["speedrun"]["players"] setValue(players);
		wait 0.2;
	}
}

updateRank()
{
	self endon("death");
	self endon("disconnect");

	self loading("rank");
	icon = level.assets["rank"][self.pers["rank"]];

	if (self.pers["prestige"] > 0)
	{
		icon = level.assets["prestige"][self.pers["prestige"]];
		self.huds["speedrun"]["rank"] setValue(self.pers["rank"] + 1);
	}
	self.huds["speedrun"]["rank_icon"] setShader(icon, 18, 18);
}

updateAdmin()
{
	self endon("death");
	self endon("disconnect");

	level loading("admins");

	color = Ternary(self sr\sys\_admins::isVIP(),
		ToRGB(self getStat(1650), self getStat(1651), self getStat(1652)),
		(0, 0, 0));

	self.huds["speedrun"]["background"].color = color;
	self.huds["speedrun"]["background"].glowColor = color;

	self.huds["speedrun"]["role"] setText(self sr\sys\_admins::getRoleName());
	if (self sr\sys\_admins::isVIP())
		self.huds["speedrun"]["vip"] setShader("vip_status", 24, 22);
}

updateRecords()
{
	if (!isHud("wr_icon"))
		return;

	if (!self hasLoaded("wr"))
	{
		self.huds["speedrun"]["wr_icon"] setShader("sr_loader", 18, 18);
		self.huds["speedrun"]["wr_icon"].alpha = 1;
	}
	if (isDefined(self.pers["wrCount"]))
	{
		self.huds["speedrun"]["wr_icon"].alpha = self.pers["wrCount"] >= 10;

		if (self.pers["wrCount"] >= 10)
		{
			self.huds["speedrun"]["wr_icon"] setShader("speedrunner_logo", 18, 18);
			self.huds["speedrun"]["wr_icon_count"] setText(fmt("^3%d", self.pers["wrCount"]));
		}
	}
}

updateTime()
{
	if (isDefined(self.time))
	{
		self.huds["speedrun"]["row1"] setText(self.time.min + ":" + self.time.sec + "." + self.time.ms);
		self.huds["speedrun"]["row1"].fontScale = 1.4;
		self.huds["speedrun"]["row1"].x = 73;
		self.huds["speedrun"]["row1"].y = 21;
	}
	else
	{
		self.huds["speedrun"]["row1"].label = &"^5&&1";
		self.huds["speedrun"]["row1"] setTenthsTimerUp(0.0001);
	}
}

updateWay()
{
	if (self isDemo())
		return;

	self updateRecords();
}

updateTAS()
{
	if (!self sr\sys\_admins::isTAS())
		return;

	self.huds["speedrun"]["tas"] = addHud(self, 5, 0, 1, "left", "bottom", 1.4, 100, true);
	self.huds["speedrun"]["tas"].label = &"^5TAS";
	self.huds["speedrun"]["tas"].font = "objective";
}

isHud(name)
{
	return isDefined(self.huds["speedrun"]) && isDefined(self.huds["speedrun"][name]);
}

clear()
{
	self endon("disconnect");

	if (isDefined(self.huds["speedrun"]))
	{
		huds = getArrayKeys(self.huds["speedrun"]);
		for (i = 0; i < huds.size; i++)
		{
			if (isDefined(self.huds["speedrun"][huds[i]]))
				self.huds["speedrun"][huds[i]] destroy();
		}
	}
}
