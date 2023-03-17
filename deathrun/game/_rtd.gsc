#include sr\utils\_common;
#include sr\sys\_events;

main()
{
	level.rtd = [];

	event("spawn", ::rtd);

	add(1, "^3Defrag", ::rtd_Defrag);
	add(1, "^3Portal", ::rtd_Portal);
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
	add(20, "^1No Sprint", ::rtd_NoSprint);
	add(20, "^1-90 HP", ::rtd_Damage);
	add(20, "^15sec Freeze Randomly", ::rtd_RandomFreeze);
	add(20, "^1Flash Randomly", ::rtd_RandomFlash);
	add(20, "^1Explode in 80 seconds !!!!", ::rtd_RandomExplode);
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

	while (!isDefined(self.rtd))
	{
		wait 0.2;

		if (self getCurrentWeapon() != "rtd_mp")
			continue;
		if (self.pers["team"] != "allies" || level.trapsDisabled || level.freeRun)
		{
			self removeWeapon();
			return;
		}

		self.rtd = true;
		self randomize();
	}
}

randomize()
{
	self setLowerMessage("RTD");
	wait 0.4;
	self setLowerMessage("RTD.");
	wait 0.4;
	self setLowerMessage("RTD..");
	wait 0.4;
	self setLowerMessage("RTD...");
	wait 0.4;
	self clearLowerMessage();

	chance = getChance();
	picked = level.rtd[randomInt(level.rtd.size)];
	while (picked.chance != chance)
		picked = level.rtd[randomInt(level.rtd.size)];

	self setLowerMessage(picked.message);
	self thread removeWeapon();
	self thread [[picked.callback]]();
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
	wait 2;
	self takeWeapon("rtd_mp");
	wait 1;
	self clearLowerMessage();
}

rtd_Grenade()
{

}

rtd_RPG()
{

}

rtd_XP()
{

}

rtd_Life()
{

}

rtd_Dog()
{

}

rtd_Shovel()
{

}

rtd_HealthBoost()
{

}

rtd_PerkFire()
{

}

rtd_PerkReload()
{

}

rtd_Slowdown()
{

}

rtd_NoSprint()
{

}

rtd_Damage()
{

}

rtd_RandomFreeze()
{

}

rtd_RandomFlash()
{

}

rtd_RandomExplode()
{

}

rtd_Defrag()
{

}

rtd_Portal()
{

}
