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

    precachemodel("playermodel_dead_jumper");
    precachemodel("playermodel_vc_demon");
    precacheitem("demonslayer_mp");
    precacheitem("demonmagic_mp");

    ambientplay("pndm_map");

    level.pndm = [];
    level.pndm["seal"] = loadfx("pandemonium/pndm_seal");
    level.pndm["acti"] = loadfx("pandemonium/pndm_acti");
    level.pndm["port"] = loadfx("pandemonium/pdmn_portal");
    level.pndm["sky"] = loadfx("weather/lightning");
    level.pndm["vistic"] = loadfx("pandemonium/vc_fire");
    // End Fight
    level.pndm["firewall"] = loadfx("pandemonium/pndm_firewall");
    level.pndm["plasma"] = loadfx("pandemonium/pndm_plasma");
    level.pndm["plasma_exp"] = loadfx("pandemonium/pndm_plasmaexp");
    level.pndm["lightning"] = LoadFX("pandemonium/pndm_lightning");
    level.pndm["lightning_exp"] = LoadFX("pandemonium/pndm_lightningexp");

    level.pandemonium_steps = 0;
    level.pandemonium_first = false;
 
    thread prints();
    thread pndm_models();
    thread pndm_fox();

    thread pndm_warping();
    thread pndm_traps();
    thread pndm_rooms();
}

prints()
{
    level waittill("round_started");

    thread pndm_startdoor();

    playloopedfx(level.pndm["sky"],2,(-440,-4504,1528));
    playfx(level.pndm["vistic"],(-490,-8920,184));
    msg_list = strtok("Welcome to ^5mp_dr_pandemonium;Map by ^5Blade;Discord: ^5Blade #6504;Credits to ^5Fox ^7& ^5Sheep Wizard;Visit ^5vistic-clan.net;Find the ^5Seals ^7and open the ^5Secret^7!;^5Fight^7 and get your ^5Soul^7 back!",";");

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

pndm_startdoor()
{
    door = getent("pndm_startdoor","targetname");
    clip = getent("pndm_startdoor_clip","targetname");

    wait 5;
    iprintlnbold("Welcome to ^1>> ^5Pandemonium ^1<<");
    door movez(-170,5);
    clip movez(-170,5);
    wait 5;
    door delete();
    clip delete();
}

pndm_models()
{
    level endon("endmap");

    for(;;)
    {
        level waittill("player_spawn",who);
        if(who.pers["team"] != "spectator")
        {   
            who detachall();
            if(who.pers["team"] == "allies")
                who setmodel("playermodel_dead_jumper");
            else
                who setmodel("playermodel_vc_demon");
        }
    }
}

pndm_traps()
{
    thread pndm_trap_fx();
    thread pndm_trap_1();
    thread pndm_trap_2();
    thread pndm_trap_3();
    thread pndm_trap_4();
    thread pndm_trap_5();
    thread pndm_trap_6();
    thread pndm_trap_7();

    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addTriggerToList("trig_trap5");
    addTriggerToList("trig_trap6");
    addTriggerToList("trig_trap7");
}

addTriggerToList(name)
{
    if(!isdefined(level.trapTriggers))
      level.trapTriggers=[];

    level.trapTriggers[level.trapTriggers.size]=getent(name,"targetname");
}

pndm_trap_fx()
{
    level.pndm_trap = [];

    level.pndm_trap[0] = spawnfx(level.pndm["acti"],(464,-32,456));
    level.pndm_trap[1] = spawnfx(level.pndm["acti"],(464,-256,456));
    level.pndm_trap[2] = spawnfx(level.pndm["acti"],(-1488,-3040,456));
    level.pndm_trap[3] = spawnfx(level.pndm["acti"],(-1488,-3264,456));
    level.pndm_trap[4] = spawnfx(level.pndm["acti"],(464,-5904,456));
    level.pndm_trap[5] = spawnfx(level.pndm["acti"],(464,-6128,456));
    level.pndm_trap[6] = spawnfx(level.pndm["acti"],(-1488,-8048,456));

    wait .05;

    for(i=0;i<level.pndm_trap.size;i++)
        triggerfx(level.pndm_trap[i]);

    level waittill("round_started");

    wait 5;

    if(level.trapsdisabled)
    {
        for(i=0;i<level.pndm_trap.size;i++)
            level.pndm_trap[i] delete();
    }
}


pndm_trap_1()
{
    trig = getent("trig_trap1","targetname");
    level.trap1_time = 4;

    thread trap1_move();

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[0] delete();

    level.trap1_time = 2;
}

trap1_move()
{
    trap = getent("pndm_trap_1","targetname");

    trap movex(-288,level.trap1_time);
    while(isdefined(trap))
    {
        wait level.trap1_time;
        trap movex(592,level.trap1_time);
        wait level.trap1_time;
        trap movex(-592,level.trap1_time);
    }
}

pndm_trap_2()
{
    trig = getent("trig_trap2","targetname");
    trapa = getent("pndm_trap_2a","targetname");
    trapb = getent("pndm_trap_2b","targetname");
    trapc = getent("pndm_trap_2c","targetname");

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[1] delete();

    chaos = randomint(9);
    if(chaos < 4)
    {
        trapa movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapa delete();
        trapc delete();
    }
    else if(chaos > 4 && chaos < 7)
    {
        trapb movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapb delete();
        trapc delete();
    }
    else 
    {
        trapa movez(-40,2);
        trapb movez(-40,2);
        wait 2;
        trapa delete();
        trapb delete();
    }
}

pndm_trap_3()
{
    trig = getent("trig_trap3","targetname");
    trap = getent("pndm_trap_3","targetname");
    hurt = getent("pndm_trap_3hurt","targetname");

    wait .5;
    hurt enablelinkto();
    hurt linkto(trap);

    trap movez(-155,1);

    level.trap3_time = 5;

    thread trap3_move();

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[2] delete();
    level.trap3_time = 2.5;

    trap movez(150,3);
    wait 6;
    trap movez(-150,3);
    wait 4;

    hurt unlink();
    trap delete();
    hurt delete();
}

trap3_move()
{
    move1 = getent("pndm_move1","targetname");
    move2 = getent("pndm_move2","targetname");

    while(isdefined(move1) && isdefined(move2))
    {
        move1 movey(-544,level.trap3_time);
        move2 movey(544,level.trap3_time);
        wait level.trap3_time;
        move1 movey(544,level.trap3_time);
        move2 movey(-544,level.trap3_time);
        wait level.trap3_time;
    }
}

pndm_trap_4()
{
    trig = getent("trig_trap4","targetname");
    trapa = getent("pndm_trap_4a","targetname");
    trapb = getent("pndm_trap_4b","targetname");
    trapc = getent("pndm_trap_4c","targetname");

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[3] delete();

    chaos = randomint(9);
    if(chaos < 4)
    {
        trapa movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapa delete();
        trapc delete();

        trapb trap4_move();
    }
    else if(chaos > 4 && chaos < 7)
    {
        trapb movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapb delete();
        trapc delete();

        trapa trap4_move();
    }
    else 
    {
        trapa movez(-40,2);
        trapb movez(-40,2);
        wait 2;
        trapa delete();
        trapb delete();

        trapc trap4_move();
    }
}

trap4_move()
{
    while(isdefined(self))
    {
        self rotateroll(360,3);
        wait 3.5;
        self movez(-120,2);
        wait 2;
        self rotateroll(-360,3);
        wait 3;
        self movez(120,2);
        wait 5;
    }
}

pndm_trap_5()
{
    trig = getent("trig_trap5","targetname");
    trap = getent("pndm_trap_5","targetname");

    trap movez(-400,1);

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[4] delete();

    trap movez(400,1);
    wait 5;
    trap movez(-400,1);
}

pndm_trap_6() // random sinking and re appearing
{
    trig = getent("trig_trap6","targetname");
    trapa = getent("pndm_trap_6a","targetname");
    trapb = getent("pndm_trap_6b","targetname");
    trapc = getent("pndm_trap_6c","targetname");

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[5] delete();

    while(isdefined(trapb) && isdefined(trapb) && isdefined(trapc))
    {
        chaos = randomint(9);
        if(chaos < 4)
            trapb trap6_move();
        else if(chaos > 4 && chaos < 7)
            trapa trap6_move();
        else 
            trapc trap6_move();

        wait 4;
    }   
}

trap6_move()
{
    self movez(-40,2);
    wait 2.5;
    self movez(40,2);
    wait 2.5;
}

pndm_trap_7()
{
    trig = getent("trig_trap7","targetname");
    trapa = getent("pndm_trap_7e","targetname");
    trapb = getent("pndm_trap_7f","targetname");
    trapc = getent("pndm_trap_7g","targetname");

    level.trap7_time = 4;

    thread trap7_move();

    trig sethintstring("Release ^1>> ^5Apollyons ^1<<^7 Power");
    trig waittill("trigger");
    trig delete();
    level.pndm_trap[6] delete();

    level.trap7_time = 2;

    chaos = randomint(9);
    if(chaos < 4)
    {
        trapa movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapa delete();
        trapc delete();
    }
    else if(chaos > 4 && chaos < 7)
    {
        trapb movez(-40,2);
        trapc movez(-40,2);
        wait 2;
        trapb delete();
        trapc delete();
    }
    else 
    {
        trapa movez(-40,2);
        trapb movez(-40,2);
        wait 2;
        trapa delete();
        trapb delete();
    }
}

trap7_move()
{
    trapa = getent("pndm_trap_7a","targetname");
    trapb = getent("pndm_trap_7b","targetname");

    while(isdefined(trapa) && isdefined(trapb))
    {
        wait level.trap7_time;
        trapa movex(-672,level.trap7_time);
        trapb movex(672,level.trap7_time);
        wait level.trap7_time;
        trapa movex(672,level.trap7_time);
        trapb movex(-672,level.trap7_time);
    }
}

pndm_warping()
{
    thread warp1();
    thread warp2();
    thread warp3();
    thread pndm_acti_warp();
}

warp1()
{
    trig = getent("pndm_warp1","targetname");
    targ = getent("pndm_targ1","targetname");
    fx = getent("pndm_warp_fx1","targetname");

    wait 2;

    playfx(level.pndm["seal"],fx.origin);

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5Cronos ^1<<^7 Power");
        trig waittill("trigger",who);
        who _processwarp(targ);
    }
}

warp2()
{
    trig = getent("pndm_warp2","targetname");
    targ = getent("pndm_targ2","targetname");
    fx = getent("pndm_warp_fx2","targetname");

    wait 2;

    playfx(level.pndm["seal"],fx.origin);

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5Cronos ^1<<^7 Power");
        trig waittill("trigger",who);
        who _processwarp(targ);
    }
}

warp3()
{
    trig = getent("pndm_warp3","targetname");
    targ = getent("pndm_targ3","targetname");
    fx = getent("pndm_warp_fx3","targetname");

    wait 2;

    playfx(level.pndm["seal"],fx.origin);

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5Cronos ^1<<^7 Power");
        trig waittill("trigger",who);
        if(!isdefined(level.pndm_first_end))
        {
            level.pndm_first_end = true;
            iprintlnbold("Lost Soul ^1>> ^5"+who.name+" ^1<<^7 has finished first!");
            who braxi\_rank::giverankxp(undefined,100);
            pndm_playsound("pndm_laugh","all",undefined);
        }
        who _processwarp(targ);
    }
}

pndm_acti_warp()
{
    trig = getent("pndm_actiwarp1","targetname");
    targ = getent("pndm_actitarg1","targetname");
    fx = getent("pndm_actifx1","targetname");

    wait 2;

    port = spawnfx(level.pndm["port"],fx.origin);
    triggerfx(port);
    
    trig waittill("trigger",who);
    if(who.pers["team"] == "axis")
    {
        trig delete();
        port delete();

        thread pndm_acti_warp2();
        who _processwarp(targ);
    }
}

pndm_acti_warp2()
{
    trig = getent("pndm_actiwarp2","targetname");
    targ = getent("pndm_actitarg2","targetname");
    fx = getent("pndm_actifx2","targetname");

    wait 2;

    port = spawnfx(level.pndm["port"],fx.origin);
    triggerfx(port);
    
    trig waittill("trigger",who);
    if(who.pers["team"] == "axis")
    {
        trig delete();
        port delete();

        thread pndm_acti_warp3();
        who _processwarp(targ);
    }
}

pndm_acti_warp3()
{
    trig = getent("pndm_actiwarp3","targetname");
    targ = getent("pndm_actitarg3","targetname");
    fx = getent("pndm_actifx3","targetname");

    wait 2;

    port = spawnfx(level.pndm["port"],fx.origin);
    triggerfx(port);
    
    trig waittill("trigger",who);
    if(who.pers["team"] == "axis")
    {
        trig delete();
        port delete();

        who _processwarp(targ);
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

pndm_fox()
{
    trig = getent("pndm_fox","targetname");
    targ = getent("pndm_door1","targetname");
    path = getent("pndm_secpath","targetname");

    trig sethintstring("Sacrifice ^1>> ^520 HP ^1<<^7 to release the Seal");
    trig waittill("trigger",who);
    trig delete();

    if(who.health > 20)
        who.health = (who.health - 20);
    else 
        who suicide();

    pndm_playsound("pndm_bell","all",undefined);
    targ movez(144,2);
    wait 2;
    targ delete();
    path delete();

    level.pandemonium_steps += 1;

    iprintlnbold("Demonic Seal ^1>> ^5Fox ^1<<^7 has been released");
    iprintln("^1>>^7 Sacrifice Steps: ^5"+int(level.pandemonium_steps)+"/2");
    thread pndm_blade();
}

pndm_blade()
{
    trig = getent("pndm_blade","targetname");
    targ = getent("pndm_door2","targetname");

    trig sethintstring("Sacrifice ^1>> ^520 HP ^1<<^7 to release the Seal");
    trig waittill("trigger",who);
    trig delete();

    if(who.health > 20)
        who.health = (who.health - 20);
    else 
        who suicide();

    pndm_playsound("pndm_bell","all",undefined);
    targ movez(-144,2);
    wait 2;
    targ delete();

    level.pandemonium_steps += 1;

    iprintlnbold("Demonic Seal ^1>> ^5Blade ^1<<^7 has been released");
    iprintln("^1>>^7 Sacrifice Steps: ^5"+int(level.pandemonium_steps)+"/2");

    wait 2;
    thread pndm_secret();
}

pndm_secret()
{
    clip = getent("pndm_door3","targetname");
    trig = getent("pndm_sec_warp","targetname");
    targ = getent("pndm_sec_targ","targetname");
    fxa = getent("pndm_sec_warpfx1","targetname");
    fxb = getent("pndm_sec_warpfx2","targetname");

    wait 4;
    if(int(level.pandemonium_steps) >= 2)
    {
        pndm_playsound("pndm_bell","all",undefined);
        iprintlnbold("^5Sacrifices ^7were given, ^5Secret ^7is open");
        clip delete();
        playfx(level.pndm["seal"],fxa.origin);
        playfx(level.pndm["seal"],fxb.origin);

        thread pndm_secret_out();

        for(;;)
        {
            trig sethintstring("Release ^1>> ^5Cronos ^1<<^7 Power");
            trig waittill("trigger",who);
            who _processwarp(targ);
        }
    }
}

pndm_secret_out()
{
    trig = getent("pndm_sec_warp1","targetname");
    targ = getent("pndm_sec_targ1","targetname");

    thread pndm_secret_model();

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5Cronos ^1<<^7 Power");
        trig waittill("trigger",who);

        if(!level.pandemonium_first)
        {
            level.pandemonium_first = true;
            iprintlnbold("Lost Soul ^1>> ^5"+who.name+" ^1<<^7 has finished the ^5Secret^7 first!");
            pndm_playsound("pndm_laugh","all",undefined);

            who giveweapon("demonslayer_mp");
            who switchtoweapon("demonslayer_mp");
            who braxi\_rank::giverankxp(undefined,200);
        }
        else 
            who braxi\_rank::giverankxp(undefined,150);

        who _processwarp(targ);
    }
}

pndm_secret_model()
{
    model = getent("pndm_sec_model","targetname");
    model thread pndm_secret_hover();

    while(isdefined(model) && !level.pandemonium_first)
    {
        model rotateyaw(360,5);
        wait 5;
    }
    model delete();
}

pndm_secret_hover()
{
    while(isdefined(self) && !level.pandemonium_first)
    {
        self movez(5,3);
        wait 3;
        self movez(-5,3);
        wait 3;
    }
}

// Braxi Function
pndm_playsound(alias,mode,who)
{
    if(mode == "player" && isdefined(who))
        who playlocalsound("alias");
    else 
    {
        p = getentarray("player","classname");
        for(i=0;i<p.size;i++)
            p[i] playlocalsound(alias);
    }
}

pndm_rooms()
{
    thread pndm_moloch();
    thread pndm_leviathan();
    thread pndm_belial();
    thread pndm_lucifer();
}

pndm_moloch()
{
    level.moloch = getent("pndm_moloch","targetname");
    acti = getent("pndm_moloch_acti","targetname");
    jump = getent("pndm_moloch_jump","targetname");

    while(1)
    {
        level.moloch sethintstring("Invoke ^1>> ^5Moloch ^1<<^7 to open Sniper");
        level.moloch waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.moloch))
            return;

        level.moloch sethintstring("^1>> ^5Moloch ^1<<^7 didnt choose you yet");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
            thread pndm_moloch_fail();

            level.leviathan delete();
            level.belial delete();
            level.lucifer delete();
            
            ambientstop();
            ambientplay("pndm_room"+(1+randomint(2)));
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            level.activ pndm_room_setup(acti,"remington700_mp","m40a3_mp","yes",1);
            pndm_room_announce("Molochs Realm",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player pndm_room_setup(jump,"m40a3_mp","remington700_mp","yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Lost Soul ^1>> ^5"+player.name+" ^1<<^7 has been redeemed");
    }
}

pndm_moloch_fail()
{
    trig = getent("pndm_moloch_fail","targetname");
    acti = getent("pndm_moloch_acti","targetname");
    jump = getent("pndm_moloch_jump","targetname");
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

pndm_leviathan()
{
    level.leviathan = getent("pndm_leviathan","targetname");
    acti = getent("pndm_leviathan_acti","targetname");
    jump = getent("pndm_leviathan_jump","targetname");

    while(1)
    {
        level.leviathan sethintstring("Invoke ^1>> ^5Leviathan ^1<<^7 to open Knife");
        level.leviathan waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.leviathan))
            return;

        level.leviathan sethintstring("^1>> ^5Leviathan ^1<<^7 didnt choose you yet");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
            level.moloch delete();
            level.belial delete();
            level.lucifer delete();
   
            ambientstop();
            ambientplay("pndm_room"+(1+randomint(2)));
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,"yes",1);
            pndm_room_announce("Leviathans Cage",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Lost Soul ^1>> ^5"+player.name+" ^1<<^7 has been redeemed");
    }
}

pndm_belial()
{
    level.belial = getent("pndm_belial","targetname");
    acti = getent("pndm_belial_acti","targetname");
    jump = getent("pndm_belial_jump","targetname");

    while(1)
    {
        level.belial sethintstring("Invoke ^1>> ^5Belial ^1<<^7 to open Bounce");
        level.belial waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.belial))
            return;

        level.belial sethintstring("^1>> ^5Belial ^1<<^7 didnt choose you yet");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
            thread pndm_belial_fail();
            thread pndm_belial_weap();

            level.leviathan delete();
            level.moloch delete();
            level.lucifer delete();
   
            ambientstop();
            ambientplay("pndm_room"+(1+randomint(2)));
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            level.activ pndm_room_setup(acti,"knife_mp",undefined,"yes",1);
            pndm_room_announce("Belials Cliff",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player pndm_room_setup(jump,"knife_mp",undefined,"yes",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Lost Soul ^1>> ^5"+player.name+" ^1<<^7 has been redeemed");
    }
}

pndm_belial_fail()
{
    trig = getent("pndm_belial_fail","targetname");
    acti = getent("pndm_belial_acti","targetname");
    jump = getent("pndm_belial_jump","targetname");
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

pndm_belial_weap()
{
    trig = getent("pndm_belial_weap","targetname");
    fx = getent("pndm_belial_weapfx","targetname");

    wait 1;
    playfx(level.pndm["seal"],fx.origin);

    for(;;)
    {
        trig sethintstring("Release ^1>> ^5Azazels ^1<<^7 Power");
        trig waittill("trigger",who);

        if(who hasweapon("remington700_mp"))
            who givemaxammo("remington700_mp");
        else
            who pndm_give_weapon("remington700_mp");

        trig sethintstring("^1>> ^5Azazels ^1<<^7 Power hasnt charged yet");
        wait 3;
    }
}

pndm_lucifer()
{
    level.lucifer = getent("pndm_lucifer","targetname");
    acti = getent("pndm_lucifer_acti","targetname");
    jump = getent("pndm_lucifer_jump","targetname");

    while(1)
    {
        level.lucifer sethintstring("Invoke ^1>> ^5Lucifer ^1<<^7 to open Demon Slayer");
        level.lucifer waittill("trigger",player);
        if(!player sr\api\_deathrun::order())
            continue;
        if(!isdefined(level.lucifer))
            return;

        level.lucifer sethintstring("^1>> ^5Lucifer ^1<<^7 didnt choose you yet");

        if(!isdefined(level.pndm_room))
        {
            level.pndm_room=true;
            playfx(level.pndm["acti"],acti.origin);

            thread pndm_lucifer_fail();

            level.leviathan delete();
            level.moloch delete();
            level.belial delete();
   
            ambientstop();
            ambientplay("pndm_room"+(1+randomint(2)));
        }

        if(isdefined(level.activ))
        {
            player pndm_room_setup(jump,"demonslayer_mp",undefined,"magic",1);
            level.activ pndm_room_setup(acti,"demonmagic_mp",undefined,"magic",1);
            level.activ thread pndm_lucifer_magic();
            pndm_room_announce("Lucifers Arena",level.activ.name+" vs "+player.name);
            wait 5;
            player freezecontrols(0);
            level.activ freezecontrols(0);
        }
        else 
        {
            player pndm_room_setup(jump,"demonslayer_mp",undefined,"magic",1);
            wait 5;
            player freezecontrols(0);
        }

        while(isAlive(player)&&isDefined(player))
            wait 1;

        iprintlnbold("Lost Soul ^1>> ^5"+player.name+" ^1<<^7 has been redeemed");
    }
}

pndm_lucifer_fail()
{
    trig = getent("pndm_lucifer_fail","targetname");
    acti = getent("pndm_lucifer_acti","targetname");
    jump = getent("pndm_lucifer_jump","targetname");
    jump2 = getent("pndm_lucifer_jump2","targetname");
    jump3 = getent("pndm_lucifer_jump3","targetname");
    jump4 = getent("pndm_lucifer_jump4","targetname");
    for(;;)
    {
        trig waittill("trigger",who);
        if(who.pers["team"] != "spectator")
        {
            if(who.pers["team"] == "allies")
            {
                rdm = randomint(4);
                if(rdm == 0)
                {
                    who setorigin(jump.origin);
                    who setplayerangles(jump.angles);
                }
                else if(rdm == 1)
                {
                    who setorigin(jump2.origin);
                    who setplayerangles(jump2.angles);
                }
                else if(rdm == 2)
                {
                    who setorigin(jump3.origin);
                    who setplayerangles(jump3.angles);
                }
                else if(rdm == 3)
                {
                    who setorigin(jump4.origin);
                    who setplayerangles(jump4.angles);
                }
            }
            else 
            {
                who setorigin(acti.origin);
                who setplayerangles(acti.angles);
            }
        }
    }
}

pndm_lucifer_magic() // Thanks to Rycoon for Permissions to use and modify this
{
    self endon("disconnect");
    self endon("death");
    level endon("game over");

    if(self.pers["team"] != "axis")
        return;

    self iprintlnbold("Fight this Lost Soul!");

    delay = 0;
    self.cur_spell = 1;

    self thread pndm_magic_hud();
    
    while(1)
    {
        if( self attackbuttonpressed() && delay < 1 )
        {
            if( self.cur_spell == 1 )
                self thread pndm_firewall();
            else if( self.cur_spell == 2 )
                self thread pndm_lightning();
            else if( self.cur_spell == 3 )
                self thread pndm_plasma();

            delay = 30;
        }
        if( self FragButtonPressed() )
        {   
            self.cur_spell++;
            if( self.cur_spell > 3 )
                self.cur_spell = 1;

            self.pndm_magic_spell settext(pndm_magic(self.cur_spell));
        }
        if( delay > 0 )
            delay --;
        while( self AttackButtonPressed() || self FragButtonPressed() )
            wait 0.1;
        wait 0.1;
    }
}

pndm_magic_hud() 
{
    self thread destroyondeath();

    if(isdefined(self.pndm_magic_info))
        self.pndm_magic_info destroy();

    self.pndm_magic_info = newClienthudElem(self); 
    self.pndm_magic_info.x = 9;   
    self.pndm_magic_info.y = -144; 
    self.pndm_magic_info.horzAlign = "left";   
    self.pndm_magic_info.vertAlign = "middle";
    self.pndm_magic_info.alignX = "left";
    self.pndm_magic_info.alignY = "middle";
    self.pndm_magic_info.sort = 102;   
    self.pndm_magic_info.alpha = 1;    
    self.pndm_magic_info.fontScale = 1.4;
    self.pndm_magic_info.glowColor = (0.3, 0.6, 0.3);
    self.pndm_magic_info.glowAlpha = 1;
    self.pndm_magic_info settext("Cast Magic: ^1>> ^5[{+attack}] ^1<<\n^7Switch Magic: ^1>> ^5[{+frag}] ^1<<");

    if(isdefined(self.pndm_magic_spell))
        self.pndm_magic_spell destroy();

    self.pndm_magic_spell = newClienthudElem(self);    
    self.pndm_magic_spell.x = 9;  
    self.pndm_magic_spell.y = -112;    
    self.pndm_magic_spell.horzAlign = "left";  
    self.pndm_magic_spell.vertAlign = "middle";
    self.pndm_magic_spell.alignX = "left";
    self.pndm_magic_spell.alignY = "middle";
    self.pndm_magic_spell.sort = 102;
    self.pndm_magic_spell.alpha = 1;   
    self.pndm_magic_spell.fontScale = 1.4; 
    self.pndm_magic_spell.glowColor = (0.3, 0.6, 0.3);
    self.pndm_magic_spell.glowAlpha = 1;
    self.pndm_magic_spell.label=&"Magic: ^1>> ^5&&1 ^1<<";
    self.pndm_magic_spell settext(pndm_magic(self.cur_spell));
}

destroyondeath()
{
    self waittill("death");
    self.pndm_magic_spell.alpha=0;
    self.pndm_magic_info.alpha=0;
}

pndm_magic(spell)
{
    switch(spell)
    {
        case 1:
            return "Fire Wall";
        case 2:
            return "Lightning Strike";
        case 3:
            return "Plasma Bomb";
        default: 
            return "none";
    }
}

pndm_firewall()
{
    obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    obj SetModel("tag_origin");
    obj.angles = self GetPlayerAngles();

    wait 0.05;
    playfxontag(level.pndm["firewall"], obj, "tag_origin" );
    
    obj PlaySound("pndm_cast");
    obj PlayLoopSound("pndm_firewall");
    
    target = obj.origin+AnglesToForward( obj.angles )*600;
    obj MoveTo( target, 4, 0, 0 );
    
    time = 40;
    
    while(1)
    {
        if( time > 0 )
        {
            RadiusDamage( obj.origin, 200, 20, 10, self );
            time --;
        }
        else
            break;
        wait 0.1;
    }
    obj delete();
}

pndm_plasma()
{
    Obj = Spawn("script_model", self GetEye()+AnglesToForward( self GetPlayerAngles() )*30 );
    Obj setModel("tag_origin");
    Obj.angles = self GetPlayerAngles();

    wait 0.05;
    playfxontag(level.pndm["plasma"], obj, "tag_origin" );
    
    obj PlaySound("pndm_cast");

    while(1)
    {
        target = obj.origin+AnglesToForward( obj.angles )*80;
        obj MoveTo( target, 0.1, 0, 0 );
        if( !BulletTracePassed( obj.origin, target, true, self ) )
            break;
        wait 0.1;
    }
    Obj PlaySound("pndm_plasma");
    Playfx(level.pndm["plasma_exp"], obj.origin );
    EarthQuake( 1, 1, obj.origin, 600 );
    RadiusDamage( obj.origin, 400, 100, 30, self );
    obj delete();
}

pndm_lightning()
{
    trace = BulletTrace( self GetEye(), self GetEye()+AnglesToForward( self GetPlayerAngles() )*3000, false, self );
    center = trace["position"];
    
    obj = Spawn("script_origin", center );
    
    x = 5+RandomInt(3);
    for(i=0;i<x;i++)
    {
        pos = center+(RandomInt(200,-200),RandomInt(200,-200),0);
        trace = BulletTrace( pos+(0,0,200), pos-(0,0,600), false, self );
        obj.origin = trace["position"];
        obj PlaySound("pndm_lightning");
        PlayFX( level.pndm["lightning"], trace["position"] );
        PlayFX( level.pndm["lightning_exp"], trace["position"] );
        EarthQuake( 1, 1, trace["position"], 400 );
        RadiusDamage( trace["position"], 100, 50, 15, self );
        wait 0.3+RandomFloat(0.2);
    }
    obj delete();
}

pndm_room_setup(targ,weap,weap2,health,freeze)
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
    else if(health == "magic")
    {
        if(self.pers["team"] != "spectator")
        {
            if(self.pers["team"] == "allies")
                self.maxhealth = 300;
            else    
                self.maxhealth = 150;
        }
        self.health=self.maxhealth;
    }
}

pndm_room_announce(room,message)
{
    noti = SpawnStruct();

    if(isdefined(room))
        noti.titleText = room;

    noti.notifyText = message;
    noti.duration = 6;
    if(isdefined(level.randomcolor))
        noti.glowcolor=level.randomcolor;
    else 
        noti.glowcolor=(randomint(100)/100,randomint(100)/100,randomint(100)/100);
    players = getEntArray("player", "classname");
    for(i=0;i<players.size;i++)
        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
    wait 2;
}

pndm_give_weapon(weap)
{
    self giveweapon(weap);
    self switchtoweapon(weap);
    self givemaxammo(weap);
}