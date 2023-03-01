// __/\\\________/\\\_______________________________________________________________________/\\\\\\\\\__/\\\\\\_________________________________        
//  _\/\\\_______\/\\\____________________________________________________________________/\\\////////__\////\\\_________________________________       
//   _\//\\\______/\\\___/\\\__________________/\\\_______/\\\___________________________/\\\/______________\/\\\_________________________________      
//   __\//\\\____/\\\___\///___/\\\\\\\\\\__/\\\\\\\\\\\_\///______/\\\\\\\\____________/\\\________________\/\\\_____/\\\\\\\\\_____/\\/\\\\\\___     
//    ___\//\\\__/\\\_____/\\\_\/\\\//////__\////\\\////___/\\\___/\\\//////____________\/\\\________________\/\\\____\////////\\\___\/\\\////\\\__    
//     ____\//\\\/\\\_____\/\\\_\/\\\\\\\\\\____\/\\\______\/\\\__/\\\___________________\//\\\_______________\/\\\______/\\\\\\\\\\__\/\\\__\//\\\_   
//      _____\//\\\\\______\/\\\_\////////\\\____\/\\\_/\\__\/\\\_\//\\\___________________\///\\\_____________\/\\\_____/\\\/////\\\__\/\\\___\/\\\_  
//       ______\//\\\_______\/\\\__/\\\\\\\\\\____\//\\\\\___\/\\\__\///\\\\\\\\______________\////\\\\\\\\\__/\\\\\\\\\_\//\\\\\\\\/\\_\/\\\___\/\\\_ 
//        _______\///________\///__\//////////______\/////____\///_____\////////__________________\/////////__\/////////___\////////\//__\///____\///__

/*
     _   ________   ___  __        __   
    | | / / ___( ) / _ )/ /__ ____/ /__ 
    | |/ / /__ |/ / _  / / _ `/ _  / -_)
    |___/\___/   /____/_/\_,_/\_,_/\__/ 

    © VC' Blade

    Website: vistic-clan.net
*/

main()
{
    maps\mp\_load::main();
         
    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";

    ambientplay("holyshiet");

    setdvar("r_specularcolorscale","1");
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");

    precacheitem("ak47_mp");
    precacheitem("ak74u_mp");

    level.holyshiet=[];
    level.holyshiet["lava_ember"] = loadfx("vistic/lava_ember");
    level.holyshiet["ww_trail"] = loadfx("vistic/ww_trail");
    level.holyshiet["bluni"] = loadfx("vistic/trail_bluni");
    level.holyshiet["rainbow"] = loadfx("vistic/rainbow_funken");
    level.holyshiet["blue_hover"] = loadfx("vistic/blue_hover");
    level.holyshiet["vistic"] = loadfx("vistic/vc_fire");

    level.blade_found = false;
 
    thread prints();
    thread logo();
    thread holyshiet();

    thread shiet_secret();
    thread shiet_traps();
    thread shiet_rooms();
}

prints()
{
    level waittill("round_started");
    thread shiet_startdoor();
    thread shiet_end_port();

    msg_list = strtok("Welcome to ^5mp_dr_holyshiet_v2;Map by ^5Blade;Discord: ^5Blade #6504;Visit ^5vistic-clan.net",";");
    while(1)
    {
        for(i=0;i<msg_list.size;i++)
        {
            iprintln("^1>>^7 "+msg_list[i]);
            wait 10;
        }
        wait .1;
    }
}

shiet_startdoor()
{
    trig = getent("shiet_door_trig","targetname");
    door = getent("shiet_startdoor","targetname");

    trig sethintstring("^1&&1^7: open ^1Startdoor");
    trig waittill("trigger");
    trig delete();

    iprintlnbold("^1Startdoor ^7will open in ^15 ^7Seconds");
    wait 5;
    door movez(-120,5);
    wait 5;
    door delete();

    hud_clock = NewHudElem();
    hud_clock.alignX = "center";
    hud_clock.alignY = "middle";
    hud_clock.horzalign = "center";
    hud_clock.vertalign = "middle";
    hud_clock.alpha = 1;
    hud_clock.x = 0;
    hud_clock.y = 150;
    hud_clock.font = "objective";
    hud_clock.fontscale = 1.8;
    hud_clock.glowalpha = 1;
    hud_clock.glowcolor = (1,0,1);
    hud_clock.label = &"Map by ^1VC' Blade";
    hud_clock SetPulseFX( 40, 5400, 200 );
}

logo()
{
    vc=getent("vc_logo","targetname");
    while(isdefined(vc))
    {
        vc rotateyaw(720,15);
        wait 15;
    }
}

shiet_end_port()
{
    trig = getent("shiet_end_port","targetname");
    trig sethintstring("^1&&1^7: Get to ^1Room Selection");

    for(;;)
    {
        trig waittill("trigger",who);
        if(who istouching(trig))
        {   
            tp = spawn ("script_model",(0,0,0));
            tp.origin = who.origin;
            tp.angles = who.angles;
            who linkto (tp);

            tp moveto((576,3576,168),1);
            wait 1;
            tp moveto((-640,3392,168),1);
            wait 1;
            tp moveto((-864,3232,-8),1);
            wait 1;
            
            who unlink();
        }
    }
}

holyshiet()
{
    trig = getent("holyshiet","targetname");

    trig sethintstring("^1&&1^7: activate ^1HOLYSHIET ^7?!");
    trig waittill("trigger");
    trig delete();

    player = getentarray("player","classname");
    for(i=0;i<player.size;i++)
    {
        if(player[i].pers["team"] != "spectator")
            player[i] thread holyshiet_trail();
    }
}

holyshiet_trail()
{
    self endon("death");

    while(isalive(self))
    {
        playfx(level.holyshiet["lava_ember"],self.origin+(0,0,10));
        wait .15;
    }
}

shiet_traps()
{
    thread shiet_trap_1();
    thread shiet_trap_2();
    thread shiet_trap_3();
    thread shiet_trap_4();
    thread shiet_trap_5();
    thread shiet_trap_6();
    thread shiet_trap_7();
    thread shiet_trap_8();
    thread shiet_trap_9();
    thread shiet_trap_10();
    thread shiet_trap_11();
    thread shiet_trap_12();

    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addTriggerToList("trig_trap7");
    addTriggerToList("trig_trap8");
    addTriggerToList("trig_trap9");
    addTriggerToList("trig_trap10");
    addTriggerToList("trig_trap11");
    addTriggerToList("trig_trap12");
}

addTriggerToList(name)
{
    if(!isdefined(level.trapTriggers))
      level.trapTriggers=[];

    level.trapTriggers[level.trapTriggers.size]=getent(name,"targetname");
}

shiet_trap_1()
{
    trig = getent("trig_trap1","targetname");
    trapa = getent("shiet_trap_1a","targetname");
    trapb = getent("shiet_trap_1b","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 1");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa rotateroll(360,2);
        trapb rotateroll(-360,2);
        wait 2;
    }
}

shiet_trap_2()
{
    trig = getent("trig_trap2","targetname");
    trap = getent("shiet_trap_2","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 2");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotatepitch(360,10);
        wait 10;
    }
}

shiet_trap_3()
{
    trig = getent("trig_trap3","targetname");
    trapa = getent("shiet_trap_3a","targetname");
    trapb = getent("shiet_trap_3b","targetname");

    trapa rotateroll(-60,1);
    trapb rotateroll(60,1);

    trig sethintstring("^1&&1^7: activate ^1Trap 3");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb))
    {
        trapa rotateroll(120,1);
        trapb rotateroll(-120,1);
        wait 1;
        trapa rotateroll(-120,1);
        trapb rotateroll(120,1);
        wait 1;
    }
}

shiet_trap_4()
{
    trig = getent("trig_trap4","targetname");
    trap = getent("shiet_trap_4","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 4");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360,2);
        wait 5;
    }
}

shiet_trap_5()
{
    trig = getent("trig_trap5","targetname");
    trap = getent("shiet_trap_5","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 5");
    trig waittill("trigger");
    trig delete();

    trap movez(-320,2);
    wait 5;
    trap movez(320,2);
}

shiet_trap_6()
{
    trig = getent("trig_trap6","targetname");
    trapa = getent("shiet_trap_6a","targetname");
    trapb = getent("shiet_trap_6b","targetname");
    trapc = getent("shiet_trap_6c","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 6");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc))
    {
        trapa rotateroll(360,1);
        wait 1.5;
        trapb rotatepitch(360,1);
        wait 1.5;
        trapc rotateyaw(360,1);
        wait 1.5;
    }
}

shiet_trap_7()
{
    trig = getent("trig_trap7","targetname");
    trap = getent("shiet_trap_7","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 7");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap movey(-240,2);
        wait 5;
        trap movey(240,2);
        wait 5;
    }
}

shiet_trap_8()
{
    trig = getent("trig_trap8","targetname");
    trapa = getent("shiet_trap_8a","targetname");
    trapb = getent("shiet_trap_8b","targetname");
    trapc = getent("shiet_trap_8c","targetname");
    trapd = getent("shiet_trap_8d","targetname");
    trape = getent("shiet_trap_8e","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 8");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc) && isdefined(trapd) && isdefined(trape))
    {
        trapa movey(-330,2);
        wait 1;
        trapb movey(-330,2);
        wait 1;
        trapc movey(-330,2);
        wait 1;
        trapd movey(-330,2);
        wait 1;
        trape movey(-330,2);
        wait 3;
        trapa movey(330,2);
        wait 1;
        trapb movey(330,2);
        wait 1;
        trapc movey(330,2);
        wait 1;
        trapd movey(330,2);
        wait 1;
        trape movey(330,2);
        wait 3;
    }
}

shiet_trap_9()
{
    trig = getent("trig_trap9","targetname");
    trapa = getent("shiet_trap_9a","targetname");
    trapb = getent("shiet_trap_9b","targetname");
    trapc = getent("shiet_trap_9c","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 9");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trapa) && isdefined(trapb) && isdefined(trapc))
    {
        trapa rotateyaw(360,2);
        wait 2;
        trapb rotateyaw(360,2);
        wait 2;
        trapc rotateyaw(360,2);
        wait 2;
    }
}

shiet_trap_10()
{
    trig = getent("trig_trap10","targetname");
    level.trap10_time = 6;

    thread trap10_move();

    trig sethintstring("^1&&1^7: activate ^1Trap 10");
    trig waittill("trigger");
    trig delete();

    level.trap10_time = 3;
}

trap10_move()
{
    trap = getent("shiet_trap_10","targetname");

    while(isdefined(trap))
    {
        trap rotateyaw(360,level.trap10_time);
        wait level.trap10_time;
    }
}

shiet_trap_11()
{
    trig = getent("trig_trap11","targetname");
    trap = getent("shiet_trap_11","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 11");
    trig waittill("trigger");
    trig delete();

    while(isdefined(trap))
    {
        trap rotateyaw(360,2);
        wait 5;
    }
}

shiet_trap_12()
{
    trig = getent("trig_trap12","targetname");
    trapa = getent("shiet_trap_12a","targetname");
    trapb = getent("shiet_trap_12b","targetname");

    trig sethintstring("^1&&1^7: activate ^1Trap 12");
    trig waittill("trigger");
    trig delete();

    shiet = randomint(8);
    if(shiet < 4)
    {
        trapa movez(-305,2);
        wait 2;
        trapa delete();
    }
    else 
    {
        trapb movez(-305,2);
        wait 2;
        trapb delete();
    }
}

shiet_secret()
{
    level.holy_steps = 0;

    level.shiet_bounce = getent("shiet_sec_bounce","targetname");
    level.shiet_bounce hide();
    level.shiet_bounce notsolid();

    thread shiet_bluni();
    thread shiet_sam();
    thread shiet_secretway();
    thread shiet_actisec();
    thread shiet_sec_1();
}

shiet_actisec()
{
    triga = getent("acti_sec1","targetname");
    trigb = getent("acti_sec2","targetname");
    trigc = getent("acti_sec3","targetname");
    trigd = getent("acti_sec4","targetname");

    blade = getent("holyshiet_blade","targetname");
    blade hide();
    blade notsolid();

    triga waittill("trigger");
    iprintln("^1>>^7 1");
    trigb waittill("trigger");
    iprintln("^1>>^7 2");
    trigc waittill("trigger");
    iprintln("^1>>^7 3");
    trigd waittill("trigger",who);
    iprintln("^1>>^7 4");

    triga delete();
    trigb delete();
    trigc delete();
    trigd delete();

    fx = spawnfx(level.holyshiet["blue_hover"],(-1024,3072,-176));
    triggerfx(fx);

    wait 4;

    fx delete();
    blade show();
    blade solid();
    playfx(level.holyshiet["vistic"],(-1042,3036,-166));

    if(!level.blade_found)
    {
        level.blade_found = true;

        ambientstop();
        ambientplay("holy_blade");

        iprintlnbold("^5"+who.name+"^7 has discovered the ^5Blade Statue^7!");
    }
}

shiet_secretway()
{
    triga = getent("shiet_secretway1","targetname");
    trigb = getent("shiet_secretway2","targetname");
    trigc = getent("shiet_secretway3","targetname");

    triga waittill("trigger");
    trigb waittill("trigger");
    trigc waittill("trigger");

    triga delete();
    trigb delete();
    trigc delete();

    thread shiet_secretway_in();
    thread shiet_secretway_out();
}

shiet_secretway_in()
{
    clip = getent("shiet_secretway_in","targetname");
    trig = getent("shiet_secway_found","targetname");

    clip notsolid();
    trig waittill("trigger",who);
    trig delete();

    iprintlnbold("^5"+who.name+"^7 found the ^5hidden Path");

    wait 1;
    clip solid();
}

shiet_secretway_out()
{
    clip = getent("shiet_secretway_out","targetname");
    trig = getent("shiet_secway_done","targetname");

    clip notsolid();
    trig waittill("trigger",who);
    trig delete();

    iprintlnbold("^5"+who.name+"^7 finished the ^5hidden Path");
    who braxi\_rank::giverankxp(undefined,100);

    wait 1;
    clip solid();
}

shiet_sec_1()
{
    trig = getent("shiet_sec_1","targetname");

    trig waittill("trigger");
    trig delete();

    wait 1;
    level.holy_steps += 1;

    iprintln("^1>>^7 Secret Steps: ^5"+int(level.holy_steps)+"/3");
    thread shiet_sec_2();
}

shiet_sec_2()
{
    trig = getent("shiet_sec_2","targetname");

    trig waittill("trigger");
    trig delete();

    wait 1;
    level.holy_steps += 1;

    iprintln("^1>>^7 Secret Steps: ^5"+int(level.holy_steps)+"/3");
    thread shiet_sec_3();
}

shiet_sec_3()
{
    trig = getent("shiet_sec_3","targetname");

    trig waittill("trigger");
    trig delete();

    wait 1;
    level.holy_steps += 1;

    iprintln("^1>>^7 Secret Steps: ^5"+int(level.holy_steps)+"/3");
    thread shiet_sec_open();
}

shiet_sec_open()
{
    trig = getent("shiet_sec_warp","targetname");
    targ = getent("shiet_sec_targ","targetname");
    plat = getent("shiet_sec_plat","targetname");

    trig enablelinkto();
    trig linkto(plat);

    plat movex(-128,2);

    wait 4;
    if(int(level.holy_steps) >= 3)
    {
        iprintlnbold("^5Secret ^7is open");
        level.shiet_bounce solid();
        level.shiet_bounce show();

        thread shiet_sec_out();
        thread shiet_sec_advout();
        thread shiet_sec_adv();

        for(;;)
        {
            trig waittill("trigger",who);
            who _processwarp(targ);
        }
    }
}

shiet_sec_adv()
{
    trig = getent("shiet_sec_adv","targetname");
    targ = getent("shiet_sec_advtarg","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        who _processwarp(targ);
    }
}

shiet_sec_out()
{
    trig = getent("shiet_sec_out","targetname");
    targ = getent("shiet_sec_warp1","targetname");

    playloopedfx(level.holyshiet["rainbow"],0.05,(-3712,1520,120));

    for(;;)
    {
        trig waittill("trigger",who);
        who _processwarp(targ);
        who braxi\_rank::giverankxp(undefined,50);
        iprintlnbold("^5"+who.name+"^7 has finished the ^5Secret");
    }
}

shiet_sec_advout()
{
    trig = getent("shiet_sec_advout","targetname");
    targ = getent("shiet_sec_warp2","targetname");

    playloopedfx(level.holyshiet["rainbow"],0.05,(-5328,4432,-184));

    for(;;)
    {
        trig waittill("trigger",who);
        who _processwarp(targ);
        who braxi\_rank::giverankxp(undefined,150);
        iprintlnbold("^5"+who.name+"^7 has finished the ^5advanced Secret");
    }
}

_processwarp(target)
{
    self freezecontrols(1);
    self setorigin(target.origin);
    self setplayerangles(target.angles);
    wait .5;
    self freezecontrols(0);
}

shiet_bluni()
{
    trig = getent("shiet_sec_bluni","targetname");
    trig waittill("trigger",who);
    trig delete();

    iprintlnbold("Blade ^1<3^7 uNI");

    while(isalive(who)&&isdefined(who))
    {
        playfx(level.holyshiet["bluni"],who.origin);
        wait .03;
    }
}

shiet_sam()
{
    trig = getent("shiet_sec_sam","targetname");
    trig waittill("trigger",who);
    trig delete();

    iprintlnbold("^5W^7inter ^5W^7ipeout Trail!");

    while(isalive(who)&&isdefined(who))
    {
        playfx(level.holyshiet["ww_trail"],who.origin);
        wait .05;
    }
}

shiet_rooms()
{
    thread shiet_sniper();
    thread shiet_weapon();
    thread shiet_knife();
    thread shiet_jump();
}

shiet_sniper()
{
    level.sniper = getent("shiet_sniper","targetname");
    jump = getent("room_1_jump","targetname");
    acti = getent("room_1_acti","targetname");

    level.sniper sethintstring("^1&&1^7: select ^1Sniper");

    while(1)
    {
        level.sniper waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.sniper))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            playloopedfx(level.holyshiet["rainbow"],0.05,(-864,3064,-24));
            thread build_sniper();
            thread shiet_snip_fail();

            if(!level.blade_found)
            {
                ambientstop();
                ambientplay("holy_room");
            }

            level.weapon delete();
            level.knife delete();
            level.jump delete();
            level.sniper sethintstring("^1&&1^7: Teleport");
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"m40a3_mp",undefined,"yes",1);
            level.activ room_setup(acti,"remington700_mp",undefined,"yes",1);
            iprintlnbold("^1S^7niper ^1R^7oom");
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"m40a3_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
    }
}

shiet_weapon()
{
    level.weapon = getent("shiet_weapon","targetname");
    jump = getent("room_1_jump","targetname");
    acti = getent("room_1_acti","targetname");

    level.weapon sethintstring("^1&&1^7: select ^1Weapon");

    while(1)
    {
        level.weapon waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.weapon))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            playloopedfx(level.holyshiet["rainbow"],0.05,(-1024,3226,-24));
            thread build_weapon();

            if(!level.blade_found)
            {
                ambientstop();
                ambientplay("holy_room");
            }

            level.sniper delete();
            level.knife delete();
            level.jump delete();
            level.weapon sethintstring("^1&&1^7: Teleport");
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"ak74u_mp",undefined,"yes",1);
            level.activ room_setup(acti,"ak47_mp",undefined,"yes",1);
            iprintlnbold("^1W^7eapon ^1R^7oom");
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"ak74u_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
    }
}

shiet_knife()
{
    level.knife = getent("shiet_knife","targetname");
    jump = getent("room_1_jump2","targetname");
    acti = getent("room_1_acti2","targetname");

    level.knife sethintstring("^1&&1^7: select ^1Knife");

    while(1)
    {
        level.knife waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.knife))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            playloopedfx(level.holyshiet["rainbow"],0.05,(-1024,2904,-24));
            thread build_knife();

            if(!level.blade_found)
            {
                ambientstop();
                ambientplay("holy_room");
            }

            level.sniper delete();
            level.weapon delete();
            level.jump delete();
            level.knife sethintstring("^1&&1^7: Teleport");
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ room_setup(acti,"knife_mp",undefined,"yes",1);
            iprintlnbold("^1K^7nife ^1R^7oom");
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
    }
}

shiet_jump()
{
    level.jump = getent("shiet_jump","targetname");
    jump = getent("room_2_jump","targetname");
    acti = getent("room_2_acti","targetname");

    level.jump sethintstring("^1&&1^7: select ^1Jump");

    while(1)
    {
        level.jump waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.jump))
            return; 

        if(!isdefined(level.room_selected))
        {
            level.room_selected = true;
            playloopedfx(level.holyshiet["rainbow"],0.05,(-1184,3064,-24));
            thread build_jump();
            thread shiet_jump_fail();

            if(!level.blade_found)
            {
                ambientstop();
                ambientplay("holy_room");
            }

            level.sniper delete();
            level.weapon delete();
            level.knife delete();
            level.jump sethintstring("^1&&1^7: Teleport");
        }

        if(isdefined(level.activ))
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ room_setup(acti,"knife_mp",undefined,"yes",1);
            iprintlnbold("^1J^7ump ^1R^7oom");
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("^1"+player.name+" ^7has been killed");
    }
}

room_setup(targ,weap,weap2,health,freeze)
{
    self setorigin(targ.origin);
    self setplayerangles(targ.angles);

    self takeallweapons();
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);

    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }

    self freezecontrols(freeze);

    if( health == "yes")
    {
        if(self.health < self.maxhealth)
            self.health=self.maxhealth;
    }
}

build_sniper()
{
    room1_blocker1 = getent("room1_blocker1","targetname");
    room1_blocker2 = getent("room1_blocker2","targetname");
    room1_blocker3 = getent("room1_blocker3","targetname");

    room1_weapon1 = getent("room1_weapon1","targetname");
    room1_weapon2 = getent("room1_weapon2","targetname");

    room1_weapon1 movez(-240,1);
    room1_weapon2 delete();
    wait 1;
    room1_weapon1 delete();

    room1_blocker1 movez(64,1);
    wait 1.5;
    room1_blocker2 movez(192,1);
    wait 1.5;
    room1_blocker3 movez(144,1);
}

build_weapon()
{
    room1_blocker1 = getent("room1_blocker1","targetname");
    room1_blocker2 = getent("room1_blocker2","targetname");
    room1_blocker3 = getent("room1_blocker3","targetname");

    room1_weapon2 = getent("room1_weapon2","targetname");

    room1_weapon2 movez(192,1);
    wait 1.5;
    room1_blocker1 movez(64,1);
    wait 1.5;
    room1_blocker2 movez(192,1);
    wait 1.5;
    room1_blocker3 movez(144,1);
}

build_knife()
{
    room1_blocker1 = getent("room1_blocker1","targetname");
    room1_blocker2 = getent("room1_blocker2","targetname");
    room1_blocker3 = getent("room1_blocker3","targetname");

    room1_knife1 = getent("room1_knife1","targetname");
    room1_weapon2 = getent("room1_weapon2","targetname");

    room1_blocker1 delete();
    room1_blocker2 delete();
    room1_blocker3 delete();

    room1_knife1 movez(-240,1);
    wait 1.5;
    room1_knife1 delete();
    room1_weapon2 movez(192,1);
}

build_jump()
{
    room2_blocker1 = getent("room2_blocker1","targetname"); // z 400
    room2_blocker2 = getent("room2_blocker2","targetname"); // z 512
    room2_blocker3 = getent("room2_blocker3","targetname"); // z 448
    room2_blocker4 = getent("room2_blocker4","targetname"); // z 400
    room2_blocker5 = getent("room2_blocker5","targetname"); // z 400
    room2_blocker6 = getent("room2_blocker6","targetname"); // z 320
    room2_blocker7 = getent("room2_blocker7","targetname"); // z 256

    trig = getent("shiet_jump_weap","targetname");
    fx = getent("shiet_weap_fx","targetname");

    playfx(level.holyshiet["blue_hover"],fx.origin);
    thread shiet_weap_move();

    room2_blocker1 movez(400,1);
    wait .5;
    room2_blocker2 movez(512,1);
    wait .5;
    room2_blocker3 movez(448,1);
    wait .5;
    room2_blocker4 movez(400,1);
    wait .5;
    room2_blocker5 movez(400,1);
    wait .5;
    room2_blocker6 movez(320,1);
    wait .5;
    room2_blocker7 movez(256,1);
    wait 1;

    for(;;)
    {
        trig sethintstring("^1&&1^7: pickup ^1R700");
        trig waittill("trigger",who);

        if(who hasweapon("remington700_mp"))
            who givemaxammo("remington700_mp");
        else
        {
            who giveweapon("remington700_mp");
            who givemaxammo("remington700_mp");
            who switchtoweapon("remington700_mp");
        }

        trig sethintstring("Charging");
        wait 3;
    }    
}

shiet_weap_move()
{
    model = getent("shiet_weap","targetname");
    while(isdefined(model))
    {
        model rotateyaw(360,5);
        wait 5;
    }
}

shiet_jump_fail()
{
    trig = getent("shiet_jump_fail","targetname");
    jump = getent("room_2_jump","targetname");
    acti = getent("room_2_acti","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                who setorigin(jump.origin);
                who setplayerangles(jump.angles);
            }
            else
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}

shiet_snip_fail()
{
    trig = getent("shiet_sniper_fail","targetname");
    jump = getent("room_1_jump","targetname");
    acti = getent("room_1_acti","targetname");

    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                who setorigin(jump.origin);
                who setplayerangles(jump.angles);
            }
            else
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}