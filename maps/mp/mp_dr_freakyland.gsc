/*
///////////////////////////////////////////
/////////////mp_dr_freakyland/////////////
/////Map made and scripted by: FR3AK/////
////////Feel free to use script/////////
///////////////////////////////////////
*/


main()
{
    ambientPlay("sound");
    //braxi\_common::mapAuthor( "FR3AK", "b5fa9314" );
	maps\mp\_load::main();
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
        thread auto1();
        thread auto2();
        thread auto3();
	thread auto4();
	thread auto5();
	thread auto6();
	//thread auto7();
	//thread jumpingpad();
	thread messages();
	thread messages2();
        thread teleport();
	thread teleportback();
	thread teleporttoend();
	thread teleporttoend2();
	thread teleportactitoend();
	thread teleportactitoend2();
        thread opendoor();
        thread olddoor();
		thread knifeend();
		thread sniperend();
		
    addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap2_trig" );
    addTriggerToList( "trap3_trig" );
    addTriggerToList( "trap4_trig" );
    addTriggerToList( "trap5_trig" );
    addTriggerToList( "trap6_trig" );
    addTriggerToList( "trap7_trig" );
    addTriggerToList( "trap8_trig" );
    addTriggerToList( "trap9_trig" );
	addTriggerToList( "trap10_trig" );	
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setdvar("compassmaxrange","1500");
}

/*jumpingpad()
{
	jumpx = getent ("jump","targetname");
	glow = getent ("glow","targetname");
	air1 = getent ("air1","targetname");
	air2 = getent ("air2","targetname");
	air3 = getent ("air3","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = 1;
	for(;;)
	{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 1;
			air moveto (air2.origin, time);
			wait .5;
			air moveto (air3.origin, time);
			wait 1;
			user unlink();
			wait 1;
		}
	}
}*/

trap1()
{

trig1 = getEnt ("trap1_trig", "targetname");
obj = getEnt ("trap1_trap", "targetname");

trig1 waittill ("trigger");
trig1 delete();

while (1)
{

obj rotateroll (360,7);
obj waittill ("rotatedone");
obj rotateroll (-360,7);
obj waittill ("rotatedone");
  }

}

trap2()
{

trig2 = getEnt ("trap2_trig", "targetname");
obj2 = getEnt ("trap2_trap", "targetname");

trig2 waittill ("trigger");
trig2 delete();

while (1)
{

obj2 rotateYaw(360,5);
obj2 waittill ("rotatedone");
obj2 rotateYaw(-360,5);
obj2 waittill ("rotatedone");
  }

}

trap3()
{
movedown = getEnt ("trap3_getdown", "targetname");
hurt = getEnt ("trap3_hurt", "targetname");
trig3 = getEnt ("trap3_trig", "targetname");

hurt enablelinkto();
hurt linkto (movedown); 

trig3 waittill ("trigger");
trig3 delete();

movedown moveZ( -200, 1.9); 
movedown waittill ("movedone");
wait 3;
movedown moveZ( 200, 3);
}

trap4()
{
    trig4 = getEnt("trap4_trig","targetname");
    {
        trig4 waittill ("trigger");
		trig4 delete();
        getEntArray("trap4_rem1","targetname")[RandomInt(2)] notsolid();
        getEntArray("trap4_rem2","targetname")[RandomInt(2)] notsolid();
    }
}

trap5()
{
a = getEnt ("trap5_a", "targetname");
b = getEnt ("trap5_b", "targetname");
trig5 = getEnt ("trap5_trig", "targetname");

trig5 waittill ("trigger");
trig5 delete();

a rotatePitch(360,1); 
b rotatePitch(-360,1);
wait 3;
a rotatePitch(-360,1); 
b rotatePitch(360,1);
wait 5;
a rotatePitch(360,1); 
b rotatePitch(-360,1);
}

trap6()
{
a = getEnt ("trap6_a", "targetname");
b = getEnt ("trap6_b", "targetname");
trig6 = getEnt ("trap6_trig", "targetname");

trig6 waittill ("trigger");
trig6 delete();

a rotateroll(360,1);
b rotateroll(360,1);
a waittill ("rotatedone"); 
b waittill ("rotatedone");
}


trap7()
{
a = getEnt ("trap7_a", "targetname");
b = getEnt ("trap7_b", "targetname");
c = getEnt ("trap7_c", "targetname");
trig7 = getEnt ("trap7_trig", "targetname");

trig7 waittill ("trigger");
trig7 delete();
while (1)
{

a rotateYaw(360,1); 
wait 1;
b rotateYaw(360,1);
wait 1;
c rotateYaw(360,1);
wait 1;
   }
}

trap8()
{
a = getEnt ("trap8_a", "targetname");
trig8 = getEnt ("trap8_trig", "targetname");

trig8 waittill ("trigger");
trig8 delete();
thread trap8b();
while (1)
{
a MoveX(-200,2); 
wait 1;
a MoveX(200,2);
wait 1;
   }
}

trap8b()
{
b = getEnt ("trap8_b", "targetname");
thread trap8c();
while (1)
{
b MoveX(200,2); 
wait 1;
b MoveX(-200,2);
wait 1;
 }
}

trap8c()
{
c = getEnt ("trap8_c", "targetname");
thread trap8d();
while (1)
{
c MoveX(-200,2); 
wait 1;
c MoveX(200,2);
wait 1;
 }
}

trap8d()
{
d = getEnt ("trap8_d", "targetname");
while (1)
{
d MoveX(200,2); 
wait 1;
d MoveX(-200,2);
wait 1;
 }
}

trap9()
{
a = getEnt ("trap9_a", "targetname");
trig9 = getEnt ("trap9_trig", "targetname");

trig9 waittill ("trigger");
trig9 delete();
while (1)
{
a rotateyaw(360,3.3);
a waittill ("rotatedone");
   }
}

trap10()
{
a = getEnt ("trap10_a", "targetname");
trig10 = getEnt ("trap10_trig", "targetname");

trig10 waittill ("trigger");
trig10 delete();
thread trap10b();
while (1)
{
a MoveZ(-270,3); 
wait 1;
a MoveZ(270,3);
wait 1;
   }
}

trap10b()
{
b = getEnt ("trap10_b", "targetname");
thread trap10c();
while (1)
{
b MoveZ(270,3); 
wait 1;
b MoveZ(-270,3);
wait 1;
 }
}

trap10c()
{
c = getEnt ("trap10_c", "targetname");
while (1)
{
c MoveZ(-270,2); 
wait 1;
c MoveZ(270,2);
wait 1;
 }
}

auto1()
{
auto1 = getEnt ("auto1_move1", "targetname");
while (1)
{
auto1 moveY( 400, 3); 
auto1 waittill ("movedone");
auto1 moveY( -400, 3);
auto1 waittill ("movedone");
   }
}

auto2()
{
auto2 = getEnt ("auto2_a", "targetname");
while (1)
{
auto2 rotateYaw(-360,5);
auto2 waittill ("rotatedone");
   }
}

auto3()
{
auto3 = getEnt ("auto3_a", "targetname");
while (1)
{
auto3 rotateYaw(-360,1);
auto3 waittill ("rotatedone");
   }
}

auto4()
{
auto4 = getEnt ("auto4_a", "targetname");
while (1)
{
auto4 rotateYaw(360,1);
auto4 waittill ("rotatedone");
   }
}

auto5()
{
a = getEnt ("auto5_a", "targetname");
b = getEnt ("auto5_b", "targetname");
c = getEnt ("auto5_c", "targetname");
d = getEnt ("auto5_d", "targetname");
while (1)
{
a rotatePitch(360,3);
b rotatePitch(360,3);
wait 1;
c rotatePitch(360,3);
d rotatePitch(360,3);
wait 1;
   }
}

auto6()
{
a = getEnt ("auto6_a", "targetname");
b = getEnt ("auto6_b", "targetname");
c = getEnt ("auto6_c", "targetname");
d = getEnt ("auto6_d", "targetname");

a moveX( -240, 0.5);
a waittill ("movedone");
wait 0.5;
b moveX( -420, 0.5);
b waittill ("movedone");
wait 0.5;
c moveX( -240, 0.5);
c waittill ("movedone");
wait 0.5;
d moveX( -420, 0.5);
d waittill ("movedone");
wait 0.5;
}

messages()
{
	wait 10;	
        iprintlnBold ("Map made by: FR3AK.");
        wait 8;
        iprintlnBold ("Special thanks to: FearZ, F-3-A-R & Avenger");
        wait 8;
        iprintlnBold ("^2xfire: ghost152");
        wait 8;
        iprintlnBold ("Visit ^3up-clan.net");
}

messages2()
{
for(;;)
    {
        iprintln ("Map name mp_dr_freakyland.");
        wait 20;
        iprintln ("Report ^1bugs ^7if you see it");
        wait 20;
        iprintln ("Special thanks to: FearZ, F-3-A-R & Avenger");
		wait 20;
        
    }
}

teleport()
{
	trig = getEnt ("tp_sctrig", "targetname");
	target = getEnt ("scport", "targetname");
	
		trig waittill ("trigger", player);
		trig delete();
		
		iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has reached the secret!"); 
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );            
}

teleportback()
{
	trig = getEnt ("tp_sce", "targetname");
	target = getEnt ("scend", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7Finished the secret and got a ^3deagle!"); 
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		player GiveWeapon( "deserteagle_mp" );
        player switchToWeapon( "deserteagle_mp" );		
	}
}

teleporttoend()
{
	trig = getEnt ("tp_toend", "targetname");
	target = getEnt ("endtp", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has reached the 2nd stage!"); 
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles ); 
    }  		
}

teleporttoend2()
{
	trig = getEnt ("tp_toend2", "targetname");
	target = getEnt ("endtp2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has reached the final stage!"); 
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles ); 
    }  		
}

teleportactitoend()
{
	trig = getEnt ("tp_acend", "targetname");
	target = getEnt ("acend", "targetname");
	
		trig waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );            
}

teleportactitoend2()
{
	trig = getEnt ("tp_acend2", "targetname");
	target = getEnt ("acend2", "targetname");
	
		trig waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );            
}

opendoor()
{
trig = getEnt ("trig_opendoor", "targetname");
door = getEnt ("opendoor", "targetname");

trig waittill ("trigger");
trig delete();

iprintlnbold("^6Beginning door opening!"); 
door moveZ( -420, 7);
wait 9;
door delete();
}

olddoor()
{
old_trig = getEnt ("old_room", "targetname");
knife_trig = getEnt ("knife_room", "targetname");
sniper_trig = getEnt ("sniper_room", "targetname");
door = getEnt ("olddoor", "targetname");

old_trig waittill ("trigger", player);
ambientPlay("sound2");
old_trig delete();
knife_trig delete();
sniper_trig delete();

iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has chosen OLD!");

door moveY( -420, 5);
wait 7;
door delete();
}

knifeend()
{
    knife_trig = getEnt( "knife_room", "targetname");
	sniper_trig = getEnt( "sniper_room", "targetname");
	old_trig = getEnt( "old_room", "targetname");
    jump = getEnt( "knife_jumper", "targetname" );
    acti = getEnt( "knife_acti", "targetname" );
    
    while(1)
    {
        knife_trig waittill( "trigger", player );
		ambientPlay("sound2");
        if( !isDefined( knife_trig ) )
            return;
        
        sniper_trig delete();

        old_trig delete();
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "tomahawk_mp" ); //jumper weapon        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "tomahawk_mp" );        
        wait 0.05;
        player switchToWeapon( "tomahawk_mp" ); //activator weapon
        level.activ SwitchToWeapon( "tomahawk_mp" );
        iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has chosen KNIFE!");
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}

sniperend()
{
    knife_trig = getEnt( "knife_room", "targetname");
	sniper_trig = getEnt( "sniper_room", "targetname");
	old_trig = getEnt( "old_room", "targetname");
    jump = getEnt( "snipe_jumper", "targetname" );
    acti = getEnt( "snipe_acti", "targetname" );
    
	
    while(1)
    {
        sniper_trig waittill( "trigger", player );
		ambientPlay("sound2");
        if( !isDefined( sniper_trig ) )
            return;
        
        knife_trig delete();

        old_trig delete();
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "m40a3_mp" ); //jumper weapon        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "m40a3_mp" );        
        wait 0.05;
        player switchToWeapon( "m40a3_mp" ); //activator weapon
        level.activ SwitchToWeapon( "m40a3_mp" );
        iprintlnbold("" + " " + "^2"+ player.name + " "+ "^7has chosen SNIPER!");
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

