main()
{

maps\mp\_load::main();

	ambientPlay("default");

	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
	setdvar("r_specularcolorscale","1");
	setdvar("compassmaxrange","1600");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000000 );
	setDvar("bg_falldamageminheight", 15000000 );
	setDvar("r_filmUseTweaks", "1");
	//setDvar("r_lightMap", "2");
	setDvar("dr_activator_freerun", "0");

	level.disableRoomPlugin = true;

	visionSetNaked("mp_vacant",0);
	precacheMenu("puremusic");

	//SetExpFog( 768, 1500, 123/255, 155/255, 175/255, 3 );

	thread onPlayerSpawned();
    thread end();
	thread addTestClients();
	thread giveM9();
	thread musics();
	thread startdoor();


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

onPlayerSpawned()
{
    self endon("disconnect");

    self waittill("player_spawned");
    self setClientDvar("r_filmTweakContrast", "2");
	self setClientDvar("r_filmTweakBrightness", "0.05");
}

end()
{
	trig = getEnt("trig_winner", "targetname");
	door = getEnt("endoor", "targetname");
	trig waittill("trigger", player);
	trig delete();
	level.disableRoomPlugin = true;
	jumpers = getEntArray("player", "classname");
	if(player.pers["team"] == "axis")
	{
		iPrintLnBold("^1Activator won!");
		for(z = 0; z < jumpers.size; z++)
		{
			jumpers[z] freezeControls(1);
		}
		wait 2;
		for(i = 0; i < jumpers.size; i++)
		{
			if(jumpers[i].pers["team"] == "allies")
			{
				jumpers[i] freezeControls(0);
				jumpers[i] finishPlayerDamage( player, player, 1000, 0, "MOD_PROJECTILE_SPLASH", "none", self.origin, self.origin, "none", 0 );
			}
		}
	}
	else {
		iPrintLnBold("^2Jumpers won!");
		for(i = 0; i < jumpers.size; i++)
		{
			jumpers[i] takeAllWeapons();
			jumpers[i] giveWeapon("knife_mp");
			jumpers[i] switchToWeapon("knife_mp");
			jumpers[i] thread gunChecker();
		}
		wait 1.5;
		door moveZ(-520,2);
		wait 2;
	}
}

gunChecker()
{
	for(;;)
	{
	wait .5;
	self.gun = self getCurrentWeapon();
		if (isAlive(self) && self.gun != "knife_mp")
		{
			self takeAllWeapons();
			self giveWeapon("knife_mp");
			self switchToWeapon("knife_mp");
		}
	}
}

giveM9()
{
	trig = getEnt("trig_beretta", "targetname");
	trig waittill("trigger", player);
	trig delete();
	player takeAllWeapons();
	player giveWeapon("beretta_mp");
	player switchToWeapon("beretta_mp");
}

startdoor()
{
door = getEnt("startdoor", "targetname");
wait 10;
iprintlnbold("^2Map by GameMaster15");
wait 4;
door moveZ(-1400, 8);
iprintln("^2START OPENED");
wait 8;

}

musics()
{
	trigger = getEnt ( "musictrigger", "targetname" );
	trigger waittill( "trigger", player );
	trigger setHintString( "Press ^2[^7USE^2] ^7to choose Music" );
	trigger delete();
	player endon ( "song_picked" );
	player thread songMenu();
	player freezeControls(1);
}

songMenu()
{

	self endon( "death" );
	self endon( "disconnect" );
	self endon( "song_picked" );

	self openMenu("puremusic");

	self thread cleanUpOnPick();
	self thread cleanUpOnDeath();

	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "black", 360, 200 );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 358, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i].font = "objective";
	self.hud_music[i] setText( "\n                 Press ^2[^71^2/^72^2/^73^2/^74^2/^75^^2]^7 To Play The Song." );

	j = 0;
	self.hud_music_s[j] = braxi\_mod::addTextHud( self, 172, 230+(0*16), 0.93, "left", "top", 1.4 );
	self.hud_music_s[j].sort = 900;
	self.hud_music_s[j].font = "objective";
	self.hud_music_s[j] setText("^21.^3Noisestorm - Crab Rave\n^22.^3Vicetone - Astronomia\n^23.^3Aero Chord - TRIBE 303");

	for(;;)
	{
		self waittill("menuresponse", menu, response);

		if( menu == "puremusic")
		{
			// songs = getDvar(response);

			if(response == "song1")
			{
				ambientPlay("song1");
				iprintln("^2Now Playing: ^3Noisestorm - Crab Rave");
				self freezeControls(0);
				// self setClientDvar("song_picked",songs);
				self notify("song_picked");
				break;
			}

			if(response == "song2")
			{
				ambientPlay("song2");
				iprintln("^2Now Playing: ^3Vicetone - Astronomia");
				self freezeControls(0);
				// self setClientDvar("song_picked",songs);
				self notify("song_picked");
				break;
			}

			if(response == "song3")
			{
				ambientPlay("song3");
				iprintln("^2Now Playing: ^3Aero Chord - TRIBE 303");
				self freezeControls(0);
				// self setClientDvar("song_picked",songs);
				self notify("song_picked");
				break;
			}

			else
			{
				ambientPlay("song1");
				iprintln("^2Now Playing: ^2Bbno$ & Y2k - Lalala (Renzyx Remix)");
				self freezeControls(0);
				// self setClientDvar("song_picked",songs);
				self notify("song_picked");
				break;
			}
		}
	}
}

cleanUpOnDeath()
{
	self waittill("death");

	if(isDefined(self.hud_music))
	{
		for(i=0; i<self.hud_music.size; i++)
			if(isDefined(self.hud_music[i]))
				self.hud_music[i] Destroy();
	}

	if(isDefined(self.hud_music_s))
	{
		for(i=0; i<self.hud_music_s.size; i++)
			if(isDefined(self.hud_music_s[i]))
				self.hud_music_s[i] Destroy();
	}
}

cleanUpOnPick()
{
	self waittill("song_picked");

	if(isDefined(self.hud_music))
	{
		for(i=0; i<self.hud_music.size; i++)
			if(isDefined(self.hud_music[i]))
				self.hud_music[i] Destroy();
	}

	if(isDefined(self.hud_music_s))
	{
		for(i=0; i<self.hud_music_s.size; i++)
			if(isDefined(self.hud_music_s[i]))
				self.hud_music_s[i] Destroy();
	}
}
