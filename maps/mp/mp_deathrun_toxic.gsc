main()
{

//~~~~~~~~~~~~~~~~~~~~//
    maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

//~~~~~~~~~~DVARS~~~~~~~~~~//

	setdvar("r_specularcolorscale","1");
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");

	entTransporter = getentarray("tele1","targetname");
	if(isdefined(entTransporter))
		for(lp=0;lp<entTransporter.size;lp=lp+1)
		entTransporter[lp] thread Transporter();
			
	entTransporter = getentarray("tele2","targetname");
	if(isdefined(entTransporter))
		for(lp=0;lp<entTransporter.size;lp=lp+1)
		entTransporter[lp] thread Transporter2();

	entTransporter = getentarray("tele3","targetname");
	if(isdefined(entTransporter))
		for(lp=0;lp<entTransporter.size;lp=lp+1)
		entTransporter[lp] thread Transporter3();

//~~~~~~~~~~Triggers~~~~~~~~~~//
	addTriggerToList( "trigger_trap1" );
	addTriggerToList( "trigger_trap2" );
	addTriggerToList( "trigger_trap3" );
	addTriggerToList( "trigger_trap4" );
	addTriggerToList( "trigger_trap5" );
	addTriggerToList( "trigger_trap6" );
	addTriggerToList( "trigger_trap7" );
	addTriggerToList( "trigger_trap10" );
	
//~~~~~~~~~~PRECACHES~~~~~~~~~~//

	level.fire = loadFX("deathrun/trail1");
	level.boom = loadFX("deathrun/boom1");
	level.smoke = loadFX("deathrun/greensmoke");
	PreCacheItem("m40a3_mp");
	precacheItem("ballista_mp");
	precacheShader("mtl_plr_baa_joker_h­ead");
	precacheShader("mtl_plr_baa_joker_h­air");
	precacheShader("mtl_plr_baa_joker_b­ody"); 
	precacheModel("playermodel_baa_joker");
	
//~~~~~~~~~~THREADS~~~~~~~~~~//

	thread joker();
	thread startdoor();
	thread trap1a();
	thread trap1b();
 	thread trap2();
	thread trap3a();
	thread trap3b();
	thread trap4();
	thread trap5();
	thread trap6a();
	thread trap6b();
	thread trap6c();
	thread trap6d();
	thread trap7();
	thread trap10();
	thread olddoor();
	thread opensecrettrail();
	thread trail();
	thread opensecret2();
	thread secret2();
	thread deagleroom();
	thread sniperroom();
	thread bounceroom();
	thread kniferoom();
	thread flag_killer();
	thread mapper();
	thread xfire();
	thread help();
	thread vipmovement();
	thread ventsmoke();
	thread music();

}

//~~~~~~~~~~MUSIC~~~~~~~~~~//
music()
{
 x = randomInt(3);
    if(x == 0)
    {
		ambientPlay("sound1");
		iprintln ("Now Playing: Razor Sharp - Monstercat");
    }
    else if(x == 1)
    {
		ambientPlay("sound2");
		iprintln ("Now Playing: Self Destruct - Pegboard Nerds");
    }
    else if(x == 2)
    {
		ambientPlay("sound3");
		iprintln ("Now Playing: Flight - Monstercat");
    }
}
//~~~~~~~~~~START~DOOR~&~CREDITS~~~~~~~~~~//

ventsmoke()
{
	playLoopedFX(level.smoke, 0.05, (-448, -608, 272));
	playLoopedFX(level.smoke, 0.05, (-448, -1248, 272));
	playLoopedFX(level.smoke, 0.05, (-448, -1888, 272));
	playLoopedFX(level.smoke, 0.05, (-448, -2464, 272));
	playLoopedFX(level.smoke, 0.05, (-448, -3104, 272));
	playLoopedFX(level.smoke, 0.05, (-448, -3616, 272));
	
}

mapper()
{
	for(;;)
	{
		iprintln ("^3-->^2Map made by ^3Raid|^9Turtle^3<--");
		wait 15;
	}
}

xfire()
{
	for(;;)
	{
		iprintln ("^3-->^4Any bugs? ^6Message me on xFire ^1eliteninjaturtle^3<--");
		wait 25;
	}
}

help()
{
	for(;;)
	{
		iprintln ("^3-->^2Special thanks to ^9FearZ^3<--");
		wait 35;
	}
}

flag_killer()
{
    flag_trigger = getEnt("flag_death","targetname");
    
    while(1)
    {
        flag_trigger waittill("trigger",player);
        wait (0.1);
        iprintLnBold(player.name + " Shot The Flag!");
        wait (1);
        iprintLnBold(player.name + " Must Die!");
        wait (2);
        player suicide();
		wait (0.1);
		player SayAll( "^7Im a discrace to ^9Canada" );
    }
}

startdoor()
{
	door = getEnt("start_door","targetname");
	wait(12);

	wait(1);
	iPrintLnBold("^8Map Made By ^3Raid|^9Turtle");
	wait(2);
	iPrintLnBold("^2The door is opening in..."); //Change the message if you want
	wait(1);
	iPrintLnBold("^33");
	wait(1);
	iPrintLnBold("^32");
	wait(1);
	iPrintLnBold("^31");
	wait(0.5);
	
	door moveZ(-260,5);
	door waittill ("movedone");
}

transporter() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles); 
    wait(0.10); 
  } 
}

transporter2() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles); 
    wait(0.10); 
  } 
}

transporter3() 
{ 
  while(true) 
  { 
    self waittill("trigger",other); 
    entTarget = getent(self.target, "targetname"); 

    wait(0.10); 
    other setorigin(entTarget.origin); 
    other setplayerangles(entTarget.angles); 
    wait(0.10); 
  } 
}

//~~~~~~~~~~TRAPS~~~~~~~~~~//

trap1a()
{
	trigger1 = getEnt ("trigger_trap1", "targetname");
	trap1a = getEnt ("trap1a", "targetname");
	trap1b = getEnt ("trap1b", "targetname");

	trigger1 setHintString ("^3Press [Use] To Activate");
		trigger1 waittill ("trigger", player);
	trigger1 setHintString ("^8Activated");

		trap1a rotateroll(90,0.5);
		trap1a waittill ("rotatedone");

		wait(4);

		trap1a rotateroll(-90,0.5);
		trap1a waittill ("rotatedone");
		
}

trap1b()
{
	trigger1 = getEnt ("trigger_trap1", "targetname");
	trap1b = getEnt ("trap1b", "targetname");

		trigger1 waittill ("trigger", player);
	
		trap1b rotateroll(-90,0.5);
		trap1b waittill ("rotatedone");

		wait(4);

		trap1b rotateroll(90,0.5);
		trap1b waittill ("rotatedone");
		
}

trap2()
{
	trigger2 = getEnt ("trigger_trap2", "targetname");
	rotating = getent ("rotate_trap", "targetname");

	trigger2 setHintString ("^3Press [Use] To Activate");
    	trigger2 waittill ("trigger", player);
	trigger2 setHintString ("^8Activated");

	while(1)
		{
		rotating rotateroll(360,4);
		rotating waittill ("rotatedone");
		}
}

trap3a()
{
	trigger3 = getEnt ("trigger_trap3", "targetname");
	trap3a = getEnt ("trap3a", "targetname");
	
	trigger3 setHintString ("^3Press [Use] To Activate");
    	trigger3 waittill ("trigger", player);
	trigger3 setHintString ("^8Activated");

	while(1)
	{
	trap3a rotatepitch(720,3);
	trap3a waittill ("rotatedone");
	
	wait(2);
	}
}

trap3b()
{
	trigger3 = getEnt ("trigger_trap3", "targetname");
	trap3b = getEnt ("trap3b", "targetname");
	
    	trigger3 waittill ("trigger", player);

	while(1)
	{
	trap3b rotatepitch(-720,3);
	trap3b waittill ("rotatedone");
	
	wait(2);
	}
}


trap4()
{
	trigger4 = getEnt ("trigger_trap4", "targetname");
	solid = getent ("nosolid", "targetname");


	trigger4 setHintString ("^3Press [Use] To Activate");
    	trigger4 waittill ("trigger", player);
	trigger4 setHintString ("^8Activated");
	
		playFx(level.boom, (0, -3100, 255));
		playFx(level.boom, (0, -3360, 255));
		
		solid hide();
		solid notsolid();
	
}

trap5()
{
	trigger5 = getEnt ("trigger_trap5", "targetname");
	rotate_trap5 = getent ("trap5", "targetname");

	trigger5 setHintString ("^3Press [Use] To Activate");
    	trigger5 waittill ("trigger", player);
	trigger5 setHintString ("^8Activated");

	while(1)
		{
		rotate_trap5 rotatepitch(720,1);
		rotate_trap5 waittill ("rotatedone");
		wait(5);
		}
}

trap6a()
{
	trigger6 = getEnt ("trigger_trap6", "targetname");
	rotation1 = getent ("trap6a", "targetname");

	trigger6 setHintString ("^3Press [Use] To Activate");
    	trigger6 waittill ("trigger", player);
	trigger6 setHintString ("^8Activated");

	while(1)
		{
		rotation1 rotatepitch(360,2);
		rotation1 waittill ("rotatedone");
		}
}

trap6b()
{
	trigger6 = getEnt ("trigger_trap6", "targetname");
	rotation2 = getent ("trap6b", "targetname");

	trigger6 waittill ("trigger", player);

	while(1)
		{
		rotation2 rotatepitch(-360,2);
		rotation2 waittill ("rotatedone");
		}

}

trap6c()
{
	trigger6 = getEnt ("trigger_trap6", "targetname");
	rotation3 = getent ("trap6c", "targetname");

	trigger6 waittill ("trigger", player);

	while(1)
		{
		rotation3 rotatepitch(360,2);
		rotation3 waittill ("rotatedone");
		}

}

trap6d()
{
	trigger6 = getEnt ("trigger_trap6", "targetname");
	rotation4 = getent ("trap6d", "targetname");

	trigger6 waittill ("trigger", player);

	while(1)
		{
		rotation4 rotatepitch(-360,2);
		rotation4 waittill ("rotatedone");
		}

}

trap7()
{
	trigger7 = getEnt ("trigger_trap7", "targetname");
	trap7a = getent ("trap7a", "targetname");
	trap7b = getent ("trap7b", "targetname");
	trap7c = getent ("trap7c", "targetname");

	trigger7 setHintString ("^3Press [Use] To Activate");
    trigger7 waittill ("trigger", player);
	trigger7 setHintString ("^8Activated");

	while(1)
	{
		trap7a movex(500,0.5);
		trap7a waittill ("movedone");
		wait(0.5);
		trap7a movex(-500,0.5);
		trap7a waittill ("movedone");

		wait(0.5);

		trap7b movex(-500,0.5);
		trap7b waittill ("movedone");
		wait(0.5);
		trap7b movex(500,0.5);
		trap7b waittill ("movedone");

		wait(0.5);
	}
}

trap10()
{
	trigger10 = getEnt ("trigger_trap10", "targetname");
	nonsolid10 = getent ("trap_10", "targetname");

	trigger10 setHintString ("^3Press [Use] To Activate");
    trigger10 waittill ("trigger", player);
	trigger10 setHintString ("^8Activated");

	nonsolid10 hide();
	nonsolid10 notsolid();
}

//~~~~~~~~~~OLD~ROOM~~~~~~~~~~//

olddoor()
{
	level.old_trigger = getEnt("oldroom","targetname");
	door = getEnt("oldroom_door","targetname");

	while(1)
	{
		level.old_trigger waittill("trigger",player);
		if(!isDefined(level.old_trigger))
			return;
		
		level.knife_trigger delete();
		level.deagle_trigger delete();
		level.snipe_trigger delete();
		level.bounce_trigger delete();
		level.old_trigger delete();
		
		iprintLnBold(player.name + " ^3Has Opened Old Room");
		door moveZ(300,5); // Z = up and down 300 is distance and 3 is time it takes in seconds

	}
}

//~~~~~~~~~~DEAGLE~ROOM~~~~~~~~~~//

deagleroom()
{
	jumper_deagle = getEnt ("jumper_spawn_deagle", "targetname" );
	acti_deagle = getEnt ("acti_spawn_deagle", "targetname" );
	level.deagle_trigger = getEnt("deagleroom","targetname");

		level.deagle_trigger waittill("trigger",player);
		if(!isDefined(level.deagle_trigger))
			return;
		
		level.knife_trigger delete();
		level.bounce_trigger delete();
		level.snipe_trigger delete();
		level.old_trigger delete();

		player SetPlayerAngles( jumper_deagle.angles );
		player setOrigin( jumper_deagle.origin );
		player TakeAllWeapons();
		player GiveWeapon("deserteagle_mp");	
		player giveMaxAmmo("deserteagle_mp");

		level.activ SetPlayerAngles( acti_deagle.angles );
		level.activ setOrigin( acti_deagle.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("deserteagle_mp");	
		level.activ giveMaxAmmo("deserteagle_mp");

		player switchToWeapon("deserteagle_mp");
		level.activ switchToWeapon("deserteagle_mp");
		iprintLnBold(player.name + " ^3Entered The Deagle Room");
		
		player thread onDeath_deagle();
		wait 0.1;
	
	
		for(;;)
		{
			wait .1;		
			while(isAlive(player))
			{
				wait 1;
			}
		
		}
}

onDeath_deagle()
{
	self endon("disconnect");
	
	self waittill("death");
	thread deagleroom();
}

//----------SNIPER-ROOM----------//

sniperroom()
{
	jumper = getEnt ("jumper_spawn_snipe", "targetname" );
	acti = getEnt ("acti_spawn_snipe", "targetname" );
	
	level.snipe_trigger = getEnt("sniperroom","targetname");

		level.snipe_trigger waittill("trigger",player);
		if(!isDefined(level.snipe_trigger))
			return;
		
		level.knife_trigger delete();
		level.bounce_trigger delete();
		level.deagle_trigger delete();
		level.old_trigger delete();

		player SetPlayerAngles( jumper.angles );
		player setOrigin( jumper.origin );
		player TakeAllWeapons();
		player GiveWeapon("ballista_mp");
		player giveMaxAmmo("ballista_mp");
		player switchToWeapon("ballista_mp");

		level.activ SetPlayerAngles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon("ballista_mp");
		level.activ giveMaxAmmo("ballista_mp");
		level.activ switchToWeapon("ballista_mp");

		iPrintLnBold(player.name + " ^3Entered The Sniper Room");
		
		player thread onDeath_snipe();
		wait 0.1;
	
	
		for(;;)
		{
			wait .1;		
			while(isAlive(player))
			{
				wait 1;
			}
		
		}
}

onDeath_snipe()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniperroom();
}

//----------BOUNCE-ROOM----------//

bounceroom()
{
	jumper_bounce = getEnt ("jumper_spawn_bounce", "targetname" );
	acti_bounce = getEnt ("acti_spawn_bounce", "targetname" );
	level.bounce_trigger = getEnt("bounceroom","targetname");

		level.bounce_trigger waittill("trigger",player);
		if(!isDefined(level.bounce_trigger))
			return;
		
		level.knife_trigger delete();
		level.deagle_trigger delete();
		level.snipe_trigger delete();
		level.old_trigger delete();

		player SetPlayerAngles( jumper_bounce.angles );
		player setOrigin( jumper_bounce.origin );
		player TakeAllWeapons(); 
		player GiveWeapon("knife_mp");
		player SetWeaponAmmoClip( "knife_mp", 0 );
		player SetWeaponAmmoStock( "knife_mp", 0 );
		player switchToWeapon("knife_mp");

		level.activ SetPlayerAngles( acti_bounce.angles );
		level.activ setOrigin( acti_bounce.origin );
		level.activ TakeAllWeapons(); 
		level.activ GiveWeapon("knife_mp");
		level.activ SetWeaponAmmoClip( "knife_mp", 0 );
		level.activ SetWeaponAmmoStock( "knife_mp", 0 );
		level.activ switchToWeapon("knife_mp");

		iprintLnBold(player.name + " ^3Entered The Bounce Room");
		
		player thread onDeath_bounce();
		wait 0.1;
	
	
		for(;;)
		{
			wait .1;		
			while(isAlive(player))
			{
				wait 1;
			}
		
		}
}

onDeath_bounce()
{
	self endon("disconnect");
	
	self waittill("death");
	thread bounceroom();
}
//~~~~~~~~~~Knife~~~~~~~~~~//
kniferoom()
{
	jumper_knife = getEnt ("jumper_spawn_knife", "targetname" );
	acti_knife = getEnt ("acti_spawn_knife", "targetname" );
	level.knife_trigger = getEnt("kniferoom","targetname");
	
		level.knife_trigger waittill("trigger",player);
		if(!isDefined(level.knife_trigger))
			return;
		
		level.bounce_trigger delete();
		level.deagle_trigger delete();
		level.snipe_trigger delete();
		level.old_trigger delete();

		player SetPlayerAngles( jumper_knife.angles );
		player setOrigin( jumper_knife.origin );
		player TakeAllWeapons(); 
		player GiveWeapon("knife_mp");
		player SetWeaponAmmoClip( "knife_mp", 0 );
		player SetWeaponAmmoStock( "knife_mp", 0 );
		player switchToWeapon("knife_mp");

		level.activ SetPlayerAngles( acti_knife.angles );
		level.activ setOrigin( acti_knife.origin );
		level.activ TakeAllWeapons(); 
		level.activ GiveWeapon("knife_mp");
		level.activ SetWeaponAmmoClip( "knife_mp", 0 );
		level.activ SetWeaponAmmoStock( "knife_mp", 0 );
		level.activ switchToWeapon("knife_mp");

		iprintLnBold(player.name + " ^3Entered The Knife Room");
		
		
		player thread onDeath_knife();
		wait 0.1;
	
	
		for(;;)
		{
			wait .1;		
			while(isAlive(player))
			{
				wait 1;
			}
		
		}
}

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread kniferoom();
}

//----------SECRETS----------//

opensecrettrail()
{
	trigger = getEnt ("secretunlock", "targetname");
	solid2 = getent ("trailnonsolid", "targetname");
	
	trigger waittill("trigger", player);
	player iprintln ("^5Does This Do Something^3???");
	
	solid2 notsolid();
}

trail()
{
	secrettrail = getEnt("trail","targetname");

	secrettrail waittill("trigger",player);

	secrettrail delete();


	while(isAlive(player))
   	{
		playFx(level.fire, player.origin);
     	wait 0.1;
				
		self endon ( "disconnect" );
		self endon ( "death" );
		self endon ( "round_ended" );
		self endon ( "endround" );
		self endon ( "joined_spectators" );
		self endon ( "player_spectator" );
		self endon ( "game over" );
   	}

}

opensecret2()
{
	trigger2 = getEnt("secret2a","targetname");
	secret2nonsolid = getent ("secret2b", "targetname");
	
	trigger2 waittill("trigger", player);
	
	player iprintln ("^8Nice^7One");
	secret2nonsolid notsolid();
}

secret2()
{
	trigger3 = getEnt("secret_tele","targetname");
	target = getEnt("secret_target","targetname");
	secret_exit = getEnt("exit_secret","targetname");
	trigg = getEnt("secret_tele2","targetname");
	
	while(1)
	{
		trigger3 waittill("trigger",player);

		player SetOrigin( target.origin );
		player SetPlayerAngles( target.angles );
	
		player iPrintLnBold("^3Welcome ^5To the ^6Secret!");
		
		trigg waittill("trigger",player);
	
		player SetOrigin( secret_exit.origin );
		player SetPlayerAngles( secret_exit.angles );

		iprintLnBold(player.name + " ^4Completed ^5The ^2Secret^1!");
			
			player detachAll();
			player setModel("playermodel_baa_joker");
			player iprintln("^3You Are Now Joker");
	}
}

//~~~~~~~~~~VIP-Joker~~~~~~~~~~//

vipmovement()
{

	vipmove = getEnt("vipwords", "targetname");
	
	while(1)
	{
	vipmove rotateyaw(720,6);
	vipmove waittill ("rotatedone");
	}
}

joker()
{
        jokerviptrigger = getEnt("vipjokertrig","targetname");
       
       
        level.accepted1 = "5035440d"; //Turtle
    	level.accepted2 = "c6099844"; //Zack
    	level.accepted3 = "c17fe3aa"; //Grapes
    	level.accepted4 = "02bfdd71"; //Easy
       
        while(1)
        {
        jokerviptrigger waittill("trigger" , player);
       
        friend = getSubStr(player getGuid(), 24, 32);
               
                if((friend == level.accepted1))
                {
                        player detachAll();
                        player setModel("playermodel_baa_joker");
                        player iprintln("^3You Are Now Joker");
                }
				if((friend == level.accepted2))
				{
                        player detachAll();
                        player setModel("playermodel_baa_joker");
                        player iprintln("^3You Are Now Joker");
                }
				if((friend == level.accepted3))
				{
                        player detachAll();
                        player setModel("playermodel_baa_joker");
                        player iprintln("^3You Are Now Joker");
                }
				if((friend == level.accepted4))
				{
                        player detachAll();
                        player setModel("playermodel_baa_joker");
                        player iprintln("^3You Are Now Joker");
                }
				else
				{
						player iPrintLnBold("^1You Are Not V.I.P");
				}
        }
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}