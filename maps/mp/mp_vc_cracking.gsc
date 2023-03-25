
main()
{
	maps\mp\_load::main();

	level.firefly_red	= loadFX("deathrun/firefly_a");
	level.firefly_blue	= loadFX("deathrun/firefly_b");
	level.firefly_org	= loadFX("deathrun/firefly_c");
	level.firefly_purp	= loadFX("deathrun/firefly_d");
	level.firefly_white	= loadFX("deathrun/firefly_e");
	level.bright = loadFX("deathrun/bright");
	level.bobbel = loadFX("deathrun/bobbel");
	level.weed = loadFX("deathrun/weed");
	level.ghost = loadFX("deathrun/ghost");
	level.scruffy = loadFX("deathrun/scruffy");
	level.player = loadFX("deathrun/flash");
	level.energy = loadFX("deathrun/energy");
	level.party_a = loadFX("deathrun/party_a");
	level.party_b = loadFX("deathrun/party_b");
	level.party_c = loadFX("deathrun/party_c");
	level.java = loadFX("explosions/belltower_explosion");

	//////PortalGun//////
	level.portalgunused = false;
	level.portalgun["portal_blue"] = LoadFX("deathrun/portal_blue");
	level.portalgun["portal_red"] = LoadFX("deathrun/portal_red");
	level.portalgun["shoot_blue"] = LoadFX("deathrun/portalgun_shoot_blue");
	level.portalgun["shoot_red"] = LoadFX("deathrun/portalgun_shoot_red");

	//////Game//////
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1500");
	// setdvar("dr_jumpers_speed","1.2");

	//////Models//////
	precacheModel("viewmodel_ak47");
	precacheModel("weapon_g3");
	precacheModel("weapon_p90");
	precacheModel("weapon_m82");
	precacheModel("weapon_g36");
	precacheModel("weapon_m40a3");
	precacheModel("deadpool");
	precacheModel("ratchet");
	precacheModel("body_mp_usmc_woodland_sniper");
	precacheModel("head_mp_usmc_ghillie");
	precacheModel("body_complete_sp_zakhaevs_son_coup");
	precacheModel("deadpool");
	precacheModel("ratchet");
	precacheModel("body_mp_opforce_eningeer");
	precacheModel("head_sp_opforce_ski_mask_body_a");
	precacheModel("body_mp_arab_regular_engineer");
	precacheModel("head_mp_arab_regular_headwrap");
	precacheModel("body_mp_opforce_sniper");
	precacheModel("head_mp_opforce_ghillie");
	precacheModel("body_mp_sas_urban_specops");
	precacheModel("head_sp_opforce_justin_beanie_body_e");
	precacheModel("body_sp_sas_woodland_at4");
	precacheModel("head_specops_sp");

	//precacheModel("viewhands_BotS_50cent");
	//self setModel("playermodel_BotS_50cent");
	//self setViewmodel("viewhands_BotS_50cent");

	//////PreCache//////
	PrecacheItem("m16_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("g3_mp");
	PreCacheItem("p90_mp");
	PreCacheItem("barrett_mp");
	PreCacheItem("m40a3_mp");
	PreCacheItem("g36c_silencer_mp");

	thread bobbles();
	thread ganja();
	thread party();
	thread startcredit();
	thread begin();
	thread Stage2();
	thread wall();
	thread move1();
	thread move2();
	thread move3();
	thread move4();
	thread lift();
	thread lift2();
	thread babe1();
	thread babe2();
	thread babe3();
	thread babe4();
	thread babe5();
	thread weapon_box();
	thread skins();
	thread vip_gun();
	thread teleporter_thread();
	thread red();
	thread portalgun();
	thread Vip();
	thread Vip_door();

	thread sniper();
	thread sniper_brush();

	/////power///
	//thread tower();
	thread powerbox();
	thread powerbox_a();
	thread powerbox_b();
	thread cube1();
	thread cube2();
	thread cube3();
	thread cube4();


	//////Traps//////
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7a();
	thread trap7b();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();

	////TestClient////
	thread addTestClients();
}

bobbles()
{
bobbles=getentarray("bobbel","targetname");
for(i=0;i<bobbles.size;i++)
{
playfx(level.bobbel,bobbles[i].origin);
wait 0.5;
}
}

fire()
{
burn=getentarray("fire","targetname");
for(i=0;i<burn.size;i++)
{
playfx(level.scruffy,burn[i].origin);
wait 0.5;
}
}

ganja()
{
ganja=getentarray("weed","targetname");
for(i=0;i<ganja.size;i++)
{
playfx(level.weed,ganja[i].origin);
wait 0.5;
}
}


party()
{
    party=getentarray("disco","targetname");

    level waittill("round_started");

	while(1)
	{
		for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_a, party[i].origin);
    	}
    	wait 2;
    	for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_b, party[i].origin);
    	}
    	wait 2;
    	for(i=0;i<party.size;i++)
    	{
        	playfx(level.party_c, party[i].origin);
        }
    	wait 2;
	}
}

startcredit()
{
level waittill("round_started");
brush=getent("begin_brush","targetname");
brush2=getent("begin_brush2","targetname");
fx1 = getEnt ("skins_origin1", "targetname");
playFx(level.energy, fx1.origin);
ambientPlay("round_Start");
wait 0.5;
brush2 movez(88,4);

	noti = SpawnStruct();
	noti.titleText = " ^9Map Made By ^2E^3R^5I^6K^9!";
	noti.notifyText = "10 SECONDS BEFORE OPENING";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 5;
	noti = SpawnStruct();
	noti.titleText = "10";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "9";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;

	ambientPlay("Apaci");
	noti = SpawnStruct();
	noti.titleText = "8";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "7";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "6";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "5";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "4";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "3";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "2";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	brush movez(-145,3);

	wait 1;
	noti = SpawnStruct();
	noti.titleText = "1";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	noti = SpawnStruct();
	noti.titleText = "^2GO";
	noti.duration = 1;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

begin()
{
brush=getent("begin_brush","targetname");
trig=getent("begin_trigger","targetname");
que=getent("teleporting_fx1","targetname");
fx=getent("teleporting_fx2","targetname");
fly1=getent("firefly1","targetname");
fly2=getent("firefly2","targetname");
fly3=getent("firefly3","targetname");
fly4=getent("firefly4","targetname");
fly5=getent("firefly5","targetname");

trig waittill("trigger");
playfx(level.ghost,que.origin);
playfx(level.bright,fx.origin);
playfx(level.firefly_blue,fly1.origin);
playfx(level.firefly_red,fly2.origin);
playfx(level.firefly_org,fly3.origin);
playfx(level.firefly_purp,fly4.origin);
playfx(level.firefly_white,fly5.origin);

trig delete();
}

Stage2()
{
brush1 = getEnt("stage2_brush1","targetname");
brush2 = getEnt("stage2_brush2","targetname");
brush3 = getEnt("stage2_brush3","targetname");

while(1)
{
brush1 rotateyaw(360,5);
brush2 rotateyaw(-360,5);
brush3 rotateyaw(360,5);
wait 5;
}
}

wall()
{
brush = getEnt("wall_brush01","targetname");

while(1)
{
brush movez(-128,2);
wait 2;
brush movez(128,1.5);
wait 1.5;
}
}

move1()
{
    trig = getEnt( "move1_trigger", "targetname" );
    brush = getEnt( "move1_brush", "targetname" );

	trig waittill( "trigger" , player );

while(1)
{
	trig delete();
	brush moveY(375,2);
	brush waittill( "movedone" );
	brush moveY(-375,1.5);
	wait 2;
}
}

move2()
{
    brush = getEnt( "move2_brush", "targetname" );
}


move3()
{
    brush1 = getEnt( "move3_brush1", "targetname" );
    brush2 = getEnt( "move3_brush2", "targetname" );

while(1)
{
	brush1 moveX(144,2);
	brush2 moveX(-144,2);
	wait 2;
	brush1 moveX(-144,2);
	brush2 moveX(144,2);
	wait 2;
}
}

move4()
{
   trig = getEnt( "move4_trigger", "targetname" );
   brush = getEnt( "move4_brush1", "targetname" );

	trig waittill( "trigger" , player );

while(1)
{
	trig delete();
	brush moveY(1000,5);
	wait 6;
	brush moveY(-1000,3);
	wait 4;
}
}



lift()
{
brush = getEnt("move_brush1","targetname");

while(1)
{
brush movez(224,1.5);
wait 1.5;
brush movez(-224,2.5);
wait 2.5;
}
}

lift2()
{
brush = getEnt("lift2_brush","targetname");
trig = getEnt("lift2_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
brush movez(320,2);
brush waittill( "movedone" );
wait 1;
brush movez(-320,2);
brush waittill( "movedone" );
wait 1;
}
}

babe1()
{
    trig = getEnt( "girl1_trigger", "targetname" );
    brush1 = getEnt( "girl1_brush1", "targetname" );
    brush2 = getEnt( "girl1_brush2", "targetname" );

	trig waittill( "trigger" , player );

{
	trig delete();
	brush1 moveZ(104,2);
	brush2 moveZ(-104,2);
}
}

babe2()
{
    trig = getEnt( "girl2_trigger", "targetname" );
    brush1 = getEnt( "girl2_brush1", "targetname" );
    brush2 = getEnt( "girl2_brush2", "targetname" );

	trig waittill( "trigger" , player );

{
	trig delete();
	brush1 moveZ(104,2);
	brush2 moveZ(-104,2);
}
}

babe3()
{
    trig = getEnt( "girl3_trigger", "targetname" );
    brush1 = getEnt( "girl3_brush1", "targetname" );
    brush2 = getEnt( "girl3_brush2", "targetname" );

	trig waittill( "trigger" , player );

{
	trig delete();
	brush1 moveX(-176,1);
	brush2 moveX(176,1);
}
}

babe4()
{
    trig = getEnt( "girl4_trigger", "targetname" );
    brush1 = getEnt( "girl4_brush1", "targetname" );
    brush2 = getEnt( "girl4_brush2", "targetname" );

	trig waittill( "trigger" , player );

{
	trig delete();
	brush1 moveX(-176,1.5);
	brush2 moveX(176,1.5);
}
}

babe5()
{
    trig = getEnt( "girl5_trigger", "targetname" );
    brush1 = getEnt( "girl5_brush1", "targetname" );
    brush2 = getEnt( "girl5_brush2", "targetname" );

	trig waittill( "trigger" , player );

{
	trig delete();
	brush1 moveY(-120,1.5);
	brush2 moveY(120,1.5);
}
}

////////////////////////////////////////////////////////////////////////////
////////////////////////////////begin-room//////////////////////////////////

weapon_box()
{
        weapon = getEnt("weapon_model", "targetname");
		trigger = getEnt ("weapon_trigger", "targetname");

        weaponListModels = [];
        weaponList = [];

        weaponList[weaponList.size] = "ak47_mp";
        weaponList[weaponList.size] = "g3_mp";
        weaponList[weaponList.size] = "p90_mp";
        weaponList[weaponList.size] = "barrett_mp";
        weaponList[weaponList.size] = "m40a3_mp";

        weaponListModels[weaponListModels.size] = "weapon_ak47";
        weaponListModels[weaponListModels.size] = "weapon_g3";
        weaponListModels[weaponListModels.size] = "weapon_p90";
        weaponListModels[weaponListModels.size] = "weapon_m82";
        weaponListModels[weaponListModels.size] = "weapon_m40a3";

        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9.:^3Wait^9:.");
                        random = randomInt(weaponListModels.size);
                        weapon show();
                        weapon moveZ(35,2);
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[3]);
                        wait 0.3;
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[4]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[random]);
                        wait 1;
                        weapon hide();
                        weapon moveZ(-35,1);
                        user rewardWeapon( "primary", weaponList[random] , 100, 500 );
                        wait 1;
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

skins()
{
	trigger = getEnt ("skins_trigger", "targetname");
	model = getEnt ("boris", "targetname");
	fx2 = getEnt ("skins_origin2", "targetname");

	skinListModels = [];
	skinList = [];
	modelList = [];


    skinList[0] = "body_mp_usmc_woodland_sniper";
    skinListHead[0] = "head_mp_usmc_ghillie";
	skinList[1] = "deadpool";
	skinListHead[1] = "";
    skinList[2] = "ratchet";
    skinListHead[2] = "";
    skinList[3] = "body_mp_opforce_eningeer";
    skinListHead[3] = "head_sp_opforce_ski_mask_body_a";
    skinList[4] = "body_mp_arab_regular_engineer";
    skinListHead[4] = "head_mp_arab_regular_headwrap";
    skinList[5] = "body_mp_opforce_sniper";
    skinListHead[5] = "head_mp_opforce_ghillie";
    skinList[6] = "body_mp_sas_urban_specops";
    skinList[7] = "body_sp_sas_woodland_at4";
    skinListHead[7] = "head_specops_sp";

	modelList[0] = "body_mp_usmc_woodland_sniper";
    modelList[1] = "deadpool";
    modelList[2] = "ratchet";
    modelList[3] = "body_mp_opforce_eningeer";
    modelList[4] = "body_mp_arab_regular_engineer";
    modelList[5] = "body_mp_opforce_sniper";
    modelList[6] = "body_mp_sas_urban_specops";
    modelList[7] = "body_sp_sas_woodland_at4";

    model hide();

        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9Wait Bitch");
                        random = randomInt(modelList.size);
						playFx(level.player, fx2.origin);
					    model show();
                        model setModel(modelList[0]);
                        wait 0.3;
                        model setModel(modelList[2]);
				        wait 0.3;
                        model setModel(modelList[7]);
                        wait 0.3;
                        model setModel(modelList[random]);
						wait 0.5;
						user detachAll();
                        user setModel( skinList[random] );
						user attach( skinListHead[random]);
                        wait 1;
	                    model hide();
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////

vip_gun()
{
        weapon = getEnt("green_origin", "targetname");
        trigger = getEnt("green_trigger", "targetname");

        weaponListModels = [];
        weaponList = [];

        weaponList[weaponList.size] = "ak47_mp";
        weaponList[weaponList.size] = "g3_mp";
        weaponList[weaponList.size] = "p90_mp";
        weaponList[weaponList.size] = "barrett_mp";
        weaponList[weaponList.size] = "m40a3_mp";

        weaponListModels[weaponListModels.size] = "weapon_ak47";
        weaponListModels[weaponListModels.size] = "weapon_g3";
        weaponListModels[weaponListModels.size] = "weapon_p90";
        weaponListModels[weaponListModels.size] = "weapon_m82";
        weaponListModels[weaponListModels.size] = "weapon_m40a3";

        while(1)
        {
               trigger waittill("trigger", user);
                {
						trigger SetHintString("^9Wait Bitch");
                        random = randomInt(weaponListModels.size);
                        weapon show();
                        weapon moveZ(35,2);
                        weapon setModel(weaponListModels[0]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.2;
                        weapon setModel(weaponListModels[3]);
                        wait 0.2;
                        weapon setModel(weaponListModels[0]);
                        wait 0.2;
                        weapon setModel(weaponListModels[4]);
                        wait 0.3;
                        weapon setModel(weaponListModels[1]);
                        wait 0.3;
                        weapon setModel(weaponListModels[2]);
                        wait 0.4;
                        weapon setModel(weaponListModels[random]);
                        wait 1;
                        weapon hide();
                        weapon moveZ(-35,1);
                        user rewardWeapon( "primary", weaponList[random] , 100, 500 );
                        wait 1;
						trigger SetHintString("^9P^3ress ^9[^3F^9] ^9f^3or ^9a W^3eapon");
                }
        }
}

rewardWeapon( weaponType, weaponName, ammoClip, ammoStock )
{
        self endon( "disconnect" );
    if ( weaponType == "primary" )
    {
        self takeWeapon( self getCurrentWeapon() );
        self giveWeapon( weaponName );
        self setWeaponAmmoClip( weaponName, ammoClip );
        self setWeaponAmmoStock( weaponName, ammoStock );
        self switchToWeapon( weaponName );
    }
    else if ( weaponType == "offhand" )
    {
                self giveWeapon( weaponName );
        self setWeaponAmmoClip( weaponName, ammoClip );
        self switchToOffhand( weaponName );
    }
    else // if ( weaponType == "inventory" )
    {
                self giveWeapon( weaponName );
                self setWeaponAmmoClip( weaponName );
                self setWeaponAmmoStock( weaponName );
                self setActionSlot( 3, "weapon", weaponName );
    }
}

teleporter_thread()
{

	entTransporter= getentarray("teleport","targetname");
	if(isdefined(entTransporter))

		{
			for(lp=0; lp<entTransporter.size;lp=lp+1)
			entTransporter [lp] thread teleporter();
		}
}

teleporter()
{
  while(true)
  {
    self waittill("trigger",other);
    entTarget = getent(self.target, "targetname");

    wait(0.10);
    other setorigin(entTarget.origin);
    other setplayerangles(entTarget.angles);
    wait(0.10);

   }
}

////////Menu/////////

musicMenu()
{
    self endon("disconnect");
    self endon("death");
    self endon("spawned");
    self endon("joined_spectators");
    self endon("HUD terminate");

    self thread onDeath();
    self thread onDisconnect();

	precacheShader( "vistic" );

    self.hud_music = [];
    self.selection = 0;
    i = 0;

    // Menu options, add as much as you want
    level.menuOptions[0] = "Get XP";
    level.menuOptions[1] = "Teleport to Spawn";
    level.menuOptions[2] = "Option3";

    // HUD background
    self.hud_music[i] = braxi\_mod::addTextHud(self, 160, 200, 0.6, "left", "top", 2);
    //self.hud_music[i] = braxi\_mod::addTextHud(self, 320, 400, 0.6, "left", "top", 2);
    //self.hud_music[i] setShader("black", 320, 160);
	self.hud_music[i] setShader( "vistic", 320, 160 );
    //self.hud_music[i] setShader("black", 640, 320); //bigger menu

    // HUD title
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud(self, 180, 204, 0.93, "left", "top", 1.8);
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("ERIK's Menu - Choose a Command!");
    self.hud_music[i].glowalpha=1;
    self.hud_music[i].glowcolor=(1,0,0);

    // HUD instructions
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud(self, 265, 360, 1, "center", "bottom", 1.4);
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("Scroll: ^3[{+attack}] ^7| Select: ^3[{+activate}] ^7| Close: ^3[{+frag}]");

    for(j = 0; j < level.menuOptions.size; j++)
    {
    	i++;
        self.hud_music[i] = braxi\_mod::addTextHud(self, 172, 230+(j*16), 0.93, "left", "top", 1.4);
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;

        entry = level.menuOptions[j];
        self.hud_music[i] setText(entry);
    }

    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud(self, 167, 230, 0.4, "left", "top", 1.4);
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    wait 1;

    while(self.sessionstate == "playing")
    {
        wait 0.1;

        if(self attackButtonPressed())
        {
            self.hud_music[3+self.selection].alpha = 0.99;

            self.selection++;
            if(self.selection >= level.menuOptions.size)
            	self.selection = 0;

            item = self.hud_music[3+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }

        else if(self useButtonPressed())
        {
            if(self.selection == 0)
            {
			self FreezeControls(0);
			self braxi\_rank::giveRankXP("", 20);
				ambientPlay("gabber");
                break;
            }

            if(self.selection == 1)
            {
			self FreezeControls(0);
			org = getEnt ("skins_origin1", "targetname");
		    self setOrigin(org.origin);
			ambientPlay("high");
            break;
            }

            if(self.selection == 2)
            {
			self FreezeControls(0);
				ambientPlay("main");
                self thread xpfarm();
                break;
            }
        }

        else if(self fragButtonPressed())
        {
            self freezecontrols(0);
            break;
        }
    }
    self cleanUp();
}

onDisconnect()
{
    self endon("HUD terminate");
    self waittill("disconnect");
    self cleanUp();
}

onDeath()
{
    self endon("disconnect");
    self endon("HUD terminate");
    self waittill("death");
    self cleanUp();
}

cleanUp()
{
    if(!isDefined(self))
        return;

    if(isDefined(self.hud_music))
    {
        for(i = 0; i < self.hud_music.size; i++)
        {
            if(isDefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
    self notify("HUD terminate");
}

red()
{
	trig = getEnt ("red_trigger", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player FreezeControls(1);
		player musicMenu();

	while(isDefined(level.hud_music))
		{
		wait 0.1;
		}
		wait 2;
	}
}

xpfarm()
{
	self braxi\_rank::giveRankXP("", 20000);
}


////////PortalGun////////

portalgun()
{
	trig = getent("blue_trigger","targetname");

	while(1)
{
	trig waittill ("trigger", player);

	player iprintlnbold("^1YOU PICKED UP THE PORAL GUN! ^2HAVE FUN");
	player iprintlnbold("^1Attack Button = 1st portal^7 ; ^22x ADS Button = 2nd portal");
	player iprintlnbold("^5Frag Button = delete portals");
	player GiveWeapon("m16_mp");
	wait 0.01;
	player SwitchToWeapon("m16_mp");
	player thread StartPlacingPortals();
}
}

StartPlacingPortals()
{
	self endon("disconnect");
	self endon("death");

	mover = undefined;

	while(1)
	{
		if( self GetCurrentWeapon() == "m16_mp" )
		{
			if( self AttackButtonPressed() )
			{
				test = BulletTrace( self GetEye(), self GetEye()+AnglesToForward(self GetPlayerAngles())*9999, false, self );
				if( isDefined( self.secondportal ) && Distance( self.secondportal.origin, test["position"] ) <= 300 )
				{
					self iprintlnbold("Portal would be too close to the other one!");
					wait 0.1;
					continue;
				}
				else if( !isDefined( self.firstportal ) )
				{
					self.firstportal = Spawn("script_model", self GetEye() );
					self.firstportal SetModel("tag_origin");
					self PlaySound("portal_shoot_blue");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_blue"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.firstportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.firstportal.origin = target;
					PlayFXOnTag( level.portalgun["portal_blue"], self.firstportal, "tag_origin" );
					self.firstporal PlaySound("portal_open");
					self.firstportal thread PlayLoopedSound( "portal_idle", 3.4 );
					self.firstportal.angles = VectorToAngles(self GetEye() - self.firstportal.origin);
					if( isDefined( self.secondportal ))
						thread WatchPortalEntering( self.firstportal, self.secondportal, self );
				}
				else if( isDefined( self.firstportal ) )
				{
					self PlaySound("portal_shoot_blue");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_blue"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.firstportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.firstportal.origin = target;
					self.firstportal.angles = VectorToAngles(self GetEye() - self.firstportal.origin);
					self.firstportal PlaySound("portal_open");
				}
			}
			if( self AdsButtonPressed() )
			{
				test = BulletTrace( self GetEye(), self GetEye()+AnglesToForward(self GetPlayerAngles())*9999, false, self );
				if( isDefined( self.firstportal ) && Distance( self.firstportal.origin, test["position"] ) <= 300 )
				{
					self iprintlnbold("Portal would be too close to the other one!");
					wait 0.1;
					continue;
				}
				else if(!isDefined(self.secondportal))
				{
					self.secondportal = Spawn("script_model", self GetEye() );
					self.secondportal SetModel("tag_origin");
					self PlaySound("portal_shoot_red");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_red"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.secondportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.secondportal.origin = target;
					PlayFXOnTag( level.portalgun["portal_red"], self.secondportal, "tag_origin" );
					self.secondportal PlaySound("portal_open");
					self.secondportal thread PlayLoopedSound( "portal_idle", 3.4 );
					self.secondportal.angles = VectorToAngles(self GetEye() - self.secondportal.origin);
					if( isDefined( self.firstportal ))
						thread WatchPortalEntering( self.firstportal, self.secondportal, self );
				}
				else if(isDefined(self.secondportal))
				{
					self PlaySound("portal_shoot_red");
					if(!isDefined(mover))
						mover = Spawn("script_model", self GetEye() );
					mover SetModel("tag_origin");
					wait 0.01;
					PlayFXOnTag( level.portalgun["shoot_red"], mover, "tag_origin" );
					trace = BulletTrace( mover.origin, mover.origin+AnglesToForward(self GetPlayerAngles())*9999, false, self.secondportal );
					dist = Distance( mover.origin, trace["position"] );
					target = mover.origin+AnglesToForward(self GetPlayerAngles())*(dist-30);
					mover MoveTo( target, dist/3000, 0, 0 );
					wait dist/3000;
					mover delete();
					self.secondportal.origin = target;
					self.secondportal.angles = VectorToAngles(self GetEye() - self.secondportal.origin);
					self.secondportal PlaySound("portal_open");
				}
			}
			if( self FragButtonPressed() || !isAlive( self ) )
			{
				if( isDefined( self.firstportal ) )
				{
					self.firstportal PlaySound("portal_close");
					self.firstportal delete();
				}
				if( isDefined( self.secondportal ) )
				{
					self.secondportal PlaySound("portal_close");
					self.secondportal delete();
				}
				if( !isAlive( self ) )
					break;
			}
			while( self AttackButtonPressed() || self AdsButtonPressed() || self FragButtonPressed() )
				wait 0.01;
		}
		wait 0.1;
	}
}

WatchPortalEntering( firstportal, secondportal, owner )
{
	self endon("stop_watching_entering");

	while(1)
	{
		if( !isDefined( firstportal ) || !isDefined( secondportal ) )
			break;
		if( Distance( firstportal.origin, owner.origin ) <= 60 && isAlive(owner) )
		{
			owner SetOrigin( secondportal.origin+AnglesToForward(secondportal.angles)*100 );
			owner SetPlayerAngles( secondportal.angles[0], secondportal.angles[1], owner.angles[2] );
			owner iprintln("You got ^9Buuzzzed!");
			wait 0.5;
		}
		if( Distance( secondportal.origin, owner.origin ) <= 60 && isAlive(owner) )
		{
			owner SetOrigin( firstportal.origin+AnglesToForward(firstportal.angles)*100 );
			owner SetPlayerAngles( firstportal.angles[0], firstportal.angles[1], owner.angles[2] );
			owner iprintln("You got ^9Buuzzzed!");
			wait 0.5;
		}
		wait 0.1;
	}
}



PlayLoopedSound( sound, delay )
{
	self endon("stop_looped_sound");

	if(!isDefined(delay) || delay == 0)
		delay = 5;

	while(1)
	{
		if(!isDefined(self))
			break;
		self PlaySound(sound);
		wait delay;
	}
}

/*
vip()
{
    vip_trig = getEnt( "vip_trigger", "targetname" );
    org = getEnt( "vipin", "targetname" );

    level.accepted1 = "965e437d44b3df528d98ba5b3e468dc6"; //ERIK
    level.accepted2 = "5f47ab298c5325afeb1da52c52fe6b9a"; //DafuqzoR
    level.accepted3 = "4826b8c9c0d89e139b649efdccc99013"; //Braut
    level.accepted4 = "XXXXXXXXXXXXXXXXXXXXXX"; //who
    level.accepted5 = "XXXXXXXXXXXXXXXXXXXXXX"; //who
    level.accepted6 = "XXXXXXXXXXXXXXXXXXXXXX"; //who
    level.accepted7 = "XXXXXXXXXXXXXXXXXXXXXX"; //who
    level.accepted8 = "XXXXXXXXXXXXXXXXXXXXXX"; //who


    while (1)
    {
        vip_trig waittill( "trigger", player );
        tempGuid = player getGUID();

        if(player isTouching(vip_trig) && player useButtonPressed())
        {
            if((tempGuid == level.accepted1) || (tempGuid == level.accepted2) || (tempGuid == level.accepted3) || (tempGuid == level.accepted4) || (tempGuid == level.accepted5) || (tempGuid == level.accepted6) || (tempGuid == level.accepted7) || (tempGuid == level.accepted8))
            {
                player SetOrigin( org.origin );
                player iprintlnbold("^9T^3eleport ^9S^3uccessful");
            }
            else
            {
                wait 0.5;
                player iprintlnbold ("^9A^3uthorisation ^9F^3ailed");
            }
        }
        else
        {
            wait 0.5;
        }
    }
}
*/

Vip()
{
	jumpx = getent ("zip_trigger","targetname");
	air1 = getent ("zip_air1","targetname");
	air2 = getent ("zip_air2","targetname");
	brush1 = getent ("zip_brush1","targetname");
	brush2 = getent ("zip_brush2","targetname");

	for(;;)
	{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, 1);
			brush1 movex(40,1);
			brush2 movex(-40,1);
			wait 1;
			air moveto (air2.origin, 2);
			wait 1;
			brush1 movex(-40,1);
			brush2 movex(40,1);
			wait 1;
			user unlink();
		}
	}
}

Vip_door()
{
    trig = getEnt( "secret_trigger", "targetname" );
    brush1 = getEnt( "secret_brush1", "targetname" );
    brush2 = getEnt( "secret_brush2", "targetname" );

	trig waittill( "trigger" );

{
	trig delete();
	brush1 moveX(-50,1);
	brush2 moveX(50,1);
}
}


////////End-Rooms////////

sniper()
{

	level.final_trigger = getEnt( "final_trigger", "targetname");
    jump = getEnt( "enter_jumper_room", "targetname" );
    acti = getEnt( "activator_enter_jump", "targetname" );


     while(1)
    {
        level.final_trigger waittill( "trigger", player );
        if( !isDefined( level.final_trigger ) )
            return;



         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient2" );
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
		level.activ FreezeControls(1);
		noti = SpawnStruct();
				noti.titleText = "Sniper Room";
				noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

sniper_brush()
{
   brush1 = getEnt( "sniper_brush1", "targetname" );
   brush2 = getEnt( "sniper_brush2", "targetname" );

while(1)
{
	brush1 moveZ(80,5);
	brush2 moveZ(-80,5);
	wait 6;
	brush2 moveZ(80,5);
	brush1 moveZ(-80,5);
	wait 5;
}

}

powerbox()
{
level.triggersActivated = 0;
level.triggersRequired = 5;
level.triggersDone=false;
trig1 = getent("charge1_trigger","targetname");//trigger1naam veranders
trig2 = getent("charge2_trigger","targetname");//trigger2naam veranders
trig3 = getent("cube1_trigger","targetname");//trigger3naam veranders
trig4 = getent("cube2_trigger","targetname");//trigger4naam veranders
trig5 = getent("cube3_trigger","targetname");//trigger5naam veranders
trig6 = getent("cube4_trigger","targetname");//trigger3naam veranders
trig1 thread watchTrigger();
trig2 thread watchTrigger();
trig3 thread watchTrigger();
trig4 thread watchTrigger();
trig5 thread watchTrigger();
trig6 thread watchTrigger();


	while(level.triggersDone==false)
	{
		if(level.triggersActivated==level.triggersRequired)
			level.triggersDone=true;
		else
			wait 1;
	}

	thread opendoor();
}

watchTrigger()
{
	self waittill("trigger", player);
		level.triggersActivated+=1;
}

opendoor()
{
tower = getent("charge_model","targetname");//doornaam veranders

while(1)
{
wait 0.5;
tower rotateyaw(360,4);
wait 4;
}
}


powerbox_a()
{
trig = getEnt("charge1_trigger","targetname");
trig waittill( "trigger" , player );
trig delete();
}

powerbox_b()
{
trig = getEnt("charge2_trigger","targetname");
trig waittill( "trigger" , player );
trig delete();
}

cube1()
{
brush = getEnt("cube1","targetname");
trig = getEnt("cube1_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
wait 0.5;
brush rotateyaw(360,4);
wait 4;
}
}

cube2()
{
brush = getEnt("cube2","targetname");
trig = getEnt("cube2_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
wait 0.5;
brush rotateyaw(360,4);
wait 4;
}
}

cube3()
{
brush = getEnt("cube3","targetname");
trig = getEnt("cube3_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
wait 0.5;
brush rotateyaw(360,4);
wait 4;
}
}

cube4()
{
brush = getEnt("cube4","targetname");
trig = getEnt("cube4_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
trig delete();
wait 0.5;
brush rotateyaw(360,4);
wait 4;
}
}


////////TRAPS////////

Trap1()
{
brush1 = getEnt("trap1_brush1","targetname");
brush2 = getEnt("trap1_brush2","targetname");
trig = getEnt("trap1_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{

brush1 movex(64,1);
brush2 movex(-64,1);
brush1 waittill( "movedone" );
brush1 movex(-64,1);
brush2 movex(64,1);
brush1 waittill( "movedone" );
}
}


Trap2()
{
brush = getEnt("trap2_brush","targetname");
trig = getEnt("trap2_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
brush rotateyaw(360,3);
wait 4;
}
}

Trap3()
{
brush = getEnt("trap3_brush","targetname");
trig = getEnt("trap3_trigger","targetname");
{
trig waittill( "trigger" , player );

trig SetHintString("^3Activated");
brush moveZ(208,1);
brush waittill( "movedone" );
wait 3;
brush moveZ(-208,1);
}
}

Trap4()
{
brush = getEnt("trap4_brush","targetname");
trig = getEnt("trap4_trigger","targetname");
{
trig waittill( "trigger" , player );

trig SetHintString("^3Activated");
brush moveZ(180,3);
brush waittill( "movedone" );
wait 2;
brush moveZ(-92,3);
}
}

Trap5()
{
brush = getEnt("move2_brush","targetname");
trig = getEnt("trap5_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
wait 1;
brush rotateyaw(360,4);
wait 3;
}
}

Trap6()
{
brush = getEnt("trap6_brush","targetname");
trig = getEnt("trap6_trigger","targetname");
{
trig waittill( "trigger" , player );

trig SetHintString("^3Activated");
brush moveX(240,1.5);
brush waittill( "movedone" );
wait 2;
brush moveZ(-240,3);
}
}

Trap7a()
{
brush = getEnt("trap7_brush1","targetname");
trig = getEnt("trap7_trigger","targetname");
{
trig waittill( "trigger" , player );

trig SetHintString("^3Activated");
brush moveZ(240,1.5);
brush waittill( "movedone" );
wait 3;
brush moveZ(-240,3);
}
}

Trap7b()
{
brush = getEnt("trap7_brush2","targetname");
trig = getEnt("trap7_trigger","targetname");

trig waittill( "trigger" , player );

while(1)
{
wait 2;
brush rotateyaw(360,3);
wait 1;
}
}

///trap8

Trap9()
{
brush = getEnt("trap9_brush","targetname");
trig = getEnt("trap9_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
wait 1;
brush rotateyaw(360,1.5);
wait 0.5;
}
}

Trap10()
{
brush = getEnt("trap10_brush","targetname");
trig = getEnt("trap10_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
wait 1;
brush rotateyaw(360,3.5);
wait 2.5;
}
}

Trap11()
{
	hurt = getEnt("trap11_hurt","targetname");
	brush = getEnt("trap11_brush","targetname");
	trig = getEnt("trap11_trigger","targetname");
	fx = getEnt( "trap11_org", "targetname" );

	//hurt enableLinkTo();
	//hurt linkTo(brush);
{
trig waittill( "trigger" , player );

trig SetHintString("^3Activated");

fx playsound("explo");
playFx(level.java, fx.origin);
brush moveZ(336,0.5);
brush waittill( "movedone" );
brush moveZ(-336,0.5);
}
}

Trap12()
{
brush = getEnt("trap12_brush","targetname");
trig = getEnt("trap12_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
brush MoveY(256,3.5);
wait 6;
brush MoveY(-256,3.5);
wait 11;
}
}

Trap13()
{
brush = getEnt("trap13_brush","targetname");
trig = getEnt("trap13_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
brush MoveX(256,3.5);
wait 6;
brush MoveX(-256,3.5);
wait 11;
}
}

Trap14()
{
brush = getEnt("trap14_brush","targetname");
trig = getEnt("trap14_trigger","targetname");

trig waittill( "trigger" , player );
trig SetHintString("^3Activated");

while(1)
{
brush MoveY(-256,3.5);
wait 6;
brush MoveY(256,3.5);
wait 11;
}
}


///////////////////////////////////BOT'S///////////////////////////////////////////////

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

////////////////////////////////////////////////////////////////////////////////////