main()
{
precacheItem( "remington700_mp" );

thread old(); //64
//thread jump(); //64
//thread snip();  //304
}

old()
{
enter_old = getent ("old_enter" , "targetname");
door = getentarray ("final_door" , "targetname");
sipka = getent ("sipka" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");
enter_jump = getent ("jump_enter" , "targetname");

enter_old waittill ("trigger" , player);
enter_snip delete();
enter_jump delete();

iprintlnbold ("^3---^1" + player.name + "^3--- ^2open FINAL door!");

sipka movex (184, 5);
door [randomInt(door.size)] movez(220, 10);
}

jump()
{
enter_old = getent ("old_enter" , "targetname");
sipka = getent ("sipka" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");
enter_jump = getent ("jump_enter" , "targetname");
enter_aktiv = getent ("aktivator_enter" , "targetname");
enter_aktiv_room = getent ("aktivator_enter_jump" , "targetname");
enter_jumper_room = getent ("jumper_enter_jump" , "targetname");

enter_jump waittill ("trigger" , jumper);
enter_snip delete();
enter_old delete();
sipka movex (64, 1.73);

jumper setorigin (enter_jumper_room.origin);
jumper setplayerangles (enter_aktiv_room.angles);
enter_aktiv waittill ("trigger", aktiv);
//jumper setorigin (enter_jumper_room.origin);
//jumper setplayerangles (enter_aktiv_room.angles);
aktiv setorigin (enter_jumper_room.origin);
aktiv setplayerangles (enter_aktiv_room.angles);
}

snip()
{
enter_old = getent ("old_enter" , "targetname");
sipka = getent ("sipka" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");
enter_jump = getent ("jump_enter" , "targetname");
enter_aktiv = getent ("aktivator_enter" , "targetname");
enter_aktiv_room = getent ("aktivator_enter_snip" , "targetname");

enter_snip waittill ("trigger" , jumper);
enter_jump delete();
enter_old delete();
sipka movex (304, 8.26);

jumper thread jumper_snip();
enter_aktiv waittill ("trigger", aktiv);
//jumper thread jumper_snip();
aktiv setorigin (enter_aktiv_room.origin);
aktiv setplayerangles (enter_aktiv_room.angles);

aktiv TakeAllWeapons();
aktiv GiveWeapon("remington700_mp");
wait 0.01;
aktiv SwitchToWeapon("remington700_mp");
}

jumper_snip()
{
enter_jumper_room = getent ("jumper_enter_snip" , "targetname");
enter_snip = getent ("snip_enter" , "targetname");

self setorigin (enter_jumper_room.origin);
self setplayerangles (enter_jumper_room.angles);

iprintlnbold ("^3---^1" + self.name + "^3--- ^2go in SNIPER room!");

self TakeAllWeapons();
self GiveWeapon("remington700_mp");
wait 0.01;
self SwitchToWeapon("remington700_mp");

while (1)
{
enter_snip waittill ("trigger" ,jumper);

jumper setorigin (enter_jumper_room.origin);
jumper setplayerangles (enter_jumper_room.angles);

iprintlnbold ("^3---^1" + self.name + "^3--- ^2go in SNIPER room!");

jumper TakeAllWeapons();
jumper GiveWeapon("remington700_mp");
wait 0.01;
jumper SwitchToWeapon("remington700_mp");
}
}