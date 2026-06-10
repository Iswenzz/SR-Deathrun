#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	level.finishedMap = false;

	deathrun\core\_leaderboards::addMode("210", ::start_210);

    event("map", ::endmapTrigger);
}

start()
{
	self.finishedMap = false;

	self.sr_mode = self getLastMode();
	if (self sr\core\_minigames::isInAnyQueue())
		self.sr_mode = "210";
	self.sr_way = "normal_0";
	self setStat(1700, 2);
	self allowSprint(true);

    self [[level.leaderboard_modes[self.sr_mode].callback]]();
	self thread playerTimer();
}

getLastMode()
{
	return "210";
}

getLastModeStat()
{
	return 2;
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

start_190()
{
	self.sr_mode = "190";
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.05);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(190);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);
}

start_210()
{
	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.12);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(210);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);
}

start_Q3()
{
	self.sr_mode = "Q3";
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(320);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);
}

start_Q3CPM()
{
	self.sr_mode = "Q3CPM";
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(320);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);
}

start_Q3CPMW()
{
	self.sr_mode = "Q3CPMW";
	self.forceWeaponVisual = true;
	self.forceWeaponKnockback = true;
	self.forceWeaponHitPlayers = true;
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(320);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);

	if (!level.q3StartWeapons.size)
	{
		for (i = 0; i < level.weapons.size; i++)
		{
			weapon = level.weapons[i]["item"];
			self setWeaponAmmoClip(weapon, 0);
			self setWeaponAmmoStock(weapon, 0);
		}
		return;
	}
	self takeAllWeapons();
	for (i = 0; i < level.q3StartWeapons.size; i++)
	{
		weapon = level.q3Weapons[level.q3StartWeapons[i]];
		self giveWeapon(weapon);
		if (i == 0)
			self setSpawnWeapon(weapon);
	}
	self thread sr\huds\_viewkick::onSpawn();
}

start_CS()
{
	self.sr_mode = "CS";
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(250);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);
}

start_Portal()
{
	self.sr_mode = "Portal";
	self.forcePortalVisual = true;
	self.forcePortalHitPlayers = true;
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(1.0);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(250);

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);

	weapon = level.portalgun;
	self allowAds(true);
	self takeAllWeapons();
	self giveWeapon(weapon);
	self setSpawnWeapon(weapon);
	self giveMaxAmmo(weapon);
}
