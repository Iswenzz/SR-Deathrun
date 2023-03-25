// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

/*
  	 _   ________   ___  __        __   
 	| | / / ___( ) / _ )/ /__ ____/ /__ 
 	| |/ / /__ |/ / _  / / _ `/ _  / -_)
 	|___/\___/   /____/_/\_,_/\_,_/\__/ 

 	© VC' Blade

	Website: vistic-clan.net
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

	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");

	level.snow=loadfx("weather/snow_light_mp_bloc");
	level.sam=loadfx("vistic/ww_trail");

	if(!isdefined(level.music))
		level.music=[];

	level.chosen=false;
	level.musicchosen=false;
	level.wipe_glow=(randomint(100)/100,randomint(100)/100,randomint(100)/100);

	level.music[0]["song"]	="Baltic Tiff - Neony";
	level.music[0]["alias"]	="wipe1";
	level.music[1]["song"]	="Era Istrefi - Bonbon";
	level.music[1]["alias"]	="wipe2";
	level.music[2]["song"]	="Stalgia - BDY";
	level.music[2]["alias"]	="wipe3";
	level.music[3]["song"]	="Omar Varela - Stronger";
	level.music[3]["alias"]	="wipe4";

	//stuff
	thread hud();
	thread musicbox();
	thread musiccheck();
    thread logo();

	//traps
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap8_rope();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap13_rotate();
	thread trap14();
	thread trap15();
	thread trap16();
	thread part2_announce();
	thread part3_announce();

	//fx
	thread snow();
    thread secret_trail();

	//endgames
	thread endrooms();

	addTriggerToList("trap1_trig");
	addTriggerToList("trap2_trig");
	addTriggerToList("trap3_trig");
	addTriggerToList("trap4_trig");
	addTriggerToList("trap5_trig");
	addTriggerToList("trap6_trig");
	addTriggerToList("trap7_trig");
	addTriggerToList("trap8_trig");
	addTriggerToList("trap9_trig");
	addTriggerToList("trap10_trig");
	addTriggerToList("trap11_trig");
	addTriggerToList("trap12_trig");
	addTriggerToList("trap13_trig");
	addTriggerToList("trap14_trig");
	addTriggerToList("trap15_trig");
	addTriggerToList("trap16_trig");
}

addTriggerToList(name)
{
   	if(!isdefined(level.trapTriggers))
      level.trapTriggers=[];

   	level.trapTriggers[level.trapTriggers.size]=getent(name,"targetname");
}

snow()
{
	snow1=spawnfx(level.snow,(72,3720,-72));
	snow2=spawnfx(level.snow,(2488,3720,-72));
	snow3=spawnfx(level.snow,(5240,3720,-72));
	snow4=spawnfx(level.snow,(7496,3784,-72));
	snow5=spawnfx(level.snow,(7496,72,-72));
	snow6=spawnfx(level.snow,(2488,8,-72));
	snow7=spawnfx(level.snow,(5240,8,-72));
	snow8=spawnfx(level.snow,(72,8,-72));

	triggerfx(snow1,-15);
	triggerfx(snow2,-15);
	triggerfx(snow3,-15);
	triggerfx(snow4,-15);
	triggerfx(snow5,-15);
	triggerfx(snow6,-15);
	triggerfx(snow7,-15);
	triggerfx(snow8,-15);
}

trap1()
{
	trig=getent("trap1_trig","targetname");
	trapa=getent("trap1a","targetname");
	trapb=getent("trap1b","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa rotateyaw(360,2);
		trapb rotateyaw(-360,2);
		wait 2;
	}
}

trap2()
{
	trig=getent("trap2_trig","targetname");
	trap=getent("trap2","targetname");
	hurt=getent("trap2_hurt","targetname");

	hurt enablelinkto();
	hurt linkto(trap);

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trap rotateyaw(360,2);
		wait 2;
		trap rotateyaw(360,4);
		wait 4;
	}
}

trap3()
{
	trig=getent("trap3_trig","targetname");
	trapa=getent("trap3a","targetname");
	trapb=getent("trap3b","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa movey(-80,1);
		wait 2;
		trapa movey(80,1);
		trapb movey(-80,1);
		wait 2;
		trapb movey(80,1);
	}
}

trap4()
{
	trig=getent("trap4_trig","targetname");
	trap=getent("trap4","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	trap movey(128,3);
	wait 3;
	while(1)
	{
		trap movey(-256,3);
		wait 3;
		trap movey(256,3);
		wait 3;
	}
}

trap5()
{
	trig=getent("trap5_trig","targetname");
	trapa=getent("trap5a","targetname");
	trapb=getent("trap5b","targetname");

	trapa hide();
	trapb hide();

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	vc=randomint(4);
	if(vc!=0||vc!=2)
	{
		trapb delete();
		trapa show();
		trapa movez(70,.5);
		wait .5;
		trapa moveto((3984,2560,-312),4);
		wait 4;
		trapa movez(-70,.5);
		wait .5;
		trapa hide();
		trapa delete();
	}
	else 
	{
		trapa delete();
		trapb show();
		trapb movez(70,.5);
		wait .5;
		trapb moveto((3984,2560,-312),4);
		wait 4;
		trapb movez(-70,.5);
		wait .5;
		trapb hide();
		trapb delete();
	}	
}

trap6()
{
	trig=getent("trap6_trig","targetname");
	trapa=getent("trap6a","targetname");
	trapb=getent("trap6b","targetname");
	trapc=getent("trap6c","targetname");
	trapd=getent("trap6d","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa movez(30,4);
		trapb movez(-30,4);
		trapc movez(45,4);
		trapd movez(-45,4);
		wait 7;
		trapa movez(-30,4);
		trapb movez(30,4);
		trapc movez(-45,4);
		trapd movez(45,4);
		wait 7;
		trapa movez(-30,4);
		trapb movez(30,4);
		trapc movez(-45,4);
		trapd movez(45,4);
		wait 7;
		trapa movez(30,4);
		trapb movez(-30,4);
		trapc movez(45,4);
		trapd movez(-45,4);
		wait 7;
	}
}

trap7()
{
	trig=getent("trap7_trig","targetname");
	trap=getent("trap7","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trap rotatepitch(-45,4);
		wait 6;
		trap rotatepitch(45,4);
		wait 6;
	}
}

trap8()
{
    trig=getent("trap8_trig","targetname");
   
   	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

    if(isdefined(level.ropetim))
        level.ropetim unlink();
}

trap8_rope()
{
    trig = getEnt ("rope_trig", "targetname");

    for(;;)
    {
        trig sethintstring("Press ^1&&1^7 to move over");
        trig waittill("trigger",user);

        user thread rope_move();
        level.ropetim=user;
    }
}

rope_move()
{
	self.rope=spawn("script_model",(5,7,1));
	self.rope.origin=self.origin;
    self.rope.angles=self.angles;
    self disableweapons();
    self linkto(self.rope);
    self.rope moveto((7520,1984,-8), 1, 0.5, 0.5);
    wait 1.2;
    self.rope moveto((7520,1536,-88), 2.5, 1, 1 );
    wait 1.2;
    self.rope moveto((7520,1136,-150), 2.5, 1, 1 );
    wait 1.2;
    self.rope moveto((7520,624,-195), 2.5, 1, 1 );
    wait 2.7;
    self unlink();
    self EnableWeapons();
    level.ropetime=undefined;
}

trap9()
{
	trig=getent("trap9_trig","targetname");
	trap=getent("trap9","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trap rotateyaw(360,2);
		wait 2;
		trap rotateyaw(360,4);
		wait 4;
	}
}

trap10()
{
	trig=getent("trap10_trig","targetname");
	trap=getent("trap10","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trap movez(-144,5);
		wait 5;
		trap movez(144,5);
		wait 8;
	}
}

trap11()
{
	trig=getent("trap11_trig","targetname");
	trapa=getent("trap11a","targetname");
	trapb=getent("trap11b","targetname");
	trapc=getent("trap11c","targetname");
	trapd=getent("trap11d","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	trapd movez(-150,4);
	wait 4;
	trapa moveto((5440,-640,-328),4);
	trapb moveto((5440,-1344,-328),4);
	trapc moveto((4672,-1344,-328),4);
	wait 1;
	trapd delete();
}

trap12()
{
	trig=getent("trap12_trig","targetname");
	trapa=getent("trap12a","targetname");
	trapb=getent("trap12b","targetname");
	trapc=getent("trap12c","targetname");
	trapd=getent("trap12d","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa rotatepitch(360,5);
		wait 4;
		trapb rotatepitch(360,5);
		wait 4;
		trapc rotatepitch(360,5);
		wait 4;
		trapd rotatepitch(360,5);
		wait 4;
	}
}

trap13()
{
	trig=getent("trap13_trig","targetname");
	trapa=getent("trap13a","targetname");
	trapb=getent("trap13b","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	trapa movez(-150,4);
	wait 1;
	trapb movez(-150,4);
	wait 5;
	trapa delete();
	trapb delete();
}

trap13_rotate()
{
	targ=getent("trap13_rotate","targetname");
	while(1)
	{
		targ rotateyaw(360,8);
		wait 8;
	}
}

trap14()
{
	trig=getent("trap14_trig","targetname");
	trapa=getent("trap14a","targetname");
	trapb=getent("trap14b","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa rotateroll(-70,2);
		trapb rotateroll(70,2);
		wait 2;
		trapa rotateroll(70,2);
		trapb rotateroll(-70,2);
		wait 2;
	}
}

trap15()
{
	trig=getent("trap15_trig","targetname");
	trapa=getent("trap15a","targetname");
	trapb=getent("trap15b","targetname");
	trapc=getent("trap15_solid","targetname");

	trapc notsolid();

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	while(1)
	{
		trapa rotateroll(360,4);
		trapb rotateroll(-360,4);
		wait 4;
	}
}

trap16()
{
	trig=getent("trap16_trig","targetname");
	trapa=getent("trap16a","targetname");
	trapb=getent("trap16b","targetname");

	trig sethintstring("Press ^1&&1^7 to activate the Obstacle");
	trig waittill("trigger");
	trig delete();

	vc=randomint(4);
	if(vc!=0||vc!=2)
		trapa delete();
	else
		trapb delete();
}

part2_announce()
{
	trig=getent("part2_trig","targetname");
	trig waittill("trigger",p);
    trig delete();
  	p braxi\_rank::giverankxp(undefined,5);
    iprintlnbold("^1"+p.name+"^7 has passed half of the ^1Map^7 first!");
}

part3_announce()
{
	trig=getent("part3_trig","targetname");
	trig waittill("trigger",p);
    trig delete();
    p braxi\_rank::giverankxp(undefined,5);

    iprintlnbold("^1"+p.name+"^7 has reached the ^1End^7!");
}

musicbox()
{
	level.music_trig=getent("musicbox_trig","targetname");
	thread box();
	level.music_trig sethintstring("Press ^1&&1 ^7to open the ^1Gift^7!");
	level.music_trig waittill("trigger",who);
	level.music_trig delete();
	level.box delete();

	who freezecontrols(1);
	who musicMenu();
}

musiccheck()
{
	level waittill("round_started");
	wait 20;
	if(!level.musicchosen)
	{
		level.musicchosen=true;

		if(isdefined(level.music_trig))
			level.music_trig delete();

		if(isdefined(level.box))
			level.box delete();

		ambientstop();
		musicstop();
		ambientplay("wipe"+(1+randomint(4)));
	}
}

box()
{
	targ=getent("musicbox","targetname");

	level.box=spawn("script_model",targ.origin);
	level.box setmodel("giftbox_"+(1+randomint(5)));

	level.box box_hover();
}

box_hover()
{
	while(isdefined(self))
	{
		self movez(5,5);
		self rotateyaw(360,5);
		wait 5;
		self movez(-5,5);
		self rotateyaw(360,5);
		wait 5;
	}
}

hud() 
{
    blade=newHudElem();	
	blade.x=5;	
	blade.y=-130;	
	blade.horzalign="left";	
	blade.vertalign="middle";
	blade.alignx="left";
	blade.aligny="middle";
	blade.font="objective";
	blade.sort=102;	
	blade.alpha=1;	
	blade.fontscale=1.4;
	blade.glowalpha=1;
	blade.hidewheninmenu=true;
    blade.archived=false;

	if(isdefined(level.randomcolor))
		blade.glowcolor=level.randomcolor;
	else 
		blade.glowcolor=level.wipe_glow;

	blade settext("Winter Wipeout\nA VC' Blade Map");
}

logo()
{
	vc=getent("vc_logo","targetname");
	while(1)
	{
		vc rotateyaw(720,15);
		wait 15;
	}
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
	self.hud_music[i] setText("Vistic's Winter Wipeout");
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
			level.musicchosen=true;
 			iprintln("Now playing: ^1"+level.music[self.selection]["song"]);
			ambientPlay(level.music[self.selection]["alias"]);
			self freezecontrols(0);
			break;
		}
		else if(self fragButtonPressed())
		{
			self freezecontrols(0);
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

endrooms()
{
	thread letters();
	thread knife();
	thread sniper();
	thread jump();
}

letters()
{
    s=getent("sniper_letter","targetname");
    k=getent("knife_letter","targetname");
    j=getent("jump_letter","targetname");

    while(1)
    {
        s rotateyaw(360,4);
        j rotateyaw(360,4);
        k rotateyaw(360,4);
        wait 4;
    }
}

knife()
{
	level.knife=getent("knife","targetname");
	acti=getent("k_acti","targetname");
	jump=getent("k_jump","targetname");

	while(1)
	{
		level.knife sethintstring("Press ^1&&1 ^7to enter the ^1Knife Room");
		level.knife waittill("trigger",player);
		if(!isdefined(level.knife))
			return;

		level.knife sethintstring("Wait your ^1Turn^7.");

		if(!level.chosen)
		{
			level.chosen=true;
			level.sniper delete();
			level.jump delete();
			thread knife_spinner();
		}

		if(isdefined(level.activ))
		{
			player endroomsetup(jump,"knife_mp",undefined,100,1);
			level.activ endroomsetup(acti,"knife_mp",undefined,100,1);
			endroomannounce("Knife Room",level.activ.name+" vs "+player.name);
			wait 5;
			player freezecontrols(0);
			level.activ freezecontrols(0);
		}
		else 
		{
			player endroomsetup(jump,"knife_mp",undefined,100,1);
			wait 5;
			player freezecontrols(0);
		}

		while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
	}
}

knife_spinner()
{
	spinner=getent("knife_spinner","targetname");
	while(1)
	{
		spinner rotateyaw(360,2.75);
		wait 2.75;
	}
}

sniper()
{
	level.sniper=getent("sniper","targetname");
	acti=getent("s_acti","targetname");
	jump=getent("s_jump","targetname");

	while(1)
	{
		level.sniper sethintstring("Press ^1&&1 ^7to enter the ^1Sniper Room");
		level.sniper waittill("trigger",player);
		if(!isdefined(level.sniper))
			return;

		level.sniper sethintstring("Wait your ^1Turn^7.");

		if(!level.chosen)
		{
			level.chosen=true;
			level.knife delete();
			level.jump delete();
		}

		if(isdefined(level.activ))
		{
			player endroomsetup(jump,"m40a3_mp","remington700_mp",100,1);
			level.activ endroomsetup(acti,"remington700_mp","m40a3_mp",100,1);
			endroomannounce("Sniper Room",level.activ.name+" vs "+player.name);
			wait 5;
			player freezecontrols(0);
			level.activ freezecontrols(0);
		}
		else 
		{
			player endroomsetup(jump,"m40a3_mp","remington700_mp",100,1);
			wait 5;
			player freezecontrols(0);
		}

		while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
	}
}

jump()
{
	level.jump=getent("jump","targetname");
	acti=getent("j_acti","targetname");
	jump=getent("j_jump","targetname");
	spinner=getent("circle","targetname");
	spinner_hurt=getent("spinner_hurt","targetname");

	spinner_hurt enablelinkto();
	spinner_hurt linkto(spinner);

	while(1)
	{
		level.jump sethintstring("Press ^1&&1 ^7to enter the ^1Jump Room");
		level.jump waittill("trigger",player);
		if(!isdefined(level.jump))
			return;

		level.jump sethintstring("Wait your ^1Turn^7.");
		startangles=spinner.angles;
		startorigin=spinner.origin;

		if(!level.chosen)
		{
			level.chosen=true;
			level.knife delete();
			level.sniper delete();
		}

		if(isdefined(level.activ))
		{
			player endroomsetup(jump,"knife_mp",undefined,100,1);
			level.activ endroomsetup(acti,"knife_mp",undefined,100,1);
			endroomannounce("Jump Room",level.activ.name+" vs "+player.name);

			wait 5;
			player freezecontrols(0);
			level.activ freezecontrols(0);
			player iprintlnbold("^1Spinner ^7will start in ^13^7 Seconds");
			level.activ iprintlnbold("^1Spinner ^7will start in ^13^7 Seconds");
		}
		else 
		{
			player endroomsetup(jump,"knife_mp",undefined,100,1);
			wait 5;
			player freezecontrols(0);
		}
		wait 3;
		spinner thread rotateSpinner(player);

		while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
        spinner.angles=startangles;
		spinner.origin=startorigin;
		wait 2;
	}
}

endroomsetup(targ,weap,weap2,health,freeze)
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
	self.health=health;
}

endroomannounce(room,message)
{
	noti = SpawnStruct();
    noti.titleText = room;
    noti.notifyText = message;
    noti.duration = 6;
    if(isdefined(level.randomcolor))
    	noti.glowcolor=level.randomcolor;
    else 
    	noti.glowcolor=level.wipe_glow;
    players = getEntArray("player", "classname");
    for(i=0;i<players.size;i++)
        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    wait 2;
}

rotateSpinner(who)
{
	while(isalive(who) && isdefined(who))
	{
		self rotateyaw(400,5);
		wait 5;
		self rotateyaw(-270,3);
		wait 3;
		self rotateyaw(450,4);
		wait 4;
		self rotateyaw(-400,5);
		wait 5;
		self rotateyaw(350,3);
		wait 3;
		self rotateyaw(-500,4);
		wait 4;
	}
}

secret_trail()
{
	trig=getent("secret_trail","targetname");
	for(;;)
	{
		trig waittill("trigger",who);
		if(who istouching(trig) && (getsubstr(who getguid(),24,32)=="c409ae43" || getsubstr(who getguid(),24,32)=="d2d68587"))
		{
			while(isalive(who)&&isdefined(who))
			{
				playfx(level.sam,who.origin);
				wait .05;
			}
		}
		else 
			who iprintln("You found a senseless Trigger!");
	}
}