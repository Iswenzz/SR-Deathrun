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

onlyActi(){
  self iPrintLnBold("^5Only ^7the activator can ^1activate^7!");
  wait 1;
  self Suicide();
}

trap1_init(){
  ents = [];
  for(i = 0; i < 4; i++) {
    ents[i] = getEnt("trap1_" + (i + 1), "targetname");
    wait .01;
  }
  trig = getEnt("trig_trap1", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap1_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap1_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      player thread trap1(ents);
    } else {
      player onlyActi();
    }
  }
}

trap1(ents){
  switch(RandomInt(ents.size)){
    case 0:
      for(i = 1; i < ents.size; i++) {
        ents[i] MoveZ(-50, 3, 1, .1);
      }
      break;
    case 1:
      ents[0] MoveZ(-50, 3, 1, .1);
      ents[2] MoveZ(-50, 3, 1, .1);
      break;
    case 2:
      ents[0] MoveZ(-50, 3, 1, .1);
      ents[1] MoveZ(-50, 3, 1, .1);
      break;
    case 3:
      while(true){
        for(i = 0; i < ents.size; i++) {
          ents[i] MoveZ(-50, 3, 1, .1);
        }
        wait 5; 
        for(i = 0; i < ents.size; i++) {
          ents[i] MoveZ(50, 3, 1, .1);
        }
        wait 10;
      }
  }
}

trap2_init(){
  ents = [];
  for(i = 0; i < 15; i++) {
    trp = getEnt("trap2_" + (i + 1), "targetname");
    ents[i]["model"] = Spawn("script_model", trp.origin);
    ents[i]["model"].angles = trp.angles;
    ents[i]["model"] SetModel("asu_pumpkin");
    ents[i]["activ"] = true;
    wait .01;
  }
  trig = getEnt("trig_trap2", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap2_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap2_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      player thread trap2(ents);
    } else {
      player onlyActi();
    }
  }
}

trap2(ents){
  while(true){ 
    rnd = -1;
    isOk = false;
    while(!isOk){
      rnd = RandomInt(ents.size);
      isOk = ents[rnd]["activ"];
      wait .001;
    }

    TriggerFX(SpawnFX(level.explo, ents[rnd]["model"].origin));
    RadiusDamage(ents[rnd]["model"].origin, 300, 300, 50);
    Earthquake( 0.5, .2, ents[rnd]["model"].origin, 300 );
    ents thread trap2_ext(ents, rnd);

    wait RandomInt(3) + 3;
  }
}

trap2_ext(ents, n){
  ents[n]["model"] Hide();
  ents[n]["activ"] = false;
  wait RandomInt(8) + 3;
  ents[n]["model"] Show();
  ents[n]["activ"] = true;
}

trap3_init(){
  ent = getEnt("trap3", "targetname");
  eq = getEnt("trap3_eq", "targetname");
  trig = getEnt("trig_trap3", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap3_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap3_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      ent thread trap3(eq);
    } else {
      player onlyActi();
    }
  }
}

trap3(eq){
  Earthquake( 0.8, 1.3, eq.origin, 580 );
  self MoveZ(-1000, 1.3);
  self waittill("movedone");
  self Delete();
}

trap4_init(){
  ents = [];
  for(i = 0; i < 14; i++) {
    ents[i] = getEnt("trap4_" + (i + 1), "targetname");
    hurts = getEnt("trig_trap4_" + (i + 1), "targetname");
    hurts EnableLinkTo();
    hurts LinkTo(ents[i]);
    wait .01;
  }
  trig = getEnt("trig_trap4", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap4_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap4_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      
      for(i = 0; i < 14; i++) {
        if(i % 2 == 0){
          ents[i] thread trap4(592);
        } else {
          ents[i] thread trap4(-592);
        }

        wait RandomFloatRange(.1, 1);
      }
    } else {
      player onlyActi();
    }
  }
}

trap4(n){
  while(true){
    time = RandomInt(3) + 1;
    self thread trap4_move(n, time);
    self thread trap4_rotate(n, time);

    wait(time + RandomFloatRange(.1, 1));
    n *= -1;
  }
}

trap4_move(n, time){
  self MoveX(n, time);
}

trap4_rotate(n, time){
  self RotatePitch(n, time);
}

trap5_init(){
  ents = [];
  for(i = 0; i < 5; i++) {
    ents[i] = getEnt("trap5_" + (i + 1), "targetname");
    hurts = getEnt("trig_trap5_" + (i + 1), "targetname");
    hurts EnableLinkTo();
    hurts LinkTo(ents[i]);
    wait .01;
  }
  trig = getEnt("trig_trap5", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap5_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap5_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      for(i = 0; i < ents.size; i++){
        ents[i] thread trap5(144);
        wait RandomInt(3) + 1;
      }
      

    } else {
      player onlyActi();
    }
  }
}

trap5(n){
  while(true){
    time = RandomFloatRange(.1, 1);
    self MoveZ(n, time);
    self waittill("movedone");
    wait(time/2 + .5);
    n *= -1;
  }
}

trap6_init(){
  ents = [];
  for(i = 0; i < 7; i++) {
    ents[i] = getEnt("trap6_" + (i + 1), "targetname");
    wait .01;
  }
  trig = getEnt("trig_trap6", "targetname");

  trig SetHintString("Press ^1&&1^7 to activate the trap.");
  trig SetCursorHint("HINT_ACTIVATE");

  while(level.trap6_activ){
    trig waittill("trigger", player);

    if(player.pers["team"] == level.dr_acti){
      level.trap6_activ = false;

      trig SetHintString("Activator've ^1activated ^7this trap!");
      trig SetCursorHint("HINT_NOICON");

      thread trap6_down(ents);
      wait 4.5;
      thread trap6_up(ents);
    } else {
      player onlyActi();
    }
  }
}

trap6_down(ents){
  while(true){
    for(i = 0; i < ents.size; i++){
      ents[i] MoveZ(-50, 1);
      wait 1.01;
    }
  }
}

trap6_up(ents){
  while(true){
    for(i = 0; i < ents.size; i++){
      ents[i] MoveZ(50, 1);
      wait 1.01;
    }
  }
}