
                                        //`````Map by ABprice`````\\
                            //``````````````````````````````````````````````````\\
                           //```````````//////////////////////////////```````````\\
                          //````````````//   ________    ________   //````````````\\
                         //`````````````//  |  ____  |  |  ____  |  //`````````````\\
                        //``````````````//  | |    | |  | |    | |  //``````````````\\
                       //```````````````//  | |____| |  | |____| |  //```````````````\\
                      //````````````````//  |  ____  |  |  ____ <   //````````````````\\
                     //`````````````````//  | |    | |  | |    | |  //`````````````````\\
                    //``````````````````//  | |    | |  | |____| |  //``````````````````\\
                   //```````````````````//  |_|    |_|  |________|  //```````````````````\\
                  //````````````````````//                          //````````````````````\\
                 //`````````````````````//////////////////////////////`````````````````````\\
                //``````````````````````````````````````````````````````````````````````````\\ 
                                        //>Discord : ABprice#7183 <\\ 

#include maps\mp\_utility;
#include common_scripts\utility;
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
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("bg_fallDamageMinHeight","9998");
	setdvar("bg_fallDamageMaxHeight","9999");

	precacheItem("m40a3_mp");
	precacheItem("usp_mp");
	precacheItem("m60e4_mp");
	precacheItem("barrett_mp");
	precacheItem("remington700_mp");
	precacheItem("dragunov_mp");
	precacheItem("deserteagle_mp");
	precacheItem("p90_mp");
	precacheItem("ak47_mp");
	precacheItem("winchester1200_mp");
	precacheItem("m4_silencer_mp");
	precacheItem("m16_mp");
	precacheItem("g3_mp");
	precacheItem("g36c_silencer_mp");
	precacheItem("ak74u_mp");
	precacheItem("uzi_mp");
	precacheItem("skorpion_mp");
	precacheItem("rpd_mp");
	precacheItem("mp5_mp");
	precacheItem("frag_grenade_mp");
	precacheItem("rpg_mp");
	precacheItem("k7_mp");
	precacheItem("barrett_acog_mp");
	precacheItem("m14_acog_mp");
    
    PreCacheShader("ui_circle");

	precacheshader("mtl_dragonwarrior_legs");
	precacheshader("mtl_dragonwarrior_headmask");
	precacheshader("mtl_dragonwarrior_arms");
	precacheshader("mtl_dragonwarrior_face");
	precacheshader("mtl_dragonwarrior_upperbody");
	precacheModel("plr_terry_dragonwarrior");

	precacheshader("mtl_sylvanas_face");
	precacheshader("mtl_sylvanas_cape");
	precacheshader("mtl_sylvanas_hood");
	precacheshader("mtl_sylvanas_body");
	precacheModel("plr_terry_sylvanas");

	precacheshader("mtl_thanos_gauntlet");
	precacheshader("mtl_thanos_body");
	precacheshader("mtl_thanos_helmet");
	precacheshader("mtl_thanos_head");
	precacheModel("plr_terry_thanos");

	preCacheModel("lion");
	preCacheModel("viewhands_lion");
	preCacheModel("german_sheperd_dog");
	preCacheModel("dog_mp");

	level.PortalFX = loadFX("ab/fx_abprice_portal");
	level.PlayerLight = loadFX("ab/ab_playerlight");
	
	//=(Testing)=
	thread addTestClients();
	
    //=(Variables)=
	level.TrapData = [];
	level.StartOrigin = getEnt("start", "targetname");
	level.EndOrigin = getEnt("end", "targetname");
	level.ActiHQ = getEnt("acti_hq", "targetname");
	level.Stages = [];
	level.ArenaSelectionOri = getEnt("origin_arenaselection", "targetname");
	level.KillRoom_J = getEnt("killroom_j", "targetname");
	level.KillRoom_A = getEnt("killroom_a", "targetname");
	
	level.PlayerInRoom = "";
	level.DefHealth = 100;
	level.InfHealth = 1000000;
	level.ActivatorStageMoveScale = 2;
	level.CurrentRoom = "";
	level.CurrentActiStage_Activator = 0;
	level.CurrentActiStage_Jumper = 0;
 
	level.CurrentTeleTarget_Jumper = "";
	level.CurrentTeleTarget_Activator = "";
 
	level.ChoosedStages = [];
	level.ChoosedActivatorPoints = [];
	level.ChoosedActivatorBackPoints = [];
	level.MaxPoints = 10;
	level.ActiChoosedPoints = false;
	level.NightMode = false;
 
	level.ArenaWeap1 = "a";
	level.ArenaWeap2 = "a";
	level.ArenaRoomName= "a";
	level.EndRandomRoomPoints = [];
 
	level.Letters = [];
	level.LetterPoints = [];
	level.CirclePoints = [];
	
	//=(Map Essentials)=
	thread Start();
	thread TrapInfo();
	thread GetAllStages();
	thread NameAnimation();
	thread Portals();
	thread CheckStageFinish();
	thread CheckChooseStage();
	thread CheckFT();
	thread StageSelector();
	thread BottomMessages();
	thread VIP();
	thread AB();
	thread FreeGun();

	thread SetupRandomRoomPositions();
	thread room_selection();
	thread Arena_Selection();
	thread Acti_Prev();
	thread Acti_Next();
	
	thread WaitList();
	thread JumpPad();
	thread musicBox();
	
	level.WeaponList = [];
	level.WeaponList[0] = "m40a3_mp";
	level.WeaponList[1] = "usp_mp";
	level.WeaponList[2] = "m60e4_mp";
	level.WeaponList[3] = "barrett_mp";
	level.WeaponList[4] = "remington700_mp";
	level.WeaponList[5] = "dragunov_mp";
	level.WeaponList[6] = "deserteagle_mp";
	level.WeaponList[7] = "p90_mp";
	level.WeaponList[8] = "ak47_mp";
	level.WeaponList[9] = "winchester1200_mp";
	level.WeaponList[10] = "m4_silencer_mp";
	level.WeaponList[11] = "m16_mp";
	level.WeaponList[12] = "g3_mp";
	level.WeaponList[13] = "g36c_silencer_mp";
	level.WeaponList[14] = "ak74u_mp";
	level.WeaponList[15] = "uzi_mp";
	level.WeaponList[16] = "skorpion_mp";
	level.WeaponList[17] = "rpd_mp";
	level.WeaponList[18] = "mp5_mp";
	level.WeaponList[19] = "rpg_mp";
	level.WeaponList[20] = "k7_mp";
	level.WeaponList[21] = "barrett_acog_mp";
	level.WeaponList[22] = "knife_mp";

	//=(Moving Platforms)=
  
	//=(Rooms)=
	level.PlayerPoints = 0;
	level.ActiPoints = 0;
	//RPS
	level.RPS_PlayerChoosed = "";
	level.RPS_ActiChoosed = "";
	//CompleateShape
	level.CS_Balls = [];
	level.CS_Balls[0] = false;
	level.CS_Balls[1] = false;
	level.CS_Balls[2] = false;
	level.CS_Balls[3] = false;
	level.CS_Balls[4] = false;
	level.CS_Balls[5] = false;
	//CrossThe Road
	level.CTR_IsVehicalsRunning = false;
	//lava
	level.LAVA_Waiting = false;
	//Lasers
	level.L_Lasers = false;
	//sniperschool
	level.SNS_Trig = false;
	level.SNS_Points = 10;
	//rpg
	level.RPG_Trig = false;
	//GUNGAME
	level.PD = 0;
	level.AD = 0;
	level.GunGameGuns = [];
	level.GunGameGuns[0] = "usp_mp";
	level.GunGameGuns[1] = "ak47_mp";
	level.GunGameGuns[2] = "rpd_mp";
	level.GunGameGuns[3] = "remington700_mp";
	level.GunGameGuns[4] = "knife_mp";
	//Bomb Tag
	level.BT_CurrentHolder="";

	if(!isdefined(level.music))
	level.music=[];
	level.music[0]["song"]     ="      - Random Song -";
	level.music[0]["alias"]    ="";

	level.music[1]["song"]     ="     Keep Your Head Up";
	level.music[1]["alias"]    ="ab1";

	level.music[2]["song"]     ="Maybe You're The Problem";
	level.music[2]["alias"]    ="ab2";

	level.music[3]["song"]     ="        Chainsmokers";
	level.music[3]["alias"]    ="ab3";

	level.music[4]["song"]     ="            Quevedo";
	level.music[4]["alias"]    ="ab4";

	level.music[5]["song"]     ="               Run";
	level.music[5]["alias"]    ="ab5";

	level.music[6]["song"]     ="            Good Day";
	level.music[6]["alias"]    ="ab6";

	level.music[7]["song"]     ="       Ain't Your Mama";
	level.music[7]["alias"]    ="ab7";

	level.music[8]["song"]     ="            Finesse";
	level.music[8]["alias"]    ="ab8";

	level.music[9]["song"]     ="          Levitating";
	level.music[9]["alias"]    ="ab9";

	level.music[10]["song"]     ="         Complicated";
	level.music[10]["alias"]    ="ab10";

	level.endmusic=[];
	level.endmusic[0] ="end1";
	level.endmusic[1] ="end2";
	level.endmusic[2] ="end3";
	level.endmusic[3] ="end4";
	level.endmusic[4] ="end5";
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
         ent[i].pers["registered"] = 0;
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

AB()
{
	level waittill("round_started");
	noti = spawnStruct();
	wait 3;
	noti.titleText = "=(^2Welcome To Unique^7)=";
	noti.notifyText = "=(^5Map By ^3ABprice^7)=";
	noti.duration = 7;
	noti.glowcolor = (0, 0.8, 0.8);

	players = getEntArray("player", "classname");

	for	(i = 0; i < players.size; i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);
}

FreeGun()
{
    trigger = getEnt("trig_freegun", "targetname");
	trigger setHintString("=(^3Press ^6Use To ^3Get A Free Weapon^7)=");

    for (;;)
    {
		trigger waittill("trigger", player);
		player giveWeapon("deserteaglegold_mp");
		player giveMaxAmmo("deserteaglegold_mp");
		player switchToWeapon("deserteaglegold_mp");

		wait 0.5;
    }
}

Start()
{
	StartDoor = getEnt("startdoor", "targetname");
	level waittill("round_started");
	rand = randomInt(10);
	if(rand==0)
	{
		visionSetNaked("mp_dr_unique_night", 2);
		SendScreenMessage("ALL","^5Night Mode","",5);
		level.NightMode = true;
	}
	thread SetModels(level.activ,false,"plr_terry_dragonwarrior");
	iPrintLnBold("=(^2Please Waittill Activator Chooses The Max Stages Amount <10s>^7)=");
	level.activ iPrintLnBold("=(^9Activator, You Have 10 Seconds To Choose Max Stages Count^7)=");
	for(i=0;i<10;i++)
	{
		iPrintLn("=(^9"+(i+1)+"^7)=");
		wait 1;
	}
	if(level.ActiChoosedPoints==false)
	{
		self notify("ChoosedStage");
		iPrintLnBold("=(^1Activator Didn't Choosed Max Stages Count^7.^3 Choosing Random Amount^7)=");
		level.MaxPoints = RandomIntRange(2,4);
	}
	else
	{
		iPrintLnBold("=(^1Please Wait"+"^7, ^1Choosing Stages^7)=");
	}
	ChooseStages();
	wait 2;
	iPrintLnBold("=(^5Choosed ^9"+level.MaxPoints+"^5 Stages, ^6Starting..^7, ^5GO^1!^7)=");
	//TeleportPlayer(false,level.activ,level.ActiHQ,0,"",false);
	wait 1;
	StartDoor movez(-368,3);
}

musicBox()
{
    trig = getEnt("trig_music","targetname");
    trig setHintString("=(^3Press ^6Use ^3To Choose Music^7)=");
    trig waittill("trigger",p);
    trig setHintString("=(^3Already Playing^7)=");
    p freezeControls(1);
    p musicMenu();
	p braxi\_rank::giveRankXP("", 100);
}

musicMenu()
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
    self.hud_music[i] = braxi\_mod::addTextHud( self, 180, 160, 1, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "ui_circle", 300, 300);
	self.hud_music[i].color=(0.2,0.4,0.5);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 280, 180, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "ui_circle", 100, 25 );
    self.hud_music[i].color=(0,0.5,0.5);
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 180, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("                         =(^5Unique^7)=");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else 
        self.hud_music[i].glowcolor=(0,0.5,0.5);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 330, 480, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
	self.hud_music[i].glowalpha=1;
    self.hud_music[i] setText("^0[CLICK] Next  |  [USE] Choose");
	self.hud_music[i].glowcolor=(0,0.5,0.5);
 
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 225, 210+(j*20), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        if(isdefined(level.randomcolor))
            self.hud_music[i].glowcolor=level.randomcolor;
        else 
            self.hud_music[i].glowcolor=(0,0.5,0.5);
 
        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 215, 210, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white",230, 17 );
    indicator.color=(1,1,1);
	wait 0.5;
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
			if(self.selection==0)
			{
				rnd = randomIntRange(1,level.music.size);
				ambientPlay(level.music[rnd]["alias"]);
				iPrintLn("=(^2Now playing^7: ^2"+level.music[rnd]["song"] + "^7)=");
			}
			else
			{
				ambientPlay(level.music[self.selection]["alias"]);
				iPrintLn("=(^2Now playing^7: ^2"+level.music[self.selection]["song"] + "^7)=");
			} 
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

BottomMessages()
{
	WaitTime = 8;
	for(;;)
	{	
		iPrintLn("=(^5mp_dr_unique^7)=");
		wait WaitTime;
		iPrintLn("=(^5Map Made By ^2ABprice^7)=");
		wait WaitTime;
		iPrintLn("=(^5Discord ^7: ^2ABprice#7183^7)=");
		wait WaitTime;
		iPrintLn("=(^5This Is Made With Lots Of Struggles. Hope You Enjoy!^7)=");
		wait WaitTime;
		iPrintLn("=(^5Huge Thanks To ^2ERIK^7)=");
		wait WaitTime;
		iPrintLn("=(^5Thanks To Testers ^7: ^2FNRP-Muffinator^7, ^2blu^7, ^2#FNRP#Arfy^7, \n^2#FNRP# A D A M^7, ^2#Zsever#Moddedgolem^7, ^2THEYAKUZI^7, ^2emily...^7)=");
		wait WaitTime;
		iPrintLn("=(^5Thanks To : ^2ERIK^7, ^2FNRP-Muffinator^7, ^2blu^7, ^2#Zsever#Raswer^7, ^2#FNRP#Arfy ^7)=");
		wait WaitTime;
		iPrintLn("=(^5Custom Items By ^7: ^2VC'Fox^7, ^2Rex109^7, ^2Terry^7, ^2Sanya^7)=");
		wait WaitTime;
		iPrintLn("=(^5 ^250 ^5End Rooms^7, ^231 ^5Stages^7)=");
		wait WaitTime;
		iPrintLn("=(^5No Secrets^7)=");
		wait WaitTime;
		iPrintLn("=(^5Thanks For Playing!^7)=");
		wait WaitTime;
	}
}

VIP()
{
	trig = getent("trig_vip", "targetname");
	trig setHintString("=(^3Vip Check^7)=");

	while (1)
	{
		trig waittill("trigger", player);

		if (player isVip(player getGuid()) == "abprice")
		{
			noti = spawnStruct();
			noti.titleText = "=(^6Recieved A Gift From ABprice^7)=";
			noti.notifyText = "=(^5Thanks For Playing!^7)=";
			noti.glowColor = (0, 0.1, 0.9);
			noti.duration = 4;

			players = getEntArray("player", "classname");

			for (i = 0; i < players.size; i++)
			{
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);
				players[i] braxi\_rank::giveRankXP("", 1000);
			}

			player giveWeapon("barrett_acog_mp");
			player giveMaxAmmo("barrett_acog_mp");
			player giveWeapon("k7_mp");
			player giveMaxAmmo("k7_mp");
			player switchToWeapon("barrett_acog_mp");
			player detachAll(); // need this to prevent 128 bones error
			player setModel("plr_terry_sylvanas");
			player iPrintLnBold("=(^5You received Your Vip Kit^7!)=");
			wait 0.1;
		}
		else if (
			player isVip(player getGuid()) == "raswer" ||
			player isVip(player getGuid()) == "blade" ||
			player isVip(player getGuid()) == "erik" ||
			player isVip(player getGuid()) == "lateax" ||
			player isVip(player getGuid()) == "rex" ||
			player isVip(player getGuid()) == "modded" ||
			player isVip(player getGuid()) == "muffin" ||
			player isVip(player getGuid()) == "blu" ||
			player isVip(player getGuid()) == "arfy" ||
			player isVip(player getGuid()) == "adam" ||
			player isVip(player getGuid()) == "fox" ||
			player isVip(player getGuid()) == "they" ||
			player isVip(player getGuid()) == "emi" ||
			player isVip(player getGuid()) == "rotola"
		)
		{
			player giveWeapon("barrett_acog_mp");
			player giveMaxAmmo("barrett_acog_mp");
			player giveWeapon("k7_mp");
			player giveMaxAmmo("k7_mp");
			player switchToWeapon("k7_mp");
			player detachAll();
			player setModel("plr_terry_thanos");
			player iPrintLnBold("=(^5You received Your Vip Kit^7!)=");

			wait 0.1;
		}
		else if (player isVip(player getGuid()) == "false")
		{
			player iPrintLnBold("=(^5VIP Only!^7, ^5Sorry^7)=");
			wait 0.1;
		}
	}
}

isVip(guid)
{
	gametag = self.name;

	if (gametag == "#Zsever#ABprice" || gametag == "ABprice")
		return "abprice";
	else if (self longGuid(guid) == "6fa8ddc1")
		return "fox";
	else if (self shortGuid(guid) == "93154423")
		return "lateax";
	else if (self longGuid(guid) == "63fb7e4c")
		return "raswer";
	else if (gametag == "VC' Blade")
		return "blade";
	else if (gametag == "ERIK")
		return "erik";
	else if (gametag == "Ohh Rexy<3")
		return "rex";
	else if (gametag == "Muffinator" || gametag == "FNRP-Muffinator" )
		return "muffin";
	else if (gametag == "blu" || gametag == "#FNRP#blu" || gametag == "#FNRP#Blu") 
		return "blu";
	else if (gametag == "Arfy" || gametag == "#FNRP#Arfy") 
		return "arfy";	
	else if (gametag == "emily...") 
		return "emi";
	else if (gametag == "A D A M" || gametag == "#FNRP# A D A M") 
		return "adam";
	else if (gametag == "THEYAKUZI") 
		return "they";
	else if (gametag == "Ohh Rexy<3")
		return "rex";
	else if (gametag =="#Zsever#Moddedgolem" || gametag == "Moddedgolem")
		return "modded";
	else if (self longGuid(guid) == "4b80762a")
		return "rotola";
	else
		return "false";
}

longGuid(guid)
{
	return getSubstr(guid, 24, 32);
}

shortGuid(guid)
{
	return getSubstr(guid, 11, 19);
}


GetAllStages()
{
	for (i = 1; i < 32; i++) 
	{
		Ori = getEnt("_Stage"+i, "targetname");
		level.Stages[level.Stages.size] = Ori;
		wait 0.01;
	}
}

StageSelector()
{
	StageSelector1 = getEnt("StageSelector_1", "targetname");
	StageSelector2 = getEnt("StageSelector_2", "targetname");
	StageSelector3 = getEnt("StageSelector_3", "targetname");
	thread WaitTillSelectStages(StageSelector1,2);
	thread WaitTillSelectStages(StageSelector2,3);
	thread WaitTillSelectStages(StageSelector3,4);
}

WaitTillSelectStages(Tr,Count)
{
	level endon("ChoosedStage");
	Tr waittill("trigger", player);
	FinishStageSelector(Count);
}

FinishStageSelector(Count)
{
	StageSelector1 = getEnt("StageSelector_1", "targetname");
	StageSelector2 = getEnt("StageSelector_2", "targetname");
	StageSelector3 = getEnt("StageSelector_3", "targetname");

	StageSelector1 delete();
	StageSelector2 delete();
	StageSelector3 delete();

	level.MaxPoints = Count;
	level.ActiChoosedPoints = true;
	iPrintLnBold("=(^9Activator Choosed ^4"+level.MaxPoints+" Stages ^7)=");
	level notify("ChoosedStage");
}

ChooseStages()
{
	SetupActivatorOffsets();
	while(true)
	{
		if(level.ChoosedStages.size==level.MaxPoints)
		{
			break;
		}
		rnd = randomInt(level.Stages.size);
		a=true;
		for(i=0;i<level.ChoosedStages.size;i++)
		{
			if(level.ChoosedStages[i]==level.Stages[rnd])
			{
				a=false;
				break;
			}
		}
		if(a==true)
		{
			level.ChoosedStages[level.ChoosedStages.size] = level.Stages[rnd];
			level.ChoosedActivatorPoints[level.ChoosedActivatorPoints.size] = level.ActivatorOffsetPoints[rnd];
			level.ChoosedActivatorBackPoints[level.ChoosedActivatorBackPoints.size] = level.ActivatorOffsetPoints[rnd + 31];
			thread TrapGroup(rnd);
		}
		wait 0.01;
	}
}

Acti_Next()
{
	Trigger = getent("ActiStage_Next", "targetname");
	Trigger setHintString("=(^5Press ^6Use ^5To Teleport To Next Stage^7)=");
	for(;;)
	{
		trigger waittill("trigger",player);
		player SetMoveSpeedScale(level.ActivatorStageMoveScale);
		if (player.pers["team"] == "allies")
		{
			if(level.CurrentActiStage_Jumper == level.ChoosedStages.size)
			{
				TeleportPlayer(false,player,level.ActiHQ,0.1,"",false);
				level.CurrentActiStage_Jumper = 0;
			}
			else
			{
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Jumper].origin + level.ChoosedActivatorPoints[level.CurrentActiStage_Jumper];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Jumper].angles;

				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
				level.CurrentActiStage_Jumper++;
			}
		}
		else
		{
			if(level.CurrentActiStage_Activator == level.ChoosedStages.size)
			{
				TeleportPlayer(false,player,level.ActiHQ,0.1,"",false);
				level.CurrentActiStage_Activator = 0;
			}
			else
			{
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Activator].origin + level.ChoosedActivatorPoints[level.CurrentActiStage_Activator];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Activator].angles;

				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
				level.CurrentActiStage_Activator++;
			}
		}
	}
}

Acti_Prev()
{
	Trigger = getent("ActiStage_Prev", "targetname");
	Trigger setHintString("=(^5Press ^6Use ^5To Teleport To Previous Stage^7)=");
	ActiHQ = getent("acti_hq", "targetname");
	for(;;)
	{
		trigger waittill("trigger",player);
		player SetMoveSpeedScale(level.ActivatorStageMoveScale);
		if (player.pers["team"] == "allies")
		{
			if(level.CurrentActiStage_Jumper == 1)
			{
				level.CurrentActiStage_Jumper = 0;
				TeleportPlayer(false,player,level.ActiHQ,0.1,"",false);
			}
			else if(level.CurrentActiStage_Jumper == 0)
			{
				level.CurrentActiStage_Jumper = level.ChoosedStages.size;
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Jumper-1].origin + level.ChoosedActivatorBackPoints[level.ChoosedActivatorBackPoints.size-1];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Jumper-1].angles * -1;
				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
			}
			else
			{
				level.CurrentActiStage_Jumper--;
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Jumper - 1].origin + level.ChoosedActivatorBackPoints[level.CurrentActiStage_Jumper - 1];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Jumper - 1].angles * -1;
				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
			}
		}
		else
		{
			if(level.CurrentActiStage_Activator == 1)
			{
				level.CurrentActiStage_Activator = 0;
				TeleportPlayer(false,player,level.ActiHQ,0.1,"",false);
			}
			else if(level.CurrentActiStage_Activator == 0)
			{
				level.CurrentActiStage_Activator = level.ChoosedStages.size;
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Activator-1].origin + level.ChoosedActivatorBackPoints[level.ChoosedActivatorBackPoints.size-1];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Activator-1].angles * -1;
				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
			}
			else
			{
				level.CurrentActiStage_Activator--;
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Activator - 1].origin + level.ChoosedActivatorBackPoints[level.CurrentActiStage_Activator - 1];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Activator - 1].angles * -1;
				TeleportPlayer_Pos(false,player,Info,0.1,"",false);
			}
		}
	}
}


ResetName()
{
	for(i=0;i<level.Letters.size;i++)
	{
		level.Letters[i] moveTo(level.LetterPoints[i],0.2);
		wait 0.03;
	}
	wait 1;
}

NameAnimation()
{
	level.Letters[0]  = getEnt("name_u" , "targetname");
	level.Letters[1]  = getEnt("name_n" , "targetname");
	level.Letters[2]  = getEnt("name_i" , "targetname");
	level.Letters[3]  = getEnt("name_q" , "targetname");
	level.Letters[4] = getEnt("name_u2", "targetname");
	level.Letters[5]  = getEnt("name_e" , "targetname");

	level.LetterPoints[0]  = (-11680.00,2640.00,10608.00);
	level.LetterPoints[1]  = (-11008.00,2640.00,10608.00);
	level.LetterPoints[2]  = (-10304.00,2640.00,10608.00);
	level.LetterPoints[3]  = (-9600.00,2640.00,10608.00);
	level.LetterPoints[4]  = (-8928.00,2640.00,10608.00);
	level.LetterPoints[5]  = (-8288.00,2640.00,10608.00);


	level.CirclePoints[0] = (-12000.00,2640.00,10736.00);
	level.CirclePoints[1] = (-11744.00,2640.00,11440.00);
	level.CirclePoints[2] = (-11104.00,2640.00,11824.00);
	level.CirclePoints[3] = (-10400.00,2640.00,12144.00);
	level.CirclePoints[4] = (-9568.00,2640.00,12144.00);
	level.CirclePoints[5] = (-8864.00,2640.00,11824.00);
	level.CirclePoints[6] = (-8224.00,2640.00,11440.00);
	level.CirclePoints[7] = (-7968.00,2640.00,10736.00);
	level.CirclePoints[8] = (-8608.00,2640.00,9648.00);
	level.CirclePoints[9] = (-9568.00,2640.00,10224.00);
	level.CirclePoints[10] = (-10400.00,2640.00,10224.00);
	level.CirclePoints[11] = (-11360.00,2640.00,9648.00);

	for(;;)
	{
		ResetName();
		Random = randomIntRange(0,6);
		if(Random == 0)		{NameAnim1();}
		else if(Random == 1){NameAnim2();}
		else if(Random == 2){NameAnim3();}
		else if(Random == 3){NameAnim4();}
		else if(Random == 4){NameAnim5();}
		else                {NameAnim6();}
	}
}

NameAnim1()
{
		level.Letters[0] movez(220,0.1);
		wait 0.11;
		level.Letters[1] movez(220,0.1);
		wait 0.11;
		level.Letters[2] movez(220,0.1);
		wait 0.11;
		level.Letters[3] movez(220,0.1);
		wait 0.11;
		level.Letters[4] movez(220,0.1);
		wait 0.11;
		level.Letters[5] movez(220,0.1);
		wait 1;
		level.Letters[5] movez(-220,0.1);
		wait 0.11;
		level.Letters[4] movez(-220,0.1);
		wait 0.11;
		level.Letters[3] movez(-220,0.1);
		wait 0.11;
		level.Letters[2] movez(-220,0.1);
		wait 0.11;
		level.Letters[1] movez(-220,0.1);
		wait 0.11;
		level.Letters[0] movez(-220,0.1);
		wait 1;
}

NameAnim2()
{
	level.Letters[0] RotateYaw(1080,2);
	wait 0.2;
	level.Letters[1] RotateYaw(1080,2);
	wait 0.2;
	level.Letters[2] RotateYaw(1080,2);
	wait 0.2;
	level.Letters[3] RotateYaw(1080,2);
	wait 0.2;
	level.Letters[4] RotateYaw(1080,2);
	wait 0.2;
	level.Letters[5] RotateYaw(1080,2);
	wait 2;
}
NameAnim3_Point(i)
{
	i++;
	if(i>11)
	{
		return 0;
	}
	return i;
}

NameAnim3()
{
	CurrentPos = [];
	CurrentPos[0] = 0;
	CurrentPos[1] = 11;
	CurrentPos[2] = 10;
	CurrentPos[3] = 9;
	CurrentPos[4] = 8;
	CurrentPos[5] = 7;

	for(i=0;i<30;i++)
	{
		level.Letters[0]  MoveTo(level.CirclePoints[CurrentPos[0]],0.2);
		CurrentPos[0] = NameAnim3_Point(CurrentPos[0]);
		level.Letters[1]  MoveTo(level.CirclePoints[CurrentPos[1]],0.2);
		CurrentPos[1] = NameAnim3_Point(CurrentPos[1]);
		level.Letters[2]  MoveTo(level.CirclePoints[CurrentPos[2]],0.2);
		CurrentPos[2] = NameAnim3_Point(CurrentPos[2]);
		level.Letters[3]  MoveTo(level.CirclePoints[CurrentPos[3]],0.2);
		CurrentPos[3] = NameAnim3_Point(CurrentPos[3]);
		level.Letters[4] MoveTo(level.CirclePoints[CurrentPos[4]],0.2);
		CurrentPos[4] = NameAnim3_Point(CurrentPos[4]);
		level.Letters[5]  MoveTo(level.CirclePoints[CurrentPos[5]],0.2);
		CurrentPos[5] = NameAnim3_Point(CurrentPos[5]);
		wait 0.21;
	}
}

NameAnim4()
{
	for (i = 0; i < 2; i++) 
	{
		level.Letters[0] moveTo(level.CirclePoints[1],0.5);
		wait 0.2;
		level.Letters[1] moveTo(level.CirclePoints[2],0.5);
		wait 0.2;
		level.Letters[2] moveTo(level.CirclePoints[3],0.5);
		wait 0.2;
		level.Letters[3] moveTo(level.CirclePoints[4],0.5);
		wait 0.2;
		level.Letters[4] moveTo(level.CirclePoints[5],0.5);
		wait 0.2;
		level.Letters[5] moveTo(level.CirclePoints[6],0.5);
		wait 2;

		level.Letters[0] moveTo(level.CirclePoints[1] - (0,0,2000),0.5);
		wait 0.2;
		level.Letters[1] moveTo(level.CirclePoints[2] - (0,0,2000),0.5);
		wait 0.2;
		level.Letters[2] moveTo(level.CirclePoints[3] - (0,0,2000),0.5);
		wait 0.2;
		level.Letters[3] moveTo(level.CirclePoints[4] - (0,0,2000),0.5);
		wait 0.2;
		level.Letters[4] moveTo(level.CirclePoints[5] - (0,0,2000),0.5);
		wait 0.2;
		level.Letters[5] moveTo(level.CirclePoints[6] - (0,0,2000),0.5);
		wait 2;

		level.Letters[5] moveTo(level.LetterPoints[5],0.5);
		wait 0.2;
		level.Letters[4] moveTo(level.LetterPoints[4],0.5);
		wait 0.2;
		level.Letters[3] moveTo(level.LetterPoints[3],0.5);
		wait 0.2;
		level.Letters[2] moveTo(level.LetterPoints[2],0.5);
		wait 0.2;
		level.Letters[1] moveTo(level.LetterPoints[1],0.5);
		wait 0.2;
		level.Letters[0] moveTo(level.LetterPoints[0],0.5);
		wait 2;
	}
}

NameAnim5()
{
	for (j = 0; j < 5; j++) 
	{		
		for (i = 0; i < 6; i++) 
		{
			level.Letters[i] moveY(500,0.2);	
		}
		wait 0.2;
		for (i = 0; i < 6; i++) 
		{
			level.Letters[i] moveY(-500,0.2);	
		}
		wait 0.2;
	}
	wait 1;
}

NameAnim6()
{
	for (i = 0; i < 6; i++) 
	{
		level.Letters[i] hide();
	}
	for (i = 0; i < 6; i++) 
	{
		wait 0.5;
		level.Letters[i] show();
	}
	for (i = 0; i < 6; i++) 
	{
		level.Letters[i] hide();
	}
	for (i = 5; i >= 0; i--) 
	{
		wait 0.5;
		level.Letters[i] show();
	}
}

TrapInfo()
{
	level.TrapData[0] = [];       		
	level.TrapData[0][0] = "DELETE";			////level.TrapData[31] = []; level.TrapData[31][0] = "HIDE"; level.TrapData[31][1] = "HIDE"; level.TrapData[31][2] = "HIDE"; level.TrapData[31][3] = "HIDE"; level.TrapData[31][4] = "HIDE";
	level.TrapData[0][1] = "NONE";				//level.TrapData[32] = []; level.TrapData[32][0] = "Z"; level.TrapData[32][1] = -32; level.TrapData[32][2] = 1; level.TrapData[32][3] = 1;
	level.TrapData[0][2] = "ROTATE_LOOP";		level.TrapData[33] = []; level.TrapData[33][0] = "YAW"; level.TrapData[33][1] = (360*5); level.TrapData[33][2] = 4; level.TrapData[33][3] = 4;
	level.TrapData[0][3] = "ROTATE_LOOP";		level.TrapData[34] = []; level.TrapData[34][0] = "YAW"; level.TrapData[34][1] = (360*5); level.TrapData[34][2] = 4; level.TrapData[34][3] = 4;
	level.TrapData[0][4] = "DELETE";			////level.TrapData[35] = []; level.TrapData[35][0] = "HIDE"; level.TrapData[35][1] = "HIDE"; level.TrapData[35][2] = "HIDE"; level.TrapData[35][3] = "HIDE"; level.TrapData[35][4] = "HIDE";

	level.TrapData[1] = [];		  		
	level.TrapData[1][0] = "DELETE";			//level.TrapData[36] = []; level.TrapData[36][0] = "HIDE"; level.TrapData[36][1] = "HIDE"; level.TrapData[36][2] = "HIDE"; level.TrapData[36][3] = "HIDE"; level.TrapData[36][4] = "HIDE";
	level.TrapData[1][1] = "DELETE";			//level.TrapData[37] = []; level.TrapData[37][0] = "HIDE"; level.TrapData[37][1] = "HIDE"; level.TrapData[37][2] = "HIDE"; level.TrapData[37][3] = "HIDE"; level.TrapData[37][4] = "HIDE";
	level.TrapData[1][2] = "DELETE";		    //level.TrapData[38] = []; level.TrapData[38][0] = "PITCH"; level.TrapData[38][1] = 360; level.TrapData[38][2] = "HIDE"; level.TrapData[38][3] = "HIDE"; level.TrapData[38][4] = "HIDE";
	level.TrapData[1][3] = "NONE";				//level.TrapData[39] = []; level.TrapData[39][0] = "PITCH"; level.TrapData[39][1] = 360; level.TrapData[39][2] = 2; level.TrapData[39][3] = 3;
	level.TrapData[1][4] = "ROTATE_LOOP";		level.TrapData[40] = []; level.TrapData[40][0] = "PITCH"; level.TrapData[40][1] = 360; level.TrapData[40][2] = 2; level.TrapData[40][3] = 6; 

	level.TrapData[2] = [];		  		
	level.TrapData[2][0] = "DELETE";			//level.TrapData[41] = []; level.TrapData[41][0] = "HIDE"; level.TrapData[41][1] = "HIDE"; level.TrapData[41][2] = "HIDE"; level.TrapData[41][3] = "HIDE"; level.TrapData[41][4] = "HIDE";
	level.TrapData[2][1] = "NONE";				//level.TrapData[42] = []; level.TrapData[42][0] = "HIDE"; level.TrapData[42][1] = "HIDE"; level.TrapData[42][2] = "HIDE"; level.TrapData[42][3] = "HIDE"; level.TrapData[42][4] = "HIDE";
	level.TrapData[2][2] = "ROTATE_LOOP";		level.TrapData[43] = []; level.TrapData[43][0] = "PITCH"; level.TrapData[43][1] = (360 * 3); level.TrapData[43][2] = 4; level.TrapData[43][3] = 4;
	level.TrapData[2][3] = "DELETE";			//level.TrapData[44] = []; level.TrapData[44][0] = "HIDE"; level.TrapData[44][1] = "HIDE"; level.TrapData[44][2] = "HIDE"; level.TrapData[44][3] = "HIDE"; level.TrapData[44][4] = "HIDE";
	//level.TrapData[2][4] = "HIDE";			level.TrapData[45] = []; level.TrapData[45][0] = "HIDE"; level.TrapData[45][1] = "HIDE"; level.TrapData[45][2] = "HIDE"; level.TrapData[45][3] = "HIDE"; level.TrapData[45][4] = "HIDE";

	level.TrapData[3] = [];       		
	level.TrapData[3][0] = "DELETE";			//level.TrapData[46] = []; level.TrapData[46][0] = "HIDE"; level.TrapData[46][1] = "HIDE"; level.TrapData[46][2] = "HIDE"; level.TrapData[46][3] = "HIDE"; level.TrapData[46][4] = "HIDE";
	level.TrapData[3][1] = "NONE";				//level.TrapData[47] = []; level.TrapData[47][0] = "Y"; level.TrapData[47][1] = 192; level.TrapData[47][2] = 0.5; level.TrapData[47][3] = 2;
	level.TrapData[3][2] = "MOVE_WITH_TRIGGER";	level.TrapData[48] = []; level.TrapData[48][0] = "Z"; level.TrapData[48][1] = -384; level.TrapData[48][2] = 0.5; level.TrapData[48][3] = 2;
	level.TrapData[3][3] = "MOVE_WITH_TRIGGER";	level.TrapData[49] = []; level.TrapData[49][0] = "Z"; level.TrapData[49][1] = -384; level.TrapData[49][2] = 0.5; level.TrapData[49][3] = 2;
	level.TrapData[3][4] = "DELETE";			//level.TrapData[50] = []; level.TrapData[50][0] = "HIDE"; level.TrapData[50][1] = "HIDE"; level.TrapData[50][2] = "HIDE"; level.TrapData[50][3] = "HIDE"; level.TrapData[50][4] = "HIDE";

	level.TrapData[4] = [];       		
	level.TrapData[4][0] = "NONE";				//level.TrapData[51] = []; level.TrapData[51][0] = "HIDE"; level.TrapData[51][1] = "HIDE"; level.TrapData[51][2] = "HIDE"; level.TrapData[51][3] = "HIDE"; level.TrapData[51][4] = "HIDE";
	level.TrapData[4][1] = "DELETE";			//level.TrapData[52] = []; level.TrapData[52][0] = "HIDE"; level.TrapData[52][1] = "HIDE"; level.TrapData[52][2] = "HIDE"; level.TrapData[52][3] = "HIDE"; level.TrapData[52][4] = "HIDE";
	level.TrapData[4][2] = "MOVE_LOOP";			level.TrapData[53] = []; level.TrapData[53][0] = "Z"; level.TrapData[53][1] = -32; level.TrapData[53][2] = 1; level.TrapData[53][3] = 1;
	level.TrapData[4][3] = "DELETE";			//level.TrapData[54] = []; level.TrapData[54][0] = "HIDE"; level.TrapData[54][1] = "HIDE"; level.TrapData[54][2] = "HIDE"; level.TrapData[54][3] = "HIDE"; level.TrapData[54][4] = "HIDE";
	//level.TrapData[4][4] = "HIDE";			level.TrapData[55] = []; level.TrapData[55][0] = "HIDE"; level.TrapData[55][1] = "HIDE"; level.TrapData[55][2] = "HIDE"; level.TrapData[55][3] = "HIDE"; level.TrapData[55][4] = "HIDE";

	level.TrapData[5] = [];       		
	level.TrapData[5][0] = "ROTATE_LOOP";		level.TrapData[56] = []; level.TrapData[56][0] = "ROLL"; level.TrapData[56][1] = 360; level.TrapData[56][2] = 1; level.TrapData[56][3] = 3;
	level.TrapData[5][1] = "ROTATE_LOOP";		level.TrapData[57] = []; level.TrapData[57][0] = "ROLL"; level.TrapData[57][1] = -360; level.TrapData[57][2] = 1; level.TrapData[57][3] = 3;
	level.TrapData[5][2] = "NONE";				//level.TrapData[58] = []; level.TrapData[58][0] = "ROLL"; level.TrapData[58][1] = 360; level.TrapData[58][2] = 1; level.TrapData[58][3] = 3;
	level.TrapData[5][3] = "MOVE_LOOP";			level.TrapData[59] = []; level.TrapData[59][0] = "Z"; level.TrapData[59][1] = -112; level.TrapData[59][2] = 1; level.TrapData[59][3] = 3;
	level.TrapData[5][4] = "ROTATE_LOOP";		level.TrapData[60] = []; level.TrapData[60][0] = "ROLL"; level.TrapData[60][1] = 360; level.TrapData[60][2] = 1; level.TrapData[60][3] = 3;

	level.TrapData[6] = [];            
	level.TrapData[6][0] = "DELETE";			//level.TrapData[61] = []; level.TrapData[61][0] = "HIDE"; level.TrapData[61][1] = "HIDE"; level.TrapData[61][2] = "HIDE"; level.TrapData[61][3] = "HIDE"; level.TrapData[61][4] = "HIDE";
	level.TrapData[6][1] = "MOVE_LOOP";			level.TrapData[62] = []; level.TrapData[62][0] = "X"; level.TrapData[62][1] = -192; level.TrapData[62][2] = 2; level.TrapData[62][3] = 3;
	level.TrapData[6][2] = "MOVE_LOOP";			level.TrapData[63] = []; level.TrapData[63][0] = "X"; level.TrapData[63][1] = 192; level.TrapData[63][2] = 2; level.TrapData[63][3] = 3;
	level.TrapData[6][3] = "MOVE_LOOP";			level.TrapData[64] = []; level.TrapData[64][0] = "Z"; level.TrapData[64][1] = -192; level.TrapData[64][2] = 2; level.TrapData[64][3] = 3;
	level.TrapData[6][4] = "NONE";				//level.TrapData[65] = []; level.TrapData[65][0] = "Z"; level.TrapData[65][1] = 192; level.TrapData[65][2] = 2; level.TrapData[65][3] = 3;

	level.TrapData[7] = [];
	level.TrapData[7][0] = "HIDE_SHOW";			level.TrapData[66] = []; level.TrapData[66][0] = 2;
	level.TrapData[7][1] = "DELETE";			//level.TrapData[67] = []; level.TrapData[67][0] = "HIDE"; level.TrapData[67][1] = "HIDE"; level.TrapData[67][2] = "HIDE"; level.TrapData[67][3] = "HIDE"; level.TrapData[67][4] = "HIDE";
	level.TrapData[7][2] = "ROTATE_LOOP";		level.TrapData[68] = []; level.TrapData[68][0] = "YAW"; level.TrapData[68][1] = 360; level.TrapData[68][2] = 5; level.TrapData[68][3] = 5;
	level.TrapData[7][3] = "MOVE_LOOP";			level.TrapData[69] = []; level.TrapData[69][0] = "Z"; level.TrapData[69][1] = -128; level.TrapData[69][2] = 2; level.TrapData[69][3] = 3;
	level.TrapData[7][4] = "MOVE_LOOP";			level.TrapData[70] = []; level.TrapData[70][0] = "Y"; level.TrapData[70][1] = 176; level.TrapData[70][2] = 0.5; level.TrapData[70][3] = 3;

	level.TrapData[8] = [];       		
	level.TrapData[8][0] = "DELETE";			//level.TrapData[71] = []; level.TrapData[71][0] = "HIDE"; level.TrapData[71][1] = "HIDE"; level.TrapData[71][2] = "HIDE"; level.TrapData[71][3] = "HIDE"; level.TrapData[71][4] = "HIDE";
	level.TrapData[8][1] = "DELETE";			//level.TrapData[72] = []; level.TrapData[72][0] = "HIDE"; level.TrapData[72][1] = "HIDE"; level.TrapData[72][2] = "HIDE"; level.TrapData[72][3] = "HIDE"; level.TrapData[72][4] = "HIDE";
	level.TrapData[8][2] = "DELETE";			//level.TrapData[73] = []; level.TrapData[73][0] = "HIDE"; level.TrapData[73][1] = "HIDE"; level.TrapData[73][2] = "HIDE"; level.TrapData[73][3] = "HIDE"; level.TrapData[73][4] = "HIDE";
	//level.TrapData[8][3] = "HIDE";			level.TrapData[74] = []; level.TrapData[74][0] = "HIDE"; level.TrapData[74][1] = "HIDE"; level.TrapData[74][2] = "HIDE"; level.TrapData[74][3] = "HIDE"; level.TrapData[74][4] = "HIDE";
	//level.TrapData[8][4] = "HIDE";			level.TrapData[75] = []; level.TrapData[75][0] = "HIDE"; level.TrapData[75][1] = "HIDE"; level.TrapData[75][2] = "HIDE"; level.TrapData[75][3] = "HIDE"; level.TrapData[75][4] = "HIDE";

	level.TrapData[9] = [];  
	level.TrapData[9][0] = "DELETE";			//level.TrapData[76] = []; level.TrapData[76][0] = "HIDE"; level.TrapData[76][1] = "HIDE"; level.TrapData[76][2] = "HIDE"; level.TrapData[76][3] = "HIDE"; level.TrapData[76][4] = "HIDE";
	level.TrapData[9][1] = "ROTATE_LOOP";		level.TrapData[77] = []; level.TrapData[77][0] = "PITCH"; level.TrapData[77][1] = -360; level.TrapData[77][2] = 1; level.TrapData[77][3] = 3;
	level.TrapData[9][2] = "ROTATE_LOOP";		level.TrapData[78] = []; level.TrapData[78][0] = "YAW"; level.TrapData[78][1] = 360; level.TrapData[78][2] = 5; level.TrapData[78][3] = 5;
	level.TrapData[9][3] = "NONE";				//level.TrapData[79] = []; level.TrapData[79][0] = "PITCH"; level.TrapData[79][1] = 360; level.TrapData[79][2] = 1; level.TrapData[79][3] = 4;
	level.TrapData[9][4] = "DELETE";			//level.TrapData[80] = []; level.TrapData[80][0] = "HIDE"; level.TrapData[80][1] = "HIDE"; level.TrapData[80][2] = "HIDE"; level.TrapData[80][3] = "HIDE"; level.TrapData[80][4] = "HIDE";

	level.TrapData[10] = [];    
	level.TrapData[10][0] = "MOVE_LOOP";		level.TrapData[81] = []; level.TrapData[81][0] = "Z"; level.TrapData[81][1] = -128; level.TrapData[81][2] = 3; level.TrapData[81][3] = 3;
	level.TrapData[10][1] = "ROTATE_LOOP";		level.TrapData[82] = []; level.TrapData[82][0] = "ROLL"; level.TrapData[82][1] = 720; level.TrapData[82][2] = 2; level.TrapData[82][3] = 12;
	level.TrapData[10][2] = "ROTATE_LOOP";		level.TrapData[83] = []; level.TrapData[83][0] = "YAW"; level.TrapData[83][1] = 360; level.TrapData[83][2] = 4; level.TrapData[83][3] = 4;
	level.TrapData[10][3] = "ROTATE_LOOP";		level.TrapData[84] = []; level.TrapData[84][0] = "YAW"; level.TrapData[84][1] = 360; level.TrapData[84][2] = 4; level.TrapData[84][3] = 4;
	level.TrapData[10][4] = "NONE";				//level.TrapData[85] = []; level.TrapData[85][0] = "ROLL"; level.TrapData[85][1] = 720; level.TrapData[85][2] = 1; level.TrapData[85][3] = 3;

	level.TrapData[11] = [];  
	level.TrapData[11][0] = "MOVE_LOOP";		level.TrapData[86] = []; level.TrapData[86][0] = "Z"; level.TrapData[86][1] = 128; level.TrapData[86][2] = 3; level.TrapData[86][3] = 4;
	level.TrapData[11][1] = "DELETE";			//level.TrapData[87] = []; level.TrapData[87][0] = "HIDE"; level.TrapData[87][1] = "HIDE"; level.TrapData[87][2] = "HIDE"; level.TrapData[87][3] = "HIDE"; level.TrapData[87][4] = "HIDE";
	level.TrapData[11][2] = "DELETE";			//level.TrapData[88] = []; level.TrapData[88][0] = "HIDE"; level.TrapData[88][1] = "HIDE"; level.TrapData[88][2] = "HIDE"; level.TrapData[88][3] = "HIDE"; level.TrapData[88][4] = "HIDE";
	level.TrapData[11][3] = "ROTATE_LOOP";		level.TrapData[89] = []; level.TrapData[89][0] = "PITCH"; level.TrapData[89][1] = (360*3); level.TrapData[89][2] = 2; level.TrapData[89][3] = 4;
	level.TrapData[11][4] = "NONE";		level.TrapData[90] = []; level.TrapData[90][0] = "Z"; level.TrapData[90][1] = 592; level.TrapData[90][2] = 0.5; level.TrapData[90][3] = 3;

	level.TrapData[12] = [];     
	level.TrapData[12][0] = "DELETE";			//level.TrapData[91] = []; level.TrapData[91][0] = "HIDE"; level.TrapData[91][1] = "HIDE"; level.TrapData[91][2] = "HIDE"; level.TrapData[91][3] = "HIDE"; level.TrapData[91][4] = "HIDE";
	level.TrapData[12][1] = "DELETE";			//level.TrapData[92] = []; level.TrapData[92][0] = "HIDE"; level.TrapData[92][1] = "HIDE"; level.TrapData[92][2] = "HIDE"; level.TrapData[92][3] = "HIDE"; level.TrapData[92][4] = "HIDE";
	level.TrapData[12][2] = "MOVE_LOOP";		level.TrapData[93] = []; level.TrapData[93][0] = "Z"; level.TrapData[93][1] = -128; level.TrapData[93][2] = 2; level.TrapData[93][3] = 4;
	level.TrapData[12][3] = "DELETE";			//level.TrapData[94] = []; level.TrapData[94][0] = "HIDE"; level.TrapData[94][1] = "HIDE"; level.TrapData[94][2] = "HIDE"; level.TrapData[94][3] = "HIDE"; level.TrapData[94][4] = "HIDE";
	//level.TrapData[12][4] = "HIDE";			level.TrapData[95] = []; level.TrapData[95][0] = "HIDE"; level.TrapData[95][1] = "HIDE"; level.TrapData[95][2] = "HIDE"; level.TrapData[95][3] = "HIDE"; level.TrapData[95][4] = "HIDE";

	level.TrapData[13] = [];      
	level.TrapData[13][0] = "DELETE";			//level.TrapData[96] = []; level.TrapData[96][0] = "HIDE"; level.TrapData[96][1] = "HIDE"; level.TrapData[96][2] = "HIDE"; level.TrapData[96][3] = "HIDE"; level.TrapData[96][4] = "HIDE";
	level.TrapData[13][1] = "NONE";				//level.TrapData[97] = []; level.TrapData[97][0] = "PITCH"; level.TrapData[97][1] = (360*2); level.TrapData[97][2] = 1; level.TrapData[97][3] = 4;
	level.TrapData[13][2] = "ROTATE_LOOP";		level.TrapData[98] = []; level.TrapData[98][0] = "PITCH"; level.TrapData[98][1] = (360*5); level.TrapData[98][2] = 2; level.TrapData[98][3] = 5;
	level.TrapData[13][3] = "DELETE";			//level.TrapData[99] = []; level.TrapData[99][0] = "HIDE"; level.TrapData[99][1] = "HIDE"; level.TrapData[99][2] = "HIDE"; level.TrapData[99][3] = "HIDE"
	level.TrapData[13][4] = "ROTATE_LOOP";		level.TrapData[100] = []; level.TrapData[100][0] = "ROLL"; level.TrapData[100][1] = (360*2); level.TrapData[100][2] = 3; level.TrapData[100][3] = 6;

	level.TrapData[14] = [];    
	level.TrapData[14][0] = "ROTATE_LOOP";		level.TrapData[101] = []; level.TrapData[101][0] = "YAW"; level.TrapData[101][1] = 360*2; level.TrapData[101][2] = 16; level.TrapData[101][3] = 20;
	level.TrapData[14][1] = "DELETE";			//level.TrapData[102] = []; level.TrapData[102][0] = "HIDE"; level.TrapData[102][1] = "HIDE"; level.TrapData[102][2] = "HIDE"; level.TrapData[102][3] = "HIDE"; level.TrapData[102][4] = "HIDE";
	level.TrapData[14][2] = "NONE";				//level.TrapData[103] = []; level.TrapData[103][0] = "HIDE"; level.TrapData[103][1] = "HIDE"; level.TrapData[103][2] = "HIDE"; level.TrapData[103][3] = "HIDE"; level.TrapData[103][4] = "HIDE";
	level.TrapData[14][3] = "ROTATE_LOOP";		level.TrapData[104] = []; level.TrapData[104][0] = "ROLL"; level.TrapData[104][1] = (-360*2); level.TrapData[104][2] = 1; level.TrapData[104][3] = 3;
	//level.TrapData[14][4] = "HIDE";			level.TrapData[105] = []; level.TrapData[105][0] = "HIDE"; level.TrapData[105][1] = "HIDE"; level.TrapData[105][2] = "HIDE"; level.TrapData[105][3] = "HIDE"; level.TrapData[105][4] = "HIDE";

	level.TrapData[15] = [];      
	level.TrapData[15][0] = "MOVE_LOOP";		level.TrapData[106] = []; level.TrapData[106][0] = "X"; level.TrapData[106][1] = -192; level.TrapData[106][2] = 2; level.TrapData[106][3] = 2;
	level.TrapData[15][1] = "MOVE_LOOP";		level.TrapData[107] = []; level.TrapData[107][0] = "X"; level.TrapData[107][1] = 192; level.TrapData[107][2] = 2; level.TrapData[107][3] = 2;
	level.TrapData[15][2] = "MOVE_LOOP";		level.TrapData[108] = []; level.TrapData[108][0] = "Z"; level.TrapData[108][1] = -128; level.TrapData[108][2] = 2; level.TrapData[108][3] = 2;
	level.TrapData[15][3] = "ROTATE_LOOP";		level.TrapData[109] = []; level.TrapData[109][0] = "ROLL"; level.TrapData[109][1] = (360*2); level.TrapData[109][2] = 3; level.TrapData[109][3] = 3;
	level.TrapData[15][4] = "NONE";				//level.TrapData[110] = []; level.TrapData[110][0] = "HIDE"; level.TrapData[110][1] = "HIDE"; level.TrapData[110][2] = "HIDE"; level.TrapData[110][3] = "HIDE"; level.TrapData[110][4] = "HIDE";

	level.TrapData[16] = [];     
	level.TrapData[16][0] = "ROTATE_LOOP";		level.TrapData[111] = []; level.TrapData[111][0] = "YAW"; level.TrapData[111][1] = 360; level.TrapData[111][2] = 3; level.TrapData[111][3] = 5;
	level.TrapData[16][1] = "ROTATE_LOOP";		level.TrapData[112] = []; level.TrapData[112][0] = "YAW"; level.TrapData[112][1] = 360; level.TrapData[112][2] = 3; level.TrapData[112][3] = 5;
	level.TrapData[16][2] = "ROTATE_LOOP";		level.TrapData[113] = []; level.TrapData[113][0] = "YAW"; level.TrapData[113][1] = 360; level.TrapData[113][2] = 3; level.TrapData[113][3] = 5;
	level.TrapData[16][3] = "NONE";				//level.TrapData[114] = []; level.TrapData[114][0] = 3;
	level.TrapData[16][4] = "MOVE_LOOP";		level.TrapData[115] = []; level.TrapData[115][0] = "X"; level.TrapData[115][1] = -176; level.TrapData[115][2] = 2; level.TrapData[115][3] = 2;

	level.TrapData[17] = [];      
	level.TrapData[17][0] = "MOVE_LOOP";		level.TrapData[116] = []; level.TrapData[116][0] = "Z"; level.TrapData[116][1] = -128; level.TrapData[116][2] = 2; level.TrapData[116][3] = 2;
	level.TrapData[17][1] = "NONE";				//level.TrapData[117] = []; level.TrapData[117][0] = "HIDE"; level.TrapData[117][1] = "HIDE"; level.TrapData[117][2] = "HIDE"; level.TrapData[117][3] = "HIDE"; level.TrapData[117][4] = "HIDE";
	level.TrapData[17][2] = "DELETE";			//level.TrapData[118] = []; level.TrapData[118][0] = "HIDE"; level.TrapData[118][1] = "HIDE"; level.TrapData[118][2] = "HIDE"; level.TrapData[118][3] = "HIDE"; level.TrapData[118][4] = "HIDE";
	level.TrapData[17][3] = "DELETE";			//level.TrapData[119] = []; level.TrapData[119][0] = "HIDE"; level.TrapData[119][1] = "HIDE"; level.TrapData[119][2] = "HIDE"; level.TrapData[119][3] = "HIDE"; level.TrapData[119][4] = "HIDE";
	level.TrapData[17][4] = "ROTATE_LOOP";		level.TrapData[120] = []; level.TrapData[120][0] = "ROLL"; level.TrapData[120][1] = 360; level.TrapData[120][2] = 1; level.TrapData[120][3] = 3;

	level.TrapData[18] = [];      
	level.TrapData[18][0] = "ROTATE_LOOP";		level.TrapData[121] = []; level.TrapData[121][0] = "YAW"; level.TrapData[121][1] = 360; level.TrapData[121][2] = 8; level.TrapData[121][3] = 8;
	level.TrapData[18][1] = "DELETE";			//level.TrapData[122] = []; level.TrapData[122][0] = "HIDE"; level.TrapData[122][1] = "HIDE"; level.TrapData[122][2] = "HIDE"; level.TrapData[122][3] = "HIDE"; level.TrapData[122][4] = "HIDE";
	level.TrapData[18][2] = "MOVE_LOOP";		level.TrapData[123] = []; level.TrapData[123][0] = "Z"; level.TrapData[123][1] = -128; level.TrapData[123][2] = 2; level.TrapData[123][3] = 2;
	level.TrapData[18][3] = "NONE";				//level.TrapData[124] = []; level.TrapData[124][0] = "ROLL"; level.TrapData[124][1] = (360*2); level.TrapData[124][2] = 1; level.TrapData[124][3] = 3;
	level.TrapData[18][4] = "DELETE";			//level.TrapData[125] = []; level.TrapData[125][0] = "HIDE"; level.TrapData[125][1] = "HIDE"; level.TrapData[125][2] = "HIDE"; level.TrapData[125][3] = "HIDE"; level.TrapData[125][4] = "HIDE";

	level.TrapData[19] =[];       
	level.TrapData[19][0] = "MOVE_LOOP";		level.TrapData[126] = []; level.TrapData[126][0] = "Y"; level.TrapData[126][1] = 304; level.TrapData[126][2] = 1; level.TrapData[126][3] = 3;
	level.TrapData[19][1] = "NONE";				//level.TrapData[127] = []; level.TrapData[127][0] = "ROLL"; level.TrapData[127][1] = 360; level.TrapData[127][2] = 1; level.TrapData[127][3] = 3;
	level.TrapData[19][2] = "ROTATE_LOOP";		level.TrapData[128] = []; level.TrapData[128][0] = "YAW"; level.TrapData[128][1] = (360*3); level.TrapData[128][2] = 3; level.TrapData[128][3] = 10;
	level.TrapData[19][3] = "DELETE";			//level.TrapData[129] = []; level.TrapData[129][0] = "HIDE"; level.TrapData[129][1] = "HIDE"; level.TrapData[129][2] = "HIDE"; level.TrapData[129][3] = "HIDE"; level.TrapData[129][4] = "HIDE";
	level.TrapData[19][4] = "MOVE_LOOP";		level.TrapData[130] = []; level.TrapData[130][0] = "PITCH"; level.TrapData[130][1] = 180; level.TrapData[130][2] = 1; level.TrapData[130][3] = 3;

	level.TrapData[20] = [];      
	level.TrapData[20][0] = "DELETE";			//level.TrapData[131] = []; level.TrapData[131][0] = "HIDE"; level.TrapData[131][1] = "HIDE"; level.TrapData[131][2] = "HIDE"; level.TrapData[131][3] = "HIDE"; level.TrapData[131][4] = "HIDE";
	level.TrapData[20][1] = "DELETE";			//level.TrapData[132] = []; level.TrapData[132][0] = "HIDE"; level.TrapData[132][1] = "HIDE"; level.TrapData[132][2] = "HIDE"; level.TrapData[132][3] = "HIDE"; level.TrapData[132][4] = "HIDE";
	level.TrapData[20][2] = "NONE";				//level.TrapData[133] = []; level.TrapData[133][0] = "Y"; level.TrapData[133][1] = 304; level.TrapData[133][2] = 1; level.TrapData[133][3] = 3;
	level.TrapData[20][3] = "DELETE";			//level.TrapData[134] = []; level.TrapData[134][0] = "HIDE"; level.TrapData[134][1] = "HIDE"; level.TrapData[134][2] = "HIDE"; level.TrapData[134][3] = "HIDE"; level.TrapData[134][4] = "HIDE";
	level.TrapData[20][4] = "DELETE";			//level.TrapData[135] = []; level.TrapData[135][0] = "HIDE"; level.TrapData[135][1] = "HIDE"; level.TrapData[135][2] = "HIDE"; level.TrapData[135][3] = "HIDE"; level.TrapData[135][4] = "HIDE";

	level.TrapData[21] = [];      
	level.TrapData[21][0] = "DELETE";			//level.TrapData[136] = []; level.TrapData[136][0] = "HIDE"; level.TrapData[136][1] = "HIDE"; level.TrapData[136][2] = "HIDE"; level.TrapData[136][3] = "HIDE"; level.TrapData[136][4] = "HIDE";
	level.TrapData[21][1] = "DELETE";			//level.TrapData[137] = []; level.TrapData[137][0] = "HIDE"; level.TrapData[137][1] = "HIDE"; level.TrapData[137][2] = "HIDE"; level.TrapData[137][3] = "HIDE"; level.TrapData[137][4] = "HIDE";
	level.TrapData[21][2] = "ROTATE_LOOP";		level.TrapData[138] = []; level.TrapData[138][0] = "YAW"; level.TrapData[138][1] = 360*2; level.TrapData[138][2] = 6; level.TrapData[138][3] = 6;
	level.TrapData[21][3] = "NONE";				//level.TrapData[139] = []; level.TrapData[139][0] = "Z"; level.TrapData[139][1] = -128; level.TrapData[139][2] = 1; level.TrapData[139][3] = 3;
	//level.TrapData[21][4] = "HIDE";			level.TrapData[140] = []; level.TrapData[140][0] = "HIDE"; level.TrapData[140][1] = "HIDE"; level.TrapData[140][2] = "HIDE"; level.TrapData[140][3] = "HIDE"; level.TrapData[140][4] = "HIDE";

	level.TrapData[22] = [];    
	level.TrapData[22][0] = "DELETE";			//level.TrapData[141] = []; level.TrapData[141][0] = "HIDE"; level.TrapData[141][1] = "HIDE"; level.TrapData[141][2] = "HIDE"; level.TrapData[141][3] = "HIDE"; level.TrapData[141][4] = "HIDE";
	level.TrapData[22][1] = "NONE";				//level.TrapData[142] = []; level.TrapData[142][0] = "HIDE"; level.TrapData[142][1] = "HIDE"; level.TrapData[142][2] = "HIDE"; level.TrapData[142][3] = "HIDE"; level.TrapData[142][4] = "HIDE";
	level.TrapData[22][2] = "ROTATE_LOOP";		level.TrapData[143] = []; level.TrapData[143][0] = "PITCH"; level.TrapData[143][1] = (360*5); level.TrapData[143][2] = 4; level.TrapData[143][3] = 7;
	level.TrapData[22][3] = "DELETE";			//level.TrapData[144] = []; level.TrapData[144][0] = "HIDE"; level.TrapData[144][1] = "HIDE"; level.TrapData[144][2] = "HIDE"; level.TrapData[144][3] = "HIDE"; level.TrapData[144][4] = "HIDE";
	level.TrapData[22][4] = "ROTATE_LOOP";		level.TrapData[145] = []; level.TrapData[145][0] = "PITCH"; level.TrapData[145][1] = 360; level.TrapData[145][2] = 1; level.TrapData[145][3] = 7;

	level.TrapData[23] = [];    
	level.TrapData[23][0] = "ROTATE_LOOP";		level.TrapData[146] = []; level.TrapData[146][0] = "ROLL"; level.TrapData[146][1] = (360*2); level.TrapData[146][2] = 2; level.TrapData[146][3] = 7;
	level.TrapData[23][1] = "ROTATE_LOOP";		level.TrapData[147] = []; level.TrapData[147][0] = "ROLL"; level.TrapData[147][1] = 360; level.TrapData[147][2] = 1; level.TrapData[147][3] = 3;
	level.TrapData[23][2] = "MOVE_LOOP";		level.TrapData[148] = []; level.TrapData[148][0] = "Z"; level.TrapData[148][1] = -96; level.TrapData[148][2] = 4; level.TrapData[148][3] = 4;
	//level.TrapData[23][3] = "HIDE";			level.TrapData[149] = []; level.TrapData[149][0] = "HIDE"; level.TrapData[149][1] = "HIDE"; level.TrapData[149][2] = "HIDE"; level.TrapData[149][3] = "HIDE"; level.TrapData[149][4] = "HIDE";
	//level.TrapData[23][4] = "HIDE";			level.TrapData[150] = []; level.TrapData[150][0] = "HIDE"; level.TrapData[150][1] = "HIDE"; level.TrapData[150][2] = "HIDE"; level.TrapData[150][3] = "HIDE"; level.TrapData[150][4] = "HIDE";

	level.TrapData[24] = [];      
	level.TrapData[24][0] = "ROTATE_LOOP";		level.TrapData[151] = []; level.TrapData[151][0] = "YAW"; level.TrapData[151][1] = 360; level.TrapData[151][2] = 10; level.TrapData[151][3] = 13;
	level.TrapData[24][1] = "ROTATE_LOOP";		level.TrapData[152] = []; level.TrapData[152][0] = "PITCH"; level.TrapData[152][1] = (360*2); level.TrapData[152][2] = 1; level.TrapData[152][3] = 3;
	level.TrapData[24][2] = "DELETE";			//level.TrapData[153] = []; level.TrapData[153][0] = "HIDE"; level.TrapData[153][1] = "HIDE"; level.TrapData[153][2] = "HIDE"; level.TrapData[153][3] = "HIDE"; level.TrapData[153][4] = "HIDE";
	level.TrapData[24][3] = "ROTATE_LOOP";		level.TrapData[154] = []; level.TrapData[154][0] = "ROLL"; level.TrapData[154][1] = -360; level.TrapData[154][2] = 1; level.TrapData[154][3] = 4;
	level.TrapData[24][4] = "NONE";				//level.TrapData[155] = []; level.TrapData[155][0] = "Z"; level.TrapData[155][1] = -96; level.TrapData[155][2] = 3; level.TrapData[155][3] = 3;

	level.TrapData[25] = [];      
	level.TrapData[25][0] = "MOVE_LOOP";		level.TrapData[156] = []; level.TrapData[156][0] = "Y"; level.TrapData[156][1] = 240; level.TrapData[156][2] = 1; level.TrapData[156][3] = 3;
	level.TrapData[25][1] = "ROTATE_LOOP";		level.TrapData[157] = []; level.TrapData[157][0] = "ROLL"; level.TrapData[157][1] = (360*2); level.TrapData[157][2] = 2; level.TrapData[157][3] = 5;
	level.TrapData[25][2] = "HIDE_SHOW_LOOP";	level.TrapData[158] = []; level.TrapData[158][0] = 3;
	//level.TrapData[25][3] = "HIDE";			level.TrapData[159] = []; level.TrapData[159][0] = "HIDE"; level.TrapData[159][1] = "HIDE"; level.TrapData[159][2] = "HIDE"; level.TrapData[159][3] = "HIDE"; level.TrapData[159][4] = "HIDE";
	//level.TrapData[25][4] = "HIDE";			level.TrapData[160] = []; level.TrapData[160][0] = "HIDE"; level.TrapData[160][1] = "HIDE"; level.TrapData[160][2] = "HIDE"; level.TrapData[160][3] = "HIDE"; level.TrapData[160][4] = "HIDE";

	level.TrapData[26] = [];      
	level.TrapData[26][0] = "ROTATE_LOOP";		level.TrapData[161] = []; level.TrapData[161][0] = "YAW"; level.TrapData[161][1] = 360; level.TrapData[161][2] = 10; level.TrapData[161][3] = 10;
	level.TrapData[26][1] = "ROTATE_LOOP";		level.TrapData[162] = []; level.TrapData[162][0] = "YAW"; level.TrapData[162][1] = -360; level.TrapData[162][2] = 10; level.TrapData[162][3] = 10;
	level.TrapData[26][2] = "MOVE_LOOP";		level.TrapData[163] = []; level.TrapData[163][0] = "Z"; level.TrapData[163][1] = -96; level.TrapData[163][2] = 3; level.TrapData[163][3] = 3;
	level.TrapData[26][3] = "NONE";				//level.TrapData[164] = []; level.TrapData[164][0] = "Z"; level.TrapData[164][1] = -64; level.TrapData[164][2] = 3; level.TrapData[164][3] = 3;
	//level.TrapData[26][4] = "HIDE";			level.TrapData[165] = []; level.TrapData[165][0] = "HIDE"; level.TrapData[165][1] = "HIDE"; level.TrapData[165][2] = "HIDE"; level.TrapData[165][3] = "HIDE"; level.TrapData[165][4] = "HIDE";

	level.TrapData[27] = [];      
	level.TrapData[27][0] = "NONE";				//level.TrapData[166] = []; level.TrapData[166][0] = "Z"; level.TrapData[166][1] = -128; level.TrapData[166][2] = 3; level.TrapData[166][3] = 3;
	level.TrapData[27][1] = "MOVE_LOOP";		level.TrapData[167] = []; level.TrapData[167][0] = "Z"; level.TrapData[167][1] = 196; level.TrapData[167][2] = 2; level.TrapData[167][3] = 2;
	level.TrapData[27][2] = "MOVE_LOOP";		level.TrapData[168] = []; level.TrapData[168][0] = "X"; level.TrapData[168][1] = 128; level.TrapData[168][2] = 3; level.TrapData[168][3] = 3;
	level.TrapData[27][3] = "MOVE_LOOP";		level.TrapData[169] = []; level.TrapData[169][0] = "X"; level.TrapData[169][1] = 128; level.TrapData[169][2] = 3; level.TrapData[169][3] = 3;
	level.TrapData[27][4] = "ROTATE_LOOP";		level.TrapData[170] = []; level.TrapData[170][0] = "ROLL"; level.TrapData[170][1] = 360; level.TrapData[170][2] = 2; level.TrapData[170][3] = 5;

	level.TrapData[28] = [];      
	level.TrapData[28][0] = "NONE";				//level.TrapData[171] = []; level.TrapData[171][0] = "HIDE"; level.TrapData[171][1] = "HIDE"; level.TrapData[171][2] = "HIDE"; level.TrapData[171][3] = "HIDE"; level.TrapData[171][4] = "HIDE";
	level.TrapData[28][1] = "DELETE";			//level.TrapData[172] = []; level.TrapData[172][0] = "HIDE"; level.TrapData[172][1] = "HIDE"; level.TrapData[172][2] = "HIDE"; level.TrapData[172][3] = "HIDE"; level.TrapData[172][4] = "HIDE";
	level.TrapData[28][2] = "DELETE";			//level.TrapData[173] = []; level.TrapData[173][0] = "HIDE"; level.TrapData[173][1] = "HIDE"; level.TrapData[173][2] = "HIDE"; level.TrapData[173][3] = "HIDE"; level.TrapData[173][4] = "HIDE";
	level.TrapData[28][3] = "ROTATE_LOOP";		level.TrapData[174] = []; level.TrapData[174][0] = "PITCH"; level.TrapData[174][1] = (360*2); level.TrapData[174][2] = 3; level.TrapData[174][3] = 3;
	//level.TrapData[28][4] = "HIDE";			level.TrapData[175] = []; level.TrapData[175][0] = "HIDE"; level.TrapData[175][1] = "HIDE"; level.TrapData[175][2] = "HIDE"; level.TrapData[175][3] = "HIDE"; level.TrapData[175][4] = "HIDE";
	
	level.TrapData[29] = [];	  
	level.TrapData[29][0] = "HIDE_SHOW";		level.TrapData[176] = []; level.TrapData[176][0] = 3;
	//level.TrapData[29][1] = "HIDE";			level.TrapData[177] = []; level.TrapData[177][0] = "HIDE"; level.TrapData[177][1] = "HIDE"; level.TrapData[177][2] = "HIDE"; level.TrapData[177][3] = "HIDE"; level.TrapData[177][4] = "HIDE";
	//level.TrapData[29][2] = "HIDE";			level.TrapData[178] = []; level.TrapData[178][0] = "HIDE"; level.TrapData[178][1] = "HIDE"; level.TrapData[178][2] = "HIDE"; level.TrapData[178][3] = "HIDE"; level.TrapData[178][4] = "HIDE";
	//level.TrapData[29][3] = "HIDE";			level.TrapData[179] = []; level.TrapData[179][0] = "HIDE"; level.TrapData[179][1] = "HIDE"; level.TrapData[179][2] = "HIDE"; level.TrapData[179][3] = "HIDE"; level.TrapData[179][4] = "HIDE";
	//level.TrapData[29][4] = "HIDE";			level.TrapData[180] = []; level.TrapData[179][0] = "HIDE"; level.TrapData[179][1] = "HIDE"; level.TrapData[179][2] = "HIDE"; level.TrapData[179][3] = "HIDE"; level.TrapData[179][4] = "HIDE";
	level.TrapData[30] = [];	  
	//level.TrapData[30][0] = "HIDE_SHOW";		level.TrapData[181] = []; level.TrapData[181][0] = "HIDE"; level.TrapData[181][1] = "HIDE"; level.TrapData[181][2] = "HIDE"; level.TrapData[181][3] = "HIDE";
}

TrapGroup(StageNumber)
{
	for(i=0;i<level.TrapData[StageNumber].size;i++)
	{
		_TrapData = level.TrapData[(StageNumber*5) + i + 1 + 30];

		if(level.freeRun==true)
		{
			Trig = getEnt("TrapActivator_"+(StageNumber+1)+"_"+(i+1),"targetname");
			Trig setHintString("=(^5Free Run^7)=");
			continue;
		}

		if(level.TrapData[StageNumber][i] == "DELETE")
		{
			thread Trap_delete((StageNumber+1)+"_"+(i+1));
		}
		else if(level.TrapData[StageNumber][i] == "HIDE_SHOW")
		{
			thread Trap_Hide_Show((StageNumber+1)+"_"+(i+1),_TrapData[0]);
		}
		else if(level.TrapData[StageNumber][i] == "HIDE_SHOW_LOOP")
		{
			thread Trap_Hide_Show_Loop((StageNumber+1)+"_"+(i+1),_TrapData[0],_TrapData[1]);
		}
		else if(level.TrapData[StageNumber][i] == "MOVE_LOOP")
		{
			thread Trap_Move_Loop((StageNumber+1)+"_"+(i+1),_TrapData[0],_TrapData[1],_TrapData[2],_TrapData[3]);
		}
		else if(level.TrapData[StageNumber][i] == "ROTATE_LOOP")
		{
			thread Trap_Rotate_Loop((StageNumber+1)+"_"+(i+1),_TrapData[0],_TrapData[1],_TrapData[2],_TrapData[3]);
		}
		else if(level.TrapData[StageNumber][i] == "MOVE_WITH_TRIGGER")
		{
			thread Trap_Move_With_Trigger((StageNumber+1)+"_"+(i+1),_TrapData[0],_TrapData[1],_TrapData[2],_TrapData[3]);
		}
		wait 0.01;
	}
}

Trap_Hide_Show_Loop(BrushNo,WaitTime)
{
	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig setHintString("=(^5Press ^6Use ^5To Hide And Show^7)=");
	Trig waittill("trigger",player);
	Trig setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	for(;;)
	{
		Brush Hide();
		Brush NotSolid();
		wait WaitTime;
		Brush Show();
		Brush Solid();
		wait WaitTime;
	}
}
Trap_Hide_Show(BrushNo,WaitTime)
{
	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig setHintString("=(^5Press ^6Use ^5To Hide And Show^7)=");
	Trig waittill("trigger", player);
	Trig setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	Brush Hide();
	Brush NotSolid();
	wait WaitTime;
	Brush Show();
	Brush Solid();
}
Trap_delete(BrushNo)
{
	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig setHintString("=(^5Press ^6Use ^5To Remove^7)=");
	Trig waittill("trigger", player);
	Trig setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	Brush delete();
}
Trap_Move_Loop(BrushNo,MoveDir,MoveDistance,MoveTime,WaitTime)
{
	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig setHintString("=(^5Press ^6Use ^5To Move^7)=");
	Trig waittill("trigger", player);
	Trig setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	Move1 = MoveDistance;
	Move2 = MoveDistance * -1;

	for(;;)
	{
		if(MoveDir=="X")
			Brush moveX(Move1,MoveTime);
		else if(MoveDir=="Y")
			Brush moveY(Move1,MoveTime);
		else
			Brush moveZ(Move1,MoveTime);
		wait WaitTime;
		if(MoveDir=="X")
			Brush moveX(Move2,MoveTime);
		else if(MoveDir=="Y")
			Brush moveY(Move2,MoveTime);
		else
			Brush moveZ(Move2,MoveTime);
		wait WaitTime;
	}
}
Trap_Rotate_Loop(BrushNo,RotDir,RotAmount,RotTime,WaitTime)
{

	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig setHintString("=(^5Press ^6Use ^5To Rotate^7)=");
	Trig waittill("trigger", player);
	Trig setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	Rot1 = RotAmount;
	Rot2 = RotAmount * -1;

	for(;;)
	{
		if(RotDir=="YAW")
			Brush rotateYaw(Rot1,RotTime);
		else if(RotDir=="ROLL")
			Brush rotateRoll(Rot1,RotTime);
		else
			Brush rotatePitch(Rot1,RotTime);
		wait WaitTime;
		if(RotDir=="YAW")
			Brush rotateYaw(Rot2,RotTime);
		else if(RotDir=="ROLL")
			Brush rotateRoll(Rot2,RotTime);
		else
			Brush rotatePitch(Rot2,RotTime);
		wait WaitTime;
	}
}

Trap_Move_With_Trigger(BrushNo,MoveDir,MoveDistance,MoveTime,WaitTime)
{
	Brush = getEnt("trap_"+BrushNo,"targetname");
	Trig = getEnt("trap_"+BrushNo+"_t","targetname");
	Trig enableLinkTo();
	trig linkTo(Brush);
	Trig2 = getEnt("TrapActivator_"+BrushNo,"targetname");
	Trig2 setHintString("=(^5Press ^6Use ^5To Move^7)=");
	Trig2 waittill("trigger",player);
	Trig2 setHintString("=(^5Activated^7)=");
	player braxi\_rank::giveRankXP("", 100);
	Move1 = MoveDistance;
	Move2 = MoveDistance * -1;

	for(;;)
	{
		if(MoveDir=="X")
			Brush moveX(Move1,MoveTime);
		else if(MoveDir=="Y")
			Brush moveY(Move1,MoveTime);
		else
			Brush moveZ(Move1,MoveTime);
		wait WaitTime;
		if(MoveDir=="X")
			Brush moveX(Move2,MoveTime);
		else if(MoveDir=="Y")
			Brush moveY(Move2,MoveTime);
		else
			Brush moveZ(Move2,MoveTime);
		wait WaitTime;
	}
}

Portals()
{
	level waittill("round_started");
	PortalsX=getentarray("portal_fx_x","targetname");
	PortalsY=getentarray("portal_fx_y","targetname");
	for(i=0;i<PortalsX.size;i++)
	{
		playfx(level.PortalFX,PortalsX[i].origin,(0,180,0));
		wait 0.03;
	}

	for(i=0;i<PortalsY.size;i++)
	{
		playfx(level.PortalFX,PortalsY[i].origin,(180,0,0));
		wait 0.03;
	}
}

SetModels(player,IsViewHands,Model)
{
	if(IsViewHands)
	{
		player setViewModel(Model);
	}
	else
	{
		player detachAll();
    	player setModel(Model);
	}
}

CheckChooseStage()
{
	Choose_Trig = getEnt("choosetrigger", "targetname");
	for(;;)
	{
		Choose_Trig waittill("trigger", player);
		if(!player.Points){player.Points=0;}
		if(!player.FT){player.FT=false;}
		
		player takeWeapon("claymore_mp");

		if(isDefined(player.ghost) && player.ghost == true)
		{
			player iPrintLnBold("=(^1Using Ghost Mode^7)=");
			rnd = randomInt(level.ChoosedStages.size);
			thread TeleportPlayer(false,player,level.ChoosedStages[rnd],1,"^2Teleporting To A Random Stage",false);
		}
		else if(player.FT == true)
		{
			SendMessage(player,"^5You've Already Finished The Map^7)= \n=(^5 Use Fast Travel");
		}
		else
		{
			thread TeleportPlayer(false,player,level.ChoosedStages[player.Points],1,"^2Teleporting To A Stage, ^9"+int((player.Points/level.MaxPoints)*100)+"^2`/. Finished",false);
		}
	}
}

CheckWinState(player)
{
	player.Points +=1;
	if(player.Points >= level.MaxPoints)
	{	
		thread TeleportPlayer(false,player,level.EndOrigin,0,"^9100^2'/. ^5Completed And^7, ^5You've Finished The Map",false);
		player takeWeapon("claymore_mp");
		player iPrintLnBold("==(^5Fast Travel Unlocked^7)==");
		player.Points = 0;
		player.FT = true;
	}
	else
	{
		thread TeleportPlayer(false,player,level.ChoosedStages[player.Points],0,"^8"+int((player.Points/level.MaxPoints)*100) + "^2'/. ^5Completed^7, ^5Go! GO!! GO!!!",false);
	}
}

CheckStageFinish()
{
	Finish_Trig = getEnt("_Finish", "targetname");
	for(;;)
	{
		Finish_Trig waittill("trigger", player);

		if(isDefined(player.ghost) && player.ghost == true)
		{
			thread TeleportPlayer(false,player,level.StartOrigin,1,"^8Stage Completed!^7, ^5Try Again",false);
		}
		else
		{
			CheckWinState(player);
		}
	}
}

CheckFT()
{
	FT_Trig = getEnt("fasttravel", "targetname");
	for(;;)
	{
		FT_Trig waittill("trigger", player);
		if(!player.FT){player.FT=false;}
		if(player.FT==true)
		{
			player takeWeapon("claymore_mp");
			thread TeleportPlayer(false,player,level.EndOrigin,1,"^5Fast Traveled To The End",false);
		}
		else
		{
			player iPrintLnBold("=(^5You Haven't Unlocked Fast Travel Yet^7, ^5Finish The Map^7)=");
		}
	}
	
}
SendScreenMessage(Player,MainText,SubText,Duration)
{
	noti = spawnStruct();
	noti.titleText = "=("+MainText+"^7)="; 
	if(SubText != "")
		noti.notifyText = "=("+SubText+"^7)=";
	noti.glowColor = (0, 0.1, 0.9);
	noti.duration = Duration;
	players = getentarray("player", "classname");
	
	for (i = 0; i < players.size; i++)
	{
		if(Player=="ALL")
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);
		else
		{
			if(players[i].Name==Player)
			{
				players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);
				return;
			}
		}
	}
}
SendMessage(Player,Message)
{
	players = getentarray("player", "classname");

	for (i = 0; i < players.size; i++)
	{
		if(Player=="ALL")
			players[i] iPrintLnBold("=("+Message+"^7)=");
		else
		{
			if(players[i].Name==Player)
			{
				players[i] iPrintLnBold("=("+Message+"^7)=");
				return;
			}
		}
	}
}
ResetPlayer(player)
{
	//player takeAllWeapons();
	//level.activ takeAllWeapons();
	player.maxhealth = level.DefHealth;
	player.health = player.maxhealth;
	level.activ.maxhealth = level.DefHealth;
	level.activ.health = level.activ.maxhealth;
	player SetMoveSpeedScale( 1.2 );
	level.activ SetMoveSpeedScale( 1.2 );
	player Show();
	level.activ Show();
	player AllowAds( true );
	level.activ AllowAds( true );
	SetModels(level.activ,false,"plr_terry_dragonwarrior");
	if(level.CurrentRoom=="Juggernaut")
	{
		level.activ.maxhealth = 1000;
		level.activ.health = 1000;
		player SetMoveSpeedScale( 0.4 );
		level.activ SetMoveSpeedScale( 0.4 );
		SetModels(player,true,"viewhands_lion");
		SetModels(level.activ,true,"viewhands_lion");
		SetModels(player,false,"lion");
		SetModels(level.activ,false,"lion");
		
	}
	else if(level.CurrentRoom == "No Scope")
	{
		player AllowAds( false );
		level.activ AllowAds( false );
	}
	else if(level.CurrentRoom == "Spleef")
	{
		level.activ.maxhealth = level.InfHealth;
		level.activ.health = level.InfHealth;

		player.maxhealth = level.InfHealth;
		player.health = level.InfHealth;
	}
	else if(level.CurrentRoom == "Dog Fight")
	{
		SetModels(player,false,"german_sheperd_dog");
		SetModels(level.activ,false,"german_sheperd_dog");
	}
	else if(level.CurrentRoom == "Prone Knife")
	{
		player SetMoveSpeedScale(10);
		level.activ SetMoveSpeedScale(10);
	}
}

_GiveWeapon(player,Weapon1,Weapon2,ClearWep)
{

	if(ClearWep==true||Weapon1!="KEEPWEAPONS")
		player takeAllWeapons();
	if(Weapon1!=""&&Weapon1!="KEEPWEAPONS")
	{
		player giveWeapon(Weapon1);
		if(level.CurrentRoom == "1 Bullet 1 Life")
		{
			player setWeaponAmmoStock(Weapon1,1);
			player setWeaponAmmoClip(Weapon1,0);
		}
		else
		{
			player giveMaxAmmo(Weapon1);	
		}
		player switchToWeapon(Weapon1);
	}
	if(Weapon2!=""&&Weapon2!="KEEPWEAPONS")
	{
		player giveWeapon(Weapon2);
		player giveMaxAmmo(Weapon2);	
	}
	if(level.CurrentRoom != "1 Bullet 1 Life")
	{
		player thread RegenAmmo();
		level.Activ thread RegenAmmo();
	}
}

TeleportPlayer(freeze,player,_Origin,WaitTime,EndMessage,IsCountdown)
{
	if(level.NightMode == true)
		playFXOnTag(level.PlayerLight, player, "j_mainroot" );
	player freezeControls(1);	
	player setOrigin (_Origin.origin);
	player setPlayerAngles (_Origin.angles);
	for(i=1;i<=WaitTime;i++)
	{
		if(IsCountdown==true)
			thread SendMessage(player.Name,"^5"+i+"");
		wait 1;
	}
	wait 0.03;
	if(!freeze)
		player freezeControls(0);
	if(EndMessage!="")
		thread SendMessage(player.Name,""+EndMessage+"");
}

TeleportPlayer_Pos(freeze,player,INFO,WaitTime,EndMessage,IsCountdown)
{
	if(level.NightMode == true)
		playFXOnTag(level.PlayerLight, player, "j_mainroot" );
	player freezeControls(1);	
	player setOrigin (INFO[0]);
	player setPlayerAngles (INFO[1]);
	for(i=1;i<=WaitTime;i++)
	{
		if(IsCountdown==true)
			thread SendMessage(player.Name,"^5"+i+"");
		wait 1;
	}
	wait 0.03;
	if(!freeze)
		player freezeControls(0);
	if(EndMessage!="")
		thread SendMessage(player.Name,""+EndMessage+"");
}

ResetUI()
{
	if(isdefined(level.BT_Timer))level.BT_Timer destroy();
	if(isdefined(level.BT_CurrentHolderText))level.BT_CurrentHolderText destroy();
	if(isdefined(level.SSH_Timer))level.SSH_Timer destroy();
}
SetupRandomRoomPositions()
{
								        //POS                          ANGLE
	Room1 = []; Room1[0]   = (-256.0, 3264.0, 72.0);   Room1[1]  = (0, 270, 0); level.EndRandomRoomPoints[0] =  Room1;
	wait 0.03;
	Room2 = []; Room2[0]   = (-640.0, 3264.0, 72.0);   Room2[1]  = (0, 270, 0); level.EndRandomRoomPoints[1] =  Room2;
	wait 0.03;
	Room3 = []; Room3[0]   = (960.0, 4864.0, 72.0);    Room3[1]  = (0, 360, 0); level.EndRandomRoomPoints[2] =  Room3;
	wait 0.03;
	Room4 = []; Room4[0]   = (960.0, 4480.0, 72.0);    Room4[1]  = (0, 360, 0); level.EndRandomRoomPoints[3] =  Room4;
	wait 0.03;
	Room5 = []; Room5[0]   = (-640.0, 6080.0, 72.0);   Room5[1]  = (0, 90, 0);  level.EndRandomRoomPoints[4] =  Room5;
	wait 0.03;
	Room6 = []; Room6[0]   = (-1856.0, 4480.0, 72.0);  Room6[1]  = (0, 180, 0); level.EndRandomRoomPoints[5] =  Room6;
	wait 0.03;
	Room7 = []; Room7[0]   = (-1856.0, 4864.0, 72.0);  Room7[1]  = (0, 180, 0); level.EndRandomRoomPoints[6] =  Room7;
	wait 0.03;
	Room8 = []; Room8[0]   = (-256.0, 6080.0, 72.0);   Room8[1]  = (0, 90, 0);  level.EndRandomRoomPoints[7] =  Room8;
	wait 0.03;
	Room9 = []; Room9[0]   = (-256.0, 5632.0, -80.0);  Room9[1]  = (0, 90, 0);  level.EndRandomRoomPoints[8] =  Room9;
	wait 0.03;
	Room10 = []; Room10[0] = (-64.0, 5632.0, -80.0);   Room10[1] = (0, 90, 0);  level.EndRandomRoomPoints[9] =  Room10;
	wait 0.03;
	Room11 = []; Room11[0] = (128.0, 5632.0, -80.0);   Room11[1] = (0, 90, 0);  level.EndRandomRoomPoints[10] = Room11;
	wait 0.03;
	Room12 = []; Room12[0] = (-1024.0, 5632.0, -80.0); Room12[1] = (0, 90, 0);  level.EndRandomRoomPoints[11] = Room12;
	wait 0.03;
	Room13 = []; Room13[0] = (-832.0, 5632.0, -80.0);  Room13[1] = (0, 90, 0);  level.EndRandomRoomPoints[12] = Room13;
	wait 0.03;
	Room14 = []; Room14[0] = (-640.0, 5632.0, -80.0);  Room14[1] = (0, 90, 0);  level.EndRandomRoomPoints[13] = Room14;
	wait 0.03;
	Room15 = []; Room15[0] = (-640.0, 5192.0, -224.0); Room15[1] = (0, 90, 0);  level.EndRandomRoomPoints[14] = Room15;
	wait 0.03;
	Room16 = []; Room16[0] = (-832.0, 5192.0, -224.0); Room16[1] = (0, 90, 0);  level.EndRandomRoomPoints[15] = Room16;
	wait 0.03;
	Room17 = []; Room17[0] = (-64.0, 5192.0, -224.0);  Room17[1] = (0, 90, 0);  level.EndRandomRoomPoints[16] = Room17;
	wait 0.03;
	Room18 = []; Room18[0] = (-256.0, 5192.0, -224.0); Room18[1] = (0, 90, 0);  level.EndRandomRoomPoints[17] = Room18;
	wait 0.03;
	Room19 = []; Room19[0] = (512.0, 4480.0, -80.0);   Room19[1] = (0, 360, 0); level.EndRandomRoomPoints[18] = Room19;
	wait 0.03;
	Room20 = []; Room20[0] = (512.0, 4288.0, -80.0);   Room20[1] = (0, 360, 0); level.EndRandomRoomPoints[19] = Room20;
	wait 0.03;
	Room21 = []; Room21[0] = (512.0, 4096.0, -80.0);   Room21[1] = (0, 360, 0); level.EndRandomRoomPoints[20] = Room21;
	wait 0.03;
	Room22 = []; Room22[0] = (512.0, 5248.0, -80.0);   Room22[1] = (0, 360, 0); level.EndRandomRoomPoints[21] = Room22;
	wait 0.03;
	Room23 = []; Room23[0] = (512.0, 5056.0, -80.0);   Room23[1] = (0, 360, 0); level.EndRandomRoomPoints[22] = Room23;
	wait 0.03;
	Room24 = []; Room24[0] = (512.0, 4864.0, -80.0);   Room24[1] = (0, 360, 0); level.EndRandomRoomPoints[23] = Room24;
	wait 0.03;
	Room25 = []; Room25[0] = (72.0, 4864.0, -224.0);   Room25[1] = (0, 360, 0); level.EndRandomRoomPoints[24] = Room25;
	wait 0.03;
	Room26 = []; Room26[0] = (72.0, 5056.0, -224.0);   Room26[1] = (0, 360, 0); level.EndRandomRoomPoints[25] = Room26;
	wait 0.03;
	Room27 = []; Room27[0] = (72.0, 4288.0, -224.0);   Room27[1] = (0, 360, 0); level.EndRandomRoomPoints[26] = Room27;
	wait 0.03;
	Room28 = []; Room28[0] = (72.0, 4480.0, -224.0);   Room28[1] = (0, 360, 0); level.EndRandomRoomPoints[27] = Room28;
	wait 0.03;
	Room29 = []; Room29[0] = (-640.0, 3712.0, -80.0);  Room29[1] = (0, 270, 0); level.EndRandomRoomPoints[28] = Room29;
	wait 0.03;
	Room30 = []; Room30[0] = (-832.0, 3712.0, -80.0);  Room30[1] = (0, 270, 0); level.EndRandomRoomPoints[29] = Room30;
	wait 0.03;
	Room31 = []; Room31[0] = (-1024.0, 3712.0, -80.0); Room31[1] = (0, 270, 0); level.EndRandomRoomPoints[30] = Room31;
	wait 0.03;
	Room32 = []; Room32[0] = (128.0, 3712.0, -80.0);   Room32[1] = (0, 270, 0); level.EndRandomRoomPoints[31] = Room32;
	wait 0.03;
	Room33 = []; Room33[0] = (-64.0, 3712.0, -80.0);   Room33[1] = (0, 270, 0); level.EndRandomRoomPoints[32] = Room33;
	wait 0.03;
	Room34 = []; Room34[0] = (-256.0, 3712.0, -80.0);  Room34[1] = (0, 270, 0); level.EndRandomRoomPoints[33] = Room34;
	wait 0.03;
	Room35 = []; Room35[0] = (-256.0, 4152.0, -224.0); Room35[1] = (0, 270, 0); level.EndRandomRoomPoints[34] = Room35;
	wait 0.03;
	Room36 = []; Room36[0] = (-64.0, 4152.0, -224.0);  Room36[1] = (0, 270, 0); level.EndRandomRoomPoints[35] = Room36;
	wait 0.03;
	Room37 = []; Room37[0] = (-832.0, 4152.0, -224.0); Room37[1] = (0, 270, 0); level.EndRandomRoomPoints[36] = Room37;
	wait 0.03;
	Room38 = []; Room38[0] = (-640.0, 4152.0, -224.0); Room38[1] = (0, 270, 0); level.EndRandomRoomPoints[37] = Room38;
	wait 0.03;
	Room39 = []; Room39[0] = (-1408.0, 4864.0, -80.0); Room39[1] = (0, 180, 0); level.EndRandomRoomPoints[38] = Room39;
	wait 0.03;
	Room39 = []; Room40[0] = (-1408.0, 5056.0, -80.0); Room40[1] = (0, 180, 0); level.EndRandomRoomPoints[39] = Room40;
	wait 0.03;
	Room41 = []; Room41[0] = (-1408.0, 5248.0, -80.0); Room41[1] = (0, 180, 0); level.EndRandomRoomPoints[40] = Room41;
	wait 0.03;
	Room42 = []; Room42[0] = (-1408.0, 4096.0, -80.0); Room42[1] = (0, 180, 0); level.EndRandomRoomPoints[41] = Room42;
	wait 0.03;
	Room43 = []; Room43[0] = (-1408.0, 4288.0, -80.0); Room43[1] = (0, 180, 0); level.EndRandomRoomPoints[42] = Room43;
	wait 0.03;
	Room44 = []; Room44[0] = (-1408.0, 4480.0, -80.0); Room44[1] = (0, 180, 0); level.EndRandomRoomPoints[43] = Room44;
	wait 0.03;
	Room45 = []; Room45[0] = (-968.0, 4480.0, -224.0); Room45[1] = (0, 180, 0); level.EndRandomRoomPoints[44] = Room45;
	wait 0.03;
	Room46 = []; Room46[0] = (-968.0, 4288.0, -224.0); Room46[1] = (0, 180, 0); level.EndRandomRoomPoints[45] = Room46;
	wait 0.03;
	Room47 = []; Room47[0] = (-968.0, 5056.0, -224.0); Room47[1] = (0, 180, 0); level.EndRandomRoomPoints[46] = Room47;
	wait 0.03;
	Room48 = []; Room48[0] = (-968.0, 4864.0, -224.0); Room48[1] = (0, 180, 0); level.EndRandomRoomPoints[47] = Room48;
	wait 0.03;
	Room49 = []; Room49[0] = (-1312.0, 5536.0, -80.0); Room49[1] = (0, 135, 0); level.EndRandomRoomPoints[48] = Room49;
	wait 0.03;
	Room50 = []; Room50[0] = (416.0, 3808.0, -80.0);   Room50[1] = (0, 315, 0); level.EndRandomRoomPoints[49] = Room50;
	wait 0.03;
}

SetupActivatorOffsets()
{
	  level.ActivatorOffsetPoints[0] =  (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[1] =  (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[2] =  (672, 0+96, 144);
	  wait 0.01;
	  level.ActivatorOffsetPoints[3] =  (672, 0+96, 432);
	  wait 0.01;
	  level.ActivatorOffsetPoints[4] =  (608, 0+96, 960);
	  wait 0.01;
	  level.ActivatorOffsetPoints[5] =  (672, 0+96, 160);
	  wait 0.01;
	  level.ActivatorOffsetPoints[6] =  (664, 96, 1544);
	  wait 0.01;
	  level.ActivatorOffsetPoints[7] =  (672, 0+96, 160);
	  wait 0.01;
	  level.ActivatorOffsetPoints[8] =  (672, 0+96, 688);
	  wait 0.01;
	  level.ActivatorOffsetPoints[9] =  (672, 0+96, 480);
	  wait 0.01;
	  level.ActivatorOffsetPoints[10] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[11] = (672, -8+96, 240);
	  wait 0.01;
	  level.ActivatorOffsetPoints[12] = (672, 0+96, 2976);
	  wait 0.01;
	  level.ActivatorOffsetPoints[13] = (672, 0+96, 208);
	  wait 0.01;
	  level.ActivatorOffsetPoints[14] = (672, 0+96, 240);
	  wait 0.01;
	  level.ActivatorOffsetPoints[15] = (672, 0+96, 192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[16] = (672, 0+96, 184);
	  wait 0.01;
	  level.ActivatorOffsetPoints[17] = (672, 0+96, 208);
	  wait 0.01;
	  level.ActivatorOffsetPoints[18] = (672, 0+96, 192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[19] = (672, 160+96, 608);
	  wait 0.01;
	  level.ActivatorOffsetPoints[20] = (672, 0+96, 192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[21] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[22] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[23] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[24] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[25] = (672, 0+96, 192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[26] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[27] = (672, 0+96, 192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[28] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[29] = (672, 0+96, 160);
	  wait 0.01;
	  level.ActivatorOffsetPoints[30] = (672, 0+96, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[31] = (664, 7464, 496);
	  wait 0.01;
	  level.ActivatorOffsetPoints[32] = (656, 9304, 176);
	  wait 0.01;
	  level.ActivatorOffsetPoints[33] = (664, 6600, 376);
	  wait 0.01;
	  level.ActivatorOffsetPoints[34] = (664, 7336, 472);
	  wait 0.01;
	  level.ActivatorOffsetPoints[35] = (600, 6120, 984);//(600, -10216, 984);
	  wait 0.01;
	  level.ActivatorOffsetPoints[36] = (664, 7920, 1544);
	  wait 0.01;
	  level.ActivatorOffsetPoints[37] = (664, 2288, 1080);//--
	  wait 0.01;
	  level.ActivatorOffsetPoints[38] = (664, 7984, -1208);
	  wait 0.01;
	  level.ActivatorOffsetPoints[39] = (664, 6784, 728);
	  wait 0.01;
	  level.ActivatorOffsetPoints[40] = (664, 7408, 520);
	  wait 0.01;
	  level.ActivatorOffsetPoints[41] = (672, 9512, -160);//(11360, 9512, -160);
	  wait 0.01;
	  level.ActivatorOffsetPoints[42] = (632, 8696, 224);
	  wait 0.01;
	  level.ActivatorOffsetPoints[43] = (672, 5224, 3040);//--
	  wait 0.01;
	  level.ActivatorOffsetPoints[44] = (656, 8824, 200);
	  wait 0.01;
	  level.ActivatorOffsetPoints[45] = (656, 5304, 1288);
	  wait 0.01;
	  level.ActivatorOffsetPoints[46] = (672, 7224, -752);//(672, 7224, 14928);
	  wait 0.01;
	  level.ActivatorOffsetPoints[47] = (672, 8200, -1496);//(672, 12848, -1488);
	  wait 0.01;
	  level.ActivatorOffsetPoints[48] = (664, 8816, 216);
	  wait 0.01;
	  level.ActivatorOffsetPoints[49] = (664, 9256, 472);//(664, 9256, -8192);
	  wait 0.01;
	  level.ActivatorOffsetPoints[50] = (664, 7720, 1512);
	  wait 0.01;
	  level.ActivatorOffsetPoints[51] = (664, 10096, -2480);
	  wait 0.01;
	  level.ActivatorOffsetPoints[52] = (664, 5032, 808);
	  wait 0.01;
	  level.ActivatorOffsetPoints[53] = (664, 8688, 200);//(664, 34400, 200);
	  wait 0.01;
	  level.ActivatorOffsetPoints[54] = (656, 8124, 504);//(664, -19928, 504);
	  wait 0.01;
	  level.ActivatorOffsetPoints[55] = (664, 7088, 504);
	  wait 0.01;
	  level.ActivatorOffsetPoints[56] = (664, 11312, -5548);
	  wait 0.01;
	  level.ActivatorOffsetPoints[57] = (664, 8560, 1108);
	  wait 0.01;
	  level.ActivatorOffsetPoints[58] = (664, 9456, -1132);
	  wait 0.01;
	  level.ActivatorOffsetPoints[59] = (664, 9648, -4508);
	  wait 0.01;
	  level.ActivatorOffsetPoints[60] = (664, 928, 212);
	  wait 0.01;
	  level.ActivatorOffsetPoints[61] = (672, 920, 212);
}


room_selection()
{
	trig = getent("trig_roomselection", "targetname");
	targ = getent("origin_roomselection", "targetname");
	door1 = getent("roomselection_door1", "targetname");
	door2 = getent("roomselection_door2", "targetname");
	while (1)
	{
		trig waittill("trigger", player);
		SendScreenMessage("ALL","^6" + player.name,"^2Entered The Room Selection",4);
		level.CurrentRoom = "";
		players = getentarray("player", "classname");
		thread TeleportPlayer(false,player,targ,1,"",false);		
		wait 1;
		door1 movex(-192,1);
		door2 movex(192,1);  
		wait 2;
		door1 movex(192,1);
		door2 movex(-192,1);
		while (isAlive(player) && isDefined(player))
			wait 1;
		level notify("END_ROOM");
		thread ResetUI();
		SendScreenMessage("ALL","^2" + player.name + " Died","^2Room Selection Opened",4);
		TeleportPlayer(false,level.activ,level.ActiHQ,1,"^5Good Job!^7, ^2Welcome Back^7!",false);
		level.CurrentActiStage_Activator = 0;
	}
}

Slide_Timer()
{
	self endon("SLIDE_TIMER_END");

	if (isDefined(self.slideTimer))
		self.slideTimer destroy();

	self.slideTimer = newClientHudElem(self);
	self.slideTimer.foreground = true;
	self.slideTimer.alignX = "center";
	self.slideTimer.alignY = "bottom";
	self.slideTimer.horzAlign = "center";
	self.slideTimer.vertAlign = "bottom";
	self.slideTimer.x = 0;
	self.slideTimer.y = -3;
	self.slideTimer.sort = 5;
	self.slideTimer.fontScale = 2;
	self.slideTimer.font = "default";
	self.slideTimer.glowAlpha = 1;
	self.slideTimer.hideWhenInMenu = true;
	self.slideTimer.label = &"=(Time in Room: &&1)=";

	if (isDefined(level.randomcolor))
		self.slideTimer.glowColor = level.randomcolor;
	else
		self.slideTimer.glowColor = (1, 0, 0);

	self thread slide_timer_delete_on_death();

	time = 50;

	for (i = 0; i < time; i++)
	{
		self.slideTimer setValue(time - i);
		wait 1;
	}
	self.slideTimer setValue(0);
	iPrintLnBold("=(^5Jumper Couldn't Do The Room In Time Limit^7, ^1RIP^7)=");
	self suicide();

	if (isDefined(self.slideTimer))
		self.slideTimer destroy();
}

slide_timer_delete_on_death()
{
	self endon("SLIDE_TIMER_END");

	self waittill("death");

	if (isDefined(self.slideTimer))
		self.slideTimer destroy();
}

slideTimer()
{
	while (1)
	{
		trig = getEnt("SLIDE_TIMER_END", "targetname");
		JumperSpawn = getEnt("origin_5050_jumper", "targetname");
		ActivatorSpawn = getEnt("origin_5050_activator", "targetname");

		trig waittill("trigger", player);

		if (player.pers["team"] == "allies")
		{
			player notify("SLIDE_TIMER_END");

			if (isDefined(player.slideTimer))
				player.slideTimer destroy();

			iPrintLnBold("=(^5Jumper Has Finished First^7, ^5Activator Lost^7)=");
			thread _GiveWeapon(player,"remington700_mp","",true);
			thread TeleportPlayer(false,player,JumperSpawn,1,"",false);
			thread TeleportPlayer(false,level.activ,ActivatorSpawn,1,"",false);
			
		}

		if (player.pers["team"] == "axis")
		{
			iPrintLnBold("=(^5Activator Has Finished First^7, ^5Jumper Lost^7)=");
			thread _GiveWeapon(player,"remington700_mp","",true);
			thread TeleportPlayer(false,player,ActivatorSpawn,1,"",false);
			thread TeleportPlayer(false,level.PlayerInRoom,JumperSpawn,1,"",false);
		}
		wait 0.05;
	}
}

WaitList()
{
	thread Wait_RiverCross();
	thread Wait_Dropk();
	thread Room_FallTrig();
	thread SniperTrig();
	thread Dropper_Fall();
	thread Room_WinnerFirstFinish();
	//Elevators
	thread Wait_ELE1();
	thread Wait_ELE2();
	thread Wait_ELE3();
	thread Wait_ELE4();
	thread Wait_ELE5();
	thread Wait_ELE6();
	thread Wait_ELE7();
	thread Wait_ELE8();
}

Room_FallTrig()
{
	Trigger = getent("trig_FallTele", "targetname");
	for(;;)
	{
		Trigger waittill("trigger",player);
		if (player.pers["team"] == "allies")
		{
			thread TeleportPlayer(false,player,level.CurrentTeleTarget_Jumper,1,"^5Try Again!",false);
		}
		else
		{
			thread TeleportPlayer(false,player,level.CurrentTeleTarget_Activator,1,"^5Try Again!",false);
		}
		wait 0.01;
	}
}


Room_WinnerFirstFinish()
{
	Trig = getent("trig_RoomFinishWinner", "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			if (isDefined(player.slideTimer))
				player.slideTimer destroy();
			SendScreenMessage("ALL","^6Jumper Has Finished First!","^5Activator Loose!",4);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);		
		}
		else
		{
			SendScreenMessage("ALL","^6Activator Has Finished First!","^5Jumper Loose!",4);
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
		}
	}
}

SniperTrig()
{
	Trigger = getent("Trigger_Sniper", "targetname");
	Trigger setHintString("=(^3Grab Snipers^7)=");
	for(;;)
	{
		Trigger waittill("trigger",player);
		_GiveWeapon(player,"remington700_mp","m40a3_mp",true);
		wait 0.01;
	}
}

JumpPad()
{
	trigger = getent("jumppad","targetname");
    for(;;)
    {
    	trigger waittill("trigger",player);
        if(self.state == true)
        {
        bouncer(player);
        wait 0.05;
        //player transmit(80,2);
        wait 0.05;
        }
        else
        {
            self hide();
            self notSolid();
            wait 3;
            self show();
            self Solid();
        }
    }
}

bouncer(who)
{
	oldpos = who.origin;
	playFx ( level.bounce, who.origin );
	strenght = 20;
    for(i=0;i<strenght;i++)
    {
    who.health += 170;
    who finishPlayerDamage(who, level.jumpattacker, 170, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-90,0,0)), "none", 0);
    }
}

Arena_Selection()
{
	thread waittill_randomroom();

	thread waittill_rooms("trig_arena1","ori_arena1_j","ori_arena1_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	thread waittill_rooms("trig_arena2","ori_arena2_j","ori_arena2_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	thread waittill_rooms("trig_arena3","ori_arena3_j","ori_arena3_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	thread waittill_rooms("trig_arena4","ori_arena4_j","ori_arena4_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	thread waittill_rooms("trig_arena5","ori_arena5_j","ori_arena5_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	thread waittill_rooms("trig_arena6","ori_arena6_j","ori_arena6_a",level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2);
	
	//=(Rooms)=//
	thread waittill_arenas("trig_room_sniper","Sniper","m40a3_mp","remington700_mp");
	thread waittill_arenas("trig_room_shotgun","Shotgun","winchester1200_mp","");
	thread waittill_arenas("trig_room_randomweaps","Random Weapons","knife_mp","");
	thread waittill_arenas("trig_room_pistol","Pistol","deserteaglegold_mp","");
	thread waittill_arenas("trig_room_knife","Knife","knife_mp","");
	thread waittill_arenas("trig_room_ak47","AK47","ak47_mp","");
	thread waittill_arenas("trig_room_mp5","MP5","mp5_mp","");
	thread waittill_arenas("trig_room_bulletlife","1 Bullet 1 Life","m40a3_mp","knife_mp");
	thread waittill_arenas("trig_room_juggernaut","Juggernaut","rpd_mp","");
	thread waittill_arenas("trig_room_noscope","No Scope","m40a3_mp","remington700_mp");
	thread waittill_arenas("trig_room_minigun","MiniGun","m60e4_mp","");
	thread waittill_arenas("trig_room_dogfight","Dog Fight","dog_mp","");
	thread waittill_arenas("trig_room_SharpShooter","Sharp Shooter","deserteaglegold_mp","");
	
	//
	thread waittill_rooms("trig_room_unevengap","ori_room_unevengap_j","ori_room_unevengap_a","Uneven Gap","knife_mp","");
	thread waittill_rooms("trig_room_run","ori_room_run_j","ori_room_run_a","Run","knife_mp","");
	thread waittill_rooms("trig_room_purestrafe","ori_room_purestrafe_j","ori_room_purestrafe_a","Pure Strafe","knife_mp","");
	thread waittill_rooms("trig_room_triptoe","ori_room_triptoe_j","ori_room_triptoe_a","Trip Toe","knife_mp","");
	thread waittill_rooms("trig_room_nade","ori_room_nade_j","ori_room_nade_a","Nade","frag_grenade_mp","");
	thread waittill_rooms("trig_room_c4","ori_room_c4_j","ori_room_c4_a","C4","knife_mp","");
	thread waittill_rooms("trig_room_bounceplus","ori_room_bounceplus_j","ori_room_bounceplus_a","Bounce Plus","knife_mp","");
	thread waittill_rooms("trig_room_bounce","ori_room_bounce_j","ori_room_bounce_a","bounce","knife_mp","");
	thread waittill_rooms("trig_room_crossjump","ori_room_crossjump_j","ori_room_crossjump_a","Cross Jump","knife_mp","");
	thread waittill_rooms("trig_room_ladder","ori_room_ladder_j","ori_room_ladder_a","Ladder","knife_mp","");
	thread waittill_rooms("trig_room_holes","ori_room_holes_j","ori_room_holes_a","Holes","knife_mp","");
	thread waittill_rooms("trig_room_old","acti_hq","","Old","KEEPWEAPONS","KEEPWEAPONS");	
	thread waittill_rooms("trig_room_rivercross","ori_room_rivercross_j","ori_room_rivercross_a","River Cross","knife_mp","");
	thread waittill_rooms("trig_room_dropknife","ori_room_dropknife_j","ori_room_dropknife_a","Drop Knife","knife_mp","");
	
	//=(CustomRooms)=//
	thread WaitTill_Slide		 ("trig_room_slide","ori_room_slide_j","ori_room_slide_a","Bhop Slide","knife_mp","");
	thread waittill_RPS			 ("trig_room_rps","ori_room_rps_j","ori_room_rps_a","RPS","knife_mp","");
	thread waittill_RPG		     ("trig_room_rpg","ori_room_rpg_j","ori_room_rpg_a","RPG","rpg_mp","");
	thread waittill_CompleteShape("trig_room_completeshape","ori_room_completeshape_j","ori_room_completeshape_a","Complete The Shape","deserteaglegold_mp","");
	thread waittill_SS           ("trig_room_simonsays","ori_room_simonsays_j","ori_room_simonsays_a","Simon Says","knife_mp","");
	thread waittill_Spleef       ("trig_room_spleef","ori_room_spleef_j","ori_room_spleef_a","Spleef","deserteaglegold_mp","");
	thread waittill_Lava         ("trig_room_lava","ori_room_lava_j","ori_room_lava_a","Lava","knife_mp","");
	thread waittill_5050         ("trig_room_5050","killroom_j","killroom_a","50/50","","");
	thread waittill_SniperSchool ("trig_room_sniperschool","ori_room_sniperschool_j","ori_room_sniperschool_a","Sniper School","m40a3_mp","remington700_mp");
	thread waittill_BombTag      ("trig_room_BombTag","ori_room_BombTag_j","ori_room_BombTag_a","Bomb Tag","knife_mp","");
	thread waittill_SolidPath    ("trig_room_solidpath","ori_room_solidpath_j","ori_room_solidpath_a","Solid Path","knife_mp","");
	thread waittill_CrossTheRoad ("trig_room_crosstheroad","ori_room_crosstheroad_j","ori_room_crosstheroad_a","Cross The Road","knife_mp","");
	thread waittill_Collector    ("trig_room_collector","ori_room_collector_j","ori_room_collector_a","Collector","knife_mp","");
	thread waittill_Lasers       ("trig_room_lasers","ori_room_lasers_j","ori_room_lasers_a","Lasers","","");
	thread waittill_Maze         ("trig_room_maze","ori_room_maze_j","ori_room_maze_a","The Maze","knife_mp","");
	thread waittill_FallingBlocks("trig_room_fallingblocks","ori_room_fallingblocks_j","ori_room_fallingblocks_a","Falling Blocks","","");
	thread waittill_Dropper      ("trig_room_dropper","ori_room_dropper_j","ori_room_dropper_a","Dropper","knife_mp","");
	thread waittill_Invincible   ("trig_room_Invincible","ori_room_Invincible_j","ori_room_Invincible_a","Invincible","ak47_mp","");
	thread waittill_GunGame      ("trig_room_gun","ori_arena5_j","ori_arena5_a","Gun Game","knife_mp","");	
	thread waittill_ReversedDR   ("trig_room_rd","ori_room_rd_j","ori_room_rd_a","Reversed Deathrun","knife_mp","");
	thread waittill_Doors        ("trig_room_doors","ori_room_doors_j","ori_room_doors_a","Doors","","");
	thread waittill_ProneKnife   ("trig_room_proneknife","ori_room_proneknife_j","ori_room_proneknife_a","Prone Knife","knife_mp","");
	thread waittill_TPKnife      ("trig_room_tpknife","ori_room_tpknife_j","ori_room_tpknife_a","TP Knife","knife_mp","");
}

waittill_randomroom()
{
	Trig = getent("trig_randomroom", "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		thread TeleportPlayer_Pos(false,player,level.EndRandomRoomPoints[randomIntRange(0,level.EndRandomRoomPoints.size)],0,"^5Teleported To a Random Room Entrance",false);
		wait 0.01;
	}

}

waittill_arenas(TrigName,RoomName,Weap1,Weap2)
{
	Trig = getent(TrigName, "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		level.CurrentRoom = RoomName;
		if(getSubstr(TrigName,10,16)=="random")
		{
			rnd = RandomIntRange(0,level.WeaponList.size);
			level.ArenaWeap1 = level.WeaponList[rnd];
			level.ArenaWeap2 = "knife_mp";
		}
		else
		{
			level.ArenaWeap1 = Weap1;
			level.ArenaWeap2 = Weap2;
		}
		thread TeleportPlayer(false,player,level.ArenaSelectionOri,0,"^5Select An Arena",false);
		wait 0.1;
	}
}
waittill_rooms(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		if(getSubstr(_Trigger,5,10)=="arena")
		{
			RoomSetUp(player,JumperOri,ActivatorOri,level.CurrentRoom,level.ArenaWeap1,level.ArenaWeap2,"^5Kill That Activator!","^5Kill That Jumper!");
			if(level.CurrentRoom == "Sharp Shooter")
				thread SSH_Work();
		}
		else if(RoomName=="Old")
		{
			level.CurrentRoom = RoomName;
			if(level.ChoosedARoom==true)
			{
				Info = [];
				Info[0] = level.ChoosedStages[level.CurrentActiStage_Activator].origin + level.ChoosedActivatorPoints[level.ChoosedStages.size];
				Info[1] = level.ChoosedStages[level.CurrentActiStage_Activator].angles;

				TeleportPlayer_Pos(false,player,Info,0,"^5A Jumper Is Coming, Kill Him!",false);
				level.CurrentActiStage_Activator = level.ChoosedStages.size;
			}
			thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Seek And Kill The Activator!","");
			level.CurrentActiStage_Jumper = 0;
		}
		else
		{
			level.CurrentRoom = RoomName;
			thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Kill That Activator!","^5Kill That Jumper!");
		}
		wait 1;
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

PlayRandomSong()
{
	s = randomInt(level.endmusic.size);

	ambientStop(3);
	musicStop(3);
	ambientStop(0);
	musicStop(0);
	ambientPlay(level.endmusic[s]);
}

RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,JumperMSG,ActiMSG)
{
	level notify("END_ROOM");
	level.ChoosedARoom=true;
	level.CurrentRoom = RoomName;
	JumperSpawn = getent(JumperOri, "targetname");
	ActivatorSpawn = getent(ActivatorOri, "targetname");
	PlayRandomSong();
	thread ResetUI();
	
	level.PlayerInRoom = player;
	
	level.CurrentTeleTarget_Jumper = JumperSpawn;
	level.CurrentTeleTarget_Activator = ActivatorSpawn;
	
	level.PlayerPoints = 0;
	level.ActiPoints = 0;
	thread SendScreenMessage("ALL","^5"+RoomName+" ^5Room","^1" + level.activ.name + " ^3VS^1" + player.name,4);
	thread ResetPlayer(player);
	if(level.CurrentRoom == "Old")
	{
		thread TeleportPlayer(false,level.PlayerInRoom,JumperSpawn,0,JumperMSG,true);
	}
	else
	{
		thread TeleportPlayer(false,level.activ,ActivatorSpawn,3,ActiMSG,true);
		thread TeleportPlayer(false,level.PlayerInRoom,JumperSpawn,3,JumperMSG,true);
		thread _GiveWeapon(player,Weap1,Weap2,true);
		thread _GiveWeapon(level.activ,Weap1,Weap2,true);
	}
}

RegenAmmo()
{
	level endon("END_ROOM");
	while(1)
	{
		self giveMaxAmmo( self getCurrentWeapon());
		wait 2;
	}
}

WaitTill_Slide(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5^5Kill That Activator!","^5Kill That Jumper!");
		wait 1;
		player thread Slide_Timer();
		player waittill_any("death", "disconnect");
			wait 0.1;
	}
}

waittill_RPS(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");	
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Choose!","^5Choose!");
		wait 1;
		thread RPS_Main(player);		
		player waittill_any("death", "disconnect");
			wait 0.1;
	}
}

RPS_Main(player)
{
	level endon("END_ROOM");
	
	RPS_Display(false);
	level.RPS_ActiChoosed = "";
	level.RPS_PlayerChoosed = "";
	
	Rock_j     = getent("rps_rock_j", "targetname");
	Paper_j    = getent("rps_paper_j", "targetname");
	Scissors_j = getent("rps_scissors_j", "targetname");
	
	Rock_a     = getent("rps_rock_a", "targetname");
	Paper_a    = getent("rps_paper_a", "targetname");
	Scissors_a = getent("rps_scissors_a", "targetname");
	a = 3;
	
	while(level.PlayerPoints < 5 || level.ActiPoints < 5)
	{
		wait a;
		//a=1;
		iPrintLnBold("=(^3Starting A New Round^7)=");
		
		thread RPS_WaitTillPlayers(1,Rock_j,"Rock");
		thread RPS_WaitTillPlayers(1,Paper_j,"Paper");
		thread RPS_WaitTillPlayers(1,Scissors_j,"Scissors");
		
		thread RPS_WaitTillPlayers(0,Rock_a,"Rock");
		thread RPS_WaitTillPlayers(0,Paper_a,"Paper");
		thread RPS_WaitTillPlayers(0,Scissors_a,"Scissors");
		
			
		while(level.RPS_PlayerChoosed=="" || level.RPS_ActiChoosed=="")
		{
			wait 0.1;
		}
		Winer = RPS_CheckWinner();
		level.RPS_PlayerChoosed = "";
		level.RPS_ActiChoosed = "";
	}
}

RPS_Display(IsAction)
{
	if(IsAction)
	{
		for(i=0;i<=5;i++)
		{
			Brush_Jumper = getent("rps_"+i+"_j", "targetname");
			Brush_Activator = getent("rps_"+i+"_a", "targetname");
			if(i==level.PlayerPoints)
			{
				Brush_Jumper Show();
			}
			else
				Brush_Jumper Hide();
			
			if(i==level.ActiPoints)
			{
				Brush_Activator Show();
			}
			else
				Brush_Activator Hide();
		}
	}
	else
	{
		for(i=0;i<=5;i++)
		{
			Brush_Jumper = getent("rps_"+i+"_j", "targetname");
			Brush_Activator = getent("rps_"+i+"_a", "targetname");
			
			if(i==0)
			{
				Brush_Jumper Show();
				Brush_Activator Show();
			}
			else
			{
				Brush_Jumper Hide();
				Brush_Activator Hide();
			}
		}
	}
}

RPS_CheckWinner()
{
	if((level.RPS_PlayerChoosed=="Rock" && level.RPS_ActiChoosed=="Rock") || (level.RPS_PlayerChoosed=="Paper" && level.RPS_ActiChoosed=="Paper") || (level.RPS_PlayerChoosed=="Scissors" && level.RPS_ActiChoosed=="Scissors"))
	{
		SendScreenMessage("ALL","^5Its Draw!",level.ActiPoints+" | "+level.PlayerPoints,4);
	}
	else if ((level.RPS_PlayerChoosed=="Rock" && level.RPS_ActiChoosed=="Scissors") || (level.RPS_PlayerChoosed=="Paper" && level.RPS_ActiChoosed=="Rock") || (level.RPS_PlayerChoosed=="Scissors" && level.RPS_ActiChoosed=="Paper"))
	{
		level.PlayerPoints ++;
		SendScreenMessage("ALL","^5Jumper Wins This Round!",level.ActiPoints+" | "+level.PlayerPoints,4);
	}
	else
	{
		level.ActiPoints ++;
		SendScreenMessage("ALL","^5Activator Wins This Round!",level.ActiPoints+" | "+level.PlayerPoints,4);
	}
	
	RPS_Display(true);
	
	if(level.PlayerPoints>=5)
	{
		SendScreenMessage("ALL","^6Jumper Wins The Game!","^5Activator Lose :[",4);
		wait 4;
		thread SendToKillRoom(level.PlayerInRoom,level.activ);		
	}
	else if(level.ActiPoints>=5)
	{
		SendScreenMessage("ALL","^6Activator Wins The Game!","^5Player Lose :(",4);
		wait 4;		
		thread SendToKillRoom(level.activ,level.PlayerInRoom);
	}
}

RPS_ChangeHint(a)
{
	Rock_j     = getent("rps_rock_j", "targetname");
	Paper_j    = getent("rps_paper_j", "targetname");
	Scissors_j = getent("rps_scissors_j", "targetname");
	
	Rock_a     = getent("rps_rock_a", "targetname");
	Paper_a    = getent("rps_paper_a", "targetname");
	Scissors_a = getent("rps_scissors_a", "targetname");
	
	
	if(a==1)
	{
		Rock_j setHintString("=(^3Please Wait^7)=");
		Paper_j setHintString("=(^3Please Wait^7)=");
		Scissors_j setHintString("=(^3Please Wait^7)=");
	}
	else
	{
		Rock_a setHintString("=(^3Please Wait^7)=");
		Paper_a setHintString("=(^3Please Wait^7)=");
		Scissors_a setHintString("=(^3Please Wait^7)=");
	}
}

RPS_WaitTillPlayers(Team,Trigger,Option)
{
	if(Team==1)
		self endon("RPS_Choosed_Player");
	else
		self endon("RPS_Choosed_Activator");
	Trigger setHintString("=(^3"+Option+"^7)=");
	Trigger waittill("trigger", player);
	if(Team==1)
	{
		level.RPS_PlayerChoosed = Option;
		RPS_ChangeHint(1);
		self notify("RPS_Choosed_Player");
	}
	else
	{
		level.RPS_ActiChoosed = Option;
		RPS_ChangeHint(0);
		self notify("RPS_Choosed_Activator");
	}	
}

waittill_CompleteShape(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Shoot Fast To Complete The Shape!","^5Shoot Fast To Complete The Shape!");
		thread CompleteShape_Main(player);		
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

CompleteShape_Main(player)
{
	level endon("END_ROOM");
	thread CompleteShape_StartBalls();
	Brush = getent("CS_block", "targetname");Brush Hide();Brush NotSolid();
	for(i=1;i<=8;i++)
	{
		BrushJumper = getent("CS_j"+i, "targetname");BrushJumper Hide();
		BrushActi = getent("CS_a"+i, "targetname");BrushActi Hide();
	}
}

CompleteShape_StartBalls()
{
	thread CompleteShape_MoveBalls("CS_sphere_1","CS_trig_1","CS_point_1",0);
	thread CompleteShape_MoveBalls("CS_sphere_2","CS_trig_2","CS_point_2",1);
	thread CompleteShape_MoveBalls("CS_sphere_3","CS_trig_3","CS_point_3",2);
	thread CompleteShape_MoveBalls("CS_sphere_4","CS_trig_4","CS_point_4",3);
	thread CompleteShape_MoveBalls("CS_sphere_5","CS_trig_5","CS_point_5",4);
	thread CompleteShape_MoveBalls("CS_sphere_6","CS_trig_6","CS_point_6",5);
}

CompleteShape_MoveBalls(_Brush,_Trigger,_Origin,BallNum)
{
	level endon("END_ROOM");
	Brush = getent(_Brush, "targetname");
	Trigger = getent(_Trigger, "targetname");
	Origin = getent(_Origin, "targetname");
	
	Trigger enableLinkTo();
	Trigger linkTo(Brush);
	
	Brush MoveTo(Origin.origin,0.01);

	wait 1;
	while(true)
	{
		Rnd = RandomIntRange(0,6);
		if(rnd==0)
		{
			if(level.CS_Balls[BallNum]==false)
			{
				thread CompleteShape_Wait_Trigger(Trigger,Brush,BallNum);
				level.CS_Balls[BallNum]=true;
			}
			Brush Show();
			Brush movez(-300,0.7);
			wait 0.7;
			Brush MoveTo(Origin.origin,0.7);
			wait 0.7;
		}
		wait 1;
	}
}

CompleteShape_Wait_Trigger(Trigger,Brush,BallNum)
{
	level endon("END_ROOM");
	Trigger waittill("trigger", player);
	Brush Hide();
	level.CS_Balls[BallNum]=false;
	player iPrintLnBold("=(^6"+(((level.PlayerPoints+1)/8)*100)+"^5`/.^7)=");
	CompleteShape_CheckWinner(player);	
}
//Make It Random
CompleteShape_CheckWinner(player)
{
	MaxPoints = 8;
	if (player.pers["team"] == "allies")
	{
		level.PlayerPoints +=1;
		Brush = getent("CS_j"+level.PlayerPoints, "targetname");Brush Show();
	}
	else
	{
		level.ActiPoints +=1;
		Brush = getent("CS_a"+level.ActiPoints, "targetname");Brush Show();
	}
	if(level.PlayerPoints>=MaxPoints)
	{
		Brush = getent("CS_block", "targetname");Brush Show();Brush Solid();
		Origin= getent("CS_ori_looser", "targetname");
		SendScreenMessage("ALL","^5Jumper Wins The Game!","",4);
		wait 4;
		TeleportPlayer(false,level.activ,Origin,0,"^5You Lose^7, ^5Now DIE^6!!",false);
		_GiveWeapon(level.PlayerInRoom,"m40a3_mp","",true);
		level notify("END_ROOM");
	}
	else if(level.ActiPoints>=MaxPoints)
	{
		Brush = getent("CS_block", "targetname");Brush Show();Brush Solid();
		Origin= getent("CS_ori_looser", "targetname");
		SendScreenMessage("ALL","^5Activator Wins The Game!","",4);
		wait 4;
		TeleportPlayer(false,level.PlayerInRoom,Origin,0,"You Lose, Now DIE!!",false);
		_GiveWeapon(level.activ,"m40a3_mp","",true);
		level notify("END_ROOM");
	}
}

waittill_5050(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Keep Faith In The Gods!","^5Keep Faith In The Gods!");
		thread _5050_Main(0);	
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

_5050_Main()
{
	level endon("END_ROOM");
	for(i=1;i<5;i++)
	{
		iPrintLnBold("=(^4"+(i+1)+"^7)=");
		wait 1;
	}
	thread SendScreenMessage("ALL","^5Choosing The Winner","^1Please Wait...",3);
	wait 5;
	Random = RandomIntRange(0,2);
	if(Random==0)
	{
		thread SendScreenMessage("ALL","^5Jumper Is The Choosed Winner","^1Activator Lose",3);
		wait 3;
		SendMessage(level.PlayerInRoom.Name,"^3GG, Now Kill The Activator!");
		SendMessage(level.activ.Name,"^3You Lose^7,^3 Now DIE!!");
		wait 1;
		//level.activ suicide();
		level.PlayerInRoom freezeControls(0);
		thread _GiveWeapon(level.PlayerInRoom,"m40a3_mp","",true);
	}
	else
	{
		thread SendScreenMessage("ALL","^5Activator Is The Choosed Winner","^1Jumper Lose",3);
		wait 3;
		SendMessage(level.PlayerInRoom.Name,"^3You Lose^7,^3 Now DIE!!");
		SendMessage(level.activ.Name,"^3GG, Now Kill The Jumper!");
		wait 1;
		//level.PlayerInRoom suicide();
		level.activ freezeControls(0);
		thread _GiveWeapon(level.activ,"m40a3_mp","",true);
	}
}

waittill_SolidPath(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Choose Wisely To Win!","^5Choose Wisely To Win!");
		thread SolidPath_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
SolidPath_Main()
{
	//SetUpRoom
	
	for(i=1;i<=4;i++)
	{
		JumperInt = RandomIntRange(1,4);
		ActiInt = RandomIntRange(1,4);
		for(j=1;j<=3;j++)
		{

			if(JumperInt==j)
			{
				Brush = getent("SP_j_"+i+""+j, "targetname");Brush Solid();
			}
			else if (JumperInt!=j)
			{
				Brush = getent("SP_j_"+i+""+j, "targetname");Brush NotSolid();
			}
			
			if(ActiInt==j)
			{
				Brush = getent("SP_a_"+i+""+j, "targetname");Brush Solid();
			}
			else if (ActiInt!=j)
			{
				Brush = getent("SP_a_"+i+""+j, "targetname");Brush NotSolid();
			}
			wait 0.01;
		}
		wait 0.1;
	}
}
waittill_SS(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Stand On Correct Platforms!","^5Stand On Correct Platforms!");
		wait 3;
		thread SS_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

SS_Reset()
{
	for(i=1;i<=9;i++)
	{
		S = getent("SS_S_"+i, "targetname");S Hide();
		A = getent("SS_A_"+i, "targetname");A Show();A Solid();
	}
}

SS_WaitWinner()
{
	level endon("END_ROOM");
	Trigger = getent("SS_LOSE", "targetname");
	trigger waittill("trigger",player);
	if (player.pers["team"] == "allies")
	{
		thread SendToKillRoom(level.activ,level.PlayerInRoom);
	}
	else
	{
		thread SendToKillRoom(level.PlayerInRoom,level.activ);	
	}
	level notify("END_ROOM");
}

SS_Main()
{
	level endon("END_ROOM");
	thread SS_WaitWinner();
	thread SS_Reset();
	level.PlayerInRoom SendMessage("ALL","^6Get Ready!");
	level.activ SendMessage("ALL","^6Get Ready!");
	SendMessage(level.activ.Name,"^3Get Ready^7, ^5Starting In 5..");
	wait 5;
	for(;;)
	{
		Random = RandomIntRange(1,10);
		S = getent("SS_S_"+Random, "targetname");
		A = getent("SS_A_"+Random, "targetname");
		for(i=0;i<4;i++)
		{
			S Show();
			wait 0.3;
			S Hide();
			wait 0.3;
		}
		S Show();
		for(i=1;i<=9;i++)
		{
			if(i!=Random)
			{
				X = getent("SS_A_"+i, "targetname");
				X Hide();
				X NotSolid();
			}
		}
		wait 2;
		thread SS_Reset();
		wait 3;

	}
}

waittill_CrossTheRoad(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Reach The End First!","^5Reach The End First!");
		if (!level.CTR_IsVehicalsRunning)
			thread CTR_Main(JumperOri,ActivatorOri);
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

CTR_Main(JumperOri,ActivatorOri)
{
	level.CTR_IsVehicalsRunning = true;

	thread CTR_Tele("CTR_T1",JumperOri,ActivatorOri);
	thread CTR_Tele("CTR_T2",JumperOri,ActivatorOri);

	thread CTR_Side("CTR_B1","CTR_T1",1,true);
	thread CTR_Side("CTR_B2","CTR_T2",0,false);
}

CTR_Side(_Brush,_Trigger,M,MoveDir)
{
	Brush = getent(_Brush, "targetname");
	Damage = getent(_Trigger, "targetname");
	Damage enableLinkTo();
	Damage linkTo(Brush);
	Models = [];

	Brush hide();

	for (i = 1; i <= 12; i++) 
	{
		if(i%2==M)
		{
			Model = getent("CTR_M"+i, "targetname");
			Model enableLinkTo();
			Model linkTo(Brush);
			Models[Models.size] = Model;
		}
		wait 0.03;
	}

	Speed = 1;
	while(true)
	{
		if(MoveDir)
		{
			Brush movey(-2600,Speed);
			wait Speed;
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] hide();				
			}
			Brush moveZ(-500,0.1);
			Brush rotateYaw(180, 0.5);
			wait 0.6;
			Brush moveZ(500,0.1);
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] show();				
			}
			wait 0.5;
			Brush movey(2600,Speed);
			wait Speed;
						for (i = 0; i < Models.size; i++) 
			{
				Models[i] hide();				
			}
			Brush moveZ(-500,0.1);
			Brush rotateYaw(-180, 0.5);
			wait 0.6;
			Brush moveZ(500,0.1);
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] show();				
			}
			wait 0.5;
		}
		else
		{
			Brush movey(2600,Speed);
			wait Speed;
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] hide();				
			}
			Brush moveZ(-500,0.1);
			Brush rotateYaw(180, 0.5);
			wait 0.6;
			Brush moveZ(500,0.1);
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] show();				
			}
			wait 0.5;
			Brush movey(-2600,Speed);
			wait Speed;
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] hide();				
			}
			Brush moveZ(-500,0.1);
			Brush rotateYaw(-180, 0.5);
			wait 0.6;
			Brush moveZ(500,0.1);
			for (i = 0; i < Models.size; i++) 
			{
				Models[i] show();				
			}
			wait 0.5;
		}
	}

}

CTR_Tele(_Trigger,JumperOri,ActivatorOri)
{
	Trigger = getent(_Trigger, "targetname");
	ActiTele = getent(ActivatorOri, "targetname");
	JumperTele = getent(JumperOri, "targetname");
	for(;;)
	{
		Trigger waittill("trigger",player);
		if (player.pers["team"] == "allies")
		{
			thread TeleportPlayer(false,player,JumperTele,1,"^5Try Again!",false);
		}
		else
		{
			thread TeleportPlayer(false,player,ActiTele,1,"^5Try Again!",false);
		}
		wait 0.01;
	}
}

waittill_Lava(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Reach The End First!","^5Reach The End First!");
		thread LAVA_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

LAVA_Main()
{
	Brush = getent("Lava_brush", "targetname");
	Trig = getent("Lava_trig", "targetname");
	Trig enableLinkTo();
	Trig linkTo(Brush);
	if(!level.LAVA_Waiting)
		thread LAVA_Trig();
	Origin = getent("Lava_Point", "targetname");
	Brush MoveTo(Origin.origin,0.7);
	wait 6;
	Brush movez(608,4);
	wait 5;
	Brush MoveTo(Origin.origin,0.7);
}

LAVA_Trig()
{
	Trig = getent("Lava_trig", "targetname");
	level.LAVA_Waiting = true;
	for(;;)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			SendScreenMessage("ALL","^6Activator Fell In Lava!","^5Jumper Wins!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);
		}
		else
		{
			SendScreenMessage("ALL","^6Jumper Fell In Lava!","^5Activator Wins!",3);
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
		}
		wait 0.01;
	}
}

waittill_Lasers(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	Brush = getent("L_platform", "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		Brush Show();
		Brush Solid();
		RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Don't Get Hit!","^5Don't Get Hit!");
		thread Lasers_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

Lasers_Main()
{
	if(!level.L_Lasers)
	{
		thread Lasers_On();
	}
	Brush = getent("L_platform", "targetname");
	wait 5;
	Brush Hide();
	Brush NotSolid();
	
}
Lasers_On()
{
	level.L_Lasers=true;
	for(i=1;i<=4;i++)
	{
		Brush = getent("L_"+i, "targetname");
		Trig = getent("L_t"+i, "targetname");
		Trig enableLinkTo();
		Trig linkTo(Brush);
		thread Lasers_Trig("L_t"+i);
		Brush NotSolid();
	}
	
	MT = [];
	MT[0] = -2000;
	MT[1] = -3024;
	MT[2] = 2000;
	MT[3] = 3024;
	
	MT2 = [];
	MT2[0] = 2000;
	MT2[1] = 3024;
	MT2[2] = -2000;
	MT2[3] = -3024;
	
	WaitTime  = 0;
	while(true)
	{
		i = RandomIntRange(1,5);
		WaitTime = randomFloatRange(0.2,1.2);
		Brush = getent("L_"+i, "targetname");
		if(i%2==0)
			Brush movex(MT[i-1],WaitTime);
		else
			Brush movey(MT[i-1],WaitTime);
		wait WaitTime + 1;
		WaitTime = randomFloatRange(0.2,1.2);
		if(i%2==0)
			Brush movex(MT2[i-1],WaitTime);
		else
			Brush movey(MT2[i-1],WaitTime);
		wait WaitTime+1;
	}
}

Lasers_Trig(_Trigger)
{
	Trig = getent(_Trigger, "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			SendScreenMessage("ALL","^6Activator Touched a Laser!","^5Jumper Wins!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);		
		}
		else
		{
			SendScreenMessage("ALL","^6Jumper Touched a Laser!","^5Activator Wins!",3);
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
		}
	}
}

waittill_Maze(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Reach The End First!","^5Reach The End First!");
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

waittill_Dropper(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Reach The End First!","^5Reach The End First!");
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

Dropper_Fall()
{
	Trig = getent("DR_fall", "targetname");
	ActiOri = getent("ori_room_dropper_a", "targetname");
	JumperOri = getent("ori_room_dropper_j", "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			level.PlayerPoints ++;
			if(level.PlayerPoints>=3)
			{
				
				SendScreenMessage("ALL","^6Jumper Ran Out Of Lives!","^5Activator Wins!",3);
				thread SendToKillRoom(level.activ,level.PlayerInRoom);
			}
			else
				thread TeleportPlayer(false,level.PlayerInRoom,JumperOri,1,"^6Try Again!, ^2"+(3-level.PlayerPoints)+"^6 Lives Left!",false);
		}
		else
		{
			level.ActiPoints ++;
			if(level.ActiPoints>=3)
			{
				SendScreenMessage("ALL","^6Activator Ran Out Of Lives!","^5Jumper Wins!!",3);
				thread SendToKillRoom(level.PlayerInRoom,level.activ);
			}
			else
				thread TeleportPlayer(false,level.activ,ActiOri,1,"^6Try Again!, ^2"+(3-level.ActiPoints)+"^6 Lives Left!",false);
		}
		
	}
}

waittill_SniperSchool(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Get "+level.SNS_Points+" Points First To Win!","^5Get "+level.SNS_Points+" Points First To Win!");
		thread SNS_Work();
		if(!level.SNS_Trig)
			thread SNS_CreateTargets();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

SNS_CreateTargets()
{
	level.SNS_Trig = true;
	for(i=1;i<=23;i++)
		thread SNS_Target("SNS_T"+i,"SNS_B"+i);
}

SNS_Target(_Trig,_Brush)
{
	Brush = getent(_Brush,"targetname");
	Trig = getent(_Trig,"targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		Brush movez(-288,0.5);
		wait 0.5;
		Brush Hide();
		SendMessage(player.Name,"^5+1");
		if (player.pers["team"] == "allies")
		{
			level.PlayerPoints += 1;
		}
		else
		{
			level.ActiPoints += 1;
		}
		if(level.PlayerPoints>=level.SNS_Points)
		{
			level.SSH_Timer destroy();
			SendScreenMessage("ALL","^6Jumper Has Reached The Score First!","^5Activator Loose!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);
		}
		else if(level.ActiPoints>=level.SNS_Points)
		{
			level.SSH_Timer destroy();
			SendScreenMessage("ALL","^6Activator Has Reached The Score First!","^5Jumper Loose!",3);
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
		}
		wait 5;
		Brush Show();
		Brush movez(288,0.5);
		wait 0.5;
	}
}

SNS_Work()
{
	level endon("END_ROOM");
	WaitTimer = 5;
	
	if(isDefined(level.SSH_Timer))
		level.SSH_Timer destroy();
	
	level.SSH_Timer= newHudElem();
    level.SSH_Timer.alignx = "left";
    level.SSH_Timer.alignY = "top";
    level.SSH_Timer.horzAlign = "left";
    level.SSH_Timer.vertAlign = "top";
    level.SSH_Timer.x = 30;
    level.SSH_Timer.y = 75;
	level.SSH_Timer.fontScale = 2;
	level.SSH_Timer.glowAlpha = 1;
	
	if (isDefined(level.randomcolor))
	{
		self.SSH_Timer.glowColor = level.randomcolor;
	}
	else
	{
		self.SSH_Timer.glowColor = (1, 0, 0);
	}
	
	for(;;)
	{
		level.SSH_Timer setvalue("");
		level.SSH_Timer setText("=(^5Activator ^7:^6"+level.ActiPoints+" ^5/ "+level.SNS_Points+ " ^7)=\n =(^5Jumper   ^7:^6"+level.PlayerPoints+" ^5/ "+level.SNS_Points+ " ^7)=");
		if(!isAlive(level.PlayerInRoom))
		{
			level.SSH_Timer destroy();
			level notify("END_ROOM");
		}
		wait 0.2;
	}
}


waittill_RPG(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Blow That Activator!","^5Blow That Jumper!");
		if(!level.RPG_Trig)
		{
			thread RPG_Ammo();
			level.RPG_Trig = true;
		}
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

RPG_Ammo()
{
	Trig = getent("RPG_Ammo", "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
			level.PlayerInRoom giveMaxAmmo("rpg_mp");
		else
			level.activ giveMaxAmmo("rpg_mp");
		wait 2;
	}
}

waittill_GunGame(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Get To The Last Weapon!","^5Get To The Last Weapon!");
		thread GG_CheckHit(JumperOri,ActivatorOri);
		thread GG_SetupPlayers();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

GG_CheckHit(_JumperOri,_ActivatorOri)
{
	level endon("END_ROOM");
	level.GG_Trig = true;
	Damage = 100;
	JumperOri = getent(_JumperOri, "targetname");
	ActivatorOri = getent(_ActivatorOri, "targetname");
	
    while (1)
    {
        level waittill("player_damage", victim, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

        if (isPlayer(eAttacker) && isPlayer(victim) && eAttacker.pers["team"] == "allies" && victim.pers["team"] != "allies")
        {
			level.AD += iDamage;
			if(level.AD>=Damage)
			{
				level.PlayerPoints += 1;
				thread GG_SetupPlayers();
				SendMessage("ALL","^6Player Killed Activator!");
				thread TeleportPlayer(false,level.activ,ActivatorOri,1,"^6Try Again!",false);		
				thread TeleportPlayer(false,level.PlayerInRoom,JumperOri,1,"^6Keep Going!",false);
			}
        }
		else if (isPlayer(eAttacker) && isPlayer(victim) && eAttacker.pers["team"] != "allies" && victim.pers["team"] == "allies")
        {
			level.PD += iDamage;
			if(level.PD>=Damage)
			{
				level.ActiPoints += 1;
				thread GG_SetupPlayers();
				SendMessage("ALL","^6Activator Killed Player!");
				thread TeleportPlayer(false,level.activ,ActivatorOri,1,"^6Keep Going!",false);		
				thread TeleportPlayer(false,level.PlayerInRoom,JumperOri,1,"^6Try Again!",false);	
			}
        }
    }
}

GG_SetupPlayers()
{
	if(level.PlayerPoints>=level.GunGameGuns.size)
	{
		//Player Wins
		SendScreenMessage("ALL","^6Jumper Has Reached The Score First!","^5Activator Loose!",3);
		thread SendToKillRoom(level.PlayerInRoom,level.activ);
		level.activ.health = level.DefHealth;
		level.jumperImg destroy();
        level.actiImg destroy();
        level.jumperImg_bg destroy();
        level.actiImg_bg destroy();
		level notify("END_ROOM");
		return;
	}
	else if(level.ActiPoints>=level.GunGameGuns.size)
	{
		//ActiWins
		SendScreenMessage("ALL","^6Activator Has Reached The Score First!","^5Jumper Loose!",3);
		thread SendToKillRoom(level.activ,level.PlayerInRoom);
		level.PlayerInRoom.health = level.DefHealth;
		level.jumperImg destroy();
        level.actiImg destroy();
        level.jumperImg_bg destroy();
        level.actiImg_bg destroy();
		level notify("END_ROOM");
		return;
	}
	
	level.PD = 0;
	level.AD = 0;
	
	level.PlayerInRoom.health = level.InfHealth;
	level.activ.health = level.InfHealth;
		
	thread _GiveWeapon(level.PlayerInRoom,level.GunGameGuns[level.PlayerPoints],"",true);
	thread _GiveWeapon(level.activ,level.GunGameGuns[level.ActiPoints],"",true);
}

waittill_FallingBlocks(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Avoid Falling Blocks!","^5Avoid Falling Blocks!");
		wait 3;
		thread FB_Reset();
		thread FB_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

FB_Main()
{
	level endon("END_ROOM");
	SendMessage("ALL","^6Starting^7..^5Go!");
	wait 1;
	while(1)
	{	
		ChoosedList = [];
		for(i=1;i<=5;i++)
		{
			Rand = RandomIntRange(1,17);
			HaveItem = false;
			for(j=0;j<ChoosedList.size;j++)
			{
				if(Rand == ChoosedList[j])
				{
					HaveItem = true;
					break;
				}
			}
			
			if(!HaveItem)
			{
				ChoosedList[ChoosedList.size] = Rand;
				Trig = getent("FB_T"+Rand, "targetname");
				Brush = getent("FB_B"+Rand, "targetname");
				
				Brush NotSolid();
				Trig enablelinkto();
				Trig linkto(Brush);
				Brush movez(-440,0.5);
				Brush Solid();
				wait 1;
			}
		}
		
		wait 2;
		thread FB_Reset();
		wait 2;
	}
}

FB_CheckHit(_Trig)
{
	level endon("END_ROOM");
	Trig = getent(_Trig, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			SendScreenMessage("ALL","^6Jumper Was Hit By A Falling Block!","^5Activator Wins!",3);
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
			level notify("END_ROOM");
		}
		else
		{			
			SendScreenMessage("ALL","^6Activator Was Hit By A Falling Block!","^5Jumper Wins!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);
			level notify("END_ROOM");
		}
	}
}

FB_Reset()
{
	for(i=1;i<=16;i++)
	{
		Trig = getent("FB_T"+i, "targetname");
		Brush = getent("FB_B"+i, "targetname");
		Origin = getent("FB_O"+i, "targetname");
		
		Trig enablelinkto();
		Trig linkto(Brush);
		thread FB_CheckHit("FB_T"+i);
		Brush MoveTo(Origin.origin,0.1);
	}
}

waittill_Spleef(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Destroy Tiles And Push That Activator To Bottom","^5Destroy Tiles And Push That Jumper To Bottom");
		thread SPL_Main();
		thread SPL_Wait();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
SPL_Main()
{
	SET = getent("SPL_SET", "targetname");
	SET Show();
	SET Solid();
	SendMessage("ALL","^6Setting Up The Room^7, ^6Please Wait");
	BrushCount = 64;
	for(i=1;i<=BrushCount;i++)
	{
		Brush = getent("SPL_B"+i, "targetname");
		Brush Show();
		Brush Solid();
		thread SPL_TileWait(i);
		wait 0.01;
	}
	
	SET Hide();
	SET NotSolid();
}

SPL_TileWait(Num)
{
	level endon("END_ROOM");
	Trig = getent("SPL_T"+Num, "targetname");
	Brush = getent("SPL_B"+Num, "targetname");
	Trig waittill("trigger", player);
	Brush NotSolid();
	Brush Hide();
	return;
}

SPL_Wait()
{
	level endon("END_ROOM");
	Trig = getent("SPL_Fall", "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		if (player.pers["team"] == "allies")
		{
			SendScreenMessage("ALL","^6Jumper Fell In!","^5Activator Wins!",3);	
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
			level notify("END_ROOM");
		}
		else
		{			
			SendScreenMessage("ALL","^6Activator Fell In!","^5Jumper Wins!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);	
			level notify("END_ROOM");
		}
		return;
	}
}

SendToKillRoom(Winner,Looser)
{
	Winner.maxhealth = level.DefHealth;
	Winner.health = Winner.maxhealth;
	Looser.maxhealth = level.DefHealth;
	Looser.health = Looser.maxhealth;
	Winner SetMoveSpeedScale( 1.2 );
	Looser SetMoveSpeedScale( 1.2 );
	Winner Show();
	Looser Show();
	Winner AllowAds( true );
	Looser AllowAds( true );
	SetModels(level.activ,false,"plr_terry_dragonwarrior");
	thread TeleportPlayer(true,Looser,level.killroom_j,1,"^5Better Luck Next Time",false);
	thread TeleportPlayer(false,Winner,level.killroom_a,1,"^5GG, NOW Kill The Jumper!",false);
	looser takeAllWeapons();
	thread _GiveWeapon(Winner,"m40a3_mp","",true);
}


waittill_Collector(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Collect All 5 Spheres First!","^5Collect All 5 Spheres First!");
		for(i=1;i<=10;i++)
		{
			thread COL_WaitCollect(i);
		}
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
COL_WaitCollect(i)
{
	level endon("END_ROOM");
	Trig = getent("COL_T"+i, "targetname");
	Brush = getent("COL_B"+i, "targetname");
	Brush Show();
	Brush NotSolid();
	Trig waittill("trigger", player);
	Brush Hide();
	if(player.pers["team"] == "allies")
	{
		level.PlayerPoints += 1;
		if(level.PlayerPoints>=5)
		{
			SendScreenMessage("ALL","^6Jumper Collected All 5 Spheres First!","^5Activator Lose!",3);
			thread SendToKillRoom(level.PlayerInRoom,level.activ);
			level notify("END_ROOM");
			return;
		}
	}
	else
	{
		level.ActiPoints += 1;
		if(level.ActiPoints>=5)
		{
			SendScreenMessage("ALL","^6Activator Collected All 5 Spheres First!","^5Jumper Lose!",3);	
			thread SendToKillRoom(level.activ,level.PlayerInRoom);
			level notify("END_ROOM");
			return;
		}
	}
	thread SendMessage(player.Name,"^5You've Collected One Sphere ^6"+(5-level.PlayerPoints)+" ^5To Go!");
	
}

waittill_BombTag(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Knife Activator To Pass The Bomb!","^5Knife Jumper To Pass The Bomb");
		thread BT_Timer();
		thread BT_CheckHit(JumperOri,ActivatorOri);
		level.PlayerInRoom.health = level.InfHealth;
		level.activ.health = level.InfHealth;
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

BT_Timer()
{
	a = RandomIntRange(0,2);
	if(a==1){level.BT_CurrentHolder = level.PlayerInRoom;}
	else{level.BT_CurrentHolder =level.activ;}
	level endon("END_ROOM");
	
    level.BT_Timer= newHudElem();
    level.BT_Timer.alignx = "left";
    level.BT_Timer.alignY = "top";
    level.BT_Timer.horzAlign = "left";
    level.BT_Timer.vertAlign = "top";
    level.BT_Timer.x = 55;
    level.BT_Timer.y = 75;
	level.BT_Timer.fontScale = 2;
	level.BT_Timer.glowAlpha = 1;
	
	level.BT_CurrentHolderText= newHudElem();
    level.BT_CurrentHolderText.alignx = "left";
    level.BT_CurrentHolderText.alignY = "top";
    level.BT_CurrentHolderText.horzAlign = "left";
    level.BT_CurrentHolderText.vertAlign = "top";
    level.BT_CurrentHolderText.x = 55;
    level.BT_CurrentHolderText.y = 55;
	level.BT_CurrentHolderText.fontScale = 2;
	level.BT_CurrentHolderText.glowAlpha = 1;

	if (isDefined(level.randomcolor))
	{
		self.BT_Timer.glowColor = level.randomcolor;
		self.BT_CurrentHolderText.glowColor = level.randomcolor;
	}
	else
	{
		self.BT_Timer.glowColor = (1, 0, 0);
		self.BT_CurrentHolderText.glowColor = (1, 0, 0);
	}	
	
	WaitTime = 20;
	for(i=1;i<=WaitTime;i++)
	{
		level.BT_Timer setvalue("=(^6Time To Detonate ^7: ^5"+(WaitTime-i)+" ^7)=");
		level.BT_Timer setText("=(^6Time To Detonate ^7: ^5"+(WaitTime-i)+" ^7)=");
		
		level.BT_CurrentHolderText setvalue("=(^6Current Bomb Holder ^7: ^5"+level.BT_CurrentHolder.name+" ^7)=");
		level.BT_CurrentHolderText setText("=(^6Current Bomb Holder ^7: ^5"+level.BT_CurrentHolder.name+" ^7)=");

		wait 1;
	}
	
	
	if(level.BT_CurrentHolder==level.PlayerInRoom)
	{
		SendScreenMessage("ALL","^6Jumper Had The Bomb!","^5Activator Wins!",3);	
		thread SendToKillRoom(level.activ,level.PlayerInRoom);
		level.BT_Timer destroy();
		level.BT_CurrentHolderText destroy();
		level.PlayerInRoom.health = level.DefHealth;
		level.activ.health = level.DefHealth;
		level notify("END_ROOM");
	}
	else if(level.BT_CurrentHolder==level.activ)
	{
		SendScreenMessage("ALL","^6Activator Had The Bomb!","^5Jumper Wins!",3);
		thread SendToKillRoom(level.PlayerInRoom,level.activ);
		level.BT_Timer destroy();
		level.BT_CurrentHolderText destroy();
		level.PlayerInRoom.health = level.DefHealth;
		level.activ.health = level.DefHealth;
		level notify("END_ROOM");
	}
	
}

BT_CheckHit(_JumperOri,_ActivatorOri)
{
	level endon("END_ROOM");
	level.GG_Trig = true;
	JumperOri = getent(_JumperOri, "targetname");
	ActivatorOri = getent(_ActivatorOri, "targetname");
	
    while (1)
    {
        level waittill("player_damage", victim, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, psOffsetTime);

        if (isPlayer(eAttacker) && isPlayer(victim) && eAttacker.pers["team"] == "allies" && victim.pers["team"] != "allies")
        {
			if(level.BT_CurrentHolder==level.PlayerInRoom)
			{
				SendMessage("ALL","^5Activator Have The Bomb!");
				level.BT_CurrentHolder = level.activ;
			}
        }
		else if (isPlayer(eAttacker) && isPlayer(victim) && eAttacker.pers["team"] != "allies" && victim.pers["team"] == "allies")
        {
			if(level.BT_CurrentHolder==level.activ)
			{
				SendMessage("ALL","^5Jumper Have The Bomb!");
				level.BT_CurrentHolder = level.PlayerInRoom;
			}
        }
    }
}
waittill_Invincible(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Shoot!, Acti Is Here!","^5Shoot!, Jumper Is Here!");
		wait 1;
		level.PlayerInRoom Hide();
		level.activ Hide();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
SSH_Work()
{
	level endon("END_ROOM");
	WaitTimer = 5;
	
	if(isDefined(level.SSH_Timer))
		level.SSH_Timer destroy();
	
	level.SSH_Timer= newHudElem();
    level.SSH_Timer.alignx = "left";
    level.SSH_Timer.alignY = "top";
    level.SSH_Timer.horzAlign = "left";
    level.SSH_Timer.vertAlign = "top";
    level.SSH_Timer.x = 55;
    level.SSH_Timer.y = 75;
	level.SSH_Timer.fontScale = 2;
	level.SSH_Timer.glowAlpha = 1;
	
	if (isDefined(level.randomcolor))
	{
		self.SSH_Timer.glowColor = level.randomcolor;
	}
	else
	{
		self.SSH_Timer.glowColor = (1, 0, 0);
	}
	
	for(;;)
	{
		A = RandomIntRange(0,level.WeaponList.size);
		thread _GiveWeapon(level.PlayerInRoom,level.WeaponList[A],"",true);
		thread _GiveWeapon(level.activ,level.WeaponList[A],"",true);
		for(i=1;i<=WaitTimer;i++)
		{
			level.SSH_Timer setvalue("=(^5New Weapon In ^7:^6"+(WaitTimer-i)+"^7)=");
			level.SSH_Timer setText("=(^5New Weapon In ^7:^6"+(WaitTimer-i)+"^7)=");
			if(!isAlive(level.PlayerInRoom))
			{
				level.SSH_Timer destroy();
				level notify("END_ROOM");
			}
			wait 1;
		}
	}
}

waittill_ReversedDR(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Dont Let Activator Finish!","^5Finish It!");
		thread RDR_Reset();
		wait 1;
		thread RDR_Start();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

RDR_Start()
{
	level endon("END_ROOM");
	Door = getent("RDR_DOOR", "targetname");
	thread RDR_T1();
	thread RDR_T2();
	thread RDR_T3();
	thread RDR_T4();
	thread RDR_T5();
	thread RDR_WaitFall();
	thread RDR_WaitFinish();
	for(i=1;i<=5;i++)
	{
		SendMessage(level.PlayerInRoom.Name,"^5Opening Door In ^6"+i);
		SendMessage(level.activ.Name,"^5Opening Door In ^6"+i);
		wait 1;
	}
	
	Door movez(-300,1);
	SendMessage(level.Activator.Name,"^5GO!");
}

RDR_WaitFall()
{
	level endon("END_ROOM");
	Trig = getent("RDR_FALL", "targetname");
	Trig waittill("trigger", player);		
	SendScreenMessage("ALL","^6Activator Fell In!","^5Jumper Wins!",3);
	thread SendToKillRoom(level.PlayerInRoom,level.activ);
	level notify("END_ROOM");
}

RDR_WaitFinish()
{
	level endon("END_ROOM");
	Trig = getent("RDR_FINISH", "targetname");
	Trig waittill("trigger", player);
	SendScreenMessage("ALL","^6Activator Finished The Room!","^5Jumper Loose!",3);
	thread SendToKillRoom(level.activ,level.PlayerInRoom);
	level notify("END_ROOM");
}

RDR_T1()
{
	level endon("END_ROOM");
	Trig = getent("RDR_T1", "targetname");
	Brush = getent("RDR_B1", "targetname");
	Trig waittill("trigger", player);
	while (1)
	{
		Brush movex(192,0.5);
		wait 2;
		Brush movex(-192,0.5);
		wait 2;
	}
}

RDR_T2()
{
	level endon("END_ROOM");
	Trig = getent("RDR_T2", "targetname");
	Brush = getent("RDR_B2", "targetname");
	Trig waittill("trigger", player);
	while (1)
	{
		Brush rotateYaw(360,1);
		wait 1;
	}
}

RDR_T3()
{
	level endon("END_ROOM");
	Trig = getent("RDR_T3", "targetname");
	Brush1 = getent("RDR_B3", "targetname");
	Brush2 = getent("RDR_B5", "targetname");
	Trig waittill("trigger", player);
	while (1)
	{
		Brush1 movex(184,1.5);
		Brush2 movex(-184,1.5);		
		wait 2.5;
		Brush1 movex(-184,1.5);
		Brush2 movex(184,1.5);
		wait 2.5;
	}
}

RDR_T4()
{
	level endon("END_ROOM");
	Trig = getent("RDR_T4", "targetname");
	Brush = getent("RDR_B6", "targetname");
	Trig waittill("trigger", player);
	Brush movey(-500,1);
	wait 1.5;
	Brush Hide();
	Brush NotSolid();
}

RDR_T5()
{
	level endon("END_ROOM");
	Trig = getent("RDR_T5", "targetname");
	Brush1 = getent("RDR_B7", "targetname");
	Brush2 = getent("RDR_B8", "targetname");
	Brush3 = getent("RDR_B9", "targetname");
	Trig waittill("trigger", player);
	while(1)
	{
		Brush1 Hide();Brush1 NotSolid();
		Brush2 Show();Brush2 Solid();
		Brush3 Show();Brush3 Solid();
		wait 1.5;
		Brush2 Hide();Brush2 NotSolid();
		Brush1 Show();Brush1 Solid();
		Brush3 Show();Brush3 Solid();
		wait 1.5;
		Brush3 Hide();Brush3 NotSolid();
		Brush2 Show();Brush2 Solid();
		Brush1 Show();Brush1 Solid();
		wait 1.5;
	}
}

RDR_Reset()
{
	Door = getent("RDR_DOOR", "targetname");
	Door_Ori = getent("RDR_OD", "targetname");
	
	Ori1 = getent("RDR_O1", "targetname");
	Ori2 = getent("RDR_O2", "targetname");
	Ori3 = getent("RDR_O3", "targetname");
	Ori4 = getent("RDR_O4", "targetname");
	
	Brush1 = getent("RDR_B1", "targetname");
	Brush2 = getent("RDR_B2", "targetname");
	Brush3 = getent("RDR_B3", "targetname");
	Brush4 = getent("RDR_B4", "targetname");
	Brush5 = getent("RDR_B5", "targetname");
	Brush6 = getent("RDR_B6", "targetname");
	Brush7 = getent("RDR_B7", "targetname");
	Brush8 = getent("RDR_B8", "targetname");
	Brush9 = getent("RDR_B9", "targetname");
	
	
	Door MoveTo(Door_Ori.origin,0.1);
	Brush1 MoveTo(Ori1.origin,0.1);
	Brush3 MoveTo(Ori2.origin,0.1);
	Brush5 MoveTo(Ori3.origin,0.1);
	Brush6 MoveTo(Ori4.origin,0.1);Brush6 Show();Brush6 Solid();
	
	Brush7 Show();Brush7 Solid();
	Brush8 Show();Brush8 Solid();
	Brush9 Show();Brush9 Solid();
	
}

Wait_RiverCross()
{
	Trig = getent("RivC_Start", "targetname");
	Trig waittill("trigger",player);
	Trig delete();
	B1   = getent("RivC_B1", "targetname");
	B2   = getent("RivC_B2", "targetname");
	for(;;)
	{
		B1 movex(160,1);
		B2 movex(-160,1);
		wait 1;
		B1 movex(-160,1);
		B2 movex(160,1);
		wait 1;
	}
}
Wait_Dropk()
{
	Trig = getent("DropK_T", "targetname");
	Trig waittill("trigger",player);
	Trig delete();
	B1   = getent("DropK_B1", "targetname");
	B2   = getent("DropK_B2", "targetname");
	for(;;)
	{
		B1 movez(-1728,1);
		B2 movez(1728,1);
		wait 2;
		B1 movez(1728,1);
		B2 movez(-1728,1);
		wait 2;
	}
}

waittill_Doors(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Reach The End!, Some Doors Are SOLID!","^5Reach The End!, Some Doors Are SOLID!");
		thread Doors_Main();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

Doors_Main()
{
	for (i = 1; i <= 5; i++) 
	{
		rnd = randomIntRange(1,5);
		for (j = 1; j <=4; j++) 
		{
			Brush = getent("DOORS_"+i+""+j, "targetname");
			if(rnd==j)
				Brush NotSolid();
			else
				Brush Solid();
		}
	}
}

waittill_ProneKnife(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Kill That Activator!","^5Kill That Jumper!");
		//level.PlayerInRoom SetStance("prone");
		//level.activ SetStance("prone");
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
waittill_TPKnife(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Kill That Activator!","^5Kill That Jumper!");
		thread TPKnife_Wait();
		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}

TPKnife_Wait()
{
	level endon("END_ROOM");
	Trig = getent("TPK_T", "targetname");
	Oris = getentarray("TPK_O1", "targetname");
	for(;;)
	{
		Trig waittill("trigger", player);
		Rnd = RandomIntRange(1,(Oris.size+1));
		Ori = Oris[Rnd];
		thread TeleportPlayer(false,player,Ori,0,"^5Teleported!",false);
	}
}

/*
waittill_Heli(_Trigger,JumperOri,ActivatorOri,RoomName,Weap1,Weap2)
{
	Trig = getent(_Trigger, "targetname");
	while(1)
	{
		Trig waittill("trigger", player);
		thread RoomSetUp(player,JumperOri,ActivatorOri,RoomName,Weap1,Weap2,"^5Collect All 5 Spheres First!","^5Collect All 5 Spheres First!");

		player waittill_any("death", "disconnect");
		wait 0.1;
	}
}
*/

//Elevators

Wait_ELE1()
{
	Trig = getent("ELE_1_T", "targetname");
	Brush1 = getent("ELE_1_B1", "targetname");
	Brush2 = getent("ELE_1_B2", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 moveY(1664,2);
		Brush2 moveY(-1664,2);
		wait 4;
		Brush1 moveY(-1664,2);
		Brush2 moveY(1664,2);
		wait 3;
	}
}
Wait_ELE2()
{
	Trig = getent("ELE_2_T", "targetname");
	Brush1 = getent("ELE_2_B1", "targetname");
	Brush2 = getent("ELE_2_B2", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 moveZ(576,2);
		Brush2 moveZ(-576,2);
		wait 3;
		Brush1 moveZ(-576,2);
		Brush2 moveZ(576,2);
		wait 2;
	}
}
Wait_ELE3()
{
	Trig = getent("ELE_3_T", "targetname");
	Brush1 = getent("ELE_3_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 movez(1168,2);
		wait 3;
		Brush1 movez(-1168,2);
		wait 2;
	}
}
Wait_ELE4()
{
	Trig = getent("ELE_4_T", "targetname");
	Brush1 = getent("ELE_4_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 movez(1168,2);
		wait 3;
		Brush1 movez(-1168,2);
		wait 2;
	}
}
Wait_ELE5()
{
	Trig = getent("ELE_5_T", "targetname");
	Brush1 = getent("ELE_5_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 movez(1168,2);
		wait 3;
		Brush1 movez(-1168,2);
		wait 2;
	}
}
Wait_ELE6()
{
	Trig = getent("ELE_6_T", "targetname");
	Brush1 = getent("ELE_6_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 movez(1168,2);
		wait 3;
		Brush1 movez(-1168,2);
		wait 2;
	}
}
Wait_ELE7()
{
	Trig = getent("ELE_7_T", "targetname");
	
	Ori1 = getent("ELE_7_O1", "targetname");
	Ori2 = getent("ELE_7_O2", "targetname");
	
	Brush1 = getent("ELE_7_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 MoveTo(Ori1.origin,2);
		wait 3;
		Brush1 MoveTo(Ori2.origin,2);
		wait 2;
	}
}
Wait_ELE8()
{
	Trig = getent("ELE_8_T", "targetname");
	
	Ori1 = getent("ELE_8_O1", "targetname");
	Ori2 = getent("ELE_8_O2", "targetname");
	
	Brush1 = getent("ELE_8_B1", "targetname");
	Trig waittill("trigger", player);
	Trig delete();
	for(;;)
	{
		wait 1;
		Brush1 MoveTo(Ori1.origin,2);
		wait 3;
		Brush1 MoveTo(Ori2.origin,2);
		wait 2;
	}
}