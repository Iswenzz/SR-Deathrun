#include sr\utils\_common;
#include sr\sys\_events;

main()
{
	level.rtd = [];

	event("spawn", ::rtd);

	add(5, "^3Defrag", ::rtd_Defrag);
	add(5, "^3Portal", ::rtd_Portal);
	add(10, "^5Speed Boost !", ::rtd_SpeedBoost);
	add(10, "^5Jump Boost !", ::rtd_JumpBoost);
	add(10, "^5Gravity Boost !", ::rtd_GravityBoost);
	add(20, "^5Grenade !", ::rtd_Grenade);
	add(20, "^5RPG !", ::rtd_RPG);
	add(20, "^5150 XP", ::rtd_XP);
	add(20, "^5Life", ::rtd_Life);
	add(20, "^5Dog", ::rtd_Dog);
	add(20, "^5Shovel !", ::rtd_Shovel);
	add(20, "^5Health Boost !", ::rtd_HealthBoost);
	add(20, "^2Fast Fire Perk", ::rtd_PerkFire);
	add(20, "^2Fast Reload Perk", ::rtd_PerkReload);
	add(20, "^1Slowdown", ::rtd_Slowdown);
	add(20, "^1Heavy Gravity", ::rtd_HeavyGravity);
	add(20, "^1No Sprint", ::rtd_NoSprint);
	add(20, "^1-90 HP", ::rtd_Damage);
	add(20, "^15sec Freeze Randomly", ::rtd_RandomFreeze);
	add(20, "^1Flash Randomly", ::rtd_RandomFlash);
	add(20, "^1Explode in 80 seconds !!!!", ::rtd_Explode);
}

add(chance, message, callback)
{
	rtd = spawnStruct();
	rtd.chance = chance;
	rtd.message = message;
	rtd.callback = callback;

	level.rtd[level.rtd.size] = rtd;
}

rtd()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	while (true)
	{
		wait 0.2;

		if (!self canRTD() || self getCurrentWeapon() != "hind_FFAR_mp")
			continue;

		self.rtd = true;
		self randomize();
	}
}

canRTD()
{
	return game["state"] == "playing" && !isDefined(self.rtd) && self isAllies() && !level.trapsDisabled && !level.freeRun;
}

randomize()
{
	self thread removeWeapon();

	self setLowerMessage("RTD");
	wait 0.5;
	self setLowerMessage("RTD .");
	wait 0.5;
	self setLowerMessage("RTD ..");
	wait 0.5;
	self setLowerMessage("RTD ...");
	wait 0.5;
	self clearLowerMessage();

	chance = getChance();
	picked = level.rtd[randomInt(level.rtd.size)];
	while (picked.chance != chance)
		picked = level.rtd[randomInt(level.rtd.size)];

	self setLowerMessage(picked.message);
	self thread [[picked.callback]]();
	wait 1;
	self clearLowerMessage();
}

getChance()
{
	random = randomIntRange(0, 100);
	for (i = 0; i < level.rtd.size; i++)
	{
		if (level.rtd[i].chance >= random)
			return level.rtd[i].chance;
	}
	return level.rtd[level.rtd.size - 1].chance;
}

removeWeapon()
{
	self endon("spawned");
	self endon("death");
	self endon("disconnect");

	self switchToWeapon(self.pers["weapon"]);
	wait 0.3;
	self takeWeapon("hind_FFAR_mp");
}

rtd_SpeedBoost()
{
	self sr\api\_player::setPlayerSpeed(230);
	self cheat();
}

rtd_JumpBoost()
{
	self sr\api\_player::setPlayerJumpHeight(60);
	self cheat();
}

rtd_GravityBoost()
{
	self sr\api\_player::setPlayerGravity(500);
	self cheat();
}

rtd_Grenade()
{
	self giveWeapon("frag_grenade_short_mp");
}

rtd_RPG()
{
	self giveWeapon("rpg_mp");
	self switchToWeapon("rpg_mp");
	self cheat();
}

rtd_XP()
{
	self sr\game\_rank::giveRankXP("", 150);
}

rtd_Life()
{
	self deathrun\game\_game::giveLife();
}

rtd_Dog()
{
	self sr\commands\_player::dog();
}

rtd_Shovel()
{
	self giveWeapon("saw_mp");
	self switchToWeapon("saw_mp");
}

rtd_HealthBoost()
{
	self.maxhealth = 200;
	self.health = self.maxhealth;
	self cheat();
}

rtd_PerkFire()
{
	self setPerk("specialty_rof");
}

rtd_PerkReload()
{
	self setPerk("specialty_fastreload");
}

rtd_Slowdown()
{
	self sr\api\_player::setPlayerSpeed(170);
	self cheat();
}

rtd_HeavyGravity()
{
	self sr\api\_player::setPlayerGravity(1200);
	self cheat();
}

rtd_NoSprint()
{
	self allowSprint(false);
}

rtd_Damage()
{
	self doPlayerDamage(self, self, 90, 0, "MOD_FALLING", "default_mp", (0, 0, 0), (0, 0, 0), "head", 0);
}

rtd_RandomFreeze()
{
	self endon("disconnect");
	self endon("death");

	wait randomInt(80);

	self freezeControls(true);
	wait 3;
	self freezeControls(false);
}

rtd_RandomFlash()
{
	self endon("disconnect");
	self endon("death");

	wait randomInt(80);

	self maps\mp\_flashgrenades::applyFlash(4, 0.75);
}

rtd_Explode()
{
	self endon("disconnect");
	self endon("death");

	wait 40;
	self setLowerMessage("^1Bomb explode in 40s...");
	wait 20;
	self setLowerMessage("^1Bomb explode in 20s...");
	wait 10;
	self setLowerMessage("^1Bomb explode in 10s...");
	wait 5;
	self setLowerMessage("^1Bomb explode in 5s...");
	wait 5;

	self playSound("wtf");

	wait 0.8;

	playFx(level.gfx["explosion"], self.origin);
	iPrintLn(self.name + " ^1spontaneously exploded.");
	self suicide();
}

rtd_Defrag()
{
	self deathrun\player\run\_defrag::start();
}

rtd_Portal()
{
	self deathrun\player\run\_portal::start();
}
