/*

▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	.______    __  ___   ___  _______  __      	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	|   _  \  |  | \  \ /  / |   ____||  |     	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	|  |_)  | |  |  \  V  /  |  |__   |  |     	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	|   ___/  |  |   >   <   |   __|  |  |     	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	|  |      |  |  /  .  \  |  |____ |  `----.    ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	| _|      |__| /__/ \__\ |_______||_______|	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒												   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	*Map Created & Scripted by: Pixel			   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	*Huge thanks to: Phaedrean					   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒    *For additional credits, go to bottom          ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒	*Do not use any scripts without permission	   ▒▒▒▒▒▒▒▒
▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒

Map Information
-----------------
Author: Pixel
Mapname: Electory
Length: Medium - Long
Traps: 20
Additional features: Hard-mode
File Size:
How long it took to fully make: 8 months +
*/

main()

{

	maps\mp\_load::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	precacheItem("ak47_mp");
	precacheItem("m40a3_mp");

	precacheShellshock( "teargas" );

	level.fx_radiation = LoadFX( "deathrun/radiation" );
	level.fx_blast = LoadFX( "deathrun/blast" );
	level.fx_trail1 = LoadFX( "deathrun/coolfx" );
	level.fx_trail2 = LoadFX( "deathrun/fearzzz" );
	level.fx_trail3 = LoadFX( "deathrun/darmuh" );
	level.fx_trail4 = LoadFX( "deathrun/trail2" );
	level.fx_trail5 = LoadFX( "deathrun/xenon2" );
	level.fx_floor = LoadFX( "deathrun/electric_floor");
	level.vision = VisionSetNight( "armada_nvg" );

	addTriggerToList("trap1_trig");
	addTriggerToList("lasers_trig");
	addTriggerToList("lazahtrig");
	addTriggerToList("rendum_trigger");
	addTriggerToList("electro_trigger");
	addTriggerToList("logotrap_trig");
	addTriggerToList("lasertrap1_trigger");
	addTriggerToList("lasertrap2_trigger");
	addTriggerToList("boing_trig");
	addTriggerToList("roller_trig");
	addTriggerToList("block_trigger");
	addTriggerToList("squash_trig");
	addTriggerToList("block2_trigger");
	addTriggerToList("r2b");
	addTriggerToList("lolderp_trigger");
	addTriggerToList("spinner_trig");
	addTriggerToList("spinny_trig");
	addTriggerToList("recttrap_trig");
	addTriggerToList("spinny2_trigger");
	addTriggerToList("lasttrap_trigger");
	addTriggerToList("secrettele");
	addTriggerToList("slaya_trigger");
	addTriggerToList("at_trigger");

	thread autofunc();
	thread spawnelevators();
	thread trap1();
	thread teleport1();
	thread teleport2();
	thread teleport3();
	thread teleport4();
	thread autoplatform();
	thread triggeredplatform();
	thread elevator1();
	thread mode();
	thread lasers();
	thread logotrap();
	thread roller();
	thread squash();
	thread block();
	thread block2();
	thread loltext();
	thread rendum();
	thread lolderp();
	thread endroomstele();
	thread actitele1();
	thread actitele2();
	thread actitele3();
	thread actitele4();
	thread actitele5();
	thread actitele6();
	thread actitele7();
	thread actitele8();
	thread lasertrap1();
	thread lasertrap2();
	thread boing();
	thread autoplatform2();
	thread rotaterecttrap();
	thread spinny();
	thread old();
	thread actirun();
	thread a1();
	thread a2();
	thread a3();
	thread a4();
	thread actiruntext();
	thread actirundoor();
	thread MapByPixel();
	thread lazor1();
	thread lazor2();
	thread radiation2();
	thread r2brushes();
	thread lasttrap();
	thread pixel();
	thread lazah();
	thread finished();
	thread spinny2();
	thread bounce();
	thread bouncefall();
	thread generator();
	thread secretfin();
	thread secret();
	thread trails();
	thread bounceweapon();
	thread anothertrap();
	thread slaya();
	speed = getEntArray("speed", "targetname");
	for(i = 0;i < speed.size;i++)
	thread speed(speed[i]);

	level waittill("round_started");
	ambientPlay("trap1");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

MapByPixel()
{
	model = getEnt( "mapby", "targetname" );
	model.oldpos = model.origin;

	while(1)
	{
		wait 1;
		for(i=0;i<(2047/8);i++)
		{
			model.origin -= (8,0,0);
			wait 0.1;
		}
		model.origin = model.oldpos;
	}
}

autofunc()
{

	trigger = getent("credits","targetname");
	trigger waittill("trigger" , player );
	lasers = getent("lasers","targetname");
	squashlasers = getent("squashlasers","targetname");
	damage = getent("squashlasersdamage","targetname");
	secret = getent("secret","targetname");
	secretbrush = getent("secretbruh","targetname");
	rollerlaser = getent("rollerlaser","targetname");
	rlh = getent("rlhurt","targetname");
	lazor1 = getent("lazor1","targetname");
	lazor1hurt = getent("lazor1hurt","targetname");
	lazor2 = getent("lazor2","targetname");
	lazor2hurt = getent("lazor2hurt","targetname");
	rollerdamage = getent("roller_hurt1","targetname");
	lthurt = getent("lthurt","targetname");
	ltlaser = getent("ltlaser","targetname");
	lt1hurt = getent("lasertrap1_hurt","targetname");
	lt1brush = getent("lasertrap1_brush","targetname");
	lt2hurt = getent("lasertrap2_hurt","targetname");
	lt2brush = getent("lasertrap2_brush","targetname");
	tth1 = getent("trap1_hurt","targetname");
	brushgunga = getent("gungabeast","targetname");
	hurtlaz = getent("error","targetname");
	l1trap1 = getent("t1laser","targetname");
	lazah = getent("lazah2","targetname");
	lazahhurt = getent("lazahhurt","targetname");

	thread bouncespin();

	lasers hide();
	lasers notSolid();
	rlh maps\mp\_utility::triggerOff();
	damage maps\mp\_utility::triggerOff();
	squashlasers hide();
	squashlasers notSolid();
	rollerlaser hide();
	rollerlaser notSolid();
	lazor1 hide();
	lazor1 notsolid();
	lazor1hurt maps\mp\_utility::triggerOff();
	lazor2 hide();
	lazor2 notsolid();
	lazor2hurt maps\mp\_utility::triggerOff();
	rollerdamage maps\mp\_utility::triggerOff();
	lthurt maps\mp\_utility::triggerOff();
	lt1hurt maps\mp\_utility::triggerOff();
	ltlaser hide();
	ltlaser notsolid();
	lt1brush hide();
	lt2brush notSolid();
	lt1brush notSolid();
	lt2brush hide();
	lt2hurt maps\mp\_utility::triggerOff();
	brushgunga hide();
	hurtlaz maps\mp\_utility::triggerOff();
	l1trap1 hide();
	lazah hide();
	lazahhurt maps\mp\_utility::triggerOff();
	tth1 maps\mp\_utility::triggerOff();
	secret maps\mp\_utility::triggerOff();
	secretbrush hide();
	secretbrush notSolid();

	wait 5;

	trigger delete();

	while(1)
	{

		iPrintLn("^3Map Made By: Pixel");
		wait 4;
		iPrintLn("^2Credits: Phaedrean, Xenon, JWofles, Sentrex");
		wait 4;
		iPrintLn("^6Report bugs to my XF: ^7pixelateedits^6!");
		wait 4;
		iPrintLn("^5Visit: http://codscript.net/");
		wait 4;
		iPrintLn("^1RIP ^2Raid-Gaming.");
		wait 8;

	}

}

spawnelevators()

{
	brushb = getent("brushb","targetname");
	o2 = getent("raise2","targetname");
	o4 = getent("raise4","targetname");

	while(1)
	{
		brushb moveto(o2.origin, 3, 0.5, 0.5);
		brushb waittill("movedone");
		wait 2;
		brushb moveto(o4.origin, 3, 0.5, 0.5);
		brushb waittill("movedone");
		wait 2;
	}
}

trap1() //Works (Add Fx)
{

	trigger = getent("trap1_trig","targetname");
	trigger waittill("trigger");
	hurt = getent("trap1_hurt","targetname");
	laser = getent("t1laser","targetname");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	hurt maps\mp\_utility::triggerOn();
	laser show();
	wait 5;
	hurt maps\mp\_utility::triggerOff();
	laser hide();
}

teleport1()
{

entTransporter = getentarray("tele1","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Transporter1();
  }


}

Transporter1()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

teleport2()
{

entTransporter = getentarray("tele2","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Transporter2();
  }


}

Transporter2()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

teleport3()
{

entTransporter = getentarray("tele3","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Transporter3();
  }


}

Transporter3()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

autoplatform()
{

	trigger = getent("autoplatform1_trigger","targetname");
	brush = getent("autoplatform1","targetname");
	trigger waittill("trigger", player );

	player iPrintLn("^2Platform will move in ^12 ^2seconds^1");

	wait 2;

	trigger delete();

	for(;;)
	{
		brush moveX(488,5);
		brush waittill("movedone");
		wait 1;
		brush moveX(-488,5);
		brush waittill("movedone");
		wait 1;
	}

}

bouncespin()
{
	brush = getent("bouncespin","targetname");

	while(1)
	{
		brush rotateYaw(360,10);
		wait .05;
	}
}

triggeredplatform()
{

	trigger = getent("platform1_trigger","targetname");
	brush1 = getent("platform1_brusha","targetname");
	brush2 = getent("platform1_brushb","targetname");
	o1 = getent("o1","targetname");
	o2 = getent("o2","targetname");
	o3 = getent("o3","targetname");
	o4 = getent("o4","targetname");
	trigger waittill("trigger");
	trigger setHintString("^5Platform Activated!");

	brush1 moveto (o2.origin, 4);
	brush1 waittill("movedone");
	brush1 moveto (o3.origin, 4);
	brush1 waittill("movedone");
	brush1 moveto (o4.origin, 4);
	brush1 waittill("movedone");

	wait 4;

	while(1)
	{
		brush1 moveto(o3.origin, 4);
		brush1 waittill("movedone");
		wait 2;
		brush1 moveto(o4.origin, 4);
		brush1 waittill("movedone");
		wait 2;
	}

	trigger delete();

}

elevator1()
{

	trigger = getent("elevator1_trig","targetname");
	brush = getent("elevator1","targetname");
	trigger waittill("trigger" , player );

	player iPrintLn("^2Platform will move in ^12 ^2seconds^1");

	wait 2;

	while(1)
	{
		    brush moveZ(256,4);
		    brush waittill("movedone");
		    wait 3;
		    brush moveZ(-256,4);
		    brush waittill("movedone");
		    wait 3;
	}

	trigger delete();

}

mode()
{
	trigger = getent("mode","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Hard Mode Activated ^5<<");

	iPrintLnBold("^1Activator ^3has increased the difficulty!");

	thread squashlasers();
	thread rollerlaser();
}

teleport4()
{

entTransporter = getentarray("tele4","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Transporter4();
  }


}

Transporter4()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}
lasers()
{
	brush = getent("lasers","targetname");
	trigger = getent("lasers_trig","targetname");
	laserdmg = getent("lasershurt","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");
	origin = getent("lasers_origin","targetname");
	origin2 = getent("lasers_origin2","targetname");

	laserdmg enablelinkto();
	laserdmg linkto(origin);

	brush solid();
	brush show();
	origin moveto(origin2.origin, .1);

	wait 5;

	brush delete();
	laserdmg delete();
	trigger delete();
}

logotrap()
{
	trigger = getent("logotrap_trig","targetname");
	brush = getent("logotrap","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush moveY(-384,.5);
	brush waittill("movedone");
	brush moveY(384,4);

}


roller()
{
	brush = getent("roller","targetname");
	trigger = getent("roller_trig","targetname");
	hurt = getent("roller_hurt1","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	hurt maps\mp\_utility::triggerOn();

	hurt enablelinkto();
	hurt linkto(brush);

	while(1)
	{
		brush rotatePitch(360,2);
		wait 1;
		brush rotatePitch(360,2);
		wait 1;
	}

	trigger delete();

}

squash()
{
	trigger = getent("squash_trig","targetname");
	brush = getent("squash","targetname");
	hurt = getent("squash_hurt","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");
	quake = getent("quake300","targetname");
	sound = getent("sound","targetname");

	hurt enablelinkto(brush);
	hurt linkto (brush);

	brush moveZ(-230,1);
	brush waittill("movedone");

	Earthquake( 0.7, 8, quake.origin, 10000 );
	sound PlaySound( "elm_quake_sub_rumble");

	wait 1;

	brush moveZ(230,1);
	brush waittill("movedone");
	wait 2;
}

jumpstarthud() //Thanks to Staab
{
		level.jumpstart_hud = newHudElem();
		level.jumpstart_hud.foreground = true;
		level.jumpstart_hud.AlignX = "center";
		level.jumpstart_hud.AlignY = "top";
		level.jumpstart_hud.horzAlign = "center";
		level.jumpstart_hud.vertAlign = "top";
		level.jumpstart_hud.x = 0;
		level.jumpstart_hud.y = 40;
		level.jumpstart_hud.sort = 0;
		level.jumpstart_hud.fontScale = 3;
		level.jumpstart_hud.color = (1.0, 0.0, 0.0);
		level.jumpstart_hud.font = "objective";
		level.jumpstart_hud.glowcolor = (1.0, 0.0, 0.0);
		//level.jumpstart_hud.glowAlpha = 1;
		level.jumpstart_hud.hideWhenInMenu = false;
		level.jumpstart_hud setTimer( 5 );
}

block()
{
	brush = getent("block","targetname");
	trigger = getent("block_trigger","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush moveZ(-192,.5);
	brush waittill("movedone");
	wait 4;
	brush moveZ(192,2);
}

squashlasers()
{
	brush = getent("squashlasers","targetname");
	damage = getent("squashlasersdamage","targetname");

	damage maps\mp\_utility::triggerOn();

	while(1)
	{
		for(i=0;i<brush.size;i++)
		{
			brush show();
			damage maps\mp\_utility::triggerOn();
			wait 2;
			brush hide();
			damage maps\mp\_utility::triggerOff();
			wait 2;
		}
	}

}

loltext()
{
	trigger = getent("loltext","targetname");
	trigger waittill("trigger", player );

	while(1)
	{
		player iPrintLnBold("^2" + player.name + "^1, you can't jump on the platform from there!");
			break;
	}
}

rendum()
{
	trigger = getent("rendum_trigger","targetname");
	trigger waittill("trigger");
	trigger setHintString("^5>> ^3Trap Activated ^5<<");

	brush = randomint(4);
	  switch(brush)
	  {
			   case 0:
					  thread rendum1();
					  break;
			   case 1:
					  thread rendum2();
					  break;
			   case 2:
					  thread rendum3();
					  break;
			   case 3:
					  thread rendum4();
					  break;
	  }
}

rendum1()
{
	trigger = getent("rendum_trigger","targetname");
	brush = getent("rendum1","targetname");

	brush notsolid();
}

rendum2()
{
	trigger = getent("rendum_trigger","targetname");
	brush = getent("rendum2","targetname");

	brush notsolid();
}

rendum3()
{
	trigger = getent("rendum_trigger","targetname");
	brush = getent("rendum3","targetname");

	brush notsolid();
}

rendum4()
{
	trigger = getent("rendum_trigger","targetname");
	brush = getent("rendum4","targetname");

	brush notsolid();
}

lolderp()
{
	trigger = getent("lolderp_trigger","targetname");
	trigger waittill("trigger");
	trigger setHintString("^5>> ^3Trap Activated ^5<<");

	brush = randomint(2);
	  switch(brush)
	  {
			   case 0:
					  thread lolderp1();
					  break;
			   case 1:
					  thread lolderp2();
					  break;
	  }
}

lolderp1()
{
	brush = getent("lolderp1","targetname");

	brush notSolid();
}

lolderp2()
{
	brush = getent("lolderp2","targetname");

	brush notSolid();
}

endroomstele()
{

entTransporter = getentarray("endroomstele","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Transporter1338();
  }


}

Transporter1338() //Add HUD
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele1()
{

entTransporter = getentarray("actitele1","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actione();
  }


}

actione()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele2()
{

entTransporter = getentarray("actitele2","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actitwo();
  }


}

actitwo()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele3()
{

entTransporter = getentarray("actitele3","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actithree();
  }


}

actithree()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele4()
{

entTransporter = getentarray("actitele4","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actifour();
  }


}

actifour()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele5()
{

entTransporter = getentarray("actitele5","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actifive();
  }


}

actifive()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele6()
{

entTransporter = getentarray("actitele6","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actisix();
  }


}

actisix()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele7()
{

entTransporter = getentarray("actitele7","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actiseven();
  }


}

actiseven()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

actitele8()
{

entTransporter = getentarray("actitele8","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread actieight();
  }


}

actieight()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other freezeControls(false);
  }

}

boing()
{
	trigger = getent("boing_trig","targetname");
	brush = getent("boing","targetname");
	trigger waittill("trigger");
	trigger setHintString("^5>> ^3Trap Activated ^5<<");

	brush moveZ(128, .5);

	wait 1;

	brush moveZ(-128, 3);
}

autoplatform2()
{
	trigger = getent("autoplatform2_trig","targetname");
	brush = getent ("autoplatform2","targetname");
	trigger waittill("trigger" , player );

	player iPrintLn("^2Platform will move in ^12 ^2seconds^1");

	wait 2;

	while(1)
	{
		brush moveX(384,5);
		brush waittill("movedone");
		brush moveX(-384,5);
		brush waittill("movedone");
	}

	trigger delete();
}

rotaterecttrap()
{
	trigger = GetEnt("recttrap_trig","targetname");

	trigger waittill("trigger");
	trigger setHintString("^5>> ^3Trap Activated ^5<<");

	thread rect1();
	thread rect2();

	trigger delete();

}

rect1()
{

	brush = getent("rectbrush1","targetname");

	brush moveY(320,2);

	brush waittill("movedone");

	while(1)
	{
		brush moveY(-640,2);
		brush waittill("movedone");
		brush moveY(640,2);
		brush waittill("movedone");
	}

}

rect2()
{

	brush = getent("rectbrush2","targetname");

	brush moveY(-320,2);

	brush waittill("movedone");

	while(1)
	{
		brush moveY(640,2);
		brush waittill("movedone");
		brush moveY(-640,2);
		brush waittill("movedone");
	}

}

spinny()
{
	trigger = getent("spinny_trig","targetname");
	brush = getent("spinny_left","targetname");
	trigger waittill("trigger");
	trigger setHintString("^5>> ^3Trap Activated ^5<<");

	thread spinnyright();

	while(1)
	{
		brush rotateYaw(360,2);
		wait .1;
	}

	trigger delete();

}

spinnyright()
{
	brush = getent("spinny_right","targetname");
	trigger = getent("spinny_trig","targetname");

	while(1)
	{
		brush rotateYaw(-360,2);
		wait .1;
	}
}

block2()
{
	brush = getent("block2","targetname");
	trigger = getent("block2_trigger","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush moveZ(-192,.5);
	brush waittill("movedone");
	wait 4;
	brush moveZ(192,2);
}

secret() //You must activate the secret in order to the teleportation system to work
{
	trigger1 = getent("step1","targetname");
	trigger1 waittill("trigger" , player );
	iPrintLn("^5Hmhmh");
	trigger2 = getent("step2","targetname");
	trigger2 waittill("trigger" , player );
	iPrintLn("^5Getting closer =0");
	trigger3 = getent("step3","targetname");
	trigger3 waittill("trigger" , player );
	brush = getent("secretbruh","targetname");
	secret = getent("secret","targetname");

	secret maps\mp\_utility::triggerOn();

	level.fail = 0;

	brush show();
	brush solid();

	thread secretfound();
	thread retries();
	thread retries2();
	thread retries3();

	level.secret_hud = newHudElem();
	level.secret_hud.foreground = true;
	level.secret_hud.AlignX = "center";
	level.secret_hud.AlignY = "top";
	level.secret_hud.horzAlign = "center";
	level.secret_hud.vertAlign = "top";
	level.secret_hud.x = 0;
	level.secret_hud.y = 10;
	level.secret_hud.sort = 0;
	level.secret_hud.fontScale = 2.5;
	level.secret_hud.color = (0.5, 0.0, 0.8);
	level.secret_hud.font = "objective";
	level.secret_hud.glowcolor = (0.5, 0.0, 0.8);
	level.secret_hud.glowAlpha = 1;
	level.secret_hud.hideWhenInMenu = false;
	level.secret_hud setText( ">>   ^2" + player.name + "^5 Has Unlocked The ^3Secret Room^6!   <<" );
	level.secret_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.secret_hud destroy();
}


secretfound()
{

entTransporter = getentarray("secret","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread Secrettele();
  }
}

Secrettele()
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

rollerlaser()
{

	brush = getent("rollerlaser","targetname");
	rlh = getent("rlhurt","targetname");
	base = getent("rollerbase","targetname");

	rlh maps\mp\_utility::triggerOn();

	brush solid();
	brush show();

	rlh enablelinkto();
	rlh linkto(brush);
	brush linkto(base);

	base moveZ(40, 4);

	base waittill("movedone");

	while(1)
	{
		time = RandomIntRange( 2 , 6 );
		wait(0.1);
		base moveZ(-80, time);
		base waittill("movedone");
		base moveZ(80, time);
		base waittill("movedone");
	}

}

bouncefall()
{
	fall = getEnt("bouncefall","targetname"); //this trigger is on the floor? yah
	spawn_jump = getEnt( "bounce_jumper", "targetname" );
	spawn_acti = getEnt( "bounce_acti", "targetname" );

	while(1)
	{
		fall waittill("trigger",player);
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( spawn_jump.origin );
			player setPlayerAngles( spawn_jump.angles );
		}
		else
		{
			player setOrigin( spawn_acti.origin );
			player setPlayerAngles(spawn_acti.angles );
		}
		wait .05; //try that
	}
}

actirun()
{
		level.actirun_trig = getEnt( "actirun", "targetname");
		jump = getEnt( "actirun_jumper", "targetname" );
		acti = getEnt( "actirun_acti", "targetname" );


		while(1)
		{
				level.actirun_trig waittill( "trigger", player );
				if(!player sr\api\_deathrun::order())
			continue;
				if( !isDefined( level.actirun_trig ) )
						return;

				level.old_trig delete();
				level.generator_trig delete();

				player freezeControls(true);
				player SetPlayerAngles( jump.angles );
				player setOrigin( jump.origin );
				player TakeAllWeapons();
				player GiveWeapon( "knife_mp" ); //jumper weapon
				player switchToWeapon( "knife_mp" );
				if(isDefined(level.activ) && isAlive(level.activ))
				{
						level.activ setPlayerangles( acti.angles );
						level.activ setOrigin( acti.origin );
						level.activ TakeAllWeapons();
						level.activ GiveWeapon( "knife_mp" );
						level.activ SwitchToWeapon( "knife_mp" );
						wait 0.05;
				}
				wait 0.05;

				player freezeControls(false);
   }
}

a1()
{
	trigger = getent("a1","targetname");
	brush = getent("a1b","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
		brush rotateYaw(360,2);
		wait .1;
	}

	trigger delete();

}

a2() //Doesn't work meh
{
	trigger = getent("a2","targetname");
	brush = getentarray("lol","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
		for(i=0;i<brush.size;i++)
		{
			brush[i] rotateYaw(360,.5);
			wait 1;
		}
	}

	trigger delete();

}

a3()
{
	trigger = getent("a3","targetname");
	brush = getent("a3b","targetname");
	hurt = getent("a3_hurt","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");
	quake = getent("quake2","targetname");
	sound = getent("sound2","targetname");

	hurt enablelinkto(brush);
	hurt linkto (brush);

	brush moveZ(-176,1);
	brush waittill("movedone");

	Earthquake( 0.7, 8, quake.origin, 10000 );
	sound PlaySound( "elm_quake_sub_rumble");

	wait 1;

	brush moveZ(230,1);
	brush waittill("movedone");
	wait 2;

	trigger delete();

}

a4()
{
	trigger = getent("a4","targetname");
	brush = getent("a4b","targetname");
	trigger waittill("trigger");
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
		brush rotatePitch(-360,5);
		wait .1;
		brush rotatePitch(-360,5);
		wait .1;
	}

	trigger delete();
}

actiruntext()
{
	trigger = getent("actirun","targetname");
	trigger waittill("trigger" , player );

	level.ar_hud = newHudElem();
	level.ar_hud.foreground = true;
	level.ar_hud.AlignX = "center";
	level.ar_hud.AlignY = "top";
	level.ar_hud.horzAlign = "center";
	level.ar_hud.vertAlign = "top";
	level.ar_hud.x = 0;
	level.ar_hud.y = 10;
	level.ar_hud.sort = 0;
	level.ar_hud.fontScale = 2.5;
	level.ar_hud.color = (0.5, 0.0, 0.8);
	level.ar_hud.font = "objective";
	level.ar_hud.glowcolor = (0.5, 0.0, 0.8);
	level.ar_hud.glowAlpha = 1;
	level.ar_hud.hideWhenInMenu = false;
	level.ar_hud setText( ">>   ^1" + player.name + "^3 Chosen ^5ActiRun!   <<" );
	level.ar_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.ar_hud destroy();
}

actirundoor()
{
	trigger = getent("actirundoor","targetname");
	brush = getent("actidoor","targetname");
	trigger waittill("trigger");

	iPrintLnBold("^1" + level.activ.name + "^2reached the end! ^3FIGHT!");

	brush moveY(236,4);
	brush waittill("movedone");

	trigger delete();
}

lazor1() //x513 - add hurt
{
	trigger = getent("mode","targetname");
	brush = getent("lazor1","targetname");
	hurt = getent("lazor1hurt","targetname");
	origin = getent("lazor1origin","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush show();
	brush solid();

	hurt maps\mp\_utility::triggerOn();

	hurt enablelinkto(origin);
	hurt linkto(origin);

	origin linkto(brush);

	while(1)
	{
		time = RandomIntRange( 2 , 6 );
		wait(0.1);
		brush moveX(513,time);
		brush waittill("movedone");
		brush moveX(-513,time);
		brush waittill("movedone");
	}
}

lazor2() //x513 - add hurt
{
	trigger = getent("mode","targetname");
	brush = getent("lazor2","targetname");
	hurt = getent("lazor2hurt","targetname");
	origin = getent("lazor2origin","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush show();
	brush solid();

	hurt maps\mp\_utility::triggerOn();

	hurt enablelinkto(origin);
	hurt linkto(origin);

	origin linkto(brush);

	while(1)
	{
		time = RandomIntRange( 2 , 6 );
		wait(0.1);
		brush moveX(513,time);
		brush waittill("movedone");
		brush moveX(-513,time);
		brush waittill("movedone");
	}
}

radiation2()
{
	orgs = getEntArray( "origin_radiation", "targetname" );
	trig = getEnt( "trigger_radiation2", "targetname" );
	trig.oldpos = trig.origin;
	trig thread WatchRadiationTrigger2();
	trig.origin += (0,0,5000);

	while(1)
	{
		wait 3+RandomInt(5);
		for(i=0;i<orgs.size;i++)
			PlayFX( level.fx_radiation, orgs[i].origin );
		trig.origin = trig.oldpos;
		wait 6;
		trig.origin += (0,0,5000);
	}
}

WatchRadiationTrigger2()
{

	trigger = getent("trigger_radiation2","targetname");

	while(1)
	{
		self waittill( "trigger", player );

		if(player isTouching(trigger))
		{
					player thread radEffect2();
		}
	}
}

radEffect2()
{
	self endon( "disconnect" );
	self endon( "death" );

	if( !isDefined( self.rad ) )
		self.rad = false;

	if( self.rad )
		return;

	self.rad = true;

	for(i=0;i<5;i++)
	{
		self ShellShock( "teargas", 4 );
		self FinishPlayerDamage( self, self, 20, 0, "MOD_SUICIDE", "knife_mp", self.origin, self.angles, "none", 0 );
		self PlayLocalSound("beathing_hurt");
		wait 2;
	}
	self.rad = false;
}

r2brushes()
{

	trigger = getent("r2b","targetname");
	brush = getentarray("http://gyazo.com/63fa6b2713783084949b12bd0f99d11f","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
		for(i=0;i<brush.size;i++)
		{
			time = RandomIntRange( 2 , 6 );
			wait(0.1);
			brush[i] moveZ(-160, time );
			brush[i] waittill("movedone");
			brush[i] moveZ(160, time );
			brush[i] waittill("movedone");
		}
	}

		trigger delete();

}

lazah()
{
	brush = getent("lazah2","targetname");
	trigger = getent("lazahtrig","targetname");
	hurt = getent("lazahhurt","targetname");
	trigger waittill("trigger");

	brush show();
	hurt maps\mp\_utility::triggerOn();
	wait 4;
	brush hide();
	hurt maps\mp\_utility::triggerOff();
}

lasttrap()
{
	trigger = getent("lasttrap_trigger","targetname");
	brush = getent("lasttrap_brush","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	thread ltlaser();

	while(1)
	{
		time = RandomIntRange( 2 , 6 );
		wait(0.1);
		brush rotateYaw(360,time);
		wait 2;
	}

	trigger delete();
}

ltlaser()
{
	brush = getent("ltlaser","targetname");
	main = getent("lasttrap_brush","targetname");

	brush show();

	thread lthurt();

	brush linkto(main);
}

lthurt()
{
	lasers = getent("ltlaser","targetname");
	hurt = getent("lthurt","targetname");
	hurt maps\mp\_utility::triggerOn();

	hurt enablelinkto();
	hurt linkto(lasers);
}

generator()
{
        level.generator_trig = getEnt( "generator", "targetname");
        jump = getEnt( "generator_jumper", "targetname" );
        acti = getEnt( "generator_acti", "targetname" );

        thread gentext();

        while(1)
        {
                level.generator_trig waittill( "trigger", player );
                if(!player sr\api\_deathrun::order())
			continue;
                if( !isDefined( level.generator_trig ) )
                        return;

                thread generatorplatforms();

                level.actirun_trig delete();
                level.old_trig delete();

				player freezeControls(true);
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
				player GiveWeapon( "ak47_mp" );
				player SwitchToWeapon( "ak47_mp" );
				player GiveMaxAmmo( "ak47_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
						level.activ GiveWeapon( "ak47_mp" );
						level.activ SwitchToWeapon( "ak47_mp" );
						level.activ GiveMaxAmmo( "ak47_mp" );
                        wait 0.05;

                }
                wait 0.05;

			   player freezeControls(false);
   }

}

generatorplatforms()
{
	platforms = getentarray("gp1","targetname");
	trigger = getent("generator","targetaname");
	org = getent("gunga","targetname");

	thread generatorplatform();

	while(1)
	{
		for(i=0;i<platforms.size;i++)
		{
			platforms[i] linkto(org);
			org rotateYaw(360,4);
			wait .1;
		}
	}

}

generatorplatform()
{
	brush = getent("gp2","targetname");
	org = getent("generator_org2","targetname");

	brush linkto(org);

	while(1)
	{
		org rotateYaw(-360,3);
		wait 1;
	}
}

old()
{
        level.old_trig = getEnt( "old", "targetname");
        jump = getEnt( "old_jumper", "targetname" );

 		thread oldtext();

        while(1)
        {
                level.old_trig waittill( "trigger", player );
                if(!player sr\api\_deathrun::order())
			continue;
                if( !isDefined( level.old_trig ) )
                        return;

                level.actirun_trig delete();
                level.generator_trig delete();

				player freezeControls(true);
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );

                wait 0.05;

			   player freezeControls(false);
   }

}

lasertrap1() //multiple lasers
{
	brush = getent("lasertrap1_brush","targetname");
	hurt = getent("lasertrap1_hurt","targetname");
	trigger = getent("lasertrap1_trigger","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	hurt maps\mp\_utility::triggerOn();

	brush show();

	wait 2;

	brush hide();

	brush notsolid();

	hurt maps\mp\_utility::triggerOff();

}

lasertrap2() //One dynamic laser
{
	base = getent("lasertrap2_base","targetname");
	brush = getent("lasertrap2_brush","targetname");
	trigger = getent("lasertrap2_trigger","targetname");
	hurt = getent("lasertrap2_hurt","targetname");

	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	brush show();

	hurt maps\mp\_utility::triggerOn();

	brush linkto(base);
	hurt enablelinkto();
	hurt linkto(brush);

	base moveZ(96, 1.5);

	base waittill("movedone");

 	for(;;)
 	{
  	    time = RandomIntRange( 2 , 6 );
		wait(0.1);
		base moveZ( -192, time );
		base waittill("movedone");
		base moveZ( 192, time );
		base waittill("movedone");
	}
}

pixel() //I don't know why this is called Pixel, move on //radiant bugs, fix later
{
	brush = getent("gungabeast","targetname");
	trigger = getent("electro_trigger","targetname");
	hurt = getent("error","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
			brush show();
			hurt maps\mp\_utility::triggerOn();
			wait 2;
			brush hide();
			hurt maps\mp\_utility::triggerOff();
			wait 5;
	}

}

finished()
{
	trigger = getent("endmap_trig","targetname");
	trigger waittill("trigger" , player );

	level.jump_hud = newHudElem();
	level.jump_hud.foreground = true;
	level.jump_hud.AlignX = "center";
	level.jump_hud.AlignY = "top";
	level.jump_hud.horzAlign = "center";
	level.jump_hud.vertAlign = "top";
	level.jump_hud.x = 0;
	level.jump_hud.y = 10;
	level.jump_hud.sort = 0;
	level.jump_hud.fontScale = 2.5;
	level.jump_hud.color = (0.5, 0.0, 0.8);
	level.jump_hud.font = "objective";
	level.jump_hud.glowcolor = (0.5, 0.0, 0.8);
	level.jump_hud.glowAlpha = 1;
	level.jump_hud.hideWhenInMenu = false;
	level.jump_hud setText( ">>   ^1" + player.name + "^5 Finished ^6Electory ^61ST!   <<" );
	level.jump_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.jump_hud destroy();
}

spinny2()
{
	brush = getent("spinzor","targetname");
	clip = getent("spinzor_clip","targetname");
	trigger = getent("spinny2_trigger","targetname");
	trigger waittill("trigger");

	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	while(1)
	{
		brush rotateYaw(360,1);
		clip rotateYaw(360,1);
		wait .05;
	}

	trigger delete();

}

bounce()
{
        level.bounce_trig = getEnt( "bounce", "targetname");
        jump = getEnt( "bounce_jumper", "targetname" );
        acti = getEnt( "bounce_acti", "targetname" );

 		thread bouncetext();

        while(1)
        {
                level.bounce_trig waittill( "trigger", player );
                if(!player sr\api\_deathrun::order())
			continue;
                if( !isDefined( level.bounce_trig ) )
                        return;

                level.actirun_trig delete();
                level.old_trig delete();
                level.generator_trig delete();

				player freezeControls(true);
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
				player GiveWeapon( "knife_mp" );
				player SwitchToWeapon( "knife_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
						level.activ GiveWeapon( "knife_mp" );
						level.activ SwitchToWeapon( "knife_mp" );
                        wait 0.05;

                }
                wait 0.05;

			   player freezeControls(false);
   }

}

bouncetext()
{
	trigger = getent("bounce","targetname");
	trigger waittill("trigger" , player );

	level.bounce_hud = newHudElem();
	level.bounce_hud.foreground = true;
	level.bounce_hud.AlignX = "center";
	level.bounce_hud.AlignY = "top";
	level.bounce_hud.horzAlign = "center";
	level.bounce_hud.vertAlign = "top";
	level.bounce_hud.x = 0;
	level.bounce_hud.y = 10;
	level.bounce_hud.sort = 0;
	level.bounce_hud.fontScale = 2.5;
	level.bounce_hud.color = (0.5, 0.0, 0.8);
	level.bounce_hud.font = "objective";
	level.bounce_hud.glowcolor = (0.5, 0.0, 0.8);
	level.bounce_hud.glowAlpha = 1;
	level.bounce_hud.hideWhenInMenu = false;
	level.bounce_hud setText( ">>   ^1" + player.name + "^3 Chosen ^5Bounce Room!   <<" );
	level.bounce_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.bounce_hud destroy();
}

gentext()
{
	trigger = getent("generator","targetname");
	trigger waittill("trigger" , player );

	level.gen_hud = newHudElem();
	level.gen_hud.foreground = true;
	level.gen_hud.AlignX = "center";
	level.gen_hud.AlignY = "top";
	level.gen_hud.horzAlign = "center";
	level.gen_hud.vertAlign = "top";
	level.gen_hud.x = 0;
	level.gen_hud.y = 10;
	level.gen_hud.sort = 0;
	level.gen_hud.fontScale = 2.5;
	level.gen_hud.color = (0.5, 0.0, 0.8);
	level.gen_hud.font = "objective";
	level.gen_hud.glowcolor = (0.5, 0.0, 0.8);
	level.gen_hud.glowAlpha = 1;
	level.gen_hud.hideWhenInMenu = false;
	level.gen_hud setText( ">>   ^1" + player.name + "^3 Chosen ^5Generator Room!   <<" );
	level.gen_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.gen_hud destroy();
}

oldtext()
{
	trigger = getent("old","targetname");
	trigger waittill("trigger" , player );

	level.old_hud = newHudElem();
	level.old_hud.foreground = true;
	level.old_hud.AlignX = "center";
	level.old_hud.AlignY = "top";
	level.old_hud.horzAlign = "center";
	level.old_hud.vertAlign = "top";
	level.old_hud.x = 0;
	level.old_hud.y = 10;
	level.old_hud.sort = 0;
	level.old_hud.fontScale = 2.5;
	level.old_hud.color = (0.5, 0.0, 0.8);
	level.old_hud.font = "objective";
	level.old_hud.glowcolor = (0.5, 0.0, 0.8);
	level.old_hud.glowAlpha = 1;
	level.old_hud.hideWhenInMenu = false;
	level.old_hud setText( ">>   ^1" + player.name + "^3 Chosen ^5Old Room!   <<" );
	level.old_hud setPulseFX( 40, 4000, 400 );

	wait 5;
	level.old_hud destroy();
}

secretfin()
{

entTransporter = getentarray("secrettele","targetname");
  if(isdefined(entTransporter))
  {
	for(lp=0;lp<entTransporter.size;lp=lp+1)
	  entTransporter[lp] thread secretfin1();
  }


}

secretfin1()
{

  while(true)
  {
   self waittill("trigger",other);
   other freezeControls(true);
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
   other GiveWeapon("ak47_mp");
   other GiveMaxAmmo("ak47_mp");
   other SwitchToWeapon("ak47_mp");
   other freezeControls(false);
  }

}

retries()
{
	trigger_teleport = getEnt( "checkpoint2", "targetname" );
	trigger_destination = getEnt("checkpoint2_dest","targetname");

	while(1)
	{
		trigger_teleport waittill ("trigger", player);

		level.fail += 1;

		if(level.fail == 9)
		{
			player iPrintlnBold( "^1Final Attempt!" );
		}

		if(level.fail == 10)
		{
			player suicide();
		}

		player SetOrigin(trigger_destination.origin);
		player SetPlayerAngles( trigger_destination.angles );
	}
	wait .1;
}

trails() //Thread functions for trials (Thanks to Xenon)
{

	self.trail = 0;

	thread trail1();
	thread trail2();
	thread trail3();
	thread trail4();
	thread trail5();
}

trail1()
{
	trigger = getEnt ("trail1", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();


	while(isAlive(player))
	{
		if(self.trail == 0)
		{
			playFx( level.fx_trail1 , player.origin );
			wait .1;

			self.trail = 1;
		}
		else
		{
			break;
		}
	}
}

trail2()
{
	trigger = getEnt ("trail2", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	self.trail = 1;

	while(isAlive(player))
	{
		playFx( level.fx_trail2 , player.origin );
		wait .1;
	}
}

trail3()
{
	trigger = getEnt ("trail3", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	self.trail = 1;

	while(isAlive(player))
	{
		playFx( level.fx_trail3 , player.origin );
		wait .1;
	}
}

trail4()
{
	trigger = getEnt ("trail4", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	self.trail = 1;

	while(isAlive(player))
	{
		playFx( level.fx_trail4 , player.origin );
		wait .1;
	}
}

trail5()
{
	trigger = getEnt ("trail5", "targetname");


	trigger waittill ("trigger", player);
	trigger delete();

	self.trail = 1;

	while(isAlive(player))
	{
		playFx( level.fx_trail5 , player.origin );
		wait .1;
	}
}

speed( trigger )
{
	if( !isDefined( trigger ) )
		return;

	while(1)
	{
		trigger waittill( "trigger", player );
		if( isDefined( player.bh ) )
			continue;
		player thread PushPlayer( trigger );
	}
}

PushPlayer( trigger )
{
	self endon("disconnect");

	self.bh = true;

	if(distance(trigger.origin, self.origin) > 400) // then the player tried to load-glitch the speed
	{
		self freezeControls(true);
		wait 0.1;
		self freezeControls(false);
	}

	else
	{
		target = getEnt(trigger.target, "targetname");
		speed = int(strTok(trigger.script_noteworthy, ",")[0]);

		self.health    = 1000000;
		self.maxhealth = 1000000;

		self thread adminOff();
		setDvar("g_knockback", (speed*9)-3000);
		self finishPlayerDamage(self, self, (speed*9)-3000, 0, "MOD_FALLING", "deserteaglegold_mp", trigger.origin, (trigger.origin - target.origin), "head", 0);
		wait 0.05;

		self notify("admin_on");

		self.health    = 100;
		self.maxhealth = 100;
	}

	while(self isTouching(trigger))
		wait 0.05;

	self.bh = undefined;
}

adminOff()
{
	self endon("disconnect");

	status = false;
	type = "";
	if(isDefined(self.cj) && isDefined(self.cj["status"]))
	{
		status = self.cj["status"];
		self.cj["status"] = false;
		type = "cj";
	}
	else if(isDefined(self.eIsAdmin))
	{
		status = self.eIsAdmin;
		self.eIsAdmin = false;
		type = "exso";
	}
	else if(isDefined(self.arr) && isDefined(self.arr["power"]))
	{
		status = self.arr["power"];
		self.arr["power"] = false;
		type = "aftershock";
	}
	else if(isDefined(self.mod))
	{
		if(isDefined(self.mod["admin"]) && self.mod["admin"])
		{
			status = true;
			self.mod["admin"] = false;
			type = "nade_admin";
		}

		else if(isDefined(self.mod["miniAdmin"]) && self.mod["miniAdmin"])
		{
			status = true;
			self.mod["miniAdmin"] = false;
			type = "nade_mini";
		}

		else if(isDefined(self.mod["admin"]) && self.mod["admin"] && isDefined(self.mod["miniAdmin"]) && self.mod["miniAdmin"])
		{
			status = true;
			self.mod["admin"] = false;
			self.mod["miniAdmin"] = false;
			type = "nade_both";
		}
	}
	else
		return;

	self waittill("admin_on");

	switch(type)
	{
		case "cj":         self.cj["status"] = status; break;
		case "exso":       self.eIsAdmin = status;     break;
		case "aftershock": self.arr["power"] = status; break;
		case "nade_admin": self.mod["admin"] = status; break;
		case "nade_mini":  self.mod["miniAdmin"] = status; break;
		case "nade_both":  self.mod["admin"] = true; self.mod["miniAdmin"] = true; break;
	}
}

retries2()
{
	trigger_teleport = getEnt( "checkpoint", "targetname" );
	trigger_destination = getEnt("checkpoint_dest","targetname");

	while(1)
	{
		trigger_teleport waittill ("trigger", player);

		level.fail += 1;

		if(level.fail == 9)
		{
			player iPrintlnBold( "^1Final Attempt!" );
		}

		if(level.fail == 10)
		{
			player suicide();
		}

		player SetOrigin(trigger_destination.origin);
		player SetPlayerAngles( trigger_destination.angles );
	}
	wait .1;
}

retries3()
{
	trigger_teleport = getEnt( "checkpoint3", "targetname" );
	trigger_destination = getEnt("checkpoint3_dest","targetname");

	while(1)
	{
		trigger_teleport waittill ("trigger", player);

		level.fail += 1;

		if(level.fail == 9)
		{
			player iPrintlnBold( "^1Final Attempt!" );
		}

		if(level.fail == 10)
		{
			player suicide();
		}

		player SetOrigin(trigger_destination.origin);
		player SetPlayerAngles( trigger_destination.angles );
	}
	wait .1;
}

bounceweapon()
{
	trigger = getEnt("bounce_weap","targetname");
	trigger waittill("trigger", player );

	player GiveWeapon("m40a3_mp");
	player GiveMaxAmmo("m40a3_mp");
	player SwitchToWeapon("m40a3_mp");

	trigger delete();
}

/*


$$$$$$$\  $$\                     $$\
$$  __$$\ \__|                    $$ |
$$ |  $$ |$$\ $$\   $$\  $$$$$$\  $$ |
$$$$$$$  |$$ |\$$\ $$  |$$  __$$\ $$ |
$$  ____/ $$ | \$$$$  / $$$$$$$$ |$$ |
$$ |      $$ | $$  $$<  $$   ____|$$ |
$$ |      $$ |$$  /\$$\ \$$$$$$$\ $$ |
\__|      \__|\__/  \__| \_______|\__|



The people above tested the map, and either found problem or offered suggestions I used.

Credits to people who have helped with scripting/mapping:

-Phaedrean
-Sentrex
-Staab
-Xenon
-JWofles

Be sure to visit CoDScript: http://codscript.net/

R.I.P Raid 2015 February - Never Forgotten:

Personally, I'd just like to thank you all for giving me the chance to run such an amazing community.
Raid has by-far been the greatest thing I have ever had the honor of being a part of. I never would have
thought that my little side-community Raid would turn into something so great as this. Thanks for the great times. - Darmuh

I'm actually a guy - BraXi

You probably forgot me. - Thomas

Nubs still spam me with coding questions. - Lossy



$$$$$$$\            $$\       $$\          $$$$$$\                          $$\
$$  __$$\           \__|      $$ |        $$  __$$\                         \__|
$$ |  $$ | $$$$$$\  $$\  $$$$$$$ |        $$ /  \__| $$$$$$\  $$$$$$\$$$$\  $$\ $$$$$$$\   $$$$$$\
$$$$$$$  | \____$$\ $$ |$$  __$$ |$$$$$$\ $$ |$$$$\  \____$$\ $$  _$$  _$$\ $$ |$$  __$$\ $$  __$$\
$$  __$$<  $$$$$$$ |$$ |$$ /  $$ |\______|$$ |\_$$ | $$$$$$$ |$$ / $$ / $$ |$$ |$$ |  $$ |$$ /  $$ |
$$ |  $$ |$$  __$$ |$$ |$$ |  $$ |        $$ |  $$ |$$  __$$ |$$ | $$ | $$ |$$ |$$ |  $$ |$$ |  $$ |
$$ |  $$ |\$$$$$$$ |$$ |\$$$$$$$ |        \$$$$$$  |\$$$$$$$ |$$ | $$ | $$ |$$ |$$ |  $$ |\$$$$$$$ |
\__|  \__| \_______|\__| \_______|         \______/  \_______|\__| \__| \__|\__|\__|  \__| \____$$ |
                                                                                          $$\   $$ |
                                                                                          \$$$$$$  |
                                                                                           \______/

 $$$$$$\            $$$$$$$\   $$$$$$\                      $$\            $$\
$$  __$$\           $$  __$$\ $$  __$$\                     \__|           $$ |
$$ /  \__| $$$$$$\  $$ |  $$ |$$ /  \__| $$$$$$$\  $$$$$$\  $$\  $$$$$$\ $$$$$$\
$$ |      $$  __$$\ $$ |  $$ |\$$$$$$\  $$  _____|$$  __$$\ $$ |$$  __$$\\_$$  _|
$$ |      $$ /  $$ |$$ |  $$ | \____$$\ $$ /      $$ |  \__|$$ |$$ /  $$ | $$ |
$$ |  $$\ $$ |  $$ |$$ |  $$ |$$\   $$ |$$ |      $$ |      $$ |$$ |  $$ | $$ |$$\
\$$$$$$  |\$$$$$$  |$$$$$$$  |\$$$$$$  |\$$$$$$$\ $$ |      $$ |$$$$$$$  | \$$$$  |
 \______/  \______/ \_______/  \______/  \_______|\__|      \__|$$  ____/   \____/
                                                                $$ |
                                                                $$ |
                                                                \__|

*/

slaya()
{
	trigger = getEnt( "slayaa", "targetname" );
	trigger waittill( "trigger", player );
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	thread slaya1();
	thread slaya2();
	thread slaya3();
	thread slaya4();

}

slaya1()
{

	brush = getent("slaya1","targetname");
	trigger = getEnt( "slayaa", "targetname" );

	while(1)
	{

		brush rotateroll(360,3);
		wait 1;

	}

}

slaya2()
{

	brush = getent("slaya2","targetname");
	trigger = getEnt( "slayaa", "targetname" );

	while(1)
	{

		brush rotateroll(-360,3);
		wait 1;

	}

}

slaya3()
{

	brush = getent("slaya3","targetname");
	trigger = getEnt( "slayaa", "targetname" );

	while(1)
	{

		brush rotateroll(360,3);
		wait 1;

	}

}

slaya4()
{

	brush = getent("slaya4","targetname");
	trigger = getEnt( "slayaa", "targetname" );

	while(1)
	{

		brush rotateroll(-360,3);
		wait 1;

	}

}

anothertrap()
{

	trigger = getEnt( "at_trigger", "targetname" );
	trigger waittill("trigger" , player );
	trigger sethintstring("^5>> ^3Trap Activated ^5<<");

	thread anothertrap1();
	thread anothertrap2();
	thread anothertrap3();

}

anothertrap1()
{

	brush = getent("anothertrap1","targetname");

	while(1)
	{

		brush rotateYaw(360,4);
		wait 1;

	}

}

anothertrap2()
{

	brush = getent("anothertrap2","targetname");

	while(1)
	{

		brush rotateYaw(-360,4);
		wait 1;

	}

}

anothertrap3()
{

	brush = getent("anothertrap3","targetname");

	while(1)
	{

		brush rotateYaw(360,4);
		wait 1;

	}

}


