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

spawnTeleport(){
  targ = getEnt("targ_start_teleport", "targetname");
  trig = getEnt("trig_start_teleport", "targetname");
  block = getEnt("start_teleport", "targetname");

  level waittill("pumpkinSpawned");
  block Delete();

  while(true){
    trig waittill("trigger", player);

    player SetOrigin(targ.origin);
    player SetPlayerAngles(targ.angles);
    wait .00001;
  }
}

actiTp_init(){
  teleSize = 6;
  for(i = 0; i < teleSize; i++) {
    thread actiTeleports(i);
  }
}

actiTeleports(i){
  trig = getEnt("trig_actitp_" + (i + 1), "targetname");
  if(i > 3) i = 3;
  targ = getEnt("actitp_" + (i + 1), "targetname");
  
  trig SetHintString("Press ^1&&1^7 to teleport.");

  while(true){
    trig waittill("trigger", player);

    if(!level.inRoom){
      player SetOrigin(targ.origin);
      player SetPlayerAngles(targ.angles);
    }

    wait .1;
  }
}

lavatp(){
  trig = getEnt("trig_lavaroom", "targetname");
  targ = getEnt("lavaroom", "targetname");

  while(true){
    trig waittill("trigger", player);

    player SetOrigin(targ.origin);
    player SetPlayerAngles(targ.angles);

    wait .00001;
  }
}

endtp(){
  trig = getEnt("trig_end", "targetname");
  targ = getEnt("end", "targetname");

  while(true){
    trig waittill("trigger", player);

    player SetOrigin(targ.origin);
    player SetPlayerAngles(targ.angles);

    wait .00001;
  }
}

endroom(){
	trig=getent("trig_roomselection","targetname");
	targ=getent("roomselection","targetname");

  trig SetHintString("Press ^1&&1^7 to enter the room selection.");

	while(true){
		trig waittill("trigger",who);
		if(!isdefined(trig))
			return;

		iPrintLnBold(who.name+" ^6entered to the room selection^4!");

		who DisableWeapons();
		level.activ DisableWeapons();

    level.inRoom = true;
    who FreezeControls(true);
    level.activ FreezeControls(true);
		who setorigin(targ.origin);
		who setplayerangles(targ.angles);

    wait 1;
    who FreezeControls(false);

		while(isalive(who) && isdefined(who))
			wait 1;

    level.inRoom = false;
    level.pickedBouWeap = false;

		iPrintLnBold("^6End room is free^5!");
	}
}

secret(){
  trig = getEnt("trig_secretEnter", "targetname");
  targ = getEnt("secretEnter", "targetname");
  
  thread secretOut();

  while(true){
    trig waittill("trigger", player);

    player FreezeControls(true);
    player SetOrigin(targ.origin);
    player SetPlayerAngles(targ.angles);
    wait .1;
    player FreezeControls(false);
  }
}

secretOut(){
  trig = getEnt("trig_secOut", "targetname");
  targ = getEnt("secOut", "targetname");

  while(true){
    trig waittill("trigger", player);

    player FreezeControls(true);
    player SetOrigin(targ.origin);
    player SetPlayerAngles(targ.angles);
    wait .1;
    player FreezeControls(false);
  }
}

bounce_f(){
    trig = getEnt( "trig_bounceFail", "targetname" ); //trigger
    jump = getEnt( "bounce_jumper", "targetname" ); //jumper origin
    acti = getEnt( "bounce_activator", "targetname" ); //acti origin

    while(true){
    	trig waittill("trigger",player);
    	if(player.pers["team"] != level.dr_spec){
    		if(player.pers["team"] == level.dr_jump){
    			player setplayerangles(jump.angles);
          player setorigin(jump.origin);
    		}
    		else{
    			player setplayerangles(acti.angles);
          player setorigin(acti.origin);
    		}
    	}
    }
}