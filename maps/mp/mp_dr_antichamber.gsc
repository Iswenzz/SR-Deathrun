//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Map made by Sheep Wizard
//youtube: http://www.youtube.com/user/paap15
//xfire: paap15
//Feel free to use any of this but give credit where credit is due
//Song sayCet-Dream Factory
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
main()
{
     maps\mp\_load::main();
	 level.burst2 = loadFX("deathrun/burst2");
	 level.blackring = loadFX("deathrun/blackring");
	 level.greensmoke = loadFX("deathrun/greensmoke");
	 
	 game["allies"] = "marines";
     game["axis"] = "opfor";
     game["attackers"] = "axis";
     game["defenders"] = "allies";
     game["allies_soldiertype"] = "desert";
     game["axis_soldiertype"] = "desert";
	 
	 precacheShader("mtl_plr_baa_joker_head");
     precacheShader("mtl_plr_baa_joker_hair");
     precacheShader("mtl_plr_baa_joker_body"); 
     precacheModel("playermodel_baa_joker");
	 precacheItem("m40a3_mp");
	 precacheItem("tomahawk_mp");
	 precacheItem("winchester1200_mp");
	 
	 setdvar( "bg_falldamagemaxheight", "9999" );
     setdvar( "bg_falldamageminheight", "9998" );
	 //setdvar("r_fullbright", "1");
	 
	 //Threads\\
	 
	 thread start();
	 thread eye();
	 thread jumper();
	 thread deagle();
	 thread ammo();
	 thread Teleport();
	 thread Teleport2();
	 thread Teleport3();
	 thread Teleport4();
	 thread sho();
	 thread sign();
	 thread musicon();
	 thread trap1();
	 thread trap2();
	 thread trap3();
	 thread trap4();
	 thread trap5();
	 thread trap6();
	 thread trap7();
	 thread room();
	 thread secret();
	 thread death();
	 //thread distraction(); moved to sniper(). Change is back here if you want it going all the time.
	 thread hud();
	 thread theend();
	 thread sniper();
	 thread knife();
	 thread shotgun();
	 
	 playLoopedFX(level.blackring, 0.05, (-3484, 2396, -31));
	  
}

//Random poop\\

start()
{
     start = getent("start", "targetname");
	 wait 2;
	 iPrintLn("^6Map by ^5Sheep Wizard");
	 wait 0.1;
	 iPrintLn("^6Xfire: ^5paap15");
	 wait 0.1;
	 iPrintLn("^6youtube: ^5paap15");
	 wait 10; 
	 start movez(88,8);
	 iPrintLn("^3Begin");
}
	 
secret()
{
     trig = getent("secret_trig", "targetname");
	 secret2 = getent("secret2", "targetname");
	 fail = getent("fail", "targetname");
	 secret2 notsolid();
	 trig waittill("trigger", player);
	 secret2 solid();
	 player FreezeControls(1);
	 player iprintlnbold("^2Welcome to my secret");
	 wait 1;
	 player iprintlnbold("^3You have 13 second to find the way out");
	 wait 2;
	 player iprintlnbold("^4Good luck");
	 player FreezeControls(0);
	 thread swipe();
	 thread end();
	 wait 13;
	 player SetOrigin(fail.origin); 
     player SetPlayerAngles( fail.angles ); 
}	 
swipe()
{
	 swipe = getent("swipe", "targetname");
	 for(;;)
	 {
	     swipe movey(-167,0.5);
		 swipe waittill("movedone");
		 swipe movey(167,0.5);
		 swipe waittill("movedone");
		}
}
end()
{
     end = getent("secret_end", "targetname");
	 fail = getent("fail", "targetname");
	 end waittill("trigger", player);
	 fail delete();
}

death()
{
     death = getent("death", "targetname");
	 for(;;)
	 {
	 death movez(-50,1);
	 death waittill("movedone");
	 death movez(50,1);
	 death waittill("movedone");
	 wait 15;
	 }
}

distraction()
{
     dist1 = getent("dist1", "targetname");
	 dist2 = getent("dist2", "targetname");
	 for(;;)
	 {
	 dist1 movey(-768,0.8);
	 dist2 movey(760,0.8);
	 dist1 waittill("movedone");
	 dist1 movey(768,0.8);
	 dist2 movey(-760,0.8);
	 dist1 waittill("movedone");
	 }
}
	
hud() 
{
     level.xxx2 = newHudElem();	//hud visible for all, to make it only visible for one replace level. with self. and change newHudElem() to newClientHudElem(self)
	 level.xxx2.x = 0;	//position on the x-axis
	 level.xxx2.y = -200;	//position on the <-axis
	 level.xxx2.horzAlign = "left";	
	 level.xxx2.vertAlign = "middle";
	 level.xxx2.alignX = "left";
	 level.xxx2.alignY = "middle";
	 level.xxx2.sort = 102;	//if there are lots of huds you can tell them which is infront of which
	 level.xxx2.foreground = 1;	//to do with the one above, if it's in front a lower sorted hud
	 level.xxx2.archived = true;	//visible in killcam
	 level.xxx2.alpha = 1;	//transparency	0 = invicible, 1 = visible
	 level.xxx2.fontScale = 1.4;	//textsize
	 level.xxx2.hidewheninmenu = false;	//will it be visble when a player is in a menu
	 level.xxx2.color = (0,191,255);	//RGB color code
	 while(1)
	 {
	 level.xxx2.label = &"Map by Sheep Wizard";	//The text for the hud & is required, &&1 is the value which will be added below
	 wait 10;
	 level.xxx2.label = &"Xfire: Paap15";
	 wait 5;
	}
}

theend()
{
     totheend = getent("totheend", "targetname");
	 for(;;)
	 {
	 totheend movex(1280,1.5);
	 totheend waittill("movedone");
	 wait 1;
	 totheend movex(-1280,1.5);
	 totheend waittill("movedone");
	 wait 1;
	}
}
	
musicon()
{
     trig = getent("musicon", "targetname");
	 trig2 = getent("musicoff", "targetname");
	 int = 0;
	 while(int < 4)
	 {
	     trig waittill ("trigger", player);
		 ambientPlay("song");
		 iPrintLn ("^3Now playing ^2<^6sayCet - Dream Factory^2>");
		 int++;
		 wait 5;
		 trig2 waittill ("trigger", player);
		 AmbientStop( 3 );
		 wait 5;
	 }
}

room()
{
	 thread dog();
	 thread cube();
	 thread pole();
	 thread dance();
}

dog()
{
     rotate_obj = getent("rotate","targetname");
     for(;;)
	 {
	 rotate_obj rotateyaw(360,2);
	 wait 1;
	 }
}
cube()
{
	 thread spinx();
	 thread spiny();
	 thread spinz();
}
spinx()
{
     cube = getent("cube", "targetname");
     for(;;)
	 {
	 cube rotateyaw(360,2);
	 wait 1;
	 }
}
spiny()
{
     cube = getent("cube", "targetname");
     for(;;)
	 {
	 cube rotateroll(360,2);
	 wait 1;
	 }
}
spinz()
{
     cube = getent("cube", "targetname");
     for(;;)
	 {
	 cube rotatepitch(360,2);
	 wait 1;
	 }
}
pole()
{
     pipe1 = getent("pipe1", "targetname");
     pipe2 = getent("pipe2", "targetname");
	 pipe3 = getent("pipe3", "targetname");
	 for(;;)
	 {
	 pipe1 movey(-96,2);
	 pipe2 movez(118,2);
	 pipe3 movez(-118,2);
	 wait 3;
	 pipe1 movey(96,2);
	 pipe2 movez(-118,2);
	 pipe3 movez(118,2);
	 wait 3;
	 }
}
dance()
{
     trig = getent("dance", "targetname");
	 inbox = getent("inbox", "targetname");
	 outbox = getent("outbox", "targetname");
	 
	 for(;;)
	 {
	     trig waittill ("trigger", player); 
		 player SetOrigin(inbox.origin); 
         player SetPlayerAngles( inbox.angles ); 
		 player TakeAllWeapons();
		 player detachAll();
		 player setModel("playermodel_baa_joker");
		 wait 16;
		 player SetOrigin(outbox.origin); 
         player SetPlayerAngles( outbox.angles ); 
		 player giveWeapon ("deserteagle_mp");
	     player SwitchToWeapon("deserteagle_mp");
	     player setWeaponAmmoClip( "deserteagle_mp", 0 );
         player setweaponammostock( "deserteagle_mp", 0 );
		 wait 3; 
		}
}


sho()
{
     trig = getent("shotrig", "targetname");
	 sho1 = getent("sho1", "targetname");
	 sho2 = getent("sho2", "targetname");
     sho3 = getent("sho3", "targetname");  
     sho4 = getent("sho4", "targetname");
	 
	 sho1 hide();
	 sho2 hide();
	 sho3 hide();
	 sho4 hide();
	 
	 trig waittill ("trigger", player);
	 
	 sho1 show();
	 wait 0.2;
	 sho2 show();
	 wait 0.2;
	 sho3 show();
	 wait 0.2;
	 sho4 show();
	 
}


eye()
{
     trig = getent("eyetrig","targetname");
	 eye = getent("eye","targetname");
	 wall1 = getent("wall1","targetname");
	 wall2 = getent("wall2","targetname");
	 
	
	 	
	 trig waittill ("trigger", player);
	 trig delete();
	 
	 playFX(level.burst2, (2273, 432, 74));
	 
	 wall1 delete();
	 wall2 notSolid();
	 
}

jumper()
{
jumpx = getent ("jump","targetname");
air1 = getent ("air1","targetname");
air2 = getent ("air2","targetname");





	while (1)
	{
	jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{

		//throw = user.origin + (100, 100, 0);
		air = spawn ("script_model",(0,0,0));

		air.origin = user.origin;
		air.angles = user.angles;
		user linkto (air);
		time = 1;
            air moveto (air1.origin, 0.2);
		wait 0.5;
            air moveto (air2.origin, 0.2);



		//air moveto (throw, time, 0.5,0.5);
		//air moveto (throw, time, 0.5,0.5);
		wait 0.1;
		user unlink();
		wait 0.5;
		}
	}
}

buff1()
{
     buff1 = getent("buff1", "targetname");
	 buff1 waittill("trigger", player);
	 iPrintLn("^6"+ player.name + " Got ^5speed ^6buff!");
	 player thread speed();
}
speed()
{
     self SetMoveSpeedScale(2);
}
buff2()
{
     buff2 = getent("buff2", "targetname");
	 buff2 waittill("trigger", player);
	 iPrintLn("^6"+ player.name + " Got ^5jump height ^6buff!");
	 player thread jump();
}
jump()
{
     self jumpheight( 4 );
}
jumpheight( strenght ) //Originally Written by Wingzor
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
slow()
{
     self SetMoveSpeedScale(0.2);
}

deagle()
{
     
	 deagle = getent("deagle", "targetname");
	 
	 for(;;)
	 {
	 deagle waittill("trigger", player);
	 
	 player TakeAllWeapons();
	 player giveWeapon ("deserteagle_mp");
	 player SwitchToWeapon("deserteagle_mp");
	 player setWeaponAmmoClip( "deserteagle_mp", 0 );
     player setweaponammostock( "deserteagle_mp", 0 );
	 }
	 
}

sign()
{
     sign1 = getent("sign1", "targetname");
	 sign1a = getent("sign1a", "targetname");
	 
	 sign1a hide();
	 
	 for(;;)
	 {
	     sign1a show();
		 sign1 hide();
		 wait 5;
		 sign1a hide();
		 sign1 show();
		 wait 5;
	 }
}

ammo()
{
     ammo = getent("ammo", "targetname");
	 
	 for(;;)
	 {
	 ammo waittill("trigger", player);
	 
	 player setWeaponAmmoClip( "deserteagle_mp", 2 );
	 }
	 
}

//teleports\\
	 
Teleport() 
{ 
trig = getEnt ("teleport_trigger", "targetname"); 
target = getEnt ("teleport_target", "targetname"); 

for(;;) 
{ 
trig waittill ("trigger", player); 

player SetOrigin(target.origin); 
player SetPlayerAngles( target.angles ); 
} 
}
Teleport2()
{ 
trig = getEnt ("teleport_trigger2", "targetname"); 
target = getEnt ("teleport_target2", "targetname"); 

for(;;) 
{ 
trig waittill ("trigger", player); 

player SetOrigin(target.origin); 
player SetPlayerAngles( target.angles ); 
} 
}
Teleport3()
{ 
trig = getEnt ("teleport_triggera1", "targetname"); 
target = getEnt ("teleport_targeta1", "targetname"); 

for(;;) 
{ 
trig waittill ("trigger", player); 

player SetOrigin(target.origin); 
player SetPlayerAngles( target.angles ); 
} 
}
Teleport4()
{ 
trig = getEnt ("teleport_triggera2", "targetname"); 
target = getEnt ("teleport_targeta2", "targetname"); 

for(;;) 
{ 
trig waittill ("trigger", player); 

player SetOrigin(target.origin); 
player SetPlayerAngles( target.angles ); 
} 
}

//Traps\\

trap1()
{
     trig = getent("trap1_trig", "targetname");
	 sho1 = getent("sho1", "targetname");
	 sho2 = getent("sho2", "targetname");
     sho3 = getent("sho3", "targetname");  
     sho4 = getent("sho4", "targetname");
	 
	 trig waittill("trigger", player);
	 iPrintLn("^1Activators are meant to activate!!!");
	 trig delete();
	 
	 random = randomInt(6);
     x = randomInt(6);
	 
	 if(x == 0)
	 {
	     sho1 delete();
	 }
	 else if(x == 1)
	 {
	     sho2 delete();
	 }
	 else if(x == 2)
	 {
	     sho4 delete();
	 } 
	 else if(x == 3)
	 {
	     sho4 delete();
	 }
	 else if(x == 4)
	 {
	     sho2 delete();
		 sho4 delete();
	 }
	 else if(x == 5)
	 {
	     sho1 delete();
		 sho3 delete();
	 }
}

trap2()
{
     kill = getent("killtrigger", "targetname");
	 spike = getent("spike", "targetname");
	 trig = getent("trap2_trig", "targetname");
	 
	 trig waittill("trigger", player);
	 trig delete();
	 
	 kill enablelinkto ();
     kill linkto (spike);
	 
	 thread move();
	 
	 while(1)
	 {
	     spike rotateroll (180, 1);
		 wait 1;
		}
	
}

move()
{
     spike = getent("spike", "targetname");
	 
	 spike moveX(148,3);
	 wait 5;
	 spike moveX(-148,3);
	 spike waittill ("movedone");
}
	 
trap6()
{
     trig = getent("trap6_trig", "targetname");
	 bounce = getent("bounce", "targetname");
	 
	 trig waittill("trigger", player);
	 trig delete();
	 thread meow();
	 
	 while(1)
	 {
	     bounce rotatepitch (180,11);
		 wait 11;
		}
}
meow()
{
     bounce = getent("bounce", "targetname");
	 
	 for(;;)
	 {
	     bounce movex(112,3);
		 bounce waittill("movedone");
		 bounce movex(-112,3);
		 bounce waittill("movedone");
		}
}

trap3()
{
     trig = getent("trap3_trig", "targetname");
     chamber = getent("chamber", "targetname");
     killtrig = getent("damage", "targetname");
	 carry = getent("carry", "targetname");
     
     trig waittill("trigger", player);
	 trig delete();
	 killtrig enablelinkto ();
     killtrig linkto (carry);
	 
	 chamber movez(-176,1);
	 chamber waittill("movedone");
	 playFX(level.greensmoke, (2272, -560, 160));
	 playFX(level.greensmoke, (2272, -656, 160));
	 playFX(level.greensmoke, (2272, -744, 160));
	 wait 3;
	 carry movez(-176,0.1);
	 playFX(level.greensmoke, (2272, -560, 160));
	 playFX(level.greensmoke, (2272, -656, 160));
	 playFX(level.greensmoke, (2272, -744, 160));
	 wait 9;
	 carry movez(176,0.1);
	 chamber movez(176,6);
}
	
trap4()
{
     trig = getent("trap4_trig", "targetname");
     bounce1 = getent("bounce1", "targetname");
	 
	 trig waittill("trigger", player);
	 trig delete();
	 bounce1 movex(47,0.6);
	 bounce1 waittill("movedone");
	 while(1)
	 {
	 bounce1 movex(-94,0.6);
	 bounce1 waittill("movedone");
     bounce1 movex(94,0.6);
	 bounce1 waittill("movedone");
	 }
}

trap5()
{
	 spin2 = getent("spin2", "targetname");
	 trig = getent("trap5_trig", "targetname");
	 
	 trig waittill("trigger", player);
	 trig delete();
	 while(1)
	 {
	 spin2 rotateyaw(90,0.5);
	 wait 1;
	 }
}

trap7()
{
     trig = getent("trap7_trig", "targetname");
	 quake = getent("quake", "targetname");
	 lop = getent("lop", "targetname");
	 
	 trig waittill("trigger", player);
	 trig delete();
	 lop delete();
	 Earthquake( 1, 5, quake.origin, 20000 );
}

sniper()
{
     level.sniper_trig = getEnt( "sniper", "targetname");
     sjump = getEnt( "jumps", "targetname" );
     sacti = getEnt( "actis", "targetname" );
	 
	 level.sniper_trig waittill( "trigger", player );
        if( !isDefined( level.sniper_trig ) )
            return;
        if(level.firstenter==true)
		{
		 level.knife_trig delete();
		 level.shotgun_trig delete();
		 level.firstenter=false;
		}
     player SetPlayerAngles( sjump.angles );
	 player setOrigin( sjump.origin );
	 level.activ setPlayerangles( sacti.angles );
	 level.activ setOrigin( sacti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 level.activ giveweapon( "m40a3_mp");
	 player giveweapon( "m40a3_mp");
	 player switchToWeapon( "m40a3_mp" );
	 level.activ SwitchToWeapon( "m40a3_mp" );
	 iPrintLn("^2"+ player.name + " picked ^1Sniper");
	 level.activ freezeControls(1);
	 player FreezeControls(1);
	 thread distraction();
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
	 player thread onDeath_sniper();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}
onDeath_sniper()
{
     self endon("disconnect");
     self waittill("death");
     thread sniper();
}

knife()
{
     level.knife_trig = getEnt( "knife", "targetname");
     kjump = getEnt( "jumpk", "targetname" );
     kacti = getEnt( "actik", "targetname" );
	 
	 level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
         return;
         if(level.firstenter==true)
		{
		 level.sniper_trig delete();
		 level.shotgun_trig delete();
		 level.firstenter=false;
		}
     player SetPlayerAngles( kjump.angles );
	 player setOrigin( kjump.origin );
	 level.activ setPlayerangles( kacti.angles );
	 level.activ setOrigin( kacti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 player thread buff1();
	 player thread buff2();
	 level.activ giveweapon( "tomahawk_mp");
	 player giveweapon( "tomahawk_mp");
	 player switchToWeapon( "tomahawk_mp" );
	 level.activ SwitchToWeapon( "tomahawk_mp" );
	 level.activ FreezeControls(1);
	 player FreezeControls(1);
	 iPrintLn("^2"+ player.name + " picked ^1Knife");
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
	 player thread onDeath_knife();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}
onDeath_knife()
{
     self endon("disconnect");
     self waittill("death");
     thread knife();
}

shotgun()
{
     level.shotgun_trig = getEnt( "shotgun", "targetname");
     gjump = getEnt( "jumpg", "targetname" );
     gacti = getEnt( "actig", "targetname" );
	 
	 level.shotgun_trig waittill( "trigger", player );
        if( !isDefined( level.shotgun_trig ) )
         return;
         if(level.firstenter==true)
		{
		 level.sniper_trig delete();
		 level.knife_trig delete();
		 level.firstenter=false;
		}
     player SetPlayerAngles( gjump.angles );
	 player setOrigin( gjump.origin );
	 level.activ setPlayerangles( gacti.angles );
	 level.activ setOrigin( gacti.origin );
	 level.activ TakeAllWeapons();
	 player TakeAllWeapons();
	 level.activ giveweapon( "winchester1200_mp");
	 player giveweapon( "winchester1200_mp");
	 player switchToWeapon( "winchester1200_mp" );
	 level.activ SwitchToWeapon( "winchester1200_mp" );
	 level.activ FreezeControls(1);
	 player FreezeControls(1);
	 player thread slow();
	 level.activ thread slow();
	 iPrintLn("^2"+ player.name + " picked ^1Winchester");
	 wait 3;
	 level.activ FreezeControls(0);
	 player FreezeControls(0);
	 player thread onDeath_shotgun();
     wait 0.1;
       
     for(;;)
     {
         wait .1;               
         while(isAlive(player))
         {
             wait 1;
            }
               
     }
}
onDeath_shotgun()
{
     self endon("disconnect");
     self waittill("death");
     thread shotgun();
}







