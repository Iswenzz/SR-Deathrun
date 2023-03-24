#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
    maps\mp\_load::main();
	maps\mp\_teleport::main();

	level._effect["c4"] = loadfx("explosions/grenadeexp_default");

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
    addTriggerToList( "trig_trap9" );
    addTriggerToList( "trig_trap10" );
    addTriggerToList( "trig_trap11" );
	addTriggerToList( "trig_trap12" );
    addTriggerToList( "trig_trap13" );
    addTriggerToList( "trig_trap14" );


	thread music();
	thread main_fall();
	thread secretdoor();
	thread lift();
	thread lift2();
	thread finishdoor();
	thread hs();
	thread es();
	thread spacetrip();
	thread sixzor();
	thread finish();
	thread lol1();
	thread lol2();
	thread lol3();
	thread lol4();
	thread room1();
	thread room2();
	thread room3();
	thread test123();
	thread test1234();
	thread test12345();
	thread staza1();
	thread staza2();
	thread stazaa3();
	thread rotate1();
	thread rotate2();
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
	thread printcredits();
	thread creator();
	thread snip();
	thread knife();
	thread jump();
	thread deagle();


}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

Music()
{
	AmbientPlay( "ambient1" );
	wait 5;
}

main_fall()
{
	broken=getent("broken","targetname");
	floor_good=getent("floor_good","targetname");
	trig_broken=getent("trig_broken","targetname");
	c4_start = getent("c4_startdoor","targetname");
	c4_start2 = getent("c4_startdoor2","targetname");
	c4_start3 = getent("c4_startdoor3","targetname");
	c4_start4 = getent("c4_startdoor4","targetname");
	c4_start5 = getent("c4_startdoor5","targetname");
	c4_start6 = getent("c4_startdoor6","targetname");
	c4_start7 = getent("c4_startdoor7","targetname");
	c4_start8 = getent("c4_startdoor8","targetname");
	c4_start9 = getent("c4_startdoor9","targetname");

	if (isDefined(broken))
	{
		broken hide();
		broken notsolid();
	}

	wait 5;
	trig_broken waittill("trigger",player);
	trig_broken delete();
	iprintlnbold("^5--->^7Map Creator ^1sixzoRR- ^7xFire:^5dinac777^5<---");
	wait 0.2;
	iprintlnbold("^5--->^7Special Thanks ^1#FNRP#Lolz^5<---");
	wait 5;
	AmbientPlay( "ambient2" );
	iprintlnbold("^13");
	wait 2;
	iprintlnbold("^12");
	wait 2;
	iprintlnbold("^11");
	wait 2.3;
	iprintlnbold("^5GO!");
	wait 0.2;
	AmbientPlay( "ambient3" );
	c4_start PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start.origin);
	c4_start2 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start2.origin);
	c4_start3 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start3.origin);
	c4_start4 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start4.origin);
	c4_start5 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start5.origin);
	c4_start6 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start6.origin);
	c4_start7 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start7.origin);
	c4_start8 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start8.origin);
	c4_start9 PlaySound("grenade_explode_metal");
	playFx(level._effect["c4"],c4_start9.origin);
	floor_good hide();
	floor_good notsolid();

	if (isDefined(broken))
	{
		broken show();
		broken solid();
	}
}

secretdoor()
{
	door = getent("secretdoor","targetname");
	trig = getent("secretdoor_trig","targetname");
	trig sethintstring("^1--->^7Press ^5[USE] ^7to open secret door^1<---");
	trig waittill("trigger");
	trig delete();
	door delete();
	AmbientPlay( "ambient10" );
	iprintlnbold("^1Secret is open");
}

lift()
{
object1 = getent("lift","targetname");
trigger = getent("lift_trigger","targetname");
trigger waittill ("trigger", player );
trigger delete();
while(1)
{
object1 movex(650, 2);
object1 waittill("movedone");
wait(2);
object1 movex(-650, 2);
object1 waittill("movedone");
wait(2);
}
}

lift2()
{
object1 = getent("lift2","targetname");
trigger = getent("lift2_trigger","targetname");
trigger waittill ("trigger", player );
trigger delete();
while(1)
{
object1 movez(820, 5);
object1 waittill("movedone");
wait(2);
object1 movez(-820, 5);
object1 waittill("movedone");
wait(2);
}
}

finishdoor()
{
	door=getent("door","targetname");
	trig=getent("finishdoor_trig","targetname");
	trig sethintstring("^1Open finish door");
	trig waittill("trigger");
	trig delete();
	door movez(290,5);
	iprintlnbold("^5Finish Door is Open");
	wait 4;
	door delete();;
}

hs()
{
	object1 = getent("hs","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

es()
{
	object1 = getent("es","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

spacetrip()
{
	object1 = getent("spacetrip","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

sixzor()
{
	object1 = getent("sixzor","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

finish()
{
	object1 = getent("finish","targetname");

     while(1)
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

lol1()
{
	object1 = getent("lol1","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

lol2()
{
	object1 = getent("lol2","targetname");

     while(1)
    {
	    object1 rotateYaw(-360, 5);
		wait 5;
    }
}

lol3()
{
	object1 = getent("lol3","targetname");

     while(1)
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

lol4()
{
	object1 = getent("lol4","targetname");

     while(1)
    {
	    object1 rotateYaw(-360, 5);
		wait 5;
    }
}

room1()
{
	object1 = getent("room1","targetname");

     while(1)
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

room2()
{
	object1 = getent("room2","targetname");

     while(1)
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

room3()
{
	object1 = getent("room3","targetname");

     while(1)
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

test123()
{
	object1 = getent("test123","targetname");

     while(isDefined(object1))
    {
	    object1 rotatePitch(-360, 10);
		wait 5;
    }
}

test1234()
{
	object1 = getent("test1234","targetname");

     while(isDefined(object1))
    {
	    object1 rotatePitch(-360, 10);
		wait 5;
    }
}

test12345()
{
	object1 = getent("test12345","targetname");

     while(isDefined(object1))
    {
	    object1 rotateroll(-360, 10);
		wait 5;
    }
}

staza1()
{
	object1 = getent("staza1","targetname");

     while(isDefined(object1))
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

staza2()
{
	object1 = getent("staza2","targetname");

     while(isDefined(object1))
    {
	    object1 rotatePitch(360, 5);
		wait 5;
    }
}

stazaa3()
{
	object1 = getent("stazaa3","targetname");


     while(isDefined(object1))
    {
	    object1 rotateroll(360, 5);
		wait 5;
    }
}

rotate1()
{
	object1 = getent("rotate1","targetname");

     while(isDefined(object1))
    {
	    object1 rotateYaw(360, 5);
		wait 5;
    }
}

rotate2()
{
	object1 = getent("rotate2","targetname");

     while(isDefined(object1))
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
    object1 = getent("trap2a","targetname");
	object2 = getent("trap2b","targetname");

    trig waittill ("trigger");
    trig delete();

    while(1)
    {
        object1 rotateroll(360, 5);
		object2 rotateYaw(360, 5);
		wait 10;
        object1 rotateYaw(360, 5);
		object2 rotateroll(360, 5);
		wait 10;
		object1 rotateroll(360, 5);
		object2 rotateYaw(360, 5);
		wait 10;
        object1 rotateYaw(360, 5);
		object2 rotateroll(360, 5);
    }
}

trap3()
{
    trig = getEnt( "trig_trap3", "targetname" );
	object1 = getent("trap3","targetname");

    trig waittill ("trigger");
    trig delete();

    while(1)
    {
        object1 rotateroll(360, 10);
		wait 2;
		object1 rotateroll(360, 10);
		wait 2;
		object1 rotateroll(360, 10);
		wait 2;
    }
}

trap4()
{
    trig = getEnt( "trig_trap4", "targetname" );
    object1 = getent("trap4a","targetname");
	object2 = getent("trap4b","targetname");
	object3 = getent("trap4c","targetname");

    trig waittill ("trigger");
    trig delete();

    while(1)
    {
        object1 rotateroll(360, 2);
		wait 2;
		object2 rotateYaw(360, 2);
		wait 2;
		object3 rotateroll(360, 2);
		wait 2;
		object1 rotateroll(360, 2);
		wait 2;
		object2 rotateYaw(360, 2);
		wait 2;
		object3 rotateroll(360, 2);
		wait 2;
    }
}

trap5()
{
    trig = getEnt( "trig_trap5", "targetname" );
    object1 = getent("trap5","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotateroll(360, 5);
		wait 5;
    }
}

trap6()
{
    trig = getEnt( "trig_trap6", "targetname" );
	object1 = getent("trap6","targetname");
    trig waittill ("trigger");

     while(1)
    {
	    object1 rotateYaw(360, 0.5);
		wait 5;
		object1 rotateYaw(360, 0.5);
		wait 5;
		object1 rotateYaw(360, 0.5);
		wait 5;
		object1 rotateYaw(360, 0.5);
		wait 5;
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
	object2 = getent("trap8b","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotateroll(360, 5);
		object2 rotateroll(360, 5);
		wait 5;
    }
}

trap9()
{
    trig = getEnt( "trig_trap9", "targetname" );
    object1 = getent("trap9a","targetname");
	object2 = getent("trap9b","targetname");
	object3 = getent("trap9c","targetname");
	object4 = getent("trap9d","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotatePitch(360, 2);
		object2 rotatePitch(360, 2);
		object3 rotatePitch(360, 2);
		object4 rotatePitch(360, 2);
		wait 2;
		object1 rotatePitch(360, 2);
		object2 rotatePitch(360, 2);
		object3 rotatePitch(360, 2);
		object4 rotatePitch(360, 2);


    }
}

trap10()
{
    trig = getEnt( "trig_trap10", "targetname" );
    object1 = getent("trap10","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotateYaw(360, 10);
		wait 5;
		object1 rotateYaw(360, 10);
		wait 5;
		object1 rotateYaw(360, 10);
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
        object1 rotateYaw(360, 10);
		wait 5;
		object1 rotateYaw(360, 10);
		wait 5;
		object1 rotateYaw(360, 10);
		wait 5;
    }
}

trap12()
{
    trig = getEnt( "trig_trap12", "targetname" );
    object1 = getent("trap12a","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 delete();
    }
}

trap13()
{
    trig = getEnt( "trig_trap13", "targetname" );
    object1 = getent("trap13","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotateYaw(360, 2);
		wait 2;
    }
}

trap14()
{
    trig = getEnt( "trig_trap14", "targetname" );
    object1 = getent("trap14a","targetname");
	object2 = getent("trap14b","targetname");
	object3 = getent("trap14c","targetname");
	object4 = getent("trap14d","targetname");
	object5 = getent("trap14e","targetname");
	object6 = getent("trap14f","targetname");
	object7 = getent("trap14g","targetname");
	object8 = getent("trap14h","targetname");
	object9 = getent("trap14i","targetname");
	object10 = getent("trap14j","targetname");

    trig waittill ("trigger");

    while(1)
    {
        object1 rotateYaw(360, 5);
		object3 rotateYaw(360, 5);
		object5 rotateYaw(360, 5);
		object7 rotateYaw(360, 5);
		object9 rotateYaw(360, 5);
		wait 2;
		object2 rotateYaw(360, 5);
		object4 rotateYaw(360, 5);
		object6 rotateYaw(360, 5);
		object8 rotateYaw(360, 5);
		object10 rotateYaw(360, 5);
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
                    self.logoText setText("^7Map By:^5'sixzoRR- , ^7xFire:^1dinac777");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^1MP_DR_SPACETRIP");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7Special Thanks ^5#FNRP#Lolz,^1MadLion,^5Matty,^1VC'ERIK");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^7For bugs add me ^5xFire:^1dinac777");
                    wait 10;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 5;

		}

	}

creator()
{
wait(5);
thread braxi\_mod::drawInformation( 800, 0.8, 1, "^5MP_DR_SPACETRIP" );
while( 1 )
{
iPrintLn("^7Map By:^5'sixzoRR- , ^7xFire:^1dinac777");
wait(10);
iPrintLn("^1MP_DR_SPACETRIP");
wait(10);
iPrintLn("^7Special Thanks ^5#FNRP#Lolz,^1MadLion,^5Matty,^1VC'ERIK");
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
                                noti.titleText = "^1Snip Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

    iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Sniper Room^5!!" );
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
            player iPrintlnBold( "^5Fight!" );
            level.activ iPrintlnBold( "^5Fight!" );
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

		AmbientPlay( "ambient5" );

        level.mus_trig1 delete();
        level.mus_trig3 delete();

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();

        level.finalJumper finalroom1( tele_jumper, "knife_mp", 100 );
        level.activ finalroom1( tele_activator, "knife_mp", 100 );


        noti = SpawnStruct();
                                noti.titleText = "^1Knife Room";
                                noti.notifyText = level.activ.name + " ^5VS^0 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

    iPrintlnBold( " ^1" + player.name + " ^7Has Chosen ^1Knife Room^5!!" );
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
            player iPrintlnBold( "^5Fight!" );
            level.activ iPrintlnBold( "^5Fight!" );
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

		AmbientPlay( "ambient6" );

        level.mus_trig1 delete();
        level.mus_trig2 delete();

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();

        level.finalJumper finalroom2( tele_jumper, "knife_mp", 100 );
        level.activ finalroom2( tele_activator, "knife_mp", 100 );


        noti = SpawnStruct();
                                noti.titleText = "^1Jump Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

    iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Jump Room^5!!" );
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
            player iPrintlnBold( "^5Fight!" );
            level.activ iPrintlnBold( "^5Fight!" );
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

		AmbientPlay( "ambient7" );

        level.mus_trig1 delete();
        level.mus_trig2 delete();

        level.finalJumper = player;
        level.finalJumper thread finalMonitor();

        level.finalJumper finalroom2( tele_jumper, "deserteagle_mp", 100 );
        level.activ finalroom2( tele_activator, "deserteagle_mp", 100 );


        noti = SpawnStruct();
                                noti.titleText = "^1Deagle Room";
                                noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
                                noti.glowcolor = (0,0.9,0.7);
                                noti.duration = 4;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	iPrintlnBold( " ^1" + player.name + "^7 Has Chosen ^1Deagle Room^5!!" );
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
            player iPrintlnBold( "^5Fight!" );
            level.activ iPrintlnBold( "^5Fight!" );
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