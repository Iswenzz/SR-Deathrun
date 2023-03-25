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
	thread music();
	thread lift();
	thread trap1();
	thread trap2();
	thread lift2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread lift3();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread lift4();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread lift5();
	thread lift6();
	thread printcredits();
	thread creator();
	thread snip();
	thread knife();
	thread deagle();

}

startdoor()
{
	door=getent("startdoor","targetname");
	trig=getent("startdoor_trig","targetname");
	trig sethintstring("^7--^1Press ^7[USE] ^1to open the startdoor^7--");
	trig waittill("trigger");
	trig delete();
	door movez(-375,5);
	wait 4;
	door delete();
}

Music()
{
	wait 5;
	AmbientPlay( "ambient3" );
	iprintlnbold("^7---^1Map made by ^7sxzoR ^1xFire:^7dinac777^1---");
}

lift()
{
object1 = getent("lift","targetname");
while(1)
{
object1 movez(1260, 2);
object1 waittill("movedone");
wait(2);
object1 movez(-1260, 2);
object1 waittill("movedone");
wait(2);
}
}

trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getent("trap1","targetname");
    object2 = getent("trap1","targetname");
 
    trig waittill ("trigger");
    trig delete();
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        wait 5;
        object1 rotateroll(360, 3);
        wait 5;
    }
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    object1 = getent("trap2","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 2);
		wait 5;
		object1 rotateYaw(360, 2);
		wait 5;
    }
}

lift2()
{
object1 = getent("lift2","targetname");
while(1)
{
object1 movex(1563, 2);
object1 waittill("movedone");
wait(2);
object1 movex(-1563, 2);
object1 waittill("movedone");
wait(2);
}
}

trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
    object1 = getent("trap3","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
    object1 = getent("trap4","targetname");
 
    trig waittill ("trigger");
    trig delete();
 
    {
        object1 delete();
    }
}

trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getEnt( "trap5a", "targetname" );
	object2 = getEnt( "trap5b", "targetname" );

    trig waittill ("trigger");
    trig delete();
 
    while(1)
    {
        object1 movez(170, 0.5);
		object2 movez(-170, 0.5);
        wait 1;
        object1 movez(-170, 0.5);
		object2 movez(170, 0.5);
        wait 1;
    }
}

lift3()
{
object1 = getent("lift3","targetname");
while(1)
{
object1 movey(-1283, 2);
object1 waittill("movedone");
wait(2);
object1 movey(1283, 2);
object1 waittill("movedone");
wait(2);
}
}

trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
    object1 = getent("trap6a","targetname");
    object2 = getent("trap6b","targetname");
 
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateYaw(360, 5);
        wait 10;
		object1 rotateYaw(360 ,5);
		object2 rotateroll(-360 ,3);
        wait 10;		
        object1 rotateroll(360, 3);
        object2 rotateYaw(360, 5);
        wait 10;
		object1 rotateroll(360, 3);
        object2 rotateYaw(360, 5);
		trig delete();
    }
}

trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 0.5);
		wait 5;
		object1 rotateYaw(360, 0.5);
		wait 5;
    }
}

trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getent("trap8","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap9()
{
    trig = getEnt( "trig_trap9", "targetname" );
    object1 = getent("trap9","targetname");
 
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 3);       
		wait 10;
        object1 rotateYaw(360, 3);
        wait 10;
		trig delete();
    }
}

lift4()
{
object1 = getent("lift4","targetname");
while(1)
{
object1 movex(-1384, 2);
object1 waittill("movedone");
wait(2);
object1 movex(1384, 2);
object1 waittill("movedone");
wait(2);
}
}

trap10()
{
    trig = getEnt( "trig_trap10", "targetname" );
    object1 = getEnt( "trap10", "targetname" );

    trig waittill ("trigger");
    trig delete();
 
    while(1)
    {
        object1 movey(349, 0.7);
        wait 2;
        object1 movey(-349, 0.7);
        wait 2;
    }
}

trap11()
{
    trig = getEnt( "trig_trap11", "targetname" );
    object1 = getent("trap11","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 10);
		wait 10;
    }
}

trap12()
{
    trig = getEnt( "trig_trap12", "targetname" );
    object1 = getent("trap12","targetname");
    trig waittill ("trigger");
       
     while(1)
    {
		object1 rotateYaw(360, 5);
		wait 10;
    }
}

trap13()
{
    trig = getEnt( "trig_trap13", "targetname" );
    object1 = getent("trap13","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 10);
		wait 10;
    }
}

trap14()
{
    trig = getEnt( "trig_trap14", "targetname" );
    object1 = getEnt( "trap14", "targetname" );
    killtrigger = getent ("trap14b" , "targetname");
 
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

lift5()
{
object1 = getent("lift5","targetname");
while(1)
{
object1 movez(1743, 2);
object1 waittill("movedone");
wait(2);
object1 movez(-1743, 2);
object1 waittill("movedone");
wait(2);
}
}

lift6()
{
object1 = getent("lift6","targetname");
while(1)
{
object1 movex(916, 2);
object1 waittill("movedone");
wait(2);
object1 movex(-916, 2);
object1 waittill("movedone");
wait(2);
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
                    self.logoText setText("^7---^1Map Made by ^7sxzoR ^1xFire:^7dinac777^1---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^1MP_DR_INSIDE^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^1Thanks For Playing^7---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7---^1Special Thanks ^7Mr.Xx ^1xFire:^7dragec1997 ^1And ^7dAMMMO ^1xFire^7kolec808^1---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;

		}
	
	}

creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^0---^6MP_DR_INSIDE^0---" );
while( 1 )
{
iPrintLn("^7---^1Map Made by ^7sxzoR ^1xFire:^7dinac777^1---");
wait(40);
iPrintLn("^7---^1MP_DR_INSIDE^7---");
wait(40);
iPrintLn("^7---^1Special Thanks ^7dAMMMO ^1xFire:^7kolec808^1---");
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
                                noti.titleText = "^7--^1Snip Fight^7--";
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
                                noti.titleText = "^7---^1Knife Fight^7---";
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
		
		AmbientPlay( "ambient4" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "deserteagle_mp", 100 );
        level.activ finalroom2( tele_activator, "deserteagle_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^7--^1Deagle Fight^7--";
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