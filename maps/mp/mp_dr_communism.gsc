// #include braxi\_dvar;
// #include braxi\_common;
// #include braxi\_rank;
main()
{
	maps\mp\_load::main();
	PrecacheItem( "mr6_mp" );
	PrecacheItem( "ppsh_mp" );
	PrecacheItem( "axe_mp" );
	
	level.smoke = loadFX("deathrun/smoke");
	level.electric = loadFX("deathrun/lightning");
	level.fire = loadFX("deathrun/fire");
	level.fire2 = loadFX("deathrun/fire2");
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	thread smoke();
	thread tele1();
	thread trap1();
	thread trap2();
	thread bridge();
	thread lightningtrap();
	thread trap3();
	thread trap3swagshop();
	thread trap5();
	thread sniper();
	thread bounce();
	thread bouncejumptele();
	thread bounceactitele();
	thread warzone();
	thread secret();
	thread actielevator();
	thread creds();
	thread secretrespawn();
	thread sniper_respawn();
	thread old();
	thread secretend();
	thread guidsecret();
	thread serverpain();
	thread music();
	thread axetree();
	thread axe();
	
	addTriggerToList( "trig1" );
	 addTriggerToList( "trap2trig" );
	 addTriggerToList( "trap3" );
	 addTriggerToList( "nigtrig" );
	 addTriggerToList( "trig5" );
	 
}

	
 

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
	
	
	 

smoke()
{
smoke1 = getent("smoke1", "targetname");
smoke2 = getent("smoke2", "targetname");

 level waittill( "round_started" );
 
PlayFX( level.smoke, smoke1.origin );
PlayFX( level.smoke, smoke2.origin );

}

tele1()
{
	tele= GetEnt("tele1","targetname");
	origin = GetEnt("origintele1","targetname");
	iPrintlnBold( " ^5Some Faggot ^9has found ^5the secret^3" );
	while(1)
        {
	tele waittill("trigger", player);
	
		  	player SetPlayerAngles( origin.angles );
	                player setOrigin( origin.origin );
					
}	
}

trap1()
{
trap1_1 = getent("trap1_1", "targetname");
trap1_2 = getent("trap1_2", "targetname");
trap1_3 = getent("trap1_3", "targetname");
trap1_4 = getent("trap1_4", "targetname");
trap1_5 = getent("trap1_5", "targetname");
trap1_6 = getent("trap1_6", "targetname");
trap1_7 = getent("trap1_7", "targetname");
trig = getEnt("trig1","targetname");
trig waittill ("trigger", player);
trig delete();

		while(1)
        {

				trap1_1 rotateyaw (720 , 2.5);
				trap1_2 rotateyaw (720 , 2.5);
				trap1_3 rotateyaw (720 , 2.5);
				trap1_4 rotateyaw (720 , 2.5);
				trap1_5 rotateyaw (720 , 2.5);
				trap1_6 rotateyaw (720 , 2.5);
				trap1_7 rotateroll (-720 , 2.5);
				
				wait 4;
				
				trap1_1 rotateyaw (720 , 2.5);
				trap1_2 rotateyaw (720 , 2.5);
				trap1_3 rotateyaw (720 , 2.5);
				trap1_4 rotateyaw (720 , 2.5);
				trap1_5 rotateyaw (720 , 2.5);
				trap1_6 rotateyaw (720 , 2.5);
				trap1_7 rotateroll (-720 , 2.5);
				
wait 4;
}				
}	


trap2()
{
fire1 = GetEnt("fire1", "targetname");
fire2 = GetEnt("fire2", "targetname");
fire3 = GetEnt("fire3", "targetname");
fire4 = GetEnt("fire4", "targetname");
firekill = GetEnt("trap2kill", "targetname");
trig = GetEnt("trap2trig", "targetname");
trig waittill("trigger", player);
trig delete();
PlayFX( level.fire, fire1.origin );
PlayFX( level.fire, fire2.origin );
PlayFX( level.fire2, fire3.origin );
PlayFX( level.fire2, fire4.origin );

for(;;)
{
firekill waittill("trigger", player);
wait 0.01;
player suicide();
}
}


bridge()
{
bridge = GetEnt("bridge", "targetname");
bridgedoor = GetEnt("bridgedoor", "targetname");
trig = GetEnt("bridgetrig", "targetname");
trig waittill ("trigger", player);
trig delete();

bridgedoor moveZ (156 , 1.5);
	wait 1.5;
	bridge moveX (849 , 1.9);
	wait .5;
iPrintlnBold( " ^5" + player.name + " ^3Has Accessed ^9The Bridge!" );
}


lightningtrap()
{

 lightning1 = getent("lightning1", "targetname");
 lightning2 = getent("lightning2", "targetname");

 trig = getent("trap3", "targetname");

 trap3damage = getent("trap3damage", "targetname");

 trap3link = getent("trap3link", "targetname");

 trap3damage enableLinkTo();
 
 trap3damage LinkTo(trap3link);

 trap3link moveY( -1000, 0.1 );

 trig waittill ("trigger", player);
 trig delete();
 
 trap3link moveY( 1000, 0.1 );
 
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );

wait 0.5;
PlayFX( level.electric, lightning1.origin );
PlayFX( level.electric, lightning2.origin );
wait .5;

trap3damage delete();

}

trap3()
{ 
	lasers = getEnt( "syndkys", "targetname" );
	trig = getEnt( "nigtrig", "targetname" ); // targetname stolen from familyguy
	acti = getEnt("nigtrigacti", "targetname");
	
	acti waittill ("trigger", player);

	lasers show();
	lasers solid();
	
	thread trap3meh();
}

trap3meh()
{
	trig = getEnt( "nigtrig", "targetname" );
		for(;;) {
	trig waittill ("trigger", player);
	player suicide();
	wait 1;
}
}

		
trap3swagshop()
{ 
	lasers = getEnt( "syndkys", "targetname" );		
	
	lasers hide();
	lasers notsolid();
}


	trap5()
 {
	trap5_1 = getEnt ("trap5_1","targetname");
	trap5_2 = getEnt ("trap5_2","targetname");
	trig5 = getEnt ("trig5","targetname");
	trig5 waittill ("trigger", player);
	trig5 delete ();
	random = randomint (2);
	switch (random) {
		case 0: trap5_1 hide();
				trap5_1 notsolid();
				wait 1.0;
				break;
		case 1: trap5_2 hide();
				trap5_2 notsolid();
				wait 1.0;
				break;
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
		if( !level.PlayerInRoom )
		level.bounce delete();
		level.old delete();
		level.axe delete();
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			
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
			level.PlayerInRoom = false;
		}
	}
}


bounce()
{
	level.bounce = GetEnt("bounce","targetname");
    jump = GetEnt( "bouncejumper", "targetname" );
    acti = GetEnt( "bounceacti", "targetname" );

	while(1)
	{
		level.bounce waittill("trigger", player);
		if( !level.PlayerInRoom )
		level.sniper delete();
		level.old delete();
		level.axe delete();
		
		{
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
			level.PlayerInRoom = false;
		}
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

warzone()
{
trig = GetEnt("warzone", "targetname");
trig waittill ("trigger", player);

iPrintlnBold  (" ^5" + player.name + " ^3just shot ^9War^5Zone's ^1Tree ;-;!" );
}


secret()
{
secretele = GetEnt("secret","targetname");
origin = GetEnt("secretteleport","targetname");
	
	wait .5;
	
	
	wait 1;
    while(1) 
	{
		secretele waittill ("trigger", player);
		player SetPlayerAngles( origin.angles );
		player setOrigin( origin.origin );
		wait 0.1;		
		iPrintlnBold ( " ^5Some Faggot ^9has entered ^5the secret^3" );
	}
}

actielevator(){
	trig = getEnt( "actiele", "targetname" );
	trap4left = getEntArray( "actielevator", "targetname" );
	trig waittill( "trigger", nigger );
	for(;;){
	for( i = 0; i < trap4left.size; i++ )
		{
			trap4left[i] moveZ( 585, 1 );
			wait 6;
			trap4left[i] moveZ( -585, 1 );
			wait 6;
		}	
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
         level.xxx.fontScale = 1.4;
         level.xxx.hidewheninmenu = false;     
         level.xxx.color = (255,128,0);
         level.xxx.glowColor = (0.3, 0.6, 0.3);
         level.xxx.glowAlpha = 1;
while(1)
         {
         level.xxx.color = (1,0,0);
         level.xxx.label = &"Map by Pain.";    
         wait 3;
         level.xxx.color = (0,50,258);
         level.xxx.label = &"Thanks to Synd";
         wait 5;
		 level.xxx.color = (100,45,234);
         level.xxx.label = &"Thanks to JWofles";
         wait 5;
		 level.xxx.color = (0,50,122);
         level.xxx.label = &"Thanks to iMtroll";
		 wait 5;
		 level.xxx.color = (0,50,122);
         level.xxx.label = &"Thanks to Caspa for the funding of this map";
		 wait 5;
		 level.xxx.color = (20,75,140);
         level.xxx.label = &"Thanks to Mist for the custom weapons";
		 wait 5;
}
}

 


secretrespawn()
{
	secretrespawn= GetEnt("secrettrigger","targetname");
	origin = GetEnt("secretrespawn","targetname");
	while(1)
        {
	secretrespawn waittill("trigger", player);
	
		  	player SetPlayerAngles( origin.angles );
	                player setOrigin( origin.origin );
}	
}

sniper_respawn()
{
	trigger = getent ( "sniperrespawn", "targetname" );
	level.sniper_respawnjumper = getent ( "sniper_respawnjumper", "targetname" );
	level.sniper_respawnacti = getent ( "sniper_respawnacti", "targetname" );
	for(;;)
	{
		trigger waittill ( "trigger", player );
	
		if( player.pers[ "team" ] != "spectator" )
		{
			if( player.pers[ "team" ] == "allies" )
			{
				player SetPlayerAngles ( level.pj.angles );
				player SetOrigin ( level.sniper_respawnjumper.origin );
			}
			if( player.pers[ "team" ] == "axis" )
			{
				player SetPlayerAngles ( level.aj.angles );
				player SetOrigin ( level.sniper_respawnacti.origin );
			}
		}
	}
}

old()
{
	level.old = GetEnt("old","targetname");
    old = GetEnt( "oldroom", "targetname" );

	while(1)
	{
		level.old waittill("trigger", player);
		level.bounce delete();
		level.sniper delete();
		level.axe delete();
		{
			if( isDefined(level.old_trig) )
			
			player.health = player.maxhealth;
			player SetPlayerAngles( old.angles );
	        player setOrigin( old.origin );
	        wait .05;
			noti = SpawnStruct();
					noti.titleText = "Old Room!";
					noti.glowcolor = (1,0,0.9);
					noti.duration = 5;
					players = getentarray("player", "classname");
					for(i=0;i<players.size;i++)
						players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		}
	}
}


secretend()
{
	level.secretend = GetEnt("secretend","targetname");
    origin = GetEnt( "secretendorigin", "targetname" );

	while(1)
	{
		level.secretend waittill("trigger", player);
		{
			player.health = player.maxhealth;
			player SetPlayerAngles( origin.angles );
	        player setOrigin( origin.origin );
	        player GiveWeapon( "mr6_mp" );
			player GiveMaxAmmo( "mr6_mp" ); 
			player SwitchToWeapon( "mr6_mp" );
			// player braxi\_rank::giveRankXP( "", 489);
			iPrintlnBold( " ^5" + player.name + " ^3Is A ^9Pro ^9Slider and completed the secret!" );
		}
	}
}


guidsecret()
{
	level waittill( "round_started" );
	wait 5;

	players = GetEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		Guid = getSubStr(players[i] getGuid(),24,32);
		if( (Guid == "65586cbf" || Guid == "cff9b1b8") || (Guid == "4021c83b" || Guid == "bebcfb6b")  || (Guid == "a44c8971" || Guid == "11111111") && players[i].pers["team"] == "allies" ) //first one is synd, second is blank so change it, to add multiple just copy and paste another (Guid == "65586cbf" || Guid == "11111111")
		{
			players[i] GiveWeapon( "mr6_mp" );
			players[i] GiveMaxAmmo( "mr6_mp" );
			players[i] GiveWeapon( "ppsh_mp" );
			players[i] GiveMaxAmmo( "ppsh_mp" );
			wait .05;
			players[i] SwitchToWeapon( "mr6_mp" );
			players[i] iPrintlnBold( "Take this PPSH and MR6!");
		}
		
	}	
		
}

serverpain()
{
	level waittill( "round_started" );
	wait 5;
	players = GetEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		Guid = getSubStr(players[i] getGuid(),24,32);
		if( (Guid == "cff9b1b8" || Guid == "11111111") && players[i].pers["team"] == "allies" ) //change PAINSGUID to your guid, keep 1111 as it is nobodies guid and it wont do anything
		{

		 iPrintlnBold( "^5Pain. is in the ^9Server ^5and you are all bad c:");
		}
	}
}

music()
{
	songs = [];
	songs[songs.size] = "song1";
	songs[songs.size] = "song2";
	songs[songs.size] = "song3";

	selected = songs[ Randomint( songs.size ) ];
	AmbientPlay( selected );
}


axetree()
{
trig = GetEnt("axetree", "targetname");
trig waittill ("trigger", player);
		player GiveWeapon( "axe_mp" );
		player GiveMaxAmmo( "axe_mp" ); 
		player SwitchToWeapon( "axe_mp" );
		wait .5;
iPrintlnBold  (" ^5" + player.name + " ^3has gotten an ^9Axe  ^2;o" );
}

axe()
{
	level.axe = GetEnt("axe","targetname");
    jump = GetEnt( "jumperaxe", "targetname" );
    acti = GetEnt( "actiaxe", "targetname" );

	while(1)
	{
		level.axe waittill("trigger", player);
		if( !level.PlayerInRoom )
		level.bounce delete();
		level.old delete();
		level.sniper delete();
		{
			if( isDefined(level.axe_trig) )
			level.PlayerInRoom = true;
			
			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "axe_mp" );
			player GiveMaxAmmo( "axe_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "axe_mp" );
	        level.activ GiveMaxAmmo( "axe_mp" );
	        wait .05;
	        player switchToWeapon( "axe_mp" ); 
	        level.activ SwitchToWeapon( "axe_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Axe Room!";
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
			level.PlayerInRoom = false;
		}
	}
}