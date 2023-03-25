main()
{

    PreCacheItem("ak47_reflex_mp");
    PreCacheItem("m4_reflex_mp");

	maps\mp\_load::main();
	maps\mp\_teleport::main();
	maps\mp\_teleport1::main();
	maps\mp\_teleport2::main();
	maps\mp\_teleport3::main();
	maps\mp\_teleport4::main();
	maps\mp\_teleport5::main();
	maps\mp\_teleport6::main();
	maps\mp\_teleport7::main();
	maps\mp\_teleport8::main();
	maps\mp\_rotate::main();
	
	
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
	
	thread platforme();
	thread start_door();
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
	thread kniferoom();
	thread jumproom();
	thread sniperoom();
	thread war_zone_room();
	thread old();
	thread war_zone_ak47();
	thread war_zone_m4();
	thread jump_room_gun();


}

platforme()
{
trigger = getent("trig_platforme","targetname");
object = getent("platforme","targetname");
trigger waittill ("trigger" , player );
trigger delete();
while(1)
{
object moveX(448, 5);
object waittill("movedone");
wait(6);
object moveX(-448, 5);
object waittill("movedone");
wait(6);
}
}


start_door()
{
	door1 = getent("door1", "targetname"); 
	door2 = getent("door2", "targetname");
	trigger = getent("start_door_trig", "targetname");
 
	while(true) 
	{ 
		trigger waittill ("trigger", user); 
		trigger delete();
		 {
		   wait (3);
		   door1 moveY(144, 3); 
		   door2 moveZ(144, 3); 		    
		   wait (2);  
         }
    }
}

trap1()
{
    trigger = getent("trig_trap1","targetname");
	object = getent("t1_","targetname");
    trigger waittill ("trigger" , player );
    trigger delete();
	a = getent("t1a","targetname");
	b = getent("t1b","targetname");
	c = getent("t1c","targetname");
	d = getent("t1d","targetname");
	e = getent("t1e","targetname");
	f = getent("t1f","targetname");
	
	{
		a moveY(100,0.5);
		b moveY(-100,0.5);
		c moveY(100,0.5);
		d moveY(-100,0.5);
		e moveY(100,0.5);
		f moveY(-100,0.5);
		wait 2;
		a moveY(-100,0.5);
		b moveY(100,0.5);
		c moveY(-100,0.5);
		d moveY(100,0.5);
		e moveY(-100,0.5);
		f moveY(100,0.5);
		wait 2;
	}
}

trap2()
{
    trigger = GetEnt("trig_trap2","targetname");
    brush = GetEnt("trap2","targetname");
	killtrigger = getent ("killtrig" , "targetname");
	trigger waittill ("trigger" , user );
    trigger delete();
    {
	killtrigger enablelinkto ();
    killtrigger linkto (brush);
    brush rotateYaw(360,1.5);
    wait 1;
    }
}

trap3()
{
    trigger = GetEnt("trig_trap3","targetname");
    circle1 = GetEnt("circle1","targetname");
	circle2 = GetEnt("circle2","targetname");
	circle3 = GetEnt("circle3","targetname");
	circle4 = GetEnt("circle4","targetname");
	trigger waittill ("trigger" , player );
    trigger delete();
    {
    circle1 rotateYaw(360,2);
	circle2 rotateYaw(-360,2);
	circle3 rotateYaw(360,2);
	circle4 rotateYaw(-360,2);
    wait 1;
    }
}

trap4()
{
    trigger = getent("trig_trap4","targetname");
	object = getent("t4_","targetname");
    trigger waittill ("trigger" , player );
    trigger delete();
	a = getent("t4a","targetname");
	b = getent("t4b","targetname");
	c = getent("t4c","targetname");
	d = getent("t4d","targetname");
	
	{
		a moveX(92,1.5);
		b moveX(-92,1.5);
		c moveX(92,1.5);
		d moveX(-92,1.5);
		wait 2;
		a moveX(-184,1.5);
		b moveX(184,1.5);
		c moveX(-184,1.5);
		d moveX(184,1.5);
		wait 2;
	}
}

trap5()
{
    trigger = getent("trig_trap5","targetname");
	object = getent("t5_","targetname");
    trigger waittill ("trigger" , player );
    trigger delete();
	a = getent("t5a","targetname");
	b = getent("t5b","targetname");
	c = getent("t5c","targetname");
	
	{
		a moveZ(-64,1.5);
		b moveZ(-128,1.7);
		c moveZ(-64,1.5);
		wait 2;
	}
}

trap6()
{
	part1 = getentarray ("trap6_1" ,"targetname");
	part2 = getentarray ("trap6_2" ,"targetname");
	trig = getent ("trig_trap6" , "targetname");

 	trig waittill( "trigger", user ); 
	trig delete ();
	random = randomint(2);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] moveZ(-160,1.7);
				break;
				
		case 1:	
				part2[randomInt(part2.size)] moveZ(-160,1.7);	
				
		default: return;
	}
}

trap7()
{
trigger = getent("trig_trap7","targetname");
object = getent("trap7","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveX(208, 1);
object waittill("movedone");
wait(3);
object moveX(-208, 1);
object waittill("movedone");
wait(3);
}
}

trap8()
{
trigger = getent("trig_trap8","targetname");
object = getent("trap8","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object rotatePitch(90, 2);
object waittill("rotatedone");
wait(3);
object rotatePitch(-90, 2);
object waittill("rotatedone");
wait(3);
}
}

trap9()
{
trigger = getent("trig_trap9","targetname");
object = getent("trap9","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object rotateRoll(360, 2);
object waittill("rotatedone");
wait(2.1);
object rotateRoll(-360, 5);
object waittill("rotatedone");
wait(3);
}
}

trap10()
{
    trigger = getent("trig_trap10","targetname");
	object = getent("t10_","targetname");
	killtrigger1 = getent ("killtrig_t1" , "targetname");
	killtrigger2 = getent ("killtrig_t2" , "targetname");
	killtrigger3 = getent ("killtrig_t3" , "targetname");
	killtrigger4 = getent ("killtrig_t4" , "targetname");
	killtrigger5 = getent ("killtrig_t5" , "targetname");
	killtrigger6 = getent ("killtrig_t6" , "targetname");
	killtrigger7 = getent ("killtrig_t7" , "targetname");
    trigger waittill ("trigger" , player );
    trigger delete();
    killtrigger1 enablelinkto ();
	killtrigger2 enablelinkto ();
	killtrigger3 enablelinkto ();
	killtrigger4 enablelinkto ();
	killtrigger5 enablelinkto ();
	killtrigger6 enablelinkto ();
	killtrigger7 enablelinkto ();
    killtrigger1 linkto (object);
	killtrigger2 linkto (object);
	killtrigger3 linkto (object);
	killtrigger4 linkto (object);
	killtrigger5 linkto (object);
	killtrigger6 linkto (object);
	killtrigger7 linkto (object);
	a = getent("t10a","targetname");
	b = getent("t10b","targetname");
	c = getent("t10c","targetname");
	d = getent("t10d","targetname");
	e = getent("t10e","targetname");
	f = getent("t10f","targetname");
	g = getent("t10g","targetname");
	
	{
		a moveY(336,1);
		b moveY(-336,1);
		c moveY(336,1);
		d moveY(-336,1);
		e moveY(336,1);
		f moveY(-336,1);
		g moveY(336,1);
		wait 2;
		a moveY(-336,1.5);
		b moveY(336,1.5);
		c moveY(-336,1.5);
		d moveY(336,1.5);
		e moveY(-336,1.5);
		f moveY(336,1.5);
		g moveY(-336,1.5);
		wait 2;
	}
}

trap11()
{
    trigger = getent("trig_trap11","targetname");
	object = getent("t11_","targetname");
    trigger waittill ("trigger" , player );
    trigger delete();
	a = getent("t11a","targetname");
	b = getent("t11b","targetname");
	c = getent("t11c","targetname");
	d = getent("t11d","targetname");
	e = getent("t11e","targetname");
	f = getent("t11f","targetname");
	
	{
		a rotateRoll(360,1);
		b rotateRoll(-360,1);
		c rotateRoll(360,1);
		d rotateRoll(-360,1);
		e rotateRoll(360,1);
		f rotateRoll(-360,1);
		wait 6;
		a rotateRoll(-360,1);
		b rotateRoll(360,1);
		c rotateRoll(-360,1);
		d rotateRoll(360,1);
		e rotateRoll(-360,1);
		f rotateRoll(360,1);
		wait 2;
	}
}

trap12()
{
trigger = getent("trig_trap12","targetname");
object = getent("trap12","targetname");
trigger waittill ("trigger" , player );
trigger delete();
{
object moveY(-576, 5);
object waittill("movedone");
wait(3);
}
}


trap13()
{
	trig = getent("trig_trap13", "targetname");
	trap = getent("trap13", "targetname");
	trig waittill( "trigger", player ); 
	trig delete();
{
    trap hide();
    trap notsolid();
    wait 3;
    trap show();
    trap solid();
    wait 1;
}
}

kniferoom()
{
    level.knife_trig = getEnt( "knife_room", "targetname");
    jump = getEnt( "jumper_knife", "targetname" );
    acti = getEnt( "acti_knife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.war_zone_trig delete();
        level.snipe_trig delete();
        level.old_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		
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
        iPrintlnBold( " ^4" + player.name + " picked ^3K^7nife^3!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

jumproom()
{
    level.jump_trig = getEnt( "jump_room", "targetname");
    jump = getEnt( "jumper_jump", "targetname" );
    acti = getEnt( "acti_jump", "targetname" );
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
        level.war_zone_trig delete();        
	    level.snipe_trig delete();
        level.old_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
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
        iPrintlnBold( " ^4" + player.name + " picked ^5J^7ump^5!" );
		wait 0.1;
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "sniperoom", "targetname");
    jump = getEnt( "jump_snipe", "targetname" );
    acti = getEnt( "acti_snipe", "targetname" );

    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
		level.war_zone_trig delete();
        level.old_trig delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}
        iPrintlnBold( " ^4" + player.name + " picked ^1S^7niper^1!" );
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        player TakeAllWeapons();
	level.activ TakeAllWeapons();
	wait 0.1;
        player GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "remington700_mp" );
	wait 0.1;
	player GiveWeapon( "M40A3_mp" );
	level.activ GiveWeapon( "M40A3_mp" );
	wait 0.1;;
	player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
		player GiveMaxAmmo();
		level.activ GiveMaxAmmo();
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

war_zone_room()
{
    level.war_zone_trig = getEnt( "war_zone", "targetname");
    jump = getEnt( "jumper_war", "targetname" );
    acti = getEnt( "acti_war", "targetname" );
    while(1)
    {
        level.war_zone_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
        level.old_trig delete();
		level.snipe_trig delete();
		level.knife_trig delete();
		level.jump_trig delete();
		level.firstenter=false;
		}
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
        iPrintlnBold( " ^4" + player.name + " picked ^4W^7ar ^4Z^7one!" );
		wait 0.01;
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

old()
{
    level.old_trig = getEnt( "old", "targetname");
    jump = getEnt( "jumper_old", "targetname" );
    acti = getEnt( "acti_old", "targetname" );
    
    while(1)
    {
        level.old_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.war_zone_trig delete();
        level.snipe_trig delete();
        level.knife_trig delete();
 		level.jump_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );      
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^4" + player.name + " picked ^1OLD!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

war_zone_ak47()
{
trigger = getent ("ak47_trig","targetname");
while(1)
{
trigger waittill ("trigger",user);
wait(0.2);
user iprintlnbold("You Have Taken [^4AK47^7]");
wait(0.1);    
user giveWeapon("ak47_reflex_mp");
user giveMaxammo("ak47_reflex_mp");
wait 0.1;
user switchToWeapon("ak47_reflex_mp");
wait 2;
}
}

war_zone_m4()
{
trigger = getent ("m4_trig","targetname");
while(1)
{
trigger waittill ("trigger",user);
wait(0.2);
user iprintlnbold("You Have Taken [^4M4^7]");
wait(0.1);    
user giveWeapon("m4_reflex_mp");
user giveMaxammo("m4_reflex_mp");
wait 0.1;
user switchToWeapon("m4_reflex_mp");
wait 2;
}
}

jump_room_gun()
{
trigger = getent ("gun_trig","targetname");
while(1)
{
trigger waittill ("trigger",user);
trigger delete();
wait(0.2);
user iprintlnbold("You Have Taken [^4Deserteagle^7]");
wait(0.1);    
user giveWeapon("deserteaglegold_mp");
user giveMaxammo("deserteaglegold_mp");
wait 0.1;
user switchToWeapon("deserteaglegold_mp");
wait 2;
}
}