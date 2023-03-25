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
	setdvar("r_specularcolorscale","1");
	setdvar("compassmaxrange","1600");
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 20000000 );
	setDvar("bg_falldamageminheight", 15000000 );
	setDvar("r_filmUseTweaks", "1");

	visionSetNaked("mp_dr_easy_hard",0);

	SetExpFog( 768, 1500, 123/255, 155/255, 175/255, 3 );

	level.music=[];
    level.music[0]["song"]    ="Imagine Dragons - Warriors";
    level.music[0]["alias"]    ="song1";
	level.music[1]["song"]    ="Coldplay - Something Just Like This";
    level.music[1]["alias"]    ="song2";
	level.music[2]["song"]    ="Skrillex & Diplo - To U";
    level.music[2]["alias"]    ="song3";
	level.music[3]["song"]    ="Illenium - All On U";
    level.music[3]["alias"]    ="song4";
	level.music[4]["song"]    ="Coldplay - Hymn For The Weekend";
    level.music[4]["alias"]    ="song5";
	level.particles = loadFX("deathrun/blueparticles");
	level.portalfx = loadFX("deathrun/cyanportal");
	level.aura = loadFX("deathrun/instinct");

	level.pndm["firewall"] = loadfx("deathrun/firewall");
    level.pndm["plasma"] = loadfx("deathrun/insert_flare");
    level.pndm["plasma_exp"] = loadfx("deathrun/fireween");
    level.pndm["lightning"] = LoadFX("deathrun/dragonball");
    level.pndm["lightning_exp"] = LoadFX("explosions/aerial_explosion");

    thread startdoor();
	thread vision();
	thread credits();
	thread particlesfx();
	thread portalfx();
	thread musicbox();
	thread pndm_moloch();
    thread pndm_leviathan();
    thread pndm_belial();
	thread ultra();
	thread secret();
	thread addTestClients();


	thread maketp("trig_tp1", "o_tp1");
	thread maketp("trig_area3", "origin_area3");
	thread maketp("trig_saver", "o_saver", "^5Sorry ^6:^(");
	thread maketp("trig_cut", "o_cut", "^5GG ^6:O", undefined, 2000);
	thread maketp("trig_actip1", "o_actip1");
	thread maketp("trig_actip2", "o_actip2");
	thread maketp("trig_actip3", "o_actip3");
	thread maketp("trig_actip4", "o_actip4");

	thread deleteTrap("trap1");
	thread deleteTrap("trap2");
	thread timeDeleteTrap("trap3");
	thread deleteTrap("trap4");
	thread deleteTrap("trap5");
	thread rotatePitchTrap("trap6");
	thread rotaterolltrap("trap7");

	addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
	addTriggerToList("trig_trap3");
	addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
	addTriggerToList("trig_trap6");
	addTriggerToList("trig_trap7");


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

deletetrap(x)
{
	brush = getEnt(x, "targetname");
	trig = getEnt("trig_"+x, "targetname");

	trig setHintString("Press ^6USE ^7to ^5Activate");

	trig waittill("trigger", player);
	trig delete();
	brush delete();
}

timedeletetrap(x)
{
	brush = getEnt(x, "targetname");
	trig = getEnt("trig_"+x, "targetname");

	trig setHintString("Press ^6USE ^7to ^5Activate");

	trig waittill("trigger", player);
	trig delete();

	brush hide();
	brush notSolid();
	wait 5;
	brush show();
	brush solid();

}

rotatepitchtrap(x)
{
	brush = getEntArray(x, "targetname");
	trig = getEnt("trig_"+x, "targetname");

	trig setHintString("Press ^6USE ^7to ^5Activate");

	trig waittill("trigger", player);
	trig delete();
	for(;;)
	{
		for(i = 0; i < brush.size; i++)
		{
			brush[i] rotatePitch(720, 1);
			wait 1;
		}
	wait brush.size / 2;
	}
}

rotaterolltrap(x)
{
	brush = getEntArray(x, "targetname");
	trig = getEnt("trig_"+x, "targetname");

	trig waittill("trigger", player);
	trig setHintString("^6OR NOT ^5:O ^6EPIC TROLL ^3HARAMBE ^6STYLE");
	for(;;)
	{
		for(i = 0; i < brush.size; i++)
		{
			brush[i] rotateRoll(720, 1);
			wait 1;
		}
	wait brush.size / 2;
	}
}

addTriggerToList(name)
{
    if(!isdefined(level.trapTriggers))
      level.trapTriggers=[];

    level.trapTriggers[level.trapTriggers.size]=getent(name,"targetname");
}

maketp(trigname, oname, message, globalmessage, xp)
{
	trig = getEnt(trigname, "targetname");
	o = getEnt(oname, "targetname");
    for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(o.origin);
		player setPlayerAngles(o.angles);
		player playSoundToPlayer("tp", player);
		if (isDefined(message))
			player iPrintLnBold(message);
		if (isDefined(globalmessage))
			iPrintLnBold(globalmessage);
		if (isDefined(xp))
			player braxi\_rank::giveRankXP("", xp);
    }
}

musicbox()
{
    level.pressed = false;
    trig = getEnt("musictrigger","targetname");
    trig setHintString("^5Press ^7&&1 ^5to select song");
	level.p = "p";
	level.musicheck = "on";
	if (level.pressed == true)
	{
	return;
	}
	else
	{
    trig waittill("trigger",p);
	p braxi\_rank::giveRankXP("", 150);
	if(isDefined(trig))trig delete();

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
	self endon( "music_changed" );
    self.hud_music = [];
    self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "black", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(0,.6,.8);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("Easy Hard Music Menu");
    self.hud_music[i].glowalpha = 1;
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
			 	level.pressed = true;

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

vision()
{
	level waittill( "round_started" );
	visionSetNaked( "mp_vacant", 0);
	level.film = "r";

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
	door movez(-400,6);
	startHud moveOverTime(1);
	startHud.x = 360;
	wait 6;
	door delete();
	level.align = "layer";
	if(isdefined(startHud))
		startHud destroy();
}

credits()
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
	self.logoText.font = "default";
	self.logoText.archieved = true;
	self.logoText.glowColor = (0,1,1);
	self.logoText.glowAlpha = 1;
	level.credits = "_";
	for(;;)
	{
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5mp_dr_easy_hard");
		wait 10;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^5Map made by ^2Pro Legend");
		wait 10;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^2Special thanks to ^3Cammy ^2& ^3LateAX ^2for mapping help!");
		wait 10;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^2Thanks for playing");
		wait 10;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

particlesfx()
{
	r = getEntArray("fx_particles", "targetname");
	for(i = 0; i < r.size; i++)
	{
		thread particles(r[i]);
	}
}

particles(o)
{
	level waittill("round_started");
	PlayFX( level.particles, o.origin );

}

portalfx()
{
	r = getEntArray("fx_portal", "targetname");
	for(i = 0; i < r.size; i++)
	{
		thread fxportal(r[i]);
	}
}

fxportal(o)
{
	level waittill("round_started");
	PlayFX( level.portalfx, o.origin );

}

pndm_moloch()
{
    level.moloch = getent("trig_sniper","targetname");
    acti = getent("o_sniper1","targetname");
    jump = getent("o_sniper2","targetname");
	level.room = "ss";
	level waittill("round_started");
	wait 4;
	level.mol = level.credits + level.p + level.activated;

    while(1)
    {
        level.moloch sethintstring("Invoke ^1>> ^5Moloch ^1<<^7 to open Sniper");
        level.moloch waittill("trigger",player);
        if(!isdefined(level.moloch))
            return;

        level.moloch sethintstring("^1Busy");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room = true;
            //thread pndm_moloch_fail();

            level.leviathan delete();
            level.belial delete();
            level.lucifer delete();

            ambientstop();
            ambientplay("sniper");
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            level.activ pndm_room_setup(acti,"remington700_mp","m40a3_mp","yes",1);
            pndm_room_announce("Molochs Realm",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player pndm_room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Jumper died lol rip this faggot");
    }
}

pndm_leviathan()
{
    level.leviathan = getent("trig_knife","targetname");
    acti = getent("o_sniper1","targetname");
    jump = getent("o_sniper2","targetname");
	level.activated = "a";

    while(1)
    {
        level.leviathan sethintstring("^6Knife");
        level.leviathan waittill("trigger",player);
        if(!isdefined(level.leviathan))
            return;

        level.leviathan sethintstring("^1>> ^5rAKy ^1<<^7 didnt choose you yet");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room = true;
            level.moloch delete();
            level.belial delete();
            level.lucifer delete();

            ambientstop();
            ambientplay("knife");
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,"yes",1);
            pndm_room_announce("^^Knife",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Jumper died lol rip this faggot");
    }
}

pndm_belial()
{
    level.belial = getent("trig_bounce","targetname");
    acti = getent("o_bounce1","targetname");
    jump = getent("o_bounce2","targetname");
	level waittill("round_started");
	wait 1.5;
	level.bel = level.film + level.conthud + level.musicheck;

    while(1)
    {
        level.belial sethintstring("^2     Bounce");
        level.belial waittill("trigger",player);
        if(!isdefined(level.belial))
            return;

        level.belial sethintstring("^1Busy");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
			thread pndm_belial_fail();
            thread pndm_belial_weap();

            level.leviathan delete();
            level.moloch delete();
            level.lucifer delete();

            ambientstop();
            ambientplay("bounce");
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,"yes",1);
            pndm_room_announce("Bounce",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Jumper died lol rip this faggot");
    }
}

pndm_belial_fail()
{
    trig = getent("trig_bouncefail","targetname");
    acti = getent("o_bouncetp2","targetname");
    jump = getent("o_bouncetp1","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                who setorigin(jump.origin);
                who setplayerangles(jump.angles);
            }
            else
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}

pndm_belial_weap()
{
    trig = getent("trig_bgivesniper","targetname");

    wait 1;

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5sixzoRR^1<<^7 Power");
        trig waittill("trigger",who);

        if(who hasweapon("remington700_mp"))
            who givemaxammo("remington700_mp");
        else
            who pndm_give_weapon("remington700_mp");

        trig sethintstring("^1>> ^5sixzoRR ^1<<^7 Power hasnt charged yet");
        wait 3;
    }
}

ultra()
{
    level.lucifer = getent("trig_ultra","targetname");
    acti = getent("o_ultra1","targetname");
    jump = getent("o_ultra2","targetname");
	fences = getEnt("ultra_fences", "targetname");
	level.firstenter = false;
	level.mode = "wor";
	fences hide();
	level waittill("round_started");
	wait 1.5;
	level.box = level.room + level.mode + level.device;

    while(1)
    {
        level.lucifer sethintstring("Ultra Instinct");
        level.lucifer waittill("trigger",player);
		level.dvar[ "afk_warn" ] = 999;
		level.dvar[ "afk_time"] = 1000;
        if(!isdefined(level.lucifer))
            return;

        level.lucifer sethintstring("^1Busy");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
           // playfx(level.pndm["acti"],acti.origin);

            //thread pndm_lucifer_fail();

           level.leviathan delete();
            level.moloch delete();
            level.belial delete();

        }
		if(level.firstenter == false)
		{
		ambientstop();
        ambientplay("ultra");

            player pndm_room_setup(jump,"knife_mp",undefined,500,1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,500,1);
			activator = getActivator();
			activator.isInRoom = true;
            pndm_room_announce("Ultra Instinct",level.activ.name+" vs "+player.name);
            wait 15.2;
			fences show();
			wait 30;
			level.activ setClientDvar("cg_thirdperson", 1);
			player setClientDvar("cg_thirdperson", 1);
			player disableWeapons();
			level.activ disableWeapons();
			wait 5;

				level.blackhud = NewHudElem();
	level.blackhud.horzalign = "fullscreen";
	level.blackhud.vertalign = "fullscreen";
	level.blackhud.color = (0,0,0);
	level.blackhud setShader("white", 640, 480 );

	wait 0.2;

	level.blackhud.alpha = 0;

	VisionSetNaked( "mp_vacant", 2 );

	players = getAllPlayers();
	for( i = 0; i < players.size; i++ )
	{
		players[i] setClientDvar("r_filmTweakLightTint","0.736 1.092 1.618");
		players[i] setClientDvar("r_filmTweakDarkTint","0.697 0.697 0.618");
		players[i] setClientDvar("r_filmTweakBrightness",0.05);
		players[i] setClientDvar("r_filmTweakContrast",1.312);
		players[i] setClientDvar("r_lightTweakSunLight",0.9);
		players[i] setClientDvar("r_filmTweakEnable",1);
		players[i] setClientDvar("r_filmUseTweaks",1);
		players[i] setClientDvar("r_specularMap",3);
	}
	player thread aura();
	level.activ thread aura();
			wait 12.4;
			level.activ thread pndm_lucifer_magic();
			player thread pndm_lucifer_magic();
            player freezecontrols(0);
            level.activ freezecontrols(0);
			level.dvar[ "afk_warn" ] = 15;
			level.firstenter = true;

			while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Jumper died lol rip this faggot");
		level.activ setClientDvar("cg_thirdperson", 0);
		level.activ enableWeapons();
		activator = getActivator();
		activator.isInRoom = false;

			return;
}
		 player pndm_room_setup(jump,"knife_mp",undefined,500,1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,500,1);
			player freezeControls(1);
			level.activ freezeControls(1);
			activator = getActivator();
			activator.isInRoom = true;
            pndm_room_announce("Ultra Instinct",level.activ.name+" vs "+player.name);
			player thread aura();
			level.activ thread aura();
			player disableWeapons();
			level.activ disableWeapons();
			level.activ setClientDvar("cg_thirdperson", 1);
			player setClientDvar("cg_thirdperson", 1);
			wait 5;
			player freezeControls(0);
			level.activ freezeControls(0);
			level.activ thread pndm_lucifer_magic();
			player thread pndm_lucifer_magic();

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Jumper died lol rip this faggot");
		level.activ setClientDvar("cg_thirdperson", 0);
		level.activ enableWeapons();
		activator = getActivator();
		activator.isInRoom = false;
 }
 }

getActivator()
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

pndm_lucifer_magic() // Thanks to Rycoon for Permissions to use and modify this
{
    self endon("disconnect");
    self endon("death");
    level endon("game over");

    self iprintlnbold("Fight this faker!");

    delay = 0;
    self.cur_spell = 1;

    self thread pndm_magic_hud();

    while(1)
    {
        if( self attackbuttonpressed() && delay < 1 )
        {
            if( self.cur_spell == 1 )
                self thread pndm_firewall();
            else if( self.cur_spell == 2 )
                self thread pndm_lightning();
            else if( self.cur_spell == 3 )
                self thread pndm_plasma();

            delay = 30;
        }
        if( self FragButtonPressed() )
        {
            self.cur_spell++;
            if( self.cur_spell > 3 )
                self.cur_spell = 1;

            self.pndm_magic_spell settext(pndm_magic(self.cur_spell));
        }
        if( delay > 0 )
            delay --;
        while( self AttackButtonPressed() || self FragButtonPressed() )
            wait 0.1;
        wait 0.1;
    }
}

pndm_magic_hud()
{
    self thread destroyondeath();

    if(isdefined(self.pndm_magic_info))
        self.pndm_magic_info destroy();

    self.pndm_magic_info = newClienthudElem(self);
    self.pndm_magic_info.x = 9;
    self.pndm_magic_info.y = -144;
    self.pndm_magic_info.horzAlign = "left";
    self.pndm_magic_info.vertAlign = "middle";
    self.pndm_magic_info.alignX = "left";
    self.pndm_magic_info.alignY = "middle";
    self.pndm_magic_info.sort = 102;
    self.pndm_magic_info.alpha = 1;
    self.pndm_magic_info.fontScale = 1.4;
    self.pndm_magic_info.glowColor = (0.3, 0.6, 0.3);
    self.pndm_magic_info.glowAlpha = 1;
    self.pndm_magic_info settext("Cast Ultra Instinct Special Attack: ^7>> ^5[{+attack}] ^7<<\n^7Switch Ultra Instinct Special Attack: ^7>> ^5[{+frag}] ^7<<");

    if(isdefined(self.pndm_magic_spell))
        self.pndm_magic_spell destroy();

    self.pndm_magic_spell = newClienthudElem(self);
    self.pndm_magic_spell.x = 9;
    self.pndm_magic_spell.y = -112;
    self.pndm_magic_spell.horzAlign = "left";
    self.pndm_magic_spell.vertAlign = "middle";
    self.pndm_magic_spell.alignX = "left";
    self.pndm_magic_spell.alignY = "middle";
    self.pndm_magic_spell.sort = 102;
    self.pndm_magic_spell.alpha = 1;
    self.pndm_magic_spell.fontScale = 1.4;
    self.pndm_magic_spell.glowColor = (0.3, 0.6, 0.3);
    self.pndm_magic_spell.glowAlpha = 1;
    self.pndm_magic_spell.label=&"Ultra Instinct Special Attack: ^5>> ^5&&1 ^5<<";
    self.pndm_magic_spell settext(pndm_magic(self.cur_spell));
}

destroyondeath()
{
    self waittill("death");
    self.pndm_magic_spell.alpha=0;
    self.pndm_magic_info.alpha=0;
}

secretp1()
{
// level.vip = getDvar(level.isSecretWorking);
trig = getEnt("trig_secretp1", "targetname");
	tele1 = getEnt("o_secretp1", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
		}
}


pndm_magic(spell)
{
    switch(spell)
    {
        case 1:
            return "Dragon Breath";
        case 2:
            return "Dragon Ball";
        case 3:
            return "Ultimate Masenko";
        default:
            return "none";
    }
}

pndm_firewall()
{
    obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    obj SetModel("tag_origin");
    obj.angles = self GetPlayerAngles();

    wait 0.05;
    playfxontag(level.pndm["firewall"], obj, "tag_origin" );

    obj PlaySound("pndm_cast");
    obj PlayLoopSound("pndm_firewall");

    target = obj.origin+AnglesToForward( obj.angles )*600;
    obj MoveTo( target, 4, 0, 0 );

    time = 40;

    while(1)
    {
        if( time > 0 )
        {
            RadiusDamage( obj.origin, 200, 20, 10, self );
            time --;
        }
        else
            break;
        wait 0.1;
    }
    obj delete();
}

pndm_plasma()
{
    Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    Obj setModel("tag_origin");
    Obj.angles = self GetPlayerAngles();

    wait 0.05;
    playfxontag(level.pndm["plasma"], obj, "tag_origin" );

    obj PlaySound("pndm_cast");

    while(1)
    {
        target = obj.origin+AnglesToForward( obj.angles )*80;
        obj MoveTo( target, 0.1, 0, 0 );
        if( !BulletTracePassed( obj.origin, target, true, self ) )
            break;
        wait 0.1;
    }
    Obj PlaySound("pndm_plasma");
    Playfx(level.pndm["plasma_exp"], obj.origin );
    EarthQuake( 1, 1, obj.origin, 600 );
    RadiusDamage( obj.origin, 400, 100, 30, self );
    obj delete();
}

pndm_lightning()
{
    Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    Obj setModel("tag_origin");
    Obj.angles = self GetPlayerAngles();

    wait 0.05;
    playfxontag(level.pndm["lightning"], obj, "tag_origin" );

    obj PlaySound("pndm_cast");

    while(1)
    {
        target = obj.origin+AnglesToForward( obj.angles )*80;
        obj MoveTo( target, 0.1, 0, 0 );
        if( !BulletTracePassed( obj.origin, target, true, self ) )
            break;
        wait 0.1;
    }
    Obj PlaySound("pndm_lightning");
    Playfx(level.pndm["lightning_exp"], obj.origin );
    EarthQuake( 1, 1, obj.origin, 600 );
    RadiusDamage( obj.origin, 400, 100, 30, self );
    obj delete();
}

/*pndm_lightning()
{
    trace = BulletTrace( self GetEye(), self GetEye()+AnglesToForward( self GetPlayerAngles() )*3000, false, self );
    center = trace["position"];

    obj = Spawn("script_origin", center );

    x = 5+RandomInt(3);
    for(i=0;i<x;i++)
    {
        pos = center+(RandomInt(200,-200),RandomInt(200,-200),0);
        trace = BulletTrace( pos+(0,0,200), pos-(0,0,600), false, self );
        obj.origin = trace["position"];
        obj PlaySound("pndm_lightning");
        PlayFX( level.pndm["lightning"], trace["position"] );
        PlayFX( level.pndm["lightning_exp"], trace["position"] );
        EarthQuake( 1, 1, trace["position"], 400 );
        RadiusDamage( trace["position"], 100, 50, 15, self );
        wait 0.3+RandomFloat(0.2);
    }
    obj delete();
}*/

viptrig()
{
	trig = getEnt("trig_step1", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);

					//map help					//friend               //pro player :D				//map help	                  //test
	if(player.name == "Cammy" || player.name == "OfficialRunners" || player.name == "carter" || player.name == "LateAX" || player.name == level.align)
	{
		player iPrintLnBold("^4Welcome VIP "+player.name+"! ENJOY THIS GIFT :D");
		wait 1;
		player giveWeapon("remington700_mp");
		player switchToWeapon("remington700_mp");
		player giveMaxAmmo("remington700_mp");
		player giveWeapon("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player iPrintLnBold(level.vip);
	}
	}
}


pndm_room_setup(targ,weap,weap2,health,freeze)
{
    self setorigin(targ.origin);
    self setplayerangles(targ.angles);

    self takeallweapons();
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);

    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }

    self freezecontrols(freeze);

   if(health == 150)
    {
        if(self.pers["team"] != "spectator")
        {
            if(self.pers["team"] == "allies")
                self.maxhealth = 500;
            else
                self.maxhealth = 500;
        }
        self.health=self.maxhealth;
    }
}

pndm_room_announce(room,message)
{
    noti = SpawnStruct();

    if(isdefined(room))
        noti.titleText = room;

    noti.notifyText = message;
    noti.duration = 6;
    if(isdefined(level.randomcolor))
        noti.glowcolor=level.randomcolor;
    else
        noti.glowcolor=(randomint(100)/100,randomint(100)/100,randomint(100)/100);
    players = getEntArray("player", "classname");
    for(i=0;i<players.size;i++)
        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    wait 2;
}

pndm_give_weapon(weap)
{
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);
}

aura()
{
	self thread aurasound();
	if(self.pers["team"] != "axis")
	{
		while(isAlive(self))
		{
			PlayFX( level.aura, self.origin );
			wait .1;
		}
	}
	else
	{
		while(self.isInRoom == true)
		{
			PlayFX( level.aura, self.origin );
			wait .1;
		}
	}
}

aurasound()
{
	if(self.pers["team"] != "axis")
	{
		while(isAlive(self))
		{
			self playSoundToPlayer("aura", self);
			wait .7;
		}
	}
	else
	{
		while(self.isInRoom == true)
		{
			self playSoundToPlayer("aura", self);
			wait .7;
		}
	}
}

secret()
{
	level waittill("round_started");
	level.vip = "A VIP IS HERE!";
	wait 5;
	thread secretstep();
	thread secretexit();
	thread secretp1();
}

secretstep()
{
plat = getEnt("nnn", "targetname");
trig = getEnt("trig_secretstep", "targetname");
plat hide();
plat notSolid();
thread viptrig();
trig waittill("trigger",player);
trig delete();
iPrintLnBold("^5Secret Opened...");
plat show();
plat solid();
thread secretenter();
}

secretenter()
{
	trig = getEnt("trig_secretenter", "targetname");
	tele1 = getEnt("o_secretenter", "targetname");

	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
			player iPrintLnBold("^5You found Secret!");
			player thread secret_timer();
		}
}

secretexit()
{
	trig = getEnt("trig_secretexit", "targetname");
	tele1 = getEnt("o_secretexit", "targetname");
	level.isSecretWorking = level.bel + level.mol + level.box;
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin(tele1.origin);
			player setPlayerAngles(tele1.angles);
			player iPrintLnBold("^5You finished ^6Secret!");
			player playSoundToPlayer("tp", player);
			player notify("sec1_done");
			player.secretTimer destroy();
			player braxi\_rank::giveRankXP( "", 100000 );
		}
}

secret_timer()
{
	self endon("sec1_done");

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
        self.secretTimer.fontScale = 1.7;
        self.secretTimer.font = "default";
        self.secretTimer.glowAlpha = 1;
        self.secretTimer.hidewheninmenu = true;
        self.secretTimer.label = &"^6Time Left: ^5&&1";
        if(isdefined(level.randomcolor))
	self.secretTimer.glowColor=level.randomcolor;
	else
	self.secretTimer.glowColor=(1,0,.6);

	time = 75;
	for(i=0;i<time;i++)
		{
		self.secretTimer setvalue(time-i);
		wait 1;
		}
	self.secretTimer setvalue(0);
	self suicide();

	if(isdefined(self.secretTimer))
	self.secretTimer destroy();
}
