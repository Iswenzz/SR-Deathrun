//////////////////// MY FIRST DR MAP :DJ YEAAAh
/////////////////// This script is waaaay to chaotic for u 2 understand lololol
/////////////////MAP MADE BY LOOTJE
////////////////////SCRIPTED BY xx_420blazedabongxxx_MLG
///////////////Credits to my mom for bringing snacks when I called for snacks.
/////////////////////////////////ENYOJOJJOJOJOJ
///////////////////////////////////////:D


main()
{
 maps\mp\_load::main();

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


 addTriggerToList( "trig_trap02" );
 addTriggerToList( "trig_trap01" );
 addTriggerToList( "trig_trap03" );
 addTriggerToList( "trig_trap04" );
 addTriggerToList( "trig_trap05" );
 addTriggerToList( "trig_trap06" );
 addTriggerToList( "trig_trap07" );
 addTriggerToList( "trig_trap08" );
 addTriggerToList( "trig_trap09" );
 addTriggerToList( "trig_trap10" );
 addTriggerToList( "trig_rotatetrap" );
 addTriggerToList( "trig_trapbegin" );
 addTriggerToList( "trig_creeper" );

 thread messages();
 thread mapstarttraps();
 thread startdoor();
 thread platform1();
 thread platform2();
 thread platform3();
 thread platform45();
 thread teleport1();
 thread teleport2();
 thread teleport3();
 thread teleport4();
 thread teleport5();
 thread teleport6();
 thread teleportsecret();
 thread teleportsecretfail();
 thread teleportsecretend();
 thread teleportbouncejumper();
 thread teleportbounceactivator();
 thread mapmusic();
 thread movingblocks();
 thread trap02();
 thread trap01();
 thread trap03();
 thread trap04();
 thread trap05();
 thread trap06();
 thread trap07();
 thread trap08();
 thread trap09();
 thread trap10();
 thread creeperface();
 thread rotatetrap();
 thread trapstart();
 thread endmap();
 thread sniper();
 thread bounce();
 thread old();
 thread weapon();



}

messages()
{
wait 10;
iprintlnBold("^8L^0X^8U^0R^2Y!!");
wait 3;
iprintlnBold("^8>>^0Map by ^1L^2o^3o^4t^5j^6e^8<<");
wait 4;
iprintln("^8My frist map plees be kind");
iprintln("^8My frist map plees be kind");
wait 1;
}


startdoor()
{
door1 = getent("startdoor1","targetname");
door2 = getent("startdoor2","targetname");
{
wait 15;
door1 moveY(270, 3);
door2 moveY(-270, 3);
iprintlnbold("^8Start door opened.");
wait 2;
}
}


platform1()
{
plat1 = getent("plat1","targetname");
trig_plat1 = getent("trig_plat1","targetname");
trig_plat1 waittill("trigger" , user );
while(1)
{
plat1 moveX(368, 2);
wait 4;
plat1 moveX(-368, 2);
wait 4;
}
}

platform2()
{
plat2 = getent("plat2","targetname");
trig_plat2 = getent("trig_plat2","targetname");
trig_plat2 waittill("trigger" , user );
while(1)
{
plat2 moveX(368, 2);
wait 4;
plat2 moveX(-368, 2);
wait 4;
}
}


platform3()
{
plat3 = getent("plat3","targetname");
trig_plat3 = getent("trig_plat3","targetname");
trig_plat3 waittill("trigger" , user );
while(1)
{
plat3 moveX(368, 2);
wait 4;
plat3 moveX(-368, 2);
wait 4;
}
}


platform45()
{
plat4 = getent("plat4","targetname");
trig_plat4 = getent("trig_plat4","targetname");
trig_plat4 waittill("trigger" , user );
for(;;)
{
plat4 moveX(-1728, 7);
wait 7;
plat4 moveX(1728 , 7);
wait 7;
}
}


teleport1()
{
	trig = getEnt("teleport_1","targetname");
	target = getEnt("tp1","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
		player iprintln("^1Tadaa!");
	}
}

teleport2()
{
	trig = getEnt("teleport_2","targetname");
	target = getEnt("tp2","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
		player iprintln("^1Aaaaand youre back!");
	}
}

teleport3()
{
	trig = getEnt("teleport_3","targetname");
	target = getEnt("tp3","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}

teleport4()
{
	trig = getEnt("teleport_4","targetname");
	target = getEnt("tp4","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}

teleport5()
{
	trig = getEnt("teleport_5","targetname");
	target = getEnt("tp5","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}

teleport6()
{
	trig = getEnt("teleport_6","targetname");
	target = getEnt("tp6","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}

teleportsecret()
{
	trig = getEnt("teleport_secret","targetname");
	target = getEnt("tpsecret","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
		iPrintlnBold( player.name + "^8 Has entered the ^3secret!" );
	}
}


teleportsecretfail()
{
	trig = getEnt("tpsecretfail","targetname");
	target = getEnt("tpsecret","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
		player iprintln("^8Lez try dat again shall we");
	}
}


teleportsecretend()
{
	trig = getEnt("telepsecretend","targetname");
	target = getEnt("tpsecretend","targetname");


	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
		iPrintlnBold( player.name + "^8 Has finished da ^3secret!" );
		player GiveWeapon("m40a3_mp");
		player GiveMaxAmmo("m40a3_mp");
		wait .05;
		player SwitchToWeapon("m40a3_mp");
		player iPrintlnBold("^8Here have a sniper");
	}
}
teleportbouncejumper()
{
	trig = getEnt("teleport_bounce_jumper","targetname");
	target = getEnt("bounce_jumper","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}

teleportbounceactivator()
{
	trig = getEnt("teleport_bounce_activator","targetname");
	target = getEnt("bounce_activator","targetname");

	for(;;)
	{
		trig waittill("trigger",player);
		player setPlayerAngles(target.angles);
		player setOrigin(target.origin);
	}
}


mapmusic()
{
music = getent("jaws","targetname");
music waittill("trigger");
music SetHintString("^4Press ^7use ^4to ^7play ^4music");
{
	wait 1;
	possibility = randomIntRange(1,3);
	if(possibility == 1)
	{
		ambientplay( "jaws" );
		iprintln("^4Song: ^9Lxury - J.A.W.S");
		iprintln("^4Song: ^9Lxury - J.A.W.S");
		iprintln("^4Song: ^9Lxury - J.A.W.S");
	}

	if(possibility == 2)

	{
		ambientPlay("company");
		iprintln("^4Song: ^9Lxury - Company");
		iprintln("^4Song: ^9Lxury - Company");
		iprintln("^4Song: ^9Lxury - Company");
	}

	if(possibility == 3)

	{
		ambientPlay("benediction");
		iprintln("^4Song: ^9Hot Natured - Benediction (Lxury remix)");
		iprintln("^4Song: ^9Hot Natured - Benediction (Lxury remix)");
		iprintln("^4Song: ^9Hot Natured - Benediction (Lxury remix)");
	}



music delete();
iprintlnbold(" ^8 Someone here is a ^3luxurious DJ^8!");
wait 1;
}
}

movingblocks()
{
     thread block01();
	 thread block02();
	 thread block03();
	 thread block04();
	 thread block05();
	 thread block06();
	 thread block07();
	 thread endmaprotations();
}

block01()
{
b1 = getent("b01","targetname");
for(;;)

{
b1 moveX(704, 4);
b1 waittill ("movedone");
b1 moveY(832, 4);
b1 waittill ("movedone");
b1 moveX(-704, 4);;
b1 waittill ("movedone");
b1 moveY(-832, 4);
b1 waittill ("movedone");

}
}

block02()
{
b2 = getent("b02","targetname");
for(;;)

{
b2 moveY(832, 4);
b2 waittill ("movedone");
b2 moveX(-704, 4);;
b2 waittill ("movedone");
b2 moveY(-832, 4);
b2 waittill ("movedone");
b2 moveX(704, 4);
b2 waittill ("movedone");

}
}

block03()
{
b3 = getent("b03","targetname");
for(;;)

{
b3 moveX(-704, 4);
b3 waittill ("movedone");
b3 moveY(-832, 4);
b3 waittill ("movedone");
b3 moveX(704, 4);;
b3 waittill ("movedone");
b3 moveY(832, 4);
b3 waittill ("movedone");

}
}

block04()
{
b4 = getent("b04","targetname");
for(;;)

{
b4 moveY(-832, 4);
b4 waittill ("movedone");
b4 moveX(704, 4);
b4 waittill ("movedone");
b4 moveY(832, 4);
b4 waittill ("movedone");
b4 moveX(-704, 4);;
b4 waittill ("movedone");

}
}

block05()
{
b = getent("block5","targetname");
for(;;)

{
b moveY(-352, 0.8);
b waittill ("movedone");
b moveY(-304, 0.8);
b waittill ("movedone");
b moveY(304, 0.8);
b waittill ("movedone");
b moveY(352, 0.8);
b waittill ("movedone");

}
}

block06()
{
b = getent("block6","targetname");
for(;;)

{
b moveY(-304, 0.8);
b waittill ("movedone");
b moveY(304, 0.8);
b waittill ("movedone");
b moveY(304, 0.8);
b waittill ("movedone");
b moveY(-304, 0.8);
b waittill ("movedone");

}
}

block07()
{
b = getent("block7","targetname");
for(;;)

{
b moveY(352, 0.8);
b waittill ("movedone");
b moveY(304, 0.8);
b waittill ("movedone");
b moveY(-304, 0.8);
b waittill ("movedone");
b moveY(-352, 0.8);
b waittill ("movedone");

}
}


endmaprotations()
{
draai1 = getent ("einddraai1", "targetname");
draai2 = getent ("einddraai2", "targetname");
while(1)

	{
	wait 0.1;
	draai1 rotatePitch (360, 3);
	draai2 rotatePitch (-360, 3);
	wait 0.1;
	}
}

trap01()
{
platform1 = getent("trap01a","targetname");
platform2 = getent("trap01b","targetname");
platform3 = getent("trap01c","targetname");
platform4 = getent("trap01d","targetname");
trig = getent("trig_trap01","targetname");
trig SetHintString( "Make Them Move" );
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
for(;;)
{
platform1 moveY(300, 3);
platform2 moveY(300, 3);
wait 1;
platform3 moveY(-300, 3);
platform4 moveY(-300, 3);
wait 5;
platform1 moveY(-300 , 3);
platform2 moveY(-300 , 3);
platform3 moveY(300 , 3);
platform4 moveY(300 , 3);
wait 5;


}
}
}


trap02()
{
trap2spike=getent("trap02a","targetname");
trap2spike2=getent("trap02b","targetname");
trap2spike3=getent("trap02c","targetname");
trap2spike4=getent("trap02d","targetname");
trap2spike5=getent("trap02e","targetname");
trap2spike6=getent("trap02f","targetname");
trap2spike7=getent("trap02g","targetname");
trap2killer=getent("trap02killer","targetname");
trig=getent("trig_trap02","targetname");
trig SetHintString( "SPIKES!!" );
trap2killer EnableLinkTo();
trap2killer LinkTo(trap2spike);
trig waittill ("trigger", player);
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
trap2spike movez (95,1,0.1,0.9);
trap2spike2 movez (95,1,0.1,0.9);
trap2spike3 movez (95,1,0.1,0.9);
trap2spike4 movez (95,1,0.1,0.9);
trap2spike5 movez (95,1,0.1,0.9);
trap2spike6 movez (95,1,0.1,0.9);
trap2spike7 movez (95,1,0.1,0.9);
wait(3);
trap2spike movez (-95,3,2.9,0.1);
trap2spike2 movez (-95,3,2.9,0.1);
trap2spike3 movez (-95,3,2.9,0.1);
trap2spike4 movez (-95,3,2.9,0.1);
trap2spike5 movez (-95,3,2.9,0.1);
trap2spike6 movez (-95,3,2.9,0.1);
trap2spike7 movez (-95,3,2.9,0.1);
trap2spike  waittill ("movedone");
trap2spike2 waittill ("movedone");
trap2spike3 waittill ("movedone");
trap2spike4 waittill ("movedone");
trap2spike5 waittill ("movedone");
trap2spike6 waittill ("movedone");
trap2spike7 waittill ("movedone");
}
}


trap03()
{
platform = getent("trap03a","targetname");
platform2 = getent("trap03b","targetname");
trig = getent("trig_trap03","targetname");
trig SetHintString( "^1Push them off!" );
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
wait 0.1;
platform moveY(-800,1,0.1,0.9);
platform2 moveY(-800 ,1,0.1,0.9);
wait 4.5;
platform moveY(800,3,2.9,0.1);
platform2 moveY(800 ,3,2.9,0.1);
wait 4.5;
platform waittill ("movedone");
platform2 waittill ("movedone");

}
}


trap04()
{
trap1 =getent("trap04a","targetname");
trap2 =getent("trap04b","targetname");
trap3 =getent("trap04c","targetname");
killer1 =getent("trap04akiller","targetname");
killer2 =getent("trap04bkiller","targetname");
killer3 =getent("trap04ckiller","targetname");
trig =getent("trig_trap04","targetname");
killer1 EnableLinkTo();
killer1 LinkTo(trap1);
killer2 EnableLinkTo();
killer2 LinkTo(trap2);
killer3 EnableLinkTo();
killer3 LinkTo(trap3);
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
r = RandomIntRange(1, 3);
if(r == 2)
{
	trap2 moveZ (-224,2);
	trap2 waittill("movedone");
}
if(r == 1)
{
	trap1 moveY (176,2);
	trap1 waittill("movedone");
	trap3 moveY (-176,2);
	trap3 waittill("movedone");
}
if(r == 3)
{
	trap2 moveZ (-224,2);
	trap2 waittill("movedone");
}

}
}

trap05()
{
trap1 =getent("trap05a","targetname");
trap2 =getent("trap05b","targetname");
trig = getent("trig_trap05","targetname");
trig SetHintString( "^1 Make them strafe" );
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
r = RandomIntRange(1, 3);
if(r == 2)
{
	trap1 moveY (370, 0.5);
	trap1 waittill("movedone");
}
if(r == 1)
{
	trap2 moveY (370, 0.5);
	trap2 waittill("movedone");
}
if(r == 3)
{
	trap1 moveY (370, 0.5);
	trap1 waittill("movedone");
	trap2 moveY (370, 0.5);
	trap2 waittill("movedone");
}


}
}

trapstart()
{
trap1 =getent("plat1","targetname");
trap2 =getent("plat2","targetname");
trap3 =getent("plat3","targetname");
trig = getent ("trig_trapbegin", "targetname");
trig SetHintString( "^1 Rotations, rotations.." );
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
		{
		wait 0.1;
		 trap1 rotateYaw (1800,4);
		 trap2 rotateYaw (-1800,4);
		 trap3 rotateYaw (1800,4);
		 trap1 waittill("movedone");
		 trap2 waittill("movedone");
		 trap3 waittill("movedone");
		}
 }
 }


 trap07()
 {
 trap1 =getent("trap07a","targetname");
 trap2 =getent("trap07b","targetname");
 killer1 =getent("killer07a","targetname");
 killer2 =getent("killer07b","targetname");
 trig = getent ("trig_trap07", "targetname");
 killer1 EnableLinkTo();
 killer1 LinkTo(trap1);
 killer2 EnableLinkTo();
 killer2 LinkTo(trap2);
 trig SetHintString( "^1 Up and down - ^2Vengaboys ^1 1978" );
 trig waittill("trigger", player );
 if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
while(1)
{
trap1 moveZ(1800, 8);
trap2 moveZ(1800, 8);
wait 1;
trap1 moveZ(-1800, 8);
trap2 moveZ(-1800, 8);
wait 1;
}
}
}


trap06()
{
trap1 =getent("trap06a","targetname");
trap2 =getent("trap06b","targetname");
trig = getent ("trig_trap06", "targetname");
trig SetHintString( "^1 Move poles UP AND DOWN " );
trig waittill("trigger", player );
 if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
trig SetHintString("^4Activated");
while(1)
{
wait 0.5;
trap1 moveZ(50, 5);
trap2 moveZ(-50, 5);
wait 5;
trap1 moveZ(-50, 5);
trap2 moveZ(50, 5);
wait 5;
}
}
}

trap08()
{
trap1 =getent("trap08a","targetname");
trap2 =getent("trap08b","targetname");
trig = getent ("trig_trap08", "targetname");
trig SetHintString( "^1 Rotations, ^8rotations, ^3rotations^1.." );
trig waittill("trigger", player );
if(level.trapsdisabled)
{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
}
else
{
	trig SetHintString("^4Activated");
	while(1)
	{
		trap1 rotateyaw (1800, 4);
		trap2 rotateyaw (-1800, 4);
		wait 5;
	}

 }
 }

 trap09()
{
	trig = getEnt("trig_trap09","targetname");
	platform1 = getEnt("trap09a","targetname");
	platform2 = getEnt("trap09b","targetname");
	platform3 = getEnt("trap09c","targetname");
	platform4 = getEnt("trap09d","targetname");
	trig SetHintString( "^1 Wot the fok did ye just say 2 me m8?" );
	trig waittill ("trigger", player );
	if(level.trapsdisabled)
	{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
	}
	else
	{
	trig SetHintString("^4Activated");

	while(1)
		{
		platform1 rotateroll (360,1);
		platform3 rotateroll (360,1);
		wait 1;
		platform2 rotateroll (360,1);
		platform4 rotateroll (360,1);
		wait 2;

		}
	}
}



mapstarttraps()

{

platform = getent("trap03a","targetname");
platform2 = getent("trap03b","targetname");
creeper=getent("creeper","targetname");

{
wait 0.1;
platform moveY (688,2);
platform2 moveY (688,2);
creeper NotSolid();
creeper hide();
platform = getent("trap03a","targetname");
platform2 = getent("trap03b","targetname");
platform waittill ("movedone");
platform2 waittill ("movedone");

}
}


rotatetrap()
{
trig = getent("trig_rotatetrap","targetname");
draai = getent("block8","targetname");
trig SetHintString( " ^1Spin that " );
trig waittill ("trigger");
	if(level.trapsdisabled)
	{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
	}
	else
	{
		trig SetHintString("^4Activated");
		while(1)
			{
				wait 0.1;
				draai rotateyaw (360, 3);
				wait 0.1;
			}
		}
}

trap10()
{
trap1=getent("trap10a","targetname");
trap2=getent("trap10b","targetname");
trap3=getent("trap10c","targetname");
trig = getent("trig_trap10","targetname");
trig SetHintString( "^1 Move those things" );
trig waittill ("trigger");
	if(level.trapsdisabled)
	{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
	}
	else
	{
		trig SetHintString("^4Activated");
		for(;;)
		{
		trap1 moveZ(400, 5);
		trap2 moveY(-800, 10);
		trap3 moveY(-800, 10);
		wait 2;
		trap1 moveZ(-400, 5);
		trap2 moveY(800, 10);
		trap3 moveY(800, 10);
		wait 2;

		}
	}
}



creeperface()
{
creeper=getent("creeper","targetname");
trig = getent("trig_creeper","targetname");
trig SetHintString( "^1 If they jump down just activate this :D" );
trig waittill ("trigger");
	if(level.trapsdisabled)
	{
	iprintln(" ^6 user.name + ^3 pls dont acti on free !");
	}
	else
	{
		trig SetHintString("^4Activated");
		creeper show();
		creeper solid();
		wait 10;
		creeper delete();
		wait 0.1;

	}
}



endmap()
{
trig = getent("endmap_trig","targetname");
trig waittill ("trigger, player");
iPrintlnBold(" ^8 player.name ^2+  ^3Finished the map. Hooray!");

	wait 0.1;
	trig delete();

}




 addTriggerToList( name, positionOfIconAboveTrap )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

    if( !isDefined( level.icon_origins ) )
        level.icon_origins = [];
    level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}



//////////////// END ROOMS


sniper()
{
level.teleactorigin = getEnt("sniper_activator", "targetname");
telejumporigin = getEnt("sniper_jumper", "targetname");
level.bounce_trigger = getEnt("trigger_bounce", "targetname");
level.sniper_trigger = getEnt("trigger_sniper","targetname");
level.old_trigger = getEnt("trigger_old","targetname");
level.weapon_trigger = getEnt("trigger_weapon","targetname");

while(1)
{
level.sniper_trigger waittill("trigger", player);

ambientPlay("flashback");

level.bounce_trigger delete();
level.old_trigger delete();


if(!isDefined(level.sniper_trigger))
            return;
    if(level.firstenter==true)
{
		level.bounce_trigger delete();
		level.old_trigger delete();
		level.weapon_trigger delete();
		level.firstenter=false;
		}
		wait(0.05);




player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("m40a3_mp");
player GiveMaxAmmo("m40a3_mp");
wait .05;
player SwitchToWeapon("m40a3_mp");
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ GiveMaxAmmo("m40a3_mp");
wait .05;
level.activ SwitchToWeapon("m40a3_mp");
iPrintlnBold( " ^2 1 v 1 me rust!" );
wait(0.05);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );


	player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Snipaah time^1!" );
		level.activ iPrintlnBold(  "^5Snipaah time^1!" );
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;
}
}



bounce()
{
     	level.bounce_trigger = getEnt( "trigger_bounce", "targetname");
     	jump = getEnt( "bounce_jumper", "targetname" );
     	acti = getEnt( "bounce_activator", "targetname" );
		level.sniper_trigger = getEnt("trigger_sniper","targetname");
		level.old_trigger = getEnt("trigger_old","targetname");
		level.weapon_trigger = getEnt("trigger_weapon","targetname");

		while(1)
     	{
         	level.bounce_trigger waittill( "trigger", player );

			ambientPlay("maduk");

         	if( !isDefined( level.bounce_trigger ) )
         	return;
			if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_trigger delete();
		level.weapon_trigger delete();
		level.firstenter=false;
		}
		wait(0.05);

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
		player giveweapon( "knife_mp" );
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
		level.activ giveweapon( "knife_mp" );
		iPrintlnBold( " ^8" + player.name + " ^4 has entered the Bounce room^8!" );
         	wait 0.05;
		level.activ switchtoweapon( "knife_mp" );
		player switchtoweapon( "knife_mp" );


		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Bouncaaah^1!" );
		level.activ iPrintlnBold( "^5Bouncaaah^1!" );
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;

     	}
}


old()
{
		level.old_trigger = getEnt( "trigger_old", "targetname");
     	acti = getEnt( "old_activator", "targetname" );
		level.sniper_trigger = getEnt("trigger_sniper","targetname");
		level.bounce_trigger = getEnt("trigger_bounce","targetname");
		deur1 = getEnt("old_door","targetname");
		deur2 = getEnt("old_door2","targetname");
		letters = getEnt("old_letters","targetname");
		level.old_trigger waittill( "trigger", player );

		{
		ambientPlay("schnitzel");
		level.sniper_trigger delete();
		level.bounce_trigger delete();
		level.old_trigger delete();
		level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
		iPrintlnBold( " ^8" + player.name + " ^4 has entered the old room^8!" );
		deur1 moveZ (-160,2);
		letters moveZ (-160,2);
		wait 12;
		deur2 moveZ (-352,2);
		}
}


weapon()
{
     	level.weapon_trigger = getEnt( "trigger_weapon", "targetname");
     	jump = getEnt( "weapon_jumper", "targetname" );
     	acti = getEnt( "weapon_activator", "targetname" );
		level.sniper_trigger = getEnt("trigger_sniper","targetname");
		level.old_trigger = getEnt("trigger_old","targetname");
		level.bounce_trigger = getEnt("trigger_bounce","targetname");

     	while(1)
     	{
         	level.weapon_trigger waittill( "trigger", player );

			ambientPlay("firemansam");

         	if( !isDefined( level.weapon_trigger ) )
         	return;
			if(level.firstenter==true)
		{
		level.sniper_trigger delete();
		level.old_trigger delete();
		level.bounce_trigger delete();
		level.firstenter=false;
		}
		wait(0.05);

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
		player giveweapon( "knife_mp" );
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
		level.activ giveweapon( "knife_mp" );
		iPrintlnBold( " ^8" + player.name + " ^4 has entered the Weapon room^8!" );
         	wait 0.05;
		level.activ switchtoweapon( "knife_mp" );
		player switchtoweapon( "knife_mp" );


		player freezecontrols(true);
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold ( "^8Weapons are at the top!" );
		level.activ iPrintlnBold ( "^8Weapons are at the top!" );
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5GO!" );
		level.activ iPrintlnBold( "^5GO!" );
		player freezecontrols(false);
		level.activ freezecontrols(false);

		player waittill( "death" );
		level.PlayerInRoom = false;
     	}
}

