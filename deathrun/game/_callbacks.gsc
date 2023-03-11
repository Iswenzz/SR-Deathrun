#include sr\sys\_events;
#include sr\utils\_common;

playerConnect()
{
	self endon("connect");
	self endon("disconnect");
	level notify("connected", self);

	self.enable3DWaypoints = true;
	self.enableDeathIcons = true;
	self.classType = undefined;
	self.selectedClass = false;
	self.teamKill = false;
	self.hidden = false;

	self.sr_mode = self deathrun\player\run\_main::getLastMode();
	self.sr_way = "normal_0";
	self.run = 0;

	if (game["state"] == "end")
		return;

	if (!self isFirstConnection())
	{
		self.score = self.pers["score"];
		self.kills = self.pers["kills"];
		self.assists = self.pers["assists"];
		self.deaths = self.pers["deaths"];

		self sr\game\_teams::setTeam("allies");
		return;
	}
	self.pers["score"] = 0;
	self.pers["kills"] = 0;
	self.pers["deaths"] = 0;
	self.pers["assists"] = 0;
	self.pers["lifes"] = 0;
	self.pers["headshots"] = 0;
	self.pers["knifes"] = 0;
	self.pers["activator"] = 0;
	self.pers["isDog"] = false;

	self openMenu("main_mp");
	self thread serverDvars();
}

playerDisconnect()
{
	level notify("disconnected", self);
	self cleanUp();
}

playerLastStand(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self suicide();
}

playerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime)
{
	if (self.sessionteam == "spectator" || game["state"] == "end")
		return;

	level notify("player_damage", self, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

	if (isPlayer(eAttacker) && self sameTeam(eAttacker) && !eAttacker.teamKill)
		return;
	if (isPlayer(eAttacker) && sMeansOfDeath == "MOD_MELEE" && isWallKnifing(eAttacker, self))
		return;
	if (self isDefrag() && sMeansOfDeath == "MOD_FALLING")
		return;

	if (isPlayer(eAttacker) && eAttacker != self)
	{
		eAttacker maps\mp\gametypes\_weapons::checkHit(sWeapon);
		eAttacker iPrintln("You hit " + self.name + " ^7for ^2" + iDamage + " ^7damage.");
		self iPrintln(eAttacker.name + " ^7hit you for ^2" + iDamage + " ^7damage.");
	}

	iDFlags |= level.iDFLAGS_NO_KNOCKBACK;

	self doPlayerDamage(eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);
}

playerKilled(eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration)
{
	self notify("killed_player");
	self notify("death");

	if (self.sessionteam == "spectator" || game["state"] == "end")
		return;

	level notify("player_killed", self, eInflictor, attacker, iDamage, sMeansOfDeath, sWeapon, vDir, sHitLoc, psOffsetTime, deathAnimDuration);

	if (sHitLoc == "head" && sMeansOfDeath != "MOD_MELEE")
		sMeansOfDeath = "MOD_HEAD_SHOT";

	self cleanUp();
	self thread ragdoll(sHitLoc, vDir, sWeapon, eInflictor, sMeansOfDeath, deathAnimDuration);

	if (level.freeRun)
	{
		self eventSpawn();
		return;
	}
	self thread eventSpectateDeath();

	if (isDefined(level.activ) && level.activ == self)
	{
		level.activatorKilled = true;
		if (isPlayer(attacker))
		{
			text = attacker.name + " ^7killed Activator";
			thread braxi\_mod::drawInformation(800, 0.8, 1, text);
			thread braxi\_mod::drawInformation(800, 0.8, -1, text);
		}
	}
	if (self.pers["team"] == "axis" && !level.activatorKilled)
		return;

	deaths = self maps\mp\gametypes\_persistence::statGet("DEATHS");
	self maps\mp\gametypes\_persistence::statSet("DEATHS", deaths + 1);
	self.deaths++;
	self.pers["deaths"]++;
	obituary(self, attacker, sWeapon, sMeansOfDeath);

	if (level.activatorKilled || getPlayingPlayers().size <= 1)
		self thread sr\game\_killcam::start(2, 8, eInflictor, attacker, sWeapon);

	if (!isPlayer(attacker) || attacker == self)
		return;

	attacker.kills++;
	attacker.pers["kills"]++;
	attacker deathrun\game\_game::giveLife();
	sr\game\_rank::processXpReward(sMeansOfDeath, attacker, self);
}

playerSpawn()
{
	if (game["state"] == "end")
		return;

	level notify("jumper", self);
	self cleanUp();

	self sr\game\_teams::setPlayerModel();
	self sr\game\_teams::setHealth();

	self.pers["weapon"] = self getCustomizeWeapon()["item"];
	self.pers["knife"] = self getCustomizeKnife()["item"];
	self.pers["knife_skin"] = self getCustomizeKnifeSkin()["id"];

	if (self.pers["team"] == "axis")
	{
		self.pers["weapon"] = "tomahawk_mp";
		self.playerSpawn = level.spawn["activator"];
	}

	self spawnPlayer();

	if (self.model == "german_sheperd_dog")
		self.pers["weapon"] = "dog_mp";

	if (self.settings["player_knife"])
	{
		self giveWeapon(self.pers["knife"], self.pers["knife_skin"]);
		self setSpawnWeapon(self.pers["knife"]);
		self giveMaxAmmo(self.pers["knife"]);
	}
	else
	{
		self giveWeapon(self.pers["knife"], self.pers["knife_skin"]);
		self giveWeapon(self.pers["weapon"]);
		self setSpawnWeapon(self.pers["weapon"]);
		self giveMaxAmmo(self.pers["weapon"]);
	}
	if (game["state"] == "readyup")
	{
		self linkTo(level.tempEntity);
		self disableWeapons();
	}
	if (self getStat(988))
		self setClientDvar("cg_thirdperson", 1);

	self deathrun\player\run\_main::start();

	self notify("spawned_player");
	level notify("player_spawn", self);
}

playerSpectator()
{
	self endon("disconnect");
	self cleanUp();
	level notify("player_spectator", self);
}

eventSpectateDeath()
{
	self endon("death");
	self endon("disconnect");

	wait 0.05;
	if (self isPlaying())
		return;

	self eventSpectator();
}

serverDvars()
{
	self endon("disconnect");

	wait 3;
	self setClientDvars(
		"ui_3dwaypointtext", "1",
		"ui_deathicontext", "1",
		"cl_maxpackets", 125,
		"rate", 25000,
		"ip", getDvar("net_ip"),
		"port", getDvar("net_port")
	);
	wait 0.05;
	self setClientDvars(
		"show_hud", "true",
		"hud_enable", 1,
		"cg_drawSpectatorMessages", 1,
		"player_sprintTime", 4,
		"ui_hud_hardcore", 1,
		"ui_uav_client", 0
	);
}
