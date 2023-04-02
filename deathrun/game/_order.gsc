#include sr\utils\_common;
#include sr\utils\_hud;
#include sr\sys\_events;

main()
{
	level.order = [];
	level.orderEnabled = false;
	level.orderNoRespawn = false;
	level.orderRespawn = undefined;
	level.orderTrigger = undefined;

	event("map", ::start);
	event("death", ::dequeue);
}

start()
{
	array = getEntArray("endmap_trig", "targetname");
	if (!array.size || level.freeRun)
		return;

	trigger = array[0];
	level.huds["order"] = addHud(level, -5, 30, 0.7, "right", "top", 1.4);
	level.orderTrigger = trigger;
	level.orderEnabled = true;

	while (isDefined(trigger))
	{
		trigger waittill("trigger", player);
		player queue();

		wait 0.05;
	}
}

queue()
{
	if (isDefined(self.order) || !self isAllies())
		return;

	self.order = true;
	level.order[level.order.size] = self;
	update();
}

dequeue()
{
	if (!Contains(level.order, self))
		return;

	self.order = undefined;
	self.orderCard = undefined;
	level.order = Remove(level.order, self);
	update();
}

order()
{
	if (!level.orderEnabled || !level.order.size || level.order[0] == self)
	{
		if (!isDefined(self.orderCard) && !level.freeRun)
		{
			self.orderCard = true;

			self thread sr\player\huds\_card::hud(self, level.activ);
			level.activ thread sr\player\huds\_card::hud(self, level.activ);
		}
		return true;
	}
	origin = Ternary(isDefined(level.orderRespawn), level.orderRespawn, level.orderTrigger.origin);
	if (!isDefined(level.orderNoRespawn))
		self setOrigin(origin);

	self iPrintLn("^5You can't enter the room yet.");

	return false;
}

update()
{
	queue = Ternary(level.order.size, "^5[Order]\n^7", "");
	for (i = 0; i < level.order.size; i++)
		queue += fmt("%s^7\n", level.order[i].name);
	level.huds["order"] setText(queue);
}
