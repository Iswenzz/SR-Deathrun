//Map by Pro Master
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{

   maps\mp\_load::main();
   
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
thread mapmaker();
thread startdoor();
thread vipsetup();
//otherstuff
thread jumpsniper();
thread shortcut();
thread jumpplayertele();
thread jumpactitele();
thread secretopener();
//music part
thread musictrig();
thread addTestClients();
//welcome messages
//endrooms
thread sniper();
thread deagle();
thread bounce();
thread knife();
thread weapon();

//teleports

thread teleport1();
thread teleport2();
thread actispawn1();
thread actispawn2();

//ezsecret teleports
thread ezsectele();

thread ezsectele1();
thread ezsectele2();
thread ezsectele3();
thread ezsectele4();
thread ezsectele5();
thread ezsectele6();
thread ezsecend();
// hard secret teleports
thread hardsectele();
thread hardsectele1();
thread hardsectele2();
thread hardsectele3();
thread hardsectele8();
thread hardsecend();


game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";
	
	if(!isdefined(level.music))
		level.music=[];

	level.music[0]["song"]	="Tutankhamun";
	level.music[0]["alias"]	="music4";
	level.music[1]["song"]	="Feint - Words (feat. Laura Brehm)";
	level.music[1]["alias"]	="words";
    level.music[2]["song"]	="Spektrem - Shine (Original Mix)";
	level.music[2]["alias"]	="shine";
	level.music[3]["song"]	="Linkin Park - Numb";
	level.music[3]["alias"]	="numb";
	
    //precacheitem	
    precacheItem( "ak47_mp" );
	precacheItem( "ak74u_mp" );
	precacheItem( "deserteagle_mp" );
	precacheshader("loadscreen_mp_dr_prov2");
	
	precacheModel("deadpool");
	
}
secretopener()
{
         
     
	 thread secretentrance();
	 }
musicMenu()
{
	self endon( "disconnect" );
	self endon( "death" );
	self endon( "spawned" );
	self endon( "joined_spectators" );
	self endon( "music thread terminated" );
 
	self thread onDeath();
	self thread onDisconnect();
 
	self.hud_music = [];
	self.selection = 0;
 
	// create huds
	i = 0;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
	self.hud_music[i].sort = 880;
	self.hud_music[i] setShader( "loadscreen_mp_dr_prov2", 320, 160 );
	
	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 210, 204, 0.93, "left", "top", 1.8 );
	self.hud_music[i].sort = 884;
	self.hud_music[i] setText("Welcome to ^5Pro_v2");
	self.hud_music[i].glowalpha=1;
	if(isdefined(level.randomcolor))
		self.hud_music[i].glowcolor=level.randomcolor;
	else 
		self.hud_music[i].glowcolor=(0,1,0);

	i++;
	self.hud_music[i] = braxi\_mod::addTextHud( self, 250, 360, 1, "center", "bottom", 1.4 );
	self.hud_music[i].sort = 886;
	self.hud_music[i] setText("Scroll: ^3[{+attack}] ^7| Select: ^3[{+activate}] ^7| Close: ^3[{+frag}]");
 
	for( j = 0; j < level.music.size; j++ )
	{
		i++;
		self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
		self.hud_music[i].sort = 882;
		self.hud_music[i].font = "objective";
		self.hud_music[i].glowalpha=1;
		if(isdefined(level.randomcolor))
			self.hud_music[i].glowcolor=level.randomcolor;
		else 
			self.hud_music[i].glowcolor=(0,1,0);
 
		entry = level.music[j];
		self.hud_music[i] setText(entry["song"]);
	}
 
	i++;
	self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
	self.hud_music[i].sort = 881;
	indicator = self.hud_music[self.hud_music.size-1];
	indicator setShader( "black", 306, 17 );
 
	while(self.sessionstate == "playing")
	{
		wait 0.1;
 
		if(self attackButtonPressed())
		{
			self.hud_music[3+self.selection].alpha = 0.93;
 
			self.selection++;
			if( self.selection >= level.music.size )
				self.selection = 0;
 
			item = self.hud_music[3+self.selection];
			item.alpha = 1;
			indicator.y = item.y;
		}
		else if(self useButtonPressed())
		{
 			iprintln("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
			ambientPlay(level.music[self.selection]["alias"]);
			self freezecontrols(0);
			break;
		}
		else if(self fragButtonPressed())
		{
			self freezecontrols(0);
			break;
		}
	}
 
	self cleanUp();
}
 
	musictrig()
{
	trig = getEnt ("musicmenu", "targetname");
	trig setHintString("Press [^5&&1^7] to choose Music");
 
	trig waittill("trigger",player);
	player freezecontrols(1);
	trig delete();
	player musicMenu();
}
 
	onDisconnect()
{
	self endon( "music thread terminated" );
	self waittill( "disconnect" );
	self cleanUp();
}
 
	onDeath()
{
	self endon( "disconnect" );
	self endon( "music thread terminated" );
	self waittill( "death" );
	self cleanUp();
}
 
	cleanUp()
{
	if( !isDefined( self ) )
		return;

	
 
	if( isDefined( self.hud_music ) )
	{
		for( i = 0; i < self.hud_music.size; i++ )
		{
			if( isDefined( self.hud_music[i] ) )
				self.hud_music[i] destroy();
		}
	}
	self notify( "music thread terminated" );
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
         ent[i].pers["registered"] = 0;
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

addTriggerToList( name, positionOfIconAboveTrap )
{
if( !isDefined( level.trapTriggers ) )
level.trapTriggers = [];
level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

if( !isDefined( level.icon_origins ) )
level.icon_origins = [];
level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}
shortcut()
{
trig=getent("trig_shortcut","targetname");
short1=getent("shortcut","targetname");
short2=getent("shortcut2","targetname");
trig waittill ("trigger", player);
short1 notsolid();
short2 notsolid();
trig delete();
wait 1;
}
startdoor()
{
lutje=getent( "introdoor", "targetname" );
wait 20;
lutje movez(525, 5);
wait 2;
}
trap1()
{
trig=getent("trig_trap1","targetname");
trap1=getent("trap1","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
trap1 delete();
wait 1;
}

trap2()
{
trig=getent("trig_trap2","targetname");
trap2=getent("trap2","targetname");

trig waittill ("trigger", player);
player braxi\_rank::giveRankXP( "", 40 );
trig setHintString("^2Trap Activated!");
trap2 notsolid();
wait 1;
}
trap3()
{
trig=getent("trig_trap3","targetname");
trap3p1=getent("trap3p1","targetname");
trap3p2=getent("trap3p2","targetname");
trig waittill ("trigger", player);
player braxi\_rank::giveRankXP( "", 40 );
trig setHintString("^2Trap Activated!");
while(1)
{
trap3p1 rotatepitch(360, 1.5);
trap3p2 rotatepitch(-360, 1.5);
wait 1;
}
}
 
trap4()
{
	trigger = getent("trig_trap4","targetname");
	object = getent("object","targetname");
	killtrigger = getent ("killtrigger" , "targetname");
	trigger waittill ("trigger" , player );
player braxi\_rank::giveRankXP( "", 40 );
	trigger setHintString("^2Trap Activated!");
	killtrigger enablelinkto ();
	killtrigger linkto (object);
	object movez(250, 1);
	object waittill("movedone");
	wait 6;
	object movez(-250, 1);
	object waittill("movedone");
	wait 1;
}

trap5()
{
trig=getent("trig_trap5","targetname");
trap5=getent("trap5","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
trap5 delete();
wait 1;
}

trap6()
{
trig=getent("trig_trap6","targetname");
trap6p1=getent("trap6p1","targetname");
trap6p2=getent("trap6p2","targetname");
trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
i = randomintrange( 0, 2 );
	if(i == 0)
	{
		trap6p1 delete();
	}
	else if(i == 1)
	{
		trap6p2 delete();

	}

wait 1;
}

trap7()
{
trig=getent("trig_trap7","targetname");
trap7p1=getent("trap7p1","targetname");
trap7p2=getent("trap7p2","targetname");
trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );

i = randomintrange( 0, 2 );
	if(i == 0)
	{
		trap7p1 notsolid();
	}
	else if(i == 1)
	{
		trap7p2 notsolid();

	}
}
trap8()
{
trig=getent("trig_trap8","targetname");
trap8=getent("trap8","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
trap8 notsolid();
wait 1;
}
trap9()
{
trig=getent("trig_trap9","targetname");
trap9=getent("trap9","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
while(1)
{
trap9 rotateyaw(360, 2);
wait 3;
}
}
trap10()
{
trig=getent("trig_trap10","targetname");
trap10=getent("trap10","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
trap10 moveZ(-2000, 3);
wait 1;
}
trap11()
{
trig=getent("trig_trap11","targetname");
trap11=getent("trap11","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );
trap11 notsolid();
wait 1;
}
trap12()
{
trig=getent("trig_trap12","targetname");
trap12=getent("trap12","targetname");

trig waittill ("trigger", player);
trig setHintString("^2Trap Activated!");
player braxi\_rank::giveRankXP( "", 40 );

trap12 notsolid();
wait 1;
}

//otherstuff



//teleports

teleport1()
{

        trig=getent("trig_tele1","targetname");
	tele1=getent("tele1","targetname");
	for(;;)
	{     
                trig waittill ("trigger", player);
                player setorigin (tele1.origin);
                player setplayerangles(tele1.angles);
	}
}

teleport2()
{

        trig=getent("trig_fixedtele2","targetname");
	tele2=getent("tele2","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( tele2.angles );
                player setorigin (tele2.origin);

	}
}
actispawn1()
{

        trig=getent("trig_actispawn1","targetname");
	actitele1=getent("actispawn1","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( actitele1.angles );
                player setorigin (actitele1.origin);

	}
}
actispawn2()
{

        trig=getent("trig_actispawn2","targetname");
	actitele2=getent("actispawn2","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( actitele2.angles );
                player setorigin (actitele2.origin);

	}
}
secretentrance()
{

        trig=getent("trig_secretentrance","targetname");
	secretentrance=getent("secretentrance","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( secretentrance.angles );
                player setorigin (secretentrance.origin);

	}
}

//hardsectele
hardsectele()
{

        trig=getent("trig_hardsectele","targetname");
	hardsectele=getent("hardsectele","targetname");
	
	for(;;)
	{
		
                
                trig waittill ("trigger", player);
				 player thread hardsecret_timer();
player setplayerangles( hardsectele.angles );
                player setorigin (hardsectele.origin);

	}
}
hardsectele1()
{

        trig=getent("hardsecfalltele1","targetname");
	hardsectele1=getent("origin_hardsecfalltele1","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( hardsectele1.angles );
                player setorigin (hardsectele1.origin);

	}
}

hardsectele2()
{

        trig=getent("hardsecfalltele2","targetname");
	hardsectele2=getent("origin_hardsecfalltele2","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( hardsectele2.angles );
                player setorigin (hardsectele2.origin);

	}
}

hardsectele3()
{

        trig=getent("hardsecfalltele3","targetname");
	hardsectele3=getent("origin_hardsecfalltele3","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( hardsectele3.angles );
                player setorigin (hardsectele3.origin);

	}
}
hardsectele8()
{

        trig=getent("trig_hardsectele8","targetname");
	hardsectele8=getent("hardsectele8","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( hardsectele8.angles );
                player setorigin (hardsectele8.origin);

	}
}
hardsecend()
{

        trig=getent("hardsecend","targetname");
	hardsecend=getent("origin_hardsecend","targetname");
	
	for(;;)
	{
		        
                trig waittill ("trigger", player);
				
				player.secretTimer2 destroy();
				player notify("hardsecret_done");
                iPrintlnBold( " ^8" + player.name + " ^4 has Finished ^1Hard Secret^8!" ); 
player setplayerangles( hardsecend.angles );
                player setorigin (hardsecend.origin);
				player braxi\_rank::giveRankXP( "", 750 );

	}
}


//ezsectele
ezsectele()
{

        trig=getent("trig_ezsectele","targetname");
	ezsectele=getent("ezsectele","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
				player thread ezsecret_timer();
player setplayerangles( ezsectele.angles );
                player setorigin (ezsectele.origin);

	}
}
ezsectele1()
{

        trig=getent("ezsecfalltele1","targetname");
	ezsectele1=getent("origin_ezsecfalltele1","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele1.angles );
                player setorigin (ezsectele1.origin);

	}
}
ezsectele6()
{

        trig=getent("ezsecfalltele6","targetname");
	ezsectele6=getent("origin_ezsecfalltele6","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele6.angles );
                player setorigin (ezsectele6.origin);

	}
}
ezsectele2()
{

        trig=getent("ezsecfalltele2","targetname");
	ezsectele2=getent("origin_ezsecfalltele2","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele2.angles );
                player setorigin (ezsectele2.origin);

	}
}
ezsectele3()
{

        trig=getent("ezsecfalltele3","targetname");
	ezsectele3=getent("origin_ezsecfalltele3","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele3.angles );
                player setorigin (ezsectele3.origin);

	}
}
ezsectele4()
{

        trig=getent("ezsecfalltele4","targetname");
	ezsectele4=getent("origin_ezsecfalltele4","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele4.angles );
                player setorigin (ezsectele4.origin);

	}
}
ezsectele5()
{

        trig=getent("ezsecfalltele5","targetname");
	ezsectele5=getent("origin_ezsecfalltele5","targetname");
	
	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( ezsectele5.angles );
                player setorigin (ezsectele5.origin);

	}
}

ezsecend()
{

        trig=getent("ezsecend","targetname");
	ezsecend=getent("origin_ezsecend","targetname");
	
	for(;;)
	{
		      
                trig waittill ("trigger", player);
				player.secretTimer destroy();
				   player notify("ezsecret_done");
                 iPrintlnBold( " ^8" + player.name + " ^4 has Finished ^2Easy Secret^8!" );
player setplayerangles( ezsecend.angles );
                player setorigin (ezsecend.origin);
				player braxi\_rank::giveRankXP( "", 250 );

	}
}

hardsecret_timer()
{
	self endon("hardsecret_done");
    self endon("suicide");
	if(isdefined(self.secretTimer2))
	self.secretTimer2 destroy();

	self.secretTimer2=newclienthudelem(self);
        self.secretTimer2.foreground = true;
	self.secretTimer2.alignX = "center";
	self.secretTimer2.alignY = "bottom";
	self.secretTimer2.horzAlign = "center";
        self.secretTimer2.vertAlign = "bottom";
        self.secretTimer2.x = 0;
        self.secretTimer2.y = -7;
        self.secretTimer2.sort = 5;
        self.secretTimer2.fontScale = 1.6;
	self.secretTimer2.font = "default";
	self.secretTimer2.glowAlpha = 1;
 	self.secretTimer2.hidewheninmenu = true;
 	self.secretTimer2.label = &"Time in left: &&1";
 	if(isdefined(level.randomcolor))
	self.secretTimer2.glowColor=level.randomcolor;
	else 
	self.secretTimer2.glowColor=(1,0,0);

	time=150;
	for(i=0;i<time;i++)
		{
		self.secretTimer2 setvalue(time-i);
		wait 1;
		}
	self.secretTimer2 setvalue(0);

	self suicide();

	if(isdefined(self.secretTimer2))
	self.secretTimer2 destroy();
}
ezsecret_timer()
{
	self endon("ezsecret_done");
    self endon("suicide");
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
        self.secretTimer.label = &"Time in left: &&1";
        if(isdefined(level.randomcolor))
	self.secretTimer.glowColor=level.randomcolor;
	else 
	self.secretTimer.glowColor=(0,1,0);

	time=100;
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



//endrooms
sniper()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.run_trigger = getEnt( "run_trig", "targetname");
level.weapon_trigger = getEnt( "weapon_trig", "targetname");
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.teleactorigin = getEnt( "sniper1", "targetname" ); 
telejumporigin = getEnt( "sniper2", "targetname" );

while(1)
{
level.sniper_trigger waittill( "trigger", splayer );
if(!splayer sr\api\_deathrun::order())
		continue;
level.weapon_trigger delete();
level.knife_trigger delete();
level.bounce_trigger delete();
level.deagle_trigger delete();
level.run_trigger delete();    
iprintln("Now Playing<<Pendulum – Crush>>");    
ambientstop();
ambientPlay( "sniper" );
thread sniperfall(splayer);


if( !isDefined( level.sniper_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

splayer SetOrigin( telejumporigin.origin );
splayer setplayerangles( telejumporigin.angles );
splayer TakeAllWeapons();
splayer GiveWeapon("m40a3_mp");
splayer GiveWeapon( "remington700_mp" ); 
splayer GiveMaxAmmo("m40a3_mp");
splayer GiveMaxAmmo( "remington700_mp" );
wait .05;
splayer SwitchToWeapon("m40a3_mp"); 
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
iPrintlnBold( " ^8" + splayer.name + " ^4 has entered the Sniper room^8!" ); 
splayer iPrintlnBold( "^13" );
            splayer freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            splayer iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            splayer iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            splayer iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            splayer freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
splayer switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );




splayer waittill( "death" );
level.PlayerInRoom = false;

}
}

deagle()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.run_trigger = getEnt( "run_trig", "targetname");
level.weapon_trigger = getEnt( "weapon_trig", "targetname");
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.dteleactorigin = getEnt( "deagle1", "targetname" ); 
dtelejumporigin = getEnt( "deagle2", "targetname" );

while(1)
{
level.deagle_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
		continue;
   level.weapon_trigger delete();
level.knife_trigger delete();
level.bounce_trigger delete();
level.sniper_trigger delete(); 
level.run_trigger delete();
iprintln("Now Playing<<Linkin Park - BURN IT DOWN >>");    
ambientstop();
ambientPlay( "deagle" );



if( !isDefined( level.deagle_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( dtelejumporigin.origin );
player setplayerangles( dtelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("deserteagle_mp");
player GiveWeapon( "deserteaglegold_mp" ); 
player GiveMaxAmmo("deserteagle_mp");
player GiveMaxAmmo( "deserteaglegold_mp" );
wait .05;
player SwitchToWeapon("deserteagle_mp"); 
wait(0.05);
level.activ SetOrigin (level.dteleactorigin.origin);
level.activ setplayerangles (level.dteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "deserteagle_mp" );
level.activ GiveWeapon( "deserteaglegold_mp" );
level.activ GiveMaxAmmo("deserteagle_mp");
level.activ GiveMaxAmmo( "deserteaglegold_mp" );
wait .05;
level.activ SwitchToWeapon("deserteagle_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Deagle room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "deserteagle_mp" );
level.activ SwitchToWeapon( "deserteagle_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}



jumpplayertele()
{

        trig=getent("jumpfallplayertele","targetname");
	playertele=getent("jump2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( playertele.angles );
                player setorigin (playertele.origin);

               
		
		
               	        

	}
}
bounce()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.run_trigger = getEnt( "run_trig", "targetname");
level.weapon_trigger = getEnt( "weapon_trig", "targetname");
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.bactiorigin = getEnt( "jump1", "targetname" ); 
btelejumporigin = getEnt( "jump2", "targetname" );

while(1)
{
level.bounce_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
		continue;
level.weapon_trigger delete();
level.run_trigger delete();
level.knife_trigger delete();
level.deagle_trigger delete();
level.sniper_trigger delete();
iprintln("Now Playing<<Linkin Park - Breaking the Habit>>");    
ambientstop();    
ambientPlay( "bounce" );



if( !isDefined( level.bounce_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( btelejumporigin.origin );
player setplayerangles( btelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("knife_mp");
wait .05;
player SwitchToWeapon("knife_mp"); 
wait(0.05);
level.activ SetOrigin (level.bactiorigin.origin);
level.activ setplayerangles (level.bactiorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait .05;
level.activ SwitchToWeapon(""); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the bounce room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6GO^7!" );
            level.activ iPrintlnBold( "^6GO^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}


knife()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.run_trigger = getEnt( "run_trig", "targetname");
level.weapon_trigger = getEnt( "weapon_trig", "targetname");
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.kteleactorigin = getEnt( "knife1", "targetname" ); 
ktelejumporigin = getEnt( "knife2", "targetname" );

while(1)
{
level.knife_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
		continue;
level.weapon_trigger delete();
level.bounce_trigger delete();
level.deagle_trigger delete();
level.sniper_trigger delete();
level.run_trigger delete();    
iprintln("Now Playing<<Nightcore - This Little Girl>>");    
ambientstop();
ambientPlay( "knife" );



if( !isDefined( level.knife_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( ktelejumporigin.origin );
player setplayerangles( ktelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("knife_mp");
wait .05;
player SwitchToWeapon("knife_mp"); 
wait(0.05);
level.activ SetOrigin (level.kteleactorigin.origin);
level.activ setplayerangles (level.kteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait .05;
level.activ SwitchToWeapon("knife_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Knife room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}
weapon()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.weapon_trigger = getEnt( "weapon_trig", "targetname");
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.wteleactorigin = getEnt( "weapon1", "targetname" ); 
wtelejumporigin = getEnt( "weapon2", "targetname" );

while(1)
{
level.weapon_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
		continue;
level.bounce_trigger delete();
level.knife_trigger delete();
level.deagle_trigger delete();
level.sniper_trigger delete();
    
iprintln("Now Playing<<Wiz Khalifa - We Dem Boyz>>");    
ambientstop();
ambientPlay( "weapon" );



if( !isDefined( level.weapon_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( wtelejumporigin.origin );
player setplayerangles( wtelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("ak47_mp");
player GiveWeapon("ak74u_mp");
wait .05;
player SwitchToWeapon(""); 
wait(0.05);
level.activ SetOrigin (level.wteleactorigin.origin);
level.activ setplayerangles (level.wteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon("ak47_mp");
level.activ GiveWeapon("ak74u_mp");
wait .05;
level.activ SwitchToWeapon("ak47_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Knife room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "ak47_mp" );
level.activ SwitchToWeapon( "ak47_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}
//jumpteles


jumpsniper()
{        
            trig = getent("jumpgivesniper","targetname");
         for(;;)
		 {
            trig waittill("trigger", player);
            wait (0.01); 
            player takeallweapons();
			player GiveWeapon( "m40a3_mp" );
	        player GiveWeapon( "remington700_mp" );
			player switchToWeapon( "m40a3_mp" );
          		  wait (5);
}
}
jumpactitele()
{

        trig=getent("jumpfallactitele","targetname");
	actitele=getent("jump1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);
player setplayerangles( actitele.angles );
                player setorigin (actitele.origin);

               
		
		
               	        

	}
}

mapmaker()
{ 
    while(1)
    {
	   level waittill( "connected", player );
       if(player.name == "63d91658d55799f50f45e43cf13df80c") 
    {
	    
	    iprintln("The Map Maker Has entered the server!");

	}	   
}
}
vipsetup()
{



thread endmaptrig();
thread trig_vip();

}
trig_vip() 
{
vip1 = "Pro Master";
vip2 = "_G4rG4m3l_";

trig = getent("trig_vip","targetname");

for(;;)
	{
		trig waittill ("trigger",user);
		
		if((user.name == vip1 || user.name == vip2))
		{
		
		user detachAll();
		user setModel("deadpool");  
		user GiveWeapon( "deserteagle_mp" );
		
		user GiveMaxAmmo( "deserteagle_mp" );
		user SwitchToWeapon("deserteagle_mp"); 
                
		
		wait 3;
		}
			else
			{
			wait 3;
		}

	
}
}
endmaptrig()
{

trig=getent("endmap_trig","targetname");
trig waittill("trigger", player);

player braxi\_rank::giveRankXP( "", 250 );
iprintlnbold(" ^3" + player.name + " ^2Has Finished Map First");
}  
sniperfall(splayer)
{
trig = getEnt( "sniperfall", "targetname");
sniperplayerfall = getEnt( "sniper2", "targetname");
sniperactifall = getEnt( "sniper1", "targetname");
while(1)
{
trig waittill("trigger", player);
activator = GetActivator();
if (player == splayer)
{
player SetOrigin( sniperplayerfall.origin );
player setplayerangles( sniperplayerfall.angles );
}
else if (player == activator)
{
player SetOrigin( sniperactifall.origin );
player setplayerangles( sniperactifall.angles );
}
}
}
GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}          
		
