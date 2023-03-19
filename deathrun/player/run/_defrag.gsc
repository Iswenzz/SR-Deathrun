#include sr\utils\_common;

start()
{
	self.sr_mode = "Defrag";
	self.forceWeaponVisual = true;
	self.forceWeaponKnockback = true;
	self.forceWeaponHitPlayers = true;
	self cheat();

	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(0.9);
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

	self thread sr\game\_defrag::onSpawn();
	self thread sr\player\huds\_viewkick::onSpawn();

	self takeAllWeapons();
	for (i = 0; i < level.defragStartWeapons.size; i++)
	{
		weapon = level.defragWeapons[level.defragStartWeapons[i]];

		self giveWeapon(weapon);
		if (i == 0)
			self setSpawnWeapon(weapon);
	}
}
