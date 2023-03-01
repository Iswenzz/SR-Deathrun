/* 
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MI             O     M      M    8MM.      MMM        MMM.     MMM         7MMMM
MI             O     M      M    8M        MMM        MM        MM          MMMM
MMM.  N    M OMMM   MMM~    .M7 MM8   +M+  MMM 8M    MMM   IM    MM.  MMM   MMMM
MMM   ..   . MMMM   MMM=     NI MM   .MMMMMMMM OD   .MM=   MM8  .MM.  MM8   MMMM
MMM$         MMMM   MMM= M    I MM   .M......MMM    MMM.   MMM   MM.       MMMMM
MMMM        ,MMMM   MMM= M.   I MM    M      MMO    Z=I    MMM  .MM.        MMMM
MMMM    D   MMMMM   MMM= MN     MM.   MM   MMMM,   MI ~N   NM:  .MM.  MMI   7MMM
MMMM,  ZM   MMMO     M. ..7     MMM        MMM+    .. ~M        ?M..  . M    MMM
MMMMM  MM   MMM8     M    7M    MMM~       MMM.       ~MM       MM      M   .MMM
MMMMM  MMN MMMM8     M    7M    MMMMM.  M  MM.        ~MMM.   7MMM      M.  =MMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM 
*/
main()
{
trigger = spawn("trigger_radius", (-19136.2, 13545.1, 256.125), 0, 325, 110);
trigger.targetname = "endmap_trig";
trigger.radius = 325;	
	maps\mp\_load::main();	
	
	SetDvar( "player_meleerange", "100" );
	
	game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	//thread expandTimeLimit( 2 );
	
	ambientPlay("zor");
	precacheItem("m40a3_mp");
	precacheItem("ak74u_mp");
	precacheitem("deserteagle_mp");
	PrecacheShellShock("death");
	
	level.abovehuman["fireball_idle"] = LoadFX("dball/kishot");
	level.abovehuman["fireball_explosion"] = LoadFX("dball/kishotimpact");
	level.abovehuman["fireball_idlebig"] = LoadFX("dball/kishotbig");
	level.abovehuman["fireball_explosionbig"] = LoadFX("dball/kishotimpactbig");
	level.abovehuman["ssjspawn"] = LoadFX("dball/ssjspawn");
	precacheModel( "viewmodel_hands_zombie" );

	setdvar( "r_specularcolorscale", "1" );
	setdvar( "dr_jumpers_speed", "1.2" );
	setdvar( "dr_activators_speed", "1.2" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	level.dvar["time_limit"] = 6;
	
	
	level.hurtrig =getent("hurt_meteor","targetname");
	level.hurtrig.dmg = 0;
	
	Dhider= getent("dragonhider","targetname");
	Dhider.angles = (0,180,0);
	level.fx_nukeflash["explosions/nuke_flash"] = loadFx("explosions/nuke_flash");
	//PlayLoopedFX( level.fx_nukeflash,Dhider );
	//playLoopedFx(level.fx_nukeflash["explosions/nuke_flash"], 2, dhider.origin, 0, anglestoforward ((0,0,0)), anglestoup((0,0,0)));
		
	rocks_1=getentarray("rock1","targetname");
	if(isdefined(rocks_1))
	{
	for(i=0;i<rocks_1.size;i++)
	{
	rocks_1[i] thread rock_move();
	rocks_1[i] thread trap3();
	}
	}
	
	
	trap_rotatefloor=getentarray("trap_1","targetname");
	if(isdefined(trap_rotatefloor))
	{
	for(i=0;i<trap_rotatefloor.size;i++)
	{
	trap_rotatefloor[i] thread trap_1_rotatefloorz();
	}
	}
	
	
	thread clientdvar();
	thread credit();
	thread dballs();
	thread rotators_1();
	thread declare();
	thread trap_moveplat();
	thread spikedodgepath();
	thread activatorufoflight();
	thread dragonballmidblock();
	thread dragonballsfound();
	thread hud();
	thread weapon();
	thread lastelevator();
	thread senzubeanrestore();
	thread secretteleport();
	thread secretteleportback();
	thread jumpgamerespawn();
	thread checkactivatorafk();
	thread antilagg();
	
	//transmissions
	thread transmissions();

	//traps
	thread trap1();
	thread trap2();
	thread trap4();
	thread trap_bounce();
	thread boomeye();
	thread trap_crouchpush();
	thread trap_rotator();
	
	
	//level.playernamezor="wingz";
	//level.burn_fx = LoadFX("dball/playerburst");
	level.burn_fx = LoadFX("dball/ssjglow");
	level.glow = LoadFX("dball/playerburst");
	//thread findburner();
	level.firsttime=true;
	thread pickroom();
	thread addtriggers();
	
	level.dvar["time_limit"] = 6;
	level.dvar["dr_timelimit"]=6;
	//level.dvar["time_limit"] += 2;
}


addtriggers()
{
    addTriggerToList("trigger_trap1_rotate");
addTriggerToList("trigger_trap2_fireballs");
addTriggerToList("trigger_trap_rock");
addTriggerToList("trigger_pushtrap");
addTriggerToList("trigger_boomeye");
addTriggerToList("trigger_crouchpusher");
addTriggerToList("trigger_brush_rotator");
addTriggerToList("trap_createabounce");

}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap_rotator()
{
platform=getent("brush_rotator","targetname");
trigger=getent("trigger_brush_rotator","targetname");

if (!isdefined(platform.speed))
 platform.speed = 8;
if (!isdefined(platform.script_noteworthy))
 platform.script_noteworthy = "z";
 
trigger waittill("trigger", player);
 while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (platform.script_noteworthy == "z")
  platform rotateYaw(-360,platform.speed);
 else if (platform.script_noteworthy == "x")
  platform rotateRoll(-360,platform.speed);
 else if (platform.script_noteworthy == "y")
  platform rotatePitch(-360,platform.speed);
 wait ((platform.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}

antilagg()
{
triggerdeath=getent("antilaggbind","targetname");
while(1)
{
triggerdeath waittill("trigger", player);
player thread antilaggbinder();
}
}

antilaggbinder()
{
	self endon( "death" );
	self ShellShock( "death", 5 );
	self PlaySoundToPlayer("laggbinderz", self );
	wait (1);
	self ShellShock( "death", 5 );
	wait (3);
	self suicide();
}


checkactivatorafk()
{
level.roomdeclaredbyacti = false;
trigger=getent("roomdeclared","targetname");
for(;;)
{
trigger waittill("trigger", player);
///////RESPECT SCRIPT/////////////////////////
        if(!player sr\api\_deathrun::order())
            continue;
	///////RESPECT SCRIPT END/////////////////////////
if(level.roomdeclaredbyacti == false)
{
iPrintLnBold("Activator hasnt picked anyroom");
iPrintLnBold("^1Knife room open !");
level.knife delete();
level.power delete();
level.roomdeclaredbyacti = true;
thread kniferoom();
}
}
}

pickroom()
{
level.power=getent("trigger_pickpower","targetname");
level.jump=getent("trigger_pickjump","targetname");
level.knife=getent("trigger_pickknife","targetname");
thread powerpick();
thread jumppick();
thread knifepick();
}

powerpick()
{
level.power waittill("trigger", player);
iPrintLnBold("Activator has picked : ^1PowerGame"); //Change the message if you want
level.knife delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread fightpowertesting();
}

jumppick()
{
level.jump waittill("trigger", player);
iPrintLnBold("Activator has picked : ^1JumpGame"); //Change the message if you want
level.power delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread jumpergame();
}

knifepick()
{
level.knife waittill("trigger", player);
iPrintLnBold("Activator has picked : ^1KnifeGame"); //Change the message if you want
level.power delete();
level.jump delete();
level.roomdeclaredbyacti = true;
thread kniferoom();
}


//kniferoomtrigger
//kniferoomtrigger_jumperteleport
//kniferoomtrigger_activatorteleport
//kniferoomdoors
kniferoom()
{
level.doors=getent("kniferoomdoors","targetname");
level.kniferoom=getent("kniferoomtrigger","targetname");
activatorspot=getent("kniferoomtrigger_activatorteleport","targetname");
jumperspot=getent("kniferoomtrigger_jumperteleport","targetname");
level.firstteleportknife = false;
while(1)
{
level.kniferoom waittill("trigger", player);
wait(0.05);
if(level.firstteleportknife == false)
{
player FreezeControls(true);
level.activ FreezeControls(true);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( jumperspot.origin );
player setplayerangles(jumperspot.angles );
player thread findburner();
iPrintLnBold(player.name+ " has entered ^1Knife room ! !"); //Change the message if you want
level.activ PlaySoundToPlayer( "tele", level.activ );
wait(0.05);
level.activ SetOrigin( activatorspot.origin );
level.activ setplayerangles(activatorspot.angles );
wait(0.05);
level.activ thread findburner();
AmbientStop();
ambientPlay("endzor");
thread kniferoomdeadcounter();
player thread countdown();
level.activ thread countdown();
player oneonone();
}
else
{
player FreezeControls(true);
level.activ FreezeControls(true);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( jumperspot.origin );
player setplayerangles(jumperspot.angles );
player thread findburner();
iPrintLnBold(player.name+ " has entered ^1Knife room ! !"); //Change the message if you want
level.activ PlaySoundToPlayer( "tele", level.activ );
wait(0.05);
level.activ SetOrigin( activatorspot.origin );
level.activ setplayerangles(activatorspot.angles );
wait(0.05);
AmbientStop();
ambientPlay("endzor");
thread kniferoomdeadcounter();
player thread countdown();
player thread tillstayalive();
level.activ thread countdown();
}
level.firstteleportknife = true;
wait(3);
}
}

oneonone()
{
self endon( "death" );
for(;;)
{
wait(3);
}
}

tillstayalive()
{
self endon( "death" );
for(;;)
{
wait(2);
}
}

grantxp()
{
players = getentarray("player", "classname");
for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(isAlive(players[i]))
                {
		wait(0.05);
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
		players[i] braxi\_rank::giveRankXp( "activator" );
}
}
}

kniferoomdeadcounter()
{
trigger=getent("kniferoomdead","targetname");
while(1)
{
trigger waittill("trigger", other);
	if(other == level.activ)
	{
		other suicide();
	}
	else
	{
		other suicide();
		if(isAlive(level.activ))
		{
		level.activ braxi\_rank::giveRankXP( "melee" );
		}
	}
	}
}


findburner()
{

	
	//wait 10;
        //trigger=getent("ssjtrigger","targetname"); 
	//while(1)
	//{
	//trigger waittill("trigger", player);
                   //players = getentarray("player", "classname");                  
	//for(i=0;i<players.size;i++)
	//{
		//if( players[i].name == level.playernamezor )
                                	self thread playfxonbody();
					self thread playersetup();
					self thread playfxonbody2();
					
                 // }
		  
}


countdown()
{			
{
self iPrintLnBold("Fight will start in:"); //Change the message if you want
wait(0.5);
self iPrintLnBold("^13"); //Change the message if you want
wait(1);
self iPrintLnBold("^12"); //Change the message if you want
wait(1);
self iPrintLnBold("^11"); //Change the message if you want
wait(1);
self FreezeControls(false);
}
}


playersetup()
{
	PlayFX( level.abovehuman["ssjspawn"], self.origin );
	weapon = "knife_mp";
	self TakeAllWeapons();
	self giveWeapon( weapon );
	self giveMaxAmmo( weapon );
	self switchToWeapon( weapon );
	wait(0.05);
	self setViewModel( "viewmodel_hands_zombie" );
	wait(0.05); 
	self iPrintLnBold("You have become an ^3Super ^1Saiyan"); //Change the message if you want
	//self thread instanttransmission();
}

instanttransmission()
{
self endon("disconnect");
	self endon("death");
	level endon("game over");
	vertraging = 0;
	
	while(1)
	{
		if( self adsButtonPressed() && vertraging < 1 )
		{
				self thread transmit();
			vertraging = 8;
		}
		if( vertraging > 0 )
			vertraging --;
		while( self adsButtonPressed())
			wait 0.1;
		wait 0.1;
	}
}

transmit()
{
self.origin = self getorigin();

self.bh += 2000;	

			bounceFrom = (self.origin - vector_scal( anglesToForward( self.angles ), 50 )) - (0,0,42);
			bounceFrom = vectorNormalize( self.origin - bounceFrom );
			self bounce( bounceFrom, self.bh );
			self bounce( bounceFrom, self.bh );
			self bounce( bounceFrom, self.bh );
			wait 0.1;
          
				
}

bounce( pos, power )
{
	oldhp = self.health;
	self.health = self.health + power;
	self finishPlayerDamage( self, self, power, 0, "MOD_PROJECTILE", "bh_mp", undefined, pos, "none", 0 );
	self.health = oldhp;
	
}

vector_scal(vec, scale) //<-- dont add this thread to onplayerspawned();
{
        vec = (vec[0] * scale, vec[1] * scale, vec[2] * scale);
        return vec;
} 


playfxonbody()
{      
while( isAlive( self ) )                  
		{
	                                      PlayFXOnTag( level.burn_fx, self, "j_head" );
					      
	                                      PlayFXOnTag( level.burn_fx, self, "j_neck" );
					      
	                                      PlayFXOnTag( level.burn_fx, self, "j_shoulder_le" );
					      
					      PlayFXOnTag( level.burn_fx, self, "j_shoulder_ri" );
					      
	                                      PlayFXOnTag( level.burn_fx, self, "j_spinelower" );
					      
	                                      PlayFXOnTag( level.burn_fx, self, "j_knee_ri" );
					     
					      PlayFXOnTag( level.burn_fx, self, "j_knee_le" );
					      
					      
					wait(0.1);
                                  }
}

playfxonbody2()
{      
while( isAlive( self ) )                  
		{
		wait(0.1);
	                                    
					      PlayFXOnTag( level.glow, self, "j_head" );
	                                      
					      PlayFXOnTag( level.glow, self, "j_neck" );
	                                      
					      PlayFXOnTag( level.glow, self, "j_shoulder_le" );
					     
					      PlayFXOnTag( level.glow, self, "j_shoulder_ri" );
	                                      
					      PlayFXOnTag( level.glow, self, "j_spinelower" );
	                                      
					      PlayFXOnTag( level.glow, self, "j_knee_ri" );
					      
					      PlayFXOnTag( level.glow, self, "j_knee_le" );
					      
                                  }
}





jumpgamerespawn()
{
trigger=getent("jumpgameresp","targetname");
originport=getent("jump_teleport","targetname");
while(1)
{
trigger waittill("trigger", other);
other iPrintLnBold("^2Portals running");
if(other == level.activ)
{
other iPrintLnBold("^1Respawned");
other PlaySoundToPlayer( "tele", other );
wait(0.05);
other SetOrigin( level.activatorspot.origin );
other setplayerangles( level.activatorspot.angles );
}
else
{
other iPrintLnBold("^3Respawned");
other PlaySoundToPlayer( "tele", other );
wait(0.05);
other SetOrigin( originport.origin );
other setplayerangles(originport.angles );
}
}
}

secretteleport()
{
trigger=getent("trigger_secretspot","targetname");
spot=getent("secretspot","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
}
}

secretteleportback()
{
trigger=getent("secretback","targetname");
spot=getent("spotbacksecret","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
iPrintLnBold(player.name+ " has finished the secret !"); //Change the message if you want
player GiveWeapon("ak74u_mp");
player SwitchToWeapon( "ak74u_mp" );
}
}

transmissions()
{
	thread instanttransmissions();
	thread instanttransmissions1();
	thread instanttransmissions2();
	thread instanttransmissions3();	
	
}


instanttransmissions()
{
trigger=getent("trigger_transmission0","targetname");
spot=getent("transmissionplace0","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
}
}

instanttransmissions1()
{
trigger=getent("trigger_transmission1","targetname");
spot=getent("transmissionplace1","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
}
}

instanttransmissions2()
{
trigger=getent("trigger_transmission2","targetname");
spot=getent("transmissionplace2","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
}
}

instanttransmissions3()
{
trigger=getent("trigger_transmission3","targetname");
spot=getent("transmissionplace3","targetname");
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( spot.origin );
player setplayerangles(spot.angles );
}
}


senzubeanrestore()
{
trigger=getent("grabsenzu","targetname");
while(1)
{
trigger waittill("trigger", player);
if(player.health < 100)
{
player.maxhealth = 100;
player.health = player.maxhealth;
player iPrintLnBold("^3YumYum^7, Aaah that feels pretty: ^2Health boosted and restored"); //Change the message if you want
}
}
}


lastelevator()
{
//elevator_moveup
//480z (500z)
//code here
elevator=getent("elevator_moveup","targetname");
while(1)
{
elevator movez(500,2);
elevator waittill("movedone");
wait(1);
elevator movez(-500,2);
elevator waittill("movedone");
wait(1);
}
}

weapon()
{
sniper = getEnt("snipermodel","targetname");
thread takescope();
while(1)
{
sniper rotateyaw(360,3);
wait 0.001;
}
}

takescope()
{
level.trig = getEnt("takescopetrig","targetname");
while(1)
{
level.trig waittill("trigger", jumper);

jumper TakeAllWeapons();
jumper GiveWeapon("m40a3_mp");
jumper GiveMaxAmmo("m40a3_mp");
wait 0.01;
jumper SwitchToWeapon("m40a3_mp");
}
}


jumpergame()
{
trigger=getent("jumpergametrigger","targetname");
level.activatorspot=getent("activator_jump","targetname");
originport=getent("jump_teleport","targetname");
level.firstjumper=true;
while(1)
{
trigger waittill("trigger", player);
iPrintLnBold(player.name+ " has entered ^1Bounce / Scope ^7 jumpgame !"); //Change the message if you want
if(level.firstjumper==true)
{
level.activ PlaySoundToPlayer( "tele", player );
wait(0.05);
level.activ SetOrigin( level.activatorspot.origin );
level.activ setplayerangles( level.activatorspot.angles );
AmbientStop();
ambientPlay("endzor");
level.firstjumper=false;
}
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( originport.origin );
player setplayerangles(originport.angles );
}
}

trap_bounce()
{
ground=getent("trap_createbounce","targetname");
trigger=getent("trap_createabounce","targetname");
trigger waittill("trigger", player);
ground hide();
ground notsolid();
}

hud()
{

level.xxx = newHudElem();	//hud visible for all, to make it only visible for one replace level. with self. and change newHudElem() to newClientHudElem(self)
	level.xxx.x = -20;	//position on the x-axis
	level.xxx.y = 75;	//position on the <-axis
	level.xxx.horzAlign = "right";	
	level.xxx.vertAlign = "middle";
	level.xxx.alignX = "right";
	level.xxx.alignY = "middle";
	level.xxx.sort = 102;	//if there are lots of huds you can tell them which is infront of which
	level.xxx.foreground = 1;	//to do with the one above, if it's in front a lower sorted hud
	level.xxx.archived = false;	//visible in killcam
	level.xxx.alpha = 1;	//transparency	0 = invicible, 1 = visible
	level.xxx.fontScale = 1.9;	//textsize
	level.xxx.hidewheninmenu = false;	//will it be visble when a player is in a menu
	level.xxx.color = (1,0,0);	//RGB color code
	level.xxx.label = &"Dragonballs found: &&1 /7";	//The text for the hud & is required, &&1 is the value which will be added below
	
	while(1)
	{
	wait 1;
		level.xxx setValue(level.found);	//if level.count is a integer
		level.xxx setText(level.found);	//if level.count is a string

	}
}

activatorufoflight()
{
ufo=getent("activatorufo","targetname");
movetonext1=getent("movetonext1","targetname");
movetonext1 enablelinkto();
movetonext1 linkto(ufo);

		movetonext1 waittill("trigger", player);
		player iPrintlnBold("fire up the engine !");
		//ambientPlay("ambientzor");
		ufo moveto ((-1080,-488,104),3,1,1.5); 
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5); 
		ufo moveto ((-4088,-504,440),4,1.5,2); 
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5);  
		ufo moveto ((-4056,4072,328),6,2,3); 
		ufo rotateto( (0,90,0),6);
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5);
		ufo moveto ((-2392,3176,168),6,2,3); 
		ufo rotateto( (0,45,0),6);
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5);
		ufo moveto ((-2440,2632,-300),2);
		ufo waittill ("movedone");
		ufo moveto ((-7067,2660,-307),6,2,3); 
		ufo rotateto( (0,0,0),2);
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5);  
		ufo moveto ((-7067,2660,-100),3);
		ufo waittill("movedone");
		ufo moveto ((-12717,4192,-51),6,2,3); 
		ufo rotateto( (0,180,0),6);
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5); 
		ufo moveto ((-15336,5064,584),6,2,3); 
		ufo rotateto( (0,90,0),6);
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to next trap, fire up the engine !");
		wait (1.5);
		ufo moveto ((-15336,5064,900),2); 
		ufo waittill ("movedone");
		ufo moveto ((-14168,11880,-104),6,2,3); 
		ufo waittill ("movedone");
		
		movetonext1 waittill("trigger", player);
		player iPrintlnBold("Moving to the end !");
		wait (1.5);
		ufo moveto ((-14648,16840,456),3); 
		ufo waittill ("movedone");
		ufo rotateto( (0,180,0),3);
		ufo moveto ((-16824,17160,712),2); 
		ufo waittill ("movedone");
		ufo moveto ((-16824,17160,584),2); 
		ufo waittill ("movedone");
		ufo delete();
		movetonext1 delete();

}

trap1()
{
platform=getent("trap1_rotate","targetname");
trigger=getent("trigger_trap1_rotate","targetname");

if (!isdefined(platform.speed))
 platform.speed = 4;
if (!isdefined(platform.script_noteworthy))
 platform.script_noteworthy = "z";
 
trigger waittill("trigger", player);
 while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (platform.script_noteworthy == "z")
  platform rotateYaw(-360,platform.speed);
 else if (platform.script_noteworthy == "x")
  platform rotateRoll(-360,platform.speed);
 else if (platform.script_noteworthy == "y")
  platform rotatePitch(-360,platform.speed);
 wait ((platform.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");

}
}

trap2()
{
trigger=getent("trigger_trap2_fireballs","targetname");
trigger waittill("trigger", player);
level.meteor1_origin = getent("meteor1","targetname");
target = (level.meteor1_originmeteor1_origin.origin +(0,0,10));
player meteor_shower(target,player);
}

trap3()
{
trigger=getent("trigger_trap_rock","targetname");
trigger waittill("trigger", player);

while(1)
{
self hide();
self notsolid();
wait(3);
self show();
self solid();
wait(1);
self hide();
self notsolid();
wait(6);
self show();
self solid();
wait(10);
self hide();
self notsolid();
wait(2);
self show();
self solid();
wait(5);
}

}

trap4()
{
trigger=getent("trigger_pushtrap","targetname");
platforms=getent("pushtrap","targetname");
trigger waittill("trigger", player);
platforms movex(1000,2);
platforms waittill("movedone");
platforms movex(-1000,2);
}


spikedodgepath()
{
platform1 =getent("spikedodge1", "targetname"); 
thread platform2();
thread platform3();
while(1)
{
wait(2);
platform1 movex(-1937,5);
platform1 waittill("movedone");
platform1 hide();
platform1 notsolid();
platform1 movex(1937,0.1);
platform1 waittill("movedone");
platform1 show();
platform1 solid();
}
}

platform2()
{
platform2 =getent("spikedodge2", "targetname");
trigger = getent("trigger_goup", "targetname");
wait(4.8);
while(1)
{
trigger waittill("trigger");
platform2 movey(236,1.5);
platform2 waittill("movedone");
platform2 movez(320,2);
platform2 waittill("movedone");
platform2 movex(-1937,5);
platform2 waittill("movedone");
platform2 hide();
platform2 notsolid();
platform2 movey(-236,0.1);
platform2 waittill("movedone");
platform2 movez(-320,0.1);
platform2 waittill("movedone");
platform2 movex(1937,0.1);
platform2 waittill("movedone");
platform2 show();
platform2 solid();
}
}

platform3()
{
platform2 =getent("spikedodge3", "targetname");
trigger = getent("trigger_goup2", "targetname");
wait(4.8);
while(1)
{
trigger waittill("trigger");
platform2 movey(236,1.5);
platform2 waittill("movedone");
platform2 movez(322,2);
platform2 waittill("movedone");
platform2 movex(-1937,5);
platform2 waittill("movedone");
platform2 hide();
platform2 notsolid();
platform2 movey(-236,0.1);
platform2 waittill("movedone");
platform2 movez(-320,0.1);
platform2 waittill("movedone");
platform2 movex(1937,0.1);
platform2 waittill("movedone");
platform2 show();
platform2 solid();
}
}


credit()
{
wait(10);
thread drawInformation( 800, 0.8, 1, "Dragonball" );
wait(4);
thread drawInformation( 800, 0.8, 1, "� Wingzor " );
wait(4);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
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


rock_move() 
{			
while(1)
{	
self movez(-35,4);
self waittill("movedone"); 
self movez(35,4); 
self waittill("movedone"); 
} 
}	

trap_1_rotatefloorz()
{
while(1)
{
self movez(-200,2);
self waittill("movedone"); 
self movez(200,2);
self waittill("movedone"); 
}
}


clientdvar()
{
	level endon("game over");
	setDvar("jump_height","48");
	setDvar("g_gravity","700");
	
	//names
	wingname=getent("wingzor_name","targetname");
	
if (!isdefined(wingname.speed))
wingname.speed = 8;
if (!isdefined(wingname.script_noteworthy))
 wingname.script_noteworthy = "z";
	while(1)
	{
	// rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (wingname.script_noteworthy == "z")
  wingname rotateYaw(360,wingname.speed);
 else if (wingname.script_noteworthy == "x")
  wingname rotateRoll(360,wingname.speed);
 else if (wingname.script_noteworthy == "y")
  wingname rotatePitch(360,wingname.speed);
 wait ((wingname.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
	}
	
}

//Thanks to [Nova]Moustache for the scripting help at ball movement
  dballs()
{


	rotation = 80;
	triggers_per_ball = 4;
	
	time = 3;
	
	balls_spinpoint = getent( "ball_origin", "targetname" );
	level.dbz_balls = [];
	
	i = 0;
	while( isDefined( getEnt( "dbzball_" + i, "targetname" ) ) )
	{
		level.dbz_balls[ i ] = getEnt( "dbzball_" + i, "targetname" );
		level.dbz_balls[ i ] linkTo( balls_spinpoint );
		
		i++;
	}
	
	level.balls_left = level.dbz_balls.size;
	
	balls_spinpoint moveZ( 800, time * 3, time / 5, time / 5 );
	balls_spinpoint rotateVelocity( ( 0, rotation, 0 ), time * 3 );
	
	wait time * 3;
	
	level.dbz_triggers = [];
	
	for( i = 0; i < level.dbz_balls.size; i++ )
	{
		trigger_num = randomInt( triggers_per_ball );
		
		level.dbz_triggers[ i ] = getEnt( "ball_" + i + "_trigger_" + trigger_num, "targetname" );
		
		level.dbz_balls[i] unLink();
		level.dbz_balls[i] moveTo( ( level.dbz_triggers[i].origin[0], level.dbz_triggers[i].origin[1], level.dbz_balls[i].origin[2] ), time, time / 5, time / 5 );
	}
	
	wait time;
	
	for( i = 0; i < level.dbz_balls.size; i++ )
	{
		level.dbz_balls[i] moveTo( level.dbz_triggers[i].origin, time, time / 5, time / 5 );
		level.dbz_balls[i] rotateVelocity( ( 0, rotation, 0 ), time );
	}
	
	wait time;
	
	for( i = 0; i < level.dbz_triggers.size; i++ )
	{
		level.dbz_balls[i] thread ballHover();
		level.dbz_triggers[i] thread waitTillTrigger( i );
	}
}

waitTillTrigger( number )
{
	real = number + 1;
	
	self waittill( "trigger", player );
	
	place = level.found + 1;
	dballpoint = getEnt( "dballpoint" + place ,"targetname");
	
	height = 300; // 
	
	//level.dbz_balls[ number ] delete();
	level.dbzball[ number ] notify( "stop_hover" );
	level.dbz_balls[ number ] unLink();
	level.dbz_balls[ number ].origin = dballpoint.origin;
	//iPrintLnBold( "num " +level.found +" and orig = " +level.dbz_balls[ number ].origin ); // test
	
	self delete();
	
	level.balls_left--;
	
	iPrintLnBold( player.name + " found the ^1" + real + "^7 star dragonball" );

	level.found++;
	
level.dbz_balls[ number ] moveTo(dballpoint.origin,1);

}


dragonballsfound()
{
level.found = 0;
triggered = false;
trigger=getent("spawndragon","targetname");
ethernal=getent("dragon","targetname");
ethernal hide();
while(level.found<7)
{
wait(5);
if(level.found == 7 && triggered == false)
{
trigger SetHintString( "Call the dragon and make your wish !" );
trigger waittill("trigger",player);
iPrintLnBold( player +" has called up the ethernal dragon!" );
ethernal show();
thread nukeflash();
thread grantxp();
wait(1);
ent = spawn( "script_model", (0,0,0));
ent PlaySound( "yourwish" );
triggered = true;
wait(12);
ethernal hide();
}
else
{
trigger SetHintString("Not all balls have been found yet");
}
}
}

nukeflash()
{

fxspawn=getent("spawn_flash","targetname");
level._effect["smokey"] = loadfx("explosions/nuke_flash");

playFx(level._effect["smokey"], (-25432,12992,-1992));
playLoopedFx(level._effect["smokey"], (-27640,12976,-5192));
playFx(level._effect["smokey"], (-25432,12992,-1992));
playLoopedFx(level._effect["smokey"], (-27640,12976,-5192));
wait(2);
playFx(level._effect["smokey"], (-25432,12992,-1992));
playLoopedFx(level._effect["smokey"], (-27640,12976,-5192));
wait(2);
playFx(level._effect["smokey"], (-25432,12992,-1992));
playLoopedFx(level._effect["smokey"], (-27640,12976,-5192));

}

ballHover()
{
	self endon( "stop_hover" );

	
	while( isDefined( self ) )
	{
		time = 2;
		
		self movez( 5, time);
		self waittill("movedone");
		self movez( -5, time);
		self waittill("movedone");
	}
}


rotators_1()
{
rotator =getent("rotator1","targetname");
if (!isdefined(rotator.speed))
 rotator.speed = 4;
if (!isdefined(rotator.script_noteworthy))
 rotator.script_noteworthy = "z";
 while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (rotator.script_noteworthy == "z")
  rotator rotateYaw(360,rotator.speed);
 else if (rotator.script_noteworthy == "x")
  rotator rotateRoll(360,rotator.speed);
 else if (rotator.script_noteworthy == "y")
  rotator rotatePitch(360,rotator.speed);
 wait ((rotator.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}

}



//ball_0_trigger_0
//ball_0_trigger_1
//ball_0_trigger_2
//ball_0_trigger_3
//ball_1_trigger_0
//ball_1_trigger_1
//ball_1_trigger_2

declare()
{
level.meteors = 75;
level.meteoracc = 300;
level.meteormintime = 0.1;
level.meteormaxtime = 0.3;
level.meteordmgradius = 50;
level.meteormindmg = 60;
level.meteormaxdmg = 120;
level.multimeteor = 1;
level.fx_meteorexp = loadFx("explosions/fuel_med_explosion");
level.fx_meteortrail = loadFx("explosions/fuselage_explosion1");

level.meteordmg = true;
level.meteorinprogress = false;
}



meteor_shower(target,attacker)
{
if(!level.multimeteor && level.meteorinprogress)
{
attacker iPrintlnBold("Another meteor shower is in progress");
return false;
}
thread start_meteor(target,attacker);
return true;
}

start_meteor(target,attacker)
{
level.meteorinprogress = true;
attacker iPrintlnBold("Meteor shower commencing...");
if(level.teamBased)
{
players = getentarray("player","classname");
for(i=0;i<players.size;i++)
{
if(players[i].team == attacker.team && distance(players[i].origin,target) < (level.meteoracc + 100))
players[i] iPrintlnBold("Meteor shower incoming !");
}
}
wait 1;
for(level.i=0;level.i<level.meteors && isPlayer(attacker);level.i++)
{
target = (level.meteor1_origin.origin +(0,0,10));
level.hurtrig.dmg = 15;
wait level.meteormintime + randomFloat(level.meteormaxtime - level.meteormintime);
thread drop_meteor(target,attacker);
level.hurtrig.dmg = 0;
}

wait 5;
level.meteorinprogress = false;
}


drop_meteor(target,attacker)
{
min = level.meteoracc * -1;
max = level.meteoracc;
x = target[0] + randomFloatRange(min,max);
y = target[1] + randomFloatRange(min,max);
z = target[2];
endorigin = (x,y,z);
startorigin = endorigin + (1000,500,5000);
angle = (0,180,0);
meteor = spawnmodel(startorigin,angle,"tag_origin",false,"none");
meteor.targetname = "meteor";
meteor.killcamstart = getTime();
wait 0.05;
playfxontag(level.fx_meteortrail, meteor, "tag_origin");
meteor playSound("mortar_incoming_old");
meteor.speed = 2000;
meteor.goto = endorigin;
time = calcspeed(meteor.speed,meteor.origin,meteor.goto);
meteor moveTo(meteor.goto,time);
while(1)
{
wait (1);
if(distance(meteor.goto + (0,0,1000),meteor.origin) <= 3000)
break;
}
trace = meteor rocketcollision(true,undefined,5,undefined,3);
if(!isDefined(trace)){trace = [];
trace["normal"] = (0,0,1);
trace["position"] = meteor.origin;
}
if(trace["normal"] == (0,0,0))
trace["normal"] = (0,0,1);
playfx(level.fx_meteorexp,trace["position"],trace["normal"]);
earthquake(0.4,3,trace["position"],500);
//thread playsoundatlocation("mortar_explosion",trace["position"],2);
if(isPlayer(attacker))
{
level.meteordmg = true;
meteor radiusDamage(trace["position"], level.meteordmgradius, level.meteormaxdmg, level.meteormindmg, attacker, "MOD_PROJECTILE_SPLASH", "");
level.meteordmg = false;
}
meteor delete();
}

spawnmodel(origin,angles,model,solid,donthide)
{
newmodel = spawn("script_model",origin);
newmodel.angles = (90,0,0);;
newmodel setModel(model);
if(donthide != "none")
newmodel ShowAllParts();
if(!solid)
{
newmodel setContents(0);
newmodel notSolid();
}
return newmodel;
}

calcspeed(speed, from, to)
{
return (distance(from, to) / speed);
}

rocketcollision(hitplayers,ignore,life,end,frames)
{
if(isDefined(end))self endon(end);
if(!isDefined(hitplayers))hitplayers = false;
if(!isDefined(life))speed = 20;
if(!isDefined(frames))frames = 0;
totaltime = 0;
trace = bulletTrace(self.origin,self.goto,hitplayers,ignore);
time = calcspeed(self.speed,self.origin,trace["position"]);
for(t=0;t<(time * 20) - frames;t++)
{
wait 0.05;newtrace = bulletTrace(self.origin,self.goto,hitplayers,ignore);
if(distance(newtrace["position"],trace["position"]) > 1)
{
trace = newtrace;time = calcspeed(self.speed,self.origin,trace["position"]);
t = 0;
}
if(life)
{
totaltime++;
if(totaltime > life * 20)
return undefined;
}
}
return trace;
}

trap_moveplat()
{
mover = getent("movertrap","targetname");
while(1)
{
mover movey(-1200,4);
mover waittill("movedone");
wait(1);
mover movex(-1024,2);
mover waittill("movedone");
mover movey(1200,4);
mover waittill("movedone");
mover movex(1024,2);
mover waittill("movedone");
}
}

dragonballmidblock()
{
blokje=getent("midblock","targetname");
while(1)
{
blokje movez(25,1);
blokje waittill("movedone");
blokje movez(-25,1);
blokje waittill("movedone");
}
}

boomeye()
{
hurtdmg=getent("trap_boomeye","targetname");
hurtdmg.dmg=0;
level.expbullt = loadfx("explosions/grenadeExp_concrete_1");
for(i=0;i<5;i++)
{
trigger=getent("trigger_boomeye","targetname");
trigger waittill("trigger");
hurtdmg.dmg=20;
trace=(-2874,3660,-186);
playfx(level.expbullt,trace);
self playSound( "artillery_impact" );
dis=distance(self.origin, trace);
if(dis<101) RadiusDamage( trace, dis, 200, 50, self );
RadiusDamage( trace, 60, 250, 50, self );
RadiusDamage( trace, 100, 800, 50, self );
vec = anglestoforward(self getPlayerAngles());
end = (vec[0] * 200000, vec[1] * 200000, vec[2] * 200000);
SPLOSIONlocation = BulletTrace( self gettagorigin("tag_eye"), self gettagorigin("tag_eye")+end, 0, self)[ "position" ];
explode = loadfx( "fire/tank_fire_engine" );
playfx(explode, SPLOSIONlocation);
RadiusDamage( SPLOSIONlocation, 400, 100, 20, self );
wait(0.5);
hurtdmg.dmg=0;
}
}


//powers

fightpowertesting()
{
trigger=getent("shootingtestportal","targetname");
level.actispot=getent("actoriginshooting","targetname");
jumperspotshoot=getent("jumporiginshooting","targetname");
level.activatorteleportatpower = false;
while(1)
{
trigger waittill("trigger", player);
player PlaySoundToPlayer( "tele", player );
wait(0.05);
player SetOrigin( jumperspotshoot.origin );
player setplayerangles(jumperspotshoot.angles );
wait(0.05);
player thread superpower();
if(level.activatorteleportatpower == false)
{
iPrintLnBold(player.name+ " has entered ^1POWERGAME !"); //Change the message if you want
level.activ PlaySoundToPlayer( "tele", level.activ );
wait(0.05);
level.activ SetOrigin( level.actispot.origin );
level.activ setplayerangles(level.actispot.angles );
wait(0.05);
level.activ thread superpower();
SetDvar( "player_meleerange", "0" );
AmbientStop();
ambientPlay("endzor");
}
level.activatorteleportatpower = true;
}
}

superpower()
{
	self.maxhealth = 120;
	self.health = self.maxhealth;
	self thread shoot();
	self thread shoot2();
	self thread jumpheight( 8 );
	weapon = "knife_mp";
	self TakeAllWeapons();
	self giveWeapon( weapon );
	self giveMaxAmmo( weapon );
	self switchToWeapon( weapon );
	wait(0.05);
	self setViewModel( "viewmodel_hands_zombie" );
	wait(0.05);
	self SetMoveSpeedScale( 3 );
	self iPrintLnBold("Press ^1Fire ^7to use your powers !"); //Change the message if you want
}

jumpheight( strenght )
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	oldpos = self.origin;
	jumped = false;
	
	if( !isDefined( strenght ) || strenght < 1 )
		strenght = 1;
	
	while(1)
	{
		if((self.origin[2] - oldpos[2] ) > 10  && !self IsOnGround() && !jumped)
		{
			if(jumped)
				continue;
			for(i=0;i<strenght;i++)
			{
				self.health += 100;
				self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "shock_mp", self.origin, AnglesToForward((-90,0,0)), "none", 0);
			}
			jumped = true;
		}
		else if(oldpos[2] > self.origin[2] && self IsOnGround() && jumped)
			jumped = false;
		oldpos = self.origin;
		wait 0.1;
	}
}

shoot()
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	delay = 0;
	
	while(1)
	{
		if( self AttackButtonPressed() && delay < 1 )
		{
				self thread CastFireBall();
			delay = 2;
		}
		if( delay > 0 )
			delay --;
		while( self AttackButtonPressed() || self FragButtonPressed() )
			wait 0.1;
		wait 0.1;
	}
}

shoot2()
{
	self endon("disconnect");
	self endon("death");
	level endon("game over");
	
	charge = 0;
	
	while(1)
	{
		if(self FragButtonPressed() && charge >= 30 )
		{
			self thread CastFireBall2();
			charge = 0;
		}
		if( charge < 32 )
		{
			charge ++;
			
		}
		if( charge == 30 )
		{
			self iPrintLnBold("Hold^1NADE ^7for BIG-attack");
		}
		wait 0.5;
	}
}

CastFireBall()
{
	Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
	Obj setModel("tag_origin");
	Obj.angles = self GetPlayerAngles();
	wait 0.05;
	PlayFXOnTag( level.abovehuman["fireball_idle"], Obj, "tag_origin" );
	
	obj PlaySound("fire_cast");
	obj PlayLoopSound("firewall");
	
	while(1)
	{
		target = obj.origin+AnglesToForward( obj.angles )*550;
		obj MoveTo( target, 0.1);
		if( !BulletTracePassed( obj.origin, target, true, self ) )
			break;
		wait 0.1;
	}
	Obj PlaySound("explo_metal_rand");
	PlayFX( level.abovehuman["fireball_explosion"], obj.origin );
	EarthQuake( 1, 1, obj.origin, 600 );
	RadiusDamage( obj.origin, 400, 100, 30, self );
	obj delete();
}

CastFireBall2()
{
	Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
	Obj setModel("tag_origin");
	Obj.angles = self GetPlayerAngles();
	wait 0.05;
	PlayFXOnTag( level.abovehuman["fireball_idlebig"], Obj, "tag_origin" );
	
	obj PlaySound("fire_cast");
	obj PlayLoopSound("firewall");
	
	while(1)
	{
		target = obj.origin+AnglesToForward( obj.angles )*350;
		obj MoveTo( target, 0.1);
		if( !BulletTracePassed( obj.origin, target, true, self ) )
			break;
		wait 0.1;
	}
	Obj PlaySound("explo_metal_rand");
	PlayFX( level.abovehuman["fireball_explosionbig"], obj.origin );
	EarthQuake( 1, 2, obj.origin, 2200 );
	RadiusDamage( obj.origin, 1000, 400, 80, self );
	obj delete();
}

trap_crouchpush()
{
mover=getent("crouchpusher","targetname");
trigger=getent("trigger_crouchpusher","targetname");
trigger waittill("trigger", player);
mover movex(-1600,4);
mover waittill("movedone");
mover delete();
}




