/*

? Mapping,spaceship scripting and trap scripting by eBc|Legend ?
? _spaceballv2_system and loadscreen by Madlion ?

[WARNING!!!]
[ASK FIRST FOR PERMISSON TO COPY OR USE SCRIPTS!]
XFIRE: gamersven9 - eBc|Legend
	   madlion3 - Madlion

*/
main()
{

	//level.meteor_fire = loadfx( "spaceball_v2/meteor_fire" ); we are in space lol no fire <.<

	maps\mp\_load::main();
	//maps\mp\_spaceballv2_system::main();
	maps\mp\_spaceship::main();


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
	setdvar("bg_fallDamageMaxHeight","999999");
	setdvar("bg_fallDamageMinHeight","99999");

	wait 0.05;
	level.dvar["bunnyhoop"] = 0;

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

	level waittill("round_started");	
	thread start();
	thread creatorstext();
	thread shipdoor();
	thread curv_pusher();
	thread gravityknife();
	thread trapescape();
	thread bounceroom();
	thread sniperoom();
	iprintln("^0[^5SpaceBallv2^0]^7Traps Are Now Able to Activate!");
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
	level.ring notsolid();
	level.ring hide();
	wait 1;
	thread actijump();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

creatorstext()
{
while( 1 )
{
wait 50;
iprintln("^5Map made by: ^7MadLion(madlion3) & eBc|Legend(gamersven9)");
}
}

start()
{
open1 = getent("open1","targetname");
open2 = getent("open2","targetname");
open3 = getent("open3","targetname");
open4 = getent("open4","targetname");
{
ambientplay("music");
open1 moveX(-136, 2);
open2 moveX(136, 2);
wait 3;
open3 moveY(136, 2);
open4 moveY(-136, 2);
wait 3;
thread uper();
}
}

shipdoor()
{
	door1_1 = getent("door1_1","targetname");
	door1_2 = getent("door1_2","targetname");
	door2_1 = getent("door2_1","targetname");
	door2_2 = getent("door2_2","targetname");
	trig = getent("door_trig","targetname");
	trig waittill("trigger", user);
	trig delete();
	{
		door1_1 moveY(-128, 2);
		door1_2 moveY(128, 2);
		wait 0.25;
		door2_1 moveZ(112, 2);
		door2_2 moveZ(-112, 2);
	}
}

uper()
{
uper = getent("uper","targetname");
while(1)
{
uper moveZ(1772, 5);
uper waittill("movedone");
wait 3;
uper moveZ(-1772, 5);
uper waittill("movedone");
wait 3;
}
}

curv_pusher(who)
{
	trigger = getEnt ( "curv_pusher", "targetname" );
	
	while(1)
	{
    	trigger waittill ( "trigger", who );
	
	    oldpos = who.origin;
	    strenght = 10;
	    for(i=0;i<strenght;i++)
	    {
	        who.health += 160;
            who finishPlayerDamage(who, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-90,-45,0)), "none", 0);
	    }
	}
}

trap1()
{
	part1 = getentarray ("trap1_1" ,"targetname");
	part2 = getentarray ("trap1_2" ,"targetname");
	part3 = getentarray ("trap1_3" ,"targetname");
	part4 = getentarray ("trap1_4" ,"targetname");
	trig = getent ("trig_trap1" , "targetname");

	trig sethintstring("Press ^1[USE]^7 To Activate");
 	trig waittill( "trigger", user ); 
	trig delete ();
	iprintln("^0[^5SpaceBallv2^0]^7Trap1 ^1Activated!");
	random = randomint(4);

	switch(random)
	{
		case 0:
				part1[randomInt(part1.size)] notsolid();
				part3[randomInt(part3.size)] notsolid();
				break;
				
		case 1:	
				part2[randomInt(part2.size)] notsolid();
				part4[randomInt(part4.size)] notsolid();
                break;

        case 2:	

				part1[randomInt(part1.size)] notsolid();
				part4[randomInt(part4.size)] notsolid();
                break;	

        case 3:	

				part2[randomInt(part1.size)] notsolid();
				part3[randomInt(part4.size)] notsolid();				
				
		default: return;
	}
}

trap2()
{
rotator = getent("trap2","targetname");
trig = getent("trig_trap2","targetname");
trig sethintstring("Press ^1[USE]^7 To Activate");
trig waittill("trigger", user );
trig delete();
iprintln("^0[^5SpaceBallv2^0]^7Trap2 ^1Activated!");
while(1)
{
rotator rotateYaw(360, 3);
wait 0.1;
}
}

trap3()
{
	plats1 = getent("trap3_plats1","targetname");
	plats2 = getent("trap3_plats2","targetname");
	trig = getent("trig_trap3","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap3 ^1Activated!");
	trig delete();
	while(1)
	{
		plats1 moveZ(60, 3);
		plats2 moveZ(-60, 3);
		wait 4;
		plats1 moveZ(-60, 3);
		plats2 moveZ(60, 3);
		wait 4;
	}
}

trap4()
{
	splasher = getent("trap4","targetname");
	trig = getent("trig_trap4","targetname");
	killtrig = getent("trap4_killtrig","targetname");
	quake = getent("trap4_quake","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap4 ^1Activated!");
	trig delete();
	{
		killtrig enablelinkto();
		killtrig linkto(splasher);
		splasher moveZ(-240, 2);
		splasher waittill("movedone");
		Earthquake( 2, 1, quake.origin, 1000);
		wait 2;
		splasher moveZ(240, 1.5, .5);
		splasher waittill("movedone");
		wait .1;
		killtrig unlink();
		killtrig delete();
	}
}

trap5()
{
	rot1 = getent("trap5_1","targetname");
	rot2 = getent("trap5_2","targetname");
	rot3 = getent("trap5_3","targetname");
	rot4 = getent("trap5_4","targetname");
	rot5 = getent("trap5_5","targetname");
	rot6 = getent("trap5_6","targetname");
	rot7 = getent("trap5_7","targetname");
	trig = getent("trig_trap5","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap5 ^1Activated!");
	trig delete();
	{
		rot1 rotateYaw(360, 1);
		wait 1.5;
		rot2 rotateYaw(-360, 1);
		wait 1.5;
		rot3 rotateYaw(360, 1);
		wait 1.5;
		rot4 rotateYaw(-360, 1);
		wait 1.5;
		rot5 rotateYaw(360, 1);
		wait 1.5;
		rot6 rotateYaw(-360, 1);
		wait 1.5;
		rot7 rotateYaw(360, 1);
		wait 1.5;
	}

}

trap6()
{
	plat1 = getentarray("trap6_1","targetname");
	plat2 = getentarray("trap6_2","targetname");
	plat3 = getentarray("trap6_3","targetname");
	plat4 = getentarray("trap6_4","targetname");
	plat5 = getentarray("trap6_5","targetname");
	plat6 = getentarray("trap6_6","targetname");
	trig = getent("trig_trap6","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap6 ^1Activated!");
	trig delete();
	trap6 = randomint(5);
	switch(trap6)
	{
		case 1:
		plat1[randomint(plat1.size)] delete();
		plat3[randomint(plat3.size)] delete();
		break;

		case 2:
		plat2[randomint(plat2.size)] delete();
		plat4[randomint(plat4.size)] delete();
		break;

		case 3:
		plat5[randomint(plat5.size)] delete();
		plat6[randomint(plat6.size)] delete();
		break;

		case 4:
		plat1[randomint(plat1.size)] delete();
		plat3[randomint(plat3.size)] delete();
		plat5[randomint(plat5.size)] delete();
		break;

		case 5:
		plat2[randomint(plat2.size)] delete();
		plat4[randomint(plat4.size)] delete();
		plat6[randomint(plat6.size)] delete();

		default: return;
	}

}

trap7()
{
	rotator1 = getent("trap7_1","targetname");
	rotator2 = getent("trap7_2","targetname");
	trig = getent("trig_trap7","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap7 ^1Activated!");
	trig delete();
	while(1)
	{
		rotator1 rotatePitch(360, 5);
		//rotator1 waittill("rotatedone");
		rotator2 rotatePitch(-360, 5);
		//rotator2 waittill("rotatedone");
		wait .1;
	}
}

trap8()
{
	curver = getent("trap8","targetname");
	trig = getent("trig_trap8","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap8 ^1Activated!");
	trig delete();
	{
		curver notsolid();
		curver hide();
		wait 3;
		curver solid();
		curver show();
		wait 0.05;
	}
}

trap9()
{
	trap9_1 = getent("trap9_1","targetname");
	trap9_2 = getent("trap9_2","targetname");
	trig = getent("trig_trap9","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap9 ^1Activated!");
	trig delete();
	{
		trap9_1 rotatePitch(90, 1, 0.5);
		trap9_2 rotatePitch(-90, 1, 0.5);
		wait 2;
		trap9_1 rotatePitch(-90, 3, 1);
		trap9_2 rotatePitch(90, 3, 1);
		wait 0.05;
	}
}

trap10()
{
	plats1 = getent("trap10_1","targetname");
	plats2 = getent("trap10_2","targetname");
	trig = getent("trig_trap10","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap10 ^1Activated!");
	trig delete();
	{
		plats1 hide();
		plats1 notsolid();
		wait 5;
		plats1 show();
		plats1 solid();
		wait 1;
		plats2 hide();
		plats2 notsolid();
		wait 3;
		plats2 show();
		plats2 solid();
	}
}

trap11()
{
	level.meteor1 = getent ("meteor1","targetname");
	level.meteor2 = getent ("meteor2","targetname");
	level.meteor3 = getent ("meteor3","targetname");

	level.meteorpoint1 = getent ("point1","targetname");
	level.meteorpoint2 = getent ("point2","targetname");
	level.meteorpoint3 = getent ("point3","targetname");

	trig = getent("trig_trap11","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap11 ^1Activated!");
	//thread firefxes();
	thread qwakes();
	trig delete();
	{
		level.meteor1 moveto(level.meteorpoint1.origin, 2);
		level.meteor1 rotatePitch (360, 2);
		wait 2;
		level.meteor2 moveto(level.meteorpoint2.origin, 2);
		level.meteor2 rotatePitch (360, 2);
		wait 2;
		level.meteor3 moveto(level.meteorpoint3.origin, 2);
		level.meteor3 rotatePitch (360, 2);
	}
}
/*
firefxes()
{
	wait 2;
	PlayFX(level.meteor_fire, level.meteorpoint1.origin);
	wait 2;
	PlayFX(level.meteor_fire, level.meteorpoint2.origin);
	wait 2;
	PlayFX(level.meteor_fire, level.meteorpoint3.origin);
}
*/
qwakes()
{
	wait 2;
	Earthquake( 2, 1, level.meteorpoint1.origin, 500);
	RadiusDamage( level.meteorpoint1.origin, 199, 200, 200);
	wait 2;
	Earthquake( 2, 1, level.meteorpoint2.origin, 500);
	RadiusDamage( level.meteorpoint2.origin, 199, 200, 200);
	wait 2;
	Earthquake( 2, 1, level.meteorpoint3.origin, 500);
	RadiusDamage( level.meteorpoint3.origin, 199, 200, 200);
}

trap12()
{
	level.ring = getent("trap12","targetname");
	trig = getent("trig_trap12","targetname");
	trig sethintstring("Press ^1[USE]^7 To Activate");
	trig waittill("trigger", user);
	iprintln("^0[^5SpaceBallv2^0]^7Trap12 ^1Activated!");
	trig delete();
	{
		level.ring solid();
		level.ring show();
		wait 2;
		level.ring delete();
	}
}

gravityknife()
{
    level.knife_trig = getEnt( "gravityknife", "targetname");
    level.knife_trig sethintstring("Gravity knife");
    jump = getEnt( "jumper_knife", "targetname" );
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
		level.trapes_trig delete();
 		level.snipe_trig delete();
		level.bounce_trig delete();
		level.firstenter=false;
		}

			noti = SpawnStruct();
			noti.titleText = "^2>|^7Gravity Knife Room^2|<";
			noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
			noti.glowcolor = level.randomcolour;
			noti.duration = 4;
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
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
		level.activ AllowJump(true);
	    level.activ AllowSprint(true);
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        wait 3;
		player freezeControls(false);
		level.activ freezeControls(false);
		player thread jumpheight(4);
		level.activ thread jumpheight(4);
		player SetMoveSpeedScale (3.2);
		level.activ SetMoveSpeedScale(3.2);
        while( isAlive( player ) && isDefined( player ) )
        wait .05;
    }
}

jumpheight( strenght )
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	oldpos = self.origin;
	jumped = false;
	
	if( !isDefined( strenght ) || strenght < 1 )
		strenght = 1;
	
	while(1)
	{
		if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
		{
			if(jumped)
				continue;
			for(i=0;i<strenght;i++)
			{
				self.health += 100;
				self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
			jumped = false;
		oldpos = self.origin;
		wait 0.1;
	}
}

//////////////////////////////////////////////////////////////////////////

sniperoom()
{
	level.snipe_trig = getent("sniper","targetname");
	level.snipe_trig sethintstring("Sniper");
	jump = getent ("jump_snip","targetname");
	acti = getent ("acti_snip","targetname");
	while(1)
	{
		level.snipe_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
	continue;
        if( !isDefined( level.snipe_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.trapes_trig delete();
 		level.bounce_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}

			noti = SpawnStruct();
			noti.titleText = "^1>|^7Sniper Room^1|<";
			noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
			noti.glowcolor = level.randomcolour;
			noti.duration = 4;
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

			player freezeControls(true);
			level.activ freezeControls(true);
			player setPlayerangles( jump.angles );
			player setOrigin ( jump.origin );
			player TakeAllWeapons();
			player GiveWeapon("remington700_mp");
			player GiveMaxAmmo("remington700_mp");
			wait .05;
			level.activ setPlayerangles( acti.angles );
			level.activ setOrigin( acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon("remington700_mp");
			level.activ AllowJump(true);
	        level.activ AllowSprint(true);
			wait 3;
			player switchToWeapon("remington700_mp");
			level.activ switchToWeapon("remington700_mp");
			player freezeControls(false);
			level.activ freezeControls(false);
			while( isAlive( player ) && isDefined( player ) )
			wait .05;
	}
}

trapescape()
{
	level.trapes_trig = getent("trapescape","targetname");
	level.trapes_trig sethintstring("Trapescape");
	level.jump = getent ("jump_escape","targetname");
	level.acti = getent ("acti_escape","targetname");
	while(1)
	{
		level.trapes_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
	continue;
        if( !isDefined( level.trapes_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.bounce_trig delete();
		level.snipe_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}

			noti = SpawnStruct();
			noti.titleText = "^1>|^7Trap Escape Room^1|<";
			noti.notifyText = level.activ.name + " ^5VS^7 " + player.name;
			noti.glowcolor = level.randomcolour;
			noti.duration = 4;
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			thread spin();
			thread tpback();
			setdvar("bg_fallDamageMaxHeight","300");
	        setdvar("bg_fallDamageMinHeight","128");

			player freezeControls(true);
			level.activ freezeControls(true);
			player setPlayerangles( level.jump.angles );
			player thread jumperdie();
			player setOrigin ( level.jump.origin );
			player TakeAllWeapons();
			player GiveWeapon("hands_mp");
			wait .05;
			level.activ setPlayerangles( level.acti.angles );
			level.activ setOrigin( level.acti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon("hands_mp");
			level.activ AllowJump(true);
	        level.activ AllowSprint(true);
			wait 3;
			thread clipandglass();
			player switchToWeapon("hands_mp");
			level.activ switchToWeapon("hands_mp");
			player freezeControls(false);
			level.activ freezeControls(false);
			while( isAlive( player ) && isDefined( player ) )
			wait .05;
	}
}

spin()
{
	spin1 = getent("escapespin_1","targetname");
	spin2 = getent("escapespin_2","targetname");
    while(1)
	{
		spin1 rotateyaw(360, 3);
		spin2 rotateyaw(-360, 3);
		wait 3;
		spin1 rotateyaw(-360, 3);
		spin2 rotateyaw(360, 3);
		wait 3;
		spin1 rotateyaw(360, 4);
		spin2 rotateyaw(-360, 4);
		wait 4;
		spin1 rotateyaw(-360, 4);
		spin2 rotateyaw(360, 4);
		wait 4;
	}
}

clipandglass()
{
	clip1 = getent("clip1","targetname");
	clip2 = getent("clip2","targetname");
	glass = getent("glass3","targetname");
	{
		clip1 movey(360, 2);
		clip2 movey(-360, 2);
		wait 2;
		glass hide();
		glass notsolid();
		wait 2;
		glass show();
		glass solid();
		clip1 movey(-360, 2);
		clip2 movey(360, 2);
	}
}

tpback()
{
  trig = getEnt( "tpb", "targetname"); 
  //target = getEnt( "tpbo", "targetname");

  for(;;)
  {
      trig waittill ("trigger", player); 
      if( player.pers["team"] == "axis" )
      player SetOrigin(level.acti.origin);
      else
      {
      player SetOrigin(level.jump.origin);
	  wait 3;
	  thread clipandglass();
      }
     //trig waittill ("trigger", player); 
     //player SetOrigin(target.origin);
     //player SetPlayerAngles( target.angles );
	 
      }
}

actijump()
{
      if( self.pers["team"] == "axis" )
      self AllowJump(false);
	  self AllowSprint(false);
}

jumperdie()
{
target = getEnt( "safezone", "targetname");
{
self waittill("death");
level.activ SetOrigin(target.origin);
level.activ SetPlayerAngles( target.angles );	
}		
}
//Bounce
bounceroom()
{
	level.bounce_trig = getent("bounce","targetname");
	level.bounce_trig sethintstring("Bounce");
	level.bouncejump = getent ("jump_bouncer","targetname");
	level.bounceacti = getent ("acti_bouncer","targetname");
	while(1)
	{
		level.bounce_trig waittill( "trigger", player );
		if(!player sr\api\_deathrun::order())
	continue;
        if( !isDefined( level.bounce_trig ) )
            return;
        if(level.firstenter==true)
		{
		level.trapes_trig delete();
 		level.snipe_trig delete();
		level.knife_trig delete();
		level.firstenter=false;
		}

			noti = SpawnStruct();
			noti.titleText = "^1>|^7Bounce Room^1|<";
			noti.notifyText = level.activ.name + " ^1VS^7 " + player.name;
			noti.glowcolor = level.randomcolour;
			noti.duration = 4;
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			thread bouncetp();
			thread bouncetpacti();

			player freezeControls(true);
			level.activ freezeControls(true);
			player setPlayerangles( level.bouncejump.angles );
			player setOrigin ( level.bouncejump.origin );
			player TakeAllWeapons();
			player GiveWeapon("knife_mp");
			player GiveMaxAmmo("knife_mp");
			wait .05;
			level.activ setPlayerangles( level.bounceacti.angles );
			level.activ setOrigin( level.bounceacti.origin );
			level.activ TakeAllWeapons();
			level.activ GiveWeapon("knife_mp");
			level.activ AllowJump(true);
	        level.activ AllowSprint(true);
			wait 3;
			player switchToWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
			player freezeControls(false);
			level.activ freezeControls(false);
			while( isAlive( player ) && isDefined( player ) )
			wait .05;
	}
}

bouncetp()
{
  trig = getEnt( "bouncestartjump", "targetname"); 

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(level.bouncejump.origin);
     player SetPlayerAngles( level.bouncejump.angles ); 
      }
}

bouncetpacti()
{
  trig = getEnt( "bouncestartacti", "targetname"); 

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(level.bounceacti.origin);
     player SetPlayerAngles( level.bounceacti.angles ); 
      }
}