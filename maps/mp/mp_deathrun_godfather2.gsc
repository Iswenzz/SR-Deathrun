
main()
{

 maps\mp\_load::main();
 
 level.pikap = loadFX("fenix/pikap");
 level.exp_fx = LoadFx("explosions/vehicle_explosion_bmp");
 level.heli_fx = LoadFx("explosions/helicopter_explosion");
 level.door_fx = LoadFx("explosions/ammo_cookoff");
 level.rpd_fx = LoadFx("muzzleflashes/saw_flash_wv_b");
  
 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
 ambientPlay("ambient");
 
  setdvar( "r_specularcolorscale", "1" );
  setdvar( "r_glowbloomintensity0", ".25" );
  setdvar( "r_glowbloomintensity1", ".25" );
  setdvar( "r_glowskybleedintensity0", ".3" );
  setdvar( "compassmaxrange", "1800" );
  setDvar("bg_falldamagemaxheight", 20000 );
  setDvar("bg_falldamageminheight", 15000 );
  setdvar("dr_bunnyhoop_pro","1");
  
  precacheItem( "ak74u_mp" );
  precacheModel("body_mp_opforce_sniper");
  precacheModel("head_mp_opforce_ghillie");
  
  
   
	
	
  thread vip();
  thread onPlayerConnect();
  thread teleport();
  thread teleport1();
  thread teleport2();
  thread teleport3();
  thread teleport4();
  thread duduk();
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
  thread mover();
  thread mover1();
  thread sniper();
  thread start();
  
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
 addTriggerToList( "trap11_trig" ); 
 addTriggerToList( "trap12_trig" ); 
 addTriggerToList( "trap13_trig" ); 
 addTriggerToList( "trap14_trig" ); 
 addTriggerToList( "trap15_trig" );  
 addTriggerToList( "trap16_trig" ); 

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}	

start()
{
	thread drawInformation( 800, 0.8, 1, "Map made by Fen1x!" );
	wait 4;
	thread drawInformation( 800, 0.8, 1, "Special thanks to VC'ERIK" );
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 60 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}


mover()
{
	obj = getent("mover","targetname");
	wait 1;
	while(1)
	{
	wait 1;
	obj movey(576, 1);
	obj waittill("movedone");
	obj movey(-576, 1);
	wait 1;
	}
}

mover1()
{
	obj = getent("mover1","targetname");
	wait 1;
	while(1)
	{
	wait 1;
	obj movey(-832, 1);
	obj waittill("movedone");
	obj movey(832, 1);
	wait 1;
	}
}

trap1()
{
	trigacti = getent("trap1_trig", "targetname");
	trigacti sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap 2X");
	trigacti SetCursorHint("HINT_ACTIVATE");
	killtrig = getent ("hurt", "targetname");
	car1 = getent ("car1", "targetname");
	car2 = getent ("car2", "targetname");
	car3 = getent ("car3", "targetname");
	car4 = getent ("car4", "targetname");
	car5 = getent ("car5", "targetname");
	asd1 = getent ("car1multiple", "targetname");
	asd2 = getent ("car2multiple", "targetname");
	asd3 = getent ("car3multiple", "targetname");
	asd4 = getent ("car4multiple", "targetname");
	asd5 = getent ("car5multiple", "targetname");
	car1_clip = getent ("car1_clip", "targetname");
	car2_clip = getent ("car2_clip", "targetname");
	car3_clip = getent ("car3_clip", "targetname");
	car4_clip = getent ("car4_clip", "targetname");
	car5_clip = getent ("car5_clip", "targetname");
	killtrig maps\mp\_utility::triggerOff();
	trigacti waittill( "trigger", who ); 
	wait 0.1;

	x = RandomInt(100);
		if( x < 50 )
		{
		PlayFX( level.exp_fx, car1.origin );
		killtrig maps\mp\_utility::triggerOn();
		Earthquake( 2, 1, car1.origin, 250);
		car1 delete();
		car1_clip delete();
		wait 0.5;
		asd1 delete();
		}
		if( x > 49  )
		{
		PlayFX( level.exp_fx, car2.origin );
		killtrig maps\mp\_utility::triggerOn();
		Earthquake( 2, 1, car2.origin, 250);
		car2 delete();
		car2_clip delete();
		wait 0.5;
		asd2 delete();
		}
		car3_clip PlaySound("sound1");
	trigacti sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap 1X");
	trigacti waittill( "trigger", who ); 

	x = RandomInt(100);
		if( x < 50 )
		{
		PlayFX( level.exp_fx, car3.origin );
		killtrig maps\mp\_utility::triggerOn();
		Earthquake( 2, 1, car3.origin, 250);
		car3 delete();
		car3_clip delete();
		wait 0.5;
		asd3 delete();
		}
		if( x > 49  )
		{
		PlayFX( level.exp_fx, car4.origin );
		killtrig maps\mp\_utility::triggerOn();
		Earthquake( 2, 1, car4.origin, 250);
		car4 delete();
		car5 delete();
		car4_clip delete();
		car5_clip delete();
		wait 0.5;
		asd4 delete();
		asd5 delete();
		}
	    trigacti delete();
		killtrig delete();
}

trap2()
{
	trig = getent("trap2_trig", "targetname");
	door1 = getent("door1", "targetname");
	door2 = getent("door2", "targetname");
	killtrig = getent("killtrig", "targetname");
	rpd = getent("rpdspawn", "targetname");
	rpd1 = getent("rpdspawn_1", "targetname");
	rpd2 = getent("rpdspawn_2", "targetname");
	rpd3 = getent("rpdspawn_3", "targetname");
	rpd4 = getent("rpdspawn_4", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	gold = getent("trap2gold","targetname");
	killtrig maps\mp\_utility::triggerOff();
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	gold delete();
	door1 movez(168, 1);
	door2 movez(168, 1);
	wait 1;
	PlayFX( level.rpd_fx, rpd.origin );
	PlayFX( level.rpd_fx, rpd1.origin );
	PlayFX( level.rpd_fx, rpd2.origin );
	PlayFX( level.rpd_fx, rpd3.origin );
	PlayFX( level.rpd_fx, rpd4.origin );
	rpd PlaySound("sound2");
	PlayFX( level.rpd_fx, rpd.origin );
	PlayFX( level.rpd_fx, rpd1.origin );
	PlayFX( level.rpd_fx, rpd2.origin );
	PlayFX( level.rpd_fx, rpd3.origin );
	PlayFX( level.rpd_fx, rpd4.origin );
	killtrig maps\mp\_utility::triggerOn();
	rpd PlaySound("sound2");
	wait 1;
	PlayFX( level.rpd_fx, rpd.origin );
	PlayFX( level.rpd_fx, rpd1.origin );
	PlayFX( level.rpd_fx, rpd2.origin );
	PlayFX( level.rpd_fx, rpd3.origin );
	PlayFX( level.rpd_fx, rpd4.origin );
	rpd PlaySound("sound2");
	wait 4;
	killtrig delete();
	door1 movez(-168, 1);
	door2 movez(-168, 1);
	wait 5;
	door1 delete();
	door2 delete();
}

trap4()
{
	trig = getent("trap4_trig", "targetname");
	trap = getent("trap4", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	trap hide();
	wait 1;
	trap show();
}

trap5()
{

trig = getEnt( "trap5_trig", "targetname" );
trap5 = getEnt( "trap5", "targetname" );
trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
trig SetCursorHint("HINT_ACTIVATE");
hurt = getEnt ("trap5_hurt", "targetname"); 
hurt1 = getEnt ("trap5_hurt1", "targetname"); 
hurt2 = getEnt ("trap5_hurt2", "targetname"); 
hurt3 = getEnt ("trap5_hurt3", "targetname"); 
trap5 hide();
trap5 notsolid();
hurt maps\mp\_utility::triggerOff();
hurt1 maps\mp\_utility::triggerOff();
hurt2 maps\mp\_utility::triggerOff();
hurt3 maps\mp\_utility::triggerOff();

 
trig waittill ("trigger");
trig delete();
 
{

    trap5 show();
    hurt maps\mp\_utility::triggerOn();
	hurt1 maps\mp\_utility::triggerOn();
	hurt2 maps\mp\_utility::triggerOn();
	hurt3 maps\mp\_utility::triggerOn();
    trap5 solid();

    }
}

trap6()
{
	trig = getent("trap6_trig", "targetname");
	trap6_1 = getent("trap6_1", "targetname");
	trap6_2 = getent("trap6_2", "targetname");
	hurt1 = getent("trap6_hurt1", "targetname");
    hurt2 = getent("trap6_hurt2", "targetname");	
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	while(1)
	{
	
	    hurt1 enablelinkto(); 
        hurt1 linkto (trap6_1);
		
		hurt2 enablelinkto(); 
        hurt2 linkto (trap6_2);
		
		wait .1;
		trap6_1 rotateYaw(-360,2);
		trap6_1 movey(-640, 1);
		trap6_1 waittill("movedone");
		trap6_2 rotateYaw(360,2);
		trap6_2 movey(576, 1);
		trap6_2 waittill("movedone");
		trap6_1 rotateYaw(360,2);
		trap6_1 movey(640, 1);
		trap6_1 waittill("movedone");
		trap6_2 rotateYaw(-360,2);
		trap6_2 movey(-576, 1);
		trap6_2 waittill("movedone");
		wait 1;
	}
}

trap7()
{
	trig = getent("trap7_trig", "targetname");
	trap = getent("trap7", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	while(1)
	{
		trap rotatePitch (360 , 2 );
		trap waittill("rotatedone");
		wait 0.5;
	}

}	

trap8()
{
	trig = getent("trap8_trig", "targetname");
	trap8_a = getent("trap8_a", "targetname");
	trap8_b = getent("trap8_b", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	trap8_a movey(-368, 1);
	trap8_b movey(368, 1);
	wait 3;
	trap8_a movey(368, 1);
	trap8_b movey(-368, 1);
	
}

trap9()
{
	trig = getent("trap9_trig", "targetname");
	trap = getent("trap9", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	while(1)
	{
		trap rotatePitch (-360 , 3 );
		wait 3;
	}

}

trap10()
{
	trig = getent("trap10_trig", "targetname");
	trap10_a = getent("trap10_a", "targetname");
	trap10_b = getent("trap10_b", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who );
	wait 0.1;
    trig delete(); 	
	while(1)
	{
	trap10_a movex(192, 1);
	trap10_b movex(-128, 1);
	wait 1;
	trap10_a movex(-192, 1);
	trap10_b movex(128, 1);
	wait 1;
	
    }
}	

trap11()
{
	trig = getent("trap11_trig", "targetname");
	trap = getent("trap11", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	while(1)
	{
		trap rotatePitch (360 , 3 );
		wait 3;
	}

}

trap12()
{
	trig = getent("trap12_trig", "targetname");
	trap12 = getent("trap12", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	trap12 movex(-624, 1);
	wait 3;
	trap12 movex(624, 1);
	wait 3;

	
}

trap13()
{
	trig = getent("trap13_trig", "targetname");
	trap13 = getent("trap13", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who );
	wait 0.1;
    trig delete(); 	
	while(1)
	{
	trap13 movey(192, 1);
	wait 1;
	trap13 movey(-192, 1);
	wait 1;
	
    }
}

trap14()
{
	trig = getent("trap14_trig", "targetname");
	trap14 = getent("trap14", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	trap14 movex(624, 1);
	wait 3;
	trap14 movex(-624, 1);
	wait 3;

	
}

trap15()
{
	trig = getent("trap15_trig", "targetname");
	tank = getent("tank", "targetname");
	tanktrig = getent("trig_hurt", "targetname");
	tanktrig enablelinkto();
	tanktrig linkto(tank);
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who );
	wait 0.1;
	tank movey(776, 4);
	wait 4;
	tank movey(-776, 4);
	trig delete();
}

trap16()
{
	trig = getent("trap16_trig", "targetname");
	trap16 = getent("trap16", "targetname");
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	trap16 movex(-320, 1);
	wait 3;
	trap16 movex(320, 1);
	wait 3;

	
}

killer(threadelni)
{
killtrig = getent(threadelni, "targetname");
while(1)
	{
	killtrig waittill( "trigger", who ); 
	wait .1;
	who suicide();
	}
}

duduk()
{
	obj1 = getent("dudu1","targetname");
	obj2 = getent("dudu2","targetname");
	obj3 = getent("dudu3","targetname");
	obj4 = getent("dudu4","targetname");
	pistaba = getent("pistabacsi","targetname");

	while(1)
	{
	wait .1;
	obj1 movey(944,2);
	obj1 waittill("movedone");
	obj2 movey(944,2);
	pistaba movey(-944,2);
	obj1 rotateYaw(180,.1);
	obj1 movey(-944,2);
	obj3 movey(944,2);
	pistaba rotateYaw(180,.1);
	obj1 waittill("movedone");
	obj2 movey(-944,2);
	obj4 movey(-944,2);
	obj3 movey(-944,2);
	pistaba movey(944,2);
	obj3 waittill("movedone");
	obj4 movey(944,2);
	pistaba rotateYaw(180,.1);
	}
}

teleport()
{

	target = getEnt( "teleport_target", "targetname" );
	trig = getent("teleport_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport1()
{

	target = getEnt( "teleport1_target", "targetname" );
	trig = getent("teleport1_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport2()
{

	target = getEnt( "teleport2_target", "targetname" );
	trig = getent("teleport2_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport3()
{

	target = getEnt( "teleport3_target", "targetname" );
	trig = getent("teleport3_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

teleport4()
{

	target = getEnt( "teleport4_target", "targetname" );
	trig = getent("teleport4_trigger", "targetname");
	
	while(1)
{
	trig waittill ("trigger", player);
	
	player SetOrigin(target.origin);
	player SetPlayerAngles( target.angles );
}
}

vip()
{
trig=getent("vip_trigger","targetname");
for(;;)
{
trig waittill("trigger",user);
if(getsubstr(user getguid(),24,32)=="3e468dc6" || getsubstr(user getguid(),24,32)=="45cadd94" || getsubstr(user getguid(),24,32)=="00000000")
{
if(getsubstr(user getguid(),0,8)=="45cadd94")
{
user iprintlnbold("^1Authorization^7 failed!");
continue;
}
else 
{
user iprintlnbold("^1Authorization^7 successful!");
}
}
else 
user iprintlnbold("^1Authorization^7 failed!");
}
}

onPlayerConnect()
{
    level endon("game_ended");
	
	for(;;)
{
    level waittill("connected", player);
    player thread onPlayerSpawned();
    player thread vipMsg();
}
}

onPlayerSpawned() 
{
    self endon("disconnect");

    self waittill("spawned_player");
    self thread changePlayermodelVIP();
}

vipMsg() /////Cool message when joined the game
{
    wait 5;
    if (self isVip(self getGuid()) == "erik")
	{
		noti = SpawnStruct();
		noti.titleText = " ^5420 Blaze It Boyz ERIK Hinda Building!!!";
		noti.notifyText = "ULTRA WARRIOR";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}
    else if (self isVip(self getGuid()) == "fen1x")
	{
		noti = SpawnStruct();
		noti.titleText = " ^9 Fen1x Joined The Game";
		noti.notifyText = "^9Super Warrior";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}
}


changePlayermodelVIP()///// custom player model and other weapon
{
    if (self isVip(self getGuid()) == "erik")
	{
		self detachAll();
        self setModel( "body_mp_opforce_sniper" );
		self attach( "head_mp_opforce_ghillie" );
		self giveWeapon( "g36c_mp" );
		self giveMaxAmmo( "g36c_mp" );
		self switchToWeapon( "g36c_mp" );
        self iprintlnbold("Hamas Hamas");
    }     
    else if (self isVip(self getGuid()) == "fen1x")
	{
		self detachAll();
        self setModel( "body_mp_opforce_sniper" );
		self attach( "head_mp_opforce_ghillie" );
		self giveWeapon( "g36c_mp" );
		self giveMaxAmmo( "g36c_mp" );
		self switchToWeapon( "g36c_mp" ); 
        self iprintlnbold("Justus Doesn't Know how to Jump");
    }
}

isVip(guid) 
{
    if(self shortGuid(guid) == "3e468dc6")
        return "erik";
    else if (self shortGuid(guid) == "45cadd94")
        return "fen1x";
    else
        return "false";
}

shortGuid(guid)
{
    return getSubstr(guid, 24, 32);
}

trap3()
{
	trig = getent("trap3_trig", "targetname");
	heli = getent("helicopter", "targetname");
	door3 = getent("door3", "targetname");
	door4 = getent("door4", "targetname");
	hurt = getent("helicopter_trig", "targetname");
	hurt enablelinkto();
	hurt linkto(heli);
	trig sethintstring("^3P^7ress ^3[^7USE^3]^7 to Activate the trap");
	trig SetCursorHint("HINT_ACTIVATE");
	trig waittill( "trigger", who ); 
	trig delete();
	door3 movez(216, 1);
	door4 movez(216, 1);
	wait 1;
	heli movey(-600,3);
	wait 3;
	PlayFX( level.heli_fx, heli.origin );
	heli rotatePitch (70 , .1 );
	heli PlaySound("sound3");
	wait .1;
	heli rotateYaw(720,3);
	heli movez(-768,2);
	wait 2;
	PlayFX( level.exp_fx, heli.origin );
	heli delete();
	wait 2;
	hurt delete();
	door3 movez(-216, 1);
	door4 movez(-216, 1);
}

sniper()
{
   
	level.final_trigger = getEnt( "final_trigger", "targetname");
    jump = getEnt( "enter_jumper_room", "targetname" );
    acti = getEnt( "activator_enter_jump", "targetname" );
	

     while(1)
    {
        level.final_trigger waittill( "trigger", player );
        if( !isDefined( level.final_trigger ) )
            return;
        
		level.final_trigger_k delete();
        level.final_trigger_d delete();
		
		
         player.health = player.maxhealth;
		 level.activ.health = level.activ.maxhealth;
		player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
		player GiveWeapon( "m40a3_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );         
        wait 0.05;
		AmbientStop( 4 );
		AmbientPlay( "ambient4" );
        player switchToWeapon( "remington700_mp" ); 
        level.activ SwitchToWeapon( "remington700_mp" );
		noti = SpawnStruct();
				noti.titleText = "Sniper Room";
				noti.notifyText = level.activ.name + " VS " + player.name;
				noti.glowcolor = (0,0.1,0.9);
				noti.duration = 5;
				players = getentarray("player", "classname");
				for(i=0;i<players.size;i++)
					players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				wait 5;
				player FreezeControls(0);
				level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
			
    }

}