/*==================================================||
||												    ||
||  ___    __                 ______  _____         ||  
||  __ |  / /____________________   |/  /( )_______ ||
||  __ | / /_  _ \_  __ \  __ \_  /|_/ /_|/__  ___/ ||
||  __ |/ / /  __/  / / / /_/ /  /  / /    _(__  )  ||
||  _____/  \___//_/ /_/\____//_/  /_/     /____/   ||
||   												||
||==================================================|| 
||   DO NOT COPY THIS FILES WITHOUT PERMISSIONS     || 
||==================================================*/
main()
{
    maps\mp\_load::main();
 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "opfor";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
 
  	setdvar("r_specularcolorscale", "1");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000 );  
	setDvar("bg_falldamageminheight", 15000 );

	precacheitem ("vipgun_mp");
	
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" ); 
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	
	thread madeby();
	thread initMusic();
	thread musictrig();
	thread unlockdoorequi();
	thread secretroom_unlock();
	thread secretroom_teleport();
	thread startdoorbuttonsecret();
	thread secretroomfail1();
	thread secretroomfail1ez();
	thread secretroomfail1hard();
	thread plateform1();
	thread hardlevel();
	thread startdoorbutton();
	thread actitrap1();
	thread actitrap2();
	thread actitrap3();
	thread actitrap4();
	thread sniperoom();   
}

madeby()
{
	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 0;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "default";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (1.0, 1.0, 1.0);
	hud_clock.label = &"^1Hello and Welcome to ^2Trap^7Nation ^1Map!";
	hud_clock fadeovertime(2);
	hud_clock.alpha = 1;
	wait 15;
	hud_clock fadeovertime(2);
	hud_clock.alpha = 0;
	wait 2;
	hud_clock destroy();
	   while(1)
		{
			hud_clock2 = NewHudElem();
			hud_clock2.alignX = "center";
			hud_clock2.alignY = "top";
			hud_clock2.horzalign = "center";
			hud_clock2.vertalign = "top";
			hud_clock2.alpha = 0;
			hud_clock2.x = 0;
			hud_clock2.y = 0;
			hud_clock2.font = "default";
			hud_clock2.fontscale = 2;
			hud_clock2.glowalpha = 1;
			hud_clock2.glowcolor = (1,0,0);
			hud_clock2.label = &"Map by EvowZ";
			hud_clock2 fadeovertime(2);
			hud_clock2.alpha = 1;
			wait 15;
			hud_clock2 fadeovertime(2);
			hud_clock2.alpha = 0;
			wait 2;
			hud_clock2 destroy();
			hud_clock3 = NewHudElem();
			hud_clock3.alignX = "center";
			hud_clock3.alignY = "top";
			hud_clock3.horzalign = "center";
			hud_clock3.vertalign = "top";
			hud_clock3.alpha = 0;
			hud_clock3.x = 0;
			hud_clock3.y = 0;
			hud_clock3.font = "default";
			hud_clock3.fontscale = 2;
			hud_clock3.glowalpha = 1;
			hud_clock3.glowcolor = (0.0, 1.0, 1.0);
			hud_clock3.label = &"Additionnals Helps: D4rK";
			hud_clock3 fadeovertime(2);
			hud_clock3.alpha = 1;
			wait 15;
			hud_clock3 fadeovertime(2);
			hud_clock3.alpha = 0;
			wait 2;
			hud_clock3 destroy();
			hud_clock4 = NewHudElem();
			hud_clock4.alignX = "center";
			hud_clock4.alignY = "top";
			hud_clock4.horzalign = "center";
			hud_clock4.vertalign = "top";
			hud_clock4.alpha = 0;
			hud_clock4.x = 0;
			hud_clock4.y = 0;
			hud_clock4.font = "default";
			hud_clock4.fontscale = 2;
			hud_clock4.glowalpha = 1;
			hud_clock4.glowcolor = (0.0, 0.8, 0.0);
			hud_clock4.label = &"Report any bug to #BrO#Owners";
			hud_clock4 fadeovertime(2);
			hud_clock4.alpha = 1;
			wait 15;
			hud_clock4 fadeovertime(2);
			hud_clock4.alpha = 0;
			wait 2;
			hud_clock4 destroy();
			wait .5;
		}
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

unlockdoorequi() //|| (tempGuid == god2) || (tempGuid == god3) || (tempGuid == god4)
{
guid1 = "2e1c0903cb89acb3093ebf17d2367dd4";
guid2 = "cd32eda9d16426605963a9551d7eb791";
unlockdoor = getent("unlockdoor", "targetname");
   for(;;)
	{
		unlockdoor waittill ("trigger",user);
		tempGuid = user getGUID();
		   if((tempGuid == guid1) || (tempGuid == guid2))
			{
				user GiveWeapon( "vipgun_mp" );
				user GiveMaxAmmo( "vipgun_mp" );
				iPrintLnBold ("^1VIP is ^2Here ^1MaDa^2FacKa^1Z");
				wait 0.5;
			}
			   else
				{
					wait 0.5;
				}
	}
}

secretroom_unlock()
{
	unlock_1 = getEnt("secretroom_unlock1", "targetname");
	unlock_2 = getEnt("secretroom_unlock2", "targetname");
	platform = getEnt("secretroom_teleport_link","targetname");
	teleporter = getEnt("secretroom_teleporter", "targetname");
	teleporter EnableLinkTo();
	teleporter LinkTo(platform);
	   for(;;)
		{
			unlock_1 waittill("trigger", player);
			unlock_2 waittill("trigger", player);
			iPrintLnBold("^1Secret ^7Room ^1Opened^7!");
			platform notsolid();
			unlock_1 delete();
			unlock_2 delete();
		}
}

secretroom_teleport()
{
	teleporter = getEnt("secretroom_teleporter", "targetname");
	secret = getEnt("secretroom_teleporter_origin", "targetname");
	   for(;;)
		{
			teleporter waittill("trigger", player);
			player SetOrigin( secret.origin );
			player setplayerangles( secret.angles );
			player iPrintLn("^7>>^1You've teleported to secretroom^7<3");
		}
}

startdoorbuttonsecret()
{
    trig = getent("startdoorbuttonsecret", "targetname"); 
	trig waittill("trigger", user);
	iprintlnbold("^1> ^2Secret door is opened ^1<");
	trig delete(); 
	thread startdoorsecret();
	i = randomintrange( 0, 3 );
	if(i == 0)
	{
		AmbientPlay ("secret_room_1");
		iPrintLn("^7>>^1Now playing^7: ^1Calvin Harris ^7& ^1Disciples ^7- ^1How Deep Is Your Love ^7(^1T^7-^1Mass ^7& ^1Ellusive Remix^7)");
	}
	else if(i == 1)
	{
		AmbientPlay ("secret_room_2");
		iPrintLn("^7>>^2Now playing^7: ^2HUCCI ^7x ^2DOM SEBASTIAN ^7- ^2Vision");
	}
	else if(i == 2)
	{
		AmbientPlay ("secret_room_3");
		iPrintLn("^7>>^3Now playing^7: ^3KSHMR ^7- ^3Jammu ^7(^3BL3R Festival ^7Trap ^3Remix^7)");
	}
}

startdoorsecret()
{	
	startdoorsecret = getent("startdoorsecret", "targetname");
	startdoorsecret moveZ (-856.2, 3);
}

buttonstartdoorsecret()
{
	buttonstartdoorsecret = getent("buttonstartdoorsecret", "targetname");
	buttonstartdoorsecret moveX (3.6, 1);
}

secretroomfail1()
{
	
	fail1secret = getent("fail1secret", "targetname");
	fail1secretorigin = getent("fail1secretorigin", "targetname");
	   for(;;)
        {
			fail1secret waittill("trigger", player);
			player SetOrigin( fail1secretorigin.origin );
			player setplayerangles( fail1secretorigin.angles );
			player iPrintLn("^7>>^1You've been respawned"); //Change the message if you want
		}
}

secretroomfail1ez()
{
	
	fail1secretez = getent("fail1secretez", "targetname");
	fail1secretezorigin = getent("fail1secretezorigin", "targetname");
	   for(;;)
        {
			fail1secretez waittill("trigger", player);
			player SetOrigin( fail1secretezorigin.origin );
			player setplayerangles( fail1secretezorigin.angles );
			player iPrintLn("^7>>^1You've been respawned"); //Change the message if you want
		}
}

secretroomfail1hard()
{
	fail1secrethard = getent("fail1secrethard", "targetname");
	fail1secrethardorigin = getent("fail1secrethardorigin", "targetname");
	   for(;;)
        {
			fail1secrethard waittill("trigger", player);
			player SetOrigin( fail1secrethardorigin.origin );
			player setplayerangles( fail1secrethardorigin.angles );
			player iPrintLn("^7>>^1You've been respawned"); //Change the message if you want
		}
}
startdoorbutton()
{
    trig = getent("startdoorbutton", "targetname");
	trig setHintString("^1Press ^7[USE] ^1to ^7open ^1startdoor");
	trig waittill("trigger", user);
	iprintlnbold("^2Starting door is moving!");
	trig delete(); 
	thread startdoor();
	thread buttonstartdoor();
}

startdoor()
{	
	startdoor = getent("startdoor", "targetname");
	startdoor moveZ (-375, 3);
	wait 4;
	startdoor delete();
}

buttonstartdoor()
{
	buttonstartdoor = getent("buttonstartdoor", "targetname");
	buttonstartdoor moveY (-6.5, 1);
}

plateform1() 
{
	plateform1 = getent("plateform1","targetname");
	   for(;;)
		{
				plateform1 movex(1235.9,2, 0.3, 0.5);
				wait 3;
				plateform1 movex(-1235.9,2, 0.3, 0.5);
				wait 3;
		}	
}

hardlevel() 
{
	level.hardtrigger = getEnt("puthardmodeon", "targetname");
	level.hardtrigger setHintString("^3Press ^1[USE] ^3If you are a pro ONLY^1!");
	level.hardtrigger waittill("trigger", user);
	   if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
		{
			level.hardtrigger delete();
		}
		   else
			{
				thread hardmodebutton();
				thread hardlevelacti();
				level.hardtrigger delete();
				iprintlnbold("^1Activator ^7Race ^2ON");
			}
}

hardmodebutton()
{
	hardmodebutton = getent("hardmodebutton", "targetname");
	hardmodebutton moveY (3, 1);
}

hardlevelacti()
{
	plateformactia = getent("plateformactia", "targetname");
	plateformactib = getent("plateformactib", "targetname");
	plateformactic = getent("plateformactic", "targetname");
	plateformactia hide();
	plateformactia notsolid();
	plateformactib hide();
	plateformactib notsolid();
	plateformactic hide();
	plateformactic notsolid();
	thread acti_teleport_fail();
	thread acti_teleport_fail1();
	thread acti_teleport_fail2();
}

acti_teleport_fail()
{
	teleporter = getEnt("respawnactia", "targetname");
	respawnactiaorigin = getEnt("respawnactiaorigin", "targetname");
	   for(;;)
		{
			teleporter waittill("trigger", player);
			wait(0.05);
			player SetOrigin( respawnactiaorigin.origin );
			player setplayerangles( respawnactiaorigin.angles );
			player iPrintLn("^7>>^1Respawned"); //Change the message if you want
			wait(0.05);
		}
}

acti_teleport_fail1()
{
	teleporter = getEnt("respawnactib", "targetname");
	respawnactiborigin = getEnt("respawnactiborigin", "targetname");
	   for(;;)
		{
				teleporter waittill("trigger", player);
				wait(0.05);
				player SetOrigin( respawnactiborigin.origin );
				player setplayerangles( respawnactiborigin.angles );
				player iPrintLn("^7>>^1Respawned");
				wait(0.05);
		}
}

acti_teleport_fail2()
{
	teleporter = getEnt("respawnactic", "targetname");
	respawnacticorigin = getEnt("respawnacticorigin", "targetname");
	   for(;;)
		{
			teleporter waittill("trigger", player);
			wait(0.05);
			player SetOrigin( respawnacticorigin.origin );
			player setplayerangles( respawnacticorigin.angles );
			player iPrintLn("^7>>^1Respawned");
			wait(0.05);
		}
}

actitrap1() //code pour activer la trap//
{
	trig = getent("trig_trap1", "targetname"); //le trigger pour lacti//
    trig setHintString("^7P^5ress ^7[^2USE^7] ^7T^5o ^7A^5ctivate^2!");
	trig waittill("trigger", user);
	trig setHintString("^5Activated^2!");
	user braxi\_rank::giveRankXP("", 50);
	thread trap1(); //et la la thread//
	thread buttontrap1();
}

buttontrap1()
{
	buttontrap1 = getent("buttontrap1","targetname");
	buttontrap1 moveY (-3, 1);
	buttontrap1 moveZ (-7, 1);
}
trap1()
{
	bounce = getent("bouncetrap1", "targetname");
	   while( 1 )
		{
			bounce rotateYaw(2520, 5, 0.1, 0.5);
			bounce waittill("movedone");
			wait 6; 
		}
}

actitrap2()
{
	trig = getent("trig_trap2", "targetname"); //le trigger pour lacti//
    trig setHintString("^7P^5ress ^7[^2USE^7] ^7T^5o ^7A^5ctivate^2!");
	trig waittill("trigger", user);
	trig setHintString("^5Activated^2!");
	user braxi\_rank::giveRankXP("", 50);
	thread buttontrap2();
	thread trap2plata(); //et la la thread//
	thread trap2platb();
	thread trap2platmid();
}

buttontrap2()
{
	buttontrap2 = getent("buttontrap2","targetname");
	buttontrap2 moveY (-3, 1);
	buttontrap2 moveZ (-7, 1);
}

trap2plata()
{
	platatrap2 = getent("platatrap2","targetname");
	platatrap2 movez(190, 2, 0.1, 0.2);
	platatrap2 waittill("movedone");
	wait(0.5);
	   for(;;)
		{
			platatrap2 movez(-380,0.5, 0.1, 0.2);
			platatrap2 waittill("movedone");
			wait(0.5);
			platatrap2 movez(380,0.5, 0.1, 0.2);
			platatrap2 waittill("movedone");
			wait(0.5);
		}
}

trap2platb()
{
	platbtrap2 = getent("platbtrap2","targetname");
	platbtrap2 movez(-190, 2, 0.1, 0.2);
	platbtrap2 waittill("movedone");
	wait(0.5);
	   for(;;)
		{
			platbtrap2 movez(380,0.5, 0.1, 0.2);
			platbtrap2 waittill("movedone");
			wait(0.5);
			platbtrap2 movez(-380,0.5, 0.1, 0.2);
			platbtrap2 waittill("movedone");
			wait(0.5);
		}
}

trap2platmid() 
{
	platmidtrap2 = getent("platmidtrap2","targetname");
	   for(;;)
		{
			platmidtrap2 RotateYaw(360,2, 0.3, 0.5);
			platmidtrap2 waittill("rotatedone");
			wait(3);
		}
}

actitrap3()
{
	trig = getent("trig_trap3", "targetname"); 
    trig setHintString("^7P^5ress ^7[^2USE^7] ^7T^5o ^7A^5ctivate^2!");
	trig waittill("trigger", user);
	trig setHintString("^2Activated^1!");
	user braxi\_rank::giveRankXP("", 50);
	thread trap3();
	thread buttontrap3();
}

buttontrap3()
{
	buttontrap3 = getent("buttontrap3","targetname");
	buttontrap3 moveY (-3, 1);
	buttontrap3 moveZ (-7, 1);
}

trap3()
{
	platatrap3 = getent("platatrap3", "targetname");
	platbtrap3 = getent("platbtrap3", "targetname");
	platctrap3 = getent("platctrap3", "targetname");
	platdtrap3 = getent("platdtrap3", "targetname");
	platetrap3 = getent("platetrap3", "targetname");
	platftrap3 = getent("platftrap3", "targetname");
	platgtrap3 = getent("platgtrap3", "targetname");
	plathtrap3 = getent("plathtrap3", "targetname");
	platitrap3 = getent("platitrap3", "targetname");//le brushmodel/
	   while( 1 )
		{
			platatrap3 rotatePitch(360, 1, 0.5, 0.5);
			platitrap3 rotatePitch(-360, 1, 0.5, 0.5);
			wait 0.3;
			platbtrap3 rotatePitch(360, 1, 0.5, 0.5);
			plathtrap3 rotatePitch(-360, 1, 0.5, 0.5);
			wait 0.3;
			platctrap3 rotatePitch(360, 1, 0.5, 0.5);
			platgtrap3 rotatePitch(-360, 1, 0.5, 0.5);
			wait 0.3;
			platdtrap3 rotatePitch(360, 1, 0.5, 0.5);
			platftrap3 rotatePitch(-360, 1, 0.5, 0.5);
			wait 0.3;
			platetrap3 rotateRoll(720, 1, 0.5, 0.5);			
			wait 3;
		}
}

actitrap4()
{
	trig = getent("trig_trap4", "targetname"); 
    trig setHintString("^7P^5ress ^7[^2USE^7] ^7T^5o ^7A^5ctivate^2!");
	trig waittill("trigger", user);
	trig setHintString("^2Activated^1!");
	user braxi\_rank::giveRankXP("", 50);
	thread trap4();
	thread trap4a();
	thread trap4b();
	thread buttontrap4();
	}

buttontrap4()
{
	buttontrap3 = getent("buttontrap4","targetname");
	buttontrap3 moveY (-3, 1);
	buttontrap3 moveZ (-7, 1);
}

trap4()
{
	platforma = getent("trap4plat", "targetname");  //le brushmodel/

	   while( 1 )
		{
			platforma rotateYaw(2520, 5, 0.5, 0.5);
			wait 6; 
		}
}

trap4a()
{
	platforma3 = getent("trap4plat2", "targetname");  //le brushmodel/

	   while( 1 )
		{
			platforma3 rotateYaw(2520, 5, 0.5, 0.5);
			wait 6; 
		}
}

trap4b()
{
    platforma3 = getent("trap4plat3", "targetname");  //le brushmodel/

	   while( 1 )
		{
			platforma3 rotateYaw(2520, 5, 0.5, 0.5);
			wait 6; 
		}
}

initMusic()

{
	level.music = [];
	
	i = 0;
	level.music[i]["artist"] = "Big Sean";
	level.music[i]["title"] = "IDFWU (K Theory Remix)";
	level.music[i]["length"] = "04:56";
	level.music[i]["alias"] = "level1";
	
	i++;
	level.music[i]["artist"] = "Ricky Remedy";
	level.music[i]["title"] = "Bound";
	level.music[i]["length"] = "04:18";
	level.music[i]["alias"] = "level2";

	i++;
	level.music[i]["artist"] = "Echos";
	level.music[i]["title"] = "Silhouettes";
	level.music[i]["length"] = "03:32";
	level.music[i]["alias"] = "level3";

	i++;
	level.music[i]["artist"] = "Monsta";
	level.music[i]["title"] = "Banga";
	level.music[i]["length"] = "03:22";
	level.music[i]["alias"] = "level4";

	i++;
	level.music[i]["artist"] = "Yung Gud";
	level.music[i]["title"] = "U Want Me";
	level.music[i]["length"] = "05:09";
	level.music[i]["alias"] = "level5";

	i++;
		
	precacheShader( "deathrun" );
	precacheShader( "white" );
}

musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "music thread terminated" );
	self thread onDisconnect();
	self.hud_music = [];
	// self cleanUp();
	self.selection = 0;
	// create huds
	i = 0;
	////////////////////braxi\_mod::addTextHud(self, x gauche/droite, y haut/bas , transparency, "x allignment", "y allignment", size(can't go below 1.3))
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 160, 0.70, "left", "top", 2 );	// Background
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "deathrun", 370, 140 );

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 300, 165, 1, "left", "top", 1.8 );
	self.hud_music[i].sort = 883;
	self.hud_music[i] setText( "^1-^7 Select Music ^1-^7" );

 	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 290, 200, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText( "Artist ^1-^7 Title ^1-^7 Length" );

 	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 280, 360, 1, "center", "top", 1.4 );
	self.hud_music[i].sort = 885;
	self.hud_music[i] setText( "Press ^3[LMB]^7: Next Song    Press ^3[USE]^7: Play Song    Press ^3[Nade]^7: Close Menu" );
	   for( j = 0; j < level.music.size; j++ )
		{
			i++;
		// Artist - Title [lenght]
		////////////////////braxi\_mod::addTextHud(self, x, y, transparency, "x allignment", "y allignment", size(can't go below 1.3))
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
 		entry = level.music[j];
		self.hud_music[i] setText( entry["artist"] + " ^3-^7 " + entry["title"] + " ^3[^7" + entry["length"] + "^3]^7" );
		}

	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );	// Selection indicator
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "white", 360, 17 );
	while( self.sessionstate == "playing" )
	{
		wait 0.1;
		if( self attackButtonPressed() )	/* select next song */
			{
				self.hud_music[4+self.selection].alpha = 0.93; //unfocus previous item
				self.selection++;

					if( self.selection >= level.music.size )
						self.selection = 0;
 						item = self.hud_music[4+self.selection];
						item.alpha = 1;
						indicator.y = item.y; // change indicator position
			}

		else if( self useButtonPressed() )	/* play selected song */
			{
				iPrintln( "^4Now playing^7: ^1" + level.music[self.selection]["artist"]+" - ^7" +level.music[self.selection]["title"] );
				self thread Blur(2,0);
				ambientPlay( level.music[self.selection]["alias"], 3 );
				self freezeControls(0);
				level notify ( "song_picked" );
				break;
			}

		else if( self fragButtonPressed() )	/* close menu */
			{
				self freezeControls(0);
				self thread Blur(2,0);
				iprintlnbold ("^1A noob Failed? :>");
				break; // close menu
			}
	}
 	self cleanUp();
}

musictrig()
{
	trig = getEnt ("musictrig", "targetname");
	trig setHintString( "Press ^1[^7USE^1]^7to ^1Choose ^7Music" );
	trig waittill("trigger", player);
	player thread musicMenu();
	trig delete();
	level endon ( "song_picked" );
	player freezeControls(1);
}

onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}

onDeathm()
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

Blur(start,end) 
{
	self notify("newblur");
	self endon("newblur");
	start = start * 10;
	end = end * 10;
	self endon("disconnect");
	if(start <= end)
	{
		for(i=start;i<end;i++)
		{
			self setClientDvar("r_blur", i / 10);
			wait .05;
		}
	}
	else for(i=start;i>=end;i--)
	{
		self setClientDvar("r_blur", i / 10);
		wait .05;
	}
}

sniperoom()
{
	level.snipe_trig = getent("sniperroom","targetname");
	jump = getent ("jump_sniper","targetname");
	acti = getent ("acti_sniper","targetname");
	while(1)
	{
		level.snipe_trig waittill( "trigger", player );
		   if( !isDefined( level.snipe_trig ) ) 
				return;
           if(level.firstenter==true)
			{
				level.bounce_trig delete();
				level.weapon_trig delete();
				level.knife_trig delete();
				level.firstenter=false;
			}
					noti = SpawnStruct();
					noti.titleText = "^1>^7Sniper Room^1<";
					noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
					noti.glowcolor = level.randomcolour;
					noti.duration = 4;
					players = getentarray("player", "classname");
				       for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
						player freezeControls(true);
						level.activ freezeControls(true);
						player setPlayerangles( jump.angles );
						player setOrigin ( jump.origin );
						player TakeAllWeapons();
						player GiveWeapon("remington700_mp");
						player GiveMaxAmmo("remington700_mp");
						player GiveWeapon("m40a3_mp");
						player GiveMaxAmmo("m40a3_mp");
						wait .05;
						level.activ setPlayerangles( acti.angles );
						level.activ setOrigin( acti.origin );
						level.activ TakeAllWeapons();
						level.activ GiveWeapon("remington700_mp");
						level.activ GiveMaxAmmo("remington700_mp");
						level.activ GiveWeapon("m40a3_mp");
						level.activ GiveMaxAmmo("m40a3_mp");
						wait 3;
						player switchToWeapon("remington700_mp");
						level.activ switchToWeapon("remington700_mp");
						player freezeControls(false);
						level.activ freezeControls(false);
						   while( isAlive( player ) && isDefined( player ) )
							wait .05;
	}
}