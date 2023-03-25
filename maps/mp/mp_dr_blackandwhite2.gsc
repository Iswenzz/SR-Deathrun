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
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
	// setdvar("g_speed","190");
	setdvar("bg_fallDamageMaxHeight","100");
	level.bwsmoke = LoadFx("deathrun/bwsmoke");
	precacheItem("usp_silencer_mp");
	precacheItem("uzi_silencer_mp");
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("ak74u_mp");
	precacheItem("deserteaglegold_mp");
	precacheItem("rpg_mp");
	precacheItem("g3_mp");
	precacheItem("winchester1200_mp");
	precacheItem("ak47_mp");
	precacheItem("rpd_mp");
	precacheItem("rpd_acog_mp");

	thread startdoor();
	thread songs();
	thread bwsmoke();
	thread bwsmoke2();
	thread bwsmokeplayer();
	thread scivolo();
	//thread scivolo2();
	//thread scivolo3();
//	thread scivolo4();
	thread biancomover();
	thread ploop();
	thread endmover();
	thread dumbfgt();
	thread viproom();
	thread songchanger();
	thread weapongiver();
	thread sniper();
	thread knife();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap10();
	thread deagle();
	thread secret();
	thread tpsecret();
	thread tpsecret2();
	thread tpsecret3();
	thread tpsecret4();
	thread tpsecret5();
	thread tpsecret6();
	thread secretend();
	thread messages();
	thread sniperele();
//	thread spostatorel();
//  thread spostatorer();
	thread bounceroom();
	thread bouncemodelsniper();
	thread bounceweapon();
	thread cubo();
	thread obouncer3();
	thread obouncer4();
	thread actisecret();
	thread endactisecret();
	thread actisecretr();
	addTriggerToList( "trig_trap1" );
    addTriggerToList( "trig_trap2" );
    addTriggerToList( "trig_trap3" );
    addTriggerToList( "trig_trap4" );
    addTriggerToList( "trig_trap5" );
    addTriggerToList( "trig_trap6" );
    addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap10" );
	addTriggerToList( "trig_endactisecret" );


}

startdoor()
{
door = getEnt("startdoor", "targetname");
wait 15;
door moveZ(348, 5);
iprintlnbold("^7Start door ^7opened.");
wait 2;

}

	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

messages()
{
wait 10;
iprintlnBold("^7mp^0_^7dr^0_^7blackandwhite2");
for(;;)
{
wait 35;
x=randomint(7);
if (x==0)
{
iPrintln("^7Map made ^7by ^0Dark^7STEP");
}

if (x==1)
{
iPrintln("Special thanks to Kris for helping me with some fixes");
}

if (x==2)
{
iPrintln("^7R^0.^7I^0.^7P^0. ^7CAR ^0:(");
}

if (x==3)
{
iPrintln("^7First version ^7made by ^7Chubbs317");
}

if (x==4)
{
iPrintln("Steam: Dark^7STEP (Ryder picture)");
}

if (x==5)
{
iPrintln("^7Feel free ^7to report ^7bugs");
}

if (x==6)
{
iPrintln("^7Feel free ^7to join ^7Amnesia'^7s Deathrun^7!");
}

}
}

songs()
{
 x = randomInt (2);
 if(x==1)
 {
 ambientPlay("music1");
 }
 else
 {
 ambientPlay ("music2");
 }
}

bwsmoke()
{
  barrel = getEnt ("bwsmoke", "targetname");
   for (;;)
    {

		playFx( level.bwsmoke , barrel.origin );
		wait .2;
    }
}

bwsmoke2()
{
  barrel = getEnt ("bwsmoke2", "targetname");
   for (;;)
    {

		playFx( level.bwsmoke , barrel.origin );
		wait .2;
    }
}

bwsmokeplayer()
{
trig = getEnt("trig_bwsmokeplayer", "targetname");
trig setHintString ("^0Press ^7F ^0to ^7get ^0the ^7Black ^0And ^7White ^0trail^7!");
trig waittill ("trigger", player);
while(isAlive(player))
	{

		playFx( level.bwsmoke , player.origin );
		wait .1;
    }
}

scivolo()
{
jumpx = getent ("jump","targetname");
	air1 = getent ("air1","targetname");
	air2 = getent ("air2","targetname");
	air3 = getent ("air3","targetname");
	air4 = getent ("air4","targetname");
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
			wait .6;
			air moveto (air2.origin, time);
			wait .5;
			air moveto (air3.origin, time);
			wait .5;
			air moveto (air4.origin, time);
			wait .6;
			user unlink();
			wait 1;
		}
    }
}


biancomover()
{
bianco1 = getEnt ("bianco1", "targetname");
bianco2 = getEnt ("bianco2", "targetname");
   for(;;)
    {
	bianco1 moveZ (136,0.5);
	bianco2 moveZ (-136,0.5);
	wait 0.5;
	bianco1 moveX (256,1);
	bianco2 moveX (-256,1);
	wait 1;
	bianco1 moveZ (-272,1);
	bianco2 moveZ (272,1);
	wait 1;
    bianco1 moveX (-256,1);
	bianco2 moveX (256,1);
	wait 1;
	bianco1 moveZ (136,0.5);
	bianco2 moveZ (-136,0.5);
	wait 0.5;
	}
}

ploop()
{
brush1 = getEnt("pl1","targetname");
brush2 = getEnt("pl2","targetname");
brush3 = getEnt("pl3","targetname");
brush4 = getEnt("pl4","targetname");
brush5 = getEnt("pl5","targetname");

    while(1)
    {
    brush1 moveZ(-1408,1.5);
    brush1 hide();
    brush1 notSolid();
    brush2 moveZ(352,1.5);
    brush3 moveZ(352,1.5);
    brush4 moveZ(352,1.5);
    brush5 moveZ(352,1.5);
    brush5 show();
    brush5 solid();
    wait 1.5;
    brush1 moveZ(352,1.5);
    brush1 show();
    brush1 solid();
    brush2 moveZ(-1408,1.5);
    brush2 hide();
    brush2 notSolid();
    brush3 moveZ(352,1.5);
    brush4 moveZ(352,1.5);
    brush5 moveZ(352,1.5);
    wait 1.5;
    brush1 moveZ(352,1.5);
    brush2 moveZ(352,1.5);
    brush2 show();
    brush2 solid();
    brush3 moveZ(-1408,1.5);
    brush3 hide();
    brush3 notSolid();
    brush4 moveZ(352,1.5);
    brush5 moveZ(352,1.5);
    wait 1.5;
    brush1 moveZ(352,1.5);
    brush2 moveZ(352,1.5);
    brush3 moveZ(352,1.5);
    brush3 show();
    brush3 solid();
    brush4 moveZ(-1408,1.5);
    brush4 hide();
    brush4 notSolid();
    brush5 moveZ(352,1.5);
    wait 1.5;
    brush1 moveZ(352,1.5);
    brush2 moveZ(352,1.5);
    brush3 moveZ(352,1.5);
    brush4 moveZ(352,1.5);
    brush4 show();
    brush4 solid();
    brush5 moveZ(-1408,1.5);
    brush5 hide();
    brush5 notSolid();
    wait 1.5;
    }
}

endmover()
{
block = getEnt ("endmover", "targetname"); //2472
left = getEnt ("bel", "targetname");
right = getEnt ("ber", "targetname");
up = getEnt ("beu", "targetname");
down = getEnt ("bed", "targetname");
trig = getEnt ("trig_endmover", "targetname");
trig waittill("trigger", player);
trig delete();
for (;;)
{
wait 0.5;
block moveY (-2472, 7);
left moveX (424, 6);
right moveX (-416, 6);
up moveZ (488, 6);
down moveZ (-504, 6);
wait 10;
block moveY (2472, 7);
left moveX (-424, 6);
right moveX (416, 6);
up moveZ (-488, 6);
down moveZ (504, 6);
wait 12;
}
}

dumbfgt()
{
trig = getEnt ("dumbfgt", "targetname");
dumb = getEnt ("o_dumbfgt", "targetname");
  for(;;)
  {
  trig waittill ("trigger", player);
   player setOrigin(dumb.origin);
   player SetPlayerAngles(dumb.angles);
   player iPrintLnBold ("Dumb ^0faggot^7!");
  }

}

viproom()
{
trig = getEnt ("viproom", "targetname");
door = getEnt ("viproomdoor", "targetname");
    for(;;)
    {
	trig waittill("trigger",player);
	guid = player getGuid();
    guid = getSubStr(guid, 24);
	 if ( guid == "78325386" || guid == "860fb8aa" || guid == "58724d4b" || guid == "f7945e8c" || guid == "94f9fe4d" || guid == "2819a453" || guid == "92d89af0" || guid == "7c6b40c0" || player.name == "oCm Duck" || player.name == "oCm UDR" || player.name == "Fish Da Rekter" || player.name == "oCm dova" || player.name == "oCm Lightz." || player.name == "oCm OrK!DeA" || player.name == "oCm Akos" || player.name == "oCm caesar" || player.name == "Drunk0_0Monkey" || player.name == "LagSTEP" || player.name == "DarkSTEP" || player.name == "xXSuperDeathrunProMasterLegendXx")
	            //step               //maris                 //kris                 //genz               //nuka               //nepo            //druglord            //lifezor
	 {
     door moveZ(-274, 1);
	 wait 1.5;
	 door moveZ(274, 1);
	 wait 2;
	 }
	 else
	 {
	  player iPrintLnBold ("^7Access Denied^7!");
	 }
	}
}

songchanger()
{
premuto = false;
 trig = getEnt ("songchanger", "targetname");
 exit = getEnt ("vipexit", "targetname");
 for(;;)
     {
        trig waittill ("trigger", player);
		if (premuto == false)
		{
   trig setHintString ("^0Stradeus ^7- ^0Holy");
        AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("holy");
		iPrintLn ("^7Holy shit a VIP just changed the music O.o");
		premuto = true;
		}
		else
		{
		trig setHintString ("^0Go ^7back");
		   player setOrigin(exit.origin);
        player SetPlayerAngles(exit.angles);
		}
  }
}

weapongiver()
{
	 trig = getEnt ("weapongiver", "targetname");
	 gunplat = getEnt ("gunplat", "targetname");
	 gungates = getEnt ("gungates", "targetname");
	 gunplat hide();
	 trig setHintString ("Press ^0F ^7to ^0get ^7a ^0random ^7weapon^0!");
	 for(;;)
	 {
        trig waittill ("trigger", player);
		gungates hide();
		wait 0.5;
	    gunplat show();
		x=randomint(12);
if (x==0)
{
		player giveWeapon ("rpd_acog_mp");
        player giveMaxAmmo ("rpd_acog_mp");
        player switchToWeapon ("rpd_acog_mp");
}

if (x==1)
{
		player giveWeapon ("usp_silencer_mp");
        player giveMaxAmmo ("usp_silencer_mp");
        player switchToWeapon ("usp_silencer_mp");
}

if (x==2)
{
		player giveWeapon ("remington700_mp");
        player giveMaxAmmo ("remington700_mp");
        player switchToWeapon ("remington700_mp");
}

if (x==3)
{
		player giveWeapon ("ak74u_mp");
        player giveMaxAmmo ("ak74u_mp");
        player switchToWeapon ("ak74u_mp");
}

if (x==4)
{
		player giveWeapon ("g3_mp");
        player giveMaxAmmo ("g3_mp");
        player switchToWeapon ("g3_mp");
}

if (x==5)
{
		player giveWeapon ("rpg_mp");
        player giveMaxAmmo ("rpg_mp");
        player switchToWeapon ("rpg_mp");
}

if (x==6)
{
		player giveWeapon ("deserteaglegold_mp");
        player giveMaxAmmo ("deserteaglegold_mp");
        player switchToWeapon ("deserteaglegold_mp");
}

if (x==7)
{
		player giveWeapon ("m40a3_mp");
        player giveMaxAmmo ("m40a3_mp");
        player switchToWeapon ("m40a3_mp");
}

if (x==8)
{
		player giveWeapon ("uzi_silencer_mp");
        player giveMaxAmmo ("uzi_silencer_mp");
        player switchToWeapon ("uzi_silencer_mp");
}

if (x==9)
{
		player giveWeapon ("winchester1200_mp");
        player giveMaxAmmo ("winchester1200_mp");
        player switchToWeapon ("winchester1200_mp");
}

if (x==10)
{
		player giveWeapon ("ak47_mp");
        player giveMaxAmmo ("ak47_mp");
        player switchToWeapon ("ak47_mp");
}

if (x==11)
{
		player giveWeapon ("rpd_mp");
        player giveMaxAmmo ("rpd_mp");
        player switchToWeapon ("rpd_mp");
}

wait 2;

gunplat hide();
gungates show();
}
}

sniper()
{
        level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
		level.knife_trig = getEnt("knife_trig", "targetname");
		level.deagle_trig = getEnt( "deagle_trig", "targetname");
		level.bounce_trig = getEnt("bounce_trig", "targetname");
        jump = getEnt( "sniper1", "targetname" ); //jumper origin
        acti = getEnt( "sniper2", "targetname" ); //acti origin

        while(1)
{
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                return;

              level.knife_trig delete();
			  level.deagle_trig delete();
			  level.bounce_trig delete();

		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("sniper");
		iPrintLn ("^0>>^7Now playing^0: ^7Skrillex ^0 - ^7Scary Monsters & Nice Sprites (Spitfya Remix)^0<<");
            player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m40a3_mp" ); //Gives player weapon
                player giveMaxAmmo( "m40a3_mp" ); //Gives player ammo
                player GiveWeapon( "remington700_mp" );
                player giveMaxAmmo( "remington700_mp" );
          //  player switchToWeapon( "rpd_acog_mp" );
		  x=randomint(1);
if (x==0)
{
player switchToWeapon( "remington700_mp" );
}

if (x==1)
{
player switchToWeapon( "m40a3_mp" );
}
			 //Makes player switch to weapon.
                player.maxhealth = 100; //Sets players health to normal.


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti.angles );
                    level.activ setOrigin( acti.origin );
                    level.activ TakeAllWeapons();
                    level.activ GiveWeapon( "m40a3_mp" );
                    level.activ giveMaxAmmo( "m40a3_mp" );
                    level.activ GiveWeapon( "remington700_mp" );
                    level.activ giveMaxAmmo( "remington700_mp" );
               		  y=randomint(1);
if (y==0)
{
level.activ switchToWeapon( "remington700_mp" );
}

if (y==1)
{
level.activ switchToWeapon( "m40a3_mp" );
}
                    level.activ.maxhealth = 100;

}

                wait 0.05;

                iPrintLnBold( " ^0" + player.name + " ^7entered ^0Sniper ^7Room^0!" );
            player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^03" );
            level.activ iPrintlnBold( "^03" );
            wait 1;
            player iPrintlnBold( "2" );
            level.activ iPrintlnBold( "2" );
            wait 1;
            player iPrintlnBold( "^01" );
            level.activ iPrintlnBold( "^01" );
            wait 1;
            player iPrintlnBold( "^7Fight^0!" );
            level.activ iPrintlnBold( "^7Fight^0!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
}
}

knife()
{
		acti2 = getEnt("knife2", "targetname");
		jump2 = getEnt("knife1", "targetname");
		level.deagle_trig = getEnt( "deagle_trig", "targetname");
		level.bounce_trig = getEnt("bounce_trig", "targetname");
		level.sniper_trig = getEnt("sniper_trig", "targetname");
		level.knife_trig = getEnt("knife_trig", "targetname");
		first = true;





		while(1)
		{
		level.knife_trig waittill( "trigger", player );


		if( !isDefined( level.knife_trig ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trig delete();
				level.bounce_trig delete();
				level.deagle_trig delete();
				level.firstenter=false;
				}
				wait(0.05);

		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("knife");
		player setOrigin( jump2.origin );
		player setPlayerAngles( jump2.angles );
		player takeAllWeapons();
		player giveWeapon("knife_mp");
		wait (0.05);
		player switchToWeapon("knife_mp");
		wait (0.05);
		level.activ setOrigin (acti2.origin);
		level.activ setPlayerAngles (acti2.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_mp" );
		wait (0.05);
		level.activ switchToWeapon("knife_mp");
		iPrintLnBold( " ^0" + player.name + " ^7 wants ^0to ^7slash ^0Activator^7'^0s ^7ass^0!" );
          player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
			if (first == true)
			{
            wait 5;
			first = false;
			}
			if (first == false)
			{
			wait 3;
			}
            player iPrintlnBold( "^7Fight^0!" );
            level.activ iPrintlnBold( "^7Fight^0!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

trap1()
{
trig = getEnt ("trig_trap1", "targetname");
a = getEnt ("trap1a", "targetname");
b = getEnt ("trap1b", "targetname");
trig setHintString ("^7Press F ^7to activate the drop trap!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a moveZ (-144, 2);
  wait 2.1;
  a moveZ (144, 2);
  wait 5;
  b moveZ (-144, 2);
  wait 2.1;
  b moveZ (144, 2);
  wait 5;
 }
}

trap2()
{
trig = getEnt ("trig_trap2", "targetname");
a = getEnt ("trap2a", "targetname");
b = getEnt ("trap2b", "targetname");
trig setHintString ("^7Press F ^7to rotate blocks!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a rotateRoll (-720, 2);
  wait 2;
  b rotateRoll (720, 2);
  wait 2;
 }
}

trap3()
{
trig = getEnt ("trig_trap3", "targetname");
a = getEnt ("trap3a", "targetname");
b = getEnt ("trap3b", "targetname");
trig setHintString ("^7Press F ^7to move platforms!");
trig waittill("trigger", player);
trig delete();

//a moveZ (-108, 1);
b moveZ (108, 1);
 for (;;)
 {
  a moveZ (264, 2);
  b moveZ (-216, 2);
  wait 2.1;
  a moveZ (-264, 2);
  b moveZ (216, 2);
  wait 2.5;
 }
}

trap4()
{
trig = getEnt ("trig_trap4", "targetname");
a = getEnt ("trap4a", "targetname");
b = getEnt ("trap4b", "targetname");
trig setHintString ("^7Press F ^7to turn on spinners!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a rotateYaw (-360, 3);
  b rotateYaw (-360, 3);
  wait 3;
 }
}

trap5()
{
trig = getEnt ("trig_trap5", "targetname");
a = getEnt ("trap5a", "targetname");
b = getEnt ("trap5b", "targetname");
trig setHintString ("^7Press F ^7to run hammers!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a moveY(-280, 0.4);
  wait 0.45;
  a moveY (280, 0.4);
  wait 1.5;
  b moveY (280, 0.4);
  wait 0.45;
  b moveY (-280, 0.4);
  wait 1.5;
 }
}

deaglewall()
{
a = getEnt ("dw1", "targetname");
b = getEnt ("dw2", "targetname");
  for (;;)
  {
  wait 0.5;
  x = randomInt (2);
  if (x==0)
  {
    a moveZ(-128, 2);
    wait 5;
    a moveZ (128, 2);
    wait 5;
  }
  else
    {
    b moveZ (-128, 2);
    wait 5;
    b moveZ (128, 2);
    wait 5;
    }
  }
}

deagle()
{
    level.deagle_trig = getEnt( "deagle_trig", "targetname");
	level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
	level.knife_trig = getEnt("knife_trig", "targetname");
	level.bounce_trig = getEnt("bounce_trig", "targetname");
    jump = getEnt( "o_deaglej", "targetname" );
    acti = getEnt( "o_deaglea", "targetname" );

    while(1)
    {
        level.deagle_trig waittill( "trigger", player );
        if( !isDefined( level.deagle_trig ) )
            return;

        level.knife_trig delete();
		level.sniper_trig delete();
		level.bounce_trig delete();
		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("deagle");
		iPrintLn ("^0>>^7Now playing^0: ^7KSHMR & Marnik ^0- ^7Mandala (Magnace Remix)^0<<");
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "deserteagle_mp" ); //jumper weapon
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "deserteagle_mp" );
        wait 0.05;
        player switchToWeapon( "deserteagle_mp" ); //activator weapon
		player.maxhealth = 100;
		level.activ.maxhealth = 100;
        level.activ SwitchToWeapon( "deserteagle_mp" );
        iPrintlnBold( " ^7" + player.name + " ^0Entered ^7Deagle ^0Room^7!" );
  player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "3" );
            level.activ iPrintlnBold( "3" );
            wait 1;
            player iPrintlnBold( "2" );
            level.activ iPrintlnBold( "2" );
            wait 1;
            player iPrintlnBold( "1" );
            level.activ iPrintlnBold( "1" );
            wait 1;
            player iPrintlnBold( "^7Fight^0!" );
            level.activ iPrintlnBold( "^7Fight^0!" );
			thread deaglewall();
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);		//change to what you want it to be
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }
}

secret()
{
	trig = getEnt("trig_secret", "targetname");
	arrivo = getEnt("o_secret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
	iprintlnBold("^7" + player.name, " ^7found the ^7secret!");
  }
}

tpsecret()
{
	trig = getEnt("tpsecret", "targetname");
	arrivo = getEnt("o_tpsecret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpsecret2()
{
	trig = getEnt("tpsecret2", "targetname");
	arrivo = getEnt("o_tpsecret2", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpsecret3()
{
	trig = getEnt("tpsecret3", "targetname");
	arrivo = getEnt("o_tpsecret3", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpsecret4()
{
	trig = getEnt("tpsecret4", "targetname");
	arrivo = getEnt("o_tpsecret4", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpsecret5()
{
	trig = getEnt("tpsecret5", "targetname");
	arrivo = getEnt("o_tpsecret5", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

tpsecret6()
{
	trig = getEnt("tpsecret6", "targetname");
	arrivo = getEnt("o_tpsecret6", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

trap6()
{
trig = getEnt ("trig_trap6", "targetname");
a = getEnt ("trap6a", "targetname");
b = getEnt ("trap6b", "targetname");
c = getEnt ("trap6c", "targetname");
trig setHintString ("^7Press F ^7to remove platform!");
trig waittill("trigger", player);
trig delete();
a rotateRoll (90, 1);
wait 1;
a moveZ (-272, 1);
wait 1.2;
a delete();
wait 1;
 b moveY(-216, 0.5);
 c moveY(216, 0.5);
 wait 0.5;
 for (;;)
 {
  b moveY(340, 1.5);
  c moveY (-340, 1.5);
  wait 1.5;
  b moveY (-340, 1.5);
  c moveY (340, 1.5);
  wait 1.5;
 }
}

secretend()
{
	trig = getEnt("trig_secretend", "targetname");
	arrivo = getEnt("o_secretend", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	iPrintLnBold( " ^7" +player.name+ " ^0finished ^7Secret^0!");
//	player braxi\_rank::giveRankXp( "", 500);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles( arrivo.angles );
  }
}

trap7()
{
trig = getEnt ("trig_trap7", "targetname");
a = getEnt ("trap7a", "targetname");
b = getEnt ("trap7b", "targetname");
ta = getEnt ("trap7ta", "targetname");
tb = getEnt ("trap7tb", "targetname");
ta enablelinkto();
ta linkto(a);
tb enablelinkto();
tb linkto(b);
trig setHintString ("^7Press F ^7to start hammers!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a rotateRoll (-360, 3);
  b rotateRoll (360, 3);
  wait 3.00001;
 }
}

trap8()
{
trig = getEnt ("trig_trap8", "targetname");
a = getEnt ("trap8", "targetname");
trig setHintString ("^7Press F ^7to spin the platform!");
trig waittill("trigger", player);
trig delete();
 for (;;)
 {
  a rotateYaw(360, 2);
  wait 2;
 }
}

sniperele()
{
	trig = getEnt("trig_snipele", "targetname");
	arrivo = getEnt("snipele", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	arrivo moveZ (688, 1);
	wait 1;
	wait 3;
	arrivo moveZ (-688, 1);
	wait 1;
	wait 3;
  }
}

bounceroom()
{
		level.teleactorigin = getEnt("o_bouncer2", "targetname");
		telejumporigin = getEnt("assentity", "targetname");
		level.deagle_trig = getEnt( "deagle_trig", "targetname");
	    level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
	    level.knife_trig = getEnt("knife_trig", "targetname");
		level.bounce_trig = getEnt("bounce_trig", "targetname");

		while(1)
		{
		level.bounce_trig waittill( "trigger", player );
		if( !isDefined( level.bounce_trig ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trig delete();
				level.knife_trig delete();
				level.deagle_trig delete();
				level.firstenter=false;
				}
				wait(0.05);

		AmbientStop(3);
		MusicStop(3);
		AmbientStop(0);
		MusicStop(0);
		ambientPlay("bounce");
		thread bouncemodelsniper();
		thread bounceweapon();
		iPrintLn ("^0>>^7Now playing^7: ^7Nero ^7- ^7Doomsday^0<<");
		player setOrigin( telejumporigin.origin );
		player setPlayerAngles( telejumporigin.angles );
		player takeAllWeapons();
		player giveWeapon("knife_mp");
		wait (0.05);
		player switchToWeapon("knife_mp");
		wait (0.05);
		level.activ setOrigin (level.teleactorigin.origin);
		level.activ setPlayerAngles (level.teleactorigin.angles);
		level.activ takeAllWeapons();
		level.activ giveWeapon( "knife_mp" );
		wait (0.05);
		level.activ switchToWeapon("knife_mp");
		iPrintLnBold( " ^7" + player.name+ "  entered ^7Bounce room^7!" );
  player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "3" );
            level.activ iPrintlnBold( "3" );
            wait 0.75;
            player iPrintlnBold( "2" );
            level.activ iPrintlnBold( "2" );
            wait 0.75;
            player iPrintlnBold( "1" );
            level.activ iPrintlnBold( "1" );
            wait 0.75;
            player iPrintlnBold( "^7Jump" );
            level.activ iPrintlnBold( "^7Jump!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
		player waittill( "death" );
		level.PlayerInRoom = false;
		}

}


bouncemodelsniper()
{
a = getEnt ("bouncemsniper", "targetname");
 for (;;)
 {
  a rotateYaw(360, 2);
  wait 2;
 }

}

bounceweapon()
{
trig = getEnt ("bounceweapon", "targetname");
presa = false;
trig setHintString ("Press F to get a sniper!");

	for (;;)
	{
 if (presa == false)
 {
		trig waittill ("trigger", player);
		wait(0.2);
	    iPrintLn (player.name+ " got a sniper!");
		player giveWeapon ("remington700_mp");
		player giveMaxammo ("remington700_mp");
		player switchToWeapon ("remington700_mp");
       presa = true;
  }

  else
 {
  		wait 1;
		trig setHintString ("3");
		wait 1;
		trig setHintString ("2");
		wait 1;
		trig setHintString ("1");
		wait 1;
		trig setHintString ("Press F to get a sniper!");
		presa = false;
 }
}
}

cubo()
{
	 cubo = getEnt("cubo", "targetname");
	 weirdo = getEnt("weirdo", "targetname");
	 for(;;)
	 {
	 cubo rotateYaw(360, 5);
	 cubo rotatePitch(360, 5);
	 weirdo rotateRoll(720, 5);
	 weirdo rotatePitch(-720, 5);
	 wait 5;
	 }
}

trap10()
{
trig = getEnt ("trig_trap10", "targetname");
a = getEnt ("trap10a", "targetname");
b = getEnt ("trap10b", "targetname");
trig setHintString ("^7Press F ^7to make pillars unstable!");
trig waittill("trigger", player);
trig delete();
 a moveZ(-280, 0.8);
  wait 1;
 for (;;)
 {
  a moveZ (280, 0.8);
  b moveZ (-280, 0.8);
  wait 1;
  a moveZ (-280, 0.8);
  b moveZ (280, 0.8);
  wait 1;
 }
}

obouncer3()
{
	trig = getEnt("trig_obouncer2", "targetname");
	arrivo = getEnt("o_bouncer3", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

obouncer4()
{
	trig = getEnt("trig_obouncer1", "targetname");
	arrivo = getEnt("o_bouncer4", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}

actisecret()
{
	trig = getEnt("trig_actisecret", "targetname");
	arrivo = getEnt("o_actisecret", "targetname");
	trig setHintString("Press ^0F ^7to enter acti secret :D");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}


endactisecret()
{
	trig = getEnt("trig_endactisecret", "targetname");
	arrivo = getEnt("o_endactisecret", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
	iPrintln ("Activator finished his secret!");
  }
}

actisecretr()
{
	trig = getEnt("trig_actisecretr", "targetname");
	arrivo = getEnt("o_actisecretr", "targetname");
  for (;;)
  {
	trig waittill("trigger", player);
	player setOrigin(arrivo.origin);
	player SetPlayerAngles(arrivo.angles);
  }
}


