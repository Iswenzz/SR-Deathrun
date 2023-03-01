//Map by #FNRP#ABprice


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
	
	precacheItem("deserteaglegold_mp");
	precacheItem("deserteagle_mp");
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("ak47_acog_mp");
	precacheItem("rpg_mp");
	precacheItem("winchester1200_mp");
	precacheItem("pricedeagle_mp");
	precacheItem("m14_acog_mp");
	precacheItem("p90_mp");
	precacheModel("fox_batgirl");
	precacheModel("lara_croft_cod4");
	precacheModel("playermodel_bo2_cordis_sniper");
	
	//misc
	thread messages();
	thread music();
	thread bottomtext();
	thread npc();
	thread rpg_ammo();
	thread arrow();
	thread price();
	
	//vip
	thread vip_100();
	thread vip_100_2();
	thread vip_80();
	
	//traps
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
	//elevators
	thread ele1();
	thread ele2();
	//teleporters
	thread tele1();
	thread tele2();
	thread tele3();
	thread tele4();
	thread tele5();
	thread tele6();
	thread tele7();
	thread tele8();
	thread tele9();
	thread tele10();
	thread tele11();
	thread tele12();
	thread tele13();
	thread tele14();
	thread tele15();
	thread tele16();
	thread tele17();
	thread tele18();
	thread tele19();
	thread tele20();
	//rooms
	thread knife_room();
	thread sniper_room();
	thread shotgun_room();
	thread rpg_room();
	
	
	
	
	
	
	addTriggerToList( "trig_trap1" );
	addTriggerToList( "trig_trap2" );
	addTriggerToList( "trig_trap3" );
	addTriggerToList( "trig_trap4" );
	addTriggerToList( "trig_trap5" );
	addTriggerToList( "trig_trap6" );
	addTriggerToList( "trig_trap7" );
	addTriggerToList( "trig_trap8" );
	addTriggerToList( "trig_trap9" );
	addTriggerToList( "trig_trap10" );
	addTriggerToList( "trig_trap11" );
	addTriggerToList( "trig_trap12" );

}

messages()
{
wait 10;
iprintlnBold("^9Welcome To The ^3FNRP_ab_v4^1, ^5Map By #FNRP#ABprice");
wait 3;
iprintlnBold("^6Thanks To ^3VC' Fox ^6For Helping Me");
wait 1;
}

bottomtext()
{
	level waittill("round_started");
	while(1)
	{
	wait 10;
	iPrintLn("^3Welcome to mp_dr_fnrp_ab_v4!");
	wait 10;
	iPrintLn("^5Map By ^3#FNRP#ABprice");
	wait 5;
	iPrintLn("^5Hope You Enjoy");
	wait 5;
	iPrintLn("^5Every Gap And Bounce Tested");
	wait 5;
	iPrintLn("^5Any Bug? Send Me Pm On FNRP Forms");
	wait 10;
	iPrintLn("^5There is ^11 ^5Secret on this map!");
	wait 10;
	iPrintLn("^6Custom Weapons And Player Models By VC' Fox");
	wait 10;
	iPrintLn("^6Thanks To ^5VC' Fox ^6For Helping Me");
	wait 10;
	iPrintLn("^6Thanks To ^5NitroFire ^6For Helping Me");
	wait 10;
	iPrintLn("^6Thanks To Testers ^5  #FNRP#Lucifer , #FNRP#kLeiN , #FNRP#XposeD , Cryptiic<3");
	wait 10;
	iPrintLn("^6Thanks To All ^3FNRP ^6Members");
	wait 10;
	iPrintLn("^3www.fnrp-servers.com");
	}
	
}

music()
{
x = randomint(4);

	if(x == 0)
	{
	ambientplay("AB_V4_1");
	}
	if(x == 1)
	{
	ambientplay("AB_V4_2");
	}	
	if(x == 2)
	{
	ambientplay("AB_V4_3");
	}
	if(x == 3)
	{
	ambientplay("AB_V4_4");
	}
}


npc()
{
	trig = getent("dmg_secret", "targetname");
	acti = getent("secret_enter", "targetname");
	platform = getent("npc_platform", "targetname");
	box = getent("box_npc", "targetname");
	trig waittill("trigger", player);
	
	acti enablelinkto ();
	acti linkto (platform);
	
	iPrintlnBold( " ^5" + player.name + " ^3 pressed Secret Button!^9NPC Spawned" );
	platform moveZ (136,0.5);
	box delete();

	trig delete();
}




rpg_ammo()
{
    trig = getEnt("rpg_ammo", "targetname");
    trig waittill("trigger", who);

    for(;;)
    {
     who giveMaxAmmo("rpg_mp");
     wait 0.1;
    }
}

arrow()
{
	brush = getEnt("arrow", "targetname");
	level waittill("round_started");
	for(;;)
    {
      brush moveZ (-50,2);
	  brush rotateYaw (360,2);
	  wait 2;
	  brush moveZ (50,2);
	  brush rotateYaw (-360,2);
	  wait 2;
    }
}

price()
{
    trigger = getEnt("price", "targetname");
	trigger SetHintString("^7 Press ^3F ^7To Take ^6Guns");
    precacheItem("deserteagle_mp");
	precacheItem("pricedeagle_mp");
    while(1)
    {
    trigger waittill("trigger", player);
    player GiveWeapon("deserteaglegold_mp");
    player SwitchToWeapon( "pricedeagle_mp" );
	player GiveWeapon("pricedeagle_mp");
	
    }
}

//vip


vip_100()
{
    trig = getent("vip_100", "targetname");
    trig waittill("trigger", player);
    if(player getGuid() == "00000000fe7553267038fb7bdd6115df")
{
    player.vip = true;
    player giveWeapon("m14_acog_mp");
    player giveMaxAmmo("m14_acog_mp");
    player switchToWeapon("m14_acog_mp");
    player detachAll(); //need this to prevent 128 bones error
    player setModel("lara_croft_cod4");
	player iPrintlnBold( "^3You received Your Vip Kit!" );
	player braxi\_rank::giveRankXP("", 100);
    wait 0.1;
}
    else
{
    player.vip = false;
    wait 0.1;
}
}

vip_100_2()
{
    trig = getent("vip_100_2", "targetname");
    trig waittill("trigger", player);
    if(player getGuid() == "5dcce639cbef05e4f9b739a0ab61c6e4")
{
    player.vip = true;
    player giveWeapon("m14_acog_mp");
    player giveMaxAmmo("m14_acog_mp");
    player switchToWeapon("m14_acog_mp");
    player detachAll(); //need this to prevent 128 bones error
    player setModel("fox_batgirl");
	player iPrintlnBold( "^3You received Your Vip Kit!" );
	player braxi\_rank::giveRankXP("", 100);
    wait 0.1;
}
    else
{
    player.vip = false;
    wait 0.1;
}
}


vip_80()
{
   trig = getent("vip_80", "targetname");
    trig waittill("trigger", player);
   if(player getGuid() == "000000002a39fdb400fa5ab43619ed0f" /*xposed*/ || player getGuid() == "927c6b09362f1286d4bf45ab4fc4876b" /*insane*/ || player getGuid() == "60e8f2037ef016f7452ce04ca3595553" /*klein*/ || player getGuid() == "00000000ef6c07a0edf117f6928dd1c2" /*luci*/ || player getGuid() == "0000000005c1d657bdb33c305d15b996" /*saad*/ || player getGuid() == "6062d2f87dc3cc4f5b5d581ad91b0125"  /*metro*/ || player getGuid() == "1136665c579119b330ce1d69a601441a" ) /*Cryptiic*/
{
    player.vip = true;
    player giveWeapon("p90_mp");
    player giveMaxAmmo("p90_mp");
    player switchToWeapon("p90_mp");
    player detachAll(); //need this to prevent 128 bones error
    player setModel("playermodel_bo2_cordis_sniper");
	player iPrintlnBold( "^3You received Your Vip Kit!" );
	player braxi\_rank::giveRankXP("", 50);
    wait 0.1;
}
   else
{
  player.vip = false;
  wait 0.1;
}
}

//Traps
trap1()
{
     brush = getEnt("trap1", "targetname");
	 brush2 = getEnt("trap1_2", "targetname");
	 trig = getent("trig_trap1", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();
	 brush2 delete();

    for(;;)
    {
	brush moveZ (-30,2);
	wait 3;
	brush moveZ (30,2);
	wait 3;
    }
}


trap2()
{
     brush = getEnt("trap2_1", "targetname");
	 brush2 = getEnt("trap2_2", "targetname");
	 trig = getEnt("trig_trap2", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateYaw (360,1);
	brush2 rotateYaw (360,1);
	wait 1;
    }
}

trap3()
{
     brush = getEnt("trap3", "targetname");
	 trig = getEnt("trig_trap3", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateroll (360,3);
	wait 5;
    }
}


trap4()
{
    platform1 = getent("trap4", "targetname");
    trig = getent("trig_trap4", "targetname");
	trig SetHintString("Press ^5[F] ^2To Activate");
	trig waittill("trigger", player);
	
	platform1 delete();
	player braxi\_rank::giveRankXP("", 30);
	
	trig delete();
	} 
	 
trap5()
{
     brush = getEnt("trap5", "targetname");
	 trig = getEnt("trig_trap5", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateroll (360,3);
	wait 3;
    }
}

trap6()
{
     brush = getEnt("trap6", "targetname");
	 trig = getEnt("trig_trap6", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateYaw (180,2);
	wait 3;
	brush rotateYaw (-180,2);
	wait 3;
    }
}	 

trap7()
{
     brush = getEnt("trap7", "targetname");
	 trig = getEnt("trig_trap7", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateYaw (360,5);
	wait 0.1;
    }
}


trap8()
{
     brush = getEnt("trap8_1", "targetname");
	 brush2 = getEnt("trap8_2", "targetname");
	 trig = getEnt("trig_trap8", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateYaw (360,1);
	brush2 rotateYaw (360,1);
	wait 3;
    }
}


trap9()
{
    platform1 = getent("trap9", "targetname");
    trig = getent("trig_trap9", "targetname");
	trig SetHintString("Press ^5[F] ^2To Activate");
	trig waittill("trigger", player);
	
	platform1 moveY (1168,3);
	player braxi\_rank::giveRankXP("", 30);
	
	trig delete();
	}
	
	
trap10()
{
	platform = getEnt("trap10_1","targetname");
	platform2 = getEnt("trap10_2","targetname");
	platform3 = getEnt("trap10_3","targetname");
	platform4 = getEnt("trap10_4","targetname");
	kill = getEnt("kill_1","targetname");
	kill2 = getEnt("kill_2","targetname");
	kill3 = getEnt("kill_3","targetname");
	kill4 = getEnt("kill_4","targetname");
	
	kill enablelinkto ();
	kill linkto (platform);
	kill2 enablelinkto ();
	kill2 linkto (platform2);
	kill3 enablelinkto ();
	kill3 linkto (platform3);
	kill4 enablelinkto ();
	kill4 linkto (platform4);
	
	
	
    trig = getEnt("trig_trap10","targetname");
    trig SetHintString("^2Press ^5[F] ^2To Activate");
    trig waittill("trigger", player);
	
    player braxi\_rank::giveRankXP("", 30);
    trig delete();
	
	for(;;)
	{
	platform moveZ (-296,0.3);
	wait 0.5;
	platform moveZ (296,3);
	wait 1;
	platform2 moveZ (-296,0.3);
	wait 0.5;
	platform2 moveZ (296,3);
	wait 1;
	platform3 moveZ (-296,0.3);
	wait 0.5;
	platform3 moveZ (296,3);
	wait 1;
	platform4 moveZ (-296,0.3);
	wait 0.5;
	platform4 moveZ (296,3);
	wait 1;
	}
	
}
 
 
 trap11()
{
    platform1 = getent("trap11", "targetname");
    trig = getent("trig_trap11", "targetname");
	trig SetHintString("Press ^5[F] ^2To Activate");
	trig waittill("trigger", player);
	
	platform1 delete();
	player braxi\_rank::giveRankXP("", 30);
	
	trig delete();
	} 
	
	
trap12()
{
     brush = getEnt("trap12_1", "targetname");
	 brush2 = getEnt("trap12_2", "targetname");
	 trig = getEnt("trig_trap12", "targetname");
	 trig SetHintString("^2Press ^5[F] ^2To Activate");
     trig waittill("trigger", player);
	 
     player braxi\_rank::giveRankXP("", 30);
     trig delete();

    for(;;)
    {
	brush rotateroll (360,1);
	brush2 rotateroll (-360,1);
	wait 3;
	brush rotateroll (-360,1);
	brush2 rotateroll (360,1);
    }
}


//Elevators

ele1()
{
	platform = getEnt("ele1","targetname");
    trig = getEnt("trig_ele1","targetname");
    trig waittill("trigger", player);
	
	trig delete();
	
	for(;;)
	{
	wait 1;
	platform movex (1166,3);
	wait 5;
	platform movex (-1166,3);
	wait 4;
	}
}


ele2()
{
	platform1 = getEnt("ele2_1","targetname");
	platform2 = getEnt("ele2_2","targetname");
	trig = getEnt("trig_ele2","targetname");
    trig waittill("trigger", player);
	
	trig delete();
	

	
	for(;;)
	{
	wait 1;
	platform1 moveX (888,3);
	platform2 moveX (-888,3);
	wait 4;
	platform1 movez (-200,3);
	platform2 movez (200,3);
	wait 4;
	platform1 moveX (-888,3);
	platform2 moveX (888,3);
	wait 4;
	platform1 movez (200,3);
	platform2 movez (-200,3);
	wait 3;
	}
}
 //Teleporters
 
 
 tele1()
{    
     trig = getEnt("tele1", "targetname");
	 tele = getEnt("origin_tele1", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^3Stage 1 ,Go!");
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}


 tele2()
{    
     trig = getEnt("tele2", "targetname");
	 tele = getEnt("origin_tele2", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^1Stage 2 ,Keep Runing!");
		 player setorigin(tele.origin);
		  player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

 tele3()
{    
     trig = getEnt("tele3", "targetname");
	 tele = getEnt("origin_tele3", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^2Stage 3 ,Dont Look Back. Run!");
		 player setorigin(tele.origin);
		  player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}


 tele4()
{    
     trig = getEnt("tele4", "targetname");
	 tele = getEnt("origin_tele4", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^3Stage 4 ,Almost Done!");
		 player setorigin(tele.origin);
		  player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}


 tele5()
{    
     trig = getEnt("tele5", "targetname");
	 tele = getEnt("origin_tele5", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^1Stage 5 ,We are Here Dont Fall Now!");
		 player setorigin(tele.origin);
		  player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}


 tele6()
{    
     trig = getEnt("tele6", "targetname");
	 tele = getEnt("origin_tele6", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player iprintlnbold("^4The End ,Choose Room And Kill That Activator!");
		 player setorigin(tele.origin);
		  player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele7()
{    
     trig = getEnt("tele7", "targetname");
	 tele = getEnt("origin_tele7", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele8()
{    
     trig = getEnt("tele8", "targetname");
	 tele = getEnt("origin_tele8", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}


tele9()
{    
     trig = getEnt("tele9", "targetname");
	 tele = getEnt("origin_tele9", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele10()
{    
     trig = getEnt("tele10", "targetname");
	 tele = getEnt("origin_tele10", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele11()
{    
     trig = getEnt("tele11", "targetname");
	 tele = getEnt("origin_tele11", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele12()
{    
     trig = getEnt("tele12", "targetname");
	 tele = getEnt("origin_tele12", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
         player braxi\_rank::giveRankXP("", 333);
		 //Remove Timer
		 player notify("tele12");
		 player.secretTimer destroy();
		 //<----------------------->\\
		 iPrintlnBold( " ^5" + player.name + " ^3 Finish The Secret!" );
	 }
}


tele13()
{    
     trig = getEnt("secret_enter", "targetname");
	 tele = getEnt("origin_secret", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player thread secret_timer();
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
		 player iPrintlnBold( "^3 Welcome To The Secret!" );
	 }
}


tele14()
{    
     trig = getEnt("acti_secret", "targetname");
	 tele = getEnt("origin_actisecret", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
		 player iPrintlnBold( "^3 Welcome To The Secret!" );
	 }
}

tele15()
{    
     trig = getEnt("acti_secret_fall", "targetname");
	 tele = getEnt("origin_actisecret", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele16()
{    
     trig = getEnt("acti_secret_finish", "targetname");
	 tele = getEnt("origin_acti_finish", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
         player braxi\_rank::giveRankXP("", 333);
		 iPrintlnBold( " ^5" + player.name + " ^6 Finish The Acti Secret!" );
	 }
}

tele17()
{    
     trig = getEnt("tele17", "targetname");
	 tele = getEnt("origin_tele17", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele18()
{    
     trig = getEnt("tele18", "targetname");
	 tele = getEnt("origin_tele18", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele19()
{    
     trig = getEnt("tele19", "targetname");
	 tele = getEnt("origin_tele19", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}

tele20()
{    
     trig = getEnt("tele20", "targetname");
	 tele = getEnt("origin_tele20", "targetname");
	 
	 for(;;)
	 {
		 trig waittill("trigger", player);
		 player setorigin(tele.origin);
		 player freezeControls(1);
         wait 0.02;
         player freezeControls(0);
	 }
}
//Rooms

knife_room()
{
	while(1)
	{
	level.trigknife = getEnt("trig_kniferoom", "targetname");
	level.trigsniper = getEnt("trig_sniperroom", "targetname");
	level.trigrpg = getEnt("trig_rpgroom", "targetname");
	level.trigshotgun = getEnt("trig_shotgunroom", "targetname");
	
	jumporigin = getEnt("sf_1", "targetname");
	actiorigin = getEnt("sf_2", "targetname");
	
	level.trigknife waittill("trigger", player);
	if(!player sr\api\_deathrun::order())
		continue;
	level.trigsniper delete();
	level.trigrpg delete();
	level.trigshotgun delete();
	
	iPrintLnBold("^2 " + player.name + " ^3Entered The ^5knife ^5Room^2!");
	player.health = player.maxhealth;
	level.activ.health = level.activ.maxhealth;
	
	
	player takeAllWeapons();
	level.activ takeAllWeapons();
	
	player giveWeapon("knife_mp");
	player giveWeapon("knife_mp");
	player giveMaxAmmo("knife_mp");
	player giveMaxAmmo("knife_mp");
	level.activ giveWeapon("knife_mp");
	level.activ giveWeapon("knife_mp");
	level.activ giveMaxAmmo("knife_mp");
	level.activ giveMaxAmmo("knife_mp");
	
	
	player switchToWeapon("knife_mp");
	player switchToWeapon("knife_mp_mp");
	level.activ switchToWeapon("knife_mp");
	player switchToWeapon("knife_mp");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	wait 2;
	
	player iPrintLnBold("^13");
	level.activ iPrintLnBold("^13");
	wait 1;
	player iPrintLnBold("^52");
	level.activ iPrintLnBold("^52");
	wait 1;
	player iPrintLnBold("^21");
	level.activ iPrintLnBold("^21");
	wait 1;
	player iPrintLnBold("^5Kill That Activator^2!");
	level.activ iPrintLnBold("^5Kill That Jumper^2!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	while( isAlive( player ) && isDefined( player ) )
    wait 1;
	

	}
}


sniper_room()
{
	while(1)
	{
	level.trigsniper = getEnt("trig_sniperroom", "targetname");
	level.trigknife = getEnt("trig_kniferoom", "targetname");
	level.trigrpg = getEnt("trig_rpgroom", "targetname");
	level.trigshotgun = getEnt("trig_shotgunroom", "targetname");
	
	jumporigin = getEnt("sf_3", "targetname");
	actiorigin = getEnt("sf_4", "targetname");
	
	level.trigsniper waittill("trigger", player);
	if(!player sr\api\_deathrun::order())
		continue;
	level.trigknife delete();
	level.trigrpg delete();
	level.trigshotgun delete();
	
	iPrintLnBold("^2 " + player.name + " ^3Entered The ^5Sniper ^5Room^2!");
	player.health = player.maxhealth;
	level.activ.health = level.activ.maxhealth;
	
	
	player takeAllWeapons();
	level.activ takeAllWeapons();
	
	player giveWeapon("m40a3_mp");
	player giveWeapon("remington700_mp");
	player giveMaxAmmo("remington700_mp");
	player giveMaxAmmo("m40a3_mp");
	level.activ giveWeapon("m40a3_mp");
	level.activ giveWeapon("remington700_mp");
	level.activ giveMaxAmmo("remington700_mp");
	level.activ giveMaxAmmo("m40a3_mp");
	
	
	player switchToWeapon("m40a3_mp");
	player switchToWeapon("m40a3_mp");
	level.activ switchToWeapon("m40a3_mp");
	player switchToWeapon("m40a3_mp");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	wait 2;
	
	player iPrintLnBold("^13");
	level.activ iPrintLnBold("^13");
	wait 1;
	player iPrintLnBold("^52");
	level.activ iPrintLnBold("^52");
	wait 1;
	player iPrintLnBold("^21");
	level.activ iPrintLnBold("^21");
	wait 1;
	player iPrintLnBold("^5Shoot That Activator^2!");
	level.activ iPrintLnBold("^5Shoot That Jumper^2!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	while( isAlive( player ) && isDefined( player ) )
    wait 1;
	

	}
}


shotgun_room()
{
	while(1)
	{
	level.trigshotgun = getEnt("trig_shotgunroom", "targetname");
	level.trigsniper = getEnt("trig_sniperroom", "targetname");
	level.trigknife = getEnt("trig_kniferoom", "targetname");
	level.trigrpg = getEnt("trig_rpgroom", "targetname");
	
	
	jumporigin = getEnt("sf_5", "targetname");
	actiorigin = getEnt("sf_6", "targetname");
	
	level.trigshotgun waittill("trigger", player);
	if(!player sr\api\_deathrun::order())
		continue;
	level.trigknife delete();
	level.trigsniper delete();
	level.trigrpg delete();
	
	iPrintLnBold("^2 " + player.name + " ^3Entered The ^5Shotgun ^5Room^2!");
	player.health = player.maxhealth;
	level.activ.health = level.activ.maxhealth;
	
	
	player takeAllWeapons();
	level.activ takeAllWeapons();
	
	player giveWeapon("winchester1200_mp");
	player giveWeapon("winchester1200_mp");
	player giveMaxAmmo("winchester1200_mp");
	player giveMaxAmmo("winchester1200_mp");
	level.activ giveWeapon("winchester1200_mp");
	level.activ giveWeapon("winchester1200_mp");
	level.activ giveMaxAmmo("winchester1200_mp");
	level.activ giveMaxAmmo("winchester1200_mp");
	
	
	player switchToWeapon("winchester1200_mp");
	player switchToWeapon("winchester1200_mp");
	level.activ switchToWeapon("winchester1200_mp");
	player switchToWeapon("winchester1200_mp");
	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	wait 2;
	
	player iPrintLnBold("^13");
	level.activ iPrintLnBold("^13");
	wait 1;
	player iPrintLnBold("^52");
	level.activ iPrintLnBold("^52");
	wait 1;
	player iPrintLnBold("^21");
	level.activ iPrintLnBold("^21");
	wait 1;
	player iPrintLnBold("^5Shoot That Activator^2!");
	level.activ iPrintLnBold("^5Shoot That Jumper^2!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	while( isAlive( player ) && isDefined( player ) )
    wait 1;
	

	}
}

rpg_room()
{
	while(1)
	{
	level.trigrpg = getEnt("trig_rpgroom", "targetname");
	level.trigsniper = getEnt("trig_sniperroom", "targetname");
	level.trigknife = getEnt("trig_kniferoom", "targetname");
	level.trigshotgun = getEnt("trig_shotgunroom", "targetname");
	
	
	jumporigin = getEnt("sf_7", "targetname");
	actiorigin = getEnt("sf_8", "targetname");
	
	level.trigrpg waittill("trigger", player);
	if(!player sr\api\_deathrun::order())
		continue;
	level.trigknife delete();
	level.trigsniper delete();
	level.trigbounce delete();
	
	iPrintLnBold("^2 " + player.name + " ^3Entered The ^5Rpg ^5Room^2!");
	player.health = player.maxhealth;
	level.activ.health = level.activ.maxhealth;
	
	
	player takeAllWeapons();
	level.activ takeAllWeapons();
	
	player giveWeapon("rpg_mp");
	player giveMaxAmmo("rpg_mp");
	level.activ giveWeapon("rpg_mp");
	level.activ giveMaxAmmo("rpg_mp");
	
	
	player switchToWeapon("rpg_mp");
	level.activ switchToWeapon("rpg_mp");

	
	player freezeControls(1);
	level.activ freezeControls(1);
	
	player setOrigin (jumporigin.origin);
	player setPlayerAngles (jumporigin.angles);

	level.activ setOrigin (actiorigin.origin);
	level.activ setPlayerAngles (actiorigin.angles);
	wait 2;
	
	player iPrintLnBold("^13");
	level.activ iPrintLnBold("^13");
	wait 1;
	player iPrintLnBold("^52");
	level.activ iPrintLnBold("^52");
	wait 1;
	player iPrintLnBold("^21");
	level.activ iPrintLnBold("^21");
	wait 1;
	player iPrintLnBold("^5Blow That Activator^2!");
	level.activ iPrintLnBold("^5Blow That Jumper^2!");
	
	player freezeControls(0);
	level.activ freezeControls(0);
	while( isAlive( player ) && isDefined( player ) )
    wait 1;
	

	}
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



secret_timer() 
{
    self endon("tele12"); //end the time with secret end trigger
    

    if(isdefined(self.secretTimer))
    self.secretTimer destroy();

    self.secretTimer=newclienthudelem(self);
    self.secretTimer.foreground = true;
    self.secretTimer.alignX = "center";
    self.secretTimer.alignY = "bottom";
    self.secretTimer.horzAlign = "center";
        self.secretTimer.vertAlign = "bottom";
        self.secretTimer.x = 0;
        self.secretTimer.y = -7;
        self.secretTimer.sort = 5;
        self.secretTimer.fontScale = 1.6;
        self.secretTimer.font = "default";
        self.secretTimer.glowAlpha = 1;
        self.secretTimer.hidewheninmenu = true;
        self.secretTimer.label = &"Time in Secret: &&1";
        if(isdefined(level.randomcolor))
    self.secretTimer.glowColor=level.randomcolor;
    else 
    self.secretTimer.glowColor=(1,0,0);

    time=200;
    for(i=0;i<time;i++)
        {
        self.secretTimer setvalue(time-i);
        wait 1;
        }
    self.secretTimer setvalue(0);
    self suicide();

    if(isdefined(self.secretTimer))
    self.secretTimer destroy();
}