main()
{

    level.flameFX = loadFX("deathrun/flamey");
    level.xenonFX = loadFX("deathrun/xenon");
	level.darmuhFX = loadFX("deathrun/darmuh");
	level.lossyFX = loadFX("deathrun/lossy");
	level.fearzFX = loadFX("deathrun/fearz");
	level.spiritFX = loadFX("deathrun/spirit");
	level.morgaanFX = loadFX("deathrun/morgaan");
	level.devilFX = loadFX("deathrun/devil");
	level.spinFX = loadFX("deathrun/spinny");
	level.laser = LoadFX("explosions/laser");
	level.explosion = loadFX("deathrun/explotion");
	level.leak = loadFX("deathrun/leak");
	level.splash = loadFX("deathrun/splash");
	level.plasma = loadFX("deathrun/plasma");
	level.coolfx = loadFX("deathrun/coolfx");
	level.fx_explosion = LoadFX( "deathrun/explosion" );

	level.abovehuman["fireball_charge"] = LoadFX("deathrun/shipcharge");
	level.abovehuman["fireball_tracer"] = LoadFX("deathrun/shiptracer");
	level.abovehuman["fireball_explosion"] = LoadFX("deathrun/shipimpact");

	PreCacheItem("barrett_acog_mp");
	PreCacheItem("saw_mp");
	PreCacheModel("weapon_raygun");
	precacheModel( "eliza_BR2" );
	precacheModel( "sonic" );
	preCacheShader("reticle_center_cross");

	maps\mp\_load::main();
	maps\mp\drown::main();
	maps\mp\_teleport::main();

	//ambientplay( "space2" );
	setdvar("r_distortion", " 1");
	setdvar("r_specular", " 0");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	addTriggerToList( "trigger_spin" );
	addTriggerToList( "trigger_spin2" );
	addTriggerToList( "trigger_spin3" );
	addTriggerToList( "trigger_path" );
	addTriggerToList( "trigger_bounce" );
	addTriggerToList( "trigger_bounce2" );
	addTriggerToList( "trigger_bounce3" );
	addTriggerToList( "trigger_cross1" );
	addTriggerToList( "trigger_cross2" );
	addTriggerToList( "trigger_cross3" );
	addTriggerToList( "trigger_crossdelete" );

	////---------------- This Part Was Made By Duffman-------------------

	level.shaders = strTok("ui_host;line_vertical;nightvision_overlay_goggles",";");
	for(i=0;i<level.shaders.size;i++)
		precacheShader(level.shaders[i]);
	level.map_vips["guid"] = [];
	level.map_vips["name"] = [];
	level.menuoption["name"] = [];
	level.menuoption["script"] = [];
	//---------------------ViPs------------------------
	addVip("6547f97b","Xenon");
	addVip("fb93ac5f","Lossy");
	addVip("9dccdd78","3xP' DuffMan");
	//-------------------------------------------------

	//------------------Menu options-------------------
	//         Displayname    function
	addMenuOption("^4 DO NOT STACK OPTIONS !!");
	addMenuOption("^1Give Life",Braxi\_mod::GiveLife);
	addMenuOption("^1Respawn",braxi\_mod::respawn);
	addMenuOption("^1Splat !!",Braxi\_mod::gib_splat);
	addMenuOption("^1Juggernaut",maps\mp\mp_dr_detained::jugga);
	addMenuOption("^1Doggy Style",maps\mp\mp_dr_detained::dog);
	addMenuOption("^1Party in my pants bitches",maps\mp\mp_dr_detained::partymode);
	addMenuOption("^1Sonic Dafaq !!",maps\mp\mp_dr_detained::sonic);
	addMenuOption("^4 DO NOT STACK OPTIONS !!");
	////---------------- This Part Was Made By Duffman-------------------
	thread onPlayerConnected();

	/////------------Fx-----------------------------

	playLoopedFX(level.flameFX, 0.05, (-520, -2340, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -2940, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -3490, -1220));
	playLoopedFX(level.flameFX, 0.05, (-520, -2340, -1620));
	playLoopedFX(level.flameFX, 0.05, (-520, -2940, -1620));
	playLoopedFX(level.flameFX, 0.05, (-520, -3490, -1620));
	playLoopedFX(level.flameFX, 0.05, (-452, -6706, -1190));
	playLoopedFX(level.flameFX, 0.05, (-452, -7575, -1190));
	playLoopedFX(level.flameFX, 0.05, (-452, -8480, -1190));
	playLoopedFX(level.flameFX, 0.05, (-184, -9834, 1084));
	playLoopedFX(level.leak, 0.05, (184, -7488, -1368));
	playLoopedFX(level.leak, 0.05, (184, -7783, -1368));
	playLoopedFX(level.splash, 0.05, (184, -7488, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7448, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7783, -1680));
	playLoopedFX(level.splash, 0.05, (184, -7743, -1680));
	playLoopedFX(level.plasma, 0.05, (-512, -512, 800));
	playLoopedFX(level.plasma, 0.05, (162, -1736, -944));
	playLoopedFX(level.plasma, 0.05, (162, -2112, -944));
	playLoopedFX(level.plasma, 0.05, (162, -3582, -944));
	playLoopedFX(level.plasma, 0.05, (162, -3388, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -3582, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -3388, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -1736, -944));
	playLoopedFX(level.plasma, 0.05, (-1200, -2112, -944));
	playLoopedFX(level.plasma, 0.05, (-608, -5680, -1022));
	playLoopedFX(level.plasma, 0.05, (-608, -5872, -910));
	playLoopedFX(level.plasma, 0.05, (-608, -6080, -1022));
	playLoopedFX(level.plasma, 0.05, (218, -5714, -1022));
	playLoopedFX(level.plasma, 0.05, (218, -5872, -910));
	playLoopedFX(level.plasma, 0.05, (218, -6066, -1022));

	////---------------Threads-------------

	thread block();
	thread block2();
	thread block3();
	thread block4();
	thread door();
	thread door2();
	thread door3();
	thread door4();
	thread spin();
	thread spin2();
	thread spin3();
	thread pillar();
	thread pillar2();
	thread pillar3();
	thread bounce();
	thread bounce2();
	thread bounce3();
	thread givefire();
	thread addTestClients();
	thread blah();
	thread cross1();
	thread cross2();
	thread cross3();
	thread yeah();
	thread dave();
	thread crossdelete();
	thread printCredits();
	thread teleportsniper();
	thread teleportknife();
	thread teleportbounce();
	thread give_m40();
	thread teleportjump();
	thread way();
	thread finalFight();
	thread boom();
	thread givefire2();
	thread givefire3();
	thread givefire4();
	thread givefire5();
	thread poopoopoo();
	thread flyingpoo();
	thread flyingpoo2();
	thread KillOnEscape();
	thread getDamage();
	//thread mmm();

	}

	/////------------Random shit-----------------

blah()
{
    wait 2;

    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)
    {
        if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "6547f97b" )
        {
            players[i] detachall();
            players[i] setmodel("eliza_BR2");
            wait 0.05;
            players[i] Setviewmodel("viewmodel_hands_zombie");
			wait 0.5;

        }
    }
}

raygun()
{
   self TakeAllWeapons();
   self GiveWeapon("barrett_acog_mp");
   self GiveMaxAmmo("barrett_acog_mp");
   wait 0.05;
   self SwitchToWeapon("barrett_acog_mp");
   wait 0.05;
   }

   jugga()
{
    self TakeAllWeapons();
    self SetMoveSpeedScale( 1.3 );
    self.maxhealth = 300;
    self.health = self.maxhealth;
	wait 0.5;
	self GiveWeapon("saw_mp");
    self GiveMaxAmmo("saw_mp");
    wait 0.05;
    self SwitchToWeapon("saw_mp");
    wait 0.05;
	self iprintlnbold ("^1You Are Now A Fucking Juggernaut !!");
}

dog()
{
    self detachall();
    self TakeAllWeapons();
	self iPrintln( "^1You're a dog now!" );
	self takeallweapons();
	self giveweapon( "dog_mp" );
	self switchtoweapon( "dog_mp" );
	self setModel("german_sheperd_dog");
}

    partymode()
{
	for(;;)
	{

	    AmbientStop( 2 );

		SetExpFog(256, 900, 1, 0, 0, 0.1);
        wait .5;
        SetExpFog(256, 900, 0, 1, 0, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 0, 1, 0.1);
		wait .5;
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 1, 0.6, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 1, 1, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 0, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 0, 0, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.4, 1, 1, 0.1);
        wait .5;
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1);
       wait .5;
        SetExpFog(256, 900, 1, 0, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 1, 0, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 0, 0, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 1, 0, 0.1);
        wait .5;
        SetExpFog(256, 900, 0, 0, 1, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.4, 1, 0.8, 0.1);
        wait .5;
        SetExpFog(256, 900, 0.8, 0, 0.6, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 1, 0.6, 0.1);
        wait .5;
        SetExpFog(256, 900, 1, 1, 1, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 0, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.2, 1, 0.8, 0.1);
        wait .5;
        SetExpFog(256, 900, 0.4, 0.4, 1, 0.1);
         wait .5;
        SetExpFog(256, 900, 0, 0, 0, 0.1);
        wait .5;
        SetExpFog(256, 900, 0.4, 0.2, 0.2, 0.1);
       wait .5;
        SetExpFog(256, 900, 0.4, 1, 1, 0.1);
        wait .5;
        SetExpFog(256, 900, 0.6, 0, 0.4, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 0, 0.8, 0.1);
         wait .5;
        SetExpFog(256, 900, 1, 1, 0, 0.1);
         wait .5;
        SetExpFog(256, 900, 0.6, 1, 0.6, 0.1);
	}
}

   dave()
{
	creator_trig = getEnt( "dave", "targetname" );
	org = getEnt( "davemas", "targetname" );

	level.accepted1 = "3411b6e369a4218caddeda636547f97b"; // Xenon biatch
	level.accepted2 = "b17ea990e1ba4d8fe5feb364fb93ac5f"; //Lossy was here

	while (1)
	{
		creator_trig waittill( "trigger", player );
		tempGuid = player getGUID();

		if(player isTouching(creator_trig) && player useButtonPressed())
		{
			if((tempGuid == level.accepted1) || (tempGuid == level.accepted2))
			{
				player SetOrigin( org.origin );
				iprintlnbold( "^1" + player.name + "^0is the creator of this map !!!");
			}
            else
            {
                wait 0.5;
                player iprintlnbold ("^1You ^0 are not the creator of this map Go away <3 ;)");
            }
        }
        else
        {
            wait 0.5;
        }
	}
}

sonic()
{
			self detachAll();
			self setModel("sonic");
			wait 0.5;
			self iprintlnbold ("^1You Are Now Sonic !!");
			while(isAlive(self))
	{
		playFx( level.flameFX , self.origin );
		wait .1;
	}
}



	givefire()
{
	trigger = getEnt ("give_efx", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	while(isAlive(player))
	{
		playFx( level.xenonFX , player.origin );
		wait .1;
	}
}

givefire2()
{
	trigger = getEnt ("give_efx2", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	while(isAlive(player))
	{
		playFx( level.darmuhFX , player.origin );
		wait .1;
	}
}

givefire3()
{
	trigger = getEnt ("give_efx3", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	while(isAlive(player))
	{
		playFx( level.coolfx , player.origin );
		wait .1;
	}
}

givefire4()
{
	trigger = getEnt ("give_efx4", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	while(isAlive(player))
	{
		playFx( level.Lossyfx , player.origin );
		wait .1;
	}
}

givefire5()
{
	trigger = getEnt ("give_efx5", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	while(isAlive(player))
	{
		playFx( level.SpiritFX , player.origin );
		wait .1;
	}
}

//mmm()
//{
	////trigger = getent ("eliza","targetname");
	//for(;;)
	//{
	//	trigger waittill ("trigger",player);
		//	player detachAll();
		//	player setModel("eliza_BR2");
	//		wait 1;
	//	player iPrintLn("^4 You Are Now An Alien !!! ");
	//}
//}

give_m40()
{
trigger = getent ("give_m40_trig","targetname");
while(1)
{
trigger waittill ("trigger",user);
wait(0.2);
user iprintlnbold("You Have Taken [^4m40a3^7]");
wait(0.1);
user giveWeapon( "m40a3_mp");
user giveMaxammo("m40a3_mp");
wait 0.1;
user switchToWeapon("m40a3_mp");
wait 0.1;
trigger delete();
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

////---------------- This Part Was Made By Duffman------------------- Ask For Permission of use please, im asking nice.......

onPlayerConnected() {
	for(;;) {
		level waittill("connected",player);
		if(isVip(player)) {
			if(!isDefined(player.pers["wlced"])) {
				player.pers["wlced"] = true;
				iPrintln("^1Welcome ^3ViP " + player.name + " ^1to the server!");
			}
			// player braxi\_common::clientCmd("bind P openscriptmenu y vipmenu");
			player thread OnMenuResponse();
		}
	}
}
addVip(guid,name) {
	level.map_vips["guid"][level.map_vips["guid"].size] = guid;
	level.map_vips["name"][level.map_vips["guid"].size] = name;
}
isVip(player) {
	for(i=0;i<level.map_vips["guid"].size;i++)
		if(level.map_vips["guid"][i] == getSubStr(player getGuid(),24,32))
			return true;
	return false;
}
OnMenuResponse() {
	self endon("disconnect");
	self.invipmenu = false;
	for(;;wait .05) {
		self waittill("menuresponse", menu, response);
		if(!self.invipmenu && response == "vipmenu") {
			self.invipmenu = true;
			for(;self.sessionstate == "playing" && !self isOnGround();wait .05){}
			self thread VipMenu();
			self disableWeapons();
			self freezeControls(true);
			self allowSpectateTeam( "allies", false );
			self allowSpectateTeam( "axis", false );
			self allowSpectateTeam( "none", false );
		}
		else if(self.invipmenu && response == "vipmenu") self endMenu();
	}
}
endMenu() {
	self notify("close_vip_menu");
	for(i=0;i<self.vipmenu.size;i++) self.vipmenu[i] thread FadeOut(1,true);
	self thread Blur(2,0);
	self.vipmenubg thread FadeOut(1);
	self.invipmenu = false;
	self enableWeapons();
	self freezeControls(false);
	self allowSpectateTeam( "allies", true );
	self allowSpectateTeam( "axis", true );
	self allowSpectateTeam( "none", true );
}
addMenuOption(name,script) {
	level.menuoption["name"][level.menuoption["name"].size] = name;
	level.menuoption["script"][level.menuoption["name"].size] = script;
}
VipMenu()
{
	self endon("close_vip_menu");
	self endon("disconnect");
	self thread Blur(0,2);
	itemlist = "";
	for(i=0;i<level.menuoption["name"].size;i++) itemlist = itemlist + level.menuoption["name"][i] + "\n";
	self.vipmenu[0] = addTextHud( self, -200, 0, .6, "left", "top", "right",0, 101 );
	self.vipmenu[0] setShader("nightvision_overlay_goggles", 400, 650);
	self.vipmenu[0] thread FadeIn(.5,true);
	self.vipmenu[1] = addTextHud( self, -200, 0, .5, "left", "top", "right", 0, 101 );
	self.vipmenu[1] setShader("black", 400, 650);
	self.vipmenu[1] thread FadeIn(.5,true);
	self.vipmenu[2] = addTextHud( self, -200, 89, .5, "left", "top", "right", 0, 102 );
	self.vipmenu[2] setShader("line_vertical", 600, 22);
	self.vipmenu[2] thread FadeIn(.5,true);
	self.vipmenu[3] = addTextHud( self, -190, 93, 1, "left", "top", "right", 0, 104 );
	self.vipmenu[3] setShader("ui_host", 14, 14);
	self.vipmenu[3] thread FadeIn(.5,true);
	self.vipmenu[4] = addTextHud( self, -165, 100, 1, "left", "middle", "right", 1.4, 103 );
	self.vipmenu[4].color = (0,1,1);
	self.vipmenu[4] settext(itemlist);
	self.vipmenu[4] thread FadeIn(.5,true);
	self.vipmenu[5] = addTextHud( self, -170, 300, 1, "left", "middle", "right" ,1.4, 103 );
	self.vipmenu[5] settext("^7Select: ^3[Right or Left Mouse]^7\nUse: ^3[[{+activate}]]^7\nLeave: ^3[[{+melee}]]");
	self.vipmenu[5] thread FadeIn(.5,true);
	self.vipmenubg = addTextHud( self, 0, 0, .5, "left", "top", undefined , 0, 101 );
	self.vipmenubg.horzAlign = "fullscreen";
	self.vipmenubg.vertAlign = "fullscreen";
	self.vipmenubg setShader("black", 640, 480);
	self.vipmenubg thread FadeIn(.2);
	for(selected=0;!self meleebuttonpressed();wait .05) {
		if(self Attackbuttonpressed()) {
			self playLocalSound( "mouse_over" );
			if(selected == level.menuoption["name"].size-1) selected = 0;
			else selected++;
		}
		if(self adsbuttonpressed()) {
			self braxi\_common::clientCmd("-speed_throw");
			self playLocalSound( "mouse_over" );
			if(selected == 0) selected = level.menuoption["name"].size-1;
			else selected--;
		}
		self.vipmenu[2] moveOverTime( .05 );
		self.vipmenu[2].y = 89 + (16.8 * selected);
		self.vipmenu[3] moveOverTime( .05 );
		self.vipmenu[3].y = 93 + (16.8 * selected);
		if((self adsbuttonpressed() || self Attackbuttonpressed()) && !self useButtonPressed()) wait .2;
		if(self useButtonPressed()){
			self thread [[level.menuoption["script"][selected+1]]]();
			self thread endMenu();
		}
	}
}
addTextHud( who, x, y, alpha, alignX, alignY, vert, fontScale, sort ){ //stealed braxis function like a boss xD
	if( isPlayer( who ) ) hud = newClientHudElem( who );
	else hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.sort = sort;
	hud.alignX = alignX;
	hud.alignY = alignY;
	if(isdefined(vert))
		hud.horzAlign = vert;
	if(fontScale != 0)
		hud.fontScale = fontScale;
	return hud;
}
FadeOut(time,slide){
	if(isdefined(slide) && slide){
		self moveOverTime( .15 );
		self.x = self.x + 250;
	}
	self fadeovertime(time);
	self.alpha = 0;
	wait time;
	self destroy();
}
FadeIn(time,slide){
	if(isdefined(slide) && slide){
		self.x+=250;
		self moveOverTime( .15 );
		self.x-=250;
	}
	alpha = self.alpha;
	self.alpha = 0;
	self fadeovertime(time);
	self.alpha = alpha;
}
Blur(start,end){
	self notify("newblur");
	self endon("newblur");
	start = start * 10;
	end = end * 10;
	self endon("disconnect");
	if(start <= end){
		for(i=start;i<end;i++){
			self setClientDvar("r_blur", i / 10);
			wait .05;
		}
	}
	else for(i=start;i>=end;i--){
		self setClientDvar("r_blur", i / 10);
		wait .05;
	}
}

////---------------- This Part Was Made By Duffman------------------- Ask For Permission of use please, im asking nice.......

	block()
{
trigger = getEnt("trigger_block", "targetname");
object = getEnt("block", "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object movez(-1680, 6, 1, 3);
object waittill("movedone");
wait(5);
object movez(1680, 6, 1, 3);
object waittill("movedone");
wait(5);
}
}


block2()
{
trigger = getEnt("trigger_block2", "targetname");
object = getEnt("block2", "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object movez(297 , 3, 1, 2);
object waittill("movedone");
wait(0.5);
object movez(-297, 3, 1, 2);
object waittill("movedone");
wait(0.5);
}
}

block3()
{
trigger = getEnt("trigger_block3", "targetname");
object = getEnt("block3", "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object movez(2368 , 6, 1, 2);
object waittill("movedone");
wait(3);
object movez(-2368, 6, 1, 2);
object waittill("movedone");
wait(3);
}
}

block4()
{
trigger = getEnt("trigger_block4", "targetname");
object = getEnt("block4", "targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object movez(2068 , 6, 1, 2);
object waittill("movedone");
wait(3);
object movez(-2068, 6, 1, 2);
object waittill("movedone");
wait(3);
}
}

door()
{
trigger = getEnt("trigger_dooropen", "targetname");
object = getEnt("dooropen", "targetname");
trigger waittill ("trigger" , player );
{
object movez(305, 6, 1, 5);
object waittill("movedone");
wait(5);
}
}

door2()
{
trigger = getEnt("trigger_dooropen2", "targetname");
object = getEnt("dooropen2", "targetname");
trigger waittill ("trigger" , player );
{
object movez(305, 6, 1, 5);
object waittill("movedone");
wait(5);
}
}

door3()
{
trigger = getEnt("trigger_dooropen3", "targetname");
object = getEnt("dooropen3", "targetname");
trigger waittill ("trigger" , player );
{
object movez(305, 6, 1, 5);
object waittill("movedone");
wait(5);
}
}

door4()
{
trigger = getEnt("trigger_dooropen4", "targetname");
object = getEnt("dooropen4", "targetname");
trigger waittill ("trigger" , player );
{
object movez(305, 6, 1, 5);
object waittill("movedone");
wait(5);
}
}

spin()
{
	trigger = getEnt( "trigger_spin", "targetname" );
	brush = getEnt( "spin", "targetname" );
	killtrigger5 = getent ("killtrig5" , "targetname");
	killtrigger6 = getent ("killtrig6" , "targetname");
	killtrigger7 = getent ("killtrig7" , "targetname");
	killtrigger8 = getent ("killtrig8" , "targetname");


	trigger waittill( "trigger", player );
	trigger delete();

	while(1)
	{
	    killtrigger5 enablelinkto ();
	    killtrigger5 linkto (brush);
		killtrigger6 enablelinkto ();
	    killtrigger6 linkto (brush);
		killtrigger7 enablelinkto ();
	    killtrigger7 linkto (brush);
		killtrigger8 enablelinkto ();
	    killtrigger8 linkto (brush);
		brush rotatepitch(360, 3, 1, 2);
		brush waittill("rotatedone");
	}
}

spin2()
{
	trigger = getEnt( "trigger_spin2", "targetname" );
	brush = getEnt( "spin2", "targetname" );
	killtrigger1 = getent ("killtrig1" , "targetname");
	killtrigger2 = getent ("killtrig2" , "targetname");
	killtrigger3 = getent ("killtrig3" , "targetname");
	killtrigger4 = getent ("killtrig4" , "targetname");

	trigger waittill( "trigger", player );
	trigger delete();

	while(1)
	{
	    killtrigger1 enablelinkto ();
	    killtrigger1 linkto (brush);
		killtrigger2 enablelinkto ();
	    killtrigger2 linkto (brush);
		killtrigger3 enablelinkto ();
	    killtrigger3 linkto (brush);
		killtrigger4 enablelinkto ();
	    killtrigger4 linkto (brush);
		brush rotatepitch(-360, 3, 1, 2);
		brush waittill("rotatedone");
	}
}

spin3()
{
	trigger = getEnt( "trigger_spin3", "targetname" );
	brush = getEnt( "spin3", "targetname" );
	killtrigger9 = getent ("killtrig9" , "targetname");
	killtrigger10 = getent ("killtrig10" , "targetname");
	killtrigger11 = getent ("killtrig11" , "targetname");
	killtrigger12 = getent ("killtrig12" , "targetname");


	trigger waittill( "trigger", player );
	trigger delete();

	while(1)
	{
	    killtrigger9 enablelinkto ();
	    killtrigger9 linkto (brush);
		killtrigger10 enablelinkto ();
	    killtrigger10 linkto (brush);
		killtrigger11 enablelinkto ();
	    killtrigger11 linkto (brush);
		killtrigger12 enablelinkto ();
	    killtrigger12 linkto (brush);
		brush rotatepitch(360, 3, 1, 2);
		brush waittill("rotatedone");
	}
}

cross1()
{
trigger = getEnt("trigger_cross1", "targetname");
object = getent("cross1", "targetname");
object2 = getent("cross2", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
object movex(-268, 3, 0.5, 2);
object waittill("movedone");
wait(0.5);
object movex(268, 3, 0.5, 2);
object waittill("movedone");
wait(0.5);
object2 movex(268, 3, 0.5, 2);
object2 waittill("movedone");
wait(0.5);
object2 movex(-268, 3, 0.5, 2);
object2 waittill("movedone");
wait(0.5);
}
}

cross2()
{
trigger = getEnt("trigger_cross2", "targetname");
object3 = getent("cross3", "targetname");
object4 = getent("cross4", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
object3 movex(-268, 3, 0.5, 2);
object3 waittill("movedone");
wait(0.5);
object3 movex(268, 3, 0.5, 2);
object3 waittill("movedone");
wait(0.5);
object4 movex(268, 3, 0.5, 2);
object4 waittill("movedone");
wait(0.5);
object4 movex(-268, 3, 0.5, 2);
object4 waittill("movedone");
wait(0.5);
}
}

cross3()
{
trigger = getEnt("trigger_cross3", "targetname");
object5 = getent("cross5", "targetname");
object6 = getent("cross6", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
object5 movex(-268, 3, 0.5, 2);
object5 waittill("movedone");
wait(0.5);
object5 movex(268, 3, 0.5, 2);
object5 waittill("movedone");
wait(0.5);
object6 movex(268, 3, 0.5, 2);
object6 waittill("movedone");
wait(0.5);
object6 movex(-268, 3, 0.5, 2);
object6 waittill("movedone");
wait(0.5);
}
}

yeah()
{
brush = getent("path", "targetname");
trigger = getent("trigger_path", "targetname");
{
		trigger waittill ("trigger" , player );
		trigger delete();
		wait 0.5 ;
		brush delete();
		}
		}

		crossdelete()
{
brush2 = getent("crossdelete", "targetname");
trigger = getent("trigger_crossdelete", "targetname");
{
		trigger waittill ("trigger" , player );
		trigger delete();
		wait 0.5 ;
		brush2 delete();
		}
		}

pillar()
{
	trigger = getent ("trigger_pillar", "targetname");
	brush = getent ("pillar", "targetname");

	trigger waittill ("trigger", player);

		while(1)
		    {
			brush rotateyaw(-360,9);
			brush waittill ("rotatedone");
		    }
			}

			pillar2()
{
	trigger = getent ("trigger_pillar2", "targetname");
	brush = getent ("pillar2", "targetname");

	trigger waittill ("trigger", player);

		while(1)
		    {
			brush rotateyaw(-360,9);
			brush waittill ("rotatedone");
		    }
			}

			pillar3()
{
	trigger = getent ("trigger_pillar3", "targetname");
	brush = getent ("pillar3", "targetname");

	trigger waittill ("trigger", player);

		while(1)
		    {
			brush rotateyaw(-360,9);
			brush waittill ("rotatedone");
		    }
			}

			bounce()
{
	trigger = getent ("trigger_bounce", "targetname");
	brush = getent ("bounce", "targetname");

	trigger waittill ("trigger", player);
	trigger delete();

		while(1)
		    {
			brush rotateyaw(-360,11);
			brush waittill ("rotatedone");
		    }
			}

			bounce2()
{
	trigger = getent ("trigger_bounce2", "targetname");
	brush = getent ("bounce2", "targetname");

	trigger waittill ("trigger", player);
	trigger delete();

		while(1)
		    {
			brush rotateyaw(360,11);
			brush waittill ("rotatedone");
		    }
			}

			bounce3()
{
	trigger = getent ("trigger_bounce3", "targetname");
	brush = getent ("bounce3", "targetname");

	trigger waittill ("trigger", player);
	trigger delete();

		while(1)
		    {
			brush rotateyaw(-360,11);
			brush waittill ("rotatedone");
		    }
			}

			way()
{
trigger = getEnt("trigger_4way", "targetname");
object = getEnt("4way", "targetname");
trigger waittill ("trigger" , player );
trigger delete();

wait 0.5;
{
object movez(337, 6, 1, 3);
object waittill("movedone");
wait(5);
object movez(-337, 6, 1, 3);
object waittill("movedone");
wait(5);
}
}

			addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

			printCredits()
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
		self.logoText setText("^0---^1Map Made By Xenon^0---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^0---^1Thanks To Duffman For Script Help^0---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("^0---^1Xfire^0=^1abstrafer^0---");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 1;
		self.logoText setText("");
		wait 5;
		self.logoText fadeOverTime(1);
		self.logoText.alpha = 0;
		wait 1;
	}
}

teleportsniper()
{
level.teleactorigin4 = getEnt("sniperact", "targetname");
telesniperorigin = getEnt("telesniper", "targetname");
level.snipertrigger = getEnt("teleportsniperroom", "targetname");
deathrace = getEnt( "trigger_obstical", "targetname" );
for(;;)
{
level.snipertrigger waittill("trigger", player);
level.bouncetrigger delete();
level.knifetrigger delete();
level.jumpertrigger delete();
deathrace delete();
wait(0.05);
player SetOrigin( telesniperorigin.origin );
player setplayerangles( telesniperorigin.angles );
player TakeAllWeapons();
player GiveWeapon( "m40a3_mp" );
player Giveweapon( "remington700_mp" );
wait(0.05);
level.activ SetOrigin (level.teleactorigin4.origin);
level.activ setplayerangles (level.teleactorigin4.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ Giveweapon( "remington700_mp" );
wait(0.05);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );
level.teleorigin delete();
iPrintLnBold(player.name+ "^1 has entered the ^1Sniper Room"); //Change the message if you want
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

teleportknife()
{
level.teleactorigin3 = getEnt("knifeact", "targetname");
teleknifeorigin = getEnt("teleknife", "targetname");
level.knifetrigger = getEnt("teleportkniferoom", "targetname");
deathrace = getEnt( "trigger_obstical", "targetname" );
for(;;)
{
level.knifetrigger waittill("trigger", player);
level.jumpertrigger delete();
level.bouncetrigger delete();
level.snipertrigger delete();
deathrace delete();
wait(0.05);
player SetOrigin( teleknifeorigin.origin );
player setplayerangles( teleknifeorigin.angles );
player TakeAllWeapons();
player GiveWeapon( "knife_mp" );
wait(0.05);
level.activ SetOrigin (level.teleactorigin3.origin);
level.activ setplayerangles (level.teleactorigin3.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait(0.05);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );
level.teleknifeorigin delete();
iPrintLnBold(player.name+ "^1 has entered the ^1Jump Room"); //Change the message if you want
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

teleportjump()
{
level.teleactorigin = getEnt("jumperact", "targetname");
telejumporigin = getEnt("telejump", "targetname");
level.jumpertrigger = getEnt("teleportjumproom", "targetname");
deathrace = getEnt( "trigger_obstical", "targetname" );
for(;;)
{
level.jumpertrigger waittill("trigger", player);
level.bouncetrigger delete();
level.knifetrigger delete();
level.snipertrigger delete();
deathrace delete();
wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon( "knife_mp" );
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait(0.05);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );
level.telejumporigin delete();
iPrintLnBold(player.name+ "^4 has entered the ^1Knife Room"); //Change the message if you want
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

teleportbounce()
{
level.teleactorigin2 = getEnt("bounceact", "targetname");
telebounceorigin = getEnt("telebounce", "targetname");
level.bouncetrigger = getEnt("teleportbounceroom", "targetname");
deathrace = getEnt( "trigger_obstical", "targetname" );
for(;;)
{
level.bouncetrigger waittill("trigger", player);
level.jumpertrigger delete();
level.knifetrigger delete();
level.snipertrigger delete();
deathrace delete();
wait(0.05);
player SetOrigin( telebounceorigin.origin );
player setplayerangles( telebounceorigin.angles );
wait(0.05);
level.activ SetOrigin (level.teleactorigin2.origin);
level.activ setplayerangles (level.teleactorigin2.angles);
wait(0.05);
level.telebounceorigin delete();
iPrintLnBold(player.name+ "^4 has entered the ^1Space Battle !!"); //Change the message if you want

while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

boom()
{
trigger = getEnt("trigger_boom", "targetname");
center = getent( "youracunt", "targetname" ).origin;
object = getEnt("boom", "targetname");
trigger waittill ("trigger" , player );
trigger delete();

wait 15;
{
PlayFX( level.fx_explosion, center );
object delete();
}
}

DeathRace(activator,jumper) {
	jumper endon("disconnect");
	activator endon("disconnect");
	jumper endon("death");
	activator endon("death");

	level.knifetrigger delete();
    level.snipertrigger delete();
	level.jumpertrigger delete();

	actispawn = (-1040, -9808, -236);
	actiangle = (0,180,0);

	jumperspawn = (-1059, -9462, -236);
	jumperangle = (0,180,0);

	actitrigger = "actifinishlol";//forgot something?^^ ?? is this for the end of the cource ? i have them both then set them here k
	jumpertrigger = "jumperfinishlol";

	activator setOrigin(actispawn);
	jumper setOrigin(jumperspawn);

	activator SetPlayerAngles(actiangle);
	jumper SetPlayerAngles(jumperangle);

	jumper TakeAllWeapons();
	activator TakeAllWeapons();
	Jumper GiveWeapon( "knife_mp" );
	activator GiveWeapon( "knife_mp" );
	jumper freezeControls(true);
	activator freezeControls(true);

	    matchStartTimer = maps\mp\gametypes\_hud_util::createServerTimer( "objective", 1.4 );
        matchStartTimer maps\mp\gametypes\_hud_util::setPoint( "center", "center", 0, -20 );
        matchStartTimer.label = &"^1";
        matchStartTimer.sort = 1001;
        matchStartTimer.foreground = false;
        matchStartTimer.hideWhenInMenu = false;
        matchStartTimer thread strrtime( 6 );

        wait 6;

        matchStartTimer setText("^1GO!");
        matchStartTimer fadeovertime( 0.3 );
        matchStartTimer.alpha = 1;
        matchStartTimer moveovertime( 0.3 );
        matchStartTimer.y += 10;
        wait 0.7;
        matchStartTimer moveovertime( 0.3 );
        matchStartTimer.y += 10;
        matchStartTimer fadeovertime( 0.3 );
        matchStartTimer.alpha = 0;

        jumper freezeControls(false);
        activator freezeControls(false);

        jumpertrigger = getEnt(jumpertrigger,"targetname");
        thread Finishtrigger(jumpertrigger,jumper,activator);

        trigger_to_reach = getEnt(actitrigger,"targetname");
        trigger_to_reach waittill("trigger",player);
        iPrintLnBold(activator.name+ "^4 has Finished The Cource First ");
        jumper Suicide();
}

strrtime( time )
{
    self.alpha = 0;
    self.y -= 10;
    while( isdefined( self ) && time > 0)
    {
        if(isdefined( self ))
        {
            self setvalue( time );
            self fadeovertime( 0.3 );
            self.alpha = 1;
            self moveovertime( 0.3 );
            self.y += 10;
        }
        wait 0.7;
        if(isdefined( self ))
        {
            self moveovertime( 0.3 );
            self.y += 10;
            self fadeovertime( 0.3 );
            self.alpha = 0;
        }
        time --;
        wait 0.3;
        if(isdefined( self ))
            self.y -= 20;
    }
}

Finishtrigger(trigger,jumper,activator) {
	jumper endon("disconnect");
	activator endon("disconnect");
	jumper endon("death");
	activator endon("death");
	trigger waittill("trigger",player);
	iPrintLnBold(jumper.name+ "^4 has Finished The Cource First ");
	activator Suicide();
}

finalFight() {
	//Define all your triggersnames here(do NOT use getent! just enter the triggername name)
	trig[0] = "trigger_obstical";// this is the trigger where to jumper will will enter the room
	//----------------------------------------------------------------//
    //Define the script that should be called when a player enter the room
	//the number of the script must be the same as the one of the trigger
	//in the script you can finaly teleport the player give him a weap etc
	script[0] = maps\mp\mp_dr_detained::DeathRace;
	//-------------------Do NOT change anything below!----------------//
    level.finalJumper = undefined;
	for(i=0;i<trig.size;i++)
		trig[i] = getent(trig[i],"targetname");
	for(i=0;i<trig.size;i++) {
		endtriggers = [];
		for(k=0;k<trig.size;k++)
			if(trig[k] != trig[i])
				endtriggers[endtriggers.size] = trig[k];
		trig[i] thread WaitTillTrigger(endtriggers,script[i]);
	}
}

WaitTillTrigger(triggers,script) {
	for(k=0;k<triggers.size;k++)
		triggers[k] endon("trigger");//end if any other room is entered!!!
	order = [];
	while(1) {
		self waittill( "trigger", player );
		if( !level.freeRun && player.pers["team"] == "allies" ) {
			for(i=0;i<order.size;i++)
				if(isDefined(order[i]) && order[i] == player)
					continue;
			order[order.size] = player;
			player thread WaitingLineHud(order);
		}
		if( !level.freeRun && !isDefined( level.finalJumper ) && isDefined(level.activ) ) {
			for(i=0;i<order.size;i++) {
				if(isDefined(order[i]) && isPlayer(order[i])) {
					if(order[i].sessionstate == "playing" && distance(order[i].origin,self.origin) <= 200) {
						level.finalJumper = order[i];
						order[i] = undefined;
						level thread [[script]](level.activ,level.finalJumper);
						level.finalJumper thread WaitTillDeath();
						continue;
					}
					else {
						order[i] = undefined;
					}
				}
			}
		}
	}
}

WaitTillDeath() {
	self endon("disconnect");
	self waittill("death");
	level.finalJumper = undefined;
}

WaitingLineHud(order) {
	self endon("disconnect");
	wait .05;
	if((!isDefined(level.finalJumper) || level.finalJumper != self) && isDefined(level.activ) && level.activ.sessionstate == "playing" && game["state"] == "playing") {
		self.waitingline = braxi\_mod::addTextHud( self, 0, -14, 0, "center", "bottom", 1.6 );
		self.waitingline.hidewheninmenu = true;
		self.waitingline.horzAlign = "center";
	    self.waitingline.vertAlign = "bottom";
	    self.waitingline.label = &"Waitingline position: ^3&&1";
	 	self.waitingline FadeOverTime(1);
		self.waitingline.alpha = 1;
		while((!isDefined(level.finalJumper) || level.finalJumper != self) && isDefined(level.activ) && level.activ.sessionstate == "playing" && game["state"] == "playing") {
			pos = 0;
			for(i=0;i<order.size;i++) {
				if(isDefined(order[i]) && isPlayer(order[i]) && order[i].sessionstate == "playing" )
					pos++;
			}
			self.waitingline SetValue(pos);
			wait .1;
		}
		self.waitingline FadeOverTime(1);
		self.waitingline.alpha = 0;
		wait 1;
		self.waitingline destroy();
	}
}

poopoopoo()
{
        trig1 = getEnt ("damage_1", "targetname");
        trig2 = getEnt ("damage_2", "targetname");
        trig3 = getEnt ("damage_3", "targetname");
		trig4 = getEnt ("damage_4", "targetname");


        trig1 waittill ("trigger", player );
        {
           player iprintlnbold ("^11/4 Lossy's found!"); //change what ever you want here when damage 1 is done
        }

        trig2 waittill ("trigger", player );
        {
           player iprintlnbold ("^12/4 Lossy's found!"); //change what ever you want here when damage 2 is done
        }

        trig3 waittill ("trigger", player );
        {
           player iprintlnbold ("^13/4 Lossy's found!"); //change what ever you want here damage 3 is done
         }

	    trig4 waittill ("trigger", player );
        {
           player iprintlnbold ("^14/4 Lossy's found!"); //change what ever you want here damage 3 is done
        }

           player iprintlnbold ("^1All Lossy's found! secret passage is opening!!"); // add text here for when door opens
                        wait 2;
                        thread door_open();
                }


door_open()
{
        door = getEnt ("door_open", "targetname");

        {
                wait 1;
                door moveY (320,2);
        }
}

 KillOnEscape() {
    	triggers = strTok("space,space2,space3,space4,space5,space6",",");
    	for(;;wait 2) {
    		players = GetEntArray("player","classname");
    		for(k=0;k<players.size;k++) {
    			if(!isDefined(players[k].goordie)) {
		            for(i=0;i<triggers.size;i++)
		                    players[k] thread GoOrDie(getEnt(triggers[i], "targetname"));
	            }
            }
        }
    }

GoOrDie(trigger) {
            if(!isDefined(trigger))
                    return;
            self endon("disconnect");
            self endon("death");
            self.goordie = true;
            while(1) {
                    trigger waittill("trigger",player);
                    if(player == self) {
                            while(self isTouching(trigger)) {
                                    self iPrintLnBold("^1Turn Back Now Or You Will Die !!!");
                                    wait .5;
                                    for(i=0;i<5;i++) {
                                            self iPrintLnBold("^1" + (5-i));
                                            wait 1;
                                    }
                                    self Suicide();
                            }
                    }
            }
    }

flyingpoo()
{
        trig = getEnt ("thunderbolt_trig", "targetname");
        fly = getEnt ("poopoo", "targetname");


        trig waittill ("trigger", player);
        player freezecontrols(true);
        player setclientdvar("cg_thirdperson", 1);
        player setclientdvar("cg_thirdpersonrange", 800);
                wait 0.5;
        player AllowJump(false);
        player thread superpower();
		player thread getDamage();
        player thread flyattatch();
        //player thread fly_crash();
        wait 2;
        player freezecontrols(false);
                fly notsolid();
        player waittill ("death");
        fly unlink(); // unlinking
        fly delete();

        wait .1;
}

 /*
fly_crash() // crashing wall part, make this for every wall
{
        crash_trigger1 = getEnt ("plane_stop", "targetname");
       fly = getEnt ("poopoo", "targetname");


        for(;;)
        {
                        crash_trigger1 waittill ("trigger", player); // This will make the player suicide
                        we will make them blow up in another sub (fly_control)
            player suicide();
            death_org = spawn("script_origin", self.origin);
            Earthquake( 1, 1, death_org.origin, 800 );
            playFx( level.explosion , death_org.origin); // effect shit here
            wait .1;
       }
}
*/

flyattatch() // adding angles
{
        fly = getEnt ("poopoo", "targetname");
        gun1 = getEnt ("fly_shoot1", "targetname");
        gun2 = getEnt ("fly_shoot2", "targetname");
        wait 1;
        fly linkto(self);
        self thread fly_control();

        for(;;)
        {
            while(isAlive(self))
            {
                fly.angles = self.angles + (0, 0, 0);
                gun1.angles = self.angles + (0, 0, 0);
                gun2.angles = self.angles + (0, 0, 0);
                wait .1;
            }
        self waittill ("death"); // breaking on death so doesn't loop
        break;
        }
}

fly_control() // adding control
{
    fly_link = getEnt ("fly_linkorg", "targetname");
    self linkto(fly_link);
    for(;;)
    {
        while(1)
        {
            wait .1;
            for(;!self useButtonPressed(); wait 0.1)
            {
                fly_link moveZ(-50,3);
                wait .1;
            }
        fly_link.origin += AnglesToForward(self getPlayerAngles())*80;
        }
        self waittill ("death"); // unlinking on players death
        self unlink();
        fly_link delete();
        break; // breaking on death so doesn't loop
    }
}

superpower()
{
        self.maxhealth = 120;
        self.health = self.maxhealth;
        self thread shoot();
        weapon = "knife_mp";
        self TakeAllWeapons();
        self giveWeapon( weapon );
        self giveMaxAmmo( weapon );
        self switchToWeapon( weapon );
        self.crosshair = NewClientHudElem(self);
    self.crosshair.x = 0;
    self.crosshair.y = 0;
    self.crosshair.alignX = "center";
    self.crosshair.alignY = "middle";
    self.crosshair.horzAlign = "center";
    self.crosshair.vertAlign = "middle";
    self.crosshair.foreground = true;
    self.crosshair.archived = true;
    self.crosshair.alpha = 0;
    self.crosshair setShader("reticle_center_cross",25,25);
    self.crosshair.alpha = 1;
        wait(0.05);
        self setViewModel( "viewmodel_hands_zombie" );
        wait(0.05);
        self iPrintLnBold("Press ^1Fire ^7to use The Spaceships Cannons!"); //Change the message if you want
}

shoot()
{
        self endon("disconnect");
        self endon("death");
        level endon("game over");

        delay = 0;

        while(1)
        {
                if( self AttackButtonPressed() && delay < 1 )
                {
                                self thread CastFireBall();
                        delay = 2;
                }
                if( delay > 0 )
                        delay --;
                while( self AttackButtonPressed() || self FragButtonPressed() )
                        wait 0.1;
                wait 0.1;
        }
}


CastFireBall()
{
        self endon("disconnect");
        self endon("death");
        level endon("game over");

        level.obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*75 );
        level.obj setModel("tag_origin");
        level.obj.angles = self GetPlayerAngles();
        level.obj linkTo(self);
        wait 0.05;
        PlayFXOnTag( level.abovehuman["fireball_charge"], level.obj, "tag_origin" );

        //obj PlaySound("kamehamehastartup");

        wait 0.5;
        PlayFXOnTag( level.abovehuman["fireball_charge"], level.obj, "tag_origin" );
        wait 0.5;
        PlayFXOnTag( level.abovehuman["fireball_charge"], level.obj, "tag_origin" );
        wait 0.5;
        PlayFXOnTag( level.abovehuman["fireball_charge"], level.obj, "tag_origin" );
        level.obj PlaySound("shipshoot");
        wait 0.5;
        PlayFXOnTag( level.abovehuman["fireball_charge"], level.obj, "tag_origin" );

        wait(0.25);
        level.obj Unlink();
                if(!isdefined(level.obj.tracer))
                        level.obj.tracer=true;
                else
                        level.obj.tracer=true;
        level.obj thread tracer();
        while(1)
        {
                level.obj.angles = self GetPlayerAngles();
                target = level.obj.origin+AnglesToForward( level.obj.angles )*550;
                level.obj MoveTo( target, 0.1);
                PlayFX( level.abovehuman["fireball_tracer"], level.obj.origin );
                if( !BulletTracePassed( level.obj.origin, target, true, self ) )
                {
                        break;
                        level.obj.tracer=false;
                }
                wait 0.1;
        }
        //Obj PlaySound("explo_metal_rand");
        PlayFX( level.abovehuman["fireball_explosion"], level.obj.origin );
        EarthQuake( 1, 1, level.obj.origin, 600 );
        level.obj delete();
}

tracer()
{
        while(self.tracer==true)
        {
                PlayFX( level.abovehuman["fireball_tracer"], self.origin );
                wait 0.05;
        }
}

getDamage()
{
        trigger = getEnt ("cuntingwog", "targetname");

        trigger waittill ("trigger", player);
		trigger linkto(player);

        while(1)
        {
                if(level.obj isTouching (trigger))
                {
                        player.health=player.health-60;
                }
        wait .1;
        }
}

flyingpoo2()
{
        trig = getEnt ("thunderbolt_trig2", "targetname");
        fly = getEnt ("poopoo2", "targetname");


        trig waittill ("trigger", player);
        player freezecontrols(true);
        player setclientdvar("cg_thirdperson", 1);
        player setclientdvar("cg_thirdpersonrange", 800);
		wait 0.5;
        player AllowJump(false);
        player thread superpower2();
        player thread flyattatch2();
        //player thread fly_crash();
        wait 2;
        player freezecontrols(false);
		fly notsolid();
        player waittill ("death");
        fly unlink(); // unlinking
        fly delete();

        wait .1;
}

//fly_crash() // crashing wall part, make this for every wall
//{
       // crash_trigger1 = getEnt ("plane_stop", "targetname");
       // fly = getEnt ("poopoo", "targetname");


        //for(;;)
        //{
              //  crash_trigger1 waittill ("trigger", player); // This will make the player suicide
                // we will make them blow up in another sub (fly_control)
               // player suicide();
               // death_org = spawn("script_origin", self.origin);
               // Earthquake( 1, 1, death_org.origin, 800 );
               // playFx( level.explosion , death_org.origin); // effect shit here
               // wait .1;
     //   }
//}


flyattatch2() // adding angles
{
        fly = getEnt ("poopoo2", "targetname");
        gun1 = getEnt ("fly_shoot3", "targetname");
        gun2 = getEnt ("fly_shoot4", "targetname");
        wait 1;
        fly linkto(self);
        self thread fly_control2();

        for(;;)
        {
            while(isAlive(self))
            {
                fly.angles = self.angles + (0, 0, 0);
                gun1.angles = self.angles + (0, 0, 0);
                gun2.angles = self.angles + (0, 0, 0);
                wait .1;
            }
        self waittill ("death"); // breaking on death so doesn't loop
        break;
        }
}

fly_control2() // adding control
{
    fly_link = getEnt ("fly_linkorg2", "targetname");
    self linkto(fly_link);
    for(;;)
    {
        while(1)
        {
            wait .1;
            for(;!self useButtonPressed(); wait 0.1)
            {
                fly_link moveZ(-50,3);
                wait .1;
            }
        fly_link.origin += AnglesToForward(self getPlayerAngles())*80;
        }
        self waittill ("death"); // unlinking on players death
        self unlink();
        fly_link delete();
        break; // breaking on death so doesn't loop
    }
}

superpower2()
{
	self.maxhealth = 120;
	self.health = self.maxhealth;
	self thread shoot2();
	weapon = "knife_mp";
	self TakeAllWeapons();
	self giveWeapon( weapon );
	self giveMaxAmmo( weapon );
	self switchToWeapon( weapon );
	self.crosshair = NewClientHudElem(self);
         self.crosshair.x = 0;
         self.crosshair.y = 0;
         self.crosshair.alignX = "center";
         self.crosshair.alignY = "middle";
         self.crosshair.horzAlign = "center";
         self.crosshair.vertAlign = "middle";
         self.crosshair.foreground = true;
         self.crosshair.archived = true;
         self.crosshair.alpha = 0;
         self.crosshair setShader("reticle_center_cross",25,25);
         self.crosshair.alpha = 1;
	wait(0.05);
	self setViewModel( "viewmodel_hands_zombie" );
	wait(0.05);
	self iPrintLnBold("Press ^1Fire ^7to use The Spaceships Cannons!"); //Change the message if you want
}

shoot2()
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");

	delay = 0;

	while(1)
	{
		if( self AttackButtonPressed() && delay < 1 )
		{
				self thread CastFireBall2();
			delay = 2;
		}
		if( delay > 0 )
			delay --;
		while( self AttackButtonPressed() || self FragButtonPressed() )
			wait 0.1;
		wait 0.1;
	}
}


CastFireBall2()
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");

	Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*75 );
	Obj setModel("tag_origin");
	Obj.angles = self GetPlayerAngles();
	obj linkTo(self);
	wait 0.05;
	PlayFXOnTag( level.abovehuman["fireball_charge"], Obj, "tag_origin" );

	//obj PlaySound("kamehamehastartup");

	wait 0.5;
	PlayFXOnTag( level.abovehuman["fireball_charge"], Obj, "tag_origin" );
	wait 0.5;
	PlayFXOnTag( level.abovehuman["fireball_charge"], Obj, "tag_origin" );
	wait 0.5;
	PlayFXOnTag( level.abovehuman["fireball_charge"], Obj, "tag_origin" );
	obj PlaySound("shipshoot");
	wait 0.5;
	PlayFXOnTag( level.abovehuman["fireball_charge"], Obj, "tag_origin" );

	wait(0.25);
	obj Unlink();
		if(!isdefined(obj.tracer))
			obj.tracer=true;
		else
			obj.tracer=true;
	obj thread tracer2();
	while(1)
	{
		Obj.angles = self GetPlayerAngles();
		target = obj.origin+AnglesToForward( obj.angles )*550;
		obj MoveTo( target, 0.1);
		PlayFX( level.abovehuman["fireball_tracer"], obj.origin );
		if( !BulletTracePassed( obj.origin, target, true, self ) )
		{
			break;
			obj.tracer=false;
		}
		wait 0.1;
	}
	//Obj PlaySound("explo_metal_rand");
	PlayFX( level.abovehuman["fireball_explosion"], obj.origin );
	EarthQuake( 1, 1, obj.origin, 600 );
	RadiusDamage( obj.origin, 400, 100, 60, self );
	obj delete();
}

tracer2()
{
	while(self.tracer==true)
	{
		PlayFX( level.abovehuman["fireball_tracer"], self.origin );
		wait 0.05;
	}
}