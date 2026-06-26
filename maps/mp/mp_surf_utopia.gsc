#include surf\_util;
#include sr\utils\_math;

main()
{
	sr\api\_map::surf();
	sr\api\_map::swapTargetname("trigger_endmap", "endmap_trig");
	sr\api\_deathrun::createNormalWays("Normal Way;");
	maps\mp\_load::main();

	creditsLines = [];
	creditsLines[ creditsLines.size ] = "--- ^3Surf Utopia^7 ---";
	creditsLines[ creditsLines.size ] = "--- ^3Originally created for CS:GO by ^2Panzerhandschuh^7 ---";
	creditsLines[ creditsLines.size ] = "--- ^3Ported to CoD4 by ^2JWofles & atrX^7 ---";
	credits( creditsLines );

	teleporters = getEntArray("trigger_teleport", "targetname");
	for (i = 0; i < teleporters.size; i++)
		teleporters[i] thread teleporter();

	level.kzActivator = spawnStruct();
	level.kzActivator.origin = (-11330, 37, 15805);
	level.kzActivator.angles = (0, 360, 0);

	level.kzJumper = spawnStruct();
	level.kzJumper.origin = (3799, -127, 11962);
	level.kzJumper.angles = (0, 180, 0);

	thread activator();
	thread kzRoom();
}

activator()
{
	level waittill("activator", activator);
	activator setOrigin(level.kzActivator.origin);
}

kzRoom()
{
	trig = getEnt("endmap_trig", "targetname");

	while (true)
	{
		trig waittill("trigger", player);
		if (!player sr\api\_deathrun::order())
            continue;

		level.activ setOrigin(level.kzActivator.origin);
		level.activ setPlayerAngles(level.kzActivator.angles);
		level.activ setVelocity(vectorScale(anglesToForward(level.kzActivator.angles), 2000));
		level.activ takeAllWeapons();
		level.activ giveWeapon("m40a3_mp");

		player setOrigin(level.kzJumper.origin);
		player setPlayerAngles(level.kzJumper.angles);
		player setVelocity(vectorScale(anglesToForward(level.kzJumper.angles), 2000));
		player takeAllWeapons();
		player giveWeapon("m40a3_mp");

		iprintlnbold(player getVelocity());

		wait 1;

		level.activ switchToWeapon("m40a3_mp");
		player switchToWeapon("m40a3_mp");
	}
}

teleporter()
{
	if (!isDefined(self.target))
	{
		print("WARNING: teleporter without target!\n");
		return;
	}
	targets = getEntArray(self.target, "targetname");
	if (!targets.size)
	{
		print("WARNING: trigger without target.\n");
		return;
	}
	while (true)
	{
		self waittill("trigger", player);
		player suicide();
	}
}
