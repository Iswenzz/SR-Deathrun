main()
{
trigger = spawn("trigger_radius", (1295.09, 1986.1, -632.477), 0, 200, 20);
trigger.targetname = "endmap_trig";
trigger.radius = 200;

    level._effect["aa_explosion"] = loadfx( "explosions/aa_explosion" );

    trig = spawn("trigger_radius",(774,1991,-468),0,150,250);
	trig.radius = 150;
	trig.targetname = "endmap_trig";
	
	precacheItem("g3_silencer_mp");

    addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	addTriggerToList( "trig_trap10" );
	addTriggerToList( "trig_trap11" );
	addTriggerToList( "trig_trap12" );
	addTriggerToList( "trig_trap13" );
	addTriggerToList( "trig_trap14" );
	addTriggerToList( "trig_trap15" );
	addTriggerToList( "trig_trap16" );
	addTriggerToList( "trig_trap17" );

	maps\mp\_load::main();
	maps\mp\mp_deathrun_empire\_teleport1::main();
	maps\mp\mp_deathrun_empire\_teleport2::main();
	maps\mp\mp_deathrun_empire\_teleport3::main();
	maps\mp\mp_deathrun_empire\_teleport4::main();
	maps\mp\mp_deathrun_empire\_teleport5::main();
	maps\mp\mp_deathrun_empire\_teleport6::main();
	
	ambientPlay("music");
	
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

	thread end_sr();

	
	thread credit();
	thread message();
	thread startdoor();
	thread acti_ele();
	thread moving_plat();
	thread pusher();
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
	thread sniperoom();
	thread kniferoom();
	thread jumproom();
	thread old();
	thread jump_weapon();
	thread finish();

}

end_sr()
{
	t1 = spawn("trigger_radius",(633,2773,-478-40),0,100,200);

	t1 thread endmap();
}

endmap()
{
	while(1)
	{
		self waittill("trigger",player);

		if(player.pers["team"] == "axis")
    		continue;

		if(isDefined(player.already_check) && player.already_check)
			continue;

		if(!player sr\api\_deathrun::order())
			player thread endmap_sefe();
        else
        {
        	player.already_check = true;
        	player thread already_check_reset();
        }
	}
}

endmap_sefe()
{
	self endon("death");
	self endon("disconnect");

	self freezeControls(1);
	self setOrigin(getEnt("endmap_trig","targetname").origin);
	wait 0.05;
	self freezeControls(0);
}

already_check_reset()
{
	self endon("disconnect");
	self waittill("death");

	self.already_check = undefined;
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

credit()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "Empire" );
wait(6);
thread drawInformation( 800, 0.8, 1, "eBc|Legend" );
wait(6);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.0, 0.8, 0.0);
	hud.font = "objective";
	hud.glowColor = (0.0, 0.8, 0.0);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}


message()
{
wait 5;
iprintln("^1>>^7Now Playng ^1C^2o^3l^4o^5r^6s ^7OUT NOW");
wait 20;
iprintln("^1>>^5Map Creator ^7eBc|Legend");
wait 20;
iprintln("^1>>^5mp_deathrun_empire");
wait 20;
iprintln("^1>>^5Big Thanks To ^7eBc|Trikx");
wait 20;
iprintln("^1>>^5Map Created For eBc|Deathrun ^7Server");
wait 30;
}


acti_ele()
{
trig = getent("trig_acti_ele","targetname");
object = getent("acti_ele","targetname");
trig waittill("trigger", user );
trig delete();
{
object moveZ(-912, 2);
object waittill("movedone");
wait 1;
}
}

startdoor()
{
door = getent("startdoor","targetname");
{
wait 15;
door moveZ(-480,3);
wait 1;
}
}

moving_plat()
{
trig = getent("trig_plat","targetname");
object = getent("plat","targetname");
trig waittill("trigger", user );
trig delete();
while(1)
{
object moveX(1216, 5);
object waittill("movedone");
wait 5;
object moveX(-1216, 5);
object waittill("movedone");
wait 5;
}
}

pusher()
{
	trigger = getEnt ( "pusher", "targetname" );
	
	while(1)
	{
    	trigger waittill ( "trigger", who );
	
	    oldpos = who.origin;
	    strenght = 6;
	    for(i=0;i<strenght;i++)
	    {
	        who.health += 160;
            who finishPlayerDamage(who, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-30,0,0)), "none", 0);
	    }
	}
}

trap1()
{
trig = getent("trig_trap1","targetname");
object1 = getent("block1","targetname");
object2 = getent("block2","targetname");
trig waittill("trigger" , user );
trig delete();
while(1)
{
object1 moveZ(-80, 1.5);
object2 moveZ(80, 1.5);
wait 3;
object1 moveZ(80, 1.5);
object2 moveZ(-80, 1.5);
wait 3;
object1 moveZ(80, 1.5);
object2 moveZ(-80, 1.5);
wait 3;
object1 moveZ(-80, 1.5);
object2 moveZ(80, 1.5);
wait 3;
}
}

trap2()
{
trig = getent("trig_trap2","targetname");
object = getent("trap2","targetname");
trig waittill("trigger" , user );
trig delete();
{
object moveY(656, 1.2);
wait 2.2;
object moveY(-656 ,1.2);
wait 5;
}
}

trap3()
{
	part1 = getentarray ("trap3_1" ,"targetname");
	part2 = getentarray ("trap3_2" ,"targetname");
	trig = getent ("trig_trap3" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();	
				
		default: return;
	}
}

trap4()
{
	part1 = getentarray ("trap4_1" ,"targetname");
	part2 = getentarray ("trap4_2" ,"targetname");
	part3 = getentarray ("trap4_3" ,"targetname");
	trig = getent ("trig_trap4" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(3);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] rotateYaw(180, 0.8);
				part2[randomInt(part2.size)] rotateYaw(-180, 0.8);
				part3[randomInt(part3.size)] rotateYaw(180, 0.8);
				break;
				
		case 1:	
				part1[randomInt(part1.size)] moveZ(-128, 1);
                part2[randomInt(part2.size)] moveZ(128, 1);
                part3[randomInt(part3.size)] moveZ(-128, 1);
                wait 3;
                part1[randomInt(part1.size)] moveZ(128, 1);
                part2[randomInt(part2.size)] moveZ(-128, 1);
                part3[randomInt(part3.size)] moveZ(128, 1);	
                break;
        case 2:
                part2[randomInt(part2.size)] notsolid();
                part2[randomInt(part2.size)] hide();
                wait 5;
                part2[randomInt(part2.size)] solid();
                part2[randomInt(part2.size)] show(); 				
				
		default: return;
	}
}

trap5()
{
trigger = getent("trig_trap5","targetname");
object = getent("trap5","targetname");
killtrigger = getent ("killtrig_5" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger enablelinkto ();
killtrigger linkto (object);
object moveX(288, 2);
object waittill("movedone");
wait(2);
object moveX(-288, 2);
object waittill("movedone");
wait(1);
}
}

trap6()
{
trigger = getent("trig_trap6","targetname");
object = getent("trap6","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveZ(256, 0.3);
object waittill("movedone");
wait(2);
object moveZ(-256, 2);
object waittill("movedone");
wait(1);
}
}

trap7()
{
trigger = getent("trig_trap7","targetname");
object1 = getent("trap7_1","targetname");
object2 = getent("trap7_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 moveZ(176, 2);
object2 moveZ(-176, 2);
wait(4);
object1 moveZ(-176, 2);
object2 moveZ(176, 2);
wait(4);
object1 moveZ(-176, 2);
object2 moveZ(176, 2);
wait(4);
object1 moveZ(176, 2);
object2 moveZ(-176, 2);
wait(4);
}
}

trap8()
{
trigger = getent("trig_trap8","targetname");
object1 = getent("trap8_1","targetname");
object2 = getent("trap8_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 rotateRoll(360, 2);
object2 rotateRoll(-360, 2);
wait 0.1;
}
}

trap9()
{
trigger = getent("trig_trap9","targetname");
object1 = getent("trap9_1","targetname");
object2 = getent("trap9_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object1 rotateRoll(360, 2);
object2 rotateRoll(-360, 2);
wait 0.1;
}
}

trap10()
{
trigger = getent("trig_trap10","targetname");
object = getent("trap10","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object rotatePitch(-180, 2);
wait 0.1;
}
}

trap11()
{
trigger = getent("trig_trap11","targetname");
object = getent("trap11","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object rotateRoll(180, 1);
wait 5;
object rotateRoll(-180, 1);
wait 1;
}
}

trap12()
{
trigger = getent("trig_trap12","targetname");
object = getent("trap12","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object rotateYaw(360, 2);
wait 0.1;
}
}

trap13()
{
trigger = getent("trig_trap13","targetname");
object1 = getent("trap13_1","targetname");
object2 = getent("trap13_2","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object1 moveY(256, 3);
object2 moveY(-256, 3);
wait 0.1;
}
}

trap14()
{
	part1 = getentarray ("trap14_1" ,"targetname");
	part2 = getentarray ("trap14_2" ,"targetname");
	trig = getent ("trig_trap14" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();	
				
		default: return;
	}
}

trap15()
{
trigger = getent("trig_trap15","targetname");
object = getent("trap15","targetname");
killtrigger1 = getent ("killtrig_15_1" , "targetname");
killtrigger2 = getent ("killtrig_15_2" , "targetname");
killtrigger3 = getent ("killtrig_15_3" , "targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
killtrigger1 enablelinkto ();
killtrigger1 linkto (object);
killtrigger2 enablelinkto ();
killtrigger2 linkto (object);
killtrigger3 enablelinkto ();
killtrigger3 linkto (object);
object moveZ(-48, 3);
object waittill("movedone");
wait(2);
object moveZ(48, 2);
object waittill("movedone");
wait(1);
}
}

trap16()
{
        trigger = getent("trig_trap16","targetname");
	object = getent("t16_","targetname");
        trigger waittill ("trigger" , player );
        trigger delete();
	a = getent("t16a","targetname");
	b = getent("t16b","targetname");
	c = getent("t16c","targetname");
	d = getent("t16d","targetname");
	e = getent("t16e","targetname");
	f = getent("t16f","targetname");
	g = getent("t16g","targetname");
	
	while(1)
	{
		a moveY(64,0.5);
		b moveY(-64,0.5);
		c moveY(64,0.5);
		d moveY(-64,0.5);
		e moveX(64,0.5);
		f moveX(-64,0.5);
		g moveZ(64,0.5);
		wait 1;
		a moveY(-64,0.5);
		b moveY(64,0.5);
		c moveY(-64,0.5);
		d moveY(64,0.5);
		e moveX(-64,0.5);
		f moveX(64,0.5);
		g moveZ(-64,0.5);
		wait 1;
	}
}

trap17()
{
        trigger = getent("trig_trap17","targetname");
	object = getent("t17_","targetname");
        trigger waittill ("trigger" , player );
        trigger delete();
	a = getent("t17a","targetname");
	b = getent("t17b","targetname");
	c = getent("t17c","targetname");
	d = getent("t17d","targetname");
	e = getent("t17e","targetname");
	f = getent("t17f","targetname");
	
	while(1)
	{
		a rotateYaw(180,2);
		b rotateYaw(-180,2);
		c rotateYaw(180,2);
		d rotateYaw(-180,2);
		e rotateYaw(180,2);
		f rotateYaw(-180,2);
		wait 3;
		a rotateYaw(-180,2);
		b rotateYaw(180,2);
		c rotateYaw(-180,2);
		d rotateYaw(180,2);
		e rotateYaw(-180,2);
		f rotateYaw(180,2);
		wait 3;
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
        if(!player sr\api\_deathrun::order())
	continue;
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
        level.old_trig delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        iPrintlnBold( "^7" + player.name + " ^4Chose ^1Sniper^7!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
		player TakeAllWeapons();
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
	    player freezeControls(true);
		level.activ freezeControls(true);
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
	    wait 0.1;
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		player switchToWeapon( "remington700_mp" );
	    wait 0.1;
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveWeapon( "m40a3_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
	    player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
        wait 1;
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
        if(!player sr\api\_deathrun::order())
	continue;
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
        level.old_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );     
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( "^7" + player.name + " ^4Chose ^3Knife^7!" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
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
        if(!player sr\api\_deathrun::order())
	continue;
        if(level.firstenter==true)
		{     
	    level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
		player freezeControls(true);
		level.activ freezeControls(true);
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^7" + player.name + " ^4Chose ^5Bounce^7!" );
		wait 2;
		iPrintlnBold("3");
		wait 1;
		iPrintlnBold("2");
		wait 1;
		iPrintlnBold("1");
		wait 1;
		iPrintlnBold("Fight!!");
		player freezeControls(false);
		level.activ freezeControls(false);
		wait 0.1;
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

old()
{
level.old_trig = getent("old","targetname");
acti = getEnt( "acti_old", "targetname" );
object = getent("glass","targetname");
c4 = getent("c4","targetname");
level.old_trig waittill("trigger", user );
level.old_trig delete();
{
level.snipe_trig delete();
level.knife_trig delete();
level.jump_trig delete();
{
PlayFX(level._effect["aa_explosion"],(664, 2808, -488));
level.activ setPlayerangles( acti.angles );
level.activ setOrigin( acti.origin );
c4 hide();
object hide();
object notsolid();
wait 1;
}
}
}

jump_weapon()
{
trigger = getent ("jump_weapon","targetname");
{
trigger waittill ("trigger",user);
wait(0.1);    
user giveWeapon( "g3_silencer_mp");
user giveMaxammo("g3_silencer_mp");
wait 0.1;
user switchToWeapon("g3_silencer_mp");
wait 0.1;
}
}

finish()
{
trigger = GetEnt( "finish", "targetname" );
	{
	trigger waittill ("trigger", user);
		{
		iprintlnbold( "^7" + user.name + " ^1F^4inished ^1F^4irst^1!");
		wait 4;
		}
	}
}