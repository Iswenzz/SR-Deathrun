/*
______________________________________________
  /   /  ___/    __ /   ___/\ ______//  ___   \
 /   /  /__     /___   /__//\\ ____//  /  /   /
/   /  ___/  __    /  ___//  \\ __//  /  /   /
  _/  /__   /_/   /	 /__//____\\_//  /__/   /
___\____/\_______/\____//	   \\/_________/

You are not suposed to be here...

Animes used: Sword Art Online
			 Overlord
			 Dungeon ni Deai o Motomeru
			 Blue Exorcist
			 Accel World

Steam ID: 321legend123

Credit: Wingzor, VC'Blade

*/
main()
{
	level._effect["spiner_xpl"] = loadfx( "explosions/aa_explosion" );
	level.bigflare = loadfx( "custome/bigflare" );
	level._roomfx["flare"] = loadfx( "misc/flare" );
	level.explosionfx = loadfx( "custome/explosionfx" );
	level.bodyaura = loadfx( "custome/bodyaura" );

	precacheshader("black");
	precacheshader("white");

	PrecacheItem("ak47_mp");

	maps\mp\_load::main();
	maps\mp\_traps::main();
	maps\mp\_ship::main();
	maps\mp\_rooms::main();
	maps\mp\_secrets::main();

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
	setdvar("compassmaxrange","1800");

	thread creator_entered();
	thread music();
	thread player_stage2tp();
	thread acti_stage2tp();
	thread anime_tables();
	thread wallrun();
	thread room_section_tp();
	thread mapfinished_viewup();
}

creator_entered()
{
	level.me="c8d2d25c";
	//level.me1="Legend"; //local testing
	for(;;)
	{
		level waittill("player_spawned",player);
		if(isdefined(player.pers["legend"]))
			return;
		wait 1;

		connected=getSubStr( player.guid, 24, 32 );
		if(connected==level.me && !player.pers["legend"])
		{
			player.pers["legend"]=true;
			iprintlnbold("^5* * ^2Creator ^3" + player.name + "(eBc|Legend) ^2has Joined^1!^5 * *");
		}
		/*else if(connected==level.me1 && !player.pers["legend"]) // local testing
		{
			player.pers["legend"]=true;
			iprintlnbold("^5* * ^2Creator ^3" + player.name + " (eBc|Legend) ^2has Joined^1!^5 * *");
			player thread shotpower();
		}*/
	}
}

music()
{
	level waittill("round_started");

	iprintln("^1<<^7Credits: ^5Wingzor, VC'Blade");

	players = getentarray("player","classname");
	for(i=0;i<players.size;i++)
	{
		players[i] setclientdvar("cg_fovscale", 1.1);
		players[i].rtdusedd = false; //rtd
		players[i].sc = 0; //secret cheakpoint counter
		players[i].key = false; //2nd secret key
		players[i].c = 0; //something for secret
	}

	music = randomint(4);
	switch(music)
	{
		case 0:
			ambientplay("music1", 1);
			thread musichud("^1Music: ^7Nightcore - I Like It Loud ");
			break;
		case 1:
			ambientplay("music2", 1);
			thread musichud("^1Music: ^7Turn Down For What (Onderkoffer Remix)");
			break;
		case 2:
			ambientplay("music3", 1);
			thread musichud("^1Music: ^7Vicetone vs. Popeska - The New Kings");
			break;
		case 3:
			ambientplay("music4", 1);
			thread musichud("^1Music: ^7Different Heaven & EH!DE - My Heart");
			break;
	}
	wait 1;

	thread startcounter("5");
	wait .25;
	thread startcounter("4");
	wait .25;
	thread startcounter("3");
	wait .25;
	thread startcounter("2");
	wait .25;
	thread startcounter("1");
	wait 2;
	thread startcounter("Teleport Open!");
	wait 1;
	thread start_teleport();
}

musichud(text)
{
	level.music = NewHudElem();
	level.music.alignX = "center";
	level.music.alignY = "bottom";
	level.music.horzalign = "center";
	level.music.vertalign = "bottom";
	level.music.alpha = 1;
	level.music.x = 0;
	level.music.y = -10;
	level.music.font = "objective";
	level.music.fontscale = 1.6;
	level.music.glowalpha = 1;
	level.music.glowcolor = level.glowcolor;
	level.music setText( text );
	wait 20;
	level.music fadeovertime(1);
	wait 3;
	level.music destroy();
}

anime_tables()
{
	level.temple_table1 = getent("temple_table1","targetname");
	level.temple_table2 = getent("temple_table2","targetname");
	level.temple_table3 = getent("temple_table3","targetname");
	level.temple_table4 = getent("temple_table4","targetname");
	level.temple_table5 = getent("temple_table5","targetname");
	thread collected_hud();

	wait 1;

	level.temple_table1 hide();
	level.temple_table1 solid();

	level.temple_table2 hide();
	level.temple_table2 solid();

	level.temple_table3 hide();
	level.temple_table3 solid();

	level.temple_table4 hide();
	level.temple_table4 solid();

	level.temple_table5 hide();
	level.temple_table5 solid();

	thread secretwall();
	thread secretflor();

	thread anime_table1();
	thread anime_table2();
	thread anime_table3();
	thread anime_table4();
	thread anime_table5();

	thread revardxp();
	wait 5;
}

secretwall()
{
	secretwall = getent("secretwall","targetname");
	trig1 = getent("part1","targetname");
	trig2 = getent("part2","targetname");
	trig3 = getent("part3","targetname");
	trig4 = getent("part4","targetname");
	{
		trig1 waittill("trigger", player );
		trig2 waittill("trigger", player );
		trig3 waittill("trigger", player );
		trig4 waittill("trigger", player );
		secretwall notsolid();
		player iprintlnbold("Something happened");
	}
}

secretflor()
{
	flor = getent("secretflor","targetname");
	trig = getent("removeflor","targetname");
	trig waittill("trigger", player );
	{
		trig delete();
		flor delete();
	}
}

startcounter(text)
{
	startcountert = newHudElem();	
	startcountert.alignX = "center";
	startcountert.alignY = "middle";
	startcountert.horzAlign = "center";
	startcountert.vertAlign = "middle";
	startcountert.alpha = 1;
	startcountert.x = -500;
	startcountert.y = 50;	
	startcountert.font = "default";
	startcountert.fontScale = 2;
	startcountert.glowColor = level.glowcolor;
	startcountert.glowAlpha = 1;
	startcountert settext(text);
	startcountert moveovertime(1);
	startcountert.x = -100;
	wait 1;
	startcountert moveovertime(2);
	startcountert.x = 100;
	wait 2;
	startcountert moveovertime(1);
	startcountert.x = 500;
	wait 1;
	startcountert destroy();
}

collected_hud()
{
	level.collected = 0;

	level.animetablethud = newHudElem();	
	level.animetablethud.x = 0;
	level.animetablethud.y = 50;
	level.animetablethud.alignX = "right";
	level.animetablethud.alignY = "middle";
	level.animetablethud.horzAlign = "right";
	level.animetablethud.vertAlign = "middle";	
	level.animetablethud.alpha = 1;
	level.animetablethud.fontScale = 1.5;
	level.animetablethud.glowColor = level.glowcolor;
	level.animetablethud.glowAlpha = 1;
	level.animetablethud.sort = 2;
	level.animetablethud.label = &"^7Anime Artifacts Found:^1 &&1 / 5";

	level.animeshader = newHudElem();	
	level.animeshader.x = 0;
	level.animeshader.y = 50;
	level.animeshader.alignX = "right";
	level.animeshader.alignY = "middle";
	level.animeshader.horzAlign = "right";
	level.animeshader.vertAlign = "middle";	
	level.animeshader.alpha = 0.6;
	level.animeshader.fontScale = 1.5;
	level.animeshader.glowAlpha = 1;
	level.animeshader.sort = 1;
	level.animeshader setshader("black", 160,20);

	for(;;)
	{
	level.animetablethud setValue( level.collected );
	wait 0.1;
	}
}

revardxp()
{
	trigger = getent("revardxp","targetname");
	for(;;)
	{
		if (level.collected < 5)
		{
			trigger sethintstring("Collect All Anime Artifacts");
		}
		else if (level.collected == 5)
		{
			trigger sethintstring("All Artifacts were found, press ^1&&1^7 to activate");
			trigger waittill("trigger", player);

			trigger delete();

			level.temple_table1 thread spinzor(5,2);
			level.temple_table2 thread spinzor(5,2);
			level.temple_table3 thread spinzor(5,2);
			level.temple_table4 thread spinzor(5,2);
			level.temple_table5 thread spinzor(5,2);

			wait .1;

			level.temple_table1 thread movezor(5, (3104, 2824, 136) );
			level.temple_table2 thread movezor(5, (3104, 2824, 136) );
			level.temple_table3 thread movezor(5, (3104, 2824, 136) );
			level.temple_table4 thread movezor(5, (3104, 2824, 136) );
			level.temple_table5 thread movezor(5, (3104, 2824, 136) );

			wait 5;

			effect = spawn("script_model",(3104, 2824, 136));
			effect setmodel("tag_origin");
			wait .001;
			PlayFXOnTag ( level.bigflare, effect, "tag_origin" );
			effect PlayLoopSound("glowball");

			players = getentarray("player","classname");
			{
				for(i=0;i<players.size;i++)
				{
					if(isAlive(players[i]))
					{
					if(isdefined(player.pers["legend"]))
					{players[i] braxi\_rank::giveRankXp( undefined, 1000 );}

					players[i] braxi\_rank::giveRankXp( undefined, 500 );
					}
				}
			}
			wait 3;

			level.temple_table1 delete();
			level.temple_table2 delete();
			level.temple_table3 delete();
			level.temple_table4 delete();
			level.temple_table5 delete();
			wait 3;
			effect delete();
		}
	wait .1;
	}
}

spinzor(time1,time2)
{
	self rotateYaw( 360, time1, time2 );
}

movezor(time1, location)
{
	self moveto( location, time1 );
}

anime_table1()
{
	table = getent("table1","targetname");
	table thread table_moves();
	table_trig = getent("table1trig","targetname");
	table_trig waittill("trigger", player );
	table_trig delete();
	table thread table_moves();
	{
		level.collected++;
		iprintlnbold(player.name+" found the ^5Sword Art Online ^7Artifact\n ^1"+level.collected+"/5^7 Anime Artifacts found");
		table delete();
		level.temple_table1 show();
		level.temple_table1 solid();
		for(;;)
		{
			level.temple_table1 moveZ(16,2,1);
			level.temple_table1 waittill("movedone");
			level.temple_table1 moveZ(-16,2,1);
			level.temple_table1 waittill("movedone");
		}
	}
}

anime_table2()
{
	table2 = getent("table2","targetname");
	table2 thread table_moves();
	table2_trig = getent("table2trig","targetname");
	table2_trig waittill("trigger", player );
	table2_trig delete();
	{
		level.collected++;
		iprintlnbold(player.name+" found the ^5Accel World^7 Artifact\n ^1"+level.collected+"/5^7 Anime Artifacts found");
		table2 delete();
		level.temple_table2 show();
		level.temple_table2 solid();
		for(;;)
		{
			level.temple_table2 moveZ(16,2,1);
			level.temple_table2 waittill("movedone");
			level.temple_table2 moveZ(-16,2,1);
			level.temple_table2 waittill("movedone");
		}
	}
}

anime_table3()
{
	table3 = getent("table3","targetname");
	table3 thread table_moves();
	table3_trig = getent("table3trig","targetname");
	table3_trig waittill("trigger", player );
	table3_trig delete();
	table3 thread table_moves();
	{
		level.collected++;
		iprintlnbold(player.name+" found the ^5Dungeon ni Deai o Motomeru ^7Artifact\n ^1"+level.collected+"/5^7 Anime Artifacts found");
		table3 delete();
		level.temple_table3 show();
		level.temple_table3 solid();
		for(;;)
		{
			level.temple_table3 moveZ(16,2,1);
			level.temple_table3 waittill("movedone");
			level.temple_table3 moveZ(-16,2,1);
			level.temple_table3 waittill("movedone");
		}
	}
}

anime_table4()
{
	table4 = getent("table4","targetname");
	table4 thread table_moves();
	table4_trig = getent("table4trig","targetname");
	table4_trig waittill("trigger", player );
	table4_trig delete();
	{
		level.collected++;
		iprintlnbold(player.name+" found the ^5Overlord^7 Artifact\n ^1"+level.collected+"/5^7 Anime Artifacts found");
		table4 delete();
		level.temple_table4 show();
		level.temple_table4 solid();
		for(;;)
		{
			level.temple_table4 moveZ(16,2,1);
			level.temple_table4 waittill("movedone");
			level.temple_table4 moveZ(-16,2,1);
			level.temple_table4 waittill("movedone");
		}
	}
}

anime_table5()
{
	table5 = getent("table5","targetname");
	table5 thread table_moves();
	table5_trig = getent("table5trig","targetname");
	table5_trig waittill("trigger", player );
	table5_trig delete();
	{
		level.collected++;
		iprintlnbold(player.name+" found the ^5Blue Exorcist^7 Artifact\n ^1"+level.collected+"/5^7 Anime Artifacts found");
		table5 delete();
		level.temple_table5 show();
		level.temple_table5 solid();
		for(;;)
		{
			level.temple_table5 moveZ(16,2,1);
			level.temple_table5 waittill("movedone");
			level.temple_table5 moveZ(-16,2,1);
			level.temple_table5 waittill("movedone");
		}
	}
}

table_moves()
{
	for(;;)
	{
		self moveZ(16,2,1);
		self waittill("movedone");
		self moveZ(-16,2,1);
		self waittill("movedone");
	}
}

start_teleport()
{
	trig = getent("start_trig","targetname");
	spot = getent("tp_spot","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		player setorigin( spot.origin );
		player setplayerangles( spot.angles );
		wait .1;
	}
	wait .1;
}

player_stage2tp()
{
	trig = getent("player_stage2tp","targetname");
	spot = getent("player_stage2tp_spot","targetname");
	for(;;)
	{
		trig waittill("trigger", who);

		who thread fovscaler();
		who.blackscreen = newClientHudElem(who);
		who.blackscreen.x = 0;
		who.blackscreen.y = 0;
		who.blackscreen.alignX = "left";		
		who.blackscreen.alignY = "top";
		who.blackscreen.horzAlign = "fullscreen";
		who.blackscreen.vertAlign = "fullscreen";
		who.blackscreen.alpha = 0;
		who.blackscreen.color = (0,0,0);
		who.blackscreen setshader("black", 1000, 1000);
		who.blackscreen fadeOverTime(1);
		who.blackscreen.alpha = 1;
		wait .6;
		who setorigin( spot.origin );
		who setplayerangles( spot.angles );
		wait .6;
		who.blackscreen fadeOverTime(1);
		who.blackscreen.alpha = 0;
		wait 1;
		who.blackscreen destroy();
	}
}

acti_stage2tp()
{
	trig = getent("acti_stage2tp","targetname");
	spot = getent("acti_stage2tp_spot","targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		player setorigin( spot.origin );
		player setplayerangles( spot.angles );
		wait .1;
	}
}

fovscaler()
{
	wait .15;
	scale = 1;
	for(i=0;i<=5;i++)
	{
		scale += 0.1;
		self setclientdvar("cg_fovscale", scale);
		wait .15;
	}
	self setclientdvar("cg_fovscale", 1.1);
	/*wait .15;
	self setclientdvar("cg_fovscale", 1.1);
	wait .15;
	self setclientdvar("cg_fovscale", 1.2);
	wait .15;
	self setclientdvar("cg_fovscale", 1.3);
	wait .15;
	self setclientdvar("cg_fovscale", 1.4);
	wait .15;
	self setclientdvar("cg_fovscale", 1.1);*/
}

wallrun()
{
	trig = getent("wallruntrig","targetname");
	angle = getent("angleorigin","targetname");
	lastorigin = getent("lastorigin","targetname");
	for(;;)
	{
		trig waittill("trigger", player );
		
		player setplayerangles(angle.angles);
		air = spawn("script_model",(0,0,0));
		//while(1)
		//{
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto(air);
			air moveto((1576, 11976, 328), 1);
			air waittill("movedone");
			air moveto((1576, 11400, 488), 1);
			air waittill("movedone");
			air moveto(lastorigin.origin, 1);
			air rotateto(lastorigin.angles, 1);
			air waittill("movedone");
			player unlink();
			//player setplayerangles(0,0,0);
		//}
	}
}

room_section_tp()
{
	trig = getent("room_section_tp_trig","targetname");
	spot = getent("roomtp","targetname");
	while(true)
	{
		trig waittill("trigger", player );
		if( !isDefined( trig ) )
            return;
		player setorigin(spot.origin);

		while( isAlive( player ) && isDefined( player ) )
        wait 0.01;
	}
}

mapfinished_viewup()
{
	level waittill("game over");
	wait 1;
	PlayFX(level._roomfx["flare"],(4024, -3512, 88));
	PlayFX(level._roomfx["flare"],(3656, -3512, 88));
	thread endmsg(0,"Thanks On Playing ^5Anime World");
	thread endmsg(40,"Creator ^5eBc|Legend");
}
endmsg(y,text)
{
	endmsg = NewHudElem();
	endmsg.alignX = "center";
	endmsg.alignY = "middle";
	endmsg.horzalign = "center";
	endmsg.vertalign = "middle";
	endmsg.alpha = 1;
	endmsg.x = 0;
	endmsg.y = y;
	endmsg.font = "objective";
	endmsg.fontscale = 2;
	endmsg.glowalpha = 1;
	endmsg.glowcolor = level.glowcolor;
	endmsg.sort = 999;
	endmsg setText(text);
	endmsg SetPulseFX( 40, 3000, 500 );
	wait 5;
	endmsg destroy();	
}