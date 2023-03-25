main()
{
	level._effect["rotor_smoke"] = loadfx( "mp_vc_tunnels/rotor_smoke" );
	level._effect["gas_smoke"] = loadfx( "mp_vc_tunnels/gas_trap" );
	level._effect["c4_exp"] = loadfx( "mp_vc_tunnels/c4_exp" );
	level._effect["teleportfx"] = loadfx( "mp_vc_tunnels/teleportation_fx" );

	PreCacheShellShock("radiation_high");
	PreCacheModel("playermodel_fox_fortnite_ramirez");
	PreCacheItem("winchester1200_mp");

	maps\mp\_load::main();
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar( "r_specularcolorscale", "2" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	setdvar("bg_fallDamageMaxHeight","9999");
	setdvar("bg_fallDamageMinHeight","9998");

	thread onspawn();

	for(i=1;i<9;i++)
		addTriggerToList("trap"+i+"trig");

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();

	level waittill("round_started");

	thread start_walls();
	thread teleporter();

	thread roomselection();

	thread kniferoom();
	thread bounceroom();
	thread sniperroom();
	thread shotgunroom();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

onspawn()
{
	for(;;)
	{
	level waittill("player_spawn",player);
	player detachAll();
	player setmodel("playermodel_fox_fortnite_ramirez");
	}
}

rotations(axes,angle,time)
{
	switch(axes)
	{
		case 0:
		self rotateyaw(angle,time);
		break;

		case 1:
		self rotateroll(angle,time);
		break;

		case 2:
		self rotatepitch(angle,time);
		break;
	}
}

start_walls()
{
	obj = getent("start_walls","targetname");
	wait 5;
	obj delete();
	thread playmusic();
	thread policecar();
}

playmusic()
{
	x = randomint(3);
	switch(x)
	{
		case 0:
		ambientplay("music1",2);
		msg = huds(0,-150,2,"^5Playing: ^7Alan Walker - Ignite");
		break;

		case 1:
		ambientplay("music2",2);
		msg = huds(0,-150,2,"^5Playing: ^7Ark Patrol - Never");
		break;

		case 2:
		ambientplay("music3",2);
		msg = huds(0,-150,2,"^5Playing: ^7Nightcore - Ievan Polkka (VSNS Remix)");
		break;
	}
}

huds(x,y,fontscale,text)
{
	messagehud = NewHudElem();
	messagehud.alignX = "center";
	messagehud.alignY = "middle";
	messagehud.horzalign = "center";
	messagehud.vertalign = "middle";
	messagehud.alpha = 1;
	messagehud.x = x;
	messagehud.y = y;
	messagehud.font = "objective";
	messagehud.fontscale = fontscale;
	messagehud.glowalpha = 1;
	messagehud.glowcolor = (1,0,0);
	messagehud settext(text);
	messagehud SetPulseFX( 40, 4000, 1000 );
	wait 5;
	messagehud destroy();
}

policecar()
{
	trig = getent("policecar","targetname");

	if(randomint(2) == 0)
	{
		trig waittill("trigger",player);
		ambientplay("music4");
		msg = huds(0,-200,2,"Mortiis Wanted This >.>\n"+player.name+" Started da music");
		trig delete();
	}
	else
	{
		trig waittill("trigger",player);
		player iprintlnbold("Not this time m8");
		trig delete();
	}

}

teleporter()
{       
 	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
		{
			entTransporter[i] thread transporter();
			PlayFX(level._effect["teleportfx"],(entTransporter[i].origin-(0,0,8)) );
		}
}
 
transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

trap1()
{
	slapers = getentarray("slapers","targetname");
	killtrig = getentarray("slapers_killtrig","targetname");
	trig = getent("trap1trig","targetname");
	for(i=0;i<slapers.size;i++)
	{
		killtrig[i] enablelinkto();
		killtrig[i] linkto(slapers[i]);
	}
	trig waittill("trigger",player);
	for(i=0;i<slapers.size;i++)
	{
		slapers[i] thread trap1movement();
	}
}

trap1movement()
{
	for(;;)
	{
		time = RandomFloatRange(0.1,2.0);
		self movey(-132,time);
		wait time*2;
		self movey(132,time);
		self waittill("movedone");
		wait 2;
	}
}

trap2()
{
	spikes = getentarray("spiketrap","targetname");
	spike_killtrig = getentarray("spike_killtrig","targetname");
	trig = getent("trap2trig","targetname");
	for(i=0;i<spikes.size;i++)
	{
		spike_killtrig[i] enablelinkto();
		spike_killtrig[i] linkto(spikes[i]);
	}
	trig waittill("trigger",player);
	for(i=0;i<4;i++)
	{
		spikes[i] movez(56,1);
		spikes[i] thread trap2moves();
	}
}

trap2moves()
{
	wait 2;
	self movez(-56,1);
	wait 2;
	for(;;)
	{
		time = RandomFloatRange(0.5, 2.0);
		self movez(56,time);
		wait time*2;
		self movez(-56,time);
		wait time*2;
	}
}

trap3()
{
	fallthroge_plats_row1 = getentarray("fp_row1","targetname");
	fallthroge_plats_row2 = getentarray("fp_row2","targetname");
	trig = getent("trap3trig","targetname");
	trig waittill("trigger",player);

	for(;;)
	{
		time = RandomFloatRange(1.0,2.0);
		for(i=0;i<fallthroge_plats_row1.size;i++)
		{
			fallthroge_plats_row1[i] rotations(2,-80,time);
			fallthroge_plats_row2[i] rotations(2,80,time);
			wait .5;
		}

		wait time*time;

		for(i=0;i<fallthroge_plats_row1.size;i++)
		{
			fallthroge_plats_row1[i] rotations(2,80,time);
			fallthroge_plats_row2[i] rotations(2,-80,time);
			wait .5;
		}
		wait time*time;
	}
}

trap4()
{
	rotor = getent("rotor","targetname");
	pushtrigger = getent("pushtrigger","targetname");
	trig = getent("trap4trig","targetname");
	level.trap4timer = randomint(5);
	fxorigin = spawn("script_model",(rotor.origin));
	fxorigin SetModel("tag_origin");

	if(level.trap4timer == 0)
		level.trap4timer = 5;

	trig waittill("trigger",player);
	trig delete();

	PlayFXOnTag ( level._effect["rotor_smoke"], fxorigin, "tag_origin" );
	rotor thread temprotate_trap4();
	pushtrigger thread rep();
	thread trap4timer();
	wait level.trap4timer;
	pushtrigger delete();
	fxorigin delete();

}

rep()
{
	for(;;)
	{
		self waittill("trigger",player);
		player thread pushplayer();
		wait .1;
	}
}

trap4timer()
{
	while(level.trap4timer != 0)
	{
		level.trap4timer--;
		wait 1;
	}
}

temprotate_trap4()
{
	while(level.trap4timer > 0)
	{
		self thread rotations(2,180,1);
		wait 1;
	}
}

pushplayer()
{
	for(i=0;i<5;i++)
	{
		self.health+=160;
		self finishPlayerDamage(self, self, 160, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToRight((90,0,0)), "none", 0);
	}
}

trap5()
{
	spiners = getentarray("spiners","targetname");
	spiner_trigs = getentarray("kst","targetname");
	trig = getent("trap5trig","targetname");
	for(i=0;i<spiner_trigs.size;i++)
	{
		spiner_trigs[i] enablelinkto();
		spiner_trigs[i] linkto(spiners[i]);
	}
	trig waittill("trigger",player);
	for(i=0;i<spiners.size;i++)
		spiners[i] thread trap5rotations(i);
}

trap5rotations(num)
{
	repeat = randomint(5);
	if(repeat == 0)
		repeat = 3;
	for(i=0;i<repeat;i++)
	{
		if(num == 0)
		{
			self thread rotations(0,-180,1);
		}
		if(num == 1)
		{
			self thread rotations(0,180,1);
		}
		wait 2;
	}
}

trap6()
{
	trig = getent("trap6trig","targetname");
	level.smoketrig = getent("smoketrig","targetname");
	trig waittill("trigger",player);
	PlayFX(level._effect["gas_smoke"],(-768, 3064, 136));
	thread trap6timer();
	wait 0.5;
	while(level.trap6time > 0)
	{
		level.smoketrig waittill("trigger",player);
		if(!isdefined(player.shocked))
		{
			player.shocked = true;
			player thread gas_death();
			wait 0.1;
		}
	}
}

gas_death()
{
	self ShellShock( "radiation_high", 5 );
	wait 7;
	self suicide();
}

trap6timer()
{
	level.trap6time = 3;
	for(i=3;i>0;i--)
	{
		level.trap6time--;
		wait 1;
	}
	level.smoketrig delete();
}

trap7()
{
	trig = getent("trap7trig","targetname");
	pillars = getentarray("pillars_trap7","targetname");
	trig waittill("trigger",player);
	for(i=0;i<pillars.size;i++)
		pillars[i] thread trap7moves();

}

trap7moves()
{
	orgpos = self.origin;
	for(;;)
	{
		range = RandomFloatRange(-208.0, 208.0);
		time = RandomFloatRange(2.0,5.0);
		self movez(range,time);
		wait time+2;
		self moveto(orgpos,time/2);
		wait time+2;
	}
}

trap8()
{
	flor = getent("flortrap8","targetname");
	c4model = getent("c4model","targetname");
	trig = getent("trap8trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	flor delete();
	RadiusDamage( c4model.origin, 80, 200, 50 );
	PlayFX(level._effect["c4_exp"],c4model.origin);
	c4model PlaySound("detpack_explo_default");
	c4model delete();
}

roomselection()
{
	trig = getent("roomselection","targetname");
	tp = getent("tpselection","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setorigin(tp.origin);
		player setplayerangles(tp.angles);
		
		while(isdefined(player) && isalive(player) && player.sessionstate == "playing")
			wait 0.1;
	}
}

kniferoom()
{
	trig = getent("kniferoom_trig","targetname");
	actipos = getent("knife_acti","targetname");
	jumperpos = getent("knife_jumper","targetname");
	for(;;)
	{
		trig waittill("trigger",player);

		player setOrigin(jumperpos.origin);
		player setplayerangles(jumperpos.angles);

		level.activ setOrigin(actipos.origin);
		level.activ setplayerangles(actipos.angles);

		player freezeControls(true);
		player takeallweapons();
		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");

		level.activ freezeControls(true);
		level.activ takeallweapons();
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		wait 3;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

bounceroom()
{
	trig = getent("bounceroom_trig","targetname");
	actipos = getent("bounce_acti","targetname");
	jumperpos = getent("bounce_jumper","targetname");
	thread bounceroom_failtrigger();
	thread bounceroom_sniper();
	for(;;)
	{
		trig waittill("trigger",player);

		player setOrigin(jumperpos.origin);
		player setplayerangles(jumperpos.angles);

		level.activ setOrigin(actipos.origin);
		level.activ setplayerangles(actipos.angles);

		player freezeControls(true);
		player takeallweapons();
		player giveweapon("knife_mp");
		player switchtoweapon("knife_mp");

		level.activ freezeControls(true);
		level.activ takeallweapons();
		level.activ giveweapon("knife_mp");
		level.activ switchtoweapon("knife_mp");

		wait 3;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

bounceroom_failtrigger()
{
	trig = getent("bounceroom_failtrigger","targetname");
	actipos = getent("bounce_acti","targetname");
	jumperpos = getent("bounce_jumper","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{
			player setOrigin(jumperpos.origin);
			player setplayerangles(jumperpos.angles);
		}
		if(player == level.activ)
		{
			level.activ setOrigin(actipos.origin);
			level.activ setplayerangles(actipos.angles);
		}
		wait 0.1;
	}

}

bounceroom_sniper()
{
	trig = getent("bounceroom_sniper","targetname");
	killplayer_spot = getent("hastobekilled","targetname");
	killer = getent("killerspot","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player giveweapon("remington700_mp");
		player givemaxammo("remington700_mp");
		player switchtoweapon("remington700_mp");

		if(player == player)
		{
			player setOrigin(killer.origin);
			player setplayerangles(killer.angles);
			level.activ setOrigin(killplayer_spot.origin);
			level.activ setplayerangles(killplayer_spot.angles);
			level.activ freezeControls(true);
		}
		if(player == level.activ)
		{
			player setOrigin(killplayer_spot.origin);
			player setplayerangles(killplayer_spot.angles);
			level.activ setOrigin(killer.origin);
			level.activ setplayerangles(killer.angles);
			player freezeControls(true);
		}
		wait 0.1;
	}
}

sniperroom()
{
	trig = getent("sniperroom_trig","targetname");
	actipos = getent("sniper_acti","targetname");
	jumperpos = getent("sniper_jumper","targetname");
	for(;;)
	{
		trig waittill("trigger",player);

		player setOrigin(jumperpos.origin);
		player setplayerangles(jumperpos.angles);

		level.activ setOrigin(actipos.origin);
		level.activ setplayerangles(actipos.angles);

		player freezeControls(true);
		player takeallweapons();
		player giveweapon("remington700_mp");
		player switchtoweapon("remington700_mp");
		player giveweapon("m40a1_mp");
		player givemaxammo("remington700_mp");
		player givemaxammo("m40a1_mp");

		level.activ freezeControls(true);
		level.activ takeallweapons();
		level.activ giveweapon("remington700_mp");
		level.activ switchtoweapon("remington700_mp");
		level.activ giveweapon("m40a1_mp");
		level.activ givemaxammo("remington700_mp");
		level.activ givemaxammo("m40a1_mp");

		wait 3;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}

shotgunroom()
{
	trig = getent("shotgunroom_trig","targetname");
	actipos = getent("shotgun_acti","targetname");
	jumperpos = getent("shotgun_jumper","targetname");
	for(;;)
	{
		trig waittill("trigger",player);

		player setOrigin(jumperpos.origin);
		player setplayerangles(jumperpos.angles);

		level.activ setOrigin(actipos.origin);
		level.activ setplayerangles(actipos.angles);

		player freezeControls(true);
		player takeallweapons();
		player giveweapon("winchester1200_mp");
		player switchtoweapon("winchester1200_mp");
		player givemaxammo("winchester1200_mp");

		level.activ freezeControls(true);
		level.activ takeallweapons();
		level.activ giveweapon("winchester1200_mp");
		level.activ switchtoweapon("winchester1200_mp");
		level.activ givemaxammo("winchester1200_mp");

		wait 3;

		player freezeControls(false);
		level.activ freezeControls(false);
	}
}