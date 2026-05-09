#include sr\sys\_events;
#include sr\utils\_common;
#include sr\utils\_hud;

main()
{
	event("death", ::start);
	event("spawn", ::clean);
}

start()
{
	self endon("disconnect");
	self endon("spawned");
	self clean();

	if (!self check())
		return;

	self setLowerMessage("Ghost Mode ^5[{+activate}]");
	while (!self useButtonPressed())
		wait 0.05;

	if (!self check())
		return;

	self thread spawn();
}

spawn()
{
	self endon("disconnect");

	self eventSpawn(true);
	self sr\game\_teams::setDead();
	self.ghost = true;

	self clearLowerMessage();
	self setContents(false);
	self cheat();
	self hide();

	self takeAllWeapons();
	self giveWeapon("deserteaglegold_mp");
	self setSpawnWeapon("deserteaglegold_mp");

	self.huds["ghost"] = addHud(self, 3, 55, 1, "left", "top", 1.4, true);
	self.huds["ghost"] setText("^5Ghost Mode");
}

clean()
{
	if (isDefined(self.huds["ghost"]))
		self.huds["ghost"] destroy();
}

check()
{
	return self.died && !self isAxis() && game["state"] == "playing";
}
