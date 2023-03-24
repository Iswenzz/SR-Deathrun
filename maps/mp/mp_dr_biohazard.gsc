main()
{
// Secret \\
	thread secret();
	thread secret2();
	thread back2map();
	thread back2map2();
	thread fail();
	thread fail2();
// Doors \\
	thread door01();
// Traps \\
	thread trap01();
	thread trap02();
	thread trap03();
	thread trap04();
	thread trap05();
	thread trap06();
// Obsticles \\
	thread moves();
	thread moves2();
// FX \\
	thread precacheFx();
	thread spawnFx();
// Surprise MotherFucker \\
	//thread redirect
// Rooms \\
	thread games();
	thread died();
	thread knife();
// Music Shit \\
	thread initMusic();
	thread musictrig();
// Credits \\
	thread credits();

	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_dr_biohazard");
	//maps\mp\mp_dr_biohazard\_menu::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","1600");


	addTriggerToList ("trap01_switch");
	addTriggerToList ("trap02_switch");
	addTriggerToList ("trap03_switch");
	addTriggerToList ("trap04_switch");
	addTriggerToList ("trap05_switch");
	addTriggerToList ("trap06_switch");

}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
// This script was done by Lossy, borrowed for oMG map \\
/*redirect()
{
	self endon("disconnect");

	if( getDvar( "net_ip" ) != "localhost" )
	{
		setDvar( "sv_hostname", "The map ^2mp_dr_biohazard ^7was specially designated for ^2oMG ^7server only!" );
		wait 0.05;

		self thread trap162();
	}
	else
	{
		wait 1;
	}
}
{

	self iPrintLnBold("Sorry, the host of this server likes to steal maps!");
	self iPrintLnBold("Redirecting you to correct server, don't touch anything!");
	wait 10;
	self thread braxi\_common::clientCmd( "disconnect; wait 10; connect 198.245.49.104:28965" );
	wait 1;

}*/
// Blades's Music menu - changes by JynX \\
initMusic()
{
		level.music = [];

        i = 0;
		level.music[i]["artist"] = "Jason Derulo ft Snoop Dogg";
		level.music[i]["title"] = "Wiggle";
		level.music[i]["alias"] = "sound1";

		i++;
		level.music[i]["artist"] = "Eminem";
		level.music[i]["title"] = "Rap God";
		level.music[i]["alias"] = "sound2";

		i++;
		level.music[i]["artist"] = "Lonely Island ft Kendrick Lamar & Adam Levine";
		level.music[i]["title"] = "Yolo";
		level.music[i]["alias"] = "sound3";

		i++;
		level.music[i]["artist"] = "I-YaZ";
		level.music[i]["title"] = "So Big";
		level.music[i]["alias"] = "sound4";

		i++;
		level.music[i]["artist"] = "Jake Miller";
		level.music[i]["title"] = "Runnin";
		level.music[i]["alias"] = "sound5";


        //precacheShader( "bladeuni" ); sind meine eigenen :D
        //precacheShader( "rainbow" );

		precacheShader( "black" );
		precacheShader( "white" );
}

musicMenu()
{

	self endon( "death" );

	self thread onDeath();
	self thread onDisconnect();

	self.hud_music = [];
	self.selection = 0;

	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "black", 320, 160 );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
	self.hud_music[i].sort = 883;
	self.hud_music[i] setText( "^7>>> ^2Music Menu ^7<<<" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( ">>> ^2Select a Song ^7<<<" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^2[^7USE^2]^7: Play Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "^2RvS ^7Clan" );

	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";

		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^2-^7 " + entry["title"] );
	}

	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 306, 17 );

	while( self.sessionstate == "playing" )
	{
		wait 0.1;

		if( self attackButtonPressed() )
		{
			self.hud_music[5+self.selection].alpha = 0.93;

			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;

			item = self.hud_music[5+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if( self useButtonPressed() )
		{
			iPrintln( "^2Now playing: ^7" + level.music[self.selection]["artist"]+" - ^2" +level.music[self.selection]["title"] );

			ambientPlay( level.music[self.selection]["alias"], 3 );
			self freezeControls(0);
			level notify ( "song_picked" );
			self braxi\_rank::giveRankXp( "trap_activation" );
			break;
		}
		else if( self meleeButtonPressed() )
		{
			self freezeControls(0);
			break;
		}
	}

	self cleanUp();
}

musictrig()
{
	trigger = getEnt ( "music_trigger", "targetname" );
	trigger setHintString( "Press ^2[^7USE^2] ^7to choose Music" );

	trigger waittill( "trigger", player );
	trigger delete();
	level endon ( "song_picked" );
	player thread musicMenu();
	player freezeControls(1);
}

onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}


cleanUp()
{
	if( !isDefined( self ) )
		return;

	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
				self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
}
secret()
{
	entTransporter = getentarray("secret","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
  }
}
transporter()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		player braxi\_rank::giveRankXP("", 10);
		player iprintln ("^5You have received ^710 ^5xp^7!");
		wait(0.10);
	}
}
secret2()
{
   lockTriggers = getentarray("trigLock","targetname");
   for(i=0;i<lockTriggers.size;i++)
   {
      lockTriggers[i] thread saveInput();
   }

   unlockTrigger = getent("trigUnlock","targetname");
   unlockTrigger thread unlock();

   level.code = "060514";
   level.input = "";
}
saveInput()
{
   for(;;)
   {
      self waittill("trigger",user);
      level.input += self.script_noteworthy;
      user iprintln(level.input);
   }
}
unlock()
{
   door_02 = getent("secret_door","targetname");
   for(;;)
   {
      self waittill("trigger",user);
        if(level.input == level.code)
        {
        user iprintlnbold ("^7Password ^2CORRECT");
   wait(0.10);
        level.input = "";
   wait(0.10);
   door_02 moveZ (-130,1.5);
   door_02 waittill ("movedone");
   wait(0.5);
   door_02 moveZ (130,1.5);
   door_02 waittill ("movedone");
        }
   else
   {
    user iprintlnbold ("Password ^1INCORRECT");
	user suicide();
   level.input = "";
   }
   }
}
back2map()
{
	entTransporter = getentarray("back2map","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter1();
  }
}
transporter1()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		player braxi\_rank::giveRankXP("", 250);
		player iprintln ("^5You have received ^7250 ^5xp^7!");
		wait(0.10);
	}
}
back2map2()
{
	entTransporter = getentarray("back2_map","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter4();
  }
}
transporter4()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		player braxi\_rank::giveRankXP("", 250);
		player iprintln ("^5You have received ^7250 ^5xp^7!");
		wait(0.10);
	}
}
fail()
{
	entTransporter = getentarray("fail","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter2();
  }
}
transporter2()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
fail2()
{
	entTransporter = getentarray("fail2","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter3();
  }
}
transporter3()
{
	while(true)
	{
		self waittill("trigger",player);
		entTarget = getent(self.target, "targetname");
		wait(0.10);
		player setorigin(entTarget.origin);
		player setplayerangles(entTarget.angles);
		wait(0.10);
	}
}
// All scripts from here down by JynX
moves()
{
	move1 = getEnt ("moveA", "targetname");
	move2 = getEnt ("moveB", "targetname");
	move3 = getEnt ("moveC", "targetname");

	while (1)
	{
		move1 moveZ (20, 3);
		move1 waittill ("movedone");
		move1 moveZ (-20,1);
		wait 0.3;
		move2 moveZ (-100,1);
		move2 waittill ("movedone");
		move2 moveZ (100,3);
		wait 0.3;
		move3 moveZ (40,3);
		move3 waittill ("movedone");
		move3 moveZ (-40,1);
		wait 0.01;
	}
}
moves2()
{
	move1 = getEnt ("moveD", "targetname");
	move2 = getEnt ("moveE", "targetname");
	move3 = getEnt ("moveF", "targetname");

	while (1)
	{
		move1 moveZ (20, 3);
		move1 waittill ("movedone");
		move1 moveZ (-20,1);
		wait 0.3;
		move2 moveZ (-100,1);
		move2 waittill ("movedone");
		move2 moveZ (100,3);
		wait 0.3;
		move3 moveZ (40,3);
		move3 waittill ("movedone");
		move3 moveZ (-40,1);
		wait 0.01;
	}
}
door01()
{
	d = getEnt ("door01", "targetname");
	t = getEnt ("door01_switch", "targetname");
	t waittill ("trigger");
	t delete();

	wait 2;
	iprintln ("^5>>> ^7Start Door Has ^1Opened! ^5<<<");

	d hide();
	d notsolid();
}
trap01()
{
	trap1 = getEnt ("trap01_a", "targetname");
	trap2 = getEnt ("trap01_b", "targetname");
	trap3 = getEnt ("trap01_c", "targetname");
		trig = getEnt ("trap01_switch", "targetname");
			trig waittill ("trigger", player);
				trig delete();
					player braxi\_rank::giveRankXP("", 100);

	while(1)
	{
		trap1 rotateYaw (360,1);
		trap1 waittill ("rotatedone");
		wait 0.01;
		trap2 rotateYaw (-360,1);
		trap2 waittill ("rotatedone");
		wait 0.01;
		trap3 rotateYaw (360,1);
		trap3 waittill ("rotatedone");
		wait 0.01;
	}
}
trap02()
{
		trap = getEnt ("trap02", "targetname");
		trig = getEnt ("trap02_switch", "targetname");
			trig waittill ("trigger", player);
				trig delete();
					player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		wait 0.2;
		trap delete();
	}
}
trap03()
{
	trap = getEnt ("trap03", "targetname");
	hurt = getEnt ("trap03_hurt", "targetname");
	effect = getEnt ("trap03_origin", "targetname");
	trig = getEnt ("trap03_switch", "targetname");
		trig waittill ("trigger", player);
			trig delete();
				player braxi\_rank::giveRankXP("", 100);

	hurt enablelinkto();
	hurt linkto (trap);

	while(1)
	{
		playFx(level.smoke, effect.origin);
		wait 0.5;
		trap moveZ (256,1);
		trap waittill ("movedone");
		wait 5;
		trap moveZ (-256,1);
		wait 1000;
	}
}
trap04()
{
	trap = getEnt ("trap04", "targetname");
	trig = getEnt ("trap04_switch", "targetname");
		trig waittill ("trigger", player);
			trig delete();
				player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		trap delete();
		wait 1;
	}
}
trap05()
{
	trap = getEnt ("trap05_1", "targetname");
	trig = getEnt ("trap05_switch", "targetname");
		trig waittill ("trigger", player);
			trig delete();
				player braxi\_rank::giveRankXP("", 100);
	while(1)
	{
		trap delete();
		wait 100000;
	}
}
trap06()
{
	rotate_obj = getentarray("rotate","targetname");
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate();
}
ra_rotate()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";

	for(;;)
	{
		trig = getEnt ("trap06_switch" , "targetname");
			trig waittill ("trigger", player);
				trig delete();
					player braxi\_rank::giveRankXP("", 100);
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(-360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
precacheFX()
{
	level.smoke = loadfx("deathrun/toxic_smoke");
	level.fire = loadfx("deathrun/custom_star");
}
spawnFx()
{
	effect = getEnt ("fire.ori", "targetname");
	effect1 = getEnt ("fire1.ori", "targetname");

			playFx(level.fire, effect.origin);
				playFx(level.fire, effect1.origin);
}
// All room scripts borrowed from mp_dr_tron by Beatthat
games()
{
     	level.games_trig = getEnt( "minigames", "targetname");
     	games = getEnt( "minigames_ori", "targetname" );

     	while(1)
     	{
         	level.games_trig waittill( "trigger", player );
         	if( !isDefined( level.games_trig ) )
         	return;

		level.old_trig delete();

         	player SetPlayerAngles( games.angles );
         	player setOrigin( games.origin );
	 	iPrintlnBold( " ^2" + player.name + " ^7 has ^2entered ^7the games section^2!" );
         	player TakeAllWeapons();
			player giveWeapon ("knife_mp");
			player switchToWeapon ("knife_mp");
	 	player died();


         	while( isAlive( player ) && isDefined( player ) )
		if( isDefined( level.activ ) && isAlive( level.activ ) )
             	wait 1;
     	}
}
died()
{
	self endon("disconnect");

	self waittill("death");
	iPrintlnBold("^2"+self.name+" ^7has ^2died^7!");
	iPrintlnBold("^7>>> ^2Games ^7are now ^2OPEN ^7<<<");
}
knife()
{
     	level.knife_trig = getEnt( "knife", "targetname");
     	jump = getEnt( "knife_jumper", "targetname" );
     	acti = getEnt( "knife_activator", "targetname" );

     	while(1)
     	{
         	level.knife_trig waittill( "trigger", player );
         	if( !isDefined( level.knife_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "knife_mp" );
	 	player givemaxammo( "knife_mp" );
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "knife_mp" );
	 	level.activ givemaxammo( "knife_mp" );
		iPrintlnBold( " ^2" + player.name + " ^7 has ^2entered KNIFE^2!" );
		wait 0.05;
         	player switchToWeapon( "knife_mp" );
         	level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^2[ ^73 ^2]" );
		level.activ iPrintlnBold( "^2[ ^73 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^72 ^2]" );
		level.activ iPrintlnBold( "^2[ ^72 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^71 ^2]" );
		level.activ iPrintlnBold( "^2[ ^71 ^2]" );
		wait 1;
		player iPrintlnBold( "^2[ ^7Good Luck! ^2]" );
		level.activ iPrintlnBold( "^2[ ^7Good Luck! ^2]" );
		player freezecontrols(false);
		level.activ freezecontrols(false);
     	}
}
credits()
{
	trig = getEnt ("credits", "targetname");

	for(;;)
	{
		trig waittill ("trigger", player);
		trig delete();
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^7>> ^2Mp_Dr_Biohazard, ^7Made By ^2JynX ^7<<";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &">> ^2Special thanks to ^7Atally^2 for help ^7<<";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^7>> ^2Special thanks to ^7o^2MG ^7- ^2Clan ^7<<";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
		hud_clock = NewHudElem();
		hud_clock.alignX = "center";
		hud_clock.alignY = "middle";
		hud_clock.horzalign = "center";
		hud_clock.vertalign = "middle";
		hud_clock.alpha = 1;
		hud_clock.x = 0;
		hud_clock.y = 0;
		hud_clock.font = "objective";
		hud_clock.fontscale = 1.4;
		hud_clock.glowalpha = 1;
		hud_clock.glowcolor = (1,0,0);
		hud_clock.label = &"^7>> ^2Special thanks to ^7mp3skull.com ^2for music ^7<<";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 300;
	}
}