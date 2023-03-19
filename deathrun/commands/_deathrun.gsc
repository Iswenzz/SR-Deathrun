#include sr\sys\_admins;
#include sr\utils\_common;

main()
{
    cmd("player", 		"speed",    	::cmd_Speed);
    cmd("player", 		"190",    		::cmd_190);
    cmd("player", 		"210",    		::cmd_210);
	cmd("player", 		"sheep",		::cmd_Sheep);
	cmd("player", 		"fxenable",		::cmd_FX);
	cmd("adminplus", 	"life",			::cmd_Life);
	cmd("masteradmin", 	"activator",	::cmd_Activator);
	cmd("masteradmin", 	"rtd",			::cmd_Rtd);
	cmd("masteradmin", 	"points",		::cmd_Points);
}

cmd_Speed(args)
{
    speed = Ternary(self.sr_mode == "190", "210", "190");
	self setStat(1700, Ternary(speed == "190", 1, 2));
    self.sr_mode = speed;
    self pm(fmt("Run mode: ^5%s", speed));
	self thread deathrun\game\_leaderboards::updateMenuInfo();
    self suicide();
}

cmd_190(args)
{
	self setStat(1700, 1);
	self.sr_mode = "190";
    self pm("Run mode: ^5190");
	self thread deathrun\game\_leaderboards::updateMenuInfo();
    self suicide();
}

cmd_210(args)
{
	self setStat(1700, 2);
	self.sr_mode = "210";
    self pm("Run mode: ^5210");
	self thread deathrun\game\_leaderboards::updateMenuInfo();
    self suicide();
}

cmd_Sheep(args)
{
	for (i = 0; i < 25; i++)
	{
		self iPrintLnBold("^3S^2h^1e^4e^6p ^3w^2i^1z^4a^6r^5d");
		wait 0.1;
	}
	self setClientDvar("r_specular", 1);
	self setClientDvar("r_specularmap", 2);
}

cmd_FX(args)
{
	self sr\player\_settings::toggle("gfx_fx");

	msg = Ternary(self.settings["gfx_fx"], "^2FX On", "^1FX Off");
	self pm(msg);
}

cmd_Life(args)
{
	if (args.size < 1)
		return self pm("Usage: life <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	player deathrun\game\_game::giveLife();
}

cmd_Activator(args)
{
	if (game["state"] != "readyup")
		return self pm("Activator can only be set during round begin.");
	if (args.size < 1)
		return self pm("Usage: activator <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	level.forceActivator = player;
}

cmd_Rtd(args)
{
	self.rtd = undefined;
	self giveWeapon("rtd_mp");
	self switchToWeapon("rtd_mp");
}

cmd_Points(args)
{
	if (args.size < 1)
		return self pm("Usage: points <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	player pm("You received ^2500 ^7shop points !");
	player.pers["shopPoints"] = 500;
}
