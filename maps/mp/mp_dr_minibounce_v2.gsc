/*     Map by:kkk35
	 Xfire:kkk35
	 Traps: 8
	 The map is (Medium-Easy) Difficulty!
	 Enjoy guys!:D
	 Sniper Room,Knife Room...:PNew:Pistol Room :)
*/

 main()
{
 maps\mp\_load::main();
 maps\mp\_teleport_4::main();
 maps\mp\_teleport_5::main();
 maps\mp\_teleport_6::main();
 maps\mp\_teleport_7::main();
 maps\mp\_teleport_8::main();



		thread place();
		thread place2();
		thread place3();
		thread place4();
		thread kocka();
		thread flux();
		thread part1();
		thread part2();
		thread look();
		thread end();
		thread hp();
		thread porgo();
		thread forgo();
		thread Krom();
		thread Srom();
		thread Prom();
		thread weapon();
		thread lepcso();

		thread WatchKnife();
		thread WatchSniper();
		thread WatchPistol();

		addTriggerToList("place_trig");
            addTriggerToList("place2_trig");
            addTriggerToList("place3_trig");
            addTriggerToList("place4_trig");
            addTriggerToList("kocka_trig");
		addTriggerToList("flux_trig");
            addTriggerToList("look_trig");
		addTriggerToList("lepcso_trig");
          

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


 /*game["allies"] = "sas";
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

 */

place()

{
  trig = getEnt( "place_trig", "targetname" );
  brush = getEnt( "place", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  brush notsolid();

}

place2()
{
	trig = getEnt( "place2_trig", "targetname" );
	brush = getEnt( "place2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 4; i++ )
	{
		brush rotatePitch( 1440, 4 );
		wait 2;
	}
	brush.angles = (0,0,0);
}

place3()

{
  trig = getEnt( "place3_trig", "targetname" );
  brush = getEnt( "place3", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  brush notsolid();

}

place4()

{
  trig = getEnt( "place4_trig", "targetname" );
  brush = getEnt( "place4", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  brush delete();

}

kocka()
   {
   trig = getent( "kocka_trig", "targetname" );
   while (1)
   {
   trig waittill ("trigger", user );
   trig setHintString("^1Trap activated!");
   trig delete();
   { randb = randomInt(9);
   kocka1 = getent( "kocka1", "targetname" );
   kocka2 = getent( "kocka2", "targetname" );
   kocka3 = getent( "kocka3", "targetname" );
   kocka4 = getent( "kocka4", "targetname" );
   if (randb == 0)
   {kocka1 notsolid(); wait .05; kocka1 notsolid(); }
   if (randb == 1)
   { kocka1 notsolid(); wait .05; kocka2 notsolid(); }
   if (randb == 2)
   { kocka1 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 3)
   { kocka1 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 4)
   {kocka2 notsolid(); wait .05; kocka2 notsolid(); }
   if (randb == 5)
   { kocka2 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 6)
   { kocka2 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 7)
   { kocka3 notsolid(); wait .05; kocka3 notsolid(); }
   if (randb == 8)
   { kocka3 notsolid(); wait .05; kocka4 notsolid(); }
   if (randb == 9)
   { kocka3 notsolid(); wait .05; kocka4 notsolid(); }
   }
   }
   }

lepcso()

{
  trig = getEnt( "lepcso_trig", "targetname" );
  brush = getEnt( "lepcso", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  brush notsolid();

}

 weapon()
  {
  weapon = getent ("weapon","targetname");
  weapon waittill ("trigger",player );
  weapon delete ();

  iprintlnbold ("" + "^1." + "^2"+ player.name + "^1."+" ^3Found the Secret room!");
  wait 1 ;
  }


WatchKnife()
{
	level.knife_trig = getEnt( "trigger_knife", "targetname");
	jump = getEnt( "knife_jumper", "targetname" );
	acti = getEnt( "knife_activator", "targetname" );
	
	while(1)
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
            level.shotgun_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );		
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^5Has Choosen ^2KNIFE ^6Room!");	
		while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

flux()

{

  csapda = getent( "flux", "targetname" );
  trig = getent( "flux_trig", "targetname" );

  while(true)

        {
        trig waittill ("trigger");
        trig setHintString("^1Trap activated!");
        trig delete();
        csapda movez (500,1,0,0.6);
        csapda waittill ("movedone");


        wait 2;

        csapda movez(-500,1,0,0.6);
        csapda waittill ("movedone");
        }
}

part1()
 {
 part1 = getent ("part1","targetname");
 part1 waittill ("trigger",player );
 part1 delete ();


  iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^3Ended the ^5PART:^2I!");
  wait 1 ;
  }

part2()
 {
 part2 = getent ("part2","targetname");
 part2 waittill ("trigger",player );
 part2 delete ();


  iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^3Started the ^5PART:^2II!");
  wait 1 ;
  }

look()
{


look_padlo = getEnt ( "look", "targetname");
trigger = getEnt ( "look_trig", "targetname");

  trigger waittill( "trigger");
  trigger setHintString("^1Trap activated!");
  trigger delete();

  {

  look_padlo rotatePitch (3600,300);
  look_padlo waittill ("movedone");

  }

}
/*
bounce2()
{


bounce2_padlo = getEnt ( "bounce2", "targetname");
trigger = getEnt ( "bounce2_trig", "targetname");

  trig waittill( "trigger");
  trig setHintString("^1Trap activated!");
  trig delete();

  {

  bounce2_padlo rotatePitch (720,4);
  bounce2_padlo waittill ("movedone");

  }

}

bounce()
{


bounce_padlo = getEnt ( "bounce", "targetname");
trigger = getEnt ( "bounce_trig", "targetname");

  trigger waittill( "trigger");
  trigger setHintString("^1Trap activated!");
  trigger delete();

  {

  bounce_padlo rotatePitch (720,4);
  bounce_padlo waittill ("movedone");

  }

}
*/

end()
 {
 end = getent ("end","targetname");
 end waittill ("trigger",player );
 end delete ();


  iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^3Ended the map!^1Map by:^5kkk35");
  wait 1 ;
  }

porgo()

{
porgo_padlo = getent("porgo", "targetname");
while(1)
{
porgo_padlo rotateyaw (10000,890);
porgo_padlo waittill("movedone");
}
}

forgo()

{
forgo_padlo = getent("forgo", "targetname");
while(1)
{
forgo_padlo rotateyaw (10000,890);
forgo_padlo waittill("movedone");
}
}

hp()

{
hp_padlo = getent("hp", "targetname");
while(1)
{
hp_padlo rotateyaw (10000,890);
hp_padlo waittill("movedone");
}
}

Srom()

{
Srom_padlo = getent("Srom", "targetname");
while(1)
{
Srom_padlo rotateyaw (10000,890);
Srom_padlo waittill("movedone");
}
}

Krom()

{
Krom_padlo = getent("Krom", "targetname");
while(1)
{
Krom_padlo rotateyaw (10000,890);
Krom_padlo waittill("movedone");
}
}

Prom()

{
Prom_padlo = getent("Prom", "targetname");
while(1)
{
Prom_padlo rotateyaw (10000,890);
Prom_padlo waittill("movedone");
}
}


WatchSniper()
{
	level.snip_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_activator", "targetname" );
	
	while(1)
	{
		level.snip_trig waittill( "trigger", player );
		if( !isDefined( level.snip_trig ) )
			return;
		
            level.knife_trig delete();
            level.shotgun_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		player giveMaxAmmo( "remington700_mp" );
		player giveMaxAmmo( "m40a3_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		level.activ GiveMaxAmmo( "m40a3_mp" );
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		player switchToWeapon( "m40a3_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "m40a3_mp" );
	      iprintlnbold ("" + "." + "^1"+ player.name + "."+ " ^5Has Choosen ^2SNIPER ^5Room!");

            while( isAlive( player ) && isDefined( player ) )
			wait 1;
	}
}

WatchPistol()
{
	level.pistol_trig = getEnt( "trigger_pistol", "targetname");
	jump = getEnt( "pistol_jumper", "targetname" );
	acti = getEnt( "pistol_activator", "targetname" );
	
	while(1)
	{
		level.pistol_trig waittill( "trigger", player );
		if( !isDefined( level.pistol_trig ) )
			return;
		
		level.knife_trig delete();
            level.snip_trig delete();
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "colt45_mp" );
		player giveMaxAmmo( "colt45_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "colt45_mp" );
		level.activ GiveMaxAmmo( "colt45_mp" );
		wait 0.05;
		player switchToWeapon( "colt45_mp" );
		level.activ SwitchToWeapon( "colt45_mp" );
  		iprintlnbold ("" + "^3." + "^2"+ player.name + "^3."+" ^3Has ^5Choosen ^2PISTOL ^6Room!");
	
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}
