main()
{
	maps\mp\_load::main();
// Music Menu \\
	thread initMusic();
	thread musictrig();
// Doors \\
	thread startDoor();
// MisC \\
	thread onPlayerConnect();
	thread jynx_model();
	thread ppl_model();
	thread rotate_model();
	thread give_weapon();
// Traps \\
	thread trap01();
	thread trap02();
	thread trap03();
	thread trap04_a();
	thread trap04_b();
	thread trap04_c();
	thread trap05();
	thread trap06();
	thread trap07();
	thread trap08();
	thread trap09();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
// Rooms \\
	thread sniper();
	thread minigames();
// Surprise for VtX Fucks \\
	thread redirect();

	precacheModel( "playermodel_terminator" );
	precacheModel( "playermodel_mw3_juggernaunt" );
	precacheModel("viewhands_mw3_op_jugg");
	precacheItem ("rpg_mp");
	precacheItem ("l96a1_mp");
	precacheItem ("saw_mp");

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
	addTriggerToList ("t7_s");
	addTriggerToList ("t8_s");
	addTriggerToList ("t9_s");
	addTriggerToList ("t10_s");
	addTriggerToList ("t11_s");
	addTriggerToList ("t12_s");
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
// Blades's Music menu - changes by JynX \\
initMusic()
{
		level.music = [];

        i = 0;
		level.music[i]["artist"] = "JCode";
		level.music[i]["title"] = "Barbra Windsor";
		level.music[i]["alias"] = "sound1";

		i++;
		level.music[i]["artist"] = "DeStorm Power";
		level.music[i]["title"] = "Louis Vuitton";
		level.music[i]["alias"] = "sound2";

		i++;
		level.music[i]["artist"] = "Nicki Minaj";
		level.music[i]["title"] = "Anaconda";
		level.music[i]["alias"] = "sound3";

		i++;
		level.music[i]["artist"] = "DJ Khaled";
		level.music[i]["title"] = "All I Do Is Win";
		level.music[i]["alias"] = "sound4";

		i++;
		level.music[i]["artist"] = "T-Pain ft B.o.B";
		level.music[i]["title"] = "Up Down (Do This All Day)";
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
	self.hud_music[i] setText( "^7<<< ^1Music Menu ^7>>>" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "<<< ^1Select a Song ^7>>>" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^1[^7USE^1]^7: Play Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "^7<<< ^1--- RvS Gaming --- ^7>>>" );

	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";

		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^1-^7 " + entry["title"] );
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
			iPrintln( "^1Now playing: ^7" + level.music[self.selection]["artist"]+" - ^1" +level.music[self.selection]["title"] );

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
	trigger setHintString( "Press ^1[^7USE^1] ^7to choose Music" );

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
precacheFX()
{
	level._effect["end"] = loadfx("misc/ui_pickup_available");
}
spawnFX()
{
	playLoopedFx(level._effect["end"], 4, (13632, 0, -48), 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
}
startDoor()
{
	door = getEnt ("door1","targetname");
	wait 15;
	door moveZ (540,1);
	wait 0.1;
	door delete();
	iprintln ("^5*^7Door has ^1opened^7, begin!^5*");
}
spawn_message()
{
	self waittill("spawned_player");

	wait 2;

	for(Idx = 0;Idx < 5;Idx++)
		self IPrintLn(" ");

	self iPrintLn("^7->xFire - ^5pun1sh3r99");
	self iPrintLn("^7->Steam - ^5pun1sh3r99");
	self iPrintLn("^7->Skype - ^5tony.pun1sh3r");
	self iPrintLn("^7->Map Created By - ^5JynX^7*");
}
onPlayerConnect()
{
	for(;;)
	{
		level waittill( "connected", player );
		player thread spawn_message();

	}
}

jynx_model()
{
	guider1 = "ea4c8b0d4ac809dc05684336b6090cf2";//ea4c8b0d4ac809dc05684336b6090cf2
	trig = getEnt ("jynx", "targetname");
		for(;;)
			{

				trig waittill ("trigger", player);
				tpGuid = self getGUID();
				if((tpGuid == guider1))
				{
					player detachAll();
					player iPrintLn ("^5*^7Model Change ^1-> ^7In Progress^5*");
					player setModel ("playermodel_terminator");
					player SetViewModel ("viewhands_mw3_op_jugg");
					player iPrintLn ("^5*^7Model Change ^1-> ^7Completed^5*");
					wait 2;
				}
				else
				{
					iPrintlnBold ("^1" + player.name + "^7 tried to impersonate ^1JynX, ^7and suffered.");
					player suicide();
				}
			}
}
ppl_model()
{
	trig = getEnt ("every1_model", "targetname");
		for(;;)
			{
				trig waittill ("trigger", player);
				player detachAll();
				player iPrintLn ("^5*^7Model Change ^1-> ^7In Progress^5*");
				player setModel ("playermodel_mw3_juggernaunt");
				player SetViewModel ("viewhands_mw3_op_jugg");
				player iPrintLn ("^5*^7Model Change ^1-> ^7Completed^5*");
				wait 2;
			}
}
rotate_model()
{
	model = getEnt ("rotate_model","targetname");

	while(1)
	{
		model rotateYaw(-360,15);
		model waittill("rotatedone");
		wait 0.01;
	}
}
give_weapon()
{
	t = getEnt ("weapon","targetname");
	t waittill ("trigger", player);
	wait 0.1;
	player giveWeapon ("deserteagle_mp");
	player giveMaxAmmo ("deserteagle_mp");
}
trap01()
{
	t = getEnt ("t_1","targetname");
	tr = getEnt ("t1_s","targetname");
	hurt = getEnt ("t1_hurt","targetname");
		tr waittill ("trigger", player);
			tr delete();

	while(1)
	{
		hurt enablelinkto();
		hurt linkto (t);

		t rotateRoll(180,1);
		t waittill("rotatedone");
		wait 5;
		t rotateRoll(-180,1);
		t waittill("rotatedone");
		hurt unlink();
		wait 45;
	}
}
trap02()
{
	t = getEnt ("t_2","targetname");
	tr = getEnt ("t2_s","targetname");
		tr waittill ("trigger", player);
			tr delete();

	wait 0.1;
	t hide();
	wait 10;
	t show();
}
trap03()
    {
            trig = getEnt ("t3_s", "targetname");
            trap03_a  = getEnt ("trap03_a ", "targetname");
            trap03_b = getEnt ("trap03_b", "targetname");
            trap03_c = getEnt ("trap03_c", "targetname");
            trap03_d = getEnt ("trap03_d", "targetname");

        trig waittill ("trigger", player);

            trig delete();

            x = RandomInt( 4 );

            if (x==1)
            {
                    trap03_a notSolid();
                    trap03_d notSolid();
            }

            else if (x==2)
            {
                    trap03_b notSolid();
                    trap03_c notSolid();
            }

            else if (x==3)
            {
                    trap03_c notSolid();
                    trap03_a notSolid();
            }

            else
            {
                    trap03_b notSolid();
                    trap03_d notSolid();
            }
    }
trap04_a()
{
	t1 = getEnt ("trap04_a","targetname");
		tr = getEnt ("t4_s","targetname");
			tr waittill ("trigger", player);
				tr delete();
				spins = 999;
	while(1)
	{
		t1 rotateRoll (360*spins,2*spins);
		t1 waittill("rotatedone");
		wait 0.01;
	}
}
trap04_b()
{
	t2 = getEnt ("trap04_b","targetname");
	tr = getEnt ("t4_s","targetname");
			tr waittill ("trigger", player);
				tr delete();
				wait 0.1;
				t2 hide();
}
trap04_c()
{
	t3 = getEnt ("trap04_c","targetname");
	tr = getEnt ("t4_s","targetname");
			tr waittill ("trigger", player);
				tr delete();
				wait 0.1;
		t3 notsolid();
}
trap05()
{
	t = getEnt ("t_5","targetname");
	t hide();
	tr = getEnt ("t5_s","targetname");
		tr waittill ("trigger", player);
			iPrintlnBold ("Beware the Dick Slide!");
			tr delete();
	while(1)
	{
		t show();
		t moveZ (224,1);
		t waittill("movedone");
		wait 3;
		t moveZ (-224,3);
		t waittill("movedone");
		wait 0.1;
		t hide();
		wait 400;
	}
}
trap06()
{
	t = getEnt ("t_6","targetname");
	t hide();
	tr = getEnt ("t6_s","targetname");
		tr waittill ("trigger", player);
			tr delete();
	wait 0.1;
	t show();
	t moveY (449,1);
	t waittill("movedone");
	t delete();
}
trap07()
{
	t = getEnt ("t_7","targetname");
	t hide();
	hurt = getEnt ("t7_hurt","targetname");
	tr = getEnt ("t7_s","targetname");
		tr waittill ("trigger", player);
		iPrintlnBold ("HahahaHammer Time!");
			tr delete();
				wait 0.1;

				hurt enablelinkto();
				hurt linkto (t);

		t show();
		t moveZ (-140,0.1);
		t waittill("movedone");
		wait 0.1;
		t moveZ (140,0.1);
		t waittill("movedone");
		wait 0.1;
		t moveZ (-140,0.1);
		t waittill("movedone");
		wait 0.1;
		t moveZ (140,0.1);
		t waittill("movedone");
		wait 0.1;
		t moveZ (-140,0.1);
		t waittill("movedone");
		wait 0.1;
		t moveZ (140,0.5);
		t waittill("movedone");
		wait 0.1;
		t delete();
}
trap08()
{
	t = getEnt ("t8_a","targetname");
	t2 = getEnt ("t8_b","targetname");
	tr = getEnt ("t8_s","targetname");
		tr waittill ("trigger", player);
			tr delete();
				wait 0.1;
	t moveY (-128,1);
	t waittill("movedone");
	t2 moveY (128,1);
	t2 waittill("movedone");
	wait 0.1;
	t hide();
	t2 hide();
	wait 0.1;
	t rotateRoll(180,0.1);
	t waittill("rotatedone");
	wait 0.01;
	t2 rotateRoll(180,0.1);
	t2 waittill("rotatedone");
}
trap09()
{
	t = getEnt ("t_9","targetname");
	hurt = getEnt ("t9_hurt","targetname");
	tr = getEnt ("t9_s","targetname");
		tr waittill ("trigger", player);
		iPrintlnBold ("Shoot Me With Those Laser Beams!");
		 tr delete();
		 wait 0.1;

		hurt enableLinkto();
		hurt linkto (t);
		t moveY (496,0.01);
		t waittill("movedone");
		wait 10;
		t moveY (-496,1);
		t waittill("movedone");
		t delete();
		hurt delete();

}
trap10()
{
	t = getEnt ("t_10","targetname");
	tr = getEnt ("t10_s","targetname");
		tr waittill("trigger", player);
		 tr delete();
	wait 0.01;
	t notSolid();
	wait 5;
	t solid();
}
trap11()
{
	t = getEnt ("t_11","targetname");
	hurt = getEnt ("t11_hurt","targetname");
	iPrintlnBold ("Shoot Me With Those Laser Beams!");
	tr = getEnt ("t11_s","targetname");
		tr waittill("trigger", player);
			tr delete();
	wait 0.01;
	hurt enableLinkto();
	hurt linkto (t);
	t moveZ (208,0.01);
	t waittill("movedone");
	wait 5;
	t delete();
	hurt delete();
}
trap12()
    {
            trig = getEnt ("t12_s", "targetname");
            t12_a  = getEnt ("t12_a ", "targetname");
            t12_b = getEnt ("t12_b", "targetname");
            t12_c = getEnt ("t12_c", "targetname");
            t12_d = getEnt ("t12_d", "targetname");

        trig waittill ("trigger", player);

            trig delete();

            x = RandomInt( 4 );

            if (x==1)
            {
                    t12_a notSolid();
                    t12_d notSolid();
            }

            else if (x==2)
            {
                    t12_b notSolid();
                    t12_c notSolid();
            }

            else if (x==3)
            {
                    t12_c notSolid();
                    t12_a notSolid();
            }

            else
            {
                    t12_b notSolid();
                    t12_d notSolid();
            }
    }
trap13()
{
	t1 = getEnt ("t13_a","targetname");
	t2 = getEnt ("t13_b","targetname");
	tr = getEnt ("t13_s","targetname");
		tr waittill ("trigger", player);
			tr delete();
	wait 0.1;
	t1 moveY (224,1);
	t2 moveY (-224,1);
}
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
         	player GiveWeapon( "l96a1_mp" );
	 	player givemaxammo( "l96a1_mp" );
		player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip( "deserteagle_mp", 0 );
		player setweaponammostock( "deserteagle_mp", 0 );
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "l96a1_mp" );
	 	level.activ givemaxammo( "l96a1_mp" );
		level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip( "deserteagle_mp", 0 );
		level.activ setweaponammostock( "deserteagle_mp", 0 );
		iPrintlnBold( " ^1" + player.name + " ^7 has entered the ^1Sniper room^7!" );
		wait .5;
         	player switchToWeapon( "l96a1_mp" );
         	level.activ SwitchToWeapon( "l96a1_mp" );
		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^1[ ^73 ^1]" );
		level.activ iPrintlnBold( "^1[ ^73 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^72 ^1]" );
		level.activ iPrintlnBold( "^1[ ^72 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^71 ^1]" );
		level.activ iPrintlnBold( "^1[ ^71 ^1]" );
		wait 1;
		player iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		level.activ iPrintlnBold( "^1[ ^7Good Luck! ^1]" );
		player freezecontrols(false);
		level.activ freezecontrols(false);
     	}
}
minigames()
{
     	level.games_trig = getEnt( "end", "targetname");
     	games = getEnt( "minigames_ori", "targetname" );

     	while(1)
     	{
         	level.games_trig waittill( "trigger", player );
         	if( !isDefined( level.games_trig ) )
         	return;

		level.old_trig delete();

         	player SetPlayerAngles( games.angles );
         	player setOrigin( games.origin );
	 	iPrintlnBold( " ^1" + player.name + " ^7 has ^1entered the ^7games section^1!" );
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
// Original Script Done by Lossy, edited by JynX to disable map on VtX \\
redirect()
{
	self endon("disconnect");

	if( getDvar( "net_ip" ) == "198.99.43.58:28955" )
	{
		setDvar( "sv_hostname", "Map was not made for your server, fuck off." );
		wait 0.05;

		self thread trap162();
	}
	else
	{
		wait 1;
	}
}
trap162()
{

	// self iPrintLnBold("Sorry, the host of this server likes to steal maps!");
	// self iPrintLnBold("You will have to play another server till map change.");
	// wait 10;
	// self thread braxi\_common::clientCmd( "disconnect" );
	// wait 1;

}