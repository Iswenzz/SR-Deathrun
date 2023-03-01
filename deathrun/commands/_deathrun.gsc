#include sr\sys\_admins;
#include sr\utils\_common;

main()
{
    cmd("player", 	"speed",    ::cmd_Speed);
    cmd("player", 	"190",    	::cmd_190);
    cmd("player", 	"210",    	::cmd_210);
	cmd("admin", 	"practise",	::cmd_Practise);
	cmd("player", 	"sheep",	::cmd_Sheep);
	cmd("player", 	"fxenable",	::cmd_FX);
	cmd("admin", 	"teleport",	::cmd_Teleport);
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

cmd_Practise(args)
{
    if (self sr\player\modes\_main::isInOtherMode("practise"))
		return;

	self sr\player\modes\_main::toggleMode("practise");
	self suicide();

    if (self.modes["practise"])
    {
        self pm("^2Practise mode enabled!");
        self iPrintLn("Press ^3[{+melee}]^7 to save position");
        self iPrintLn("Press ^3[{+activate}]^7 to load positon");
        self iPrintLn("Press ^5[{+frag}]^7 to noclip");
        self iPrintLn("Press ^2[{+gostand}]^7 to remove noclip or speed up");
    }
    else
        self pm("^1Practise mode disabled!");
}

cmd_Teleport(args)
{
	if (args.size < 1)
		return self pm("Usage: teleport <playerName>");
	if (!self sr\player\modes\_main::isInMode("practise"))
		return self pm("^1Player need to be in practise mode");

	player = getPlayerByName(args[0]);

	if (!isDefined(player))
		return pm("Could not find player");

	self cheat();
	self setOrigin(player.origin);
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

