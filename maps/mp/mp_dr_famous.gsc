/*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]

*/

//Main Map Files
main()
{
 maps\mp\mp_dr_famous\teleport::main();
 maps\mp\mp_dr_famous\traps::main();
 maps\mp\mp_dr_famous\music::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 thread intro();
 thread hardfinish();
 thread startgate();
 thread bottomtext();
 thread secretfinish();
 thread rooms();

	//Fixes and Visual Tweaks
  setDvar("bg_falldamagemaxheight", 300000 );
  setDvar("bg_falldamageminheight", 128000 );
  setDvar("r_lightTweakSunColor", "1 0.921569 0.878431 1");
  setDvar("r_lightTweakSunDirection", "-50 136 1");
  setDvar("r_lightTweakSunLight", "1");
}

//Intro Text
intro()
{
	level waittill("round_started");
	noti = SpawnStruct();
		noti.titleText = " ^5 Welcome to mp_dr_famous by ^0FAM^9OUS NitroFire!";
		noti.notifyText = "===================================";
		noti.duration = 5;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

rooms()
{
  thread EndRooms();
  thread jumpweapon();
}

EndRooms() //Map Endrooms (Thanks Jeffskye! and lolz to fix his shit)
{
	level.playerinroom = 0;

	thread AddRoom("Sniper Room","enter5","sniper1","sniper2","m40a3_mp","max","music7",0,0);
	thread AddRoom("Jump Room","enter6","jump1","jump2","knife_mp","max","music6",0,0);
}

AddRoom(roomname,trig,tele_jumper,tele_activator,weap,ammo,music,old,rush)
{
	while(1)
	{
		getEnt(trig,"targetname") waittill("trigger",player);

		if(level.playerinroom)
			continue;

		if(!player sr\api\_deathrun::order())
            continue;

		level.playerinroom = 1;

		player setOrigin(getEnt(tele_jumper,"targetname").origin);
		player setPlayerAngles(getEnt(tele_jumper,"targetname").angles);
		
		ambientPlay(music);

		if(!isDefined(old)||!old)
		{
			player takeAllWeapons();
		}

		if(isDefined(weap)&&isDefined(ammo))
		{
			player giveWeapon(weap);

			if(ammo=="max")
				player giveMaxAmmo(weap);
			else
				player setWeaponAmmoClip(weap,ammo);

			player switchToWeapon(weap);
		}

		if(isDefined(level.activ)&&isAlive(level.activ))
		{
			if(isDefined(tele_activator))
			{
				level.activ setOrigin(getEnt(tele_activator,"targetname").origin);
				level.activ setPlayerAngles(getEnt(tele_activator,"targetname").angles);
			}

			if(!isDefined(old)||!old)
			{
				level.activ takeAllWeapons();
			}

			if(isDefined(weap)&&isDefined(ammo))
			{
				level.activ giveWeapon(weap);

				if(ammo=="max")
					level.activ giveMaxAmmo(weap);
				else
					level.activ setWeaponAmmoClip(weap,ammo);

				level.activ switchToWeapon(weap);
			}
		}

		iprintlnBold("^2"+Player.name+" ^5Has Entered the^2 "+roomname);

		player freezeControls(true);
		level.activ freezeControls(true);
		wait 1;

		player iPrintLnBold("^23");
		level.activ iPrintLnBold("^23");
		wait 1;

		player iPrintLnBold("^32");
		level.activ iPrintLnBold("^32");
		wait 1;

		player iPrintLnBold("^91");
		level.activ iPrintLnBold("^91");
		wait 1;

		player iPrintLnBold("^6Fight!");
		level.activ iPrintLnBold("^6Fight!");
		wait 1;

		player freezeControls(false);
		level.activ freezeControls(false);
		wait 0.05;

		if(!rush)
			WaitForDeath(player);

		level.playerinroom = 0;

		iPrintLnBold("^2"+player.name+" ^5has ^9DIED!");
	}
}

WaitForDeath(player)
{
    while(isDefined(player) && isAlive(player))
        wait 0.05;
}

jumpweapon() //Gives the player a sniper at the end of the Jump Room
{
  trig = getEnt("jumpweapon","targetname");

  for(;;)
  {
    trig waittill("trigger", who);
     who giveWeapon("m40a3_mp");
     who giveMaxAmmo("m40a3_mp");
     who switchToWeapon("m40a3_mp");
   }
}

//Hard Finish Text
hardfinish()
{
 trig = getEnt( "enter4", "targetname" );

 while(true)
 {
  trig waittill ("trigger",player );
  iPrintLnBold("^2" + player.name + " ^5has Finished the ^9HARD ^5Way!");
  {
  wait 0.25;
  }
 }
}

secretfinish() //Secret Finish Text
{
 trig = getEnt( "secret_finish", "targetname" );

 while(true)
 {
  trig waittill ("trigger",player );
  iPrintLnBold("^2" + player.name + " ^5has Finished the ^3SECRET ^5Way!");
  {
  wait 0.25;
  }
 }
}

//Start Gate Script
startgate()
{
 level waittill("round_started");
 door = getEnt("gate","targetname");
 trig = getEnt("gate_trig","targetname");
 trig waittill("trigger", player );
 wait 4;
 iPrintLnBold("^23");
 wait 1;
 iPrintLnBold("^32");
 wait 1;
 iPrintLnBold("^91");
 wait 0.5;
 iPrintLnBold("^5Go!!!");
 door movez(144,3,1,0.5);
 trig delete();
}

bottomtext()
{
	level waittill("round_started");
	while(1)
	{
	wait 10;
	iPrintLn("^3Welcome to mp_dr_famous!");
	wait 10;
	iPrintLn("^5Thanks to Everyone who Tested!");
	wait 10;
	iPrintLn("^5Thanks to all the ^0FAM^9OUS Members!");
	wait 10;
	iPrintLn("^5Steam : ^1david1205red");
	wait 10;
	iPrintLn("^5There are ^15 ^5Secrets on this map! Try and find them!");
	wait 10;
	iPrintLn("^5Thanks to ^1VC'Aria ^5, ^1SuX Lolz :] ^5, and ^1JeffSkye ^5for Help!");
	wait 10;
	iPrintLn("^5Thanks to ^1Voidix ^5for making the Loading Screen!");
	}
}
