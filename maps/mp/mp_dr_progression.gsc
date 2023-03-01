//  U|  _"\ uU  /"\  u     ___     | \ |"|       
//  \| |_) |/ \/ _ \/     |_"_|   <|  \| |>      
//   |  __/   / ___ \      | |    U| |\  |u      
//   |_|     /_/   \_\   U/| |\u   |_| \_|    _  
//   ||>>_    \\    >>.-,_|___|_,-.||   \\,-.(") 
//  (__)__)  (__)  (__)\_)-' '-(_/ (_")  (_/  "  

/*
Map by pain.
Add me on steam/discord if you haven't
Have fun reading stuff
Thanks jwofles for listening to all my stupid questions
*/

// My maps are shit idk why you're looking at my gsc
// Feel free to take anything you need


// Bouncing platform script for any peeps that need it (originally from sheep wizard)

/*
bounce()
{
	trig = getent("bounce", "targetname");
	
	while(1)
	{
    	trig waittill ( "trigger", player );
    	 
	    player thread bounce2();
	}
}
bounce2()
{	
    for(i = 0; i < 4; i++)
	{
	    self.health += 160;
        self finishPlayerDamage(self, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}
*/


// Guid List:
// Rawr - 9708aefd9704983207119f8d0f3e3d0
// Seren - b921a98bfc5e1bcd92b99dd57335b708
// Emer - 
// Soap - 9f66acf0ec592237e7d7f67bb848ba14
// Jwofles - 
// Open
// Open
// Open



main()
{
	maps\mp\_load::main();
	
	PreCacheItem("ppsh_mp");
	PreCacheItem("mr6_mp");
	PreCacheItem("axe_mp");
	preCacheItem("rpd_mp");
	precacheShader("material,mtl_deadpool_guns");
	precacheShader("material,mtl_deadpool_body");
	precacheShader("material,mtl_deadpool_eyes");
	precacheShader("material,mtl_deadpool_misc");
	precacheShader("material,mtl_deadpool_swords");
	precacheModel("deadpool");
	precacheShader("mtl_plr_baa_joker_head");
	precacheShader("mtl_plr_baa_joker_hair");
	precacheShader("mtl_plr_baa_joker_body"); 
	precacheModel("playermodel_baa_joker");
	precacheShader("mtl_plr_terminator_body");
	precacheShader("mtl_plr_terminator_head");
	precacheModel("playermodel_terminator");
	precacheShader("mtl_shadow_fur");
	precacheShader("mtl_shadow_body");
	precacheShader("mtl_shadow_eyes");
	precacheShader("mtl_shadow_shoes");
	precacheShader("mtl_shadow_clothes");
	precacheModel("shadow");	
	
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	setdvar("bg_fallDamageMaxHeight","300000");
	setdvar("bg_fallDamageMinHeight","200000");

	level.greentrail = loadFX("deathrun/greentrail");
	level.purple = loadFX("deathrun/purpletrail");
	level.blue = loadFX("deathrun/bluetrail");
	level.red = loadFX("deathrun/redtrail");
	level.electric = loadFX("deathrun/lightning");
	
	level.endRoomOriginal = 0; // DO NOT TOUCH

	thread bouncePlayer( "bounce" );
	thread bouncePlayer( "bounce2" );
	thread bouncePlayer( "bounce3" );
	thread bouncePlayer( "bounce4" );
	thread bouncePlayer( "bounceroompad1" );
	thread bouncePlayer( "bounceroompad2" );
	thread bouncePlayer( "bounceend", 300 );
	thread bouncePlayer( "bouncesnipe", 150 );

	thread startdoor();
	thread jwoflesisabae();
	thread trap2();
	thread actielevator();
	thread trap3orgmove();
	thread moveplatform();
	thread trap4();
	thread tele1();
	thread tele2();
	thread tele3();
	thread trap5();
	thread startmessages();

	thread yellowspin();
	thread painstele();
	thread watch();
	thread painstele2();
	thread greendelete();
	thread greenslide();
	thread woflestrig();
	thread ppshthing();
	thread knife();
	thread sniper();
	thread bounceroom();
	thread bouncewep();
	thread actitele1();
	thread actitele2();
	thread secretactivation();
	thread bouncejumptele();
	thread bounceactitele();
	thread knifebounce11();
	thread knifebounce21();
	thread knifebounce31();
	thread knifebounce41();
	thread kniferespawn();
	thread jumpsecret();
	thread secretrespawn();
	thread secretexit();
	thread endxp();
	thread creds();
	thread actisecrettrig();
	thread actisecretxp();
	thread actisecretrespawn();
	thread creds2();
	thread redviptrail();
	thread blueviptrail();
	thread purpleviptrail();

	addTriggerToList( "trap1_trig" );
	addTriggerToList( "trap2_trig" );
	addTriggerToList( "trap3_trig" );
	addTriggerToList( "trap4_trig" );
	addTriggerToList( "trap5_trig" );
	addTriggerToList( "yellowspin_trig" );
	addTriggerToList( "greendeletetrog" );
	addTriggerToList( "greenslidetrig" );

	if(!isdefined(level.music))
	level.music=[];

	level.music[0]["song"]    ="KDrew - Circles";
	level.music[0]["alias"]    ="musicmenu1";
	level.music[1]["song"]    ="Imagine Dragons - Believer";
	level.music[1]["alias"]    ="musicmenu2";
	level.music[2]["song"]    ="The meme himself - Ocean Man";
	level.music[2]["alias"]    ="musicmenu3";
	level.music[3]["song"]    ="Troyboi - Own My Own";
	level.music[3]["alias"]    ="musicmenu4";

	
	if(!isdefined(level.weapons))
	level.weapons=[];

	level.weapons[0]["weapon"]    ="RPD";
	level.weapons[0]["wep"]    ="rpd_mp";
	level.weapons[1]["weapon"]    ="R700";
	level.weapons[1]["wep"]    ="remington700_mp";
	level.weapons[2]["weapon"]    ="AXE";
	level.weapons[2]["wep"]    ="axe_mp";
	level.weapons[3]["weapon"]    ="Deagle";
	level.weapons[3]["wep"]    ="deserteagle_mp";
	
	if(!isdefined(level.models))
	level.models=[];

	level.models[0]["model"]    ="Joker";
	level.models[0]["mod"]    ="playermodel_baa_joker";
	level.models[1]["model"]    ="Deadpool";
	level.models[1]["mod"]    ="deadpool";
	level.models[2]["model"]    ="Terminator";
	level.models[2]["mod"]    ="playermodel_terminator";
	level.models[3]["model"]    ="Shadow";
	level.models[3]["mod"]    ="shadow";

	thread musictrig();
	thread weaponstrig();
	thread modelstrig();


}
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "music thread terminated" );

	self thread onmusicDeath();
	self thread onDisconnect();

	self.hud_music = [];
	self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 100, 2, "left", "top", 4.5 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 317, 104, 0.70, "center", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("^6Pain's Music");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
    self.hud_music[i].glowcolor=level.randomcolor;
    else
    self.hud_music[i].glowcolor=(131,0,131);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 257, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("^5Scroll: ^6[{+attack}] ^5| Select: ^6[{+activate}] ^5| Exit: ^6[{+frag}]");

    for( j = 0; j < level.music.size; j++ )
    {
    	i++;
    	self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 130+(j*16), 0.93, "left", "top", 1.4 );
    	self.hud_music[i].sort = 882;
    	self.hud_music[i].font = "objective";
    	self.hud_music[i].glowalpha=1;
    	if(isdefined(level.randomcolor))
    	self.hud_music[i].glowcolor=level.randomcolor;
    	else
    	self.hud_music[i].glowcolor=(0,0,1);

    	entry = level.music[j];
    	self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 130, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    while(self.sessionstate == "playing")
    {
    	wait 0.1;

    	if(self attackButtonPressed())
    	{
    		self.hud_music[3+self.selection].alpha = 0.93;

    		self.selection++;
    		if( self.selection >= level.music.size )
    		self.selection = 0;

    		item = self.hud_music[3+self.selection];
    		item.alpha = 1;
    		indicator.y = item.y;
    	}
    	else if(self useButtonPressed())
    	{
    		iprintln("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
    		ambientPlay(level.music[self.selection]["alias"]);
    		self freezecontrols(0);
    		break;
    	}
    	else if(self fragButtonPressed())
    	{
    		self freezecontrols(0);
    		break;
    	}
    }

    self cleanUp();
}

musictrig()
{
	trig = getEnt ("musicmenu", "targetname");
	trig setHintString("Press ^1[^5USE^1]^7: ^1Play ^1Song");

	trig waittill("trigger",player);
	player freezecontrols(1);
	trig delete();
	player musicMenu();
}

onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

onmusicDeath()
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

weaponsMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "weapons thread terminated" );

	self thread onwepDeath();
	self thread onwepDisconnect();

	self.hud_weapons = [];
	self.selection = 0;

    // create huds

    i = 0;
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 160, 100, 0.6, "left", "top", 2 );
    self.hud_weapons[i].sort = 880;
    self.hud_weapons[i] setShader( "black", 320, 160 );
    self.hud_weapons[i].backgroundColor = (255/255,42/255,255/255);


    i++;
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 317, 104, 0.70, "center", "top", 1.8 );
    self.hud_weapons[i].sort = 884;
    self.hud_weapons[i] setText("^6Pain's weapons");
    self.hud_weapons[i].glowalpha=1;
    if(isdefined(level.randomcolor))
    self.hud_weapons[i].glowcolor=level.randomcolor;
    else
    self.hud_weapons[i].glowcolor=(131,0,131);

    i++;
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 270, 257, 1, "center", "bottom", 1.4 );
    self.hud_weapons[i].sort = 886;
    self.hud_weapons[i] setText("^5Scroll: ^6[{+attack}] ^5| Select: ^6[{+activate}] ^5| Exit: ^6[{+frag}]");


    for( j = 0; j < level.weapons.size; j++ )
    {
    	i++;
    	self.hud_weapons[i] = braxi\_mod::addTextHud( self, 172, 130+(j*16), 0.93, "left", "top", 1.4 );
    	self.hud_weapons[i].sort = 882;
    	self.hud_weapons[i].font = "objective";
    	self.hud_weapons[i].glowalpha=1;
    	if(isdefined(level.randomcolor))
    	self.hud_weapons[i].glowcolor=level.randomcolor;
    	else
    	self.hud_weapons[i].glowcolor=(0,1,0);

    	entry = level.weapons[j];
    	self.hud_weapons[i] setText(entry["weapon"]);
    }

    i++;
    self.hud_weapons[self.hud_weapons.size] = braxi\_mod::addTextHud( self, 167, 130, 0.4, "left", "top", 1.4 );
    self.hud_weapons[i].sort = 881;
    indicator = self.hud_weapons[self.hud_weapons.size-1];
    indicator setShader("white", 306, 17 );


    while(self.sessionstate == "playing")
    {
    	wait 0.1;

    	if(self attackButtonPressed())
    	{
    		self.hud_weapons[3+self.selection].alpha = 0.93;

    		self.selection++;
    		if( self.selection >= level.weapons.size )
    		self.selection = 0;

    		item = self.hud_weapons[3+self.selection];
    		item.alpha = 1;
    		indicator.y = item.y;
    	}
    	else if(self useButtonPressed())
    	{
    		iprintln("^1>> ^7Player Given: ^1"+level.weapons[self.selection]["weapon"]);
    		self GiveWeapon(level.weapons[self.selection]["wep"]);
    		self GiveMaxAmmo(level.weapons[self.selection]["wep"]);
    		self switchToWeapon(level.weapons[self.selection]["wep"]);
    		self freezecontrols(0);

    		break;
    	}
    	else if(self fragButtonPressed())
    	{
    		self freezecontrols(0);
    		break;
    	}
    }

    self wepcleanUp();
}

weaponstrig()
{
	trig = getEnt ("weaponsmenu", "targetname");
	trig setHintString("Press ^1[^5USE^1]^7: ^1Choose ^1Weapon");
	level.me = "cff9b1b8"; //me
    level.buddy1 = "7335b708"; //
	level.buddy2 = "ecf836ef"; //
	level.buddy3 = "14146dfe"; //
	level.buddy4 = "b848ba14"; //
	
	
	while( true )
	{	
		trig waittill("trigger", player);

		
		if(getSubStr (  player getGuid(), 24, 32 ) != "cff9b1b8") {
			player iPrintlnBold("^5You aren't a VIP!");
			continue; 
		}
		
		player freezecontrols(1);
				// trig delete();
				player weaponsMenu();
				wait .1;

				 // break; 
				 // Stops the code once pain has activated it. 

				}

			}


			onwepDisconnect()
			{
				self endon( "weapons thread terminated" );
				self waittill( "disconnect" );
				self wepcleanUp();
			}

			onwepDeath()
			{
				self endon( "disconnect" );
				self endon( "weapons thread terminated" );
				self waittill( "death" );
				self wepcleanUp();
			}

			wepcleanUp()
			{
				if( !isDefined( self ) )
				return;



				if( isDefined( self.hud_weapons ) )
				{
					for( i = 0; i < self.hud_weapons.size; i++ )
					{
						if( isDefined( self.hud_weapons[i] ) )
						self.hud_weapons[i] destroy();

					}
				}
				self notify( "weapons thread terminated" );
			}


			modelsMenu()
			{
				self endon( "disconnect" );
				self endon( "death" );
				self endon( "spawned" );
				self endon( "joined_spectators" );
				self endon( "models thread terminated" );

				self thread onmodelsDeath();
				self thread onmodelsDisconnect();

				self.hud_models = [];
				self.selection = 0;

    // create huds
    i = 0;
    self.hud_models[i] = braxi\_mod::addTextHud( self, 160, 100, 2, "left", "top", 5 );
    self.hud_models[i].sort = 880;
    self.hud_models[i] setShader( "black", 320, 160 );

    i++;
    self.hud_models[i] = braxi\_mod::addTextHud( self, 317, 104, 0.70, "center", "top", 1.8 );
    self.hud_models[i].sort = 884;
    self.hud_models[i] setText("^6Pain's models");
    self.hud_models[i].glowalpha=1;
    if(isdefined(level.randomcolor))
    self.hud_models[i].glowcolor=level.randomcolor;
    else
    self.hud_models[i].glowcolor=(131,0,131);

    i++;
    self.hud_models[i] = braxi\_mod::addTextHud( self, 270, 257, 1, "center", "bottom", 1.4 );
    self.hud_models[i].sort = 886;
    self.hud_models[i] setText("^5Scroll: ^6[{+attack}] ^5| Select: ^6[{+activate}] ^5| Exit: ^6[{+frag}]");

    for( j = 0; j < level.models.size; j++ )
    {
    	i++;
    	self.hud_models[i] = braxi\_mod::addTextHud( self, 172, 130+(j*16), 0.93, "left", "top", 1.4 );
    	self.hud_models[i].sort = 882;
    	self.hud_models[i].font = "objective";
    	self.hud_models[i].glowalpha=1;
    	if(isdefined(level.randomcolor))
    	self.hud_models[i].glowcolor=level.randomcolor;
    	else
    	self.hud_models[i].glowcolor=(0,0,1);

    	entry = level.models[j];
    	self.hud_models[i] setText(entry["model"]);
    }

    i++;
    self.hud_models[self.hud_models.size] = braxi\_mod::addTextHud( self, 167, 130, 0.4, "left", "top", 1.4 );
    self.hud_models[i].sort = 881;
    indicator = self.hud_models[self.hud_models.size-1];
    indicator setShader( "white", 306, 17 );

    while(self.sessionstate == "playing")
    {
    	wait 0.1;

    	if(self attackButtonPressed())
    	{
    		self.hud_models[3+self.selection].alpha = 0.93;

    		self.selection++;
    		if( self.selection >= level.models.size )
    		self.selection = 0;

    		item = self.hud_models[3+self.selection];
    		item.alpha = 1;
    		indicator.y = item.y;
    	}
    	else if(self useButtonPressed())
    	{
    		iprintln("^1>> ^7Model Chosen: ^1"+level.models[self.selection]["model"]);
    		self setModel(level.models[self.selection]["mod"]);
    		self freezecontrols(0);
    		break;
    	}
    	else if(self fragButtonPressed())
    	{
    		self freezecontrols(0);
    		break;
    	}
    }

    self modelscleanUp();
}

modelstrig()
{
	trig = getEnt ("modelsmenu", "targetname");
	trig setHintString("Press ^1[^5USE^1]^7: ^1Choose ^1Model");
	
	
	while( true )
	{  
		trig waittill("trigger", player);


		player freezecontrols(1);
                // trig delete();
                player modelsMenu();
                wait .1;

                 // break;
                 // Stops the code once pain has activated it.

     }

 }
         
onmodelsDisconnect()
{
	self endon( "models thread terminated" );
	self waittill( "disconnect" );
	self modelscleanUp();
}

onmodelsDeath()
{
	self endon( "disconnect" );
	self endon( "models thread terminated" );
	self waittill( "death" );
	self modelscleanUp();
}

modelscleanUp()
{
	if( !isDefined( self ) )
	return;



	if( isDefined( self.hud_models ) )
	{
		for( i = 0; i < self.hud_models.size; i++ )
		{
			if( isDefined( self.hud_models[i] ) )
			self.hud_models[i] destroy();
		}
	}
	self notify( "models thread terminated" );
}

startdoor()
{
	door1 = getent("startdoor1", "targetname");
	door2 = getent("startdoor2", "targetname");
	
	wait 15;
	iprintlnBold("^6The doors are opening!");
	wait 2;
	door1 moveX (-296, 4);
	door2 moveX (296, 4);

	wait 4.1;

	door1 delete();
	door2 delete();
}


jwoflesisabae()
{
	trap1_1 = getent("trap1_1", "targetname");
	trap1_3 = getent("trap1_3", "targetname");
	trap1_4 = getent("trap1_4", "targetname");
	trap1_5 = getent("trap1_5", "targetname");
	trig = GetEnt("trap1_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();

	while(1)
	{
		trap1_1 rotateroll (720 , 2.5);
		wait 4;
		trap1_3 rotateyaw (720 , 2.5);
		wait 4;
		trap1_4 rotateroll (720 , 2.5);
		trap1_5 rotateroll (720 , 2.5);
		wait 4;


	}
}


trap2()
{
	trap2_1 = getent("trap2_1", "targetname");
	trap2_2 = getent("trap2_2", "targetname");
	trap2_3 = getent("trap2_3", "targetname");
	trap2_4 = getent("trap2_4", "targetname");
	trap2_5 = getent("trap2_5", "targetname");
	trap2_6 = getent("trap2_6", "targetname");
	trap2_7 = getent("trap2_7", "targetname");
	trap2_8 = getent("trap2_8", "targetname");
	trig = GetEnt("trap1_trig", "targetname");
	trig = getent("trap2_trig", "targetname");
	trig waittill ("trigger", player);
	trig delete();

	{
		trap2_1 delete();
		trap2_2 delete();
		trap2_3 delete();
		trap2_4 delete();
		trap2_5 delete();
		trap2_6 delete();
		trap2_7 delete();
		trap2_8 delete();

	}
}


actielevator(){
	trig = getEnt( "actiele", "targetname" );
	trap4left = getEntArray( "actielevator", "targetname" );
	trig waittill( "trigger", nigger );
	for(;;){
		for( i = 0; i < trap4left.size; i++ )
		{
			trap4left[i] moveZ( 315, 1 );
			wait 6;
			trap4left[i] moveZ( -315, 1 );
			wait 6;
		}	
	}
}

trap3orgmove(){
	trig = getent("trap3orgmove", "targetname");
	trig2 = getent("trap3_trig", "targetname");
	trig waittill ("trigger", player);
	trig delete();
	trap3_1 = getent("trap3_1", "targetname");
	trap3_2 = getent("trap3_2", "targetname");
	trap3_3 = getent("trap3_3", "targetname");
	trap3_4 = getent("trap3_4", "targetname");
	trap3_5 = getent("trap3_5", "targetname");
	trap3_6 = getent("trap3_6", "targetname");
	trap3_7 = getent("trap3_7", "targetname");
	trap3_8 = getent("trap3_8", "targetname");
	trap3_9 = getent("trap3_9", "targetname");
	trap3_10 = getent("trap3_10", "targetname");
	trap3_11 = getent("trap3_11", "targetname");
	trap3_12 = getent("trap3_12", "targetname");
	trap3_13 = getent("trap3_13", "targetname");
	trap3_14 = getent("trap3_14", "targetname");
	trap3_15 = getent("trap3_15", "targetname");
	trap3_16 = getent("trap3_16", "targetname");
	trap3_17 = getent("trap3_17", "targetname");
	trap3_18 = getent("trap3_18", "targetname");
	{
		trap3_1 moveZ (9999, 2.5);
		trap3_2 moveZ (9999, 2.5);
		trap3_3 moveZ (9999, 2.5);
		trap3_4 moveZ (9999, 2.5);
		trap3_5 moveZ (9999, 2.5);
		trap3_6 moveZ (9999, 2.5);
		trap3_7 moveZ (9999, 2.5);
		trap3_8 moveZ (9999, 2.5);
		trap3_9 moveZ (9999, 2.5);
		trap3_10 moveZ (9999, 2.5);
	}

	trig2 waittill ("trigger", player);
	trig2 delete();
	{
		trap3_1 moveZ (-9999, 2.5);
		trap3_2 moveZ (-9999, 2.5);
		trap3_3 moveZ (-9999, 2.5);
		trap3_4 moveZ (-9999, 2.5);
		trap3_5 moveZ (-9999, 2.5);
		trap3_6 moveZ (-9999, 2.5);
		trap3_7 moveZ (-9999, 2.5);
		trap3_8 moveZ (-9999, 2.5);
		trap3_9 moveZ (-9999, 2.5);
		trap3_10 moveZ (-9999, 2.5);
		trap3_11 delete();
		trap3_12 delete();
		trap3_13 delete();
		trap3_14 delete();
		trap3_15 delete();
		trap3_16 delete();
		trap3_17 delete();
		trap3_18 delete();
	}
}

moveplatform() {
	platformpurp = getent("platformpurp", "targetname");
	trig = getent("platformpurp_trig", "targetname");
	trig waittill("trigger", player);

	{
		wait 1;
	}

	while(1)
	{
		platformpurp moveY( -495, 1 );
		wait 5;
		platformpurp moveY( 495, 1 );
		wait 5;
	}
}


trap4(){
	trap4_1 = getent("trap4_1", "targetname");
	trap4_2 = getent("trap4_2", "targetname");
	trap4_3 = getent("trap4_3", "targetname");
	trap4_4 = getent("trap4_4", "targetname");
	trap4_5 = getent("trap4_5", "targetname");
	trap4_6 = getent("trap4_6", "targetname");
	trap4_7 = getent("trap4_7", "targetname");
	trig = GetEnt("trap4_trig", "targetname");
	trig waittill("trigger", player);
	trig delete();

	{

		trap4_1 delete(); 
		trap4_2 delete(); 
		trap4_3 delete(); 
		trap4_4 delete(); 
		trap4_5 delete(); 
		trap4_6 delete(); 
		trap4_7 delete(); 





	}


}


tele1(){
	{
		tele= GetEnt("teleport_trig1","targetname");
		origin = GetEnt("teleport_origin1","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}


trap5() {
	trig = getent("trap5_trig", "targetname");
	bounce = getent("trap5bounce", "targetname");
	trig waittill("trigger", player);
	trig delete();


	{
		bounce moveY(100, .5);
		wait 2;

		while(1)
		{
			bounce moveY(-200, 2.5);
			wait 2.51;
			bounce moveY(200, 2.5);
			wait 2.51;





		}
	}

}


startmessages()
{

	level waittill("round_started");
	wait 3;
	noti = SpawnStruct();
	noti.titleText = " ^5Map Created By ^6Pain.";
	noti.notifyText = "^6Shout out to ^5jwofles, Synd, and MiKeY";
	noti.duration = 5;
	noti.glowcolor = (6,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

}

woflestrig(){
 	trigger = GetEnt("woflestrig","targetname");
	level.me = "cff9b1b8"; //me
    level.buddy1 = "7335b708"; //
	level.buddy2 = "ecf836ef"; //
	level.buddy3 = "07987968"; //
	level.buddy4 = "b848ba14"; //

	for(;;){
		trigger waittill( "trigger", player );
		tempGuid = getSubStr(player getGuid(),24,32);
		if(player isTouching(trigger) && player useButtonPressed())
		{
			if((tempGuid == level.me) || (tempGuid == level.buddy1) || (tempGuid == level.buddy2) || (tempGuid == level.buddy3) || (tempGuid == level.buddy4))
			{
				player GiveWeapon( "ppsh_mp" );
				player GiveMaxAmmo( "ppsh_mp" );
				player GiveWeapon( "axe_mp" );
				player GiveMaxAmmo( "axe_mp" );
			    // player braxi\_mod::giveLife();
				// player braxi\_mod::giveLife();
				// player braxi\_mod::giveLife();
				


				wait .05;
				player SwitchToWeapon( "ppsh_mp" );
				iPrintlnBold( " ^5VIP Trigger Activated! Pain/Soap/Seren/jwofles up in dis bitch");//Any of this can be changed and if you want teleported its a simple players[i] set origin script
				while(isAlive(player)){
					playFx( level.purple , player.origin );
					wait .1;
				}
			}
			else
			{
				wait 0.5;
				player iprintlnbold("^6 VIPS ONLY!");
			}
		}
		else
		{
			wait 0.5;
		}
	}
}

yellowspin() {
	trig = getent("yellowspin_trig", "targetname");
	yellowspin_1 = getent("yellowspin_1", "targetname");
	yellowspin_2 = getent("yellowspin_2", "targetname");
	yellowspin_3 = getent("yellowspin_3", "targetname");
	yellowspin_4 = getent("yellowspin_4", "targetname");
	yellowspin_5 = getent("yellowspin_5", "targetname");
	yellowspin_6 = getent("yellowspin_6", "targetname");
	yellowspin_7 = getent("yellowspin_7", "targetname");

	trig waittill("trigger", player);
	trig delete();


	{
		yellowspin_1 rotateroll(360,1);
		yellowspin_2 rotateroll(360,1);
		yellowspin_3 rotateroll(360,1);
		yellowspin_4 rotateroll(360,1);
		yellowspin_5 rotateroll(360,1);
		yellowspin_6 rotateroll(360,1);
		yellowspin_7 rotateroll(360,1);
	}
	{
		wait 2;

	}

	while(1) {
		yellowspin_1 rotateroll(360,1);
		wait 1.5;
		yellowspin_2 rotateroll(360,1);
		wait 1.5;
		yellowspin_3 rotateroll(360,1);
		wait 1.5;
		yellowspin_4 rotateroll(360,1);
		wait 1.5;
		yellowspin_5 rotateroll(360,1);
		wait 1.5;
		yellowspin_6 rotateroll(360,1);
		wait 1.5;
		yellowspin_7 rotateroll(360,1);
		wait 1.5;



	}


}

tele2(){
	{
		tele= GetEnt("yellowtele","targetname");
		origin = GetEnt("yelloworigin","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}


tele3(){
	{
		tele= GetEnt("greentele","targetname");
		origin = GetEnt("greenorigin","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}

painstele()
{
	tele = getEnt("painstele", "targetname"); 
	tele setHintString("^6SUPER VIPS ONLY!");
	while( true )
	{	
		tele waittill( "trigger", player);

		
		if(getSubStr (  player getGuid(), 24, 32 ) != "cff9b1b8") {
			iPrintln("^6Map By Pain.");
			continue; 
		}
		
		player giveWeapon( "mr6_mp" );
		player giveMaxAmmo( "mr6_mp" );
		iPrintln ("^4Pain has entered the ultimate secret");
		player setOrigin(getEnt("teleportend", "targetname").origin);
		break; // Stops the code once pain has activated it. 
		
	}
	
}

watch()
{
	trig = getent("wait_trig", "targetname");
	trig waittill ( "trigger", player );
	trig delete();

	while(1)
	{ 
		player thread bounce12();
		wait 0.1;
	}
}

bounce12()
{  
	for(i = 0; i < 4; i++)
	{
		if ( isDefined( self ) && self UseButtonPressed() ) 
		{

			self.health += 50;
			self finishPlayerDamage(self, level.jumpattacker, 50, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
		}
	}
}

painstele2(){
	{
		tele= GetEnt("painstele2","targetname");
		origin = GetEnt("painsorigin2","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}

greendelete() {
	greendelete1 = getent("greendelete1", "targetname");
	greendelete2 = getent("greendelete2", "targetname");
	greendelete3 = getent("greendelete3", "targetname");
	greendelete4 = getent("greendelete4", "targetname");
	greendelete5 = getent("greendelete5", "targetname");
	greendelete6 = getent("greendelete6", "targetname");
	greendelete8 = getent("greendelete8", "targetname");
	greendelete9 = getent("greendelete9", "targetname");
	trig = getent("greendeletetrog", "targetname");
	trig waittill("trigger", player);
	trig delete();


	{
		greendelete1 delete();
		greendelete2 delete();
		greendelete3 delete();
		greendelete4 delete();
		greendelete5 delete();
		greendelete6 delete();
		greendelete8 delete();
		greendelete9 delete();

	}



}


greenslide() {
	greenslidedelete1 = getent("greenslidedelete", "targetname");
	greenslidedelete2 = getent("greenslidedelete2", "targetname");
	greenslidedelete3 = getent("greenslidedelete3", "targetname");
	greenslidedelete4 = getent("greenslidedelete4", "targetname");
	greenslidedelete5 = getent("greenslidedelete5", "targetname");
	trigger = getent("greenslidetrig", "targetname");
	trigger waittill("trigger", player);
	trigger delete();


	{
		wait 1;

		greenslidedelete1 delete();
		greenslidedelete2 delete();
		greenslidedelete3 delete();
		greenslidedelete4 delete();
		greenslidedelete5 delete();



	}
}

ppshthing()
{
	trig = getEnt("secretgun", "targetname");
	trig waittill("trigger", player);
	trig delete();

	{
		wait .05;
		iPrintlnBold( " ^5" + player.name + " has gotten the secret PPSH!" );
		player GiveWeapon( "ppsh_mp" );
		player GiveMaxAmmo( "ppsh_mp" );
		player switchToWeapon( "ppsh_mp" );
		
	}
}

actitele1(){
	{
		tele= GetEnt("actitele1","targetname");
		origin = GetEnt("actitele1origin","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}

actitele2(){
	{
		tele= GetEnt("actitele2","targetname");
		origin = GetEnt("actitele2_origin","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}

sniper()
{
	level.sniper = GetEnt("sniper","targetname");
	jump = GetEnt( "sniperjumper", "targetname" );
	acti = GetEnt( "sniperacti", "targetname" );

	while(1)
	{
		level.sniper waittill("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;
		if( !player checkForActi() )
			continue;

		removeEndRooms( "sniper" );
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player GiveMaxAmmo( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		player GiveMaxAmmo( "m40a3_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		level.activ GiveWeapon( "m40a3_mp" );
		level.activ GiveMaxAmmo( "m40a3_mp" );
		wait .05;
		player switchToWeapon( "remington700_mp" ); 
		level.activ SwitchToWeapon( "remington700_mp" );
		player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
		noti.titleText = "Sniper Room!";
		noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
		noti.glowcolor = (1,0,0.9);
		noti.duration = 5;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player waittill( "death" );
		level.sniper.origin = level.endRoomOriginal;
	}
}


bounceroom()
{
	level.bounce = GetEnt("bounceroomtrig","targetname");
	jump = GetEnt( "bouncejumper", "targetname" );
	acti = GetEnt( "bounceacti", "targetname" );

	while(1)
	{
		level.bounce waittill("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;
		if( !player checkForActi() )
		continue;

		removeEndRooms( "bounce" );

		if( isDefined(level.old_trig) )
		level.PlayerInRoom = true;
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );
		player GiveMaxAmmo( "tomahawk_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );
		level.activ GiveMaxAmmo( "tomahawk_mp" );
		wait .05;
		player switchToWeapon( "tomahawk_mp" ); 
		level.activ SwitchToWeapon( "tomahawk_mp" );
		player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
		noti.titleText = "Bounce Room!";
		noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
		noti.glowcolor = (1,0,0.9);
		noti.duration = 5;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);
		player waittill( "death" );
		level.bounce.origin = level.endRoomOriginal;
		
	}
}


bouncewep()
{
	trig = getEnt("bouncewep", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		wait .05;
		player GiveWeapon( "remington700_mp" );
		player GiveMaxAmmo( "remington700_mp" );
		player switchToWeapon( "remington700_mp" );
		
	}
}

creds()
{
	level.xxx = newHudElem(); 
	level.xxx.x = 0;      
	level.xxx.y = -200;   
	level.xxx.horzAlign = "left"; 
	level.xxx.vertAlign = "middle";
	level.xxx.alignX = "left";
	level.xxx.alignY = "middle";
	level.xxx.sort = 102; 
	level.xxx.foreground = 1;     
	level.xxx.archived = true;    
	level.xxx.alpha = 1;  
	level.xxx.fontScale = 1.5;
	level.xxx.hidewheninmenu = false;     
	level.xxx.color = (255,128,0);
	level.xxx.glowColor = (131, 0, 131);
	level.xxx.glowAlpha = 1;
	while(1)
	{
		level.xxx.color = (131,0,131);
		level.xxx.label = &"Map by Pain.";    
		wait 7;
		level.xxx.color = (0,50,258);
		level.xxx.label = &"Thanks to Synd";
		wait 5;
		level.xxx.color = (100,45,234);
		level.xxx.label = &"Thanks to JWofles";
		wait 5;
		level.xxx.color = (1,0,0);
		level.xxx.label = &"Thanks to MiKeY";
		wait 5;
	}
}



creds2()
{
	level.xxxx = newHudElem(); 
	level.xxxx.x = 375;      
	level.xxxx.y = -220;   
	level.xxxx.horzAlign = "left"; 
	level.xxxx.vertAlign = "middle";
	level.xxxx.alignX = "left";
	level.xxxx.alignY = "middle";
	level.xxxx.sort = 102; 
	level.xxxx.foreground = 1;     
	level.xxxx.archived = true;    
	level.xxxx.alpha = 1;  
	level.xxxx.fontScale = 1.5;
	level.xxxx.hidewheninmenu = false;     
	level.xxxx.color = (255,128,0);
	level.xxxx.glowColor = (131, 0, 131);
	level.xxxx.glowAlpha = 1;
	while(1)
	{
		
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (0,255,0);
		level.xxxx.label = &"Check out pxg.me";  

		wait .3;
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (1,0,0);
		level.xxxx.label = &"Check out pxg.me";    
		wait .3;
		level.xxxx FadeOverTime(0.3);
		level.xxxx.color = (131,0,131);
		level.xxxx.label = &"Check out pxg.me";    
		wait .3;
		
	}
}



secretactivation() {
	secretplat1 = getent("secretplat1", "targetname");
	secretplat2 = getent("secretplat2", "targetname");
	secretplat3 = getent("secretplat3", "targetname");
	trig1 = getent("secrettrig1", "targetname");
	trig2 = getent("secrettrig2", "targetname");
	trig3 = getent("secrettrig3", "targetname");
	secretmove = getent("secretmove", "targetname");


	secretmove waittill("trigger", player);
	secretmove delete();
	{
		secretplat1 moveZ(9999, 2);
		secretplat2 moveZ(9999, 2);
		secretplat3 moveZ(9999, 2);

	}

	trig1 waittill ("trigger", player);
	trig1 delete();

	{
		iPrintlnBold("^6Secret Step ^51/3 ^6Completed!");
		secretplat1 moveZ(-9999, 2);

	}

	trig2 waittill ("trigger", player);
	trig2 delete();
	{
		iPrintlnBold("^6Secret Step ^52/3 ^6Completed!");
		secretplat2 moveZ(-9999, 2);

	}

	trig3 waittill ("trigger", player);
	trig3 delete();
	{
		iPrintlnBold("^6Secret Step ^53/3 ^6Completed!");
		secretplat3 moveZ(-9999, 2);


	}

}


bouncejumptele()
{
	jumptele= GetEnt("bouncetelejump","targetname");
	origin = GetEnt("bouncetele1","targetname");
	while(1)
	{
		jumptele waittill("trigger", player);

		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
	}	
}

bounceactitele()
{
	actitele= GetEnt("bounceteleacti","targetname");
	origin = GetEnt("bouncetele2","targetname");
	while(1)
	{
		actitele waittill("trigger", player);

		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
	}	
}

knife()
{
	level.knife = GetEnt("knifetrig","targetname");
	jump = GetEnt( "knifejumper", "targetname" );
	acti = GetEnt( "knifeacti", "targetname" );

	while(1)
	{
		level.knife waittill("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;

		if( !player checkForActi() )
		continue;
		
		removeEndRooms( "knife" );

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );
		player GiveMaxAmmo( "tomahawk_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );
		level.activ GiveMaxAmmo( "tomahawk_mp" );
		wait .05;
		player switchToWeapon( "tomahawk_mp" ); 
		level.activ SwitchToWeapon( "tomahawk_mp" );
		player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
		noti.titleText = "Knife Room!";
		noti.notifyText = level.activ.name + " ^3VS^5 " + player.name;
		noti.glowcolor = (1,0,0.9);
		noti.duration = 5;
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		wait 5;
		player FreezeControls(0);
		level.activ FreezeControls(0);

		// Put shit back
		player waittill( "death" );
		level.knife.origin = level.endRoomOriginal;
	}
}


knifebounce11()
{
	trig = getent("knifebounce11", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );

		player thread knifebounce12();
	}
}

knifebounce12()
{	
	for(i = 0; i < 4; i++)
	{
		self.health += 300;
		self finishPlayerDamage(self, level.jumpattacker, 300, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}



knifebounce21()
{
	trig = getent("knifebounce21", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );

		player thread knifebounce22();
	}
}

knifebounce22()
{	
	for(i = 0; i < 4; i++)
	{
		self.health += 300;
		self finishPlayerDamage(self, level.jumpattacker, 300, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}

knifebounce31()
{
	trig = getent("knifebounce31", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );

		player thread knifebounce32();
	}
}

knifebounce32()
{	
	for(i = 0; i < 4; i++)
	{
		self.health += 300;
		self finishPlayerDamage(self, level.jumpattacker, 300, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}

knifebounce41()
{
	trig = getent("knifebounce41", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );

		player thread knifebounce42();
	}
}

knifebounce42()
{	
	for(i = 0; i < 4; i++)
	{
		self.health += 300;
		self finishPlayerDamage(self, level.jumpattacker, 300, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}


kniferespawn()
{
	jumptele= GetEnt("kniferespawn","targetname");
	origin = GetEnt("knifeorigin","targetname");
	while(1)
	{
		jumptele waittill("trigger", player);

		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
	}	
}


jumpsecret()
{
	jumptele= GetEnt("secretentertrig","targetname");
	origin = GetEnt("secretenterorigin","targetname");
	while(1)
	{
		jumptele waittill("trigger", player);

		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
		player thread SecretTimer();
	}	
}
SecretTimer()
{
	self endon( "disconnect" );

	self.secret_timer = NewClientHudElem( self );
	self.secret_timer.y = 10;
	self.secret_timer.alignX = "center";
	self.secret_timer.alignY = "middle";
	self.secret_timer.horzAlign = "center";
	self.secret_timer.sort = -3;
	self.secret_timer.fontScale = 2.5;
	self.secret_timer.owner = self;
	self.secret_timer thread removehudifsuicide();

	self.secret_time_left = 120;
	self.secret_finished = false;

	while( self.secret_time_left > 0 && !self.secret_finished )
	{
		self.secret_timer setText( "^5Secret time left: ^6" + self.secret_time_left );
		self.secret_time_left--;
		wait 1;
	}

	if( !self.secret_finished )
	{
		self.secret_timer Destroy();
		self Suicide();
		self iPrintlnBold( "^5Don't come back noob" );
	}

}

removehudifsuicide() 
{
	self endon ("death");
	self endon ("disconnect");
	self.owner waittill("death", player);
	player.secret_finished = true;
	player.secret_timer destroy();
	self destroy();

}



secretrespawn()
{
	jumptele= GetEnt("secretrespawn","targetname");
	origin = GetEnt("secretrespawnorigin","targetname");
	while(1)
	{
		jumptele waittill("trigger", player);

		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
	}	
}


secretexit()
{
	level.secretexit = GetEnt("backtomap_trigger","targetname");
	origin = GetEnt( "backtomap_target", "targetname" );

	while(1)
	{
		level.secretexit waittill("trigger", player);
		{
			player.secret_finished = true;
			player.secret_timer Destroy();
			player.health = player.maxhealth;
			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );
			player braxi\_rank::giveRankXP( "", 1000 );
			
			iPrintlnBold( " ^5" + player.name + " ^5is a ^6pro ^5and completed the secret!" );
		}
	}
}


endxp() {
	
	trig = getent("endxp", "targetname");
	trig waittill("trigger", player);
	trig delete();
	
	wait 1;
	
	player braxi\_rank::giveRankXP( "", 2000 );
	
}

actisecrettrig()
{
	door = getent("actinotsolid", "targetname");
	trig = getent("actisecrettrig", "targetname");

	trig waittill("trigger", player);
	trig delete();
	iprintlnbold("^6Something opened.....");

	door notSolid();
}


actisecretxp()
{
	trig =  getent("actisecretgivexp", "targetname");
	trig waittill("trigger", player);
	trig delete();
	
	wait 1;
	
	player braxi\_rank::giveRankXP( "", 1000 );
	
	
	
}


actisecretrespawn(){
	{
		tele= GetEnt("actisecretrespawn","targetname");
		origin = GetEnt("actisecretrespawnorigin","targetname");
		while(1)
		{
			tele waittill("trigger", player);

			player SetPlayerAngles( origin.angles );
			player setOrigin( origin.origin );

		}	
	}

}

// MiKeY utils 
// STAY AWAY!
bouncePlayer( trigger, amount ) {
	if( !isDefined( amount ) )
		amount = 160;

	trig = getEnt( trigger, "targetname" );
	while( true ) {
		trig waittill( "trigger", player );	 
		player thread _action_bounce( amount );
	}
}

_action_bounce( amount ) {
	for(i = 0; i < 4; i++) {
		self.health += amount;
		self finishPlayerDamage(self, level.jumpattacker, amount, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((-90,0,0)), "head", 0);
	}
}

checkForActi() {
	if( !isDefined( level.activ ) ) {
		self iPrintlnBold( "Activator doesn't exist. Nice one on finishing though" );
		return false;
	}
	return true;
}

removeEndRooms( roomEntered ) {

	rooms = [];
	rooms["knife"] = GetEnt("knifetrig","targetname");
	rooms["sniper"] = GetEnt("sniper","targetname");
	rooms["bounce"] = GetEnt("bounceroomtrig","targetname");

	keys = GetArrayKeys(rooms);
	for( a = 0; a < rooms.size; a ++ ) {
		if( keys[a] == roomEntered ) {
			level.endRoomOriginal = rooms[keys[a]].origin;
			rooms[keys[a]].origin = (9999, 9999, 9999);
			continue;
		}

		if( isDefined( rooms[keys[a]] ) )
		rooms[keys[a]] delete();
	}
}

redviptrail()
{
	trig = getEnt("vipredtrail", "targetname"); 
	while( true )
	{	
		trig waittill( "trigger", player);

		
		if(getSubStr (  player getGuid(), 24, 32 ) != "cff9b1b8") {
			iPrintln("^6Map By Pain.");
			continue; 
		}
		
		player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
				player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
			     player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				


				wait .05;
				player SwitchToWeapon( "deserteagle_mp" );
			
	            while(isAlive(player)){
					playFx( level.red, player.origin );
					wait .1;
		
	}
	
}
}

blueviptrail()
{
	trig = getEnt("vipbluetrail", "targetname"); 
	while( true )
	{	
		trig waittill( "trigger", player);

		
		if(getSubStr (  player getGuid(), 24, 32 ) != "cff9b1b8") {
			iPrintln("^6Map By Pain.");
			continue; 
		}
		
		player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
				player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
			     player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				


				wait .05;
				player SwitchToWeapon( "deserteagle_mp" );
			
	            while(isAlive(player)){
					playFx( level.blue, player.origin );
					wait .1;
		
	}
	
}
}

purpleviptrail()
{
	trig = getEnt("vippurpletrail", "targetname"); 
	while( true )
	{	
		trig waittill( "trigger", player);

		
		if(getSubStr (  player getGuid(), 24, 32 ) != "cff9b1b8") {
			iPrintln("^6Map By Pain.");
			continue; 
		}
		
		player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
				player GiveWeapon( "deserteagle_mp" );
				player GiveMaxAmmo( "deserteagle_mp" );
			     player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				 player braxi\_mod::giveLife();
				


				wait .05;
				player SwitchToWeapon( "deserteagle_mp" );
			
	            while(isAlive(player)){
					playFx( level.greentrail, player.origin );
					wait .1;
		
	}
	
}
}
