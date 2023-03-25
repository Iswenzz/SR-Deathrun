main()
{


    precacheItem( "ak47_mp" );
	precacheItem( "beretta_mp" );
	precacheItem( "deserteagle_mp" );
	precacheItem( "deserteaglegold_mp" );
	precacheItem( "uzi_mp" );
	PrecacheModel("vehicle_mig29_desert");
	PrecacheModel("vehicle_uav");
	PrecacheModel("projectile_cbu97_clusterbomb");
	precacheItem( "airstrike_mp" );
	PrecacheModel("vehicle_mi24p_hind_mp");
	level.shoot_fx = LoadFX("muzzleflashes/winch_flash_wv");
	level.airstrike["bomb"] = LoadFX("explosions/clusterbomb");
	level.airstrike["afterburner"] = LoadFX("fire/jet_afterburner");
	level.airstrike["contrail"] = LoadFX("smoke/jet_contrail");
	level.airstrike["explosion"] = LoadFX("explosions/tanker_explosion");
	level.trap["lightning"] = LoadFX("rednose/lightning");
	level.trap["lightning_dirt"] = LoadFX("rednose/lightning_dirt");
	
	maps\mp\_load::main();
	maps\mp\mp_deathrun_rainy_v2_fx::main();
	maps\mp\_ac130_moving::main();
	maps\mp\_explosive_barrels::main();
	maps\mp\_dynamic_foliage2::initdfs();
	maps\mp\_fail::main();
    maps\mp\_telerainy::main();
	maps\mp\_telerainy2::main();
    maps\mp\_telerainy3::main();
    maps\mp\_telerainy4::main();
	




	
	ambientPlay("ambient_cargoshipmp_ext");
	
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	thread teleporter();
	thread trigger_init();
	thread shotsound (); 
	thread door_slider (); 
	thread trap_1 (); 
	thread trap_2 (); 
	thread trap_3 (); 
	thread trap_5 (); 
	thread airstrikestart (); 
	thread MovingUAV();
	thread finaltele();
	thread door123();
	thread door1234();
	thread finaldoor();
	thread radi();
	thread FlyingHelicopter();
	thread addtrapstofreerun();
}


teleporter()
{
	entTransporter = getentarray( "enter", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}
 
transporter()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}


trigger_init()
{
	soundtriggers = getentarray( "sound_trigger", "targetname" );

	for( i = 0; i < soundtriggers.size; i++ )
		soundtriggers[i] thread trigger_sound();
}

trigger_sound()
{
	self.wait_for_retrigger = false;
	soundpos = getent( self.target, "targetname" );

	while( 1 )
	{
		if( !self.wait_for_retrigger )
		{
			self waittill( "trigger" );
			self.wait_for_retrigger = true;
			soundpos thread play_the_sound( self, soundpos.script_noteworthy );
		}
		wait 0.1;
	}
}

play_the_sound( used_trigger, sound )
{
		self playsound( sound );
		wait 100000;
		used_trigger.wait_for_retrigger = false;
}


shotsound()
{
	trig = getEnt( "shotsound", "targetname" );

	trig waittill( "trigger", who );
	height = -340;
	for(i=0;i<5;i++)
	{
		trace = BulletTrace( (9152,-1712,height), (8704,-1696,height), true, undefined );
		if( isPlayer(trace["entity"]))
			trace["entity"] finishPlayerDamage( trace["entity"], trace["entity"], 1000, 0, "MOD_PROJECTILE", "winchester1200_mp", (9152,-1712,height), (9152,-1712,height), "none", 0);
		height -= 2;
	}
	PlayFX( level.shoot_fx, (9111,-1700,-328) );
	who PlaySound("shot");
	trig delete();

}


door_slider() 
{ 
	door = getent( "rollerdoor", "targetname" ); 
	trig = getent( "rollertrig", "targetname" ); 
 
	while(true) 
	{ 
		trig waittill ( "trigger", who ); 
		who PlaySound("rollerdoorsound");
		trig delete();
		door movez ( 185, 5, 0, 0.6 ); 
		door waittill ( "movedone" ); 
	} 
}



trap_1()
{
	trig = getEnt( "trigger1", "targetname" );
	
	trig waittill("trigger", who );
	trig delete();
	
	rolls = getEntArray("trap_1", "targetname");
	x = RandomInt(rolls.size);
	rolls[x] rotatePitch( 720, 8 );
	wait 8;
	rolls[x].angles = (0,0,0);
}


trap_2()
{
	trig = getEnt( "trigger2", "targetname" );
	brush = getEnt( "trap2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while( isDefined( brush ) )
	{
		brush rotateRoll( 180, 16 );
		wait 4;
	}
}


trap_3()
{
	trig = getEnt("trigger3", "targetname");
	
	trig waittill("trigger", who );
	trig delete();
	
	x = (0,RandomInt(361),0);		//361 = 0-360
	for(i=0;i<3;i++)
	{
		thread StartAirstrike( x );
		wait 2+RandomFloat(3);		//2+3 = max 5 xP
	}
}

StartAirstrike( direction )
{
	center = (6080,-1712,2000);
	x = (RandomIntRange(-250,250),RandomIntRange(-350,350),RandomIntRange(-150,150));
	startPos = center-AnglesToForward( direction )*6000+x;
	endPos = center+AnglesToForward( direction )*6000+x;
	
	jet = Spawn("script_model", startPos);
	jet SetModel("vehicle_mig29_desert");
	jet playLoopSound("veh_mig29_dist_loop");
	jet.angles = direction;
	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, jet, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, jet, "tag_left_wingtip" );
	bomb = Spawn("script_model", jet.origin );
	bomb SetModel("projectile_cbu97_clusterbomb");
	bomb LinkTo( jet );
	
	flyTime = Distance( startPos, endPos ) / 8000;
	jet MoveTo( endPos, flytime, 0, 0 );
	wait flyTime/2;
	bomb thread ThrowBomb();
	wait flyTime/2;
	jet delete();
}

ThrowBomb()
{
	self UnLink();
	self RotatePitch( 90, 1.5 );
	
	trace = BulletTrace( self.origin, self.origin-(0,0,3000), false, self );
	flyTime = Distance( self.origin, trace["position"] ) / 1200;
	self MoveTo( trace["position"], flyTime, flyTime, 0 );
	
	wait flyTime;
	
	EarthQuake( 1.5, 1.5, trace["position"], 1000 );
	PlayFX( level.airstrike["explosion"], trace["position"] );
	PlayFX( level.airstrike["bomb"], self.origin );
	self PlaySound("artillery_impact");
	//DoRadiusDamage( trace["position"], 500, 1000, 50, self, self, "airstrike_mp");
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive( players[i] ) && Distance( trace["position"], players[i].origin) <= 700) 
			players[i] suicide();
	}
	wait 0.5;
	self PlaySound("exp_suitcase_bomb_main");
	self delete();

}


trap_5()
{
	trig = getEnt("trigger5", "targetname");	
	
	trig waittill("trigger", who );
	trig delete();
	
	thread StartFiringLightnings();
}

StartFiringLightnings()
{
	center = (10494,-974,300);		
	count = 20;
	
	soundObj = Spawn("script_origin", center );
	wait 0.1;
	while(1)
	{
		if( count > 0 )
		{
			count --;
			x = center+(RandomIntRange(-600,600),RandomIntRange(-600,600),0);
			trace = BulletTrace( x, x-(0,0,1000), false, undefined );
			PlayFX( level.trap["lightning"], trace["position"] );
			PlayFX( level.trap["lightning_dirt"], trace["position"] );
			soundObj.origin = trace["position"];
			soundObj PlaySound("lightning");
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			{
				if( players[i].pers["team"] == "allies" && isAlive( players[i] ) && Distance( trace["position"], players[i].origin ) <= 150 )
					players[i] suicide();
			}
		}
		else
			break;
		wait 0.25+RandomFloat(0.25);
	}
	if( isDefined( soundObj ) )
		soundObj delete();
}

//Written by Rycoon :]



airstrikestart()
{
	trig = getEnt("trigger3", "targetname");
	
	trig waittill("trigger", who );
	trig delete();
	
	x = (0,RandomInt(361),0);		//361 = 0-360
	for(i=0;i<3;i++)
	{
		thread StartAirstrike1( x );
		wait 2+RandomFloat(3);		//2+3 = max 5 xP
	}
}

StartAirstrike1 (direction)
{
	center = (15,407,2500);
	x = (RandomIntRange(-250,250),RandomIntRange(-350,350),RandomIntRange(-150,150));
	startPos = center-AnglesToForward( direction )*6000+x;
	endPos = center+AnglesToForward( direction )*6000+x;
	
	jet = Spawn("script_model", startPos);
	jet SetModel("vehicle_mig29_desert");
	jet playLoopSound("veh_mig29_dist_loop");
	jet.angles = direction;
	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_right" );
	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_left" );
	playfxontag( level.fx_airstrike_contrail, jet, "tag_right_wingtip" );
	playfxontag( level.fx_airstrike_contrail, jet, "tag_left_wingtip" );

	
	flyTime = Distance( startPos, endPos ) / 8000;
	jet MoveTo( endPos, flytime, 0, 0 );
	wait flyTime/2;
	wait flyTime/2;
	jet delete();
}


MovingUAV()
{
	center = (4027,3472,3000);
	
	radius = 10000;
	time = 120;			
	
	linker = Spawn("script_origin", center );
	
	x = (0,RandomInt(361),0);
	target = center+AnglesToForward(x)*radius;
	
	uav = Spawn("script_model", target );
	uav SetModel("vehicle_uav");
	uav LinkTo( linker );
	
	while(1)
	{
		linker RotateYaw( 360, time );
		wait time;
	}
}



finaltele()
{
	trig = getEnt("triggerfinal", "targetname");
	
	trig waittill("trigger", player);
	trig delete();
	
	if( GetTeamPlayersAlive("allies") > 1 && !level.freeRun )
		return;
	
	x = 1+RandomInt(3);
	porterA = getEnt("porter_activator_"+x, "targetname");
	porterJ = getEnt("porter_jumper_"+x, "targetname");
	
	gun = GetRandomWeapon( x );
	
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( IsAlive(players[i]))
		{
			if( players[i].pers["team"] == "allies" )
			{
				players[i] SetPlayerAngles( porterJ.angles );
				players[i] SetOrigin( porterJ.origin );
				players[i] GiveWeapon( gun );
				wait 0.01;
				players[i] SwitchToWeapon( gun );
			}
			if( players[i].pers["team"] == "axis" )
			{
				players[i] SetPlayerAngles( porterA.angles );
				players[i] SetOrigin( porterA.origin );
				players[i] GiveWeapon( gun );
				wait 0.01;
				players[i] SwitchToWeapon( gun );
			}
		}
	}
}

GetRandomWeapon( num )
{
	if( num == 2 )
		return "knife_mp";
	else
	{
		x = RandomInt( 51 );
		if( x < 10 )
			return "deserteagle_mp";
		if( x > 9 && x < 20 )
			return "deserteaglegold_mp";
		if( x > 20 && x < 30 )
			return "tomahawk_mp";
		if( x > 30 && x < 40 )
			return "uzi_mp";
		if( x > 40 && x < 50 )
			return "beretta_mp";
		if( x == 50 )
			return "ak47_mp";
	}
}

door123()
{
	trig = getEnt( "door123trig", "targetname" );
	brush = getEnt( "door123", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush movex( 15, 5 );
	wait (1);
	brush moveZ( -302, 5 );
}

door1234()
{
	trig = getEnt( "door1234trig", "targetname" );
	brush = getEnt( "door1234", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush movez( -10, 2 );
	wait (1);
	brush movey( 80, 2 );
}

finalDoor()
{
	trig = getEnt( "finaldoortrig", "targetname" );
	brush = getEnt( "finaldoor", "targetname" );
		brush1 = getEnt( "finaldooract", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush movey( 15, 5 );
	brush1 movey( 15, 5 );
	wait (1);
	brush moveZ( 125, 5 );
	brush1 moveZ( 125, 5 );
}

radi()
{
	trig = getEnt( "raditrigger", "targetname" );
	brush = getEnt( "radi1", "targetname" );
	brush2 = getEnt( "radi2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	brush  movey( 60, 2 );
	brush2 movey( -60, 2 );
}


FlyingHelicopter()
{
	while(1)
	{
		players = getentarray("player", "classname");
		if( players.size > 0 )
			break;
		wait 1;
	}
	players = getentarray("player", "classname");
	player = players[RandomInt(players.size)];
	
	targets = getEntArray("choppa_path", "targetname");
	chopper = spawn_helicopter( player, targets[RandomInt(targets.size)].origin, (0,0,0), "cobra_mp", "vehicle_mi24p_hind_mp" );
	chopper playLoopSound( "mp_cobra_helicopter" );
	chopper.owner = undefined;
	chopper.maxhealth = 5000;
	chopper.health = chopper.maxhealth;
	chopper setDamageStage( 3 );
	chopper setSpeed( 25, 15 );
	wait 1;
	
	while(1)
	{
		chopper setVehGoalPos( targets[RandomInt(targets.size)].origin, true );
		chopper waittill("goal");
		chopper setGoalYaw( RandomInt(361) );
		wait 3+RandomInt(5);
	}
}

spawn_helicopter( owner, origin, angles, model, targetname )
{
	chopper = spawnHelicopter( owner, origin, angles, model, targetname );
	return chopper;
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trigger1");
	addTriggerToList("trigger2");
	addTriggerToList("trigger3");
	addTriggerToList("shotsound");
	addTriggerToList("trigger5");
	

}