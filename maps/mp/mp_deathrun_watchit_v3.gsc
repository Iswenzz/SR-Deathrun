main()
{
	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_watchit_v3");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","3000");
	setDvar( "scr_jumpers_speed", 1 );

	level.rotator = getEnt( "rotator", "targetname" );
	level.rotator_trig = getEnt( "t1", "targetname" );
	level.rotator_clip = getEnt( "rotatorclip", "targetname" );

	level.klinge1 = getEnt( "klinge1", "targetname" );
	level.klinge2 = getEnt( "klinge2", "targetname" );
	level.klinge3 = getEnt( "klinge3", "targetname" );
	level.klingen_trig = getEnt( "t2", "targetname" );
	level.klinge1_hurt1 = getEnt( "klinge1_hurt1", "targetname" );
	level.klinge1_hurt2 = getEnt( "klinge1_hurt2", "targetname" );
	level.klinge2_hurt1 = getEnt( "klinge2_hurt1", "targetname" );
	level.klinge2_hurt2 = getEnt( "klinge2_hurt2", "targetname" );
	level.klinge3_hurt1 = getEnt( "klinge3_hurt1", "targetname" );
	level.klinge3_hurt2 = getEnt( "klinge3_hurt2", "targetname" );

	level.spikes1 = getEnt( "spikes1", "targetname" );
	level.spikes1_hurt = getEnt( "spikes1_hurt", "targetname" );
	level.spikes1_trig = getEnt( "t3", "targetname" );
	level.spikes1_clip = getEnt( "spikes1_clip", "targetname" );

	level.loosing_ground = getEntArray( "ground1_part", "targetname" );
	level.loosing_ground_trig = getEnt( "t4", "targetname" );

	level.badwall1 = getEnt( "badwall1", "targetname" );
	level.badwall2 = getEnt( "badwall2", "targetname" );
	level.badwalls_trig = getEnt( "t5", "targetname" );
	level.badwalls_hurt = getEnt( "badwallshurt", "targetname" );
	level.badwalls_clip = getEnt( "badwall_clip", "targetname" );

	level.hatch1 = getEnt( "hatch", "targetname" );
	level.hatch1_trig = getEnt( "t6", "targetname" );

	level.pusher1 = getEnt( "pusher1", "targetname" );
	level.pusher2 = getEnt( "pusher2", "targetname" );
	level.pusher_trig = getEnt( "t7", "targetname" );

	level.hammer = getEnt( "hammer", "targetname" );
	level.hammer_trig = getEnt( "t8", "targetname" );
	level.hammer_hurt1 = getEnt( "hammerhurt1", "targetname" );
	level.hammer_hurt2 = getEnt( "hammerhurt2", "targetname" );

	level.hatch2 = getEnt( "hatch2", "targetname" );
	level.hatch2_trig = getEnt( "t9", "targetname" );

	level.killer = getEnt( "rotate_killer", "targetname" );
	level.killer_trig = getEnt( "t10", "targetname" );

	level.tunnel = getEnt( "tunnel", "targetname" );
	level.tunnel_trig = getEnt( "t11", "targetname" );

	level.spikes2 = getEnt( "spikes2", "targetname" );
	level.spikes2_hurt = getEnt( "spikes2_hurt", "targetname" );
	level.spikes2_trig = getEnt( "t12", "targetname" );

	level.spikes3 = getEnt( "spikes3", "targetname" );
	level.spikes3_hurt = getEnt( "spikes3_hurt", "targetname" );
	level.spikes3_trig = getEnt( "t13", "targetname" );

	level.door = getEnt( "door", "targetname" );
	level.door_trig = getEnt( "opendoor", "targetname" );

	thread rotator();
	thread klingen();
	thread goSpikes1();
	thread loosingGround();
	thread badWalls();
	thread hatch1();
	thread goPusher();
	thread rotateHammer();
	thread hatch2();
	thread killer();
	thread goTunnel();
	thread goSpikes2();
	thread goSpikes3();
	thread opendoor();
}

rotator()
{
	level.rotator_trig waittill( "trigger" );
	level.rotator_trig delete();
	for( i = 0; i < 4; i++ )
	{
		level.rotator RotatePitch( 360, 1 );
		wait 1;
		if(i==3) level.rotator.angles = (0,0,0);

	}
}

klingen()
{
	level.klinge1_hurt1 enablelinkto();
	level.klinge1_hurt2 enablelinkto();
	level.klinge2_hurt1 enablelinkto();
	level.klinge2_hurt2 enablelinkto();
	level.klinge3_hurt1 enablelinkto();
	level.klinge3_hurt2 enablelinkto();

	level.klinge1_hurt1 linkto(level.klinge1);
	level.klinge1_hurt2 linkto(level.klinge1);
	level.klinge2_hurt1 linkto(level.klinge2);
	level.klinge2_hurt2 linkto(level.klinge2);
	level.klinge3_hurt1 linkto(level.klinge3);
	level.klinge3_hurt2 linkto(level.klinge3);

	level.klingen_trig waittill( "trigger" );
	level.klingen_trig delete();
	for( ;; )
	{
		level.klinge1 RotatePitch( 360, 1.5 );
		level.klinge2 RotatePitch( -360, 1.5 );
		level.klinge3 RotatePitch( 360, 1.5);
		wait 1.5;
	}
}

goSpikes1()
{
	level.spikes1_hurt enablelinkto();
	level.spikes1_hurt linkto(level.spikes1);

	level.spikes1_trig waittill( "trigger" );
	level.spikes1_trig delete();
	level.spikes1_clip delete();

	level.spikes1 moveZ( 60, 0.7 );
	wait 3;
	level.spikes1 moveZ( -60, 1 );
}

loosingGround()
{
	level.loosing_ground_trig waittill("trigger");
	level.loosing_ground_trig delete();

	for(i=0; i<3; i++) 
		if( isDefined( level.loosing_ground[RandomInt(level.loosing_ground.size)] ) )	
			level.loosing_ground[RandomInt(level.loosing_ground.size)] delete();
}

badWalls()
{
	killtrigger = level.badwalls_hurt;
	killtrigger.origin = killtrigger.origin - (0,0,500);

	level.badwalls_trig waittill( "trigger" );
	level.badwalls_trig delete();
	brush1 = level.badwall1;
	brush2 = level.badwall2;

	level.badwalls_clip delete();

	startOrigin1 = brush1.origin;
	startOrigin2 = brush2.origin;
	moveOrigin1 = (-536, 64, -96);
	moveOrigin2 = (-428, 64, -96);

	brush1 moveTo( moveOrigin1, 1.5 );
	brush2 moveTo( moveOrigin2, 1.5 );
	wait 1;
	killtrigger.origin = killtrigger.origin + (0,0,500);
}

hatch1()
{
	level.hatch1_trig waittill( "trigger" );
	level.hatch1_trig delete();

	level.hatch1 RotatePitch( -90, 1 );
	wait 3;
	level.hatch1 RotatePitch( 90, 1 );
	wait 1;
	level.hatch1.angles = (0,0,0);
}

goPusher()
{
	level.pusher_trig waittill( "trigger" );
	level.pusher_trig delete();
	brush1 = level.pusher1;
	brush2 = level.pusher2;

	startOrigin1 = brush1.origin;
	startOrigin2 = brush2.origin;

	for(i=0;i<4;i++)
	{
		moveOrigin1 = (-488, 1112, 448);
		moveOrigin2 = (-488, 1112, 192);

		brush1 moveTo( moveOrigin1, 0.8 );
		brush2 moveTo( moveOrigin2, 0.8 );
		wait 1;
		brush1 moveTo( startOrigin1, 0.8 );
		brush2 moveTo( startOrigin2, 0.8 );
	}
}

rotateHammer()
{
	level.hammer_hurt1 enablelinkto();
	level.hammer_hurt1 linkto(level.hammer);
	level.hammer_hurt2 enablelinkto();
	level.hammer_hurt2 linkto(level.hammer);

	level.hammer_trig waittill( "trigger" );
	level.hammer_trig delete();
	for( i = 0; i < 4; i++ )
	{
		level.hammer RotateYaw( 360, 1 );
		wait 1;

		if(i==3) level.hammer.angles = (0,0,0);
	}
}

hatch2()
{
	level.hatch2_trig waittill( "trigger" );
	level.hatch2_trig delete();

	level.hatch2 RotatePitch( 90, 1 );
	wait 3;
	level.hatch2 RotatePitch( -90, 1 );
	wait 1;
	level.hatch2.angles = (0,0,0);
}

killer()
{
	level.killer_trig waittill( "trigger" );
	level.killer_trig delete();

	for( i = 0; i < 4; i++ )
	{
		level.killer RotateYaw( -360, 1 );
		wait 1;
		if(i==3) level.killer.angles = (0,0,0);
	}
}

goTunnel()
{
	level.tunnel_trig waittill( "trigger" );
	level.tunnel_trig delete();
	brush = level.tunnel;

	startOrigin = brush.origin;
	moveOrigin = (32, -400, 504);

	brush moveTo( moveOrigin, 0.8 );
	wait 3;
	brush moveTo( startOrigin, 0.8 );
}

goSpikes2()
{
	level.spikes2_hurt enablelinkto();
	level.spikes2_hurt linkto(level.spikes2);

	level.spikes2_trig waittill( "trigger" );
	level.spikes2_trig delete();

	level.spikes2 moveZ( 60, 0.7 );
	wait 3;
	level.spikes2 moveZ( -60, 1 );
}

goSpikes3()
{
	level.spikes3_hurt enablelinkto();
	level.spikes3_hurt linkto(level.spikes3);

	level.spikes3_trig waittill( "trigger" );
	level.spikes3_trig delete();

	level.spikes3 moveZ( -320, 1.25 );
	wait 2;
	level.spikes3 moveZ( 250, 2 );
}

opendoor()
{
	level.door_trig waittill( "trigger" );
	level.door_trig delete();
	brush = level.door;

	brush moveZ( -120, 5 );
}