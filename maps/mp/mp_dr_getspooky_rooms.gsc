/*
  __  __               __                                ___
 /\ \/\ \  __         /\ \__  __                        /\_ \
 \ \ \ \ \/\_\    ____\ \ ,_\/\_\    ___             ___\//\ \      __      ___
  \ \ \ \ \/\ \  /',__\\ \ \/\/\ \  /'___\ _______  /'___\\ \ \   /'__`\  /' _ `\
   \ \ \_/ \ \ \/\__, `\\ \ \_\ \ \/\ \__//\______\/\ \__/ \_\ \_/\ \L\.\_/\ \/\ \
    \ `\___/\ \_\/\____/ \ \__\\ \_\ \____\/______/\ \____\/\____\ \__/.\_\ \_\ \_\
     `\/__/  \/_/\/___/   \/__/ \/_/\/____/         \/____/\/____/\/__/\/_/\/_/\/_/



  ______
 /\  _  \
 \ \ \L\ \    ____  __  __    ___      __     _ __   _ __   __  __
  \ \  __ \  /',__\/\ \/\ \ /' _ `\  /'__`\  /\`'__\/\`'__\/\ \/\ \
   \ \ \/\ \/\__, `\ \ \_\ \/\ \/\ \/\ \L\.\_\ \ \/ \ \ \/ \ \ \_\ \
    \ \_\ \_\/\____/\ \____/\ \_\ \_\ \__/.\_\\ \_\  \ \_\  \/`____ \
     \/_/\/_/\/___/  \/___/  \/_/\/_/\/__/\/_/ \/_/   \/_/   `/___/> \
                                                                /\___/
                                                                \/__/


	Map by: Asunarry
	Vistic Clan

	Do not copy anything...
	Do not modify anything...

	Thanks to everyone who helped me to make this map! <3
*/

#include maps\mp\mp_dr_getspooky;

//create the room
createRoom(origin,angles,weapon,weapon2,health,freeze){
	self setorigin(origin);
	self setplayerangles(angles);

  self EnableWeapons();

	self takeallweapons();
	self giveweapon(weapon);
	self givemaxammo(weapon);
	self switchtoweapon(weapon);

	if(isdefined(weapon2)){
		self giveweapon(weapon2);
		self givemaxammo(weapon2);
	}

	self.health=health;
	self freezecontrols(freeze);
}

sniper(){
  level.sniper_trigger = getEnt( "trig_sniper", "targetname" );
  jump = getEnt( "sniper_jumper", "targetname" );
  acti = getEnt( "sniper_activator", "targetname" );

  while(true){
    level.sniper_trigger SetHintString("Press &&1 to enter the Sniper room.");
    level.sniper_trigger waittill("trigger",player);
    if(!isdefined(level.sniper_trigger)) return;

    if(isdefined(level.activ)){

      if(isdefined(level.activ) && isalive(level.activ)){
        player createRoom(jump.origin,jump.angles,"m40a3_mp","remington700_mp",100,1);
        level.activ createRoom(acti.origin,acti.angles,"m40a3_mp","remington700_mp",100,1);
      }
      else player createRoom(jump.origin,jump.angles,"m40a3_mp","remington700_mp",100,1);

      i = 0;
      thread roomHud(i, 0, -185, 1.7, "objective", " ^5Sniper ^6room has been chosen! "); i++;
      thread roomHud(i, 0, -160, 1.9, "default",   "^5" + removeColorFromString(player.name)); i++;
      thread roomHud(i, 0, -140, 1.9, "default",   "^1... vs ..."); i++;
      thread roomHud(i, 0, -120, 1.9, "default",   "^6" + removeColorFromString(level.activ.name)); i++;
      wait 6;

      player iPrintlnBold( "Fight!" );
      level.activ iPrintlnBold( "Fight!" );
      player freezecontrols(0);
      level.activ freezecontrols(0);
    }
    else player iPrintLnBold("^1You can not fight alone!");
	}
}

//knife room
knife(){
  level.knife_trigger = getEnt( "trig_knife", "targetname" );
  jump = getEnt( "knife_jumper", "targetname" );
  acti = getEnt( "knife_activator", "targetname" );

  while(true){
    level.knife_trigger SetHintString("Press &&1 to enter the Knife room.");
    level.knife_trigger waittill("trigger",player);
    if(!isdefined(level.knife_trigger)) return;

    if(isdefined(level.activ)){

      if(isdefined(level.activ) && isalive(level.activ)){
        player createRoom(jump.origin,jump.angles,"knife_mp",undefined,100,1);
        level.activ createRoom(acti.origin,acti.angles,"knife_mp",undefined,100,1);
      }
      else player createRoom(jump.origin,jump.angles,"knife_mp",undefined,100,1);

      i = 0;
      thread roomHud(i, 0, -185, 1.7, "objective", " ^5Knife ^6room has been chosen! "); i++;
      thread roomHud(i, 0, -160, 1.9, "default",   "^5" +removeColorFromString(player.name)); i++;
      thread roomHud(i, 0, -140, 1.9, "default",   "^1... vs ..."); i++;
      thread roomHud(i, 0, -120, 1.9, "default",   "^6" + removeColorFromString(level.activ.name)); i++;
      wait 6;
      
      player iPrintlnBold( "Fight!" );
      level.activ iPrintlnBold( "Fight!" );
      player freezecontrols(0);
      level.activ freezecontrols(0);
    }
    else player iPrintLnBold("^1You can not fight alone!");
	}
}

//random weapon room
randomWeapon(){
  level.randomweapon_trigger = getEnt( "trig_randomWeapon", "targetname" );
  jump = getEnt( "sniper_jumper", "targetname" );
  acti = getEnt( "sniper_activator", "targetname" );

  while(true){
    level.randomweapon_trigger SetHintString("Press &&1 to enter the Random Weapon room.");
    level.randomweapon_trigger waittill("trigger",player);
    if(!isdefined(level.randomweapon_trigger)) return;

    if(isdefined(level.activ)){

      rndIndex = randomInt(level.rndWeaponList["weap"].size);

      if(isdefined(level.activ) && isalive(level.activ)) {
        player createRoom(jump.origin,jump.angles,level.rndWeaponList["weap"][rndIndex],undefined,100,1);
        level.activ createRoom(acti.origin,acti.angles,level.rndWeaponList["weap"][rndIndex],undefined,100,1);
      }
      else player createRoom(jump.origin,jump.angles,level.rndWeaponList["weap"][rndIndex],undefined,100,1);

      i = 0;
      thread roomHud(i, 0, -185, 1.7, "objective", " ^5Random Weapon ^6room has been chosen! "); i++;
      thread roomHud(i, 0, -160, 1.9, "default",   "^5" + removeColorFromString(player.name)); i++;
      thread roomHud(i, 0, -140, 1.9, "default",   "^1... vs ..."); i++;
      thread roomHud(i, 0, -120, 1.9, "default",   "^6" + removeColorFromString(level.activ.name)); i++;
      thread roomHud(i, 0,  -95, 1.9, "default",   "^5The Weapon is: ^6" + level.rndWeaponList["txt" ][rndIndex]); i++;
      wait 6;

      player iPrintlnBold( "Fight!" );
      level.activ iPrintlnBold( "Fight!" );
      player freezecontrols(0);
      level.activ freezecontrols(0);
    }
    else player iPrintLnBold("^1You can not fight alone!");
	}
}

//bounce room
bounce(){
  level.bounce_trigger = getEnt( "trig_bounce", "targetname" );
  jump = getEnt( "bounce_jumper", "targetname" );
  acti = getEnt( "bounce_activator", "targetname" );

  while(true){
    level.bounce_trigger SetHintString("Press &&1 to enter the Bounce room.");
    level.bounce_trigger waittill("trigger",player);
    if(!isdefined(level.bounce_trigger)) return;

    if(isdefined(level.activ)){

      if(isdefined(level.activ) && isalive(level.activ)) {
        player createRoom(jump.origin,jump.angles,"knife_mp",undefined,100,1);
        level.activ createRoom(acti.origin,acti.angles,"knife_mp",undefined,100,1);
      }
      else player createRoom(jump.origin,jump.angles,"knife_mp",undefined,100,1);

      i = 0;
      thread roomHud(i, 0, -185, 1.7, "objective", " ^5Bounce ^6room has been chosen! "); i++;
      thread roomHud(i, 0, -160, 1.9, "default",   "^5" +removeColorFromString(player.name)); i++;
      thread roomHud(i, 0, -140, 1.9, "default",   "^1... vs ..."); i++;
      thread roomHud(i, 0, -120, 1.9, "default",   "^6" + removeColorFromString(level.activ.name)); i++;
      wait 6;

      player iPrintlnBold( "Fight!" );
      level.activ iPrintlnBold( "Fight!" );
      player freezecontrols(0);
      level.activ freezecontrols(0);
    }
    else player iPrintLnBold("^1You can not fight alone!");
	}
}