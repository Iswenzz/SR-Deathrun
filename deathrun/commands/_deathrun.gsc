#include sr\sys\_admins;
#include sr\utils\_common;

main()
{
	cmd("activator", "masteradmin", ::cmd_Activator, "Set player as activator");
	cmd("fxenable",  "player",      ::cmd_FX,        "Toggle game FX");
	cmd("life",      "adminplus",   ::cmd_Life,      "Give a player an extra life");
	cmd("points",    "masteradmin", ::cmd_Points,    "Give shop points to a player");
	cmd("rtd",       "masteradmin", ::cmd_Rtd,       "Roll the dice");
	cmd("sheep",     "player",      ::cmd_Sheep,     "Toggle sheep mode");
	cmd("special",   "masteradmin", ::cmd_Special,   "Start a special round");
}

cmd_Speed(args)
{
	if (self isAxis())
		return;

    speed = Ternary(self.sr_mode == "190", "210", "190");
	self setStat(1700, Ternary(speed == "190", 1, 2));
    self.sr_mode = speed;
    self pm(fmt("Run mode: ^5%s", speed));
	self thread deathrun\core\_leaderboards::updateMenuInfo();
    self suicide();
}

cmd_190(args)
{
	if (self isAxis())
		return;

	self setStat(1700, 1);
	self.sr_mode = "190";
    self pm("Run mode: ^5190");
	self thread deathrun\core\_leaderboards::updateMenuInfo();
    self suicide();
}

cmd_210(args)
{
	if (self isAxis())
		return;

	self setStat(1700, 2);
	self.sr_mode = "210";
    self pm("Run mode: ^5210");
	self thread deathrun\core\_leaderboards::updateMenuInfo();
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
	self sr\core\_settings::toggle("gfx_fx");

	msg = Ternary(self.settings["gfx_fx"], "^2FX On", "^1FX Off");
	self pm(msg);
}

cmd_Life(args)
{
	if (args.size < 1)
		return self pm("Usage: !life <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	player deathrun\core\_game::giveLife();
}

cmd_Activator(args)
{
	if (game["state"] != "readyup")
		return self pm("Activator can only be set during round begin.");
	if (args.size < 1)
		return self pm("Usage: !activator <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	level.forceActivator = player;
}

cmd_Rtd(args)
{
	self.rtd = undefined;
	self giveWeapon("hind_FFAR_mp");
	self switchToWeapon("hind_FFAR_mp");
}

cmd_Points(args)
{
	if (args.size < 1)
		return self pm("Usage: !points <playerName>");

	player = getPlayerByName(args[0]);

	self log();
	if (!isDefined(player))
		return pm("Could not find player");

	player pm("You received ^2500 ^7shop points !");
	player.pers["shopPoints"] = 500;
}

cmd_Special(args)
{
	if (args.size < 1)
		return self pm("Usage: !special <defrag | portal | bhop>");

	mode = undefined;
	switch (args[0])
	{
		case "defrag":
			mode = deathrun\core\_run::start_Defrag;
			thread braxi\_mod::drawInformation(800, 0.8, 1, "^1DEFRAG ROUND");
			thread braxi\_mod::drawInformation(800, 0.8, -1, "^1DEFRAG ROUND");
			break;
		case "portal":
			mode = deathrun\core\_run::start_Portal;
			thread braxi\_mod::drawInformation(800, 0.8, 1, "^5PORTAL ROUND");
			thread braxi\_mod::drawInformation(800, 0.8, -1, "^5PORTAL ROUND");
			break;
		case "bhop":
			mode = deathrun\core\_run::start_Bhop;
			thread braxi\_mod::drawInformation(800, 0.8, 1, "^2BHOP ROUND");
			thread braxi\_mod::drawInformation(800, 0.8, -1, "^2BHOP ROUND");
			break;
	}
	if (!isDefined(mode))
		return;

	players = getPlayingPlayers();
	for (i = 0; i < players.size; i++)
		players[i] thread [[mode]]();
}
