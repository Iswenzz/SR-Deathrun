main()
{
 maps\mp\_load::main();
 
 precacheItem("winchester1200_mp");
 precacheItem("skorpion_mp");
 precacheItem("m4_mp");
 precacheItem("remington700_acog_mp");
 precacheItem("m40a3_acog_mp");
 precacheItem("m4_mp");
 precacheItem("g3_mp");
 precacheItem("ak47_mp");
 precacheItem("rpd_mp");
 precacheItem("knife_mp");

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
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();



			
addTriggerToList( "trigger2" );
addTriggerToList( "trigger3" );
addTriggerToList( "trigger4" );
addTriggerToList( "trigger5" );
addTriggerToList( "trigger6" );
addTriggerToList( "jumpweapon" );

thread ambient();
thread trap2();
thread trap3();
thread trap4a();
thread trap4b();
thread trap5();
thread trap6();
thread trap6b();
thread actisecret();
thread teleport2();
thread kniferoom();
thread weaponroom();
thread sniperoom();
thread Jumproom();
thread room_gun();
thread LastmoveLeft();
thread LastmoveRight();
thread secretpeg();
thread secretup();
thread guidsecret();
thread jumpfail();
thread jumpfail2();
thread Jumpweapon();
thread oldroom();
thread fornoobs();
thread secretwall();

}

ambient()
{
iprintlnbold ( "Music in 3..." );
wait (3.0);
AmbientPlay ( "werk" );
}

transporter()
{
	for(;;)
	{
  		self waittill( "trigger", player );
  		entTarget = getEnt( self.target, "targetname" );
  		wait (0.1);
  		player setOrigin( entTarget.origin );
  		player setplayerangles( entTarget.angles );
 	 	wait (0.1);
		player GiveWeapon("deserteaglegold_mp");
		wait (0.05);
		player SwitchToWeapon("remington700_mp");
		wait (0.05);
   		self playsound("mp_enemy_obj_captured");
   		iprintlnbold ("^1Dafuq?");
		player braxi\_rank::giveRankXP("", 5);
		
	}

}

trap6()
{
 object = getent("dickmove", "targetname");
 trigger = getent("trigger6", "targetname");

 trigger waittill("trigger",player);

  
 while (1)
 {
 object movez (-300,0.25);
 object waittill ("movedone");
 wait (0.1);
 object movez (300,0.25);
 object waittill ("movedone");
 wait (0.3);
 }
}

trap6b()
{
 object = getent("dickmove2", "targetname");
 trigger = getent("trigger6", "targetname");

 trigger waittill("trigger",player);


  
 while (1)
 {
 object movez (-300,0.25);
 object waittill ("movedone");
 wait (0.1);
 object movez (300,0.25);
 object waittill ("movedone");
 wait (0.3);
 }

}

trap5()
{
 object = getent("target5", "targetname");
 trigger = getent("trigger5", "targetname");
 
 trigger waittill("trigger", player);

 
 while (1)
 {
  object movez (050,1);
  object waittill ("movedone");
  wait (0.2);
  object movez (-050,1);
  object waittill ("movedone");
  wait (0.2);
 }


}
trap4a()
{
 object = getent("SNS1", "targetname");
 trigger = getent("trigger4", "targetname");

 trigger waittill("trigger", player);



 while (1)
 {
  object movez (050,1);
  object waittill ("movedone");
  wait (0.2);
  object movez (-050,1);
  object waittill ("movedone");
  wait (0.2);
 }

}
trap4b()
{
 object = getent("SNS2", "targetname");
 trigger = getent("trigger4", "targetname");

 trigger waittill("trigger", player);


 while (1)
 {
  object movez (-050,1);
  object waittill ("movedone");
  wait (0.2);
  object movez (050,1);
  object waittill ("movedone");
  wait (0.2);
 }
}
trap3()
{
 object = getent("MvingBs", "targetname");
 trigger = getent("trigger3", "targetname");
 
 trigger waittill("trigger", player);
 

 while (1)
 {
  object movex (140,1);
  object waittill ("movedone");
  wait (0.2);
  object movex (-140,1);
  object waittill ("movedone");
  wait (0.2);
 }

 

}
trap2()
{
 object = getent("firstblock", "targetname");
 trigger = getent("trigger2", "targetname");

 trigger waittill("trigger", player);


 object movez (300,0.25);
 object waittill ("movedone");
 wait (1.0);
 object movez (-300,3);
 wait (0.2);
}
teleport()
{
	trig = getent("gosecret", "targetname");
	spawn = getent("spot1", "targetname");
	

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
		wait (0.05);
		player iPrintLnBold("^2Welcome^7 to the ^5Secret ^7Room!");
	}
}
teleport2()
{
	trig = getent("ufailinsecret", "targetname");
	spawn = getent("spot1", "targetname");

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
		wait (0.05);
		player iPrintLnBold("^1HAHAHA ^7Seriously? You failed in ^2Secret?");
	}
}
secretfail()
{
	trig = getent("jumpfail", "targetname");
	spawn = getent("jumpreset", "targetname");

	while (1)
	{
		trig waittill("trigger", player);
		player SetPlayerAngles ( spawn.angles );
		player SetOrigin ( spawn.origin );
		wait (0.05);
		player iPrintLnBold("^1HAHAHA ^7Seriously? You failed in ^2Secret?");
	}
}
kniferoom()
{
    level.knife_trig = getEnt( "Knife", "targetname");
    jump = getEnt( "jumper_enter_kniferoom", "targetname" );
    acti = getEnt( "activator_enter_kniferoom", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
		level.old_trig delete();
		level.jump_trig delete();
		level.weapon_trig delete();
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
        iPrintlnBold( " ^5" + player.name + " ^3 picked ^1knife^7!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sniperoom()
{
    level.snipe_trig = getEnt( "Sniper", "targetname");
    jump = getEnt( "jumper_enter_sniperoom", "targetname" );
    acti = getEnt( "activator_enter_sniperoom", "targetname" );
    
    while(1)
    {
        level.snipe_trig waittill( "trigger", player );
        if( !isDefined( level.snipe_trig ) )
            return;
			
		if(level.firstenter==true)
		{
        level.jump_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.weapon_trig delete();
		level.firstenter=false;
		}
        
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "M40A3_acog_mp" );
	player GiveWeapon( "remington700_acog_mp" );     
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "m40a3_acog_mp" );
	level.activ GiveWeapon( "remington700_acog_mp" );         
        wait 0.05;
        player switchToWeapon( "m40a3_acog_mp" );
        level.activ SwitchToWeapon( "m40a3_acog_mp" );
        iPrintlnBold( " ^5" + player.name + " ^3 picked ^1SHNIPAH^7!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

room_gun()
{
	j1 = getent ("j1", "targetname");

	while(1)
	{
		j1 waittill("trigger", player);
		if ( !isDefined( j1 ) )
	     		return;

		wait (0.2);
		x = 1+RandomInt(3);
		gun = GetRandomWeapon( x );
		player GiveWeapon( gun );
		level.activ GiveWeapon( gun );
		wait 0.05;
		player SwitchToWeapon( gun );
		level.activ SwitchToWeapon( gun );
		while( isAlive( player ) && isDefined( player ) )
		    wait (1);	
	}
}

GetRandomWeapon( num )
{
    if( num == 2 )
        return "m40a3_mp";
    else
    {
        x = RandomInt( 51 );
        if( x < 10 )
            return "winchester1200_mp";
        if( x > 9 && x < 20 )
            return "skorpion_mp";
        if( x > 20 && x < 30 )
            return "m4_mp";
        if( x > 30 && x < 40 )
            return "g3_mp";
        if( x > 40 && x < 50 )
            return "ak47_mp";
        if( x == 50 )
            return "rpd_mp"; //you may add more weapons but copy the order its in
    }
}

weaponroom()
{
    level.weapon_trig = getEnt( "Weapon", "targetname");
    jump = getEnt( "jumper_enter_weaponroom", "targetname" );
    acti = getEnt( "activator_enter_weaponroom", "targetname" );
    
    while(1)
    {
        level.weapon_trig waittill( "trigger", player );
        if( !isDefined( level.weapon_trig ) )
            return;
        
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.jump_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons(); 
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();       
        wait 0.05;
        iPrintlnBold( " ^5" + player.name + " ^3 picked ^1WEAPON^7!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}
LastmoveLeft()
{
 object = getent("t5gl", "targetname");

 while (1)
 {
  object movey (-050,1);
  object waittill ("movedone");
  wait (0.2);
  object movey (050,1);
  object waittill ("movedone");
  wait (0.2);
 }
}
LastmoveRight()
{
 object = getent("t5gr", "targetname");

 while (1)
 {
  object movey (050,1);
  object waittill ("movedone");
  wait (0.2);
  object movey (-050,1);
  object waittill ("movedone");
  wait (0.2);
 }
}
secretpeg()
{
 object = getent("secretpeg", "targetname");

 while (1)
 {
 object movex (-250,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (-250,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (250,1);
 object waittill ("movedone");
 wait (0.3);
 object movex (250,1);
 object waittill ("movedone");
 wait (0.3);
 }
}
secretup()
{
 object = getent("sup", "targetname");

 while (1)
 {
 object movez (050,0.25);
 object waittill ("movedone");
 object movey (075,0.25);
 object waittill ("movedone");
 object movey (-075,0.5);
 object waittill ("movedone");
 object movez (-050,0.5);
 object waittill ("movedone");
 }
}

bossbounce()
{
 trig = getent("bossbounce", "targetname");
 
  		trig waittill("trigger", player);
		wait (0.05);
        	iPrintlnBold( " ^5" + player.name + " ^7is a ^1BOSS^7!" );
		player braxi\_rank::giveRankXP("", 50);		
}

 
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

actisecret()
{
    level.secret_trig = getEnt( "datacti", "targetname");
    level.secret_trig waittill( "trigger", player );
	if( !isDefined( level.secret_trig ) )
            return;
        if(level.firstenter==true)
		{
        level.secret_trig delete();
		thread teleport();
		thread bossbounce();
		iPrintlnBold( "^1Activators ^7are supposed to ^1Activate^7..." );
		AmbientStop( 2 );
		AmbientPlay( "datwoofer" );
		}
}

guidsecret()
{
 vip_trig = getent("Authorization", "targetname");
 org = getEnt( "lvl", "targetname" );	
 level.darmuh = "[Nova]Darmuh"; //Darmuh
    
        vip_trig waittill( "trigger", player );
        
        {
            if( player.name == level.darmuh)
            {
                player SetOrigin( org.origin );
				player SetPlayerAngles ( org.angles );
				wait (0.05);
				iprintlnbold ( " ^3Darmuh ^7is all up in dis bitch^5!" );
		        player braxi\_rank::giveRankXP("", 100);		
            }
            else
            {
				wait (1);
            }
        }
} 

Jumproom()
{
    level.jump_trig = getEnt( "Jump", "targetname");
    jump = getEnt( "jumper_enter_jumproom", "targetname" );
    acti = getEnt( "activator_enter_jumproom", "targetname" );
    while(1)
    {
        level.jump_trig waittill( "trigger", player );
        if(level.firstenter==true)
		{
        level.snipe_trig delete();
		level.old_trig delete();
		level.knife_trig delete();
		level.weapon_trig delete();
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
        iPrintlnBold( " ^5" + player.name + " ^3 picked ^1JUMP^7!" );
		wait 0.05;
		AmbientStop( 2 );
		AmbientPlay( "jumproom" );
		wait 1;
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

Jumpfail()
{
	trig = getent("jumpfail1", "targetname");
	jump = getEnt( "jumper_reset", "targetname" );
    acti = getEnt( "activator_reset", "targetname" );

	while (1)
	{
		trig waittill( "trigger", player );
		if(player == level.activ)
		{
		wait (0.05);
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		}
		else
		{
		wait (0.05);
		player SetPlayerAngles ( jump.angles );
		player SetOrigin ( jump.origin );
		}
		
	}
}
Jumpfail2()
{
	trig = getent("jumpfail2", "targetname");
	jump = getEnt( "jump_reset", "targetname" );
    acti = getEnt( "acti_reset", "targetname" );

	while (1)
	{
		trig waittill( "trigger", player );
		if(player == level.activ)
		{
		wait (0.05);
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		}
		else
		{
		wait (0.05);
		player SetPlayerAngles ( jump.angles );
		player SetOrigin ( jump.origin );
		}
		
	}
}
Jumpweapon()
{
	level.jwep_trig = getent( "jumpweapon", "targetname");
	
	while(1) 
	{
	
	level.jwep_trig waittill( "trigger", player );
	if(level.first==true)
		{
        level.jwep_trig delete();
	level.first=false;
		}
		if(player == level.activ)
		{
			wait (0.05);
			level.activ GiveWeapon( "rpd_mp");
			wait (0.05);
			level.activ switchToWeapon( "rpd_mp");
			iPrintlnBold( " ^1" + player.name + " ^7grabbed the ^1RPD^7!" );
			wait (0.05);
		}
		if(player != level.activ)
		{
		wait (0.05);
		player GiveWeapon( "rpd_mp");
		wait (0.05);
        player switchToWeapon( "rpd_mp" );
        iPrintlnBold( " ^5" + player.name + " ^7grabbed the ^1RPD^7!" );
		wait (0.05);
		}
	}
}
OldRoom()
{
    level.old_trig = getEnt( "Classic", "targetname");
	object = getent("doorsold", "targetname");
	trig = getent( "Classic", "targetname");
	
        level.old_trig waittill( "trigger", player );
        if( !isDefined( level.old_trig ) )
            return;
	
	if(level.firstenter==true)
		{
        level.snipe_trig delete();
		level.jump_trig delete();
		level.knife_trig delete();
		level.weapon_trig delete();
		level.firstenter=false;
		}
	
		trig waittill( "trigger", player );
		object movez (175,5);
		object waittill ("movedone");
		wait (0.2);
		iPrintlnBold( " ^5" + player.name + " ^3 picked ^1Classic^7!" );
		wait (0.2);
		
}
fornoobs()
{
 object = getent("noobs", "targetname");

 while (1)
 {
 object movex (450,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (-850,1);
 object waittill ("movedone");
 wait (0.3);
 object movex (-450,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (850,1);
 object waittill ("movedone");
 wait (0.3);
 object movex (450,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (-850,1);
 object waittill ("movedone");
 wait (0.3);
 object movex (-450,1);
 object waittill ("movedone");
 wait (0.3);
 object movey (850,1);
 object waittill ("movedone");
 wait (0.3);

 }
}

secretwall()
{
 object = getent("notsolid", "targetname");
 
 object notsolid();
}
 
