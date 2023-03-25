/*
*****************************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************************
******                                                                                                                                                                                                                             ******
******      [[[[                                                                     ]]]]                                                                                                                                          ******
******      [[                                                                         ]]                                                                                                                                          ******
******      [[   NN          NN         OOOO         VV          VV         AA         ]]     MM          MM         OOOO        UU        UU     SSSSSS     TTTTTTTTTT         AA              CCCC   HH     HH   EEEEEEE         ******
******      [[   NNNN        NN      OO      OO       VV        VV         AAAA        ]]     MMMM      MMMM      OO      OO     UU        UU   SS      SS       TT            AAAA           CC       HH     HH   EE              ******
******      [[   NN  NN      NN    OO          OO      VV      VV         AA  AA       ]]     MM  MM  MM  MM    OO          OO   UU        UU   SS               TT           AA  AA        CC         HH     HH   EE              ******
******      [[   NN    NN    NN   OO            OO      VV    VV         AA    AA      ]]     MM    MM    MM   OO            OO  UU        UU     SSSSSS         TT          AA    AA      CC          HHHHHHHHH   EEEEEE          ******
******      [[   NN      NN  NN    OO          OO        VV  VV         AAAAAAAAAA     ]]     MM          MM    OO          OO   UU        UU           SS       TT         AAAAAAAAAA      CC         HH     HH   EE              ******
******      [[   NN        NNNN      OO      OO           VVVV         AA        AA    ]]     MM          MM      OO      OO       UU    UU     SS      SS       TT        AA        AA       CC       HH     HH   EE              ******
******      [[   NN          NN         OOOO               VV         AA          AA   ]]     MM          MM         OOOO            UUUU  UU     SSSSSS         TT       AA          AA        CCCC   HH     HH   EEEEEEE         ******
******      [[                                                                         ]]                                                                                                                                          ******
******      [[[[                                                                     ]]]]                                                                                                                                          ******
******                                                                                                                                                                                                                             ******
*****************************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************************
*****************************************************************************************************************************************************************************************************************************************

This map is made by [Nova]Moustache.
Xfire: snor1991
Website: www.novacrew.eu
*/

main()
{
	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	level.spin_time = getDvarInt( "scr_timelimit" );
	if( !isDefined( level.spin_time ) || ( isDefined( level.spin_time ) && level.spin_time < 1 ) )
		level.spin_time = 5;

	level.trapsDisabledMessage = false;
	level.all_vs_activator = false;
	level.pre_spawn_allow = false;

	level.spawn_battle = getEntArray( "mp_spawn_battle", "classname" );
	level.pre_spawn_battle = getEntArray( "mp_pre_spawn_battle", "classname" );
	level.spawns_final = getEntArray( "mp_jumper_spawn_final", "classname" );

	level._effect[ "blood" ] = loadfx( "impacts/flesh_hit_knife" );
	level._effect[ "trap4" ] = loadfx( "deathrun_plane" );
	level._effect[ "trap4_player_burn" ] = loadfx( "deathrun_player" );

	precacheItem( "mp_deathrun_moustache_kar98_mp" );

	level thread setupMapFinish();
	level thread setupFinalFight();

	level thread setupServers();

	level thread setupElevator1();
	level thread setupEscalator1();
	level thread setupHoverBeamLights();
	level thread setupHoverBeam();
	level thread setupNoobPath();

	level thread setupTriggerJumpers();

	level thread setupTriggerFlesh1();
	level thread setupTriggerFlesh2();
	level thread setupTriggerTouch1();
	level thread setupTriggerTouch2();

	level thread setupTrap1();
	level thread setupTrap2();
	level thread setupTrap3();
	level thread setupTrap4();
	level thread setupTrap5();
	level thread setupTrap6();
	level thread setupTrap7();
}

setupMapFinish()
{
	level.jumpers_finished = 0;
	level.jumper_first = undefined;
	level.jumper_second = undefined;
	level.jumper_third = undefined;

	level thread countUntilOpen();

	walk_trough = getEntArray( "finish_map", "targetname" );

	for( i = 0; i < walk_trough.size; i++ )
		walk_trough[i] thread checkWalkTrough();
}

checkWalkTrough()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	while(1)
	{
		self waittill( "trigger", player );

		if( !isDefined( player.finished_map ) || ( isDefined( player.finished_map ) && !player.finished_map ) )
			player finishedMap();

		wait 0.05;
	}
}

countUntilOpen()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	level waittill( "game started" );
	level.final_count = 0;

	while(1)
	{
		level.final_count++;
		wait 1;
	}
}

setupFinalFight()
{
	level.finalists = 0;
	level.finalist_first = undefined;
	level.finalist_second = undefined;
	level.finalist_third = undefined;

	for( i = 0; i < level.spawn_battle.size; i++ )
		level.spawn_battle[i] placeSpawnPoint();
	for( i = 0; i < level.pre_spawn_battle.size; i++ )
		level.pre_spawn_battle[i] placeSpawnPoint();
	for( i = 0; i < level.spawns_final.size; i++ )
		level.spawns_final[i] placeSpawnPoint();

	for( i = 1; i < 9; i++ )
	{
		level.final_rock_corners[i] = getEnt( "final_rock_" + i, "targetname" );
		level.final_rock_corners[i] hide();
	}

	level.bullet_block = getEnt( "battle_ttt_blocker", "targetname" );
	level.wall_blocker = getEnt( "wall_blocker", "targetname" );
	level.final_rocks = getEntArray( "final_rock", "targetname" );
	level.final_aim_area = getEntArray( "battle_aim_area", "targetname" );

	level.bullet_block hide();
	level.bullet_block notSolid();
	level.wall_blocker hide();
	level.wall_blocker notSolid();

	for( i = 0; i < level.final_rocks.size; i++ )
		level.final_rocks[i] hide();
	for( i = 0; i < level.final_aim_area.size; i++ )
	{
		level.final_aim_area[i] hide();
		level.final_aim_area[i] notSolid();
	}

	level.final_aim_obj[0] = [];
	level.final_aim_obj[1] = [];

	for( i = 1; i < 7; i++ )
	{
		level.final_aim_obj[0][i] = getEnt( "battle_aim_0_obj_" + i, "targetname" );
		level.final_aim_obj[1][i] = getEnt( "battle_aim_1_obj_" + i, "targetname" );
	}

	level.final_aim_ang_hitme_0 = level.final_aim_obj[0][1].angles;
	level.final_aim_ang_hitme_1 = level.final_aim_obj[1][1].angles;
	level.final_aim_ang_norm_0 = level.final_aim_obj[0][1].angles - ( 80, 0, 0 );
	level.final_aim_ang_norm_1 = level.final_aim_obj[1][1].angles + ( 80, 0, 0 );

	level.final_aim_lights = [];
	level.final_aim_lights[0] = getEntArray( "battle_aim_0_lights_6", "targetname" );
	level.final_aim_lights[1] = getEntArray( "battle_aim_1_lights_6", "targetname" );

	for( i = 0; i < level.final_aim_lights[0].size; i++ )
	{
		level.final_aim_lights[0][i] linkTo( level.final_aim_obj[0][6] );
		level.final_aim_lights[1][i] linkTo( level.final_aim_obj[1][6] );
	}

	level.final_aim_bottles = [];
	level.final_aim_bottles[0] = [];
	level.final_aim_bottles[1] = [];

	for( i = 0; i < 8; i++ )
	{
		level.final_aim_bottles[0][i] = getEnt( "battle_aim_0_obj_6_" + i, "targetname" );
		level.final_aim_bottles[1][i] = getEnt( "battle_aim_1_obj_6_" + i, "targetname" );

		level.final_aim_bottles[0][i] linkTo( level.final_aim_obj[0][6] );
		level.final_aim_bottles[1][i] linkTo( level.final_aim_obj[1][6] );
	}

	for( i = 1; i < 7; i++ )
	{
		level.final_aim_obj[0][i].angles = level.final_aim_ang_norm_0;
		level.final_aim_obj[1][i].angles = level.final_aim_ang_norm_1;
	}

	level.normal_activate = getEnt( "battle_finish_normal", "targetname" );
	level.snip_activate = getEnt( "battle_finish_sniper", "targetname" );
	level.ttt_activate = getEnt( "battle_finish_ttt", "targetname" );
	level.rps_activate = getEnt( "battle_finish_rps", "targetname" );
	level.aim_activate = getEnt( "battle_finish_aim", "targetname" );

	level.ttt_activate setHintString( "This end game can only by played on the ^2NovaCrew Deathrun ^7server ^1Press [Use]" );
	level.rps_activate setHintString( "This end game can only by played on the ^2NovaCrew Deathrun ^7server ^1Press [Use]" );

	level.ttt_activate thread novaServerOnly();
	level.rps_activate thread novaServerOnly();
	level.aim_activate thread novaServerOnly();

	if( !isDefined( level.freeRun ) )
		wait 0.1;

	if( isDefined( level.freeRun ) && level.freeRun )
	{
		level.snip_activate setHintString( "^1No end game ^7in a free run round" );
		level.normal_activate delete();

		return;
	}

	level.normal_activate thread waitOnTriggerNormal();
	level.snip_activate thread waitOnTriggerSnip();

	level.sniper_model = getEntArray( "battle_sniper", "targetname" );

	for( i = 0; i < level.sniper_model.size; i++ )
		level.sniper_model[i] rotateYaw( level.spin_time * 720, level.spin_time * 60, 0 ,0 );
}

novaServerOnly()
{
	while(1)
	{
		self waittill( "trigger", player );
		player onButtonPressed();
	}
}

onButtonPressed()
{
	level endon( "game over" );

	self notify( "button_check" );
	wait 0.05;

	self endon( "button_check" );
	self endon( "disconnect" );
	self endon( "death" );

	self iPrintLnBold( "This final battle only works on\nthe ^2NovaCrew Deathrun ^7server" );
	self iPrintLnBold( "Press ^1[{+activate}] ^7and ^1[{+melee}]\n^7to join the NovaCrew server" );
	self iPrintLnBold( "If the server is not workin visit www.novacrew.eu" );

	while( !self useButtonPressed() || !self meleeButtonPressed() )
		wait 0.05;

	while( self useButtonPressed() && self meleeButtonPressed() )
		wait 0.05;

	// self setClientDvar( "clientcmd", "disconnect; wait 50; connect cod4.novacrew.nl:30081" );
	// self openMenu( "clientcmd" );
}

waitOnTriggerNormal()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );
	level endon( "stop_normal" );
	self waittill( "trigger", player );

	self thread triggerActivated( player, 0 );

	level notify( "stop_snip" );

	self setHintString( "The special end games are ^1disabled" );
	level.snip_activate setHintString( "The special end games are ^1disabled" );
}

waitOnTriggerSnip()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );
	level endon( "stop_snip" );
	self waittill( "trigger", player );

	self thread triggerActivated( player, 1 );

	level notify( "stop_normal" );

	level.snip_activate setHintString( "Press [Use] to ^2join the Sniper Battle" );

	level.sniper_model[0] delete();
}

triggerActivated( player, sniper )
{
	level endon( "game over" );

	level.finalist_first = player;
	level.finalists = 1;

	if( sniper )
	{
		level thread cleanFinalRoom();
		level thread createFinalRoomOneTime( player );
	}

	while(1)
	{
		self waittill( "trigger", player );

		if( !isDefined( player.finalist ) || ( isDefined( player.finalist ) && !player.finalist ) )
		{
			player.finalist = true;
			level.finalists++;

			if( level.finalists == 2 )
			{
				level.finalist_second = player;

				if( sniper )
				{
					player doPreSpawn( 1 );

					level.sniper_model[1] delete();
				}
			}
			else if( level.finalists == 3 )
			{
				level.finalist_third = player;

				if( sniper )
				{
					player doPreSpawn( 0 );

					level.sniper_model[2] delete();
					level.snip_activate setHintString( "Press [Use] to ^2play All Jumpers ^7VS ^1Activator" );
				}
			}
			else if( level.finalists > 3 )
			{
				level.all_vs_activator = true;

				if( !sniper )
					level thread vsActivatorAll();

				break;
			}
		}
	}
}

doPreSpawn( spawn_num )
{
	level endon( "game over" );

	if( !level.pre_spawn_allow )
		level waittill( "allow_pre_spawn" );

	spawnPoint = level.pre_spawn_battle[ spawn_num ];
	self spawn( spawnPoint.origin, spawnPoint.angles );

	self iPrintLnBold( "Wait here and enjoy the fight" );

	self notify( "kill afk monitor" );
}

finishedMap()
{
	level endon( "game over" );

	level.jumpers_finished++;
	self.finished_map = true;

	if( level.jumpers_finished == 1 )
	{
		level.jumper_first = self;
		iPrintLnBold( "^1>> ^2First Place ^1<<" );
		iPrintLnBold( "^1" + self.name + "^7 completed the level in ^2" + level.final_count + " ^7seconds" );
	}
	else if( level.jumpers_finished == 2 )
	{
		level.jumper_second = self;
		iPrintLnBold( "^1>> ^2Second Place ^1<<" );
		iPrintLnBold( "^1" + self.name + "^7 completed the level in ^2" + level.final_count + " ^7seconds" );
	}
	else if( level.jumpers_finished == 3 )
	{
		level.jumper_third = self;
		iPrintLnBold( "^1>> ^2Third Place ^1<<" );
		iPrintLnBold( "^1" + self.name + "^7 completed the level in ^2" + level.final_count + " ^7seconds" );
	}
	else
	{
		self iPrintLnBold( "^1>> ^2Place " + level.jumpers_finished + " ^1<<" );
		self iPrintLnBold( "^1" + self.name + "^7 completed the level in ^2" + level.final_count + " ^7seconds" );
		iPrintLn( "^1>> ^2Place " + level.jumpers_finished + " ^1<<" );
		iPrintLn( "^1" + self.name + "^7 completed the level in ^2" + level.final_count + " ^7seconds" );
	}
}

cleanFinalRoom()
{
	level endon( "game over" );
	level endon( "final_room_created" );

	level.final_room_kill = getEnt( "end_room_kill", "targetname" );

	while(1)
	{
		level.final_room_kill waittill( "trigger", player );

		player suicide();
		player iPrintLnBold( "The final room has been cleaned" );
	}
}

createFinalRoomOneTime( player )
{
	level.wall_blocker show();
	level.wall_blocker solid();

	part1 = getEnt( "end_room_1", "targetname" );
	part2 = getEnt( "end_room_2", "targetname" );
	part3 = getEnt( "end_room_3", "targetname" );

	part1 thread moveAndCheck( (0,0,736), 5 );
	part2 thread moveAndCheck( (976,0,0), 5 );
	part3 thread moveAndCheck( (-32,-112,-76), 5 );

	if( randomIntRange( 0, 101 ) > 50 )
	{
		spawnPoint = level.pre_spawn_battle[0];
		player spawn( spawnPoint.origin, spawnPoint.angles );

		spawnPoint = level.pre_spawn_battle[1];
		level.activ spawn( spawnPoint.origin, spawnPoint.angles );
	}
	else
	{
		spawnPoint = level.pre_spawn_battle[1];
		player spawn( spawnPoint.origin, spawnPoint.angles );

		spawnPoint = level.pre_spawn_battle[0];
		level.activ spawn( spawnPoint.origin, spawnPoint.angles );
	}

	iPrintLnBold( " " );
	iPrintLnBold( "^1>> ^2Creating Final Room^1<<" );

	time = 3;

	for( i = 1; i < 9; i++ )
	{
		level.final_rock_corners[i] show();
		level.final_rock_corners[i] moveTo( ( level.final_rock_corners[i].origin[0], level.final_rock_corners[i].origin[1], -608 ), time );
	}

	num1 = int( level.final_rock_corners[1].origin[0] );
	num2 = int( level.final_rock_corners[4].origin[0] );
	num3 = int( level.final_rock_corners[5].origin[0] );
	num4 = int( level.final_rock_corners[8].origin[0] );
	num5 = int( level.final_rock_corners[4].origin[1] );
	num6 = int( level.final_rock_corners[1].origin[1] );

	for( i = 0; i < level.final_rocks.size; i++ )
	{
		if( i % 2 == 0 )
			x_pos = randomIntRange( num1, num2 + 1 );
		else
			x_pos = randomIntRange( num3, num4 + 1 );

		y_pos = randomIntRange( num5, num6 + 1 );

		if( i % 5 == 0 )
		{
			level.final_rocks[i].origin = ( x_pos, y_pos, level.final_rocks[i].origin[2] );
			level.final_rocks[i] show();
			level.final_rocks[i] moveTo( ( x_pos, y_pos, -544 ), time );

			level.final_rocks[i] rotateVelocity( ( randomIntRange( -5, 6 ) * 90, randomIntRange( -5, 6 ) * 90, randomIntRange( -5, 6 ) * 90 ), time );

			i++;
		}

		level.final_rocks[i].origin = ( x_pos, y_pos, level.final_rocks[i].origin[2] );
		level.final_rocks[i] show();
		level.final_rocks[i] moveTo( ( x_pos, y_pos, -608 ), time );

		level.final_rocks[i] rotateVelocity( ( randomIntRange( -5, 6 ) * 90, randomIntRange( -5, 6 ) * 90, randomIntRange( -5, 6 ) * 90 ), time );

		wait 0.2;
	}

	j = 3;
	while( j > 0 )
	{
		player iPrintLn( "^1Teleporting ^7to ^2Final Room ^7in ^1" + j + " seconds" );
		level.activ iPrintLn( "^1Teleporting ^7to ^2Final Room ^7in ^1" + j + " seconds" );

		j--;

		wait 1;
	}

	level notify( "final_room_created" );
	level.final_room_kill delete();

	level thread playersInRoom( player );
}

playersInRoom( player )
{
	level endon( "game over" );

	player notify( "kill afk monitor" );
	level.activ notify( "kill afk monitor" );

	if( isDefined( player.slow_noob ) && player.slow_noob )
	{
		player.slow_noob = false;

		if( isDefined( level.dvar["allies_speed"] ) )
			player setMoveSpeedScale( level.dvar["allies_speed"] );
		else
			player setMoveSpeedScale( 1 );
	}

	if( isDefined( self.weaponsDisabled ) && self.weaponsDisabled )
		self.weaponsDisabled = false;

	if( randomIntRange( 0, 101 ) > 50 )
	{
		spawnPoint = level.spawn_battle[0];
		player spawn( spawnPoint.origin, spawnPoint.angles );

		spawnPoint = level.spawn_battle[1];
		level.activ spawn( spawnPoint.origin, spawnPoint.angles );
	}
	else
	{
		spawnPoint = level.spawn_battle[1];
		player spawn( spawnPoint.origin, spawnPoint.angles );

		spawnPoint = level.spawn_battle[0];
		level.activ spawn( spawnPoint.origin, spawnPoint.angles );
	}

	if( !level.pre_spawn_allow )
	{
		level.pre_spawn_allow = true;
		level notify( "allow_pre_spawn" );
	}

	player takeAllWeapons();
	level.activ takeAllWeapons();

	player allowJump( false );
	player freezeControls( true );
	level.activ allowJump( false );
	level.activ freezeControls( true );

	player disableWeapons();
	player giveWeapon( "mp_deathrun_moustache_kar98_mp" );
	player giveMaxAmmo( "mp_deathrun_moustache_kar98_mp" );
	player setSpawnWeapon( "mp_deathrun_moustache_kar98_mp" );
	level.activ disableWeapons();
	level.activ giveWeapon( "mp_deathrun_moustache_kar98_mp" );
	level.activ giveMaxAmmo( "mp_deathrun_moustache_kar98_mp" );
	level.activ setSpawnWeapon( "mp_deathrun_moustache_kar98_mp" );

	player iPrintLnBold( "^1>> 3 ^1<<" );
	level.activ iPrintLnBold( "^1>> 3 ^1<<" );
	wait 1;
	player iPrintLnBold( "^1>> ^32 ^1<<" );
	level.activ iPrintLnBold( "^1>> ^42 ^1<<" );
	wait 1;
	player iPrintLnBold( "^1>> ^21 ^1<<" );
	level.activ iPrintLnBold( "^1>> ^21 ^1<<" );
	wait 1;
	player iPrintLnBold( "^1>> ^2Start ^1<<" );
	level.activ iPrintLnBold( "^1>> ^2Start ^1<<" );

	player enableWeapons();
	player allowJump( true );
	player freezeControls( false );
	level.activ enableWeapons();
	level.activ allowJump( true );
	level.activ freezeControls( false );

	player common_scripts\utility::waittill_any( "death", "disconnect", "joined_spectators", "spawned" );

	if( !isAlive( level.activ ) )
		return;
	else if( level.all_vs_activator && ( !isDefined( level.finalist_first ) || ( isDefined( level.finalist_first ) && !isAlive( level.finalist_first ) ) ) && ( !isDefined( level.finalist_second ) || ( isDefined( level.finalist_second ) && !isAlive( level.finalist_second ) ) ) && ( !isDefined( level.finalist_third ) || ( isDefined( level.finalist_third ) && !isAlive( level.finalist_third ) ) ) )
		level thread vsActivatorAll();
	else if( isDefined( level.finalist_second ) && isAlive( level.finalist_second ) )
		level thread playersInRoom( level.finalist_second );
	else if( isDefined( level.finalist_third ) && isAlive( level.finalist_third ) )
		level thread playersInRoom( level.finalist_third );
	else if( isDefined( level.finalist_first ) && isDefined( level.jumper_first ) && level.finalist_first != level.jumper_first && isAlive( level.jumper_first ) )
	{
		level.finalists++;
		level thread playersInRoom( level.jumper_first );
	}
	else if( isDefined( level.finalist_second ) && isDefined( level.jumper_second ) && level.finalist_second != level.jumper_second && isAlive( level.jumper_second ) )
	{
		level.finalists++;
		level thread playersInRoom( level.jumper_second );
		level.finalist_second = level.jumper_second;
	}
	else if( isDefined( level.finalist_third ) && isDefined( level.jumper_third ) && level.finalist_third != level.jumper_third && isAlive( level.jumper_third ) )
	{
		level.finalists++;
		level thread playersInRoom( level.jumper_third );
		level.finalist_third = level.jumper_third;
	}
	else if( !isDefined( level.finalist_second ) )
	{
		level.finalist_second = getRandomJumperPlayers();

		if( isDefined( level.finalist_second ) && isAlive( level.finalist_second ) )
		{
			level.finalists++;
			level thread playersInRoom( level.finalist_second );
		}
	}
	else if( !isDefined( level.finalist_third ) )
	{
		level.finalist_third = getRandomJumperPlayers();

		if( isDefined( level.finalist_third ) && isAlive( level.finalist_third ) )
		{
			level.finalists++;
			level thread playersInRoom( level.finalist_third );
		}
	}
}

moveAndCheck( orig, time )
{
	target = self.origin + orig;
	self moveTo( target, time );

	wait time;
	if( self.origin != target )
		self.origin = target;
}

getRandomJumperPlayers()
{
	level endon( "game over" );

	aliveJumpers = [];

	players = getEntArray( "player", "classname" );
	for( i = 0; i < players.size; i++ )
	{
		player = players[i];

		if ( !isDefined( player ) || !isAlive( player ) || player.pers["team"] != "allies" )
			continue;

		aliveJumpers[ aliveJumpers.size ] = player;
	}

	if( aliveJumpers.size > 0 )
	{
		randomJumper = aliveJumpers[ randomInt( aliveJumpers.size ) ];

		iPrintLnBold( randomJumper.name + " is randomly picked as finalist" );

		return randomJumper;
	}
}

vsActivatorAll()
{
	level endon( "game over" );
	level notify( "all_vs_activator" );

	part1 = getEnt( "end_room_close", "targetname" );
	part2 = getEnt( "end_room_2", "targetname" );
	part3 = getEnt( "end_room_3", "targetname" );

	part1 thread moveAndCheck( (0,0,208), 3 );
	part2 thread moveAndCheck( (0,0,-736), 3 );
	part3 thread moveAndCheck( (32,112,76), 3 );

	iPrintLnBold( "This is taking to long" );
	iPrintLnBold( "^1>> ^2All jumpers ^7VS ^1Activator ^1<<" );

	players = getEntArray( "player", "classname" );
	for( i = 0; i < players.size; i++ )
	{
		if( !isAlive( players[i] ) )
			continue;

		if( players[i] != level.activ )
		{
			spawnPoint = level.spawns_final[ players[i] GetEntityNumber() ];

			if( !isDefined( spawnPoint ) )
				spawnPoint = level.spawns_final[ randomInt( level.spawns_final.size ) ];

			players[i] spawn( spawnPoint.origin, spawnPoint.angles );

			if( isDefined( players[i].slow_noob ) && players[i].slow_noob )
			{
				players[i].slow_noob = false;

				if( isDefined( level.dvar["allies_speed"] ) )
					players[i] setMoveSpeedScale( level.dvar["allies_speed"] );
				else
					players[i] setMoveSpeedScale( 1 );
			}

			if( isDefined( self.weaponsDisabled ) && self.weaponsDisabled )
				self.weaponsDisabled = false;
		}
		else if( players[i] == level.activ )
		{
			spawnPoint = level.spawn_battle[1];
			players[i] spawn( spawnPoint.origin, spawnPoint.angles );
		}

		players[i] takeAllWeapons();
		players[i] allowJump( false );
		players[i] freezeControls( true );

		players[i] giveWeapon( "knife_mp" );
		players[i] setSpawnWeapon( "knife_mp" );
	}

	wait 1;

	iPrintLnBold( "^1>> 3 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^32 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^21 ^1<<" );
	wait 1;
	iPrintLnBold( "^1>> ^2Start ^1<<" );

	players = getEntArray( "player", "classname" );
	for( i = 0; i < players.size; i++ )
	{
		if( !isAlive( players[i] ) )
			continue;

		players[i] allowJump( true );
		players[i] freezeControls( false );
	}
}

setupServers()
{
	serv_sniper = getEnt( "server_sniper", "targetname" );
	serv_sd1 = getEnt( "server_sd1", "targetname" );
	serv_sd2 = getEnt( "server_sd2", "targetname" );
	serv_tdm = getEnt( "server_tdm", "targetname" );
	serv_hc = getEnt( "server_hc", "targetname" );

	serv_sniper thread serverTrigger( "cod4.novacrew.nl:28961", "PromodLive ^1Sniper ^5Fun" );
	serv_sd1 thread serverTrigger( "cod4.novacrew.nl:28965", "PromodLive ^7SD ^3#1" );
	serv_sd2 thread serverTrigger( "cod4.novacrew.nl:29181", "PromodLive ^7SD ^3#2" );
	serv_tdm thread serverTrigger( "cod4.novacrew.nl:29881", "PromodLive ^7TDM" );
	serv_hc thread serverTrigger( "cod4.novacrew.nl:28960", "HardCore ^1Sniper ^5Fun" );
}

serverTrigger( ip, name )
{
	level endon( "game over" );

	while(1)
	{
		self waittill( "trigger", player );

		if( !isDefined( player.server_name ) || player.server_name != name  )
		{
			player notify( "change_server" );
			wait 0.05;

			player.server_name = name;
			player thread serverMessage( ip, name );
		}
		else
			player notify( "server_choice" );

		wait 0.05;
	}
}

serverMessage( ip, name )
{
	level endon( "game over" );
	self endon( "disconnect" );
	self endon( "change_server" );

	self iPrintLnBold( "If you want to join the\n^2NovaCrew ^3" + name + " ^7Server shoot it 2 times" );

	while(1)
	{
		self waittill( "server_choice" );

		self iPrintLnBold( "Shoot it once more to join the\n^2NovaCrew ^3" + name + " ^7Server" );
		self iPrintLn( "Thanks to ^2[Nova]DuTchBlooD ^7for making the picture" );

		self waittill( "server_choice" );

		// self setClientDvar( "clientcmd", "disconnect; wait 50; connect " + ip );
		// self openMenu( "clientcmd" );

		iPrintLn( "^1" + self.name + " ^7joined the ^2NovaCrew ^3" + name + " ^7Server" );
	}
}

setupElevator1()
{
	level.elevator_time = 3;
	level thread speedElevator1();

	part1 = getEnt( "elevator_1_1", "targetname" );
	part2 = getEnt( "elevator_1_2", "targetname" );
	part3 = getEnt( "elevator_1_3", "targetname" );
	part4 = getEnt( "elevator_1_4", "targetname" );

	pos[0] = part1.origin;
	pos[1] = ( part1.origin[0], ( part1.origin[1] + part2.origin[1] ) / 2, ( part1.origin[2] + part2.origin[2] ) / 2 - 25 );
	pos[2] = part2.origin;
	pos[3] = ( part1.origin[0], ( part2.origin[1] + part3.origin[1] ) / 2, ( part2.origin[2] + part3.origin[2] ) / 2 + 25 );
	pos[4] = part3.origin;
	pos[5] = ( part1.origin[0], ( part3.origin[1] + part4.origin[1] ) / 2, ( part3.origin[2] + part4.origin[2] ) / 2 + 25 );
	pos[6] = part4.origin;
	pos[7] = ( part1.origin[0], ( part4.origin[1] + part1.origin[1] ) / 2, ( part4.origin[2] + part1.origin[2] ) / 2 - 25 );

	while(1)
	{
		for( i = 0; i < pos.size; i++ )
		{
			j = i + 2;
			k = i + 4;
			l = i + 6;

			if( l == pos.size + 6 )
			{
				l = 6;
				k = 4;
				j = 2;
			}
			else if( l == pos.size + 5 )
			{
				l = 5;
				k = 3;
				j = 1;
			}
			else if( l == pos.size + 4 )
			{
				l = 4;
				k = 2;
				j = 0;
			}
			else if( l == pos.size + 3 )
			{
				l = 3;
				k = 1;
			}
			else if( l == pos.size + 2 )
			{
				l = 2;
				k = 0;
			}
			else if( l == pos.size + 1 )
				l = 1;
			else if( l == pos.size )
				l = 0;

			part1 moveTo( pos[i], level.elevator_time );
			part2 moveTo( pos[j], level.elevator_time );
			part3 moveTo( pos[k], level.elevator_time );
			part4 moveTo( pos[l], level.elevator_time );

			wait level.elevator_time - 0.1;
		}
	}
}

speedElevator1()
{
	level.elevator1_parts = [];
	level.elevator1_places = [];

	while( isDefined( getEnt( "escalator_1_num_" + level.elevator1_parts.size, "targetname" ) ) )
	{
		level.elevator1_parts[ level.elevator1_parts.size ] = getEnt( "escalator_1_num_" + level.elevator1_parts.size, "targetname" );
		level.elevator1_places[ level.elevator1_parts.size - 1 ] = spawnStruct();
		level.elevator1_places[ level.elevator1_parts.size - 1 ].normal_origin = level.elevator1_parts[ level.elevator1_parts.size - 1 ].origin;
	}

	level thread numbersElevator1( "0,1,2,4,5,6,12,13" );

	use = getEnt( "escalator_1_use", "targetname" );

	while(1)
	{
		use waittill( "trigger", player );

		use playSound( "ui_pulse_text_type" );

		level.elevator_time -= 0.2;

		if( level.elevator_time < 1 )
			level.elevator_time = 3;

		if( level.elevator_time == 1.2 )
			level thread numbersElevator1( "5,6,7,8,9,11,12,13" );
		else if( level.elevator_time == 1.4 )
			level thread numbersElevator1( "0,1,2,4,5,6,8,9,10,11,12,13" );
		else if( level.elevator_time == 1.6 )
			level thread numbersElevator1( "0,1,2,4,5,6,7,8,9,10,11,12,13" );
		else if( level.elevator_time == 1.8 )
			level thread numbersElevator1( "0,1,2,4,5,6,10,11,12,13" );
		else if( level.elevator_time == 2 )
			level thread numbersElevator1( "0,1,2,4,5,6,7,8,9,10,11,12" );
		else if( level.elevator_time == 2.2 )
			level thread numbersElevator1( "0,1,2,4,5,6,8,9,10,11,12" );
		else if( level.elevator_time == 2.4 )
			level thread numbersElevator1( "0,1,2,4,5,6,8,10,12,13" );
		else if( level.elevator_time == 2.6 )
			level thread numbersElevator1( "0,1,2,4,5,6,9,10,11,12,13" );
		else if( level.elevator_time == 2.8 )
			level thread numbersElevator1( "0,1,2,4,5,6,7,9,10,11,13" );
		else
			level thread numbersElevator1( "0,1,2,4,5,6,12,13" );

		wait .5;
	}
}

numbersElevator1( array )
{
	nums = strTok( array, "," );

	level notify( "elevator_1_change_speed" );

	wait 0.05;

	for( i = 0; i < nums.size; i++ )
		level.elevator1_parts[ int( nums[i] ) ].origin = level.elevator1_parts[ int( nums[i] ) ].origin + (0,4,0);

	level waittill( "elevator_1_change_speed" );

	for( i = 0; i < nums.size; i++ )
		level.elevator1_parts[ int( nums[i] ) ].origin = level.elevator1_places[ int( nums[i] ) ].normal_origin;
}

setupEscalator1()
{
	level.escalator_time = 0.5;

	level.escalator_parts = [];
	level.escalator_places = [];

	while( isDefined( getEnt( "escalator_1_" + level.escalator_parts.size, "targetname" ) ) )
	{
		level.escalator_parts[ level.escalator_parts.size ] = getEnt( "escalator_1_" + level.escalator_parts.size, "targetname" );
		level.escalator_places[ level.escalator_parts.size - 1 ] = spawnStruct();
		level.escalator_places[ level.escalator_parts.size - 1 ].origin = level.escalator_parts[ level.escalator_parts.size - 1 ].origin;
		level.escalator_places[ level.escalator_parts.size - 1 ].angles = level.escalator_parts[ level.escalator_parts.size - 1 ].angles;
	}

	for( i = 0; i < level.escalator_parts.size - 1; i++ )
		level.escalator_parts[i] thread moveEscalator( i );
}

moveEscalator( current )
{
	while(1)
	{
		while( current < level.escalator_places.size - 1 )
		{
			if( current < 8 )
			{
				new = 8;

				self moveTo( level.escalator_places[ new ].origin, level.escalator_time * ( new - current ) );
				self rotateTo( level.escalator_places[ new ].angles, level.escalator_time * ( new - current ) );

				wait level.escalator_time * ( new - current );
				current += ( new - current );
			}
			else if( current < 43 )
			{
				new = 43;
				self moveTo( level.escalator_places[ new ].origin, level.escalator_time * ( new - current ) );
				self rotateTo( level.escalator_places[ new ].angles, level.escalator_time * ( new - current ) );

				wait level.escalator_time * ( new - current );
				current += ( new - current );
			}
			else if( current < 44 )
			{
				new = 44;
				self moveTo( level.escalator_places[ new ].origin, level.escalator_time * ( new - current ) );
				self rotateTo( level.escalator_places[ new ].angles, level.escalator_time * ( new - current ) );

				wait level.escalator_time * ( new - current );
				current += ( new - current );
			}
			else if( current < 52 )
			{
				new = 52;
				self moveTo( level.escalator_places[ new ].origin, level.escalator_time * ( new - current ) );
				self rotateTo( level.escalator_places[ new ].angles, level.escalator_time * ( new - current ) );

				wait level.escalator_time * ( new - current );
				current += ( new - current );
			}
			else
			{
				self moveTo( level.escalator_places[ current + 1 ].origin, level.escalator_time );
				self rotateTo( level.escalator_places[ current + 1 ].angles, level.escalator_time );

				wait level.escalator_time;
				current++;
			}
		}

		current = 0;
		self.origin = level.escalator_places[current].origin;
		self.angles = level.escalator_places[current].angles;
	}
}

setupHoverBeamLights()
{
	wait 1;

	beam = getEnt( "hover_beam_lights", "targetname" );
	models = getEntArray( "hover_beam_light_models", "targetname" );
	lights = getEntArray( "hover_beam_lightsources", "targetname" );
	blades = getEntArray( "chopper_blades_lights", "targetname" );

	for( i = 0; i < models.size; i++ )
		models[i] linkTo( beam );

	for( i = 0; i < lights.size; i++ )
		lights[i] linkTo( beam );

	beam thread moveUpAndDown( blades );

	for( i = 0; i < blades.size; i++ )
		blades[i] rotateYaw( level.spin_time * 36000, level.spin_time * 60 );
}

setupHoverBeam()
{
	beam = getEnt( "hover_beam", "targetname" );
	blades = getEntArray( "chopper_blades", "targetname" );

	beam thread moveUpAndDown( blades );

	for( i = 0; i < blades.size; i++ )
		blades[i] rotateYaw( level.spin_time * 36000, level.spin_time * 60 );
}

moveUpAndDown( blades )
{
	zNormal = self.origin[2];

	while(1)
	{
		time = randomFloatRange( 1.5, 3.0 );
		distance = randomIntRange( 12, 20 );
		distance_blades = distance + randomIntRange( -2, 3 );

		self moveZ( distance, time, 0.5, 0.5 );
		for( i = 0; i < blades.size; i++ )
			blades[i] moveZ( distance_blades, time, 0.5, 0.5 );

		wait time;

		self moveTo( ( self.origin[0], self.origin[1], zNormal ), time, 0.5, 0.5 );
		for( i = 0; i < blades.size; i++ )
			blades[i] moveTo( ( blades[i].origin[0], blades[i].origin[1], zNormal ), time, 0.5, 0.5 );

		wait time;
	}
}

setupNoobPath()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	slow = getEnt( "set_speed_slow", "targetname" );
	normal = getEntArray( "set_speed_normal", "targetname" );

	for( i = 0; i < normal.size; i++ )
		normal[i] thread setNoobNormalSpeed();

	while(1)
	{
		slow waittill( "trigger", player );

		if( !isDefined( player.slow_noob ) || ( isDefined( player.slow_noob ) && !player.slow_noob ) )
		{
			player.slow_noob = true;
			player setMoveSpeedScale( 0.3 );

			player iPrintLnBold( "Set speed to ^1noob" );
		}

		wait 0.1;
	}
}

setNoobNormalSpeed()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	while(1)
	{
		self waittill( "trigger", player );

		if( isDefined( player.slow_noob ) && player.slow_noob )
		{
			player.slow_noob = false;

			if( isDefined( level.dvar["allies_speed"] ) )
				player setMoveSpeedScale( level.dvar["allies_speed"] );
			else
				player setMoveSpeedScale( 1 );

			player iPrintLnBold( "Set speed to ^2normal" );
		}

		wait 0.1;
	}
}

setupTriggerJumpers()
{
	level endon( "game over" );

	trigger = getEnt( "jumpers_trigger", "targetname" );
	blocker1 = getEnt( "blocker_1_1", "targetname" );
	blocker2 = getEnt( "blocker_1_2", "targetname" );

	blocker2 enableLinkTo();
	blocker2 linkTo( blocker1 );

	trigger waittill( "trigger", player );
	trigger delete();

	level.use_1 delete();
	level.use_2 delete();

	blocker1 moveTo( blocker1.origin - (0,0,50), 3 );

	wait 3;

	blocker1 delete();
	blocker2 delete();

	part1 = getEnt( "trap_1_1", "targetname" );
	part2 = getEnt( "trap_1_2", "targetname" );
	part3 = getEnt( "trap_2_1", "targetname" );
	part4 = getEnt( "trap_2_2", "targetname" );
	platform1 = getEnt( "platform_1_1", "targetname" );
	platform2 = getEnt( "platform_1_2", "targetname" );
	blocker = getEnt( "platform_blocker", "targetname" );
	blocker_kill = getEnt( "platform_blocker_kill", "targetname" ); // test

	time = 8;

	if( !level.freeRun )
	{
		part1 moveTo( part1.origin - (0,0,400), time / 2 );
		part2 moveTo( part2.origin - (0,0,400), time / 2 );
		part3 moveTo( part3.origin - (0,0,400), time / 2 );
		part4 moveTo( part4.origin - (0,0,400), time / 2 );

		wait time / 2;

		part1 delete();
		part2 delete();
		part3 delete();
		part4 delete();

		level thread trap1Part3();

		blocker_kill enableLinkTo();
		blocker_kill linkTo( blocker );

		blocker moveTo( blocker.origin + (646,0,0), 1 );

		wait 1;
	}

	platform1 moveTo( platform1.origin + (0,0,560), time / 2 );
	platform2 moveTo( platform2.origin + (0,0,560), time / 2 );

	wait time / 2;
	origin1_1 = platform1.origin;
	origin1_2 = platform1.origin + (520,0,0);
	origin2_1 = platform2.origin;
	origin2_2 = platform2.origin - (520,0,0);

	while(1)
	{
		platform1 moveTo( origin1_2, time );
		platform2 moveTo( origin2_2, time );
		wait time - 0.1;
		platform1 moveTo( origin1_1, time );
		platform2 moveTo( origin2_1, time );
		wait time - 0.1;
	}
}

setupTriggerFlesh1()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	kill = getEnt( "flesh_1_kill", "targetname" );
	trigger = getEnt( "flesh_1_trigger", "targetname" );
	destroy = getEnt( "flesh_1_destroy", "targetname" );

	start_origin = destroy.origin;

	kill enableLinkTo();
	kill linkTo( destroy );

	while(1)
	{
		trigger waittill( "damage", amount, player );

		destroy rotateTo( (0,0,-90), 0.5 );
		destroy moveTo( ( destroy.origin[0], destroy.origin[1] + 35, destroy.origin[2] - 35 ), 0.5 );
		destroy playSound( "melee_knife_hit_body" );
		playFx( level._effect[ "blood" ], destroy.origin );

		player iPrintLnBold( "Be fast, the flesh will grow back" );

		wait 5;
		destroy.origin = ( start_origin[0], start_origin[1], destroy.origin[2] - 30 );
		destroy.angles = (0,0,0);
		destroy moveTo( start_origin, 4 );
		destroy waittill( "movedone" );
	}
}

setupTriggerFlesh2()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	kill = getEnt( "flesh_2_kill", "targetname" );
	trigger = getEnt( "flesh_2_trigger", "targetname" );
	destroy = getEnt( "flesh_2_destroy", "targetname" );

	start_origin = destroy.origin;

	kill enablelinkto();
	kill linkto( destroy );

	while(1)
	{
		trigger waittill( "damage", amount, player );

		destroy RotateTo( (0,0,90), 0.5 );
		destroy MoveTo( ( destroy.origin[0], destroy.origin[1] - 35, destroy.origin[2] - 35 ), 0.5 );
		destroy playSound( "melee_knife_hit_body" );
		playFx( level._effect[ "blood" ], destroy.origin );

		player iPrintLnBold( "Be fast, the flesh will grow back" );

		wait 5;
		destroy.origin = ( start_origin[0], start_origin[1], destroy.origin[2] - 30 );
		destroy.angles = (0,0,0);
		destroy MoveTo( start_origin, 4 );
		destroy waittill( "movedone" );
	}
}

setupTriggerTouch1()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	trigger = getEnt( "touch_1", "targetname" );

	while(1)
	{
		trigger waittill( "trigger", player );

		if( !isDefined( player.weaponsDisabled ) || !player.weaponsDisabled )
			player thread disablePlayerWeapons();

		wait 0.05;
	}
}

disablePlayerWeapons()
{
	self endon( "disconnect" );
	self endon( "joined_spectators" );

	self.weaponsDisabled = true;
	self.weaponSaved = self getCurrentWeapon();

	self takeAllWeapons();
	self giveWeapon( "knife_mp" );

	self thread dieOrTouchTrig();

	if( self.weaponSaved != "knife_mp" )
		self iPrintLnBold( "It is to small here, you can not use your guns." );

	self iPrintLnBold( "You can not breath here, you have ^130 seconds before you die" );

	wait 0.05;
	self switchToWeapon( "knife_mp" );

	self waittill( "death" );

	if( self.weaponsDisabled )
		self.weaponsDisabled = false;
}

dieOrTouchTrig()
{
	self endon( "death" );
	self endon( "disconnect" );
	self endon( "joined_spectators" );

	wait 30;

	if( self.weaponsDisabled )
	{
		self suicide();
		self iPrintLnBold( "You ^1died ^7of suffocation" );
	}
}

setupTriggerTouch2()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	trigger = getEnt( "touch_2", "targetname" );

	while(1)
	{
		trigger waittill( "trigger", player );

		if( isDefined( player.weaponsDisabled ) && player.weaponsDisabled )
			player thread enablePlayerWeapons();

		wait 0.05;
	}
}

enablePlayerWeapons()
{
	self.weaponsDisabled = false;

	if( isDefined( self.weaponSaved ) && self.weaponSaved != "knife_mp" && ( !isDefined( level.trapsDisabled ) || ( isDefined( level.trapsDisabled ) && !level.trapsDisabled ) ) )
	{
		self takeAllWeapons();

		self giveWeapon( self.weaponSaved );
		self giveMaxAmmo( self.weaponSaved );

		wait 0.05;
		self switchToWeapon( self.weaponSaved );

		self iPrintLnBold( "Here is enough space to use your guns" );
	}
}

setupTrap1()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	part1 = getEnt( "trap_1_1", "targetname" );
	part2 = getEnt( "trap_1_2", "targetname" );

	level.use_1 = getEnt( "use_1", "targetname" );
	level.use_1 waittill( "trigger", player );

	level.use_1 delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	wait 2;

	part1 rotateRoll( -70, 5 );
	part2 rotateRoll( 70, 5 );

	level thread trap1Part3();
}

trap1Part3()
{
	if( isDefined( level.trap1_part3_moving ) && level.trap1_part3_moving )
		level waittill( "trap1_part3_stopped" );

	level.trap1_part3_moving = true;
	part3 = getEnt( "trap_1_3", "targetname" );

	origin1 = part3.origin + (0,640,0);
	origin2 = part3.origin;

	time = 10;

	part3 moveTo( origin1, time );

	wait time;
	part3 moveTo( origin2, time );

	level.trap1_part3_moving = false;
	level notify( "trap1_part3_stopped" );
}

setupTrap2()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	part = getEnt( "trap_2_1", "targetname" );

	level.use_2 = getEnt( "use_2", "targetname" );
	level.use_2 waittill( "trigger", player );

	level.use_2 delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	part rotateRoll( 0 - 180, 10 );
	wait randomIntRange( 15, 21 );

	part rotateRoll( 0 - 180, 10 );
}

setupTrap3()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	trap3_info = getEnt( "trap_3_info", "targetname" );

	trap3_objects = [];
	while( isDefined( getEnt( "trap_3_object_" + trap3_objects.size, "targetname" ) ) )
		trap3_objects[ trap3_objects.size ] = getEnt( "trap_3_object_" + trap3_objects.size, "targetname" );

	level.trap3_triggers = [];
	while( isDefined( getEnt( "trap_3_trigger_" + level.trap3_triggers.size, "targetname" ) ) )
		level.trap3_triggers[ level.trap3_triggers.size ] = getEnt( "trap_3_trigger_" + level.trap3_triggers.size, "targetname" );

	use = getEnt( "use_3", "targetname" );
	use waittill( "trigger", player );

	use delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	trap3_info setHintString( "Look on the right to see the solution of the maze. Avoid the ^1red ^7spots" );

	for( i = 0; i < trap3_objects.size; i++ )
	{
		trap3_objects[i].start_orig = trap3_objects[i].origin;
		level.trap3_triggers[i] thread activateTriggersTrap3( trap3_objects[i] );
	}

	option = randomIntRange( 0, 24 );

	if( option == 0 )
		level thread deleteTriggersTrap3( "0,4,5,6,12,17,18,19,13,8,9,10,14,21,25,32,31,30,35,41,40,39,34,28,27,26,33,37,44" );
	else if( option == 1 )
		level thread deleteTriggersTrap3( "1,6,7,8,9,10,14,21,25,32,31,30,24,19,18,17,23,28,27,26,33,37,38,39,40,41,46" );
	else if( option == 2 )
		level thread deleteTriggersTrap3( "1,6,7,8,9,10,14,21,20,19,24,30,29,28,23,17,16,15,22,26,33,37,38,39,45" );
	else if( option == 3 )
		level thread deleteTriggersTrap3( "3,10,14,21,20,19,13,8,7,6,12,17,23,28,29,30,35,41,40,39,38,37,44" );
	else if( option == 4 )
		level thread deleteTriggersTrap3( "0,4,5,6,12,17,18,19,24,30,31,32,36,43,47" );
	else if( option == 5 )
		level thread deleteTriggersTrap3( "3,10,9,8,13,19,20,21,25,32,36,43,42,41,35,30,29,28,23,17,12,6,5,4,11,15,22,26,33,37,38,39,45" );
	else if( option == 6 )
		level thread deleteTriggersTrap3( "3,10,9,8,13,19,20,21,25,32,31,30,29,28,27,26,33,37,38,39,40,41,46" );
	else if( option == 7 )
		level thread deleteTriggersTrap3( "2,8,7,6,5,4,11,15,22,26,27,28,23,17,18,19,20,21,25,32,36,43,42,41,40,39,45" );
	else if( option == 8 )
		level thread deleteTriggersTrap3( "0,4,11,15,22,26,33,37,38,39,34,28,23,17,12,6,7,8,9,10,14,21,20,19,24,30,31,32,36,43,42,41,46" );
	else if( option == 9 )
		level thread deleteTriggersTrap3( "0,4,5,6,12,17,16,15,22,26,27,28,29,30,24,19,13,8,9,10,14,21,25,32,36,43,42,41,40,39,38,37,44" );
	else if( option == 10 )
		level thread deleteTriggersTrap3( "0,4,5,6,12,17,18,19,13,8,9,10,14,21,25,32,31,30,35,41,40,39,34,28,27,26,33,37,44" );
	else if( option == 11 )
		level thread deleteTriggersTrap3( "0,4,11,15,16,17,12,6,7,8,9,10,14,21,20,19,24,30,31,32,36,43,42,41,40,39,34,28,27,26,33,37,44" );
	else if( option == 12 )
		level thread deleteTriggersTrap3( "3,10,14,21,25,32,31,30,24,19,13,8,7,6,12,17,23,28,27,26,33,37,38,39,40,41,46" );
	else if( option == 13 )
		level thread deleteTriggersTrap3( "2,8,13,19,18,17,16,15,22,26,33,37,38,39,34,28,29,30,31,32,36,43,47" );
	else if( option == 14 )
		level thread deleteTriggersTrap3( "1,6,7,8,9,10,14,21,25,32,36,43,42,41,35,30,29,28,27,26,33,37,44" );
	else if( option == 15 )
		level thread deleteTriggersTrap3( "3,10,14,21,25,32,36,43,42,41,35,30,24,19,13,8,7,6,5,4,11,15,16,17,23,28,27,26,33,37,38,39,45" );
	else if( option == 16 )
		level thread deleteTriggersTrap3( "3,10,14,21,25,32,31,30,29,28,23,17,12,6,5,4,11,15,22,26,33,37,44" );
	else if( option == 17 )
		level thread deleteTriggersTrap3( "3,10,9,8,13,19,18,17,23,28,27,26,33,37,38,39,40,41,46" );
	else if( option == 18 )
		level thread deleteTriggersTrap3( "0,4,11,15,22,26,27,28,29,30,24,19,18,17,12,6,7,8,9,10,14,21,25,32,36,43,42,41,40,39,38,37,44" );
	else if( option == 19 )
		level thread deleteTriggersTrap3( "1,6,5,4,11,15,16,17,18,19,13,8,9,10,14,21,25,32,31,30,29,28,27,26,33,37,38,39,40,41,42,43,47" );
	else if( option == 20 )
		level thread deleteTriggersTrap3( "2,8,13,19,18,17,12,6,5,4,11,15,22,26,33,37,38,39,45" );
	else if( option == 21 )
		level thread deleteTriggersTrap3( "0,4,5,6,12,17,18,19,13,8,9,10,14,21,25,32,31,30,35,41,40,39,45" );
	else if( option == 22 )
		level thread deleteTriggersTrap3( "3,10,9,8,7,6,5,4,11,15,16,17,23,28,29,30,31,32,36,43,42,41,40,39,38,37,44" );
	else
		level thread deleteTriggersTrap3( "2,8,9,10,14,21,20,19,24,30,31,32,36,43,42,41,46,1,6,5,4,11,15,16,17,23,28,27,26,33,37,38,39,45" );
}

activateTriggersTrap3( part )
{
	level endon( "game over" );
	self endon( "deactivate_trigger" );

	while(1)
	{
		self waittill( "trigger", player );
		part thread killTrap3( player );
	}
}

killTrap3( dead_guy )
{
	dead_guy suicide();
	dead_guy iPrintLnBold( "Look on the wall next time" );

	if( !self.moving || !isDefined( self.moving ) )
	{
		self.moving = true;

		self moveTo( self.origin + (0,0,50), 0.2 );
		wait 0.2;

		self moveTo( self.start_orig, 1 );
		wait 1;

		self.origin = self.start_orig;

		self.moving = false;
	}
}

deleteTriggersTrap3( array )
{
	trap3_points = [];
	while( isDefined( getEnt( "trap_3_point_" + trap3_points.size, "targetname" ) ) )
		trap3_points[ trap3_points.size ] = getEnt( "trap_3_point_" + trap3_points.size, "targetname" );

	trap3_large = [];
	trap3_large[0] = getEnt( "trap_3_point_0_large", "targetname" );
	trap3_large[1] = getEnt( "trap_3_point_1_large", "targetname" );
	trap3_large[2] = getEnt( "trap_3_point_2_large", "targetname" );
	trap3_large[3] = getEnt( "trap_3_point_3_large", "targetname" );

	wait 0.05;

	nums = strTok( array, "," );
	time = 15 / nums.size;

	for( j = 0; j < trap3_large.size; j++ )
	{
		if( j != int( nums[0] ) )
			trap3_large[j] moveZ( 64, 1 );
	}

	if( int( nums[1] ) == 0 || int( nums[1] ) == 1 || int( nums[1] ) == 2 || int( nums[1] ) == 3 )
		trap3_large[ nums[1] ] moveZ( 64, 1 );

	for( i = 0; i < nums.size; i++ )
	{
		level.trap3_triggers[ int( int( nums[i] ) ) ] notify( "deactivate_trigger" );

		trap3_points[ int( nums[i] ) ] moveTo( trap3_points[ int( nums[i] ) ].origin - (10,0,0), time );
		wait time;

		trap3_points[ int( nums[i] ) ] delete();
	}
}

setupTrap4()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	trap4_movers = getEntArray( "trap_4_mover", "targetname" );
	trap4_triggers = getEntArray( "trap_4_trigger", "targetname" );
	trap4_fire_starters = getEntArray( "trap4_fire_start", "targetname" );

	level.trap4_burning = true;
	level.trap4_killing = true;

	use = getEnt( "use_4", "targetname" );
	use waittill( "trigger", player );

	use delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	for( i = 0; i < trap4_triggers.size; i++ )
		trap4_triggers[i] thread activateTriggersTrap4( trap4_movers[i] );

	for( i = 0; i < trap4_fire_starters.size; i++ )
		trap4_fire_starters[i] thread startFireTrap4();

	trap4_fire_starters[1] playSound( "burning_jet_engine" );

	for( i = 0; i < 5; i++ )
	{
		trap4_fire_starters[1] playsound( "fire_vehicle_flareup_med" );
		wait 2;
	}

	level.trap4_burning = false;

	wait 0.2;
	level.trap4_killing = false;
	level notify( "stop_trap_4" );
}

startFireTrap4()
{
	level endon( "game over" );

	while( level.trap4_burning )
	{
		playFx( level._effect[ "trap4" ], self.origin + (5,0,0) );
		wait 0.1;
	}
}

activateTriggersTrap4( mover )
{
	level endon( "stop_trap_4" );
	level endon( "game over" );

	self enableLinkTo();
	self linkTo( mover );

	mover moveTo( mover.origin + (656,0,0), 0.1 );

	while( level.trap4_killing )
	{
		self waittill( "trigger", player );

		if( !level.trap4_killing )
			break;

		if( !isDefined( player.burning ) || ( isDefined( player.burning ) && !player.burning ) )
			player thread killTrap4();

		wait 0.05;
	}

	mover delete();
	self delete();
}

killTrap4()
{
	self.burning = true;
	self disableWeapons();

	last_known_origin = self.origin;

	iPrintLn( self.name + " is ^1burning" );

	i = 0;
	while( isAlive( self ) && i < 40 )
	{
		i++;
		last_known_origin = self.origin;
		playFx( level._effect[ "trap4_player_burn" ], last_known_origin );

		if( i % 6 == 0 || i == 1 )
		{
			if( self getStat( 980 ) == 3 || self getStat( 980 ) == 4 )
				self playSound( "burning_player_woman" );
			else
				self playSound( "burning_player" );
		}

		wait 0.2;
	}

	if( isAlive( self ) )
		self suicide();

	self.burning = false;

	for( i = 0; i < 5; i++ )
	{
		playFx( level._effect[ "trap4_player_burn" ], last_known_origin );
		wait 0.2;
	}
}

setupTrap5()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	part1 = getEnt( "trap_5_1", "targetname" );
	part2 = getEnt( "trap_5_2", "targetname" );
	kill1 = getEnt( "trap_5_kill_1", "targetname" );
	kill2 = getEnt( "trap_5_kill_2", "targetname" );

	kill1 enableLinkTo();
	kill2 enableLinkTo();
	kill1 linkTo( part1 );
	kill2 linkTo( part2 );

	use = getEnt( "use_5", "targetname" );
	use waittill( "trigger", player );

	use delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	origin1_1 = part1.origin;
	origin1_2 = part1.origin - (0,0,75);
	origin2_1 = part2.origin;
	origin2_2 = part2.origin - (0,0,75);

	time = 5;

	while(1)
	{
		part1 rotatePitch( time * 300, ( time - 0.1 ) * 2 );
		part2 rotatePitch( time * 300, ( time - 0.1 ) * 2 );

		part1 moveTo( origin1_2, time );
		part2 moveTo( origin2_2, time );
		wait time - 0.1;

		part1 moveTo( origin1_1, time );
		part2 moveTo( origin2_1, time );
		wait time - 0.1;
	}
}

setupTrap6()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	part = getEnt( "trap_6", "targetname" );
	kill = getEnt( "trap_6_kill", "targetname" );

	kill enableLinkTo();
	kill linkTo( part );

	use = getEnt( "use_6", "targetname" );
	use waittill( "trigger", player );

	use delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	origin_1 = part.origin;
	origin_2 = part.origin - (0,0,224);

	time = 5;

	while(1)
	{
		part rotatePitch( time * 300, ( time - 0.1 ) * 2 );
		part moveTo( origin_2, time );
		wait time - 0.1;

		part moveTo( origin_1, time );
		wait time - 0.1;
	}
}

setupTrap7()
{
	level endon( "game over" );
	level endon( "all_vs_activator" );

	part = getEnt( "trap_7", "targetname" );

	use = getEnt( "use_7", "targetname" );
	use waittill( "trigger", player );

	use delete();
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
	{
		if( level.trapsDisabledMessage )
		{
			iPrintLn( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLn( "He tried to activate a trap in a free round" );
		}
		else
		{
			level.trapsDisabledMessage = true;

			iPrintLnBold( "^6" + player.name + " ^7is a ^6faggot" );
			iPrintLnBold( "He tried to activate a trap in a free round" );
		}

		return;
	}

	normal_angles = part.angles;
	part rotateVelocity( (0,0,270), .3 );

	wait randomIntRange( 3, 5 );
	part rotateTo( normal_angles, 2 );
}