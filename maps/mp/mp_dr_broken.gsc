//	/$$$$$$$$ /$$$$$$$  /$$$$$$ /$$   /$$
//	| $$_____/| $$__  $$|_  $$_/| $$  /$$/
//	| $$      | $$  \ $$  | $$  | $$ /$$/ 
//	| $$$$$   | $$$$$$$/  | $$  | $$$$$/  
//	| $$__/   | $$__  $$  | $$  | $$  $$  
//	| $$      | $$  \ $$  | $$  | $$\  $$ 
//	| $$$$$$$$| $$  | $$ /$$$$$$| $$ \  $$
//	|________/|__/  |__/|______/|__/  \__/

/*
self attach("weapon_" + Getdvar("class_"+classType +"_primary"),"tag_weapon_right", true);
Credits:

-Asu-
-Braxi-
-SPI-
-Sheep Wizard-
-Fox-
-Blade-
-Kej-
*/

#include common_scripts\utility;
#include maps\mp\_utility;
//#include braxi\_common;
main()
{
	maps\mp\_load::main();
	maps\mp\_music_broken::main();
	
	thread braxi\_interactive_objects::init();
	//maps\mp\braxi\_interactive_objects::main();
	//////Ambient//////
	AmbientPlay( "ambient_citystreets_night" );
	
	//////Effects//////
	level.wall_explo		= loadFX("explosions/wall_explosion_sniperescape");	
	level.trap_fx			= loadFX("explosions/sparks_e");	
	
	//////Game//////
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";
	
	//////Dvars//////
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1800");
	setdvar("dr_bunnyhoop_pro","1");		
	
	//////Models//////
    PreCacheModel("weapon_c4");	
	
	//////PreCacheMenu//////
	//precacheMenu("endroom_menu");
	
	//////PreCacheShaders//////
	//PreCacheShader("erik");

	//////PrecacheItem//////
	PrecacheItem("c4_mp");
	PreCacheItem("g36c_silencer_mp");
	PreCacheItem("m60e4_grip_mp");
	
	//////PreCacheShellShocks//////
	PreCacheShellShock( "flash_grenade_mp");
	
	//////Threads//////
	thread acti_door();
	thread old();
	thread g36c();
	thread mger();
	thread lazers();
	thread music_room();
	
	thread acti_move1();
	thread acti_moveto();
	thread move1();
	thread move2_1();
	thread move2_2();
	thread rotate2();
	
	thread trap_trigger();
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
	
	thread teleporter_thread();

	//HELICOPTER
	//thread boss();
	///Precache///
	//PreCacheModel("vehicle_cobra_helicopter_fly");
	//PreCacheModel("vehicle_mi-28_flying");
	//PreCacheModel("mi28_flying");	
	//precacheitem( "cobra_FFAR_mp" );
	///Variables///
	//level.trapturretused = 0;
	//level.heli_turretReloadTime = 1.5;
	//level.heli_turretClipSize = 300;
	//level.heli_rocketClipSize = 2;
}

acti_door()
{
	brush1 = getEnt ("acti_start_door","targetname");
	level waittill("round_started");
	brush1 moveZ(80,3,1,1);
	brush1 playsound("container_door");
	AmbientPlay( "intro" );
	wait 1;
}

old()
{
	brush1 = getEnt ("old_door","targetname");
	brush2 = getEnt ("old_door2","targetname");
	trig = getEnt ("old_trigger","targetname");
	trig waittill("trigger",player);
	brush1 moveZ(-144,3,1,1);
	brush1 playsound("container_door");
	wait 2;
	brush2 moveZ(-144,3,1,1);
	brush2 playsound("container_door");
}

g36c()
{
	trig = getEnt ("old_weapon_trigger","targetname");
	for(;;)
	{
	trig waittill("trigger",player);
	player giveWeapon( "g36c_silencer_mp" );
	//player setWeaponAmmoClip( "g36c_silencer_mp",300 );
	player setWeaponAmmoStock("g36c_silencer_mp",300);
	player switchToWeapon(  "g36c_silencer_mp"  );
	wait 0.05;
	}
}

mger()
{
	trig = getEnt ("jump_weapon_trigger","targetname");
	for(;;)
	{
	trig waittill("trigger",player);
	player giveWeapon( "m60e4_grip_mp" );
	//player setWeaponAmmoClip( "m60e4_grip_mp",300 );
	player setWeaponAmmoStock("m60e4_grip_mp",600);
	player switchToWeapon(  "m60e4_grip_mp"  );
	wait 0.05;
	}
}

lazers()
{
	model = getEnt ("lazer_model","targetname");
	brush = getEnt ("lazer","targetname");
	hurt = getEnt ("lazer_hurt","targetname");
	trig = getEnt ("lazer_trigger","targetname");
	trig waittill("trigger",player);
	model rotateRoll(180,2,1,1);
	wait 2;
	brush delete();
	hurt delete();
	trig delete();
	wait 0.5;
}

music_room()
{
	brush1 = getEnt ("musicdoor_brush01","targetname");
	brush2 = getEnt ("musicdoor_brush02","targetname");
	level waittill("round_started");
	brush1 rotateyaw(85,2,1,1);	
	brush2 rotateyaw(-85,2,1,1);	
}

c4()
{
//	level waittill("connected", player);
	level.c4 = 0;
	brush1 = getEnt ("c4_brush1","targetname");
	brush2 = getEnt ("c4_brush2","targetname");
	brush2 hide();
    windtrigs = getentarray("c4_trigger", "targetname");
	for(i=0;i<windtrigs.size;i++)
	{
	windtrigs[i] thread c4_sub(brush1,brush2); 
	}
	wait 0.5;
}

c4_sub(brush1,brush2)
{
	fx1 = getEnt ("c4_fx1","targetname");
	fx2 = getEnt ("c4_fx2","targetname");
	model1 = getEnt ("auto22","targetname");
	model2 = getEnt ("auto23","targetname");
	fxer = getent(self.target,"targetname");
	model = getent(fxer.target,"targetname");

	self waittill("trigger",player);
	level.c4 ++;
	model setmodel("weapon_c4");
	//trig playsound("suitcase");
	self delete();
    if(isDefined( level.c4 ) && level.c4 == 2)
		{
		wait 2;
		model1 delete();
		model2 delete();
		brush1 delete();
		brush2 show();
		playFx(level.wall_explo, fx1.origin);
		playFx(level.wall_explo, fx2.origin);	
		fx1 playsound("Explo");
		fx2 playsound("Explo");
		Earthquake( 1,1.5, fx1.origin, 400 );
		Earthquake( 1,1.5, fx2.origin, 400 );
		}
	wait 0.05;
}




acti_move1()
{
trig = getent("acti_elev_trig","targetname");
brush = getent("acti_elev_brush","targetname");
	for(;;)
	{
	trig waittill("trigger");
	IPrintLnBold( "Mitchell!" );
	wait 0.5;
	brush moveZ(416,3.5,2,1);
	brush waittill("movedone");
	wait 2;
	brush moveZ(-416,3.5,2,1);
	brush waittill("movedone");
	wait 0.5;
	}
}

acti_moveto()
{
trig = getent ("acti_moveto_trigger","targetname");
for(;;)
{
	trig waittill ("trigger",user);
	user thread acti_fly();
	wait 0.05;
}
wait 0.05;
}

acti_fly()
{
air1 = getent ("acti_moveto_org1","targetname");
air2 = getent ("acti_moveto_org2","targetname");
air = spawn ("script_model",(0,0,0));
air.origin = self.origin;
air.angles = self.angles;
self linkto (air);
air moveto (air1.origin, 3);
wait 3;
air moveto (air2.origin, 0.5);
wait 0.5;
self unlink();
air delete();
}

move1()
{
trig = getent("move1_trigger","targetname");
brush = getent("move1_brush","targetname");
	for(;;)
	{
	trig waittill("trigger");
	wait 0.5;
	brush moveZ(192,2.5,1,1);
	brush waittill("movedone");
	wait 1;
	brush moveZ(-192,2.5,1,1);
	brush waittill("movedone");
	wait 0.5;
	}
}

move2_1()
{
trig = getent("move2_trig1","targetname");
brush = getent("move2_brush1","targetname");
	for(;;)
	{
	trig waittill("trigger");
	wait 0.5;
	brush moveX(1400,10,2,2);
	brush waittill("movedone");
	wait 1;
	brush moveX(-1400,10,2,2);
	brush waittill("movedone");
	wait 0.5;
	}
}

move2_2()
{
trig = getent("move2_trig2","targetname");
brush = getent("move2_brush2","targetname");
	for(;;)
	{
	trig waittill("trigger");
	wait 0.5;
	brush moveX(1400,10,2,2);
	brush waittill("movedone");
	wait 1;
	brush moveX(-1400,10,2,2);
	brush waittill("movedone");
	wait 0.5;
	}
}


rotate1()
{
level endon("trap10");
	
	brush=getent("rotate1_brush","targetname");	
	brush1=getent("rotate1_brush1","targetname");
	brush2=getent("rotate1_brush2","targetname");
	brush3=getent("rotate1_brush3","targetname");
	brush4=getent("rotate1_brush4","targetname");
	brush5=getent("rotate1_brush5","targetname");
	brush6=getent("rotate1_brush6","targetname");
	brush7=getent("rotate1_brush7","targetname");
	brush8=getent("rotate1_brush8","targetname");
	brush9=getent("rotate1_brush9","targetname");
	brush10=getent("rotate1_brush10","targetname");
	brush11=getent("rotate1_brush11","targetname");
	brush12=getent("rotate1_brush12","targetname");
	brush13=getent("rotate1_brush13","targetname");
	
	brush1 thread rotate1_sub(1);
	brush2 thread rotate1_sub(2);
	brush3 thread rotate1_sub(3);
	brush4 thread rotate1_sub(4);
	brush5 thread rotate1_sub(5);
	brush6 thread rotate1_sub(6);
	brush7 thread rotate1_sub(7);
	brush8 thread rotate1_sub(8);
	brush9 thread rotate1_sub(9);
	brush10 thread rotate1_sub(10);
	brush11 thread rotate1_sub(11);
	brush12 thread rotate1_sub(12);
	brush13 thread rotate1_sub(13);
	
	while(1)
	{
	brush 		rotateyaw(90,2.5);
	wait 2.5;
	}
}

rotate1_sub(numb)
{
level endon("trap10");
	while(true)
	{
		if(numb==13)
		{
			self moveZ(-3072,2);
			self notSolid();
			self hide();
			numb = 1;
		}
		else
		{
			self rotateyaw(90,2.5);
			self moveZ(256,2.5);
			self Solid();
			self show();
			numb = numb + 1;
		}
	wait 2.5;
	}
}

rotate2()
{
level.triggersActivated = 0;
level.triggersRequired = 2;
level.triggersDone=false;
trig1 = getent("rotate2_trigger1","targetname");
trig2 = getent("rotate2_trigger2","targetname");

trig1 thread watchTrigger();
trig2 thread watchTrigger();


	while(level.triggersDone==false)
	{
		if(level.triggersActivated==level.triggersRequired)
		{
			wait 2;
			thread rotate2_mover();
			thread rotate1();
			thread door1();
			level.triggersDone=true;
		}
		else
			wait 1;
	}
}

door1()
{
brush = getent("door1_brush","targetname");
	{
	wait 1.5;
	//play door sound
	brush moveZ(120,2.5,1,1);
	wait 0.5;
	}
}

watchTrigger()
{
    entTarget = getent(self.target, "targetname");
	self waittill("trigger", player);
	self.target playSound("");
	entTarget rotateRoll(-180,2.5,1,1);
	//entTarget playSound
		level.triggersActivated+=1;
}

rotate2_mover()
{
brush = getent("rotate2_brush","targetname");
	for(;;)
	{
	brush rotateyaw(90,3);
	wait 3;
	}
	wait 0.5;
}
/////////////////////////TRAPS/////////////////////////////////////////////
trap_trigger()
{
    trap = getentarray("trap_trigger_model", "targetname");
	for(i=0;i<trap.size;i++)
	{
	trap[i] thread trap_trigger_sub(); 
	}
wait 0.05;
}

trap_trigger_sub()
{
trig = getent(self.target, "targetname");
trig waittill("trigger");
if(self.movement=="x")
{
	if(isDefined( self.status ) && self.status=="min")
	{
	self rotateRoll(-180,2,1,1);			
	}
	else
	{
	self rotateRoll(180,2,1,1);	
	}
}
	else
{
	if(isDefined( self.status ) && self.status=="min")
	{
	self rotatePitch(-180,2,1,1);			
	}
	else
	{
	self rotatePitch(180,2,1,1);	
	}
}
wait 2;
PlayFXOnTag( level.trap_fx ,self, "tag_origin" );
wait 0.05;
}


trap1()
{
trig = getent("trap1_trigger","targetname");
brush1 = getent("trap1_brush1","targetname");
brush2 = getent("trap1_brush2","targetname");
	trig waittill("trigger");
	brush1 moveZ(90,1,1);
	brush2 moveZ(-90,1,1);
	wait 1.4;
	for(;;)
	{
	brush1 moveZ(-180,2,1,1);
	brush2 moveZ(180,2,1,1);
	wait 2.4;
	brush1 moveZ(180,2,1,1);
	brush2 moveZ(-180,2,1,1);
	wait 2.4;
	}
wait 0.05;
}

trap2()
{
trig = getent("trap2_trigger","targetname");
brush1 = getent("trap2_brush1","targetname");
brush2 = getent("trap2_brush2","targetname");
brush3 = getent("trap2_brush3","targetname");
brush4 = getent("trap2_brush4","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush1 moveX(96,2,1);
	brush2 moveX(-96,2,1);
	wait 1;
	brush3 moveX(96,2,1);
	brush4 moveX(-96,2,1);
	wait 3;	
	
	brush1 moveX(-96,1.5,1);
	brush2 moveX(96,1.5,1);
	wait 1;
	brush3 moveX(-96,1.5,1);
	brush4 moveX(96,1.5,1);
	wait 1.5;	
	}
wait 0.05;
}

trap3()
{
trig = getent("trap3_trigger","targetname");
brush1 = getent("trap3_brush1","targetname");
brush2 = getent("trap3_brush2","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush1 rotateRoll(-90,1.5,1);
	brush2 rotateRoll(90,1.5,1);
	wait 3;
	brush1 rotateRoll(90,1.5,1);
	brush2 rotateRoll(-90,1.5,1);
	wait 6;
	}
wait 0.05;
}

trap4()
{
trig = getent("trap4_trigger","targetname");
brush1 = getent("trap4_brush1","targetname");
brush2 = getent("trap4_brush2","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush1 rotateYaw(360,6);
	brush2 rotateYaw(-360,6);
	wait 6;
	}
wait 0.05;
}

trap5()
{
trig = getent("trap5_trigger","targetname");
brush1 = getent("trap5_brush1","targetname");
brush2 = getent("trap5_brush2","targetname");
brush3 = getent("trap5_brush3","targetname");

	trig waittill("trigger");
	brush1 moveZ(100,2,1,1);
	brush2 moveZ(100,2,1,1);
	brush3 moveZ(100,2,1,1);
	wait 2;
	for(;;)
	{
	brush1 moveZ(-200,4,1,1);
	brush2 moveZ(-200,4,1,1);
	brush3 moveZ(-200,4,1,1);
	wait 4;
	brush1 moveZ(200,4,1,1);
	brush2 moveZ(200,4,1,1);
	brush3 moveZ(200,4,1,1);
	wait 4;
	}
wait 0.05;
}


trap6()
{
trig = getent("trap6_trigger","targetname");
brush1 = getent("trap6_brush1","targetname");
brush2 = getent("trap6_brush2","targetname");
hurt1 = getent("trap6_hurt1","targetname");
hurt2 = getent("trap6_hurt2","targetname");

	hurt1 enableLinkTo();
	hurt1 linkTo(brush1);
	hurt2 enableLinkTo();
	hurt2 linkTo(brush2);

	trig waittill("trigger");
	for(;;)
	{
	brush1 moveZ(128,3,1,1);
	brush2 moveZ(-128,3,1,1);
	wait 3;
	brush1 moveZ(-128,3,1,1);
	brush2 moveZ(128,3,1,1);
	wait 3;
	}
wait 0.05;
}


trap7()
{
trig = getent("trap7_trigger","targetname");
brush = getent("trap7_brush","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush rotateYaw(360,5);
	wait 5;
	}
wait 0.05;
}

trap8()
{
trig = getent("trap8_trigger","targetname");
brush1 = getent("trap8_brush1","targetname");
brush2 = getent("trap8_brush2","targetname");
	trig waittill("trigger");
	brush1 moveZ(64,2,1,1);
	wait 1;
	brush2 moveZ(64,2,1,1);
	wait 1;
	for(;;)
	{
	brush1 moveZ(-256,3,1,1);
	wait 1;
	brush2 moveZ(-256,3,1,1);
	wait 2;
	brush1 moveZ(256,3,1,1);
	wait 1;
	brush2 moveZ(256,3,1,1);
	wait 2;
	}
wait 0.05;
}

trap9()
{
trig = getent("trap9_trigger","targetname");
brush1 = getent("trap9_brush1","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush1 rotateRoll(360,4);
	wait 4;
	}
wait 0.05;
}


trap10()
{
trig = getent("trap10_trigger","targetname");
trig waittill("trigger");
level notify("trap10");
}

trap11()
{
trig = getent("trap11_trigger","targetname");
brush1 = getent("trap11_brush1","targetname");
brush2 = getent("trap11_brush2","targetname");
random_brush = randomIntRange(0,1);
trig waittill("trigger");
	if(random_brush==1)
	{	
	brush1 moveZ(-500,2,2);	
	}
	else
	{
	brush2 moveZ(-500,2,2);	
	}
wait 0.05;
}

trap12()
{
trig = getent("trap12_trigger","targetname");
brush1 = getent("trap12_brush1","targetname");
brush2 = getent("trap12_brush2","targetname");
	trig waittill("trigger");
	for(;;)
	{
	brush1 rotateYaw(360,3);
	brush2 rotateYaw(-360,3);
	wait 3;
	}
wait 0.05;
}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

teleporter_thread()
{

	entTransporter= getentarray("teleport","targetname");
	if(isdefined(entTransporter))
 
		{
			for(lp=0; lp<entTransporter.size;lp=lp+1)
			entTransporter [lp] thread teleporter();
		}
}

teleporter()
{
  while(true)
  {
    self waittill("trigger",other);
    entTarget = getent(self.target, "targetname");

    wait(0.10);
    other setorigin(entTarget.origin);
    other setplayerangles(entTarget.angles);
    wait(0.10);

   }
}

/*

sprayLogo()
{
	self endon( "disconnect" );
	self endon( "spawned_player" );
	self endon( "joined_spectators" );
	self endon( "death" );

	if( !level.dvar["sprays"] )
		return;

	while( game["state"] != "playing" )
		wait 0.05;

	while( self isReallyAlive() )
	{
		while( !self fragButtonPressed() )
			wait .2;

		if( !self isOnGround() )
		{
			wait 0.2;
			continue;
		}

		angles = self getPlayerAngles();
		eye = self getTagOrigin( "j_head" );
		forward = eye + vector_scale( anglesToForward( angles ), 70 );
		trace = bulletTrace( eye, forward, false, self );
		
		if( trace["fraction"] == 1 ) //we didnt hit the wall or floor
		{
			wait 0.1;
			continue;
		}

		position = trace["position"] - vector_scale( anglesToForward( angles ), -2 );
		angles = vectorToAngles( eye - position );
		forward = anglesToForward( angles );
		up = anglesToUp( angles );

		sprayNum = self getStat( 979 );


		if( isDefined( self.pers["customSpray"] ) )
			sprayNum = 25;

		if( sprayNum < 0 )	
			sprayNum = 0;
		else if( sprayNum > level.numSprays )
			sprayNum = level.numSprays;

		playFx( level.sprayInfo[sprayNum]["effect"], position, forward, up );
		self playSound( "sprayer" );

		self notify( "spray", sprayNum, position, forward, up ); // ch_sprayit

		wait level.dvar["sprays_delay"];
	}
}












