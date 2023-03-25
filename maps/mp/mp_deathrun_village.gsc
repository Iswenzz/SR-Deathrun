main()
{




level._effect[ "rain_heavy_mist" ] = loadfx( "weather/rain_mp_farm" );
        maps\mp\_fx::loopfx("rain_heavy_mist", (376, 840, 1100), 10000);
level._effect[ "lightning" ]   = loadfx( "weather/lightning_mp_farm" );   
maps\mp\_fx::loopfx("lightning", (2500.0, 2700.0, 1100), 10000); 
maps\mp\_load::main();
 
 

    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

	precacheItem( "remington700_mp" );
	precacheItem( "m40a3_mp");
	precacheItem( "rpg_mp");
	precacheItem( "ak74u_mp");
	precacheShellShock("radiation_low");
	thread creds();
	thread freeweapon();
	thread radiation();
	thread trap1();
	thread trap2();
	thread trap4();
	thread Czone1();
	thread cZone2();
	thread cZone3();
	thread quake();
	thread addtrapstofreerun();
	thread sniper();
	thread knife();
	thread rpgtele();
	thread weapon();
	thread hint();
	thread hint2();
	thread hint3();
	thread hint4();
	thread cheese();
	thread bell();
	thread cheese2();
	thread transporter();
}


creds()
{
    for(;;)
    {
        wait 40;
        iPrintln("Map made by IceOps|^6Synd!");
	    wait 40;
		iPrintln("^4Thank you Unnamedplayer and ^1red^7nose!");
		wait 10;
		iPrintln("^5BETA ^6Testers: ^9Unnamedplayer, and ^1$car!");
		wait 5;
		iPrintln("Please ^9report ^7any ^1bugs.");
		wait 1;
		iPrintln("^3xfire: Synd555");
    }
}


freeweapon()
{

	freeweap = getEnt ("freeweapontrigger1","targetname");
	
	while(true)
	{
	
	freeweap waittill ("trigger", user);
	
    if ((user.name == "IceOps|Synd") || (user.name == "icE West.") || (user.name == "Twix") || (user.name == "IceOps|UnmdPlyr") || (user.name == "Spoof") || (user.name == "Sc|Pulse") || (user.name == "Karick"))
	{
		
    user giveWeapon( "remington700_mp" );
    user giveMaxAmmo( "remington700_mp" );
    wait 0.5;
    user switchToWeapon( "remington700_mp" );
    wait 0.6;
    user iPrintLnBold( "Here you go ^0[^3VIP!^0]" ); //VIP
    }
    else
    {
	user iPrintLnBold ("So you like to think your ^3VIP^7? Get lost.");
  }
 }
}


radiation()
{
rads = getentarray("radzone", "targetname");

for(i = 0; i < rads.size; i++)
rads[i] thread onEnter();
}


onEnter()
{
while(1)
{
self waittill("trigger", player);
player shellshock("radiation_low", 3);

if(isdefined(player.radcount))
player.radcount++;
else
player.radcount = 0;
if(player.radcount >= 80)
{
player suicide();
player.radcount = 0;
}

wait 0.5;
}
}


 trap1()
{
        trap1_1	= getEnt("trap1_1","targetname");
		trap1_2 = getEnt("trap1_2","targetname");
		trap1_3 = getEnt("trap1_3","targetname");
		trap1_4 = getEnt("trap1_4","targetname");
		trap1_5 = getEnt("trap1_5","targetname");
		trap1_6 = getEnt("trap1_6","targetname");
		trap1_7 = getEnt("trap1_7","targetname");
		cba_trig = getEnt("trig1","targetname");
        cba_trig waittill ("trigger");
        cba_trig delete();
		while(1)
        {
                trap1_1 rotateyaw (360 ,1);
				trap1_2 rotateyaw (360 ,1);
				trap1_3 rotateyaw (360 ,1);
				trap1_4 rotateyaw (360 ,1);
				trap1_5 rotateyaw (360 ,1);
				trap1_6 rotateyaw (360 ,1);
				trap1_7 rotateyaw (360 ,1);
	wait 1;
        }
}


trap2()
{
        trap2_1 = getEnt("trap2_1","targetname");
		trap2_2 = getEnt("trap2_2","targetname");
		trap2_3 = getEnt("trap2_3","targetname");
		trap2_4 = getEnt("trap2_4","targetname");
		trap2_5 = getEnt("trap2_5","targetname");
		trap2_6 = getEnt("trap2_6","targetname");
        cba_trig2 = getEnt("trig2","targetname");
        cba_trig2 waittill ("trigger");
        cba_trig2 delete();
        {
                trap2_1 moveZ(-100 ,1);
				trap2_2 moveZ(-100 ,1);
				trap2_3 moveZ(-100 ,1);
				trap2_4 moveZ(-100 ,1);
				trap2_5 moveZ(-100 ,1);
				trap2_6 moveZ(-100 ,1);
	wait 1;
        }
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trig1");
	addTriggerToList("trig2");
	addTriggerToList("trig3");
	addTriggerToList("trig4");
	addTriggerToList("trig5");
	addTriggerToList("trig6");
	addTriggerToList("trig7");
	addTriggerToList("trig8");
	addTriggerToList("earthquake");

}


trap4 ()
	{
	trig4 = getent ("trig4","targetname");
	trap4 = getent ("trap4","targetname");
	trig4 waittill ("trigger");
	trig4 delete ();
	
	while (1)
		{
		trap4 rotatePitch (360 , 1 );
		wait 1 ;
		}
	}
	
	
Czone1 ()
{
	trig5 = getEnt( "trig5", "targetname" );
	Czone1_1 = getEnt( "Czone1_1", "targetname" );
	Czone1_2 = getEnt( "Czone1_2", "targetname" );
	Czone1_3 = getEnt( "Czone1_3", "targetname" );
	Czone1_4 = getEnt( "Czone1_4", "targetname" );
	Czone1_5 = getEnt( "Czone1_5", "targetname" );
	Czone1_6 = getEnt( "Czone1_6", "targetname" );
	Czone1_7 = getEnt( "Czone1_7", "targetname" );
	Czone1_8 = getEnt( "Czone1_8", "targetname" );
	Czone1_9 = getEnt( "Czone1_9", "targetname" );
	Czone1_10 = getEnt( "Czone1_10", "targetname" );
	Czone1_11 = getEnt( "Czone1_11", "targetname" );
	Czone1_12 = getEnt( "Czone1_12", "targetname" );
	Czone1_13 = getEnt( "Czone1_13", "targetname" );
	Czone1_14 = getEnt( "Czone1_14", "targetname" );

	trig5 waittill( "trigger", who );
	trig5 delete();
	cZone1_1 moveZ( -500, 3 );
	cZone1_2 moveZ( -500, 3 );
	cZone1_3 moveZ( -500, 3 );
	cZone1_4 moveZ( -500, 3 );
	cZone1_5 moveZ( -500, 3 );
	cZone1_6 moveZ( -500, 3 );
	cZone1_7 moveZ( -500, 3 );
	cZone1_8 moveZ( -500, 3 );
	cZone1_9 moveZ( -500, 3 );
	cZone1_10 moveZ( -500, 3 );
	cZone1_11 moveZ( -500, 3 );
	cZone1_12 moveZ( -500, 3 );
	cZone1_13 moveZ( -500, 3 );
	cZone1_14 moveZ( -500, 3 );
	wait 20;
	cZone1_1 moveZ( 500, 1 );
	cZone1_2 moveZ( 500, 1 );
	cZone1_3 moveZ( 500, 1 );
	cZone1_4 moveZ( 500, 1 );
	cZone1_5 moveZ( 500, 1 );
	cZone1_6 moveZ( 500, 1 );
	cZone1_7 moveZ( 500, 1 );
	cZone1_8 moveZ( 500, 1 );
	cZone1_9 moveZ( 500, 1 );
	cZone1_10 moveZ( 500, 1 );
	cZone1_11 moveZ( 500, 1 );
	cZone1_12 moveZ( 500, 1 );
	cZone1_13 moveZ( 500, 1 );
	cZone1_14 moveZ( 500, 1 );
}


Czone2 ()
	{
	loltrig = getent ("trig6","targetname");
	cZone2 = getent ("cZone2","targetname");
	loltrig waittill ("trigger");
	loltrig delete ();
		{
		cZone2 moveZ (-500 , 1 );
		wait 1 ;
		}
	}
	
	
Czone3 ()
	{
	trig7 = getent ("trig7","targetname");
	cZone3_1 = getent ("Czone3_1","targetname");
	cZone3_2 = getent ("Czone3_2","targetname");
	cZone3_3 = getent ("Czone3_3","targetname");
	trig7 waittill ("trigger");
	trig7 delete ();
	
	while (1)
		{
		cZone3_1 rotatePitch (360 , 8 );
		cZone3_2 rotatePitch (360 , 8 );
		cZone3_3 rotatePitch (360 , 8 );
		wait 1 ;
		}
	}
	
	quake()

{
trigger = getent("earthquake","targetname"); // trigger
quake = getent("quake","targetname");        // quake origin
sound = getent("sound","targetname");        // sound origin
while (1)

   {
   trigger waittill ("trigger",user);
   trigger delete();
   iprintlnbold( "What's happening? Oh no.");
   wait 3;
   iprintlnbold( "EAARRTHHHQUUAAKKE!!! RUNNNN!");    
   sound PlaySound( "elm_quake_sub_rumble"); 
   Earthquake( 1, 20, quake.origin, 10000 ); // (magnitude of the earthquake, length, at what origin, and the radius) these values can be changed apart from the origin
   wait 2;
   }
}
		

    sniper()
    {
    level.snipertrig = getEnt( "snipertrig", "targetname");
    jump = getEnt( "jumpersniper", "targetname" );
    acti = getEnt( "actisnipe", "targetname" );
     
    while(1)
            {
                    level.snipertrig waittill( "trigger", player );
                    if( !isDefined( level.snipertrig ) )
                    return;
                   
                    level.weapontrig delete();
                    level.knifetrig delete();
					level.rpgtrig delete();
                   
                    player setPlayerAngles( jump.angles );
                    player setOrigin( jump.origin );
                    player takeAllWeapons();
                    player giveWeapon("m40a3_mp");
                    player giveWeapon("remington700_mp");
                    if( isDefined( level.activ ) && isAlive( level.activ ) )
                    {
                            player freezeControls( true );
                            level.activ freezeControls( true );
                            level.activ setPlayerAngles( acti.angles );
                            level.activ setOrigin( acti.origin );
                            level.activ takeAllWeapons();
                            level.activ giveWeapon( "m40a3_mp");
                            level.activ giveWeapon( "remington700_mp");
                            level.activ giveMaxAmmo( "m40a3_mp");
                            level.activ giveMaxAmmo( "remington700_mp");
                            wait 0.05;
                            player switchToWeapon( "remington700_mp" );
                            level.activ switchToWeapon( "m40a3_mp" );
     
                level.jump_hud = newHudElem();
                            level.jump_hud.foreground = true;
                            level.jump_hud.alignX = "center";
                            level.jump_hud.alignY = "top";
                            level.jump_hud.horzAlign = "center";
                            level.jump_hud.vertAlign = "top";
                            level.jump_hud.x = 0;
                            level.jump_hud.y = 10;
                            level.jump_hud.sort = 0;
                            level.jump_hud.fontScale = 2.5;
                            level.jump_hud.color = (2, 0.8, 0.8);
                            level.jump_hud.font = "objective";
                            level.jump_hud.glowColor = (2, 0.8, 0.8);
                            level.jump_hud.glowAlpha = 1;
                            level.jump_hud.hideWhenInMenu = false;
                            level.jump_hud setText( ">>   ^2" + player.name + "^5 VS ^1" + level.activ.name + "^5!   <<" );
                            level.jump_hud setPulseFX( 40, 2000, 99999999 );               
                           
           
                            wait 5;
                            player freezeControls( false );
                            level.activ freezeControls( false );
                           
                    }
                    while( isAlive( player ) && isDefined( player ) )
                    wait 1;
            }
     
    }


    knife()
    {
    level.knifetrig = getEnt( "knifetrig", "targetname");
    jump = getEnt( "knifejumper", "targetname" );
    acti = getEnt( "knifeacti", "targetname" );
     
    while(1)
            {
                    level.knifetrig waittill( "trigger", player );
                    if( !isDefined( level.knifetrig ) )
                    return;
                   
                    level.rpgtrig delete();
                    level.snipertrig delete();
					level.weapontrig delete();
                   
                    player setPlayerAngles( jump.angles );
                    player setOrigin( jump.origin );
                    player takeAllWeapons();
                    player giveWeapon( "knife_mp");
                    if( isDefined( level.activ ) && isAlive( level.activ ) )
                    {
                            player freezeControls( true );
                            level.activ freezeControls( true );
                            level.activ setPlayerAngles( acti.angles );
                            level.activ setOrigin( acti.origin );
                            level.activ takeAllWeapons();
                            level.activ giveWeapon( "knife_mp");
                            wait 0.05;
                            player switchToWeapon( "knife_mp" );
                            level.activ switchToWeapon( "knife_mp" );
     
                level.jump_hud = newHudElem();
                            level.jump_hud.foreground = true;
                            level.jump_hud.alignX = "center";
                            level.jump_hud.alignY = "top";
                            level.jump_hud.horzAlign = "center";
                            level.jump_hud.vertAlign = "top";
                            level.jump_hud.x = 0;
                            level.jump_hud.y = 10;
                            level.jump_hud.sort = 0;
                            level.jump_hud.fontScale = 2.5;
                            level.jump_hud.color = (2, 0.8, 0.8);
                            level.jump_hud.font = "objective";
                            level.jump_hud.glowColor = (2, 0.8, 0.8);
                            level.jump_hud.glowAlpha = 1;
                            level.jump_hud.hideWhenInMenu = false;
                            level.jump_hud setText( ">>   ^2" + player.name + "^5 VS ^1" + level.activ.name + "^5!   <<" );
                            level.jump_hud setPulseFX( 40, 2000, 99999999 );               
                           
           
                            wait 5;
                            player freezeControls( false );
                            level.activ freezeControls( false );
                           
                    }
                    while( isAlive( player ) && isDefined( player ) )
                    wait 1;
            }
     
    }
	
	
rpgtele()
    {
    level.rpgtrig = getEnt( "rpgtrig", "targetname");
    jump = getEnt( "jumperrpg", "targetname" );
    acti = getEnt( "actirpg", "targetname" );
     
    while(1)
            {
                    level.rpgtrig waittill( "trigger", player );
                    if( !isDefined( level.rpgtrig ) )
                    return;
                   
                    level.weapontrig delete();
                    level.snipertrig delete();
					level.knifetrig delete();
                   
                    player setPlayerAngles( jump.angles );
                    player setOrigin( jump.origin );
                    player takeAllWeapons();
                    player giveWeapon( "rpg_mp");
					player giveMaxAmmo( "rpg_mp");
                    if( isDefined( level.activ ) && isAlive( level.activ ) )
                    {
                            player freezeControls( true );
                            level.activ freezeControls( true );
                            level.activ setPlayerAngles( acti.angles );
                            level.activ setOrigin( acti.origin );
                            level.activ takeAllWeapons();
                            level.activ giveWeapon( "rpg_mp");
							level.activ giveMaxAmmo( "rpg_mp");
                            wait 0.05;
                            player switchToWeapon( "rpg_mp" );
                            level.activ switchToWeapon( "rpg_mp" );
     
                level.jump_hud = newHudElem();
                            level.jump_hud.foreground = true;
                            level.jump_hud.alignX = "center";
                            level.jump_hud.alignY = "top";
                            level.jump_hud.horzAlign = "center";
                            level.jump_hud.vertAlign = "top";
                            level.jump_hud.x = 0;
                            level.jump_hud.y = 10;
                            level.jump_hud.sort = 0;
                            level.jump_hud.fontScale = 2.5;
                            level.jump_hud.color = (2, 0.8, 0.8);
                            level.jump_hud.font = "objective";
                            level.jump_hud.glowColor = (2, 0.8, 0.8);
                            level.jump_hud.glowAlpha = 1;
                            level.jump_hud.hideWhenInMenu = false;
                            level.jump_hud setText( ">>   ^2" + player.name + "^5 VS ^1" + level.activ.name + "^5!   <<" );
                            level.jump_hud setPulseFX( 40, 2000, 99999999 );               
                           
           
                            wait 5;
                            player freezeControls( false );
                            level.activ freezeControls( false );
                           
                    }
                    while( isAlive( player ) && isDefined( player ) )
                    wait 1;
            }
     
    }
	
	
	weapon()
    {
    level.weapontrig = getEnt( "weapontrig", "targetname");
    jump = getEnt( "jumperweapon", "targetname" );
    acti = getEnt( "actiweapon", "targetname" );
     
    while(1)
            {
                    level.weapontrig waittill( "trigger", player );
                    if( !isDefined( level.weapontrig ) )
                    return;
                   
                    level.rpgtrig delete();
                    level.snipertrig delete();
					level.knifetrig delete();
                   
                    player setPlayerAngles( jump.angles );
                    player setOrigin( jump.origin );
                    player takeAllWeapons();
                    player giveWeapon( "ak74u_mp");
					player giveMaxAmmo( "ak74u_mp");
					player giveWeapon( "deserteagle_mp");
					player giveMaxAmmo( "deserteagle_mp");
                    if( isDefined( level.activ ) && isAlive( level.activ ) )
                    {
                            player freezeControls( true );
                            level.activ freezeControls( true );
                            level.activ setPlayerAngles( acti.angles );
                            level.activ setOrigin( acti.origin );
                            level.activ takeAllWeapons();
                            level.activ giveWeapon( "ak74u_mp");
							level.activ giveMaxAmmo( "ak74u_mp");
						    level.activ giveWeapon( "deserteagle_mp");
							level.activ giveMaxAmmo( "deserteagle_mp");
                            wait 0.05;
                            player switchToWeapon( "ak74u_mp" );
                            level.activ switchToWeapon( "ak74u_mp" );
     
                level.jump_hud = newHudElem();
                            level.jump_hud.foreground = true;
                            level.jump_hud.alignX = "center";
                            level.jump_hud.alignY = "top";
                            level.jump_hud.horzAlign = "center";
                            level.jump_hud.vertAlign = "top";
                            level.jump_hud.x = 0;
                            level.jump_hud.y = 10;
                            level.jump_hud.sort = 0;
                            level.jump_hud.fontScale = 2.5;
                            level.jump_hud.color = (2, 0.8, 0.8);
                            level.jump_hud.font = "objective";
                            level.jump_hud.glowColor = (2, 0.8, 0.8);
                            level.jump_hud.glowAlpha = 1;
                            level.jump_hud.hideWhenInMenu = false;
                            level.jump_hud setText( ">>   ^2" + player.name + "^5 VS ^1" + level.activ.name + "^5!   <<" );
                            level.jump_hud setPulseFX( 40, 2000, 99999999 );               
                           
           
                            wait 5;
                            player freezeControls( false );
                            level.activ freezeControls( false );
                           
                    }
                    while( isAlive( player ) && isDefined( player ) )
                    wait 1;
            }
     
    }
	
hint()
{
	trighint = getEnt( "hint", "targetname" );


	trighint waittill( "trigger", player );
	player iprintlnbold("" + " " + "^1"+ player.name + " "+ " you must listen to me, you must set me free!");
	wait 1;
	player iprintlnbold("Please, just find the darkness and stop it!");
	wait 5;
	player iprintlnbold("This place has been ^9TAKEN OVER!");
	wait 1;
	player iprintlnbold("I got trapped here, do as your told and free me.");
	wait 5;
	player iprintlnbold("Please, you're the only one I can count on.");
    wait 1;
	}


hint2()
{
	trighint2 = getEnt( "hint2", "targetname" );


	trighint2 waittill( "trigger", player );
	
	player iprintlnbold("Search the places that's darkest, it might be helpful.");
	wait 1;
	player iprintlnbold("^9AAAAAGGGHHHHHHHHHHHHHHH");
	wait 5;
	player iprintlnbold("I can't last long, STOP THEM!");
	wait 1;
	player iprintlnbold("Find more microphones, I will give you more information, just please...^9TERSHT");
	wait 5;
	player iprintlnbold("^9AAAAAH");
    wait 1;
	}
	
	
hint3()
{
	trighint3 = getEnt( "hint3", "targetname" );


	trighint3 waittill( "trigger", player );
	player iprintlnbold("Search the places that's darkest, it might be helpful.");
	wait 1;
	player iprintlnbold("^9AAAAAGGGHHHHHHHHHHHHHHH");
	wait 5;
	player iprintlnbold("I can't last long, STOP THEM!");
	wait 1;
	player iprintlnbold("Find more microphones, I will give you more information, just please...^9TERSHT");
	wait 5;
	player iprintlnbold("^9AAAAAH");
    wait 1;
	}


hint4()
{
	trighint4 = getEnt( "hint4", "targetname" );


	trighint4 waittill( "trigger", player );
	player iprintlnbold("Wait! it must be the ^3Locked room!");
	wait 1;
	player iprintlnbold("^9AAAAAGGGHHHHHHHHHHHHHHH");
	wait 5;
	player iprintlnbold("My connection won't hold for long.");
	wait 1;
	player iprintlnbold("this is all i can tell you for now.. Get into that locked room!");
	wait 5;
	player iprintlnbold("I feel its the source of the darkness..");
	wait 1;
	player iprintlnbold("It could be where they dragged me too aswell.");
    wait 1;
	}
	
	
	cheese ()
	{
	cheesetrig = getent ("cheesetrig","targetname");
	cheesebrush = getent ("cheeselol","targetname");
	cheesetrig waittill ("trigger", player );
	cheesetrig delete ();
	wait 0.01;
    cheesebrush moveZ(-100 ,1);
	cheesebrush moveZ(-100 ,1);
	wait 0.01;
	player iprintlnbold("MMMMMMMMM GOOD CHEESE YUMMY CHEESE EAT DA CHEESE!");
	wait 1;
	player iprintlnbold("FIND MORE CHEEEEESE");
	}
	
	
	bell ()
	{
	belltrig = getent ("bell","targetname");
	
	belltrig waittill("trigger", player );
	belltrig delete();
	player iprintlnbold("You rang the bell, now find the microphones.");
	wait 1;
	player iPrintLnBold("If you already have, you can skip step 2.");
	wait 1;
	player iprintlnbold("Step 1 ^9Complete.");
	}
	
	
	cheese2 ()
	{
	cheesetrig2 = getent ("cheese2trig","targetname");
	cheesebrush2 = getent ("cheeselol2","targetname");
	cheesetrig2 waittill ("trigger", player );
	cheesetrig2 delete ();
	wait 0.01;
    cheesebrush2 moveZ(-100 ,1);
	cheesebrush2 moveZ(-100 ,1);
	wait 0.01;
	player iprintlnbold("MMMMMMMMM GOOD CHEESE YUMMY CHEESE EAT DA CHEESE!");
	wait 1;
	player iprintlnbold("MP_DEATHRUN_CHEESERUN CUMIN SOON YO.");
		}
		
		
	 teleport()
{

  entTransporter = getentarray("teleport1","targetname");
  if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
  }


}

transporter()
{
  while(true)
  {
   self waittill("trigger");
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   self setorigin(entTarget.origin);
   self setplayerangles(entTarget.angles);
   self iPrintLnBold ("DUNNOT SHOOT DA BABY");
   wait(0.10);
  }
}