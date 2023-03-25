main()
{
	maps\mp\_load::main();

	//maps\mp\_compass::setupMiniMap("compass_map_mp_shipment");

	//setExpFog(500, 3500, .5, 0.5, 0.45, 0);
	//ambientPlay("ambient_mp_deathrun_thechoice");
	//VisionSetNaked( "mp_vacant" );

	game["allies"] = "marines"; 
	game["axis"] = "opfor"; 

	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert"; 
	game["axis_soldiertype"] = "desert"; 
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	//setdvar("compassmaxrange","1500");
	
	PreCacheItem("brick_blaster_mp");
	
	//Variables
	level.tp = 1;
	level.sniper = false;
	level.strafe = false;
	level.bounce = false;
	level.knife = false;
	
	//Threads
	thread startdoor();
	thread strafetraps_1();
	thread strafetraps_easy();
	thread bouncetraps();
	thread end_teleport_bounce();
	thread end_teleport_strafe();
	thread end_door();
	thread end_check();
	thread end_acti_sniper();
	thread end_acti_strafe();
	thread end_acti_bounce();
	thread end_acti_knife();
	thread end_straferoom_acti();
	thread end_straferoom_jump();
	thread end_bounceroom_acti_start();
	thread end_bounceroom_acti_first();
	thread end_bounceroom_acti_second();
	thread end_bounceroom_jump_start();
	thread end_bounceroom_jump_first();
	thread end_bounceroom_jump_second();
	thread secret_door();
	thread end();
	addTriggerToList( "bounce_trig" );
	addTriggerToList( "strafe_trig" );
	addTriggerToList( "strafe_trig_easy" );
}


addTriggerToList(name)
{
	if( !isDefined( level.trapTriggers ) )
	{
		level.trapTriggers = [];
	}
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );	
}

secret_door()
{
	n1 = getent("number_1", "targetname");
	n2 = getent("number_2", "targetname");
	n3 = getent("number_3", "targetname");
	n4 = getent("number_4", "targetname");
	n5 = getent("number_5", "targetname");
	n6 = getent("number_6", "targetname");
	n7 = getent("number_7", "targetname");
	n8 = getent("number_8", "targetname");
	n9 = getent("number_9", "targetname");
	n0 = getent("number_0", "targetname");
	door1 = getent("secret_doorleft", "targetname");
	door2 = getent("secret_doorright", "targetname");
	
	n2 waittill ("trigger",player);
	n0 waittill ("trigger",player);
	
	n1 waittill ("trigger",player);
	n2 waittill ("trigger",player);
	
	n1 waittill ("trigger",player);
	n9 waittill ("trigger",player);
	n9 waittill ("trigger",player);
	n4 waittill ("trigger",player);
	iprintlnbold("Office opening");
	door1 movex (52,2);
	door2 movex (-52,2);
	door1 waittill("movedone");
	door2 waittill("movedone");
	iprintlnbold("Office is open");	
}

startdoor()
{
	door = getent("start_door", "targetname");
	trig = getent("start_trig", "targetname");
	level.tp = 1;
	
	trig waittill ("trigger",user);
	trig delete();
	
	if((user.name == "Brick"))
	{
		iprintlnbold("Hello Brick. Your room is unlocked.");
		iprintlnbold("The door is opening..");
		user giveWeapon("brick_blaster_mp");
		user giveMaxAmmo("brick_blaster_mp");
		wait (0.05);
		user switchToWeapon("brick_blaster_mp");
		iprintln("Map by Brick");
		iprintln("Big thanks to DeltaBoss for helping");
		iprintln("Thanks to Universal Alliance for uploading");
	}
	else
	{
		iprintlnbold("The door is opening..");
		iprintln("Map by Brick");
		iprintln("Big thanks to DeltaBoss for helping");
		iprintln("Thanks to Universal Alliance for uploading");
	}
	
	song = randomInt(4);
	if(song==1)
		ambientPlay("ambient_song_01");
	else if(song==2)
		ambientPlay("ambient_song_02");
	else if(song==3)
		ambientPlay("ambient_song_03");
	else
		ambientPlay("ambient_song_04");
	wait(0.05);
	
	wait(2);
	wait(1);
	iprintlnbold("3...");
	wait(1);
	iprintlnbold("2...");
	wait(1);
	iprintlnbold("1...");
	wait(1);
	iprintlnbold("GO! GO! GO!");
	door movez (-90,4);
	door waittill ("movedone");
	
}

end_door()
{
	//doors
	door2 = getent("end_door2", "targetname");
	door3 = getent("end_door3", "targetname");
	door4 = getent("end_door4", "targetname");
	door5 = getent("end_door5", "targetname");
	door6 = getent("end_door6", "targetname");
	door7 = getent("end_door7", "targetname");
	door8 = getent("end_door8", "targetname");
	door9 = getent("end_door9", "targetname");
	//trigger
	trig = getent("end_doortrig", "targetname");
	open = 2;
	
	while(true)
	{
		trig waittill("trigger",player);
		if(open==2)
		{
			door2 movez(-92,2);
			door2 waittill ("movedone");
			open++;
		}
		else if(open==3)
		{
			door3 movez(-92,2);
			door3 waittill ("movedone");
			open++;
		}
		else if(open==4)
		{
			door4 movez(-92,2);
			door4 waittill ("movedone");
			open++;
		}
		else if(open==5)
		{
			door5 movez(-92,2);
			door5 waittill ("movedone");
			open++;
		}
		else if(open==6)
		{
			door6 movez(-92,2);
			door6 waittill ("movedone");
			open++;
		}
		else if(open==7)
		{
			door7 movez(-92,2);
			door7 waittill ("movedone");
			open++;
		}
		else if(open==8)
		{
			door8 movez(-92,2);
			door8 waittill ("movedone");
			open++;
		}
		else if(open==9)
		{
			door9 movez(-92,2);
			door9 waittill ("movedone");
			open++;
		}
		else
			wait(0.05);
	}
}
end_teleport_bounce()
{
	door1 = getent("end_door1", "targetname");
	//cages
	pos1 = getent("end_orig1", "targetname");
	pos2 = getent("end_orig2", "targetname");
	pos3 = getent("end_orig3", "targetname");
	pos4 = getent("end_orig4", "targetname");
	pos5 = getent("end_orig5", "targetname");
	pos6 = getent("end_orig6", "targetname");
	pos7 = getent("end_orig7", "targetname");
	pos8 = getent("end_orig8", "targetname");
	pos9 = getent("end_orig9", "targetname");
	//trigger
	trig = getent("end_trig_bounce", "targetname");
	//variables
	
	while(true)
	{
		trig waittill("trigger",player);
		if(level.tp==1)
		{
			player teleport(pos1);
			level.tp = 2;
			door1 movez(-92,2);
			door1 waittill ("movedone");
		}
		else if(level.tp==2)
		{
			player teleport(pos2);
			level.tp = 3;
		}
		else if(level.tp==3)
		{
			player teleport(pos3);
			level.tp = 4;
		}
		else if(level.tp==4)
		{
			player teleport(pos4);
			level.tp = 5;
		}
		else if(level.tp==5)
		{
			player teleport(pos5);
			level.tp = 6;
		}
		else if(level.tp==6)
		{
			player teleport(pos6);
			level.tp = 7;
		}
		else if(level.tp==7)
		{
			player teleport(pos7);
			level.tp = 8;
		}
		else if(level.tp==8)
		{
			player teleport(pos8);
			level.tp = 9;
		}
		else if(level.tp==9)
		{
			player teleport(pos9);
		}
	}
}
end_teleport_strafe()
{
	door1 = getent("end_door1", "targetname");
	//cages
	pos1 = getent("end_orig1", "targetname");
	pos2 = getent("end_orig2", "targetname");
	pos3 = getent("end_orig3", "targetname");
	pos4 = getent("end_orig4", "targetname");
	pos5 = getent("end_orig5", "targetname");
	pos6 = getent("end_orig6", "targetname");
	pos7 = getent("end_orig7", "targetname");
	pos8 = getent("end_orig8", "targetname");
	pos9 = getent("end_orig9", "targetname");
	//trigger
	trig = getent("end_trig_strafe", "targetname");
	//variables
	
	while(true)
	{
		trig waittill("trigger",player);
		if(level.tp==1)
		{
			player teleport(pos1);
			level.tp = 2;
			door1 movez(-92,2);
			door1 waittill ("movedone");
		}
		else if(level.tp==2)
		{
			player teleport(pos2);
			level.tp = 3;
		}
		else if(level.tp==3)
		{
			player teleport(pos3);
			level.tp = 4;
		}
		else if(level.tp==4)
		{
			player teleport(pos4);
			level.tp = 5;
		}
		else if(level.tp==5)
		{
			player teleport(pos5);
			level.tp = 6;
		}
		else if(level.tp==6)
		{
			player teleport(pos6);
			level.tp = 7;
		}
		else if(level.tp==7)
		{
			player teleport(pos7);
			level.tp = 8;
		}
		else if(level.tp==8)
		{
			player teleport(pos8);
			level.tp = 9;
		}
		else if(level.tp==9)
		{
			player teleport(pos9);
		}
	}
}

teleport(tp)
{
	self setPlayerAngles(tp.angles);
	self setOrigin(tp.origin);
}
////////////////////////////////////////////////////////////////////////////// TRAPSTRAPSTRAPSTRAPS
strafetraps_1()
{
	ts = getent("strafe_trig", "targetname");
	
	ts waittill ("trigger",player);
	ts delete();
	strafe_bottom();
}

strafe_bottom()
{
	j1 = getent("jumpbig1", "targetname");
	j2 = getent("jumpbig2", "targetname");
	j3 = getent("jumpbig3", "targetname");
	j4 = getent("jumpbig4", "targetname");
	
	j1 movez (-136,2);
	j2 movez (-136,2);
	j3 movez (-136,2);
	j4 movez (-136,2);
	wait(3.0);
	
	while(1)
	{
		j1 movez (136,0.5);
		wait(2.5);
		j1 movez (-136,0.5);
		j2 movez (136,0.5);
		wait(2.5);
		j2 movez (-136,0.5);
		j3 movez (136,0.5);
		wait(2.5);
		j3 movez (-136,0.5);
		j4 movez (136,0.5);
		wait(2.5);
		j4 movez (-136,0.5);
		wait(3.0);
	}
}

strafetraps_easy()
{
	trig = getent("strafe_trig_easy", "targetname");
	door1 = getent("strafe_easy_door1", "targetname");
	door2 = getent("strafe_easy_door2", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	
	door1 movez (-90,4);
	door1 waittill ("movedone");
	door2 movez (-90,4);
	door2 waittill ("movedone");
}

bouncetraps()
{
	left1 = getent("bounce_left1", "targetname");
	left2 = getent("bounce_left2", "targetname");
	right1 = getent("bounce_right1", "targetname");
	right2 = getent("bounce_right2", "targetname");
	trig = getent("bounce_trig", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	
	left1 movex (-56,3);
	left2 movex (-56,3);
	right1 movex (56,3);
	right2 movex (56,3);
	left1 waittill ("movedone");
	left2 waittill ("movedone");
	right1 waittill ("movedone");
	right2 waittill ("movedone");
}

// ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||END|||||||||||||||||||||
end()
{
	trig = getent("endmap_trig", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	iprintlnbold("^5"+player.name+" ^6Finished the map!");
}
end_check()
{
	trig = getent("end_jumpers_trig", "targetname");
	sniper_jump = getent("sniper_jump", "targetname");
	sniper_acti = getent("sniper_acti", "targetname");
	bounce_jump = getent("bounce_jump", "targetname");
	bounce_acti = getent("bounce_acti", "targetname");
	knife_jump = getent("knife_jump", "targetname");
	knife_acti = getent("knife_acti", "targetname");
	strafe_jump = getent("strafe_jump", "targetname");
	strafe_acti = getent("strafe_acti", "targetname");
	
	while(1)
	{
		trig waittill ("trigger",player);
		if(level.sniper == true)
		{
			endtele(player,sniper_jump,"m40a3_mp");
			endtele(level.activ,sniper_acti,"remington700_mp");
			player freezeControls(1);
			level.activ freezeControls(1);
			wait(1.0);
			iprintlnbold("No scope? Hardscope? Quickscope?");
			wait(1.0);
			player freezeControls(0);
			level.activ freezeControls(0);
			while(isDefined(player) && player isReallyAlive())
			{
				wait (0.05);
			}
		}
		else if(level.bounce == true)
		{
			endtele(player,bounce_jump,"knife_mp");
			endtele(level.activ,bounce_acti,"knife_mp");
			player freezeControls(1);
			level.activ freezeControls(1);
			wait(1.0);
			iprintlnbold("Bounce like never before!");
			wait(1.0);
			player freezeControls(0);
			level.activ freezeControls(0);
			ambientPlay("end_song_bounce");
			while(isDefined(player) && player isReallyAlive())
			{
				wait (0.05);
			}
		}
		else if(level.knife == true)
		{
			endtele(player,knife_jump,"tomahawk_mp");
			endtele(level.activ,knife_acti,"tomahawk_mp");
			player freezeControls(1);
			level.activ freezeControls(1);
			wait(1.0);
			iprintlnbold("Slice your opponent to pieces!");
			wait(1.0);
			player freezeControls(0);
			level.activ freezeControls(0);
			while(isDefined(player) && player isReallyAlive())
			{
				wait (0.05);
			}
		}
		else if(level.strafe == true)
		{
			endtele(player,strafe_jump,"knife_mp");
			endtele(level.activ,strafe_acti,"knife_mp");
			player freezeControls(1);
			level.activ freezeControls(1);
			wait(1.0);
			iprintlnbold("Strafe until you die!");
			wait(1.0);
			player freezeControls(0);
			level.activ freezeControls(0);
			while(isDefined(player) && player isReallyAlive())
			{
				wait (0.05);
			}
		}
		else
			wait(0.05);
	}	
}

end_acti_sniper()
{
	trig = getent("actiroom_sniper", "targetname");
	trig_bounce = getent("actiroom_bounce", "targetname");
	trig_strafe = getent("actiroom_strafe", "targetname");
	trig_knife = getent("actiroom_knife", "targetname");
	sniper_room = getent("sniper_acti", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	trig_bounce delete();
	trig_strafe delete();
	trig_knife delete();
	level.sniper = true;
	iprintlnbold("Activator chose Sniper battle!");
}

end_acti_bounce()
{
	trig = getent("actiroom_bounce", "targetname");
	bounce_room = getent("bounce_acti", "targetname");
	trig_sniper = getent("actiroom_sniper", "targetname");
	trig_strafe = getent("actiroom_strafe", "targetname");
	trig_knife = getent("actiroom_knife", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	trig_sniper delete();
	trig_strafe delete();
	trig_knife delete();
	level.bounce = true;
	iprintlnbold("Activator chose Bounce race!");
}

end_acti_strafe()
{
	trig = getent("actiroom_strafe", "targetname");
	strafe_room = getent("strafe_acti", "targetname");
	trig_bounce = getent("actiroom_bounce", "targetname");
	trig_sniper = getent("actiroom_sniper", "targetname");
	trig_knife = getent("actiroom_knife", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	trig_bounce delete();
	trig_sniper delete();
	trig_knife delete();
	level.strafe = true;
	iprintlnbold("Activator chose Strafe race!");
}

end_acti_knife()
{
	trig = getent("actiroom_knife", "targetname");
	trig_bounce = getent("actiroom_bounce", "targetname");
	trig_strafe = getent("actiroom_strafe", "targetname");
	trig_sniper = getent("actiroom_sniper", "targetname");
	knife_room = getent("knife_acti", "targetname");
	fence = getent("kniferoom_barrier", "targetname");
	
	trig waittill ("trigger",player);
	trig delete();
	trig_bounce delete();
	trig_strafe delete();
	trig_sniper delete();
	level.knife = true;
	iprintlnbold("Activator chose Knife battle!");
	fence movez(124,0.5);
	fence waittill ("movedone");
}
end_straferoom_acti()
{
	actitrig = getent("endstrafe_backacti_trig", "targetname");
	posacti = getent("endstrafe_backport_acti", "targetname");
	while(1)
	{
		actitrig waittill ("trigger",player);
		player teleport(posacti);
	}
}
end_straferoom_jump()
{
	jumptrig = getent("endstrafe_backjump_trig", "targetname");
	posjump = getent("endstrafe_backport_jump", "targetname");
	while(1)
	{
		jumptrig waittill("trigger",player);
		player teleport(posjump);
	}
}

end_bounceroom_acti_start()
{
	pos1 = getent("bounce_acti", "targetname");
	trig = getent("bounceActi_start", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}
end_bounceroom_acti_first()
{
	pos1 = getent("bounce_acti_first", "targetname");
	trig = getent("bounceActi_first", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}
end_bounceroom_acti_second()
{		
	pos1 = getent("bounce_acti_second", "targetname");
	trig = getent("bounceActi_second", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}

end_bounceroom_jump_start()
{
	pos1 = getent("bounce_jump", "targetname");
	trig = getent("bounceJump_start", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}
end_bounceroom_jump_first()
{
	pos1 = getent("bounce_jump_first", "targetname");
	trig = getent("bounceJump_first", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}
end_bounceroom_jump_second()
{		
	pos1 = getent("bounce_jump_second", "targetname");
	trig = getent("bounceJump_second", "targetname");
	
	while(1)
	{
		trig waittill ("trigger", player);
		player teleport(pos1);
	}
}
endtele(who, where, weap)
{
	who setOrigin(where.origin);
	who setPlayerAngles(where.angles);
	
	who TakeAllWeapons();
	who GiveWeapon(weap);
	who GiveMaxAmmo(weap);
	who SwitchToWeapon(weap);
	who.health = 100;
}
isReallyAlive()
{
	if(self.sessionstate == "playing")
		return true;
	return false;
}