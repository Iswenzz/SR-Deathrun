main()
{
 maps\mp\_load::main();
 
 precacheItem("knife_mp");
 PreCacheShellShock( "tankblast" );
 
 level.smokefx = LoadFX( "smoke/wall_explosion_smoke" );
 level.firefx = LoadFX( "fire/window_fire_large" );

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 setdvar( "r_specularcolorscale", "1" );
 setdvar("r_glowbloomintensity0",".25");
 setdvar("r_glowbloomintensity1",".25");
 setdvar("r_glowskybleedintensity0",".3");
 setdvar("compassmaxrange","1800");
 
//stuff//
 level.bjump1 = getEnt( "jb1", "targetname" );
 level.bacti1 = getEnt( "ab1", "targetname" );
 level.bjump2 = getEnt( "jb2", "targetname" );
 level.bacti2 = getEnt( "ab2", "targetname" );
 level.bjump3 = getEnt( "jb3", "targetname" );
 level.bacti3 = getEnt( "ab3", "targetname" );

thread fires();
thread jumpreset1();
thread jumpreset2();
thread jumpreset3();
thread jumproom();
thread kniferoom();
thread sniperoom();
thread dogroom();
thread pickend();
thread secret();
thread secretfail();
thread secretfinish();
thread startdoor();
thread yayufinished();

//traps//

thread trap1();
addTriggerToList( "t1acti" );
thread trap2();
addTriggerToList( "t2acti" );
thread trap3();
addTriggerToList( "t3acti" );
thread trap4();
addTriggerToList( "t4acti" );
thread trap5();
addTriggerToList( "t5acti" );
thread trap6();
addTriggerToList( "t6acti" );
thread trap7();
addTriggerToList( "t7acti" );
thread trap8();
addTriggerToList( "t8acti" );
thread trap9();
addTriggerToList( "t9acti" );
thread trap10();
addTriggerToList( "t10acti" );



//

}

ambient()
{
wait (3.0);
AmbientPlay ( "in4thekill" );
}

startdoor()
{
 brush = getent("startdoor", "targetname");
 
	wait 10;
	brush playsound ( "bttn" );
	thread ambient();
	brush movez (430, 5, 2, 2);
	brush waittill ("movedone");
	iprintlnbold("^7Start door has ^3opened^7.");
}

fires()
{
 snip1 = getent("snipe1", "targetname");
 snip2 = getent("snipe2", "targetname");
 snip3 = getent("snipe3", "targetname");
 pit1 = getent("pitfirea", "targetname");
 pit2 = getent("pitfireb", "targetname");

	for(;;)
	    {
		playFx( level.firefx , snip1.origin );
		playFx( level.firefx , snip2.origin );
		playFx( level.firefx , snip3.origin );
		playFx( level.firefx , pit1.origin );
		playFx( level.firefx , pit2.origin );
		wait 0.3;
	    }
}


trap1()
{
 trig = getEnt( "t1acti", "targetname" );
 brush = getEnt( "t1brush", "targetname" );

     trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
     
	for(;;)
	{
	    brush rotatepitch( 360, 6);
		wait 6;
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap2()
{
 trig = getEnt( "t2acti", "targetname" );
 brush = getEnt( "t1brush", "targetname" );

     trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
	 thread ahammers();
	 thread bhammers();
}

ahammers()
{
 brush = getEnt( "t2ahamrs", "targetname" );
 
 for(;;)
	{
	    brush rotateroll( 360, 2);
		wait 2;
	}
}

bhammers()
{
 brush = getEnt( "t2bhamrs", "targetname" );
  
 for(;;)
	{
	    brush rotateroll( -360, 2);
		wait 2;
	}

}

trap3()
{
 trig = getEnt( "t3acti", "targetname" );
 brush = getEnt( "t3smasher", "targetname" );
 hurt = getEnt( "smasherhurt", "targetname" );
 
	hurt enablelinkto();
	hurt linkto (brush);

     trig waittill( "trigger", who );
     trig delete();
     who playsound ( "bttn" );
	 brush movez (-312, 0.4);
	 brush waittill ("movedone");
	 thread shock();
	 playFx( level.smokefx , hurt.origin );
	 wait 5;
	 brush movez (312, 5);
	 brush waittill ("movedone");
}

shock()
{
 players = getEntArray("player","classname");	
	for(d = 0; d < players.size; d++)
	{
		players[d] ShellShock( "tankblast", 5 );
	}
}

trap4()
{
 trig = getEnt( "t4acti", "targetname" );
 brush = getEnt( "t4pusher", "targetname" );
	
	
	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	 brush movey (760, 1);
	 brush waittill ("movedone");
	 wait 3;
	 brush movey (-760, 5);
	 brush waittill ("movedone");
}

trap5()
{
 trig = getEnt( "t5acti", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	 thread t5group1();
	 thread t5group2();
	 thread t5group3();
	 thread t5group4();
	 thread t5group5();
	 thread t5group6();
}


t5group1()
{
 brush = getEnt( "t5g1", "targetname" );
 
	 for(;;)
	{
	    brush movez (-145, 3);
	    wait 4;
	    brush movez (148, 3);
	    wait 3;
	    brush movez (113, 3);
	    wait 5;
	    brush movez (-127, 3);
	    wait 3;
	    brush movez (119, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (-134, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-123, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (149, 3, 1.5, 1.5);
	    wait 4;
	}
}

t5group2()
{
 brush = getent( "t5g2", "targetname" );
 
	 for(;;)
	{
	    brush movez (-123, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (162, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (135, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (-169, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (119, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (-145, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-128, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (149, 3, 1.5, 1.5);
	    wait 4;
	}
}

t5group3()
{
 brush = getent( "t5g3", "targetname" );
 
	 for(;;)
	{
	    brush movez (151, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (-145, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-123, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (149, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (170, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-140, 3, 1.5, 1.5);
	    wait 6;
	    brush movez (-181, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (119, 3, 1.5, 1.5);
	    wait 4;
	}
}

t5group4()
{
 brush = getent( "t5g4", "targetname" );
 
	 for(;;)
	{
	    brush movez (113, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-140, 3, 1.5, 1.5);
	    wait 6;
	    brush movez (-181, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (151, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (-167, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (223, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (170, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (-169, 3, 1.5, 1.5);
	    wait 6;
	}
}


t5group5()
{
 brush = getent( "t5g5", "targetname" );
 
	 for(;;)
	{
	    brush movez (170, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (223, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (113, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (-169, 3, 1.5, 1.5);
	    wait 6;
	    brush movez (-167, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-140, 3, 1.5, 1.5);
	    wait 6;
	    brush movez (-181, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (151, 3, 1.5, 1.5);
	    wait 4;
	}
}

t5group6()
{
 brush = getent( "t5g6", "targetname" );
 
	 for(;;)
	{
	    brush movez (-167, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (-113, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (105, 3, 1.5, 1.5);
	    wait 6;
	    brush movez (-292, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (300, 3, 1.5, 1.5);
	    wait 4;
	    brush movez (223, 3, 1.5, 1.5);
	    wait 3;
	    brush movez (113, 3, 1.5, 1.5);
	    wait 5;
	    brush movez (-169, 3, 1.5, 1.5);
	    wait 6;
	}
}


trap6()
{
  trig = getEnt( "t6acti", "targetname" );
  brush = getEnt( "t6spinner", "targetname" );

	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
		
	for(;;)
	{
	    brush rotateyaw( 360, 1.5);
		wait 1.5;
	}
}

trap7()
{
 trig = getEnt( "t7acti", "targetname" );
 brush = getEnt( "t7pit", "targetname" );
 
 
	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	
	brush movey (-1036, 8, 2, 2);
}

trap8()
{
 trig = getEnt( "t8acti", "targetname" );
 brusha = getEnt( "t8s1", "targetname" );
 brushb = getEnt( "t8s2", "targetname" );
 hurta = getEnt( "t8hurt1", "targetname" );
 hurtb = getEnt( "t8hurt2", "targetname" );
 
    hurta enablelinkto();
    hurta linkto(brusha);
    hurtb enablelinkto();
    hurtb linkto(brushb);
 
 
	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	
	for(;;)
	{
	    brusha movey (272, 2, 1, 1);
	    brushb movey (400, 2, 1, 1);
	    wait 2;
	    brusha movey (-272, 2, 1, 1);
	    brushb movey (-400, 2, 1, 1);
	    wait 2;
	}
}

trap9()
{
 trig = getEnt( "t9acti", "targetname" );
 brusha = getEnt( "t9s1", "targetname" );
 brushb = getEnt( "t9s3", "targetname" );
 hurta = getEnt( "t9hurt1", "targetname" );
 hurtb = getEnt( "t9hurt3", "targetname" );
 
    hurta enablelinkto();
    hurta linkto(brusha);
    hurtb enablelinkto();
    hurtb linkto(brushb);
 
 
	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	
	for(;;)
	{
	    brusha movey (560, 2, 1, 1);
	    brushb movey (144, 2, 1, 1);
	    wait 2;
	    brusha movey (-560, 2, 1, 1);
	    brushb movey (-144, 2, 1, 1);
	    wait 2;
	}
}

trap10()
{
 trig = getEnt( "t10acti", "targetname" );
 brusha = getEnt( "t10s1", "targetname" );
 brushb = getEnt( "t10s2", "targetname" );
 hurta = getEnt( "t10hurt1", "targetname" );
 hurtb = getEnt( "t10hurt2", "targetname" );
 
    hurta enablelinkto();
    hurta linkto(brusha);
    hurtb enablelinkto();
    hurtb linkto(brushb);
 
 
	trig waittill( "trigger", who );
	trig delete();
	who playsound ( "bttn" );
	
	for(;;)
	{
	    brusha movey (504, 2, 1, 1);
	    brushb movey (208, 2, 1, 1);
	    wait 2;
	    brusha movey (-504, 2, 1, 1);
	    brushb movey (-208, 2, 1, 1);
	    wait 2;
	}
}

secret()
{
	trig = getent("notasecret", "targetname");
	secret = getent("unknown", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		player SetPlayerAngles( secret.angles );
		player setOrigin( secret.origin );
	}
}

secretfail()
{
	trig = getent("secretfail", "targetname");
	fail = getent("unknown", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		player SetPlayerAngles( fail.angles );
		player setOrigin( fail.origin );
		player iprintlnbold( "Render says ^1you're bad^7 and you should feel ^1bad^7!" );
		wait 2;
		player iprintlnbold( "MWAHAHAHA" );
	}
}	

secretfinish()
{
	trig = getent("endof", "targetname");
	finish = getent("secret", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		player SetPlayerAngles( finish.angles );
		player setOrigin( finish.origin );
		iprintlnbold( "^5" + player.name + " ^7has found a shortcut." );
		wait 2;
	}
}	
		
//END GAMES//

pickend()
{
	trig = getent("endmap_trig", "targetname");
	pickroom = getent("pickingrooms", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		player SetPlayerAngles( pickroom.angles );
		player setOrigin( pickroom.origin );
		player onDead();
		wait 0.1;
	}
}

onDead()
{
        self endon("disconnect");
        self endon("joined_spectators");
        self endon("killed_player");
        self waittill("death");
		
		iprintlnbold( "^5" + self.name + " ^7has^1 died^7!" );
 
}

jumproom()
{
 level.jump_trig = getEnt( "bounceroom", "targetname");
	

while(1)
	{	
    
    
        level.jump_trig waittill( "trigger", player );
		
	player SetPlayerAngles( level.bjump2.angles );
	player setOrigin( level.bjump2.origin );
	player freezeControls(true);
	level.activ freezeControls(true);
	player TakeAllWeapons();
	player giveweapon( "tomahawk_mp");  
	level.activ setPlayerangles( level.bacti2.angles );
	level.activ setOrigin( level.bacti2.origin );
	level.activ TakeAllWeapons();
	level.activ giveweapon( "tomahawk_mp");   
	player switchToWeapon( "tomahawk_mp" );
	level.activ SwitchToWeapon( "tomahawk_mp" );
	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1Bounce^7!" );
	wait 3;
	iPrintlnBold( "^33" );
	wait 1;
	iPrintlnBold( "^22" );
	wait 1;
	iPrintlnBold( "^11" );
	wait 1;
	iPrintlnBold( "^1FIGHT" );
	player freezeControls(false);
	level.activ freezeControls(false);
	}
}

dogroom()
{
 level.dog_trig = getEnt( "dogroom", "targetname");
 kjump = getEnt( "dogjumper", "targetname" );
 kacti = getEnt( "dogacti", "targetname" );
	

while(1)
	{	
        level.dog_trig waittill( "trigger", player );
	
	player SetPlayerAngles( kjump.angles );
	player setOrigin( kjump.origin );
	player detachAll();
	player setModel("german_sheperd_dog");
	player TakeAllWeapons();
	player giveweapon( "dog_mp");  
	level.activ setPlayerangles( kacti.angles );
	level.activ setOrigin( kacti.origin );
	level.activ detachAll();
	level.activ setModel("german_sheperd_dog");
	level.activ TakeAllWeapons();
	level.activ giveweapon( "dog_mp");   
	player switchToWeapon( "dog_mp" );
	level.activ SwitchToWeapon( "dog_mp" );
	player freezeControls(true);
	level.activ freezeControls(true);
	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1DOG FIGHT^7!" );
	wait 3;
	iPrintlnBold( "^33" );
	wait 1;
	iPrintlnBold( "^22" );
	wait 1;
	iPrintlnBold( "^11" );
	wait 1;
	iPrintlnBold( "^1FIGHT" );
	player freezeControls(false);
	level.activ freezeControls(false);
	wait 1;
	}
}


kniferoom()
{
 level.knife_trig = getEnt( "kniferoom", "targetname");
 kjump = getEnt( "knifejumper", "targetname" );
 kacti = getEnt( "knifeacti", "targetname" );
 
 
 while(1)
	{
        level.knife_trig waittill( "trigger", player );
	    
	player SetPlayerAngles( kjump.angles );
	player setOrigin( kjump.origin );
	player freezeControls(true);
	level.activ freezeControls(true);
	player TakeAllWeapons();
	player giveweapon( "deserteagle_mp");
	player SetWeaponAmmoClip( "deserteagle_mp", 0 );
	player SetWeaponAmmoStock( "deserteagle_mp", 0 );      
	level.activ setPlayerangles( kacti.angles );
	level.activ setOrigin( kacti.origin );
	level.activ TakeAllWeapons();
	level.activ giveweapon( "deserteagle_mp");
	level.activ SetWeaponAmmoClip( "deserteagle_mp", 0 );
	level.activ SetWeaponAmmoStock( "deserteagle_mp", 0 );       
	player switchToWeapon( "deserteagle_mp" );
	level.activ SwitchToWeapon( "deserteagle_mp" );
	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1knife^7!" );
	wait 3;
	iPrintlnBold( "^33" );
	wait 1;
	iPrintlnBold( "^22" );
	wait 1;
	iPrintlnBold( "^11" );
	wait 1;
	iPrintlnBold( "^1FIGHT" );
	player freezeControls(false);
	level.activ freezeControls(false);
	wait 1;
	}
}


sniperoom()
{
 level.snipe_trig = getent( "sniperoom", "targetname");
 level.jsnipe = getEnt( "snipejumper", "targetname" );
 level.asnipe = getEnt( "snipeacti", "targetname" );
    
    
    while(1)
	{

        level.snipe_trig waittill( "trigger", player );
			
		
        player SetPlayerAngles( level.jsnipe.angles );
        player setOrigin( level.jsnipe.origin );
        level.activ setPlayerangles( level.asnipe.angles );
        level.activ setOrigin( level.asnipe.origin );
		player freezeControls(true);
	level.activ freezeControls(true);
        player TakeAllWeapons();
	level.activ TakeAllWeapons();
        player GiveWeapon( "m40a3_mp" );
	player giveweapon( "remington700_mp");
	player SetWeaponAmmoStock( "m40a3_mp", 9999 );
	player SetWeaponAmmoStock( "remington700_mp", 9999 );
        level.activ GiveWeapon( "m40a3_mp" );
	level.activ giveweapon( "remington700_mp");
	level.activ SetWeaponAmmoStock( "m40a3_mp", 9999 );
	level.activ SetWeaponAmmoStock( "remington700_mp", 9999 );
	player switchToWeapon( "m40a3_mp" );
        level.activ SwitchToWeapon( "m40a3_mp" );
	iPrintlnBold( " ^5" + player.name + " ^3 picked ^1SHNIPAH WAR^7!" );
	wait 3;
	iPrintlnBold( "^33" );
	wait 1;
	iPrintlnBold( "^22" );
	wait 1;
	iPrintlnBold( "^11" );
	wait 1;
	iPrintlnBold( "^1FIGHT" );
	player freezeControls(false);
	level.activ freezeControls(false);
	
	}
}


// Other End Stuff //

yayufinished() //pretty much written by Luk from Luk-Servers
{
	trig = getent("endmap_trig", "targetname");
	
	while(1)
	{
		trig waittill ( "trigger", player );
		if(!isDefined(player.gotEndXP))
		{
			player braxi\_rank::giveRankXP("", 15);
			player iprintlnbold ( "^7You got +15^3xp^7!!!" );
			player.gotEndXP = true;
		}
	}
}	


jumpreset1(port_allies,port_axis)
{
 trig = getent("jumpfail", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti1.angles );
		    level.activ setOrigin( level.bacti1.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump1.angles, 3 );
		    player setorigin( level.bjump1.origin, 3 );
		}
	}
}

jumpreset2(port_allies,port_axis)
{
 trig = getent("jumpfail", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti2.angles );
		    level.activ setOrigin( level.bacti2.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump2.angles, 3 );
		    player setorigin( level.bjump2.origin, 3 );
		}
	}
}

jumpreset3(port_allies,port_axis)
{
 trig = getent("jumpfail", "targetname");

	for(;;)
	{
		trig waittill( "trigger", player );
		if(player.pers["team"] == "axis")
		{
		    level.activ setPlayerangles( level.bacti3.angles );
		    level.activ setOrigin( level.bacti3.origin );
		}
		if(player.pers["team"] == "allies")
		{
		    player setplayerangles( level.bjump3.angles, 3 );
		    player setorigin( level.bjump3.origin, 3 );
		}
	}
}
