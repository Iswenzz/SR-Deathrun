#include common_scripts\utility;

main()
{
	maps\mp\_load::main();
	
	//ambientPlay("ambient_backlot_ext");
	ambientPlay("sail");
	//fx
	level.laz = LoadFX("fly/laser");
     level.las = LoadFX("v/las");
	 level.lav = LoadFX("v/lav");
	 level.fin = LoadFX("v/fin");
	 level.g = LoadFX("v/g");
	 level.cs = LoadFX("v/cake_s");
	 level.cb = LoadFX("v/cake_b");
	 level.lav2 = LoadFX("v/fire");
	 level.lav3 = LoadFX("v/lav3");
	  level.lig = LoadFX("v/lig");
	 level.fire2 = LoadFX("v/fire2");
	  level.tt = LoadFX("fire/tank_fire_engine");
	  
	  precacheItem( "remington700_mp" );
precacheItem( "knife_mp" );
precacheItem( "tomahawk_mp" );
precacheItem( "winchester1200_mp" );
precacheItem( "skorpion_mp" );
precacheItem( "m4_mp" );
precacheItem( "g3_mp" );
precacheItem( "ak47_mp" );
precacheItem( "rpd_mp" );
precacheItem( "saw_mp" );
precacheItem( "ak74u_mp" );
	 
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".18");

	setdvar( "r_specularcolorscale", "2.4877" );

	setdvar("compassmaxrange","1200");
	thread addtriggers();
	 level thread onPlayerConnect();
	 thread endslide();
	 thread surfwaypt1();
	 thread surfwaypt2();
	 thread endsn();
	 thread endk();
	 thread rsniper();
	thread endc();
	thread rjump();
	thread burnt();
	thread burnt2();
	level.slow = 1;
	level.fast = 1;
	thread trap1();
	thread t1();
	thread t2();
	thread t3();
	thread t4();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap9_1();
	thread trap9_2();
	thread trap9_3();
	thread trap10();
	thread addTestClients();
	thread endj();
	thread wjump();
	thread as();
	thread spec();
	thread demo();
	thread lmg();
	thread pistol();
	thread surfwaypt3();
	wait 5;
		        thread jum();
	        thread lav();
			thread fin();
			thread snipfx();
		    setDvar("bg_falldamagemaxheight", 500 );
	        setDvar("bg_falldamageminheight", 400 );
}
addtriggers()
{
    addTriggerToList("laser_act");
   addTriggerToList("tr2_act");
   addTriggerToList("tr3_act");
   addTriggerToList("tr4_act");
   addTriggerToList("tr5_act");
    addTriggerToList("tr6_act");
   addTriggerToList("tr7_act");
   addTriggerToList("tr8_act");
   addTriggerToList("tr9_act");
   addTriggerToList("tr10_act");
    addTriggerToList("slide_trig");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
onPlayerConnect()
{
		level waittill( "connected", player );
		player thread onPlayerSpawned();
}
onPlayerSpawned()
{

		self waittill("spawned_player");
		    setDvar("bg_falldamagemaxheight", 500 );
	        setDvar("bg_falldamageminheight", 400 );
			
       
} 

trap1()
{
	a = getent ("laser_act","targetname");
	a setHintString("^2Speed+");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.slow = 0;
	wait 1;
}
t1()
{
 	b = getent ("las_brush1","targetname");
	t = getent ("las_hurt1","targetname");
	
	t enablelinkto();
	t linkto(b);
	
	while(level.slow == 1)
	{
	 b moveZ(200,2,1,1);
	 wait 2;
	 b moveZ(-200,2,1,1);
     wait 2;
 }
 while(level.fast == 1)
	{
	 b moveZ(200,1,0.5,0.5);
	 wait 1;
	 b moveZ(-200,1,0.5,0.5);
     wait 1;
 }
 }
 t2()
{
 	b = getent ("las_brush2","targetname");
	t = getent ("las_hurt2","targetname");
	
	t enablelinkto();
	t linkto(b);
	
	while(level.slow == 1)
	{
	 b moveZ(-200,2,1,1);
	 wait 2;
	 b moveZ(200,2,1,1);
     wait 2;
 }
 while(level.fast == 1)
	{
	 b moveZ(-200,1,0.5,0.5);
	 wait 1;
	 b moveZ(200,1,0.5,0.5);
     wait 1;
 }
 }
 t3()
{
 	b = getent ("las_brush3","targetname");
	t = getent ("las_hurt3","targetname");
	
	t enablelinkto();
	t linkto(b);
	
		while(level.slow == 1)
	{
	 b moveZ(200,2,1,1);
	 wait 2;
	 b moveZ(-200,2,1,1);
     wait 2;
 }
 while(level.fast == 1)
	{
	 b moveZ(200,1,0.5,0.5);
	 wait 1;
	 b moveZ(-200,1,0.5,0.5);
     wait 1;
 }
 }
 t4()
{
 	b = getent ("las_brush4","targetname");
	t = getent ("las_hurt4","targetname");
	
	t enablelinkto();
	t linkto(b);
	
	while(level.slow == 1)
	{
	 b moveZ(-200,2,1,1);
	 wait 2;
	 b moveZ(200,2,1,1);
     wait 2;
 }
 while(level.fast == 1)
	{
	 b moveZ(-200,1,0.5,0.5);
	 wait 1;
	 b moveZ(200,1,0.5,0.5);
     wait 1;
 }
 }
jum()
 {
   v1 = getent ("j1" ,"targetname");
   v2 = getent ("j2" ,"targetname");
   v3 = getent ("j3" ,"targetname");
   v4 = getent ("j4" ,"targetname");
   v5 = getent ("j5" ,"targetname");
   v6 = getent ("j6" ,"targetname");
   v7 = getent ("j7" ,"targetname");
   v8 = getent ("j8" ,"targetname");
   v9 = getent ("j9" ,"targetname");
   v10 = getent ("j10" ,"targetname");
   v11 = getent ("j11" ,"targetname");
   v12 = getent ("j12" ,"targetname");
   v13 = getent ("j13" ,"targetname");
   v14 = getent ("j14" ,"targetname");
   v15 = getent ("j15" ,"targetname");
   v16 = getent ("j16" ,"targetname");
   v17 = getent ("j17" ,"targetname");
   v18 = getent ("j18" ,"targetname");
   v19 = getent ("j19" ,"targetname");
   v20 = getent ("j20" ,"targetname");
   v21 = getent ("j21" ,"targetname");
   v22 = getent ("j22" ,"targetname");
   v23 = getent ("j23" ,"targetname");
   v24 = getent ("j24" ,"targetname");
   v25 = getent ("j25" ,"targetname");
   v26 = getent ("j26" ,"targetname");
   v27 = getent ("j27" ,"targetname");
   v28 = getent ("j28" ,"targetname");
   v29 = getent ("j29" ,"targetname");
   v30 = getent ("j30" ,"targetname");
   v31 = getent ("j31" ,"targetname");
   v32 = getent ("j32" ,"targetname");
   v33 = getent ("j33" ,"targetname");
   v34 = getent ("j34" ,"targetname");
   v35 = getent ("j35" ,"targetname");
   v36 = getent ("j36" ,"targetname");
   v37 = getent ("j37" ,"targetname");
   v38 = getent ("j38" ,"targetname");
   v39 = getent ("j39" ,"targetname");
   v40 = getent ("j40" ,"targetname");
   v41 = getent ("j41" ,"targetname");
   v42 = getent ("j42" ,"targetname");
   v43 = getent ("j43" ,"targetname");
   v44 = getent ("j44" ,"targetname");
   v45 = getent ("j45" ,"targetname");
   v46 = getent ("j46" ,"targetname");
   v47 = getent ("j47" ,"targetname");
   v48 = getent ("j48" ,"targetname");
   v49 = getent ("j49" ,"targetname");
   v50 = getent ("j50" ,"targetname");
   wait 1;
    PlayFX( level.lav, v1.origin);
	PlayFX( level.lav, v2.origin);
	PlayFX( level.lav, v3.origin);
	PlayFX( level.lav, v4.origin);
	PlayFX( level.lav, v5.origin);
	PlayFX( level.lav, v6.origin);
	PlayFX( level.lav, v7.origin);
	PlayFX( level.lav, v8.origin);
	PlayFX( level.lav, v9.origin);
	PlayFX( level.lav, v10.origin);
	PlayFX( level.lav, v12.origin);
	PlayFX( level.lav, v13.origin);
	PlayFX( level.lav, v14.origin);
	PlayFX( level.lav, v15.origin);
	PlayFX( level.lav, v16.origin);
	PlayFX( level.lav, v17.origin);
	PlayFX( level.lav, v18.origin);
	PlayFX( level.lav, v19.origin);
	PlayFX( level.lav, v20.origin);
	wait 1;
	PlayFX( level.lav, v21.origin);
	PlayFX( level.lav, v22.origin);
	PlayFX( level.lav, v23.origin);
	PlayFX( level.lav, v24.origin);
	PlayFX( level.lav, v25.origin);
	PlayFX( level.lav, v26.origin);
	PlayFX( level.lav, v27.origin);
	PlayFX( level.lav, v28.origin);
	PlayFX( level.lav, v29.origin);
	PlayFX( level.lav, v30.origin);
	PlayFX( level.lav, v31.origin);
	PlayFX( level.lav, v32.origin);
	PlayFX( level.lav, v33.origin);
	PlayFX( level.lav, v34.origin);
	PlayFX( level.lav, v35.origin);
	PlayFX( level.lav, v36.origin);
	PlayFX( level.lav, v37.origin);
	PlayFX( level.lav, v38.origin);
	PlayFX( level.lav, v39.origin);
	PlayFX( level.lav, v40.origin);
	wait 1;
	PlayFX( level.lav, v41.origin);
	PlayFX( level.lav, v42.origin);
	PlayFX( level.lav, v43.origin);
	PlayFX( level.lav, v44.origin);
	PlayFX( level.lav, v45.origin);
	PlayFX( level.lav, v46.origin);
	PlayFX( level.lav, v47.origin);
	PlayFX( level.lav, v48.origin);
	PlayFX( level.lav, v49.origin);
	PlayFX( level.lav, v45.origin);
}		
lav()
{

   v1 = getent ("fx1" ,"targetname");
   v2 = getent ("fx2" ,"targetname");
   v3 = getent ("fx3" ,"targetname");
   v4 = getent ("fx4" ,"targetname");
   v5 = getent ("fx5" ,"targetname");
   v6 = getent ("fx6" ,"targetname");
   v7 = getent ("fx7" ,"targetname");
   v8 = getent ("fx8" ,"targetname");
   v9 = getent ("fx9" ,"targetname");
   v10 = getent ("fx10" ,"targetname");
   v11 = getent ("fx11" ,"targetname");
   v12 = getent ("fx12" ,"targetname");
   v13 = getent ("fx13" ,"targetname");
   v14 = getent ("fx14" ,"targetname");
   v15 = getent ("fx15" ,"targetname");
   v16 = getent ("fx16" ,"targetname");
   v17 = getent ("fx17" ,"targetname");
   v18 = getent ("fx18" ,"targetname");
   v19 = getent ("fx19" ,"targetname");
   v20 = getent ("fx20" ,"targetname");
   cs = getent ("cake_small" ,"targetname");
   cs2 = getent ("cs2" ,"targetname");
   cs3 = getent ("cs3" ,"targetname");
   cs4 = getent ("cs4" ,"targetname");
    cs5 = getent ("cs5" ,"targetname");
  // cb = getent ("cake_big" ,"targetname");
   
	
	PlayFX( level.lav, v1.origin);
	PlayFX( level.lav, v2.origin);
	PlayFX( level.lav, v3.origin);
	PlayFX( level.lav, v4.origin);
	PlayFX( level.lav, v5.origin);
	PlayFX( level.lav, v6.origin);
	PlayFX( level.lav, v7.origin);
	PlayFX( level.lav, v8.origin);
	PlayFX( level.lav, v9.origin);
	PlayFX( level.lav, v10.origin);
	PlayFX( level.lav, v12.origin);
	PlayFX( level.lav, v13.origin);
	PlayFX( level.lav, v14.origin);
	PlayFX( level.lav, v15.origin);
	PlayFX( level.lav, v16.origin);
	PlayFX( level.lav, v17.origin);
	PlayFX( level.lav, v18.origin);
	PlayFX( level.lav, v19.origin);
	PlayFX( level.lav, v20.origin);
	PlayFX( level.cs, cs.origin);
	PlayFX( level.cs, cs2.origin);
	PlayFX( level.cs, cs3.origin);
	PlayFX( level.cs, cs4.origin);
	PlayFX( level.cs, cs5.origin);
//	PlayFX( level.cb, cb.origin);
}	
snipfx()
{ 

   v1 = getent ("s1" ,"targetname");
   v2 = getent ("s2" ,"targetname");
   v3 = getent ("s3" ,"targetname");
   v4 = getent ("s4" ,"targetname");
   v5 = getent ("s5" ,"targetname");
   v6 = getent ("s6" ,"targetname");
   v7 = getent ("s7" ,"targetname");
   v8 = getent ("s8" ,"targetname");
   v9 = getent ("s9" ,"targetname");
   v10 = getent ("s10" ,"targetname");
   wait 2;
   
   PlayFX( level.lav, v1.origin);
	PlayFX( level.lav, v2.origin);
	PlayFX( level.lav, v3.origin);
	PlayFX( level.lav, v4.origin);
	PlayFX( level.lav, v5.origin);
	PlayFX( level.lav, v6.origin);
	PlayFX( level.lav, v7.origin);
	PlayFX( level.lav, v8.origin);
	PlayFX( level.lav, v9.origin);
	PlayFX( level.lav, v10.origin);
}	
trap2()
{
	a = getent ("tr2_act","targetname");
	a setHintString("^2Sink");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	
	thread t2_1();
	thread t2_2();
	thread t2_3();
	thread t2_4();
	thread t2_5();
	thread t2_6();
	thread t2_7();
	thread t2_8();
	thread t2_9();
	thread t2_10();
	thread t2_11();
	thread t2_12();
}
t2_1()
{
 	t = getent ("n1","targetname");
	b = getent ("g1","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_2()
{
 	t = getent ("n2","targetname");
	b = getent ("g2","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_3()
{
 	t = getent ("n3","targetname");
	b = getent ("g3","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_4()
{
 	t = getent ("n4","targetname");
	b = getent ("g4","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_5()
{
 	t = getent ("n5","targetname");
	b = getent ("g5","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}	 
t2_6()
{
 	t = getent ("n6","targetname");
	b = getent ("g6","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_7()
{
 	t = getent ("n7","targetname");
	b = getent ("g7","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_8()
{
 	t = getent ("n8","targetname");
	b = getent ("g8","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_9()
{
 	t = getent ("n9","targetname");
	b = getent ("g9","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_10()
{
 	t = getent ("n10","targetname");
	b = getent ("g10","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_11()
{
 	t = getent ("n11","targetname");
	b = getent ("g11","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
t2_12()
{
 	t = getent ("n12","targetname");
	b = getent ("g12","targetname");
	for(;;)
	{
    t waittill ("trigger",player);
	 b moveZ(-100,2,1,1);
	 wait 2;
	 b moveZ(100,2,1,1);
	 wait 2;
	 }
}
trap3()
{
    tr = getEnt( "tr3_act", "targetname" );
    t1 = getEnt( "t2_b1", "targetname" );
	t2 = getEnt( "t2_b2", "targetname" );
	t3 = getEnt( "t2_b3", "targetname" );
	t4 = getEnt( "t2_b4", "targetname" );
	t5 = getEnt( "t2_b5", "targetname" );
	t6 = getEnt( "t2_b6", "targetname" );
	f1 = getEnt( "t2_fx1", "targetname" );
	f2 = getEnt( "t2_fx2", "targetname" );
	f3 = getEnt( "t2_fx3", "targetname" );
	f4 = getEnt( "t2_fx4", "targetname" );
	f5 = getEnt( "t2_fx5", "targetname" );
	f6 = getEnt( "t2_fx6", "targetname" );
	tr setHintString("^2Burn");
	fxObj1 = SpawnFx( level.lav2, f1.origin);
	fxObj2 = SpawnFx( level.lav2, f2.origin);
	fxObj3 = SpawnFx( level.lav2, f3.origin);
	fxObj4 = SpawnFx( level.lav2, f4.origin);
	fxObj5 = SpawnFx( level.lav2, f5.origin);
	fxObj6 = SpawnFx( level.lav2, f6.origin);
	tr waittill( "trigger", player );
	tr setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
 	x = RandomInt(2);
	if( x == 1 )
		{
		//trig setHintString(1);
	     triggerFx (fxObj1);
	     triggerFx (fxObj2);
		 triggerFx (fxObj3);
		thread event1_1();
		thread event1_2();
		thread event1_3();
		while(1)
		{
		RadiusDamage( f1.origin, 150, 10, 10);
		 RadiusDamage( f2.origin, 150, 10, 10);
		 RadiusDamage( f3.origin, 150, 10, 10);
		 wait 0.5;
		 }
		}
	if( x == 0 )
		{
		//trig setHintString(1);
	     triggerFx (fxObj4);
	     triggerFx (fxObj5);
		 triggerFx (fxObj6);
		thread event2_1();
		thread event2_2();
		thread event2_3();
		while(1)
		{
		 RadiusDamage( f4.origin, 150, 10, 10);
		 RadiusDamage( f5.origin, 150, 10, 10);
		 RadiusDamage( f6.origin, 150, 10, 10);
		 wait 0.5;
		 }
		}
	
}
event1_1()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b1", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
event1_2()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b2", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
event1_3()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b3", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
event2_1()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b4", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
event2_2()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b5", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
event2_3()
{
	level endon ("trap3_stop");
	t1 = getEnt( "t2_b6", "targetname" );


	while(1)
	{
	wait 0.00001;
	players = getentarray("player", "classname");

		for( i = 0; i < players.size; i++ )
		{
			if( players[i] isTouching( t1 ) && players[i].sessionstate == "playing")
			{		
			players[i] thread burn();
			wait 0.5;
			}
		}
	}
}
burn()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	self setClientDvar("cg_drawDamageDirection", 0);
    self thread firefix();
	self SetMoveSpeedScale( 1.5 );
	//self setClientDvars( "cg_thirdPerson", "1");
	self disableWeapons();
	origin = self getorigin();
}
burn2()
{
	self endon ( "disconnect" );
	self endon ( "death" );
	self setClientDvar("cg_drawDamageDirection", 0);
    self thread firefix2();
	self SetMoveSpeedScale( 1.5 );
	//self setClientDvars( "cg_thirdPerson", "1");
	self disableWeapons();
	origin = self getorigin();
	while(1)
	{
	origin = self getorigin();
		RadiusDamage( origin, 100, 500, 500);
		wait 0.5;
		}
}
firefix2()
{
 	PlayFX( level.fire2, self.origin);
	wait 2;
	iprintln(self.name + " ^1Burned.");
}
firefix()
{
	self endon ( "death" );
    while(1)
	{
 	playFxOnTag( level.tt, self, "j_head" );
	playFxOnTag( level.tt, self, "tag_weapon_right" );
	playFxOnTag( level.tt, self, "back_mid" );
	playFxOnTag( level.tt, self, "torso_s	ilizer" );
	playFxOnTag( level.tt, self, "pelvis" );
	wait 0.5;
	}
	iprintln(self.name + " ^3burned.");
	self.fire =false;
}
kill()
{ 
	wait 5;
	self suicide();
	iprintln(self.name + " ^3burned.");
}	
trap4()
{
	tr = getent ("tr4_act","targetname");
	
	
	tr setHintString("^2Crusher #1");
    tr waittill( "trigger", player );
	thread  trap4_1();
	tr setHintString("^2Crusher #2");
	tr waittill( "trigger", player );
	player braxi\_rank::giveRankXp( "trap_activation" );
	thread  trap4_2();
	tr setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
 }
 trap4_1()
 {
   	b1 = getent ("spikes","targetname");
	t1 = getent ("spikes_hurt","targetname");
	t1 enablelinkto();
	t1 linkto(b1);
	
	 b1 moveZ(-192,6);
	 wait 7;
	 b1 moveZ(192,6,3,3);
     wait 5;
}
 trap4_2()
 {
   	b1 = getent ("spikes2","targetname");
	t1 = getent ("spikes_hurt2","targetname");
	t1 enablelinkto();
	t1 linkto(b1);
	
	 b1 moveZ(-192,6);
	 wait 7;
	 b1 moveZ(192,6,3,3);
     wait 5;
}
burnt()
{
	d = getEnt( "burn", "targetname" );
	for(;;)
	{
  d waittill( "trigger", player );
  player thread burn2();
  wait 1;
  }
}  
burnt2()
{
	d = getEnt( "burn2", "targetname" );
	for(;;)
	{
  d waittill( "trigger", player );
  player thread burn2();
  wait 1;
  }
}  
trap5()
{
	a = getent ("tr5_act","targetname");
	p = getent ("pusher","targetname");
	a setHintString("^2Pusher");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	
	while(1)
	{
	p rotateyaw(720,4,2,2);
	wait 6;
	p rotateyaw(-720,4,2,2);
	wait 6;
	}
}
trap6()
{
	a = getent ("tr6_act","targetname");
	r = getent ("rotor","targetname");
	a setHintString("^2Rotate");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	while(1)
	{
	r rotateyaw(720,4,2,2);
	wait 6;
	r rotateyaw(-720,4,2,2);
	wait 6;
	}
}
trap7() {
	trig = getent( "tr7_act" , "targetname" ) ;
	trig setHintString("^2Shocker");
	trig waittill("trigger", player );
	trig setHintString("^2Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	b = [];
	for (i=0; i<2; i++) {
		while(true) {
			x = RandomIntRange(1,5);
			
			f = false;
			for(j=0;j<b.size;j++) {
				if (b[j] == x) {
					f = true;
					break;
				}
			}
			
			if (!f) {
				b[b.size] = x;
				break;
			}
			wait 0.02;
		}
	}
	while(true) {
		thread blesk(RandomIntRange(1,5));
		wait 3;
	}
}

blesk(index) {
	level endon("blesk_" + index); // timeout pre kill trigger
	
	level thread timeout_blesk(index); // timeout pre killt rigger
	
	b = getstructarray ( "blesky_"  + index, "targetname" );
	t = getent ( "bleskyd_" + index, "targetname" );
	
	
	playFx(level.lig, b[0].origin); // urob efekt
	//t playsound("blesky"); // zvuk z kill triggra
	
	// kill trigger
	while(true) {
		t waittill( "trigger", player );
		
		if ( isPlayer(player) && isAlive(player) ) {
			player suicide();
		}
		
	}
}

// zrus killtriger po X sekundach
timeout_blesk(index) {
	wait 2;
	level notify("blesk_" + index); // ukonci kill trigger
}
trap8()
{
	a = getent ("tr8_act","targetname");
	s1 = getent ("slider1","targetname");
	s2 = getent ("slider2","targetname");
	a setHintString("^2Slider");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	s1 moveX(512,2,1,1);
	s2 moveX(-512,2,1,1);
	wait 2;
	while(1)
	{
	s1 moveX(-1024,2,1,1);
	s2 moveX(1024,2,1,1);
	wait 2;
	s1 moveX(1025,2,1,1);
	s2 moveX(-1024,2,1,1);
	wait 2;
	}	
	}
trap9()
{
    a = getent ("tr9_act","targetname");
	a2 = getent ("tr9_act2","targetname");
	ori = getent ("tr9","targetname");
	ori2 = getent ("tr92","targetname");
	a setHintString("^2Go to laser room?");
	a waittill ("trigger",player);
	
	player setOrigin( ori.origin );
	
	
	a2 setHintString("^2Return?");
	a2 waittill ("trigger",player);
	
	player setOrigin( ori2.origin );
	wait 1;
}	
	
	
trap9_1()
{
    t1 = getEnt( "t1", "targetname");
	t2 = getEnt( "t2", "targetname");
	t3 = getEnt( "t3", "targetname");
	t4 = getEnt( "t4", "targetname");
	b1 = getEnt( "b1", "targetname");
	b2 = getEnt( "b2", "targetname");
	b3 = getEnt( "b3", "targetname");
	b4 = getEnt( "b4", "targetname");
	l1 = getEnt( "l1", "targetname" );
	l2 = getEnt( "l2", "targetname" );
	l3 = getEnt( "l3", "targetname" );
	l4 = getEnt( "l4", "targetname" );
	t = getEnt( "trap6_1", "targetname" );
	wait 1;
	
	t1 enablelinkto();
	t1 linkto(b1); 
	t2 enablelinkto();
	t2 linkto(b2); 
	t3 enablelinkto();
	t3 linkto(b3); 
	t4 enablelinkto();
	t4 linkto(b4); 
	wait 1;
	b1 moveZ(-50,0.1);
	wait 1;
	b2 moveZ(-50,0.1);
	wait 1;
	b3 moveZ(-50,0.1);
	wait 1;
	b4 moveZ(-50,0.1);
	
	fxObj1 = SpawnFx( level.laz, l1.origin);
	fxObj2 = SpawnFx( level.laz, l2.origin);
	fxObj3 = SpawnFx( level.laz, l3.origin);
	fxObj4 = SpawnFx( level.laz, l4.origin);
	wait 1;

	t setHintString("^2Activate!");
	t waittill("trigger", player);
	t setHintString("^1Activated.");
	player braxi\_rank::giveRankXp( "trap_activation" );
	triggerFx (fxObj1);
	b1 moveZ(50,0.1);
	triggerFx (fxObj2);
	b2 moveZ(50,0.1);
	triggerFx (fxObj3);
	b3 moveZ(50,0.1);
	triggerFx (fxObj4);
	b4 moveZ(50,0.1);
	wait 3;
	b1 delete();
	b2 delete();
	b3 delete();
	b4 delete();
    wait 1;
}
trap9_2()
{
	t5 = getEnt( "t5", "targetname");
	t6 = getEnt( "t6", "targetname");
	t7 = getEnt( "t7", "targetname");
	t8 = getEnt( "t8", "targetname");
	b5 = getEnt( "b5", "targetname");
	b6 = getEnt( "b6", "targetname");
	b7 = getEnt( "b7", "targetname");
	b8 = getEnt( "b8", "targetname");
	l5 = getEnt( "l5", "targetname" );
	l6 = getEnt( "l6", "targetname" );
	l7 = getEnt( "l7", "targetname" );
	l8 = getEnt( "l8", "targetname" );
	t = getEnt( "trap6_2", "targetname" );
	wait 1;
	
	t5 enablelinkto();
	t5 linkto(b5); 
	t6 enablelinkto();
	t6 linkto(b6); 
	t7 enablelinkto();
	t7 linkto(b7); 
	t8 enablelinkto();
	t8 linkto(b8); 
	wait 1;
	b5 moveZ(-50,0.1);
	wait 1;
	b6 moveZ(-50,0.1);
	wait 1;
	b7 moveZ(-50,0.1);
	wait 1;
	b8 moveZ(-50,0.1);
	
	fxObj1 = SpawnFx( level.laz, l5.origin);
	fxObj2 = SpawnFx( level.laz, l6.origin);
	fxObj3 = SpawnFx( level.laz, l7.origin);
	fxObj4 = SpawnFx( level.laz, l8.origin);
	wait 1;

	t setHintString("^2Activate!");
	t waittill("trigger", player);
	t setHintString("^1Activated.");
	player braxi\_rank::giveRankXp( "trap_activation" );
	triggerFx (fxObj1);
	b5 moveZ(50,0.1);
	triggerFx (fxObj2);
	b6 moveZ(50,0.1);
	triggerFx (fxObj3);
	b7 moveZ(50,0.1);
	triggerFx (fxObj4);
	b8 moveZ(50,0.1);
	wait 3;
	b5 delete();
	b6 delete();
	b7 delete();
	b8 delete();
    wait 1;
}
trap9_3()
{
	t9 = getEnt( "t9", "targetname");
	t10 = getEnt( "t10", "targetname");
	t11 = getEnt( "t11", "targetname");
	b9 = getEnt( "b9", "targetname");
	b10 = getEnt( "b10", "targetname");
	b11 = getEnt( "b11", "targetname");
	l9 = getEnt( "l9", "targetname" );
	l10 = getEnt( "l10", "targetname" );
	l11 = getEnt( "l11", "targetname" );
	t = getEnt( "trap6_3", "targetname" );
	wait 1;
	
	t9 enablelinkto();
	t9 linkto(b9); 
	t10 enablelinkto();
	t10 linkto(b10); 
	t11 enablelinkto();
	t11 linkto(b11); 
	wait 1;
	b9 moveZ(-50,0.5);
	wait 1;
	b10 moveZ(-50,0.5);
	wait 1;
	b11 moveZ(-50,0.5);
	
	fxObj1 = SpawnFx( level.laz, l9.origin);
	fxObj2 = SpawnFx( level.laz, l10.origin);
	fxObj3 = SpawnFx( level.laz, l11.origin);
	wait 1;

	t setHintString("^2Activate!");
	t waittill("trigger", player);
	t setHintString("^1Activated.");
	player braxi\_rank::giveRankXp( "trap_activation" );
	triggerFx (fxObj1);
	b9 moveZ(50,0.1);
	triggerFx (fxObj2);
	b10 moveZ(50,0.1);
	triggerFx (fxObj3);
	b11 moveZ(50,0.1);
	wait 3;
	b9 delete();
	b10 delete();
	b11 delete();
    wait 1;
}	
trap10()
{
	a = getent ("tr10_act","targetname");
	r = getent ("roller","targetname");
	a setHintString("^2Roll");
	a waittill ("trigger",player);
	a setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "trap_activation" );
	while(1)
	{
	r rotateRoll(360,6,3,3);
	wait 10;
	r rotateyaw(-180,4,2,2);
	wait 7;
	}
}
addTestClients()
{
	setDvar("scr_testclients", "");
	wait 1;
	for(;;)
	{
		if(getdvarInt("scr_testclients") > 0)
			break;
		wait 1;
	}
	testclients = getdvarInt("scr_testclients");
	setDvar( "scr_testclients", 0 );
	for(i=0;i<testclients;i++)
	{
		ent[i] = addtestclient();

		if (!isdefined(ent[i]))
		{
			println("Could not add test client");
			wait 1;
			continue;
		}
		ent[i].pers["isBot"] = true;
		ent[i] thread TestClient("autoassign");
	}
	thread addTestClients();
}

TestClient(team)
{
	self endon( "disconnect" );

	while(!isdefined(self.pers["team"]))
		wait .05;
		
	self notify("menuresponse", game["menu_team"], team);
	wait 0.5;
}
endj()
{
    level.jump = getent ("endjump","targetname");
	level.pj = getent ("pjump","targetname");
	level.aj = getent ("ajump","targetname");
	level.jump setHintString("^2JUMP!");
	level.jump waittill ("trigger",player);
	iprintlnbold ("^2"+player.name+" ^7Choose Jump Room");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.knife delete();
	level.sniper delete();
	level.classic delete();
	level.slide delete();
	player TakeAllWeapons();
	player setOrigin( level.pj.origin );
	player setPlayerangles( level.pj.angles );
	player GiveWeapon( "knife_mp" );
    level.activ TakeAllWeapons();	
	level.activ setOrigin( level.aj.origin );
	level.activ setPlayerangles( level.aj.angles );	
	level.activ GiveWeapon( "knife_mp" );
	wait 0.05;
	player switchToWeapon( "knife_mp" );
	level.activ switchToWeapon( "knife_mp" );
	ambientStop(1.5);
	wait 1.5;
	ambientPlay("silence");
	for(;;)
	{
	level.jump waittill ("trigger",player);
	player setOrigin( level.pj.origin );
	player setPlayerangles( level.pj.angles );
	player TakeAllWeapons();
	iprintln(player.name + " ^3Entered Jump!");
	player braxi\_rank::giveRankXp( "trap_activation" );
	player GiveWeapon( "knife_mp" );	
	wait 0.05;
	player switchToWeapon( "knife_mp" );
	}
	
}
wjump()
{
	a = getent ("wjumper","targetname");
	a setHintString("???");
	a waittill ("trigger",player);
	
	x = 1+RandomInt(3);
gun = GetRandomWeapon( x );
player GiveWeapon( gun );
wait 0.5;
player SwitchToWeapon( gun );
player freezeControls( true);
air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,3);
			wait 3;
			player freezeControls( false);
			player unlink();
			air delete();
}
GetRandomWeapon( num )
{
	if( num == 2 )
		return "knife_mp";
	else
	{
		x = RandomInt( 51 );
		if( x < 10 )
			return "winchester1200_mp";
		if( x > 9 && x < 20 )
			return "skorpion_mp";
		if( x > 20 && x < 30 )
			return "m4_mp";
		if( x > 30 && x < 40 )
			return "g3_mp";
		if( x > 40 && x < 50 )
			return "ak47_mp";
		if( x == 50 )
			return "rpd_mp";
	}
}
rjump()
{
a2 = getent ("rjump","targetname");
	for(;;)
	{
	a2 waittill ("trigger",player);
	
	if( player.pers["team"] != "spectator" )
{
if( player.pers["team"] == "allies" )
{
	player SetPlayerAngles(level.pj.angles);
	player SetOrigin(level.pj.origin);
}

if( player.pers["team"] == "axis" )
{
	player SetPlayerAngles(level.aj.angles);
	player SetOrigin(level.aj.origin);
}

}
}
}
endk()
{
    level.knife = getent ("endknife","targetname");
	ori = getent ("pknife","targetname");
	ori2 = getent ("aknife","targetname");
	level.knife setHintString("^2KNIFE!");
	level.knife waittill ("trigger",player);
	iprintlnbold ("^2"+player.name+" ^7Choose Knife Room");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.jump delete();
	level.sniper delete();
	level.classic delete();
	level.slide delete();
	player TakeAllWeapons();
	player setOrigin( ori.origin );
	player setPlayerangles( ori.angles );
	player GiveWeapon( "knife_mp" );
    level.activ TakeAllWeapons();	
	level.activ setOrigin( ori2.origin );
	level.activ setPlayerangles( ori2.angles );	
	level.activ GiveWeapon( "knife_mp" );
	wait 0.5;
	player switchToWeapon( "knife_mp" );
	level.activ switchToWeapon( "knife_mp" );
ambientStop(1.5);
	wait 1.5;
	ambientPlay("silence");
	for(;;)
	{
	level.knife waittill ("trigger",player);
	player setOrigin( ori.origin );
	player setPlayerangles( ori.angles );
	player TakeAllWeapons();
	iprintln(player.name + " ^3Entered Knife!");
	player braxi\_rank::giveRankXp( "trap_activation" );
	player GiveWeapon( "knife_mp" );
	wait 0.05;	
	player switchToWeapon( "knife_mp" );
	}
	
}
endsn()
{
    level.sniper = getent ("endsniper","targetname");
	level.psn = getent ("psniper","targetname");
	level.asn = getent ("asniper","targetname");
	level.sniper setHintString("^2SNIPER!");
	level.sniper waittill ("trigger",player);
	iprintlnbold ("^2"+player.name+" ^7Choose Sniper Room");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.knife delete();
	level.jump delete();
	level.classic delete();
	level.slide delete();
	player TakeAllWeapons();
	player setOrigin( level.psn.origin );
	player setPlayerangles( level.asn.angles );
	player thread weps();
    level.activ TakeAllWeapons();	
	level.activ setOrigin( level.asn.origin );
	level.activ setPlayerangles( level.asn.angles );	
	level.activ thread weps();
ambientStop(1.5);
	wait 1.5;
	ambientPlay("silence");
	for(;;)
	{
	level.sniper waittill ("trigger",player);
	player setOrigin( level.psn.origin );
	player setPlayerangles( level.psn.angles );
	player TakeAllWeapons();
	iprintln(player.name + " ^3Entered Sniper!");
	player braxi\_rank::giveRankXp( "trap_activation" );
	player thread weps();
	wait 0.05;
	}
	
}
weps()
{

self giveweapon( "remington700_mp");
	self giveweapon( "m40a3_mp"); 
    self GiveMaxAmmo("m40a3_mp");	
	self GiveMaxAmmo("remington700_mp");
	wait 0.5;
	self switchToWeapon( "m40a3_mp" );
}	

rsniper()
{
	a2 = getent ("rsniper","targetname");
	ori3 = getent ("rsniper2","targetname");
	for(;;)
	{
	a2 waittill ("trigger",player);
	
	if( player.pers["team"] != "spectator" )
{
if( player.pers["team"] == "allies" )
{
	player SetPlayerAngles(level.psn.angles);
	player SetOrigin(level.psn.origin);
}

if( player.pers["team"] == "axis" )
{
	player SetPlayerAngles(level.asn.angles);
	player SetOrigin(level.asn.origin);
}

}
}
}	
endc()
{
    level.classic = getent ("classic","targetname");
	ori = getent ("pclassic","targetname");
	ori2 = getent ("aclassic","targetname");
	level.classic setHintString("^2Old Way");
	level.classic waittill ("trigger",player);
	iprintlnbold ("^2"+player.name+" ^7Choose the Old Way");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.sniper delete();
	level.knife delete();
	level.jump delete();
	level.slide delete();
	player setOrigin( ori.origin );
	player setPlayerangles( ori.angles );	
	level.activ setOrigin( ori2.origin );
	level.activ setPlayerangles( ori2.angles );	
ambientStop(1.5);
	wait 1.5;
	ambientPlay("silence");
	for(;;)
	{
	level.classic waittill ("trigger",player);
	player setOrigin( ori.origin );
	player setPlayerangles( ori.angles );
    iprintln(player.name + " ^3Entered Old!");	
	player braxi\_rank::giveRankXp( "trap_activation" );
	wait 0.05;
	}
	
}		
fin()
{
   f1 = getent ("fin1" ,"targetname");
   f2 = getent ("fin2" ,"targetname");
   f3 = getent ("fin3" ,"targetname");
   f4 = getent ("fin4" ,"targetname");
   f5 = getent ("fin5" ,"targetname");
   while(1)
   {
   x = RandomInt(5);
	if( x == 0 )
		{
		PlayFX( level.fin, f1.origin);
		}
	if( x == 1 )
		{
		PlayFX( level.fin, f2.origin);
		}
		if( x == 2 )
		{
		PlayFX( level.fin, f3.origin);
		}
		if( x == 3 )
		{
		PlayFX( level.fin, f4.origin);
		}
		if( x == 4 )
		{
		PlayFX( level.fin, f5.origin);
		}
      wait 0.5;
}
}
as()
{
  weap = getent ("assault" ,"targetname");
  
  for(;;)
  {
  weap waittill ("trigger",player);
  player TakeAllWeapons();
  player GiveWeapon( "ak47_mp" );
  player GiveMaxAmmo("ak47_mp");
	wait 0.05;
  player switchToWeapon( "ak47_mp" );
  }
 }
spec()
{
  weap = getent ("spec" ,"targetname");
  
  for(;;)
  {
  weap waittill ("trigger",player);
  player TakeAllWeapons();
    player GiveWeapon( "ak74u_mp" );
  player GiveMaxAmmo("ak74u_mp");
	wait 0.05;
  player switchToWeapon( "ak74u_mp" );
  }
 }
demo()
{
  weap = getent ("demo" ,"targetname");
  
  for(;;)
  {
  weap waittill ("trigger",player);
  player TakeAllWeapons();
  player GiveWeapon( "winchester1200_mp" );
  player GiveMaxAmmo("winchester1200_mp");
	wait 0.05;
  player switchToWeapon( "winchester1200_mp" );
  }
 }
lmg()
{
  weap = getent ("lmg" ,"targetname");
  
  for(;;)
  {
  weap waittill ("trigger",player);
  player TakeAllWeapons();
   player GiveWeapon( "saw_mp" );
  player GiveMaxAmmo("saw_mp");
	wait 0.05;
  player switchToWeapon( "saw_mp" );
  }
 }
 pistol()
{
  weap = getent ("pistol" ,"targetname");
  
  for(;;)
  {
  weap waittill ("trigger",player);
  player TakeAllWeapons();
   player GiveWeapon( "deserteagle_mp" );
  player GiveMaxAmmo("deserteagle_mp");
	wait 0.05;
  player switchToWeapon( "deserteagle_mp" );
  }
 }
endslide()
{
    level.slide = getent ("endsilde","targetname");
	level.psl = getent ("pslide","targetname");
	level.asl = getent ("aslide","targetname");
	level.slide setHintString("^2SLIDE!");
	level.slide waittill ("trigger",player);
	iprintlnbold ("^2"+player.name+" ^7Choose Surf Room");
	player braxi\_rank::giveRankXp( "trap_activation" );
	level.knife delete();
	level.jump delete();
	level.sniper delete();
	level.classic delete();
	player TakeAllWeapons();
	player SetMoveSpeedScale( 5 );
	player setOrigin( level.psl.origin );
	player setPlayerangles( level.psl.angles );
	player thread weps3();
    level.activ TakeAllWeapons();
    level.activ SetMoveSpeedScale( 5 );	
	level.activ setOrigin( level.asl.origin );
	level.activ setPlayerangles( level.asl.angles );	
	level.activ thread weps3();
ambientStop(1.5);
	wait 1.5;
	ambientPlay("silence");
	for(;;)
	{
	level.slide waittill ("trigger",player);
	player setOrigin( level.psl.origin );
	player setPlayerangles( level.psl.angles );
	player TakeAllWeapons();
	iprintln(player.name + " ^3Entered Slide!");
	player braxi\_rank::giveRankXp( "trap_activation" );
	player thread weps3();
	wait 0.05;
	}
	
}
weps3()
{

self giveweapon( "winchester1200_mp");
    self GiveMaxAmmo("winchester1200_mp");	
	wait 0.5;
	self switchToWeapon( "winchester1200_mp" );
	self SetMoveSpeedScale( 3.5 );
}	
surfwaypt1()
{
    start1 = getent ("slide_trig","targetname");
	start2 = getent ("slide_start","targetname");
	
	for(;;)
	{
	start1 waittill ("trigger",player);
	player setOrigin( start2.origin );
	player SetMoveSpeedScale( 7 );
	wait 0.5;
	}
}	
surfwaypt2()
{
	end1 = getent ("slide_exit","targetname");
	end2 = getent ("pweapon","targetname");
	
	for(;;)
	{
	end1 waittill ("trigger",player);
	player freezeControls( true );
	player setOrigin( end2.origin );
	player SetMoveSpeedScale( 1 );
	wait 1;
	player freezeControls( false);
	wait 0.5;
	}
}	
surfwaypt3()
{
	end1 = getent ("wep_exit","targetname");
	end2 = getent ("slide_exit2","targetname");
	
	for(;;)
	{
	end1 waittill ("trigger",player);
	player freezeControls( true );
	player setOrigin( end2.origin );
	player SetMoveSpeedScale( 1 );
	wait 1;
	player freezeControls( false);
	wait 0.5;
	iprintln(player.name + " ^1Finished Secret!");
	player braxi\_rank::giveRankXp( "trap_activation" );
	}
}
