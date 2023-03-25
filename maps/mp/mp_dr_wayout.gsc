//Map by Kris


main()
{
 maps\mp\_load::main();
 	precacheItem("knife_weaver_mp");
	precacheItem("bo_crossbow_mp");
	precacheItem("bo_crossbow_explosive_mp");
	precacheItem("bo_l96_vz_mp");
 fx = loadFx( "explosions/church_roof_explosion" );

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

	// setdvar("g_speed" ,"190");
	// setdvar("dr_jumpers_speed" ,"1");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");



	thread messages();
	thread startdoor();
	thread removebrush();
	thread shortcut();
	thread trap1();
	thread elevator();
	thread jumperarea1();
	thread jumperarea2();
	thread jumperarea3();
	thread actiarea1();
	thread actiarea2();
	thread actiarea3();
	thread actiarea4();
	thread lift();
	thread music1();
	thread music2();
	thread music3();
	thread moveto();
	thread movetohint();
	thread traps();
	thread rooms();
	thread secrets();

}


messages()
{
door1 = getent ("startdoor1", "targetname");
door2 = getent ("startdoor2", "targetname");
door3 = getent ("startdoor3", "targetname");
door4 = getent ("startdoor4", "targetname");
door5 = getent ("startdoor5", "targetname");
door6 = getent ("startdoor6", "targetname");

	{
	wait 10;
	door1 moveZ (-230, 2);
	door2 moveZ (-230, 2);
	door3 moveZ (-230, 2);
	door4 moveZ (-230, 2);
	door5 moveZ (-230, 2);
	door6 moveZ (-230, 2);
	iprintlnBold("^1Mp_dr_wayout");
	wait 1;
	iprintlnBold("^2Map by ^3Fish Da Rekter/Kris");
	}

}

startdoor()
{
door = getent ("boomdoor", "targetname");
trig = getent ("doortrig", "targetname");
fx = loadFx( "explosions/church_roof_explosion" );
org = getEnt( "play_fx_here", "targetname" );
trig waittill ("trigger", player);
	iprintlnBold ("^2The floor is about to explode!");
	wait 5;
	playFx( fx, org.origin );
	door delete();
	trig delete();
	wait 1;
	iprintlnBold ("^3Thanks to ^5 NinjaWa");
	wait 1;
	iprintlnBold ("^4Thanks to map testers!");
}

removebrush()
{
brush1 = getent ("brushremove1", "targetname");
brush2 = getent ("brushremove2", "targetname");
trig = getent ("brushremovetrig", "targetname");
trig waittill ("trigger", player);

{
player iprintlnBold ("^1Wut waz ^3dat?");
brush1 notsolid();
brush2 notsolid();
}

}

shortcut()
{
origin = getent("origin_shortcut", "targetname");
trig = getent("trig_shortcut", "targetname");
trig waittill ("trigger", player);

for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (origin.origin);
		iprintlnBold("^2" + player.name + " ^3 found the shortcut!");
	}
}

trap1()
{
blocka = getent ("trap1a", "targetname");
trig = getent ("trig_trap1", "targetname");
blockb = getent ("trap1b", "targetname");
trig = getent ("trig_trap1", "targetname");
blockc = getent ("trap1c", "targetname");
trig = getent ("trig_trap1", "targetname");
blockd = getent ("trap1d", "targetname");
trig = getent ("trig_trap1", "targetname");
blocke = getent ("trap1e", "targetname");
trig = getent ("trig_trap1", "targetname");
blockf = getent ("trap1f", "targetname");
trig = getent ("trig_trap1", "targetname");
blockg = getent ("trap1g", "targetname");
trig = getent ("trig_trap1", "targetname");
blockh = getent ("trap1h", "targetname");
trig = getent ("trig_trap1", "targetname");
blocki = getent ("trap1i", "targetname");
trig = getent ("trig_trap1", "targetname");
blockj = getent ("trap1j", "targetname");
trig = getent ("trig_trap1", "targetname");
blockk = getent ("trap1k", "targetname");
trig = getent ("trig_trap1", "targetname");
blockl = getent ("trap1l", "targetname");
trig = getent ("trig_trap1", "targetname");
blockm = getent ("trap1m", "targetname");
trig = getent ("trig_trap1", "targetname");
blockn = getent ("trap1n", "targetname");
trig = getent ("trig_trap1", "targetname");
blocko = getent ("trap1o", "targetname");
trig = getent ("trig_trap1", "targetname");
blockp = getent ("trap1p", "targetname");
trig = getent ("trig_trap1", "targetname");
blockr = getent ("trap1r", "targetname");
trig = getent ("trig_trap1", "targetname");
blocks = getent ("trap1s", "targetname");
trig = getent ("trig_trap1", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");

trig waittill("trigger", player);

trig SetHintString(" ^3 Activated!");

	{

	blocka delete();
	blockb delete();
	blockc delete();
	blockd delete();
	blocke delete();
	blockf delete();
	blockg delete();
	blockh delete();
	blocki delete();
	blockj delete();
	blockk delete();
	blockl delete();
	blockm delete();
	blockn delete();
	blocko delete();
	blockp delete();
	blockr moveZ( -390, 2 );
	blocks moveZ( -390, 2 );
	wait 2;
	blockr delete();
	blocks delete();

	}

}

elevator()
{
elea = getent ("elevatora", "targetname");
trig = getent ("elevatortrig", "targetname");
eleb = getent ("elevatorb", "targetname");
trig = getent ("elevatortrig", "targetname");
elec = getent ("elevatorc", "targetname");
trig = getent ("elevatortrig", "targetname");
eled = getent ("elevatord", "targetname");
trig = getent ("elevatortrig", "targetname");
elee = getent ("elevatore", "targetname");
trig = getent ("elevatortrig", "targetname");
eledoor = getent ("elevatorgate", "targetname");
trig = getent ("elevatortrig", "targetname");
trig waittill ("trigger", player);

	trig delete();
	eledoor moveY (-314, 2);
	wait 1.5;

	while(1)
	{
	elea moveZ (744, 3);
	eleb moveZ (744, 3);
	elec moveZ (744, 3);
	eled moveZ (744, 3);
	elee moveZ (744, 3);
	elea waittill ("movedone");
	wait 2;
	elea moveZ (-744, 3);
	eleb moveZ (-744, 3);
	elec moveZ (-744, 3);
	eled moveZ (-744, 3);
	elee moveZ (-744, 3);
	elea waittill ("movedone");
	wait 5;
	}

}

jumperarea1()
{
	trig = getent("trigger_teleportarea1", "targetname");
	teleportarea1 = getent("origin_teleportarea1", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportarea1.origin);
	}
}

jumperarea2()
{
	trig = getent("trigger_teleportarea2", "targetname");
	teleportarea2 = getent("origin_teleportarea2", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportarea2.origin);
	}
}

jumperarea3()
{
	trig = getent("trigger_teleportarea3", "targetname");
	teleportarea3 = getent("origin_teleportarea3", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportarea3.origin);
		iprintlnBold ("^5" + player.name + "^2 finished the map ^1 1st!!");
	}
}

actiarea1()
{
	trig = getent("trigger_actiteleportarea1", "targetname");
	teleportactiarea1 = getent("origin_actiteleportarea1", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportactiarea1.origin);
	}
}

actiarea2()
{
	trig = getent("trigger_actiteleportarea2", "targetname");
	teleportactiarea2 = getent("origin_actiteleportarea2", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportactiarea2.origin);
	}
}

actiarea3()
{
	trig = getent("trigger_actiteleportarea3", "targetname");
	teleportactiarea3 = getent("origin_actiteleportarea3", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportactiarea3.origin);
	}
}

actiarea4()
{
	trig = getent("trigger_actiteleportarea4", "targetname");
	teleportactiarea4 = getent("origin_actiteleportarea4", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportactiarea4.origin);
	}
}

actiarea5()
{
	trig = getent("trigger_actiteleportarea5", "targetname");
	teleportactiarea5 = getent("origin_actiteleportarea5", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (teleportactiarea5.origin);
	}
}


lift()
{
liftthing = getent ("lift", "targetname");
trig = getent ("trig_lift", "targetname");
trig waittill ("trigger", player);

trig delete();

while(1)
{
liftthing moveX (-1792,5);
liftthing waittill ("movedone");
wait 2;
liftthing moveX (1792,5);
liftthing waittill ("movedone");
wait 2;
}

}


music1()
{
s1 = getent ("song1", "targetname");
trigs1 = getent ("trig_song1", "targetname");
trigs2 = getent ("trig_song2", "targetname");
trigs3 = getent ("trig_song3", "targetname");
trigs1 SetHintString("^1 Krewella & Krewella & Pegboard Nerds - This Is Not The End");
trigs1 waittill ("trigger", player);

	{
	trigs2 delete();
	trigs3 delete();
	ambientPlay("wayout1");
	s1 moveX (4, 2);
	iprintln("^0>> ^1Now playing: ^2 Krewella & Pegboard Nerds - This Is Not The End ^0<<");
	iprintln("^0>> ^1Now playing: ^2 Krewella & Pegboard Nerds - This Is Not The End ^0<<");
	iprintln("^0>> ^1Now playing: ^2 Krewella & Pegboard Nerds - This Is Not The End ^0<<");
	}

}

music2()
{
s2 = getent ("song2", "targetname");
trigs2 = getent ("trig_song2", "targetname");
trigs1 = getent ("trig_song1", "targetname");
trigs3 = getent ("trig_song3", "targetname");
trigs2 SetHintString("^2 Razihel - Children Of The Night");
trigs2 waittill ("trigger", player);

	{
	trigs1 delete();
	trigs3 delete();
	ambientPlay("wayout2");
	s2 moveX (4, 2);
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Children Of The Night ^0<<");
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Children Of The Night ^0<<");
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Children Of The Night ^0<<");

	}

}

music3()
{
s3 = getent ("song3", "targetname");
trigs3 = getent ("trig_song3", "targetname");
trigs2 = getent ("trig_song2", "targetname");
trigs1 = getent ("trig_song1", "targetname");
trigs3 SetHintString("^3 Razihel - Skybreaker");
trigs3 waittill ("trigger", player);

	{
	trigs1 delete();
	trigs2 delete();
	ambientPlay("wayout3");
	s3 moveX (4, 2);
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Skybreaker ^0<<");
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Skybreaker ^0<<");
	iprintln ("^0>> ^1Now playing: ^2 Razihel - Skybreaker ^0<<");
	}

}

moveto()
{
origin = getent ("origin_slidetp", "targetname");
trig = getent("trig_slidetp", "targetname");

for(;;)
	{
		trig waittill("trigger", player);
		player setOrigin (origin.origin);
	}

}

movetohint()
{
trighint = getent ("trig_movetohint", "targetname");
trighint SetHintString(" ^2Just ^1GO FOR IT ^2and trust the mapper :) ");
trighint waittill ("trigger", player);

}

////////////TRAPS///////////
traps()
{

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

}

trap2()
{
trap2a = getent ("trap2a", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2b = getent ("trap2b", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2c = getent ("trap2c", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2d = getent ("trap2d", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2e = getent ("trap2e", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2f = getent ("trap2f", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2g = getent ("trap2g", "targetname");
trig = getent ("trig_trap2", "targetname");
trap2h = getent ("trap2h", "targetname");
trig = getent ("trig_trap2", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

trap2h moveY(-511, 1);
trap2g moveY(-511, 1);
trap2d moveY(-511, 1);
trap2c moveY(-511, 1);
wait 2;

while(1)

{
trap2f moveY(-511, 1);
trap2e moveY(-511, 1);
trap2b moveY(-511, 1);
trap2a moveY(-511, 1);
trap2h moveY(511, 1);
trap2g moveY(511, 1);
trap2d moveY(511, 1);
trap2c moveY(511, 1);
wait 2;
trap2f moveY(511, 1);
trap2e moveY(511, 1);
trap2b moveY(511, 1);
trap2a moveY(511, 1);
trap2h moveY(-511, 1);
trap2g moveY(-511, 1);
trap2d moveY(-511, 1);
trap2c moveY(-511, 1);
wait 2;
}

}

trap3()
{
trap3a = getent ("trap3a", "targetname");
trig = getent ("trig_trap3", "targetname");
trap3b = getent ("trap3b", "targetname");
trig = getent ("trig_trap3", "targetname");
trap3c = getent ("trap3c", "targetname");
trig = getent ("trig_trap3", "targetname");
trap3d = getent ("trap3d", "targetname");
trig = getent ("trig_trap3", "targetname");
trap3e = getent ("trap3e", "targetname");
trig = getent ("trig_trap3", "targetname");
trap3f = getent ("trap3f", "targetname");
trig = getent ("trig_trap3", "targetname");
hurt1 = getent ("hurt1", "targetname");
trig = getent ("trig_trap3", "targetname");
hurt2 = getent ("hurt2", "targetname");
trig = getent ("trig_trap3", "targetname");
hurt3 = getent ("hurt3", "targetname");
trig = getent ("trig_trap3", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");



while(1)
{
hurt1 enablelinkto();
hurt1 linkto(trap3a);
trap3a moveZ (-192, 1);
trap3b moveZ (-192, 1);
hurt2 enablelinkto();
hurt2 linkto(trap3c);
trap3c moveZ (-192, 1);
trap3d moveZ (-192, 1);
hurt3 enablelinkto();
hurt3 linkto(trap3e);
trap3e moveZ (-192, 1);
trap3f moveZ (-192, 1);
wait 3;
hurt1 enablelinkto();
hurt1 linkto(trap3a);
trap3a moveZ (192, 1);
trap3b moveZ (192, 1);
hurt2 enablelinkto();
hurt2 linkto(trap3c);
trap3c moveZ (192, 1);
trap3d moveZ (192, 1);
hurt3 enablelinkto();
hurt3 linkto(trap3e);
trap3e moveZ (192, 1);
trap3f moveZ (192, 1);
wait 3;
}

}

trap4()
{
platform = getent ("trap4", "targetname");
trig = getent ("trig_trap4", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");


while(1)
{
platform rotateroll (45 , 1);
wait 1;
platform rotateroll (-45 , 1);
wait 7;
platform rotateroll (-45 , 1);
wait 1;
platform rotateroll (45 , 1);
wait 7;
}

}

trap5()
{
platformfalla = getent ("trap5a", "targetname");
trig = getent ("trig_trap5", "targetname");
platformfallb = getent ("trap5b", "targetname");
trig = getent ("trig_trap5", "targetname");
platformfallc = getent ("trap5c", "targetname");
trig = getent ("trig_trap5", "targetname");
platformfalld = getent ("trap5d", "targetname");
trig = getent ("trig_trap5", "targetname");
platformfalle = getent ("trap5e", "targetname");
trig = getent ("trig_trap5", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

{
platformfalla moveZ (-1296, 2);
platformfallb moveZ (-1296, 2);
platformfallc moveZ (-1296, 2);
platformfalld moveZ (-1296, 2);
platformfalle moveZ (-1296, 2);
wait 2;
platformfalla delete();
platformfallb delete();
platformfallc delete();
platformfalld delete();
platformfalle delete();
}

}

trap6()
{
blocker1 = getent ("trap6a", "targetname");
trig = getent ("trig_trap6", "targetname");
blocker2 = getent ("trap6b", "targetname");
trig = getent ("trig_trap6", "targetname");
blocker3 = getent ("trap6c", "targetname");
trig = getent ("trig_trap6", "targetname");
hurt = getent ("hurt", "targetname");
trig = getent ("trig_trap6", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

{
blocker1 moveZ (-495, 0.1);
blocker2 moveZ (-495, 0.1);
iprintlnBold ("^1Ur ded :P");
wait 1;
MusicPlay("wayout4");
wait 1.8;
MusicPlay("wayout5");
fx2 = loadFx( "explosions/church_roof_explosion" );
org2 = getEnt( "play_fx_here2", "targetname" );
playFx( fx2, org2.origin );
org3 = getEnt( "play_fx_here3", "targetname" );
playFx( fx2, org3.origin );
org4 = getEnt( "play_fx_here4", "targetname" );
playFx( fx2, org4.origin );
org5 = getEnt( "play_fx_here5", "targetname" );
playFx( fx2, org5.origin );
org6 = getEnt( "play_fx_here6", "targetname" );
playFx( fx2, org6.origin );
org7 = getEnt( "play_fx_here7", "targetname" );
playFx( fx2, org7.origin );
hurt enablelinkto();
hurt linkto(blocker3);
blocker3 moveZ (63, 0.1);
wait 0.5;
blocker3 moveZ (-63, 0.1);
blocker1 moveZ (495, 4);
blocker2 moveZ (495, 4);
wait 4;
blocker1 delete();
blocker2 delete();
blocker3 delete();
hurt delete();
}


}

trap7()
{
pusher1 = getent ("trap7a", "targetname");
trig = getent ("trig_trap7", "targetname");
pusher2 = getent ("trap7b", "targetname");
trig = getent ("trig_trap7", "targetname");
pusher3 = getent ("trap7c", "targetname");
trig = getent ("trig_trap7", "targetname");
pusher4 = getent ("trap7d", "targetname");
trig = getent ("trig_trap7", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

{
pusher1 moveY (-208, 0.5);
pusher2 moveY (-208, 0.5);
pusher3 moveY (-208, 0.5);
pusher4 moveY (-208, 0.5);
wait 3;
pusher1 moveY (208, 0.5);
pusher2 moveY (208, 0.5);
pusher3 moveY (208, 0.5);
pusher4 moveY (208, 0.5);
}

}

trap8()
{
delete1 = getent ("trap8a", "targetname");
trig = getent ("trig_trap8", "targetname");
delete2 = getent ("trap8b", "targetname");
trig = getent ("trig_trap8", "targetname");
delete3 = getent ("trap8c", "targetname");
trig = getent ("trig_trap8", "targetname");
delete4 = getent ("trap8d", "targetname");
trig = getent ("trig_trap8", "targetname");
delete5 = getent ("trap8e", "targetname");
trig = getent ("trig_trap8", "targetname");
delete6 = getent ("trap8f", "targetname");
trig = getent ("trig_trap8", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

{
delete1 delete();
delete2 delete();
delete3 delete();
delete4 delete();
delete5 delete();
delete6 delete();
}

}

trap9()
{
rotate1 = getent ("trap9a", "targetname");
trig = getent ("trig_trap9", "targetname");
rotate2 = getent ("trap9b", "targetname");
trig = getent ("trig_trap9", "targetname");
rotate3 = getent ("trap9c", "targetname");
trig = getent ("trig_trap9", "targetname");
rotate4 = getent ("trap9d", "targetname");
trig = getent ("trig_trap9", "targetname");
rotate5 = getent ("trap9e", "targetname");
trig = getent ("trig_trap9", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

while(1)
{
rotate1 moveX (48, 1);
rotate3 moveX (48, 1);
rotate5 moveX (48, 1);
wait 1;
rotate1 moveX (-48, 1);
rotate3 moveX (-48, 1);
rotate5 moveX (-48, 1);
wait 1;
rotate2 moveX (48, 1);
rotate4 moveX (48, 1);
wait 1;
rotate2 moveX (-48, 1);
rotate4 moveX (-48, 1);
wait 1;
}

}

trap10()
{
rotater1 = getent ("trap10a", "targetname");
trig = getent ("trig_trap10", "targetname");
rotater2 = getent ("trap10b", "targetname");
trig = getent ("trig_trap10", "targetname");
rotater3 = getent ("trap10c", "targetname");
trig = getent ("trig_trap10", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");

for(;;)
{
rotater1 rotatepitch (360, 3);
rotater2 rotatepitch (360, 3);
rotater3 rotatepitch (360, 3);
wait 0.1;
}

}

trap11()
{

block1 = getent("block1", "targetname");
trig = getent ("trig_trap11", "targetname");
block2 = getent("block2", "targetname");
trig = getent ("trig_trap11", "targetname");
block3 = getent("block3", "targetname");
trig = getent ("trig_trap11", "targetname");
block4 = getent("block4", "targetname");
trig = getent ("trig_trap11", "targetname");
block5 = getent("block5", "targetname");
trig = getent ("trig_trap11", "targetname");
block6 = getent("block6", "targetname");
trig = getent ("trig_trap11", "targetname");
block7 = getent("block7", "targetname");
trig = getent ("trig_trap11", "targetname");
block8 = getent("block8", "targetname");
trig = getent ("trig_trap11", "targetname");
block9 = getent("block9", "targetname");
trig = getent ("trig_trap11", "targetname");
block10 = getent("block10", "targetname");
trig = getent ("trig_trap11", "targetname");
block11 = getent("block11", "targetname");
trig = getent ("trig_trap11", "targetname");
block12 = getent("block12", "targetname");
trig = getent ("trig_trap11", "targetname");
trig SetHintString(" ^1 Press &&1 to activate!");
trig waittill ("trigger", player);
trig SetHintString(" ^3 Activated!");


x=randomint(1);

	if(x==0) {
		block1 delete();
		block3 delete();
		block5 delete();
		block7 delete();
		block9 delete();
		block11 delete();
	}
	if(x==1) {
		block2 delete();
		block4 delete();
		block6 delete();
		block8 delete();
		block10 delete();
		block12 delete();
	}
}

////////////ROOMS///////////
rooms()
{
thread old();
thread knife();
thread sniper();
thread crossbow();
thread crossbowtp1();
thread crossbowtp2();
thread jump();
thread jumperteleport();
thread activatorteleport();


}

old()
{
			level.old_trigger = getent ( "oldroom", "targetname" );
			level.knife_trigger = getent("kniferoom", "targetname");
			level.sniper_trigger = getEnt("sniperroom", "targetname");
			level.jump_trigger = getent("jumproom", "targetname");
			level.crossbow_trigger = getent("crossbowroom", "targetname");
			level.oldacti = getent ("origin_actiteleportarea6", "targetname");
			door = getent ( "actidoor", "targetname" );
			level.old_trigger waittill ( "trigger", player );

			{

			level.old_trigger delete ();
			level.knife_trigger delete();
			level.sniper_trigger delete();
			level.jump_trigger delete();
			level.crossbow_trigger delete();

			level.activ SetOrigin (level.oldacti.origin);
			wait 1;
			iprintlnBold("^8" + player.name + "^2 opened the old room");
			wait 2;
			door delete();
			wait 1;
			}
}

knife()
{
		level.teleactorigin2 = getEnt("knife_activator", "targetname");
		telejumporigin2 = getEnt("knife_jumper", "targetname");
		level.knife_trigger = getent("kniferoom", "targetname");
		level.sniper_trigger = getEnt("sniperroom", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.jump_trigger = getent("jumproom", "targetname");
		level.crossbow_trigger = getent("crossbowroom", "targetname");

		while(1)
		{
		level.knife_trigger waittill( "trigger", player );


			if( !isDefined( level.knife_trigger ))
			return;
			if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_trigger delete();
		level.jump_trigger delete();
		level.crossbow_trigger delete();
		level.firstenter=false;
		}

		{
		wait (0.05);

		player SetOrigin( telejumporigin2.origin );
		player setplayerangles( telejumporigin2.angles );
		player TakeAllWeapons();
		player GiveWeapon("knife_weaver_mp");
		player SwitchToWeapon("knife_weaver_mp");
		wait(0.05);
		level.activ SetOrigin (level.teleactorigin2.origin);
		level.activ setplayerangles (level.teleactorigin2.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_weaver_mp" );
		level.activ SwitchToWeapon("knife_weaver_mp");
		player freezecontrols(true);
		level.activ freezecontrols(true);
		iPrintlnBold( " ^3" + player.name + " ^2 has entered the Knife room^2!" );
		wait 2;
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;

		}

}

}

sniper()
{
		level.teleactorigin3 = getEnt("sniper_activator", "targetname");
		telejumporigin3 = getEnt("sniper_jumper", "targetname");
		level.sniper_trigger = getEnt("sniperroom", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.knife_trigger = getent("kniferoom", "targetname");
		level.jump_trigger = getent("jumproom", "targetname");
		level.crossbow_trigger = getent("crossbowroom", "targetname");

		while(1)
		{
		level.sniper_trigger waittill( "trigger", player );


		level.old_trigger delete();
		level.knife_trigger delete();
		level.jump_trigger delete();
		level.crossbow_trigger delete();


		if( !isDefined( level.sniper_trigger ))
					return;
			if(level.firstenter==true)
		{
				//level.knife_trigger delete();
				level.old_trigger delete();
				//level.jump_trigger delete();
				level.firstenter=false;
				}
				wait(0.05);
		player SetOrigin( telejumporigin3.origin );
		player setplayerangles( telejumporigin3.angles );
		player TakeAllWeapons();
		player GiveWeapon("bo_l96_vz_mp");
		player GiveMaxAmmo("bo_l96_vz_mp");
		wait (0.05);
		player SwitchToWeapon("bo_l96_vz_mp");
		wait(0.05);
		level.activ SetOrigin (level.teleactorigin3.origin);
		level.activ setplayerangles (level.teleactorigin3.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "bo_l96_vz_mp" );
		level.activ GiveMaxAmmo("bo_l96_vz_mp");
		wait (0.05);
		level.activ SwitchToWeapon("bo_l96_vz_mp");
		player freezecontrols(true);
		level.activ freezecontrols(true);
		iPrintlnBold( " ^3" + player.name + " ^2 has entered the Sniper room^2!" );
		wait 2;
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;

}

}

crossbow()
{
		level.teleactorigin4 = getEnt("crossbow_activator", "targetname");
		telejumporigin4 = getEnt("crossbow_jumper", "targetname");
		level.knife_trigger = getent("kniferoom", "targetname");
		level.sniper_trigger = getEnt("sniperroom", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.jump_trigger = getent("jumproom", "targetname");
		level.crossbow_trigger = getent("crossbowroom", "targetname");

		while(1)
		{
		level.crossbow_trigger waittill( "trigger", player );


			if( !isDefined( level.crossbow_trigger ))
			return;
			if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_trigger delete();
		level.jump_trigger delete();
		level.knife_trigger delete();
		level.firstenter=false;
		}

		{
		wait (0.05);

		player SetOrigin( telejumporigin4.origin );
		player setplayerangles( telejumporigin4.angles );
		player TakeAllWeapons();
		player GiveWeapon("bo_crossbow_mp");
		player GiveMaxAmmo("bo_crossbow_mp");
		player SwitchToWeapon("bo_crossbow_mp");
		wait(0.05);
		level.activ SetOrigin (level.teleactorigin4.origin);
		level.activ setplayerangles (level.teleactorigin4.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "bo_crossbow_mp" );
		level.activ GiveMaxAmmo("bo_crossbow_mp");
		level.activ SwitchToWeapon("bo_crossbow_mp");
		player freezecontrols(true);
		level.activ freezecontrols(true);
		iPrintlnBold( " ^3" + player.name + " ^2 has entered the Crossbow room^2!" );
		wait 2;
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;

		}

}

}


crossbowtp1()
{
	trigtp1 = getent("crossbowtp1", "targetname");
	teletp1 = getent("crossbow_activator", "targetname");

	for(;;)
	{
		trigtp1 waittill("trigger", player);
		player setOrigin (teletp1.origin);
	}
}

crossbowtp2()
{
	trigtp2 = getent("crossbowtp2", "targetname");
	teletp2 = getent ("crossbow_jumper", "targetname");

	for(;;)
	{
		trigtp2 waittill("trigger", player);
		player setOrigin (teletp2.origin);
	}
}

jump()
{
		level.teleactorigin = getEnt("jump_activator", "targetname");
		telejumporigin = getEnt("jump_jumper", "targetname");
		level.jump_trigger = getent("jumproom", "targetname");
		level.knife_trigger = getent("kniferoom", "targetname");
		level.sniper_trigger = getEnt("sniperroom", "targetname");
		level.old_trigger = getEnt("oldroom", "targetname");
		level.crossbow_trigger = getEnt("crossbowroom", "targetname");



		while(1)
		{
		level.jump_trigger waittill( "trigger", player );


		if( !isDefined( level.jump_trigger ))
					return;
			if(level.firstenter==true)
				{
				level.sniper_trigger delete();
				level.knife_trigger delete();
				level.old_trigger delete();
				level.crossbow_trigger delete();
				level.firstenter=false;
				}
				wait(0.05);

		player SetOrigin( telejumporigin.origin );
		player setplayerangles( telejumporigin.angles );
		player TakeAllWeapons();
		player GiveWeapon("knife_weaver_mp");
		wait (0.05);
		player SwitchToWeapon("knife_weaver_mp");
		wait (0.05);
		level.activ SetOrigin (level.teleactorigin.origin);
		level.activ setplayerangles (level.teleactorigin.angles);
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_weaver_mp" );
		wait (0.05);
		level.activ SwitchToWeapon("knife_weaver_mp");
		player freezecontrols(true);
		level.activ freezecontrols(true);
		iPrintlnBold( " ^3" + player.name + " ^2 has entered the Jump room^2!" );
		wait 2;
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;
		}
}

jumperteleport()
{
	trig1 = getent("trigger_teleport1", "targetname");
	tele1 = getent("origin_teleport1", "targetname");

	for(;;)
	{
		trig1 waittill("trigger", player);
		player setOrigin (tele1.origin);
	}
}

activatorteleport()
{
	trig2 = getent("trigger_teleport2", "targetname");
	tele2 = getent ("origin_teleport2", "targetname");

	for(;;)
	{
		trig2 waittill("trigger", player);
		player setOrigin (tele2.origin);
	}
}

//////////SECRETS/////////


secrets()

{
thread secretenter();
thread secrettp1();
thread secrettp2();
thread secrettp3();
thread secrettp4();
thread secrettp5();
thread secrettp6();
thread secrettp7();
thread secrettp8();
thread secrettp9();
thread secrettp10();
thread secrettp11();
thread secretexit();
thread secretvip();
thread secretweapon();
thread fishcredit();
thread secrettp();
thread statue();
}

secretenter()
{
trigsecret1 = getent ("trigger_secret1enter", "targetname");
originsecret1 = getent ("origin_secret1enter", "targetname");

	for(;;)
	{
		trigsecret1 waittill("trigger", player);
		player setOrigin (originsecret1.origin);
		iprintlnBold ("^2Nub ^5" + player.name + "^3 entered the ^1EASY ^3secret!");
		player iprintlnBold ("^1You are a traitor to your motherland! Thats why I give u 240 seconds only :)");

		player thread secretTimer();
	}
}

SecretTimer()
{
        self endon( "disconnect" );

        self.secret_timer = NewClientHudElem( self );
        self.secret_timer.y = 10;
        self.secret_timer.alignX = "center";
        self.secret_timer.alignY = "middle";
        self.secret_timer.horzAlign = "center";
        self.secret_timer.sort = -3;
        self.secret_timer.fontScale = 2;
        self.secret_timer.owner = self;
        self.secret_timer thread removehudifsuicide();

        self.secret_time_left = 240;
        self.secret_finished = false;

        while( self.secret_time_left > 0 && !self.secret_finished )
        {
                self.secret_timer setText( "^5Until you ded: ^6" + self.secret_time_left );
                self.secret_time_left--;
                wait 1;
        }

        if( !self.secret_finished )
        {
                self.secret_timer Destroy();
                self Suicide();
                self iPrintlnBold( "^2 Thats what happens to traitors, ^1nub." );
        }

}

removehudifsuicide()
{
        self endon ("death");
        self endon ("disconnect");
        self.owner waittill("death", player);
                player.secret_finished = true;
                player.secret_timer destroy();
                self destroy();

}

secrettp1()
{
trig1 = getent ("trig1", "targetname");
orig1 = getent ("orig1", "targetname");

for(;;)
	{
		trig1 waittill("trigger", player);
		player setOrigin (orig1.origin);
	}

}

secrettp2()
{
trig2 = getent ("trig2", "targetname");
orig2 = getent ("orig2", "targetname");

for(;;)
	{
		trig2 waittill("trigger", player);
		player setOrigin (orig2.origin);
	}

}

secrettp3()
{
trig3 = getent ("trig3", "targetname");
orig3 = getent ("orig3", "targetname");

for(;;)
	{
		trig3 waittill("trigger", player);
		player setOrigin (orig3.origin);
	}

}

secrettp4()
{
trig4 = getent ("trig4", "targetname");
orig4 = getent ("orig4", "targetname");

for(;;)
	{
		trig4 waittill("trigger", player);
		player setOrigin (orig4.origin);
	}

}

secrettp5()
{
trig5 = getent ("trig5", "targetname");
orig5 = getent ("orig5", "targetname");

for(;;)
	{
		trig5 waittill("trigger", player);
		player setOrigin (orig5.origin);
	}

}

secrettp6()
{
trig6 = getent ("trig6", "targetname");
orig6 = getent ("orig6", "targetname");

for(;;)
	{
		trig6 waittill("trigger", player);
		player setOrigin (orig6.origin);
	}

}

secrettp7()
{
trig7 = getent ("trig7", "targetname");
orig7 = getent ("orig7", "targetname");

for(;;)
	{
		trig7 waittill("trigger", player);
		player setOrigin (orig7.origin);
	}

}

secrettp8()
{
trig8 = getent ("trig8", "targetname");
orig8 = getent ("orig8", "targetname");

for(;;)
	{
		trig8 waittill("trigger", player);
		player setOrigin (orig8.origin);
	}

}

secrettp9()
{
trig9 = getent ("trig9", "targetname");
orig9 = getent ("orig9", "targetname");

for(;;)
	{
		trig9 waittill("trigger", player);
		player setOrigin (orig9.origin);
	}

}

secrettp10()
{
trig10 = getent ("trig10", "targetname");
orig10 = getent ("orig10", "targetname");

for(;;)
	{
		trig10 waittill("trigger", player);
		player setOrigin (orig10.origin);
	}

}

secrettp11()
{
trig11 = getent ("trig11", "targetname");
orig11 = getent ("orig11", "targetname");

for(;;)
	{
		trig11 waittill("trigger", player);
		player setOrigin (orig11.origin);
	}

}

secretexit()
{
trig = getent ("trigger_secret1exit", "targetname");
origin = getent ("origin_secret1exit", "targetname");

	for(;;)
	{
		trig waittill("trigger", player);

		player.secret_finished = true;
        player.secret_timer Destroy();

		player setOrigin (origin.origin);
		iprintlnBold ("^2Pro ^5" +  player.name + "^3finished the ^1EASY ^3secret!");
		player iprintlnBold ("^1 Nicely done, u can try the hard now :P");
		player GiveWeapon ("knife_weaver_mp");
		player GiveWeapon ("bo_l96_vz_mp");
		player SwitchToWeapon ("bo_l96_vz_mp");
	}
}

secretvip()
{
secretdoor = getent("removedoor", "targetname");
trig = getent("removedoortrig", "targetname");
trig waittill ("trigger", player);

{
secretdoor notsolid();
wait 3;
secretdoor solid();
}

}

secretweapon()
{
give = getent("weaponuse", "targetname");
give SetHintString ("^1 Use this VIP weapon :D");

while(1)
{
give waittill ("trigger", player);
player GiveWeapon ("bo_crossbow_explosive_mp");
player GiveMaxAmmo ("bo_crossbow_explosive_mp");
player SwitchToWeapon ("bo_crossbow_explosive_mp");
player iprintlnBold("^2Take this my friend ^3" + player.name + "^1 use it wisely :P ");
}

}

fishcredit()
{
creditfish = getent("fishy", "targetname");

while(1)
{
creditfish waittill ("trigger", player);
player iprintlnBold ("^1 Eisai ^5malaka -.-");
}

}

secrettp()
{
trigsecout = getent("secretout", "targetname");
secretorg = getent("secretoutorg", "targetname");

for(;;)
	{
		trigsecout waittill("trigger", player);
		player setOrigin (secretorg.origin);
	}

}

statue()
{
trig = getent("statue", "targetname");
trig waittill ("trigger", player);
trig sethintstring ("^1IN THE HONOR OF THE MAP MAKER");
}