main()
{
	maps\mp\_load::main();
	
	ambientplay("sound_1");
	Print3d( (0,0,0), "START", (1.0, 0.8, 0.5), 1000, 1000, 100000 );
	
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
	
	rotate_obj = getentarray("rotate","targetname");
	if(isdefined(rotate_obj))
	{
	for(i=0;i<rotate_obj.size;i++)
	{
	rotate_obj[i] thread ra_rotate();
	}
	}
	
	trap_4 = getentarray("trap4","targetname");
	if(isdefined(trap_4))
	{
	for(i=0;i<trap_4.size;i++)
	{
	trap_4[i] thread trap_4rotate();
	}
	}
	
	trap_twister = getentarray("twister","targetname");
	if(isdefined(trap_twister))
	{
	for(i=0;i<trap_twister.size;i++)
	{
	trap_twister[i] thread trap_twisterrotate();
	}
	}
		
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap7();
	thread move();
	thread startdoor();
	thread finaldoor();
	thread door();
	thread walljump();
	thread secretshaft();
	thread weaponroom();
	thread deagle_trigger();
	thread weaponroommessage();
	thread trap_spinner();
	//thread moveclimb();
	//thread lift();
	}

lift()
{
lift=getent("lift","targetname");
trig=getent("trigger_lift","targetname");
while(1)
{
trig waittill ("trigger");
lift movez (500,7,1.9,1.9);
lift waittill ("movedone");
wait(1);
lift movez (-500,7,1.9,5);
lift waittill ("movedone");
}
}

move()
{
platform=getent("platform","targetname");
while(1)
{
platform movey(-900,5,0.5,4.5);
platform waittill ("movedone");
wait (2);
platform movey(900,5,0.5,4.5);
platform waittill ("movedone");
} 
}

startdoor()
{
door=getent("door","targetname");
wait(12);
iPrintLnBold("^2The door is opening !"); //Change the message if you want
door movez(-325,10,1,9);
door waittill ("movedone");
door movez(0,0,0,0);
}

deagle_trigger()
{
trigger = getEnt("trigger_deagle", "targetname");
precacheItem("deserteaglegold_mp");	
while(1)
{
trigger waittill("trigger", player);
player takeallweapons();
player GiveWeapon("deserteaglegold_mp");
}
}

door()
{
	door = getEnt("firstdoor", "targetname");
	trigger = getEnt("door_trig", "targetname");
	second_area = getEnt("second_area", "targetname");
	
	trigger waittill("trigger", player);
	trigger delete();
	
	door moveZ( -248, 1);
	second_area movez( -271,1);
	
	iPrintLnBold(player.name + "^3 has reached the first like a ^5BOSS"); //Change the message if you want
}

weaponroommessage()
{
	trigger = getEnt("trigger_weaponroom", "targetname");	
	trigger waittill("trigger", player);
	iPrintLnBold(player.name + "^3 has entered the Unknown room!"); //Change the message if you want
	trigger delete();
	}
	
walljump()
{
	trigger = getEnt("walljump", "targetname");	
	trigger waittill("trigger", player);
	iPrintLnBold(player.name + "^3 has found a shortcut !"); //Change the message if you want
trigger delete();
	}

finaldoor()
{
	finaldoor = getEnt("finaldoor", "targetname");
	trigger = getEnt("trigger_finaldoor", "targetname");
	trigger waittill("trigger", player);
	trigger delete();
	
	finaldoor moveZ( -200, 3);
	iPrintLnBold("The final door is unlocked !"); //Change the message if you want
}

trap1()
{
trap1blok1=getent("trap1blok1","targetname");
trap1blok2=getent("trap1blok2","targetname");
trap1blok3=getent("trap1blok3","targetname");
trap1blok4=getent("trap1blok4","targetname");
trap1blok5=getent("trap1blok5","targetname");
act1=getent("trigger_trap1","targetname");
act1 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
while(1)
{
trap1blok1 movez (50,1,0.1,0.9);
wait(1);
trap1blok1 movez (-50,1,0.1,0.9);

trap1blok4 movez (50,1,0.1,0.9);
trap1blok5 movez (50,1,0.1,0.9);
trap1blok2 movez (50,1,0.1,0.9);
wait(1);
trap1blok2 movez (-50,1,0.1,0.9);
trap1blok4 movez (-50,1,0.1,0.9);
trap1blok5 movez (-50,1,0.1,0.9);

trap1blok3 movez (50,1,0.1,0.9);
wait(1);
trap1blok3 movez (-50,1,0.1,0.9);
}
}
}


trap2()
{
trap2spike=getent("trap2spike","targetname");
trap2spike2=getent("trap2spike2","targetname");
trap2spike3=getent("trap2spike3","targetname");
trap2spike4=getent("trap2spike4","targetname");
trap2spike5=getent("trap2spike5","targetname");
trap2spike6=getent("trap2spike6","targetname");
trap2spike7=getent("trap2spike7","targetname");
trap2spike8=getent("trap2spike8","targetname");
trap2spike9=getent("trap2spike9","targetname");
trap2killer=getent("trap2killer","targetname");
act2=getent("trigger_trap2","targetname");
trap2killer EnableLinkTo();
trap2killer LinkTo(trap2spike);
act2 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
trap2killer movez (95,1,0.1,0.9);
trap2spike movez (95,1,0.1,0.9);
trap2spike2 movez (95,1,0.1,0.9);
trap2spike3 movez (95,1,0.1,0.9);
trap2spike4 movez (95,1,0.1,0.9);
trap2spike5 movez (95,1,0.1,0.9);
trap2spike6 movez (95,1,0.1,0.9);
trap2spike7 movez (95,1,0.1,0.9);
trap2spike8 movez (95,1,0.1,0.9);
trap2spike9 movez (95,1,0.1,0.9);
wait(1);
trap2killer movez (-96,1,0.1,0.9);
trap2spike movez (-95,3,2.9,0.1);
trap2spike2 movez (-95,3,2.9,0.1);
trap2spike3 movez (-95,3,2.9,0.1);
trap2spike4 movez (-95,3,2.9,0.1);
trap2spike5 movez (-95,3,2.9,0.1);
trap2spike6 movez (-95,3,2.9,0.1);
trap2spike7 movez (-95,3,2.9,0.1);
trap2spike8 movez (-95,3,2.9,0.1);
trap2spike9 movez (-95,3,2.9,0.1);
trap2spike waittill ("movedone");
trap2spike2 waittill ("movedone");
trap2spike3 waittill ("movedone");
trap2spike4 waittill ("movedone");
trap2spike5 waittill ("movedone");
trap2spike6 waittill ("movedone");
trap2spike7 waittill ("movedone");
trap2spike8 waittill ("movedone");
trap2spike9 waittill ("movedone");
act2 delete();
}
}


trap3()
{
trap3pusher=getent("trap3pusher","targetname");
act3=getent("trigger_trap3","targetname");
act3 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
trap3pusher movex (300,1,0.1,0.9);
trap3pusher waittill ("movedone");
wait(1);
trap3pusher movez (-180,1,0.1,0.9);
trap3pusher waittill ("movedone");
wait(12);
trap3pusher movez (-1200,20,0.1,19.9);
trap3pusher waittill ("movedone");
act3 delete();
}
}

ra_rotate()
{
if (!isdefined(self.speed))
 self.speed = 10;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "z";
trigger_trap5=getent("trigger_trap5","targetname");
trigger_trap5 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(360,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(360,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(360,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}
}

trap_4rotate()
{
if (!isdefined(self.speed))
 self.speed = 1;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "z";
trigger_trap4=getent("trigger_trap4","targetname");
trigger_trap4 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(360,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(360,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(360,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}
}

trap7()
{
plank1=getent("trap7_plank1","targetname");
plank2=getent("trap7_plank2","targetname");
act7=getent("trigger_trap7","targetname");
act7 waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
plank1 movez(-1000,1);
plank2 movez(-1000,1);
plank1 waittill ("movedone");
}
}

secretshaft()
	{
	door = getEnt("door_secretroom", "targetname");
	trigger = getEnt("trigger_secretroom", "targetname");
	trigger waittill("trigger", player);
	if( isDefined( level.trapsDisabled ) && level.trapsDisabled )
	{
	iPrintLnBold(player.name + "^3 isnt strong enough to open the shaft !"); //Change the message if you want
	}
	else
	{
	trigger delete();
	door moveZ( -200, 6);
	iPrintLnBold(player.name + "^3 opened the shaft !"); //Change the message if you want
	}
	}
	

weaponroom()
{
	door = getEnt("clip_weaponroom", "targetname");
	trigger = getEnt("trigger_weaponroomshot", "targetname");
	trigger waittill("trigger", player);
	iPrintLnBold(player.name + "^3 has made ^1THE PERFECT HEADSHOT!"); //Change the message if you want
	trigger delete();
	door moveZ( 1000, 1);
	iPrintLnBold("A unknown door is now open ?!¿!"); //Change the message if you want
}

trap_twisterrotate()
{
if (!isdefined(self.speed))
 self.speed = 1;
if (!isdefined(self.script_noteworthy))
 self.script_noteworthy = "z";
trigger_twister=getent("trigger_twister","targetname");
twister=getent("twister","targetname");
trigger_twister waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
while(true)
{
twister movez(-200,5,0.5,4.5);
twister waittill ("movedone");
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (self.script_noteworthy == "z")
  self rotateYaw(360,self.speed);
 else if (self.script_noteworthy == "x")
  self rotateRoll(360,self.speed);
 else if (self.script_noteworthy == "y")
  self rotatePitch(360,self.speed);
 wait ((self.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
 twister movez(200,5,0.5,4.5);
twister waittill ("movedone");
}
}
}

trap_spinner()
{
trigger_spinner=getent("trigger_spinner","targetname");
spinner=getent("spinner","targetname");
spinner1=getent("spinner1","targetname");
trigger_spinner waittill ("trigger", player);
if( isDefined( level.trapsDisabled ) && level.trapsDisabled && player == level.activ )
{
iPrintLnBold(player.name + "^6 is a pussy trying to activate on free !"); //Change the message if you want
}
else
{
spinner movez(245,1,0.1,0.9);
wait(1);
spinner1 movez(245,0.5,0.1,0.4);
}
}

