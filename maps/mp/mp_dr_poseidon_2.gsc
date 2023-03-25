/*

__________                   .__    .--/
\______   \____  ______ ____ |__| __| _/        __
 |     ___/  _ \/  ___// __ \|  |/ __ |/  _ \ /    \
 |    |  (  <_> )___ \\  ___/|  / /_/ (  <_> )   |  \
 |____|   \____/____  >\___  >__\____ |\____/|___|  /
                    \/     \/        \/           \/

Author: Zacharogiannis Poseidon
Skype: poszah
Help: None
Project begun at: 4/2/2016
Release Date: 14/2/2016
Project Expected Duration: 24 Hours
Project Actual Duration: 20 Hours
Name: mp_dr_poseidon_2

/connect joinrb.tk <-- to meet our community.

You may use this map on your own server under the following terms:
You may use my scripts for your own projects only if you mention me as "RB|Poseidon" on your credits.
You may NOT apply any changes to this script. If you find a bug report it to me and I'll upload a fix.
You may NOT make any changes on the IWD of this map.
You may NOT sell this map. It's free.
*/

main()
{
maps\mp\_load::main();

game["allies"]="marines";
game["axis"]="opfor";
game["attackers"]="axis";
game["defenders"]="allies";
game["allies_soldiertype"]="desert";
game["axis_soldiertype"]="desert";

level.lights = LoadFX("misc/red_light");
level.explosion = LoadFX("explosions/grenadeExp_concrete");
level.endDoor = "up";
level.hasFinished = 0;
level.sniper_locked = false;
level.jump_locked = false;
level.old_locked = false;
level.trap_buttons = getentarray("activatedTrapbutton","targetname");
level.hasBeenOpened = false;
level.hasChoosedRoom = 1;

level.QueOnFinishLine=0; // 1 Enabled - 0 Disabled / Closes the door behind the one that finishes so he can choose a room wisely. The door can only be opened when the player chooses his room or dies. not recommended because he can be a troll and stay there all day.

thread info();
thread onPlayerConnected();
thread onPlayerSpawn();
thread onRoundBegin();
thread precache();
thread setup_traps();
thread setup_general_elements();
thread endmap_announcings();
thread snip_room();
thread jump_room();
thread old_room();
}

info()
{
info = [];
info[0] = "Dont land on top of the bounces or metal blocks on sniper room.";
info[1] = "Use crouch jumps to pass through the first part.";
info[2] = "Dont hurry during the second part. Take your time.";
info[3] = "Falling in jump room will cost you more time than going slow.";
info[4] = "Map made by Poseidon.";
info[5] = "Take a look on our servers. Search for RB on gametracker.";
info[6] = "You cant really speedrun this map.";
info[7] = "Maybe there are secrets?.?";
info[8] = "Jumpers will not spawn at the same spot when choosing old room.";
info[9] = "Greetings from Greece.";
info[10] = "Observe the stop/start timings of the rotaries in jump room.";
info[11] = "This map was made in just 20 hours!";
info[12] = "This game is made on an updated version of the quake engine!";
info[13] = "This map was released at the Valentines day..";
info[14] = "I like doges. such amazing, much wow!";
info[15] = "Check out my first map, mp_dr_poseidon.";
info[16] = "Rate my map on moddb if you want to.";
info[17] = "Watch out for the hard mode. The middle of the three lines is slickery.";
info[18] = "If trap 2 is activated you can only pray and start running like hell.";
info[19] = "Blaze it 420.";
info[20] = "'Fuck'.";
info[21] = "Dont spend 5 mins for trickshot on sniper room. Others want to play too.";
info[22] = "If challenged for race go safe until he falls trying to speedrun.";
info[23] = "Lasers will not instantly kill you.";
info[24] = "Add me on steam 'posidonas2399' if you play cs go.";
info[25] = "If you are under 18 stop playing and do some homework you lazy fuck.";
info[26] = "I like to be irritating.";
info[27] = "This message was written by your mother when i visited her: 'HARDER!YES!HARDER!'.";
info[28] = "Your mother actually liked the way I trim the grass, she was really impressed.";
info[29] = "There might be no secrets on this map..";
info[30] = "All the messages are randomly picked.";
info[31] = "The lighting effect on spawn and finish will cost you some FPS.";
info[32] = "Dont complain about low fps if you play on a shitty 10 years old netbook.";
info[33] = "You cant inhale from your nose while exhaling from your mouth.";
info[34] = "You can always see your nose, your brain just ignores it.";
info[35] = "In 100 years there will be 6 billion accounts of dead people on facebook.";
info[36] = "You need to wait 2 seconds before seeing a new message.";

trig = getent("info","targetname");
y=5;
	while(1)
	{
	trig waittill("trigger",player);
	x=randomInt(info.size);
		if(y!=x)
		{
		y=x;
		player iPrintLnBold( info[x] );
		wait 2;
		}
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

onPlayerConnected() {
	for(;;) {
		level waittill("connected",player);
		player thread onPlayerDeath();
	}
}

onPlayerSpawn() {
        while(true)
		{
            level waittill( "player_spawn", player );
			player.hasFinishedAndSpawned=1;
        }
}

onRoundBegin()
{
level waittill("round_started");
thread enableDoorAndMusic();
thread initAmbient();
}

enableDoorAndMusic()
{
spawn_link=getent("spawn_linkshit","targetname");
spawn_link moveZ( -256, 0.05 );
}

onPlayerDeath() {
	while(1)
	{
	self waittill("death");
	self.hasFinishedAndSpawned=1;
	}
}

initAmbient()
{
trig = getEnt("music","targetname");
trig waittill("trigger",player);
trig delete();
ambientPlay( "ambient" );
}

precache()
{
precacheItem("remington700_mp");
precacheItem("m40a3_mp");
precacheItem("knife_mp");
precacheItem("p90_mp");
}

setup_traps()
{
thread hardMode();
thread addTriggerToList("hard_mode");
thread trap1();
thread addTriggerToList("trap1");
thread trap2();
thread addTriggerToList("trap2");
thread trap3();
thread addTriggerToList("trap3");
thread trap4();
thread addTriggerToList("trap4");
thread trap5();
thread addTriggerToList("trap5");
}

setup_general_elements()
{
thread ammo();
thread rotating_circles1();
thread rotating_circles2();
thread part3_block();
thread lightItUp();
thread spawnDoor();
thread spawnDoorsAnyway();
thread moving_shiets();
thread finish_door();
thread crouchjumprs();
thread sniper_room_teleports();
thread jump_teleports();
thread jump_rotaries();
thread jump_weapon();
thread general_links();
thread trap4_links();
}

general_links()
{
trap1_link=getentarray("trap1_linkshit","targetname");
spawn_link=getent("spawn_linkshit","targetname");
trig1 = getent("open_door","targetname");
trig2 = getEnt("music","targetname");
trig3 = getEntarray("trap1_hurts","targetname");
block = getentarray("part1_crouch","targetname");
hurt = getentarray("crouch_hurts","targetname");
trig1 enablelinkto();
trig2 enablelinkto();
trig1 linkTo( spawn_link );
trig2 linkTo( spawn_link );
	for(i=0;i<trig3.size;i++)
	{
	trig3[i] enablelinkto();
	trig3[i] linkTo( trap1_link[i] );
	}
	for(i=0;i<hurt.size;i++)
	{
	hurt[i] enablelinkto();
	hurt[i] linkTo( block[i] );
	}
}

ammo()
{
trig = getEntarray("ammo","targetname");
	for(i=0;i<trig.size;i++)
	{
	thread ammoFuckC( trig[i] );
	}
}

ammoFuckC(trig)
{
	while(1)
	{
	trig waittill("trigger",player);
	currentWeapon = player getCurrentWeapon();
	player givemaxammo(currentWeapon);
	}
}

rotating_circles1()
{
rotating_circles = getentarray("rotating_circles","targetname");
	while(1)
	{
	rotating_circles[0] moveX( -2300, 3);
	rotating_circles[0] rotatePitch( -1620, 3);
	rotating_circles[0] waittill("movedone");
	rotating_circles[0] moveX( 2300, 3);
	rotating_circles[0] rotatePitch( 1620, 3);
	rotating_circles[0] waittill("movedone");
	}
}

rotating_circles2()
{
rotating_circles = getentarray("rotating_circles","targetname");
	while(1)
	{
	rotating_circles[1] moveX( 2300, 3);
	rotating_circles[1] rotatePitch( 1620, 3);
	rotating_circles[1] waittill("movedone");
	rotating_circles[1] moveX( -2300, 3);
	rotating_circles[1] rotatePitch( -1620, 3);
	rotating_circles[1] waittill("movedone");
	}
}

part3_block()
{
block = getent("moving_block_1","targetname");
trig = getent("part3_begin","targetname");
trig waittill("trigger",player);
trig delete();
wait 1;
	while(1)
	{
	block moveX( 1200, 8 );
	block waittill("movedone");
	wait 3;
	block moveX( -1200, 8 );
	block waittill("movedone");
	wait 3;
	}
}

lightItUp()
{
orgn = getentarray("lights","targetname");
	for(i=0;i<orgn.size;i++)
	{
	playLoopedFx( level.lights, 6, orgn[i].origin );
	}
}

spawnDoor()
{
spawn_link=getent("spawn_linkshit","targetname");
door = getent("spawn_door","targetname");
door2 = getent("spawn_door2","targetname");
trig = getent("open_door","targetname");
trig waittill("trigger", player);
trig delete();
door MoveZ(-120, 3);
door2 MoveX(700, 3);
wait 3;
door delete();
door2 delete();
wait 7;
thread spawnAFK();
}

spawnDoorsAnyway()
{
door = getent("spawn_door","targetname");
door2 = getent("spawn_door2","targetname");
trig = getent("open_door","targetname");
level waittill("round_started");
wait 5;
	if(isDefined(trig))
	{
	trig delete();
	door MoveZ(-120, 3);
	door2 MoveX(700, 3);
	wait 3;
	door delete();
	door2 delete();
	wait 7;
	thread spawnAFK();
	}
}

moving_shiets()
{
shiets = getentarray("trap3_blocks","targetname");
dist = 545;
time = 2;
	while(1)
	{
	shiets[0] MoveY( dist, time );
	shiets[1] MoveY( dist, time );
	shiets[2] MoveY( dist, time );
	wait 1.5;
	shiets[0] rotateRoll( 180, 0.5 );
	shiets[1] rotateRoll( 180, 0.5 );
	shiets[2] rotateRoll( 180, 0.5 );
	shiets[3] MoveY( (dist-(dist*2)), time );
	shiets[4] MoveY( (dist-(dist*2)), time );
	shiets[5] MoveY( (dist-(dist*2)), time );
	wait 1.5;
	shiets[3] rotateRoll( 180, 0.5 );
	shiets[4] rotateRoll( 180, 0.5 );
	shiets[5] rotateRoll( 180, 0.5 );
	shiets[0] MoveY( (dist-(dist*2)), time );
	shiets[1] MoveY( (dist-(dist*2)), time );
	shiets[2] MoveY( (dist-(dist*2)), time );
	wait 1.5;
	shiets[0] rotateRoll( -180, 0.5 );
	shiets[1] rotateRoll( -180, 0.5 );
	shiets[2] rotateRoll( -180, 0.5 );
	shiets[3] MoveY( dist, time );
	shiets[4] MoveY( dist, time );
	shiets[5] MoveY( dist, time );
	wait 1.5;
	shiets[3] rotateRoll( -180, 0.5 );
	shiets[4] rotateRoll( -180, 0.5 );
	shiets[5] rotateRoll( -180, 0.5 );
	}
}

finish_door()
{
thread watch_doorOpen();
thread watch_doorClose();
}

watch_doorOpen()
{
trigger_open = getent("finish_door_que","targetname");
door = getent("finish_door","targetname");
	if(level.QueOnFinishLine==1)
	{
		while(1)
		{
		trigger_open waittill("trigger",player);
			if( level.endDoor=="up" && level.hasChoosedRoom==1 )
			{
			door MoveZ(-128, 0.2);
			level.endDoor="down";
			level.hasChoosedRoom=0;
			player thread onDeathInsideRoomChoose();
			}
		}
	}
	else
	{
	trigger_open waittill("trigger",player);
	door MoveZ(-128, 0.5);
	door waittill("movedone");
	door delete();
	}
}

watch_doorClose()
{
	if(level.QueOnFinishLine==1)
	{
	trigger_close = getent("endmap_trig","targetname");
	door = getent("finish_door","targetname");
		while(1)
		{
		trigger_close waittill("trigger",player);
			if( level.endDoor=="down" )
			{
			door MoveZ(128, 0.1);
			level.endDoor="up";
			}
		}
	}
}

onDeathInsideRoomChoose()
{
self waittill("death");
level.hasChoosedRoom=1;
}

endmap_announcings() {
	trig = getEnt("endmap_trig", "targetname");
	while (1) {
		trig waittill("trigger", player);
		if(player.hasFinishedAndSpawned==1){
		switch (level.hasFinished) {
			case 0:
				iprintlnbold("^3" + player.name + "^7 finished first!");
				level.hasFinished++;
				break;
			case 1:
				iprintlnbold("^3" + player.name + "^7 finished second!");
				level.hasFinished++;
				break;
			case 2:
				iprintlnbold("^3" + player.name + "^7 finished third!");
				level.hasFinished++;
				break;
			default:
				iprintlnbold("^3" + player.name + "^7 finished " + (level.hasFinished+1) + "th!");
				level.hasFinished++;
				break;
		}
		}
		player.hasFinishedAndSpawned=0;
		wait.05;
	}
}

sniper_room_teleports()
{
fx1 = LoadFX("misc/ui_flagbase_black");
fx2 = LoadFX("misc/ui_flagbase_red");
origin=getEntarray("sniper_fx_org", "targetname");
trigs=getEntarray("sniper_acti_inTeleports", "targetname");
origin2=getEnt("sniper_acti_inTeleport1", "targetname");
origin3=getEnt("sniper_acti_inTeleport2", "targetname");
	for (i = 0; i < origin.size; i++)
	{
	if(i==0||i==2||i==4||i==6||i==8||i==10)
		playLoopedFx(fx1, 1, origin[i].origin);
	else
		playLoopedFx(fx2, 1, origin[i].origin);
	}
	for(i=0;i<trigs.size;i++)
	{
		if(i==3||i==4)
			thread sniper_teleports( trigs[i], origin2 );
		else
			thread sniper_teleports( trigs[i], origin3 );
	}
}

sniper_teleports( trig, origin )
{
	while(1)
	{
	trig waittill("trigger",player);
	player SetOrigin( origin.origin );
	player setPlayerAngles( origin.angles );
	}
}

jump_teleports()
{
trig=getEnt("jump_teleport", "targetname");
org_acti = getEnt("jump_acti", "targetname");
org_jumper = getEnt("jump_jumper", "targetname");
	while(1)
	{
	trig waittill("trigger",player);
		if(player.pers["team"]=="allies")
		{
		player SetOrigin( org_jumper.origin );
		player setPlayerAngles( org_jumper.angles );
		}
		else if(player.pers["team"]=="axis")
		{
		player SetOrigin( org_acti.origin );
		player setPlayerAngles( org_acti.angles );
		}
		
	}
}

jump_rotaries()
{
rot1=getEntarray("bounce_rotary", "targetname");
rot2=getEntarray("bounce_rotary2", "targetname");
	while(1)
	{
	rot1[0] rotatePitch( 360, 2 );
	rot1[1] rotatePitch( 360, 2 );
	rot2[0] rotateYaw( 360, 2 );
	rot2[1] rotateYaw( -360, 2 );
	wait 2.5;
	}
}

jump_weapon()
{
trig = getent("jump_weapon","targetname");
	while(1)
	{
	trig waittill("trigger",player);
	player takeAllWeapons();
	player giveWeapon("p90_mp");
	player switchToWeapon("p90_mp");
	}
}

crouchjumprs()
{
block = getentarray("part1_crouch","targetname");
hurt = getentarray("crouch_hurts","targetname");
x=464;
y=192;
time=1.3;
ytime=0.3;
	while(1)
	{
		for(i=0;i<6;i++)
		{
			if( i==0 || i==2 || i==4 || i==6 || i==8 || i==10 )
			{
			block[0] moveX((x-(x*2)),time);
			block[1] moveX(x,time);
			}
			else
			{
			block[1] moveX((x-(x*2)),time);
			block[0] moveX(x,time);
			}
		wait time;
		block[0] moveY(y,ytime);
		block[1] moveY((y-(y*2)),ytime);
		wait ytime;
		}
		for(i=0;i<6;i++)
		{
			if( i==0 || i==2 || i==4 || i==6 || i==8 || i==10 )
			{
			block[0] moveX((x-(x*2)),time);
			block[1] moveX(x,time);
			}
			else
			{
			block[1] moveX((x-(x*2)),time);
			block[0] moveX(x,time);
			}
		wait time;
		block[1] moveY(y,ytime);
		block[0] moveY((y-(y*2)),ytime);
		wait ytime;
		}
	}
}

spawnAFK()
{
block = getent("part1_hurry","targetname");
block moveY( 300, 3 );
block waittill("movedone");
block delete();
}

hardMode()
{
trig = getent("hard_mode","targetname");
objects = getentarray("hard_mode_obj","targetname");
trig waittill("trigger",player);
level.trap_buttons[0] moveZ(-16,2);
iPrintLnBold( "^1Hard Mode Enabled..");
trig delete();
	for(i=0;i<objects.size;i++)
	{
	objects[i] moveZ( 480, 5 );
	}
	for(i=0;i<objects.size;i++)
	{
	wait 6;
	objects[i] delete();
	}
}

trap1()
{
trap1_link=getentarray("trap1_linkshit","targetname");
c4 = getentarray("trap1_c4","targetname");
c4_org = getentarray("trap1_c4_org","targetname");
trap1 = getent("trap1","targetname");
trap1 waittill("trigger",player);
level.trap_buttons[1] moveZ(-16,2);
trap1 delete();
	for(i=0;i<c4.size;i++)
	{
	randomVar = RandomInt( 2 );
		if( randomVar == 0 )
		{
		c4[i] delete();
		playFx( level.explosion, c4_org[i].origin );
		trap1_link[i] moveZ( -256, 0.05 );
		trap1_link[i] waittill("movedone");
		trap1_link[i] moveZ( -2256, 0.05 );
		}
	wait 0.35;
	}
}

trap2()
{
blocks = getentarray("trap2_blocks","targetname");
trap2 = getent("trap2","targetname");
trap2 waittill("trigger",player);
level.trap_buttons[2] moveZ(-16,2);
trap2 delete();
dist=545;
time=3;
	while(1)
	{
	blocks[0] MoveY( (dist-(dist*2)), time );
	blocks[2] MoveY( (dist-(dist*2)), time );
	blocks[4] MoveY( (dist-(dist*2)), time );
	blocks[6] MoveY( (dist-(dist*2)), time );
	blocks[8] MoveY( (dist-(dist*2)), time );
	wait 2.5;
	blocks[1] MoveY( (dist-(dist*2)), time );
	blocks[3] MoveY( (dist-(dist*2)), time );
	blocks[5] MoveY( (dist-(dist*2)), time );
	blocks[7] MoveY( (dist-(dist*2)), time );
	blocks[9] MoveY( (dist-(dist*2)), time );
	wait 2.5;
	blocks[0] MoveY( dist, time );
	blocks[2] MoveY( dist, time );
	blocks[4] MoveY( dist, time );
	blocks[6] MoveY( dist, time );
	blocks[8] MoveY( dist, time );
	wait 2.5;
	blocks[1] MoveY( dist, time );
	blocks[3] MoveY( dist, time );
	blocks[5] MoveY( dist, time );
	blocks[7] MoveY( dist, time );
	blocks[9] MoveY( dist, time );
	wait 2.5;
	}
}

trap3()
{
blocks = getentarray("trap3_blocks_actual","targetname");
trap3 = getent("trap3","targetname");
trap3 waittill("trigger",player);
level.trap_buttons[3] moveZ(-16,2);
trap3 delete();
time=1.5;
dist=800;
	while(1)
	{
	blocks[0] moveZ((dist-(dist*2)),time);
	blocks[2] moveZ((dist-(dist*2)),time);
	wait 1.5;
	blocks[1] moveZ(dist,time);
	blocks[3] moveZ(dist,time);
	wait 1.5;
	blocks[0] moveZ(dist,time);
	blocks[2] moveZ(dist,time);
	wait 1.5;
	blocks[1] moveZ((dist-(dist*2)),time);
	blocks[3] moveZ((dist-(dist*2)),time);
	wait 1.5;
	}
}

trap4()
{
laser = getentarray("trap4_laser","targetname");
hurt = getentarray("trap4_laser_hurt","targetname");
trap4 = getent("trap4","targetname");
trap4 waittill("trigger",player);
level.trap_buttons[4] moveZ(-16,2);
trap4 delete();
time=2;
dist=136;
	while(1)
	{
	trap4FuckC( dist, (dist-(dist*2)), time );
	wait time;
	trap4FuckC( (dist-(dist*2)), dist, time );
	wait time;
	}
}

trap4_links()
{
laser = getentarray("trap4_laser","targetname");
hurt = getentarray("trap4_laser_hurt","targetname");
	for(i=0;i<laser.size;i++)
	{
	hurt[i] enablelinkto();
	hurt[i] linkTo(laser[i]);
	}
}

trap4FuckC( dist1, dist2, time )
{
laser = getentarray("trap4_laser","targetname");
for(i=0;i<laser.size;i=i+2)
		{
		laser[i] moveZ( dist1, time );
			if(isDefined(laser[(i+1)]))
				laser[(i+1)] moveZ( dist2, time );
		}
}

trap5()
{
bounces = getentarray("bounce","targetname");
trap5 = getent("trap5","targetname");
trap5 waittill("trigger",player);
level.trap_buttons[5] moveZ(-16,2);
trap5 delete();
	while(1)
	{
		for(i=0;i<bounces.size;i++)
		{
		temp=randomInt(3);
		time=randomFloatRange( 1.5, 3 );
			switch(temp)
			{
			case 0: x=360; break;
			case 1: x=720; break;
			case 2: x=1080; break;
			default: x=360; break;
			}
		z=randomInt( 2 );
			if( z==0 )
				bounces[i] rotateYaw( x, time );
			else
				bounces[i] rotateYaw( (x-(x*2)), time );
		wait randomFloatRange( 1.5, 4 );
		}
	}
}

match_begin() {
	self endon("death");
	self endon("disconnect");
	self freezeControls(true);
	self iPrintLnBold("^1Match starts in:");
	self iPrintLnBold("^23");
	wait 1;
	self iPrintLnBold("^32");
	wait 1;
	self iPrintLnBold("^41");
	wait 1;
	self iPrintLnBold("^5 JUST DO IT!1!");
	self freezeControls(false);
}

snip_room() {
	trig = getEnt("sniper_room", "targetname");
	org_acti = getEnt("sniper_acti", "targetname");
	org_jumper = getEnt("sniper_jumper", "targetname");
	while (1) {
		trig waittill("trigger", player);
		level.hasChoosedRoom=1;
		if (level.sniper_locked == false) {
			level.sniper_locked = true;
			level.jump_locked = true;
			level.old_locked = true;
			iprintlnbold("^3" + player.name + "^7 challenged the activator into a sniper fight.");
			player takeAllWeapons();
			player giveWeapon("m40a3_mp");
			player switchToWeapon("m40a3_mp");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_sniper();
			player thread match_begin();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
						players[i] takeAllWeapons();
						players[i] giveWeapon("m40a3_mp");
						players[i] giveWeapon("remington700_mp");
						players[i] switchToWeapon("m40a3_mp");
						players[i] SetOrigin(org_acti.origin);
						players[i] setPlayerAngles(org_acti.angles);
						players[i] thread match_begin();
					}
				}
				return;
			}
		}
	}
}

jump_room() {
	trig = getEnt("jump_room", "targetname");
	org_acti = getEnt("jump_acti", "targetname");
	org_jumper = getEnt("jump_jumper", "targetname");
	while (1) {
		trig waittill("trigger", player);
		level.hasChoosedRoom=1;
		if (level.jump_locked == false) {
			level.jump_locked = true;
			level.sniper_locked = true;
			level.old_locked = true;
			iprintlnbold("^3" + player.name + "^7 challenged the activator into a jump fight.");
			player takeAllWeapons();
			player giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			player SetOrigin(org_jumper.origin);
			player setPlayerAngles(org_jumper.angles);
			player thread onDeath_jump();
			player thread match_begin();
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
						players[i] takeAllWeapons();
						players[i] giveWeapon("knife_mp");
						players[i] switchToWeapon("knife_mp");
						players[i] SetOrigin(org_acti.origin);
						players[i] setPlayerAngles(org_acti.angles);
						players[i] thread match_begin();
					}
				}
				return;
			}
		}
	}
}

old_room() {
	trig = getEnt("old_room", "targetname");
	org_jumper = getEnt("old_jumper", "targetname");
	org_jumperRandom = getEntarray("old_jumper_random", "targetname");
	while (1) {
		trig waittill("trigger", player);
		level.hasChoosedRoom=1;
		thread moveDoorWithoutHoldingTheWholeScriptBackOnTheWaittill();
		if (level.old_locked == false) {
			level.old_locked = true;
			level.sniper_locked = true;
			level.jump_locked = true;
			iprintlnbold("^3" + player.name + "^7 decided to shoot the activator in cold blood.");
				if( level.hasBeenOpened==false )
				{
				player SetOrigin(org_jumper.origin);
				player setPlayerAngles(org_jumper.angles);
				}
				else
				{
				player SetOrigin(org_jumperRandom[(randomInt(org_jumperRandom.size))].origin);
				player setPlayerAngles((0,RandomIntRange(0,360),0));
				}
			player thread onDeath_old();
			level.hasBeenOpened = true;
			if (GetTeamPlayersAlive("axis") >= 1) {
				players = getentarray("player", "classname");
				for (i = 0; i < players.size; i++) {
					if (players[i].pers["team"] == "axis") {
						players[i] takeAllWeapons();
						players[i] giveWeapon("knife_mp");
						players[i] switchToWeapon("knife_mp");
					}
				}
				return;
			}
		}
	}
}

moveDoorWithoutHoldingTheWholeScriptBackOnTheWaittill()
{
door = getEnt("old_door", "targetname");
	if(isDefined(door))
	{
	door moveY(-800,4);
	door waittill("movedone");
	door delete();
	}
}

onDeath_sniper() {
	self waittill("death");
	level.sniper_locked = false;
	level.jump_locked = false;
	level.old_locked = false;
	thread snip_room();
}

onDeath_jump() {
	self waittill("death");
	level.jump_locked = false;
	level.sniper_locked = false;
	level.old_locked = false;
	thread jump_room();
}

onDeath_old() {
	self waittill("death");
	level.old_locked = false;
	level.sniper_locked = false;
	level.jump_locked = false;
	thread old_room();
}