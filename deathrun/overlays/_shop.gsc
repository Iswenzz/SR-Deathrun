#include sr\sys\_events;
#include sr\utils\_common;

main()
{
	event("connect", ::onConnect);
	event("spawn", ::onSpawn);

	main = sr\core\_overlays::menuElement("Main", "shop", "main");

    // Main
	sr\core\_overlays::menuOption(main, "Life", ::menu_Life, 50);
	sr\core\_overlays::menuOption(main, "Heal", ::menu_Heal, 50);
	sr\core\_overlays::menuOption(main, "Dog", ::menu_Dog, 75);
	sr\core\_overlays::menuOption(main, "Random Weapon", ::menu_RandomWeapon, 150);
	sr\core\_overlays::menuOption(main, "Random Perk", ::menu_RandomPerk, 150);
	sr\core\_overlays::menuOption(main, "200 XP", ::menu_XP, 200);
	sr\core\_overlays::menuOption(main, "Q3", ::menu_Q3, 250);
	sr\core\_overlays::menuOption(main, "Q3CPM", ::menu_Q3CPM, 250);
	sr\core\_overlays::menuOption(main, "Q3CPMW", ::menu_Q3CPMW, 250);
	sr\core\_overlays::menuOption(main, "CS", ::menu_CS, 250);
	sr\core\_overlays::menuOption(main, "Portal", ::menu_Portal, 250);
	sr\core\_overlays::menuOption(main, "Unlimited Ammo", ::menu_UAmmo, 300);
	sr\core\_overlays::menuOption(main, "Party Mode", ::menu_PartyMode, 400);
}

onConnect()
{
	self endon("disconnect");

	if (level.freeRun)
		return;

    self thread sr\core\_overlays::loop("shop", "cobra_FFAR_mp");
	self.pers["shopPoints"] = self getStat(2358);

	while (true)
	{
		wait 30;

		if (self.pers["shopPoints"] >= 500)
			continue;
		self.pers["shopPoints"]++;
		self setStat(2358, self.pers["shopPoints"]);
	}
}

onSpawn()
{
	self endon("spawned");
	self endon("disconnect");
	self endon("death");

	while (true)
	{
		self waittill("scriptmenu_open", id);
		if (id != "shop")
			continue;

		self.huds["script_menu"]["options"] setText(self getOptions());
		self.huds["script_menu"]["help"] setText(self getHelp());
	}
}

menu_Life(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_game::giveLife();
	self pm("^2You bought an additional life !");
	self sr\core\_overlays::done();
}

menu_Heal(points)
{
	if (!self canBuy(points))
		return;

	self cheat();
	self.health = self.maxhealth;

	self pm("^2Health restored !");
	self sr\core\_overlays::done();
}

menu_Dog(points)
{
	if (!self canBuy(points))
		return;

	self pm("^2Dogo !");
	self sr\core\_overlays::done();

	wait 0.5;
	self sr\commands\_player::dog();
}

menu_RandomWeapon(points)
{
	if (!self canBuy(points))
		return;

	asset = level.assets["weapon"][randomInt(level.assets["weapon"].size)];
	weapon = asset["item"];
	name = asset["name"];

	self pm(fmt("^2You got %s !", name));
	self sr\core\_overlays::done();

	wait 0.5;
	self cheat();
	self giveWeapon(weapon);
	self switchToWeapon(weapon);
}

menu_RandomPerk(points)
{
	if (!self canBuy(points))
		return;

	self cheat();
	keys = getArrayKeys(level.perks);
	perk = level.perks[keys[randomInt(keys.size)]];
	self sr\core\_perks::playerSetPerk(perk.id);

	self pm(fmt("^2You got %s !", perk.name));
	self sr\core\_overlays::done();
}

menu_UAmmo(points)
{
	if (!self canBuy(points))
		return;

	self cheat();
	self sr\commands\_player::unlimitedAmmo();

	self pm("^2You got unlimited ammo !");
	self sr\core\_overlays::done();
}

menu_XP(points)
{
	if (!self canBuy(points))
		return;

	self sr\core\_rank::giveRankXP("", 200);

	self pm("^2You got 200 XP !");
	self sr\core\_overlays::done();
}

menu_PartyMode(points)
{
	if (!self canBuy(points))
		return;

	alias = fmt("end_map%d", randomIntRange(1, 9));
	thread sr\core\_music::playAmbient(alias);

	self message(fmt("%s ^5throw a party !!!", self.name));
	self sr\core\_overlays::done();
}

menu_Q3(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_run::start_Q3();

	self pm("^5Q3 mode !");
	self sr\core\_overlays::done();
}

menu_Q3CPM(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_run::start_Q3();

	self pm("^5Q3CPM mode !");
	self sr\core\_overlays::done();
}

menu_Q3CPMW(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_run::start_Q3W();

	self pm("^5Q3CPMW mode !");
	self sr\core\_overlays::done();
}

menu_CS(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_run::start_CS();

	self pm("^5CS mode !");
	self sr\core\_overlays::done();
}

menu_Portal(points)
{
	if (!self canBuy(points))
		return;

	self deathrun\core\_run::start_Portal();

	self pm("^5Portal mode !");
	self sr\core\_overlays::done();
}

canBuy(points)
{
	if (self.pers["shopPoints"] < points)
	{
		self pm("^1Not enough points for this item !");
		self sr\core\_overlays::done();
		return false;
	}
	self.pers["shopPoints"] -= points;
	self setStat(2358, self.pers["shopPoints"]);
	return true;
}

getOptions()
{
	options = "";
	for (i = 0; i < level.huds["script_menu"]["shop"]["main"].size; i++)
	{
		item = level.huds["script_menu"]["shop"]["main"][i];

		points = fmt("%s[%d]", Ternary(self.pers["shopPoints"] >= item.args, "^2", "^1"), item.args);
		options += fmt("%s^7 %s\n", points, level.huds["script_menu"]["shop"]["main"][i].name);
	}
	return options;
}

getHelp()
{
	return fmt("^2Points: ^7%d\n\n^5Select: [Right or Left Mouse]\nUse: [[{+activate}]]\nLeave: [[{+melee}]]", self.pers["shopPoints"]);
}
