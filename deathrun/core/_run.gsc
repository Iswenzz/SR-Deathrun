#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	level.finishedMap = false;

    event("map", ::endmapTrigger);
}

start()
{
	self.finishedMap = false;

	self.sr_mode = self getMode();
	self.sr_way = "normal_0";

	if (self getStat(1700) != self getModeStat())
		self setStat(1700, self getModeStat());

	self allowSprint(true);

	switch (self.sr_mode)
	{
		case "190":
			self cheat();
			self.speed = sr\api\_map::getSpeed(190);
			self.jumpHeight = sr\api\_map::getJumpHeight(39);
			self.gravity = sr\api\_map::getGravity(800);
			self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.05);
			break;

		case "210":
			self.speed = sr\api\_map::getSpeed(210);
			self.jumpHeight = sr\api\_map::getJumpHeight(39);
			self.gravity = sr\api\_map::getGravity(800);
			self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.12);
			break;

		case "Q3":
		case "Q3CPM":
		case "Q3CPMW":
			self cheat();
			self.forceWeaponVisual = true;
			self.forceWeaponKnockback = true;
			self.forceWeaponHitPlayers = true;
			self.speed = sr\api\_map::getSpeed(320);
			self.jumpHeight = sr\api\_map::getJumpHeight(39);
			self.gravity = sr\api\_map::getGravity(800);
			self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);

			if (self isQ3W())
			{
				self.scriptedAmmo = 999999;
				self takeAllWeapons();
				self giveWeapon(level.q3Weapons["rl"]);
				self giveWeapon(level.q3Weapons["pg"]);
				self setSpawnWeapon(level.q3Weapons["rl"]);
			}
			else
			{
				for (i = 0; i < level.q3StartWeapons.size; i++)
				{
					weapon = level.q3Weapons[level.q3StartWeapons[i]];
					if (!isDefined(weapon))
						continue;
					self giveWeapon(weapon);
					if (i == 0)
						self setSpawnWeapon(weapon);
				}
				if (level.q3StartWeapons.size)
					self.scriptedAmmo = IfUndef(level.q3StartAmmo, 0);
			}
			break;

		case "CS":
			self cheat();
			self.speed = sr\api\_map::getSpeed(250);
			self.jumpHeight = sr\api\_map::getJumpHeight(39);
			self.gravity = sr\api\_map::getGravity(800);
			self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
			break;

		case "Portal":
			self cheat();
			self.forcePortalVisual = true;
			self.forcePortalHitPlayers = true;
			self.speed = sr\api\_map::getSpeed(250);
			self.jumpHeight = sr\api\_map::getJumpHeight(39);
			self.gravity = sr\api\_map::getGravity(800);
			self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
			self allowAds(true);
			self takeAllWeapons();
			self giveWeapon(level.portalgun);
			self setSpawnWeapon(level.portalgun);
			self giveMaxAmmo(level.portalgun);
			break;
	}
	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);

	self thread playerTimer();
}

getMode()
{
	if (isDefined(self.demo))
		return self.sr_mode;
	if (isDefined(self.sr_mode_force))
		return self.sr_mode_force;
	if (isSurf())
		return "CS";
	return "210";
}

getModeStat()
{
	switch (self.sr_mode)
	{
		case "190": return 1;
		case "210": return 2;
		case "Q3": return 3;
		case "Q3CPM": return 4;
		case "Q3CPMW": return 5;
		case "CS": return 6;
		case "Portal": return 7;
	}
	return 1;
}

endmapTrigger()
{
	waitMapLoad(3);

	array = getEntArray("endmap_trig", "targetname");
	if (!array.size)
		return;

	trigger = array[0];
	thread sr\fx\_trigger::effect(trigger, "red");
	while (true)
	{
		trigger waittill("trigger", player);
		level.finishedMap = true;
		player thread endTimer();
	}
}

playerTimer()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	if (self.finishedMap)
		return;
	self.time = undefined;

	// Spastic delay caused by bad modding, too bad...
	if (game["state"] == "playing")
	{
		self sr\core\_demo::record();
		wait 0.05;
	}
	if (game["state"] == "readyup")
	{
		level waittill("round_started");
		self sr\core\_demo::record();
	}
	wait 0.1;

	self deathrun\huds\_speedrun::updateTime();
	self.time = originToTime(getTime());
}

endTimer()
{
	if (!self isPlaying() || self isDemo() || !isDefined(self.time) || self isAxis() || self.finishedMap)
		return;
	self.finishedMap = true;

	self.time = originToTime(getTime() - self.time.origin);
	self deathrun\huds\_speedrun::updateTime();

	if (self isCheat())
	{
		self iPrintLnBold("^1Your time was not saved!");
		return;
	}
	if (level.freeRun)
		return;

	way = deathrun\core\_leaderboards::getLeaderboardName(self.sr_mode, self.sr_way);
	message = fmt("%s finished the map in %d:%d.%d - %s / %s",
		self.name, self.time.min, self.time.sec, self.time.ms,
		self.sr_mode, way);

	if (self sr\sys\_admins::isTAS())
		message = fmt("^5[TAS] ^7%s", message);

	iPrintLn(message);

	if (self.sr_mode != "210")
		return;

	self.pers["time"] = self.time.origin;
	level thread deathrun\sys\_scoreboard::updateScoreboard();

	entry = self deathrun\core\_leaderboards::makeEntry();
    self thread deathrun\core\_leaderboards::saveEntry(entry);
    self thread deathrun\core\_pbs::saveEntry(entry);
}
