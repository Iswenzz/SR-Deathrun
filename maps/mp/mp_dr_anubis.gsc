//Map made by CM'Nobody
//Original map from Garrys Mod by FireWavezZ

// Discord : Derazerr | Nobody#3996
//Steam :  xderazerr


#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_rank;

main()
{
 maps\mp\_load::main();

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

    // setdvar("dr_jumpers_speed" ,"1");

    setdvar( "r_specularcolorscale", "1" );

    setdvar("r_glowbloomintensity0",".1");
    setdvar("r_glowbloomintensity1",".1");
    setdvar("r_glowskybleedintensity0",".1");
    setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998 );

    level.white_light = LoadFx("anubis/white_light");
    level.redlight2 = LoadFx("anubis/redlight2");
    level.redlight3 = LoadFx("anubis/redlight3");

    level.doordust = LoadFx("anubis/doordust");
    level.wind = LoadFx("anubis/wind");


    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addtriggerTolist("trig_trap5");
    addtriggerTolist("trig_trap6");
    addtriggerTolist("trig_trap7");
    addtriggerTolist("trig_trap9");
    addtriggerTolist("trig_trap10");
    addTriggerToList("trig_trap11");
    addTriggerToList("trig_trap12");
    addtriggerTolist("trig_trap13");
    addTriggerToList("trig_trap14");
    addTriggerToList("trig_trap15");
    addtriggerTolist("trig_trap16");
    addTriggerToList("trig_trap17");

    precacheItem("rpd_mp");
    precacheItem("m40a3_mp");
    precacheItem("remington700_mp");
    precacheItem("deserteagle_mp");
    precacheItem("rpg_mp");

    thread sand();
    thread trap1();
    thread trap2();
    thread trap2init();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
    thread trap8();
    thread trap9();
    thread trap10();
    thread trap11();
    thread trap12();
    thread trap13();
    thread trap14();
    thread trap15();
    thread trap16();
    thread trap17();
    thread trap17init();
    thread part2_jumper();
    thread part2_activator();
    thread part1_activator();
    thread selectionroom();
    thread enddoor();
    thread message();
    thread speed();

    thread door();

    thread bounce_room_weapon();
    thread bounce_room();
    thread bounce_room_jumper();
    thread bounce_room_activator();

    thread rpg_room();
    thread rpg_room_fail();

    thread scope_room();
    thread sniper_room_fail();

    thread purestart();

    thread knife_room();

    thread simonsays();

    thread turningroom();

    thread jumper_karambit();

    thread random_ambient();

    thread cm_check();

    thread whitelight();
    thread pharaoh_eyes();
    thread pharaoh_sound();

    thread secret1();
    thread secret2();
    thread secret3();
    thread secret4();

    thread jumper_secret_end();
    thread secret();
    thread jumper_secret_start();

}

speed()
{
    wait 1;
    // speed = getDvar("g_speed");
    // if( speed == "190")
    // {
    //     setdvar("g_speed" ,"200");
    //     //You re free to remove this speed script but i recommend you to play this map with at least speed 200, the map can be finished in 190 but people will cry ^^ //
    // }
}

sand()
{
    sand = getEnt("sand", "targetname");
    pyramid = getEnt("pyramid", "targetname");
    sand moveZ(-16, 0.1);
    pyramid moveZ(-16, 0.1);
}

door()
{
    thread garbagecheck();
    door1 = getEnt("startdoor1", "targetname");
    door2 = getEnt("startdoor2", "targetname");
    fakedoor = getEnt("fakedoor", "targetname");

    door2 hide();
    door1 hide();

    door2 moveZ (-40, 0.5);
    door1 moveZ (-40, 0.5);
    wait 0.6;
    door2 moveX (160, 0.5);
    door1 moveX (160, 0.5);
    wait 0.6;
    door2 show();
    door1 show();
    fakedoor delete();

    level waittill("round_started");
    wait 10;
    srvname = getDvar("sv_hostname");
    // if (isSubStr( toLower(srvname), toLower("xM") ))
    // {
    //     iPrintLnBold ("^3Sorry but xM is bullshit");
    //     iPrintLnBold ("^3Coucou Raky");
    //     wait 2;
    //     exitLevel(true);
    //     //Thanks to DarkSTEP for this//
    // }
    // else
    // {
    door_effect = getEnt("door_effect", "targetname");
    iprintlnbold("^3The temple door has been opened.");
    earthquake(0.8, 3, door_effect.origin, 400);
    door2 moveZ (154, 1.5);
    door1 moveZ (316, 3);
    thread doordust();
    door_effect playsound ("anubis_crusher_back");
    wait 2.5;
    door_effect playsound ("anubis_crusher");
    wait 2;
    door1 delete();
    door2 delete();
    // }

}
whitelight()
{
    activator_whitelight_first = getEnt("activator_whitelight_first", "targetname");
    activator_whitelight_second = getEnt("activator_whitelight_second", "targetname");
    jumper_whitelight_first = getEnt("jumper_whitelight_first", "targetname");
    jumper_whitelight_secret_end = getEnt("jumper_whitelight_secret_end", "targetname");

    level waittill("round_started");

    PlayFX(level.white_light, activator_whitelight_first.origin);
    PlayFX(level.white_light, activator_whitelight_second.origin);
    PlayFX(level.white_light, jumper_whitelight_first.origin);
    PlayFX(level.white_light, jumper_whitelight_secret_end.origin);
}


doordust()
{
    door_dust = getEnt("door_dust", "targetname");
    PlayFX(level.doordust, door_dust.origin);
    door_dust2 = getEnt("door_dust2", "targetname");
    PlayFX(level.doordust, door_dust2.origin);
}



pharaoh_eyes()
{

    level waittill("round_started");
    wait 3;
    pharaoh1 = getEnt("pharaoh1", "targetname");
    pharaoh2 = getEnt("pharaoh2", "targetname");
    pharaoh3 = getEnt("pharaoh3", "targetname");
    pharaoh4 = getEnt("pharaoh4", "targetname");

    fx1 = spawnFX(level.redlight2, pharaoh1.origin);
    fx2 = spawnFX(level.redlight2, pharaoh2.origin);
    fx3 = spawnFX(level.redlight3, pharaoh3.origin);
    fx4 = spawnFX(level.redlight3, pharaoh4.origin);

    triggerFX(fx1);
    triggerFX(fx2);

    wait 0.5;
    triggerFX(fx3);
    triggerFX(fx4);
    wait 6;
    fx3 delete();
    fx4 delete();
    fx1 delete();
    fx2 delete();
}

pharaoh_sound()
{
    level waittill("round_started");
    wait 1;
    pharaohsound = getEnt("pharaohsound", "targetname");
    pharaohsound playsound ("anubis_demon");
}


addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

random_ambient()
{
    level waittill("round_started");
    wait 15;
    random_ambient = randomint(4);
    if (random_ambient == 0)
    {
        title = "Gravy Beats - Anubeat";
        iPrintLn("^3>> ^7Now playing: ^3" + title + " ^3<<");
        AmbientPlay("anubis_ambient1");
    }
    if (random_ambient == 1)
    {
        title = "HVNTRR - Nefertiti";
        iPrintLn("^3>> ^7Now playing: ^3" + title + " ^3<<");
        AmbientPlay("anubis_ambient2");
    }
    if (random_ambient == 2)
    {
        title = "Grilla Beats - Pharaoh";
        iPrintLn("^3>> ^7Now playing: ^3" + title + " ^3<<");
        AmbientPlay("anubis_ambient3");
    }
    if (random_ambient == 3)
    {
        title = "Dj Lil Sprite - Pharaoh";
        iPrintLn("^3>> ^7Now playing: ^3" + title + " ^3<<");
        AmbientPlay("anubis_ambient4");
    }
}

trap1()
{
    trig = getent ("trig_trap1", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap = getent ("trap1", "targetname");
    trapbutton = getent ("trap1_button", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trap delete();
        thread trap1_sound_1();

        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
    }
}

trap1_sound_1()
{
    sound = getent ("trap1_sound_1","targetname");
    sound playsound ("anubis_explosion");
}

trap2()
{
    trig = getent ("trig_trap2", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap2_button", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        for(;;)
        {
            thread trap2a();
            wait 0.25;
            thread trap2b();
            wait 0.25;
            thread trap2c();
            wait 0.25;
            thread trap2d();
            wait 0.25;
            thread trap2e();
            wait 2.5;
        }
    }
}

trap2init()
{
    trap_a = getent("trap2_a","targetname"); // trap
    death_trigger_a = getent("trap2a_trig","targetname"); //Death trigger
    death_trigger_a enablelinkto();
    death_trigger_a linkto(trap_a);

    trap_b = getent("trap2_b","targetname"); // trap
    death_trigger_b = getent("trap2b_trig","targetname"); //Death trigger
    death_trigger_b enablelinkto();
    death_trigger_b linkto(trap_b);

    trap_c = getent("trap2_c","targetname"); // trap
    death_trigger_c = getent("trap2c_trig","targetname"); //Death trigger
    death_trigger_c enablelinkto();
    death_trigger_c linkto(trap_c);

    trap_d = getent("trap2_d","targetname"); // trap
    death_trigger_d = getent("trap2d_trig","targetname"); //Death trigger
    death_trigger_d enablelinkto();
    death_trigger_d linkto(trap_d);

    trap_e = getent("trap2_e","targetname"); // trap
    death_trigger_e = getent("trap2e_trig","targetname"); //Death trigger
    death_trigger_e enablelinkto();
    death_trigger_e linkto(trap_e);

    trap_a moveY (-224, 0.05);
    trap_b moveY (-224, 0.05);
    trap_c moveY (-224, 0.05);
    trap_d moveY (-224, 0.05);
    trap_e moveY (-224, 0.05);
}


trap2a()
{


    trap = getent("trap2_a","targetname"); // trap
    death_trigger = getent("trap2a_trig","targetname"); //Death trigger
    death_trigger enablelinkto();
    death_trigger linkto(trap);
    thread trap2_sound_1();
    trap moveY (232, 0.25);
    wait 0.35;
    //thread trap2_sound_1_b();
    trap moveY (-232, 1.5);;
}

trap2b()
{
    trap = getent("trap2_b","targetname"); // trap
    death_trigger = getent("trap2b_trig","targetname"); //Death trigger
    death_trigger enablelinkto();
    death_trigger linkto(trap);
    thread trap2_sound_2();
    trap moveY (240, 0.25);
    wait 0.50;
    //thread trap2_sound_2_b();
    trap moveY (-240, 1.5);

}

trap2c()
{
    trap = getent("trap2_c","targetname"); // trap
    death_trigger = getent("trap2c_trig","targetname"); //Death trigger
    death_trigger enablelinkto();
    death_trigger linkto(trap);
    thread trap2_sound_3();
    trap moveY (272, 0.25);
    wait 0.75;
    //thread trap2_sound_3_b();
    trap moveY (-272, 1.5);
}

trap2d()
{
    trap = getent("trap2_d","targetname"); // trap
    death_trigger = getent("trap2d_trig","targetname"); //Death trigger
    death_trigger enablelinkto();
    death_trigger linkto(trap);
    thread trap2_sound_4();
    trap moveY (224, 0.25);
    wait 0.9;
    //thread trap2_sound_4_b();
    trap moveY (-224, 1.5);
}

trap2e()
{
    trap = getent("trap2_e","targetname"); // trap
    death_trigger = getent("trap2e_trig","targetname"); //Death trigger
    death_trigger enablelinkto();
    death_trigger linkto(trap);
    thread trap2_sound_5();
    trap moveY (240, 0.25);
    wait 1;
    //thread trap2_sound_5_b();
    trap moveY (-240, 1.5);
}

trap2_sound_1()
{
    sound = getent ("trap2_sound_1","targetname");
    sound playsound ("anubis_arrow_on");
}
trap2_sound_2()
{
    sound = getent ("trap2_sound_2","targetname");
    sound playsound ("anubis_arrow_on");
}
trap2_sound_3()
{
    sound = getent ("trap2_sound_3","targetname");
    sound playsound ("anubis_arrow_on");
}
trap2_sound_4()
{
    sound = getent ("trap2_sound_4","targetname");
    sound playsound ("anubis_arrow_on");
}
trap2_sound_5()
{
    sound = getent ("trap2_sound_5","targetname");
    sound playsound ("anubis_arrow_on");
}

trap2_sound_1_b()
{
    sound = getent ("trap2_sound_1_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap2_sound_2_b()
{
    sound = getent ("trap2_sound_2_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap2_sound_3_b()
{
    sound = getent ("trap2_sound_3_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap2_sound_4_b()
{
    sound = getent ("trap2_sound_4_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap2_sound_5_b()
{
    sound = getent ("trap2_sound_5_b","targetname");
    sound playsound ("anubis_arrow_off");
}

trap3()
{
    trig = getent ("trig_trap3", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap = getent ("trap3", "targetname");
    trapbutton = getent ("trap3_button", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        thread trap3_sound_1();
        wait 0.5;
        trap moveZ (-256, 0.5);
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        wait 2;
        thread trap3_sound_2();
        trap moveZ (256, 2);
    }
}

trap3_sound_1()
{
    wait 0.25;
    sound = getent ("trap3_sound_1","targetname");
    sound playsound ("anubis_crusher");
}
trap3_sound_2()
{
    sound = getent ("trap3_sound_2","targetname");
    sound playsound ("anubis_door1");
}


trap4()
{
    trig = getent ("trig_trap4", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap = getent ("trap4", "targetname");
    doors = getent ("trap4_doors", "targetname");
    death_trigger = getent ("trap4_death", "targetname");
    wall = getent ("trap4_wall", "targetname");
    death_trigger enablelinkto();
    death_trigger linkto(wall);
    wait 0.5;
    doors moveZ(-173, 0.1);
    trapbutton = getent ("trap4_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        doors moveZ(181, 2);
        thread trap4_sound_1();
        thread trap4_sound_2();
        wait 3;
        thread trap4_sound_3();
        trap moveX(293, 3);
        wait 2.7;
        wall moveZ(80, 0.1);
        wait 1.3;
        trap moveX(-293, 3);
        wait 3;
        doors moveZ(-181, 2);
        wall moveZ(-80, 0.1);


    }
}

trap4_sound_1()
{
    sound = getent ("trap4_sound_1","targetname");
    sound playsound ("anubis_door1");
    wait 10;
    sound playsound ("anubis_door1");
}
trap4_sound_2()
{
    sound = getent ("trap4_sound_2","targetname");
    sound playsound ("anubis_door1");
    wait 10;
    sound playsound ("anubis_door1");
}
trap4_sound_3()
{
    sound = getent ("trap4_sound_3","targetname");
    sound2 = getent ("trap4_sound_4","targetname");
    sound playsound ("anubis_crusher_back");
    wait 2.5;
    sound2 playsound ("anubis_crusher");
    wait 1.5;
    sound playsound ("anubis_crusher_back");
}


trap5()
{
    trapbutton = getent ("trap5_button", "targetname");
    trig = getent ("trig_trap5", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap1 = getent ("trap5_a", "targetname");
    trap2 = getent ("trap5_b", "targetname");
    trap3 = getent ("trap5_c", "targetname");
    trap4 = getent ("trap5_d", "targetname");
    trap5 = getent ("trap5_e", "targetname");
    trapbutton = getent ("trap5_button", "targetname");
    wait 0.5;
    death_a = getent ("trap5_a_death", "targetname");
    death_a enablelinkto();
    death_a linkto(trap1);
    death_b = getent ("trap5_b_death", "targetname");
    death_b enablelinkto();
    death_b linkto(trap2);
    death_c = getent ("trap5_c_death", "targetname");
    death_c enablelinkto();
    death_c linkto(trap3);
    death_d = getent ("trap5_d_death", "targetname");
    death_d enablelinkto();
    death_d linkto(trap4);
    death_e = getent ("trap5_e_death", "targetname");
    death_e enablelinkto();
    death_e linkto(trap5);

    trap1 moveZ (-126, 0.3);
    trap2 moveZ (-126, 0.3);
    trap3 moveZ (-126, 0.3);
    trap4 moveZ (-126, 0.3);
    trap5 moveZ (-126, 0.3);

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        for(;;)
        {
            random = randomint(5);
            if (random == 0)
            {
                trap1 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap5_sound_1();
                thread trap5_sound_3();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                thread trap5_sound_1_b();
                thread trap5_sound_3_b();
                wait 1;
            }
            if (random == 1)
            {
                trap1 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap5_sound_1();
                thread trap5_sound_4();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                thread trap5_sound_1_b();
                thread trap5_sound_4_b();
                wait 1;
            }
            if (random == 2)
            {
                trap2 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap5_sound_2();
                thread trap5_sound_3();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                thread trap5_sound_2_b();
                thread trap5_sound_3_b();
                wait 1;
            }
            if (random == 3)
            {
                trap2 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap5_sound_2();
                thread trap5_sound_4();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                thread trap5_sound_2_b();
                thread trap5_sound_4_b();
                wait 1;
            }
            if (random == 4)
            {
                trap5 moveZ (126, 0.3);
                thread trap5_sound_5();
                wait 1;
                trap5 moveZ (-126, 0.3);
                thread trap5_sound_5_b();
                wait 1;
            }
        }
    }
}

trap5_sound_1()
{
    sound = getent ("trap5_sound_1","targetname");
    sound playsound ("anubis_arrow_on");
}
trap5_sound_2()
{
    sound = getent ("trap5_sound_2","targetname");
    sound playsound ("anubis_arrow_on");
}
trap5_sound_3()
{
    sound = getent ("trap5_sound_3","targetname");
    sound playsound ("anubis_arrow_on");
}
trap5_sound_4()
{
    sound = getent ("trap5_sound_4","targetname");
    sound playsound ("anubis_arrow_on");
}
trap5_sound_5()
{
    sound = getent ("trap5_sound_5","targetname");
    sound playsound ("anubis_arrow_on");
}

trap5_sound_1_b()
{
    sound = getent ("trap5_sound_1_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap5_sound_2_b()
{
    sound = getent ("trap5_sound_2_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap5_sound_3_b()
{
    sound = getent ("trap5_sound_3_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap5_sound_4_b()
{
    sound = getent ("trap5_sound_4_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap5_sound_5_b()
{
    sound = getent ("trap5_sound_5_b","targetname");
    sound playsound ("anubis_arrow_off");
}

trap6()
{
    trapbutton = getent ("trap6_button", "targetname");
    trig = getent ("trig_trap6", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap1 = getent ("trap6_a", "targetname");
    trap2 = getent ("trap6_b", "targetname");
    trap3 = getent ("trap6_c", "targetname");
    trap4 = getent ("trap6_d", "targetname");
    trap5 = getent ("trap6_e", "targetname");
    trapbutton = getent ("trap6_button", "targetname");

    death_a = getent ("trap6_a_death", "targetname");
    death_a enablelinkto();
    death_a linkto(trap1);
    death_b = getent ("trap6_b_death", "targetname");
    death_b enablelinkto();
    death_b linkto(trap2);
    death_c = getent ("trap6_c_death", "targetname");
    death_c enablelinkto();
    death_c linkto(trap3);
    death_d = getent ("trap6_d_death", "targetname");
    death_d enablelinkto();
    death_d linkto(trap4);
    death_e = getent ("trap6_e_death", "targetname");
    death_e enablelinkto();
    death_e linkto(trap5);
    wait 0.5;
    trap1 moveZ (-126, 0.3);
    trap2 moveZ (-126, 0.3);
    trap3 moveZ (-126, 0.3);
    trap4 moveZ (-126, 0.3);
    trap5 moveZ (-126, 0.3);

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        for(;;)
        {
            random2 = randomint(5);
            if (random2 == 0)
            {
                trap1 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap6_sound_1();
                thread trap6_sound_3();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                thread trap6_sound_1_b();
                thread trap6_sound_3_b();
                wait 1;
            }
            if (random2 == 1)
            {
                trap1 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap6_sound_1();
                thread trap6_sound_4();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                thread trap6_sound_1_b();
                thread trap6_sound_4_b();
                wait 1;
            }
            if (random2 == 2)
            {
                trap2 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap6_sound_2();
                thread trap6_sound_3();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                thread trap6_sound_2_b();
                thread trap6_sound_3_b();
                wait 1;
            }
            if (random2 == 3)
            {
                trap2 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap6_sound_2();
                thread trap6_sound_4();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                thread trap6_sound_2_b();
                thread trap6_sound_4_b();
                wait 1;
            }
            if (random2 == 4)
            {
                trap5 moveZ (126, 0.3);
                thread trap6_sound_5();
                wait 1;
                trap5 moveZ (-126, 0.3);
                thread trap6_sound_5_b();
                wait 1;
            }
        }
    }
}

trap6_sound_1()
{
    sound = getent ("trap6_sound_1","targetname");
    sound playsound ("anubis_arrow_on");
}
trap6_sound_2()
{
    sound = getent ("trap6_sound_2","targetname");
    sound playsound ("anubis_arrow_on");
}
trap6_sound_3()
{
    sound = getent ("trap6_sound_3","targetname");
    sound playsound ("anubis_arrow_on");
}
trap6_sound_4()
{
    sound = getent ("trap6_sound_4","targetname");
    sound playsound ("anubis_arrow_on");
}
trap6_sound_5()
{
    sound = getent ("trap6_sound_5","targetname");
    sound playsound ("anubis_arrow_on");
}

trap6_sound_1_b()
{
    sound = getent ("trap6_sound_1_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap6_sound_2_b()
{
    sound = getent ("trap6_sound_2_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap6_sound_3_b()
{
    sound = getent ("trap6_sound_3_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap6_sound_4_b()
{
    sound = getent ("trap6_sound_4_b","targetname");
    sound playsound ("anubis_arrow_off");
}
trap6_sound_5_b()
{
    sound = getent ("trap6_sound_5_b","targetname");
    sound playsound ("anubis_arrow_off");
}

trap7()
{
    trapbutton = getent ("trap7_button", "targetname");
    trig = getent ("trig_trap7", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap = getent ("trap7", "targetname");
    clip = getent ("trap7_clip", "targetname");
    death_trigger = getent ("trap7_death", "targetname");
    trapbutton = getent ("trap7_button", "targetname");
    death_trigger enablelinkto();
    death_trigger linkto(clip);

    o1 = getent("trap7_o1","targetname");
    o2 = getent("trap7_o2","targetname");
    o3 = getent("trap7_o3","targetname");

    trap moveZ(-128, 0.5);
    clip moveZ(-128, 0.5);
    wait 1;
    trap moveX(128, 0.5);
    clip moveX(128, 0.5);
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        clip playsound ("anubis_rollingpillar");
        trap rotatepitch(-1080, 2.75);
        trap moveX(-305, 2.55);
        clip moveX(-305, 2.55);
        wait 2.55;
        clip playsound ("anubis_rollingpillar");
        trap rotatepitch(-1080, 2.75);
        clip rotatepitch(-1080, 2.75);

        trap moveTo(o1.origin, 1);
        clip moveTo(o1.origin, 1);
        wait 1;
        trap moveTo(o2.origin, 1);
        clip moveTo(o2.origin, 1);
        wait 1;
        trap moveTo(o3.origin, 0.75);
        clip moveTo(o3.origin, 0.75);
        wait 0.80;
        earthquake(0.7, 2, o3.origin, 500);
        clip playsound ("anubis_explosion");

    }
}

trap8()
{
    trapbutton = getent ("trap8_button", "targetname");
    trig = getent ("trig_trap8", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapa = getent ("trap8_a", "targetname");
    trapb = getent ("trap8_b", "targetname");
    trapc = getent ("trap8_c", "targetname");
    trapa_death = getent ("trap8a_death", "targetname");
    trapb_death = getent ("trap8b_death", "targetname");
    trapc_death = getent ("trap8c_death", "targetname");
    trapbutton = getent ("trap8_button", "targetname");
    trapa_death enablelinkto();
    trapa_death linkto(trapa);
    trapb_death enablelinkto();
    trapb_death linkto(trapb);
    trapc_death enablelinkto();
    trapc_death linkto(trapc);
    trap8a_sound = getent ("trap8a_sound", "targetname");
    trap8b_sound = getent ("trap8b_sound", "targetname");
    trap8c_sound = getent ("trap8c_sound", "targetname");
    trap8a_sound enablelinkto();
    trap8a_sound linkto(trapa);
    trap8b_sound enablelinkto();
    trap8b_sound linkto(trapb);
    trap8c_sound enablelinkto();
    trap8c_sound linkto(trapc);

    thread trap8_sound1();
    thread trap8_sound2();
    thread trap8_sound3();

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        for(;;)
        {
            trapa moveZ (54, 0.5);
            trapb moveZ (-54, 0.5);
            trapc moveZ (54, 0.5);
            wait 0.8;
            trapa moveZ (-54, 0.5);
            trapb moveZ (54, 0.5);
            trapc moveZ (-54, 0.5);
            wait 0.8;
        }
    }
}

trap8_sound1() {
    trigger = getent ("trap8a_sound", "targetname");
    sound = getent ("trap8a_sound","targetname");

    while(1) {
        trigger waittill("trigger", player);
        sound playsound ("anubis_spark");
        wait 1;
    }
}
trap8_sound2() {
    trigger = getent ("trap8b_sound", "targetname");
    sound = getent ("trap8b_sound","targetname");

    while(1) {
        trigger waittill("trigger", player);
        sound playsound ("anubis_spark");
        wait 1;
    }
}
trap8_sound3() {
    trigger = getent ("trap8c_sound", "targetname");
    sound = getent ("trap8c_sound","targetname");

    while(1) {
        trigger waittill("trigger", player);
        sound playsound ("anubis_spark");
        wait 1;
    }
}


trap9()
{
    trig = getent ("trig_trap9", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap_right = getent ("trap9_a", "targetname");
    trap_left = getent ("trap9_b", "targetname");
    trapbutton = getent ("trap9_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        trap_left moveY(-136, 2);
        trap_right moveY(136, 2);
        wait 3;
        for(;;)
        {
            trap_left moveY(136, 1);
            thread trap9_sound1();
            trap_right moveY(-136, 1);
            thread trap9_sound2();
            wait 2;
            trap_left moveY(-136, 1);
            thread trap9_sound1_b();
            trap_right moveY(136, 1);
            thread trap9_sound2_b();
            wait 2;
        }
    }
}

trap9_sound1()
{
    sound = getent ("trap9_sound1","targetname");
    sound playsound ("anubis_plateform");
}
trap9_sound1_b()
{
    sound = getent ("trap9_sound1","targetname");
    sound playsound ("anubis_plateform_back");
}
trap9_sound2()
{
    sound = getent ("trap9_sound2","targetname");
    sound playsound ("anubis_plateform");
}
trap9_sound2_b()
{
    sound = getent ("trap9_sound2","targetname");
    sound playsound ("anubis_plateform_back");
}




trap10()
{
    wait 2;
    trap_right = getent ("trap10_a", "targetname");
    trap_left = getent ("trap10_b", "targetname");

    o1 = getent("trap10_sound1","targetname");
    o2 = getent("trap10_sound2","targetname");


    trap_right moveTo(o1.origin, 1);
    trap_left moveTo(o2.origin, 1);

    trig = getent ("trig_trap10", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap10_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        for(;;)
        {
            trap_left rotateroll(720, 3);
            trap_right rotateroll(-720, 3);
            thread trap10_sound1();
            thread trap10_sound2();
            wait 5.5;
            trap_left rotateroll(-720, 3);
            trap_right rotateroll(720, 3);
            thread trap10_sound1();
            thread trap10_sound2();
            wait 5.5;
        }
    }
}

trap10_sound1()
{
    sound = getent ("trap10_sound1","targetname");
    sound playsound ("anubis_crusher_back");
}
trap10_sound2()
{
    sound = getent ("trap10_sound2","targetname");
    sound playsound ("anubis_crusher_back");
}


trap11()
{
    trap_second_left = getent ("trap11_secondoor_left", "targetname");
    trap_second_right = getent ("trap11_secondoor_right", "targetname");
    trap_first_left = getent ("trap11_firstdoor_left", "targetname");
    trap_first_right = getent ("trap11_firstdoor_right", "targetname");

    trap_second_right_trig = getent ("trap11_secondoor_right_trig", "targetname");
    trap_second_right_trig enablelinkto();
    trap_second_right_trig linkto(trap_second_right);

    trap_second_left_trig = getent ("trap11_secondoor_left_trig", "targetname");
    trap_second_left_trig enablelinkto();
    trap_second_left_trig linkto(trap_second_left);

    trap_first_right_trig = getent ("trap11_firstdoor_right_trig", "targetname");
    trap_first_right_trig enablelinkto();
    trap_first_right_trig linkto(trap_first_right);

    trap_first_left_trig = getent ("trap11_firstdoor_left_trig", "targetname");
    trap_first_left_trig enablelinkto();
    trap_first_left_trig linkto(trap_first_left);

    level.trap11_first = 0;
    thread trap11_init();
    wait 1;
    thread trap11_1();
    trig = getent ("trig_trap11", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap11_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        level.trap11_first = 1;
    }
}

trap11_1()
{
    trap_second_left = getent ("trap11_secondoor_left", "targetname");
    trap_second_right = getent ("trap11_secondoor_right", "targetname");

    wait 1;
    for(;;)
    {
        thread trap11_2();

        trap_second_right moveY(-176, 0.7);
        trap_second_left moveY(176, 0.7);
        wait 0.2;
        thread trap11_sound1_3();
        wait 1.2;
        thread trap11_sound1_1();
        thread trap11_sound1_2();
        wait 0.2;
        trap_second_right moveY(176, 0.7);
        trap_second_left moveY(-176, 0.7);
        wait 1.2;
    }
}

trap11_2()
{
    trap_first_left = getent ("trap11_firstdoor_left", "targetname");
    trap_first_right = getent ("trap11_firstdoor_right", "targetname");

    wait 1.2;
    if (level.trap11_first == 1)
    {
        trap_first_right moveY(-176, 0.7);
        trap_first_left moveY(176, 0.7);
        wait 0.2;
        thread trap11_sound3();
        wait 1.2;
        thread trap11_sound1();
        thread trap11_sound2();
        wait 0.2;
        trap_first_right moveY(176, 0.7);
        trap_first_left moveY(-176, 0.7);
        wait 1.2;
    }
}


trap11_init()
{

    trap_second_right = getent ("trap11_secondoor_right", "targetname");
    trap_first_right = getent ("trap11_firstdoor_right", "targetname");

    trap_second_left = getent ("trap11_secondoor_left", "targetname");
    trap_first_left = getent ("trap11_firstdoor_left", "targetname");

    trap_first_right notsolid();
    trap_second_right notsolid();
    trap_first_left notsolid();
    trap_second_left notsolid();

    trap_first_right hide();
    trap_second_right hide();
    trap_first_left hide();
    trap_second_left hide();

    trap_first_right moveX(-10160, 0.1);
    trap_second_right moveX(-10160, 0.1);
    trap_first_left moveX(-10160, 0.1);
    trap_second_left moveX(-10160, 0.1);
    wait 0.2;
    trap_first_right moveY(1088, 0.1);
    trap_second_right moveY(1088, 0.1);
    trap_first_left moveY(1088, 0.1);
    trap_second_left moveY(1088, 0.1);
    wait 0.2;
    trap_first_right moveZ(960, 0.1);
    trap_second_right moveZ(960, 0.1);
    trap_first_left moveZ(960, 0.1);
    trap_second_left moveZ(960, 0.1);
    wait 0.2;
    trap_first_right solid();
    trap_second_right solid();
    trap_first_left solid();
    trap_second_left solid();

    trap_first_right show();
    trap_second_right show();
    trap_first_left show();
    trap_second_left show();
}

trap11_sound1()
{
    sound = getent ("trap11_sound1","targetname");
    sound playsound ("anubis_plateform");
}
trap11_sound2()
{
    sound = getent ("trap11_sound2","targetname");
    sound playsound ("anubis_plateform");
}
trap11_sound3()
{
    sound = getent ("trap11_sound3","targetname");
    sound playsound ("anubis_crusher2");
}

trap11_sound1_2()
{
    sound = getent ("trap11_sound1_2","targetname");
    sound playsound ("anubis_plateform");
}
trap11_sound1_1()
{
    sound = getent ("trap11_sound1_1","targetname");
    sound playsound ("anubis_plateform");
}
trap11_sound1_3()
{
    sound = getent ("trap11_sound1_3","targetname");
    sound playsound ("anubis_crusher2");
}

trap12()
{
    trig = getent ("trig_trap12", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap12_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        thread trap12_a();
        thread trap12_b();
        thread trap12_c();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
    }
}

trap12_a()
{
    trig = getent ("trap12_a_trig", "targetname");
    trap_a = getent ("trap12_a", "targetname");
    trig waittill("trigger", player);
    while(1)
    {
        trig waittill("trigger", player);
        trap_a moveZ (-55, 1);
        thread trap12_sound1();
        wait 1.5;
        trap_a moveZ (55, 1);
        wait 1.5;
    }
}

trap12_b()
{
    trig = getent ("trap12_b_trig", "targetname");
    trap_b = getent ("trap12_b", "targetname");
    trig waittill("trigger", player);
    while(1)
    {
        trig waittill("trigger", player);
        trap_b moveZ (-55, 1);
        thread trap12_sound2();
        wait 1.5;
        trap_b moveZ (55, 1);
        wait 1.5;
    }
}

trap12_c()
{
    trig = getent ("trap12_c_trig", "targetname");
    trap_c = getent ("trap12_c", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trap_c moveZ (-55, 1);
        thread trap12_sound3();
        wait 1.5;
        trap_c moveZ (55, 1);
        wait 1.5;
    }
}

trap12_sound1()
{
    sound = getent ("trap12_sound1","targetname");
    sound playsound ("anubis_plateform");
    wait 1.5;
    sound playsound ("anubis_plateform_back");
}
trap12_sound2()
{
    sound = getent ("trap12_sound2","targetname");
    sound playsound ("anubis_plateform");
    wait 1.5;
    sound playsound ("anubis_plateform_back");
}
trap12_sound3()
{
    sound = getent ("trap12_sound3","targetname");
    sound playsound ("anubis_plateform");
    wait 1.5;
    sound playsound ("anubis_plateform_back");
}


trap13()
{
    trap1 = getent ("trap13_a", "targetname");
    trap2 = getent ("trap13_b", "targetname");
    trap3 = getent ("trap13_c", "targetname");
    trap4 = getent ("trap13_d", "targetname");
    trap5 = getent ("trap13_e", "targetname");

    death_a = getent ("trap13_a_death", "targetname");
    death_a enablelinkto();
    death_a linkto(trap1);
    death_b = getent ("trap13_b_death", "targetname");
    death_b enablelinkto();
    death_b linkto(trap2);
    death_c = getent ("trap13_c_death", "targetname");
    death_c enablelinkto();
    death_c linkto(trap3);
    death_d = getent ("trap13_d_death", "targetname");
    death_d enablelinkto();
    death_d linkto(trap4);
    death_e = getent ("trap13_e_death", "targetname");
    death_e enablelinkto();
    death_e linkto(trap5);

    trap1 moveZ (-126, 0.3);
    trap2 moveZ (-126, 0.3);
    trap3 moveZ (-126, 0.3);
    trap4 moveZ (-126, 0.3);
    trap5 moveZ (-126, 0.3);

    trap1_2 = getent ("trap13_a_2", "targetname");
    trap2_2 = getent ("trap13_b_2", "targetname");
    trap3_2 = getent ("trap13_c_2", "targetname");
    trap4_2 = getent ("trap13_d_2", "targetname");
    trap5_2 = getent ("trap13_e_2", "targetname");

    death_a_2 = getent ("trap13_a_death_2", "targetname");
    death_a_2 enablelinkto();
    death_a_2 linkto(trap1_2);
    death_b_2 = getent ("trap13_b_death_2", "targetname");
    death_b_2 enablelinkto();
    death_b_2 linkto(trap2_2);
    death_c_2 = getent ("trap13_c_death_2", "targetname");
    death_c_2 enablelinkto();
    death_c_2 linkto(trap3_2);
    death_d_2 = getent ("trap13_d_death_2", "targetname");
    death_d_2 enablelinkto();
    death_d_2 linkto(trap4_2);
    death_e_2 = getent ("trap13_e_death_2", "targetname");
    death_e_2 enablelinkto();
    death_e_2 linkto(trap5_2);

    trap1_2 moveZ (-126, 0.3);
    trap2_2 moveZ (-126, 0.3);
    trap3_2 moveZ (-126, 0.3);
    trap4_2 moveZ (-126, 0.3);
    trap5_2 moveZ (-126, 0.3);

    trapbutton = getent ("trap13_button", "targetname");
    trig = getent ("trig_trap13", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap13_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        thread trap13_a();
        thread trap13_b();
        wait 0.5;
        trapbutton moveZ (2, 0.5);
    }
}

trap13_a()
{
    trap1 = getent ("trap13_a", "targetname");
    trap2 = getent ("trap13_b", "targetname");
    trap3 = getent ("trap13_c", "targetname");
    trap4 = getent ("trap13_d", "targetname");
    trap5 = getent ("trap13_e", "targetname");

    death_a = getent ("trap13_a_death", "targetname");
    death_a enablelinkto();
    death_a linkto(trap1);
    death_b = getent ("trap13_b_death", "targetname");
    death_b enablelinkto();
    death_b linkto(trap2);
    death_c = getent ("trap13_c_death", "targetname");
    death_c enablelinkto();
    death_c linkto(trap3);
    death_d = getent ("trap13_d_death", "targetname");
    death_d enablelinkto();
    death_d linkto(trap4);
    death_e = getent ("trap13_e_death", "targetname");
    death_e enablelinkto();
    death_e linkto(trap5);

    while(1)
    {
        for(;;)
        {
            random3 = randomint(5);
            if (random3 == 0)
            {
                trap1 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap13_sound_b_1();
                thread trap13_sound_b_3();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                wait 1;
            }
            if (random3 == 1)
            {
                trap1 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap13_sound_b_1();
                thread trap13_sound_b_4();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                wait 1;
            }
            if (random3 == 2)
            {
                trap2 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap13_sound_b_2();
                thread trap13_sound_b_3();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                wait 1;
            }
            if (random3 == 3)
            {
                trap2 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap13_sound_b_2();
                thread trap13_sound_b_4();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                wait 1;
            }
            if (random3 == 4)
            {
                trap5 moveZ (126, 0.3);
                thread trap13_sound_b_5();
                wait 1;
                trap5 moveZ (-126, 0.3);
                wait 1;
            }
        }
    }
}

trap13_b()
{
    trap1 = getent ("trap13_a_2", "targetname");
    trap2 = getent ("trap13_b_2", "targetname");
    trap3 = getent ("trap13_c_2", "targetname");
    trap4 = getent ("trap13_d_2", "targetname");
    trap5 = getent ("trap13_e_2", "targetname");

    death_a = getent ("trap13_a_death_2", "targetname");
    death_a enablelinkto();
    death_a linkto(trap1);
    death_b = getent ("trap13_b_death_2", "targetname");
    death_b enablelinkto();
    death_b linkto(trap2);
    death_c = getent ("trap13_c_death_2", "targetname");
    death_c enablelinkto();
    death_c linkto(trap3);
    death_d = getent ("trap13_d_death_2", "targetname");
    death_d enablelinkto();
    death_d linkto(trap4);
    death_e = getent ("trap13_e_death_2", "targetname");
    death_e enablelinkto();
    death_e linkto(trap5);


    while(1)
    {
        for(;;)
        {
            random4 = randomint(5);
            if (random4 == 0)
            {
                trap1 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap13_sound_1();
                thread trap13_sound_3();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                wait 1;
            }
            if (random4 == 1)
            {
                trap1 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap13_sound_1();
                thread trap13_sound_4();
                wait 1;
                trap1 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                wait 1;
            }
            if (random4 == 2)
            {
                trap2 moveZ (126, 0.3);
                trap3 moveZ (126, 0.3);
                thread trap13_sound_2();
                thread trap13_sound_3();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap3 moveZ (-126, 0.3);
                wait 1;
            }
            if (random4 == 3)
            {
                trap2 moveZ (126, 0.3);
                trap4 moveZ (126, 0.3);
                thread trap13_sound_2();
                thread trap13_sound_4();
                wait 1;
                trap2 moveZ (-126, 0.3);
                trap4 moveZ (-126, 0.3);
                wait 1;
            }
            if (random4 == 4)
            {
                trap5 moveZ (126, 0.3);
                thread trap13_sound_5();
                wait 1;
                trap5 moveZ (-126, 0.3);
                wait 1;
            }
        }
    }
}

trap13_sound_1()
{
    sound = getent ("trap13_sound_1","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_2()
{
    sound = getent ("trap13_sound_2","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_3()
{
    sound = getent ("trap13_sound_3","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_4()
{
    sound = getent ("trap13_sound_4","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_5()
{
    sound = getent ("trap13_sound_5","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}

trap13_sound_b_1()
{
    sound = getent ("trap13_sound_b_1","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_b_2()
{
    sound = getent ("trap13_sound_b_2","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_b_3()
{
    sound = getent ("trap13_sound_b_3","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_b_4()
{
    sound = getent ("trap13_sound_b_4","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}
trap13_sound_b_5()
{
    sound = getent ("trap13_sound_b_5","targetname");
    sound playsound ("anubis_arrow_on");
    wait 1;
    sound playsound ("anubis_arrow_off");
}

trap14()
{
    trig = getent ("trig_trap14", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trap_a = getent ("trap14_a", "targetname");
    trap_b = getent ("trap14_b", "targetname");
    trap_c = getent ("trap14_c", "targetname");
    trap_d = getent ("trap14_d", "targetname");
    trap_e = getent ("trap14_e", "targetname");
    trap_f = getent ("trap14_f", "targetname");
    trapbutton = getent ("trap14_button", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);

        random_a = randomint(1);
        if (random_a == 0)
        {
           trap_a notsolid();
           trap_a playsound ("anubis_brickfall");
        }
        if (random_a == 1)
        {
            trap_b notsolid();
            trap_b playsound ("anubis_brickfall");
        }
        random_b = randomint(1);
        if (random_b == 0)
        {
           trap_c notsolid();
           trap_c playsound ("anubis_brickfall");
        }
        if (random_b == 1)
        {
            trap_d notsolid();
            trap_d playsound ("anubis_brickfall");
        }
        random_c = randomint(1);
        if (random_c == 0)
        {
           trap_e notsolid();
           trap_e playsound ("anubis_brickfall");
        }
        if (random_c == 1)
        {
            trap_f notsolid();
            trap_f playsound ("anubis_brickfall");
        }
    }
}

trap15()
{


    fan_a = getent ("trap15_a_fan", "targetname");
    fan_b = getent ("trap15_b_fan", "targetname");
    fan_c = getent ("trap15_c_fan", "targetname");

    trigger_a = getent("trap15_trig_a", "targetname");
    trigger_b = getent("trap15_trig_b", "targetname");
    trigger_c = getent("trap15_trig_c", "targetname");

    trapbutton = getent ("trap15_button", "targetname");
    trig = getent ("trig_trap15", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap15_button", "targetname");
    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        thread trap15_a();
        thread trap15_b();
        thread trap15_c();
        fan_a rotateroll(3240, 9);
        fan_b rotateroll(-3240, 9);
        fan_c rotateroll(3240, 9);
        thread trap15_sound_1();
        thread trap15_sound_2();
        thread trap15_sound_3();
        thread trap15_wind_1();
        thread trap15_wind_2();
        thread trap15_wind_3();
        wait 9;
        trigger_a delete();
        trigger_b delete();
        trigger_c delete();

    }
}

trap15_a()
{
    trigger = getent("trap15_trig_a", "targetname");

    while(1)
    {
        trigger waittill ( "trigger", player );
        player thread bounce();
        wait 1;
    }
}

trap15_b()
{
    trigger = getent("trap15_trig_b", "targetname");

    while(1)
    {
        trigger waittill ( "trigger", player );
        player thread bounce();
        wait 1;
    }
}
trap15_c()
{
    trigger = getent("trap15_trig_c", "targetname");

    while(1)
    {
        trigger waittill ( "trigger", player );
        player thread bounce();
        wait 1;
    }
}

trap15_sound_1()
{
    sound1 = getent ("trap15_sound_1","targetname");
    sound1 playsound ("anubis_wind");
    wait 3;
    sound1 playsound ("anubis_wind");
    wait 3;
    sound1 playsound ("anubis_wind");
    wait 3;
}

trap15_sound_2()
{
    sound2 = getent ("trap15_sound_2","targetname");
    sound2 playsound ("anubis_wind");
    wait 3;
    sound2 playsound ("anubis_wind");
    wait 3;
    sound2 playsound ("anubis_wind");
    wait 3;
}

trap15_sound_3()
{
    sound3 = getent ("trap15_sound_3","targetname");
    sound3 playsound ("anubis_wind");
    wait 3;
    sound3 playsound ("anubis_wind");
    wait 3;
    sound3 playsound ("anubis_wind");
    wait 3;
}


trap15_wind_1()
{
    wind = getent ("trap15_wind_1","targetname");
    wind.angles = (0, 270, 0);
    fx = spawnFX(level.wind, wind.origin,wind.angles);

    triggerFX(fx);
    wait 9.5;
    fx delete();
}
trap15_wind_2()
{
    wind = getent ("trap15_wind_2","targetname");
    wind.angles = (0, 270, 0);
    fx = spawnFX(level.wind, wind.origin,wind.angles);

    triggerFX(fx);
    wait 9.5;
    fx delete();
}
trap15_wind_3()
{
    wind = getent ("trap15_wind_3","targetname");
    wind.angles = (0, 270, 0);
    fx = spawnFX(level.wind, wind.origin,wind.angles);

    triggerFX(fx);
    wait 9.5;
    fx delete();
}



bounce()
{
    for(i = 0; i < 4; i++)
    {
        self.health += 100;
        self finishPlayerDamage(self, level.jumpattacker, 100, 0, "MOD_FALLING", "jump_mp", self.origin, AnglesToForward((0,180,0)), "head", 0);
    }
}

trap16()
{
    trig = getent ("trig_trap16", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap16_button", "targetname");

    trap_a = getent ("trap16_a", "targetname");
    trap_b = getent ("trap16_b", "targetname");
    trap_1 = getent ("trap16_1", "targetname");
    trap_2 = getent ("trap16_2", "targetname");


    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        thread trap16_sound_1();
        thread trap16_sound_2();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        trap_1 delete();
        trap_2 delete();
        wait 1.2;
        trap_a moveY(72, 0.35);
        trap_b moveY(-72, 0.35);
        wait 0.35;
        for(;;)
        {
            trap_a moveY(-144, 0.7);
            trap_b moveY(144, 0.7);
            wait 0.7;
            trap_a moveY(144, 0.7);
            trap_b moveY(-144, 0.7);
            wait 0.7;
        }
    }
}

trap16_sound_1()
{
    sound = getent ("trap16_sound1","targetname");
    sound playsound ("anubis_crusher");
}
trap16_sound_2()
{
    sound = getent ("trap16_sound2","targetname");
    sound playsound ("anubis_crusher");
}

trap17init()
{
    trap_1_left = getent ("trap17_left_6", "targetname");
    trap_1_left_trigger = getent ("trap17_left_6_trigger", "targetname");
    trap_1_left_trigger enablelinkto();
    trap_1_left_trigger linkto(trap_1_left);

    trap_2_left = getent ("trap17_left_2", "targetname");
    trap_2_left_trigger = getent ("trap17_left_2_trigger", "targetname");
    trap_2_left_trigger enablelinkto();
    trap_2_left_trigger linkto(trap_2_left);

    trap_3_left = getent ("trap17_left_3", "targetname");
    trap_3_left_trigger = getent ("trap17_left_3_trigger", "targetname");
    trap_3_left_trigger enablelinkto();
    trap_3_left_trigger linkto(trap_3_left);

    trap_7_left = getent ("trap17_left_7", "targetname");
    trap_7_left_trigger = getent ("trap17_left_7_trigger", "targetname");
    trap_7_left_trigger enablelinkto();
    trap_7_left_trigger linkto(trap_7_left);

    trap_1_right = getent ("trap17_right_1", "targetname");
    trap_1_right_trigger = getent ("trap17_right_1_trigger", "targetname");
    trap_1_right_trigger enablelinkto();
    trap_1_right_trigger linkto(trap_1_right);

    trap_2_right = getent ("trap17_right_2", "targetname");
    trap_2_right_trigger = getent ("trap17_right_2_trigger", "targetname");
    trap_2_right_trigger enablelinkto();
    trap_2_right_trigger linkto(trap_2_right);

    trap_3_right = getent ("trap17_right_3", "targetname");
    trap_3_right_trigger = getent ("trap17_right_3_trigger", "targetname");
    trap_3_right_trigger enablelinkto();
    trap_3_right_trigger linkto(trap_3_right);

    trap_1_left moveY(64, 0.10);
    trap_2_left moveY(64, 0.10);
    trap_3_left moveY(64, 0.10);
    trap_7_left moveY(64, 0.10);

    trap_1_right moveY(-64, 0.10);
    trap_2_right moveY(-64, 0.10);
    trap_3_right moveY(-64, 0.10);

    wait 0.5;

    trap_1_left moveZ(-32, 0.10);
    trap_2_left moveZ(-32, 0.10);
    trap_3_left moveZ(-32, 0.10);
    trap_7_left moveZ(-32, 0.10);

    trap_1_right moveZ(-32, 0.10);
    trap_2_right moveZ(-32, 0.10);
    trap_3_right moveZ(-32, 0.10);
}

trap17()
{
    trig = getent ("trig_trap17", "targetname");
    trig setHintString ("^3Press [&&1] to activate");
    trapbutton = getent ("trap17_button", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        trig delete();
        trapbutton moveZ (-2, 0.5);
        wait 0.5;
        trapbutton moveZ (2, 0.5);
        thread trap17_left_a();
        wait 0.5;
        thread trap17_right_a();
        wait 0.5;
        thread trap17_left_b();
        wait 0.5;
        thread trap17_right_b();
        wait 0.5;
        thread trap17_left_c();
        wait 0.5;
        thread trap17_right_c();
        wait 0.5;
        thread trap17_left_d();

    }
}

trap17_left_a()
{
    trap_1_left = getent ("trap17_left_6", "targetname");
    trap_1_left_trigger = getent ("trap17_left_6_trigger", "targetname");
    trap_1_left_trigger enablelinkto();
    trap_1_left_trigger linkto(trap_1_left);

    trap_1_left rotateroll(90, 0.7);
    thread trap17_sound_left_a();
    wait 2.5;
    trap_1_left rotateroll(-90, 0.7);
}
trap17_left_b()
{
    trap_2_left = getent ("trap17_left_2", "targetname");
    trap_2_left_trigger = getent ("trap17_left_2_trigger", "targetname");
    trap_2_left_trigger enablelinkto();
    trap_2_left_trigger linkto(trap_2_left);

    trap_2_left rotateroll(90, 0.7);
    thread trap17_sound_left_b();
    wait 2.5;
    trap_2_left rotateroll(-90, 0.7);
}
trap17_left_c()
{
    trap_3_left = getent ("trap17_left_3", "targetname");
    trap_3_left_trigger = getent ("trap17_left_3_trigger", "targetname");
    trap_3_left_trigger enablelinkto();
    trap_3_left_trigger linkto(trap_3_left);

    trap_3_left rotateroll(90, 0.7);
    thread trap17_sound_left_c();
    wait 2.5;
    trap_3_left rotateroll(-90, 0.7);
}
trap17_left_d()
{
    trap_7_left = getent ("trap17_left_7", "targetname");
    trap_7_left_trigger = getent ("trap17_left_7_trigger", "targetname");
    trap_7_left_trigger enablelinkto();
    trap_7_left_trigger linkto(trap_7_left);

    trap_7_left rotateroll(90, 0.7);
    thread trap17_sound_left_d();
    wait 2.5;
    trap_7_left rotateroll(-90, 0.7);
}
trap17_right_a()
{
    trap_1_right = getent ("trap17_right_1", "targetname");
    trap_1_right_trigger = getent ("trap17_right_1_trigger", "targetname");
    trap_1_right_trigger enablelinkto();
    trap_1_right_trigger linkto(trap_1_right);

    trap_1_right rotateroll(-90, 0.7);
    thread trap17_sound_right_a();
    wait 2.5;
    trap_1_right rotateroll(90, 0.7);
}
trap17_right_b()
{
    trap_2_right = getent ("trap17_right_2", "targetname");
    trap_2_right_trigger = getent ("trap17_right_2_trigger", "targetname");
    trap_2_right_trigger enablelinkto();
    trap_2_right_trigger linkto(trap_2_right);

    trap_2_right rotateroll(-90, 0.7);
    thread trap17_sound_right_b();
    wait 2.5;
    trap_2_right rotateroll(90, 0.7);
}
trap17_right_c()
{
    trap_3_right = getent ("trap17_right_3", "targetname");
    trap_3_right_trigger = getent ("trap17_right_3_trigger", "targetname");
    trap_3_right_trigger enablelinkto();
    trap_3_right_trigger linkto(trap_3_right);

    trap_3_right rotateroll(-90, 0.7);
    thread trap17_sound_right_c();
    wait 2.5;
    trap_3_right rotateroll(90, 0.7);
}

trap17_sound_left_a()
{
    sound1 = getent ("trap17_sound_left_a","targetname");
    sound1 playsound ("anubis_coffin");

}
trap17_sound_left_b()
{
    sound2 = getent ("trap17_sound_left_b","targetname");
    sound2 playsound ("anubis_coffin2");
}

trap17_sound_left_c()
{
    sound3 = getent ("trap17_sound_left_c","targetname");
    sound3 playsound ("anubis_coffin");
}

trap17_sound_left_d()
{
    sound4 = getent ("trap17_sound_left_d","targetname");
    sound4 playsound ("anubis_coffin2");
}

trap17_sound_right_a()
{
    sound5 = getent ("trap17_sound_right_a","targetname");
    sound5 playsound ("anubis_coffin");
}
trap17_sound_right_b()
{
    sound6 = getent ("trap17_sound_right_b","targetname");
    sound6 playsound ("anubis_coffin2");
}

trap17_sound_right_c()
{
    sound7 = getent ("trap17_sound_right_c","targetname");
    sound7 playsound ("anubis_coffin");
}


part2_jumper() {
    trigger = getent ("part2_jumper_trigger", "targetname");
    target = getent ("part2_jumper_origin", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
    }
}

part2_activator() {
    trigger = getent ("part2_activator_trigger", "targetname");
    target = getent ("part2_activator_origin", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player freezeControls(1);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
        wait 0.1;
        player freezeControls(0);
    }
}

part1_activator() {
    trigger = getent ("part1_activator_trigger", "targetname");
    target = getent ("part1_activator_origin", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player freezeControls(1);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
        wait 0.1;
        player freezeControls(0);
    }
}

selectionroom()
{
    trig = getEnt ("selectionroom_trigger", "targetname");
    orig = getEnt ("selectionroom_origin", "targetname");

    while (1)
    {
        trig waittill ("trigger", player);
        player takeAllWeapons();
        player setOrigin (orig.origin);
        player setPlayerAngles(orig.angles);
        while (isDefined(player) && isAlive(player))
        wait .05;
    }
}

enddoor() {
    button = getent ("enddoor_button", "targetname");
    trigger = getent ("enddoor_button_trigger", "targetname");
    door1 = getent ("finaldoor1", "targetname");
    door2 = getent ("finaldoor2", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        trigger delete();
        wait 0.1;
        button moveZ(-7, 0.4);
        wait  0.4;
        door1 playsound ("anubis_door1");
        door2 playsound ("anubis_door1");
        wait 0.35;
        door1 moveY (155, 1.5);
        door2 moveY (-155, 1.5);
        iPrintLnBold ("^3" + player.name + " ^7opened the ^3final door");
        wait 1.1;
        door1 playsound ("anubis_crusher");
        door2 playsound ("anubis_crusher");
    }
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^7" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^3" + jumper + " ^7VS^7 " + "^3" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

// ROOMS //

    //BOUNCE ROOM

bounce_room()
{
    level.trigger_bounce = getEnt ("trig_bounce_room", "targetname");

    orig_jumper = getEnt ("bounce_room_ori_jumper", "targetname");
    orig_acti = getEnt ("bounce_room_ori_acti", "targetname");

    while (1)
    {
        level.trigger_bounce setHintString ("^7Press ^3[&&1]^7 to enter ^3Bounce Room");
        level.trigger_bounce waittill ("trigger", player);
        level.trigger_bounce setHintString ("^3" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^3Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^3Let s Go !", 3, 0);
        }
        thread fightHUD("Bounce Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3Bounce Room!");
    }
}

bounce_room_weapon()
{
    thread rpd_bounce_movement();
    trig = getEnt ("trig_bounce_weapon", "targetname");
    trig setHintString ("^7Press ^3[&&1]^7 to get a ^3RPD");
    while (1)
    {
        trig waittill ("trigger", player);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player giveWeapon("rpd_mp");
        player giveMaxAmmo("rpd_mp");
        player switchToWeapon("rpd_mp");
    }
}
rpd_bounce_movement()
{
    rpd = getEnt ("rpd_bounce", "targetname");
    for (;;)
    {
        rpd moveZ (12, 2);
        wait 2;
        rpd moveZ (-12, 2);
        wait 2;
    }
}

bounce_room_activator() {
    trigger = getent ("bounce_room_trig_acti", "targetname");
    target = getent ("bounce_room_ori_acti", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
    }
}

bounce_room_jumper() {
    trigger = getent ("bounce_room_trig_jumper", "targetname");
    target = getent ("bounce_room_ori_jumper", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
    }
}

endTimerRun(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^3" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
        //self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

honorchecker( nickname )
{
    players = getEntArray("player", "classname");
    for ( i = 0; i < players.size; i++ )
        if ( isSubStr( toLower(players[i].name), toLower(nickname) ) )
            return players[i];
}


garbagecheck()
{
    // for(;;)
    // {
    // wait 5;
    // player = thread honorchecker("xM");
    // if (isDefined(player))
    // {
    //     wait 1;
    //     // player setClientDvar( "g_speed", 10 );
    //     player shellshock( "jeepride_ridedeath", 60 );
    //     player setMoveSpeedScale(0.5);
    //     player iPrintLnBold( "^3Sorry but xM members are not allowed to play this map" );
    //     wait 2;
    //     wait 0.2;
    // }
    // }
}

cm_check()
{
    trig = getent ("trig_cmcheck", "targetname");
    button = getent ("button_cmcheck", "targetname");

    while(1)
    {
        trig waittill("trigger", player);
        player = thread honorchecker("CM'");
        if (isDefined(player))
        {
            button moveY (2, 0.5);
            wait 0.5;
            button moveY (-2, 0.5);
            wait 0.5;
            player thread cm_weapon();
        }
    }
}

cm_weapon()
{
    self iPrintLnBold( "^3Loading..." );
    wait 2;
    self iPrintLnBold( "^3You^7 seem to be a ^3CM Member" );
    wait 2;
    self iPrintLnBold( "^3Here^7 is your free ^3Karambit" );
    wait 1;
    self giveWeapon("tomahawk_mp");
    self switchToWeapon("tomahawk_mp");
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

// rpg ROOM

rpg_room()
{
    level.trigger_rpg = getEnt ("trig_rpg_room", "targetname");

    orig_jumper = getEnt ("rpgroomjumper", "targetname");
    orig_acti = getEnt ("rpgroomactivator", "targetname");

    while (1)
    {
        level.trigger_rpg setHintString ("^7Press ^3[&&1]^7 to enter ^3RPG Room");
        level.trigger_rpg waittill ("trigger", player);
        level.trigger_rpg setHintString ("^3" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("rpg_mp");
        player giveMaxAmmo("rpg_mp");
        player switchToWeapon("rpg_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^3Let s Go !", 3, 0);
        player thread rpg_ammo();

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("rpg_mp");
            level.activ giveMaxAmmo("rpg_mp");
            level.activ switchToWeapon("rpg_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^3Let s Go !", 3, 0);
            level.activ thread rpg_ammo();
        }
        thread fightHUD("RPG Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3RPG Room!");
    }
}


rpg_ammo()
{
    self endon("disconnect");
    self endon("death");

    for (;;)
    {
        if (self getCurrentWeapon() == "rpg_mp")
            self giveMaxAmmo("rpg_mp");

        wait 5;
    }
}

rpg_room_fail()
{
    orig_jumper = getEnt ("rpgroomjumper", "targetname");
    orig_acti = getEnt ("rpgroomactivator", "targetname");
    trig = getEnt ("trig_rpgfail", "targetname");
    for (;;)
    {
        trig waittill ("trigger", player);
        if (isDefined(level.activ) && player == level.activ)
        {
            level.activ setPlayerAngles(orig_acti.angles);
            level.activ setOrigin(orig_acti.origin);
        }
        else
        {
            player setPlayerAngles(orig_jumper.angles);
            player setOrigin(orig_jumper.origin);
        }
    }
}

// SNIPER ROOM

scope_room()
{
    level.trigger_scope = getEnt ("trig_sniper_room", "targetname");

    orig_jumper = getEnt ("scoperoomjumper", "targetname");
    orig_acti = getEnt ("scoperoomactivator", "targetname");

    while (1)
    {
        level.trigger_scope setHintString ("^7Press ^3[&&1]^7 to enter ^3Sniper Room");
        level.trigger_scope waittill ("trigger", player);
        level.trigger_scope setHintString ("^3" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerRun("^3Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("remington700_mp");
            level.activ giveMaxAmmo("remington700_mp");
            level.activ giveWeapon("m40a3_mp");
            level.activ giveMaxAmmo("m40a3_mp");
            level.activ switchToWeapon("m40a3_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimerRun("^3Let s Go !", 3, 0);
        }
        thread fightHUD("Sniper Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3Sniper Room!");
    }
}


sniper_room_fail()
{
    orig_jumper = getEnt ("scoperoomjumper", "targetname");
    orig_acti = getEnt ("scoperoomactivator", "targetname");
    trig = getEnt ("trig_sniperfail", "targetname");
    for (;;)
    {
        trig waittill ("trigger", player);
        if (isDefined(level.activ) && player == level.activ)
        {
            level.activ setPlayerAngles(orig_acti.angles);
            level.activ setOrigin(orig_acti.origin);
        }
        else
        {
            player setPlayerAngles(orig_jumper.angles);
            player setOrigin(orig_jumper.origin);
        }
    }
}

    //PURESTRAFE ROOM

purestart()
{
   trigger_strafe = getEnt ("trig_purestrafe_room", "targetname");

    orig_jumper = getEnt ("pure_jumper_origin", "targetname");
    orig_acti = getEnt ("pure_activator_origin", "targetname");

    while (1)
    {
        trigger_strafe setHintString ("^7Press ^3[&&1]^7 to enter ^3PureStrafe Room");
        trigger_strafe waittill ("trigger", player);
        trigger_strafe setHintString ("^3" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon ("knife_mp");
        player.maxhealth = 100;
        player thread endTimerPure("^3Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setPlayerAngles(orig_acti.angles);
            level.activ setOrigin(orig_acti.origin);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ thread endTimerPure("^3Let s Go !", 3, 0);
        }
        thread fightHUD("PureStrafe Room!", player, level.activ);
        thread pureend(player, level.activ);

        while(isAlive(player) && isDefined(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3PureStrafe Room!");
    }
}

pureend(who, who2)
{
    trig = getEnt ("pure_end_trig", "targetname");
    origWin = getEnt ("pure_end_winner", "targetname");
    origLose = getEnt ("pure_end_looser", "targetname");

    while(1)
    {
        trig waittill("trigger", winner);
        winner freezeControls (1);
        winner iPrintLnBold("^3You won !");
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        wait 2;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");


        if (winner == who)
            loser = who2;
        else
            loser = who;

        if (isDefined(loser))
        {
            loser setOrigin (origLose.origin);
            loser setPlayerAngles (origLose.angles);
            loser freezeControls (1);
            loser takeAllWeapons();
        	loser iPrintLnBold("^3You have lost !");
        }
    }
}


    //KNIFE ROOM

knife_room()
{
    level.trigger_knife = getEnt ("trig_knife_room", "targetname");

    orig_jumper = getEnt ("orig_knife_jumper", "targetname");
    orig_acti = getEnt ("orig_knife_activator", "targetname");

    while (1)
    {
        level.trigger_knife setHintString ("^7Press ^3[&&1]^7 to enter ^3Knife Room");
        level.trigger_knife waittill ("trigger", player);
        level.trigger_knife setHintString ("^3" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimerKnife("^3Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            //level.activ thread endTimerKnife("^3Let s Go !", 3, 0);
        }
        thread fightHUD("Knife Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3Knife Room!");
    }
}

endTimerKnife(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^3" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
        //self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

endTimerPure(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^3" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
        //self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

//SIMON SAYS

simonsays()
{
    level.race = getent("trig_simonsay_room", "targetname");
    level.race_acti_tp = getent("actissori","targetname");
    level.race_jumper_tp = getent("jumperssori","targetname");

    black = getent("ss_black", "targetname");
    blue = getent("ss_blue", "targetname");
    blue2 = getent("ss_blue2", "targetname");
    green = getent("ss_green", "targetname");
    yellow = getent("ss_yellow", "targetname");
    orange = getent("ss_orange", "targetname");
    red = getent("ss_red", "targetname");
    purple = getent("ss_purple", "targetname");
    pink = getent("ss_pink", "targetname");

    black hide();
    blue hide();
    blue2 hide();
    green hide();
    yellow hide();
    orange hide();
    red hide();
    purple hide();
    pink hide();

    while(1)
    {
        level.race setHintString("^7Press ^3[&&1]^7 to enter ^3SimonSays Room");
        level.race waittill( "trigger", player );
        if(isDefined(level.actiBusy) && level.actiBusy == 1)
            player iprintlnbold("^3Activator is busy, wait a few seconds");
        else
        {
        if(!isDefined(level.race))
            return;

        if(!isdefined(level.activKills))
            level.playername = player.name;

        //player
        player freezeControls(1);
        player setOrigin(level.race_jumper_tp.origin);
        player setPlayerangles(level.race_jumper_tp.angles);
        player TakeAllWeapons();
        player SetClientDVAR("cg_thirdperson", 1);
        player thread endTimerKnife("^3Let s Go !", 3, 0);

        //acti
        if (isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ freezeControls(1);
            level.activ setOrigin( level.race_acti_tp.origin );
            level.activ setPlayerangles( level.race_acti_tp.angles );
            level.activ TakeAllWeapons();
            level.activ SetClientDVAR("cg_thirdperson", 1);
            level.activ thread endTimerKnife("^3Let s Go !", 3, 0);
        }
        thread fightHUD("Simon Says Room", player, level.activ);

        wait 3;
        thread ss_game(player);
        thread ss_check(player);
        while( isAlive( player ) && isDefined( player ) )
            wait 0.1;
        level.ss_on = 0;

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3Simon Says Room!");
        }
    }
}

ss_check(player)
{
    trig = getent("ss_lose", "targetname");
    level.orig_winner = getent("ss_winner", "targetname");
    level.orig_loser = getent("ss_loser", "targetname");
    trig waittill("trigger", loser);
    level.wall hide();
    level.ss_on = 0;

    if (isDefined(level.activ) && loser == level.activ) //jumper wins
    {
        loser freezeControls(1);
        loser setOrigin( level.orig_loser.origin );
        loser setPlayerAngles( level.orig_loser.angles );
        loser iPrintLnBold("^3You have lost !");

        player freezeControls(1);
        player setOrigin(level.orig_winner.origin);
        player setPlayerAngles(level.orig_winner.angles);
        player iPrintLnBold("^3You won !");
        player SetClientDVAR("cg_thirdperson", 0);
        wait 2;
        player freezeControls(0);

        player giveWeapon("deserteagle_mp");
        player giveMaxAmmo("deserteagle_mp");
        player switchToWeapon("deserteagle_mp");
    }
    else //activator wins
    {
        loser freezeControls(1);
        loser setOrigin( level.orig_loser.origin );
        loser setPlayerAngles( level.orig_loser.angles );
        loser iPrintLnBold("^3You have lost !");

        level.activ freezeControls(1);
        level.activ setOrigin(level.orig_winner.origin);
        level.activ setPlayerAngles(level.orig_winner.angles);
        level.activ iPrintLnBold("^3You won !");
        level.activ SetClientDVAR("cg_thirdperson", 0);
        wait 2;
        level.activ freezeControls(0);

        level.activ giveWeapon("deserteagle_mp");
        level.activ giveMaxAmmo("deserteagle_mp");
        level.activ switchToWeapon("deserteagle_mp");
    }
}

ss_game(player)
{
    black = getent("ss_black", "targetname");
    blue = getent("ss_blue", "targetname");
    blue2 = getent("ss_blue2", "targetname");
    green = getent("ss_green", "targetname");
    yellow = getent("ss_yellow", "targetname");
    orange = getent("ss_orange", "targetname");
    red = getent("ss_red", "targetname");
    purple = getent("ss_purple", "targetname");
    pink = getent("ss_pink", "targetname");

    ss_black = getent("ss_ss_black", "targetname");
    ss_blue = getent("ss_ss_blue", "targetname");
    ss_blue2 = getent("ss_ss_blue2", "targetname");
    ss_green = getent("ss_ss_green", "targetname");
    ss_yellow = getent("ss_ss_yellow", "targetname");
    ss_orange = getent("ss_ss_orange", "targetname");
    ss_red = getent("ss_ss_red", "targetname");
    ss_purple = getent("ss_ss_purple", "targetname");
    ss_pink = getent("ss_ss_pink", "targetname");

    level.ss_on = 1;
    hide = "";
    level.wall = "";
    time = 0;
    length = 3.5;

    while (level.ss_on == 1)
    {
        black hide();
        blue hide();
        blue2 hide();
        green hide();
        yellow hide();
        orange hide();
        red hide();
        purple hide();
        pink hide();

        colour = randomint(9);
        if (colour == 0)
        {
            hide = ss_black;
            level.wall = black;
            black show();
        }
        if (colour == 1)
        {
            hide = ss_blue;
            blue show();
            level.wall = blue;
        }
        if (colour == 2)
        {
            hide = ss_blue2;
            blue2 show();
            level.wall = blue2;
        }
        if (colour == 3)
        {
            hide = ss_green;
            green show();
            level.wall = green;
        }
        if (colour == 4)
        {
            hide = ss_yellow;
            yellow show();
            level.wall = yellow;
        }
        if (colour == 5)
        {
            hide = ss_orange;
            orange show();
            level.wall = orange;
        }
        if (colour == 6)
        {
            hide = ss_red;
            red show();
            level.wall = red;
        }
        if (colour == 7)
        {
            hide = ss_purple;
            purple show();
            level.wall = purple;
        }
        if (colour == 8)
        {
            hide = ss_pink;
            pink show();
            level.wall = pink;
        }

        wait(length);

        ss_black hide();
        ss_blue hide();
        ss_blue2 hide();
        ss_green hide();
        ss_yellow hide();
        ss_orange hide();
        ss_red hide();
        ss_purple hide();
        ss_pink hide();

        ss_black notsolid();
        ss_blue notsolid();
        ss_blue2 notsolid();
        ss_green notsolid();
        ss_yellow notsolid();
        ss_orange notsolid();
        ss_red notsolid();
        ss_purple notsolid();
        ss_pink notsolid();

        hide show();
        hide solid();
        level.wall show();

        wait 3;

        ss_black show();
        ss_blue show();
        ss_blue2 show();
        ss_green show();
        ss_yellow show();
        ss_orange show();
        ss_red show();
        ss_purple show();
        ss_pink show();

        ss_black solid();
        ss_blue solid();
        ss_blue2 solid();
        ss_green solid();
        ss_yellow solid();
        ss_orange solid();
        ss_red solid();
        ss_purple solid();
        ss_pink solid();

        time += 1;
        length -= 0.25;

        if(time == 14 && isAlive(player))
        {
            player iprintlnbold("You both ^3survived^7, now have a ^3knife battle ^7!");
            player giveWeapon("knife_mp");
            player switchToWeapon("knife_mp");
            if (isDefined(level.activ) && isAlive(level.activ))
            {
                level.activ iprintlnbold("You both ^3survived^7, now have a ^3knife battle ^7!");
                level.activ giveWeapon("knife_mp");
                level.activ switchToWeapon("knife_mp");
            }
            level.wall hide();
            level.ss_on = 0;
        }
    }
}

    //Turning ROOM

turningroom()
{
   trigger_turning = getEnt ("trig_turning_room", "targetname");

    orig_jumper = getEnt ("turning_origin_jumper", "targetname");
    orig_acti = getEnt ("turning_origin_activator", "targetname");

    while (1)
    {
        trigger_turning setHintString ("^7Press ^3[&&1]^7 to enter ^3Turning Room");
        trigger_turning waittill ("trigger", player);
        trigger_turning setHintString ("^3" + player.name + "^7 in room!");

        thread turning_wait();
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon ("knife_mp");
        player.maxhealth = 100;
        player thread endTimerPure("^3Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setPlayerAngles(orig_acti.angles);
            level.activ setOrigin(orig_acti.origin);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ thread endTimerPure("^3Let s Go !", 3, 0);
        }
        thread fightHUD("Turning Room!", player, level.activ);
        thread turningend(player, level.activ);

        while(isAlive(player) && isDefined(player))
            wait .05;

        iPrintLnBold ("^3" + player.name + " ^7has died in ^3Turning Room!");
    }
}

turningend(who, who2)
{
    trig = getEnt ("turning_end_trig", "targetname");
    origWin = getEnt ("turning_end_winner", "targetname");
    origLose = getEnt ("turning_end_looser", "targetname");

    while(1)
    {
        trig waittill("trigger", winner);
        winner takeAllWeapons();
        winner setOrigin (origLose.origin);
        winner setPlayerAngles (origLose.angles);
        winner freezeControls (1);
        winner iPrintLnBold("^3You have lost !");

        if (winner == who)
            loser = who2;
        else
            loser = who;

        if (isDefined(loser))
        {
        	loser freezeControls (1);
            loser setOrigin (origWin.origin);
            loser setPlayerAngles (origWin.angles);
            loser takeAllWeapons();
        	loser iPrintLnBold("^3You won !");
        	wait 2;
        	loser freezeControls (0);
            loser giveWeapon("deserteagle_mp");
            loser giveMaxAmmo("deserteagle_mp");
            loser switchToWeapon("deserteagle_mp");
        }
    }
}


turning_wait()
{
    wait 4;
    thread turning_launch();

}
turning_launch()
{
    level.turning_on = 1;
    level.turning_speed = 5;
    for(;;)
    {
        if (level.turning_on == 1)
        {
            thread turning_script();
        }
        wait(level.turning_speed);
    }
}

turning_script()
{
    pillar = getEnt ("turning_room_pillar", "targetname");
    random_pillar = randomint(3);

    if (random_pillar == 0)
    {
        pillar rotateyaw(-360, (level.turning_speed));
        wait(level.turning_speed);
        level.turning_speed = level.turning_speed - 0.20;
    }
    else
    {
        pillar rotateyaw(360, (level.turning_speed));
        wait(level.turning_speed);
        level.turning_speed = level.turning_speed - 0.20;
    }
    if (level.turning_speed < 1)
    {
        level.turning_speed = 1;
    }

}

jumper_karambit()
{
    trig = getEnt ("karambit_jumper", "targetname");
    weapon = getEnt ("karambit_jumper_weapon", "targetname");
    while (1)
    {
        trig waittill ("trigger", player);
        trig delete();
        weapon delete();
        player giveWeapon("tomahawk_mp");
        player switchToWeapon("tomahawk_mp");
        iPrintLnBold ("^3" + player.name + " ^7got the ^3Karambit");
    }
}

    //MESSAGES

message()
{
level waittill("round_started");
wait 3;
iprintlnBold("^3Anubis");
iPrintlnBold("^3Map ^7made by ^3CM'Nobody");
for(;;)
{
wait 60;
x=randomint(10);
if (x==0)
{
iPrintln("^3Map ^7made by ^3CM'Nobody");
}

if (x==1)
{
iPrintLn("^3Current Speed: ^3[^7"+getDvar("g_speed")+"^3]");
}

if (x==2)
{
iPrintln("^7Feel free to join ^3CM Discord >>^7 discord.gg/ssGzUqX ^3<<");
}

if (x==3)
{
iPrintln("^7If you find ^3any bug^7 please ^3report it^7 on my ^3discord^7 : ^3Derazerr | Nobody#3996");
}

if (x==4)
{
iPrintln("^7Feel free to join ^3CM'Deathrun ^3>>^7 51.210.108.39:28960 ^3<<");
}

if (x==5)
{
iPrintln("^7Discord: ^3Derazerr | Nobody#3996 ");
iPrintln("^7Steam: ^3xderazerr");
}

if (x==6)
{
iPrintln("^7Special thanks to ^3ERIK^7, ^3Ohh Rexy^7, ^3CM'Exe ^7for ^3helping");
}

if (x==7)
{
iPrintln("^7Secret room is not faster than ^3normal way");
}

if (x==8)
{
iPrintln("^7Original map from ^3Garrys Mod^7 called ^3Crash Bandicoot Egypt ^7by ^3FireWavezZ");
}

if (x==9)
{
iPrintln("^7Original map from ^3Garrys Mod^7 called ^3Crash Bandicoot Egypt ^7by ^3FireWavezZ");
}

}
}

//SECRET TRIGGERS

jumper_secret_start() {
    trigger = getent ("jumper_start_secret", "targetname");
    target = getent ("secret_origin0", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
        player thread secretTimer();
        player iPrintLnBold ("^3You ^7entered the ^3Secret Way!");
        player.secret = "0";
    }
}



secret1() {
    trigger = getent ("secret_trigger1", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player.secret = "1";
        wait 1;
    }
}
secret2() {
    trigger = getent ("secret_trigger2", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player.secret = "2";
        wait 1;
    }
}
secret3() {
    trigger = getent ("secret_trigger3", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player.secret = "3";
        wait 1;
    }
}
secret4() {
    trigger = getent ("secret_trigger4", "targetname");

    while(1) {
        trigger waittill("trigger", player);
        player.secret = "4";
        wait 1;
    }
}

secretTimer()
{
    self endon("death");
    time=180;
    self endon("end_secret_timer");
    self thread textleft();
    self thread time();
    while(1)
    {
        wait 1;
        time--;
        if(time<=0)
        self suicide();
    }
}

textleft() {
    self endon ("death");
    self endon ("disconnect");
    self.hud_text = newClientHudElem(self);
    self.hud_text.alignX = "center";
    self.hud_text.alignY = "bottom";
    self.hud_text.horzalign = "center";
    self.hud_text.vertalign = "bottom";
    self.hud_text.alpha = 1;
    self.hud_text.x = 0;
    self.hud_text.y = -7;
    self.hud_text.font = "objective";
    self.hud_text.fontscale = 1.5;
    self.hud_text.glowalpha = 0;
    self.hud_text.glowcolor = (0.0, 1.0, 1.0);
    self.hud_text.owner = self;
    self.hud_text setText("^3Time left:");
    self.hud_text thread removehudsondeath();
    wait 180;
    self removeText();
}

time() {
    self endon ("death");
    self endon ("disconnect");
    self.hud_count = newClientHudElem(self);
    self.hud_count endon ("death");
    self.hud_count.alignX = "center";
    self.hud_count.alignY = "bottom";
    self.hud_count.horzalign = "center";
    self.hud_count.vertalign = "bottom";
    self.hud_count.alpha = 1;
    self.hud_count.x = 60;
    self.hud_count.y = -7;
    self.hud_count.font = "objective";
    self.hud_count.fontscale = 1.5;
    self.hud_count.glowalpha = 0;
    self.hud_count.glowcolor = (1,1,1);
    self.hud_count.label = &"&&1";
    self.hud_count.owner = self;
    self.hud_count thread removehudsondeath();
    for(i = 0; i < 180; i++){
        self.hud_count setvalue( 180 - i );
        wait 1;
    }

    self removeCountdown();
}

removeText()
{
    if( isDefined( self.hud_text) )
    {
        self.hud_text destroy();
    }
}

removeCountdown() {
    if( isDefined( self.hud_count) )
    {
        self.hud_count destroy();
    }
}

removehudsondeath() {
    self endon ("death");
    self.owner waittill_any("death", "disconnect");

    if( isDefined( self ) )
    {
        self destroy();
    }

}

secret()
{
    trigger = getent ("secret_trig_fail", "targetname");

    origin0 = getent ("secret_origin0", "targetname");
    origin1 = getent ("secret_origin1", "targetname");
    origin2 = getent ("secret_origin2", "targetname");
    origin3 = getent ("secret_origin3", "targetname");
    origin4 = getent ("secret_origin4", "targetname");
    origin5 = getent ("secret_origin5", "targetname");

    while(1)
    {
        trigger waittill("trigger", player);

        if (player.secret == "0")
        {
            player freezeControls(1);
            player setorigin (origin0.origin);
            player setplayerangles (origin0.angles);
            wait 0.1;
            player freezeControls(0);
        }
        if (player.secret == "1")
        {
            player freezeControls(1);
            player setorigin (origin1.origin);
            player setplayerangles (origin1.angles);
            wait 0.1;
            player freezeControls(0);
        }
        if (player.secret == "2")
        {
            player freezeControls(1);
            player setorigin (origin2.origin);
            player setplayerangles (origin2.angles);
            wait 0.1;
            player freezeControls(0);
        }
        if (player.secret == "3")
        {
            player freezeControls(1);
            player setorigin (origin3.origin);
            player setplayerangles (origin3.angles);
            wait 0.1;
            player freezeControls(0);
        }
        if (player.secret == "4")
        {
            player freezeControls(1);
            player setorigin (origin4.origin);
            player setplayerangles (origin4.angles);
            wait 0.1;
            player freezeControls(0);
        }
    }
}

jumper_secret_end() {
    trigger = getent ("jumper_end_secret", "targetname");
    target = getent ("jumper_end_secret_origin", "targetname");

    for(;;)
    {
        trigger waittill ("trigger", player);
        player notify("end_secret_timer");
        player thread removeCountdown();
        player thread removeText();
        player freezeControls(1);
        player SetOrigin(target.origin);
        player SetPlayerAngles( target.angles );
        wait 0.1;
        player freezeControls(0);
        player iPrintLnBold (" ^3You ^7finished the ^3Secret Way!");
        player giveWeapon("tomahawk_mp");
        player switchToWeapon ("tomahawk_mp");
        player.secret = "0";
        player braxi\_rank::giveRankXP("", 1500);
    }
}
