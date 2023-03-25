main()
{
// Doors \\
	thread door1();
// Misc \\
	thread onPlayerConnect();
	thread credits();
	thread rotate1();
	thread rotate2();
	thread platform1();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread teleport5();
// Music Menu \\
	thread initMusic();
	thread musictrig();
// Traps \\
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
// End Rooms \\
	thread sniper();
	thread knife();
	thread games();
	thread died();
// Must Haves \\
	thread setUp();
	thread addTestClients();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );

	setdvar("compassmaxrange","1600");

	addTriggerToList ("t1_s");
	addTriggerToList ("t2_s");
	addTriggerToList ("t3_s");
	addTriggerToList ("t4_s");
	addTriggerToList ("t5_s");
	addTriggerToList ("t6_s");
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

// Misc Scripts \\

spawn_message()
{
	self waittill("spawned_player");

	wait 2;

	for(Idx = 0;Idx < 5;Idx++)
		self IPrintLn(" ");

	self iPrintLn("^7->xFire - ^3pun1sh3r99");
	self iPrintLn("^7->Steam - ^3pun1sh3r99");
	self iPrintLn("^7->Map Created By - ^3JynX^7*");
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread spawn_message();

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
		hud_clock.label = &"^7>> ^3Map Experts -> ^7Made By ^3JynX ^7<<";
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
		hud_clock.label = &"^7>> ^3Special thanks to ^7pXg|^3Manix ^7<<";
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
		hud_clock.label = &"^7>> ^3Visit www.pxg.me ^7<<";
		hud_clock SetPulseFX( 40, 5400, 200 );
		wait 6;
		wait 300;
	}
}
rotate1()
{
	rotate_obj = getentarray("rotate1","targetname");
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate1();
}
ra_rotate1()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";

	for(;;)
	{
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
rotate2()
{
	rotate_obj = getentarray("rotate2","targetname");
	if(isdefined(rotate_obj))
		for(i=0;i<rotate_obj.size;i++)
			rotate_obj[i] thread ra_rotate2();
}
ra_rotate2()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";

	for(;;)
	{
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
platform1()
{
	p = getEnt ("platform1","targetname");

	while(1)
	{
		p moveX (-656,5);
		p waittill ("movedone");
		wait 3;
		p moveX (656,1);
		p waittill ("movedone");
		wait 3;
	}
}
teleport1()
{
	entTransporter = getentarray("acti2","targetname");
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
		wait(0.10);
	}
}
teleport2()
{
	entTransporter = getentarray("acti3","targetname");
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
teleport3()
{
	entTransporter = getentarray("acti4","targetname");
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
teleport4()
{
	entTransporter = getentarray("acti5","targetname");
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
		wait(0.10);
	}
}
teleport5()
{
	entTransporter = getentarray("acti6","targetname");
	if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter5();
  }
}
transporter5()
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

// Music Menu Script \\

// Blades's Music menu - changes by JynX \\
initMusic()
{
		level.music = [];

        i = 0;
		level.music[i]["artist"] = "Skism";
		level.music[i]["title"] = "Experts (Original Mix)";
		level.music[i]["alias"] = "sound1";

		i++;
		level.music[i]["artist"] = "Feed Me";
		level.music[i]["title"] = "One Click Headshot";
		level.music[i]["alias"] = "sound2";

		i++;
		level.music[i]["artist"] = "Disturbed";
		level.music[i]["title"] = "Stupify";
		level.music[i]["alias"] = "sound3";

		i++;
		level.music[i]["artist"] = "Three Days Grace";
		level.music[i]["title"] = "Break";
		level.music[i]["alias"] = "sound4";

		i++;
		level.music[i]["artist"] = "Jake Miller";
		level.music[i]["title"] = "Runnin'";
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
	self.hud_music[i] setText( "^7<<< ^3Music Menu ^7>>>" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "<<< ^3Select a Song ^7>>>" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^3[^7USE^3]^7: Play Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "^7<<< ^3 Visit pxg.me for more ^7>>>" );

	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";

		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^3-^7 " + entry["title"] );
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
			iPrintln( "^3Now playing: ^7" + level.music[self.selection]["artist"]+" - ^3" +level.music[self.selection]["title"] );

			ambientPlay( level.music[self.selection]["alias"], 3 );
			self freezeControls(0);
			level notify ( "song_picked" );
			self braxi\_rank::giveRankXp( "", 25 );
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
	trigger = getEnt ( "music_menu", "targetname" );
	trigger setHintString( "Press ^3[^7USE^3] ^7to choose Music" );

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

// Door Scripts \\

door1()
{
	d = getEnt ("door1","targetname");
	wait 10;
	d moveZ (-180,3);
	d waittill ("movedone");
	d delete();
}

// Trap Scripts \\

trap1()
    {
            trig = getEnt ("t1_s", "targetname");
            trap01_a  = getEnt ("trap01_a ", "targetname");
            trap01_b = getEnt ("trap01_b", "targetname");
            trap01_c = getEnt ("trap01_c", "targetname");
            trap01_d = getEnt ("trap01_d", "targetname");

        trig waittill ("trigger", player);

            trig delete();

            x = RandomInt( 4 );

            if (x==1)
            {
                    trap01_a notSolid();
                    trap01_d notSolid();
            }

            else if (x==2)
            {
                    trap01_b notSolid();
                    trap01_c notSolid();
            }

            else if (x==3)
            {
                    trap01_c notSolid();
                    trap01_a notSolid();
            }

            else
            {
                    trap01_b notSolid();
                    trap01_d notSolid();
            }
    }
trap2()
{
	t2_right = getEnt ("t2_right","targetname");
	t2_left = getEnt ("t2_left","targetname");
	t2_hurt_left = getEnt ("t2_hurt_left","targetname");
	t2_hurt_right = getEnt ("t2_hurt_right","targetname");
		t = getEnt ("t2_s","targetname");
	t2_hurt_left enablelinkto();
	t2_hurt_left linkto (t2_left);
	t2_hurt_right enablelinkto();
	t2_hurt_right linkto (t2_right);
		t waittill ("trigger", player);
			t delete();
		wait 0.1;

		t2_right moveY (-64,1);
		t2_left moveY (64,1);
		t2_right waittill ("movedone");
		t2_left waittill ("movedone");
		wait 0.1;
		t2_right delete();
		t2_left delete();
		t2_hurt_left delete();
		t2_hurt_right delete();
		wait 20;
}
trap3()
{
	t = getEnt ("t3","targetname");
	tr = getEnt ("t3_s","targetname");
		tr waittill ("trigger", player);
			tr delete();

			wait 0.1;

			t moveZ (-544,1);
			t waittill ("movedone");
			t moveZ (544,1);
			t waittill ("movedone");
			wait 300;
}
trap4()
{
	rotate_obj = getentarray("t4","targetname");
	t = getEnt ("t4_s","targetname");
		t waittill ("trigger", player);
			t delete();
				if(isdefined(rotate_obj))
				for(i=0;i<rotate_obj.size;i++)
				rotate_obj[i] thread ra_rotate10();
}
ra_rotate10()
{
	if (!isdefined(self.speed))
		self.speed = 10;
	if (!isdefined(self.script_noteworthy))
		self.script_noteworthy = "z";

	for(;;)
	{
		while(1)
		{
			// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
			if (self.script_noteworthy == "z")
				self rotateYaw(360,self.speed);
			else if (self.script_noteworthy == "x")
				self rotateRoll(360,self.speed);
			else if (self.script_noteworthy == "y")
				self rotatePitch(360,self.speed);
			wait (self.speed-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
			// self waittill("rotatedone");
		}
	}
}
trap5()
{
	t = getEnt ("t5", "targetname");
		ts = getEnt ("t5_s","targetname");
			ts waittill ("trigger", player);
				ts delete();
	wait 0.1;
	t delete();
}
trap6()
{
	t = getEnt ("t6","targetname");
	ts = getEnt ("t6_s","targetname");
	t_h = getEnt ("t6_hurt","targetname");
		ts waittill ("trigger", player);
			ts delete();
	t_h enablelinkto();
	t_h linkto(t);
	wait 0.1;
	t moveZ (-161,1);
	t waittill ("movedone");
}

// End Room Scripts \\

sniper()
{
     	level.snip_trig = getEnt( "snipe", "targetname");
     	jump = getEnt( "snipe_jumper", "targetname" );
     	acti = getEnt( "snipe_activator", "targetname" );

     	while(1)
     	{
         	level.snip_trig waittill( "trigger", player );
         	if( !isDefined( level.snip_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "remington700_mp" );
	 	player givemaxammo( "remington700_mp" );
		player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip( "deserteagle_mp", 0 );
		player setweaponammostock( "deserteagle_mp", 0 );
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "remington700_mp" );
	 	level.activ givemaxammo( "remington700_mp" );
		level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );
		iPrintlnBold( " ^3" + player.name + " ^7 has entered the ^3Sniper room^7!" );
		wait .5;
         	player switchToWeapon( "remington700_mp" );
         	level.activ SwitchToWeapon( "remington700_mp" );
		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^3[ ^73 ^3]" );
		level.activ iPrintlnBold( "^3[ ^73 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^72 ^3]" );
		level.activ iPrintlnBold( "^3[ ^72 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^71 ^3]" );
		level.activ iPrintlnBold( "^3[ ^71 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^7Good Luck! ^3]" );
		level.activ iPrintlnBold( "^3[ ^7Good Luck! ^3]" );
		player freezecontrols(false);
		level.activ freezecontrols(false);
     	}
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
		iPrintlnBold( " ^3" + player.name + " ^7 has entered the ^3Knife room^7!" );
		wait .5;
         	player switchToWeapon( "knife_mp" );
         	level.activ SwitchToWeapon( "knife_mp" );
		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^3[ ^73 ^3]" );
		level.activ iPrintlnBold( "^3[ ^73 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^72 ^3]" );
		level.activ iPrintlnBold( "^3[ ^72 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^71 ^3]" );
		level.activ iPrintlnBold( "^3[ ^71 ^3]" );
		wait 1;
		player iPrintlnBold( "^3[ ^7Good Luck! ^3]" );
		level.activ iPrintlnBold( "^3[ ^7Good Luck! ^3]" );
		player freezecontrols(false);
		level.activ freezecontrols(false);
     	}
}
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
	 	iPrintlnBold( " ^3" + player.name + " ^7 has ^3entered the ^7games section^3!" );
         	player TakeAllWeapons();
			player giveWeapon ("deserteagle_mp");
			player giveMaxAmmo ("desertealge_mp");
			player switchtoweapon("deserteagle_mp");
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
	iPrintlnBold("^1"+self.name+"^7 has ^1died^7!");
	iPrintlnBold("^1The Minigames Section is now ^7OPEN^1.");
}

// Map Must Haves \\

setUp()
{
	// setDvar("dr_jumpers_speed", 1.1);
}
addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();

        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}
TestClient(team)
{
    self endon( "disconnect" );

    while(!isdefined(self.pers["team"]))
        wait .05;

    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}