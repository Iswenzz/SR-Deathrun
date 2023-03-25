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
 
    ambientPlay("ambient3");
	
        thread startdoor();
		thread lift();
		thread lift2();
		thread music();
        thread trap1();
		thread trap2();
        thread trap3();
        thread trap4();
        thread trap5();
        thread trap6();
        thread trap7();
        thread trap8();
        thread trap9();
        thread trap10();
        thread trap11();
		thread printcredits();
		thread creator();
		thread snip();
		thread knife();
		thread jump();
		thread deagle();
		
}			
		
startdoor()
{
	door=getent("startdoor","targetname");
	trig=getent("startdoor_trig","targetname");
	trig sethintstring("^1Press ^0[USE] ^1to open the startdoor");
	trig waittill("trigger");
	trig delete();
	door movez(-91,5);
	wait 4;
	door delete();
}

blacknight()
{
    object1 = getent("blacknight","targetname");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 1;
    }
}

lift()
{
object1 = getent("lift","targetname");
while(1)
{
object1 movez(-2556, 2);
object1 waittill("movedone");
wait(2);
object1 movez(2556, 2);
object1 waittill("movedone");
wait(2);
}
}

lift2()
{
object1 = getent("lift2","targetname");
while(1)
{
object1 movex(-1213, 2);
object1 waittill("movedone");
wait(2);
object1 movex(1213, 2);
object1 waittill("movedone");
wait(2);
}
}

Music()
{
	wait 5;
	AmbientPlay( "ambient3" );
	iprintlnbold("^0---^1Map made by sxzoR^0---");
}			  
       
trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getEnt( "trap1", "targetname" );
    killtrigger = getent ("trap1b" , "targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movex(-80, 0.3);
        object1 waittill ("movedone");
        object1 movex(80, 0.3);
        object1 waittill ("movedone");
    }
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    object1 = getent("trap2a","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}
 
trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getEnt( "trap3", "targetname" );
    killtrigger = getent ("trap3b" , "targetname");

    trig waittill ("trigger");
    trig delete();

    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movez(140, 0.5);
        wait 1;
        object1 movez(-140, 0.5);
        wait 1;
    }
}
 
trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
    object1 = getent("trap4a","targetname");
    object2 = getent("trap4b","targetname");
 
    trig waittill ("trigger");
    trig delete();
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateroll(360, 3);
        wait 10;
        object1 rotateroll(360, 3);
        object2 rotateroll(-360, 3);
        wait 10;
    }
}
 
trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getEnt( "trap5", "targetname" );
    killtrigger = getent ("trap5b" , "targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movez(160, 0.7);
        wait 1;
        object1 movez(-160, 0.7);
        wait 1;
    }
}
 
trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
    }
}
 
trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7a","targetname");
    object2 = getent("trap7b","targetname"); 
 
    trig waittill ("trigger");
    trig delete();
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateroll(360, 3);
        wait 15;
        object1 rotateroll(360, 3);
        object2 rotateroll(-360, 3);
        wait 15;
    }
}
 
trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getent("trap8","targetname");
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        wait 10;
		object1 rotateYaw(360 ,5);
        wait 10;		
        object1 rotateroll(360, 3);
        wait 10;
		object1 rotateroll(360, 3);
		trig delete();
    }
}
 
trap9()
{
    trig = getEnt( "trig_trap9", "targetname" );
    object1 = getent("trap9","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
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
        wait 5;
        object1 movez(-137, 1);
        wait 1;
        object1 movez(137, 1);
        wait 1;
        object1 show();
		wait 5;
    }
}
 
trap11()
{
    trig = getEnt( "trig_trap11", "targetname" );
    object1 = getent("trap11","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
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
                    self.logoText setText("^0---^1Map made by sxzoR^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^0---^1xFire: dinac777^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^0---^1mp_dr_blacknigt^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^0---^1Thanks For Playing^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;

		}
	
	}

creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^1mp^0_^1dr^0_^1blacknigt" );
while( 1 )
{
iPrintLn("^0---^1Map made by sxzoR^0---");
wait(40);
iPrintLn("^0---^1xFire: dinac777^0---");
wait(40);
iPrintLn("^0---^1mp_dr_blacknigt^0---");
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
		
		AmbientPlay( "ambient2" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "m40a3_mp", 100 );
        level.activ finalroom2( tele_activator, "m40a3_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^0--^1Snip Fight^0--";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
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
    self GiveMaxAmmo( weap );
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
		
        AmbientPlay( "ambient1" );
 
        level.mus_trig1 delete();
        level.mus_trig3 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom1( tele_jumper, "knife_mp", 100 );
        level.activ finalroom1( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^0---^1Knife Fight^0---";
                                noti.notifyText = level.activ.name + " ^1VS^0 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
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
		
		AmbientPlay( "ambient4" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "knife_mp", 100 );
        level.activ finalroom2( tele_activator, "knife_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^0--^1Jump Fight^9--";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
    level.finalJumper FreezeControls(0);
    level.activ FreezeControls(0);
 
 
 
    }
    // code never gets here
}
 
finalroom3( tp, weap, health )
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
		
		AmbientPlay( "ambient5" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "deserteagle_mp", 100 );
        level.activ finalroom2( tele_activator, "deserteagle_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^0--^1Deagle Fight^0--";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
 
    level.finalJumper FreezeControls(1);
    level.activ FreezeControls(1);
    wait 3;
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