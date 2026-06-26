credits(lines) { }

getPlayerSpeed()
{
	velocity = self getVelocity();
	return int(sqrt((velocity[0] * velocity[0]) + (velocity[1] * velocity[1])));
}

setPlayerSpeed(speed)
{
	currentSpeed = self getPlayerSpeed();
	if (!currentSpeed) return;
	self scalePlayerSpeed(speed / currentSpeed);
}

scalePlayerSpeed(speedScale)
{
	self setVelocity(self getVelocity() * (speedScale, speedScale, 1));
}
