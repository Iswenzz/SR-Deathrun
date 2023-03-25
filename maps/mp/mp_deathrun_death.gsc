main()
{
	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	PrecacheItem("portal_mp");
	PrecacheItem("deserteaglegold_mp");

	level.portalgunused = false;
	level.portalgun["portal_blue"] = LoadFX("deathrun/portal/portal_blue");
	level.portalgun["portal_red"] = LoadFX("deathrun/portal/portal_red");
	level.portalgun["shoot_blue"] = LoadFX("deathrun/portal/portalgun_shoot_blue");
	level.portalgun["shoot_red"] = LoadFX("deathrun/portal/portalgun_shoot_red");
	level._effect["shine"] = LoadFX("deathrun/shine");
	level._effect["spray"] = LoadFX("deathrun/spray");
	level.glitch_explosion = LoadFX("deathrun/glitch_explosion");
	level._effect["blue_fire_small"] = LoadFX("deathrun/blue_fire_small");
	level._effect["clouds"] = LoadFX("deathrun/clouds");
	
	cloud = getentarray("ambient_clouds", "targetname");
	for(i=0;i<cloud.size;i++)
	{
		weatherfx[i] = maps\mp\_utility::createOneshotEffect( "clouds" );
		weatherfx[i].v[ "origin" ] = cloud[i].origin;
		weatherfx[i].v[ "angles" ] = ( 270, 0, 0 );
		weatherfx[i].v[ "fxid" ] = "clouds";
		weatherfx[i].v[ "delay" ] = -15;
	}
	
	fire = getentarray("ambient_blue_fire_small", "targetname");
	for(i=0;i<fire.size;i++)
	{
		blue_fire[i] = maps\mp\_utility::createOneshotEffect( "blue_fire_small" );
		blue_fire[i].v[ "origin" ] = fire[i].origin;
		blue_fire[i].v[ "angles" ] = ( 270, 0, 0 );
		blue_fire[i].v[ "fxid" ] = "blue_fire_small";
		blue_fire[i].v[ "delay" ] = -15;
	}
	
	fxObj = getent("trap12_fx", "targetname");
	fx_spray = maps\mp\_utility::createOneshotEffect( "spray" );
	fx_spray.v[ "origin" ] = fxObj.origin+(0,0,96);
	fx_spray.v[ "angles" ] = ( 270, 0, 0 );
	fx_spray.v[ "fxid" ] = "spray";
	fx_spray.v[ "delay" ] = -15;
	
	fx_shine = maps\mp\_utility::createOneshotEffect( "spray" );
	fx_shine.v[ "origin" ] = fxObj.origin;
	fx_shine.v[ "angles" ] = ( 270, 0, 0 );
	fx_shine.v[ "fxid" ] = "spray";
	fx_shine.v[ "delay" ] = -15;
	
	thread bounce();
	thread spikes();
	thread vehicles();
	thread rotator();
	thread vanish();
	thread hammers();
	thread spinners();
	thread pusher();
	thread opendoor();
	thread doublespikes();
	
	thread PlaceGlitchTriggers();
}

PlaceGlitchTriggers()
{
	trig = getentarray("glitch_trigger", "targetname");
	for(i=0;i<trig.size;i++)
		trig[i] thread WatchGlitchTrigger();
}

WatchGlitchTrigger()
{
	while(1)
	{
		self waittill("trigger", who );
		who iprintlnbold("^2Whats the point of glitching? Its boring! You got saved!");
		who iprintlnbold("^2Little Notice: ^1GET A LIFE!");
		iprintlnBold( who.name + " tried to glitch!");
		logPrint( who.name + " tried to glitch! ( Guid: " + who GetGuid() + " )");
		PlayFX( level.glitch_explosion, who GetTagOrigin("j_spinelower") );
		EarthQuake( 2, 2, who.origin, 1200 );
		who PlaySound("exp_suitcase_bomb_main");
		who suicide();
	}
}

bounce()
{
	level.trapTriggers[0] = getent("blocker_trigger", "targetname");
	blocker = getent("blocker", "targetname");

	level.trapTriggers[0] waittill( "trigger" );
	level.trapTriggers[0] delete();

	blocker movex(1632,1);
	blocker waittill("movedone");
	blocker movex(-1632,5);
}

spikes()
{
	level.trapTriggers[1] = getent("spikes_trigger", "targetname");
	spikes1 = getent("spikes1", "targetname");
	spikes1_hurt = getent("spikes1_hurt", "targetname");
	spikes2 = getent("spikes2", "targetname");
	spikes2_hurt = getent("spikes2_hurt", "targetname");

	spikes1_hurt enablelinkto();
	spikes1_hurt linkto(spikes1);
	spikes2_hurt enablelinkto();
	spikes2_hurt linkto(spikes2);

	level.trapTriggers[1] waittill( "trigger" );
	level.trapTriggers[1] delete();

	spikes1 movey(-1024,1);
	spikes2 movey(-448,1);
	wait 1;
	spikes1 movey(1024,3);
	spikes2 movey(448,3);
}

vehicles()
{
	level.trapTriggers[2] = getent("vehicles_trigger", "targetname");
	vehicle1 = getent("vehicle1", "targetname");
	vehicle2 = getent("vehicle2", "targetname");
	vehicle1_hurt = getent("vehicle1_hurt", "targetname");
	vehicle2_hurt = getent("vehicle2_hurt", "targetname");
	vehicle1_clip = getent("vehicle1_clip", "targetname");
	vehicle2_clip = getent("vehicle2_clip", "targetname");

	vehicle1_hurt enablelinkto();
	vehicle1_hurt linkto(vehicle1);
	vehicle2_hurt enablelinkto();
	vehicle2_hurt linkto(vehicle2);

	vehicle1_clip linkto(vehicle1);
	vehicle2_clip linkto(vehicle2);

	level.trapTriggers[2] waittill( "trigger" );
	level.trapTriggers[2] delete();

	vehicle1 movex(448,1);
	vehicle2 movex(-448,1);
	wait 1;
	vehicle1_hurt delete();
	vehicle2_hurt delete();
}


rotator()
{
	level.trapTriggers[3] = getent("rotator_trigger", "targetname");
	rotator = getent("rotator", "targetname");

	level.trapTriggers[3] waittill( "trigger" );
	level.trapTriggers[3] delete();

	for(;;)
	{
		rotator rotateroll(-360, 4);
	wait 1;
	}
}

vanish()
{
	level.trapTriggers[4] = getent("vanish_trigger", "targetname");
	vanish1 = getentarray("vanish_part1", "targetname");
	vanish2 = getentarray("vanish_part2", "targetname");
	vanish3 = getentarray("vanish_part3", "targetname");

	level.trapTriggers[4] waittill( "trigger" );
	level.trapTriggers[4] delete();

	vanish1[RandomInt(vanish1.size)] Notsolid();
	vanish2[RandomInt(vanish2.size)] Notsolid();
	vanish3[RandomInt(vanish3.size)] Notsolid();
}

hammers()
{
	level.trapTriggers[5] = getent("hammers_trigger", "targetname");
	hammer1 = getent("hammer1", "targetname");
	hammer2 = getent("hammer2", "targetname");
	hammer3 = getent("hammer3", "targetname");
	hammer1_hurt = getent("hammer1_hurt", "targetname");
	hammer2_hurt = getent("hammer2_hurt", "targetname");
	hammer3_hurt = getent("hammer3_hurt", "targetname");

	hammer1_hurt enablelinkto();
	hammer1_hurt linkto(hammer1);
	hammer2_hurt enablelinkto();
	hammer2_hurt linkto(hammer2);
	hammer3_hurt enablelinkto();
	hammer3_hurt linkto(hammer3);

	level.trapTriggers[5] waittill( "trigger" );
	level.trapTriggers[5] delete();

	for(;;)
	{
		hammer1 rotatepitch(360, 2.5);
		hammer2 rotatepitch(-360, 2.5);
		wait 1;
		hammer3 rotatepitch(360, 2.5);
		wait 2;
	}
}

spinners()
{

	level.trapTriggers[6] = getent("spinners_trigger", "targetname");
	spinner1 = getent("spinner1", "targetname");
	spinner2 = getent("spinner2", "targetname");

	level.trapTriggers[6] waittill( "trigger" );
	level.trapTriggers[6] delete();

	for(i=0; i<7; i++)
	{
		spinner1 rotateyaw(360, 0.5);
		spinner2 rotateyaw(-360, 0.5);
	wait .5;
	}
}

pusher()
{
	level.trapTriggers[7] = getent("pusher_trigger", "targetname");
	pusher = getent("pusher", "targetname");

	level.trapTriggers[7] waittill( "trigger" );
	level.trapTriggers[7] delete();

	for(i=0; i<10; i++)
	{
		pusher rotateyaw(360, 0.5);
	wait .5;
	}
}

opendoor()
{
	door_trigger = getent("door_trigger", "targetname");
	door = getent("door", "targetname");

	door_trigger waittill( "trigger", player );
	door_trigger delete();
	
	iprintlnbold( player.name + " ^1finished the map as first! ^2Gratz!");
	
	if( !level.freeRun && isDefined( level.activ ) && isAlive( level.activ ) )
	{
		iprintln("Activator got teleported to randomly spot!");
		
		spot = getentarray("final_spawn", "targetname");
		x = RandomInt(spot.size);
		level.activ SetPlayerAngles( spot[x].angles );
		level.activ SetOrigin( spot[x].origin );
		level.activ iprintlnbold("You got teleported to randomly spot!");
	}
	
	MusicPlay("dat_music");
	
	door moveZ( -200, 3, 0.5, 0.5 );
}

StartPlacingPortals()
{
	self endon("disconnect");
	self endon("death");
	
	mover = undefined;
	
	while(1)
	{
		if( self GetCurrentWeapon() == "portal_mp" )
		{
			if( self AttackButtonPressed() )
			{
				test = BulletTrace( self GetEye(), self GetEye()+AnglesToForward(self GetPlayerAngles())*9999, false, self );
				if( isDefined( self.secondportal ) && Distance( self.secondportal.origin, test["position"] ) <= 300 )
				{
					self iprintlnbold("Portal would be too close to the other one!");
					wait 0.1;
					continue;
				}
				else if( !isDefined( self.firstportal ) )
				{
					self.firstportal = Spawn("script_model", self GetEye() );
					self.firstportal SetModel("tag_origin");
					self PlaySound("portal_shoot_blue");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_blue"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.firstportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.firstportal.origin = target;
					PlayFXOnTag( level.portalgun["portal_blue"], self.firstportal, "tag_origin" );
					self.firstporal PlaySound("portal_open");
					self.firstportal thread PlayLoopedSound( "portal_idle", 3.4 );
					self.firstportal.angles = VectorToAngles(self GetEye() - self.firstportal.origin);
					if( isDefined( self.secondportal ))
						thread WatchPortalEntering( self.firstportal, self.secondportal, self );
				}
				else if( isDefined( self.firstportal ) )
				{
					self PlaySound("portal_shoot_blue");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_blue"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.firstportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.firstportal.origin = target;
					self.firstportal.angles = VectorToAngles(self GetEye() - self.firstportal.origin);
					self.firstportal PlaySound("portal_open");
				}
			}
			if( self AdsButtonPressed() )
			{
				test = BulletTrace( self GetEye(), self GetEye()+AnglesToForward(self GetPlayerAngles())*9999, false, self );
				if( isDefined( self.firstportal ) && Distance( self.firstportal.origin, test["position"] ) <= 300 )
				{
					self iprintlnbold("Portal would be too close to the other one!");
					wait 0.1;
					continue;
				}
				else if(!isDefined(self.secondportal))
				{
					self.secondportal = Spawn("script_model", self GetEye() );
					self.secondportal SetModel("tag_origin");
					self PlaySound("portal_shoot_red");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_red"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.secondportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.secondportal.origin = target;
					PlayFXOnTag( level.portalgun["portal_red"], self.secondportal, "tag_origin" );
					self.secondportal PlaySound("portal_open");
					self.secondportal thread PlayLoopedSound( "portal_idle", 3.4 );
					self.secondportal.angles = VectorToAngles(self GetEye() - self.secondportal.origin);
					if( isDefined( self.firstportal ))
						thread WatchPortalEntering( self.firstportal, self.secondportal, self );
				}
				else if(isDefined(self.secondportal))
				{
					self PlaySound("portal_shoot_red");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_red"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.secondportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.secondportal.origin = target;
					self.secondportal.angles = VectorToAngles(self GetEye() - self.secondportal.origin);
					self.secondportal PlaySound("portal_open");
				}
			}
			if( self FragButtonPressed() || !isAlive( self ) )
			{
				if( isDefined( self.firstportal ) )
				{
					self.firstportal PlaySound("portal_close");
					self.firstportal delete();
				}
				if( isDefined( self.secondportal ) )
				{
					self.secondportal PlaySound("portal_close");
					self.secondportal delete();
				}
				if( !isAlive( self ) )
					break;
			}
			while( self AttackButtonPressed() || self AdsButtonPressed() || self FragButtonPressed() )
				wait 0.01;
		}
		wait 0.1;
	}
}

WatchPortalEntering( firstportal, secondportal, owner )
{
	self endon("stop_watching_entering");
	
	while(1)
	{
		if( !isDefined( firstportal ) || !isDefined( secondportal ) )
			break;
		if( Distance( firstportal.origin, owner.origin ) <= 60 && isAlive(owner) )
		{
			owner SetOrigin( secondportal.origin+AnglesToForward(secondportal.angles)*100 );
			owner SetPlayerAngles( secondportal.angles[0], secondportal.angles[1], owner.angles[2] );
			owner iprintln("You got teleported!");
			wait 0.5;
		}
		if( Distance( secondportal.origin, owner.origin ) <= 60 && isAlive(owner) )
		{
			owner SetOrigin( firstportal.origin+AnglesToForward(firstportal.angles)*100 );
			owner SetPlayerAngles( firstportal.angles[0], firstportal.angles[1], owner.angles[2] );
			owner iprintln("You got teleported!");
			wait 0.5;
		}
		wait 0.1;
	}
}

PlayLoopedSound( sound, delay )
{
	self endon("stop_looped_sound");
	
	if(!isDefined(delay) || delay == 0)
		delay = 5;
	
	while(1)
	{
		if(!isDefined(self))
			break;
		self PlaySound(sound);
		wait delay;
	}
}

doublespikes()
{
	button = getent("trap12_trigger", "targetname");
	button waittill("trigger", player );
	button delete();
	
	player iprintlnbold( player.name + " pressed a pointless button...");
	if( level.portalgunused )
		return;
	
	level.portalgunused = true;
	wait 20;
	door = getent("trap12_door", "targetname");
	door MoveX( 8, 1, 0.5, 0.5 );
	wait 1;
	door MoveZ( 72, 2, 1, 1 );
	wait 2;
	trig = getent("trap12_use", "targetname");
	trig waittill("trigger", player );
	trig delete();
	gun = getent("trap12_gun", "targetname");
	gun delete();
	
	player iprintlnbold("^1YOU PICKED UP THE PORAL GUN! ^2HAVE FUN");
	player iprintlnbold("^1Attack Button = 1st portal^7 ; ^22x ADS Button = 2nd portal");
	player iprintlnbold("^5Frag Button = delete portals");
	
	player GiveWeapon("portal_mp");
	wait 0.01;
	player SwitchToWeapon("portal_mp");
	player thread StartPlacingPortals();
	
	spawns = getentarray("mp_jumper_spawn", "classname");
	x = RandomInt(spawns.size);
	player SetPlayerAngles( spawns[x].angles );
	player SetOrigin( spawns[x].origin );
}