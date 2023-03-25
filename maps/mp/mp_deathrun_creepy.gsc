main()
{
 maps\mp\_load::main();
 maps\mp\_teleport::main();
	
       game["allies"] = "marines";
       game["axis"] = "opfor";
       game["attackers"] = "axis";
       game["defenders"] = "allies";
       game["allies_soldiertype"] = "desert";
       game["axis_soldiertype"] = "desert";
       
	   thread sixzor();
	   thread music();
	   thread end();
	   thread games();
	   thread printcredits();
	   thread creator();
	   thread trap2();
	   thread trap3();
	   thread trap4();
	   thread trap5();
	   thread trap6();
	   thread trap7();
	   thread trap8();
	   thread trap10();
	   thread snip();
	   thread knife();
	   thread jump();
	   thread deagle();
	   thread weapon();
    
       addTriggerToList( "trig_trap2" );
       addTriggerToList( "trig_trap3" );
       addTriggerToList( "trig_trap4" );
       addTriggerToList( "trig_trap5" );
       addTriggerToList( "trig_trap6" );
       addTriggerToList( "trig_trap7" );
       addTriggerToList( "trig_trap8" );
       addTriggerToList( "trig_trap10" );
	
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

sixzor()
{
	trig=getent("sixzor","targetname");
	trig waittill("trigger");
	trig delete();
	iprintlnbold("Map Made by ^1`sixzoRR-");
	iprintlnbold("sKype:^1dinac555");
}

Music()
{
x = randomint(4);

	if(x == 0)
	{
	ambientplay("music1");
	iPrintLn("Music Name: ^1HORROR - DUBSTEP :000");
	}
	if(x == 1)
	{
	ambientplay("music2");
	iPrintLn("Music Name: ^1HORROR - DUBSTEP :000");
	}	
	if(x == 2)
	{
	ambientplay("music3");
	iPrintLn("Music Name: ^1HORROR - DUBSTEP :000");
	}
	if(x == 3)
	{
	ambientplay("music4");
	iPrintLn("Music Name: ^1HORROR - DUBSTEP :000");
	}
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

createhud(messages)
{
hud_start = NewHudElem();
hud_start.alignX = "center";
hud_start.alignY = "middle";
hud_start.horzalign = "center";
hud_start.vertalign = "middle";
hud_start.alpha = 1;
hud_start.x = 0;
hud_start.y = -150;
hud_start.font = "objective";
hud_start.fontscale = 2;
hud_start.glowalpha = 1;
hud_start.glowcolor = (1,0,0);
hud_start setText(messages);
hud_start SetPulseFX( 100, 4000, 500 );
wait 7;
if(isdefined(hud_start))
	hud_start destroy();
}

endtrigantibug(trig)
{
self common_scripts\utility::waittill_any("death","disconnect");
level.jatekosend = 0;
trig SetHintString("^1Press &&1 !..");
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

end() //First D:
{
trigger = GetEnt( "end", "targetname" );
	{
	trigger waittill ("trigger", user);
		{
		iprintlnbold( "^7 " + user.name + " ^1Finished First^7!!");
		wait 0.1;
		}
	}
}

games() //Select Rooms
{
level.games_trig = getEnt( "minigames", "targetname");
games = getEnt( "minigames_ori", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if( !isDefined( level.games_trig ) )
return;

player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
iPrintlnBold( " ^1" + player.name + " ^7has ^1entered ^7the ^1game ^7selection !^1!^7!" );
player TakeAllWeapons();
player antiglitch();


while( isAlive( player ) && isDefined( player ) )
if( isDefined( level.activ ) && isAlive( level.activ ) )
wait 1;
}
}
antiglitch() //ng1
{ 
self common_scripts\utility::waittill_any("death","disconnect");
iPrintlnBold("^1"+self.name+" ^7is ^1dead"); 
iPrintlnBold("^1Selection ^7Room ^1is ^1now ^7open^1!!"); 
}

printcredits()
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
                    self.logoText setText("^1>>^7Map By:^1'sixzoRR- , ^7sKype:^1dinac555");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1>>^7mp_deathrun_creepy Version of ^1Horror ^7:)");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1>>^7Big Thanks Guys:^1SuX Lolz<33,Night,qwzy:]^7(for testing map^1<3^7)");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1>>^7For bugs contact me ^1Skype:dinac555 ^7;)");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;

		}
	
	}
	
creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^1>>^7mp_deathrun_creepy Version of ^1Horror ^7:)" );
while( 1 )
{
iPrintLn("^1>>^7mp_deathrun_creepy Version of ^1Horror ^7:)");
wait(10);
iPrintLn("^1>>^7Big Thanks Guys:^1SuX Lolz<33,Night,qwzy:]^7(for testing map^1<3^7)");
wait(10);
iPrintLn("^1>>^7Map By:^1'sixzoRR- , ^7sKype:^1dinac555");
}
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    object1 = getent("trap2","targetname");
	object2 = getent("trap2a","targetname");
	object3 = getent("trap2b","targetname");
    trig waittill ("trigger");
       
     while(1)
    {
		object1 rotateYaw(180, 1);
		wait 1;
		object2 rotateYaw(180, 1);
		wait 1;
		object3 rotateYaw(180, 1);
		wait 1;
    }
}

trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getEnt( "trap3", "targetname" );
	object2 = getEnt( "trap3a", "targetname" );

    trig waittill ("trigger");
    trig delete();
 
    while(1)
    {
        object1 movez(47, 0.5);
		object2 movez(-47, 0.5);
		wait 1;
		object1 movez(-47, 0.5);
		object2 movez(47, 0.5);
		wait 1;
    }
}

trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
    object1 = getent("trap4","targetname");
 
    trig waittill ("trigger");
    trig delete();
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		wait 10;
	}
}

trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getent("trap5","targetname");
 
    trig waittill ("trigger");
    trig delete();
	
    while(1) 
    {
        object1 rotateYaw(360, 2);
		wait 1;
		object1 rotateYaw(-360, 2);
		wait 1;
		object1 rotateYaw(360, 2);
		wait 1;
		object1 rotateYaw(-360, 2);
		wait 1;
	}
}

trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6","targetname");
	
    trig waittill ("trigger");
       
     while(1)
    {
		object1 rotateYaw(180, 1);
		wait 1;
		object1 rotateYaw(180, 1);
		wait 1;
		object1 rotateYaw(180, 1);
    }
}

trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
	object2 = getent("trap7a","targetname");
 
    trig waittill ("trigger");
    trig delete();
	
    while(1) 
    {
	    object2 delete();
		wait 2;
        object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		wait 10;
	}
}

trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getent("trap8","targetname");
	
    trig waittill ("trigger");
       
     while(1)
    {
		object1 rotateYaw(360, 2);
		wait 2;
    }
}

trap10()
{
    trig = getEnt( "trig_trap10", "targetname" );
    object1 = getent("trap10","targetname");
 
    trig waittill ("trigger");
    trig delete();
	
    while(1) 
    {
        object1 hide();
		object1 notsolid();
		wait 5;
		object1 show();
		object1 solid();
		wait 5;
    }
}

snip()
{
    level.mus_trig3 = getEnt( "sniproom", "targetname" );
    tele_jumper = getEnt( "snip", "targetname" );
	tele_activator = getEnt( "acti_snip", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
		
		level.finalJumper finalroom2( tele_jumper, "remington700_mp", 100 );
        level.activ finalroom2( tele_activator, "remington700_mp", 100 );
       
        level.finalJumper TakeAllWeapons();
        level.finalJumper GiveWeapon( "m40a3_mp" );
        level.finalJumper giveMaxAmmo( "m40a3_mp" );
		level.finalJumper GiveWeapon( "remington700_mp" );
        level.finalJumper giveMaxAmmo( "remington700_mp" );
        level.finalJumper SwitchToWeapon( "m40a3_mp" );
        wait 0.05;
		
		level.activ TakeAllWeapons();
        level.activ GiveWeapon( "m40a3_mp" );
        level.activ giveMaxAmmo( "m40a3_mp" );
		level.activ GiveWeapon( "remington700_mp" );
        level.activ giveMaxAmmo( "remington700_mp" );
        level.activ SwitchToWeapon( "m40a3_mp" );

		
        noti = SpawnStruct();
                                noti.titleText = "^1Sniper Room";
                                noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Sniper Room^7!!" );  
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 2;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^12" );
            wait 2;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^11" );
            wait 2;
            player iPrintlnBold( "^7Fight^1!" );
            level.activ iPrintlnBold( "^7Fight^1!" );
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    }
    // code never gets here
}

finalroom2( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self SwitchToWeapon( weap );
 
}

knife()
{
 

    level.mus_trig2 = getEnt( "kniferoom", "targetname" );
    tele_activator = getEnt( "acti_knife", "targetname" );
    tele_jumper = getEnt( "knife", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig2 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
 
        level.mus_trig1 delete();
        level.mus_trig3 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom1( tele_jumper, "knife_mp", 100 );
        level.activ finalroom1( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^1Knife Room";
                                noti.notifyText = level.activ.name + " ^1VS^0 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    
    iPrintlnBold( " ^1" + player.name + " ^7Has Chosen ^1Knife Room^7!!" ); 	
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 2;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^12" );
            wait 2;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^11" );
            wait 2;
            player iPrintlnBold( "^7Fight^1!" );
            level.activ iPrintlnBold( "^7Fight^1!" );
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    }
}


finalMonitor()
{
    self endon( "disconnect" );
    self thread monitorDisconnect();
 
    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}
 
finalroom( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );  
 
}
 
finalroom1( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}
 
monitorDisconnect()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}

jump()
{
    level.mus_trig3 = getEnt( "jumproom", "targetname" );
    tele_jumper = getEnt( "jump", "targetname" );
	tele_activator = getEnt( "acti_jump", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "knife_mp", 100 );
        level.activ finalroom2( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^1Jump Room";
                                noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Jump Room^7!!" );  
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 2;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^12" );
            wait 2;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^11" );
            wait 2;
            player iPrintlnBold( "^7Fight^1!" );
            level.activ iPrintlnBold( "^7Fight^1!" );
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    level.activ FreezeControls(0);
    }
    // code never gets here
}
 
finalroom5( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}

deagle()
{
    level.mus_trig3 = getEnt( "deagleroom", "targetname" );
    tele_jumper = getEnt( "deagle", "targetname" );
	tele_activator = getEnt( "acti_deagle", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "deserteagle_mp", 100 );
        level.activ finalroom2( tele_activator, "deserteagle_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^1Deagle Room";
                                noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Deagle Room^7!!" ); 									
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 2;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^12" );
            wait 2;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^11" );
            wait 2;
            player iPrintlnBold( "^7Fight^1!" );
            level.activ iPrintlnBold( "^7Fight^1!" );
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    }
    // code never gets here
}
 
finalroom4( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}

weapon()
{
    level.mus_trig3 = getEnt( "weaponroom", "targetname" );
    tele_jumper = getEnt( "weap", "targetname" );
	tele_activator = getEnt( "acti_weap", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "knife_mp", 100 );
        level.activ finalroom2( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^1Weapon Room";
                                noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Weapon Room^7!!" ); 									
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 2;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^12" );
            wait 2;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^11" );
            wait 2;
            player iPrintlnBold( "^7Fight^1!" );
            level.activ iPrintlnBold( "^7Fight^1!" );
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
    }
    // code never gets here
}
 
finalroom6( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}