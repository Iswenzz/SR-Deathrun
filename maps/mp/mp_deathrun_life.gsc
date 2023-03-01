/*
______________________________________________
  /   /  ___/    ___/   ___/  \     / /  ___  \
 /   /  /__     /___   /__/ /\ \   / /  /  /  /
/   /  ___/  __    /  ___/ /  \ \ / /  /  /  /
  _/  /__   /_/   /	 /__/ /    \ \ /  /__/  /
___\____/________/\____/_/	    \_/________/
*/
main()
{
	level._effect["breakwindow"] = loadfx ("custome/glassbreak");
	level._effect["explosion"] = loadfx ("explosions/aa_explosion");
	level._effect["roomfx"] = loadfx("custome/life_roomfx");
	level._fire = loadfx("fire/firelp_large_pm");

	maps\mp\_load::main();
	maps\createfx\mp_deathrun_life_fx::main();
	maps\mp\mp_deathrun_life_fx::main();

	
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
	setdvar("compassmaxrange","1800");
	setDvar("bg_falldamagemaxheight", 500 );
	setDvar("bg_falldamageminheight", 250 );

	addTriggerToList( "trap1trig" );
	addTriggerToList( "trap2trig" );
	addTriggerToList( "trap3trig" );
	addTriggerToList( "trap4trig" );
	addTriggerToList( "trap5trig" );
	addTriggerToList( "trap6trig" );
	addTriggerToList( "trap7trig" );
	addTriggerToList( "trap8trig" );
	addTriggerToList( "trap9trig" );
	addTriggerToList( "skipedtrap9" );
	addTriggerToList( "trap10trig" );
	addTriggerToList( "trap11trig" );
	addTriggerToList( "trap12trig" );

	level waittill("round_started");

	level.startwait = randomint(3)+3;
	thread teleporters();

	thread startdoors();
	thread breakwindow();
	thread movingbrick();
	thread breakdoor();

	thread trap1_setup();
	thread trap2();
	thread trap3();
	thread trap4_setup();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8_setup();
	thread skipedtrap9();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread room_objects();
	thread kniferoom();
	thread sniperroom();
	thread jumproom();
	thread jumproomfail();
	thread jumproomsniper();
	thread hoveringrocks();
	thread opensecret();
	thread entersecret();
	thread exitsecret();
	thread setup();
	thread jumppad();
	thread logo();
	thread randmusic();
	thread onmapend();
}

onmapend()
{
	level waittill("game over");
	iprintlnbold("^5Map Created By VC' Legend");
	iprintlnbold("^3Thanks For Playing");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

logo()
{
	logo = getent("logo","targetname");
	ring1 = getent("ring1","targetname");
	ring2 = getent("ring2","targetname");
	ring3 = getent("ring3","targetname");
	logo notsolid();
	ring1 notsolid();
	ring2 notsolid();
	ring3 notsolid();
	ring1 thread rotdir();
	ring2 thread rotdir();
	ring3 thread rotdir();
	for(;;)
	{
		x = randomint(2);
		if(x == 1)
		{
			logo rotateyaw(180,2);
		}
		else{
			logo rotateyaw(-180,2);
		}
		wait 2;
	}
}

rotdir()
{
	for(;;)
	{
		x = randomint(2);
		y = randomint(2);
		if(x == 1)
		{
			if(y == 1)
			{
			self rotateroll(180,2);
			}
			else
			{
			self rotateroll(-180,2);
			}
		}
		else
		{
			if(y == 1)
			{
			self rotateyaw(180,2);
			}
			else
			{
			self rotateyaw(-180,2);
			}
		}
		wait 2;
	}
}

randmusic()
{
	x = randomint(3);
	switch(x)
	{
		case 0:
		thread musicandhud("music1","Nightcore - Alive");
		break;

		case 1:
		thread musicandhud("music2","Do What You Wanna Do");
		break;

		case 2:
		thread musicandhud("music3","Avicii - Levels");
		break;
	}
}

musicandhud(song,text)
{
	if(!isdefined(song) || !isdefined(text))
		return;

	ambientstop();
	ambientplay(song);

	level.musichud=newhudelem();
	level.musichud.alignx="left";
	level.musichud.aligny="center";
	level.musichud.horzalign="left";
	level.musichud.vertalign="center";
	level.musichud.alpha=1;
	level.musichud.x=-400;
	level.musichud.y=300;
	level.musichud.font = "default";
	level.musichud.fontscale=1.5;	
	level.musichud.glowalpha=1;
	if(isdefined(level.randomcolor))
		level.musichud.glowcolor=level.randomcolor;
	else 
		level.musichud.glowcolor=(1,0,0);
	
	level.musichud settext("Music: ^1"+text);
	wait .1;
	level.musichud moveovertime(1);
	level.musichud.x=7;
}

teleporters()
{       
 	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporters();
}
 
transporters()
{
	for(;;)
	{
		self sethintstring("Press &&1 To Teleport");

		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}


startdoors()
{
	door1 = getent("door1","targetname");
	door2 = getent("door2","targetname");

	wait level.startwait;

	door1 rotateyaw(120,2);
	door2 rotateyaw(-120,2);
}

breakwindow()
{
	window = getent("bwin","targetname");
	trig = getent("bwint","targetname");
	wait level.startwait;
	trig waittill("trigger",player);
	PlayFX(level._effect["breakwindow"],window.origin);
	window delete();
	trig delete();
}

movingbrick()
{
	level.brick = getent("mbrick","targetname");
	trig = getent("mbrickt","targetname");
	trig waittill("trigger",player);
	trig delete();
	orgpos = level.brick.origin;
	for(;;)
	{
		level.brick movey(336,1,.25,.75);
		wait 2;
		level.brick moveto(orgpos,1,.25,.75);
		wait 2;
	}
}

breakdoor()
{
	bomb[0] = getent("bomb0","targetname");
	bomb[1] = getent("bomb1","targetname");
	bomb[2] = getent("bomb2","targetname");
	bomb[3] = getent("bomb3","targetname");
	doorpart = getent("breakdoor_part","targetname");
	trig = getent("breakdoor_trig","targetname");
	trig waittill("trigger",player);
	trig delete();
	PlayFX(level._effect["explosion"],doorpart.origin);
	doorpart playSound( "artillery_impact" );
	for(i=0;i<=bomb.size;i++)
	{
		bomb[i] delete();
	}
	doorpart delete();
}

hoveringrocks()
{
	rocks = getentarray("hoveringrocks","targetname");
	for(i=0;i<=rocks.size;i++)
	{
		rocks[i] thread hover();
	}
}

hover()
{
	orgpos = self.origin;
	for(;;)
	{
		hover = randomfloatrange(-48,48);
		time = randomfloatrange(1.0,2.0);
		self moveZ(hover,time);
		wait time+1;
		self moveZ(hover,time);
		wait time+1;
		self moveto(orgpos,time);
		wait time+1;
	}
}

trap1_setup()
{
	trig = getent("trap1trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	for(i=1;i<=6;i++)
	{
		thread trap1(i);
	}
}

trap1(num)
{
	obj = getent("trap1obj_"+num,"targetname");
	orgpos = obj.origin;
	for(;;)
	{
		time = randomfloatrange(0.1,2.0);
		newpos = randomfloatrange(-100,100);
		obj movez(newpos,time);
		wait time+1;
		obj moveto(orgpos,time);
		wait time+1;
	}
}

trap2()
{
	trig = getent("trap2trig","targetname");
	obj1 = getent("trap2obj1","targetname");
	obj2 = getent("trap2obj2","targetname");
	obj1 notsolid();
	obj2 notsolid();
	kill1 = getent("kill1","targetname");
	kill2 = getent("kill2","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	kill1 enablelinkto();
	kill1 linkto(obj1);
	kill2 enablelinkto();
	kill2 linkto(obj2);
	for(;;)
	{
		rot = randomint(2);
		if(rot == 1)
		{
			obj1 rotateyaw(180,2);
			obj2 rotateyaw(-180,2);
		}
		else
		{
			obj1 rotateyaw(-180,2);
			obj2 rotateyaw(180,2);
		}
		wait randomint(3)+2;
	}
}

trap3()
{
	trig = getent("trap3trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	level.brick notsolid();
	wait randomint(5)+2;
	level.brick solid();
}

trap4_setup()
{
	trig = getent("trap4trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	for(i=1;i<=13;i++)
	{
		thread trap4(i);
	}
}

trap4(num)
{
	frock = getent("frock_"+num,"targetname");
	orgpos = frock.origin;
	for(;;)
	{
		newpos = randomfloatrange(-256,256);
		time = randomfloatrange(1.0,2.0);
		frock movez(newpos,time);
		wait time+1.5;
		frock moveto(orgpos,time);
		wait time+1.5;
	}
}

trap5()
{
	trig = getent("trap5trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	obj = getent("trap5spiner","targetname");
	killtrig = getent("killtrigtrap5","targetname");
	point1 = getent("point1","targetname");
	point2 = getent("point2","targetname");
	killtrig maps\mp\_utility::triggerOff();
	obj notsolid();
	obj hide();
	orgpos = obj.origin;
	trig waittill("trigger",player);
	trig delete();
	killtrig maps\mp\_utility::triggerOn();
	obj solid();
	obj show();
	killtrig enablelinkto();
	killtrig linkto(obj);
	obj thread rot();
	time = randomint(3)+1;
	for(;;)
	{
		obj moveto(point1.origin,time);
		wait time+1;
		obj moveto(point2.origin,time);
		wait time+1;
		obj moveto(point1.origin,time);
		wait time+1;
		obj moveto(orgpos,time);
		wait time+1;
	}
}

rot()
{
	for(;;)
	{
		self rotateyaw(360,2);
		wait 2;
	}
}

trap6()
{
	bounce = getent("trap6bounce","targetname");
	trig = getent("trap6trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	bounce notsolid();
	bounce hide();
	wait randomint(3)+1;
	bounce show();
	bounce solid();
}

trap7()
{
	trig = getent("trap7trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	rock1 = getent("hrock1","targetname");
	rock2 = getent("hrock2","targetname");
	rock3 = getent("hrock3","targetname");
	rock4 = getent("hrock4","targetname");
	rock1 thread random_moves();
	rock2 thread random_moves();
	rock3 thread random_moves();
	rock4 thread random_moves();
	trig waittill("trigger",player);
	trig delete();
	x = randomint(45);
	if(x <= 5)
		rock1 delete();
	if(x < 10 && x > 5)
		rock2 delete();
	if(x <15 && x>10)
		rock3 delete();
	if(x < 20 && x > 15)
		rock4 delete();
	if(x < 25 && x > 20)
	{
		rock1 delete();
		rock3 delete();
	}
	if(x <30 && x > 25)
	{
		rock2 delete();
		rock4 delete();
	}
	if(x <35 && x > 30)
	{
		rock1 delete();
		rock2 delete();
	}
	if(x <40 && x > 35)
	{
		rock3 delete();
		rock4 delete();
	}
	if(x <= 45 && x > 40)
	{
		rock1 delete();
		rock2 delete();
		rock3 delete();
		rock4 delete();
	}
}

random_moves()
{
	orgpos = self.origin;
	for(;;)
	{
		newpos = randomfloatrange(-128,128);
		time = randomfloatrange(1.0,2.0);
		self movez(newpos,time);
		wait time+1;
		self moveto(orgpos,time);
		wait time+1;
	}
}

trap8_setup()
{
	trig = getent("trap8trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	for(i=1;i<=5;i++)
	{
		thread trap8(i);
	}
}

trap8(num)
{
	ball = getent("ball_"+num,"targetname");
	destination = getent("ballmoveto_"+num,"targetname");
	killtrig = getent("trap8kt_"+num,"targetname");
	killtrig enablelinkto();
	killtrig linkto(ball);
	orgpos = ball.origin;
	for(;;)
	{
		time = randomfloatrange(0.1,1.0);
		ball moveto(destination.origin,time);
		wait time+1;
		ball moveto(orgpos,time);
		wait time+1;
	}
}

skipedtrap9()
{
	trig = getent("skipedtrap9","targetname");
	trig sethintstring("Press [&&1] To Activate");
	row1 = getent("row1","targetname");
	row2 = getent("row2","targetname");
	row3 = getent("row3","targetname");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(6);
	switch(x)
	{
		case 0:
			row1 delete();
			break;
		case 1:
			row2 delete();
			break;
		case 2:
			row3 delete();
			break;
		case 3:
			row1 delete();
			row2 delete();
			break;
		case 4:
			row1 delete();
			row3 delete();
			break;
		case 5:
			row2 delete();
			row3 delete();
			break;
	}
}

trap9()
{
	trig = getent("trap9trig","targetname");
	obj = getent("trap9obj","targetname");
	trig sethintstring("Press [&&1] To Activate");
	killtrig9 = getent("killtrig9","targetname");
	killtrig9 maps\mp\_utility::triggerOff();
	trig waittill("trigger",player);
	trig delete();
	killtrig9 maps\mp\_utility::triggerOn();
	for(i=1;i<=4;i++)
	{
		thread playfire(i);
	}
}

playfire(num)
{
	killtrig9 = getent("killtrig9","targetname");
	spot = getent("fo_"+num,"targetname");
	fx = spawn("script_model",(spot.origin));
	fx.angles[1] = 270;
	fx setmodel("tag_origin");
	wait .1;
	PlayFXOnTag( level._fire, fx, "tag_origin" );
	wait 5;
	fx delete();
	spot delete();
	killtrig9 delete();
}

trap10()
{
	trig = getent("trap10trig","targetname");
	ball1 = getent("trap10ball1","targetname");
	ball2 = getent("trap10ball2","targetname");
	trig sethintstring("Press [&&1] To Activate");
	ball1killtrig = getent("ball1killtrig","targetname");
	ball2killtrig = getent("ball2killtrig","targetname");
	ball1killtrig maps\mp\_utility::triggerOff();
	ball2killtrig maps\mp\_utility::triggerOff();
	trig waittill("trigger",player);
	ball1killtrig maps\mp\_utility::triggerOn();
	ball2killtrig maps\mp\_utility::triggerOn();
	ball1killtrig enablelinkto();
	ball1killtrig linkto(ball1);
	ball2killtrig enablelinkto();
	ball2killtrig linkto(ball2);
	ball1 thread ballpath1();
	ball2 thread ballpath2();
	ball1 thread rotation();
	ball2 thread rotation();
	wait 3;
	ball1killtrig delete();
	ball2killtrig delete();
}

rotation()
{
	for(i=1;i<=4;i++)
	{
		self rotateroll(360,0.5);
		wait 0.5;
	}
	wait 3;
	self delete();
}

ballpath1()
{
	path11 = getent("path11","targetname");
	path21 = getent("path21","targetname");
	path31 = getent("path31","targetname");
	path41 = getent("path41","targetname");

	self moveto(path11.origin,.5);
	wait .5;
	self moveto(path21.origin,.5);
	wait .5;
	self moveto(path31.origin,.5);
	wait .5;
	self moveto(path41.origin,.5);
}

ballpath2()
{
	path21 = getent("path21","targetname");
	path22 = getent("path22","targetname");
	path23 = getent("path23","targetname");
	path24 = getent("path24","targetname");

	self moveto(path21.origin,.5);
	wait .5;
	self moveto(path22.origin,.5);
	wait .5;
	self moveto(path23.origin,.5);
	wait .5;
	self moveto(path24.origin,.5);
}

trap11()
{
	plats1 = getent("trap11plats1","targetname");
	plats2 = getent("trap11plats2","targetname");
	trig = getent("trap11trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(2);
	if(x == 1)
	{
		plats1 notsolid();
		plats1 hide();
		wait randomint(5)+1;
		plats1 show();
		plats1 solid();
	}
	else
	{
		plats2 notsolid();
		plats2 hide();
		wait randomint(5)+1;
		plats2 show();
		plats2 solid();
	}
}

trap12()
{
	obj1 = getent("trap12p1","targetname");
	obj2 = getent("trap12p2","targetname");
	trig = getent("trap12trig","targetname");
	trig sethintstring("Press [&&1] To Activate");
	trig waittill("trigger",player);
	trig delete();
	x = randomint(2);
	if(x == 1)
	{
		obj1 notsolid();
		obj1 hide();
		wait randomint(5)+1;
		obj1 show();
		obj1 solid();
	}
	else
	{
		obj2 notsolid();
		obj2 hide();
		wait randomint(5)+1;
		obj2 show();
		obj2 solid();
	}
}

room_objects()
{
	level.sniperobj = getent("sniperobj","targetname");
	level.knifeobj = getent("knifeobj","targetname");
	level.bounceobj = getent("bounceobj","targetname");
	level.sniperobj thread rotobj();
	level.knifeobj thread rotobj();
	level.bounceobj thread rotobj();
}

rotobj()
{
	while(isDefined(self))
	{
	self rotateyaw(360,3);
	wait 3;
	}
}

roomanauncer(room)
{
	r = randomfloatrange(0.0,1.0);
	g = randomfloatrange(0.0,1.0);
	b = randomfloatrange(0.0,1.0);

	roomanauncer = NewHudElem();
	roomanauncer.alignX = "center";
	roomanauncer.alignY = "middle";
	roomanauncer.horzalign = "center";
	roomanauncer.vertalign = "middle";
	roomanauncer.alpha = 1;
	roomanauncer.x = 0;
	roomanauncer.y = -200;
	roomanauncer.font = "default";
	roomanauncer.fontscale = 2.5;
	roomanauncer.glowalpha = 1;
	roomanauncer.glowcolor = (r,g,b);
	roomanauncer settext(room);
	roomanauncer SetPulseFX( 40, 6800, 200 );

	roomanauncernames = NewHudElem();
	roomanauncernames.alignX = "center";
	roomanauncernames.alignY = "middle";
	roomanauncernames.horzalign = "center";
	roomanauncernames.vertalign = "middle";
	roomanauncernames.alpha = 1;
	roomanauncernames.x = 0;
	roomanauncernames.y = -150;
	roomanauncernames.font = "default";
	roomanauncernames.fontscale = 1.8;
	roomanauncernames.glowalpha = 1;
	roomanauncernames.glowcolor = (r,g,b);
	roomanauncernames settext(self.name);
	roomanauncernames SetPulseFX( 40, 1500, 200 );	
	wait 1.6;
	roomanauncernames settext("^1VS");
	roomanauncernames SetPulseFX( 40, 1000, 200 );
	wait 1.1;
	roomanauncernames settext(level.activ.name);
	roomanauncernames SetPulseFX( 40, 1500, 200 );
	wait 1.6;
	roomanauncernames destroy();
	roomanauncer destroy();

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
		level.sniperobj delete();
		level.bounceobj delete();
        level.sniper_trig delete();
        level.jump_trig delete();
		level.firstenter=false;
		PlayFX(level._effect["roomfx"],(11840, 5696, -872));
		}
		
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
        player thread roomanauncer("Knife Room");	
        wait 4;
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
		level.knifeobj delete();
		level.bounceobj delete();
        level.knife_trig delete();
        level.jump_trig delete();
		level.firstenter=false;
		PlayFX(level._effect["roomfx"],(10240, 3072, -904));
		}
		
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon( "m40a3_mp" );
        player givemaxammo("remington700_mp");
        player givemaxammo("m40a3_mp");
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" ); 
        level.activ GiveWeapon( "m40a3_mp" );
        level.activ givemaxammo("remington700_mp");
        level.activ givemaxammo("m40a3_mp");
        player thread roomanauncer("Sniper Room");	
        wait 4;
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
    
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if( !isDefined( level.jump_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.knifeobj delete();
		level.sniperobj delete();
        level.knife_trig delete();
        level.sniper_trig delete();
		level.firstenter=false;
		PlayFX(level._effect["roomfx"],(11648, -1312, -152));
		PlayFX(level._effect["roomfx"],(11648, -1312, -152));
		PlayFX(level._effect["roomfx"],(10544, 776, -152));
		}
		
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
        player thread roomanauncer("Bounce Room");	
        wait 4;
        player switchToWeapon( "deserteagle_mp" );
        level.activ SwitchToWeapon( "deserteagle_mp" );
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 0.1;
    }
}

jumproomfail()
{
	jump = getEnt( "jumper_jump", "targetname" );
    acti = getEnt( "acti_jump", "targetname" );
	failtrig = getent("failtrig","targetname");
	for(;;)
	{
		failtrig waittill("trigger",player);
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

jumproomsniper()
{
	trig = getent("jumproomsniper","targetname");
	trig sethintstring("[^2&&1^7]");
	for(;;)
	{
		trig waittill("trigger",player);
		player GiveWeapon("remington700_mp");
		player givemaxammo("remington700_mp");
		player switchToWeapon("remington700_mp");
		player GiveWeapon( "deserteagle_mp" );
		player setWeaponAmmoClip("deserteagle_mp", 0 );
		player setWeaponAmmoStock( "deserteagle_mp", 0 );
		for(i=5;i>0;i--)
		{
			trig sethintstring("^1Wait: "+i);
			wait 1;
		}
		trig sethintstring("[^2&&1^7]");
	}
}

opensecret()
{
	trig = getent("showpart1trig","targetname");
	trig2 = getent("showpart2trig","targetname");
	trig3 = getent("showpart3trig","targetname");
	obj = getent("showpart1obj","targetname");
	hidenwall = getent("hidenwall","targetname");
	obj hide();
	obj notsolid();
	trig waittill("trigger",player1);
	trig delete();
	obj show();
	obj solid();
	trig2 waittill("trigger",player2);
	trig2 delete();
	trig3 waittill("trigger",player3);
	trig3 delete();
	player3 iprintlnbold("What now??");
	hidenwall notsolid();
}

entersecret()
{
	trig = getent("entersecret","targetname");
	point = getent("startsecretpoint","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player setOrigin(point.origin);
		player setPlayerangles(point.angles);
		player.sc = 0;
		player.insec = true;
		player thread whendead();
		wait .1;
	}
}

whendead()
{
	while(self.sessionstat == "playing" && isDefined(self) && isAlive(self) && self.insec == true)
	{wait 1;}
	if(self.sc != 0)
	{self.sc = 0;self iprintlnbold(">>Save counter restarted");}
}

exitsecret()
{
	trig = getent("secretend_trig","targetname");
	spot = getent("secrettp_end","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		xp = 200 * randomint(5);
		player setorigin(spot.origin);
		player setplayerangles(spot.angles);
		player.sc = 0;
		player.insec = false;
		player braxi\_rank::giveRankXp( undefined, xp );
		player iprintln("^5You Finished Secret and Recived - "+xp+" XP");
		player freezeControls(true);
		wait .01;
		player freezeControls(false);
		wait .1;
	}
}

setup()
{
	for(i=1;i<=6;i++)
	{
		thread loadtrigger(i);
		thread savetriggers(i);
	}
}

savetriggers(num)
{
	savetrig = getent("save_"+num,"targetname");
	for(;;)
	{
		savetrig waittill("trigger",player);
		if(player.sc >= num)
		{
			player.sc = player.sc;
		}
		if(player.sc != num || player.sc < num)
		{
			player.sc = num;
			player iprintln(">> Position: "+player.sc+" Saved");
		}
		wait .1;
	}
}

loadtrigger(num)
{
	spot = getent("load_"+num,"targetname");
	trig = getent("loadtrigger","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		if(num == player.sc)
		{
			player iprintln(">> Position: "+player.sc+" Loaded");
			player setorigin(spot.origin);
			player setplayerangles(spot.angles);
			wait .1;
		}
	}
}

jumppad()
{
	trig = getent("jumppad_trig","targetname");
	for(;;)
	{
		trig waittill("trigger",player);
		player thread mover();
		wait .1;
	}
}

mover()
{
	pos1 = getent("moverpos1","targetname");
	pos2 = getent("moverpos2","targetname");
	orgmover = spawn("script_model",(0,0,0));
	orgmover.origin = self.origin;
	orgmover.angles = self.angles;
	self linkto(orgmover);
	orgmover moveto(pos1.origin,0.5);
	wait .5;
	orgmover moveto(pos2.origin,1);
	wait 1.1;
	self unlink();
	wait .1;
	orgmover delete();
}