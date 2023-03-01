/*
Author: RB|Poseidon
Thanks to: RB|Jamayka for helping me on my first steps on mapping.
Also thanks to the CodScript.net community and specially to "Berry" and "Sentrex" for their help on my topics.
At final thanks to "Madlion" and "VC'Blade" for their help and generally all the players that helped me to test my map multiple times.
X-Fire: Poseidon2399
Skype: Poszah  *Leave a message for the reason you are adding me i dont use to add totaly strangers.*
Project begun at: 1/1/2015
Release Date: 1/9/2015
Name: mp_dr_Poseidon

I cant prevent you from using my scripts on your map but please give credits to me ("RB|Poseidon") if you find them useful :)
if you decompiled my map just to find the secrets please go away, cheating destroys every game.
Please dont edit this file without permission or if you really have to, note that you did, any malfanctions that may occur should not be shown as my responsibility.*
If you find any bugs report them on my skype or website!
Made exclusively for RoyalBrothers clan: http://royalbrothers.ml/

*This file is not editable and you should not attempt to edit it. For an editable version of the script contact me on skype.
*/

#include braxi\_common;main()
{if(getdvar("r_reflectionProbeGenerate")=="1")
return;maps\mp\_compass::setupMiniMap("compass_map_mp_dr_poseidon");setdvar("compassmaxrange","30000");setExpFog(4000,6000,0.81,0.75,0.63,0);maps\mp\_load::main();game["allies"]="marines";game["axis"]="opfor";game["attackers"]="axis";game["defenders"]="allies";game["allies_soldiertype"]="desert";game["axis_soldiertype"]="desert";game["music_script"]="dr_music_menu";game["secret_main"]="dr_secret_menu";game["secret_1"]="dr_secret1";game["secret_2"]="dr_secret2";game["secret_3"]="dr_secret3";game["help"]="pos_help";game["help2"]="pos_help2";game["help3"]="pos_help3";setdvar("dr_activator_speed","1.05");setdvar("dr_jumpers_speed","1.05");level.xpforsecretinsecret3=50;level.thingspeed=3;level.elevators_Z=-770;level.elevators_ZR=770;level.acti_is_free=true;level.sniper_locked=false;level.sniper_2_locked=false;level.weapon_locked=false;level.bounce_locked=false;level.dog_locked=false;level.grenade_locked=false;level.pool_locked=false;level.knife_locked=false;level.random_locked=false;level.sniper2Triggered=0;level.bomb=LoadFX("explosions/artilleryexp_dirt_brown_2");level.green=LoadFX("misc/aircraft_light_wingtip_green");level.red=LoadFX("misc/aircraft_light_wingtip_red");level.mapheight=528;level.finished=0;level.Actied=false;level.ActiSlideNum=0;level.door1Open=false;level.door2Open=false;level.door3Open=false;thread onPlayerConnected();thread onEndRound();thread initAmbient();thread onPlayerSpawn();thread precache();thread setup_traps();thread activator_spawndoor();thread blocks_move();thread things_move();thread teleportasdasd();thread endmap_teleport();thread ammo();thread door1();thread door2();thread preparestuff();thread sniper();thread sniper_2_unlocked();thread weapon();thread dog();thread grenade();thread bounce_room();thread pool_room();thread knife_room();thread random_room();thread old();thread trap7prepare();thread secret0();thread secret1();thread teleport("secret1back",-512,15232,53,0,90,0,"",""," has finished the secret #1!",true);thread teleport("tel_back_to_part_2",-512,17792,44,0,0,0,"","","",false);thread teleport("tel_acti_back_to_part_2",512,18112,40,0,0,0,"","","",false);thread teleport("telback1",-512,-6000,65,0,-90,0,"","","",false);thread teleport("telback2",-832,-7425,65,0,180,0,"","","",false);thread teleport("telback3",-2528,-8000,65,0,-90,0,"","","",false);thread secret_stuff0_0();thread secret_stuff0_7();thread secret_stuff0_3();thread secret_stuff0_2();thread secret_inside_secret();thread triggers_setup();thread die_bitch();thread bouncesign();thread poolsign();thread map_menu();thread secret_menu();thread bounceroomconfig();thread part8();thread water_splash();thread watersplash_death();thread watersplash_death2("pondsplash_1");thread watersplash_death2("pondsplash_2");thread watersplash_death2("pondsplash_3");thread watersplash_death2("pondsplash_4");thread watersplash_death2("pondsplash_5");thread watersplash_death2("pondsplash_6");thread watersplash_death2("pondsplash_7");thread f16();thread teleport_to_finish_effect();thread secret_3_effect();thread secret3();thread secret3_part2();thread watchshellshocksecret3();thread rain_light();thread pool_doors();thread birds();thread debug_part1();thread dog_fire();thread dog_hurt();thread grenade_r_stuff();thread Watch_helpMenu();thread onDeath_music();thread watchActiFunMusic("door1");thread watchActiFunMusic("door2","music8");thread watchActiFunMusic("door3","music9");thread watchActiFunMusic("door4","music7");thread act_Natural("like_im_talkin_to_my_self");thread activatorEntertainment("init");thread electroStationSparks();thread secret4();thread huge_waterFall();thread out_of_secret_in_secret_3();}
addTriggerToList(name)
{if(!isDefined(level.trapTriggers))
level.trapTriggers=[];level.trapTriggers[level.trapTriggers.size]=getEnt(name,"targetname");}
onPlayerConnected(){for(;;)
{level waittill("connected",player);player thread playSoundOnRoundStart();player.weapons=0;Guid=getSubStr(player getGuid(),24,32);if(Guid=="ebe7edd0")
iPrintlnBold("^3Map creator ^5"+player.name+" ^3Joined the game!");}}
onEndRound()
{while(1)
{level waittill("endround");thread stopAllMusic();}}
stopAllMusic()
{players=getAllPlayers();for(i=0;i<players.size;i++)
{players[i]stopAllSounds();}}
stopAllSounds()
{for(i=1;i<10;i++)
{self stopLocalSound("music"+i);}}
playSoundOnRoundStart()
{while(1)
{level waittill("round_started");self.currentSound=("music"+RandomIntRange(1,10));self PlayLocalSound(self.currentSound);self.playing_music=true;}}
initAmbient()
{ambientPlay("ambient");}
onPlayerSpawn(){while(true)
{level waittill("player_spawn",player);}}
precache()
{precacheItem("remington700_mp");precacheItem("m40a3_mp");precacheItem("dragunov_mp");precacheItem("frag_grenade_mp");precacheItem("barrett_mp");precacheItem("dog_mp");precacheItem("ak74u_reflex_mp");precacheItem("rpg_mp");precacheItem("ak47_reflex_mp");precacheItem("winchester1200_grip_mp");precacheItem("brick_blaster_mp");precacheItem("beretta_silencer_mp");precacheItem("dog_mp");precacheItem("knife_mp");precacheItem("rpd_acog_mp");precacheItem("mp5_silencer_mp");precacheItem("saw_mp");precacheItem("g3_acog_mp");precacheItem("p90_mp");precacheItem("m4_acog_mp");PreCacheItem("m16_acog_mp");PreCacheItem("deserteagle_mp");PrecacheShellshock("pos_secret3_shellshock");}
setup_traps()
{thread trap1();thread trap2();thread trap3();thread trap4();thread trap5();thread trap6();thread trap7();thread trap8();thread trap9();thread trap10();thread trap11();}
trap1()
{bows1=getent("bows1","targetname");bows2=getent("bows2","targetname");bows3=getent("bows3","targetname");trap1=getent("trap1","targetname");trap1 waittill("trigger",player);level.Actied=true;trap1 delete();bows1 moveX(1050,0.5);bows2 moveX(1050,0.5);bows3 moveX(1050,0.5);wait 0.55;bows1 delete();bows2 delete();bows3 delete();}
trap2()
{floor=getent("falling_floor","targetname");floor_leafes=getent("falling_floor_leafes","targetname");trap2=getent("trap2","targetname");trap2 waittill("trigger",player);level.Actied=true;trap2 delete();floor moveZ(-1000,1);floor_leafes delete();wait 1.05;floor delete();}
trap3()
{fall_blocks2=getent("falling_blocks2","targetname");fall_blocks1=getent("falling_blocks1","targetname");trap3=getent("trap3","targetname");trap3 waittill("trigger",player);level.Actied=true;trap3 delete();x=RandomInt(2);switch(x)
{case 0:fall_blocks1 moveZ(-1000,1);wait 1.05;fall_blocks1 delete();break;case 1:fall_blocks2 moveZ(-1000,1);wait 1.05;fall_blocks2 delete();break;}}
trap4()
{trap4=getent("trap4","targetname");trap4 waittill("trigger",player);level.Actied=true;level.thingspeed=1.6;trap4 delete();}
trap5()
{trap5=getent("trap5","targetname");trap5 waittill("trigger",player);level.Actied=true;thread crouchjumpshow();trap5 delete();}
trap6()
{trap6=getent("trap6","targetname");bounce=getent("bouncefuckyou","targetname");fix=getent("bouncetrapfix","targetname");bounce1=getent("bouncetrapfix2","targetname");bounce2=getent("bouncetrapfix3","targetname");bounce3=getent("bouncetrapfix4","targetname");trap6 waittill("trigger",player);level.Actied=true;bounce1 show();bounce2 show();bounce moveY(70,.05);bounce3 moveY(70,.05);wait.1;fix delete();trap6 delete();}
trap7()
{x=360;y=1.1;trap7=getent("trap7","targetname");rotary1=getEnt("rotary1","targetname");rotary2=getEnt("rotary2","targetname");rotary3=getEnt("rotary3","targetname");rotary4=getEnt("rotary4","targetname");rotary5=getEnt("rotary5","targetname");trap7 waittill("trigger",player);level.Actied=true;while(1)
{rotary1 rotatePitch(x-x*2,y);rotary2 rotatePitch(x,y);rotary3 rotatePitch(x-x*2,y);rotary4 rotatePitch(x,y);rotary5 rotatePitch(x-x*2,y);wait y;}
trap7 delete();}
trap8()
{trap8=getent("trap8","targetname");steer1=getent("trap8_steer1","targetname");steer2=getent("trap8_steer2","targetname");steer3=getent("trap8_steer3","targetname");origin=getent("earthquake","targetname");org=[];org[0]=getent("earthquake_fall1","targetname");org[1]=getent("earthquake_fall2","targetname");org[2]=getent("earthquake_fall3","targetname");org[3]=getent("earthquake_fall4","targetname");org[4]=getent("earthquake_fall5","targetname");effect=LoadFX("mp_dr_poseidon/pos_cave_earthquake");trap8 waittill("trigger",player);level.Actied=true;trap8 delete();Earthquake(0.7,10,origin.origin,2000);dirtFallFx1=playLoopedFX(effect,1,org[0].origin);dirtFallFx2=playLoopedFX(effect,1,org[1].origin);dirtFallFx3=playLoopedFX(effect,1,org[2].origin);dirtFallFx4=playLoopedFX(effect,1,org[3].origin);dirtFallFx5=playLoopedFX(effect,1,org[4].origin);wait 12;dirtFallFx1 delete();dirtFallFx2 delete();dirtFallFx3 delete();dirtFallFx4 delete();dirtFallFx5 delete();}
trap9()
{trap9=getent("trap9","targetname");blocks=getent("trap9_block","targetname");fx=getEnt("trap9_fx","targetname");trap9 waittill("trigger",player);level.Actied=true;trap9 delete();blocks delete();fx moveZ(-16,2);}
trap10()
{trap10=getent("trap10","targetname");block=getent("trap10_block","targetname");fx=getEnt("trap10_fx","targetname");trap10 waittill("trigger",player);level.Actied=true;trap10 delete();block delete();fx moveZ(-16,2);}
trap11()
{x=1;r=360;trap11=getent("trap11","targetname");block1=getent("trap11_block_1","targetname");block2=getent("trap11_block_2","targetname");block3=getent("trap11_block_3","targetname");block4=getent("trap11_block_4","targetname");block5=getent("trap11_block_5","targetname");fx=getEnt("trap11_fx","targetname");trap11 waittill("trigger",player);level.Actied=true;trap11 delete();fx moveZ(-16,2);while(1)
{block1 rotatePitch(r,x);wait x+.05;block2 rotateYaw(r,x);wait x+.05;block3 rotateRoll(r,x);wait x+.05;block4 rotatePitch(r,x);wait x+.05;block5 rotateYaw(r,x);wait x+.05;block1 rotateRoll(r,x);wait x+.05;block2 rotatePitch(r,x);wait x+.05;block3 rotateYaw(r,x);wait x+.05;block4 rotateRoll(r,x);wait x+.05;block5 rotatePitch(r,x);wait x+.05;block1 rotateYaw(r,x);wait x+.05;block2 rotateRoll(r,x);wait x+.05;block3 rotatePitch(r,x);wait x+.05;block4 rotateYaw(r,x);wait x+.05;block5 rotateRoll(r,x);wait x+.05;}}
jumpers_spawndoor()
{door1=getent("jumpers_door1","targetname");door2=getent("jumpers_door2","targetname");door1 rotateYaw(90,1.7);door2 rotateYaw(-90,1.7);}
activator_spawndoor()
{mainactivatordoortrigger=getent("activator_openDoor","targetname");mainactivatordoor=getent("acti_door","targetname");mainactivatordoorclip=getent("acti_door_clip","targetname");mainactivatordoortrigger waittill("trigger",player);mainactivatordoor rotateYaw(-90,1.5);mainactivatordoorclip rotateYaw(-90,1.5);mainactivatordoortrigger delete();}
blocks_move()
{block1=getent("block1","targetname");block2=getent("block2","targetname");block3=getent("block3","targetname");block4=getent("block4","targetname");while(true)
{blocks_move_reduce(block1,block2,block3,block4);blocks_move_reduce(block4,block1,block2,block3);blocks_move_reduce(block3,block4,block1,block2);blocks_move_reduce(block2,block3,block4,block1);}}
blocks_move_reduce(e1,e2,e3,e4)
{x=1.8;y=512;z=374;e1 moveX(y,x);e2 moveY(z,x);e3 moveX(y-y*2,x);e4 moveY(z-z*2,x);wait x;}
things_move()
{thing1=getent("moving_thing1","targetname");thing2=getent("moving_thing2","targetname");while(1)
{for(i=0;i<19;i++)
{thing1 moveY(27,level.thingspeed/20);thing2 moveY(-27,level.thingspeed/20);wait level.thingspeed/20;}
for(i=0;i<19;i++)
{thing1 moveY(-27,level.thingspeed/20);thing2 moveY(27,level.thingspeed/20);wait level.thingspeed/20;}}}
mapmadeby(text)
{hud=addTextHud(self,320,60,0,"center","middle",2.5);hud setText(text);hud.color=(0.4,0.7,1);hud.glowColor=(1,0.9,0.2);hud.glowAlpha=1;hud SetPulseFX(90,100000,700);hud fadeOverTime(1);hud.alpha=1;wait 4.8;hud fadeOverTime(2);hud.alpha=0;wait 0.4;hud destroy();}
addTextHud(who,x,y,alpha,alignX,alignY,fontScale)
{if(isPlayer(who))
hud=newClientHudElem(who);else
hud=newHudElem();hud.x=x;hud.y=y;hud.alpha=alpha;hud.alignX=alignX;hud.alignY=alignY;hud.fontScale=fontScale;return hud;}
teleportasdasd()
{entTransporterjumpers=getentarray("teleportjumpers","targetname");if(isdefined(entTransporterjumpers))
for(i=0;i<entTransporterjumpers.size;i++)
entTransporterjumpers[i]thread transporter();entTransporteracti=getentarray("teleportacti","targetname");if(isdefined(entTransporteracti))
for(i=0;i<entTransporteracti.size;i++)
entTransporteracti[i]thread transporter();}
transporter()
{actualdoor=getent("rotatingdoor1","targetname");for(;;)
{self waittill("trigger",player);if(player.pers["team"]=="allies")
{iPrintLn("^2"+player.name+" has reached second part!");entTarget=getEnt(self.target,"targetname");wait 0.1;player setOrigin(entTarget.origin);player setplayerangles(entTarget.angles);wait 0.1;}
else
{entTarget=getEnt(self.target,"targetname");wait 0.1;player setOrigin(entTarget.origin);player setplayerangles(entTarget.angles);wait 0.1;actualdoor rotateYaw(-90,1);}}}
endmap_teleport()
{trig=getEnt("endmap_trig","targetname");while(1)
{trig waittill("trigger",player);player notify("reached_final");switch(level.finished)
{case 0:iprintlnbold("^3"+player.name+"^7 finished first!");level.finished++;break;case 1:iprintlnbold("^3"+player.name+"^7 finished second!");level.finished++;break;case 2:iprintlnbold("^3"+player.name+"^7 finished third!");level.finished++;break;case 3:iprintlnbold("^3"+player.name+"^7 finished fourth!");level.finished++;break;case 4:iprintlnbold("^3"+player.name+"^7 finished fifth!");level.finished++;break;case 5:iprintlnbold("^3"+player.name+"^7 finished sixth!");level.finished++;break;case 6:iprintlnbold("^3"+player.name+"^7 finished seventh!");level.finished++;break;case 7:iprintlnbold("^3"+player.name+"^7 finished eighth!");level.finished++;break;case 8:iprintlnbold("^3"+player.name+"^7 finished ninth!");level.finished++;break;case 9:iprintlnbold("^3"+player.name+"^7 finished tenth!");level.finished++;break;default:iprintlnbold("^3"+player.name+"^7 finished eleventh+!");break;}
player freezeControls(true);player SetOrigin((4,-3160,56));player SetPlayerAngles((0,-90,0));wait 0.1;player freezeControls(false);players=getAllPlayers();for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis"&&level.acti_is_free==true)
{players[i]takeAllWeapons();players[i]freezeControls(true);players[i]SetPlayerAngles((0,-90,0));players[i]SetOrigin((8,-2400,56));wait 0.1;players[i]freezeControls(false);players[i]giveWeapon("knife_mp");players[i]switchToWeapon("knife_mp");level.acti_is_free=false;}}
wait.05;}}
ammo()
{thread ammo_restore("ammo1",true);thread ammo_restore("ammo2",true);}
ammo_restore(trigger,msg)
{trig=getent(trigger,"targetname");while(1)
{trig waittill("trigger",player);currentWeapon=player getCurrentWeapon();player givemaxammo(currentWeapon);if(msg==true)
player iPrintLnBold("^2Ammo restored!");}}
door1()
{door1=getent("open_the_door1","targetname");door1 waittill("trigger",player);door1 delete();wait 0.5;thread jumpers_spawndoor();}
door2()
{door3=getent("actidoortrigger","targetname");while(1)
{door3 waittill("trigger",player);player openMenu(game["help2"]);player setClientDvar("pos_help2_text","Sure go back?");player thread onMenuResponse4(4);}}
preparestuff()
{crouchjump=getent("crouchjump","targetname");ele2_ground=getent("elevator_rest2","targetname");ele2_antiglitch=getent("ele2_antiglitch","targetname");bounce1=getent("bouncetrapfix2","targetname");bounce2=getent("bouncetrapfix3","targetname");action=getEnt("action","targetname");actionclip=getEnt("actionclip","targetname");f16_1=getEnt("f16_1","targetname");f16_2=getEnt("f16_2","targetname");f16_3=getEnt("f16_3","targetname");f16_4=getEnt("f16_4","targetname");f16_5=getEnt("f16_5","targetname");pool_ruins=getEnt("pool_ruins","targetname");grenade_ruins=getEnt("grenade_ruins","targetname");sniper2_ruins=getEnt("sniper2_ruins","targetname");sniper_ruins=getEnt("sniper_ruins","targetname");dog_ruins=getEnt("dog_ruins","targetname");bounce_ruins=getEnt("bounce_ruins","targetname");weapon_ruins=getEnt("weapon_ruins","targetname");lucky_ruins=getEnt("lucky_ruins","targetname");knife_ruins=getEnt("knife_ruins","targetname");green_org=getEnt("green_origin","targetname");crouchjump hide();bounce1 hide();bounce2 hide();crouchjump moveZ(500,.05);action hide();action moveZ(-80,1);actionclip moveZ(-80,1);f16_1 hide();f16_2 hide();f16_3 hide();f16_4 hide();f16_5 hide();pool_ruins hide();grenade_ruins hide();sniper2_ruins hide();sniper_ruins hide();dog_ruins hide();weapon_ruins hide();bounce_ruins hide();lucky_ruins hide();knife_ruins hide();level.old_green=playLoopedFX(level.green,1,green_org.origin);level notify("elevator1_arrived");level notify("elevator2_arrived");level notify("elevator3_arrived");}
crouchjumpshow()
{crouchjump=getent("crouchjump","targetname");crouchjump moveZ(-500,.05);wait.1;crouchjump show();}
trap7prepare()
{rotary1=getEnt("rotary1","targetname");rotary2=getEnt("rotary2","targetname");rotary3=getEnt("rotary3","targetname");rotary4=getEnt("rotary4","targetname");rotary5=getEnt("rotary5","targetname");rotary1 rotatePitch(18,.1);rotary2 rotatePitch(-18,.1);rotary3 rotatePitch(18,.1);rotary4 rotatePitch(-18,.1);rotary5 rotatePitch(18,.1);}
sniper()
{trig=getEnt("sniper","targetname");sniperblackline=getEnt("sniperblackline","targetname");sniperblackline_fix=getEnt("sniperblackline_fix","targetname");while(1)
{trig waittill("trigger",player);if(level.sniper_locked==false)
{level.sniper_locked=true;thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the sniper room");if(isDefined(sniperblackline))
{sniperblackline delete();sniperblackline_fix moveZ(8,0.05);}
player SetOrigin((-640,-2625,-462));player SetPlayerAngles((0,-45,0));player thread match_begin();player TakeAllWeapons();player GiveWeapon("remington700_mp");player GiveMaxAmmo("remington700_mp");player SwitchToWeapon("remington700_mp");player thread onDeath_sniper();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((444,-3904,-462));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("remington700_mp");players[i]givewep("m40a3_mp");}}
return;}}}}
sniper_2()
{trig=getEnt("sniper_2","targetname");while(1)
{trig waittill("trigger",player);if(level.sniper_2_locked==false)
{level.sniper_2_locked=true;thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the strategy sniper room");player SetOrigin((-1400,-1920,76));player SetPlayerAngles((0,125,0));player thread match_begin();player TakeAllWeapons();player GiveWeapon("remington700_mp");player GiveMaxAmmo("remington700_mp");player SwitchToWeapon("remington700_mp");player AllowSprint(true);player thread onDeath_sniper_2();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,-45,0));players[i]SetOrigin((-6464,5920,144));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("remington700_mp");players[i]givewep("m40a3_mp");}}
return;}}}}
sniper_2_Unlocked()
{trig=getEnt("sniper_2","targetname");while(1)
{trig waittill("trigger",player);level.sniper2Triggered++;thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the strategy sniper room");player SetOrigin((-1400,-1920,76));player SetPlayerAngles((0,125,0));player thread match_begin();player TakeAllWeapons();player GiveWeapon("remington700_mp");player GiveMaxAmmo("remington700_mp");player SwitchToWeapon("remington700_mp");player AllowSprint(true);if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis"&&level.sniper2Triggered<=1)
{players[i]SetPlayerAngles((0,-45,0));players[i]SetOrigin((-6464,5920,144));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("remington700_mp");players[i]givewep("m40a3_mp");}}}}}
weapon()
{trig=getEnt("weapon","targetname");weaponblackline=getEnt("weaponblackline","targetname");while(1)
{trig waittill("trigger",player);if(level.weapon_locked==false)
{level.weapon_locked=true;thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the weapon room");weaponblackline hide();player SetOrigin((-640,-2625,368));player SetPlayerAngles((0,-45,0));player thread match_begin();player TakeAllWeapons();player givewep("beretta_silencer_mp");player thread onDeath_weapon();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((530,-3797,368));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("beretta_silencer_mp");}}
return;}}}}
dog()
{trig=getEnt("dog","targetname");dogblackline=getEnt("dogblackline","targetname");while(1)
{trig waittill("trigger",player);if(level.dog_locked==false)
{level.dog_locked=true;thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the dog room");dogblackline hide();player SetOrigin((-768,-2624,32));player SetPlayerAngles((0,225,0));player thread match_begin();player TakeAllWeapons();player givewep("dog_mp");player setModel("german_sheperd_dog");player thread onDeath_dog();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((-1984,-3904,32));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("dog_mp");players[i]setModel("german_sheperd_dog");}}
return;}}}}
grenade()
{trig=getEnt("grenade","targetname");grenadeblackline=getEnt("grenadeblackline","targetname");while(1)
{trig waittill("trigger",player);if(level.grenade_locked==false)
{level.grenade_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the grenade room");grenadeblackline hide();player SetOrigin((730,-3264,10));player SetPlayerAngles((0,0,0));player thread match_begin();player TakeAllWeapons();player givewep("frag_grenade_mp");player thread max_grenade_ammo();player thread onDeath_grenade();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,90,0));players[i]SetOrigin((2010,-3264,10));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("frag_grenade_mp");players[i]thread max_grenade_ammo();}}
return;}}}}
bounce_room()
{trig=getEnt("bounce","targetname");while(1)
{trig waittill("trigger",player);if(level.bounce_locked==false)
{level.bounce_locked=true;thread forceResetAllTeleportValues();thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the bounce room");player SetOrigin((-3856,11424,-1020));player SetPlayerAngles((5,90,0));player thread match_begin();player TakeAllWeapons();player givewep("knife_mp");player thread onDeath_bounce();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((5,-90,0));players[i]SetOrigin((-2304,14208,-1020));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("knife_mp");}}
return;}}}}
pool_room()
{trig=getEnt("pool","targetname");while(1)
{trig waittill("trigger",player);if(level.pool_locked==false)
{level.pool_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the pool room");player SetOrigin((-10496,12384,-500));player SetPlayerAngles((0,-90,0));player thread match_begin();player TakeAllWeapons();player thread pool_weapon();player thread onDeath_pool();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,90,0));players[i]SetOrigin((-10960,13248,-500));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]thread pool_weapon();}}
return;}}}}
knife_room()
{trig=getEnt("knife","targetname");org_acti=getEnt("knife_acti","targetname");org_jumper=getEnt("knife_jumper","targetname");while(1)
{trig waittill("trigger",player);if(level.knife_locked==false)
{level.knife_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the knife room");player takeAllWeapons();player giveWeapon("knife_mp");player switchToWeapon("knife_mp");player SetOrigin(org_jumper.origin);player setPlayerAngles(org_jumper.angles);player thread match_begin();player thread onDeath_knife();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]takeAllWeapons();players[i]giveWeapon("knife_mp");players[i]switchToWeapon("knife_mp");players[i]SetOrigin(org_acti.origin);players[i]setPlayerAngles(org_acti.angles);players[i]thread match_begin();}}
return;}}}}
random_room()
{trig=getEnt("lucky","targetname");while(1)
{trig waittill("trigger",player);x=randomInt(8);switch(x)
{case 0:thread sniperStandalone(player);break;case 1:thread sniper2Standalone(player);break;case 2:thread weaponStandalone(player);break;case 3:thread dogStandalone(player);break;case 4:thread grenadeStandalone(player);break;case 5:thread bounceStandalone(player);break;case 6:thread poolStandalone(player);break;case 7:thread knifeStandalone(player);break;default:thread knifeStandalone(player);break;}}}
old()
{trig=getEnt("old","targetname");door=getEnt("old_door","targetname");trig waittill("trigger",player);thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");if(isdefined(trig))
trig delete();iprintlnbold("^3"+player.name+"^7 choosed the old way");door rotateYaw(-90,0.8);}
sniperStandalone(player)
{if(level.sniper_locked==false)
{level.sniper_locked=true;thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();sniperblackline=getEnt("sniperblackline","targetname");sniperblackline_fix=getEnt("sniperblackline_fix","targetname");iprintlnbold("^3"+player.name+"^7 choosed the sniper room");if(isDefined(sniperblackline))
{sniperblackline delete();sniperblackline_fix moveZ(8,0.05);}
player SetOrigin((-640,-2625,-462));player SetPlayerAngles((0,-45,0));player thread match_begin();player TakeAllWeapons();player GiveWeapon("remington700_mp");player GiveMaxAmmo("remington700_mp");player SwitchToWeapon("remington700_mp");player thread onDeath_sniper();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((444,-3904,-462));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("remington700_mp");players[i]givewep("m40a3_mp");}}
return;}}}
sniper2Standalone(player)
{if(level.sniper_2_locked==false)
{thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the strategy sniper room");player SetOrigin((-1400,-1920,76));player SetPlayerAngles((0,125,0));player thread match_begin();player TakeAllWeapons();player GiveWeapon("remington700_mp");player GiveMaxAmmo("remington700_mp");player SwitchToWeapon("remington700_mp");if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,-45,0));players[i]SetOrigin((-6464,5920,144));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("remington700_mp");players[i]givewep("m40a3_mp");}}
return;}}}
weaponStandalone(player)
{weaponblackline=getEnt("weaponblackline","targetname");if(level.weapon_locked==false)
{level.weapon_locked=true;thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the weapon room");weaponblackline hide();player SetOrigin((-640,-2625,368));player SetPlayerAngles((0,-45,0));player thread match_begin();player TakeAllWeapons();player givewep("beretta_silencer_mp");player thread onDeath_weapon();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((530,-3797,368));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("beretta_silencer_mp");}}
return;}}}
dogStandalone(player)
{dogblackline=getEnt("dogblackline","targetname");if(level.dog_locked==false)
{level.dog_locked=true;thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the dog room");dogblackline hide();player SetOrigin((-768,-2624,32));player SetPlayerAngles((0,225,0));player thread match_begin();player TakeAllWeapons();player givewep("dog_mp");player setModel("german_sheperd_dog");player thread onDeath_dog();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,45,0));players[i]SetOrigin((-1984,-3904,32));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("dog_mp");players[i]setModel("german_sheperd_dog");}}
return;}}}
grenadeStandalone(player)
{grenadeblackline=getEnt("grenadeblackline","targetname");if(level.grenade_locked==false)
{level.grenade_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the grenade room");grenadeblackline hide();player SetOrigin((730,-3264,10));player SetPlayerAngles((0,0,0));player thread match_begin();player TakeAllWeapons();player givewep("frag_grenade_mp");player thread max_grenade_ammo();player thread onDeath_grenade();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,90,0));players[i]SetOrigin((2010,-3264,10));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("frag_grenade_mp");players[i]thread max_grenade_ammo();}}
return;}}}
bounceStandalone(player)
{if(level.bounce_locked==false)
{level.bounce_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the bounce room");player SetOrigin((-3856,11424,-1020));player SetPlayerAngles((5,90,0));player thread match_begin();player TakeAllWeapons();player givewep("knife_mp");player thread onDeath_bounce();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((5,-90,0));players[i]SetOrigin((-2304,14208,-1020));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]givewep("knife_mp");}}
return;}}}
poolStandalone(player)
{if(level.pool_locked==false)
{level.pool_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("knife","knife_gate","knife_ruins","knife_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the pool room");player SetOrigin((-10496,12384,-500));player SetPlayerAngles((0,-90,0));player thread match_begin();player TakeAllWeapons();player thread pool_weapon();player thread onDeath_pool();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]SetPlayerAngles((0,90,0));players[i]SetOrigin((-10960,13248,-500));players[i]thread match_begin();players[i]TakeAllWeapons();players[i]thread pool_weapon();}}
return;}}}
knifeStandalone(player)
{org_acti=getEnt("knife_acti","targetname");org_jumper=getEnt("knife_jumper","targetname");if(level.knife_locked==false)
{level.knife_locked=true;thread room_del("dog","dog_gate","dog_ruins","dog_explosion");thread room_del("sniper_2","sniper2_gate","sniper2_ruins","sniper2_explosion");thread room_del("sniper","sniper_gate","sniper_ruins","sniper_explosion");thread room_del("weapon","weapon_gate","weapon_ruins","weapon_explosion");thread room_del("grenade","grenade_gate","grenade_ruins","grenade_explosion");thread room_del("bounce","bounce_gate","bounce_ruins","bounce_explosion");thread room_del("lucky","lucky_gate","lucky_ruins","lucky_explosion");thread room_del("pool","pool_gate","pool_ruins","pool_explosion");thread old_del();iprintlnbold("^3"+player.name+"^7 choosed the knife room");player takeAllWeapons();player giveWeapon("knife_mp");player switchToWeapon("knife_mp");player SetOrigin(org_jumper.origin);player setPlayerAngles(org_jumper.angles);player thread match_begin();player thread onDeath_knife();if(GetTeamPlayersAlive("axis")>=1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="axis")
{players[i]takeAllWeapons();players[i]giveWeapon("knife_mp");players[i]switchToWeapon("knife_mp");players[i]SetOrigin(org_acti.origin);players[i]setPlayerAngles(org_acti.angles);players[i]thread match_begin();}}
return;}}}
room_del(trigN,gateN,ruinsN,explosionN)
{trig=getEnt(trigN,"targetname");gate=getEnt(gateN,"targetname");ruins=getEnt(ruinsN,"targetname");explosion=getEnt(explosionN,"targetname");if(isDefined(explosion))
playFx(level.bomb,explosion.origin);if(isDefined(gate))
gate delete();if(isDefined(ruins))
ruins show();if(isdefined(trig))
trig delete();if(isDefined(explosion))
explosion delete();}
old_del()
{trig=getEnt("old","targetname");red_org=getEnt("red_origin","targetname");green_org=getEnt("green_origin","targetname");playLoopedFx(level.red,1,red_org.origin);if(isDefined(trig))
trig delete();if(isDefined(level.old_green))
level.old_green delete();}
pool_weapon()
{x=randomInt(10);switch(x)
{case 1:self givewep("ak47_reflex_mp");break;case 2:self givewep("ak74u_reflex_mp");break;case 3:self givewep("mp5_silencer_mp");break;case 4:self givewep("barrett_mp");break;case 5:self givewep("g3_acog_mp");break;case 6:self givewep("saw_mp");break;case 7:self givewep("winchester1200_grip_mp");;break;case 8:self givewep("p90_mp");break;case 9:self givewep("m40a3_mp");break;case 10:self givewep("m16_acog_mp");break;default:self givewep("dragunov_mp");break;}}
match_begin()
{self endon("death");self endon("disconnect");self freezeControls(true);self iPrintLnBold("^1Match starts in:");self iPrintLnBold("^23");wait 1;self iPrintLnBold("^32");wait 1;self iPrintLnBold("^41");wait 1;self iPrintLnBold("^5 Let the slaughter begin!!!");self freezeControls(false);}
onDeath_sniper()
{self waittill("death");level.sniper_locked=false;thread sniper();}
onDeath_sniper_2()
{self waittill("death");level.sniper_2_locked=false;thread sniper_2();}
onDeath_weapon()
{self waittill("death");level.weapon_locked=false;thread weapon();}
onDeath_dog()
{self waittill("death");level.dog_locked=false;thread dog();}
onDeath_grenade()
{self waittill("death");level.grenade_locked=false;thread grenade();}
onDeath_bounce()
{self waittill("death");level.bounce_locked=false;thread bounce_room();}
onDeath_pool()
{self waittill("death");level.pool_locked=false;thread pool_room();}
onDeath_knife()
{self waittill("death");level.knife_locked=false;thread knife_room();}
secret0()
{trig=getEnt("secret0","targetname");for(;;)
{trig waittill("trigger",player);player freezeControls(true);player iPrintLnBold("^2Secret Room 0");player thread play_secret_sound();player SetOrigin((-194,-46,250));player SetPlayerAngles((0,0,0));wait.5;player freezeControls(false);}}
play_secret_sound()
{if(!isDefined(self.playing_music))
self.playing_music=false;if(!isDefined(self.playing_secret_sound))
self.playing_secret_sound=false;if(self.playing_secret_sound==false&&self.playing_music==false)
{self.playing_secret_sound=true;self PlayLocalSound("begin");wait 23;self.playing_secret_sound=false;}}
secret1()
{trig=getEnt("secret1","targetname");for(i=0;i<3;i++)
{trig waittill("trigger",player);player freezeControls(true);player iPrintLnBold("^2Secret Room 1");player SetOrigin((-512,-6000,65));player SetPlayerAngles((0,-90,0));wait.5;player freezeControls(false);}}
secret_stuff0_0()
{lol1=getEnt("secret_moving1","targetname");lol2=getEnt("secret_moving2","targetname");lol3=getEnt("secret_moving3","targetname");while(1)
{lol1 moveY(-400,2);lol2 moveY(400,2);lol3 moveX(100,2);wait 2.05;lol1 moveY(400,2);lol2 moveY(-400,2);lol3 moveX(-100,2);wait 2.05;}}
secret_stuff0_7()
{lol4=getEnt("godhelpme","targetname");lol5=getEnt("ohgod","targetname");lol4 waittill("trigger",player);lol4 delete();lol5 moveZ(-150,2);wait 2.05;lol5 delete();}
secret_stuff0_3()
{lol6=getEnt("gift","targetname");while(1)
{lol6 waittill("trigger",player);if(player.weapons<3)
{player rtdweap();}
else
{player iPrintLnBold("^2Sorry man we are out of weapons");}
player.weapons++;wait 0.5;}}
secret_stuff0_2()
{trig=getEnt("secret3_opendoor","targetname");door1=getEnt("secret3_doorclip","targetname");door2=getEnt("secret3_door","targetname");trig waittill("trigger",player);door1 rotateYaw(90,1.5);door2 rotateYaw(90,1.5);trig delete();}
triggers_setup()
{addTriggerToList("trap1");addTriggerToList("trap2");addTriggerToList("trap3");addTriggerToList("trap4");addTriggerToList("trap5");addTriggerToList("trap6");addTriggerToList("trap7");addTriggerToList("trap8");addTriggerToList("trap9");addTriggerToList("trap10");addTriggerToList("trap11");}
die_bitch()
{thread die("die_bitch1");thread die("die_bitch2");thread die("die_bitch3");thread die("die_bitch4");thread die("die_bitch5");}
die(trigger)
{trigger=getEnt(trigger,"targetname");while(1)
{trigger waittill("trigger",player);player suicide();}}
rtdweap()
{x=RandomInt(10);q="You got a";switch(x)
{case 0:self givewep("remington700_mp");self iPrintLnBold(q+" remington700_mp");break;case 1:self givewep("m40a3_mp");self iPrintLnBold(q+" m40a3_mp");break;case 2:self givewep("dragunov_mp");self iPrintLnBold(q+" dragunov_mp");break;case 3:self givewep("barrett_mp");self iPrintLnBold(q+" barrett_mp");break;case 4:self givewep("ak74u_reflex_mp");self iPrintLnBold(q+" ak74u_reflex_mp");break;case 5:self givewep("rpg_mp");self iPrintLnBold(q+" rpg_mp");break;case 6:self givewep("ak47_reflex_mp");self iPrintLnBold(q+" ak47_reflex_mp");break;case 7:self givewep("winchester1200_grip_mp");self iPrintLnBold(q+" winchester1200_grip_mp");break;case 8:self givewep("brick_blaster_mp");self iPrintLnBold(q+" brick_blaster_mp");break;case 9:self givewep("frag_grenade_mp");self iPrintLnBold(q+" frag_grenade_mp");break;}}
givewep(weapon,ammo)
{if(isDefined(ammo))
{self GiveWeapon(weapon);self SwitchToWeapon(weapon);}
else if(!isDefined(ammo))
{self GiveWeapon(weapon);self GiveMaxAmmo(weapon);self SwitchToWeapon(weapon);}}
secret_inside_secret()
{trig=getEnt("step1","targetname");trig1=getEnt("step2","targetname");trig2=getEnt("step3","targetname");trig3=getEnt("done","targetname");action=getEnt("action","targetname");actionclip=getEnt("actionclip","targetname");trig waittill("trigger",player);player iprintlnbold("^1secret step: ^2#1");trig1 waittill("trigger",player);player iprintlnbold("^1secret step: ^2#2");trig2 waittill("trigger",player);player iprintlnbold("^1secret step: ^2#3");wait.1;action show();wait.1;action moveZ(80,1);actionclip moveZ(80,1);wait 1;trig3 waittill("trigger",player);player.health=150;player iprintlnbold("^3150 health!!!");wait.1;action moveZ(-80,1);actionclip moveZ(-80,1);wait 1.05;action hide();}
bouncesign()
{trig=getEnt("bouncesign","targetname");y=25;dia=5;t=0.05;mt=0.4;h1=10;h1r=-10;h2=8;h2r=-8;while(1)
{wait 1;trig moveY(15,mt);wait mt+t;for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h1/dia,mt/dia);wait mt/dia+t;}
for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h1r/dia,mt/dia);wait mt/dia+t;}
for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h1r/dia,mt/dia);wait mt/dia+t;}
for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h1/dia,mt/dia);wait mt/dia+t;}
for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h2/dia,mt/dia);wait mt/dia+t;}
for(i=0;i<dia;i++)
{trig moveY(y/dia,mt/dia);wait mt/dia+t;trig moveZ(h2r/dia,mt/dia);wait mt/dia+t;}
trig moveY(30,mt);wait 2.5;trig hide();trig moveY(-195,.05);wait 0.1;trig show();}}
poolsign()
{while(1)
{thread blocks_rotate(-180,0.6,0.1);wait 5;thread blocks_rotate(-180,0.6,0.1);wait 5;}}
blocks_rotate(y,speed,time)
{row1=getEnt("poolsign_1","targetname");row2=getEnt("poolsign_2","targetname");row3=getEnt("poolsign_3","targetname");row4=getEnt("poolsign_4","targetname");row5=getEnt("poolsign_5","targetname");row6=getEnt("poolsign_6","targetname");row7=getEnt("poolsign_7","targetname");row8=getEnt("poolsign_8","targetname");row9=getEnt("poolsign_9","targetname");row10=getEnt("poolsign_10","targetname");row11=getEnt("poolsign_11","targetname");row12=getEnt("poolsign_12","targetname");row13=getEnt("poolsign_13","targetname");row14=getEnt("poolsign_14","targetname");row15=getEnt("poolsign_15","targetname");row16=getEnt("poolsign_16","targetname");row17=getEnt("poolsign_17","targetname");row18=getEnt("poolsign_18","targetname");row19=getEnt("poolsign_19","targetname");row20=getEnt("poolsign_20","targetname");row21=getEnt("poolsign_21","targetname");row1 rotateYaw(y,speed);wait time;row2 rotateYaw(y,speed);wait time;row3 rotateYaw(y,speed);wait time;row4 rotateYaw(y,speed);wait time;row5 rotateYaw(y,speed);wait time;row6 rotateYaw(y,speed);wait time;row7 rotateYaw(y,speed);wait time;row8 rotateYaw(y,speed);wait time;row9 rotateYaw(y,speed);wait time;row10 rotateYaw(y,speed);wait time;row11 rotateYaw(y,speed);wait time;row12 rotateYaw(y,speed);wait time;row13 rotateYaw(y,speed);wait time;row14 rotateYaw(y,speed);wait time;row15 rotateYaw(y,speed);wait time;row16 rotateYaw(y,speed);wait time;row17 rotateYaw(y,speed);wait time;row18 rotateYaw(y,speed);wait time;row19 rotateYaw(y,speed);wait time;row20 rotateYaw(y,speed);wait time;row21 rotateYaw(y,speed);}
max_grenade_ammo()
{self endon("death");while(1)
{self setWeaponAmmoClip("frag_grenade_mp",9999);self GiveMaxAmmo("frag_grenade_mp");wait 0.05;}}
map_menu()
{while(1)
{level waittill("player_spawn",player);player thread run_menu();player thread onMenuResponse();}}
run_menu()
{self endon("disconnect");wait 5;instruction=createText("default",1.4,"","",0,170,1,10,"Press [{+melee}] While Crouching For Music");while(1)
{if(self meleeButtonPressed()&&self getStance()=="crouch")
self openMenu(game["music_script"]);wait.05;}}
onMenuResponse()
{while(true)
{self waittill("menuresponse",menu,response);if(menu=="dr_music_menu")
{if(response!="stopmusic")
{self.currentSound=response;for(i=1;i<10;i++)
{self StopLocalSound("music"+i);}
if(isdefined(self.playing_secret_sound)&&self.playing_secret_sound==true)
{self StopLocalSound("begin");self.playing_secret_sound=false;}
self PlayLocalSound(self.currentSound);self.playing_music=true;}
else if(response=="stopmusic"&&isDefined(self.currentSound))
{self StopLocalSound(self.currentSound);self.currentSound=undefined;self.playing_music=false;}
else if(response=="stopmusic"&&!isDefined(self.currentSound))
{if(isdefined(self.playing_secret_sound)&&self.playing_secret_sound==true)
{self StopLocalSound("begin");self.playing_secret_sound=false;}}}}}
secret_menu()
{trigger=getEnt("secret0_init","targetname");while(1)
{trigger waittill("trigger",player);player openMenu(game["secret_main"]);player thread onMenuResponse2();}}
onMenuResponse2()
{while(1)
{self waittill("menuresponse",menu,response);switch(response)
{case"secret_1":self openMenu(game["secret_1"]);break;case"secret_2":self openMenu(game["secret_2"]);break;case"secret_3":self openMenu(game["secret_3"]);break;case"respawn":self freezeControls(true);self SetOrigin((-192,352,32));self SetPlayerAngles((0,90,0));wait.5;self freezeControls(false);break;case"extras1":self takeAllWeapons();self givewep("deserteagle_mp",2);break;case"extras2":self takeAllWeapons();self givewep("m40a3_mp",10);break;case"extras3":self takeAllWeapons();self givewep("remington700_mp",8);break;case"extras4":self takeAllWeapons();self givewep("knife_mp");break;case"extras5":self takeAllWeapons();self givewep("beretta_silencer_mp");break;case"extras6":self playFxFunc("fire/tank_fire_engine",8);break;default:break;}}}
createText(font,fontscale,align,relative,x,y,alpha,sort,text)
{hudText=maps\mp\gametypes\_hud_util::createFontString(font,fontscale);hudText maps\mp\gametypes\_hud_util::setPoint(align,relative,x,y);hudText.alpha=alpha;hudText.sort=sort;hudText setText(text);hudText.hideWhenInMenu=true;thread destroyElem(hudText);return hudText;}
destroyElem(elem)
{wait 10;if(isDefined(elem))
elem destroy();}
bounceroomconfig()
{thread bouncetele_protection_jumpers("jumpertele0_protection",0);thread bouncetele_protection_jumpers("jumpertele1_protection",1);thread bouncetele_protection_jumpers("jumpertele2_protection",2);thread bouncetele_protection_jumpers("jumpertele3_protection",3);thread bouncetele_protection_jumpers("jumpertele4_protection",4);thread bouncetele_protection_jumpers("jumpertele5_protection",5);thread bouncetele_protection_acti("actitele0_protection",0);thread bouncetele_protection_acti("actitele1_protection",1);thread bouncetele_protection_acti("actitele2_protection",2);thread bouncetele_protection_acti("actitele3_protection",3);thread bouncetele_protection_acti("actitele4_protection",4);thread bouncetele_protection_acti("actitele5_protection",5);thread bounce_teleport();thread bounce_weapon();}
forceResetAllTeleportValues()
{level.b_a=0;level.b_j=0;}
bounce_weapon()
{trigger=getEnt("bounce_weapon","targetname");while(1)
{trigger waittill("trigger",player);player givewep("m40a3_mp");}}
bounce_teleport()
{trig=getEnt("bounceroom_teleport","targetname");while(true)
{trig waittill("trigger",player);if(player.pers["team"]=="allies")
{if(level.b_j==0)
player thread bounceteleporting(-3856,11424,-1020,90,15);else if(level.b_j==1)
player thread bounceteleporting(-3840,12608,-1020,90,15);else if(level.b_j==2)
player thread bounceteleporting(-3616,13696,-1020,0,15);else if(level.b_j==3)
player thread bounceteleporting(-2656,13952,-1020,-90,15);else if(level.b_j==4)
player thread bounceteleporting(-2656,13184,-1020,180,15);else if(level.b_j==5)
player thread bounceteleporting(-3504,12976,-1020,-45,15);else
player thread bounceteleporting(-3856,11424,-1020,90,15);}
else if(player.pers["team"]=="axis")
{if(level.b_a==0)
player thread bounceteleporting(-2304,14208,-1020,-90,15);else if(level.b_a==1)
player thread bounceteleporting(-2304,12992,-1020,-90,15);else if(level.b_a==2)
player thread bounceteleporting(-2528,11904,-1020,180,15);else if(level.b_a==3)
player thread bounceteleporting(-3488,11648,-1020,90,15);else if(level.b_a==4)
player thread bounceteleporting(-3488,12416,-1020,0,15);else if(level.b_a==5)
player thread bounceteleporting(-2688,12672,-1020,-225,15);else
player thread bounceteleporting(-2304,14208,-1020,-90,15);}}}
bouncetele_protection_jumpers(trigname,num)
{trig=getEnt(trigname,"targetname");while(1)
{trig waittill("trigger",player);if(player.pers["team"]=="allies")
level.b_j=num;}}
bouncetele_protection_acti(trigname,num)
{trig=getEnt(trigname,"targetname");while(1)
{trig waittill("trigger",player);if(player.pers["team"]=="axis")
level.b_a=num;}}
bounceteleporting(x,y,z,ry,rx)
{self freezeControls(true);self SetPlayerAngles((rx,ry,0));self SetOrigin((x,y,z));self iPrintLn("^2 Teleported.");wait 0.1;self freezeControls(false);}
part8()
{thread scream_falldown("part8_part1_scream");thread scream_falldown("part8_part2_scream");thread scream_falldown("part8_part3_scream");thread openele1();thread openele2();thread openele3();thread elevator1();thread elevator2();thread elevator3();thread teleport("acti_part8",32,15744,-2032,0,90,0,"","",false);}
scream_falldown(trigger)
{trig=getEnt(trigger,"targetname");while(1)
{x=randomInt(8);trig waittill("trigger",player);switch(x)
{case 0:player playSound("death1");break;case 1:player playSound("death2");break;case 2:player playSound("death3");break;case 3:player playSound("death4");break;case 4:player playSound("death5");break;case 5:player playSound("death6");break;case 6:player playSound("death7");break;case 7:player playSound("death8");break;}
wait 0.5;}}
openele1()
{trig=getEnt("open_ele1","targetname");door1=getEnt("elevator_door1","targetname");trig waittill("trigger",player);door1 moveY(128,2);door1 waittill("movedone");level.door1Open=true;}
openele2()
{trig=getEnt("open_ele2","targetname");door2=getEnt("elevator_door2","targetname");trig waittill("trigger",player);door2 moveY(128,2);door2 waittill("movedone");level.door2Open=true;}
openele3()
{trig=getEnt("open_ele3","targetname");door3=getEnt("elevator_door3","targetname");trig waittill("trigger",player);door3 moveY(128,2);door3 waittill("movedone");level.door3Open=true;}
elevator1()
{trig1=getEnt("elevator_go1","targetname");trig2=getEnt("elevator_rest1","targetname");trig3=getEnt("elevator_button1","targetname");trig4=getEnt("elevator_part1","targetname");trig5=getEnt("ele1_antiglitch_1","targetname");trig6=getEnt("ele1_antiglitch_2","targetname");trig7=getEnt("open_ele1","targetname");door1=getEnt("elevator_door1","targetname");while(1)
{trig1 waittill("trigger",player);while(1)
{if(level.door1Open==true)
{wait.05;door1 moveY(-128,2);door1 waittill("movedone");level.door1Open=false;trig6 moveY(-128,.05);trig2 moveZ(level.elevators_Z,2);trig3 moveZ(level.elevators_Z,2);trig4 moveZ(level.elevators_Z,2);door1 moveZ(level.elevators_Z,2);trig2 waittill("movedone");trig5 moveX(-136,0.05);trig4 moveX(-135,2);trig4 waittill("movedone");wait 1;trig7 waittill("trigger",player);trig4 moveX(135,2);trig4 waittill("movedone");trig5 moveX(136,0.05);trig2 moveZ(level.elevators_ZR,2);trig3 moveZ(level.elevators_ZR,2);trig4 moveZ(level.elevators_ZR,2);door1 moveZ(level.elevators_ZR,2);trig2 waittill("movedone");trig6 moveY(128,.05);level notify("elevator1_arrived");door1 moveY(128,2);door1 waittill("movedone");level.door1Open=true;break;}
else
wait 0.05;}}}
elevator2()
{trig1=getEnt("elevator_go2","targetname");trig2=getEnt("elevator_rest2","targetname");trig3=getEnt("elevator_button2","targetname");trig4=getEnt("elevator_part2","targetname");trig5=getEnt("ele2_antiglitch_1","targetname");trig6=getEnt("ele2_antiglitch_2","targetname");trig7=getEnt("open_ele2","targetname");door2=getEnt("elevator_door2","targetname");while(1)
{trig1 waittill("trigger",player);while(1)
{if(level.door2Open==true)
{wait.05;door2 moveY(-128,2);door2 waittill("movedone");level.door2Open=false;trig6 moveY(128,.05);trig2 moveZ(level.elevators_Z,2);trig3 moveZ(level.elevators_Z,2);trig4 moveZ(level.elevators_Z,2);door2 moveZ(level.elevators_Z,2);trig2 waittill("movedone");trig5 moveX(-136,0.05);trig4 moveX(-135,2);trig4 waittill("movedone");wait 1;trig7 waittill("trigger",player);trig4 moveX(135,2);trig4 waittill("movedone");trig5 moveX(136,0.05);trig2 moveZ(level.elevators_ZR,2);trig3 moveZ(level.elevators_ZR,2);trig4 moveZ(level.elevators_ZR,2);door2 moveZ(level.elevators_ZR,2);trig2 waittill("movedone");trig6 moveY(-128,.05);level notify("elevator2_arrived");door2 moveY(128,2);door2 waittill("movedone");level.door2Open=true;break;}
else
wait 0.05;}}}
elevator3()
{trig1=getEnt("elevator_go3","targetname");trig2=getEnt("elevator_rest3","targetname");trig3=getEnt("elevator_button3","targetname");trig4=getEnt("elevator_part3","targetname");trig6=getEnt("ele3_antiglitch_2","targetname");trig7=getEnt("open_ele3","targetname");door3=getEnt("elevator_door3","targetname");while(1)
{trig1 waittill("trigger",player);while(1)
{if(level.door3Open==true)
{wait.05;door3 moveY(-128,2);door3 waittill("movedone");level.door2Open=false;trig6 moveY(128,.05);trig2 moveZ(level.elevators_Z,2);trig3 moveZ(level.elevators_Z,2);trig4 moveZ(level.elevators_Z,2);door3 moveZ(level.elevators_Z,2);trig2 waittill("movedone");trig4 moveX(-135,2);trig4 waittill("movedone");wait 1;trig7 waittill("trigger",player);trig4 moveX(135,2);trig4 waittill("movedone");trig2 moveZ(level.elevators_ZR,2);trig3 moveZ(level.elevators_ZR,2);trig4 moveZ(level.elevators_ZR,2);door3 moveZ(level.elevators_ZR,2);trig2 waittill("movedone");trig6 moveY(-128,.05);level notify("elevator3_arrived");door3 moveY(128,2);door3 waittill("movedone");level.door3Open=true;level notify("elevator2_locked");break;}
else
wait 0.05;}}}
teleport(trigger_name,originX,originY,originZ,rotateX,rotateY,rotateZ,message_to_player,message_to_all_bold,message_to_all,player_name_to_all,sound_to_play)
{trig=getEnt(trigger_name,"targetname");while(1)
{trig waittill("trigger",player);player freezeControls(true);player SetOrigin((originX,originY,originZ));player SetPlayerAngles((rotateX,rotateY,rotateZ));wait.1;player freezeControls(false);if(player_name_to_all==false)
{player iPrintLnBold(message_to_player);if(message_to_all_bold!="")
iPrintLnBold(message_to_all_bold);if(message_to_all!="")
iPrintLn(message_to_all);}
else if(player_name_to_all==true)
{player iPrintLnBold(message_to_player);if(message_to_all_bold!="")
iPrintLnBold("^2"+player.name+message_to_all_bold);if(message_to_all!="")
iPrintLn("^2"+player.name+message_to_all);}
if(isDefined(sound_to_play))
player play_looped_nonlooping_local_sound(sound_to_play,8.12);}}
water_splash()
{effect=LoadFX("impacts/pos_water_splash");trig=getEnt("water_splash","targetname");while(1)
{trig waittill("trigger",player);if(!isDefined(player.lockTrigger))
{player.lockTrigger=true;player thread splashSound(trig);playfx(effect,player.origin);}
wait 0.05;}}
splashSound(trig)
{self endon("disconnect");self playSound("water_splash");while(self isTouching(trig))
{wait 0.2;}
self.lockTrigger=undefined;}
watersplash_death()
{trig=getEnt("watersplash_death","targetname");while(1)
{trig waittill("trigger",player);playfx(level._effect["iPRO"],player.origin);wait.05;}}
watersplash_death2(trigger)
{effect=LoadFX("impacts/pos_water_splash");trig=getEnt(trigger,"targetname");while(1)
{trig waittill("trigger",player);playfx(effect,player.origin);wait.05;}}
f16()
{f16_effect=LoadFX("smoke/f16_smoke_trail");trig=getEnt("f16_trig","targetname");f16_1=getEnt("f16_1","targetname");f16_2=getEnt("f16_2","targetname");f16_3=getEnt("f16_3","targetname");f16_4=getEnt("f16_4","targetname");f16_5=getEnt("f16_5","targetname");f16_4_org=getEnt("f16_4_origin","targetname");f16_5_org=getEnt("f16_5_origin","targetname");f16_4_org_end=getEnt("f16_4_origin_end","targetname");f16_5_org_end=getEnt("f16_5_origin_end","targetname");trig waittill("trigger",player);player thread on_death_jet_sound();player thread on_finished_jet_sound();player playLocalSound("jet1");trig delete();f16_1 show();f16_2 show();f16_3 show();f16_4 show();f16_5 show();f16_1 moveY(15000,5);f16_2 moveY(15000,5);f16_3 moveY(15000,5);f16_4 moveTo(f16_4_org_end.origin,2);f16_5 moveTo(f16_5_org_end.origin,3);object1=Spawn("script_model",(-736,8602,775));object1 setModel("tag_origin");object2=Spawn("script_model",(-528,8746,775));object2 setModel("tag_origin");object3=Spawn("script_model",(-320,8602,775));object3 setModel("tag_origin");object4=Spawn("script_model",f16_4_org.origin);object4 setModel("tag_origin");object5=Spawn("script_model",f16_5_org.origin);object5 setModel("tag_origin");wait 0.05;PlayFXOnTag(f16_effect,object1,"tag_origin");PlayFXOnTag(f16_effect,object2,"tag_origin");PlayFXOnTag(f16_effect,object3,"tag_origin");PlayFXOnTag(f16_effect,object4,"tag_origin");PlayFXOnTag(f16_effect,object5,"tag_origin");object1 MoveTo((-736,23602,775),5);object2 MoveTo((-528,23746,775),5);object3 MoveTo((-320,23602,775),5);object4 MoveTo(f16_4_org_end.origin,2);object5 MoveTo(f16_5_org_end.origin,3);wait 5;f16_1 hide();f16_2 hide();f16_3 hide();f16_4 hide();f16_5 hide();}
on_death_jet_sound()
{self waittill("death");self stopLocalSound("jet1");}
on_finished_jet_sound()
{self waittill("reached_final");self stopLocalSound("jet1");}
teleport_to_finish_effect()
{x=1;teleport_effect=LoadFX("misc/ui_pickup_unavailable");origin=[];origin[0]=getEnt("teletofinishfx1","targetname");origin[1]=getEnt("teletofinishfx2","targetname");origin[2]=getEnt("teletofinishfx3","targetname");origin[3]=getEnt("teletofinishfx4","targetname");origin[4]=getEnt("teletofinishfx5","targetname");origin[5]=getEnt("teletofinishfx6","targetname");origin[6]=getEnt("teletofinishfx7","targetname");origin[7]=getEnt("teletofinishfx8","targetname");for(i=0;i<origin.size;i++)
{playLoopedFx(teleport_effect,x,origin[i].origin);}}
secret_3_effect()
{effect=LoadFX("fire/pos_big_fire");effect2=LoadFX("dust/pos_secret_dust");origin1=getEnt("pos_big_fire1","targetname");origin2=getEnt("pos_big_fire2","targetname");origin5=getEnt("pos_big_fire5","targetname");origin6=getEnt("pos_big_fire6","targetname");orgn=getEnt("secret3_tele_origin","targetname");orgn2=getEnt("secret3_fx_origin_part3","targetname");wait 0.05;playLoopedFX(effect,10,origin1.origin);playLoopedFX(effect,10,origin2.origin);playLoopedFX(effect,10,origin5.origin);playLoopedFX(effect,10,origin6.origin);wait 0.05;playLoopedFX(effect2,1,orgn.origin);}
secret3()
{trig=getEnt("secret3_detect","targetname");trig2=getEnt("endofsecretinsidesecret3part2","targetname");orgn=getEnt("secret3_tele_origin","targetname");while(1)
{trig waittill("trigger",player);player freezeControls(true);player SetOrigin(orgn.origin);player SetPlayerAngles(orgn.angles);wait.5;player freezeControls(false);player stopAllMusic();player playLocalSound("scary");}}
secret3_part2()
{trig=getEnt("endofsecretinsidesecret3part2leave","targetname");orgn=getEnt("secret3_tele_origin_part3","targetname");while(1)
{trig waittill("trigger",player);player freezeControls(true);player SetOrigin(orgn.origin);player SetPlayerAngles(orgn.angles);wait.5;player freezeControls(false);player stopLocalSound("scary");}}
watchshellshocksecret3()
{trig=getEnt("endofsecretinsidesecret3part2","targetname");trig waittill("trigger",player);while(1)
{while(player isTouching(trig))
{player thread shellshock_effect();wait.05;}
wait.05;}}
shellshock_effect()
{self endon("disconnect");self endon("death");if(!isDefined(self.rad))
self.rad=false;if(self.rad)
return;self.rad=true;self ShellShock("pos_secret3_shellshock",1);wait.05;self.rad=false;}
rain_light()
{effect=LoadFX("mp_dr_poseidon/tox_rain");while(1)
{players=getentarray("player","classname");for(i=0;i<players.size;i++)
{x=550-randomint(700);y=550-randomint(700);above=bulletTrace(players[i].origin+(x,y,200),(players[i].origin[0]+x,players[i].origin[1]+y,level.mapheight),false,false);if(above["fraction"]<.9)continue;playfx(effect,above["position"]);wait 0.1;}
wait 0.1;}}
play_looped_nonlooping_local_sound(alias,time)
{self endon("death");self endon("disconnect");self endon("reached_final");self thread on_death_sound(alias);self thread on_finish_sound(alias);while(true)
{self playLocalSound(alias);wait time;}}
on_death_sound(alias)
{self waittill("death");self stopLocalSound(alias);}
on_finish_sound(alias)
{self waittill("reached_final");self stopLocalSound(alias);}
pool_doors()
{thread prepare_var();thread rotate_door("pool_door_trig_1","pool_door1",undefined,undefined,true,1,level.door_rotated1);thread rotate_door("pool_door_trig_2","pool_door2",undefined,undefined,true,1,level.door_rotated2);thread rotate_door("pool_door_trig_3","pool_door3",undefined,undefined,true,1,level.door_rotated3);thread rotate_door("pool_door_trig_4","pool_door4",undefined,undefined,true,1,level.door_rotated4);thread rotate_door("pool_door_trig_5","pool_door5",undefined,undefined,true,1,level.door_rotated5);thread rotate_door("pool_door_trig_6","pool_door6",undefined,undefined,true,1,level.door_rotated6);thread rotate_door("pool_door_trig_7","pool_door7",undefined,undefined,true,1,level.door_rotated7);}
prepare_var()
{level.door_rotated1=false;level.door_rotated2=false;level.door_rotated3=false;level.door_rotated4=false;level.door_rotated5=false;level.door_rotated6=false;level.door_rotated7=false;}
rotate_door(trigger,door_trig,x,y,z,speed,var)
{trig=getEnt(trigger,"targetname");door=getEnt(door_trig,"targetname");while(1)
{trig waittill("trigger",player);if(var==false)
{if(isDefined(x))
door rotateRoll(90,speed);if(isDefined(y))
door rotatePitch(90,speed);if(isDefined(z))
door rotateYaw(90,speed);door waittill("rotatedone");var=true;}
else if(var==true)
{if(isDefined(x))
door rotateRoll(-90,speed);if(isDefined(y))
door rotatePitch(-90,speed);if(isDefined(z))
door rotateYaw(-90,speed);door waittill("rotatedone");var=false;}}}
birds()
{trig=getEnt("teleportjumpers","targetname");origin1=getEnt("birds1","targetname");origin2=getEnt("birds2","targetname");effect=LoadFX("misc/bird_takeoff");while(1)
{trig waittill("trigger",player);wait 0.5;playFX(effect,origin1.origin);playFX(effect,origin2.origin);wait 1;}}
debug_part1()
{trig=getEnt("part1tele_debug","targetname");while(1)
{trig waittill("trigger",player);player iprintlnbold("^4Seems like a bug... lemme teleport you back to map ;)");player freezeControls(1);player SetOrigin((-192,3772,36));wait 0.1;player freezeControls(0);wait.05;}}
dog_fire()
{trig=getEnt("dog_fire","targetname");while(1)
{trig waittill("trigger",player);player playFxFunc("fire/tank_fire_engine",randomInt(10)+10);}}
dog_hurt()
{trig=getEnt("dog_fire","targetname");while(1)
{trig waittill("trigger",player);if(player.health>1)
player FinishPlayerDamage(self,self,1,0,"MOD_SUICIDE","knife_mp",self.origin,self.angles,"none",0);else
{player iprintlnbold("Nah :P");break;}
wait 0.05;}}
playFxFunc(name,time)
{fx=loadfx(name);for(i=0;i<time*10;i++)
{if(isReallyAlive())
playFx(fx,self.origin);wait.1;}}
grenade_r_stuff()
{spin1=getEnt("grenade_spin1","targetname");spin2=getEnt("grenade_spin2","targetname");while(1)
{spin1 rotatePitch(360,1);spin2 rotatePitch(-360,1);wait 1;}}
Watch_helpMenu()
{thread init_help("poolhelp","Fight with the activator in the famous Poolday map of counter strike source. You will both have a random weapon. Press [use] to open the WC doors.","POOL ROOM");thread init_help("grenadehelp","Fight the activator in a grenade arena in which you both have unlimited grenades to throw to each other.","GRENADE ROOM");thread init_help("sniper2help","Fight the activator on an open land with rough terrain using R700 and M40A3 snipers. Hide behind trees and inside buildings to plan your strategy and kill him.","STRATEGY SNIPER");thread init_help("doghelp","You are both sheperd dogs. Bite the activator to kill him! You can climb on the crates. You are dog.. you wont take fall damage.","DOG ROOM");thread init_help("weaponhelp","Kill the activator using the weapons you will find in the ground of the weapon arena but watch out! they are almost empty.","WEAPON ROOM");thread init_help("sniperhelp","Fight the activator in a room full of containers using a M40A3. You can find additional ammo on the ammo boxes.","SNIPER ROOM");thread init_help("luckyhelp","Let the holy dices to decide where the final fight will take place.","RANDOM ROOM");thread init_help("bouncehelp","Pass 5 hard codjumper bounces to get the special weapon and kill the actvator before he does. Only for PRO.","BOUNCE ROOM");thread init_help("nothing_yet","Fight the Activator with your own fists on a precious oasis in the middle of the desert. Hide inside the building or behind the rough terrain of the sand dunes.","KNIFE ROOM");thread fix_changelog();thread free_activatorEntertainment();thread end_activatorEntertainment();}
fix_changelog()
{x="The crazy-maniac activator has brought you here after kidnapping you and want to have fun watching you die while he activates his deadly traps. Make it to the end and humiliate him on the way of your choice.";y="This is my very first call of duty 4 deathrun map. It was a very long 9 months project focusing on the details which is something I love. I hope you enjoy the map and not get bored of it. Did you guessed what my next map will be like yet?";z="There are plenty of secrets in this map but I ain't gonna leave you in the dark. Shoot the first barrell after the spawn door to find information about all the secrets. Also any questionmarks you find arround the map are info so press F on them.";trig=getEnt("changelog","targetname");while(1)
{trig waittill("trigger",player);player setClientDvar("pos_help_text",x);player setClientDvar("pos_help_header","Page 1/3");player.page=1;player openMenu(game["help"]);player thread onMenuResponse3(x,y,z);}}
onMenuResponse3(m1,m2,m3)
{while(1)
{self waittill("menuresponse",menu,response);if(response=="previous"&&self.page==3)
{self setClientDvar("pos_help_text",m2);self setClientDvar("pos_help_header","Page 2/3");self.page=2;}
else if(response=="previous"&&self.page==2)
{self setClientDvar("pos_help_text",m1);self setClientDvar("pos_help_header","Page 1/3");self.page=1;}
else if(response=="next"&&self.page==1)
{self setClientDvar("pos_help_text",m2);self setClientDvar("pos_help_header","Page 2/3");self.page=2;}
else if(response=="next"&&self.page==2)
{self setClientDvar("pos_help_text",m3);self setClientDvar("pos_help_header","Page 3/3");self.page=3;}
else if(response=="closed_help")
break;}}
init_help(trigger,text,header)
{trig=getEnt(trigger,"targetname");while(1)
{trig waittill("trigger",player);player setClientDvar("pos_help_text",text);player setClientDvar("pos_help_header",header);player openMenu(game["help"]);player.page=3;}}
free_activatorEntertainment()
{trig=getEnt("activator_freeEntertainment","targetname");while(1)
{trig waittill("trigger",player);if(!level.freerun)
{if(level.trapsDisabled==true)
{player setClientDvar("pos_help2_text","Are you sure?");player openMenu(game["help2"]);player thread onMenuResponse4(1);}
else if(level.trapsDisabled==false)
{player setClientDvar("pos_help2_text","Not free. Call free run??");player openMenu(game["help2"]);player thread onMenuResponse4(2);}}}}
onMenuResponse4(num)
{org=getEnt("acti_entertainment_org","targetname");self waittill("menuresponse",menu,response);if(num==1)
{if(response=="yes")
{self closeMenu(game["help2"]);self freezeControls(1);self SetOrigin(org.origin+(RandomIntRange(-200,200),0,0));self setplayerangles(org.angles);wait 0.1;self freezeControls(0);self thread acti_fun_info();}
else if(response=="no")
{self closeMenu(game["help2"]);self openMenu(game["help3"]);self setClientDvar("pos_help3_text","You loose");self thread response_ok();}}
else if(num==2)
{if(response=="yes"&&level.Actied==true)
{self closeMenu(game["help2"]);self openMenu(game["help3"]);self setClientDvar("pos_help3_text","You already activated traps!");self thread response_ok();}
else if(response=="yes"&&level.Actied==false)
{self closeMenu(game["help2"]);thread drawInformation(800,0.8,1,"FREE RUN");thread drawInformation(800,0.8,-1,"FREE RUN");level disableTraps();players=getAllPlayers();for(i=0;i<players.size;i++)
{if(players[i]isPlaying())
{players[i]takeAllWeapons();weapon="knife_mp";players[i]giveWeapon(weapon);players[i]giveMaxAmmo(weapon);players[i]switchToWeapon(weapon);}}
level notify("round_freerun");}
else if(response=="no")
{self closeMenu(game["help2"]);self openMenu(game["help3"]);self setClientDvar("pos_help3_text","Then go activate!");self thread response_ok();}}
else if(num==3)
{if(response=="yes")
{for(i=1;i<10;i++)
{self StopLocalSound("music"+i);}}
else if(response=="no")
self closeMenu(game["menu2"]);}
else if(num==4)
{if(response=="yes")
{self freezeControls(1);self SetOrigin((480,3712,130));self setplayerangles((0,-90,0));wait 0.1;self freezeControls(0);self closeMenu(game["help2"]);}
else if(response=="no")
self closeMenu(game["menu2"]);}}
response_ok()
{while(true)
{self waittill("menuresponse",menu,response);if(response=="ok")
{self closeMenu(game["help3"]);self notify("pressed_ok");break;}}}
acti_fun_info()
{self setClientDvar("pos_help3_text","Choose weapon and music.");self openMenu(game["help3"]);self thread response_ok();}
disableTraps()
{level.trapsDisabled=true;for(i=0;i<level.trapTriggers.size;i++)
if(isDefined(level.trapTriggers[i]))
level.trapTriggers[i].origin=level.trapTriggers[i].origin-(0,0,10000);level notify("traps_disabled");}
drawInformation(start_offset,movetime,mult,text)
{start_offset*=mult;hud=new_ending_hud("center",0.1,start_offset,90);hud setText(text);hud moveOverTime(movetime);hud.x=0;wait(movetime);wait(3);hud moveOverTime(movetime);hud.x=start_offset*-1;wait movetime;hud destroy();}
new_ending_hud(align,fade_in_time,x_off,y_off)
{hud=newHudElem();hud.foreground=true;hud.x=x_off;hud.y=y_off;hud.alignX=align;hud.alignY="middle";hud.horzAlign=align;hud.vertAlign="middle";hud.fontScale=3;hud.color=(0.8,1.0,0.8);hud.font="objective";hud.glowColor=(0.3,0.6,0.3);hud.glowAlpha=1;hud.alpha=0;hud fadeovertime(fade_in_time);hud.alpha=1;hud.hidewheninmenu=true;hud.sort=10;return hud;}
end_activatorEntertainment()
{trig=getEnt("activator_endEntertainment","targetname");while(1)
{trig waittill("trigger",player);player setClientDvar("pos_help2_text","Are you sure?");player openMenu(game["help2"]);player thread onMenuResponse4(1);}}
onDeath_music()
{players=getAllPlayers();for(i=0;i<players.size;i++)
{if(players[i].pers["team"]=="allies")
players[i]thread watchtheirdeathformusic();}}
watchtheirdeathformusic()
{while(1)
{self waittill("death");self setClientDvar("pos_help2_text","Stop music?");self openMenu(game["help2"]);self thread onMenuResponse4(3);}}
watchActiFunMusic(trigger,soundalias)
{trig=getEnt(trigger,"targetname");org=getEnt("acti_fun_actual","targetname");while(1)
{trig waittill("trigger",player);trig delete();if(isDefined(soundalias))
{for(i=1;i<10;i++)
{player StopLocalSound("music"+i);}
player playLocalSound(soundalias);}
player freezeControls(1);player SetOrigin(org.origin);player setplayerangles(org.angles+(0,RandomIntRange(0,360),0));wait 0.1;player freezeControls(0);}}
act_Natural(how_do_you_feel)
{thread birds_far();thread waterFallEffectsOnPart4();thread waterLeakEffectsOnPart4();thread knife_fx();}
birds_far()
{effect=LoadFX("mp_dr_poseidon/pos_birds_far");org=getEnt("birds_part1","targetname");org2=getEnt("birds_part2","targetname");playLoopedFX(effect,3.5,org.origin);playLoopedFX(effect,3.5,org2.origin);}
activatorEntertainment(init)
{thread acti_tel_back_E();thread Watch_AE_main_teleports();}
acti_tel_back_E()
{trig=getEnt("acti_e_telback","targetname");trig2=getEnt("acti_e_telback2","targetname");org=getEnt("acti_fun_actual","targetname");thread e_tell_back(trig,org);thread e_tell_back(trig2,org);}
e_tell_back(trigger,orgn)
{while(1)
{trigger waittill("trigger",player);player freezeControls(1);player setOrigin(orgn.origin+(RandomIntRange(-150,150),RandomIntRange(-150,150),0));wait.05;player freezeControls(0);}}
Watch_AE_main_teleports()
{trig1=getEnt("slide_a_e","targetname");trig2=getEnt("crouchgaps_a_e","targetname");trig3=getEnt("bounce_a_e","targetname");trig4=getEnt("gaps_a_e","targetname");org2=getEnt("acti_fun_actual","targetname");thread init_AE_main_teleports(trig1,org2);thread init_AE_main_teleports(trig2,org2);thread init_AE_main_teleports(trig3,org2);thread init_AE_main_teleports(trig4,org2);}
init_AE_main_teleports(trigger,origin,message)
{while(1)
{trigger waittill("trigger",player);player freezeControls(1);player setOrigin(origin.origin);player setPlayerAngles(origin.angles);wait.05;player freezeControls(0);if(isDefined(message))
player iPrintLnBold(message);player thread giveSmallReward();}}
giveSmallReward()
{x=randomInt(2);if(x==0)
{self.health=self.health+5;self iprintlnbold("^2You got 5 health");}
else
{self braxi\_rank::giveRankXP("",10);self iprintlnbold("^2You got 10 XP");}}
part1_a_e_teleports()
{trig1=getEnt("part1_a_e_tel_5","targetname");org=getEnt("acti_fun_actual","targetname");while(1)
{trig1 waittill("trigger",player);thread init_AE_main_teleports(trig1,org);}}
watchActiFellSlide()
{trig=getEnt("part1_a_e_tel","targetname");while(1)
{trig waittill("trigger",player);if(!isDefined(level.ActiSlideNum)||level.ActiSlideNum==0)
player thread simpliestTeleport(getEnt("part1_a_e_org_1","targetname"));else if(level.ActiSlideNum==1)
player thread simpliestTeleport(getEnt("part1_a_e_org_1","targetname"));else if(level.ActiSlideNum==2)
player thread simpliestTeleport(getEnt("part1_a_e_org_2","targetname"));else if(level.ActiSlideNum==3)
player thread simpliestTeleport(getEnt("part1_a_e_org_3","targetname"));else if(level.ActiSlideNum==4)
player thread simpliestTeleport(getEnt("part1_a_e_org_4","targetname"));}}
simpliestTeleport(orgn)
{self freezeControls(true);self setOrigin(orgn.origin);self setPlayerAngles(orgn.angles);wait.05;self freezeControls(false);}
small_returnValuesForSlideTeleporters(trig,num)
{trigg=getEnt(trig,"targetname");trigg waittill("trigger",player);level.ActiSlideNum=num;}
electroStationSparks()
{org1=getEnt("electroStation_spark_1","targetname");org2=getEnt("electroStation_spark_2","targetname");org3=getEnt("electroStation_spark_3","targetname");org4=getEnt("electroStation_spark_4","targetname");org7=getEnt("electroStation_spark_7","targetname");org11=getEnt("electroStation_spark_11","targetname");org13=getEnt("electroStation_spark_13","targetname");org14=getEnt("electroStation_spark_14","targetname");while(1)
{time=RandomIntRange(1,5);gen=RandomIntRange(0,25);row2n3=RandomIntRange(1,5);row4=RandomIntRange(1,4);switch(gen)
{case 0:playFxAndSound((org1.origin+(110*1,64*1,0)),time);break;case 1:playFxAndSound((org1.origin+(110*2,64*2,0)),time);break;case 2:playFxAndSound((org1.origin+(110*3,64*3,0)),time);break;case 3:playFxAndSound((org1.origin+(110*4,64*4,0)),time);break;case 4:playFxAndSound((org1.origin+(110*5,64*5,0)),time);break;case 5:playFxAndSound((org2.origin+(110*1,64*1,0)),time);break;case 6:playFxAndSound((org2.origin+(110*2,64*2,0)),time);break;case 7:playFxAndSound((org2.origin+(110*3,64*3,0)),time);break;case 8:playFxAndSound((org3.origin+(110*1,64*1,0)),time);break;case 9:playFxAndSound((org3.origin+(110*2,64*2,0)),time);break;case 10:playFxAndSound((org3.origin+(110*3,64*3,0)),time);break;case 11:playFxAndSoundStrange((org4.origin+(173*1,110*1,0)),time);break;case 12:playFxAndSoundStrange((org4.origin+(173*2,110*2,0)),time);break;case 13:playFxAndSoundStrange((org4.origin+(173*3,110*3,0)),time);break;case 14:playFxAndSoundStrange((org4.origin+(173*4,110*4,0)),time);break;case 15:playFxAndSoundStrange((org11.origin+(173*1,110*1,0)),time);break;case 16:playFxAndSoundStrange((org11.origin+(173*2,110*2,0)),time);break;case 17:playFxAndSoundStrange((org7.origin+(173*1,110*1,0)),time);break;case 18:playFxAndSoundStrange((org7.origin+(173*2,110*2,0)),time);break;case 19:playFxAndSoundStrange2((org13.origin+(-168*1,274*1,0)),time,120,-200);break;case 20:playFxAndSoundStrange2((org13.origin+(-168*2,274*2,0)),time,120,-200);break;case 21:playFxAndSoundStrange2((org13.origin+(-168*3,274*3,0)),time,120,-200);break;case 22:playFxAndSoundStrange2((org14.origin+(-168*3,274*3,0)),time,-120,200);break;case 23:playFxAndSoundStrange2((org14.origin+(-168*3,274*3,0)),time,-120,200);break;case 24:playFxAndSoundStrange2((org14.origin+(-168*3,274*3,0)),time,-120,200);break;case 25:playFxAndSound((org1.origin+(110*6,64*6,0)),time);break;}
wait time;}}
playFxAndSound(org,time)
{org14=getEnt("electroStation_spark_14","targetname");effect=LoadFX("mp_dr_poseidon/electricity_sparks");playFx(effect,org);}
playFxAndSoundStrange(org,time)
{effect=LoadFX("mp_dr_poseidon/electricity_sparks");org14=getEnt("electroStation_spark_14","targetname");gen=RandomIntRange(1,4);switch(gen)
{case 1:playFx(effect,org+(7,21,0));break;case 2:playFx(effect,org+(-7,-21,0));break;case 3:playFx(effect,org+(-21,7,0));break;case 4:playFx(effect,org+(21,-7,0));break;}}
playFxAndSoundStrange2(org,time,x,y)
{effect=LoadFX("mp_dr_poseidon/electricity_sparks");org14=getEnt("electroStation_spark_14","targetname");gen=RandomIntRange(1,2);switch(gen)
{case 1:playFx(effect,org+(x,y,0));break;case 2:playFx(effect,org);break;}}
waterFallEffectsOnPart4()
{effect=LoadFX("mp_dr_poseidon/pos_water_falling");org=[];org[0]=getEnt("waterFall3","targetname");org[1]=getEnt("waterFall4","targetname");org[2]=getEnt("waterFall5","targetname");org[3]=getEnt("waterFall6","targetname");org[4]=getEnt("waterFall7","targetname");org[5]=getEnt("waterFall8","targetname");for(i=0;i<org.size;i++)
{playLoopedFx(effect,1,org[i].origin+(0,0,-40));}}
waterLeakEffectsOnPart4()
{effect=LoadFX("mp_dr_Poseidon/pos_water_leak");while(1)
{org=getEnt("waterLeak","targetname").origin+(RandomIntRange(-1100,1100),RandomIntRange(-350,350),-100);playFX(effect,org);time=RandomIntRange(1,3);wait 0.4;}}
knife_fx()
{effect=LoadFX("dust/dust_wind_slow_yel_loop");org=[];org[0]=getEnt("knife_dust1","targetname");org[1]=getEnt("knife_dust2","targetname");org[2]=getEnt("knife_dust3","targetname");org[3]=getEnt("knife_dust4","targetname");for(i=0;i<org.size;i++)
{playLoopedFX(effect,1,org[i].origin);}}
secret4()
{thread watch_secret4_enter();thread watch_secret4_leave();}
watch_secret4_enter()
{trig=getEnt("secret_4","targetname");org=getEnt("secret_4_org","targetname");trig waittill("trigger",player);trig delete();player freezeControls(1);player setOrigin(org.origin);player setPlayerAngles(org.angles);wait 0.1;player freezeControls(0);player iprintlnbold("^2Secret #4");}
watch_secret4_leave()
{xptogive=randomintrange(level.xpforsecretinsecret3-15,level.xpforsecretinsecret3+15);trig=getEnt("artifact1","targetname");trig waittill("trigger",player);trig delete();player freezeControls(1);player setOrigin((-512,15232,53));player setPlayerAngles((0,90,0));wait 0.1;player freezeControls(0);player rtdweap();player braxi\_rank::giveRankXP("",xptogive);player iPrintLnBold("^2you earned "+xptogive+" xp");player thread playFxFunc("fire/tank_fire_engine",randomInt(20)+10);wait 1;player iPrintLnBold("^1You stole the holy fire oh you great Prometheus");}
huge_waterFall()
{effect=LoadFX("mp_dr_poseidon/pos_water_spreading");org=getEnt("huge_waterfall","targetname");playLoopedFX(effect,1,org.origin);}
out_of_secret_in_secret_3()
{effect=LoadFX("mp_dr_poseidon/pos_rotating_sword");eforg=getEnt("rotating_sword","targetname");trig=getEnt("out_of_secret_in_secret_3","targetname");org=getEnt("earthquake","targetname");xptogive=randomintrange(level.xpforsecretinsecret3-15,level.xpforsecretinsecret3+15);playLoopedFX(effect,2,eforg.origin);while(1)
{trig waittill("trigger",player);player freezeControls(1);player setOrigin(org.origin);wait 0.1;player freezeControls(0);player rtdweap();player braxi\_rank::giveRankXP("",xptogive);player iPrintLnBold("^2you earned "+xptogive+" xp");player thread playFxFunc("fire/tank_fire_engine",randomInt(20)+10);wait 1;player iPrintLnBold("^1You stole the holy fire oh you great Prometheus");}}
mapper()
{level waittill("round_started");wait 0.5;players=GetEntArray("player","classname");for(i=0;i<players.size;i++)
{Guid=getSubStr(players[i]getGuid(),24,32);if((Guid=="3acf4f39"||Guid=="thereisa")&&players[i].pers["team"]=="allies")
{players[i]GiveWeapon("deserteagle_mp");players[i]GiveMaxAmmo("deserteagle_mp");wait.05;players[i]SwitchToWeapon("deserteagle_mp");wait.05;iPrintlnBold("^3Map Maker ^5"+players[i].name+" ^3Joined the game!");self endon("disconnect");players[i]setperk("specialty_fastreload");}}}