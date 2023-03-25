/*FileHead:

			  MP_DR_PHANTASY
	Map created by: Kira
If you find any bug please report it, thanks.

*/

#include maps\mp\_utility;

main()
{
 maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

	// setdvar("g_speed" ,"190");
	// setdvar("dr_jumpers_speed" ,"1");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1500");

	level.music=[];
	level.music[0]["song"]    ="Do NOT select the same SONG!!! ;)";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="San Holo - Light ";
    level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="San Holo - Still Looking";
    level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Jon Hopkins - Abandon Window";
    level.music[3]["alias"]    ="song4";

    thread startdoor();
	thread logo();
	thread Developer();
	thread ab();
	thread Kira();
	thread bottomtext();
	thread vip();


	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();

	thread fight();
	thread whos1st();

	thread musicbox();
	thread music_play();

	addTriggerToList( "trig1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );


}

startdoor()
{
	door=getent("startdoor","targetname");
	level.value = 3;
	level.device = "d";

	level waittill("round_started");
	startHud=newhudelem();
	startHud.alignx="center";
	startHud.aligny="middle";
	startHud.horzalign="center";
	startHud.vertalign="middle";
	startHud.alpha=1;
	startHud.glowalpha=1;
	startHud.y = 0;
	startHud.fontscale= 1.8;
	startHud.font="default";
	startHud.glowcolor=(0,1,1);
	level.conthud = "c";
	wait 3;
	startHud setText("Startdoor will open in: " + level.value);
	startHud.x = 0;
	startHud.alpha = 0;
	startHud fadeOverTime(1);
	startHud.alpha = 1;
	for(i=0;i<3;i++)
	{
		level.value--;
		wait 1;
		startHud setText("Startdoor will open in: " + level.value);
	}
	startHud fadeovertime(1);
	startHud.alpha=0;
	startHud setText("Startdoor opening!");
	door delete();
	level.align = "layer";
	if(isdefined(startHud))
		startHud destroy();
}

logo()
{
    vc=getent("phantasy_logo","targetname");
    while(isdefined(vc))
    {
        vc rotateyaw(720,15);
        wait 15;
    }
}

Developer()
{
         trig = getEnt("Developer","targetname");

         trig waittill("trigger",players);
         trig delete();
          {

                  hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 3;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (7,5,7);
	hud_clock.label = &"Map Made By ...";
                   hud_clock SetPulseFX( 40, 5400, 200 );
                   wait 5;
                   hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 3;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (7,5,7);
	hud_clock.label = &"^6>_<";
                   hud_clock SetPulseFX( 40, 5400, 200 );
                   wait 5;
                    hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "middle";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "middle";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 0;
	hud_clock.font = "objective";
	hud_clock.fontscale = 3;
	hud_clock.glowalpha = 1;
	hud_clock.glowcolor = (7,5,7);
	hud_clock.label = &"A LOT OF PEOPLE";
                   hud_clock SetPulseFX( 40, 5400, 200 );
           }
}

ab()
{
	level waittill("round_started");
	noti = SpawnStruct();
	wait 1.5;
		noti.titleText = "\n\n ^5PHANTASY ";
		noti.notifyText = "\n\n\n^0Time for ^3RACE!";
		noti.duration = 7;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

bottomtext()
{
	level waittill("round_started");
	while(1)
	{
	wait 10;
	iPrintLn("^5>>^5Welcome to ^0mp_dr_^6Phantasy^2!^5<<");
	wait 10;
	iPrintLn("^5>>^0Enjoy^5<<");
	wait 5;
	iPrintLn("^5>>^0Map By ^6Kira^5<<");
	wait 5;
	iPrintLn("^5>>^0Thanks To ^6Phantasy ^0For ^2Script ^0Helping^5<<");
	wait 10;
	iPrintLn("^5>>^0Thanks To ^5VC' Blade ^0For Helping^5<<");
	wait 10;
	iPrintLn("^5>>^0Thanks To ^2Sheep Wizard ^0For Helping^5<<");
	wait 10;
	iPrintLn("^5>>^0Thanks To ^6MySelf ^0For patient make this MAP ^6;)^5<<");

	}

}

Kira()
{
    wait 22;
	hud_clock = NewHudElem();
    hud_clock.alignX = "center";
    hud_clock.alignY = "middle";
    hud_clock.horzalign = "center";
    hud_clock.vertalign = "middle";
    hud_clock.alpha = 1;
    hud_clock.x = 0;
    hud_clock.y = 150;
    hud_clock.font = "objective";
    hud_clock.fontscale = 1.8;
    hud_clock.glowalpha = 1;
    hud_clock.glowcolor = (1,0,1);
    hud_clock.label = &"Map by ^1Kira";
    hud_clock SetPulseFX( 40, 5400, 200 );
}

trap1()
{
            trig = getEnt("trig1","targetname");
            brush = getEnt("trap1","targetname");

            trig sethintstring("^1&&1^7: activate ^1Trap 1");
			trig waittill("trigger");

            trig delete();
			brush delete();
}

trap2()
{
    trig = getent("trig_trap2","targetname");
    trapa = getent("trap_2a","targetname");
    trapb = getent("trap_2b","targetname");
    trapc = getent("trap_2c","targetname");
    trapd = getent("trap_2d","targetname");
    trape = getent("trap_2e","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc) && isdefined(trapd) && isdefined(trape))
    {
        trapa movey(250,0.5);
        wait 0.5;
        trapb movey(250,0.5);
        wait 0.5;
        trapc movey(250,0.5);
        wait 0.5;
        trapd movey(250,0.5);
        wait 0.5;
        trape movey(250,0.5);
        wait 0.5;
        trapa movey(-250,0.5);
        wait 0.5;
        trapb movey(-250,0.5);
        wait 0.5;
        trapc movey(-250,0.5);
        wait 0.5;
        trapd movey(-250,0.5);
        wait 0.5;
        trape movey(-250,0.5);
        wait 0.5;
    }
}

trap3()
{
    trig = getent("trig_trap3","targetname");
    trap = getent("trap_3","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

	while(isdefined(trap))
    {
	    trap movez(-500,1);
		wait 2;
        trap movez(500,1);
		wait 2;
    }
}

trap4()
{
            trig = getEnt("trig4","targetname");
            brush = getEnt("trap4","targetname");

            trig sethintstring("^1&&1^7: activate ^1Trap");
			trig waittill("trigger");

            trig delete();
			brush delete();
}

trap5()
{
    trig = getent("trig_trap5","targetname");
    trap = getent("trap_5","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
	    trap movez(-420,5);
		wait 5;
        trap rotateroll(360,1);
        wait 2;
		trap movez(420,1);
		wait 5;
    }
}

trap6()
{
    trig = getent("trig_trap6","targetname");
    trap = getent("trap_6","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360,1.5);
        wait 3;
    }
}

trap7()
{
    trig = getent("trig_trap7","targetname");
    trapa = getent("trap_7a","targetname");
    trapb = getent("trap_7b","targetname");
    trapc = getent("trap_7c","targetname");
    trapd = getent("trap_7d","targetname");
    trape = getent("trap_7e","targetname");
	trapf = getent("trap_7f","targetname");
	trapg = getent("trap_7g","targetname");
	traph = getent("trap_7h","targetname");
	trapi = getent("trap_7i","targetname");
	trapj = getent("trap_7j","targetname");
	trapk = getent("trap_7k","targetname");
	trapl = getent("trap_7l","targetname");
	trapm = getent("trap_7m","targetname");
	trapn = getent("trap_7n","targetname");
	trapo = getent("trap_7o","targetname");
	trapp = getent("trap_7p","targetname");
	trapq = getent("trap_7q","targetname");
	trapr = getent("trap_7r","targetname");
	traps = getent("trap_7s","targetname");
	trapt = getent("trap_7t","targetname");
	trapu = getent("trap_7u","targetname");
	trapv = getent("trap_7v","targetname");
	trapw= getent("trap_7w","targetname");
	trapx = getent("trap_7x","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc) && isdefined(trapd) && isdefined(trape))
    {
        trapa movey(-300,0.1);
        wait 0.1;
        trapb movey(-300,0.1);
        wait 0.1;
        trapc movey(-300,0.1);
        wait 0.1;
        trapd movey(-300,0.1);
        wait 0.1;
        trape movey(-300,0.1);
        wait 0.1;
		trapf movey(-300,0.1);
        wait 0.1;
		trapg movey(-300,0.1);
        wait 0.1;
		traph movey(-300,0.1);
        wait 0.1;
		trapi movey(-300,0.1);
        wait 0.1;
		trapj movey(-300,0.1);
        wait 0.1;
		trapk movey(-300,0.1);
        wait 0.1;
		trapl movey(-300,0.1);
        wait 0.1;
		trapm movey(-300,0.1);
        wait 0.1;
		trapn movey(-300,0.1);
        wait 0.1;
		trapo movey(-300,0.1);
        wait 0.1;
		trapp movey(-300,0.1);
        wait 0.1;
		trapq movey(-300,0.1);
        wait 0.1;
		trapr movey(-300,0.1);
        wait 0.1;
		traps movey(-300,0.1);
        wait 0.1;
		trapt movey(-300,0.1);
        wait 0.1;
		trapu movey(-300,0.1);
        wait 0.1;
		trapv movey(-300,0.1);
        wait 0.1;
		trapw movey(-300,0.1);
        wait 0.1;
		trapx movey(-300,0.1);
        wait 0.1;
        trapa movey(300,0.1);
        wait 0.1;
        trapb movey(300,0.1);
        wait 0.1;
        trapc movey(300,0.1);
        wait 0.1;
        trapd movey(300,0.1);
        wait 0.1;
        trape movey(300,0.1);
        wait 0.1;
		trapf movey(300,0.1);
        wait 0.1;
		trapg movey(300,0.1);
        wait 0.1;
		traph movey(300,0.1);
        wait 0.1;
		trapi movey(300,0.1);
        wait 0.1;
		trapj movey(300,0.1);
        wait 0.1;
		trapk movey(300,0.1);
        wait 0.1;
		trapl movey(300,0.1);
        wait 0.1;
		trapm movey(300,0.1);
        wait 0.1;
		trapn movey(300,0.1);
        wait 0.1;
		trapo movey(300,0.1);
        wait 0.1;
		trapp movey(300,0.1);
        wait 0.1;
		trapq movey(300,0.1);
        wait 0.1;
		trapr movey(300,0.1);
        wait 0.1;
		traps movey(300,0.1);
        wait 0.1;
		trapt movey(300,0.1);
        wait 0.1;
		trapu movey(300,0.1);
        wait 0.1;
		trapv movey(300,0.1);
        wait 0.1;
		trapw movey(300,0.1);
        wait 0.1;
		trapx movey(300,0.1);
        wait 0.1;
    }
}

trap8()
{
    trig = getent("trig_trap8","targetname");
    trapa = getent("trap_8a","targetname");
    trapb = getent("trap_8b","targetname");
    trapc = getent("trap_8c","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc))
    {
        trapa movez(330,1);
        wait 1;
        trapb movez(330,2);
        wait 1;
        trapc movez(330,1);
        wait 1;
        trapa movez(-330,2);
        wait 1;
        trapb movez(-330,1);
        wait 1;
        trapc movez(-330,2);
        wait 1;
    }
}

trap9()
{
    trig = getent("trig_trap9","targetname");
    trap = getent("trap_9","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap");
    trig waittill("trigger");
    trig delete();

    trap movez(-200,1);
}

fight()
{
	level.endroom = GetEnt("trig_teleport","targetname");
    jump = GetEnt( "teleport_jumper", "targetname" );
    acti = GetEnt( "teleport_activator", "targetname" );

	while(1)
	{
		level.endroom waittill("trigger", player);
		if( !level.PlayerInRoom )
		{
			if( isDefined(level.old_trig) )
			level.PlayerInRoom = true;
			level.endroom2 delete();
			level.endroom3 delete();

		    if(!level.blade_found)
            {
                ambientstop();
                ambientplay("fight");
            }

			player.health = player.maxhealth;
			level.activ.health = level.activ.maxhealth;
			player SetPlayerAngles( jump.angles );
	        player setOrigin( jump.origin );
	        player TakeAllWeapons();
	        player GiveWeapon( "knife_mp" );
			player GiveMaxAmmo( "knife_mp" );
	        level.activ setPlayerangles( acti.angles );
	        level.activ setOrigin( acti.origin );
	        level.activ TakeAllWeapons();
	        level.activ GiveWeapon( "knife_mp" );
	        level.activ GiveMaxAmmo( "knife_mp" );
	        wait .05;
	        player switchToWeapon( "knife_mp" );
	        level.activ SwitchToWeapon( "knife_mp" );
	        player FreezeControls(1);
			level.activ FreezeControls(1);
			noti = SpawnStruct();
					noti.titleText = "Fight!";
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

whos1st()
{

	trig = getEnt ("1st_trig", "targetname");

	trig waittill("trigger", player);

	iprintlnbold("^5" + player.name + " ^0Finished Map first^1!");
	trig delete();
}

musicbox()
{
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
    p braxi\_rank::giveRankXP("", 50); //remove this if you still got braxi issues
    trig delete();
    p freezeControls(1);
    p musicmenu();
}

musicmenu()
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
    self.hud_music[i] setShader( "white", 320, 160 ); //background image
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 ); //should be bar image, i suggest to not change cuz your texture will be stretched
    self.hud_music[i].color=(1,0,0);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Lava World Music Menu"); //title
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else
        self.hud_music[i].glowcolor=(1,0,0); //title text color
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^1[{+attack}] ^7| Select: ^1[{+activate}] ^7| Close: ^1[{+frag}]"); //just change numbers of colors here if you need different ones

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
    indicator setShader( "white", 306, 17 ); //another bar image that will most likely stretch, i suggest to only change colors
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
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<"); //text that appears after picking a song

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
    self notify( "music thread terminated" );
}

music_play()
{
	songs = [];
	songs[songs.size] = "song1";
	songs[songs.size] = "song2";
	songs[songs.size] = "song3";
	songs[songs.size] = "song4";

	selected = songs[ Randomint( songs.size ) ];
	AmbientPlay( selected );
}

addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}

vip()
{
	level waittill( "round_started" );
	wait 3;

	players = GetEntArray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		Guid = getSubStr(players[i] getGuid(),24,32);
		if( (Guid == "SSYL2608" || Guid == "86161619") && players[i].pers["team"] == "allies" )
		{
			players[i] GiveWeapon( "deserteagle_mp" );
			players[i] GiveMaxAmmo( "deserteagle_mp" );
			wait .05;
			players[i] SwitchToWeapon( "deserteagle_mp" );
			players[i] iPrintlnBold( "^6Map Creator here " + players[i].name );
			wait 1;
			players[i] endon("disconnect");
			players[i] detachAll();
			players[i] setModel("deadpool");
			players[i] iprintLnBold("^5You are ^2DeadLooL!");

		}
	}
}