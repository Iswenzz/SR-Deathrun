main()
{

	maps\mp\_load::main();

	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	PreCacheItem("deserteagle_mp");
	PreCacheItem("remington700_mp");
	PreCacheItem("m40a3_mp");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1200");


	thread startdoor();
	thread vtxfloor();
	thread starttext();
	thread door1();
	thread endtext();
	thread door2_1();
	thread door2_2();
	thread enddoor1();
	thread enddoor2();
	thread eledoors2();
	thread endlogo();
	thread scope();
	thread sniper();
	thread oldroom();
	thread akuroom();
	thread aku();
	thread bounce();
	thread trighint();
	thread elebutton();
	thread CheckIPAddress();
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
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread trap17();
	thread trap18();
	thread trap19();
	thread trap20();
	thread trap21();
	thread trap22();
	thread trap23();
	thread elevator1();
	thread elevator2();
	thread actitele2();
	thread actitele1();
	thread secret1();
	thread secret1out();
	thread spinme();
	thread mariosign();
	thread jaxsign();
	thread teleport1();
	thread easysecretrespawn();
	thread hardsecretenter();
	thread hardsecretrespawn();
	thread hardsecretend();
	thread teleport2();
}

spinme()
{
	spinme = getent("rvstext", "targetname");
	for(;;)
{
	wait 0.01;
spinme rotateroll(360,2);
}
}

CheckIPAddress()
{
	trig = getEnt("server","targetname");
	trig sethintstring("Join the RvS server");
	trig waittill("trigger", user);
	user thread connectto();

}

connectto()
{
	// self endon("disconnect");
	// if ( getDvar( "net_ip" ) != "45.32.153.105:28960" )
	// {
	// 	self thread braxi\_common::clientCmd( "disconnect; wait 10; connect 45.32.153.105:28960" );
	// }
}

mariosign()
{
	mariosign = getent("mariosign", "targetname");
	mariosigntrig = getent("trig_mariosign", "targetname");
	mariosigntrig sethintstring("Created and scripted by Mario<3");
}


jaxsign()
{
	jaxsign = getent("jaxsign", "targetname");
	jaxsigntrig = getent("trig_jaxsign", "targetname");
	jaxsigntrig sethintstring("Secret designed by Jax");
}

oldroom()
{
level.oldroom_trigger = getEnt("trig_oldroom","targetname");
level.teleactorigin2 = getEnt("oldroom_activator", "targetname");
level.akuroom_trigger = getent("trig_akuroom", "targetname");
level.sniper_trigger = getent("trig_sniper", "targetname");
telejumporigin2 = getEnt("oldroom_jumper", "targetname");
level.oldroom_trigger sethintstring("Enter the old room");

while(1)
{
level.oldroom_trigger waittill( "trigger", player );

if( !isDefined( level.oldroom_trigger ) )
return;
if(level.firstenter==true)
{
level.sniper_trigger delete();
level.akuroom_trigger delete();
level.firstenter=false;
}
wait(0.05);

player SetOrigin( telejumporigin2.origin );
player setplayerangles( telejumporigin2.angles );
player TakeAllWeapons();
player GiveWeapon("deserteagle_mp");
player GiveMaxAmmo("deserteagle_mp");
wait .05;
player SwitchToWeapon("deserteagle_mp");
wait(0.05);
level.activ SetOrigin (level.teleactorigin2.origin);
level.activ setplayerangles (level.teleactorigin2.angles);
iPrintlnBold( " ^7"+ player.name + "^7 has entered the old room^7!" );
wait(0.05);
player switchToWeapon( "deserteagle_mp" );

player waittill ("death");
level.playerInRoom = false;
}
}

akuroom()
{
level.akuroom_trigger = getEnt("trig_akuroom","targetname");
level.teleactorigin1 = getEnt("akuroom_activator", "targetname");
level.oldroom_trigger = getent("trig_oldroom", "targetname");
level.sniper_trigger = getent("trig_sniper", "targetname");
telejumporigin1 = getEnt("akuroom_jumper", "targetname");
level.akuroom_trigger sethintstring("Enter the gun room");

while(1)
{
level.akuroom_trigger waittill( "trigger", player );

if( !isDefined( level.akuroom_trigger ) )
return;
if(level.firstenter==true)
{
level.oldroom_trigger delete();
level.sniper_trigger delete();
level.firstenter=false;
}
wait(0.05);

player SetOrigin( telejumporigin1.origin );
player setplayerangles( telejumporigin1.angles );
player TakeAllWeapons();
player GiveWeapon("deserteagle_mp");
player GiveMaxAmmo("deserteagle_mp");
wait .05;
player SwitchToWeapon("deserteagle_mp");
wait(0.05);
level.activ SetOrigin (level.teleactorigin1.origin);
level.activ setplayerangles (level.teleactorigin1.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "deserteagle_mp" );
level.activ GiveMaxAmmo("deserteagle_mp");
wait .05;
level.activ SwitchToWeapon("deserteagle_mp");
iPrintlnBold( " ^7"+ player.name + " ^7 has entered the gun room^7!" );
wait(0.05);
player switchToWeapon( "deserteagle_mp" );
level.activ SwitchToWeapon( "deserteagle_mp" );

player waittill ("death");
level.playerInRoom = false;
}
}

sniper()
{
level.sniper_trigger = getEnt("trig_sniper","targetname");
level.oldroom_trigger = getent("trig_oldroom", "targetname");
level.akuroom_trigger = getEnt("trig_akuroom","targetname");
level.teleactorigin = getEnt("sniper_activator", "targetname");
telejumporigin = getEnt("sniper_jumper", "targetname");
level.sniper_trigger sethintstring("Enter the sniper room");

while(1)
{
level.sniper_trigger waittill( "trigger", player );

if( !isDefined( level.sniper_trigger ) )
return;
if(level.firstenter==true)
{
level.oldroom_trigger delete();
level.akuroom_trigger delete();
level.firstenter=false;
}
wait(0.05);

player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("m40a3_mp");
player GiveWeapon( "remington700_mp" );
player GiveMaxAmmo("m40a3_mp");
player GiveMaxAmmo( "remington700_mp" );
wait .05;
player SwitchToWeapon("m40a3_mp");
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ GiveWeapon( "remington700_mp" );
level.activ GiveMaxAmmo("m40a3_mp");
level.activ GiveMaxAmmo( "remington700_mp" );
wait .05;
level.activ SwitchToWeapon("m40a3_mp");
iPrintlnBold( " ^7"+ player.name + " ^7 has entered the Sniper room^7!" );
wait(0.05);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );

player waittill ("death");
level.playerInRoom = false;
}
}

startdoor()
{
	door = getent("startdoor", "targetname");
	wait 15;
	door moveZ(250, 5);
	iprintlnBold("Start door opened");
}

elebutton()
{
	elebutton1 = getent("elebutton", "targetname");
	trig214 = getent("trig_trap3", "targetname");
	trig214 waittill ("trigger", player);
{
	wait 0.01;
	elebutton1 moveZ(-576,4);
	wait 6;
	elebutton1 moveZ(576,4);
	wait 6;
}
}

vtxfloor()
{
	floor = getent("vtxfloor", "targetname");
	trigfloor = getent("trig_vtxfloor", "targetname");
	trigfloor sethintstring("^7Map made by Mario^1<3");

}

starttext()
{
	wait 16;
iPrintln("^1>>^7Map made by Mario^1<3");
iPrintln("^1>>^7Secret rooms made by ^7RvS^1'^7Jax and Mario<3");
iPrintln("^1>>^7for ^3ReVerSe Gaming");
iPrintln("^1>>^7Visit our website at ^2www.rvs-gaming.net");
}

trighint()
{
platform100 = getent("lameasf", "targetname");
trighint = getent("trig_hint", "targetname");
trighint sethintstring("^1Tip:^7 Use 250 FPS");
}

endlogo()
{
	endlogo = getent("endlogo", "targetname");
	for(;;)
{
	endlogo moveZ(10, 2);
	wait 2;
	endlogo moveZ(-10,2);
	wait 2;
}
}

scope()
{
	scope = getent("scope", "targetname");
	for(;;)
{
	scope moveZ(3, 2);
	wait 2;
	scope moveZ(-3,2);
	wait 2;
}
}

aku()
{
	aku = getent("aku", "targetname");
	for(;;)
{
	aku moveZ(3, 2);
	wait 2;
	aku moveZ(-3,2);
	wait 2;
}
}

bounce()
{
	bounce = getent("bounce", "targetname");
	for(;;)
{
	bounce moveZ(3, 2);
	wait 2;
	bounce moveZ(-3,2);
	wait 2;
}
}

door1()
{
	door1 = getent("door1", "targetname");
	trig9 = getent("trig_door1", "targetname");
	trig9 setHintString("Open the metal door");
	trig9 waittill("trigger", player);
	iprintlnbold("Metal door was opened by "+ player.name +"");
	door1 moveZ(80, 5);
	trig9 delete();
}

door2_1()
{
	door2_1 = getent("door2_1", "targetname");
	trig15 = getent("trig_door2", "targetname");
	trig15 setHintString("Open the elevator gate");
	trig15 waittill("trigger", player);

	door2_1 moveY(90, 2);
	trig15 delete();
}

door2_2()
{
	door2_2 = getent("door2_2", "targetname");
	trig16 = getent("trig_door2", "targetname");
	trig16 waittill("trigger", player);

	door2_2 moveY(-90, 2);
}

enddoor1()
{
	enddoor1 = getent("enddoor_1", "targetname");
	trig17 = getent("trig_enddoor", "targetname");
	trig17 waittill("trigger", player);
	iprintlnbold(""+ player.name +" was the first person to finish the map");
	enddoor1 moveY(49, 4);
}

enddoor2()
{
	enddoor2 = getent("enddoor_2", "targetname");
	trig18 = getent("trig_enddoor", "targetname");
	trig18 waittill("trigger", player);

	enddoor2 moveY(-49, 4);
}

trap1()
{
	platform1 = getent("trap1", "targetname");
    trig1 = getent("trig_trap1", "targetname");
	trig1 sethintstring("Activate this trap");
    trig1 waittill("trigger", player );
	trig1 sethintstring("Trap activated");
    platform1 delete();
}

trap2()
{
	platform2 = getent("trap2", "targetname");
	trig2 = getent("trig_trap2", "targetname");
	trig2 sethintstring("Activate this trap");
	trig2 waittill("trigger", player);
	trig2 sethintstring("Trap activated");
	for (;;)

{
	wait 0.01;
	platform2 rotateYaw(720, 3);
	wait 6;

}
}

trap3()
{
	platform3 = getent("trap3", "targetname");
	trig3 = getent("trig_trap3", "targetname");
	trig3 sethintstring("Activate this trap");
	trig3 waittill("trigger", player);
	trig3 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform3 moveZ(-210, 2);
	wait 5;
	platform3 moveZ(210, 2);
    wait 5;

}
}

trap4()
{
	platform4 = getent("trap4", "targetname");
	trig4 = getent("trig_trap4", "targetname");
	trig4 sethintstring("Activate this trap");
	trig4 waittill("trigger", player);
	trig4 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform4 moveX(-188,1.5);
	wait 2.5;
	platform4 moveX(188,1.5);
	wait 2.5;

}
}

secret1()
{
	secrettrig1 = getent("trig_secret1", "targetname");
	secrettele1 = getent("origin_telesecret1", "targetname");
	secrettrig1 sethintstring("What is this?");
	for(;;)
	{
secrettrig1 waittill ("trigger", player);
player setOrigin(secrettele1.origin);
	}
}

secret1out()
{
	secretouttrig1 = getent("trig_secret1out", "targetname");
	secret1outtele = getent("origin_secret1out", "targetname");
	secretouttrig1 sethintstring("What is this?");
	for(;;)
	{
secretouttrig1 waittill ("trigger", player);
iprintlnbold(""+ player.name +" used a shortcut");
player setOrigin(secret1outtele.origin);
	}
}

trap5()
{
	platform5 = getent("trap5", "targetname");
	trig5 = getent("trig_trap4", "targetname");
	trig5 sethintstring("Activate this trap");
	trig5 waittill("trigger", player);
	trig5 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform5 moveX(188,1.5);
	wait 2.5;
	platform5 moveX(-188,1.5);
	wait 2.5;

}
}

elevator1()
{
	elevator = getent("elevator1", "targetname");
	trig6 = getent("trig_elevator1", "targetname");
	trig6 sethintstring("Activate this elevator");
	trig6 waittill("trigger", player);
	trig6 delete();
	for(;;)
{
	wait 0.01;
	elevator moveZ(-576,4);
	wait 6;
	elevator moveZ(576,4);
	wait 6;

}
}

elevator2()
{
	elevator2 = getent("elevator2", "targetname");
	elegate1 = getent("door2_1", "targetname");
	elegate2 = getent("door2_2", "targetname");
	trig16 = getent("trig_elevator2", "targetname");
	trig16 sethintstring("Use the elevator");
	trig16 waittill("trigger", player);
	trig16 delete();
	for(;;)
{
	wait 2;
	elevator2 moveZ(456,4);
	wait 8;
	elevator2 moveZ(-456,4);
	wait 6;
}
}

endtext()
{
	endtext1 = getent("endtextsample", "targetname");
	trig212 = getent("endtext", "targetname");
	trig212 waittill("trigger", player);
	iprintlnbold(""+ player.name +" entered the final part");

	trig212 delete();
}

eledoors2()
{
	eledoor1 = getent("door2_1", "targetname");
	eledoor2 = getent("door2_2", "targetname");
	trig17 = getent("trig_elevator2", "targetname");
	trig17 waittill("trigger", player);
	trig17 delete();
	for(;;)
{
	eledoor1 moveY(-90,2);
	eledoor2 moveY(90,2);
	wait 2;
	eledoor1 moveZ(456,4);
	eledoor2 moveZ(456,4);
	wait 4;
	eledoor1 moveY(90,2);
	eledoor2 moveY(-90,2);
	wait 2;
	eledoor1 moveY(-90,2);
	eledoor2 moveY(90,2);
	wait 2;
	eledoor1 moveZ(-456,4);
	eledoor2 moveZ(-456,4);
	wait 4;
	eledoor1 moveY(90,2);
	eledoor2 moveY(-90,2);
	wait 2;
}
}

trap6()
{
	platform6 = getent("trap6", "targetname");
	trig7 = getent("trig_trap6", "targetname");
	trig7 sethintstring("Activate this trap");
	trig7 waittill("trigger", player);
	trig7 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform6 moveX(-64,0.5);
	wait 0.6;
	platform6 moveX(64,0.5);
	wait 0.6;

}
}

trap7()
{
	platform7 = getent("trap7", "targetname");
	trig8 = getent("trig_trap7", "targetname");
	trig8 sethintstring("Activate this trap");
	trig8 waittill("trigger", player);
	trig8 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform7 moveY(448,2.5);
	wait 3;
	platform7 moveY(-448,2.5);
	wait 3;

}
}

trap8()
{
	platform8 = getent("trap8", "targetname");
	trig9 = getent("trig_trap8", "targetname");
	trig9 sethintstring("Activate this trap");
	trig9 waittill("trigger", player);
	trig9 sethintstring("Trap activated");
	for(;;)
{
	wait 0.01;
	platform8 moveY(112,1);
	wait 1.2;
	platform8 moveY(-112,1);
	wait 1.2;

}
}

trap9()
{
	platform9 = getent("trap9_1", "targetname");
	platform10 = getent("trap9_2", "targetname");
	trig10 = getent("trig_trap9", "targetname");
	trig10 sethintstring("Activate this trap");
	trig10 waittill("trigger", player);
	trig10 sethintstring("Trap activated");
{
	wait 0.01;
	platform9 moveY(-128,1.5);

	wait 0.01;
	platform10 moveY(128,1.5);
}
}

trap10()
{
	platform11 = getent("trap10_1", "targetname");
	platform12 = getent("trap10_2", "targetname");
	trig11 = getent("trig_trap10", "targetname");
	trig11 sethintstring("Activate this trap");
	trig11 waittill("trigger", player);
	trig11 sethintstring("Trap activated");
{
	wait 0.01;
	platform11 moveY(128,1.5);

	wait 0.01;
	platform12 moveY(-128,1.5);
}
}

trap11()
{
	platform13 = getent("trap11_1", "targetname");
	trig12 = getent("trig_trap11", "targetname");
	trig12 sethintstring("Activate this trap");
	trig12 waittill("trigger", player);
	trig12 sethintstring("Trap activated");
	for(;;)
{
	platform13 moveY(-128,0.8);
	wait 0.8;
	platform13 moveY(128,0.8);
	wait 0.8;
}
}

trap12()
{
	platform14 = getent("trap11_2", "targetname");
	trig13 = getent("trig_trap11", "targetname");
	trig13 sethintstring("Activate this trap");
	trig13 waittill("trigger", player);
	trig13 sethintstring("Trap activated");
	for(;;)
{
	platform14 moveY(128,0.8);
	wait 0.8;
	platform14 moveY(-128,0.8);
	wait 0.8;
}
}

trap13()
{
	platform15 = getent("trap12_1", "targetname");
	platform16 = getent("trap12_2", "targetname");
    trig14 = getent("trig_trap12", "targetname");
	trig14 sethintstring("Activate this trap");
    trig14 waittill("trigger", player );
	trig14 sethintstring("Trap activated");


    platform15 delete();
	platform16 delete();
}

trap14()
{
	platform17 = getent("trap13_1", "targetname");
	platform18 = getent("trap13_2", "targetname");
    trig19 = getent("trig_trap13", "targetname");
	trig19 sethintstring("Activate this trap");
    trig19 waittill("trigger", player );
	trig19 sethintstring("Trap activated");


    platform17 delete();
	platform18 delete();
}

trap15()
{

	platform19 = getent("trap15_1", "targetname");
	trig20 = getent("trig_trap15", "targetname");
	trig20 sethintstring ("Activate this trap");
	trig20 waittill ("trigger", player);
	trig20 setHintString("Trap activated");
	for(;;)
{
	platform19 rotatepitch(360, 2);
	wait 6;

}
}

trap16()
{
	platform20 = getent("trap16", "targetname");
	trig21 = getent("trig_trap15", "targetname");
	trig21 waittill ("trigger", player);
	for(;;)
{
	platform20 rotatepitch(360, 2);
	wait 6;
}
}

trap17()
{
	platform21 = getent("trap17", "targetname");
	trig21 = getent("trig_trap15", "targetname");
	trig21 waittill ("trigger", player);
	for(;;)
{
	wait 2;
	platform21 rotatepitch(360, 2);
	wait 4;
}
}

trap18()
{
	platform22 = getent("trap18", "targetname");
	trig22 = getent("trig_trap15", "targetname");
	trig22 waittill ("trigger", player);
	for(;;)
{
	wait 2;
	platform22 rotatepitch(360, 2);
	wait 4;
}
}

trap19()
{
	platform23 = getent("trap19", "targetname");
	trig23 = getent("trig_trap15", "targetname");
	trig23 waittill ("trigger", player);
	for(;;)
{
	wait 4;
	platform23 rotatepitch(360, 2);
	wait 2;
}
}

trap20()
{
	platform24 = getent("trap20", "targetname");
	trig24 = getent("trig_trap15", "targetname");
	trig24 waittill ("trigger", player);
	for(;;)
{
	wait 4;
	platform24 rotatepitch(360, 2);
	wait 2;
}
}

trap21()
{
	platform25 = getent("trap21", "targetname");
    trig25 = getent("trig_trap21", "targetname");
	trig25 sethintstring("Activate this trap");
    trig25 waittill("trigger", player );
	trig25 sethintstring("Trap activated");
    platform25 delete();
}

trap22()
{
	platform26 = getent("trap22", "targetname");
    trig26 = getent("trig_trap21", "targetname");
    trig26 waittill("trigger", player );
    platform26 delete();
}

trap23()
{
platform27 = getent("trap23", "targetname");
trig27 = getent("trig_trap23", "targetname");
trig27 sethintstring("Activate this trap");
trig27 waittill ("trigger", player);
trig27 setHintString("Trap activated");
for(;;)
{
	wait 0.01;
	platform27 rotateYaw(720,4);
	wait 8;
}
}

teleport1()
{
	teleport1trig = getent("trig_teleport1", "targetname");
	teleport1 = getent("origin_teleport1", "targetname");
	for(;;)
	{

teleport1trig waittill ("trigger", player);
player setOrigin(teleport1.origin);
iprintlnbold (""+ player.name +" entered the easy secret");

}
}

easysecretrespawn()
{
	easysecretrespawntrig = getent("trig_easysecretrespawn", "targetname");
	easysecretrespawnorigin = getent("origin_easysecretrespawn", "targetname");
	for(;;)
	{

easysecretrespawntrig waittill ("trigger", player);
player setOrigin(easysecretrespawnorigin.origin);

}
}

hardsecretend()
{
	hardsecretdonetrig = getent("trig_hardsecretdone", "targetname");
	hardsecretdoneorigin = getent("origin_hardsecretdone", "targetname");
	for(;;)
	{

hardsecretdonetrig waittill ("trigger", player);
player setOrigin(hardsecretdoneorigin.origin);
iprintlnbold(""+ player.name +" finished the hard secret");
}
}

hardsecretenter()
{
	hardsecretentertrig = getent("trig_enterhardsecret", "targetname");
	hardsecretorigin = getent("origin_hardsecret", "targetname");
	for(;;)
	{

hardsecretentertrig waittill ("trigger", player);
player setOrigin(hardsecretorigin.origin);
iprintlnbold (""+ player.name +" entered the hard secret");

}
}

hardsecretrespawn()
{
	hardsecretrespawntrig = getent("trig_hardsecretrespawn", "targetname");
	hardsecretrespawnorigin = getent("origin_hardsecretrespawn", "targetname");
	for(;;)
	{

hardsecretrespawntrig waittill ("trigger", player);
player setOrigin(hardsecretrespawnorigin.origin);

}
}

teleport2()
{
	teleport2trig = getent("trig_secret2end", "targetname");
	teleport2 = getent("origin_secret2end", "targetname");
	for(;;)
	{
teleport2trig waittill ("trigger", player);
player setOrigin(teleport2.origin);
iprintlnbold (""+ player.name +" finished the easy secret");

}
}

actitele1()
{
	actitele1trig = getent("trig_actitele1", "targetname");
	actitele1 = getent("origin_actitele1", "targetname");
	actitele1trig sethintstring("Move to the next area");
	for(;;)
	{
actitele1trig waittill ("trigger", player);
player setOrigin(actitele1.origin);
	}
}

actitele2()
{
	actitele2trig = getent("trig_actitele2", "targetname");
	actitele2 = getent("origin_actitele2", "targetname");
	actitele2trig sethintstring("Move to the next area");
	for(;;)
	{
actitele2trig waittill ("trigger", player);
player setOrigin(actitele2.origin);
}
}