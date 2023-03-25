/*
______________________________________________
  /   /  ___/    ___/   ___/  \     / /  ___  \
 /   /  /__     /___   /__/ /\ \   / /  /  /  /
/   /  ___/  __    /  ___/ /  \ \ / /  /  /  /
  _/  /__   /_/   /	 /__/ /    \ \ /  /__/  /
___\____/________/\____/_/	    \_/________/

Thanks on decompiling noob... learn to script...
*/
main()
{
	level._effect[ "trapfx" ] = loadfx( "crystal/trapfx1" );
	level._effect[ "crystal_explo" ] = loadfx( "crystal/crystal_explo" );
	level._effect[ "explofx" ] = loadfx( "crystal/explofx" );

	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "2" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","10000");

	// setdvar("g_speed","190");
	// setdvar("g_gravity","800");

	  ////////////////////
	 //Additional dvars//
    ////////////////////

	level.dvar["allowLifes"] = 0;
	level.dvar["insertion"] = 0;
	level.dvar["freerun_time"] = 5;
	level.dvar["bunnyhoop"] = 0;

	  ///////////
	 //Threads//
    ///////////

	thread crystal_txt();
	thread part2fdoor();
	thread part3fdoor();
	thread plats();
	thread stage2tp_p();
	thread stage2tp_a();
	thread actistage3tp();
	thread jumperstage3tp();

	level waittill("round_started");
	thread music();

	players = getentarray("player","classname");
	for(i=0;i<=players.size;i++)
	{
		players[i].traptriggered = false;
	}

	if(isdefined(level.activ))
		level.activ.traptriggered = true; // http://epicpix.com/wp-content/uploads/2013/09/Just-in-case.png

	thread startspikes();
	thread trap1_setup();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7_setup();
	thread trap8();
	thread trap9_setup();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();

	thread sniperroom();
	thread jumproom();
	thread oldroom();
	thread kniferoom();
	thread roomlaters();

	addTriggerToList("trap1trig");
	addTriggerToList("trap2trig");
	addTriggerToList("trap3trig");
	addTriggerToList("trap4trig");
	addTriggerToList("trap5trig");
	addTriggerToList("trap6trig");
	addTriggerToList("trap7trig");
	addTriggerToList("trap8trig");
	addTriggerToList("trap9trig");
	addTriggerToList("trap10trig");
	addTriggerToList("trap11trig");
	addTriggerToList("trap12trig");
	addTriggerToList("trap13trig");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

creator_entered() //blade script
{
    if(!isdefined(level.creator))
        level.creator=false;

    for(;;)
    {
        level waittill("connected",player);
        if(getsubstr(player getguid(),24,32)=="c8d2d25c" && !level.creator)
        {
        	wait 2;
            level.creator=true;
            iprintlnbold("^2* * ^3Creator ^7"+player.name+" ^3 Has Entered^1! ^5* *");
        }
    }
}

music()
{
	wait 1;
	if(level.freerun == false)
	{
	r = RandomFloatRange(0.0, 1.0);
	g = RandomFloatRange(0.0, 1.0);
	b = RandomFloatRange(0.0, 1.0);
	music = NewHudElem();
	music.alignX = "left";
	music.alignY = "center";
	music.horzalign = "left";
	music.vertalign = "center";
	music.alpha = 1;
	music.x = -500;
	music.y = 300;
	music.font = "default";
	music.fontscale = 1.5;
	music.glowalpha = 1;
	music.glowcolor = (r,g,b);
	ambience = Randomint(20);
	if(ambience <= 10)
	{
		ambientplay("music1");
		music settext("John Dreamer - Becoming A Legend");
		music moveovertime(1);
		music.x = 15;
		level waittill("round_ended");
		music fadeovertime(1);
		music.alpha = 0;
		wait 1;
		music destroy();
	}
	if(ambience >= 11)
	{
		ambientplay("music2");
		music settext("John Dreamer - Brotherhood");
		music moveovertime(1);
		music.x = 15;
		level waittill("round_ended");
		music fadeovertime(1);
		music.alpha = 0;
		wait 1;
		music destroy();
	}
	}
}

crystal_txt()
{
	txt = getent("crystal_txt","targetname");
	txt notsolid();
	for(;;)
	{
		txt rotateyaw(360,5);
		wait 5;
	}
}

startspikes()
{
	spikes1 = getent("spikes1","targetname");
	spike2 = getent("spike2","targetname");
	wait randomint(5)+2;
	spikes1 moveZ(244,2,0.5,1);
	spike2 moveZ(-244,2,0.5,1);
}

part2fdoor()
{
	door = getent("part2fdoor","targetname");
	trig = getent("part2fdoor_t","targetname");
	trig waittill("trigger",player);
	{
		trig delete();
		door rotatepitch(-70,1,.1,.6);
	}
}

part3fdoor()
{
	door = getent("part3fdoor","targetname");
	trig = getent("part3fdoor_t","targetname");
	trig waittill("trigger",player);
	{
		trig delete();
		door rotatepitch(70,1,.1,.6);
	}
}

actistage3tp()
{
	trig = getent("actistage3tp_t","targetname");
	org = getent("actistage3tp_o","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setorigin(org.origin);
		wait .1;
	}
}

jumperstage3tp()
{
	trig = getent("jumperstage3tp_t","targetname");
	org = getent("jumperstage3tp_o","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setorigin(org.origin);
		wait .1;
	}
}

plats()
{
	splats = getent("splats","targetname");
	for(;;)
	{
		splats rotateyaw(-90,1);
		wait 2;
	}
}

hover()
{
	self movez(16,2);
	wait 2;
	for(;;)
	{
		self moveZ(-8,1.5);
		wait 1.6;
		self moveZ(8,1.5);
		wait 1.6;
		self moveZ(8,1.5);
		wait 1.6;
		self moveZ(-8,1.5);
		wait 1.6;
	}
}

stage2tp_p()
{
	trig = getent("stage2tp_p","targetname");
	spot = getent("stage2tp_op","targetname");
	for(;;)
	{
		trig waittill("trigger", p);
		p setorigin(spot.origin);
		p setplayerangles(spot.angles);
		wait .1;
	}
}

stage2tp_a()
{
	trig = getent("stage2tp_a","targetname");
	spot = getent("stage2tp_oa","targetname");
	for(;;)
	{
		trig waittill("trigger", a);
		a setorigin(spot.origin);
		a setplayerangles(spot.angles);
		wait .1;
	}
}

trap1_setup()
{
	trig = getent("trap1trig","targetname");
	crystal = getent("crystal1","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	trig waittill("trigger",player);
	for(i=1;i<=7;i++)
	{
		thread trap1(i);
	}
	trig sethintstring("Trap [^3Activated^7]");
	crystal thread hover();
}

trap1(num)
{
	spike = getent("spike_"+num,"targetname");
	killt = getent("killt_"+num,"targetname");
	killt enablelinkto();
	killt linkto(spike);
	spike notsolid();
	cantgoup = randomint(7);
	if (num != cantgoup)
	{
		spike moveZ(208,1);
		wait randomint(5)+2;
		spike moveZ(-208,2);
	}
	else
	{
		spike moveZ(64,1);
		wait 2;
		spike moveZ(-64,2);
	}
}

trap2()
{
	trig = getent("trap2trig","targetname");
	crystal = getent("crystal2","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	plat1 = getent("plat_1","targetname");
	plat2 = getent("plat_2","targetname");
	plat3 = getent("plat_3","targetname");
	plat4 = getent("plat_4","targetname");
	trig1 = getent("act_1","targetname");
	trig2 = getent("act_2","targetname");
	trig3 = getent("act_3","targetname");
	trig4 = getent("act_4","targetname");
	trig waittill("trigger",player);
	trig sethintstring("Trap [^3Activated^7]");
	crystal thread hover();

	x = randomint(6);
	switch(x)
	{
		case 0:
			trig1 waittill("trigger",player);
			plat1 movez(-184,0.5);
			trig4 waittill("trigger",player);
			plat4 movez(-184,0.5);
			break;

		case 1:
			trig1 waittill("trigger",player);
			plat1 moveZ(-184,0.5);
			break;

		case 2:
			trig2 waittill("trigger",player);
			plat2 moveZ(-184,0.5);
			break;

		case 3:
			trig3 waittill("trigger",player);
			plat3 moveZ(-184,0.5);
			break;

		case 4:
			trig4 waittill("trigger",player);
			plat4 moveZ(-184,0.5);
			break;

		case 5:
			trig2 waittill("trigger",player);
			plat2 movez(-184,0.5);
			trig3 waittill("trigger",player);
			plat3 movez(-184,0.5);
			break;
	}
}

trap3()
{
	pusher = getent("pusher","targetname");
	crystal = getent("crystal3","targetname");
	trig = getent("trap3trig","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	{
		pusher movey(-250,0.5);
		wait randomint(3)+2;
		pusher movey(250,1);
	}
}

trap4()
{
	s1 = getent("s1","targetname");
	s2 = getent("s2","targetname");
	k1 = getent("k1","targetname");
	k2 = getent("k2","targetname");
	trig = getent("trap4trig","targetname");
	crystal = getent("crystal4","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	k1 maps\mp\_utility::triggerOff();
	k2 maps\mp\_utility::triggerOff();
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	{
		k1 maps\mp\_utility::triggerOn();
		k2 maps\mp\_utility::triggerOn();
		k1 enablelinkto();
		k1 linkto(s1);
		k2 enablelinkto();
		k2 linkto(s2);
		s1 movex(-32,3);
		s2 movex(32,3);
		wait randomint(5)+3;
		s1 movex(32,1);
		s2 movex(-32,1);
		wait 1;
		k1 delete();
		k2 delete();
	}
}

trap5()
{
	trig = getent("trap5trig","targetname");
	crystal = getent("crystal5","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	p1 = getent("p1","targetname");
	p2 = getent("p2","targetname");
	p3 = getent("p3","targetname");
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	{
		x = randomint(7);
		switch(x)
		{
			case 0:
				p1 moveZ(-368,1);
				wait randomint(3)+1;
				p1 movez(368,1);
				break;

			case 1:
				p2 moveZ(-368,1);
				wait randomint(3)+1;
				p2 movez(368,1);
				break;

			case 2:
				p3 moveZ(-368,1);
				wait randomint(3)+1;
				p3 movez(368,1);
				break;

			case 3:
				p1 moveZ(-368,1);
				p2 moveZ(-368,1);
				wait randomint(3)+1;
				p1 movez(368,1);
				p2 movez(368,1);
				break;

			case 4:
				p2 moveZ(-368,1);
				p3 moveZ(-368,1);
				wait randomint(3)+1;
				p2 movez(368,1);
				p3 movez(368,1);
				break;

			case 5:
				p1 moveZ(-368,1);
				p3 moveZ(-368,1);
				wait randomint(3)+1;
				p1 movez(368,1);
				p3 movez(368,1);
				break;

			case 6:
				p1 moveZ(-368,1);
				p2 moveZ(-368,1);
				p3 moveZ(-368,1);
				wait randomint(3)+1;
				p1 movez(368,1);
				p2 movez(368,1);
				p3 movez(368,1);
				break;
		}
	}
}

trap6()
{
	trig = getent("trap6trig","targetname");
	crystal = getent("crystal6","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	bounce = getent("tbounce","targetname");
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	{
		x = randomint(3);
		switch(x)
		{
			case 0:
				bounce notsolid();
				wait randomint(4)+1;
				bounce solid();
				break;
			case 1:
				bounce hide();
				wait randomint(4)+1;
				bounce show();
				break;
			case 2:
				bounce movez(-144,2);
				wait randomint(5)+2;
				bounce movez(144,3,1,2);
				break;
		}
	}
}

trap7_setup()
{
	trig = getent("trap7trig","targetname");
	crystal = getent("crystal7","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	for(i=1;i<4;i++)
	{
		thread trap7(i);
	}
}

trap7(num)
{
	plat = getent("trap7plat_"+num,"targetname");
	x = randomint(3);
	switch(x)
	{
		case 0:
		plat notsolid();
		break;

		case 1:
		plat hide();
		break;

		case 2:
		plat notsolid();
		plat hide();
		break;

		default: return;
	}
}

trap8()
{
	trig = getent("trap8trig","targetname");
	crystal = getent("crystal8","targetname");
	rotspikes = getent("rotspikes","targetname");
	rotspikes thread rotation();
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	trig waittill("trigger",player);

	level notify("trap8direction");
	rotspikes thread rotation2();

	trig sethintstring("Trap [^3Activated^7]");
	crystal thread hover();
}

rotation()
{
	level endon("trap8direction");
	for(;;)
	{
		wait .1;
		self rotateyaw(360,3);
	}
}

rotation2()
{
	for(;;)
	{
		wait .1;
		self rotateyaw(-360,3);
	}
}

trap9_setup()
{
	trig = getent("trap9trig","targetname");
	crystal = getent("crystal9","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	trig waittill("trigger",player);
	thread crystals();
	thread trap9();
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
}

trap9()
{
	trig = getent("trig","targetname");
	maxcanuse = 4;
	counttriggered = -1;
	for(;;)
	{

		trig waittill("trigger",player);
		if(player.traptriggered == false)
		{
			player.traptriggered = true;

			counttriggered++;

		if(counttriggered == maxcanuse)
			trig delete();

			wait .5;
			playerposition = player getorigin();
			kill = spawn("script_model", level.crystals[counttriggered].origin );
			kill setmodel("tag_origin");
			wait .1;
			PlayFXOnTag( level._effect["trapfx"], kill, "tag_origin" );
			kill thread deleteaftertime(3);
			thread deletecrystalsnum(counttriggered);
			kill moveto(playerposition,0.5);
			kill waittill("movedone");
			playfx(level._effect[ "explofx" ], kill.origin);
			RadiusDamage( playerposition, 500, 99, 90, undefined );
			Earthquake( 0.8, randomint(3), kill.origin, 850 );
		}
		else{}

		wait .001;
	}
}

deleteaftertime(time)
{
	wait time;
	self delete();
}

crystals()
{
	level.crystals = [];
	level.crystals[0] = getent("tc0","targetname");
	level.crystals[1] = getent("tc1","targetname");
	level.crystals[2] = getent("tc2","targetname");
	level.crystals[3] = getent("tc3","targetname");
	level.crystals[4] = getent("tc4","targetname");
	for(i=0;i<=level.crystals.size;i++)
	{
		level.crystals[i] thread traphover();
	}
}

traphover()
{
	self notsolid();
	self movez(50,2);
	wait 3;
	orgpos = self.origin;
	for(;;)
	{
		time = randomint(3);
		range = RandomIntRange( -25, 25 );
		self movez(range,time);
		wait time+0.1;
		self movez(orgpos,time);
		wait time+0.1;
	}
}

deletecrystalsnum(num)
{
	if(num == level.crystals[num])
		level.crystals[num] delete();
}

trap10()
{
	flor = getent("trap10flor","targetname");
	trig = getent("trap10trig","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	crystal = getent("crystal10","targetname");
	trig waittill("trigger",player);
	crystal thread hover();
	flor delete();
	trig sethintstring("Trap [^3Activated^7]");
}

trap11()
{
	trig = getent("trap11trig","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	crystal = getent("crystal11","targetname");
	plat1 = getent("trap11plat1","targetname");
	plat2 = getent("trap11plat2","targetname");
	trig waittill("trigger",player);
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	for(;;)
	{
		plat1 movey(208,2);
		plat2 movey(-208,2);
		wait 3;
		plat1 movey(-208,2);
		plat2 movey(208,2);
		wait 3;
	}
}

trap12()
{
	trig = getent("trap12trig","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	crystal = getent("crystal12","targetname");

	plat1 = getent("trap12plat1","targetname");
	plat2 = getent("trap12plat2","targetname");
	plat3 = getent("trap12plat3","targetname");
	plat4 = getent("trap12plat4","targetname");

	killtrigger1 = getent("trap12killt1","targetname");
	killtrigger2 = getent("trap12killt2","targetname");
	killtrigger3 = getent("trap12killt3","targetname");
	killtrigger4 = getent("trap12killt4","targetname");

	killtrigger1 maps\mp\_utility::triggerOff();
	killtrigger2 maps\mp\_utility::triggerOff();
	killtrigger3 maps\mp\_utility::triggerOff();
	killtrigger4 maps\mp\_utility::triggerOff();

	bounce = getent("trap12bounce","targetname");


	trig waittill("trigger",player);

	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	x = randomint(3);
	switch(x)
	{
		case 0:
			killtrigger1 maps\mp\_utility::triggerOn();
			killtrigger2 maps\mp\_utility::triggerOn();
			killtrigger3 maps\mp\_utility::triggerOn();
			killtrigger4 maps\mp\_utility::triggerOn();
			killtrigger1 enablelinkto();
			killtrigger1 linkto(plat1);
			killtrigger2 enablelinkto();
			killtrigger2 linkto(plat2);
			killtrigger3 enablelinkto();
			killtrigger3 linkto(plat3);
			killtrigger4 enablelinkto();
			killtrigger4 linkto(plat4);
			plat1 movez(-80,1);
			plat2 movez(-80,1.5);
			plat3 movez(-80,2);
			plat4 movez(-80,2.5);
			wait 3;
			plat1 movez(80,1);
			plat2 movez(80,1.5);
			plat3 movez(80,2);
			plat4 movez(80,2.5);
			wait 3;
			killtrigger1 delete();
			killtrigger2 delete();
			killtrigger3 delete();
			killtrigger4 delete();
			break;

		case 1:
			bounce hide(); bounce notsolid();
			wait randomint(5);
			bounce show(); bounce solid();
			break;

		case 2:
			bounce hide(); bounce notsolid();
			killtrigger1 maps\mp\_utility::triggerOn();
			killtrigger2 maps\mp\_utility::triggerOn();
			killtrigger3 maps\mp\_utility::triggerOn();
			killtrigger4 maps\mp\_utility::triggerOn();
			killtrigger1 enablelinkto();
			killtrigger1 linkto(plat1);
			killtrigger2 enablelinkto();
			killtrigger2 linkto(plat2);
			killtrigger3 enablelinkto();
			killtrigger3 linkto(plat3);
			killtrigger4 enablelinkto();
			killtrigger4 linkto(plat4);
			plat1 movez(-80,1);
			plat2 movez(-80,1.5);
			plat3 movez(-80,2);
			plat4 movez(-80,2.5);
			wait 3;
			plat1 movez(80,1);
			plat2 movez(80,1.5);
			plat3 movez(80,2);
			plat4 movez(80,2.5);
			wait 3;
			bounce show(); bounce solid();
			killtrigger1 delete();
			killtrigger2 delete();
			killtrigger3 delete();
			killtrigger4 delete();
			break;
	}
}

trap13()
{
	trig = getent("trap13trig","targetname");
	trig sethintstring("Press ^3[&&1] ^7To Activate");
	crystal = getent("crystal13","targetname");
	trig waittill("trigger",player);
	bounce = getent("trap13bounce","targetname");
	crystal thread hover();
	trig sethintstring("Trap [^3Activated^7]");
	for(i=1;i<7;i++)
	{
		thread trap13pillars(i);
		wait .5;
	}
	bounce notsolid();
	wait randomint(10)+2;
	bounce solid();
}

trap13pillars(num)
{
	pillar = getent("trap13pillar_"+num,"targetname");
	for(;;)
	{
	time = randomint(3);
	rotate = randomint(180);
	pillar rotateyaw(rotate,time);
	wait time;
	}
}

roomlaters()
{
	level.k = getent("k","targetname");
	level.s = getent("s","targetname");
	level.j = getent("j","targetname");
	level.o = getent("o","targetname");
	level.k thread rotatemodel();
	level.s thread rotatemodel();
	level.j thread rotatemodel();
	level.o thread rotatemodel();
}

roomhud(x,y,text)
{
	roomhud = NewHudElem();
	roomhud.alignX = "center";
	roomhud.alignY = "middle";
	roomhud.horzalign = "center";
	roomhud.vertalign = "middle";
	roomhud.alpha = 1;
	roomhud.x = x;
	roomhud.y = y;
	roomhud.font = "default";
	roomhud.fontscale = 1.5;
	roomhud.glowalpha = 1;
	roomhud.glowcolor = (1,0.3,0);
	roomhud settext(text);
	wait 3;
	roomhud fadeovertime(0.5);
	roomhud.alpha = 0;
	wait .5;
	roomhud destroy();
}

kniferoom()
{
    level.knife_trig = getEnt( "knife", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );

    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.old_trig delete();
		level.jump_trig delete();
		level.sniper_trig delete();
		level.firstenter=false;
		level.s delete();
		level.j delete();
		level.o delete();
		}
		thread roomhud(0,-50,"Knife Room");
		thread roomhud(-100,0,player.name);
		thread roomhud(100,0,level.activ.name);
		thread roomhud(0,0,"^1VS");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip("deserteagle_mp", 0 );
		player setWeaponAmmoStock( "deserteagle_mp", 0 );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" );
        level.activ setWeaponAmmoClip("deserteagle_mp", 0 );
        level.activ setWeaponAmmoStock( "deserteagle_mp", 0 );
        wait 3;
        player switchToWeapon( "deserteagle_mp" );
        level.activ SwitchToWeapon( "deserteagle_mp" );
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

sniperroom()
{
    level.sniper_trig = getEnt( "sniper", "targetname");
    jump = getEnt( "jumper_sniper", "targetname" );
    acti = getEnt( "acti_sniper", "targetname" );

    while(1)
    {
        level.sniper_trig waittill( "trigger", player );
        if( !isDefined( level.sniper_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.old_trig delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		level.k delete();
		level.j delete();
		level.o delete();
		}
		thread roomhud(0,-50,"Sniper Room");
		thread roomhud(-100,0,player.name);
		thread roomhud(100,0,level.activ.name);
		thread roomhud(0,0,"^1VS");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
        player givemaxammo("remington700_mp");
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ givemaxammo("remington700_mp");
        wait 3;
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproom()
{
    level.jump_trig = getEnt( "jump", "targetname");
    jump = getEnt( "jumper_jump", "targetname" );
    acti = getEnt( "acti_jump", "targetname" );
    thread failtrig();
    thread jumprsniper();

    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.old_trig delete();
		level.sniper_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		level.k delete();
		level.s delete();
		level.o delete();
		}
		thread roomhud(0,-50,"Jump Room");
		thread roomhud(-100,0,player.name);
		thread roomhud(100,0,level.activ.name);
		thread roomhud(0,0,"^1VS");
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip("deserteagle_mp", 0 );
		player setWeaponAmmoStock( "deserteagle_mp", 0 );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" );
		level.activ setWeaponAmmoClip("deserteagle_mp", 0 );
		level.activ setWeaponAmmoStock( "deserteagle_mp", 0 );
        wait 3;
        player switchToWeapon( "deserteagle_mp" );
        level.activ SwitchToWeapon( "deserteagle_mp" );
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumprsniper()
{
	trig = getent("jumprsniper","targetname");
	sm = getEnt("sm","targetname");
	sm thread rotatemodel();
	for(;;)
	{
		trig waittill("trigger",player);
		wep = player getcurrentweapon();
		if(wep != "remington700_mp")
		{
			player takeallweapons();
			player giveweapon("remington700_mp");
			player givemaxammo("remington700_mp");
			player switchtoweapon("remington700_mp");
		}
		else
			player iprintlnbold("[^1You Already Have This Rifle^7]");
	}
}

rotatemodel()
{
	for(;;)
	{
		self rotateyaw(360,3);
		wait 3;
	}
}

failtrig()
{
	trig = getent("jumproom_failtrig","targetname");
	jump = getEnt( "jumper_jump", "targetname" );
    acti = getEnt( "acti_jump", "targetname" );
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

oldroom()
{
    level.old_trig = getEnt( "old", "targetname");
    jump = [];
    jump[1] = getEnt( "jumper_old1", "targetname" );
    jump[2] = getEnt( "jumper_old2", "targetname" );
    jump[3] = getEnt( "jumper_old3", "targetname" );
    jump[4] = getEnt( "jumper_old4", "targetname" );
    acti = getEnt( "acti_old", "targetname" );

    while(1)
    {
        level.old_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
        if(level.firstenter==true)
		{
		thread roomhud(0,-100,"Old Way Is Open");
		level.jump_trig delete();
		level.sniper_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        //level.activ thread watchroomwep("old");
        level.k delete();
        level.s delete();
        level.j delete();
		}
		x = randomint(4);
        player SetPlayerAngles( jump[x].angles );
        player setOrigin( jump[x].origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        player switchToWeapon( "knife_mp" );
        wait .1;
    }
}