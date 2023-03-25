#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;

main()
{

    maps\mp\_load::main();
    maps\mp\_explosive_barrels::main();
	
	level.start = LoadFX("trans/startfx");
	level.star = LoadFX("trans/star_exp");
	level.exp = LoadFX("trans/exp");
	level.trans = LoadFX("trans/trans");
	level.lightz = LoadFX("trans/acti");
	level.laze = LoadFX("trans/laser");
	level.art = LoadFX("trans/artillery");
	level.darmuh = "lol"; //DARMUH is cool
	PreCacheShellShock( "teleporter");
	precacheShader( "poyser2" );

		precacheItem( "remington700_mp" );
	precacheItem("frag_grenade_mp");
	precacheItem( "ak47_mp" );
	precacheItem( "ak74u_mp" );
	precacheItem( "winchester1200_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "m40a3_acog_mp" );
	precacheItem( "saw_grip_mp" );
	
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
	setdvar("compassmaxrange","1800");
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );
	

	thread X();
	thread hud2();
	thread ends();
	thread tele2();
	thread tele4();
	thread tele5();
	thread tele3();
	thread doors();
	thread tele7();
	thread addTestClients();
	thread trans();
	thread auto();
	thread auto2();
	thread auto3();
	thread t1();
	thread t2();
	thread t3();
	thread t4();
	thread t5();
	thread fastr();
}
addtriggers()
{
    addTriggerToList("t1t");
   addTriggerToList("t2t");
   addTriggerToList("t3t");
   addTriggerToList("t4t");
   addTriggerToList("t5t");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
ends()
{
  thread  WatchSniper();
  thread WatchWeapon();
  thread WatchKnife();
  thread Watchdog();
}  
X()
{

	wait 10;
	thread start();
    thread art();
	wait 5;
	thread Ex();
	wait 3;
	thread iminyoserver();
}

start()
{
	star = Spawn("script_model", (0,0,0) );
	focus = (0,0,0);
	sound = getent ("sound_trig" ,"targetname");
	star SetModel("tag_origin");
	wait 0.05;
	ambientPlay("tranz");
	PlayFXOnTag( level.start, star, "tag_origin" );
	EarthQuake( 0.2, 999, star.origin, 800 );
	while(1)
	{
	star MoveZ( 300, 5, 1, 1 );
	wait 2;
	star MoveZ( -300, 5, 1, 1 );
	wait 2;
	}
}
Ex()
{
	star = Spawn("script_model", (0,0,0) );
	d = getEnt("start_door", "targetname");
	sound = getent ("sound_trig" ,"targetname");
	star SetModel("tag_origin");
	wait 0.05;
	PlayFXOnTag( level.star, star, "tag_origin" );
	PlayFXOnTag( level.laser, star, "tag_origin" );
	star MoveZ( -90, 5, 1, 1 );
	wait 5;
	star MoveX( 590, 2 );
	wait 2;
	PlayFXOnTag( level.exp, star, "tag_origin" );
	EarthQuake( 1.5, 1.5, star.origin, 1600 );
	sound playsound("dexp");
	d delete();
	wait 1;
	star delete();
}
lighter()
{
PlayFXOnTag( level.lightz, self, "j_head" );	
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
trans()
{ 
    t1 = getent ("poyser1" ,"targetname");
	t2 = getent ("poyser2" ,"targetname");
	t3 = getent ("poyser3" ,"targetname");
	t4 = getent ("poyser4" ,"targetname");
	t5 = getent ("poyser5" ,"targetname");
	cen = getent ("central" ,"targetname");
	cen2 = getent ("central2" ,"targetname");
	rad = getent ("endarc" ,"targetname");
	//cen3 = getent ("central3" ,"targetname");
	cen4 = getent ("central4" ,"targetname");
	cen5 = getent ("central5" ,"targetname");
	
   playLoopedFx(level.trans, 1, t1.origin);	
   playLoopedFx(level.trans, 1, t2.origin);
   playLoopedFx(level.trans, 1, t3.origin);
   playLoopedFx(level.trans, 1, t4.origin);
   playLoopedFx(level.trans, 1, t5.origin);
   playLoopedFx(level.star, 1, cen.origin);
   playLoopedFx(level.start, 1, rad.origin);
   playLoopedFx(level.star, 1, cen2.origin);
   //playLoopedFx(level.star, 1, cen3.origin);
   playLoopedFx(level.star, 1, cen4.origin);
   playLoopedFx(level.star, 1, cen5.origin);
}
tele2()
{
	entTransporter = getentarray( "enter2", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter2();
}
 
transporter2()
{
	for(;;)
	{
		self waittill( "trigger", player );
			self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		wait 0.5;
		//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,1);
			wait 1;
			player unlink();
			air delete();
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	
	                      player shellshock( "teleporter", 2 );               
					      PlayFXOnTag( level.tele2, player, "j_spinelower" );

		wait 0.1;
	}
}
tele3()
{
	entTransporter = getentarray( "enter3", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter3();
}
 
transporter3()
{
	for(;;)
	{
		self waittill( "trigger", player );
			self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		wait 0.5;
		//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,1);
			wait 1;
			player unlink();
			air delete();
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	
	                      player shellshock( "teleporter", 2 );               
					      PlayFXOnTag( level.tele2, player, "j_spinelower" );

		wait 0.1;
	}
}
tele4()
{
	entTransporter = getentarray( "enter4", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter4();
}
 
transporter4()
{
  num=0;
	for(;;)
	{
		self waittill( "trigger", player );
			self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		num=num+1;
		wait 0.5;
		//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,1);
			wait 1;
			player unlink();
			air delete();
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		 player shellshock( "teleporter", 2 );               
					      PlayFXOnTag( level.tele2, player, "j_spinelower" );
						  
				if(num == 1)
		{
		iprintlnbold("^5"+player.name+" is in the lead");
	    }
	}
}
tele5()
{
	entTransporter = getentarray( "enter5", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter5();
}
 
transporter5()
{
num=0;
	for(;;)
	{
		self waittill( "trigger", player );
			self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		num=num+1;
		wait 0.5;
		//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,1);
			wait 1;
			player unlink();
			air delete();
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	
	                      player shellshock( "teleporter", 2 );               

				if(num == 1)
		{
		iprintlnbold("^5"+player.name+" Finished ^1"+num+"ST!!!");
	    }
		if(num == 2)
		{
		iprintlnbold("^5"+player.name+" Finished ^1"+num+"nD =/ ");
	    }
        if(num >= 3)
        {
        iprintlnbold("^5"+player.name+" Finished ^1"+num+"TH -____- ");		
        }
		wait 0.1;
	}
}
doors()
{
	entTransporter = getentarray( "tel", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter6();
}
 
transporter6()
{
	for(;;)
	{
		self waittill( "trigger", player );
		self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	
	                      player shellshock( "teleporter", 2 );               

		wait 0.1;
	}
}
tele7()
{
	entTransporter = getentarray( "tele5", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter7();
}
 
transporter7()
{
	for(;;)
	{
		self waittill( "trigger", player );
			self PlaySound("tfx");
		entTarget = getEnt( self.target, "targetname" );
		wait 0.5;
		//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = player.origin;
			air.angles = player.angles;
			player linkto (air);
			earthquake( 0.55, 1, player.origin, 1000 );
			air moveZ(200,1);
			wait 1;
			player unlink();
			air delete();
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
	
	                      player shellshock( "teleporter", 2 );               

	}
}
t1()
{
	t = getEnt ("t1t", "targetname");
	b1 = getEnt ("t1b1", "targetname");
	b2 = getEnt ("t1b2", "targetname");
	
	t setHintString("ActiV");
	t waittill("trigger", player);
	t playsound("act");
	t setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "activator" );
	
	b1 moveY(-450,2);
	b2 moveY(250,2);
	wait 2.5;
	while(1)
	{
	b1 moveY(450,2);
	b2 moveY(-450,2);
	wait 2;
	b1 moveY(-450,2);
	b2 moveY(450,2);
	wait 2;
	}
}	

t2()
{
	t = getEnt ("t2t", "targetname");
	b = getEnt ("t2b", "targetname");
	
	t setHintString("ActiV");
	t waittill("trigger", player);
	t playsound("act");
	t setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "activator" );
	while(1)
	{
	b rotateYaw(-360,3);
    wait 3;
	}
}	
t3()
{
	t = getEnt ("t3t", "targetname");
	b1 = getEnt ("t3b1", "targetname");
	b2 = getEnt ("t3b2", "targetname");
	b3 = getEnt ("t3b3", "targetname");
	
	t setHintString("ActiV");
	t waittill("trigger", player);
	t setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "activator" );
	t playsound("act");
	while(1)
	{
	b1 moveZ(-130,1);
	wait 1;
	b2 moveZ(-130,1);
	wait 1;
	b3 moveZ(-130,1);
	wait 1;
	b1 moveZ(130,1);
	wait 1;
	b2 moveZ(130,1);
	wait 1;
	b3 moveZ(130,1);
	wait 1;
	}
}	
t4()
{
	t = getEnt ("t4t", "targetname");
	b1 = getEnt ("t4b1", "targetname");
	b2 = getEnt ("t4b2", "targetname");
	
	t setHintString("ActiV");
	t waittill("trigger", player);
	player braxi\_rank::giveRankXp( "activator" );
	t setHintString("^1Activated");
	t playsound("act");
	while(1)
	{
	b1 moveZ(-50,2);
	b2 moveZ(50,2);
	wait 2.5;
	b1 moveZ(50,2);
	b2 moveZ(-50,2);
	wait 2.5;
	}
}
t5()
{
	t = getEnt ("t5t", "targetname");
	b = getEnt ("t5b", "targetname");
	
	t setHintString("ActiV");
	t waittill("trigger", player);
	t setHintString("^1Activated");
	player braxi\_rank::giveRankXp( "activator" );
	t playsound("act");
	while(1)
	{
	b rotateYaw(360,2);
	wait 2;
	}
}		
iminyoserver()
{
players = getEntArray("player","classname");	
	for(d = 0; d < players.size; d++)
	{
		if( ( players[d].name == level.darmuh )  && ( level.tempGuid == level.dermuh ) )
		{
			iprintlnbold ("BLueeeeeeeee");
			players[d] thread lighter();
		}
}
}	
auto()
{
    t = getEnt( "auto_mover_trig", "targetname" );
	b = getEnt( "auto_mover", "targetname" );
for(;;)
{
 t waittill("trigger", player);
 b moveX(-448,2,1,1);
 wait 3;
 b moveX(448,2,1,1);
 wait 3;
 }
 }
 fastr()
{
    t = getEnt( "faster", "targetname" );
for(;;)
{
 t waittill("trigger", player);
 player SetMoveSpeedScale( 1.5 );
player iPrintlnBold("^5You are fastRr!");
 wait 3;
 }
 }
 auto2()
{
    b1 = getEnt( "auto2", "targetname" );
	b2 = getEnt( "auto4", "targetname" );
while(1)
{
 b1 movey(1216,1,0.5,0.5);
 b2 moveY(-1218,1,0.5,0.5);
 wait 2;
  b1 movey(-1216,1,0.5,0.5);
 b2 moveY(1218,1,0.5,0.5);
 wait 2;
 }
 }
 auto3()
{
	b = getEnt( "auto3", "targetname" );
	 b moveY(600,2,1,1);
 wait 6;
while(1)
{
 b moveY(-600,2,1,1);
 wait 6;
 b moveY(-600,2,1,1);
 wait 6;
  b moveY(600,2,1,1);
 wait 6;
  b moveY(600,2,1,1);
 wait 6;
 }
 }

 WatchSniper()
{
	level.snip_trig = getEnt( "sniper_trig", "targetname");
	jump = getEnt( "j_sniper", "targetname" );
	acti = getEnt( "a_sniper", "targetname" );
	
	while(1)
	{
		level.snip_trig waittill( "trigger", player );
		if( !isDefined( level.snip_trig ) )
			return;
			         level.knife_trig delete();
					 level.weapon_trig delete();
					 level.dog_trig delete();
					 
        player freezeControls( true );                           
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player shellshock( "teleporter", 2 );
		player TakeAllWeapons();
		level.activ freezeControls( true );  
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ shellshock( "teleporter", 2 );
		level.activ TakeAllWeapons();
		wait 0.05;
		noti = SpawnStruct();
		noti.titleText = "^2--^9SNIPER BATTLE^2--";
	noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+" ^7";
	noti.duration = 20;
	noti.glowcolor = (1,1,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
		player thread countdown_snip();
		level.activ thread countdown_snip();
                                     while( isAlive( player ) && isDefined( player ) )
			wait 1;
			iPrintlnBold( " ^9" + player.name + "^7 got Raped by ^9"+ level.activ.name+ "^7" );
			
	}
}
countdown_snip()
{
thread scripts\_slider::oben(self,"^03",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^32",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^21",level.randomcolour);
wait 3;
thread scripts\_slider::unten(self,"^1FIGHT!!",level.randomcolour);
self freezeControls( false );
    self giveweapon( "remington700_mp");
	self giveweapon( "m40a3_mp"); 
    self GiveMaxAmmo("m40a3_mp");	
	self GiveMaxAmmo("remington700_mp");
	self switchToWeapon( "m40a3_mp" );
}
countdown_knife()
{
thread scripts\_slider::oben(self,"^03",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^32",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^21",level.randomcolour);
wait 3;
thread scripts\_slider::unten(self,"^1FIGHT!!",level.randomcolour);
self freezeControls( false );
    self giveweapon( "tomahawk_mp"); 
	self switchToWeapon( "tomahawk_mp" );
}
countdown_dog()
{
	self detachAll();
	self setModel("german_sheperd_dog");
	self TakeAllWeapons();
	self giveweapon( "dog_mp");
self switchToWeapon( "dog_mp" );	
self setClientDvar( "cg_thridperson", 1 );
wait 0.5;
self setClientDvar( "cg_thridperson", 1 );
thread scripts\_slider::oben(self,"^03",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^32",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^21",level.randomcolour);
wait 3;
thread scripts\_slider::unten(self,"^1FIGHT!!",level.randomcolour);
self freezeControls( false );

}
countdown2()
{
thread scripts\_slider::oben(self,"^03",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^32",level.randomcolour);
wait 1;
thread scripts\_slider::oben(self,"^21",level.randomcolour);
wait 3;
thread scripts\_slider::unten(self,"^1FIGHT!!",level.randomcolour);
self freezeControls( false );
self.maxhealth = 100;
	self.health = self.maxhealth;  
self iPrintlnBold( "^1Maximum Health Restored!" );
}
WatchWeapon()
{
	level.weapon_trig = getEnt( "weapons_trig", "targetname");
	jump = getEnt( "j_sniper", "targetname" );
	acti = getEnt( "a_sniper", "targetname" );
	
	while(1)
	{
		level.weapon_trig waittill( "trigger", player );
		if( !isDefined( level.weapon_trig ) )
			return;
			         level.knife_trig delete();
					 level.snip_trig delete();
					 level.dog_trig delete();
					 
        player freezeControls( true );                           
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		level.activ freezeControls( true );  
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		wait 0.05;
		noti = SpawnStruct();
		noti.titleText = "^2-^3WEAPON Battle^2-";
	noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+" ^7";
	noti.duration = 20;
	noti.glowcolor = (1,1,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		player thread countdown2();
		level.activ thread countdown2();
		x = RandomInt(60);
	if( x < 10 )
		{
		level.activ GiveWeapon( "rpg_mp" );
		player GiveWeapon( "rpg_mp" );
		player GiveMaxAmmo( "rpg_mp" );
		level.activ GiveMaxAmmo( "rpg_mp" );
		wait 0.01;
		acti SwitchToWeapon( "rpg_mp" );
		player SwitchToWeapon( "rpg_mp" );
		}
	if( x > 9 && x < 20 )
		{
		level.activ GiveWeapon( "winchester1200_mp" );
		level.activ GiveMaxAmmo( "winchester1200_mp" );
		player GiveWeapon( "winchester1200_mp" );
		player GiveMaxAmmo( "winchester1200_mp" );
		wait 0.01;
		level.activ SwitchToWeapon( "winchester1200_mp" );
		player SwitchToWeapon( "winchester1200_mp" );
		}
	if( x > 19 && x < 30 )
		{
		level.activ GiveWeapon( "ak47_mp" );
		level.activ GiveMaxAmmo( "ak47_mp" );
		player GiveWeapon( "ak47_mp" );
		player GiveMaxAmmo( "ak47_mp" );
		wait 0.01;
		level.activ SwitchToWeapon( "ak47_mp" );
		player SwitchToWeapon( "ak47_mp" );
		}
	if( x > 29 && x < 40  )
		{
		level.activ GiveWeapon( "ak74u_mp" );
		 level.activ GiveMaxAmmo( "ak74u_mp" );
		player GiveWeapon( "ak74u_mp" );
		player GiveMaxAmmo( "ak74u_mp" );
		wait 0.01;
		level.activ SwitchToWeapon( "ak74u_mp" );
		player SwitchToWeapon( "ak74u_mp" );
		}
	if( x > 39 && x < 50  )
		{
		level.activ GiveWeapon( "deserteaglegold_mp" );
		level.activ GiveMaxAmmo( "deserteagle_mp" );
		player GiveWeapon( "deserteaglegold_mp" );
		player GiveMaxAmmo( "deserteagle_mp" );
		wait 0.01;
		level.activ SwitchToWeapon( "deserteaglegold_mp" );
		player SwitchToWeapon( "deserteaglegold_mp" );
		}
	if( x > 49  )
		{
		level.activ GiveWeapon( "saw_grip_mp" );
		level.activ GiveMaxAmmo( "saw_mp" );
		player GiveWeapon( "saw_grip_mp" );
		player GiveMaxAmmo( "saw_mp" );
		wait 0.01;
		level.activ SwitchToWeapon( "saw_grip_mp" );
		player SwitchToWeapon( "saw_grip_mp" );
	

		}
                                     while( isAlive( player ) && isDefined( player ) )
			wait 1;
			iPrintlnBold( " ^9" + player.name + "^7 got Raped by ^9"+ level.activ.name+ "^7" );
			
	}
}
WatchKnife()
{
	level.knife_trig = getEnt( "knife_trig", "targetname");
	jump = getEnt( "j_knife", "targetname" );
	acti = getEnt( "a_knife", "targetname" );
	
	while(1)
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
		level.weapon_trig delete();
		level.dog_trig delete();
		
        player freezeControls( true );                              
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );	
        level.activ freezeControls( true );  		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );		
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
	noti = SpawnStruct();
	noti.titleText = "^2--^9KNIFE BATTLE^2--";
	noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+"";
	noti.duration = 20;
	noti.glowcolor = (0,1,1);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		player thread countdown_knife();
		level.activ thread countdown_knife();
                                     while( isAlive( player ) && isDefined( player ) )
			wait 1;
			iPrintlnBold( " ^9" + player.name + "^7 got Raped by ^9"+ level.activ.name+ "^7" );
			
	}
}
Watchdog()
{
	level.dog_trig = getEnt( "dog_trig", "targetname");
	jump = getEnt( "j_knife", "targetname" );
	acti = getEnt( "a_knife", "targetname" );
	
	while(1)
	{
		level.dog_trig waittill( "trigger", player );
		if( !isDefined( level.dog_trig ) )
			return;
		
		level.snip_trig delete();
		level.weapon_trig delete();
		level.knife_trig delete();
		
        player freezeControls( true );                              
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();	
        level.activ freezeControls( true );  		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();	
		wait 0.05;
	noti = SpawnStruct();
	noti.titleText = "^2--^9Dawg Fight^2--";
	noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+"";
	noti.duration = 20;
	noti.glowcolor = (0,1,1);
	players = getEntArray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		player thread countdown_dog();
		level.activ thread countdown_dog();
                                     while( isAlive( player ) && isDefined( player ) )
			wait 1;
			iPrintlnBold( " ^9" + player.name + "^7 got Raped by ^9"+ level.activ.name+ "^7" );
			
	}
}
hud2()
{
    //plz use without permisson

level.xxx2 = newHudElem();	//hud visible for all, to make it only visible for one replace level. with self. and change newHudElem() to newClientHudElem(self)
	level.xxx2.x = 360;	//position on the x-axis
	level.xxx2.y = 220;	//position on the <-axis
	level.xxx2.horzAlign = "left";	
	level.xxx2.vertAlign = "middle";
	level.xxx2.alignX = "left";
	level.xxx2.alignY = "middle";
	level.xxx2.sort = 102;	//if there are lots of huds you can tell them which is infront of which
	level.xxx2.foreground = 1;	//to do with the one above, if it's in front a lower sorted hud
	level.xxx2.archived = false;	//visible in killcam
	level.xxx2.alpha = 1;	//transparency	0 = invicible, 1 = visible
	level.xxx2.fontScale = 1.9;	//textsize
	level.xxx2.hidewheninmenu = false;	//will it be visble when a player is in a menu
	level.xxx2.color = (1,0,1);	//RGB color code
	level.xxx2.label = &"^5Map by Poyser";	//The text for the hud & is required, &&1 is the value which will be added below
	
	
}
art()
{ 
    e5 = getent ("auto5" ,"targetname");
	e6 = getent ("auto6" ,"targetname");
    e7 = getent ("auto7" ,"targetname");
	e8 = getent ("auto8" ,"targetname");
	e9 = getent ("auto9" ,"targetname");
	e10 = getent ("auto10" ,"targetname");
	 s5 = getent ("sound_auto1" ,"targetname");
	s6 = getent ("sound_auto2" ,"targetname");
    s7 = getent ("sound_auto3" ,"targetname");
	s8 = getent ("sound_auto4" ,"targetname");
	s9 = getent ("sound_auto5" ,"targetname");
	s10 = getent ("sound_auto6" ,"targetname");
	while(1)
	{
	s5 playsound("rocket_dirt1");
   playFx(level.art,e5.origin);	
   wait 1;
   s6 playsound("rocket_dirt1");
   playFx(level.art,e6.origin);	
   wait 2;
   s7 playsound("rocket_dirt3");
   playFx(level.art,e7.origin);	
   wait 2;
   s8 playsound("rocket_dirt2");
   playFx(level.art,e8.origin);	
   wait 1;
   s9 playsound("rocket_dirt1");
  playFx(level.art,e9.origin);	
  wait 2;
  s10 playsound("rocket_dirt4");
   playFx(level.art,e10.origin);
wait 3;   
  
}
}