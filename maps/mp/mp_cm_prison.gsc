//Map by CM'Death
//Discord:Death#7416
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_common;
#include braxi\_rank;

main()
{
 maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"]= "desert";

	// setdvar("g_speed" ,"210");
	// setdvar("dr_jumpers_speed" ,"1.12");
	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);

level.ss_on = 0;

    addTriggerToList("trig_trap1");
	addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");

    precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");
    precacheItem("beretta_mp");
    precacheItem("deserteagle_mp");

    thread messages();
    thread arrow();
    thread music();
    thread prisondoor1();
    thread prisondoor2();
    thread prisondoor3();
    thread housedoor();
    thread freexp();
    thread minepm();
    thread teleport1();
    thread teleport2();
    thread teleport3();
    thread sectp();
    thread roomselection();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread kniferoom();
    thread purestraferoom();
    thread slidestraferoom();
    thread oldroom();
    thread sniperroom();
    thread simonsaysroom();
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^6" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^6" + jumper + " ^3VS^3 " + "^6" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

DoorHUD(messages)
{
    self notify("newFhud");
    self endon("newFhud");

    waitTime = 4; //s
    offset = 400; //ms

    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();

    level.hud_door = createHUD( 0, 85, "center", "middle", 1, "objective", 1.5 );
    level.hud_door setText("^0Map ^6Prison.");
    level.hud_door setPulseFX( 40, waitTime*1000-offset, offset );

	level.hud_door2 = createHUD( 0, 100, "center", "middle", 1, "objective", 1.5 );
    level.hud_door2 setText("^0Map by ^6CM'Death");
    level.hud_door2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_door)) level.hud_door destroy();
	if (isDefined(level.hud_door2)) level.hud_door2 destroy();
}

messages()
{
   wait 5;
   thread doorHUD("messages");
   wait 8;
   for(;;)
{
   wait 7;
  x = randomintrange(0,5);

   if (x==0)
{
   iPrintln("^6Mapped ^7and ^6scripted ^7by ^6CM'Death");
}

   if (x==1)
{
   iPrintln("^7Visit: ^6teamcmdr^7.^6clanwebsite");
}

   if (x==2)
{
   iPrintln("^6CM'^6Deathrun ^7IP: ^6cm^7-^6clan^7.^6com^7:^628960");
}

if (x==3)
{
   iPrintln("^7Discord:^6Death#7416");
}

if (x==4)
{
   iPrintln("^7Thanks ^6CM'Exe ^7for fixing ^6SimonSays Room ^7<3");
}

if (x==5)
{
   iPrintln("^6Feel free to report any bugs.");
}

}
}

arrow()
{
   block1 = getent("arrow","targetname");
   block2 = getent("arrowb","targetname");

	for(;;)
   {
   wait 5;
   block1 moveZ (20, 6);
   block2 moveZ (15, 6);
   wait 5;
   block1 moveZ (-20, 6);
   block2 moveZ (-15, 6);

   }

}

music()
{
	trig = getEnt("music","targetname");

	trig setHintString("^6>> ^7Music ^6<<");

	trig waittill("trigger",player);

	trig delete();


    music = randomInt(6);

    switch(music)
    {

        case 0:
            ambientStop(2);
			ambientPlay("p1", 2);
            iPrintLn("^6>>^0Now playing: Can't hold us.^6<<");
        break;

        case 1:
            ambientStop(2);
			ambientPlay("p2", 2);
            iPrintLn("^6>>^0Now playing: All around the world.^6<<");
        break;

        case 2:
            ambientStop(2);
			ambientPlay("p3", 2);
            iPrintLn("^6>>^0Now playing: Old town road.^6<<");
        break;

		case 3:
            ambientStop(2);
			ambientPlay("p4", 2);
            iPrintLn("^6>>^0Now playing: Bad guy.^6<<");
        break;

        case 4:
            ambientStop(2);
			ambientPlay("p5", 2);
            iPrintLn("^6>>^0Now playing: Don't stop the party.^6<<");
        break;

        case 5:
            ambientStop(2);
			ambientPlay("p6", 2);
            iPrintLn("^6>>^0Now playing: Ain't my fault.^6<<");
        break;
    }
}

prisondoor1()
{
   door = getent("prisondoor","targetname");

   wait 5;
   door moveZ(-74, 6);
   wait 9;
   door delete();
}

prisondoor2()
{
   door = getent("prisondoor2a","targetname");
   door2 = getent("prisondoor2b","targetname");

   wait 12;
   door moveZ(90, 9);
   door2 moveZ(90, 9);
   wait 10;
   door delete();
   door2 delete();
}

prisondoor3()
{

   door1 = getent("prisondoor3a", "targetname");
   door2 = getent("prisondoor3b", "targetname");
   door_trigger = getent("trig_prisondoor3", "targetname");


   while(1)
   {

   door_trigger waittill ("trigger", player);
   player playlocalSound("container_door");
   door1 moveY (-88,3,1,1);
   door2 moveY (88,3,1,1);
   wait 5;

   door1 delete();
   door2 delete();
   door_trigger delete();
   }
}

housedoor()
{

   door = getent("housedoor", "targetname");
   door_trigger = getent("trig_housedoor", "targetname");
   tele1 = getent ("origin_actiend", "targetname");


   while(1)
   {

   door_trigger waittill ("trigger", player);
   player playlocalSound("wooddoor");
   door moveZ (107,4,1,1);
   wait 4;
     if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin(tele1.origin);
            level.activ setPlayerAngles(tele1.angles);
            wait 5;
         }
   door delete();
   door_trigger delete();

   }
}

teleport1()
{
   trig = getent("trig_tpa", "targetname");
   tele1 = getent ("origin_tpa", "targetname");

   for(;;)
    {
      trig waittill("trigger", player);
      player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

teleport2()
{
   trig = getent("trig_actitp1", "targetname");
   tele1 = getent ("origin_actitp1", "targetname");

   for(;;)
    {
      trig waittill("trigger", player);
      player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

teleport3()
{
   trig = getent("trig_actitp2", "targetname");
   tele1 = getent ("origin_actitp2", "targetname");

   for(;;)
    {
      trig waittill("trigger", player);
      player playlocalSound("tp");
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
    }
}

sectp()
{
   trig = getent("trig_sectp", "targetname");
   tele1 = getent ("origin_sectp", "targetname");

   for(;;)
    {
     trig setHintString("^6Magic ^7will happen if you press ^6[&&1]^7...");
     trig waittill("trigger", player);
	  player setOrigin(tele1.origin);
     player setPlayerAngles(tele1.angles);
     iPrintLnBold ("^6" + player.name + " ^7got scamed. ^6Huehue.");
     player braxi\_rank::giveRankXP("", 8000);
     trig delete();
    }
}

roomselection()
{
level.room_trig = getEnt( "trig_roomsele", "targetname");
room = getEnt( "origin_room", "targetname" );
level.room_trig setHintString ("^6Press ^3[&&1]^7 to enter ^6Selection Room^7!");

for(;;)
{
level.room_trig waittill( "trigger", player );
if( !isDefined( level.room_trig ) )
return;

iPrintlnBold( " ^6" + player.name + " ^7is picking a room^6!" );
acti = GetActivator();
if(level.firstenter == true)
{
	acti freezeControls(1);
	acti iPrintLnBold("^6Player ^7is picking room so don't move^6!");
	level notify("acti_antiglitch");
	level.firstenter = false;
}
player SetPlayerAngles( room.angles );
player setOrigin( room.origin );
player TakeAllWeapons();
player antiglitcher();
}
}

antiglitcher()
{
level.activator1 = GetActivator();
level.activ = GetActivator();
self common_scripts\utility::waittill_any("death","disconnect");
//self waittill("death");
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		//wait 3;
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");
//level.activKills++;
//thread killstreak();
	iPrintln("^6"+self.name+" ^7died");
	wait 0.2;
	iPrintlnBold("^6Room selection opened^7!");
}

trap1()
{
    platform = getent("trap1", "targetname");
    trig = getent("trig_trap1", "targetname");
    trig setHintString("^6Drop them down^7!");
	trig waittill("trigger", player);
	trig setHintString("^1Activated.");

	for(;;)
	{
	platform notsolid();
    platform hide();
	wait 3;
	platform solid();
    platform show();
	wait 3;
	}
}

trap2()
{

   block1 = getent("trap2a", "targetname");
   block3 = getent("trap2c", "targetname");
   block4 = getent("trap2d", "targetname");
   block6 = getent("trap2f", "targetname");
   trig = getent("trig_trap2", "targetname");
   trig setHintString("^6Rotate the Blocks");
   trig waittill ("trigger");
   trig setHintString("^1Activated");

   for(;;)
  {
   wait 0.1;
   block1 rotateYaw (-360,2);
   block3 rotateYaw (-360,2);
   block4 rotateYaw (360,2);
   block6 rotateYaw (360,2);
   wait 0.1;
   }
}

trap3()
{

   caulk = getent("trap3", "targetname");
   trig = getent("trig_trap3", "targetname");
   hurt = getent("trap3_hurt", "targetname");
   trig setHintString("^6Shoot them!");

   hurt enablelinkto();
   hurt linkto (caulk);

   for(;;)
   {

   trig waittill ("trigger", player);
   player playlocalSound("g36");
   trig setHintString("^1Activated.");
   caulk moveZ (-114,3,1,1);
   player playlocalSound("g36snd");
   wait 3;
   caulk moveZ (114,3,1,1);
   wait 3;

   }
}

trap4()
{

   laser = getent("trap4a", "targetname");
   laserb = getent("trap4b", "targetname");
   laserc = getent("trap4c", "targetname");
   laserd = getent("trap4d", "targetname");
   lasere = getent("trap4e", "targetname");
   laserf = getent("trap4f", "targetname");
   trig = getent("trig_trap4", "targetname");
   hurta = getent("trap4_hurta", "targetname");
   hurtb = getent("trap4_hurtb", "targetname");
   hurtc = getent("trap4_hurtc", "targetname");
   hurtd = getent("trap4_hurtd", "targetname");
   hurte = getent("trap4_hurte", "targetname");
   hurtf = getent("trap4_hurtf", "targetname");
   trig setHintString("^6Activate Lasers in mine!^7.");

   hurta enablelinkto();
   hurta linkto (laser);

   hurtb enablelinkto();
   hurtb linkto (laserb);

   hurtc enablelinkto();
   hurtc linkto (laserc);

   hurtd enablelinkto();
   hurtd linkto (laserd);

   hurte enablelinkto();
   hurte linkto (lasere);

   hurtf enablelinkto();
   hurtf linkto (laserf);

   trig waittill ("trigger");
   trig setHintString("^1Activated.");

   for(;;)
  {
   laser moveZ (-400,2);
   laserb moveZ (-400,2);
   laserc moveZ (-400,2);
   laserd moveZ (-400,2);
   lasere moveZ (-400,2);
   laserf moveZ (-400,2);
   wait 1;
   laser moveZ (400,2);
   laserb moveZ (400,2);
   laserc moveZ (400,2);
   laserd moveZ (400,2);
   lasere moveZ (400,2);
   laserf moveZ (400,2);
   wait 1;
   }
}

freexp()
{
    trig = getent("trig_freexp", "targetname");

for(;;)
{
 trig waittill("trigger", player);
 player iPrintLnBold("^6You saved prisoners from ^1fire^7,^6what a great man ^7:P");
 player braxi\_rank::giveRankXP("", 5000);
 trig delete();
 wait 0.5;
}
}

minepm()
{
trig = getent("trig_minepm", "targetname");

for(;;)
{
 trig waittill("trigger", player);
 iPrintLnBold("^6" + player.name + "^7 has reached ^6Mine ^7first^6!");
 player braxi\_rank::giveRankXP("", 2000);
 trig delete();
 wait 0.1;
}
}

kniferoom()
{
   level.trigger_knife = getEnt ("trig_knife", "targetname");

    jumperk = getEnt ("origin_jumperknife", "targetname");
    actik = getEnt ("origin_actiknife", "targetname");

    for(;;)
    {
        level.trigger_knife setHintString ("^7Press ^0[&&1]^7 to enter ^6Knife Room");
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();

        thread fightHUD("Knife Room", player, activator);
        activator thread endTimerPure("^6Let s Go !", 3, 0);
        player thread endTimerPure("^6Let s Go !", 3, 0);
		player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^7has died in ^6Knife Room!");
    }
}

purestraferoom()
{
   trigger_strafe = getEnt ("trig_purestrafe", "targetname");

    orig_jumper = getEnt ("origin_purejumper", "targetname");
    orig_acti = getEnt ("origin_pureacti", "targetname");

    for(;;)
    {
	    trigger_strafe setHintString ("^7Press ^0[&&1]^7 to enter ^6PureStrafe Room");
        trigger_strafe waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread fightHUD("PureStrafe Room", player, activator);
        player thread endTimerPure("^6Let s Go !", 3, 0);
        activator thread endTimerPure("^6Let s Go !", 3, 0);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("beretta_mp");
        activator giveWeapon("beretta_mp");
        player switchToWeapon ("beretta_mp");
        activator switchToWeapon("beretta_mp");
        player.maxhealth = 100;
		thread pureend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^7has died in ^6PureStrafe Room!");
    }
}

pureend(who, who2)
{
	trig = getEnt ("pureendtp", "targetname");
	origWin = getEnt ("purewinner", "targetname");
	origLose = getEnt ("purelooser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");

		if (winner == who)
			loser = who2;
		else
			loser = who;

		if (isDefined(loser))
		{
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
		}
	}
}

slidestraferoom()
{
   trigger_strafea = getEnt ("trig_slideroom", "targetname");

    orig_jumpera = getEnt ("origin_slidejumper", "targetname");
    orig_actia = getEnt ("origin_slideacti", "targetname");

    for(;;)
    {
	    trigger_strafea setHintString ("^7Press ^0[&&1]^7 to enter ^6SlideRoom");
        trigger_strafea waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();

        thread fightHUD("Slide Room", player, activator);
        player thread endTimerPure("^6Let s Go !", 3, 0);
        activator thread endTimerPure("^6Let s Go !", 3, 0);
        player setOrigin (orig_jumpera.origin);
        player setPlayerAngles (orig_jumpera.angles);
        activator setPlayerAngles(orig_actia.angles);
        activator setOrigin(orig_actia.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("beretta_mp");
        activator giveWeapon("beretta_mp");
        player switchToWeapon ("beretta_mp");
        activator switchToWeapon("beretta_mp");
        player.maxhealth = 100;
		thread slideend(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^7has died in ^6SlideRoom!");
    }
}

slideend(who, who2)
{
	trig = getEnt ("slideendtp", "targetname");
	origWin = getEnt ("slidewinner", "targetname");
	origLose = getEnt ("slidelooser", "targetname");

	while(1)
	{
		trig waittill("trigger", winner);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");

		if (winner == who)
			loser = who2;
		else
			loser = who;

		if (isDefined(loser))
		{
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
		}
	}
}

oldroom()
{
    platform = getent("olddrop", "targetname");
    trig = getent("trig_old", "targetname");

    trig setHintString ("^7Press ^3[&&1]^7 for ^6Old Room");
    trig waittill ("trigger", player);

	while(1)
	{

    player thread waitdead();
    activator = GetActivator();

    player giveWeapon("deserteagle_mp");
    player giveMaxAmmo("deserteagle_mp");
    player switchToWeapon("deserteagle_mp");
	platform notsolid();
	platform hide();
	wait 3;
	}
}

sniperroom()
{
    level.trigger_scope = getEnt ("trig_sniper", "targetname");

    jumpersc = getEnt ("sniper_jumper", "targetname");
    actisc = getEnt ("sniper_activator", "targetname");

    for(;;)
    {
        level.trigger_scope setHintString ("^7Press ^0[&&1]^7 to enter ^6Sniper Room");
        level.trigger_scope waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();

        thread fightHUD("Sniper Room", player, activator);
        activator thread endTimerPure("^6Let s Go !", 3, 0);
        player thread endTimerPure("^6Let s Go !", 3, 0);
		player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^7has died in ^6Sniper Room!");
    }
}

simonsaysroom()
{
    level.race = getent("ss_trig", "targetname");
	level.race_acti_tp = getent("ss_acti","targetname");
	level.race_jumper_tp = getent("ss_jumper","targetname");

    one = getent("ss_ss_one", "targetname");
	two = getent("ss_ss_two", "targetname");
	tree = getent("ss_ss_tree", "targetname");
	four = getent("ss_ss_four", "targetname");
	five = getent("ss_ss_five", "targetname");
	six = getent("ss_ss_six", "targetname");
	seven = getent("ss_ss_seven", "targetname");
	eight = getent("ss_ss_eight", "targetname");
	nine = getent("ss_ss_nine", "targetname");

    one hide();
	two hide();
	tree hide();
	four hide();
	five hide();
	six hide();
	seven hide();
	eight hide();
	nine hide();

	while(1)
    {
    	level.race setHintString ("^7Press ^3[&&1]^7 to enter ^6SimonSays Room");
        level.race waittill( "trigger", player );

    if(isDefined(level.actiBusy) && level.actiBusy == 1)
			player iprintlnbold("^6Activator is busy, wait a few seconds");
		else
		{
        if(!isDefined(level.race))
            return;

        if(!isdefined(level.activKills))
			level.playername = player.name;

		//player
		player freezeControls(1);
        player setOrigin(level.race_jumper_tp.origin);
		player setPlayerangles(level.race_jumper_tp.angles);
		player TakeAllWeapons();
		player SetClientDVAR("cg_thirdperson", 1);
        player thread endTimerPure("^6Let's Go !", 3, 0);

		//acti
		if (isDefined(level.activ) && isAlive(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.race_acti_tp.origin );
			level.activ setPlayerangles( level.race_acti_tp.angles );
			level.activ TakeAllWeapons();
			level.activ SetClientDVAR("cg_thirdperson", 1);
			level.activ thread endTimerPure("^6Let's Go !", 3, 0);
		}
        thread fightHUD("Simon Says Room", player, level.activ);

		wait 3;
		thread ss_game(player);
		thread ss_check(player);
		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^6" + player.name + " ^7has died in ^6Simon Says Room!");
		}
    }
}

ss_check(player)
{
	trig = getent("ss_losegame", "targetname");
	level.winner = getent("ss_winner", "targetname");
	level.loser = getent("ss_lose", "targetname");
	trig waittill("trigger", loser);
	level.wall hide();
	level.ss_on = 0;

	if (isDefined(level.activ) && loser == level.activ) //jumper wins
	{
		loser freezeControls(1);
		loser setOrigin( level.loser.origin );
		loser setPlayerAngles( level.loser.angles );
		loser iPrintLnBold("^6You have lost!");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");

		player freezeControls(1);
		player setOrigin(level.winner.origin);
		player setPlayerAngles(level.winner.angles);
		player iPrintLnBold("^6You won!");
		player SetClientDVAR("cg_thirdperson", 0);
		wait 4;
		player freezeControls(0);

		player giveWeapon("knife_mp");
		player giveMaxAmmo("knife_mp");
		player switchToWeapon("knife_mp");
	}
	else //activator wins
	{
		loser freezeControls(1);
		loser setOrigin(level.loser.origin);
		loser setPlayerAngles(level.loser.angles);
		loser iPrintLnBold("^6You have lost!");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");

		if (isDefined(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
			level.activ iPrintLnBold("^6You won!");
			level.activ SetClientDVAR("cg_thirdperson", 0);
			wait 4;
			player freezeControls(0);

			level.activ giveWeapon("knife_mp");
			level.activ giveMaxAmmo("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		else
			player iPrintLnBold("^5No activator ?!");
	}
}


ss_game(player)
{
    one = getent("ss_one", "targetname");
	two = getent("ss_two", "targetname");
	tree = getent("ss_tree", "targetname");
	four = getent("ss_four", "targetname");
	five = getent("ss_five", "targetname");
	six = getent("ss_six", "targetname");
	seven = getent("ss_seven", "targetname");
	eight = getent("ss_eight", "targetname");
	nine = getent("ss_nine", "targetname");

    ss_one = getent("ss_ss_one", "targetname");
	ss_two = getent("ss_ss_two", "targetname");
	ss_tree = getent("ss_ss_tree", "targetname");
	ss_four = getent("ss_ss_four", "targetname");
	ss_five = getent("ss_ss_five", "targetname");
	ss_six = getent("ss_ss_six", "targetname");
	ss_seven = getent("ss_ss_seven", "targetname");
	ss_eight = getent("ss_ss_eight", "targetname");
	ss_nine = getent("ss_ss_nine", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1)
	{
	    ss_one hide();
		ss_two hide();
		ss_tree hide();
		ss_four hide();
		ss_five hide();
		ss_six hide();
		ss_seven hide();
		ss_eight hide();
		ss_nine hide();

		colour = randomint(9);
		if (colour == 0)
		{
			hide = one;
			level.wall = one;
		    ss_one show();
		}
		if (colour == 1)
		{
			hide = two;
			ss_two show();
			level.wall = two;
		}
		if (colour == 2)
		{
			hide = tree;
			ss_tree show();
			level.wall = tree;
		}
		if (colour == 3)
		{
			hide = four;
			ss_four show();
			level.wall = four;
		}
		if (colour == 4)
		{
			hide = six;
			ss_six show();
			level.wall = six;
		}
		if (colour == 5)
		{
			hide = seven;
			ss_seven show();
			level.wall = seven;
		}
		if (colour == 6)
		{
			hide = five;
			ss_five show();
			level.wall = five;
		}
		if (colour == 7)
		{
			hide = eight;
			ss_eight show();
			level.wall = eight;
		}
		if (colour == 8)
		{
			hide = nine;
			ss_nine show();
			level.wall = nine;
		}

		wait(length);

        one hide();
		two hide();
		tree hide();
		four hide();
		five hide();
		six hide();
		seven hide();
		eight hide();
		nine hide();

		one notsolid();
		two notsolid();
		tree notsolid();
		four notsolid();
		five notsolid();
		six notsolid();
		seven notsolid();
		eight notsolid();
		nine notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

        one show();
		two show();
		tree show();
		four show();
		five show();
		six show();
		seven show();
		eight show();
		nine show();

		one solid();
		two solid();
		tree solid();
		four solid();
		five solid();
		six solid();
		seven solid();
		eight solid();
		nine solid();

		time += 1;
		length -= 0.25;


        if(time == 14 && isAlive(player))
		{
			player iprintlnbold("^6You finished SimonSays Room^7, now kill the ^1Activator^7.");
            player setOrigin(level.loser.origin);
            player setPlayerAngles(level.loser.angles);
            player SetClientDVAR("cg_thirdperson", 0);
			level.activ iprintlnbold("^6You finished SimonSays Room^7, now kill the ^1Jumper^7.");
            level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
            level.activ SetClientDVAR("cg_thirdperson", 0);
			player giveWeapon("knife_mp");
			level.activ giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}

waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife","targetname");
    slide = getent("trig_slideroom","targetname");
    sniper = getent("trig_sniper","targetname");
    pure = getent("ss_trig","targetname");
    old = getent("trig_old","targetname");
    knife thread maps\mp\_utility::triggerOff();
    slide thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    pure thread maps\mp\_utility::triggerOff();
    old thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    slide thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    pure thread maps\mp\_utility::triggerOn();
    old thread maps\mp\_utility::triggerOn();
}

endTimerPure(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^6" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

GetActivator()
{
	players = getentarray( "player", "classname" );

	for(i = 0;i < players.size;i++)
	{
		player = players[i];

		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}

	return "Noactivator";
}
