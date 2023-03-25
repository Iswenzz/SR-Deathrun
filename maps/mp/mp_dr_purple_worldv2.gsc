/*
__/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________
 _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________
  _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________
  __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___
   ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__
    ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_
     _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_
      ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_
       _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

 _    ___      __  _         ________           __          __
| |  / (_)____/ /_(_)____   / ____/ /__  ____  / /_  ____  / /_
| | / / / ___/ __/ / ___/  / / __/ / _ \/ __ \/ __ \/ __ \/ __ \
| |/ / (__  ) /_/ / /__   / /_/ / /  __/ / / / /_/ / /_/ / /_/ /
|___/_/____/\__/_/\___/   \____/_/\___/_/ /_/_.___/\____/_.___/

© Vistic Glenbob
*/

main()
{
	maps\mp\_load::main();

    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";

	//Pre-Cache//
	precacheItem("glen_mp");
	precacheItem("rpg_mp");
	precacheItem("barrett_acog_mp");
	precacheItem("ak74u_reflex_mp");
	precacheItem("ak74u_reflex_mp");
	precacheItem("m14_acog_mp");
	precacheItem("m16_gl_mp");

	//Fx//
	level._effect["purpleSmoke"] = LoadFx("custom/purplesmoke");

	//Music//
	if(!isdefined(level.music))
    level.music=[];
    level.music[0]["song"]    ="Left Hand - Beast Coast";
    level.music[0]["alias"]    ="song1";
    level.music[1]["song"]    ="I Aint Got Time - Tyler The Creator";
    level.music[1]["alias"]    ="song2";
    level.music[2]["song"]    ="C.N.B. - Vince Staples";
    level.music[2]["alias"]    ="song3";
    level.music[3]["song"]    ="Gangsta - Skepta ft BBK";
    level.music[3]["alias"]    ="song4";
    level.music[4]["song"]    ="Where & When - P Money ft Giggs";
    level.music[4]["alias"]    ="song5";

	//Dvars//
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 10000 );

	//Globals//
	level.Trap4Speed = 2;
	level.Trap10Speed = 2;
	level.Trap11Speed = 2;
	level.Trap13Speed = 1;
	level.Trap12Direction = 360;
	level.Trap12Speed = 2.5;

	level.Birdcage = getEnt("trap8_cage", "targetname");
	level.SecretSign = getEnt("brush_step2", "targetname");
	level.Birdcage hide();
	level.SecretSign hide();
	level.ActiSecretBlock = getEnt("brush_activatorSecret", "targetname");

	//General Threads//
	thread Messages();
	thread StartDoor();
	thread Logo();
	thread SpinningLetters();
	thread SetupCollectables();
	thread TriggerList();
	thread MusicBox();

	//Teleports//
	thread TeleToStage2();
	thread TeleActiToStage1();
	thread TeleActiToStage2();
	thread EasySecretTP();
	thread EasySecretFall();
	thread HardSecretTP();

	//Trap threads//
	thread MiscTraps();
	thread Trap1();
	thread Trap2();
	thread Trap3a();
	thread Trap3b();
	thread Trap4a();
	thread Trap4b();
	thread Trap5();
	thread Trap6();
	thread Trap7();
	thread Trap8();
	thread Trap9();
	thread Trap10a();
	thread Trap10b();
	thread Trap11a();
	thread Trap11b();
	thread Trap12a();
	thread Trap12b();
	thread Trap13a();
	thread Trap13b();

	//Endrooms//
	thread EndRooms();
	thread SniperRoom();
	thread RPGRoom();
	thread RunRoomSetup();
	thread WeaponRoom();
	thread DeagleRoom();
	thread KnifeRoom();
	thread OldRoom();
	thread PureStrafeRoomSetup();
	thread BounceRoomSetup();

	//Secret//
	thread SecretSetup();
	thread ActivatorSecretSetup();
	thread Elevator();
}

//General//
addTriggerToList(name)
{
    if(!isDefined(level.trapTriggers)) level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt(name,"targetname");
}

TriggerList()
{
	for(i=1;i<14;i++) addTriggerToList("trig_trap" + i);
}

Startdoor()
{
	door = getEnt("bm_startdoor", "targetname");
	door2 = getEnt("bm_startdoor2", "targetname");
	button1 = getEnt("bm_activatorButton", "targetname");
	button2 = getEnt("bm_jumperButton", "targetname");
	trig = getEnt("trig_startdoor", "targetname");
	trig setHintString("^6 Press &&1 to Open the Start Door!");

	trig waittill("trigger", player);
	trig delete();
	iPrintLnBold("^6StartDoor Opening!");

	button1 moveY(6, 1);
	button2 moveY(-6, 1);
	wait 1;

	button1 delete();
	button2 delete();

	wait 2;
	door moveZ(-225, 2);
	wait 2;
	door2 moveZ(-225,2);
	door delete();
	wait 2;
	door2 delete();

	thread Credits1();
	thread Credits2();
}

Credits1()
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
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 5;
	hud_clock.glowcolor = (0.0,0.8,0.0);
	hud_clock.label = &"^6Map by ^7Vistic Glenbob";
	hud_clock SetPulseFX( 40, 5400, 200 );
}

Credits2()
{
	hud_clock = NewHudElem();
    hud_clock.alignX = "center";
    hud_clock.alignY = "middle";
    hud_clock.horzalign = "center";
    hud_clock.vertalign = "middle";
    hud_clock.alpha = 1;
    hud_clock.x = 0;
    hud_clock.y = 20;
    hud_clock.fontscale = 1.8;
    hud_clock.glowalpha = 1;
    hud_clock.glowcolor = (1.000000, 0.623529, 0.635294);
    hud_clock.label = &"^6mp_dr_purple_worldv2";
    hud_clock SetPulseFX( 40, 5400, 200 );
}

Messages()
{
    wait 10;
	iPrintLnBold("^7Welcome to ^6"+getDvar("mapname")+"^7!");

    while(1)
    {
		iPrintLn("^6>>^7 Map tested on speed: [190/1] and [210/1.1]");
		iPrintLn("^6>>^7 Your speed is [^6"+getDvar("g_speed")+"/"+getDvar("dr_jumpers_speed")+"^7]");
		// if(getDvar("g_speed")=="190" && getDvar("dr_jumpers_speed")=="1" || getDvar("g_speed")=="210" && getDvar("dr_jumpers_speed") == "1.1")
		// {
		// 	wait 3;
		// 	iPrintLn("^6>>^7 Map has been tested on your speed!");
		// }
		// else
		// {
		// 	wait 3;
		// 	iPrintLn("^6>>^7 The map has not been tested on this speed.");
		// 	iPrintLn("^6>>^7 Please let me know if there are issues!");
		// }

        wait 10;
		iPrintLn("^7Map created by ^6Vistic Glenbob^6!");
		iPrintLn("^7Add me on Discord: ^6Glen#2362^6!");
		wait 10;
        iPrintLn("^6>>^7 Join the Vistic Discord Server:");
        iPrintLn("^6https://discord.gg/QHvpVv2");
        wait 10;
        iPrintLn("^6>>^7 Thanks for playing ^6"+getDvar("mapname"));
        wait 10;
        iPrintLn("^6>>^7 Feedback is ^6appreciated^6!");
        wait 10;
		iPrintLn("^6>>^7 My Clan is better than your clan^6!");
		wait 10;
		iPrintLn("^6>>^7 Thanks to Fox for help with Models^6!");
		wait 10;
		iPrintLn("^6>>^7 Official sequel to mp_dr_purple_world^6!");
		wait 10;
		iPrintLn("^6>>^7 Thanks to Erik for help with Errors^6!");
		wait 10;
    }
}

Logo()
{
	logo = getEnt("brush_logo", "targetname");
	logo2 = getEnt("brush_logo2", "targetname");

	while(1)
	{
		logo rotateYaw(360, 10, 2, 2);
		logo2 rotateYaw(360, 10, 2, 2);
		wait 10;
	}
}

SpinningLetters()
{
	letterE = getEnt("sign_easy", "targetname");
	letterH = getEnt("sign_hard", "targetname");

	d = getEnt("sign_deagle", "targetname");
	k = getEnt("sign_knife", "targetname");
	rpg = getEnt("sign_rpg", "targetname");
	r = getEnt("sign_run", "targetname");
	b = getEnt("sign_bounce", "targetname");
	w = getEnt("sign_weapon", "targetname");
	p = getEnt("sign_purestrafe", "targetname");
	s = getEnt("sign_sniper", "targetname");
	o = getEnt("sign_old", "targetname");

	thread SpinLetter(LetterE);
	thread SpinLetter(LetterH);

	thread SpinLetter(d);
	thread SpinLetter(k);
	thread SpinLetter(rpg);
	thread SpinLetter(r);
	thread SpinLetter(b);
	thread SpinLetter(w);
	thread SpinLetter(p);
	thread SpinLetter(s);
	thread SpinLetter(o);
}

SpinLetter(letter)
{
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

//Traps//
Trap1()
 {
	trig = getEnt("trig_trap1", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Move the Squares!");

	firstSet = getEnt("trap1_part1", "targetname");
	secondSet = getEnt("trap1_part2", "targetname");

	fx = getEnt("og_trap1", "targetname");
	button = getEnt("button_trap1", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	while(1)
	{
		firstSet moveZ(150,1);
		secondSet moveZ(-150,1);
		wait 1;
		firstSet moveZ(-300,2);
		secondSet moveZ(300,2);
		wait 2;
		firstSet moveZ(150,1);
		secondSet moveZ(-150,1);
		wait 1;
	}
 }

 Trap2()
 {
	degrees = 360;
	num = randomInt(2);

	if(num == 1) degrees *= -1;

	trig = getEnt("trig_trap2", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Move the Rectangles!");

	firstPlat = getEnt("trap2_part1", "targetname");
	secondPlat = getEnt("trap2_part2", "targetname");
	thirdPlat = getEnt("trap2_part3", "targetname");

	fx = getEnt("og_trap2", "targetname");
	button = getEnt("button_trap2", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	while(1)
	{
		firstPlat RotatePitch(degrees, 2);
		wait 1;
		secondPlat RotatePitch(degrees, 2);
		wait 1;
		thirdPlat RotatePitch(degrees, 2);
		wait 6;
		degrees *= -1;
	}
 }

 Trap3a()
 {
	trig = getEnt("trig_trap3", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Block the Path!");

	part1a = getEnt("trap3_part1a", "targetname");
	part1b = getEnt("trap3_part1b", "targetname");
	part1c = getEnt("trap3_part1c", "targetname");
	part2a = getEnt("trap3_part2a", "targetname");
	part2b = getEnt("trap3_part2b", "targetname");
	part2c = getEnt("trap3_part2c", "targetname");
	part3a = getEnt("trap3_part3a", "targetname");
	part3b = getEnt("trap3_part3b", "targetname");
	part3c = getEnt("trap3_part3c", "targetname");
	part4a = getEnt("trap3_part4a", "targetname");
	part4b = getEnt("trap3_part4b", "targetname");
	part4c = getEnt("trap3_part4c", "targetname");

	bounce1 = getEnt("trap3_bounce1", "targetname");
	bounce2 = getEnt("trap3_bounce2", "targetname");

	num = randomInt(3);

	fx = getEnt("og_trap3", "targetname");
	button = getEnt("button_trap3", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	bounce1 rotateYaw(360,1);
	bounce2 rotateYaw(360,1);

	switch(num)
	{
		case 0:
		part1a moveZ(460,1);
		part2b moveZ(460,1);
		part3c moveZ(460,1);
		part4a moveZ(460,1);
		break;
		case 1:
		part1b moveZ(460,1);
		part2a moveZ(460,1);
		part3a moveZ(460,1);
		part4c moveZ(460,1);
		break;
		case 2:
		part1c moveZ(460,1);
		part2c moveZ(460,1);
		part3b moveZ(460,1);
		part4b moveZ(460,1);
		break;
	}
 }

 Trap3b()
 {
	trig = getEnt("trig_trap3_plat", "targetname");
	plat = getEnt("trap3_plat", "targetname");
	trig waittill("trigger", player);
	trig delete();

	wait 0.5;
	plat moveY(-1664, 6);
	wait 8;
	plat moveY(1664, 6);
	wait 8;

	thread Trap3b();
 }

Trap4a()
{
	plat1 = getEnt("trap4_plat1", "targetname");
	plat2 = getEnt("trap4_plat2", "targetname");
	plat3 = getEnt("trap4_plat3", "targetname");
	plat4 = getEnt("trap4_plat4", "targetname");

	while(1)
	{
		plat1 moveX(-448, level.Trap4Speed);
		plat2 moveY(-448, level.Trap4Speed);
		plat3 moveX(448, level.Trap4Speed);
		plat4 moveY(448, level.Trap4Speed);
		wait level.Trap4Speed;
		plat1 moveY(-448, level.Trap4Speed);
		plat2 moveX(448, level.Trap4Speed);
		plat3 moveY(448, level.Trap4Speed);
		plat4 moveX(-448, level.Trap4Speed);
		wait level.Trap4Speed;
		plat1 moveX(448, level.Trap4Speed);
		plat2 moveY(448, level.Trap4Speed);
		plat3 moveX(-448, level.Trap4Speed);
		plat4 moveY(-448, level.Trap4Speed);
		wait level.Trap4Speed;
		plat1 moveY(448, level.Trap4Speed);
		plat2 moveX(-448, level.Trap4Speed);
		plat3 moveY(-448, level.Trap4Speed);
		plat4 moveX(448, level.Trap4Speed);
		wait level.Trap4Speed;
	}
}

Trap4b()
{
	trig = getEnt("trig_trap4", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Speed Up the Squares!");
	fx = getEnt("og_trap4", "targetname");
	button = getEnt("button_trap4", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Trap4Speed -= 1;
}

Trap5()
{
	trig = getEnt("trig_trap5", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Move the Rectangles!");

	part1 = getEnt("trap5_part1", "targetname");
	part2 = getEnt("trap5_part2", "targetname");
	part3 = getEnt("trap5_part3", "targetname");
	part4 = getEnt("trap5_part4", "targetname");
	part5 = getEnt("trap5_part5", "targetname");
	part6 = getEnt("trap5_part6", "targetname");
	part7 = getEnt("trap5_part7", "targetname");
	part8 = getEnt("trap5_part8", "targetname");

	fx = getEnt("og_trap5", "targetname");
	button = getEnt("button_trap5", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	while(1)
	{
		part1 rotatePitch(360, 1);
		wait 0.5;
		part2 rotatePitch(360, 1);
		wait 0.5;
		part3 rotatePitch(360, 1);
		wait 0.5;
		part4 rotatePitch(360, 1);
		wait 0.5;
		part5 rotatePitch(360, 1);
		wait 0.5;
		part6 rotatePitch(360, 1);
		wait 0.5;
		part7 rotatePitch(360, 1);
		wait 0.5;
		part8 rotatePitch(360, 1);
	}
}

Trap6()
{
	trig = getEnt("trig_trap6", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Move the Bounces!");

	bounce1 = getEnt("trap6_bounce1", "targetname");
	set1 = getEnt("trap6_set1", "targetname");
	set2 = getEnt("trap6_set2", "targetname");

	fx = getEnt("og_trap6", "targetname");
	button = getEnt("button_trap6", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	while(1)
	{
		bounce1 rotateYaw(360, 3);
		set1 moveZ(180, 3);
		set2 moveZ(-180, 3);
		wait 3;
		set1 moveZ(-180, 3);
		set2 moveZ(180, 3);
		wait 3;
	}
}

Trap7()
{
	trig = getEnt("trig_trap7", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Raise the Lava!");

	lava = getEnt("trap7_lava", "targetname");
	hurt = getEnt("trap7_hurt", "targetname");

	hurt enableLinkTo();
	hurt linkTo(lava);

	fx = getEnt("og_trap7", "targetname");
	button = getEnt("button_trap7", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	lava moveZ(192, 2);
	wait 5;
	lava moveZ(-192, 2);
	wait 2;
}

Trap8()
{
	trig = getEnt("trig_trap8", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Drop the BirdCage!");
	cone = getEnt("trap8_cone", "targetname");
	hurt = getEnt("trap8_hurt", "targetname");

	hurt enableLinkTo();
	hurt linkTo(cone);

	fx = getEnt("og_trap8", "targetname");
	button = getEnt("button_trap8", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Birdcage show();
	level.Birdcage moveZ(-192, 1);
	wait 2;
	cone moveZ(284, 3);
	wait 6;

	level.Birdcage delete();
	hurt delete();
	cone delete();
}

Trap9()
{
    trig = getEnt("trig_trap9", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Change the Path!");
    sqrArr = [];
	smArr = [];

	start = [];
	start[start.size] = 2;
	start[start.size] = 5;
	start[start.size] = 8;
	start[start.size] = 11;
	start[start.size] = 14;

	opposite = [];
	opposite[opposite.size] = 1;
	opposite[opposite.size] = 3;
	opposite[opposite.size] = 4;
	opposite[opposite.size] = 6;
	opposite[opposite.size] = 7;
	opposite[opposite.size] = 9;
	opposite[opposite.size] = 10;
	opposite[opposite.size] = 12;
	opposite[opposite.size] = 13;
	opposite[opposite.size] = 15;

	sShape = [];
	sShape[sShape.size] = 1;
	sShape[sShape.size] = 2;
	sShape[sShape.size] = 3;
	sShape[sShape.size] = 4;
	sShape[sShape.size] = 7;
	sShape[sShape.size] = 8;
	sShape[sShape.size] = 9;
	sShape[sShape.size] = 12;
	sShape[sShape.size] = 13;
	sShape[sShape.size] = 14;
	sShape[sShape.size] = 15;

	sShape2 = [];
	sShape2[sShape2.size] = 1;
	sShape2[sShape2.size] = 2;
	sShape2[sShape2.size] = 3;
	sShape2[sShape2.size] = 6;
	sShape2[sShape2.size] = 7;
	sShape2[sShape2.size] = 8;
	sShape2[sShape2.size] = 9;
	sShape2[sShape2.size] = 10;
	sShape2[sShape2.size] = 13;
	sShape2[sShape2.size] = 14;
	sShape2[sShape2.size] = 15;

	alternating = [];
	alternating[alternating.size] = 1;
	alternating[alternating.size] = 3;
	alternating[alternating.size] = 5;
	alternating[alternating.size] = 7;
	alternating[alternating.size] = 9;
	alternating[alternating.size] = 11;
	alternating[alternating.size] = 13;
	alternating[alternating.size] = 15;

	alternating2 = [];
	alternating2[alternating2.size] = 2;
	alternating2[alternating2.size] = 4;
	alternating2[alternating2.size] = 6;
	alternating2[alternating2.size] = 8;
	alternating2[alternating2.size] = 10;
	alternating2[alternating2.size] = 12;
	alternating2[alternating2.size] = 14;

	for (i = 0; i < 15; i++)
	{
		sqrName = "trap9_sq" + (i+1);
		smName = "trap9_sm" + (i+1);
		sqrArr[i] = getEnt(sqrName, "targetname");
		smArr[i] = getEnt(smName, "targetname");
	}

   Trap9_Tiles(sqrArr, smArr, start);

	fx = getEnt("og_trap9", "targetname");
	button = getEnt("button_trap9", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

   num = randomInt(5);

   switch(num)
   {
		case 1:
		Trap9_Tiles(sqrArr, smArr, sShape);
		break;
		case 2:
		Trap9_Tiles(sqrArr, smArr, alternating);
		break;
		case 3:
		Trap9_Tiles(sqrArr, smArr, alternating2);
		break;
		case 4:
		Trap9_Tiles(sqrArr, smArr, opposite);
		break;
		case 0:
		Trap9_Tiles(sqrArr, smArr, sShape2);
		break;
   }
}

Trap9_Tiles(sqr, sm, nums)
{
	for (i = 0; i < sqr.size; i++)
	{
		sqr[i] notSolid();
		sm[i] hide();
	}

	for (i = 0; i < nums.size; i++)
	{
		for (j = 0; j < sqr.size; j++)
		{
			if(nums[i] == (j+1))
			{
				sqr[j] solid();
				sm[j] show();
			}
		}
	}
}

Trap10a()
{
	part1 = getEnt("trap10_part1", "targetname");
	part2 = getEnt("trap10_part2", "targetname");
	part3 = getEnt("trap10_part3", "targetname");
	part4 = getEnt("trap10_part4", "targetname");
	part5 = getEnt("trap10_part5", "targetname");

	part1 moveY(-325, level.Trap10Speed);
	part3 moveY(-325, level.Trap10Speed);
	part5 moveY(-325, level.Trap10Speed);
	wait level.Trap10Speed;

	while(1)
	{
		part1 moveY(325, level.Trap10Speed);
	    part3 moveY(325, level.Trap10Speed);
	    part5 moveY(325, level.Trap10Speed);
		part2 moveY(-325, level.Trap10Speed);
		part4 moveY(-325, level.Trap10Speed);
		wait level.Trap10Speed;
		part1 moveY(-325, level.Trap10Speed);
	    part3 moveY(-325, level.Trap10Speed);
	    part5 moveY(-325, level.Trap10Speed);
		part2 moveY(325, level.Trap10Speed);
		part4 moveY(325, level.Trap10Speed);
		wait level.Trap10Speed;
	}
}

Trap10b()
{
    trig = getEnt("trig_trap10", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Speed Up!");
	fx = getEnt("og_trap10", "targetname");
	button = getEnt("button_trap10", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Trap10Speed -= 1;
}

Trap11a()
{
	part1 = getEnt("trap11_part1", "targetname");
	part2 = getEnt("trap11_part2", "targetname");

	while(1)
	{
		part1 moveX(150, level.Trap11Speed);
		part2 moveX(-150, level.Trap11Speed);
		wait level.Trap11Speed;
		part1 moveX(-300, level.Trap11Speed*2);
		part2 moveX(300, level.Trap11Speed*2);
		wait level.Trap11Speed*2;
		part1 moveX(150, level.Trap11Speed);
		part2 moveX(-150, level.Trap11Speed);
		wait level.Trap11Speed;
	}
}

Trap11b()
{
	trig = getEnt("trig_trap11", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Speed Up!");

	fx = getEnt("og_trap11", "targetname");
	button = getEnt("button_trap11", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Trap11Speed -= 1;
}

Trap12a()
{
	part1 = getEnt("trap12_part1", "targetname");
	part2 = getEnt("trap12_part2", "targetname");

	while(1)
	{
		part1 rotateYaw(level.Trap12Direction, level.Trap12Speed);
		part2 rotateYaw(level.Trap12Direction, level.Trap12Speed);
		wait level.Trap12Speed;
	}
}

Trap12b()
{
	trig = getEnt("trig_trap12", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Speed Up!");

	fx = getEnt("og_trap12", "targetname");
	button = getEnt("button_trap12", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Trap12Direction *= -1;
	level.Trap12Speed -= 1;
}

Trap13a()
{
	part1 = getEnt("trap13_part1", "targetname");
	part2 = getEnt("trap13_part2", "targetname");
	part3 = getEnt("trap13_part3", "targetname");
	part4 = getEnt("trap13_part4", "targetname");

	while(1)
	{
		part1 solid();
		part1 show();
		part2 notSolid();
		part2 hide();
		wait level.Trap13Speed;
		part2 solid();
		part2 show();
		part3 notSolid();
		part3 hide();
		wait level.Trap13Speed;
		part3 solid();
		part3 show();
		part4 notSolid();
		part4 hide();
		wait level.Trap13Speed;
		part4 solid();
		part4 show();
		part1 notSolid();
		part1 hide();
		wait level.Trap13Speed;

	}
}

Trap13b()
{
	trig = getEnt("trig_trap13", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Speed Up!");

	fx = getEnt("og_trap13", "targetname");
	button = getEnt("button_trap13", "targetname");

	trig waittill("trigger", player);
	trig delete();

	playfx(level._effect["purpleSmoke"],fx.origin);
	button moveZ(-15, 1);

	level.Trap13Speed -= 0.5;
}

MiscTraps()
{
	roller = getEnt("brush_roller", "targetname");

    while(1)
	{
		roller rotatePitch(360,2);
		wait 2;
	}
}

//Teleports//
TeleActiToStage2()
{
	trig = getEnt("trig_stage2", "targetname");
	trig setHintString("^6>>^7Press [^6&&1^7] to Move to Stage ^62^7!");
	og = getEnt("og_stage2", "targetname");
	door = getEnt("startdoor_part2", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
		wait 1;
		door moveZ(-400, 2);
		wait 2;
		door delete();
	}
}

TeleActiToStage1()
{
	trig = getEnt("trig_stage1", "targetname");
	trig setHintString("^6>>^7Press [^6&&1^7] to Move to Stage ^61^7!");
	og = getEnt("og_stage1", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

TeleToStage2()
{
	trig = getEnt("trig_level1end", "targetname");
	og = getEnt("og_level2start", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

HardSecretTP()
{
	trig = getEnt("trig_hardEntrance", "targetname");
	og = getEnt("og_hardSecret1", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
		player.secretPos = 1;
		player thread secret_timer(90, "^1Hard Secret");
		iPrintLn("^6" + player.name + " ^7has entered the ^1Hard ^6Secret^7!");
	}
}

EasySecretTP()
{
	trig = getEnt("trig_easyEntrance", "targetname");
	og = getEnt("og_easySecret", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player thread secret_timer(45, "^2Easy Secret");
		player Teleport(trig, og);
		iPrintLn("^6" + player.name + " ^7has entered the ^2Easy ^6Secret^7!");
	}
}

EasySecretFall()
{
	trig = getEnt("trig_easySecretFall", "targetname");
	og = getEnt("og_easySecret", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

Teleport(trig, og)
{
	self setPlayerAngles(og.angles);
	self setOrigin(og.origin);

	self freezeControls(1);
	wait 0.005;
	self freezeControls(0);
}

//Rooms//
RoomDeath()
{
	self common_scripts\utility::waittill_any("death","disconnect");
	iPrintLnBold("^6"+self.name+" ^7is dead ^6!");
	iPrintLnBold("^6Selection Room ^7is now ^7open^6!!!");
}

EndRooms()
{
	trig = getEnt("trig_endrooms", "targetname");
	og = getEnt("og_endrooms", "targetname");
	trig setHintString("^6>>^7 Press [^6&&1^7] ^7 to Enter Endroom Selection!");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);

		iPrintLnBold("^6" + player.name + " ^7has entered the ^6game selection ^7!!!" );
		player RoomDeath();
	}
}

SniperRoom()
{
	trig = getEnt("trig_snipRoom", "targetname");
	trig setHintString("^6[Sniper] ^7Room");
	jumpOG = getEnt("og_sniproom_jumper", "targetname");
	actiOG = getEnt("og_sniproom_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
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

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Sniper ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
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

WeaponRoom()
{
	trig = getEnt("trig_wepRoom", "targetname");
	trig setHintString("^6[Random Weapon] ^7Room");
	jumpOG = getEnt("og_sniproom_jumper", "targetname");
	actiOG = getEnt("og_sniproom_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		num = randomInt(5);

		player takeAllWeapons();
		level.activ takeAllWeapons();

		switch(num)
		{
			case 0:
			player giveWeapon("barrett_acog_mp");
			player giveMaxAmmo("barrett_acog_mp");
			player switchToWeapon("barrett_acog_mp");
			level.activ giveWeapon("barrett_acog_mp");
			level.activ giveMaxAmmo("barrett_acog_mp");
			level.activ switchToWeapon("barrett_acog_mp");
			break;
			case 1:
			player giveWeapon("ak74u_reflex_mp");
			player giveMaxAmmo("ak74u_reflex_mp");
			player switchToWeapon("ak74u_reflex_mp");
			level.activ giveWeapon("ak74u_reflex_mp");
			level.activ giveMaxAmmo("ak74u_reflex_mp");
			level.activ switchToWeapon("ak74u_reflex_mp");
			break;
			case 2:
			player giveWeapon("ak74u_reflex_mp");
			player giveMaxAmmo("ak74u_reflex_mp");
			player switchToWeapon("ak74u_reflex_mp");
			level.activ giveWeapon("ak74u_reflex_mp");
			level.activ giveMaxAmmo("ak74u_reflex_mp");
			level.activ switchToWeapon("ak74u_reflex_mp");
			break;
			case 3:
			player giveWeapon("m14_silencer_mp");
			player giveMaxAmmo("m14_silencer_mp");
			player switchToWeapon("m14_silencer_mp");
			level.activ giveWeapon("m14_silencer_mp");
			level.activ giveMaxAmmo("m14_silencer_mp");
			level.activ switchToWeapon("m14_silencer_mp");
			break;
			case 4:
			player giveWeapon("m16_gl_mp");
			player giveMaxAmmo("m16_gl_mp");
			player switchToWeapon("m16_gl_mp");
			level.activ giveWeapon("m16_gl_mp");
			level.activ giveMaxAmmo("m16_gl_mp");
			level.activ switchToWeapon("m16_gl_mp");
			break;
		}

		player Teleport(trig, jumpOG);
		player freezeControls(1);
		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ freezeControls(1);

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Weapon ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");

		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

RPGRoomTele(name)
{
	trig = getEnt("trig_rpg_"+name, "targetname");
	og = getEnt("og_rpg_"+name, "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

RPGRefill(num)
{
	trig = getEnt("trig_rpg_refill"+num, "targetname");
	trig setHintString("^7Press [^6&&1^7] to Refill RPG");

	while(1)
	{
		trig waittill("trigger", player);
		player giveMaxAmmo("rpg_mp");

		i = 3;
		while(i>0)
		{
			trig setHintString("^7Ready in: [^6" + i + "^7]");
			wait 1;
			i--;
		}
		trig setHintString("^7Press [^6&&1^7] to Refill RPG");
	}
}

RPGRoom()
{
	thread RPGRoomTele("jumper");
	thread RPGRoomTele("activator");
	thread RPGRefill(1);
	thread RPGRefill(2);

	trig = getEnt("trig_rpgRoom", "targetname");
	trig setHintString("^6[RPG] ^7Room");
	jumpOG = getEnt("og_rpg_jumper", "targetname");
	actiOG = getEnt("og_rpg_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
		player takeAllWeapons();
		player giveWeapon("rpg_mp");
		player setWeaponAmmoClip("rpg_mp", 9999 );
		player giveMaxAmmo("rpg_mp");
		player freezeControls(1);

		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("rpg_mp");
		level.activ setWeaponAmmoClip("rpg_mp", 9999 );
		level.activ freezeControls(1);

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6RPG ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player switchToWeapon("rpg_mp");
		level.activ switchToWeapon("rpg_mp");
	}
}

RunRoomSetup()
{
	for(i=1;i<=3;i++)
	{
		thread RunRoomFall("Jumper", i);
		thread RunRoomFall("Activator", i);

		if(i == 3) break;

		thread RunRoomTele("Jumper", i);
		thread RunRoomTele("Activator", i);
	}
	thread RunRoomWin("Jumper", "Activator");
	thread RunRoomWin("Activator", "Jumper");
	thread RunRoom();
}

RunRoomWin(name1, name2)
{
	trig = getEnt("trig_run"+name1+"_floor3", "targetname");
	og = getEnt("og_runWinner", "targetname");
	lose = getEnt("og_runLoser", "targetname");
	jumper = getEnt("trig_runCheck"+name2, "targetname");

	while(1)
	{
		jumper waittill("trigger", player);
		trig waittill("trigger", acti);

		acti Teleport(trig, og);
		player freezeControls(1);
		player takeAllWeapons();
		player setOrigin(lose.origin);
		player setPlayerAngles(lose.angles);
		iPrintLnBold("^6" + acti.name + " ^7has beat ^6" + player.name + " ^7in the ^6Run ^7Room!");

		acti takeAllWeapons();
		acti giveWeapon("m40a3_mp");
		acti giveMaxAmmo("m40a3_mp");
		acti giveWeapon("deserteaglegold_mp");
		acti giveMaxAmmo("deserteaglegold_mp");
		acti switchToWeapon("m40a3_mp");

	}
}

RunRoomTele(name, num)
{
	trig = getEnt("trig_run"+name+"_floor" + num, "targetname");
	og = getEnt("og_run"+name+"_floor" + (num+1), "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

RunRoomFall(name, num)
{
	trig = getEnt("trig_run"+name+"Fall" + num, "targetname");
	og = getEnt("og_run"+name+"_floor" + num, "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

RunRoom()
{
	trig = getEnt("trig_runRoom", "targetname");
	trig setHintString("^6[Run] ^7Room");
	jumpOG = getEnt("og_runJumper_floor1", "targetname");
	actiOG = getEnt("og_runActivator_floor1", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
		player takeAllWeapons();
		player giveWeapon("deserteaglegold_mp");
		player setWeaponAmmoClip("deserteaglegold_mp", 0 );
		player freezeControls(1);

		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("deserteaglegold_mp");
		level.activ setWeaponAmmoClip("deserteaglegold_mp", 0 );
		level.activ freezeControls(1);

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Run ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player switchToWeapon("deserteaglegold_mp");
		level.activ switchToWeapon("deserteaglegold_mp");
	}
}

DeagleRoom()
{
	trig = getEnt("trig_deagleRoom", "targetname");
	trig setHintString("^6[Deagle]^7 Room");
	jumpOG = getEnt("og_deagle_jumper", "targetname");
	actiOG = getEnt("og_deagle_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
		player takeAllWeapons();
		player giveWeapon("deserteaglegold_mp");
		player giveMaxAmmo("deserteaglegold_mp");
		player setWeaponAmmoClip("deserteaglegold_mp", 9999 );
		player freezeControls(1);

		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon("deserteaglegold_mp");
		level.activ giveMaxAmmo("deserteaglegold_mp");
		level.activ setWeaponAmmoClip("deserteaglegold_mp", 9999 );
		level.activ freezeControls(1);

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Deagle ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");

		player freezeControls(0);
		level.activ freezeControls(0);

		player switchToWeapon("deserteaglegold_mp");
		level.activ switchToWeapon("deserteaglegold_mp");
	}
}

OldRoom()
{
	trig = getEnt("trig_oldRoom", "targetname");
	trig setHintString("^6[Old] ^7Room");
	jumpOG = getEnt("og_stage1", "targetname");
	actiOG = getEnt("og_stage2", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);

		level.activ setOrigin (actiOG.origin);
		level.activ setPlayerAngles (actiOG.angles);

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Old ^7 Room");
	}
}

KnifeRoom()
{
	trig = getEnt("trig_knifeRoom", "targetname");
	trig setHintString("^6[Knife]^7 Room");
	jumpOG = getEnt("og_knife_jumper", "targetname");
	actiOG = getEnt("og_knife_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
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

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Knife ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
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

PureStrafeRoomSetup()
{
	thread PureStrafeTeleports("activator", "jumper");
	thread PureStrafeTeleports("jumper", "activator");
	thread PureStrafeRoom();
}

PureStrafeTeleports(name1, name2)
{
	trig = getEnt("trig_ps_" + name1, "targetname");
	win = getEnt("og_runWinner", "targetname");
	lose = getEnt("og_runLoser", "targetname");
	check = getEnt("trig_psCheck" + name2, "targetname");

	while(1)
	{
		check waittill("trigger", enemy);
		trig waittill("trigger", player);

		iPrintLnBold("^6" + player.name + " ^7has beat ^6" + enemy.name + " ^7in the ^6PureStrafe ^7Room!");

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

PureStrafeRoom()
{
	trig = getEnt("trig_strafeRoom", "targetname");
	trig setHintString("^6[PureStrafe]^7 Room");
	jumpOG = getEnt("og_ps_jumper", "targetname");
	actiOG = getEnt("og_ps_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
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

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6PureStrafe ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7GO!");
		level.activ iPrintLnBold("^7GO!");

		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

BounceRoomSetup()
{
	for(i=1;i<3;i++)
	{
		thread BounceRoomTeleports("activator", i);
		thread BounceRoomTeleports("jumper", i);
	}
	thread BounceRoom();
	thread BounceSniper();
}

BounceSniper()
{
	trig = getEnt("trig_bounce_sniper", "targetname");
	trig setHintString("^7Press [^6&&1^7] to get a sniper!");

	while(1)
	{
		trig waittill("trigger", player);
		player giveWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		iPrintLnBold("^6" + player.name + " ^7has got a ^6Sniper!");

		i = 3;
		while(i>0)
		{
			trig setHintString("^7Ready in: [^6" + i + "^7]");
			wait 1;
			i--;
		}
		trig setHintString("^7Press [^6&&1^7] to get a sniper!");
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

BounceRoom()
{
	trig = getEnt("trig_bounceRoom", "targetname");
	trig setHintString("^6[Bounce]^7 Room");
	jumpOG = getEnt("og_bounce_jumper", "targetname");
	actiOG = getEnt("og_bounce_activator", "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		level.activ notify("room_entered");
		player notify("room_entered");

		player Teleport(trig, jumpOG);
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

		iPrintLnBold("^6>>^7 " + player.name + " Has Chosen The ^6Bounce ^7 Room");

		for(i = 3;i > 0;i--)
		{
			player iPrintLnBold("^6" + i);
			level.activ iPrintLnBold("^6" + i);
			wait 1;
		}

		player iPrintLnBold("^7FIGHT!");
		level.activ iPrintLnBold("^7FIGHT!");

		player freezeControls(0);
		level.activ freezeControls(0);
	}
}

//Secret//
secret_timer(time, difficulty)
{
  self endon("secret_done");
  self endon("disconnect");
  self endon("death");
  self endon("spawned");
  self endon("joined_spectators");
  self endon("room_entered");

  if(isDefined(self.timer)) self.timer destroy();

  self thread timerRemoveWhenDead();
  self thread timerRemoveWhenFinish();
  self thread timerRemoveWhenRoomEntered();

  self.timer = newClientHudElem(self);
  self.timer.foreground = true;
  self.timer.alignX = "right";
  self.timer.alignY = "bottom";
  self.timer.horzAlign = "right";
  self.timer.vertAlign = "bottom";
  self.timer.x = -5;
  self.timer.y = -35;
  self.timer.sort = 5;
  self.timer.fontScale = 1.4;
  self.timer.font = "default";
  self.timer.glowAlpha = 1;
  self.timer.hidewheninmenu = true;
  self.timer.label = &"Time Remaining: ^1&&1";
  self.timer.glowColor= (168, 0, 235);

  self.difficulty = newClientHudElem(self);
  self.difficulty.foreground = true;
  self.difficulty.alignX = "right";
  self.difficulty.alignY = "bottom";
  self.difficulty.horzAlign = "right";
  self.difficulty.vertAlign = "bottom";
  self.difficulty.x = -5;
  self.difficulty.y = -50;
  self.difficulty.sort = 5;
  self.difficulty.fontScale = 1.4;
  self.difficulty.font = "default";
  self.difficulty.glowAlpha = 1;
  self.difficulty.hidewheninmenu = true;
  self.difficulty.label = &"&&1";
  self.difficulty.glowColor= (168, 0, 235);

  self.difficulty setText(difficulty);

  for(i=0;i<time;i++)
  {
    self.timer setValue(time-i);
    wait 1;
  }

  self.timer setValue(0);
  self iPrintLnBold("^6Time's up!");
  self.failed = 1;

  if(self.team != "axis")
  {
	iPrintLn("^6" + self.name + " ^7has ^1FAILED ^7the " + difficulty + "^7!");
	self suicide();
  }
  else
  {
	og = getEnt("og_stage2", "targetname");
	self takeAllWeapons();
	self giveWeapon("tomahawk_mp");
	self switchToWeapon("tomahawk_mp");
	self setPlayerAngles(og.angles);
	self setOrigin(og.origin);
	level.ActiSecretBlock solid();
	iPrintLn("^6" + self.name + " ^7has ^1FAILED ^7the ^7Activator ^6Secret^7!");
	self notify("secret_done");
  }

  if(isDefined(self.timer))
  {
    wait 0.1;
    self.timer = 0;
    self.timer destroy();
  }
}

timerRemoveWhenDead()
{
  self endon("secret_done");
  self waittill("death");
  if(isDefined(self.timer)) self.timer destroy();
  if(isDefined(self.difficulty)) self.difficulty destroy();
  if(isDefined(self.completed) && self.completed == 1)
  {
	self.completed delete();
	self.failed delete();
	return;
  }

  if(!isDefined(self.failed) || self.failed != 1)
	iPrintLn("^6" + self.name + " ^7has ^1DIED ^7in ^6Secret^7!");
}

timerRemoveWhenFinish()
{
  self waittill("secret_done");
  if(isDefined(self.timer)) self.timer destroy();
  if(isDefined(self.difficulty)) self.difficulty destroy();
}

timerRemoveWhenRoomEntered()
{
  self waittill("room_entered");
  if(isDefined(self.timer)) self.timer destroy();
  if(isDefined(self.difficulty)) self.difficulty destroy();
}

secret_checkpoints(numberOfPos)
{
	trig = getEnt("trig_hardSec" + numberofpos, "targetname");

	while(true)
	{
		trig waittill("trigger", player);

		if(player.secretPos < numberOfPos + 1)
		{
			player.secretPos = numberofpos + 1;
			player iPrintLn("^7Position ^6[^7"+(numberofpos+1)+"^6] ^7has been saved.");
		}
	}
}

HardSecretFall(num)
{
	trig = getEnt("trig_hardSecretFall" + num, "targetname");

	while(true)
	{
		trig waittill("trigger", player);

		if(isDefined(player.secretPos))
		{
			pos = player.secretPos;
			og = getEnt("og_hardSecret"+pos, "targetname");

			player iPrintLn("^7Position ^6[^7"+pos+"^6] ^7has been loaded.");
			player Teleport(trig, og);
			wait 1;
		}
		else
			player suicide();
	}
}

SecretSetup()
{
	thread SecretStep1();
	for (i=1;i<=4;i++) thread secret_checkpoints(i);
	for	(i=1;i<9;i++) thread HardSecretFall(i);

	thread SecretEnd("Easy");
	thread SecretEnd("Hard");
}

SecretStep1()
{
	trig = getEnt("dmg_step1", "targetname");

	trig waittill("trigger", player);
	iPrintLn("^7Secret ^61^7/2");
	trig delete();
	thread SecretStep2();
}

SecretStep2()
{
	level.SecretSign show();
	trig = getEnt("dmg_step2", "targetname");

	trig waittill("trigger", player);
	iPrintLn("^7Secret ^62^7/2");
	trig delete();
	thread OpenSecret();
}

OpenSecret()
{
	brush = getEnt("brush_secret", "targetname");
	brush notSolid();
	iPrintLn("^7Secret ^6Open^7!");
	thread SecretTeleport();
}

SecretTeleport()
{
	trig = getEnt("trig_enterSecret", "targetname");
	trig setHintString("^7Press [^6&&1^7] to Enter ^6Secret^7!");
	og = getEnt("og_secretSelection", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
		player giveWeapon("glen_mp");
		player giveMaxAmmo("glen_mp");
		player switchToWeapon("glen_mp");
	}
}

SecretEnd(name)
{
	trig = getEnt("trig_secretEnd_"+name, "targetname");
	trig setHintString("^7Press [^6&&1^7] to finish secret!");
	og = getEnt("og_secretEnd_"+name, "targetname");

	while(1)
	{
		trig waittill("trigger", player);

		player notify("secret_done");
		player Teleport(trig, og);
		if(name == "Easy")
		{
			player braxi\_rank::giveRankXP("", 250);
			colour = "^2";
		}
		else
		{
			player braxi\_rank::giveRankXP("", 500);
			colour = "^1";
		}

		iPrintLn("^6" + player.name + " ^7has ^2COMPLETED ^7the " + colour + name + " ^6Secret^7!");
	}
}

ActivatorSecretSetup()
{
	for(i=1;i<=3;i++)
	{
		thread ActivatorSecretFall(i);
		if(i == 3) break;
		thread ActivatorSecretTele(i);
	}
	thread ActivatorSecret();
	thread ActivatorSecretEnd();
}

ActivatorSecret()
{
	trig = getEnt("trig_activatorSecret_open", "targetname");

	trig waittill("trigger", player);
	iPrintLn("^1Activator ^6Secret ^7is open^6!");
	level.ActiSecretBlock notSolid();
	thread ActivatorSecretTeleport();
}

ActivatorSecretTeleport()
{
	trig = getEnt("trig_activatorSecret_tele", "targetname");
	og = getEnt("og_activatorSecret_floor1", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
		player takeAllWeapons();
		player giveWeapon("glen_mp");
		player giveMaxAmmo("glen_mp");
		player switchToWeapon("glen_mp");
		player secret_timer(60, "^7Activator Secret");
	}
}

ActivatorSecretFall(num)
{
	trig = getEnt("trig_activatorSecret_fall" + num, "targetname");
	og = getEnt("og_activatorSecret_floor" + num, "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

ActivatorSecretTele(num)
{
	trig = getEnt("trig_activatorSecret_floor" + num, "targetname");
	og = getEnt("og_activatorSecret_floor" + (num+1), "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
	}
}

ActivatorSecretEnd()
{
	trig = getEnt("trig_activatorSecret_end", "targetname");
	trig setHintString("^7Press [^6&&1^7] to ^6Finish ^7the ^6Secret^7!");
	og = getEnt("og_stage2", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player Teleport(trig, og);
		player braxi\_rank::giveRankXP("", 500);
		level.ActiSecretBlock solid();
		player notify("secret_done");
		iPrintLn("^6" + player.name + " ^7has completed the ^1Activator ^6Secret^7!");
		player iPrintLnBold("^6Activator Secret Complete!");
	}
}

Elevator()
{
	trig = getEnt("trig_elevator", "targetname");
	og = getEnt("og_secretEnd_Easy", "targetname");

	while(1)
	{
		trig waittill("trigger", player);
		player braxi\_rank::giveRankXP("", 500);
		iPrintLn("^6" + player.name + " ^7has found an ^3Elevator");
		player Teleport(trig, og);
	}
}

Collectables(num)
{
	trig = getEnt("trig_collectable" + num, "targetname");
	brush = getEnt("collectable" + num, "targetname");
	thread SpinLetter(brush);

	trig waittill("trigger", player);
	player braxi\_rank::giveRankXP("", 50);
	player iPrintLn("^6Collectable ^7found. ^650xp ^7awarded!");

	trig delete();
	brush delete();
}

SetupCollectables()
{
	for(i=1;i<17;i++) thread Collectables(i);
	thread ActiCollectable();
}

ActiCollectable()
{
	trig = getEnt("trig_actiCollectable", "targetname");
	item = getEnt("actiCollectable", "targetname");

	trig waittill("trigger", player);
	player braxi\_rank::giveRankXP("", 500);
	iPrintLn("^1Activator ^7found a ^6500xp ^7Collectable^6!");
	trig delete();
	item delete();
}

MusicBox()
{
    trig = getEnt("trig_musicBox","targetname");
    trig setHintString("^7Press [^6&&1^7] to select ^6Music^7!");
    trig waittill("trigger", player);
	player braxi\_rank::giveRankXP("", 50);
    trig delete();

    player freezeControls(1);
    player musicMenu();
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
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 879;
    self.hud_music[i] setShader( "black", 320, 160 );
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 167, 204, 0.6, "left", "top", 1.4 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "white", 306, 20 );
    self.hud_music[i].color=(1,0,0);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("^6Purple World^7!");
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
