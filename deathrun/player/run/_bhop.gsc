#include sr\utils\_common;

start()
{
	self.sr_mode = "Bhop";
	self.moveSpeedScale = sr\api\_map::getMoveSpeedScale(0.9);
	self.gravity = sr\api\_map::getGravity(800);
	self.jumpHeight = sr\api\_map::getJumpHeight(39);
	self.speed = sr\api\_map::getSpeed(320);
	self cheat();

	self.spawnMoveSpeedScale = self.moveSpeedScale;
	self.spawnGravity = self.gravity;
	self.spawnJumpHeight = self.jumpHeight;
	self.spawnSpeed = self.speed;

	self setMoveSpeedScale(self.moveSpeedScale);
	self setGravity(self.gravity);
	self setJumpHeight(self.jumpHeight);
	self setMoveSpeed(self.speed);

	self thread sr\game\_bhop::onSpawn();
	self.huds["speedrun"]["mode"] setText(self.sr_mode);
}
