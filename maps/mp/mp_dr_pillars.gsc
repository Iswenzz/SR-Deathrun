//map by #FNRP#Brotter //

main()
{
	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	// setdvar("g_speed" ,"220");
	// setdvar("dr_jumpers_speed" ,"1.2");
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	//Music
	thread musicBox();

	if(!isdefined(level.music))
	level.music=[];
	level.music[0]["song"] = "After Dark By Brotter";
	level.music[0]["alias"] = "song1";
	level.music[1]["song"] = "LaDiDa By Muffinator";
	level.music[1]["alias"] = "song2";
	level.music[2]["song"] = "LaLaLaLa By Adam";
	level.music[2]["alias"] = "song3";
	level.music[3]["song"] = "We Don't By Aya";
	level.music[3]["alias"] = "song4";
	level.music[4]["song"] = "Albatraoz By Brotter";
	level.music[4]["alias"] = "song5";
	level.music[5]["song"] = "Highway By Brotter";
	level.music[5]["alias"] = "song6";

	//credits
	thread messages1();
	thread leftmessages();

	thread trap1();
	thread trap2();

	thread olddoor();
	thread shotgun();

}




//credits

leftmessages()
{
	while(1)
	{
		wait 20;
		iprintln("^3 Map Made by ^2#FNRP#Brotter");
		wait 3;
		iprintln("^3 Special Thanks to ^1#FNRP#Blu For Scripts");
		wait 3;
		iprintln("^3 Special Thanks to ^1#FNRP#Adam For Scripts");
		wait 3;
		iprintln("^3 Special Thanks to ^6#FNRP#Aya For Music");
		wait 3;
		iprintln("^3 Thanks to ^1#FNRP#Macbook For Support");
		wait 3;
		iprintln("^3 Thanks to ^5FNRP-Muffinator For Songs");
	}
}


messages1()
{
	wait 5;
	level.hud = createHUD( 500, 0, "center", "middle", 1, "objective", 1.5 );
	level.hud setText ( "^5Map Made by ^1#FNRP#Brotter" );
	level.hud MoveOverTime( 1.0 );
	level.hud.x = 0;
	level.hud.y = 0;
	wait (5);
	level.hud destroy();
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
    hud.fontscale = 2;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

start_messages()
{
    level waittill("round_started");
    wait 3;

	players = getentarray("player","classname");
	for(i=0;i<=players.size -1;i++)
	{
		if(players[i].team == "axis"){
			players[i] iPrintLnBold("^2You ^3Wait");
		}
        else {
		        players[i] iPrintLnBold("^1GL");
		}
	}
}


//Music

musicBox()
{
	trig = getEnt("trig_musicbox","targetname");
	trig setHintString("Press &&1^7 to select Music");
	trig waittill("trigger",p);
	p braxi\_rank::giveRankXP("", 50);
	trig delete();

	p freezeControls(1);
	p musicMenu();
}

//music

musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "music thread terminated" );

	self.hud_music = [];
	self.selection = 0;

	// create huds
	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
	self.hud_music[i].sort = 879;
	self.hud_music[i] setShader( "black", 320, 160 );
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "white", 306, 20 );
	self.hud_music[i].color=(1,0,0);

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText("Pillars!");
	self.hud_music[i].glowalpha=1;
	if(isdefined(level.randomcolor))
		self.hud_music[i].glowcolor=level.randomcolor;
	else
		self.hud_music[i].glowcolor=(1,0,0);
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText("Scroll: ^3[{+attack}] ^7| Select: ^3[{+activate}] ^7| Close: ^3[{+frag}]");

	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
		self.hud_music[i].glowalpha=1;
		if(isdefined(level.randomcolor))
			self.hud_music[i].glowcolor=level.randomcolor;
		else
			self.hud_music[i].glowcolor=(1,0,0);

		entry = level.music[j];
		self.hud_music[i] setText(entry["song"]);
	}

	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 306, 17 );
	indicator.color=(1,0,0);

	while(self.sessionstate == "playing")
	{
		wait 0.1;

		if(self attackButtonPressed())
		{
			self.hud_music[4+self.selection].alpha = 0.93;

			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;

			item = self.hud_music[4+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if(self useButtonPressed())
		{

			iPrintLn("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
			ambientPlay(level.music[self.selection]["alias"]);
			self freezeControls(0);
			break;
		}
		else if(self fragButtonPressed())
		{
			self freezeControls(0);
		   break;
		}
	}

	if(!isdefined(self))
		return;
	if(isdefined(self.hud_music))
	{
		for(i=0;i<self.hud_music.size;i++)
		{
			if(isdefined(self.hud_music[i]))
				self.hud_music[i] destroy();
		}
	}
	thread jumper_startdoor();
	self notify( "music thread terminated" );
}


jumper_startdoor()
{
    iPrintLnBold("Startdoor opening");
    door = getEnt("startdoor", "targetname");
    door moveZ(-500, 3);
    wait 3;
    door delete();
}


//rooms
//shotgun

//shotgun

shotgun()
{
        level.shotgun_trig = getEnt( "shotgun", "targetname"); //trigger
        jump = getEnt( "shotgun_jumper_orig", "targetname" ); //jumper origin
        acti = getEnt( "shotgun_acti_orig", "targetname" ); //acti origin
        level.shotgun_trig SetHintString("^2 Press ^5F to Enter Shotgun Room");
        while(1)
        {
                level.shotgun_trig waittill( "trigger", player );
        level.olddoor_trig delete();
                if( !isDefined( level.shotgun_trig ) )
                        return;

                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m1014_mp" );
                player giveMaxAmmo( "m1014_mp" );
                player switchToWeapon( "m1014_mp" );
                player.maxhealth = 100;

                if( isDefined( level.activ ) && isAlive( level.activ ) )
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "m1014_mp" );
                        level.activ giveMaxAmmo( "m1014_mp" );
                        level.activ SwitchToWeapon( "m1014_mp" );
                        level.activ.maxhealth = 100;
                }

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^7has chosen ^4Shotgun ^7Room!" );
                player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ freezecontrols(true);
                wait 1;
                player iPrintlnBold( "^13" );
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ iPrintlnBold( "^13" );
                wait 1;
                player iPrintlnBold( "^32" );
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ iPrintlnBold( "^32" );
                wait 1;
                player iPrintlnBold( "^51" );
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ iPrintlnBold( "^51" );
                wait 1;
                player iPrintlnBold( "^6Fight^7!" );
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ iPrintlnBold( "^6Fight^6!" );
                player freezecontrols(false);
                if(isDefined( level.activ ) && isAlive( level.activ ))
                        level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}

//oldroom

olddoor()
{
    olddoor= getEnt( "olddoor", "targetname"); //trigger
    level.olddoor_trig = getEnt( "old", "targetname");
    level.olddoor_trig SetHintString("^2Press ^3F ^4Go ^5Old");
    level.olddoor_trig waittill ("trigger", player);
    olddoor moveZ(-300,0.1);
    level.shotgun_trig delete();

}



trap1()
{
	//trap1_trig= getEnt( "trig10", "targetname"); //trigger
	spinPlat = getEntArray( "spinPlat", "targetname");
	//trap1_trig SetHintString("^2They ^3All ^4Go ^5Round");
	//trap1_trig waittill ("trigger", player);
	//trap1_trig delete();
	while(1)
	{
		for( i=0; i < spinPlat.size; i++ ) {
			if( randomInt(2) != 0 )
				spinPlat[i] rotateYaw(360, 3);
			else
				spinPlat[i] rotateYaw(-360, 3);
		}
		wait 3;
	}
}

trap2() {
	movePlat = getEntArray( "teabagPlat", "targetname");

	for( i=0; i < movePlat.size; i++ ) {
		if( randomInt(2) == 0 )
			movePlat[i] thread teabagPlatforms( 1 );
		else
			movePlat[i] thread teabagPlatforms( -1 );
		wait 0.1;
	}
}

teabagPlatforms( negative ) {

	for(;;) {
		self moveZ( 50 * negative , 1 );
		wait 1;
		self moveZ( 50 * ( -1 * negative ), 1 );
		wait 1;
		self moveZ( 50 * ( -1 * negative ), 1 );
		wait 1;
		self moveZ( 50 * negative, 1 );
		wait 1;
	}

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