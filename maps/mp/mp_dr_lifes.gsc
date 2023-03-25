///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////																									///////
///////																									///////
///////		//			//	////////////	//////////	  /////////		//////////	/////////////		///////
///////		//			//	//				//					//		//		//	/		   //		///////
///////		//			//	//				//			 	   // 		//		//	////////////		///////
///////		//			//	////////////	//////////		  //		//		//	//	  //			///////
///////		//			//	//				//				 //			//		//	//	   //			///////
///////		//			//	//				//			    //			//		//	//		//			///////
///////		/////////	//	//				///////////	   /////////	//////////	//		 //			///////
///////																									///////
///////																									///////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
Map By: Lifezor
Script By: Lifezor
Started: 22.1.2017
Finished: ???
*/

//you are not supposed to be here.. gtfo. if you find a bug dont modify it yourself.. (*VINK VINK*)

main()
{
	//maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	preCacheItem ( "deserteaglegold_mp" );
	
//random threads	
	
	thread creds();
	thread stage2tele();
	thread actistage2tele();
	thread startdoor();
	thread stage3tele();
	thread actistage3tele();
	thread addTestClients();
	thread songtrig();
	thread cleanup();
	thread songlist();
	thread bouncewep();
	thread bounceteles();
	thread movingletters();
	thread secrettps();
	thread mattvoyuebal();
	thread shortcuts();
	thread secretenter();
	
//traps

	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();

//endrooms
	
	thread sniper();
	thread bounce();
	thread knife();
	thread old();

//triggerlist
	
	addTriggerToList ( "trap1_trig" );
	addTriggerToList ( "trap2_trig" );
	addTriggerToList ( "trap3_trig" );
	addTriggerToList ( "trap4_trig" );
	addTriggerToList ( "trap5_trig" );
	
//end	
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
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

creds()
{
	if( isDefined( self.logoText ) )
		self.logoText destroy();

	self.logoText = newHudElem();
	self.logoText.y = 10;
	self.logoText.alignX = "center";
	self.logoText.alignY = "middle";
	self.logoText.horzAlign = "center_safearea";

	self.logoText.alpha = 0;
	self.logoText.sort = -3;
	self.logoText.fontScale = 1.6;
	self.logoText.archieved = true;

	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5->^4Map Made By Lifezor^5<-");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5->^4Steam:/id/LfezR^5<-");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

stage2tele()
{
    trig = getEnt("stage2tele", "targetname");
    target = getEnt("stage2_origin", "targetname");
       
    while(1)
    {
        trig waittill("trigger", player);
                   
        {
            player setOrigin( target.origin );
            player setPlayerAngles( target.angles );
        }
    }
}

actistage2tele()
{
    trig = getEnt("actistage2tele", "targetname");
    target = getEnt("actistage2tele_origin", "targetname");
       
    while(1)
    {
        trig waittill("trigger", player);
                   
        {
            player setOrigin( target.origin );
            player setPlayerAngles( target.angles );
        }
    }
}

startdoor()
{
	startdoor = getent("startdoor","targetname");
	level waittill("round_started");
	wait 8;
	iPrintLnBold("Start Door Open.");
	startdoor delete();
}

stage3tele()
{
    trig = getEnt("stage3tele", "targetname");
    target = getEnt("stage3tele_origin", "targetname");
       
    while(1)
    {
        trig waittill("trigger", player);
                   
        {
            player setOrigin( target.origin );
            player setPlayerAngles( target.angles );
        }
    }
}

actistage3tele()
{
    trig = getEnt("actistage3tele", "targetname");
    target = getEnt("actistage3_origin", "targetname");
       
    while(1)
    {
        trig waittill("trigger", player);
                   
        {
            player setOrigin( target.origin );
            player setPlayerAngles( target.angles );
        }
    }
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
         ent[i].pers["registered"] = 0;
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

songtrig()
{
	trigger = getEnt ( "musicmenutrig", "targetname" );
	trigger waittill( "trigger", player );
	trigger delete();
	level endon ( "song_picked" );
	player thread songmenu();
	player freezeControls(1);
}

songmenu() //thanks to someone..
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
	self.hud_music[i] setText( "Music Menu" );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "Select a Song" );
 
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press [USE] To Play The Song" );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText( "^8Lifezor" );
 
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
			iPrintln( "^5Now playing: " + level.music[self.selection]["artist"]+" - " +level.music[self.selection]["title"] );
 
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

songlist()
{
		level.music = [];
 
        i = 0;
		level.music[i]["artist"] = "Espielle";
		level.music[i]["title"] = "Trill Chap";
		level.music[i]["alias"] = "song1";
		
		i++;
		level.music[i]["artist"] = "Espielle";
		level.music[i]["title"] = "Gem Grade";
		level.music[i]["alias"] = "song2";
		
		i++;
		level.music[i]["artist"] = "Dreweybear";
		level.music[i]["title"] = "Survive (feat. Lauren McAndrew)";
		level.music[i]["alias"] = "song3";
		
		i++;
		level.music[i]["artist"] = "DROELOE";
		level.music[i]["title"] = "In Time (ft. Belle Doron)";
		level.music[i]["alias"] = "song4";
		
		i++;
		level.music[i]["artist"] = "Notes";
		level.music[i]["title"] = "Know You";
		level.music[i]["alias"] = "song5";
		

		precacheShader( "black" );
		precacheShader( "white" );
}

onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}

onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

sniper()
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "jumpsniper", "targetname" );
     sacti = getEnt( "actisniper", "targetname" );
	 
	 if( !isDefined( level.sniper_trig ) )
         return;
		 
	 while(1)
	 {
		level.sniper_trig waittill( "trigger", player );
		
		if(!isdefined(level.firstenter))
			level.firstenter=false;
			
		if(level.firstenter==false)
		{
		 level.knife_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.firstenter=true;
		}
			level.activ freezeControls(1);
			player FreezeControls(1);
			
			player SetPlayerAngles( sjump.angles );
			player setOrigin( sjump.origin );
			level.activ setPlayerangles( sacti.angles );
			level.activ setOrigin( sacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();
			
			level.activ giveweapon( "m40a3_mp");
			player giveweapon( "m40a3_mp");
			player switchToWeapon( "m40a3_mp" );
			level.activ SwitchToWeapon( "m40a3_mp" );
			player giveMaxAmmo( "m40a3_mp" );
			level.activ giveMaxAmmo( "m40a3_mp" );
			
			level.activ giveweapon( "remington700_mp");
			player giveweapon( "remington700_mp");
			player switchToWeapon( "remington700_mp" );
			level.activ SwitchToWeapon( "remington700_mp" );
			player giveMaxAmmo( "remington700_mp" );
			level.activ giveMaxAmmo( "remington700_mp" );
			
			level.activ freezeControls(1);
			player FreezeControls(1);
			
					noti = SpawnStruct();
					noti.titleText = (player.name + "^2Entered ^5Sniper ^2Fight!");
					noti.notifyText = level.activ.name + " ^1VS^5 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);
					
					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					
			wait 2;
			
			level.activ FreezeControls(0);
			player FreezeControls(0);
			
			wait 0.1;
                     
			while(isAlive(player))
				wait 1;

		}
}

trap1()
{
	trig = getent("trap1_trig", "targetname");
	brush = getent("notshow1", "targetname");
	brush2=getent("notshow2", "targetname");
	trig waittill("trigger", player);
	trig delete();
	
	while (1)
	{	
	brush notsolid();
	brush hide();
	wait randomint(4);
	brush solid();
	brush show();
	wait 5;
	brush2 notsolid();
	brush2 hide();
	wait randomint(4);
	brush2 solid();
	brush2 show();
	wait 5;
	}
}
trap2()
{
	trig = getent("trap2_trig", "targetname");
	brush = getent("notsolid1", "targetname");
	brush2 = getent("notsolid2", "targetname");
	brush3 = getent("notsolid3", "targetname");
	trig waittill("trigger", player);
	trig delete();
	x = randomInt(4);
		if(x == 0)
			brush notsolid();
		else if(x == 1)
			brush2 notsolid();
		else if(x == 2)
			brush3 notsolid();
		else
		{
		brush notsolid();
		}
}

trap3()
{
	trig = getent("trap3_trig", "targetname");
	brush = getent("move1", "targetname");
	brush2 = getent("move2", "targetname");
	brush3 = getent("move3", "targetname");
	brush4 = getent("move4", "targetname");
	trig waittill("trigger", player);
	trig delete();
	
	for(;;)
	{
		brush movey(-80,0.3);
		brush waittill ("movedone");
		brush movey(80,0.3);
		brush waittill ("movedone");
		brush2 movex(100,0.3);
		brush2 waittill ("movedone");
		brush2 movex(-100,0.3);
		brush2 waittill ("movedone");
		brush3 movez(90,0.3);
		brush3 waittill ("movedone");
		brush3 movez(-90,0.3);
		brush3 waittill ("movedone");
		brush4 movey(95,0.3);
		brush4 waittill ("movedone");
		brush4 movey(-95,0.3);
		brush4 waittill ("movedone");
	}
}

trap4()
{
	trig = getent("trap4_trig", "targetname");
	brush = getent("spin1", "targetname");
	brush2 = getent("spin2", "targetname");
	brush3 = getent("spin3", "targetname");
	trig waittill("trigger", player);
	trig delete();
	
	for(;;)
	{
		brush rotateyaw(720,2);
		brush2 rotateyaw(1080,2.4);
		brush3 rotateyaw(360,1.5);
		wait 5;
		brush3 rotateyaw(-1080,2.7);
		brush rotateyaw(720,2.4);
		brush2 rotateyaw(1080, 2.9);
		wait 7;
	}
}

bouncewep()
{
	trig = getEnt("givewep", "targetname");
	
	while(1)
	{	
		trig waittill("trigger", player);
	
		{
			player takeallweapons();
			player giveweapon( "m40a3_mp");
			player giveMaxAmmo( "m40a3_mp");
			player switchToWeapon( "m40a3_mp");
			player giveweapon( "deserteaglegold_mp");
			player giveMaxAmmo( "deserteaglegold_mp");
		}
	}
}

 bounce()
    {
         level.bounce_trig = getEnt( "bounce", "targetname");
         bjumper = getEnt( "jumpb", "targetname" );
         bacti = getEnt( "actib", "targetname" );
             
            if( !isDefined( level.bounce_trig ) )
             return;
                     
             while(1)
             {
                    level.bounce_trig waittill( "trigger", player );
                   
                            if(!isdefined(level.firstenter))
                            level.firstenter=false;
                           
                    if(level.firstenter==false)
                    {
                     level.sniper_trig delete();
                     level.knife_trig delete();
					 level.old_trig delete();
                     level.firstenter=true;
                    }
                            level.activ freezeControls(1);
                            player FreezeControls(1);
                           
                            player SetPlayerAngles( bjumper.angles );
                            player setOrigin( bjumper.origin );
                            level.activ setPlayerangles( bacti.angles );
                            level.activ setOrigin( bacti.origin );
							
							                    player takeallweapons();
                    player GiveWeapon( "knife_mp" );
            player SwitchtoWeapon( "knife_mp" );
            level.activ takeallweapons();
                    level.activ GiveWeapon( "knife_mp" );
            level.activ SwitchtoWeapon( "knife_mp" );
                           
                           
                            level.activ freezeControls(1);
                            player FreezeControls(1);
                           
                                            noti = SpawnStruct();
                                            noti.titleText = (player.name + "^2Has ^5Chosen Bounce ^2Room!");
                                            noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                            noti.duration = 6;
                                            noti.glowcolor = (0, 0, 1.0);
                                           
                                            players = getEntArray("player", "classname");
                                            for(i=0;i<players.size;i++)
                                                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                           
                            wait 2;
                           
                            level.activ FreezeControls(0);
                            player FreezeControls(0);
                           
                            wait 0.1;
                         
                            while(isAlive(player))
                                    wait 1;
     
                    }
    }
	
bounceteles()
{

	thread jumptele();
	thread actitele();
	thread midtele();
	
}

jumptele()
{
	trig = getEnt("jumptele", "targetname");
	target = getEnt("jumptele_origin", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

actitele()
{
	trig = getEnt("actitele", "targetname");
	target = getEnt("actitele_origin", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

midtele()
{
	trig = getEnt("bouncemidtele", "targetname");
	target = getEnt("midtele_origin", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		{
			player setOrigin( target.origin );
			player setPlayerAngles( target.angles );
		}
	}
}

knife()
{
     level.knife_trig = getEnt( "knife", "targetname");
     kjump = getEnt( "jumpk", "targetname" );
     kacti = getEnt( "actik", "targetname" );
	 
	if( !isDefined( level.knife_trig ) )
         return;
		 
	 while(1)
	 {
		level.knife_trig waittill( "trigger", player );
		
		if(!isdefined(level.firstenter))
			level.firstenter=false;
			
		if(level.firstenter==false)
		{
		 level.sniper_trig delete();
		 level.bounce_trig delete();
		 level.old_trig delete();
		 level.firstenter=true;
		}
			level.activ freezeControls(1);
			player FreezeControls(1);
			
			player SetPlayerAngles( kjump.angles );
			player setOrigin( kjump.origin );
			level.activ setPlayerangles( kacti.angles );
			level.activ setOrigin( kacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();
			
			level.activ giveweapon( "knife_mp");
			player giveweapon( "knife_mp");
			player switchToWeapon( "knife_mp" );
			level.activ SwitchToWeapon( "knife_mp" );
			
			level.activ freezeControls(1);
			player FreezeControls(1);
			
					noti = SpawnStruct();
					noti.titleText = (player.name + "^2Entered ^5Knife ^2Fight.");
					noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);
					
					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					
			wait 2;
			
			level.activ FreezeControls(0);
			player FreezeControls(0);
			
			wait 0.1;
                     
			while(isAlive(player))
				wait 1;

		}
}

old()
{
     level.old_trig = getEnt( "old", "targetname");
     ojump = getEnt( "jumpo", "targetname" );
     oacti = getEnt( "actio", "targetname" );
	 
	if( !isDefined( level.old_trig ) )
         return;
		 
	 while(1)
	 {
		level.old_trig waittill( "trigger", player );
		
		{
		 level.sniper_trig delete();
		 level.knife_trig delete();
		 level.bounce_trig delete();
		}
			level.activ freezeControls(0);
			player FreezeControls(0);
			
			player SetPlayerAngles( ojump.angles );
			player setOrigin( ojump.origin );
			level.activ setPlayerangles( oacti.angles );
			level.activ setOrigin( oacti.origin );
			level.activ TakeAllWeapons();
			player TakeAllWeapons();
			
			level.activ giveweapon( "deserteagle_mp");
			player giveweapon( "deserteagle_mp");
			player switchToWeapon( "deserteagle_mp" );
			level.activ SwitchToWeapon( "deserteagle_mp" );
			
			level.activ freezeControls(0);
			player FreezeControls(0);
			
					noti = SpawnStruct();
					noti.titleText = (player.name + "^2Entered ^5Old..");
					//noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
					noti.duration = 6;
					noti.glowcolor = (0, 0, 1.0);
					
					players = getEntArray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					
			wait 2;
			
			level.activ FreezeControls(0);
			player FreezeControls(0);
			
			wait 0.1;
                     
			while(isAlive(player))
				wait 1;

		}
}

movingletters()
{

	thread knifeletter();
	thread snipeletter();
	thread bounceletter();
	thread oldletter();
	
}

knifeletter()
{
    kspin=getent("knifespin","targetname");
	
    while(1)
    {
    kspin rotateyaw(360, 4);
	wait 2;
    }
}

snipeletter()
{
    sspin=getent("sniperspin","targetname");
	
    while(1)
    {
    sspin rotateyaw(360, 4);
	wait 2;
    }
}

bounceletter()
{
    bspin=getent("bouncespin","targetname");
	
    while(1)
    {
    bspin rotateyaw(360, 4);
	wait 2;
    }
}

oldletter()
{
    ospin=getent("oldspin","targetname");
	
    while(1)
    {
    ospin rotateyaw(360, 4);
	wait 2;
    }
}

trap5()
{
	trig = getent ("trap5_trig", "targetname");
	brush = getent ("platformmove1", "targetname");
	brush2= getent ("platformmove2", "targetname");
	trig waittill ("trigger" , player);
	trig delete();
	
	for(;;)
	{	
	brush movey (150, 2);
	brush2 movey (-150, 2);
	wait 4;
	brush movey (-150, 2);
	brush2 movey (150, 2);
	wait 4;
	brush movex (200,2);
	brush2 movex(-200,2);
	wait 4;
	brush movex (-200,2);
	brush2 movex(200,2);
	wait 4;
	brush movez (400,2);
	brush2 movez(-400,2);
	wait 4;
	brush movez (-400,2);
	brush2 movez(400,2);
	wait 5;
	}
}

mattvoyuebal()
{
	door = getEnt("harddoor","targetname");
	trig1 = getEnt("secretshot3","targetname");
	trig2 = getEnt("secretshot2","targetname");
	trig3 = getEnt("secretshot1", "targetname");
	while(1)
	{
		trig1 waittill("trigger", player);
		trig2 waittill("trigger", player);
		trig3 waittill("trigger",player);
		iPrintLnBold ("^5What happened..?");
		door notSolid();
	}
}

shortcuts()
{
	
	thread shortcut1();
	thread shortcut2();
	
}

shortcut1()
{
	trig = getent("shortcut11" ,"targetname");
	trig2 = getent ("shortcut12", "targetname");
	trig waittill ("trigger" , player);
	trig delete();
	while(1)
	{
	trig2 waittill ("trigger", player);
	player braxi\_rank::giveRankXP("", 5);
	trig2 delete();
	}
}

shortcut2()
{
	trig = getent("shortcut21" ,"targetname");
	trig2 = getent ("shortcut22", "targetname");
	trig waittill ("trigger" , player);
	trig delete();
	while(1)
	{
	trig2 waittill ("trigger", player);
	player braxi\_rank::giveRankXP("", 15);
	trig2 delete();
	}
}

secrettps()
{
	thread stp1();
	thread stp2();
	thread stp3();
	thread stp4();
	thread sfinish();
}

stp1()
{
    trig = getEnt("secrettp1", "targetname");
    target = getEnt("secretorigin1", "targetname");
           
    while(1)
    {
		trig waittill("trigger", player);
                   
            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

stp2()
{
    trig = getEnt("secrettp2", "targetname");
    target = getEnt("secretorigin2", "targetname");
           
    while(1)
    {
		trig waittill("trigger", player);
                   
            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

stp3()
{
    trig = getEnt("secrettp3", "targetname");
    target = getEnt("secretorigin3", "targetname");
           
    while(1)
    {
		trig waittill("trigger", player);
                   
            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

stp4()
{
    trig = getEnt("secrettp4", "targetname");
    target = getEnt("secretorigin4", "targetname");
           
    while(1)
    {
		trig waittill("trigger", player);
                   
            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );

            }
    }
}

sfinish()
{
    trig = getEnt("secretfinish", "targetname");
    target = getEnt("secretfinish_orig", "targetname");
           
    while(1)
    {
		trig waittill("trigger", player);
                   
            {
                player setOrigin( target.origin );
                player setPlayerAngles( target.angles );
				player giveweapon("deserteaglegold_mp");
				player giveMaxAmmo("deserteaglegold_mp");
				player switchToWeapon("deserteaglegold_mp");
				player braxi\_rank::giveRankXP("", 200);

            }
    }
}

secretenter()
{
    trig = getEnt("hardenter", "targetname");
    target = getEnt("secretorigin", "targetname");
       
    while(1)
    {
        trig waittill("trigger", player);
                   
        {
            player setOrigin( target.origin );
            player setPlayerAngles( target.angles );
        }
    }
}

//end