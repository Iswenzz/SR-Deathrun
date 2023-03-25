/*
_______________________________________________
  /   /  ___/    __ /   ___/ \ \     / /  ___  \
 /   /  /__     /___   /__  / \ \   / /  /  /  /
/   /  ___/  __    /  ___/ /   \ \ / /  /  /  /
  _/  /__   /_/   /	 /__  /     \ \ /  /__/  /
___\____/\_______/\____/_/	     \_/________/

Credit to VC'Blade for creating the music menu and the scripting part of it c;

[PERMISSION]
Ask for what you want to use(via steam), or at least give me or Blade credit for it, ty.

*/
main()
{
	maps\mp\_load::main();
	maps\mp\_nukebase_secret::main();
	maps\mp\_misterybox::main();

	precachemodel("com_barrel_piece");
	precachemodel("com_barrel_piece2");
	precachemodel("vehicle_80s_hatch1_brn_destroyed");
	precachemodel("playermodel_terminator");
	precachemodel("weapon_remington700");
	PreCacheShellShock("radiation_high");
	precacheshader("nk_song1");
	precacheshader("nk_song2");
	precacheshader("nk_song3");

	level.barrelexp = loadfx("props/barrelExp");
	level.shotgun = loadfx("muzzleflashes/winch_flash_wv");
	level.mortareffect = loadfx ("explosions/artilleryExp_dirt_brown");
	level.radsmoke = loadfx("nukebase/radsmoke");
	level.rpgtrail = loadfx("smoke/smoke_geotrail_rpg");
	level.explosion = loadfx("explosions/default_explosion");
	level.nadefx = loadfx("explosions/grenadeexp_default");
	level.geofx = loadfx("custome/geotrail_line");
	level.endfx1 = loadfx("nukebase/endfx1");
	level.endfx2 = loadfx("nukebase/endfx2");
	level.endfx2_2 = loadfx("nukebase/endfx2_2");
	
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	game["music_menu"] = "music_menu";
	precachemenu(game["music_menu"]);
	
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	for(i=1;i<19;i++)
		addTriggerToList("trap"+i+"trig");

	thread teleporter();
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
	thread mapfinished();

	level.music=[];
	level.music["img"][0]="nk_song1";
	level.music["name"][0]="Linkin Park - Burn It Down";
	level.music["img"][1]="nk_song3";
	level.music["name"][1]="Boulevard of Broken Dreams";
	level.music["img"][2]="nk_song1";
	level.music["name"][2]="Linkin Park - What I've Done";
	level.music["img"][3]="nk_song2";
	level.music["name"][3]="Skillet - Hero";
	level.music["img"][4]="nk_song2";
	level.music["name"][4]="Skillet - Whispers in the Dark";

	level waittill("round_started");

	//VisionSetNaked("toxic",1);
	thread startele();
	thread stage2door();
	thread startdoor();
	thread musicmenu();
	thread sniperoom();
	thread bounceroom();
	thread kniferoom();
	thread pistolroom();
	thread speedrunroom();
	thread lilsec();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

lilsec()
{
	trig = getentarray("lilsec","targetname");
	for(i=0;i<trig.size;i++)
	{
		trig[i] thread dodis();
	}
}

dodis(num)
{
	x = randomint(50);
	if(x >= 25)
	{
		self sethintstring("What Does This Button Do?");
		self waittill("trigger",player);
		self delete();
		player suicide();
		player iprintlnbold("^1You Just Got A Suicide!");
	}
	if(x < 25)
	{
		self sethintstring("What Does This Button Do?");
		self waittill("trigger",player);
		self delete();
		player braxi\_mod::giveLife();
		player iprintlnbold("^2You Just Got A Life");
	}
}

mapfinished()
{
	level waittill("game over");
	thread mapfinishedhud(0,-100,"--- TESTERS ---\n-- Blade --\n-- Sam --\n-- Milky --");
	wait 1;
	thread mapended();
	thread mapfinishedhud(0,0,"--- Big Thanks To ---\n--- Blade ---");
	wait 1;
	thread mapfinishedhud(0,-50,"--- Map By VC' Legend ---\n--- Thanks For Playing ---");
}

mapended()
{
	logo = getent("vclogo","targetname");
	trig = getent("tr","targetname");
	fxorg = spawn("script_model",(-960, -1320, 104));
	fxorg setmodel("tag_origin");
	fxorg enablelinkto();
	fxorg linkto(trig);
	wait .1;
	PlayFXOnTag( level.geofx, fxorg, "tag_origin" );
	wait .1;
	logo thread rot();
	thread anotherfx();
	for(;;)
	{
		trig rotateroll(360,4.1);
		wait 4.1;
	}
}

anotherfx()
{
	fxorg2 = getentarray("differenta","targetname");
	for(i=0;i<fxorg2.size;i++)
		PlayFX(level.endfx2_2,fxorg2[i].origin);
	fxorg1 = getentarray("normala","targetname");
	for(j=0;j<fxorg1.size;j++)
		PlayFX(level.endfx2,fxorg1[j].origin);
	fxorg3 = getentarray("the2ndfx","targetname");
	for(k=0;k<fxorg3.size;k++)
		PlayFX(level.endfx1,fxorg3[k].origin);
}

mapfinishedhud(x,y,text)
{
	r = RandomFloatRange(0.0,1.0);
	g = RandomFloatRange(0.0,1.0);
	b = RandomFloatRange(0.0,1.0);
	finishtxt = NewHudElem();
	finishtxt.alignX = "left";
	finishtxt.alignY = "middle";
	finishtxt.horzalign = "left";
	finishtxt.vertalign = "middle";
	finishtxt.alpha = 0;
	finishtxt.x = x;
	finishtxt.y = y;
	finishtxt.font = "default";
	finishtxt.fontscale = 2;
	finishtxt.glowalpha = 1;
	finishtxt.glowcolor = (r,g,b);
	finishtxt settext(text);
	finishtxt fadeovertime(1);
	finishtxt.alpha = 1;
	wait 3;
	finishtxt fadeovertime(1);
	finishtxt.alpha = 0;
	wait 1;
	finishtxt destroy();
}

startele()
{
	elevator = getent("elevator","targetname");
	trig = getent("eletrig","targetname");
	trig waittill("trigger",player);
	trig delete();
	orgpos = elevator.origin;
	wait 3;
	for(;;)
	{
		elevator movez(912,3);
		elevator waittill("movedone");
		wait 5;
		elevator moveto(orgpos,3);
		elevator waittill("movedone");
		wait 5;
	}
}

startdoor()
{
	door = getent("startdoor","targetname");
	wait 3;
	door movez(112,2);
}

musicmenu()//blade
{
	trig=getent("musicmenutrig","targetname");
	trig sethintstring("Press ^5&&1 ^7to select a ^5Song");

	trig waittill("trigger",player);
	trig delete();

	level.song_select = 0;

	player setclientdvars("music_img",level.music["img"][0],"music_name",level.music["name"][0]);

	player thread onmenuresponse();
	player openmenu("music_menu");
}

onmenuresponse()//blade
{
	self endon("disconnect");
	for(;;)
	{
		self waittill("menuresponse",menu,response);

		if(menu == "music_menu")
		{
			if(response == "play_music")
				thread playmusic(level.song_select);

			if(response == "play_prev")
				thread changesong("prev");

			if(response == "play_next")
				thread changesong("next");
		}
	}
}

changesong(what)//blade
{
	if(what == "prev")
	{
		level.song_select--;
		if(level.song_select<0)
			level.song_select=level.music["name"].size-1;
	}
	else if(what == "next")
	{
		level.song_select++;
		if(level.song_select>=5)
			level.song_select=0;
	}
	self setclientdvars("music_img",level.music["img"][level.song_select],"music_name",level.music["name"][level.song_select]);
}

playmusic(song)//blade
{
	self closeingamemenu();
	self closemenu();

	ambientstop();
	musicstop();

	switch(song)
	{
		case 0:	ambientplay("music1");	break;
		case 1:	ambientplay("music2");	break;
		case 2:	ambientplay("music3");	break;
		case 3:	ambientplay("music4");	break;
		case 4:	ambientplay("music5");	break;
	}

	thread musichud(song);
}

musichud(song)//blade
{
	level.nowplaying = newHudElem();
	level.nowplaying.x = 0;
	level.nowplaying.y = -5;
	level.nowplaying.horzAlign = "center";	
	level.nowplaying.vertAlign = "bottom";
	level.nowplaying.alignX = "center";
	level.nowplaying.alignY = "bottom";
	level.nowplaying.archived = false;
	level.nowplaying.alpha = 0;
	level.nowplaying.fontScale = 1.5;
	level.nowplaying.hidewheninmenu = true;
	level.nowplaying.glowAlpha = 1;
	level.nowplaying.label = &"Now playing: ^5";
	level.nowplaying settext(level.music["name"][level.song_select]);

	if(isdefined(level.randomcolor))
		level.nowplaying.glowcolor=level.randomcolor;
	else 
		level.nowplaying.glowcolor = (1,1,0);

	level.nowplaying fadeovertime(1);
	level.nowplaying.alpha = 1;
	wait 15;
	level.nowplaying fadeovertime(1);
	level.nowplaying.alpha = 0;
}

stage2door()
{
	door1 = getent("stage2door1","targetname");
	door2 = getent("stage2door2","targetname");
	trig = getent("stage2doorstrig","targetname");
	trig waittill("trigger",player);
	trig delete();
	door1 movex(48,1);
	door2 movex(-48,1);
}

teleporter()
{       
 	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}


trap1()
{
	trig = getent("trap1trig","targetname");
	obj = getent("trap1","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	obj notsolid();
	wait randomint(3)+1;
	obj solid();
}

trap2()
{
	trig = getent("trap2trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	barrels = [];
	c4m = [];
	clips = [];
	for(j=0;j<3;j++)
	{
		barrels[j] = getent("barrels"+j,"targetname");
		c4m[j] = getent("c4m"+j,"targetname");
		clips[j] = getent("bclips"+j,"targetname");
	}
	trig waittill("trigger",player);
	trig delete();
	rep = randomint(3)+1;
	for(i=0;i<rep;i++)
	{
		x = randomint(3);
		if(isdefined(c4m[x]))
		{
			barrels[x] playsound("explo_metal_rand");
			barrels[x].angles = (0,0,0);
			PlayFX(level.barrelexp,barrels[x].origin);
			RadiusDamage( barrels[x].origin, 130, 99, 50);
			Earthquake( 0.3, 3, barrels[x].origin, 200 );	
			if (randomint(2) == 0)
				barrels[x] setModel("com_barrel_piece");
			else
				barrels[x] setModel("com_barrel_piece2");
			barrels[x].origin += (0,0,-22);
			c4m[x] delete();
			clips[x] delete();
		}
		wait .1;
	}
}

trap3()
{
	trig = getent("trap3trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	obj = getent("trap3","targetname");
	killtrig = getent("trap3killtrig","targetname");
	trig waittill("trigger",player);
	trig delete();
	killtrig enablelinkto();
	killtrig linkto(obj);
	obj movez(64,1);
	wait 3;
	obj movez(-64,3);
}

trap4()
{
	shotgunm = [];
	killtrig = [];
	for(i=0;i<3;i++)
	{
		shotgunm[i] = getent("shotgunm"+i,"targetname");
		killtrig[i] = getent("killtrigt4"+i,"targetname");
		killtrig[i] maps\mp\_utility::triggerOff();
		killtrig[i] thread killplayer();
	}
	trig = getent("trap4trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	rep = randomint(3)+1;
	for(j=0;j<rep;j++)
	{
		x = randomint(3);
		PlayFXOnTag( level.shotgun, shotgunm[x], "tag_flash" );
		shotgunm[x] playsound("weap_winch1200_fire_npc");
		killtrig[x] maps\mp\_utility::triggerOn();
		wait 0.5;
		killtrig[x] maps\mp\_utility::triggerOff();
		wait randomint(2)+1;
	}
	for(d=0;d<killtrig.size;d++)
		killtrig[d] delete();
}

killplayer()
{
	while(isdefined(self))
	{
		self waittill("trigger",player);
		player suicide();
		wait .01;
	}
}

trap5()
{
	plat1 = getent("t5p1","targetname");
	plat2 = getent("t5p2","targetname");
	trig = getent("trap5trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	if(randomint(2) == 0)
		plat1 delete();
	else
		plat2 delete();
}

trap6()
{
	pushers = [];
	killtrigs = [];
	trig = getent("trap6trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	for(d=0;d<4;d++)
	{
		pushers[d] = getent("pushers"+d,"targetname");
		killtrigs[d] = getent("ktt6"+d,"targetname");
		killtrigs[d] enablelinkto();
		killtrigs[d] linkto(pushers[d]);
	}
	trig waittill("trigger",player);
	trig delete();
	for(i=1;i<=3;i++)
	{
	x = randomint(4);
	time = RandomFloatRange(0.1,2.0);
	pushers[x] thread domove(time);
	wait time+1;
	}
}

domove(time)
{
	orgpos = self.origin;
	self moveZ(-128,time);
	wait time+1;
	self moveto(orgpos,time);
}

trap7()
{
	trig = getent("trap7trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	plat = getent("trap7plat","targetname");
	frezetrig = getent("frezetrig","targetname");
	opendoor1 = getent("outside1","targetname");
	opendoor2 = getent("outside2","targetname");
	trig waittill("trigger",player);
	trig delete();
	bombs = [];
	for(i=0;i<=5;i++)
	{
		bombs[i] = getEnt("bomb"+i,"targetname");
		bombs[i] hide();
	}
	thread onuse();
	frezetrig enablelinkto();
	frezetrig linkto(plat);
	wait randomint(3);
	plat movez(464,5);
	wait 3;
	opendoor1 movey(-96,1);
	opendoor2 movey(96,1);                         
	wait 1;
	frezetrig delete();
	wait randomint(3)+1;
	for(i=0;i<=4;i++)
	{
		x = randomint(6);
		if(isdefined(bombs[x]))
		{
			bombs[x] show();
			time = RandomFloatRange(0.1,1.0);
			bombs[x] moveZ(-470,time);
			wait time;
			playfx(level.mortareffect,bombs[x].origin);
			bombs[x] playsound("artillery_impact");
			RadiusDamage( bombs[x].origin, 500, 200, 100);
			bombs[x] delete();
		}
		else
			i--;

		wait .25;
	}
}

onuse()
{
	frezetrig = getent("frezetrig","targetname");
	while(isdefined(frezetrig))
	{
		frezetrig waittill("trigger",player);
		player freezeControls(true);
		player thread unfz();
		wait .1;
	}
}

unfz()
{
	plat = getent("trap7plat","targetname");
	plat waittill("movedone");
	self freezeControls(false);
}

trap8()
{
	roter = getent("trap8","targetname");
	trig = getent("trap8trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	for(;;)
	{
		roter rotateyaw(180,2);
		wait 2;
	}
}

trap9()
{
	obj = getent("trap9","targetname");
	trig = getent("trap9trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	obj notsolid();
	wait randomint(5);
	obj solid();
}

trap10()
{
	actiobj = getent("actiobj","targetname");
	trig = getent("trap10trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	doors1 = getent("doors1","targetname");
	doors2 = getent("doors2","targetname");
	radtrigger = getent("radtrigger","targetname");
	radtrigger maps\mp\_utility::triggerOff();
	trig waittill("trigger",player);
	trig delete();
	actiobj rotateyaw(180,1);
	doors1 movex(32,1);
	doors2 movex(-32,1);
	pos = [];
	pos[0] = (-1312, 5920, 776);
	pos[1] = (-1312, 6112, 776);
	pos[2] = (-1120, 6112, 776);
	pos[3] = (-1120, 5920, 776);
	for(i=0;i<20;i++)
	{
		if(i == 6)
		{
			radtrigger maps\mp\_utility::triggerOn();
			radtrigger thread dodmg();
		}
		x = randomint(4);
		PlayFX(level.radsmoke,pos[x]);
		wait RandomFloatRange(0.1,1.0);
	}
	radtrigger delete();
	wait 5;
	doors1 movex(-32,1);
	doors2 movex(32,1);
}

dodmg()
{
	while(isdefined(self))
	{
		self waittill("trigger",player);
		if(!player.raded)
		{
			player.raded = true;
			player ShellShock( "radiation_high", 4 );
			player thread willdie();
		}
		wait .1;
	}
}

willdie()
{
	while(self.sessionstat == "playing")
	{
		self finishPlayerDamage(self, self, 20, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
		wait randomint(5);
	}
}

trap11()
{
	rpg_rocket = getent("rpgrocket","targetname");
	trig = getent("trap11trig","targetname");
	position = getent("rpgmovetopos","targetname");
	door = getent("trap11door","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger", player);
	trig delete();
	door rotateyaw(-110,1);
	wait 1;
	rpg_rocket moveto(position.origin, 0.5);
	rpg_rocket PlayLoopSound( "weap_rpg_loop" );
	PlayFXOnTag ( level.rpgtrail, rpg_rocket, "tag_clip" );
	wait 0.5;
	PlayFX(level.explosion,rpg_rocket.origin);
	Earthquake( 0.6, 2, position.origin, 850 );
	rpg_rocket delete();
	RadiusDamage( position.origin, 500, 200, 80 );
	position playsound("grenade_explode_layer");
}

trap12()
{
	cars = [];
	for(i=0;i<=1;i++)
	{
		cars[i] = getent("trap12car"+i,"targetname");
	}
	trig = getent("trap12trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(3);
	switch(x)
	{
		case 0:
			cars[0] setModel("vehicle_80s_hatch1_brn_destroyed");
			cars[0] playsound("grenade_explode_layer");
			PlayFX(level.explosion,cars[0].origin);
			Earthquake( 0.6, 2, cars[0].origin, 850 );
			RadiusDamage( cars[0].origin, 500, 100, 80 );
			break;

		case 1:
			cars[1] setModel("vehicle_80s_hatch1_brn_destroyed");
			cars[1] playsound("grenade_explode_layer");
			PlayFX(level.explosion,cars[1].origin);
			Earthquake( 0.6, 2, cars[1].origin, 850 );
			RadiusDamage( cars[1].origin, 500, 100, 80 );
			break;

		case 2:
			for(i=0;i<2;i++)
			{
				cars[i] setModel("vehicle_80s_hatch1_brn_destroyed");
				cars[i] playsound("grenade_explode_layer");
				PlayFX(level.explosion,cars[i].origin);
				Earthquake( 0.6, 2, cars[i].origin, 850 );
				RadiusDamage( cars[i].origin, 500, 100, 80 );
				wait randomint(5)+1;
			}
			break;
	}
}

trap13()
{
	flor = getent("trap13flor","targetname");
	trig = getent("trap13trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	flor movez(-112,1);
}

trap14()
{
	obj = getent("trap14obj","targetname");
	trig = getent("trap14trig","targetname");
	killtrig = getent("trap14killtrig","targetname");
	killtrig maps\mp\_utility::triggerOff();
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	killtrig maps\mp\_utility::triggerOn();
	killtrig enablelinkto();
	killtrig linkto(obj);
	obj movez(-64,5);
	wait 7;
	killtrig delete();
	obj movez(64,0.5);
}

trap15()
{
	pushers = [];
	for(i=0;i<3;i++)
	{
		pushers[i] = getent("trap15pusher"+i,"targetname");
	}
	trig = getent("trap15trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	repeat = randomint(4)+1;
	for(t=0;t<repeat;t++)
	{
		x = randomint(3);
		time = RandomFloatRange(0.1,2.0);
		pushers[x] movey(32,time);
		wait time+(time/2);
		pushers[x] movey(-32,time);
		wait time+(time/2);
	}
}

trap16()
{
	granades = [];
	spot = [];
	for(i=0;i<5;i++)
	{
		granades[i] = getent("granades_"+i,"targetname");
	}
	for(s=0;s<3;s++)
	{
		spot[s] = getent("nadespot_"+s,"targetname");
	}
	trig = getent("trap16trig","targetname");
	canthrow = randomint(5)+1;
	trig sethintstring("Press [^1&&1^7] To Throw Granades");
	for(a=0;a<canthrow;a++)
	{
	trig waittill("trigger",player);
	x = randomint(3);
	time = RandomFloatRange(1.0,1.5);
	granades[a] moveto(spot[x].origin,time);
	wait time;
	PlayFX(level.nadefx,granades[a].origin);
	Earthquake( 0.6, 2, granades[a].origin, 500 );
	RadiusDamage( granades[a].origin, 250, 100, 80 );
	granades[a] playsound("grenade_explode_layer");
	granades[a] delete();
	}
	trig delete();
}

trap17()
{
	cars = [];
	killtrig = [];
	pos = [];
	clip = [];
	for(i=0;i<3;i++)
	{
		cars[i] = getEnt("trap17car_"+i,"targetname");
		killtrig[i] = getent("trap17killtrig_"+i,"targetname");
		pos[i] = getent("crash_"+i,"targetname");
		clip[i] = getent("clipercar_"+i,"targetname");
	}
	trig = getent("trap17trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();

		x = randomint(2);
		time = RandomFloatRange(1.0,2.0);
		killtrig[x] enablelinkto();
		killtrig[x] linkto(cars[x]);
		clip[x] enablelinkto();
		clip[x] linkto(cars[x]);
		clip[x] notsolid();
		cars[x] movex(896,time);
		wait time;
		cars[x] moveto(pos[x].origin,time/2);
		cars[x] rotateto(pos[x].angles,time/2);
		wait time/2;
		PlayFX(level.explosion,cars[x].origin);
		cars[x] playsound("grenade_explode_layer");
		RadiusDamage( cars[x].origin, 250, 100, 100 );
		clip[x] solid();
		killtrig[x] delete();
}

trap18()
{
	obj = [];
	for(i=0;i<2;i++)
	{
		obj[i] = getent("trap18_"+i,"targetname");
	}
	trig = getent("trap18trig","targetname");
	trig sethintstring("Press [^1&&1^7] To Activate");
	trig waittill("trigger",player);
	trig delete();
	repeat = randomint(3)+1;
	for(d=0;d<repeat;d++)
	{
		x = randomint(2);
		time = RandomFloatRange(2.0,4.0);

		if(randomint(2) == 1)
			obj[x] rotatepitch(360,time);
		else
			obj[x] rotatepitch(-360,time);

		wait time*1.5;
	}
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniper", "targetname");
    jump = getEnt( "jump_snipe", "targetname" );
    acti = getEnt( "acti_snipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.bounce_trig delete();
		level.knife_trig delete();
		level.speedrun_trig delete();
		level.pistol_trig delete();
		level.firstenter=false;
		}
		thread roomhud(0,-150,"--- Sniper Room ---",2);
		thread roomhud(0,-100,"^1VS",1.5);
		thread roomhud(100,-100,level.activ.name,1.5);
		thread roomhud(-100,-100,player.name,1.5);
		player freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
		player.health = 100;
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ.health = 100;
		level.activ freezeControls(true);
		wait 4;
		player freezeControls(false);
		level.activ freezeControls(false);
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon("m40a3_mp");
		player switchToWeapon( "remington700_mp" );
		player givemaxammo("remington700_mp");
		player givemaxammo("m40a3_mp");
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveWeapon("m40a3_mp");
        level.activ SwitchToWeapon( "remington700_mp" );
        level.activ givemaxammo("remington700_mp");
        level.activ givemaxammo("m40a3_mp");

        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

bounceroom()
{
    level.bounce_trig = getEnt( "bounce", "targetname");
    jump = getEnt( "jump_bounce", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );

    
    while(1)
    {
        level.bounce_trig waittill( "trigger", player );
        if( !isDefined( level.bounce_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.knife_trig delete();
		level.pistol_trig delete();
		level.speedrun_trig delete();
		level.firstenter=false;

		thread bounceendsniper();
		thread bounceroomfailtrig();
		}
		thread roomhud(0,-150,"--- Bounce Room ---",2);
		thread roomhud(0,-100,"^1VS",1.5);
		thread roomhud(100,-100,level.activ.name,1.5);
		thread roomhud(-100,-100,player.name,1.5);
		player freezeControls(true);
		player.health = 100;
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ.health = 100;
		level.activ freezeControls(true);
		wait 4;
		player freezeControls(false);
		level.activ freezeControls(false);
        player GiveWeapon( "knife_mp" );
		player switchToWeapon( "knife_mp" );
		level.activ GiveWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );

        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

bounceendsniper()
{
	trig = getent("bes","targetname");
	snipermodel = spawn("script_model",(trig.origin+(0,0,50)));
	snipermodel setmodel("weapon_remington700");
	snipermodel thread rot();
	for(;;)
	{
		trig waittill("trigger",player);
		player GiveWeapon("remington700_mp");
		player switchToWeapon("remington700_mp");
		player givemaxammo("remington700_mp");
		wait .1;
	}
}

rot()
{
	for(;;)
	{
		self rotateyaw(360,3);
		wait 3;
	}
}

bounceroomfailtrig()
{
	jump = getEnt( "jump_bounce", "targetname" );
    acti = getEnt( "acti_bounce", "targetname" );
	trig = getent("bounceroomfailtrig","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(player == player)
		{
			player setOrigin(jump.origin);
			player setPlayerangles(jump.angles);
		}
		if(player == level.activ)
		{
			level.activ setOrigin(acti.origin);
			level.activ setPlayerangles(acti.angles);
		}
		wait .1;
	}
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jump_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );

    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.pistol_trig delete();
		level.bounce_trig delete();
		level.snipe_trig delete();
		level.speedrun_trig delete();
		level.firstenter=false;
		}
		thread roomhud(0,-150,"--- Knife Room ---",2);
		thread roomhud(0,-100,"^1VS",1.5);
		thread roomhud(100,-100,level.activ.name,1.5);
		thread roomhud(-100,-100,player.name,1.5);
		player freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ freezeControls(true);
        player GiveWeapon( "knife_mp" );
		player switchToWeapon( "knife_mp" );
		level.activ GiveWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        wait 4;
     	player freezeControls(false);
     	level.activ freezeControls(false);

        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

pistolroom()
{
    level.pistol_trig = getEnt( "pistol", "targetname");
    jump = getEnt( "jump_pistol", "targetname" );
    acti = getEnt( "acti_pistol", "targetname" );

    
    while(1)
    {
        level.pistol_trig waittill( "trigger", player );
        if( !isDefined( level.pistol_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.snipe_trig delete();
		level.bounce_trig delete();
		level.knife_trig delete();
		level.speedrun_trig delete();
		level.firstenter=false;
		}
		thread roomhud(0,-150,"--- Pistol Room ---",2);
		thread roomhud(0,-100,"^1VS",1.5);
		thread roomhud(100,-100,level.activ.name,1.5);
		thread roomhud(-100,-100,player.name,1.5);
		player freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
		player.health = 100;
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ.health = 100;
		level.activ freezeControls(true);
		wait 4;
		player freezeControls(false);
		level.activ freezeControls(false);
		player thread randompistol();
		level.activ thread randompistol();

        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

randompistol()
{
	x = randomint(4);
	if(x == 0)
	{
		self GiveWeapon("deserteagle_mp");
		self givemaxammo("deserteagle_mp");
		self switchToWeapon("deserteagle_mp");
	}
	if(x == 1)
	{
		self GiveWeapon("beretta_mp");
		self givemaxammo("beretta_mp");
		self switchToWeapon("beretta_mp");
	}
	if(x == 2)
	{
		self GiveWeapon("colt45_mp");
		self givemaxammo("colt45_mp");
		self switchToWeapon("colt45_mp");
	}
	if(x == 3)
	{
		self GiveWeapon("colt44_mp");
		self givemaxammo("colt44_mp");
		self switchToWeapon("colt44_mp");
	}
}

speedrunroom()
{
	level.speedrun_trig = getEnt( "speedrun", "targetname");
    jump = getEnt( "jump_speedrun", "targetname" );
    acti = getEnt( "acti_speedrun", "targetname" );

    
    while(1)
    {
        level.speedrun_trig waittill( "trigger", player );
        level.jumperf = player;
        if( !isDefined( level.speedrun_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.pistol_trig delete();
		level.snipe_trig delete();
		level.bounce_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		thread speedrun_actif();
		thread speedrun_jumperf();
		}
		thread roomhud(0,-150,"--- SpeedRun Room ---",2);
		thread roomhud(0,-100,"^1VS",1.5);
		thread roomhud(100,-100,level.activ.name,1.5);
		thread roomhud(-100,-100,player.name,1.5);
		player freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon("knife_mp");
		player switchToWeapon("knife_mp");
		player.health = 100;
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ.health = 100;
		level.activ freezeControls(true);
		level.activ GiveWeapon("knife_mp");
		level.activ switchToWeapon("knife_mp");
		wait 4;
		player freezeControls(false);
		level.activ freezeControls(false);

        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

speedrun_actif()
{
	trig = getent("speedrun_actif","targetname");
	org1 = getent("playerf","targetname");
	org2 = getent("actif","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		level.jumperf setOrigin(org1.origin);
		level.jumperf setPlayerangles(org1.angles); 
		level.activ setOrigin(org2.origin);
		level.activ setPlayerangles(org2.angles);
		level.jumperf freezeControls(true);
	}
}

speedrun_jumperf()
{
	trig = getent("speedrun_jumperf","targetname");
	org1 = getent("playerf","targetname");
	org2 = getent("actif","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		level.jumperf setOrigin(org1.origin);
		level.jumperf setPlayerangles(org1.angles); 
		level.activ setOrigin(org2.origin);
		level.activ setPlayerangles(org2.angles);
		level.activ freezeControls(true);
	}
}

roomhud(x,y,text,scale)
{
	roomhud = NewHudElem();
	roomhud.alignX = "center";
	roomhud.alignY = "middle";
	roomhud.horzalign = "center";
	roomhud.vertalign = "middle";
	roomhud.alpha = 1;
	roomhud.x = x;
	roomhud.y = y;
	roomhud.font = "objective";
	roomhud.fontscale = scale;
	roomhud.glowalpha = 1;
	roomhud.glowcolor = (1,0,0);
	roomhud SetPulseFX( 40, 3000, 200 );
	roomhud settext(text);
	wait 3.3;
	roomhud destroy();
}