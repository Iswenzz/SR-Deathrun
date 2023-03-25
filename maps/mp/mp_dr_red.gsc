/*
   ___________   _  __
  / __/ __/ _ | / |/ /
 _\ \/ _// __ |/    / 
/___/___/_/ |_/_/|_/  
                     
Map by Sean
Scripting by Glenbob
*/

main(){
	maps\mp\_load::main();
	
	//Teams
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	//Dvars//
	setdvar("r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 3000000 );
	setDvar("bg_falldamageminheight", 1280000 );
	setDvar("r_fullbright", "1");

	//Weapon precache//
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("knife_mp");

	preCacheItem("mp5_silencer_mp");
	preCacheItem("rpg_mp");
	preCacheItem("m60e4_mp");
	preCacheItem("m1014_mp");
	preCacheItem("deserteaglegold_mp");

	//Rooms//
	thread EndRooms();
	thread SniperRoom();
	thread KnifeRoom();
	thread messages();
	thread WeaponRoom();
	thread PureStrafeRoomSetup();
	thread BounceRoomSetup();

	//Secret//
	thread secret_finish();
	thread HiddenBounce();
	
	hidden_bounce = getEnt("brush_hiddenbounce", "targetname");
	hidden_bounce notSolid();

	//Traps//
	thread TriggerList();
	level.trapHintString = "^1 >> Press ^7&&1 ^1to activate^7!";
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();

	//Misc//
	thread startdoor();
	thread MoveArrows();
	thread MoveName();
	thread MoveLetters();
	thread SetupCollectables();

	//Music//
	thread MusicBox();

	if(!isdefined(level.music)){
		level.music=[];
		level.music[0]["song"]    ="Pete & Bas - Dents in a Peugeot";
		level.music[0]["alias"]    ="song1";
		level.music[1]["song"]    ="Dirt Nasty - Choke";
		level.music[1]["alias"]    ="song2";
		level.music[2]["song"]    ="Jimothy Lacoste - Finna glow";
		level.music[2]["alias"]    ="song3";
		level.music[3]["song"]    ="Ram ranch - Grant MacDonald";
		level.music[3]["alias"]    ="song4";
	}
}

//Traps--------------
addTriggerToList(name){
    if(!isDefined(level.trapTriggers)) level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
}

TriggerList(){
	for(i=1;i<=10;i++) addTriggerToList("trig_trap" + i); 
}

trap1(){
	button = getent("trig_trap1", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap1_brush1", "targetname");
	brush2 = getEnt("trap1_brush2", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotatePitch(360, 1);
		wait 0.5;
		brush2 rotatePitch(360, 1);
		wait 5;
	}
}

trap2(){
	button = getent("trig_trap2", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap2_brush1", "targetname");
	brush2 = getEnt("trap2_brush2", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotatePitch(360, 1);
		wait 0.5;
		brush2 rotatePitch(360, 1);
		wait 5;
	}
}

trap3(){
	button = getent("trig_trap3", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap3_brush1", "targetname");
	brush2 = getEnt("trap3_brush2", "targetname");
	brush3 = getEnt("trap3_brush3", "targetname");
	brush4 = getEnt("trap3_brush4", "targetname");
	brush5 = getEnt("trap3_brush5", "targetname");
	brush6 = getEnt("trap3_brush6", "targetname");
	bounce = getEnt("trap3_bounce", "targetname");
	
	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotateRoll(360, 1);
		wait 0.5;
		brush2 rotateRoll(360, 1);
		wait 0.5;
		brush3 rotateRoll(360, 1);
		bounce rotateYaw(360, 3);
		wait 0.5;
		brush4 rotateRoll(360, 1);
		wait 0.5;
		brush5 rotateRoll(360, 1);
		wait 0.5;
		brush6 rotateRoll(360, 1);
		wait 5;
	}
}

trap4(){
	button = getent("trig_trap4", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap4_brush1", "targetname");
	brush2 = getEnt("trap4_brush2", "targetname");
	
	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotateRoll(360, 1);
		wait 0.5;
		brush2 rotateRoll(360, 1);
		wait 5;
	}
}

trap5(){
	button = getent("trig_trap5", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap5_brush1", "targetname");
	brush2 = getEnt("trap5_brush2", "targetname");
	bounce = getEnt("trap5_bounce", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotateRoll(360, 1);
		wait 0.5;
		brush2 rotateRoll(360, 1);
		wait 0.5;
		bounce rotateYaw(360, 3);
		wait 5;
	}
}

trap6(){
	button = getent("trig_trap6", "targetname");
	button setHintString(level.trapHintString);

	brush = getEnt("trap6_brush", "targetname");
	button waittill("trigger", player);
	button delete();

	while(1){
		brush moveZ(420, 2);
		wait 3;
		brush moveZ(-840, 4);
		wait 6;
		brush moveZ(420, 2);
		wait 3;
	}

}

trap7(){
	button = getent("trig_trap7", "targetname");
	button setHintString(level.trapHintString);

	wall1 = getEnt("trap7_wall1", "targetname");
	wall2 = getEnt("trap7_wall2", "targetname");

	bounce1 = getEnt("trap7_bounce1", "targetname");
	bounce2 = getEnt("trap7_bounce2", "targetname");
	bounce3 = getEnt("trap7_bounce3", "targetname");

	button waittill("trigger", player);
	button delete();

	num = randomInt(2);

	switch(num)
	{
		case 0: 
		wall1 delete();
		bounce1 delete();
		bounce3 delete();
		break;
		case 1: 
		wall2 delete();
		bounce2 delete();
		break;
	}
}

trap8(){
	button = getent("trig_trap8", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap8_brush1", "targetname");
	brush2 = getEnt("trap8_brush2", "targetname");
	brush3 = getEnt("trap8_brush3", "targetname");
	brush4 = getEnt("trap8_brush4", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotateRoll(360, 1);
		wait 2;
		brush2 rotatePitch(360, 1);
		wait 2;
		brush3 rotatePitch(360, 1);
		wait 2;
		brush4 rotateRoll(360, 1);
		wait 2;
	}
}

trap9(){
	button = getent("trig_trap9", "targetname");
	button setHintString(level.trapHintString);

	brush1 = getEnt("trap9_brush1", "targetname");
	brush2 = getEnt("trap9_brush2", "targetname");
	brush3 = getEnt("trap9_brush3", "targetname");
	brush4 = getEnt("trap9_brush4", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush1 rotatePitch(360,1);
		wait 1;
		brush2 rotatePitch(-360,1);
		wait 1;
		brush3 rotatePitch(360,1);
		wait 1;
		brush4 rotatePitch(-360,1);
		wait 1;
	}
}

trap10(){
	button = getent("trig_trap10", "targetname");
	button setHintString(level.trapHintString);

	brush = getEnt("trap10_brush", "targetname");

	button waittill("trigger", player);
	button delete();

	while(1){
		brush moveY(868, 0.5);
		wait 4;
		brush moveY(-868, 0.5);
		wait 4;
	}
}

//Secret----------
secret(){
	trigger = getEnt("secretshoot", "targetname");
	origin = getEnt("og_hardSecret1", "targetname");

	while(1){
		trigger waittill("trigger", player);

		player setPlayerAngles(origin.angles);
		player setOrigin(origin.origin);
		iPrintLn("^1"+player.name + " ^7has entered the secret^1!");
	}
}

secret_finish(){

	trigger = getEnt("trig_secretEnd_Hard", "targetname");
	trigger setHintString("Press ^1&&1 ^7to finish secret^1!");
	origin = getEnt("og_secretEnd_Hard", "targetname");

	while(1){
		trigger waittill("trigger", player);

		iPrintLnBold("^1"+player.name + " ^7has finished the secret^1!");
		
		player braxi\_rank::giveRankXP("", 1000);
		player SetPlayerAngles( origin.angles );
		player SetOrigin( origin.origin );
	}

}

HiddenBounce(){
	bounce = getEnt("trig_hiddenbounce", "targetname");

	while(1){
		bounce waittill("trigger", player);
		player braxi\_rank::giveRankXP("", 500); 
		iPrintLn("^1" + player.name + " ^7found a hidden bounce^1!");
		wait 1;
	}

}

//Rooms------------
RoomDeath() { 
	self common_scripts\utility::waittill_any("death","disconnect");
	iPrintLnBold("^1"+self.name+" ^7is dead ^1!"); 
	iPrintLnBold("^1Selection Room ^7is now ^7open^1!"); 
}

EndRooms(){
	trig = getEnt("trig_endrooms", "targetname");
	og = getEnt("og_endrooms", "targetname");
	trig setHintString("^1>>^7 Press [^1&&1^7] ^7 to Enter Endroom Selection!");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);

		iPrintLnBold("^1" + player.name + " ^7has entered the ^1game selection ^7!" );
		player RoomDeath();
	}
}

SniperRoom(){
	trig = getEnt("sniper_room", "targetname");
	trig setHintString("Press ^1&&1 ^7for ^1Sniper^7!");
	jumpOG = getEnt("sniperspawn_jumper", "targetname");
	actiOG = getEnt("sniperspawn_acti", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		
		player setOrigin (jumpOG.origin);
		player setPlayerAngles (jumpOG.angles);
		player takeAllWeapons();
		player giveWeapon("m40a3_mp");
		player giveWeapon( "remington700_mp" ); 
		player giveMaxAmmo("m40a3_mp");
		player giveMaxAmmo( "remington700_mp" );
		player freezeControls(1);
		
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("m40a3_mp");
		level.activ giveWeapon("remington700_mp");
		level.activ giveMaxAmmo("m40a3_mp");
		level.activ giveMaxAmmo("remington700_mp");
		level.activ freezeControls(1);
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		
		iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Sniper ^7Room");
		
		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^1" + i);
			level.activ iPrintLnBold("^1" + i);
			wait 1;
		}
		
		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
		
		player switchToWeapon("m40a3_mp");
		level.activ switchToWeapon("m40a3_mp");
	}
}

WeaponRoom(){
	trig = getEnt("weapon_room", "targetname");
	trig setHintString("Press ^1&&1 ^7for ^1Random Weapon^7!");
	jumpOG = getEnt("sniperspawn_jumper", "targetname");
	actiOG = getEnt("sniperspawn_acti", "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		
		num = randomInt(5);
		
		player takeAllWeapons();
		level.activ takeAllWeapons();
		
		switch(num)
		{
			case 0: 
			player giveWeapon("mp5_silencer_mp");
			player giveMaxAmmo("mp5_silencer_mp");
			player switchToWeapon("mp5_silencer_mp");
			level.activ giveWeapon("mp5_silencer_mp");
			level.activ giveMaxAmmo("mp5_silencer_mp");
			level.activ switchToWeapon("mp5_silencer_mp");
			break;
			case 1: 
			player giveWeapon("rpg_mp");
			player giveMaxAmmo("rpg_mp");
			player switchToWeapon("rpg_mp");
			level.activ giveWeapon("rpg_mp");
			level.activ giveMaxAmmo("rpg_mp");
			level.activ switchToWeapon("rpg_mp");
			break;
			case 2: 
			player giveWeapon("m60e4_mp");
			player giveMaxAmmo("m60e4_mp");
			player switchToWeapon("m60e4_mp");
			level.activ giveWeapon("m60e4_mp");
			level.activ giveMaxAmmo("m60e4_mp");
			level.activ switchToWeapon("m60e4_mp");
			break;
			case 3: 
			player giveWeapon("m1014_mp");
			player giveMaxAmmo("m1014_mp");
			player switchToWeapon("m1014_mp");
			level.activ giveWeapon("m1014_mp");
			level.activ giveMaxAmmo("m1014_mp");
			level.activ switchToWeapon("m1014_mp");
			break;
			case 4: 
			player giveWeapon("deserteaglegold_mp");
			player giveMaxAmmo("deserteaglegold_mp");
			player switchToWeapon("deserteaglegold_mp");
			level.activ giveWeapon("deserteaglegold_mp");
			level.activ giveMaxAmmo("deserteaglegold_mp");
			level.activ switchToWeapon("deserteaglegold_mp");
			break;
		}
		
		player setOrigin (jumpOG.origin);
		player setPlayerAngles (jumpOG.angles);
		player freezeControls(1);
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ freezeControls(1);
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		
		iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Random Weapon ^7Room");
		
		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^1" + i);
			level.activ iPrintLnBold("^1" + i);
			wait 1;
		}
		
		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

KnifeRoom(){
	trig = getEnt("knife_room", "targetname");
	trig setHintString("Press ^1&&1 ^7for ^1Knife^7!");
	jumpOG = getEnt("knifespawn_jumper", "targetname"); 
	actiOG = getEnt("knifespawn_acti", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
				
		player setOrigin (jumpOG.origin);
		player setPlayerAngles (jumpOG.angles);
		player takeAllWeapons();
		player giveWeapon("tomahawk_mp");
		player freezeControls(1);
		
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("tomahawk_mp");
		level.activ freezeControls(1);
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		
		iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Knife ^7Room");
		
		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^1" + i);
			level.activ iPrintLnBold("^1" + i);
			wait 1;
		}
		
		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
		
		player switchToWeapon("tomahawk_mp");
		level.activ switchToWeapon("tomahawk_mp");
	}
}

PureStrafeRoomSetup(){
	thread PureStrafeTeleports("activator", "jumper");
	thread PureStrafeTeleports("jumper", "activator");
	thread PureStrafeRoom();
}

PureStrafeTeleports(name1, name2){
	trig = getEnt("trig_ps_" + name1, "targetname");
	win = getEnt("knifespawn_jumper", "targetname");
	lose = getEnt("knifespawn_acti", "targetname");
	check = getEnt("trig_psCheck" + name2, "targetname");
	
	while(1)
	{
		check waittill("trigger", enemy);
		trig waittill("trigger", player);
		
		iPrintLnBold("^1" + player.name + " ^7has beat ^1" + enemy.name + " ^7in the ^1PureStrafe ^7Room!");
		
		player Teleport(trig, win);
		player takeAllWeapons();
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player giveWeapon("deserteaglegold_mp");
		player giveMaxAmmo("deserteaglegold_mp");
		player switchToWeapon("m40a3_mp");
		
		enemy takeAllWeapons();
		enemy freezeControls(1);
		enemy setOrigin(lose.origin);
		enemy setPlayerAngles(lose.angles);
	}
}

PureStrafeRoom(){
	trig = getEnt("purestrafe_room", "targetname");
	trig setHintString("Press ^1&&1 ^7for ^1PureStrafe^7!");
	jumpOG = getEnt("og_ps_jumper", "targetname"); 
	actiOG = getEnt("og_ps_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		
		player setOrigin (jumpOG.origin);
		player setPlayerAngles (jumpOG.angles);
		player takeAllWeapons();
		player giveWeapon("tomahawk_mp");
		player switchToWeapon("tomahawk_mp");
		player freezeControls(1);
		
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("tomahawk_mp");
		level.activ switchToWeapon("tomahawk_mp");
		level.activ freezeControls(1);
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		
		iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1PureStrafe ^7Room");
		
		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^1" + i);
			level.activ iPrintLnBold("^1" + i);
			wait 1;
		}
		
		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

BounceRoomSetup()
{
	thread BounceRoomTeleports("activator", 1);
	thread BounceRoomTeleports("jumper", 1);
	
	thread SpinLetter(getEnt("model_snipers", "targetname"));
	thread BounceRoom();
	thread BounceSniper();
}

BounceSniper()
{
	trig = getEnt("trig_bounce_sniper", "targetname");
	trig setHintString("^7Press [^1&&1^7] to get a sniper!");
	
	while(1)
	{
		trig waittill("trigger", player);
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		iPrintLnBold("^1" + player.name + " ^7has got a ^1Sniper!");
		
		i = 3;	
		while(i>0)
		{
			trig setHintString("^7Ready in: [^1" + i + "^7]");
			wait 1;
			i--;
		}
		trig setHintString("^7Press [^1&&1^7] to get a sniper!");
	}
}

BounceRoomTeleports(name, num)
{
	trig = getEnt("trig_bouncefall_" + name + num, "targetname");
	og = getEnt("og_bounce_" + name, "targetname");
	
	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

BounceRoom(){
	trig = getEnt("bounce_room", "targetname");
	trig setHintString("Press ^1&&1 ^7for ^1Bounce^7!");
	jumpOG = getEnt("og_bounce_jumper", "targetname"); 
	actiOG = getEnt("og_bounce_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
	
		player setOrigin (jumpOG.origin);
		player setPlayerAngles (jumpOG.angles);
		player takeAllWeapons();
		player giveWeapon("tomahawk_mp");
		player switchToWeapon("tomahawk_mp");
		player freezeControls(1);
		
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("tomahawk_mp");
		level.activ switchToWeapon("tomahawk_mp");
		level.activ freezeControls(1);
		
		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		
		iPrintLnBold("^1>>^7 " + player.name + " Has Chosen The ^1Bounce ^7 Room");
		
		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^1" + i);
			level.activ iPrintLnBold("^1" + i);
			wait 1;
		}
		
		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");
		
		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

//Music-------------
MusicBox(){
    trig = getEnt("trig_musicBox","targetname");
    trig setHintString("^7Press [^1&&1^7] to select ^1Music^7!");
	
    trig waittill("trigger", player);
	player braxi\_rank::giveRankXP("", 50);
    trig delete();
    
    player freezeControls(1);
    player musicMenu();
}

musicMenu(){
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
    self.hud_music[i] setShader( "black", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(1,0,0);
    
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "middle", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("^7RED^7!");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else 
        self.hud_music[i].glowcolor=(1,0,0);
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("Scroll: ^3[{+attack}] ^7| Select: ^3[{+activate}] ^7| Close: ^3[{+frag}]");
 
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
    indicator setShader( "white", 306, 17 );
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
             iPrintLn("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
			 
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

//Misc--------------
Teleport(trig, og){
	self setPlayerAngles(og.angles);
	self setOrigin(og.origin);
	
	self freezeControls(1);
	wait 0.005;
	self freezeControls(0);
}

SetupCollectables(){
	for(i=1;i<=4;i++) thread Collectables(i);
}

Collectables(num){
	trig = getEnt("trig_collectable" + num, "targetname");
	brush = getEnt("collectable" + num, "targetname");
	thread SpinLetter(brush);
	
	trig waittill("trigger", player);
	player braxi\_rank::giveRankXP("", 250);
	player iPrintLn("^1Collectable ^7found. ^1250xp ^7awarded!");
	
	trig delete();
	brush delete();
}

SpinLetter(letter){
	while(1)
	{
		letter moveZ(20, 2, 0.5, 0.5);
		letter rotateYaw(180, 2);
		wait 2;
		letter moveZ(-20, 2, 0.5, 0.5);
		letter rotateYaw(180, 2);
		wait 2;
	}
}

MoveArrows(){
	arrow1 = getEnt("brush_arrow1", "targetname");
	arrow2 = getEnt("brush_arrow2", "targetname");
	arrow3 = getEnt("brush_arrow3", "targetname");
	arrow4 = getEnt("brush_arrow4", "targetname");

	while(1)
    {
        arrow1 moveY(50, 2, 0.5, 0.5);
        arrow2 moveY(50, 2, 0.5, 0.5);
        arrow3 moveY(50, 2, 0.5, 0.5);
        arrow4 moveY(50, 2, 0.5, 0.5);
        wait 2;
        arrow1 moveY(-50, 2, 0.5, 0.5);
        arrow2 moveY(-50, 2, 0.5, 0.5);
        arrow3 moveY(-50, 2, 0.5, 0.5);
        arrow4 moveY(-50, 2, 0.5, 0.5);
        wait 2;
    }
}

MoveName(){
	name = getEnt("brush_name", "targetname");

	while(1)
    {
        name moveZ(50, 2, 0.5, 0.5);
        wait 2;
        name moveZ(-50, 2, 0.5, 0.5);
        wait 2;
    }
}

MoveLetters(){
	letterS = getEnt("letterS", "targetname");
	letterK = getEnt("letterK", "targetname");
	letterP = getEnt("letterP", "targetname");
	letterW = getEnt("letterW", "targetname");
	letterB = getEnt("letterB", "targetname");

	while(1)
    {
        letterS moveZ(50, 2, 0.5, 0.5);
        letterK moveZ(50, 2, 0.5, 0.5);
        letterP moveZ(50, 2, 0.5, 0.5);
        letterW moveZ(50, 2, 0.5, 0.5);
        letterB moveZ(50, 2, 0.5, 0.5);
        wait 2;
        letterS moveZ(-50, 2, 0.5, 0.5);
        letterK moveZ(-50, 2, 0.5, 0.5);
        letterP moveZ(-50, 2, 0.5, 0.5);
        letterW moveZ(-50, 2, 0.5, 0.5);
        letterB moveZ(-50, 2, 0.5, 0.5);
        wait 2;
    }
}

messages(){
    wait 10;
	iPrintLnBold("^7Welcome to ^1"+getDvar("mapname")+"^7!");
	
    while(1)
    {		
        wait 10;
		iPrintLn("^7Map created by ^1Sean^7!");
        wait 10;
		iPrintLn("^7Special thanks to ^6Glenbob Baby^7!");
        wait 10;
		iPrintLn("^7Special thanks ^1(but not as much) ^7to ^5Nennius^7!");
        wait 10;
        iPrintLn("^1>>^7 Thanks for playing ^1"+getDvar("mapname"));
        wait 10;
        iPrintLn("^1>>^7 Feedback is ^1appreciated^1!");
        wait 10;
        iPrintLn("^1>>^7 Trouble seeing players^1? ^7Use fullbright^1!");
        wait 10;
    }
}

startdoor(){
	level waittill("round_started");
	startdoor = getent("startdoor","targetname");

	wait 5;
	iPrintLnBold("^1 Startdoor ^7is opening^1!");
	wait 1;
	for(i = 3;i > 0;i--)
	{
		iPrintLnBold("^1" + i);
		wait 1;
	}
	iPrintLnBold("^7GO!");
	
	startdoor moveZ(-2000, 1);
	wait 1;
	startdoor delete();	
	thread secret();
}
