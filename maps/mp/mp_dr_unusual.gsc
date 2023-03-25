main()
{
    maps\mp\_load::main();
	maps\mp\_teleport::main();
	maps\mp\_teleport1::main();

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
	thread sxzor();
	thread unusual();
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
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread trap17();
	thread trap18();
	thread printcredits();
	thread creator();
	thread snip();
	thread knife();
	thread jump();
	thread deagle();
	thread ak47();
	thread barreta();

}

startdoor()
{
	door=getent("startdoor","targetname");
	trig=getent("startdoor_trig","targetname");
	trig sethintstring("^0--^5Press ^1[USE] ^5to open the startdoor^0--");
	trig waittill("trigger");
	trig delete();
	door movez(-130,5);
	wait 4;
	door delete();
}

Music()
{
	wait 5;
	AmbientPlay( "ambient3" );
	iprintlnbold("^0---^1Map made by ^5sxzoR^0---");
}

lift()
{
object1 = getent("lift","targetname");
while(1)
{
object1 movez(-2317, 2);
object1 waittill("movedone");
wait(2);
object1 movez(2317, 2);
object1 waittill("movedone");
wait(2);
}
}

sxzor()
{
    object1 = getent("sxzor","targetname");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 1;
    }
}

unusual()
{
    object1 = getent("unusual","targetname");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap1()
{
    trig = getEnt( "trig_trap1", "targetname" );
    object1 = getent("trap1","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap2()
{
    trig = getEnt( "trig_trap2", "targetname" );
    object1 = getEnt( "trap2a", "targetname" );
	object2 = getEnt( "trap2b", "targetname" );

    trig waittill ("trigger");
    trig delete();
 
    while(1)
    {
        object1 movez(215, 2);
		object2 movez(-215,2);
        wait 2;
        object1 movez(-215, 2);
		object2 movez(215, 2);
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

trap5()
{
object1 = getent("trap5","targetname");
while(1)
{
object1 movey(-1134, 2);
object1 waittill("movedone");
wait(2);
object1 movey(1134, 2);
object1 waittill("movedone");
wait(2);
}
}

trap6()
{
object1 = getent("trap6","targetname");
while(1)
{
object1 movey(-1134, 2);
object1 waittill("movedone");
wait(2);
object1 movey(1134, 2);
object1 waittill("movedone");
wait(2);
}
}

trap7()
{
    trig = getEnt( "trig_trap7", "targetname" );
    object1 = getent("trap7","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap8()
{
    trig = getEnt( "trig_trap8", "targetname" );
    object1 = getent("trap8a","targetname");
    object2 = getent("trap8c","targetname");
 
 
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

trap9()
{
    trig = getEnt( "trig_trap9", "targetname" );
    object1 = getEnt( "trap9", "targetname" );
    killtrigger = getent ("trap9b" , "targetname");

    trig waittill ("trigger");
    trig delete();

    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movez(270, 2);
		wait 5;
		object1 movez(-270, 2);
		wait 5;
    }
}

trap10()
{
object1 = getent("trap10","targetname");
while(1)
{
object1 movey(-2000, 2);
object1 waittill("movedone");
wait(2);
object1 movey(2000, 2);
object1 waittill("movedone");
wait(2);
}
}

trap11()
{
    trig = getEnt( "trig_trap11", "targetname" );
    object1 = getent("trap11a","targetname");
    object2 = getent("trap11b","targetname");
	object3 = getent("trap11c","targetname");
 
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 2);
		wait 2;
		object2 rotateYaw(360, 2);
		wait 2;
		object3 rotateroll(-360, 2);
		wait 2;
    }
}

trap12()
{
    trig = getEnt( "trig_trap12", "targetname" );
    object1 = getent("trap12a","targetname");
    object2 = getent("trap12b","targetname");
 
 
    trig waittill ("trigger");
       
     while(1)
    {
        object1 rotateroll(-360, 3);
        object2 rotateroll(360, 3);
        wait 10;
        object1 rotateYaw(360, 3);
        object2 rotateYaw(-360, 3);
        wait 10;
		trig delete();
    }
}

trap13()
{
    trig = getEnt( "trig_trap13", "targetname" );
    object1 = getEnt( "trap13a", "targetname" );

    trig waittill ("trigger");
    trig delete();
 
    while(1)
    {
        object1 movey(-584, 1);
		wait 1;
		object1 movey(584, 1);
        wait 1;		
	}
}

trap14()
{
object1 = getent("trap14","targetname");
while(1)
{
object1 movex(1154, 2);
object1 waittill("movedone");
wait(2);
object1 movex(-1154, 2);
object1 waittill("movedone");
wait(2);
}
}

trap15()
{
    trig = getEnt( "trig_trap15", "targetname" );
    object1 = getent("trap15","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 5);
		wait 5;
    }
}

trap16()
{
    trig = getEnt( "trig_trap16", "targetname" );
    object1 = getent("trap16","targetname");
 
    trig waittill ("trigger");
	
    while(1) 
    {
        object1 rotateYaw(360, 2);
		wait 2;
    }
}

trap17()
{
    trig = getEnt( "trig_trap17", "targetname" );
    object1 = getEnt( "trap17", "targetname" );
    killtrigger = getent ("trap17b" , "targetname");

    trig waittill ("trigger");
    trig delete();

    killtrigger enablelinkto ();
    killtrigger linkto (object1);
 
    while(1)
    {
        object1 movez(130, 1);
        wait 1;
        object1 movez(-130, 1);
        wait 1;
    }
}

trap18()
{
    trig = getEnt( "trig_trap18", "targetname" );
    object1 = getent("trap18","targetname");

    trig waittill ("trigger");
    trig delete();
	
     while(1)
    {
        object1 hide();
        wait 5;
        object1 movez(-170, 1);
        wait 1;
        object1 movez(170, 1);
        wait 1;
        object1 show();
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
                    self.logoText setText("^0---^1Map Made by ^5sxzoR ^1xFire:^5dinac777^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^1MP_DR_UNUSUAL^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^0---^1Thanks ^5For ^1Playing^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^0---^1Special Thanks ^5Mr.Xx ^1xFire:^5dragec1997 ^1And ^5DarK ^1xFire:^5darkylegend^0---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;

		}
	
	}

creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^5---^1MP_DR_UNUSUAL^5---" );
while( 1 )
{
iPrintLn("^0---^1Map Made by ^5sxzoR ^1xFire:^5dinac777^0---");
wait(40);
iPrintLn("^5---^1MP_DR_UNUSUAL^5---");
wait(40);
iPrintLn("^0---^1Special Thanks ^5Mr.Xx ^1xFire:^5dragec1997^0---");
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
                                noti.titleText = "^5--^0Snip Fight^5--";
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
                                noti.titleText = "^5---^0Knife Fight^0---";
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
                                noti.titleText = "^5--^0Jump Fight^5--";
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
                                noti.titleText = "^5--^0Deagle Fight^5--";
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

ak47()
{
    level.mus_trig3 = getEnt( "ak47room", "targetname" );
    tele_jumper = getEnt( "ak47", "targetname" );
	tele_activator = getEnt( "acti_ak47", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
		AmbientPlay( "ambient6" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "mp5_mp", 100 );
        level.activ finalroom2( tele_activator, "mp5_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^5--^0Ak47 Fight^5--";
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
 
finalroom5( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}

barreta()
{
    level.mus_trig3 = getEnt( "barretaroom", "targetname" );
    tele_jumper = getEnt( "barreta", "targetname" );
	tele_activator = getEnt( "acti_barreta", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        level.mus_trig3 waittill( "trigger", player );
   
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
        continue;
		
		AmbientPlay( "ambient7" );
 
        level.mus_trig1 delete();
        level.mus_trig2 delete();
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalroom2( tele_jumper, "m4_mp", 100 );
        level.activ finalroom2( tele_activator, "m4_mp", 100 );
       
               
        noti = SpawnStruct();
                                noti.titleText = "^5--^0Barreta Fight^5--";
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
 
finalroom6( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}