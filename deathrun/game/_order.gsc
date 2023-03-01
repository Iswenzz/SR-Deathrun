#include sr\sys\_events;
#include sr\utils\_hud;

main()
{
	level.finishPosition = [];
	level.playerEnterNum = 0;
	level.inRoomPlugin = false;
	level.disableRoomPlugin = false;

	level.orderHud = addHud(level, 0, 25, 0.8, "right", "top", 1.4);
	level.orderHud setText("^5Queue : ");
	level.queueHud = addHud(level, 0, 25, 0.8, "right", "top", 1.4);
	level.queueHud.color = (1, 1, 1);

	event("map", ::trigger);
}

get_place_reward(place)
{
	switch (place)
	{
		case 1:
			self iprintlnbold("You got 1000 XP for 1# Place");
			self braxi\_rank::giverankxp(undefined,1000);
			break;
		case 2:
			self iprintlnbold("You got 750 XP for 2# Place");
			self braxi\_rank::giverankxp(undefined,750);
			break;
		case 3:
			self iprintlnbold("You got 500 XP for 3# Place");
			self braxi\_rank::giverankxp(undefined,500);
			break;
		case 4:
			self iprintlnbold("You got 350 XP for 4# Place");
			self braxi\_rank::giverankxp(undefined,350);
			break;
		case 5:
			self iprintlnbold("You got 300 XP for 5# Place");
			self braxi\_rank::giverankxp(undefined,300);
			break;
		case 6:
			self iprintlnbold("You got 250 XP for 6# Place");
			self braxi\_rank::giverankxp(undefined,250);
			break;
		case 7:
			self iprintlnbold("You got 200 XP for 7# Place");
			self braxi\_rank::giverankxp(undefined,200);
			break;
		case 8:
			self iprintlnbold("You got 150 XP for 8# Place");
			self braxi\_rank::giverankxp(undefined,150);
			break;
		case 9:
			self iprintlnbold("You got 100 XP for 9# Place");
			self braxi\_rank::giverankxp(undefined,100);
			break;
		case 10:
			self iprintlnbold("You got 75XP for 10# Place");
			self braxi\_rank::giverankxp(undefined,75);
			break;
	}
}

onRoomDeath()
{
	while (isAlive(self) && isDefined(self))
		wait 0.1;
	level.playerEnterNum++;
	level.inRoomPlugin = false;
	upDateQueueHud();
}

onQueueDeath()
{
	self endon("romm_enter_plugin");

	id = self.playerID;

	while (isAlive(self) && isDefined(self))
		wait 0.1;

	for (i = level.playerEnterNum; i<level.finishPosition.size; i++)
	{
		if (level.finishPosition[i].playerID == id)
		{
			level.finishPosition = removeFromArray(level.finishPosition, i);
			upDateQueueHud();
			return;
		}
	}
	upDateQueueHud();
}

removeFromArray(b, num)
{
	temp = [];
	for (i=0; i<b.size; i++)
	{
		if (i != num)
			temp[temp.size] = b[i];
	}
	return temp;
}

trigger()
{
	level endon("round_ended");
	level.endmaptriggerplugin = getEntArray("endmap_trig", "targetname");

	if (!level.endmaptriggerplugin.size || level.endmaptriggerplugin.size > 1)
	{
		iPrintln("^1NO END TRIG!! CREATE ONE!");
		level.disableRoomPlugin = true;
		return;
	}
    level.endmaptriggerplugin = level.endmaptriggerplugin[0];

    while (true)
    {
    	found = false;
    	level.endmaptriggerplugin waittill("trigger", player);

    	for (i = level.playerEnterNum; i<level.finishPosition.size; i++)
    	{
    		if (level.finishPosition[i].playerID == player.playerID)
    			found = true;
    	}
    	if (found)
    		continue;

		if (isDefined(player.ghost) && player.ghost)
	    {
	        player suicide();
	        continue;
	    }
	    level.finishPosition[level.finishPosition.size] = player;

	    iPrintLnBold("^1" + player.name + "^7 finished the Map [^1" + level.finishPosition.size + "^7]");
	    player thread get_place_reward(level.finishPosition.size);
	    player thread onQueueDeath();

	    upDateQueueHud();
	}
}

order()
{
	if (isDefined(self.ghost) && self.ghost)
    {
        self Suicide();
        return false;
    }
    if (self.pers["team"] == "axis")
    	return false;
    if (level.disableRoomPlugin)
    	return true;

    if (level.finishPosition[level.playerEnterNum].playerID != self.playerID || level.inRoomPlugin)
    {
        self IPrintLnBold("^1Wait your turn");

        if (!isDefined(level.orderNoRespawn))
    	{
	        if (!isDefined(level.orderRespawn))
	        	self setOrigin(level.endmaptriggerplugin.origin);
	        else
	        	self setOrigin(level.orderRespawn);
    	}
        return false;
    }

    self notify("romm_enter_plugin");
    level.inRoomPlugin = true;
    self thread plugins\_respect::onRoomDeath();
    upDateQueueHud();
    return true;
}

upDateQueueHud()
{
	string = "";
	if (isDefined(level.finishPosition[level.playerEnterNum]))
		string = "\n" + level.finishPosition[level.playerEnterNum].name + "\n";
	level.queueHud SetText(string);
}
