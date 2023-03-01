#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
 maps\mp\_load::main();
 maps\mp\mp_deathrun_abandoned\_teleport::main();
	
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
 addTriggerToList( "trig_trap1" );
 addTriggerToList( "trig_trap2" );
 addTriggerToList( "trig_trap3" );
 addTriggerToList( "trig_trap4" );
 addTriggerToList( "trig_trap5" );
 addTriggerToList( "trig_trap6" );
 addTriggerToList( "trig_trap7" );
 addTriggerToList( "trig_trap8" );
 
    thread end();
    thread games();	
	thread startdoor();
	thread lift();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread printcredits();
	thread creator();
	thread snip();
	thread knife();
	thread jump();
	thread deagle();
	thread weapon();
	
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
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
		iprintlnbold( "^7 " + user.name + " ^5Finished First^7!!");
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

if(!player sr\api\_deathrun::order())
            continue;

if( !isDefined( level.games_trig ) )
return;

player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
iPrintlnBold( " ^5" + player.name + " ^7has ^5entered ^7the ^5game ^7selection !^5!^7!" );
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
iPrintlnBold("^5"+self.name+" ^7is ^5dead"); 
iPrintlnBold("^5Selection ^7Room ^5is ^5now ^7open^5!!"); 
}

randomodabir()
{
        x = randomIntRange( 1, 4 );
       
        if( x == 1 )
        {
        ambientplay("ambient1");
		iPrintLn("Music Name: ^5Broken Iris - Where Butterflies Never Die");
        }
        else if( x == 2 )
        {
        ambientplay("ambient2");
		iPrintLn("Music Name: ^5Robin Schulz - Headlights [feat. Ilsey] ");
        }
        else if( x == 3 )
        {
        ambientplay("ambient3");
		iPrintLn("Music Name: ^5John Newman - Love Me Again");
        }
}

startdoor()
{
	door=getent("startdoor","targetname");
	wait 15;
	thread randomodabir();
	iprintlnbold("^5Door is opening");
	door movez(-180,5);
	wait 4;
	door delete();
}

lift()
{
object1 = getent("lift","targetname");
while(1)
{
object1 movey(951, 5);
object1 waittill("movedone");
wait(2);
object1 movey(-951, 5);
object1 waittill("movedone");
wait(2);
}
}

trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getent("trap1","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
		wait 2;
		
    }
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    object1 = getent("trap2","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
		wait 2;
    }
}

trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getent("trap3","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
		wait 2;
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
        object1 rotateroll(-360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
		wait 10;
		object1 rotateroll(-360, 5);
		wait 10;
		object1 rotateYaw(360, 5);
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
        object1 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(-360, 5);
		wait 10;
		object1 rotateroll(360, 5);
		wait 10;
		object1 rotateYaw(-360, 5);
		wait 10;
	}
}

trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6","targetname");
 
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

trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
		wait 2;
    }
}

trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getent("trap8","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
		wait 2;
    }
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
                    self.logoText setText("^1>>^7Map By:^5'sixzoRR- , ^7sKype:^5dinac555");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7>>^5mp_deathrun_Abandoned");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1>>^7Special Thanks ^5SuX Lolz");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1>>^7For bugs add me sKype:^5dinac555");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;

		}
	
	}
	
creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^5mp_deathrun_Abandoned" );
while( 1 )
{
iPrintLn("^7>>^5mp_deathrun_Abandoned");
wait(10);
iPrintLn("^1>>^7Special Thanks ^5SuX Lolz");
wait(10);
iPrintLn("^1>>^7Map By:^5'sixzoRR- , ^7sKype:^5dinac555");
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
		
		AmbientPlay( "ambient4" );
 
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
                                noti.titleText = "^5Sniper Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    iPrintlnBold( " ^5" + player.name + "^7 Has Chosen ^5Sniper Room^7!!" );  
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^53" );
            level.activ iPrintlnBold( "^53" );
            wait 2;
            player iPrintlnBold( "^52" );
            level.activ iPrintlnBold( "^52" );
            wait 2;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 2;
            player iPrintlnBold( "^7Fight^5!" );
            level.activ iPrintlnBold( "^7Fight^5!" );
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
                                noti.titleText = "^5Knife Room";
                                noti.notifyText = level.activ.name + " ^5VS^0 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    
    iPrintlnBold( " ^5" + player.name + " ^7Has Chosen ^5Knife Room^7!!" ); 	
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^53" );
            level.activ iPrintlnBold( "^53" );
            wait 2;
            player iPrintlnBold( "^52" );
            level.activ iPrintlnBold( "^52" );
            wait 2;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 2;
            player iPrintlnBold( "^7Fight^5!" );
            level.activ iPrintlnBold( "^7Fight^5!" );
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
                                noti.titleText = "^5Jump Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    iPrintlnBold( " ^5" + player.name + "^7 Has Chosen ^5Jump Room^7!!" );  
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
            player iPrintlnBold( "^53" );
            level.activ iPrintlnBold( "^53" );
            wait 2;
            player iPrintlnBold( "^52" );
            level.activ iPrintlnBold( "^52" );
            wait 2;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 2;
            player iPrintlnBold( "^7Fight^5!" );
            level.activ iPrintlnBold( "^7Fight^5!" );
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
                                noti.titleText = "^5Deagle Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	iPrintlnBold( " ^5" + player.name + "^7 Has Chosen ^5Deagle Room^7!!" ); 									
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^53" );
            level.activ iPrintlnBold( "^53" );
            wait 2;
            player iPrintlnBold( "^52" );
            level.activ iPrintlnBold( "^52" );
            wait 2;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 2;
            player iPrintlnBold( "^7Fight^5!" );
            level.activ iPrintlnBold( "^7Fight^5!" );
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
                                noti.titleText = "^5Weapon Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	iPrintlnBold( " ^5" + player.name + "^7 Has Chosen ^5Weapon Room^7!!" ); 									
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
	        player iPrintlnBold( "^53" );
            level.activ iPrintlnBold( "^53" );
            wait 2;
            player iPrintlnBold( "^52" );
            level.activ iPrintlnBold( "^52" );
            wait 2;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 2;
            player iPrintlnBold( "^7Fight^5!" );
            level.activ iPrintlnBold( "^7Fight^5!" );
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