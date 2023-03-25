main()
{
	maps\mp\_load::main();

	
	precacheItem( "rpg_mp" );
	precacheItem( "remington700_mp" );
	precacheItem( "deserteaglegold_mp" );
	
	
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
	setDvar( "compassmaxrange", "1024" );

	// total traps: 6
	// activated by user: 5
	// always active (and, or hidden): 3
	thread speed();
	thread TeleportTrigger();
	thread TeleportTrigger2();
	thread weap_jump_1();
	thread weap_jump_2();
	thread jump_door();
	thread jump_up();
	thread jump_2();
	thread jump_3();
	thread jump_respawn_3();
	thread jump_respawn_4();
	thread auto_jump();
	thread auto_jump_2();
	thread auto_jump_3();
	thread auto_jump_4();
	thread auto_jump_5();
	thread jump_final_1();
	thread jump_final_2();
	thread tp_1();
	thread secret_1();
	thread secret_1_2();
	thread trap_1();
	thread trap_2();
	thread trap_3();
	thread trap_4_1();
	thread trap_4_2();
	thread auto_1();
	thread auto_2();
	thread auto_3();
	thread trap_5();
	thread trap_6();
	thread final();
	thread final2();
	thread old();
	thread knife_2();

	// BraX >>>
	addTriggerToList( "switch" );
	addTriggerToList( "trigger2" );
	addTriggerToList( "trigger4" );
	addTriggerToList( "trigger3" );
	addTriggerToList( "trigger5" );
	addTriggerToList( "trigger6" );
	addTriggerToList( "tp_2" );
	addTriggerToList( "tp_4" );

	// HEY HEY REDNOSE WAS HERE!!!
}


addTriggerToList( targetname )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( targetname, "targetname" );
}
// <<< BraX

trap_1()
{
elevator=getent("elevator","targetname");
trig=getent("switch","targetname");
while(1)
{
trig waittill ("trigger");
trig delete();
elevator movez (316,0.5,0,0);
elevator waittill ("movedone");
wait(1);
elevator movez (-316,5,3,0);
elevator waittill ("movedone");

}
}


auto_1()
{
	brush1 = getEnt( "brush1", "targetname" );
	brush2 = getEnt( "brush2", "targetname" );

while (1)
{
	brush1 movez(-208,2);
	brush2 movez(208,3);
	wait 3;
	brush1 movez(208,2);
	brush2 movez(-208,3);
	wait 3;


}
}

trap_2()
{
	trap=getent("trap_2_1","targetname");
	trap2=getent("trap_2_2","targetname");
	trap3=getent("trap_2_3","targetname");
	trap4=getent("trap_2_4","targetname");
	trap5=getent("trap_2_5","targetname");
	trap6=getent("trap_2_6","targetname");
	trap7=getent("trap_2_7","targetname");
	trap8=getent("trap_2_8","targetname");
	trap9=getent("trap_2_9","targetname");
	trap10=getent("trap_2_10","targetname");
	trap11=getent("trap_2_11","targetname");
	trap12=getent("trap_2_12","targetname");
	trap13=getent("trap_2_13","targetname");
	trap14=getent("trap_2_14","targetname");
	trap15=getent("trap_2_15","targetname");
	trap16=getent("trap_2_16","targetname");
	trap17=getent("trap_2_17","targetname");
	trap18=getent("trap_2_18","targetname");
	trap19=getent("trap_2_19","targetname");
	trig=getent("trigger2","targetname");
	while(1)
	{
		trig waittill ("trigger");
		trig delete();
		trap movex (528,0.1,0,0);
		trap2 movex (544,0.2,0,0);
		trap3 movex (560,0.3,0,0);
		trap4 movex (576,0.4,0,0);
		trap5 movex (592,0.5,0,0);
		trap6 movex (608,0.6,0,0);
		trap7 movex (624,0.7,0,0);
		trap8 movex (640,0.8,0,0);
		trap9 movex (656,0.9,0,0);
		trap10 movex (672,1,0,0);
		trap11 movex (688,1.1,0,0);
		trap12 movex (704,1.2,0,0);
		trap13 movex (720,1.3,0,0);
		trap14 movex (736,1.4,0,0);
		trap15 movex (752,1.5,0,0);
		trap16 movex (768,1.6,0,0);
		trap17 movex (784,1.7,0,0);
		trap18 movex (800,1.8,0,0);
		trap19 movex (816,1.9,0,0);
		trap waittill ("movedone");
		trap2 waittill ("movedone");
		trap3 waittill ("movedone");
		trap4 waittill ("movedone");
		trap5 waittill ("movedone");
		trap6 waittill ("movedone");
		trap7 waittill ("movedone");
		trap8 waittill ("movedone");
		trap9 waittill ("movedone");
		trap10 waittill ("movedone");
		trap11 waittill ("movedone");
		trap12 waittill ("movedone");
		trap13 waittill ("movedone");
		trap14 waittill ("movedone");
		trap15 waittill ("movedone");
		trap16 waittill ("movedone");
		trap17 waittill ("movedone");
		trap18 waittill ("movedone");
		trap19 waittill ("movedone");
		wait 1;
		trap movex (-528,5,3,0);
		trap2 movex (-528,5,3,0);
		trap3 movex (-528,5,3,0);
		trap4 movex (-528,5,3,0);
		trap5 movex (-528,5,3,0);
		trap6 movex (-528,5,3,0);
		trap7 movex (-528,5,3,0);
		trap8 movex (-528,5,3,0);
		trap9 movex (-528,5,3,0);
		trap10 movex (-528,5,3,0);
		trap11 movex (-528,5,3,0);
		trap12 movex (-528,5,3,0);
		trap13 movex (-528,5,3,0);
		trap14 movex (-528,5,3,0);
		trap15 movex (-528,5,3,0);
		trap16 movex (-528,5,3,0);
		trap17 movex (-528,5,3,0);
		trap18 movex (-528,5,3,0);
		trap19 movex (-528,5,3,0);
		trap waittill ("movedone");
		trap2 waittill ("movedone");
		trap3 waittill ("movedone");
		trap4 waittill ("movedone");
		trap5 waittill ("movedone");
		trap6 waittill ("movedone");
		trap7 waittill ("movedone");
		trap8 waittill ("movedone");
		trap9 waittill ("movedone");
		trap10 waittill ("movedone");
		trap11 waittill ("movedone");
		trap12 waittill ("movedone");
		trap13 waittill ("movedone");
		trap14 waittill ("movedone");
		trap15 waittill ("movedone");
		trap16 waittill ("movedone");
		trap17 waittill ("movedone");
		trap18 waittill ("movedone");
		trap19 waittill ("movedone");
		
	}

}

trap_4_1()
{
	trap=getent("trap_4_1","targetname");
	doors=getent("doors","targetname");
	trig=getent("trigger4","targetname");
	while(1)
	{
		trig waittill ("trigger");
		trig delete();
		doors movex (-79,1,0,0);
		wait 2;
		trap movex (316,1,0,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movez (-56,0.3,0);
		trap waittill ("movedone");;
		wait 0.1;
		trap movex (-564,2,0,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movez (32,0.3,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movex (564,2,0,0);
		trap waittill ("movedone");
		wait 2;
		doors movex (79,1,0,0);

	}

}

trap_4_2()
{
	trap2=getent("trap_4_2","targetname");
	trig=getent("trigger4","targetname");
	while(1)
	{
		trig waittill ("trigger");
		wait 3;
		trap2 movex (564,1,0,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movez (32,0.3,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movex (-564,2,0,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movez (-32,0.3,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movex (564,2,0,0);
		trap2 waittill ("movedone");

	}

}




auto_2()
{

	brush = getEnt( "trap_3", "targetname" );

	while (1)
	{
		brush rotateYaw( 360, 2 );
		wait 1;
	}
}

trap_3()
{
	trig = getEnt( "trigger3", "targetname" );
	brush = getEnt( "trap_3", "targetname" );


	while (1)
	{
		trig waittill ("trigger");
		trig delete();
		brush movez (-200,1,0,0);
		brush waittill ("movedone");
		wait(2);
		brush movez (200,3,0,0);
		brush waittill ("movedone");
	}
}

auto_3()
{
	brushGroup = getEnt( "auto_2_1", "targetname" );
	brush = getEnt( "auto_2_2", "targetname" );

while (1)
{
	brushGroup movex(80,0.2);
	brush movez(-80,0.2);
	wait 0.2;
	brushGroup movez(-80,0.2);
	brush movex(-80,0.2);
	wait 0.2;
	brushGroup movex(-80,0.2);
	brush movez(80,0.2);
	wait 0.2;
	brushGroup movez(80,0.2);
	brush movex(80,0.2);
	wait 0.2;


}
}

trap_5()
{
	trig = getEnt( "trigger5", "targetname" );
	brush = getEnt( "trap_5", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while (1)
	{
		brush rotateYaw( 360, 2 );
		wait 1;
	}
}


trap_6()
{
	trig = getEnt( "trigger6", "targetname" );
	brush = getEnt( "trap_5b", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while (1)
	{
		brush rotateYaw( 2000, 5 );
		brush waittill ("movedone");
	}
}



final()
{
	door = getEnt( "door_final", "targetname" );
	trig = getEnt( "trig_final", "targetname" );

for (i=0;i<1;i++)
{
trig waittill ("trigger");
trig delete();
	door movex(600,1);
	wait 0.2;
}
}

final2()
{
	door = getEnt( "door_final", "targetname" );
	stairs = getEnt( "final_stairs1", "targetname" );
	stairs2 = getEnt( "final_stairs2", "targetname" );
	stairs3 = getEnt( "final_stairs3", "targetname" );
	stairs4 = getEnt( "final_stairs4", "targetname" );
	stairs5 = getEnt( "final_stairs5", "targetname" );
	stairs6 = getEnt( "final_stairs6", "targetname" );
	stairs7 = getEnt( "final_stairs7", "targetname" );
	stairs8 = getEnt( "final_stairs8", "targetname" );
	trig = getEnt( "trig_final2", "targetname" );
	clip = getEnt( "clip_final", "targetname" );

for (i=0;i<1;i++)
{
trig waittill ("trigger");
trig delete();
	stairs movex (-584,0.2);
	stairs2 movex (-552,0.4);
	stairs3 movex (-520,0.6);
	stairs4 movex (-488,0.8);
	stairs5 movex (-456,1);
	stairs6 movex (-424,1.2);
	stairs7 movex (-392,1.4);
	stairs8 movex (-360,1.6);
	door movez(-440,2);
	clip movez(-200,0.2);
	wait 0.2;
}
}


secret_1()
{
glass_01 = getent("secret_1_1","targetname");
brush = getent ("secret_1_3","targetname");
trig = getent("trig_secret_1","targetname");

dmg_01 = 0;
hp_01 = 400;

while(dmg_01 < hp_01)

{
   trig waittill ("damage", idmg);
   dmg_01 += idmg;
   if (dmg_01 >= hp_01)
      { 
      brush movez (-60,1);
      glass_01 delete();
      trig delete();
      }
}
}

secret_1_2()
{
brush = getent ("secret_1_2","targetname");
trig = getent("trig_secret_1_2","targetname");

trig waittill( "trigger", who );
	
  for (i= 0;i<1;i++)
      { 
	  trig delete();
      brush delete();
	  wait 1;
      }
}


tp_1()
{
trigger = getent ("tp", "targetname");
brush = getent ("secret_1_4","targetname");
while(1)
{
trigger waittill ("trigger",user);
trigger delete();
user setOrigin( (2428, 5168, 1233) );
wait(2);
brush movey (-1396,6);
brush waittill ("movedone");
wait(10);
brush movez (-250,3);
}
}



TeleportTrigger()
{
trig = getent ("tp_2","targetname");
while (1)
{
   trig waittill ("trigger",player);
   player iprintlnbold ("^6Let's JUMP !!!");
   player.health = 100;
   trig delete();
   thread jump();
}
}

jump()
{
clip = getent ("clip_tp","targetname");
if( GetTeamPlayersAlive("allies") == 1)
{

   players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( isAlive(players[i]) && players[i].pers["team"] != "spectator" )
			{
				if( players[i].pers["team"] == "allies" )
				{
					players[i] SetPlayerAngles(( players[i].angles[0],0, players[i].angles[2] ));
					players[i] SetOrigin((4643,4388,970));
				}
				if( players[i].pers["team"] == "axis" )
				{
					players[i] SetPlayerAngles( players[i].angles[0], 0, players[i].angles[2] );
					players[i] SetOrigin((4123,3870,970));
				}
				players[i] SetMoveSpeedScale(1);
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("knife_mp");
				wait 0.01;
				players[i] SwitchToWeapon("knife_mp");
				wait 1;
				clip delete();
			}
		}
		return;
}
if( GetTeamPlayersAlive("allies") != 1)
{
players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( isAlive(players[i]) && players[i].pers["team"] != "spectator" )
			{
				if( players[i].pers["team"] == "allies" )
				{
					players[i] SetPlayerAngles(( players[i].angles[0],0, players[i].angles[2] ));
					players[i] SetOrigin((3888,3424,1072));
				}
				if( players[i].pers["team"] == "axis" )
				{
					players[i] SetPlayerAngles( players[i].angles[0], 0, players[i].angles[2] );
					players[i] SetOrigin((2720,96,1936));
				}
				players[i] SetMoveSpeedScale(1);
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("knife_mp");
				wait 0.01;
				players[i] SwitchToWeapon("knife_mp");
				}



}
return;
}
}

weap_jump_1()
{
trig = getent ("trig_jump_1","targetname");
while(1)
{
trig waittill ("trigger",player);
player takeallweapons ();
player giveweapon("rpg_mp");
wait 0.01;
player switchtoweapon("rpg_mp");
wait 15;
}
}

weap_jump_2()
{
trig = getent ("trig_jump_2","targetname");
while(1)
{
trig waittill ("trigger",player);
player takeallweapons ();
player giveweapon("rpg_mp");
wait 0.01;
player switchtoweapon("rpg_mp");
wait 15;
}
}

auto_jump()
{

	brush = getEnt( "jump_1", "targetname" );

	while (1)
	{
		brush rotateYaw( 360, 3 );
		wait 1;
	}
}

jump_2()
{
trigger = getent ("tp_jump_1", "targetname");
while(1)
{
trigger waittill ("trigger",user);
trigger delete();
user SetMoveSpeedScale( 3 );
user setOrigin( (4704, 4488, 1296) );
}
}

jump_3()
{
trigger = getent ("tp_jump_2", "targetname");
while(1)
{
trigger waittill ("trigger",user);
trigger delete();
user SetMoveSpeedScale( 3 );
user setOrigin( (4096, 3808, 1296) );
}
}


speed()
{
trig = getent ("speed", "targetname");
while(1)
{
trig waittill ("trigger",user);
trig delete();
user SetMoveSpeedScale( 2 );
}
}

auto_jump_2()
{

	brush = getEnt( "rotate_jump_1", "targetname" );
	brush2 = getEnt( "rotate_jump_2", "targetname" );

	while (1)
	{
		brush rotateYaw( 180, 1 );
		brush2 rotateYaw( -180, 1 );
		wait 1;
	}
}


auto_jump_3()
{

	brush1 = getEnt( "auto_jump_1", "targetname" );
	brush2 = getEnt( "auto_jump_2", "targetname" );

while (1)
{
	brush1 movez(288,1);
	brush2 movez(-288,1);
	wait 1.5;
	brush1 movez(-288,1);
	brush2 movez(288,1);
	wait 1.5;
	}
	}
	
auto_jump_4()
{

	brush = getEnt( "auto_jump_4", "targetname" );
	brush2 = getEnt( "auto_jump_5", "targetname" );

	while (1)
	{
		brush rotateYaw( 360, 1.5 );
		brush2 rotateYaw( -360, 1.5 );
		wait 1;
	}
}

auto_jump_5()
{

	brush = getEnt( "auto_jump_6", "targetname" );

	while (1)
	{
		brush movex (480,2);
		wait 2;
		brush movex (-480,2);
		wait 2;
	}
}


jump_up()
{
elevator=getent("rotate_jump_3","targetname");
trig=getent("trig_jump_up","targetname");
while(1)
{
trig waittill ("trigger");
elevator movez (480,3);
elevator waittill ("movedone");
wait(4);
elevator movez (-480,7);
elevator waittill ("movedone");
}
}


jump_door()
{
trig=getent("trig_jump_door","targetname");
brush=getent("jump_door","targetname");

while(1)
{

trig waittill( "trigger", who );
trig delete();
brush movez (-65,1);
wait (1);
}
}


jump_final_1()
{
trig=getent("final_jump_1","targetname");

while(1)
{
trig waittill ("trigger",user);
user SetOrigin((2720,96,3328));
user takeallweapons ();
user giveweapon("remington700_mp");
wait (0.01);
user switchtoweapon("remington700_mp");
wait (10);
}
}

jump_final_2()
{
trig=getent("final_jump_2","targetname");

while(1)
{
trig waittill ("trigger",player);
player SetOrigin((3792,672,3328));
player takeallweapons ();
player giveweapon("remington700_mp");
wait 0.01;
player switchtoweapon("remington700_mp");
wait 10;
}
}



jump_respawn_3()
{
trigger = getent ("jump_respawn_3", "targetname");
while(1)
{
trigger waittill ("trigger",user);
user setOrigin( (3888,3424,1072) );
}
}

jump_respawn_4()
{
trigger = getent ("jump_respawn_4", "targetname");
while(1)
{
trigger waittill ("trigger",user);
user setOrigin( (2720,96,1936) );
}
}

old()
{
trig=getent("tp_4","targetname");
knife=getent("brush_knife","targetname");
jump=getent("brush_jump","targetname");
while(1)
{
trig waittill ("trigger",user);
jump movey (104,0.1);
knife movey (104,0.1);
user SetOrigin((3152,528,1016));
user takeallweapons ();
user giveweapon("deserteaglegold_mp");
wait (0.01);
user switchtoweapon("deserteaglegold_mp");
wait (0.01);
}
}

TeleportTrigger2()
{
trig = getent ("tp_3","targetname");
while (1)
{
   trig waittill ("trigger",player);
   player.health = 100;
   trig delete();
   thread knife_1();
   wait 2;
   player setorigin ( (1200,5440,1300) );
}
}

knife_1()
{
trig=getent("tp_3","targetname");
old=getent("brush_old","targetname");
jump=getent("brush_jump","targetname");

while (1)
{

   players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( isAlive(players[i]) && players[i].pers["team"] != "spectator" )
			{
				if( players[i].pers["team"] == "allies" )
				{
					players[i] SetPlayerAngles(( players[i].angles[0],0, players[i].angles[2] ));
					players[i] SetOrigin((1344,2824,1376));
				}
				if( players[i].pers["team"] == "axis" )
				{
					players[i] SetPlayerAngles( players[i].angles[0], 0, players[i].angles[2] );
					players[i] SetOrigin((2050,5440,1552));
				}
				players[i] SetMoveSpeedScale(1);
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("tomahawk_mp");
				wait 0.01;
				players[i] SwitchToWeapon("tomahawk_mp");
				wait 1;
			}
		}
		return;
}
}

knife_2()
{
trig=getent("trig_knife","targetname");
brush=getent("knife_1","targetname");
while(1)
{
trig waittill ("trigger",user);
user setOrigin( (1200,5440,1300) );
brush movez (120,1);
wait 10;
brush movez(-120,1);
}
}