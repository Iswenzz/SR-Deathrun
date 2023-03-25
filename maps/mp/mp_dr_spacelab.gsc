/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////																									              ///////
///////																									              ///////
///////		////////	     //		/////////////	//	 //  ////////////  ////////////  //////////   /////////////   ///////
///////		//		//    //   //   //         //	//  //   //	                //       //           //         //   ///////
///////		//		//    //   //   ////////////    // //    //	                //       //           ////////////    ///////
///////		//		//    ///////	//	  //	    ////     ////////////       //       //////////   //              ///////
///////		//		//	  //   //	//	   //	    // //              //       //       //           //              ///////
///////		//		//	  //   //	//		//      //  //             //       //       //           //              ///////
///////		////////	  //   //   //		 //     //   //  ////////////       //       //////////   //              ///////
///////																									              ///////
///////																									              ///////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//Steam: CAR DarkSTEP
//Discord: DarkSTEP#7390
//YouTube: DarkSTEP
//PayPal: paypal.me/darkstepdonations
//Every donator will get lifetime VIP access to all my updated maps!
//Minor thanks: CAR 0rK!DeA (few vision and hud fixes), VC' Fox (chiller playermodel), VC' ERIK (secret timer and some fx)
//Feel free to copy without permission ;)
//If you're from xM and you're reading this then good luck trying to make this map work in your trash server :D

#include braxi\_common;
#include common_scripts\utility;
#include braxi\_rank;
main()
{
maps\mp\_load::main();

	game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	// setdvar("g_speed","190");
	setdvar("bg_fallDamageMaxHeight", "99999");
	setdvar("bg_fallDamageMinHeight", "99998");
	level.bluefire = LoadFx("deathrun/blueburst");
	level.bluelight = LoadFx("deathrun/bluelight");
	level.spark = LoadFx("deathrun/sparks");
	level.portal = LoadFx("deathrun/portal");
	level.music=[];
    level.music[0]["song"]    ="Wasted Penguinz - Moments";
    level.music[0]["alias"]    ="sniper";
    level.music[1]["song"]    ="R3hab & KSHMR - Strong";
    level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="Krewella - I Live for the Creatures";
    level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Headhunterz - Reignite";
    level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="D-Block - Angels & Demons";
    level.music[4]["alias"]    ="song5";
	level.music[5]["song"]    ="Aero Chord - Twerk";
    level.music[5]["alias"]    ="song6";
	level.master = "M";
	level.actispace = false;
	level.cambiato = false;
	level.gapmode = 0;
	level.activKills = 0;
	level.boom_fx = LoadFx("explosions/default_explosion");
	level.wingstrail = LoadFx("deathrun/wingstrail");
	precacheShellShock( "jeepride_ridedeath");
	precacheShader("metallic2d");
	precacheShader("astrohelmet");
	precacheItem("labowie_mp");
	precacheModel("astroglovez");
	precacheModel("fox_chiller");
	precacheShader("mtl_chiller");
	precacheItem("labaxe_mp");
	precacheItem("usp_silencer_mp");
	precacheItem("uzi_silencer_mp");
	precacheItem("labm40a3_mp");
	precacheItem("labr700_mp");
	precacheItem("labm9a1_mp");
	precacheItem("labdeagle_mp");
	precacheItem("ak74u_mp");
	precacheItem("deserteaglegold_mp");
	precacheItem("rpg_mp");
	precacheItem("g3_mp");
	precacheItem("winchester1200_mp");
	precacheItem("ak47_mp");
	precacheItem("rpd_mp");
	precacheItem("rpd_acog_mp");

	thread fire1();
	thread fire2();
	thread fire3();
	thread musicbox();
	thread gate();
	thread portal();
	thread plat1();
	thread plat2();
	thread plat3();
	thread plat4();
	thread portalfx();
	thread suitgiver();
	thread sdoor1();
	thread sdoor2();
	thread sdoor3();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap15();
	thread dmg1();
	thread dmg2();
	thread axe();
	thread pearl();
	thread plank1();
	thread plank2();
	thread plank3();
	thread plank4();
	thread actidoor();
	thread actidoor2();
	thread actitp2();
	thread actitp3();
	thread actitp4();
	thread actitp5();
	thread actitpspace();
	thread games();
	thread roomportalfx();
	thread secretchoice();
	thread supershit();
	thread supershit2();
	thread vipcheck();
	thread sniper();
	thread gap();
	thread jgap();
	thread agap();
	thread jgap1();
	thread jgap2();
	thread jgap3();
	thread jgap4();
	thread jgap5();
	thread agap1();
	thread agap2();
	thread agap3();
	thread agap4();
	thread agap5();
	//thread addTestClients();
	thread room_simonsays();
	thread actiaxe();
	thread weaponroom();
	thread knife();
	thread bgiveweapon();
	thread bounceroom();
	thread bouncefail1();
	thread bouncefail2();
	thread startdoor();
	thread messages();
	thread pure();
	thread pureendjumper();
	thread pureendacti();
	thread startvision();
	thread newsfeed();
	thread main190();
	thread enter190();
	thread b190();
	thread c190();
	thread d190();
	thread e190();
	thread f190();
	thread g190();
	thread h190();
	thread i190();
	thread secretend190();
	thread secretend190fx();
	thread main210();
	thread enter210();
	thread b210();
	thread c210();
	thread d210();
	thread e210();
	thread f210();
	thread g210();
	thread h210();
	thread i210();
	thread secretend210();
	thread secretend210fx();
	thread mainactis();
	thread enteractis();
	thread bactis();
	thread cactis();
	thread dactis();
	thread secretendactis();
	thread secretendactisfx();
	thread weapall();
	thread donottouch();
	thread shipmover1();
	thread shipmover2();
	thread moreaxes();
	thread welp();

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
}

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

startdoor()
{
door = getEnt("startdoor", "targetname");

door moveZ(320, 6);
iprintlnbold("^5Start door opened.");
wait 2;
	if (level.cambiato == false)
 {
  thread songs();
  level.cambiato = true;
 }

}

songs()
{
x=randomint(6);
if (x==0)
{
ambientPlay("sniper");
iPrintln("^2>>^1Now playing: ^5Wasted Penguinz - Moments^2<<");
}

if (x==1)
{
ambientPlay("song2");
iPrintln("^2>>^1Now playing: ^5R3hab & KSHMR - Strong^2<<");
}

if (x==2)
{
ambientPlay("song3");
iPrintln("^2>>^1Now playing: ^5Krewella - I Live for the Creatures^2<<");
}

if (x==3)
{
ambientPlay("song4");
iPrintln("^2>>^1Now playing: ^5Headhunterz - Reignite^2<<");
}

if (x==4)
{
ambientPlay("song5");
iPrintln("^2>>^1Now playing: ^5D-Block - Angels & Demons^2<<");
}

if (x==5)
{
ambientPlay("song6");
iPrintln("^2>>^1Now playing: ^5Aero Chord - Twerk^2<<");
}

}

messages()
{
wait 10;
iprintlnBold("^5Spacelab");
wait 5;
iPrintln("^5Map made by ^0Dark^5STEP");
for(;;)
{
wait 35;
x=randomint(10);
if (x==0)
{
iPrintln("^5Map made by ^0Dark^5STEP");
}

if (x==1)
{
iPrintln("^5There are 2 jumper secrets, one for 190 and the other for 210 speed!");
}

if (x==2)
{
iPrintln("^5This shit took ^13^5 months of work so i hope it's worth it :)");
}

if (x==3)
{
iPrintln("^5Secrets have an antiglitch system so don't try to shortcut ;)");
}

if (x==4)
{
iPrintln("^1Steam: ^5CAR ^0DarkSTEP");
}

if (x==5)
{
iPrintln("^5Feel free to report bugs");
}

if (x==6)
{
iPrintln("^5Feel free to join us on ^1xenia-gaming.net");
}

if (x==7)
{
iPrintln("^1Discord: ^5DarkSTEP#7390");
}

if (x==8)
{
iPrintln("^5Special thanks to ^1CAR 0rK!DeA ^5for ^2hud & vision fix ^5and to ^1VC'ERIK ^5for ^2some fx & tips");
}

if (x==9)
{
iPrintln("^5After a room fight your ^2health^5 will be restored");
}

}
}


musicbox()
{
    trig = getEnt("musictrigger","targetname");
    trig setHintString("Press ^1&&1^7 to select song");
    trig waittill("trigger",p);
	if (level.cambiato == false)
	{
	p braxi\_rank::giveRankXP("", 50);
    trig delete();
    p freezeControls(1);
    p musicmenu();
	}
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
    self.hud_music[i] setShader( "metallic2d", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(0,.6,.8);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Spacelab Music Menu");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else
        self.hud_music[i].glowcolor=(0,.6,.8);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 900;
    self.hud_music[i] setText("                                   Scroll: ^5[{+attack}] ^7| Select: ^5[{+activate}] ^7| Close: ^5[{+frag}]");

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
            self.hud_music[i].glowcolor=(0,.6,.8);

        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );
    indicator.color=(0,.6,.8);

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
             iPrintLn("^2>>^1Now playing: ^5"+level.music[self.selection]["song"]+"^2<<");

            ambientPlay(level.music[self.selection]["alias"]);
            self freezeControls(0);
			level.cambiato = true;
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

fire1()
{
	trig_1 = getEnt("trig_fire1", "targetname");
	o_1a = getEnt("o_fire1a", "targetname");
	o_1b = getEnt("o_fire1b", "targetname");
	o_1al = getEnt("o_1al", "targetname");
	o_1bl = getEnt("o_1bl", "targetname");

	trig_1 waittill ("trigger", player);
	o_1a playSound("fire");
	o_1b playSound("fire");
	PlayFX(level.bluefire, o_1a.origin);
	PlayFX(level.bluefire, o_1b.origin);
	PlayFX(level.bluelight, o_1al.origin);
	PlayFX(level.bluelight, o_1bl.origin);
	wait .8;
}

fire2()
{
	trig_2 = getEnt("trig_fire2", "targetname");
	o_2a = getEnt("o_fire2a", "targetname");
	o_2b = getEnt("o_fire2b", "targetname");
	o_2al = getEnt("o_2al", "targetname");
	o_2bl = getEnt("o_2bl", "targetname");

	trig_2 waittill ("trigger", player);
	o_2a playSound("fire");
	o_2b playSound("fire");
	PlayFX(level.bluefire, o_2a.origin);
	PlayFX(level.bluefire, o_2b.origin);
	PlayFX(level.bluelight, o_2al.origin);
	PlayFX(level.bluelight, o_2bl.origin);
	wait .8;
}

fire3()
{
	trig_3 = getEnt("trig_fire3", "targetname");
	o_3a = getEnt("o_fire3a", "targetname");
	o_3b = getEnt("o_fire3b", "targetname");
	o_3al = getEnt("o_3al", "targetname");
	o_3bl = getEnt("o_3bl", "targetname");

	trig_3 waittill ("trigger", player);
	o_3a playSound("fire");
	o_3b playSound("fire");
	PlayFX(level.bluefire, o_3a.origin);
	PlayFX(level.bluefire, o_3b.origin);
	PlayFX(level.bluelight, o_3al.origin);
	PlayFX(level.bluelight, o_3bl.origin);
	wait .8;
}

gate()
{
	trig = getEnt("trig_gate", "targetname");
	left = getEnt("gateleft", "targetname");
	right = getEnt("gateright", "targetname");
	o = getEnt("o_gate", "targetname");

	trig waittill ("trigger", player);
	o playSound("gate");
	left moveX(-984,3);
	right moveX(984,3);
	wait 3;
}

plat1()
{
	trig = getEnt("trig_plat1", "targetname");
	plat = getEnt("plat1", "targetname");
	trig waittill ("trigger", player);
	plat moveZ(384,.5);
	wait .5;
}

plat2()
{
	trig = getEnt("trig_plat2", "targetname");
	plat = getEnt("plat2", "targetname");
	trig waittill ("trigger", player);
	plat moveZ(384,.5);
	wait .5;
}

plat3()
{
	trig = getEnt("trig_plat3", "targetname");
	plat = getEnt("plat3", "targetname");
	trig waittill ("trigger", player);
	plat moveZ(384,.5);
	wait .5;
}

plat4()
{
	trig = getEnt("trig_plat4", "targetname");
	plat = getEnt("plat4", "targetname");
	trig waittill ("trigger", player);
	plat moveZ(384,.5);
	wait .5;
}

portal()
{
	trig = getEnt("trig_portal", "targetname");
	o = getEnt("o_portal", "targetname");
	gas = 0;

	for (;;)
	{
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	player setClientDvar("r_filmTweakEnable", "1");
    player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
    player setClientDvar("r_filmTweakContrast", "1.4");
    player setClientDvar("r_filmTweakBrightness", "0.04");
    player setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
    player setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
    player setClientDvar("r_glow", "1");
    player setClientDvar("r_glowRadius0", "8");
    player setClientDvar("r_glowBloomCutoff", "0.4");
    player setClientDvar("r_glowBloomIntensity0", "1");
    player setClientDvar("r_glowSkyBleedIntensity0", "1");
	}
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//xM# member
//xM# members//xM# member
//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member
//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member
//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member
//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member//xM# member

portalfx()
{
	trig = getEnt("trig_portalfx", "targetname");
	o_1 = getEnt("o_portalfx", "targetname");
	o_2 = getEnt("o_portal2", "targetname");


	trig waittill ("trigger", player);
	//o_1a playSound("fire");
	PlayFX(level.portal, o_1.origin);
	PlayFX(level.bluelight, o_1.origin);
	PlayFX(level.portal, o_2.origin);
	wait .8;
}

suitgiver()
{
	trig = getEnt("trig_suitgiver", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
					if( player.gas == 0)
		{
		 player.gas = 1;
        //player detachAll();
        //player attach( "astrohelmet" );
		visionSetNight( "mp_dr_glitch_space", 0 );
		player playSound("breath");
        player thread gasmask_screen(player);
		}
	}
}

gasmask_screen(player)
{
    player thread maskOnTrig(player);
    player thread maskOnDeath();
    player thread maskOnDisconnect();
    player thread maskOnSpawned();
    player thread maskOnSpectators();
			//if(!isDefined(player.hud_gas))
    //player.hud_gas = addhud(self,0,0,1,"fullscreen","fullscreen",1.8);
   // player.hud_gas SetShader("astrohelmet", 640, 490);//gasmasker
	player.hud_gas = NewClientHudElem(player);
    player.hud_gas.horzalign = "fullscreen";
	player.hud_gas.vertalign = "fullscreen";
	player.hud_gas SetShader( "astrohelmet", 640 , 480 );
		player.topcredits = newHudElem();
		player.topcredits.foreground = true;
		player.topcredits.alignX = "center";
		player.topcredits.alignY = "bottom";
		player.topcredits.horzAlign = "center";
		player.topcredits.vertAlign = "bottom";
		player.topcredits.x = 4;
		player.topcredits.y = -8;
		player.topcredits.sort = 0;
		player.topcredits.fontScale = 1.8;
		player.topcredits.glowColor = (0,.8,1);
		player.topcredits.glowAlpha = 1;
		player.topcredits.hidewheninmenu = true;
		player.topcredits setText("^5GRAVITY SUIT: ^2ONLINE");
		player setModel("fox_chiller");
		player setViewModel("astroglovez");
		player iPrintLn("^1You got a space suit!");
		player setClientDvar("r_glow", "0");
    player waittill("mask_off");
    player.hud_gas destroy();
	player.topcredits destroy();
	player.gas = 0;
	player setClientDvar("r_filmTweakEnable", "1");
	player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
	player setClientDvar("r_filmTweakContrast", "1.4");
	player setClientDvar("r_filmTweakBrightness", "0.03");
	player setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	player setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	player setClientDvar("r_glow", "1");
	player setClientDvar("r_glowRadius0", "8");
	player setClientDvar("r_glowBloomCutoff", "0.4");
	player setClientDvar("r_glowBloomIntensity0", "1");
	player setClientDvar("r_glowSkyBleedIntensity0", "1");
}

maskOnTrig(player)
{
    //trig = getent ("end_trigger","targetname");
    level.games_trig waittill("trigger",player);
    player notify("mask_off");
}

maskOnDeath()
{
    self waittill("death");
    self notify("mask_off");
    self LaserOff();
}

maskOnDisconnect()
{
    self waittill("disconnect");
    self notify("mask_off");
    self LaserOff();
}

maskOnSpawned()
{
    self waittill("spawned");
    self notify("mask_off");
    self LaserOff();
}

maskOnSpectators()
{
    self waittill("joined_spectators");
    self notify("mask_off");
    self LaserOff();
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
sdoor1()
{
	trig = getEnt("trig_sdoor1", "targetname");
	plat = getEnt("sdoor1", "targetname");
	kek = getDvar("sv_hostname");
	trig waittill ("trigger", player);
	if (isSubStr( toLower(kek), toLower("xM")) || isSubStr( toLower(kek), toLower("Nice*") ))
	{
		iPrintLnBold ("^1KYS ^6RAKY");
		wait 2;
		exitLevel(true);
	}
	else {
	o = spawn( "script_origin", player.origin + (0,500,0), 1, 200 );
	plat moveZ(-160, .8);
	o playSound("spacedoor");
	wait .8;
	}
}

sdoor2()
{
	trig = getEnt("trig_sdoor2", "targetname");
	plat = getEnt("sdoor2", "targetname");
	trig waittill ("trigger", player);
	o = spawn( "script_origin", player.origin + (0,500,0), 1, 200 );
	plat moveZ(-160, .8);
	o playSound("spacedoor");
	wait .8;
}

sdoor3()
{
	trig = getEnt("trig_sdoor3", "targetname");
	plat = getEnt("sdoor3", "targetname");
	ofx = getEnt("o_endportalfx", "targetname");
	a = getEnt("o_actiantiglitch", "targetname");
	trig waittill ("trigger", player);
	o = spawn( "script_origin", player.origin + (408,0,0), 1, 200 );
	plat moveZ(-160, .8);
	o playSound("spacedoor");
	wait .8;
	PlayFX(level.portal, ofx.origin);
	if (level.actispace == true)
	{
	activator = GetActivator();
	activator unlink();
	activator freezeControls(false);
	activator setOrigin(a.origin);
	activator setPlayerAngles(a.angles);
	activator setClientDvar("r_filmTweakEnable", "1");
	activator  setClientDvar("r_filmUseTweaks", 1);
	activator  setClientDvar("r_filmTweakInvert", "0");
	activator  setClientDvar("r_filmTweakContrast", "1.4");
	activator  setClientDvar("r_filmTweakBrightness", "0.03");
	activator  setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	activator  setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	activator  setClientDvar("r_glow", "1");
	activator  setClientDvar("r_glowRadius0", "8");
	activator  setClientDvar("r_glowBloomCutoff", "0.4");
	activator  setClientDvar("r_glowBloomIntensity0", "1");
	activator  setClientDvar("r_glowSkyBleedIntensity0", "1");
	activator iPrintLnBold("^5Sorry man, antiglitch");
	}
}

trap1()
{
	trig = getEnt("trig_trap1", "targetname");
	a = getEnt("trap1a", "targetname");
	b = getEnt("trap1b", "targetname");
	o = getEnt("o_trap1", "targetname");
	trig setHintString("Press F to drop them!");
	trig waittill ("trigger", player);
	o playSound("spark");
	PlayFX(level.spark, o.origin);
	x = randomInt(2);
	if (x==0)
	{
		a moveZ(-504, 1);
		wait 5;
		a moveZ(504, 1);
		wait 1;
	}
	if (x==1)
	{
		b moveZ(-504, 1);
		wait 5;
		b moveZ(504, 1);
		wait 1;
	}
}

trap15()
{
	// kek = getDvar("sv_hostname");
	// wait 7;
	// if (isSubStr( toLower(kek), toLower("xM")) || isSubStr( toLower(kek), toLower("Nice*") ))
	// {
	// 	iPrintLnBold ("^1KYS ^6RAKY");
	// 	wait 2;
	// 	exitLevel(true);
	// }
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)

trap2()
{
	trig = getEnt("trig_trap2", "targetname");
	hurt = getEnt("trap2dmg", "targetname");
	hurt thread maps\mp\_utility::triggerOff();
	o = getEnt("o_trap2", "targetname");
	os = getEnt("o_sparksound2", "targetname");
	o1 = getEnt("o_trap2a", "targetname");
	o2 = getEnt("o_trap2b", "targetname");
	o3 = getEnt("o_trap2c", "targetname");
	o4 = getEnt("o_trap2d", "targetname");
	o5 = getEnt("o_trap2e", "targetname");
	trig setHintString("Press F to electrocute them!");
	trig waittill ("trigger", player);
	o playSound("spark");
	PlayFX(level.spark, o.origin);
	hurt thread maps\mp\_utility::triggerOn();
	for(i = 0; i < 5; i++)
	{
	x = randomInt(8);
	if (x==0)
	{
		PlayFX(level.spark, o1.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==1)
	{
		PlayFX(level.spark, o2.origin);
		PlayFX(level.spark, o4.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==2)
	{
		PlayFX(level.spark, o3.origin);
		PlayFX(level.spark, o5.origin);
		PlayFX(level.spark, o1.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==3)
	{
		PlayFX(level.spark, o4.origin);
		PlayFX(level.spark, o5.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==4)
	{
		PlayFX(level.spark, o3.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==5)
	{
		PlayFX(level.spark, o4.origin);
		PlayFX(level.spark, o1.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==6)
	{
		PlayFX(level.spark, o3.origin);
		PlayFX(level.spark, o5.origin);
		PlayFX(level.spark, o1.origin);
		PlayFX(level.spark, o4.origin);
		os playSound("spark");
		wait .7;
	}
	if (x==7)
	{
		PlayFX(level.spark, o1.origin);
		PlayFX(level.spark, o3.origin);
		os playSound("spark");
		wait .7;
	}
	}
	hurt thread maps\mp\_utility::triggerOff();
}

dmg1()
{
	trig = getEnt("trig_dmg1", "targetname");
	o = getEnt("o_spark", "targetname");
	plat = getEnt("dmg1", "targetname");
	trig waittill ("trigger", player);
	for(i = 0; i < 3; i++)
	{
	PlayFX(level.spark, o.origin);
	o playSound("spark");
	wait .7;
	}
	plat moveZ(-140, .8);
	o playSound("spacedoor");
	wait .8;
}

axe()
{
	trig = getEnt("trig_axe", "targetname");
	trig setHintString("Press F to get the axe!");
	clip = getEnt("clip_axe", "targetname");
	modelaxe = getEnt("model_axe", "targetname");
	trig waittill ("trigger", player);
	player giveWeapon("labaxe_mp");
	player switchToWeapon("labaxe_mp");
	clip delete();
	modelaxe delete();
	trig delete();
}

plank1()
{
	trig = getEnt("trig_plank1", "targetname");
	a = getEnt("plank1", "targetname");
	for(;;)
	{
		trig waittill ("trigger", player);
		player.gun = player getCurrentWeapon();
		if (player.gun == "labaxe_mp")
		{
			a delete();
			player playSound("plank");
			thread plankbarrier();
			return;
		}
		else
		{
			player iPrintLnBold("You will need a stronger weapon to break these...");
		}
	}
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)

plank2()
{
	trig = getEnt("trig_plank2", "targetname");
	a = getEnt("plank2", "targetname");
	level.plank2 = true;
	for(;;)
	{
		trig waittill ("trigger", player);
		player.gun = player getCurrentWeapon();
		if (player.gun == "labaxe_mp")
		{
			a delete();
			player playSound("plank");
			level.plank2 = false;
			thread plankbarrier();
			return;
		}
		else
		{
			player iPrintLnBold("You will need a stronger weapon to break these...");
		}
	}
}

plank3()
{
	trig = getEnt("trig_plank3", "targetname");
	a = getEnt("plank3", "targetname");
	level.plank3 = true;
	for(;;)
	{
		trig waittill ("trigger", player);
		player.gun = player getCurrentWeapon();
		if (player.gun == "labaxe_mp")
		{
			a delete();
			player playSound("plank");
			level.plank3 = false;
			thread plankbarrier();
			return;
		}
		else
		{
			player iPrintLnBold("You will need a stronger weapon to break these...");
		}
	}
}

plank4()
{
	trig = getEnt("trig_plank4", "targetname");
	a = getEnt("plank4", "targetname");
	level.plank4 = true;
	for(;;)
	{
		trig waittill ("trigger", player);
		player.gun = player getCurrentWeapon();
		if (player.gun == "labaxe_mp")
		{
			a delete();
			player playSound("plank");
			level.plank4 = false;
			thread plankbarrier();
			return;
		}
		else
		{
			player iPrintLnBold("You will need a stronger weapon to break these...");
		}
	}
}

plankbarrier()
{
	a = getEnt("secretwall", "targetname");
	if(level.plank2 == false && level.plank3 == false && level.plank4 == false && isDefined(a))
	{
		a delete();
	}
}

dmg2()
{
	trig = getEnt("trig_dmg2", "targetname");
	o = getEnt("o_spark2", "targetname");
	plat = getEnt("secretdoor", "targetname");
	trig waittill ("trigger", player);
	for(i = 0; i < 3; i++)
	{
	PlayFX(level.spark, o.origin);
	o playSound("spark");
	wait .7;
	}
	plat moveZ(-144, .8);
	o playSound("spacedoor");
	wait .8;
}

actidoor()
{
	trig = getEnt("trig_actidoor", "targetname");
	plat = getEnt("actidoor", "targetname");
	trig waittill ("trigger", player);
	o = spawn( "script_origin", player.origin, 1, 200 );
	plat moveZ(-160, .8);
	o playSound("spacedoor");
	wait .8;
}

actidoor2()
{
	trig = getEnt("trig_actidoor2", "targetname");
	plat = getEnt("actidoor2", "targetname");
	portal = getEnt("o_portalacti", "targetname");
	portal2 = getEnt("o_portalacti2", "targetname");
	portal3 = getEnt("o_portalacti3", "targetname");
	ofx = getEnt("o_actipspace", "targetname");
	trig waittill ("trigger", player);
	o = spawn( "script_origin", player.origin, 1, 200 );
	plat moveZ(-160, .8);
	o playSound("spacedoor");
	PlayFX(level.portal, portal.origin);
	PlayFX(level.portal, portal2.origin);
	PlayFX(level.portal, portal3.origin);
	PlayFX(level.portal, ofx.origin);
	wait .8;
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)

trap3()
{
	trig = getEnt("trig_trap3", "targetname");
	hurta = getEnt("trap3dmga", "targetname");
	hurtb = getEnt("trap3dmgb", "targetname");
	hurta thread maps\mp\_utility::triggerOff();
	hurtb thread maps\mp\_utility::triggerOff();
	o = getEnt("o_trap3", "targetname");
	os = getEnt("o_trap3sound", "targetname");
	o1 = getEnt("o_trap3a", "targetname");
	o2 = getEnt("o_trap3b", "targetname");
	o3 = getEnt("o_trap3c", "targetname");
	o4 = getEnt("o_trap3d", "targetname");
	o5 = getEnt("o_trap3e", "targetname");
	o6 = getEnt("o_trap3f", "targetname");
	o7 = getEnt("o_trap3g", "targetname");
	o8 = getEnt("o_trap3h", "targetname");
	trig setHintString("Press F to break those wires!");
	trig waittill ("trigger", player);
	o playSound("spark");
	for(;;)
	{
		hurta thread maps\mp\_utility::triggerOn();
		os playSound("spark");
		PlayFX(level.spark, o1.origin);
		PlayFX(level.spark, o2.origin);
		PlayFX(level.spark, o3.origin);
		PlayFX(level.spark, o4.origin);
		wait .4;
		hurta thread maps\mp\_utility::triggerOff();
		wait 4.6;
		hurtb thread maps\mp\_utility::triggerOn();
		os playSound("spark");
		PlayFX(level.spark, o5.origin);
		PlayFX(level.spark, o6.origin);
		PlayFX(level.spark, o7.origin);
		PlayFX(level.spark, o8.origin);
		wait .4;
		hurtb thread maps\mp\_utility::triggerOff();
		wait 4.6;
		hurta thread maps\mp\_utility::triggerOn();
		hurtb thread maps\mp\_utility::triggerOn();
		os playSound("spark");
		PlayFX(level.spark, o1.origin);
		PlayFX(level.spark, o2.origin);
		PlayFX(level.spark, o3.origin);
		PlayFX(level.spark, o4.origin);
		PlayFX(level.spark, o5.origin);
		PlayFX(level.spark, o6.origin);
		PlayFX(level.spark, o7.origin);
		PlayFX(level.spark, o8.origin);
		wait .4;
		hurta thread maps\mp\_utility::triggerOff();
		hurtb thread maps\mp\_utility::triggerOff();
		wait 4.6;
	}
}

trap4()
{
	trig = getEnt("trig_trap4", "targetname");
	a = getEnt("trap4", "targetname");
	o = getEnt("o_trap4", "targetname");
	trig setHintString("Press F to remove the bounce!");
	trig waittill ("trigger", player);
	o playSound("spark");
	PlayFX(level.spark, o.origin);
		a moveZ(-900, 2);
		wait 2;
}

actitp2()
{
	trig = getEnt("trig_actitp2", "targetname");
	o = getEnt("o_actitp2", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

actitp3()
{
	trig = getEnt("trig_actitp3", "targetname");
	o = getEnt("o_actitp3", "targetname");
	ofx = getEnt("o_portalfx12", "targetname");
	PlayFX(level.portal, ofx.origin);

	for (;;)
	{
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

trap6()
{
trigger = getent("trig_trap6","targetname");
object = getent("trap6","targetname");
o = getent("o_trap6","targetname");
killtrigger = getent ("trap6dmg", "targetname");
trigger sethintstring ("Press F to turn them into pizzas!");
trigger waittill ("trigger" , player );
trigger delete();
o playSound("spark");
PlayFX(level.spark, o.origin);
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveZ(-198, 1);
wait(1);
object moveZ(198, 1);
wait(1);
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)

actitp4()
{
	trig = getEnt("trig_portaltp4", "targetname");
	o = getEnt("o_portaltp4", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

actitp5()
{
	trig = getEnt("trig_portaltp5", "targetname");
	o = getEnt("o_portaltp5", "targetname");

	for (;;)
	{
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
	}
}

games()
{
level.games_trig = getEnt( "trig_endselector", "targetname");
games = getEnt( "o_endselector", "targetname" );

while(1)
{
level.games_trig waittill( "trigger", player );
if( !isDefined( level.games_trig ) )
return;

iPrintlnBold( " ^5" + player.name + " is picking a room" );
player setClientDvar("r_filmTweakEnable", "1");
	player  setClientDvar("r_filmUseTweaks", 1);
	player  setClientDvar("r_filmTweakInvert", "0");
	player  setClientDvar("r_filmTweakContrast", "1.4");
	player  setClientDvar("r_filmTweakBrightness", "0.03");
	player setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	player  setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	player  setClientDvar("r_glow", "1");
	player  setClientDvar("r_glowRadius0", "8");
	player setClientDvar("r_glowBloomCutoff", "0.4");
	player setClientDvar("r_glowBloomIntensity0", "1");
	player setClientDvar("r_glowSkyBleedIntensity0", "1");
	player SetPlayerAngles( games.angles );
player setOrigin( games.origin );
player TakeAllWeapons();
player antiglitcher();
}
}

antiglitcher()
{
self common_scripts\utility::waittill_any("death","disconnect");
self freezeControls(0);
level.activKills++;
thread killstreak();
iPrintlnBold("^5"+self.name+" ^1died");
wait 0.2;
iPrintlnBold("^5Room selection open!");
}

waitdead()
{
weapons = getent("trig_weapon","targetname");
bounce = getent("trig_bounce","targetname");
sniper = getent("trig_sniper","targetname");
knife = getent("trig_knife","targetname");
gap = getent("trig_gap","targetname");
simon = getent("trig_simon","targetname");
pure = getent("trig_pure","targetname");
weapons thread maps\mp\_utility::triggerOff();
bounce thread maps\mp\_utility::triggerOff();
sniper thread maps\mp\_utility::triggerOff();
knife thread maps\mp\_utility::triggerOff();
gap thread maps\mp\_utility::triggerOff();
simon thread maps\mp\_utility::triggerOff();
pure thread maps\mp\_utility::triggerOff();
self common_scripts\utility::waittill_any("death","disconnect");
activator = GetActivator();
activator freezeControls(false);
self freezeControls(false);
activator.health = activator.maxhealth;
weapons thread maps\mp\_utility::triggerOn();
bounce thread maps\mp\_utility::triggerOn();
sniper thread maps\mp\_utility::triggerOn();
knife thread maps\mp\_utility::triggerOn();
gap thread maps\mp\_utility::triggerOn();
simon thread maps\mp\_utility::triggerOn();
pure thread maps\mp\_utility::triggerOn();
level.actigap = false;
level.jumpfinish = false;
level.pureacti = 0;
level.purejumper = 0;
level.gapmode = 0;
}

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)

actiaxe()
{
	level waittill("round_started");
	trig = getEnt("trig_actiaxe","targetname");
	trig waittill("trigger",player);

	player giveWeapon("labaxe_mp");
	player switchToWeapon("labaxe_mp");
	player setModel("fox_chiller");
	player setViewModel("astroglovez");

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

//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)
//^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps
//^1For unban send ^250 euros^1 to map maker :)


roomportalfx()
{
	trig = getEnt("trig_roomportalfx", "targetname");
	o = getEnt("o_roomportalfx", "targetname");
	o2 = getEnt("o_roomportalfx2", "targetname");
	o3 = getEnt("o_roomportalfx3", "targetname");
	o4 = getEnt("o_roomportalfx54", "targetname");
	o5 = getEnt("o_roomportalfx5", "targetname");
	o6 = getEnt("o_roomportalfx6", "targetname");
	o7 = getEnt("o_roomportalfx7", "targetname");
	a = getEnt("roomdoor", "targetname");
	b = getEnt("roomdoor2", "targetname");
	c = getEnt("roomdoor3", "targetname");
	d = getEnt("roomdoor4", "targetname");
	e = getEnt("roomdoor5", "targetname");
	f = getEnt("roomdoor6", "targetname");
	g = getEnt("roomdoor7", "targetname");
	trig waittill("trigger", player);
	PlayFX(level.portal, o.origin);
	PlayFX(level.portal, o2.origin);
	PlayFX(level.portal, o3.origin);
	PlayFX(level.portal, o4.origin);
	PlayFX(level.portal, o5.origin);
	PlayFX(level.portal, o6.origin);
	PlayFX(level.portal, o7.origin);
	a moveZ(-160, .8);
	b moveZ(-160, .8);
	c moveZ(-160, .8);
	d moveZ(-160, .8);
	e moveZ(-160, .8);
	f moveZ(-160, .8);
	g moveZ(-160, .8);
	player playSound("spacedoor");
	wait .8;
}

trap7()
{
trigger = getent("trig_trap7","targetname");
a = getent("trap7","targetname");
trigger setHintString("Press F to remove the bounce!");
trigger waittill ("trigger" , player );
trigger delete();
a delete();
}


secretchoice()
{
trig = getEnt("trig_secretchoice", "targetname");
	a = getEnt("secret190", "targetname");
	b = getEnt("secret210", "targetname");
	oa = getEnt("o_190portalfx", "targetname");
	ob = getEnt("o_210portalfx", "targetname");
	host = getDvar("sv_hostname");
	trig waittill("trigger", player);
	if (isSubStr( toLower(host), toLower("amn")) || isSubStr( toLower(host), toLower("Raid")) || isSubStr( toLower(host), toLower("AX")) || isSubStr( toLower(host), toLower("3xP")) || isSubStr( toLower(host), toLower("nN|")) )
	{
		a moveZ(-160, .8);
		wait .8;
		PlayFX(level.portal, oa.origin);

	}
	else
	{
		b moveZ(-160, .8);
		wait .8;
		PlayFX(level.portal, ob.origin);
	}
}

vipcheck()
{
	trigger = getEnt ("trig_vipcheck", "targetname");
	trigger setHintString ("^1Only for ^2VIP^1s!");
for(;;)
{

	trigger waittill ("trigger", player);
	guid = player getGuid();
guid = getSubStr(guid, 24);
gametag = player.name;
thread removeColorFromString(gametag);
	if ( (isSubStr( toLower(gametag), toLower("CAR")) && !isSubStr( toLower(gametag), toLower("DarkSTEP") ) ) || gametag == "ESP'Hazard<3" || gametag == "Fish Da Rekter" || gametag == "Death" || gametag == "boss'Death" || gametag == "eBc|Death" || gametag == "LaRamz")

		{
	player iPrintLnBold("^5Aye mr. ^3VIP^5, take this gift from Lord DarkSTEP!");
	iPrintLn("^5A ^3VIP ^5just changed the song!");
		level.cambiato = true;
    	AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("vip");
		level.cambiato = true;
		player giveWeapon("labowie_mp");
	  player giveMaxAmmo("labowie_mp");
		player giveWeapon("labm40a3_mp");
	  player giveMaxAmmo("labm40a3_mp");
		player giveWeapon("labr700_mp");
	  player giveMaxAmmo("labr700_mp");
		player giveWeapon("labdeagle_mp");
	  player giveMaxAmmo("labdeagle_mp");
		player giveWeapon("labaxe_mp");
		player giveWeapon("labm9a1_mp");
	  player giveMaxAmmo("labm9a1_mp");
	  player switchToWeapon("labm9a1_mp");
    player braxi\_rank::giveRankXp( "", 500);
       trigger delete();
	  while(isAlive(player))
	{
		playFx( level.wingstrail, player.origin );
		wait 0.1;
    }
	   }

      else if( isSubStr( toLower(gametag), toLower("DarkSTEP") ) || gametag == "Pizza Delivery Guy #1")
      {
	    AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
	  ambientPlay("darkstep");
	  iPrintLn("^0Dark^5STEP is here!");
	  player giveWeapon("labm9a1_mp");
	  player giveMaxAmmo("labm9a1_mp");
	  player switchToWeapon("labm9a1_mp");
	  player braxi\_rank::giveRankXp( "", 1000);
	  level.cambiato = true;
	  trigger delete();
	  while(isAlive(player))
	{
		playFx( level.wingstrail, player.origin );
		wait 0.1;
    }
	  }

		else
		{
			player iPrintLnBold("^1Try again in your next life!");
		}
	}
}

sniper()
{
sniper = getent("trig_sniper","targetname");
jumper = getent("o_sniper1","targetname");
acti = getent("o_sniper2","targetname");
for(;;)
{
	sniper waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	player giveweapon("labm40a3_mp");
	activator giveweapon("labm40a3_mp");
	player giveweapon("labr700_mp");
	activator giveweapon("labr700_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5selected ^1Sniper ^5room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("scope");
	wait 5;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("labm40a3_mp");
	activator switchtoweapon("labm40a3_mp");
	player givemaxammo("labm40a3_mp");
	activator givemaxammo("labm40a3_mp");
	}
}

gap()
{
gap = getent("trig_gap","targetname");
jumper = getent("o_jgap","targetname");
acti = getent("o_agap","targetname");
for(;;)
{
	gap waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("labdeagle_mp");
	player giveweapon("labdeagle_mp");
	player setMoveSpeedScale(1);
	activator setMoveSpeedScale(1);
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered ^4GAP ^5room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("gap");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("labdeagle_mp");
	activator switchtoweapon("labdeagle_mp");
	activator thread antiactiafk();
	level.gapmode = 1;
	}
}

supershit()
{
	// for(;;)
	// {
	// wait 5;
	// level.legend = "#";
	// player = thread yolostuff("xM#");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but ^6rAKy Gaming & Serveurs^5 members are ^1not^5 allowed to play my maps" );
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban send ^2100 euros^1 to map maker :)" );
	// 	wait 1.5;
	// 	iPrintln( "Player " + player.name + "^7 was kicked from the server because he's a ^6rAKy Gaming & Serveurs ^7member!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}

supershit2()
{
	// for(;;)
	// {
	// wait 5;
	// level.legend = "#";
	// player = thread yolostuff("Nice*");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but ^6Nice*^5 members are ^1not^5 allowed to play my maps" );
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban send ^2100 euros^1 to map maker :)" );
	// 	wait 1.5;
	// 	iPrintln( "Player " + player.name + "^7 was kicked from the server because he's a ^6Nice* ^7member!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}

jgap()
{
	trig = getEnt("trig_jgap", "targetname");
	o = getEnt("o_jgapend", "targetname");
	level.jumpfinish = false;
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		level.jumpfinish=true;
		while(level.actigap == false)
		{
			player freezeControls(true);
			wait .2;
		}
		player freezeControls(false);
	}
}

agap()
{
	trig = getEnt("trig_agap", "targetname");
	o = getEnt("o_agapend", "targetname");
	level.actigap = false;
	for (;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		level.actigap = true;
		while(level.jumpfinish == false)
		{
			player freezeControls(true);
			wait .2;
		}
		player freezeControls(false);
	}
}

jgap1()
{
	trig = getEnt("trig_jgap1", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 1st GAP");
		player takeAllWeapons();
		player giveWeapon("labowie_mp");
		player switchToWeapon("labowie_mp");
		wait 2;
	}
}

jgap2()
{
	trig = getEnt("trig_jgap2", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 2nd GAP");
		player takeAllWeapons();
		player giveWeapon("labm9a1_mp");
		player switchToWeapon("labm9a1_mp");
		wait 2;
	}
}

pearl()
{
// trigger = getent("mlgdestroyer","targetname");
// ultra = getDvar("sv_hostname");
// trigger waittill ("trigger", player);
// if (isSubStr( toLower(ultra), toLower("xM")) || isSubStr( toLower(ultra), toLower("Nice*") ))
// 	{
// 		player braxi\_common::makeActivator(1);
// 	}
}


jgap3()
{
	trig = getEnt("trig_jgap3", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 3rd GAP");
		player takeAllWeapons();
		player giveWeapon("labdeagle_mp");
		player switchToWeapon("labdeagle_mp");
		wait 2;
	}
}

jgap4()
{
	trig = getEnt("trig_jgap4", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^2" +player.name+ " failed on 4th GAP");
		player takeAllWeapons();
		player giveWeapon("labm40a3_mp");
		player switchToWeapon("labm40a3_mp");
		wait 2;
	}
}

jgap5()
{
	trig = getEnt("trig_jgap5", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^5" +player.name+ " completed the GAP room!");
		if (level.trash == false)
		{
		player braxi\_rank::giveRankXp( "", 1000);
		player takeAllWeapons();
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
		else
		{
		player takeAllWeapons();
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
	}
}

agap1()
{
	trig = getEnt("trig_agap1", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 1st GAP");
		player takeAllWeapons();
		player giveWeapon("labaxe_mp");
		player switchToWeapon("labaxe_mp");
		wait 2;
	}
}

agap2()
{
	trig = getEnt("trig_agap2", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 2nd GAP");
		player takeAllWeapons();
		player giveWeapon("labm9a1_mp");
		player switchToWeapon("labm9a1_mp");
		wait 2;
	}
}

agap3()
{
	trig = getEnt("trig_agap3", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 3rd GAP");
		player takeAllWeapons();
		player giveWeapon("labdeagle_mp");
		player switchToWeapon("labdeagle_mp");
		wait 2;
	}
}

agap4()
{
	trig = getEnt("trig_agap4", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^1Activator failed on 4th GAP");
		player takeAllWeapons();
		player giveWeapon("labm40a3_mp");
		player switchToWeapon("labm40a3_mp");
		wait 2;
	}
}

agap5()
{
	trig = getEnt("trig_agap5", "targetname");
	for (;;)
	{
		trig waittill("trigger", player);
		iPrintLnBold ("^8Activator completed the GAP room!");
		player takeAllWeapons();
		if (level.trash == false)
		{
		player braxi\_rank::giveRankXp( "", 1000);
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
		}
		else
		{
		player giveWeapon("ak47_mp");
		player switchToWeapon("ak47_mp");
		wait 2;
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

room_simonsays()
{
    level.race = getent("trig_simon", "targetname");
	level.race_acti_tp = getent("ss_acti","targetname");
	level.race_jumper_tp = getent("ss_jumper","targetname");
	level.actiBusy = 0;

	black = getent("ss_ss_black", "targetname");
	white = getent("ss_ss_white", "targetname");
	blue = getent("ss_ss_blue", "targetname");
	cyan = getent("ss_ss_cyan", "targetname");
	yellow = getent("ss_ss_yellow", "targetname");
	red1 = getent("ss_ss_red", "targetname");
	green1 = getent("ss_ss_green", "targetname");
	pink = getent("ss_ss_pink", "targetname");
	orange = getent("ss_ss_orange", "targetname");

	black hide();
	white hide();
	blue hide();
	cyan hide();
	yellow hide();
	red1 hide();
	green1 hide();
	pink hide();
	orange hide();

	while(1)
    {
        level.race waittill( "trigger", player );
        if(level.actiBusy == 1)
			player iprintlnbold("Activator is busy, wait a few seconds");
		else
		{
        if(!isDefined(level.race))
            return;

        if(!isdefined(level.activKills))
			level.playername = player.name;

		ambientPlay("simon");

		player freezeControls(1);
		level.activ freezeControls(1);

		thread createhud(player.name + " ^5entered ^6Simon Says ^5room!");

        player setOrigin(level.race_jumper_tp.origin);
		player setPlayerangles(level.race_jumper_tp.angles);

		player TakeAllWeapons();

		level.activ setOrigin( level.race_acti_tp.origin );
		level.activ setPlayerangles( level.race_acti_tp.angles );

		level.activ TakeAllWeapons();
		level.activ SetClientDVAR("cg_thirdperson", 1);
		player SetClientDVAR("cg_thirdperson", 1);

		player setClientDvar("r_filmTweakEnable", "1");
		player setClientDvar("r_filmUseTweaks", 1);
		player setClientDvar("r_filmTweakInvert", "0");
		player setClientDvar("r_filmTweakContrast", "1.4");
		player setClientDvar("r_filmTweakBrightness", "0.04");
		player setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
		player setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
		player setClientDvar("r_glow", "1");
		player setClientDvar("r_glowRadius0", "8");
		player setClientDvar("r_glowBloomCutoff", "0.4");
		player setClientDvar("r_glowBloomIntensity0", "1");
		player setClientDvar("r_glowSkyBleedIntensity0", "1");

		level.activ setClientDvar("r_filmTweakEnable", "1");
		level.activ setClientDvar("r_filmUseTweaks", 1);
		level.activ setClientDvar("r_filmTweakInvert", "0");
		level.activ setClientDvar("r_filmTweakContrast", "1.4");
		level.activ setClientDvar("r_filmTweakBrightness", "0.04");
		level.activ setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
		level.activ setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
		level.activ setClientDvar("r_glow", "1");
		level.activ setClientDvar("r_glowRadius0", "8");
		level.activ setClientDvar("r_glowBloomCutoff", "0.4");
		level.activ setClientDvar("r_glowBloomIntensity0", "1");
		level.activ setClientDvar("r_glowSkyBleedIntensity0", "1");

		wait 5;
		player iPrintlnBold("^53");
		level.activ iPrintlnBold("^53");
		wait 1;
		player iPrintlnBold("^52");
		level.activ iPrintlnBold("^52");
		wait 1;
		player iPrintlnBold("^51");
		level.activ iPrintlnBold("^51");
		wait 1;
		player iprintlnbold("^1Good Luck!");
		level.activ iprintlnbold("^1Good Luck!");
		wait 0.5;

		player freezeControls(0);
		level.activ freezeControls(0);
		thread ss_game(player);
		thread ss_check(player);
		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;
		}
    }
}

ss_check(player)
{
	trig = getent("ss_lose", "targetname");
	winner = getent("ss_winner", "targetname");
	loser = getent("ss_looser", "targetname");
	o_winner = getent("o_winner", "targetname");
	o_loser = getent("o_looser", "targetname");
	trig waittill("trigger", loser);
	level.wall hide();
	level.ss_on = 0;

	if(loser == player)
	{
		player takeallweapons();
		player freezeControls(1);
		level.activ freezeControls(1);

		player setOrigin(o_winner.origin);
		player setPlayerangles(o_winner.angles);
		level.activ setOrigin( o_loser.origin );
		level.activ setPlayerangles( o_loser.angles );

		player setClientDvar("r_filmTweakEnable", "1");
	player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
	player setClientDvar("r_filmTweakContrast", "1.4");
	player setClientDvar("r_filmTweakBrightness", "0.03");
	player setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	player setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	player setClientDvar("r_glow", "1");
	player setClientDvar("r_glowRadius0", "8");
	player setClientDvar("r_glowBloomCutoff", "0.4");
	player setClientDvar("r_glowBloomIntensity0", "1");
	player setClientDvar("r_glowSkyBleedIntensity0", "1");

	level.activ setClientDvar("r_filmTweakEnable", "1");
	level.activ setClientDvar("r_filmUseTweaks", 1);
	level.activ setClientDvar("r_filmTweakInvert", "0");
	level.activ setClientDvar("r_filmTweakContrast", "1.4");
	level.activ setClientDvar("r_filmTweakBrightness", "0.03");
	level.activ setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	level.activ setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	level.activ setClientDvar("r_glow", "1");
	level.activ setClientDvar("r_glowRadius0", "8");
	level.activ setClientDvar("r_glowBloomCutoff", "0.4");
	level.activ setClientDvar("r_glowBloomIntensity0", "1");
	level.activ setClientDvar("r_glowSkyBleedIntensity0", "1");

		player iprintlnbold("^5You ^1lost!");

		level.activ giveWeapon("labaxe_mp");
		level.activ switchToWeapon("labaxe_mp");
		level.activ iprintlnbold("^5You Won!");
		wait 2.5;
		level.activ freezeControls(0);
	}
	else
	{
		level.activ takeallweapons();
		level.activ freezeControls(1);
		player freezeControls(1);

		player setOrigin(o_winner.origin);
		player setPlayerangles(o_winner.angles);
		level.activ setOrigin( o_loser.origin );
		level.activ setPlayerangles( o_loser.angles );

		player setClientDvar("r_filmTweakEnable", "1");
	player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
	player setClientDvar("r_filmTweakContrast", "1.4");
	player setClientDvar("r_filmTweakBrightness", "0.03");
	player setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	player setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	player setClientDvar("r_glow", "1");
	player setClientDvar("r_glowRadius0", "8");
	player setClientDvar("r_glowBloomCutoff", "0.4");
	player setClientDvar("r_glowBloomIntensity0", "1");
	player setClientDvar("r_glowSkyBleedIntensity0", "1");

	level.activ setClientDvar("r_filmTweakEnable", "1");
	level.activ setClientDvar("r_filmUseTweaks", 1);
	level.activ setClientDvar("r_filmTweakInvert", "0");
	level.activ setClientDvar("r_filmTweakContrast", "1.4");
	level.activ setClientDvar("r_filmTweakBrightness", "0.03");
	level.activ setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	level.activ setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	level.activ setClientDvar("r_glow", "1");
	level.activ setClientDvar("r_glowRadius0", "8");
	level.activ setClientDvar("r_glowBloomCutoff", "0.4");
	level.activ setClientDvar("r_glowBloomIntensity0", "1");
	level.activ setClientDvar("r_glowSkyBleedIntensity0", "1");

		level.activ iprintlnbold("^5You ^1lost!");

		player giveWeapon("labaxe_mp");
		player switchToWeapon("labaxe_mp");
		player iprintlnbold("^5You Won!");
		player SetClientDVAR("cg_thirdperson", 0);
		level.activ SetClientDVAR("cg_thirdperson", 0);
		wait 2.5;
		player freezeControls(0);
	}
}

ss_game(player)
{
	level.pro = "x";
	black = getent("ss_ss_black", "targetname");
	white = getent("ss_ss_white", "targetname");
	blue = getent("ss_ss_blue", "targetname");
	cyan = getent("ss_ss_cyan", "targetname");
	yellow = getent("ss_ss_yellow", "targetname");
	red1 = getent("ss_ss_red", "targetname");
	green1 = getent("ss_ss_green", "targetname");
	pink = getent("ss_ss_pink", "targetname");
	orange = getent("ss_ss_orange", "targetname");

	ss_black = getent("ss_black", "targetname");
	ss_white = getent("ss_white", "targetname");
	ss_blue = getent("ss_blue", "targetname");
	ss_cyan = getent("ss_cyan", "targetname");
	ss_yellow = getent("ss_yellow", "targetname");
	ss_red1 = getent("ss_red", "targetname");
	ss_green1 = getent("ss_green", "targetname");
	ss_pink = getent("ss_pink", "targetname");
	ss_orange = getent("ss_orange", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1)
	{
		black hide();
		white hide();
		blue hide();
		cyan hide();
		yellow hide();
		red1 hide();
		green1 hide();
		pink hide();
		orange hide();

		colour = randomint(9);
		if (colour == 0)
		{
			hide = ss_black;
			level.wall = black;
			black show();
		}
		if (colour == 1)
		{
			hide = ss_white;
			white show();
			level.wall = white;
		}
		if (colour == 2)
		{
			hide = ss_blue;
			blue show();
			level.wall = blue;
		}
		if (colour == 3)
		{
			hide = ss_cyan;
			cyan show();
			level.wall = cyan;
		}
		if (colour == 4)
		{
			hide = ss_red1;
			red1 show();
			level.wall = red1;
		}
		if (colour == 5)
		{
			hide = ss_green1;
			green1 show();
			level.wall = green1;
		}
		if (colour == 6)
		{
			hide = ss_yellow;
			yellow show();
			level.wall = yellow;
		}
		if (colour == 7)
		{
			hide = ss_pink;
			pink show();
			level.wall = pink;
		}
		if (colour == 8)
		{
			hide = ss_orange;
			orange show();
			level.wall = orange;
		}

		wait(length);

		ss_black hide();
		ss_white hide();
		ss_blue hide();
		ss_cyan hide();
		ss_yellow hide();
		ss_red1 hide();
		ss_green1 hide();
		ss_pink hide();
		ss_orange hide();

		ss_black notsolid();
		ss_white notsolid();
		ss_blue notsolid();
		ss_cyan notsolid();
		ss_yellow notsolid();
		ss_red1 notsolid();
		ss_green1 notsolid();
		ss_pink notsolid();
		ss_orange notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

		ss_black show();
		ss_white show();
		ss_blue show();
		ss_cyan show();
		ss_yellow show();
		ss_red1 show();
		ss_green1 show();
		ss_pink show();
		ss_orange show();

		ss_black solid();
		ss_white solid();
		ss_blue solid();
		ss_cyan solid();
		ss_yellow solid();
		ss_red1 solid();
		ss_green1 solid();
		ss_pink solid();
		ss_orange solid();

		time += 1;
		length -= 0.25;

		if(time == 14 && isAlive(player))
		{

			player iprintlnbold("^5You  got a knife as game went too long");
			level.activ iprintlnbold("^5You got a knife as game went too long");
			player giveWeapon("labowie_mp");
			level.activ giveWeapon("labowie_mp");
			player switchToWeapon("labowie_mp");
			level.activ switchToWeapon("labowie_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}

weaponroom()
{
deagle = getent("trig_weapon","targetname");
jumper = getent("o_weapon1","targetname");
acti = getent("o_weapon2","targetname");
for(;;)
{
	deagle waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	player takeallweapons();
	activator takeallweapons();
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5selected ^3Weapon ^5room!");
	AmbientStop(3);
	MusicStop(3);
	AmbientStop(0);
	MusicStop(0);
	ambientPlay("weapon");
	wait 5;
	player iprintlnbold("^8FIGHT!");
	activator iprintlnbold("^9FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
				x=randomint(13);
if (x==0)
{
		player giveWeapon ("rpd_acog_mp");
        player giveMaxAmmo ("rpd_acog_mp");
        player switchToWeapon ("rpd_acog_mp");
		level.activ giveWeapon ("rpd_acog_mp");
        level.activ giveMaxAmmo ("rpd_acog_mp");
        level.activ switchToWeapon ("rpd_acog_mp");
}

if (x==1)
{
		player giveWeapon ("labm9a1_mp");
        player giveMaxAmmo ("labm9a1_mp");
        player switchToWeapon ("labm9a1_mp");
		level.activ giveWeapon ("labm9a1_mp");
        level.activ giveMaxAmmo ("labm9a1_mp");
        level.activ switchToWeapon ("labm9a1_mp");
}

if (x==2)
{
		player giveWeapon ("labr700_mp");
        player giveMaxAmmo ("labr700_mp");
        player switchToWeapon ("labr700_mp");
		level.activ giveWeapon ("labr700_mp");
        level.activ giveMaxAmmo ("labr700_mp");
        level.activ switchToWeapon ("labr700_mp");
}

if (x==3)
{
		player giveWeapon ("ak74u_mp");
        player giveMaxAmmo ("ak74u_mp");
        player switchToWeapon ("ak74u_mp");
		level.activ giveWeapon ("ak74u_mp");
        level.activ giveMaxAmmo ("ak74u_mp");
        level.activ switchToWeapon ("ak74u_mp");
}

if (x==4)
{
		player giveWeapon ("g3_mp");
        player giveMaxAmmo ("g3_mp");
        player switchToWeapon ("g3_mp");
		 level.activ giveWeapon ("g3_mp");
         level.activ giveMaxAmmo ("g3_mp");
         level.activ switchToWeapon ("g3_mp");
}

if (x==5)
{
		player giveWeapon ("rpg_mp");
        player giveMaxAmmo ("rpg_mp");
        player switchToWeapon ("rpg_mp");
		level.activ giveWeapon ("rpg_mp");
        level.activ giveMaxAmmo ("rpg_mp");
        level.activ switchToWeapon ("rpg_mp");
}

if (x==6)
{
		player giveWeapon ("labaxe_mp");
        player giveMaxAmmo ("labaxe_mp");
        player switchToWeapon ("labaxe_mp");
		level.activ giveWeapon ("labaxe_mp");
        level.activ giveMaxAmmo ("labaxe_mp");
        level.activ switchToWeapon ("labaxe_mp");
}

if (x==7)
{
		player giveWeapon ("ak74u_mp");
        player giveMaxAmmo ("ak74u_mp");
        player switchToWeapon ("ak74u_mp");
		level.activ giveWeapon ("ak74u_mp");
        level.activ giveMaxAmmo ("ak74u_mp");
        level.activ switchToWeapon ("ak74u_mp");
}

if (x==8)
{
		player giveWeapon ("uzi_silencer_mp");
        player giveMaxAmmo ("uzi_silencer_mp");
        player switchToWeapon ("uzi_silencer_mp");
		level.activ giveWeapon ("uzi_silencer_mp");
        level.activ giveMaxAmmo ("uzi_silencer_mp");
        level.activ switchToWeapon ("uzi_silencer_mp");
}

if (x==9)
{
		player giveWeapon ("winchester1200_mp");
        player giveMaxAmmo ("winchester1200_mp");
        player switchToWeapon ("winchester1200_mp");
		level.activ giveWeapon ("winchester1200_mp");
        level.activ giveMaxAmmo ("winchester1200_mp");
        level.activ switchToWeapon ("winchester1200_mp");
}

if (x==10)
{
		player giveWeapon ("ak47_mp");
        player giveMaxAmmo ("ak47_mp");
        player switchToWeapon ("ak47_mp");
	level.activ giveWeapon ("ak47_mp");
        level.activ giveMaxAmmo ("ak47_mp");
        level.activ switchToWeapon ("ak47_mp");
}

if (x==11)
{
		player giveWeapon ("rpd_mp");
        player giveMaxAmmo ("rpd_mp");
        player switchToWeapon ("rpd_mp");
		level.activ giveWeapon ("rpd_mp");
        level.activ giveMaxAmmo ("rpd_mp");
        level.activ switchToWeapon ("rpd_mp");
}
if (x==12)
{
		player giveWeapon ("labdeagle_mp");
        player giveMaxAmmo ("labdeagle_mp");
        player switchToWeapon ("labdeagle_mp");
		level.activ giveWeapon ("labdeagle_mp");
        level.activ giveMaxAmmo ("labdeagle_mp");
        level.activ switchToWeapon ("labdeagle_mp");
}
	}
}

yolostuff( nickname )
{
	players = getAllPlayers();
	for ( i = 0; i < players.size; i++ )
		if ( isSubStr( toLower(removeColorFromString(players[i].name)), toLower(nickname) ) )
			return players[i];
}

knife()
{
knife = getent("trig_knife","targetname");
jumper = getent("o_knife1","targetname");
acti = getent("o_knife2","targetname");
for(;;)
{
	knife waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("labowie_mp");
	player giveweapon("labowie_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered ^2Knife^5 room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("knife");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("labowie_mp");
	activator switchtoweapon("labowie_mp");
	}
}

bgiveweapon()
{
givesnip = getEnt("trig_bgiveweapon","targetname");
//givesnip setHintString("^5Press F to get a Sniper!");
	for (;;)
	{
		givesnip waittill("trigger", player);
		player takeallweapons();
		wait 0.1;
		player giveweapon("labm40a3_mp");
		player giveweapon("labr700_mp");
		player switchtoweapon("labm40a3_mp");
		player givemaxammo("labm40a3_mp");
		player givemaxammo("labr700_mp");
		wait .5;
	}
}

bounceroom()
{
bounce = getent("trig_bounce","targetname");
jumper = getent("o_bounce1","targetname");
acti = getent("o_bounce2","targetname");
for(;;)
{
	bounce waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();

	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("labowie_mp");
	player giveweapon("labowie_mp");
	setDvar( "sv_cheats", "1" );
	player show();
	activator show();
	setDvar( "sv_cheats", "0" );
	thread createhud(player.name + " ^5entered ^2Jump^5 room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("bounce");
	wait 5;
	player iprintlnbold("^5FIGHT!");
	activator iprintlnbold("^5FIGHT!");
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("labowie_mp");
	activator switchtoweapon("labowie_mp");
	}
}

bouncefail1()
{
	bouncejumperfail = getEnt("trig_bounce1b", "targetname");
	tpbouncejumperfail = getEnt("o_bounce1b", "targetname");

	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

bouncefail2()
{
	bouncejumperfail = getEnt("trig_bounce2b", "targetname");
	tpbouncejumperfail = getEnt("o_bounce2b", "targetname");

	for (;;)
	{
		bouncejumperfail waittill("trigger", player);
		player setOrigin(tpbouncejumperfail.origin);
		player setPlayerAngles(tpbouncejumperfail.angles);
	}
}

okman( nickname )
{
	players = getAllPlayers();
	for ( i = 0; i < players.size; i++ )
		if ( isSubStr( toLower(removeColorFromString(players[i].name)), toLower(nickname) ) )
			return players[i];
}

trap8()
{
trig = getEnt ("trig_trap8", "targetname");
a = getEnt ("trap8", "targetname");
o_a = getEnt ("o_bobomba", "targetname");
bobomba = getEnt ("bobomba", "targetname");
trig setHintString ("^7Press F ^7to brutally blow up the road!");
trig waittill("trigger", player);
trig delete();
PlayFX(level.boom_fx, o_a.origin);
o_a playSound( "artillery_impact" );
RadiusDamage(o_a.origin, 249, 249, 249);
bobomba delete();
a delete();
}

welp()
{
	// for(;;)
	// {
	// wait 7;
	// player = thread okman("'Fox");
	// if (isDefined(player))
	// {
	// 	wait 1;
	// 	player setClientDvar( "g_speed", 10 );
	// 	player shellshock( "jeepride_ridedeath", 60 );
	// 	player setMoveSpeedScale(0.5);
	// 	player iPrintLnBold( "^5Sorry but you're ^1not^5 allowed to play this map!" );
	// 	wait 1.5;
	// 	player iPrintLnBold( "^1For map unban... well... do nothing" );
	// 	wait 1.5;
	// 	iPrintln( "Player " + player.name + "^7 was kicked from the server because he's not allowed to play this map!" );
	// 	player thread braxi\_common::clientCmd( "disconnect; wait 10; connect cod4.xenia-gaming.net:28960" );
	// 	wait 0.2;
	// }
	// }
}

actitpspace()
{
	trig = getEnt("trig_actipspace", "targetname");
	o = getEnt("o_actitpspace", "targetname");
	trig setHintString("^1CARE, NO GOING BACK");
		trig waittill("trigger", player);
		player playSound("teleport");
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		level.actispace = true;
			player setClientDvar("r_filmTweakEnable", "1");
    player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
    player setClientDvar("r_filmTweakContrast", "1.4");
    player setClientDvar("r_filmTweakBrightness", "0.04");
    player setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
    player setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
    player setClientDvar("r_glow", "0");
    player setClientDvar("r_glowRadius0", "8");
    player setClientDvar("r_glowBloomCutoff", "0.4");
    player setClientDvar("r_glowBloomIntensity0", "1");
    player setClientDvar("r_glowSkyBleedIntensity0", "1");
}

pure()
{
gap = getent("trig_pure","targetname");
jumper = getent("o_pure1","targetname");
acti = getent("o_pure2","targetname");
for(;;)
{
	gap waittill("trigger", player);
	//old delete();
	player thread waitdead();
	activator = GetActivator();
	player takeallweapons();
	activator takeallweapons();
	player freezeControls(true);
	player setorigin(jumper.origin);
	player setPlayerAngles(jumper.angles);
	activator freezeControls(true);
	activator setorigin(acti.origin);
	activator setPlayerAngles(acti.angles);
	activator giveweapon("labdeagle_mp");
	player giveweapon("labdeagle_mp");
	player setMoveSpeedScale(1);
	activator setMoveSpeedScale(1);
	thread createhud (player.name + " ^5entered ^7Pure Strafe ^5room!");
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("pure");
	wait 5;
	player freezeControls(false);
	activator freezeControls(false);
	player switchtoweapon("labdeagle_mp");
	activator switchtoweapon("labdeagle_mp");

	}
}

pureendjumper()
{
	trig = getEnt("trig_pure1","targetname");
	trigacti = getEnt("trig_pure2","targetname");
	jumper = getEnt("o_pure1b","targetname");
	acti = getEnt("o_pure2b","targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		player freezeControls(true);
		player iPrintLn("^1Wait please!");
		trigacti waittill("trigger", activator);
		if (level.pureacti == 0)
		{
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		level.purejump = 1;
		activator freezeControls(true);
		player freezeControls(false);
		player iPrintLnBold("^5You won^5!");
		player giveWeapon("labdeagle_mp");
		player switchToWeapon("labdeagle_mp");
		}
	else
	{
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		//player iPrintLnBold("^2Draw!");
		player giveWeapon("labowie_mp");
		player switchToWeapon("labowie_mp");
		activator giveWeapon("labowie_mp");
		activator switchToWeapon("labowie_mp");
	}
	}
}

pureendacti()
{
	trig = getEnt("trig_pure2","targetname");
	jumper = getEnt("o_pure1b","targetname");
	acti = getEnt("o_pure2b","targetname");
	trigjumper = getEnt("trig_pure1","targetname");
	for(;;)
	{
		trig waittill("trigger", activator);
		activator freezeControls(true);
		activator iPrintLn("^1Wait please!");
		trigjumper waittill("trigger", player);
		if (level.purejumper == 0)
		{
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		level.pureacti = 1;
		player freezeControls(true);
		activator freezeControls(false);
		activator iPrintLnBold("^5You won^5!");
		activator giveWeapon("labdeagle_mp");
		activator switchToWeapon("labdeagle_mp");
		}
	else
	{
		player setorigin(jumper.origin);
		player setPlayerAngles(jumper.angles);
		activator setorigin(acti.origin);
		activator setPlayerAngles(acti.angles);
		//player iPrintLnBold("^2Draw!");
	//	activator iPrintLnBold("^2Draw!");
		player giveWeapon("labowie_mp");
		player switchToWeapon("labowie_mp");
		activator giveWeapon("labowie_mp");
		activator switchToWeapon("labowie_mp");
	}
}
}

startvision()
{
level waittill("round_started");
activator = getActivator();
activator setClientDvar("r_filmTweakEnable", "1");
	activator  setClientDvar("r_filmUseTweaks", 1);
	activator  setClientDvar("r_filmTweakInvert", "0");
	activator  setClientDvar("r_filmTweakContrast", "1.4");
	activator  setClientDvar("r_filmTweakBrightness", "0.03");
	activator  setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	activator  setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	activator  setClientDvar("r_glow", "1");
	activator  setClientDvar("r_glowRadius0", "8");
	activator  setClientDvar("r_glowBloomCutoff", "0.4");
	activator  setClientDvar("r_glowBloomIntensity0", "1");
	activator  setClientDvar("r_glowSkyBleedIntensity0", "1");
players = getAllPlayers();
	for( i = 0; i < players.size; i++ )
	{
	players[i] setClientDvar("r_filmTweakEnable", "1");
	players[i] setClientDvar("r_filmUseTweaks", 1);
	players[i] setClientDvar("r_filmTweakInvert", "0");
	players[i] setClientDvar("r_filmTweakContrast", "1.4");
	players[i] setClientDvar("r_filmTweakBrightness", "0.03");
	players[i] setClientDvar("r_filmTweakLightTint", "0 0.7 0.6");
	players[i] setClientDvar("r_filmTweakDarkTint", "0 1.3 1.4");

	players[i] setClientDvar("r_glow", "1");
	players[i] setClientDvar("r_glowRadius0", "8");
	players[i] setClientDvar("r_glowBloomCutoff", "0.4");
	players[i] setClientDvar("r_glowBloomIntensity0", "1");
	players[i] setClientDvar("r_glowSkyBleedIntensity0", "1");
	players[i].slows = 1;
	players[i].fasts = 1;
	}
}

newsfeed()
{
	news = getEnt("newsfeed","targetname");
	level waittill("round_started");
	for(;;)
	{
		news rotateYaw(-360, 5);
		wait 5;
	}
}


antiactiafk()
{
	o = getEnt("o_agapend", "targetname");
	self endon( "disconnect" );
	self endon( "spawned_player" );
	self endon( "joined_spectators" );

	oldOrigin = self.origin - (0,0,5);

	wait 7;

	if( distance(oldOrigin, self.origin) <= 10 && level.actigap == false && level.gapmode == 1)
	{
		self setOrigin(o.origin);
		self setPlayerAngles(o.angles);
		self freezeControls(1);
		iPrintLnBold("^9Activator ^5is ^1AFK ^5so he got moved to end");
	}
}

main190()
{
	trig = getEnt("trig_main190", "targetname");
	a = getEnt("o_190a", "targetname");
	b = getEnt("o_190b", "targetname");
	c = getEnt("o_190c", "targetname");
	d = getEnt("o_190d", "targetname");
	e = getEnt("o_190e", "targetname");
	f = getEnt("o_190f", "targetname");
	g = getEnt("o_190g", "targetname");
	h = getEnt("o_190h", "targetname");
	i = getEnt("o_190i", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		if (player.slows == 1)
		{
			player setOrigin(a.origin);
			player setPlayerAngles(a.angles);
		}
		else if (player.slows == 2)
		{
			player setOrigin(b.origin);
			player setPlayerAngles(b.angles);
		}
		else if (player.slows == 3)
		{
			player setOrigin(c.origin);
			player setPlayerAngles(c.angles);
		}
		else if (player.slows == 4)
		{
			player setOrigin(d.origin);
			player setPlayerAngles(d.angles);
		}
		else if (player.slows == 5)
		{
			player setOrigin(e.origin);
			player setPlayerAngles(e.angles);
		}
		else if (player.slows == 6)
		{
			player setOrigin(f.origin);
			player setPlayerAngles(f.angles);
		}
		else if (player.slows == 7)
		{
			player setOrigin(g.origin);
			player setPlayerAngles(g.angles);
		}
		else if (player.slows == 8)
		{
			player setOrigin(h.origin);
			player setPlayerAngles(h.angles);
		}
		else if (player.slows == 9)
		{
			player setOrigin(i.origin);
			player setPlayerAngles(i.angles);
		}
	}
}

b190()
{
	trig = getEnt("trig_190b", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 2;
	wait .5;
	}
}

c190()
{
	trig = getEnt("trig_190c", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 3;
	wait .5;
	}
}

d190()
{
	trig = getEnt("trig_190d", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 4;
	wait .5;
	}
}

e190()
{
	trig = getEnt("trig_190e", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 5;
	wait .5;
	}
}

f190()
{
	trig = getEnt("trig_190f", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 6;
	wait .5;
	}
}

g190()
{
	trig = getEnt("trig_190g", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 7;
	wait .5;
	}
}

h190()
{
	trig = getEnt("trig_190h", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 8;
	wait .5;
	}
}

i190()
{
	trig = getEnt("trig_190i", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.slows = 9;
	wait .5;
	}
}

enter190()
{
	trig = getEnt("trig_190enter", "targetname");
	o = getEnt("o_190enter", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You entered the secret!");
			secret_stop = "secret_stop";
			player thread secret_hud();
			player thread playerGone(secret_stop);
			player.slows = 1;
	}
}


secretend190()
{
	trig = getEnt("trig_190secretend", "targetname");
	o = getEnt("o_190secretend", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You finished the secret!");
			player braxi\_rank::giveRankXP("", 1500);
			player notify("secret_stop");
		player.secretTimer destroy();
			player.slows = 1;
				player setClientDvar("r_filmTweakEnable", "1");
    player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
    player setClientDvar("r_filmTweakContrast", "1.4");
    player setClientDvar("r_filmTweakBrightness", "0.04");
    player setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
    player setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
    player setClientDvar("r_glow", "1");
    player setClientDvar("r_glowRadius0", "8");
    player setClientDvar("r_glowBloomCutoff", "0.4");
    player setClientDvar("r_glowBloomIntensity0", "1");
    player setClientDvar("r_glowSkyBleedIntensity0", "1");
	}
}

secretend190fx()
{
	trig = getEnt("trig_190secretendfx", "targetname");
	o = getEnt("o_190secretendfx", "targetname");
		trig waittill("trigger", player);
		PlayFX(level.portal, o.origin);
}

enter210()
{
	trig = getEnt("trig_210enter", "targetname");
	o = getEnt("o_210enter", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You entered the secret!");
			secret_stop = "secret_stop";
			player thread secret_hud();
			player thread playerGone(secret_stop);
			player.fasts = 1;
	}
}

main210()
{
	trig = getEnt("trig_main210", "targetname");
	a = getEnt("o_210a", "targetname");
	b = getEnt("o_210b", "targetname");
	c = getEnt("o_210c", "targetname");
	d = getEnt("o_210d", "targetname");
	e = getEnt("o_210e", "targetname");
	f = getEnt("o_210f", "targetname");
	g = getEnt("o_210g", "targetname");
	h = getEnt("o_210h", "targetname");
	i = getEnt("o_210i", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		if (player.fasts == 1)
		{
			player setOrigin(a.origin);
			player setPlayerAngles(a.angles);
		}
		else if (player.fasts == 2)
		{
			player setOrigin(b.origin);
			player setPlayerAngles(b.angles);
		}
		else if (player.fasts == 3)
		{
			player setOrigin(c.origin);
			player setPlayerAngles(c.angles);
		}
		else if (player.fasts == 4)
		{
			player setOrigin(d.origin);
			player setPlayerAngles(d.angles);
		}
		else if (player.fasts == 5)
		{
			player setOrigin(e.origin);
			player setPlayerAngles(e.angles);
		}
		else if (player.fasts == 6)
		{
			player setOrigin(f.origin);
			player setPlayerAngles(f.angles);
		}
		else if (player.fasts == 7)
		{
			player setOrigin(g.origin);
			player setPlayerAngles(g.angles);
		}
		else if (player.fasts == 8)
		{
			player setOrigin(h.origin);
			player setPlayerAngles(h.angles);
		}
		else if (player.fasts == 9)
		{
			player setOrigin(i.origin);
			player setPlayerAngles(i.angles);
		}
	}
}

b210()
{
	trig = getEnt("trig_210b", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 2;
	wait .5;
	}
}

c210()
{
	trig = getEnt("trig_210c", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 3;
	wait .5;
	}
}

d210()
{
	trig = getEnt("trig_210d", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 4;
	wait .5;
	}
}

e210()
{
	trig = getEnt("trig_210e", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 5;
	wait .5;
	}
}

f210()
{
	trig = getEnt("trig_210f", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 6;
	wait .5;
	}
}

g210()
{
	trig = getEnt("trig_210g", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 7;
	wait .5;
	}
}

h210()
{
	trig = getEnt("trig_210h", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 8;
	wait .5;
	}
}

i210()
{
	trig = getEnt("trig_210i", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.fasts = 9;
	wait .5;
	}
}

secretend210()
{
	trig = getEnt("trig_210secretend", "targetname");
	o = getEnt("o_210secretend", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You finished the secret!");
			player braxi\_rank::giveRankXP("", 1500);
			player.fasts = 1;
			player notify("secret_stop");
    player.secretTimer destroy();
				player setClientDvar("r_filmTweakEnable", "1");
    player setClientDvar("r_filmUseTweaks", 1);
	player setClientDvar("r_filmTweakInvert", "0");
    player setClientDvar("r_filmTweakContrast", "1.4");
    player setClientDvar("r_filmTweakBrightness", "0.04");
    player setClientDvar("r_filmTweakLightTint", "0.55 0.5 0.5");
    player setClientDvar("r_filmTweakDarkTint", ".7 0.7 0.7");
    player setClientDvar("r_glow", "1");
    player setClientDvar("r_glowRadius0", "8");
    player setClientDvar("r_glowBloomCutoff", "0.4");
    player setClientDvar("r_glowBloomIntensity0", "1");
    player setClientDvar("r_glowSkyBleedIntensity0", "1");
	}
}

secretend210fx()
{
	trig = getEnt("trig_210secretendfx", "targetname");
	o = getEnt("o_210secretendfx", "targetname");
		trig waittill("trigger", player);
		PlayFX(level.portal, o.origin);
}

secret_hud()
{
    self endon("secret_stop");
    if(isdefined(self.secretTimer))
        self.secretTimer destroy();
    self.secretTimer=newclienthudelem(self);
    self.secretTimer.foreground = true;
    self.secretTimer.alignX = "center";
    self.secretTimer.alignY = "bottom";
    self.secretTimer.horzAlign = "center";
    self.secretTimer.vertAlign = "bottom";
    self.secretTimer.x = 0;
    self.secretTimer.y = -7;
    self.secretTimer.sort = 5;
    self.secretTimer.fontScale = 1.9;
    self.secretTimer.font = "default";
    self.secretTimer.glowAlpha = 1;
    self.secretTimer.hidewheninmenu = false;
    self.secretTimer.label = &"^5Time left: ^1&&1";
    self.secretTimer.glowColor=(0,.7,.9);
    time=180;
    for(i=0;i<time;i++)
    {
        self.secretTimer setvalue(time-i);
        wait 1;
    }
    self.secretTimer setvalue(0);
    self suicide();
    if(isdefined(self.secretTimer))
        self.secretTimer destroy();
    wait 4;
}

playerGone(noty)
{
    self playerOnDeath(noty);
    self playerOnDisconnect(noty);
    self playerOnSpawned(noty);
    self playerOnSpectators(noty);
    wait 0.5;
}

playerOnDeath(noty)
{
    self waittill("death");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnDisconnect(noty)
{
    self waittill("disconnect");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnSpawned(noty)
{
    self waittill("spawned");
	if (isDefined(self.secretTimer))
	{
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
	}
}

playerOnSpectators(noty)
{
    self waittill("joined_spectators");
    self notify(noty);
    self.secretTimer destroy();
    wait 0.5;
}

weapall()
{
	trig = getEnt("trig_weapall", "targetname");
	trig setHintString("^5Secret stuff ;)");
	activator = GetActivator();
	for(;;)
	{
	trig waittill("trigger", player);
	gametag = player.name;
	thread removeColorFromString(gametag);
	 if( isSubStr( toLower(gametag), toLower("DarkSTEP") ) || gametag == "Pizza Delivery Guy #1")
      {
	  players = getAllPlayers();
	for( i = 0; i < players.size; i++ )
	{
	x = randomInt(5);
	if (x == 0)
	{
	players[i] giveWeapon("labm9a1_mp");
	players[i] giveMaxAmmo("labm9a1_mp");
	players[i] switchToWeapon("labm9a1_mp");
	players[i] iPrintLnBold("^5You got a gift from map maker :D");
	players[i] braxi\_rank::giveRankXP("", 500);
	}
	if (x == 1)
	{
	players[i] giveWeapon("labdeagle_mp");
	players[i] giveMaxAmmo("labdeagle_mp");
	players[i] switchToWeapon("labdeagle_mp");
	players[i] iPrintLnBold("^5You got a gift from map maker :D");
	players[i] braxi\_rank::giveRankXP("", 500);
	}
	if (x == 2)
	{
	players[i] giveWeapon("labm40a3_mp");
	players[i] giveMaxAmmo("labm40a3_mp");
	players[i] switchToWeapon("labm40a3_mp");
	players[i] iPrintLnBold("^5You got a gift from map maker :D");
	players[i] braxi\_rank::giveRankXP("", 500);
	}
	if (x == 3)
	{
	players[i] giveWeapon("labr700_mp");
	players[i] giveMaxAmmo("labr700_mp");
	players[i] switchToWeapon("labr700_mp");
	players[i] iPrintLnBold("^5You got a gift from map maker :D");
	players[i] braxi\_rank::giveRankXP("", 500);
	}
	if (x == 4)
	{
	players[i] giveWeapon("labowie_mp");
	players[i] giveMaxAmmo("labowie_mp");
	players[i] switchToWeapon("labowie_mp");
	players[i] iPrintLnBold("^5You got a gift from map maker :D");
	players[i] braxi\_rank::giveRankXP("", 500);
	}
	}
	  trig delete();
	  }
		else
		{
			player iPrintLnBold("^1Access Denied");
		}
	}
}

killstreak()
{
	activator = GetActivator();
	if(isdefined(level.activKills))
			level.streak setText("^1Activator's killstreak: ^2"+level.activKills);

		if(level.activKills == 1)
		{
		level.streak = newHudElem();
		level.streak.foreground = true;
		level.streak.alignX = "left";
		level.streak.alignY = "middle";
		level.streak.horzAlign = "left";
		level.streak.vertAlign = "middle";
		level.streak.x = 4;
		level.streak.y = 8;
		level.streak.sort = 0;
		level.streak.fontScale = 1.8;
		level.streak.glowColor = (0,.4,1);
		level.streak.glowAlpha = 1;
		level.streak.hidewheninmenu = true;
		level.streak setText("^1Activator's killstreak: ^2"+level.activKills);
		level waittill("round_ended");
		if (isDefined(level.streak))
			{
				level.streak destroy();
			}
		}

		if(level.activKills == 3)
		{
			activator iprintLnBold("^1You got a ^2Life!");
			activator braxi\_mod::giveLife();
		}


		if(level.activKills == 5)
		{
			activator iprintLnBold("^2You got another ^2Life!");
			activator braxi\_mod::giveLife();
		}
}

trap9()
{
	trig = getEnt("trig_trap9", "targetname");
	a = getEnt("trap9a", "targetname");
	b = getEnt("trap9b", "targetname");
	o = getEnt("o_trap9", "targetname");
	trig setHintString("Press F to drop them again!");
	trig waittill ("trigger", player);
	o playSound("spark");
	PlayFX(level.spark, o.origin);
	x = randomInt(2);
	if (x==0)
	{
		a moveZ(-1104, 1);
		wait 5;
		a moveZ(1104, 1);
		wait 1;
	}
	if (x==1)
	{
		b moveZ(-1104, 1);
		wait 5;
		b moveZ(1104, 1);
		wait 1;
	}
}

donottouch()
{
	trig = getEnt("trig_donottouch", "targetname");
	trig setHintString("^1Don't touch you bitch");
	for(;;)
	{
		trig waittill("trigger", player);
		player iPrintLnBold("^1I warned you.");
		player freezeControls(1);
		wait 1.5;
		player suicide();
		iPrintLn("^2"+player.name+" ^1died out of curiosity");
		player freezeControls(0);
	}
}

shipmover1()
{
epos0 = getEnt("o_pos2","targetname");
epos1 = getEnt("o_pos3","targetname");
ship = getEnt("actiship", "targetname");
shield = getEnt("actishield", "targetname");
trig = getEnt("trig_shipmover1","targetname");
trig setHintString("Press F to move");

trig waittill("trigger",player);
player freezeControls(true);
air = Spawn("script_origin", player.origin);
player linkto(air);
level.shipmove = 1;

	if(level.shipmove == 1)
	{
	ship rotateYaw(-45, 3, 0.5, 0.5);
	ship moveto(epos0.origin, 1.5);
	shield moveto(epos0.origin, 1.5);
	air moveto(epos0.origin-(-120,0,180), 1.5);
	player setPlayerAngles(epos0.angles);
	wait 1.5;
	ship moveto(epos1.origin, 1.5);
	shield moveto(epos1.origin, 1.5);
	air moveto(epos1.origin-(-120,0,180), 1.5);
	ship rotateYaw(-45, 3, 0.5, 0.5);
	player setPlayerAngles(epos1.angles);
	ship waittill("movedone");
	wait 2;
	player freezeControls(false);
	player unlink();
	air delete();
	trig delete();
	level.shipmove = 0;
	}
	else
	{
	wait 4;
	}
}

shipmover2()
{
epos0 = getEnt("o_pos4","targetname");
epos1 = getEnt("o_pos5","targetname");
ship = getEnt("actiship", "targetname");
shield = getEnt("actishield", "targetname");
trig = getEnt("trig_shipmover2","targetname");
trig setHintString("Press F to move");

trig waittill("trigger",player);
player freezeControls(true);
air = Spawn("script_origin", player.origin);
player linkto(air);
level.shipmove = 1;

	if(level.shipmove == 1)
	{
	ship rotateYaw(45, 3, 0.5, 0.5);
	ship moveto(epos0.origin, 1.5);
	shield moveto(epos0.origin, 1.5);
	air moveto(epos0.origin-(-120,0,180), 1.5);
	player setPlayerAngles(epos0.angles);
	wait 1.5;
	ship moveto(epos1.origin, 1.5);
	shield moveto(epos1.origin, 1.5);
	air moveto(epos1.origin-(-120,0,180), 1.5);
	ship rotateYaw(45, 3, 0.5, 0.5);
	player setPlayerAngles(epos1.angles);
	ship waittill("movedone");
	wait 2;
	player freezeControls(false);
	player unlink();
	air delete();
	trig delete();
	level.shipmove = 0;
	}
	else
	{
	wait 4;
	}
}

trap10()
{
	trig = getEnt("trig_trap10", "targetname");
	a = getEnt("trap10", "targetname");
	trig setHintString("Press F to make it harder!");
	trig waittill ("trigger", player);
		a moveZ(-8000, 7);
		wait 7;
		a delete();
}

trap11()
{
	trig = getEnt("trig_trap11", "targetname");
	a = getEnt("trap11", "targetname");
	trig setHintString("Press F to make it even harder!");
	trig waittill ("trigger", player);
		a moveZ(-8000, 7);
		wait 7;
		a delete();
}

trap12()
{
a = getEnt ("trap12", "targetname");
trig = getEnt ("trig_trap12", "targetname");
m = getEnt ("trap12m", "targetname");
trig setHintString("Press F to spin their asses!");
m linkTo(a);
trig waittill("trigger", player);
	for(;;)
	{
	a rotateYaw (360, 5.5);
	wait 5.5;
	}
}

trap13()
{
	trig = getEnt("trig_trap13", "targetname");
	a = getEnt("trap13a", "targetname");
	b = getEnt("trap13b", "targetname");
	trig setHintString("Press F to... yeah, drop them, how did you guess?");
	trig waittill ("trigger", player);
	x = randomInt(2);
	if (x==0)
	{
		a moveZ(-8000, 6);
		wait 7;
		a moveZ(8000, 2);
		wait 3;
	}
	if (x==1)
	{
		b moveZ(-8000, 6);
		wait 7;
		b moveZ(8000, 2);
		wait 3;
	}
}

mainactis()
{
	trig = getEnt("trig_mainactis", "targetname");
	a = getEnt("o_actisa", "targetname");
	b = getEnt("o_actisb", "targetname");
	c = getEnt("o_actisc", "targetname");
	d = getEnt("o_actisd", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		if (player.actis == 1)
		{
			player setOrigin(a.origin);
			player setPlayerAngles(a.angles);
		}
		else if (player.actis == 2)
		{
			player setOrigin(b.origin);
			player setPlayerAngles(b.angles);
		}
		else if (player.actis == 3)
		{
			player setOrigin(c.origin);
			player setPlayerAngles(c.angles);
		}
		else if (player.actis == 4)
		{
			player setOrigin(d.origin);
			player setPlayerAngles(d.angles);
		}
	}
}

bactis()
{
	trig = getEnt("trig_actisb", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.actis = 2;
	wait .5;
	}
}

cactis()
{
	trig = getEnt("trig_actisc", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.actis = 3;
	wait .5;
	}
}

dactis()
{
	trig = getEnt("trig_actisd", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);
	player.actis = 4;
	wait .5;
	}
}

enteractis()
{
	trig = getEnt("trig_actisenter", "targetname");
	o = getEnt("o_actisenter", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You entered the secret!");
			player.actis = 1;
			level.actispace = true;
	}
}


secretendactis()
{
	trig = getEnt("trig_actisend", "targetname");
	o = getEnt("o_actisend", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
			player setOrigin(o.origin);
			player setPlayerAngles(o.angles);
			player iPrintLnBold("^5You finished the secret!");
			player braxi\_rank::giveRankXP("", 2000);
			player.actis = 1;
			level.actispace = false;
	}
}

secretendactisfx()
{
	trig = getEnt("trig_actisecretendfx", "targetname");
	o = getEnt("o_actisecretendfx", "targetname");
		trig waittill("trigger", player);
		PlayFX(level.portal, o.origin);
}


moreaxes()
{
	trig = getEnt("trig_moreaxes", "targetname");
	trig setHintString("Need more axes?");
	for(;;)
	{
	trig waittill ("trigger", player);
	player giveWeapon("labaxe_mp");
	player switchToWeapon("labaxe_mp");
	}
}