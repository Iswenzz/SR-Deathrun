/*
map by quaK ----> http://steamcommunity.com/id/joelrau
My very first, please be gentle :)
*/

main()
{
 maps\mp\_load::main();
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
	addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addTriggerToList("trig_trap7");
	addTriggerToList("trig_trap8");
	addTriggerToList("trig_trap9");
	addTriggerToList("trig_trap10");
 
 thread onPlayerConnect();
 thread messages();
 thread music();
 thread secretsong();
 thread xp();
 thread startingfence();
 thread bouncew ();
 thread teleport1();
 thread teleport2();
 thread teleacti();
 thread teleacti2();
 thread trap01();
 thread trap02();
 thread trap03();
 thread trap04();
 thread trap05();
 thread trap06();
 thread trap07();
 thread trap08();
 thread trap09();
 thread trap10();
 thread platform();
 thread old();
 thread sniper();
 thread bounce();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music()
{
    level waittill( "round_started" );
        wait 0.05;
    ambientPlay( "song1" );
	iprintln("^3Ambient Song: ^4t.A.T.u.- All The Things She Said (HBz Remix)");
}

secretsong()
{
	trig = getEnt ("trig_shot", "targetname");
	trig waittill ("trigger", player);
	AmbientStop(1);
	wait 0.5;
	AmbientPlay("song2");
	iprintln("^3Secret Song: ^4Pure Gold 3 by Niklas Ahlstrom");
	trig delete();
}

onPlayerConnect()
{
    for(;;)
    {
        level waittill( "connected", player );
                  player iPrintLnBold("^4Welcome runner ^5"+player.name);
    }
}

messages()
{
	level waittill( "connected", player );
	while (1)
	{
		wait 30;
		player iPrintLn ("^4Map by ^5quaK");
		wait 60;
		player iPrintLn ("^4Special Thanks to ^0DarkSTEP ^4for helping me make this map^6!");
	}
}

startingfence()
{
fence = getent ("startdoor","targetname");
wait 10;
fence moveZ(-300, 3);
iprintlnBold("^4Starting ^5Fence ^6Lowered.");
wait 1;
}

//semtex code -------------------------------------------------
bouncew()
{
level endon("bounced");
b1 = getent("bounce01","targetname");
for(;;)
{
	b1 waittill("trigger", player);
	player thread bounce_watch();
	}
}

bounce_watch()
{
self endon("death");
self endon("disconected");
level endon("bounced");
b2 = getent("bounce02","targetname");
for(;;)
{
	if(self istouching(b2))
	{
		self thread braxi\_rank::giveRankXP("", 10);
		IPrintLnbold("^5" + self.name + "^4 Is a Super boi^6!");
		level notify("bounced");
		}
	wait .001;
	}
}
//------------------------------------------------------------

xp()
{
	trig = getEnt ("xp", "targetname");
	trig waittill ("trigger", player);
	player braxi\_rank::giveRankXp( "", 500);
	player iprintlnBold ("^1You ^2Have ^3Found ^4The ^5Secret ^6XP^7!");
	trig delete();
}

teleport1()
{
	trig = getEnt("trigger_teleport1", "targetname");
	tele1 = getEnt("origin_teleport1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(tele1.origin);
		iprintln("^9Teleported!");
	}
}

teleport2()
{
	trig = getEnt("trigger_teleport2", "targetname");
	tele2 = getEnt("origin_teleport2", "targetname");
	
	for (;;)
	{
	trig waittill("trigger", player);
	player freezecontrols(true);
	wait 0.05;
	player freezecontrols(false);
	player setOrigin(tele2.origin);
	player setplayerangles(tele2.angles );
	}
}

platform()
{
	trig = getEnt ("player_trigger", "targetname");
	platform = getEnt ("platform", "targetname");
	
	while (1) {
		trig waittill ("trigger", player);
		wait 0.5;
		platform moveX(-2368, 2);
		wait 4;
		platform moveX(2368, 2);
		wait 4;
	}
}

//acti

teleacti()
{
	trig = getEnt ("trigger_teleportacti1", "targetname");
	teleacti = getEnt ("origin_teleportacti1", "targetname");
	
	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin(teleacti.origin);
		player setplayerangles(teleacti.angles);
		iprintln("^9Teleported!");
	}
}

teleacti2()
{
	trig2 = getEnt ("trigger_teleportacti2", "targetname");
	teleacti2 = getEnt ("origin_teleportacti2", "targetname");
	
	for (;;)
	{
		trig2 waittill("trigger", player);
		player setOrigin(teleacti2.origin);
		player setplayerangles(teleacti2.angles);
		iprintln("^9Teleported!");
	}
}

trap01()
{
	trap1 = getent ("trap1", "targetname");
	trap2 = getent ("trap2", "targetname");
	trig = getent ("trig_trap1", "targetname");
	trig SetHintString("^2Remove a bounce!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 1 Activated!");
	trig delete();
	
	r = RandomIntRange(0, 2);
if(r == 0)
{
	trap1 notsolid();
}
else
{
	trap2 notsolid();
}
}

trap02()
{
	trap3 = getent ("trap3", "targetname");
	trap4 = getent ("trap4", "targetname");
	trap5 = getent ("trap5", "targetname");
	trig = getent ("trig_trap2", "targetname");
	trig SetHintString("^2Rob their floor!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 2 Activated!");
	trig delete();
	
	trap3 moveZ(140.0, 2);
	trap4 moveZ(140.0, 2);
	trap5 moveX(-224, 1);
	wait 2;
	trap5 moveX(224, 1);
	wait 2;
	trap3 moveZ(-140.0, 2);
	trap4 moveZ(-140.0, 2);

}

trap03()
{
	trap6 = getent ("trap6", "targetname");
	trig = getent ("trig_trap3", "targetname");
	trig SetHintString("^2Make it Spin!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 3 Activated!");
	trig delete();
	
	while(1) //Loop
 {
   trap6 rotateRoll (360,2);
   wait 2;
   
 }
}

trap04()
{
	trap7 = getent ("trap7", "targetname");
	trig = getent ("trig_trap4", "targetname");
	trig SetHintString("^2Harder!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 4 Activated!");
	trig delete();
	
	trap7 delete();
	
}

trap05()
{
	trap8 = getent ("trap8", "targetname");
	trig = getent ("trig_trap5", "targetname");
	trig SetHintString("^2Make it Spin again!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 5 Activated!");
	trig delete();
	
	while (1) 
	{
		trap8 rotateYaw (360,0.2);
		wait 0.5;
	}
}

trap06()
{
	trap9 = getent ("trap9", "targetname");
	trig = getent ("trig_trap6", "targetname");
	trig SetHintString("^2Make it Spin yet again!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 6 Activated!");
	trig delete();
	
		while (1) 
	{
		trap9 rotateYaw (450,1);
		wait 2;
	}
}

trap07()
{
	trap10 = getent ("trap10", "targetname");
	trap11 = getent ("trap11", "targetname");
	trap12 = getent ("trap12", "targetname");
	trig = getent ("trig_trap7", "targetname");
	trig SetHintString("^2Make a bounce/bounces spin!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 7 Activated!");
	trig delete();
	
	r = RandomIntRange(0, 2);
if(r == 0)
{
	while (1)
	{
		trap10 rotateYaw (360, 1);
		trap11 rotateYaw (360, 1);
		wait 2;
	}
}
else
{
	while (1)
	{
		trap12 rotateYaw (360, 1);
		wait 2;
	}
}
}

trap08()
{
	trap13 = getent ("trap13", "targetname");
	trap14 = getent ("trap14", "targetname");
	trig = getent ("trig_trap8", "targetname");
	trig SetHintString("^2Make one side disappear!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 8 Activated!");
	trig delete();
	
	r = RandomIntRange(0, 2);
if(r == 0)
{
	trap13 delete();
}
else
{
	trap14 delete();
}
}

trap09()
{
	trap15 = getent ("trap15", "targetname");
	trig = getent ("trig_trap9", "targetname");
	trig SetHintString("^2Lower the ceiling!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 9 Activated!");
	trig delete();
	
	trap15 moveZ (-192, 1.5);
	wait 2;
	trap15 moveZ (192, 1.5);
}

trap10()
{
	trap16 = getent ("trap16", "targetname");
	trig = getent ("trig_trap10", "targetname");
	trig SetHintString("^2Spin spin spin spin!!");
	trig waittill ("trigger", player);
	iprintln("^1Trap 10 Activated!");
	trig delete();
	
	while (1)
	{
		trap16 rotatePitch (360, 1);
		wait 2;
		trap16 rotatePitch (-360, 1);
		wait 2;
	}
}

//end

old()
{
	level.trigger_old = getEnt ("trigger_old", "targetname");
	level.trigger_sniper = getEnt ("trigger_sniper", "targetname");
	level.trigger_bounce = getEnt ("trigger_bounce", "targetname");
	oldjumper = getEnt ("origin_old_jumper", "targetname");
	oldacti = getEnt ("origin_old_acti", "targetname");
	
	while (1)
	{
		level.trigger_old SetHintString ("^4Old ^5Room");
		level.trigger_old waittill ("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;
		
		level.trigger_sniper delete();
		level.trigger_bounce delete();
		
		player setOrigin (oldjumper.origin);
		player setPlayerAngles (oldjumper.angles);
		player.maxhealth = 100;
		if( isDefined(level.activ) && isAlive(level.activ)) 
		{
			level.activ.maxhealth = 100;
			level.activ setOrigin (oldacti.origin);
			level.activ setPlayerAngles (oldacti.angles);
		}
		iPrintLnBold( " ^4" + player.name + " ^7has chosen ^4Old ^7Room!" );

		while( isAlive( player ) && isDefined( player ) )
            wait .05;
	}
	level.PlayerInRoom = false;
}

sniper()
{
	level.trigger_old = getEnt ("trigger_old", "targetname");
	level.trigger_sniper = getEnt ("trigger_sniper", "targetname");
	level.trigger_bounce = getEnt ("trigger_bounce", "targetname");
	sniperjumper = getEnt ("origin_sniper_jumper", "targetname");
	sniperacti = getEnt ("origin_sniper_acti", "targetname");
	
	while (1) 
	{
		level.trigger_sniper SetHintString ("^4Sniper ^5Room");
		level.trigger_sniper waittill ("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;
		
		if(level.firstenter==true) {
		ambientStop(1);
		wait 0.05;
		ambientPlay ("song3");
		iprintln("^3Sniper Song: ^4Cheek - JippiKayJei");
		level.firstenter = false;
		}
		
		thread sniperfailjumper();
		thread sniperfailacti();
		
		level.trigger_old delete();
		level.trigger_bounce delete();
		
		player setOrigin (sniperjumper.origin);
		player setPlayerAngles (sniperjumper.angles);
		player TakeAllWeapons();
		player GiveWeapon( "m40a3_mp" ); //Gives player weapon
		player giveMaxAmmo( "m40a3_mp" ); //Gives player ammo
		player GiveWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );   
		player switchToWeapon( "m40a3_mp" ); //Makes player switch to weapon.
		player.maxhealth = 100; //Sets players health to normal.
			
		if( isDefined(level.activ) && isAlive(level.activ)) 
		{
			level.activ setPlayerangles(sniperacti.angles);
			level.activ setOrigin(sniperacti.origin); 
			level.activ TakeAllWeapons(); 
			level.activ GiveWeapon( "m40a3_mp" ); 
			level.activ giveMaxAmmo( "m40a3_mp" ); 
			level.activ GiveWeapon( "remington700_mp" );
			level.activ giveMaxAmmo( "remington700_mp" );
			level.activ SwitchToWeapon( "m40a3_mp" );
			level.activ.maxhealth = 100; 
		}
		iPrintLnBold( " ^4" + player.name + " ^7has chosen ^4Sniper ^7Room!" ); 
		
		while( isAlive( player ) && isDefined( player ) )
            wait .05;
	}
	level.PlayerInRoom = false;
}
sniperfailjumper()
{
	jumpertrig = getEnt ("trigger_fail_sniperjumper", "targetname");
	jumper = getEnt ("origin_sniper_jumper", "targetname");
	
	for (;;)
	{
		jumpertrig waittill("trigger", player);
		player freezecontrols(true);
		wait 0.05;
		player freezecontrols(false); 
		player setOrigin(jumper.origin);
		player setplayerangles(jumper.angles);
		iprintln("^9Fail!");
	}
}
sniperfailacti()
{
	actitrig = getEnt ("trigger_fail_sniperacti", "targetname");
	acti = getEnt ("origin_sniper_acti", "targetname");
	
	for (;;)
	{
		actitrig waittill("trigger", player);
		player freezecontrols(true);
		wait 0.05;
		player freezecontrols(false); 
		player setOrigin(acti.origin);
		player setplayerangles(acti.angles);
		iprintln("^9Fail!");
	}
}

bounce()
{
	level.trigger_old = getEnt ("trigger_old", "targetname");
	level.trigger_sniper = getEnt ("trigger_sniper", "targetname");
	level.trigger_bounce = getEnt ("trigger_bounce", "targetname");
	bouncejumper = getEnt ("origin_bounce_jumper", "targetname");
	bounceacti = getEnt ("origin_bounce_acti", "targetname");
	
	while (1) 
	{
		level.trigger_bounce SetHintString ("^4Bounce ^5Room");
		level.trigger_bounce waittill ("trigger", player);
		if(!player sr\api\_deathrun::order())
			continue;
		thread bouncefailjumper();
		thread bouncefailacti();
		thread bounceweap();
		
		if(level.firstenter==true) {
		ambientStop(1);
		wait 0.05;
		ambientPlay ("song4");
		iprintln("^3Bounce Song: ^4Tujamo - Drop That Low (When I Dip)");
		level.firstenter = false;
		}
		
		level.trigger_old delete();
		level.trigger_sniper delete();
		
		player setOrigin (bouncejumper.origin);
		player setPlayerAngles (bouncejumper.angles);
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" ); //Gives player weapon
		player SwitchToWeapon ( "knife_mp" );
		player.maxhealth = 100; //Sets players health to normal.
			
		if( isDefined(level.activ) && isAlive(level.activ)) 
		{
			level.activ setOrigin (bounceacti.origin);
			level.activ setPlayerAngles (bounceacti.angles);
			level.activ TakeAllWeapons();
			level.activ GiveWeapon( "knife_mp" ); //Gives player weapon
			level.activ SwitchToWeapon( "knife_mp" );
			level.activ.maxhealth = 100; //Sets players health to normal.
			
		}
		iPrintLnBold( " ^4" + player.name + " ^7has chosen ^4Bounce ^7Room!" ); 
		
		while( isAlive( player ) && isDefined( player ) )
            wait .05;
	}
	level.PlayerInRoom = false;
}

bouncefailjumper()
{
	jumpertrig = getEnt ("trigger_fail_bouncejumper", "targetname");
	jumper = getEnt ("origin_bounce_jumper", "targetname");
	
	for (;;)
		{
			jumpertrig waittill("trigger", player);
			player freezecontrols(true);
			wait 0.05;
			player freezecontrols(false); 
			player setOrigin(jumper.origin);
			player setplayerangles(jumper.angles);
			iprintln("^9Fail!");
		}
	}
bouncefailacti()
{
	actitrig = getEnt ("trigger_fail_bounceacti", "targetname");
	acti = getEnt ("origin_bounce_acti", "targetname");
	
	for (;;)
	{
		actitrig waittill("trigger", player);
		player freezecontrols(true);
		wait 0.05;
		player freezecontrols(false); 
		player setOrigin(acti.origin);
		player setplayerangles(acti.angles);
		iprintln("^9Fail!");
	}
}

bounceweap()
{
	trig = getEnt ("trigger_bounceweapon", "targetname");
	trig setHintString ("^2Use");
	trig waittill ("trigger", player);
	trig SetHintString ("^1Used");
	player TakeAllWeapons();
	player GiveWeapon( "m40a3_mp" ); 
	player giveMaxAmmo( "m40a3_mp" ); 
	player giveWeapon( "deserteagle_mp" );
	player giveMaxAmmo ( "deserteagle_mp" );
	player SwitchToWeapon( "m40a3_mp" );
}
