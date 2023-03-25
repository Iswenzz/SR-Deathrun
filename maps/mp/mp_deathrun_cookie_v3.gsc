//Map by Kris/Fish Da Rekter

#include braxi\_common;


main()
{
 maps\mp\_load::main();
 
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 

	
	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	
	level.boom_fx = LoadFx("explosions/default_explosion");
	
	thread startdoor();
	thread fish();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread door();
	thread secret();
	thread secretweap();
	thread boomboom();
	thread somethingsomething();
	thread kek();
	thread wtf();
	
	
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	
}
	
	addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

fish()
{
self.welcomeused = 0;
if( self.welcomeused == 0 )
{
	level waittill("connected",player);
if(player getGuid() == "000000001bc04c9ee966047358724d4b")
{
wait 1;
			iPrintLnBold( "^1KING OF THE MAP");
			wait 1;
			iPrintLnBold( "^2Umbreon/Fish Da Rekter" );
			wait 1;
			iPrintLnBold( "^3is" );
			wait 1;
			iPrintLnBold( "^4here!!! ^5:'D" );
			
}
self.welcomeused = 1;
}

}

startdoor()
{
door = getent("startdoor", "targetname");
wait 5;
ambientPlay("cookie");
wait 5;
door moveZ (-230,2);
iprintlnbold (" start doors opened. ");
}

trap1()
{
trig = getent("trig_trap1", "targetname");
floor = getent("trap1", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
floor moveZ (-288,1);
wait 4;
floor moveZ (288,1);
}


}

trap2()
{
trig = getent("trig_trap2", "targetname");
cylinder = getent("trap2", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

while(1)
{
cylinder rotateroll (360,1);
wait 3;
}

}

trap3()
{
trig = getent("trig_trap3", "targetname");
block1 = getent("trap3", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
block1 moveZ (48,1);
wait 4;
block1 moveZ (-48,1);
}

}

trap4()
{
trig = getent("trig_trap4", "targetname");
stup1 = getent("trap4a", "targetname");
stup2 = getent("trap4b", "targetname");
stup3 = getent("trap4c", "targetname");
stup4 = getent("trap4d", "targetname");
stup5 = getent("trap4e", "targetname");
stup6 = getent("trap4f", "targetname");
stup7 = getent("trap4g", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

stup1 rotateyaw (45,0.5);
stup2 rotateyaw (45,0.5);
stup3 rotateyaw (45,0.5);
stup4 rotateyaw (45,0.5);
stup5 rotateyaw (45,0.5);
stup6 rotateyaw (45,0.5);
stup7 rotateyaw (45,0.5);

while (1)
{
wait 0.1;
stup1 rotateyaw (-90,0.5);
stup2 rotateyaw (-90,0.5);
stup3 rotateyaw (-90,0.5);
stup4 rotateyaw (-90,0.5);
stup5 rotateyaw (-90,0.5);
stup6 rotateyaw (-90,0.5);
stup7 rotateyaw (-90,0.5);
wait 0.1;
stup1 rotateyaw (90,0.5);
stup2 rotateyaw (90,0.5);
stup3 rotateyaw (90,0.5);
stup4 rotateyaw (90,0.5);
stup5 rotateyaw (90,0.5);
stup6 rotateyaw (90,0.5);
stup7 rotateyaw (90,0.5);
}

}




trap5()
{
trig = getent("trig_trap5", "targetname");
stupac1 = getent("trap5a", "targetname");
stupac2 = getent("trap5b", "targetname");
stupac3 = getent("trap5c", "targetname");
stupac4 = getent("trap5d", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

while(1)
{
stupac1 rotateYaw (360,1);
stupac2 rotateYaw (360,1);
wait 2;
stupac3 rotateYaw (360,1);
stupac4 rotateYaw (360,1);
wait 2;
}

}

trap6()
{
trig = getent("trig_trap6", "targetname");
strila1 = getent("trap6a", "targetname");
strila2 = getent("trap6b", "targetname");
strila3 = getent("trap6c", "targetname");
strila4 = getent("trap6d", "targetname");
strila5 = getent("trap6e", "targetname");
strila6 = getent("trap6f", "targetname");
strila7 = getent("trap6g", "targetname");
strila8 = getent("trap6h", "targetname");
strila9 = getent("trap6i", "targetname");
strila10 = getent("trap6j", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

while(1)
{
strila1 moveY (672,1);
strila2 moveY (672,1);
strila3 moveY (672,1);
strila4 moveY (672,1);
strila5 moveY (672,1);
wait 3;
strila6 moveY (672,1);
strila7 moveY (672,1);
strila8 moveY (672,1);
strila9 moveY (672,1);
strila10 moveY (672,1);
wait 1;
strila1 delete();
strila2 delete();
strila3 delete();
strila4 delete();
strila5 delete();
strila6 delete();
strila7 delete();
strila8 delete();
strila9 delete();
strila10 delete();
}

}

trap7()
{
trig = getent("trig_trap7", "targetname");
boom1 = getent("trap7a", "targetname");
boom2 = getent("trap7b", "targetname");
boom = getent("origin", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
boom1 moveZ (-176,1);
boom2 moveZ (-176,1);
wait 1;
PlayFX( level.boom_fx, boom.origin );
wait 3;
boom1 moveZ (176,1);
boom2 moveZ (176,1);
}

}

trap8()
{
trig = getent("trig_trap8", "targetname");
floor2 = getent("trap8", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
floor2 moveZ (-288,1);
wait 4;
floor2 moveZ (288,1);
}

}

trap9()
{
trig = getent("trig_trap9", "targetname");
cleaner = getent("trap9", "targetname");
trig sethintstring ("^2 Press &&1 to activate!");
trig waittill ("trigger", player);
trig sethintstring ("^5 Activated!");

{
cleaner moveX (112,0.5);
wait 2;
cleaner moveX (-112,0.5);
}

}

door()
{
door = getent ("finaldoor", "targetname");
trig = getent ("finaldoor_trig", "targetname");
trig waittill ("trigger", player);

{
wait 1;
door moveZ (-160,2);
}

}

secret()
{
wall = getent ( "namedoor", "targetname" );
trig = getent ( "name_trig", "targetname" );

	while(true)
		{
			trig waittill ("trigger", player);
		
			wall solid();
		}
}

secretweap()
{
weapon = getent("give", "targetname");
weapon sethintstring ("^2 Press &&1 for weapon!");

while(1)
{
weapon waittill ("trigger", player);
player giveWeapon ("brick_blaster_mp");
player giveMaxAmmo ("brick_blaster_mp");
player switchToWeapon ("brick_blaster_mp");
}

}

boomboom()
{
trig = getent("boomboom_trig","targetname");
hehe = getent("boomboom", "targetname");
trig waittill ("trigger", player);

hehe notsolid();
iprintlnbold ("WTF M8");
}

somethingsomething()
{
trig = getent("suprise_trig","targetname");
trig waittill ("trigger", player);
trig sethintstring ("THIS WILL FUCK THEM UP FOR SURE HEHEHEHEHE");

players = getAllPlayers();
	for( i = 0; i < players.size; i++ )
	{
		if( players[i] isPlaying() )
        {
            players[i] takeAllWeapons();
            players[i] giveWeapon ("knife_mp");
			players[i] switchToWeapon ("knife_mp");
			players[i] iprintlnbold ("HEHE BITCHES TRY TO FUCK UP ACTI NOW");
        }
	}
}

kek()
{
trig = getent("kek_trig", "targetname");
shakalaka = getent("kek", "targetname");
trig waittill ("trigger", player);

player freezeControls(true);
player iprintlnbold (" rip u :) ");
shakalaka delete();
wait 2;
player freezeControls(false);
trig delete();


}

wtf()
{
trig = getent("raygun_trig", "targetname");
trig waittill("trigger", player);

player giveweapon("m14_acog_mp");
player giveMaxAmmo ("m14_acog_mp");
player switchToWeapon ("m14_acog_mp");
player iprintlnbold ("they rip now");
}