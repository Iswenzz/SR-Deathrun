//Map made by CM'Nobody
//Original map from Fall Guys Ultimate Knockout called Slimb Climb

// Discord : derazerr
// Steam :  xderazerr
// CM Discord : discord.gg/dv82mEHCY7

#include braxi\_common;
#include common_scripts\utility;
#include braxi\_rank;

main(){
    maps\mp\_load::main();
    maps\mp\mp_dr_fallguys_init::main();
    
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";
    
    precacheItem("rpg_mp");
    precacheItem("usp_silencer_mp");
    precacheShellShock( "jeepride_ridedeath");  

    setDvar("r_gamma","1");
    setDvar("r_specularcolorscale", "1");
    setDvar("r_glowbloomintensity0","1");
    setDvar("r_glowbloomintensity1","1");
    setDvar("r_glowskybleedintensity0","1");
    setDvar("compassmaxrange","1800");
    setDvar("bg_fallDamageMaxHeight", "99999");
    setDvar("bg_fallDamageMinHeight", "99998");

    addTriggerToList("trig_trap1");
    addTriggerToList("trig_trap2");
    addTriggerToList("trig_trap3");
    addTriggerToList("trig_trap4");
    addtriggerTolist("trig_trap5");
    addtriggerTolist("trig_trap6");
    addtriggerTolist("trig_trap7");
    addtriggerTolist("trig_trap8");    
    addtriggerTolist("trig_trap9");

    level.distancescroll = -773;
    level.distancescrollreverse = 773;
    level.speedscroll = 3.29;
    level.distancetime = 0.13;
    level.SlimeRaiseSpeed = 40;

    level.ball_a = true;
    level.ball_b = true;
    level.ball_c = true;
    level.ball_d = true;
    level.ball_e = true;
    level.ball_f = true;
    level.ball_g = true;
    level.ball_h = true;

    level.fallroom_stats = false;
    level.fallroom_speedtrap = 0.4;

    thread water_moving();
    thread buoy_moving();

    thread message();
    
    thread trap1();
    thread trap1_init();
    thread trap2();
    thread trap2_ball();
    thread trap2_init();
    thread trap3_init();
    thread trap3();
    thread trap4();
    thread trap4_scroll();
    thread trap5_init();
    thread trap5();
    thread trap6();
    thread trap7_init();
    thread trap7();
    thread trap8();
    thread trap9();

    thread trap2_ball_a_trigger();
    thread trap2_ball_b_trigger();
    thread trap2_ball_c_trigger();
    thread trap2_ball_d_trigger();
    thread trap2_ball_e_trigger();
    thread trap2_ball_f_trigger();
    thread trap2_ball_g_trigger();
    thread trap2_ball_h_trigger();

    thread trap2_ball_a_trigger_damage();
    thread trap2_ball_b_trigger_damage();
    thread trap2_ball_c_trigger_damage();
    thread trap2_ball_d_trigger_damage();
    thread trap2_ball_e_trigger_damage();
    thread trap2_ball_f_trigger_damage();
    thread trap2_ball_g_trigger_damage();
    thread trap2_ball_h_trigger_damage();

    thread colorspin();

    thread rpg_room();
    thread rpg_room_fail();

    thread sniper_room();
    thread sniper_room_fail();

    thread knife_room();

    thread bounce_room();
    thread bounce_room_weapon();
    thread bounce_room_jumper();
    thread bounce_room_activator();
    thread bounce_room_weapon_movement();

    thread fall_room_init();
    thread fallrun_room();

    thread selectionroom();

    thread trigger_setCheckpointFalse();
    thread trigger_setCheckpointTrue();
    thread trigger_verifyCheckpoint();
    thread default_setCheckpointTrue();

    thread roomsRendering();

    thread radioTriggerJumpers();
    thread radioTriggerActivator();
    thread endMessage();
    thread vipGun();
    thread hardMode();
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

init_test(){
    texture = getent ("texture_groundmap", "targetname");
    texture moveZ(-2560, 0.1);
}

water_moving()
{
    level endon ("slimeRaising");

    texture = getent ("texture_groundmap", "targetname");
    trig = getent ("trig_groundmap", "targetname");

    trig enablelinkto(); 
    trig linkto(texture);
  

    while(1)
    {
        texture moveZ(75, 3, 0.5, 0.5);
        wait 4;
        texture moveZ(-75, 3, 0.5, 0.5);
        wait 4;
    }
    
}

buoy_moving()
{
    level endon ("slimeRaising");

    buoy1 = getent ("buoy1", "targetname");
    buoy2 = getent ("buoy2", "targetname");
    buoy3 = getent ("buoy3", "targetname");
    buoy4 = getent ("buoy4", "targetname");
    buoy5 = getent ("buoy5", "targetname");
    buoy6 = getent ("buoy6", "targetname");

    wait 0.3;

    while(1)
    {
        buoy1 moveZ(75, 3, 0.5, 0.5);
        buoy2 moveZ(75, 3, 0.5, 0.5);
        buoy3 moveZ(75, 3, 0.5, 0.5);
        buoy4 moveZ(75, 3, 0.5, 0.5);
        buoy5 moveZ(75, 3, 0.5, 0.5);
        buoy6 moveZ(75, 3, 0.5, 0.5);
        wait 4;
        buoy1 moveZ(-75, 3, 0.5, 0.5);
        buoy2 moveZ(-75, 3, 0.5, 0.5);
        buoy3 moveZ(-75, 3, 0.5, 0.5);
        buoy4 moveZ(-75, 3, 0.5, 0.5);
        buoy5 moveZ(-75, 3, 0.5, 0.5);
        buoy6 moveZ(-75, 3, 0.5, 0.5);
        wait 4;
    }
    
}


DisableHardMode()
{
    trig = getent ("trig_hardmodeDsiabled", "targetname");
    trig setHintString ("^1HARDMODE has been disabled because you activated one or severals traps");

    trig2 = getent ("trig_hardmode", "targetname");
    trig2 delete();

}
ActivatedHardMode()
{
    trig = getent ("trig_hardmodeDsiabled", "targetname");
    trig setHintString ("^5HardMode activated");

    thread HardModeButton();
    thread HardModeTrapsActivation();
}

hardMode()
{
    trig = getent ("trig_hardmode", "targetname");
    trig setHintString ("^1Press [&&1] to activate HARD MODE (All traps activated and raising ground)");

    while(1) 
    {
        trig waittill("trigger", player);
        thread HardModeButton();
        trig delete();
        thread ActivatedHardMode();
        thread test();
    }
}

trap1()
{
    trig = getent ("trig_trap1", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap1();
        trig delete();
        thread DisableHardMode();

        thread trap1a();
        thread trap1b();
        thread trap1c();
    }
}

trap1_init()
{
    trap1a = getent ("trap1_a", "targetname");
    trap1b = getent ("trap1_b", "targetname");
    trap1c = getent ("trap1_c", "targetname");  

    trap1a_trig = getent ("trap1_a_trig", "targetname");
    trap1b_trig = getent ("trap1_b_trig", "targetname");
    trap1c_trig = getent ("trap1_c_trig", "targetname"); 

    trap1a_trig enablelinkto(); 
    trap1a_trig linkto(trap1a);

    trap1b_trig enablelinkto(); 
    trap1b_trig linkto(trap1b);

    trap1c_trig enablelinkto(); 
    trap1c_trig linkto(trap1c);

    trap1a moveY(184, 0.01);
    trap1b moveY(96, 0.01);
    trap1c moveY(273, 0.01);

}

trap1a()
{
   trap1a = getent ("trap1_a", "targetname");
   trig = getent ("trap1_a_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap1a);

   trap1a moveY(211, 0.58);
   wait 0.58;
   for(;;)
   {
        trap1a moveY(-395, 1); 
        wait 1;
        trap1a moveY(395, 1);
        wait 1;
   }
}

trap1b()
{
   trap1b = getent ("trap1_b", "targetname");
   trig = getent ("trap1_b_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap1b);

   trap1b moveY(-96, 0.24);
   wait 0.24;
   for(;;)
   {
        trap1b moveY(395, 1); 
        wait 1;
        trap1b moveY(-395, 1);
        wait 1;
   }
}

trap1c()
{
   trap1c = getent ("trap1_c", "targetname");
   trig = getent ("trap1_c_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap1c);

   trap1c moveY(122, 0.30);
   wait 0.30;
   for(;;)
   {
        trap1c moveY(-395, 1); 
        wait 1;
        trap1c moveY(395, 1);
        wait 1;
   }
}

trap2_ball_a_trigger()
{
    trig = getent ("trap2_ball_a_trig", "targetname");
    trap2_ball = getent ("trap2_ball_a", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_b_trigger()
{
    trig = getent ("trap2_ball_b_trig", "targetname");
    trap2_ball = getent ("trap2_ball_b", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_c_trigger()
{
    trig = getent ("trap2_ball_c_trig", "targetname");
    trap2_ball = getent ("trap2_ball_c", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_d_trigger()
{
    trig = getent ("trap2_ball_d_trig", "targetname");
    trap2_ball = getent ("trap2_ball_d", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_e_trigger()
{
    trig = getent ("trap2_ball_e_trig", "targetname");
    trap2_ball = getent ("trap2_ball_e", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_f_trigger()
{
    trig = getent ("trap2_ball_f_trig", "targetname");
    trap2_ball = getent ("trap2_ball_f", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_g_trigger()
{
    trig = getent ("trap2_ball_g_trig", "targetname");
    trap2_ball = getent ("trap2_ball_g", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}
trap2_ball_h_trigger()
{
    trig = getent ("trap2_ball_h_trig", "targetname");
    trap2_ball = getent ("trap2_ball_h", "targetname");

    trig enablelinkto(); 
    trig linkto(trap2_ball);
    
}

trap2_ball_a_trigger_damage() {
    trig = getent ("trap2_ball_a_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_a == false)
        {
            player suicide();
        }
    }
}
trap2_ball_b_trigger_damage() {
    trig = getent ("trap2_ball_b_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_b == false)
        {
            player suicide();
        }
    }
}
trap2_ball_c_trigger_damage() {
    trig = getent ("trap2_ball_c_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_c == false)
        {
            player suicide();
        }
    }
}
trap2_ball_d_trigger_damage() {
    trig = getent ("trap2_ball_d_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_d == false)
        {
            player suicide();
        }
    }
}
trap2_ball_e_trigger_damage() {
    trig = getent ("trap2_ball_e_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_e == false)
        {
            player suicide();
        }
    }
}
trap2_ball_f_trigger_damage() {
    trig = getent ("trap2_ball_f_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_f == false)
        {
            player suicide();
        }
    }
}
trap2_ball_g_trigger_damage() {
    trig = getent ("trap2_ball_g_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_g == false)
        {
            player suicide();
        }
    }
}
trap2_ball_h_trigger_damage() {
    trig = getent ("trap2_ball_h_trig", "targetname");
    
    while(1) {
        trig waittill("trigger", player);
        if(level.ball_h == false)
        {
            player suicide();
        }
    }
}

trap2_init()
{
    trap2_size_1 = getent ("trap2_size_1", "targetname");    
    trap2_size_2 = getent ("trap2_size_2", "targetname");  
    trap2_size_3 = getent ("trap2_size_3", "targetname");  
    trap2_size_4 = getent ("trap2_size_4", "targetname");    
    trap2_size_5 = getent ("trap2_size_5", "targetname");  
    trap2_size_6 = getent ("trap2_size_6", "targetname");  
    trap2_size_7 = getent ("trap2_size_7", "targetname"); 

    trap2_size_1 hide();
    trap2_size_2 hide();
    trap2_size_3 hide();
    trap2_size_4 hide();
    trap2_size_5 hide();
    trap2_size_6 hide();
    trap2_size_7 hide();

    trap2_size_1 notSolid();
    trap2_size_2 notSolid();
    trap2_size_3 notSolid();
    trap2_size_4 notSolid();
    trap2_size_5 notSolid();
    trap2_size_6 notSolid();
    trap2_size_7 notSolid();

    trap2_ball_a = getent ("trap2_ball_a", "targetname");
    trap2_ball_b = getent ("trap2_ball_b", "targetname");
    trap2_ball_c = getent ("trap2_ball_c", "targetname");
    trap2_ball_d = getent ("trap2_ball_d", "targetname");
    trap2_ball_e = getent ("trap2_ball_e", "targetname");
    trap2_ball_f = getent ("trap2_ball_f", "targetname");
    trap2_ball_g = getent ("trap2_ball_g", "targetname");
    trap2_ball_h = getent ("trap2_ball_h", "targetname");

    trap2_ball_a hide();
    trap2_ball_b hide();
    trap2_ball_c hide();
    trap2_ball_d hide();
    trap2_ball_e hide();
    trap2_ball_f hide();
    trap2_ball_g hide();
    trap2_ball_h hide();

    trap2_ball_a notSolid();
    trap2_ball_b notSolid();
    trap2_ball_c notSolid();
    trap2_ball_d notSolid();
    trap2_ball_e notSolid();
    trap2_ball_f notSolid();
    trap2_ball_g notSolid();
    trap2_ball_h notSolid();
}

trap2()
{
    trig = getent ("trig_trap2", "targetname");
    trig setHintString ("^5Press [&&1] to activate");
    level.cannon_speed = 0.25;
    level.nextball = 1;

    trap2_size_1 = getent ("trap2_size_1", "targetname");    
    trap2_size_2 = getent ("trap2_size_2", "targetname");  
    trap2_size_3 = getent ("trap2_size_3", "targetname");  
    trap2_size_4 = getent ("trap2_size_4", "targetname");    
    trap2_size_5 = getent ("trap2_size_5", "targetname");  
    trap2_size_6 = getent ("trap2_size_6", "targetname");  
    trap2_size_7 = getent ("trap2_size_7", "targetname"); 

    ori_0 = getent ("trap2_ori_0", "targetname"); 
    ori_1 = getent ("trap2_ori_1", "targetname");    
    ori_2 = getent ("trap2_ori_2", "targetname");  
    ori_3 = getent ("trap2_ori_3", "targetname");  
    ori_4 = getent ("trap2_ori_4", "targetname");    
    ori_5 = getent ("trap2_ori_5", "targetname");  
    ori_6 = getent ("trap2_ori_6", "targetname");  
    ori_7 = getent ("trap2_ori_7", "targetname"); 

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap2();
        trig delete();
        thread DisableHardMode();


        thread trap2_cannon();
    }
}

trap2_ball()
{
    for(;;)
    {
        level waittill("ball");
        thread trap2_ball_a();

        level waittill("ball");
        thread trap2_ball_b();

        level waittill("ball");
        thread trap2_ball_c();

        level waittill("ball");
        thread trap2_ball_d();

        level waittill("ball");
        thread trap2_ball_e();

        level waittill("ball");
        thread trap2_ball_f();
    }
}

trap2_ball_a()
{
    level.ball_a = false;
    trap2_ball = getent ("trap2_ball_a", "targetname");
    ori_middle = getent ("trap2_ori_middle_left", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_left", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_left", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_left", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_left", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_left", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_left", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_left", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_a = true;
}

trap2_ball_b()
{
    level.ball_b = false;
    trap2_ball = getent ("trap2_ball_b", "targetname");
    ori_middle = getent ("trap2_ori_middle_right", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_right", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_right", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_right", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_right", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_right", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_right", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_right", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_b = true;
}


trap2_ball_c()
{
    level.ball_c = false;
    trap2_ball = getent ("trap2_ball_c", "targetname");
    ori_middle = getent ("trap2_ori_middle_left", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_left", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_left", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_left", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_left", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_left", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_left", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_left", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_c = true;
}

trap2_ball_d()
{
    level.ball_d = false;
    trap2_ball = getent ("trap2_ball_d", "targetname");
    ori_middle = getent ("trap2_ori_middle_right", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_right", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_right", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_right", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_right", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_right", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_right", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_right", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_d = true;
}

trap2_ball_e()
{
    level.ball_e = false;
    trap2_ball = getent ("trap2_ball_e", "targetname");
    ori_middle = getent ("trap2_ori_middle_left", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_left", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_left", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_left", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_left", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_left", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_left", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_left", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_e = true;
}

trap2_ball_f()
{
    level.ball_f = false;
    trap2_ball = getent ("trap2_ball_f", "targetname");
    ori_middle = getent ("trap2_ori_middle_right", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_right", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_right", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_right", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_right", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_right", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_right", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_right", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_f = true;
}

trap2_ball_g()
{
    level.ball_g = false;
    trap2_ball = getent ("trap2_ball_g", "targetname");
    ori_middle = getent ("trap2_ori_middle_left", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_left", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_left", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_left", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_left", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_left", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_left", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_left", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_g = true;
}

trap2_ball_h()
{
    level.ball_h = false;
    trap2_ball = getent ("trap2_ball_h", "targetname");
    ori_middle = getent ("trap2_ori_middle_right", "targetname");
    ori_beginning = getent ("trap2_ori_beginning", "targetname");
    ori_change = getent ("trap2_ori_change_right", "targetname");
    

    ori_end_1 = getent ("trap2_ori_end_1_right", "targetname");
    ori_end_2 = getent ("trap2_ori_end_2_right", "targetname");
    ori_end_3 = getent ("trap2_ori_end_3_right", "targetname");
    ori_end_4 = getent ("trap2_ori_end_4_right", "targetname");
    ori_end_5 = getent ("trap2_ori_end_5_right", "targetname");
    ori_end_6 = getent ("trap2_ori_end_6_right", "targetname");

    trap2_ball show();
    trap2_ball rotatePitch(1440, 10);
    trap2_ball moveTo(ori_change.origin, 0.7);
    wait 0.7;
    trap2_ball moveTo(ori_middle.origin, 4.3);
    wait 4.3;
    trap2_ball moveTo(ori_end_1.origin, 1.5);
    wait 1.5;
    trap2_ball moveTo(ori_end_2.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_3.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_4.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_5.origin, 0.35);
    wait 0.35;
    trap2_ball moveTo(ori_end_6.origin, 0.35);
    wait 2.75;

    trap2_ball hide();
    trap2_ball moveTo(ori_beginning.origin, 0.01);
    wait 0.01;
    level.ball_h = true;
}


trap2_rotate_ball()
{
    trap2_size_1 = getent ("trap2_size_1", "targetname");    
    trap2_size_2 = getent ("trap2_size_2", "targetname");  
    trap2_size_3 = getent ("trap2_size_3", "targetname");  
    trap2_size_4 = getent ("trap2_size_4", "targetname");    
    trap2_size_5 = getent ("trap2_size_5", "targetname");  
    trap2_size_6 = getent ("trap2_size_6", "targetname");  
    trap2_size_7 = getent ("trap2_size_7", "targetname");

    trap2_size_1 rotatePitch(90, 1);
    trap2_size_2 rotatePitch(90, 1);
    trap2_size_3 rotatePitch(90, 1);
    trap2_size_4 rotatePitch(90, 1);
    trap2_size_5 rotatePitch(90, 1);
    trap2_size_6 rotatePitch(90, 1);
    trap2_size_7 rotatePitch(90, 1);

}

trap2_cannon()
{
    level.cannon_speed = 0.15;

    trap2_size_1 = getent ("trap2_size_1", "targetname");    
    trap2_size_2 = getent ("trap2_size_2", "targetname");  
    trap2_size_3 = getent ("trap2_size_3", "targetname");  
    trap2_size_4 = getent ("trap2_size_4", "targetname");    
    trap2_size_5 = getent ("trap2_size_5", "targetname");  
    trap2_size_6 = getent ("trap2_size_6", "targetname");  
    trap2_size_7 = getent ("trap2_size_7", "targetname"); 

    ori_0 = getent ("trap2_ori_0", "targetname"); 
    ori_1 = getent ("trap2_ori_1", "targetname");    
    ori_2 = getent ("trap2_ori_2", "targetname");  
    ori_3 = getent ("trap2_ori_3", "targetname");  
    ori_4 = getent ("trap2_ori_4", "targetname");    
    ori_5 = getent ("trap2_ori_5", "targetname");  
    ori_6 = getent ("trap2_ori_6", "targetname");  
    ori_beginning = getent ("trap2_ori_beginning", "targetname"); 
    
    for(;;)
    {
        wait 0.25;

        trap2_size_1 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_0.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_0.origin, (level.cannon_speed));

        wait 0.15;
        trap2_size_1 playsound ("cannon");
        trap2_size_1 show();
        thread trap2_rotate_ball();

        trap2_size_1 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_1.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_1 hide();
        trap2_size_2 show();

        trap2_size_1 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_2.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_2.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_2 hide();
        trap2_size_3 show();

        trap2_size_1 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_3.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_3.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_3 hide();
        trap2_size_4 show();

        trap2_size_1 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_4.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_4.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_4 hide();
        trap2_size_5 show();


        trap2_size_1 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_5.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_5.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_5 hide();
        trap2_size_6 show();


        trap2_size_1 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_6.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_6.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_6 hide();
        trap2_size_7 show();

        trap2_size_1 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_beginning.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_beginning.origin, (level.cannon_speed));

        wait (level.cannon_speed);
        trap2_size_7 hide();
        level notify("ball");

        trap2_size_1 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_2 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_3 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_4 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_5 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_6 moveTo(ori_1.origin, (level.cannon_speed));
        trap2_size_7 moveTo(ori_1.origin, (level.cannon_speed));

        trap2_size_1 rotatePitch(-90, 0.01);
        trap2_size_2 rotatePitch(-90, 0.01);
        trap2_size_3 rotatePitch(-90, 0.01);
        trap2_size_4 rotatePitch(-90, 0.01);
        trap2_size_5 rotatePitch(-90, 0.01);
        trap2_size_6 rotatePitch(-90, 0.01);
        trap2_size_7 rotatePitch(-90, 0.01);

        wait 0.35;
    }
}

trap5_init()
{
    trap5a = getent ("trap5_a", "targetname");
    trap5b = getent ("trap5_b", "targetname");
    trap5c = getent ("trap5_c", "targetname");

    trap5a rotateRoll(360, 1);
    trap5b rotateRoll(360, 1);
    trap5c rotateRoll(360, 1);

    trap5a RotateVelocity( (-5, 0, 0), 0.5);
    trap5b RotateVelocity( (-5, 0, 0), 0.5);
    trap5c RotateVelocity( (-5, 0, 0), 0.5);
}

trap5()
{
    trig = getent ("trig_trap5", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    trap5a = getent ("trap5_a", "targetname");
    trap5b = getent ("trap5_b", "targetname");
    trap5c = getent ("trap5_c", "targetname");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap5();
        trig delete();
        thread DisableHardMode();

        thread trap5_roll();
    }
}

trap5_roll()
{
    trap5a = getent ("trap5_a", "targetname");
    trap5b = getent ("trap5_b", "targetname");
    trap5c = getent ("trap5_c", "targetname");
    for(;;)
    {
        trap5a rotateRoll(720, 5);
        trap5b rotateRoll(720, 5);
        trap5c rotateRoll(720, 5);
        wait 8;
    }
}

trap6()
{
    trig = getent ("trig_trap6", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap6();
        trig delete();
        thread DisableHardMode();

        thread trap6a();
        thread trap6b();
        thread trap6c();
        thread trap6d();
        thread trap6e();
        thread trap6f();
        thread trap6g();
        thread trap6h();
    }
}

trap6a()
{
    trap6a = getent ("trap6_a", "targetname");
    trap6a_trig = getent ("trap6_a_trig", "targetname");
    trap6a_trig enablelinkto(); 
    trap6a_trig linkto(trap6a);

    for(;;)
    {
        trap6a rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6b()
{
    trap6b = getent ("trap6_b", "targetname");
    trap6b_trig = getent ("trap6_b_trig", "targetname");
    trap6b_trig enablelinkto(); 
    trap6b_trig linkto(trap6b);

    for(;;)
    {
        trap6b rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6c()
{
    trap6c = getent ("trap6_c", "targetname");
    trap6c_trig = getent ("trap6_c_trig", "targetname");
    trap6c_trig enablelinkto(); 
    trap6c_trig linkto(trap6c);

    for(;;)
    {
        trap6c rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6d()
{
    trap6d = getent ("trap6_d", "targetname");
    trap6d_trig = getent ("trap6_d_trig", "targetname");
    trap6d_trig enablelinkto(); 
    trap6d_trig linkto(trap6d);

    for(;;)
    {
        trap6d rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6e()
{
    trap6e = getent ("trap6_e", "targetname");
    trap6e_trig = getent ("trap6_e_trig", "targetname");
    trap6e_trig enablelinkto(); 
    trap6e_trig linkto(trap6e);

    for(;;)
    {
        trap6e rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6f()
{
    trap6f = getent ("trap6_f", "targetname");
    trap6f_trig = getent ("trap6_f_trig", "targetname");
    trap6f_trig enablelinkto(); 
    trap6f_trig linkto(trap6f);

    for(;;)
    {
        trap6f rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6g()
{
    trap6g = getent ("trap6_g", "targetname");
    trap6g_trig = getent ("trap6_g_trig", "targetname");
    trap6g_trig enablelinkto(); 
    trap6g_trig linkto(trap6g);

    for(;;)
    {
        trap6g rotateYaw(360, 1.2);
        wait 1.2;
    }
}

trap6h()
{
    trap6h = getent ("trap6_h", "targetname");
    trap6h_trig = getent ("trap6_h_trig", "targetname");
    trap6h_trig enablelinkto(); 
    trap6h_trig linkto(trap6h);

    for(;;)
    {
        trap6h rotateYaw(360, 1.2);
        wait 1.2;
    }
}


trap4()
{
    trig = getent ("trig_trap4", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap4();
        trig delete();
        thread DisableHardMode();

        thread trap4a();
        thread trap4a_antiglitch();
        thread trap4b();
        thread trap4b_antiglitch();
        thread trap4c();
        thread trap4d();
        thread trap4e();
        thread trap4f();
        thread trap4g();
    }
}

trap4a_antiglitch()
{
    trig = getent ("trap4_a_antiglitch_trig", "targetname");
    link = getent ("trap4_a_antiglitch_link", "targetname");
    trig enablelinkto(); 
    trig linkto(link);
}

trap4a_antiglitch_move()
{
    trig = getent ("trap4_a_antiglitch_trig", "targetname");
    link = getent ("trap4_a_antiglitch_link", "targetname");
    trig linkto(link);

    link moveY(-4, 0.01);
    wait 0.40;
    link moveY(4, 0.01);
}

trap4b_antiglitch()
{
    trig = getent ("trap4_b_antiglitch_trig", "targetname");
    link = getent ("trap4_b_antiglitch_link", "targetname");
    trig enablelinkto(); 
    trig linkto(link);
}

trap4b_antiglitch_move()
{
    trig = getent ("trap4_b_antiglitch_trig", "targetname");
    link = getent ("trap4_b_antiglitch_link", "targetname");
    trig linkto(link);

    link moveY(-4, 0.01);
    wait 0.40;
    link moveY(4, 0.01);
}

trap4a()
{
    trap4a = getent ("trap4_a", "targetname");
    trap4a_trig = getent ("trap4_a_trig", "targetname");
    trap4a_trig enablelinkto(); 
    trap4a_trig linkto(trap4a);


    trap4a moveY(126, 0.64);
    wait 0.64;
    thread trap4a_antiglitch_move();
    for(;;)
    {
        trap4a moveY(-333, 1.70);
        wait 1.70;
        trap4a moveY(333, 1.70);
        wait 1.50;
        thread trap4a_antiglitch_move();
        wait 0.20;
    }
}
trap4b()
{
    trap4b = getent ("trap4_b", "targetname");
    trap4b_trig = getent ("trap4_b_trig", "targetname");
    trap4b_trig enablelinkto(); 
    trap4b_trig linkto(trap4b);


    trap4b moveY(-71, 0.36);
    wait 0.36;
    for(;;)
    {
        trap4b moveY(333, 1.70);
        wait 1.50;
        thread trap4b_antiglitch_move();
        wait 0.20;
        trap4b moveY(-333, 1.70);
        wait 1.70;
    }
}


trap4c()
{
    trap4c = getent ("trap4_c", "targetname");
    trap4c_trig = getent ("trap4_c_trig", "targetname");
    trap4c_trig enablelinkto(); 
    trap4c_trig linkto(trap4c);

    trap4c moveY(-175, 0.89);
    wait 0.89;
    for(;;)
    {
        trap4c moveY(333, 1.70);
        wait 1.70;
        trap4c moveY(-333, 1.70);
        wait 1.70;
    }
}

trap4d()
{
    trap4d = getent ("trap4_d", "targetname");
    trap4d_trig = getent ("trap4_d_trig", "targetname");
    trap4d_trig enablelinkto(); 
    trap4d_trig linkto(trap4d);

    trap4d moveY(46, 0.23);
    wait 0.23;
    for(;;)
    {
        trap4d moveY(-333, 1.70);
        wait 1.70;
        trap4d moveY(333, 1.70);
        wait 1.70;
    }
}

trap4e()
{
    trap4e = getent ("trap4_e", "targetname");
    trap4e_trig = getent ("trap4_e_trig", "targetname");
    trap4e_trig enablelinkto(); 
    trap4e_trig linkto(trap4e);

    trap4e moveY(-119, 0.60);
    wait 0.60;
    for(;;)
    {
        trap4e moveY(333, 1.70);
        wait 1.70;
        trap4e moveY(-333, 1.70);
        wait 1.70;
    }
}

trap4f()
{
    trap4f = getent ("trap4_f", "targetname");
    trap4f_trig = getent ("trap4_f_trig", "targetname");
    trap4f_trig enablelinkto(); 
    trap4f_trig linkto(trap4f);

    trap4f moveY(118, 0.60);
    wait 0.60;
    for(;;)
    {
        trap4f moveY(-333, 1.70);
        wait 1.70;
        trap4f moveY(333, 1.70);
        wait 1.70;
    }
}

trap4g()
{
    trap4g = getent ("trap4_g", "targetname");
    trap4g_trig = getent ("trap4_g_trig", "targetname");
    trap4g_trig enablelinkto(); 
    trap4g_trig linkto(trap4g);

    trap4g moveY(294, 1.50);
    wait 1.50;
    for(;;)
    {
        trap4g moveY(-333, 1.70);
        wait 1.70;
        trap4g moveY(333, 1.70);
        wait 1.70;
    }
}


trap4_scroll()
{
    for(;;)
    {
        thread trap4_scroll_1();
        wait (level.distancetime);
        thread trap4_scroll_2();
        wait (level.distancetime);
        thread trap4_scroll_3();
        wait (level.distancetime);
        thread trap4_scroll_4();
        wait (level.distancetime);
        thread trap4_scroll_5();
        wait (level.distancetime);
        thread trap4_scroll_6();
        wait (level.distancetime);
        thread trap4_scroll_7();
        wait (level.distancetime);
        thread trap4_scroll_8();
        wait (level.distancetime);
        thread trap4_scroll_9();
        wait (level.distancetime);
        thread trap4_scroll_10();
        wait (level.distancetime);
        thread trap4_scroll_11();
        wait (level.distancetime);
        thread trap4_scroll_12();
        wait (level.distancetime);
        thread trap4_scroll_13();
        wait (level.distancetime);
        thread trap4_scroll_14();
        wait (level.distancetime);
        thread trap4_scroll_15();
        wait (level.distancetime);
        thread trap4_scroll_16();
        wait (level.distancetime);
        thread trap4_scroll_17();
        wait (level.distancetime);
        thread trap4_scroll_18();
        wait (level.distancetime);
        thread trap4_scroll_19();
        wait (level.distancetime);
        thread trap4_scroll_20();
        wait (level.distancetime);
        thread trap4_scroll_21();
        wait (level.distancetime);
        thread trap4_scroll_22();
        wait (level.distancetime);
        thread trap4_scroll_23();
        wait (level.distancetime);
        thread trap4_scroll_24();
        wait (level.distancetime);
        thread trap4_scroll_25();
        wait (level.distancetime);
        thread trap4_scroll_26();
        wait (level.distancetime);
        thread trap4_scroll_27();
        wait (level.distancetime);
        thread trap4_scroll_28();
        wait (level.distancetime);
        thread trap4_scroll_29();
        wait (level.distancetime);
        thread trap4_scroll_30();
        wait (level.distancetime);


    }
}


trap4_scroll_1()
{
    trap4_scrollground = getEnt("trap4_scrollground_1", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_2()
{
    trap4_scrollground = getEnt("trap4_scrollground_2", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_3()
{
    trap4_scrollground = getEnt("trap4_scrollground_3", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_4()
{
    trap4_scrollground = getEnt("trap4_scrollground_4", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_5()
{
    trap4_scrollground = getEnt("trap4_scrollground_5", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_6()
{
    trap4_scrollground = getEnt("trap4_scrollground_6", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_7()
{
    trap4_scrollground = getEnt("trap4_scrollground_7", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_8()
{
    trap4_scrollground = getEnt("trap4_scrollground_8", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_9()
{
    trap4_scrollground = getEnt("trap4_scrollground_9", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_10()
{
    trap4_scrollground = getEnt("trap4_scrollground_10", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_11()
{
    trap4_scrollground = getEnt("trap4_scrollground_11", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_12()
{
    trap4_scrollground = getEnt("trap4_scrollground_12", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_13()
{
    trap4_scrollground = getEnt("trap4_scrollground_13", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_14()
{
    trap4_scrollground = getEnt("trap4_scrollground_14", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_15()
{
    trap4_scrollground = getEnt("trap4_scrollground_15", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_16()
{
    trap4_scrollground = getEnt("trap4_scrollground_16", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_17()
{
    trap4_scrollground = getEnt("trap4_scrollground_17", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_18()
{
    trap4_scrollground = getEnt("trap4_scrollground_18", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_19()
{
    trap4_scrollground = getEnt("trap4_scrollground_19", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_20()
{
    trap4_scrollground = getEnt("trap4_scrollground_20", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_21()
{
    trap4_scrollground = getEnt("trap4_scrollground_21", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_22()
{
    trap4_scrollground = getEnt("trap4_scrollground_22", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_23()
{
    trap4_scrollground = getEnt("trap4_scrollground_23", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_24()
{
    trap4_scrollground = getEnt("trap4_scrollground_24", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_25()
{
    trap4_scrollground = getEnt("trap4_scrollground_25", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_26()
{
    trap4_scrollground = getEnt("trap4_scrollground_26", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_27()
{
    trap4_scrollground = getEnt("trap4_scrollground_27", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_28()
{
    trap4_scrollground = getEnt("trap4_scrollground_28", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_29()
{
    trap4_scrollground = getEnt("trap4_scrollground_29", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}
trap4_scroll_30()
{
    trap4_scrollground = getEnt("trap4_scrollground_30", "targetname");
    trap4_scrollground moveY( (level.distancescroll), (level.speedscroll) );
    wait ((level.speedscroll)+0.05);
    trap4_scrollground notSolid();
    trap4_scrollground moveZ(-10, 0.05);
    wait 0.10;
    trap4_scrollground moveY ((level.distancescrollreverse), 0.05);
    wait 0.10;
    trap4_scrollground moveZ(10, 0.05);
    wait 0.10;
}


trap9()
{
    trig = getent ("trig_trap9", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap9();
        trig delete();
        thread DisableHardMode();

        thread trap9a();
        thread trap9b();
        thread trap9c();
    }
}

trap9a()
{
    trapSpeed = 0.60;
    
    trap9_a_1 = getent ("trap9_a_1", "targetname");
    trap9_a_2 = getent ("trap9_a_2", "targetname");
    trap9_a_3 = getent ("trap9_a_3", "targetname");
    trap9_a_link = getent ("trap9_a_link", "targetname");
    trap9_a_damage = getent ("trap9_a_damage", "targetname");

    trap9_a_1 enablelinkto(); 
    trap9_a_1 linkto(trap9_a_link);

    trap9_a_2 enablelinkto(); 
    trap9_a_2 linkto(trap9_a_link);

    trap9_a_damage enablelinkto(); 
    trap9_a_damage linkto(trap9_a_link);

    trap9_a_link rotatePitch(-30, (trapSpeed), 0, 0.30);
    wait (trapSpeed);
    for(;;)
    {
        trap9_a_link rotatePitch(30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_a_link rotatePitch(30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
        trap9_a_link rotatePitch(-30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_a_link rotatePitch(-30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
    }
}

trap9b()
{
    trapSpeed = 0.60;
    
    trap9_b_1 = getent ("trap9_b_1", "targetname");
    trap9_b_2 = getent ("trap9_b_2", "targetname");
    trap9_b_3 = getent ("trap9_b_3", "targetname");
    trap9_b_link = getent ("trap9_b_link", "targetname");
    trap9_b_damage = getent ("trap9_b_damage", "targetname");

    trap9_b_1 enablelinkto(); 
    trap9_b_1 linkto(trap9_b_link);

    trap9_b_2 enablelinkto(); 
    trap9_b_2 linkto(trap9_b_link);

    trap9_b_damage enablelinkto(); 
    trap9_b_damage linkto(trap9_b_link);

    trap9_b_link rotatePitch(-30, (trapSpeed), 0, 0.30);
    wait (trapSpeed);
    for(;;)
    {
        trap9_b_link rotatePitch(30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_b_link rotatePitch(30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
        trap9_b_link rotatePitch(-30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_b_link rotatePitch(-30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
    }
}

trap9c()
{
    trapSpeed = 0.60;

    trap9_c_1 = getent ("trap9_c_1", "targetname");
    trap9_c_2 = getent ("trap9_c_2", "targetname");
    trap9_c_3 = getent ("trap9_c_3", "targetname");
    trap9_c_link = getent ("trap9_c_link", "targetname");
    trap9_c_damage = getent ("trap9_c_damage", "targetname");

    trap9_c_1 enablelinkto(); 
    trap9_c_1 linkto(trap9_c_link);

    trap9_c_2 enablelinkto(); 
    trap9_c_2 linkto(trap9_c_link);

    trap9_c_damage enablelinkto(); 
    trap9_c_damage linkto(trap9_c_link);

    trap9_c_link rotatePitch(-30, (trapSpeed), 0, 0.30);
    wait (trapSpeed);
    for(;;)
    {
        trap9_c_link rotatePitch(30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_c_link rotatePitch(30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
        trap9_c_link rotatePitch(-30, (trapSpeed), 0.30, 0);
        wait (trapSpeed);
        trap9_c_link rotatePitch(-30, (trapSpeed), 0, 0.30);
        wait (trapSpeed);
    }
}
fall_room_init()
{
    thread fall_room_1_1();
    thread fall_room_1_2();
    thread fall_room_1_3();
    thread fall_room_1_4();
    thread fall_room_1_5();
    thread fall_room_1_6();
    thread fall_room_1_7();
    thread fall_room_1_8();
    thread fall_room_1_9();
    thread fall_room_1_10();
    thread fall_room_1_11();
    thread fall_room_1_12();
    thread fall_room_1_13();
    thread fall_room_1_14();
    thread fall_room_1_15();
    thread fall_room_1_16();
    thread fall_room_1_17();
    thread fall_room_1_18();
    thread fall_room_1_19();
    thread fall_room_1_20();
    thread fall_room_1_21();
    thread fall_room_1_22();
    thread fall_room_1_23();
    thread fall_room_1_24();
    thread fall_room_1_25();
    thread fall_room_1_26();
    thread fall_room_1_27();
    thread fall_room_1_28();
    thread fall_room_1_29();
    thread fall_room_1_30();
    thread fall_room_1_31();
    thread fall_room_1_32();
    thread fall_room_1_33();
    thread fall_room_1_34();
    thread fall_room_1_35();
    thread fall_room_1_36();
    thread fall_room_1_37();
    thread fall_room_1_38();
    thread fall_room_1_39();
    thread fall_room_1_40();
    thread fall_room_1_41();
    thread fall_room_1_42();
    thread fall_room_1_43();
    thread fall_room_1_44();
    thread fall_room_1_45();
    thread fall_room_1_46();
    thread fall_room_1_47();
    thread fall_room_1_48();
    thread fall_room_1_49();
    thread fall_room_1_50();
    thread fall_room_1_51();
    thread fall_room_1_52();
    thread fall_room_1_53();
    thread fall_room_1_54();
    thread fall_room_1_55();
    thread fall_room_1_56();
    thread fall_room_1_57();
    thread fall_room_1_58();
    thread fall_room_1_59();
    thread fall_room_1_60();
    thread fall_room_1_61();
    thread fall_room_1_62();
    thread fall_room_1_63();
    thread fall_room_1_64();
    thread fall_room_1_65();
    thread fall_room_1_66();
    thread fall_room_1_67();
    thread fall_room_1_68();
    thread fall_room_1_69();
    thread fall_room_1_70();
    thread fall_room_1_71();
    thread fall_room_1_72();
    thread fall_room_1_73();
    thread fall_room_1_74();
    thread fall_room_1_75();
    thread fall_room_1_76();
    thread fall_room_1_77();

    thread fall_room_2_1();
    thread fall_room_2_2();
    thread fall_room_2_3();
    thread fall_room_2_4();
    thread fall_room_2_5();
    thread fall_room_2_6();
    thread fall_room_2_7();
    thread fall_room_2_8();
    thread fall_room_2_9();
    thread fall_room_2_10();
    thread fall_room_2_11();
    thread fall_room_2_12();
    thread fall_room_2_13();
    thread fall_room_2_14();
    thread fall_room_2_15();
    thread fall_room_2_16();
    thread fall_room_2_17();
    thread fall_room_2_18();
    thread fall_room_2_19();
    thread fall_room_2_20();
    thread fall_room_2_21();
    thread fall_room_2_22();
    thread fall_room_2_23();
    thread fall_room_2_24();
    thread fall_room_2_25();
    thread fall_room_2_26();
    thread fall_room_2_27();
    thread fall_room_2_28();
    thread fall_room_2_29();
    thread fall_room_2_30();
    thread fall_room_2_31();
    thread fall_room_2_32();
    thread fall_room_2_33();
    thread fall_room_2_34();
    thread fall_room_2_35();
    thread fall_room_2_36();
    thread fall_room_2_37();
    thread fall_room_2_38();
    thread fall_room_2_39();
    thread fall_room_2_40();
    thread fall_room_2_41();
    thread fall_room_2_42();
    thread fall_room_2_43();
    thread fall_room_2_44();
    thread fall_room_2_45();
    thread fall_room_2_46();
    thread fall_room_2_47();
    thread fall_room_2_48();
    thread fall_room_2_49();
    thread fall_room_2_50();
    thread fall_room_2_51();
    thread fall_room_2_52();
    thread fall_room_2_53();
    thread fall_room_2_54();
    thread fall_room_2_55();
    thread fall_room_2_56();
    thread fall_room_2_57();
    thread fall_room_2_58();
    thread fall_room_2_59();
    thread fall_room_2_60();
    thread fall_room_2_61();
    thread fall_room_2_62();
    thread fall_room_2_63();
    thread fall_room_2_64();
    thread fall_room_2_65();
    thread fall_room_2_66();
    thread fall_room_2_67();
    thread fall_room_2_68();
    thread fall_room_2_69();
    thread fall_room_2_70();
    thread fall_room_2_71();
    thread fall_room_2_72();
    thread fall_room_2_73();
    thread fall_room_2_74();
    thread fall_room_2_75();
    thread fall_room_2_76();
    thread fall_room_2_77();

    thread fall_room_3_1();
    thread fall_room_3_2();
    thread fall_room_3_3();
    thread fall_room_3_4();
    thread fall_room_3_5();
    thread fall_room_3_6();
    thread fall_room_3_7();
    thread fall_room_3_8();
    thread fall_room_3_9();
    thread fall_room_3_10();
    thread fall_room_3_11();
    thread fall_room_3_15();
    thread fall_room_3_16();
    thread fall_room_3_17();
    thread fall_room_3_18();
    thread fall_room_3_19();
    thread fall_room_3_20();
    thread fall_room_3_26();
    thread fall_room_3_27();
    thread fall_room_3_28();
    thread fall_room_3_29();
    thread fall_room_3_30();
    thread fall_room_3_37();
    thread fall_room_3_38();
    thread fall_room_3_39();
    thread fall_room_3_40();
    thread fall_room_3_41();
    thread fall_room_3_42();
    thread fall_room_3_43();
    thread fall_room_3_44();
    thread fall_room_3_45();
    thread fall_room_3_46();
    thread fall_room_3_47();
    thread fall_room_3_48();
    thread fall_room_3_49();
    thread fall_room_3_50();
    thread fall_room_3_51();
    thread fall_room_3_52();
    thread fall_room_3_53();
    thread fall_room_3_54();
    thread fall_room_3_55();
    thread fall_room_3_56();
    thread fall_room_3_57();
    thread fall_room_3_58();
    thread fall_room_3_59();
    thread fall_room_3_60();
    thread fall_room_3_61();
    thread fall_room_3_62();
    thread fall_room_3_63();
    thread fall_room_3_64();
    thread fall_room_3_65();
    thread fall_room_3_66();
    thread fall_room_3_67();
    thread fall_room_3_68();
    thread fall_room_3_69();
    thread fall_room_3_70();
    thread fall_room_3_71();
    thread fall_room_3_72();
    thread fall_room_3_73();
    thread fall_room_3_74();
    thread fall_room_3_75();
    thread fall_room_3_76();
    thread fall_room_3_77();
}

fall_room_1_1() {
    trigger = getent ("fall_room_trigger_1_1", "targetname");
    target = getent ("fall_room_brush_1_1", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_2() {
    trigger = getent ("fall_room_trigger_1_2", "targetname");
    target = getent ("fall_room_brush_1_2", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_3() {
    trigger = getent ("fall_room_trigger_1_3", "targetname");
    target = getent ("fall_room_brush_1_3", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_4() {
    trigger = getent ("fall_room_trigger_1_4", "targetname");
    target = getent ("fall_room_brush_1_4", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_5() {
    trigger = getent ("fall_room_trigger_1_5", "targetname");
    target = getent ("fall_room_brush_1_5", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_6() {
    trigger = getent ("fall_room_trigger_1_6", "targetname");
    target = getent ("fall_room_brush_1_6", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_7() {
    trigger = getent ("fall_room_trigger_1_7", "targetname");
    target = getent ("fall_room_brush_1_7", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_8() {
    trigger = getent ("fall_room_trigger_1_8", "targetname");
    target = getent ("fall_room_brush_1_8", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_9() {
    trigger = getent ("fall_room_trigger_1_9", "targetname");
    target = getent ("fall_room_brush_1_9", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_10() {
    trigger = getent ("fall_room_trigger_1_10", "targetname");
    target = getent ("fall_room_brush_1_10", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_11() {
    trigger = getent ("fall_room_trigger_1_11", "targetname");
    target = getent ("fall_room_brush_1_11", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_12() {
    trigger = getent ("fall_room_trigger_1_12", "targetname");
    target = getent ("fall_room_brush_1_12", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_13() {
    trigger = getent ("fall_room_trigger_1_13", "targetname");
    target = getent ("fall_room_brush_1_13", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_14() {
    trigger = getent ("fall_room_trigger_1_14", "targetname");
    target = getent ("fall_room_brush_1_14", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_15() {
    trigger = getent ("fall_room_trigger_1_15", "targetname");
    target = getent ("fall_room_brush_1_15", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_16() {
    trigger = getent ("fall_room_trigger_1_16", "targetname");
    target = getent ("fall_room_brush_1_16", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_17() {
    trigger = getent ("fall_room_trigger_1_17", "targetname");
    target = getent ("fall_room_brush_1_17", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_18() {
    trigger = getent ("fall_room_trigger_1_18", "targetname");
    target = getent ("fall_room_brush_1_18", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_19() {
    trigger = getent ("fall_room_trigger_1_19", "targetname");
    target = getent ("fall_room_brush_1_19", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_20() {
    trigger = getent ("fall_room_trigger_1_20", "targetname");
    target = getent ("fall_room_brush_1_20", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_21() {
    trigger = getent ("fall_room_trigger_1_21", "targetname");
    target = getent ("fall_room_brush_1_21", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_22() {
    trigger = getent ("fall_room_trigger_1_22", "targetname");
    target = getent ("fall_room_brush_1_22", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_23() {
    trigger = getent ("fall_room_trigger_1_23", "targetname");
    target = getent ("fall_room_brush_1_23", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_24() {
    trigger = getent ("fall_room_trigger_1_24", "targetname");
    target = getent ("fall_room_brush_1_24", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_25() {
    trigger = getent ("fall_room_trigger_1_25", "targetname");
    target = getent ("fall_room_brush_1_25", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_26() {
    trigger = getent ("fall_room_trigger_1_26", "targetname");
    target = getent ("fall_room_brush_1_26", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_27() {
    trigger = getent ("fall_room_trigger_1_27", "targetname");
    target = getent ("fall_room_brush_1_27", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_28() {
    trigger = getent ("fall_room_trigger_1_28", "targetname");
    target = getent ("fall_room_brush_1_28", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_29() {
    trigger = getent ("fall_room_trigger_1_29", "targetname");
    target = getent ("fall_room_brush_1_29", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_30() {
    trigger = getent ("fall_room_trigger_1_30", "targetname");
    target = getent ("fall_room_brush_1_30", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_31() {
    trigger = getent ("fall_room_trigger_1_31", "targetname");
    target = getent ("fall_room_brush_1_31", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_32() {
    trigger = getent ("fall_room_trigger_1_32", "targetname");
    target = getent ("fall_room_brush_1_32", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_33() {
    trigger = getent ("fall_room_trigger_1_33", "targetname");
    target = getent ("fall_room_brush_1_33", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_34() {
    trigger = getent ("fall_room_trigger_1_34", "targetname");
    target = getent ("fall_room_brush_1_34", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_35() {
    trigger = getent ("fall_room_trigger_1_35", "targetname");
    target = getent ("fall_room_brush_1_35", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_36() {
    trigger = getent ("fall_room_trigger_1_36", "targetname");
    target = getent ("fall_room_brush_1_36", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_37() {
    trigger = getent ("fall_room_trigger_1_37", "targetname");
    target = getent ("fall_room_brush_1_37", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_38() {
    trigger = getent ("fall_room_trigger_1_38", "targetname");
    target = getent ("fall_room_brush_1_38", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_39() {
    trigger = getent ("fall_room_trigger_1_39", "targetname");
    target = getent ("fall_room_brush_1_39", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_40() {
    trigger = getent ("fall_room_trigger_1_40", "targetname");
    target = getent ("fall_room_brush_1_40", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_41() {
    trigger = getent ("fall_room_trigger_1_41", "targetname");
    target = getent ("fall_room_brush_1_41", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_42() {
    trigger = getent ("fall_room_trigger_1_42", "targetname");
    target = getent ("fall_room_brush_1_42", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_43() {
    trigger = getent ("fall_room_trigger_1_43", "targetname");
    target = getent ("fall_room_brush_1_43", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_44() {
    trigger = getent ("fall_room_trigger_1_44", "targetname");
    target = getent ("fall_room_brush_1_44", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_45() {
    trigger = getent ("fall_room_trigger_1_45", "targetname");
    target = getent ("fall_room_brush_1_45", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_46() {
    trigger = getent ("fall_room_trigger_1_46", "targetname");
    target = getent ("fall_room_brush_1_46", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_47() {
    trigger = getent ("fall_room_trigger_1_47", "targetname");
    target = getent ("fall_room_brush_1_47", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_48() {
    trigger = getent ("fall_room_trigger_1_48", "targetname");
    target = getent ("fall_room_brush_1_48", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_49() {
    trigger = getent ("fall_room_trigger_1_49", "targetname");
    target = getent ("fall_room_brush_1_49", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_50() {
    trigger = getent ("fall_room_trigger_1_50", "targetname");
    target = getent ("fall_room_brush_1_50", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_51() {
    trigger = getent ("fall_room_trigger_1_51", "targetname");
    target = getent ("fall_room_brush_1_51", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_52() {
    trigger = getent ("fall_room_trigger_1_52", "targetname");
    target = getent ("fall_room_brush_1_52", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_53() {
    trigger = getent ("fall_room_trigger_1_53", "targetname");
    target = getent ("fall_room_brush_1_53", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_54() {
    trigger = getent ("fall_room_trigger_1_54", "targetname");
    target = getent ("fall_room_brush_1_54", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_55() {
    trigger = getent ("fall_room_trigger_1_55", "targetname");
    target = getent ("fall_room_brush_1_55", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_56() {
    trigger = getent ("fall_room_trigger_1_56", "targetname");
    target = getent ("fall_room_brush_1_56", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_57() {
    trigger = getent ("fall_room_trigger_1_57", "targetname");
    target = getent ("fall_room_brush_1_57", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_58() {
    trigger = getent ("fall_room_trigger_1_58", "targetname");
    target = getent ("fall_room_brush_1_58", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_59() {
    trigger = getent ("fall_room_trigger_1_59", "targetname");
    target = getent ("fall_room_brush_1_59", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_60() {
    trigger = getent ("fall_room_trigger_1_60", "targetname");
    target = getent ("fall_room_brush_1_60", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_61() {
    trigger = getent ("fall_room_trigger_1_61", "targetname");
    target = getent ("fall_room_brush_1_61", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_62() {
    trigger = getent ("fall_room_trigger_1_62", "targetname");
    target = getent ("fall_room_brush_1_62", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_63() {
    trigger = getent ("fall_room_trigger_1_63", "targetname");
    target = getent ("fall_room_brush_1_63", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_64() {
    trigger = getent ("fall_room_trigger_1_64", "targetname");
    target = getent ("fall_room_brush_1_64", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_65() {
    trigger = getent ("fall_room_trigger_1_65", "targetname");
    target = getent ("fall_room_brush_1_65", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_66() {
    trigger = getent ("fall_room_trigger_1_66", "targetname");
    target = getent ("fall_room_brush_1_66", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_67() {
    trigger = getent ("fall_room_trigger_1_67", "targetname");
    target = getent ("fall_room_brush_1_67", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_68() {
    trigger = getent ("fall_room_trigger_1_68", "targetname");
    target = getent ("fall_room_brush_1_68", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_69() {
    trigger = getent ("fall_room_trigger_1_69", "targetname");
    target = getent ("fall_room_brush_1_69", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_70() {
    trigger = getent ("fall_room_trigger_1_70", "targetname");
    target = getent ("fall_room_brush_1_70", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_71() {
    trigger = getent ("fall_room_trigger_1_71", "targetname");
    target = getent ("fall_room_brush_1_71", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_72() {
    trigger = getent ("fall_room_trigger_1_72", "targetname");
    target = getent ("fall_room_brush_1_72", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_73() {
    trigger = getent ("fall_room_trigger_1_73", "targetname");
    target = getent ("fall_room_brush_1_73", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_74() {
    trigger = getent ("fall_room_trigger_1_74", "targetname");
    target = getent ("fall_room_brush_1_74", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_75() {
    trigger = getent ("fall_room_trigger_1_75", "targetname");
    target = getent ("fall_room_brush_1_75", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_76() {
    trigger = getent ("fall_room_trigger_1_76", "targetname");
    target = getent ("fall_room_brush_1_76", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_1_77() {
    trigger = getent ("fall_room_trigger_1_77", "targetname");
    target = getent ("fall_room_brush_1_77", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_1() {
    trigger = getent ("fall_room_trigger_2_1", "targetname");
    target = getent ("fall_room_brush_2_1", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_2() {
    trigger = getent ("fall_room_trigger_2_2", "targetname");
    target = getent ("fall_room_brush_2_2", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_3() {
    trigger = getent ("fall_room_trigger_2_3", "targetname");
    target = getent ("fall_room_brush_2_3", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_4() {
    trigger = getent ("fall_room_trigger_2_4", "targetname");
    target = getent ("fall_room_brush_2_4", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_5() {
    trigger = getent ("fall_room_trigger_2_5", "targetname");
    target = getent ("fall_room_brush_2_5", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_6() {
    trigger = getent ("fall_room_trigger_2_6", "targetname");
    target = getent ("fall_room_brush_2_6", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_7() {
    trigger = getent ("fall_room_trigger_2_7", "targetname");
    target = getent ("fall_room_brush_2_7", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_8() {
    trigger = getent ("fall_room_trigger_2_8", "targetname");
    target = getent ("fall_room_brush_2_8", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_9() {
    trigger = getent ("fall_room_trigger_2_9", "targetname");
    target = getent ("fall_room_brush_2_9", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_10() {
    trigger = getent ("fall_room_trigger_2_10", "targetname");
    target = getent ("fall_room_brush_2_10", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_11() {
    trigger = getent ("fall_room_trigger_2_11", "targetname");
    target = getent ("fall_room_brush_2_11", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_12() {
    trigger = getent ("fall_room_trigger_2_12", "targetname");
    target = getent ("fall_room_brush_2_12", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_13() {
    trigger = getent ("fall_room_trigger_2_13", "targetname");
    target = getent ("fall_room_brush_2_13", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_14() {
    trigger = getent ("fall_room_trigger_2_14", "targetname");
    target = getent ("fall_room_brush_2_14", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_15() {
    trigger = getent ("fall_room_trigger_2_15", "targetname");
    target = getent ("fall_room_brush_2_15", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_16() {
    trigger = getent ("fall_room_trigger_2_16", "targetname");
    target = getent ("fall_room_brush_2_16", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_17() {
    trigger = getent ("fall_room_trigger_2_17", "targetname");
    target = getent ("fall_room_brush_2_17", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_18() {
    trigger = getent ("fall_room_trigger_2_18", "targetname");
    target = getent ("fall_room_brush_2_18", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_19() {
    trigger = getent ("fall_room_trigger_2_19", "targetname");
    target = getent ("fall_room_brush_2_19", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_20() {
    trigger = getent ("fall_room_trigger_2_20", "targetname");
    target = getent ("fall_room_brush_2_20", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_21() {
    trigger = getent ("fall_room_trigger_2_21", "targetname");
    target = getent ("fall_room_brush_2_21", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_22() {
    trigger = getent ("fall_room_trigger_2_22", "targetname");
    target = getent ("fall_room_brush_2_22", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_23() {
    trigger = getent ("fall_room_trigger_2_23", "targetname");
    target = getent ("fall_room_brush_2_23", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_24() {
    trigger = getent ("fall_room_trigger_2_24", "targetname");
    target = getent ("fall_room_brush_2_24", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_25() {
    trigger = getent ("fall_room_trigger_2_25", "targetname");
    target = getent ("fall_room_brush_2_25", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_26() {
    trigger = getent ("fall_room_trigger_2_26", "targetname");
    target = getent ("fall_room_brush_2_26", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_27() {
    trigger = getent ("fall_room_trigger_2_27", "targetname");
    target = getent ("fall_room_brush_2_27", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_28() {
    trigger = getent ("fall_room_trigger_2_28", "targetname");
    target = getent ("fall_room_brush_2_28", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_29() {
    trigger = getent ("fall_room_trigger_2_29", "targetname");
    target = getent ("fall_room_brush_2_29", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_30() {
    trigger = getent ("fall_room_trigger_2_30", "targetname");
    target = getent ("fall_room_brush_2_30", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_31() {
    trigger = getent ("fall_room_trigger_2_31", "targetname");
    target = getent ("fall_room_brush_2_31", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_32() {
    trigger = getent ("fall_room_trigger_2_32", "targetname");
    target = getent ("fall_room_brush_2_32", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_33() {
    trigger = getent ("fall_room_trigger_2_33", "targetname");
    target = getent ("fall_room_brush_2_33", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_34() {
    trigger = getent ("fall_room_trigger_2_34", "targetname");
    target = getent ("fall_room_brush_2_34", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_35() {
    trigger = getent ("fall_room_trigger_2_35", "targetname");
    target = getent ("fall_room_brush_2_35", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_36() {
    trigger = getent ("fall_room_trigger_2_36", "targetname");
    target = getent ("fall_room_brush_2_36", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_37() {
    trigger = getent ("fall_room_trigger_2_37", "targetname");
    target = getent ("fall_room_brush_2_37", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_38() {
    trigger = getent ("fall_room_trigger_2_38", "targetname");
    target = getent ("fall_room_brush_2_38", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_39() {
    trigger = getent ("fall_room_trigger_2_39", "targetname");
    target = getent ("fall_room_brush_2_39", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_40() {
    trigger = getent ("fall_room_trigger_2_40", "targetname");
    target = getent ("fall_room_brush_2_40", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_41() {
    trigger = getent ("fall_room_trigger_2_41", "targetname");
    target = getent ("fall_room_brush_2_41", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_42() {
    trigger = getent ("fall_room_trigger_2_42", "targetname");
    target = getent ("fall_room_brush_2_42", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_43() {
    trigger = getent ("fall_room_trigger_2_43", "targetname");
    target = getent ("fall_room_brush_2_43", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_44() {
    trigger = getent ("fall_room_trigger_2_44", "targetname");
    target = getent ("fall_room_brush_2_44", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_45() {
    trigger = getent ("fall_room_trigger_2_45", "targetname");
    target = getent ("fall_room_brush_2_45", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_46() {
    trigger = getent ("fall_room_trigger_2_46", "targetname");
    target = getent ("fall_room_brush_2_46", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_47() {
    trigger = getent ("fall_room_trigger_2_47", "targetname");
    target = getent ("fall_room_brush_2_47", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_48() {
    trigger = getent ("fall_room_trigger_2_48", "targetname");
    target = getent ("fall_room_brush_2_48", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_49() {
    trigger = getent ("fall_room_trigger_2_49", "targetname");
    target = getent ("fall_room_brush_2_49", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_50() {
    trigger = getent ("fall_room_trigger_2_50", "targetname");
    target = getent ("fall_room_brush_2_50", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_51() {
    trigger = getent ("fall_room_trigger_2_51", "targetname");
    target = getent ("fall_room_brush_2_51", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_52() {
    trigger = getent ("fall_room_trigger_2_52", "targetname");
    target = getent ("fall_room_brush_2_52", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_53() {
    trigger = getent ("fall_room_trigger_2_53", "targetname");
    target = getent ("fall_room_brush_2_53", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_54() {
    trigger = getent ("fall_room_trigger_2_54", "targetname");
    target = getent ("fall_room_brush_2_54", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_55() {
    trigger = getent ("fall_room_trigger_2_55", "targetname");
    target = getent ("fall_room_brush_2_55", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_56() {
    trigger = getent ("fall_room_trigger_2_56", "targetname");
    target = getent ("fall_room_brush_2_56", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_57() {
    trigger = getent ("fall_room_trigger_2_57", "targetname");
    target = getent ("fall_room_brush_2_57", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_58() {
    trigger = getent ("fall_room_trigger_2_58", "targetname");
    target = getent ("fall_room_brush_2_58", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_59() {
    trigger = getent ("fall_room_trigger_2_59", "targetname");
    target = getent ("fall_room_brush_2_59", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_60() {
    trigger = getent ("fall_room_trigger_2_60", "targetname");
    target = getent ("fall_room_brush_2_60", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_61() {
    trigger = getent ("fall_room_trigger_2_61", "targetname");
    target = getent ("fall_room_brush_2_61", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_62() {
    trigger = getent ("fall_room_trigger_2_62", "targetname");
    target = getent ("fall_room_brush_2_62", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_63() {
    trigger = getent ("fall_room_trigger_2_63", "targetname");
    target = getent ("fall_room_brush_2_63", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_64() {
    trigger = getent ("fall_room_trigger_2_64", "targetname");
    target = getent ("fall_room_brush_2_64", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_65() {
    trigger = getent ("fall_room_trigger_2_65", "targetname");
    target = getent ("fall_room_brush_2_65", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_66() {
    trigger = getent ("fall_room_trigger_2_66", "targetname");
    target = getent ("fall_room_brush_2_66", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_67() {
    trigger = getent ("fall_room_trigger_2_67", "targetname");
    target = getent ("fall_room_brush_2_67", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_68() {
    trigger = getent ("fall_room_trigger_2_68", "targetname");
    target = getent ("fall_room_brush_2_68", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_69() {
    trigger = getent ("fall_room_trigger_2_69", "targetname");
    target = getent ("fall_room_brush_2_69", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_70() {
    trigger = getent ("fall_room_trigger_2_70", "targetname");
    target = getent ("fall_room_brush_2_70", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_71() {
    trigger = getent ("fall_room_trigger_2_71", "targetname");
    target = getent ("fall_room_brush_2_71", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_72() {
    trigger = getent ("fall_room_trigger_2_72", "targetname");
    target = getent ("fall_room_brush_2_72", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_73() {
    trigger = getent ("fall_room_trigger_2_73", "targetname");
    target = getent ("fall_room_brush_2_73", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_74() {
    trigger = getent ("fall_room_trigger_2_74", "targetname");
    target = getent ("fall_room_brush_2_74", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_75() {
    trigger = getent ("fall_room_trigger_2_75", "targetname");
    target = getent ("fall_room_brush_2_75", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_76() {
    trigger = getent ("fall_room_trigger_2_76", "targetname");
    target = getent ("fall_room_brush_2_76", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_2_77() {
    trigger = getent ("fall_room_trigger_2_77", "targetname");
    target = getent ("fall_room_brush_2_77", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}

fall_room_3_1() {
    trigger = getent ("fall_room_trigger_3_1", "targetname");
    target = getent ("fall_room_brush_3_1", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_2() {
    trigger = getent ("fall_room_trigger_3_2", "targetname");
    target = getent ("fall_room_brush_3_2", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_3() {
    trigger = getent ("fall_room_trigger_3_3", "targetname");
    target = getent ("fall_room_brush_3_3", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_4() {
    trigger = getent ("fall_room_trigger_3_4", "targetname");
    target = getent ("fall_room_brush_3_4", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_5() {
    trigger = getent ("fall_room_trigger_3_5", "targetname");
    target = getent ("fall_room_brush_3_5", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_6() {
    trigger = getent ("fall_room_trigger_3_6", "targetname");
    target = getent ("fall_room_brush_3_6", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_7() {
    trigger = getent ("fall_room_trigger_3_7", "targetname");
    target = getent ("fall_room_brush_3_7", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_8() {
    trigger = getent ("fall_room_trigger_3_8", "targetname");
    target = getent ("fall_room_brush_3_8", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_9() {
    trigger = getent ("fall_room_trigger_3_9", "targetname");
    target = getent ("fall_room_brush_3_9", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_10() {
    trigger = getent ("fall_room_trigger_3_10", "targetname");
    target = getent ("fall_room_brush_3_10", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_11() {
    trigger = getent ("fall_room_trigger_3_11", "targetname");
    target = getent ("fall_room_brush_3_11", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_15() {
    trigger = getent ("fall_room_trigger_3_15", "targetname");
    target = getent ("fall_room_brush_3_15", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_16() {
    trigger = getent ("fall_room_trigger_3_16", "targetname");
    target = getent ("fall_room_brush_3_16", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_17() {
    trigger = getent ("fall_room_trigger_3_17", "targetname");
    target = getent ("fall_room_brush_3_17", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_18() {
    trigger = getent ("fall_room_trigger_3_18", "targetname");
    target = getent ("fall_room_brush_3_18", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_19() {
    trigger = getent ("fall_room_trigger_3_19", "targetname");
    target = getent ("fall_room_brush_3_19", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_20() {
    trigger = getent ("fall_room_trigger_3_20", "targetname");
    target = getent ("fall_room_brush_3_20", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}


fall_room_3_26() {
    trigger = getent ("fall_room_trigger_3_26", "targetname");
    target = getent ("fall_room_brush_3_26", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_27() {
    trigger = getent ("fall_room_trigger_3_27", "targetname");
    target = getent ("fall_room_brush_3_27", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_28() {
    trigger = getent ("fall_room_trigger_3_28", "targetname");
    target = getent ("fall_room_brush_3_28", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_29() {
    trigger = getent ("fall_room_trigger_3_29", "targetname");
    target = getent ("fall_room_brush_3_29", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_30() {
    trigger = getent ("fall_room_trigger_3_30", "targetname");
    target = getent ("fall_room_brush_3_30", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_37() {
    trigger = getent ("fall_room_trigger_3_37", "targetname");
    target = getent ("fall_room_brush_3_37", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_38() {
    trigger = getent ("fall_room_trigger_3_38", "targetname");
    target = getent ("fall_room_brush_3_38", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_39() {
    trigger = getent ("fall_room_trigger_3_39", "targetname");
    target = getent ("fall_room_brush_3_39", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_40() {
    trigger = getent ("fall_room_trigger_3_40", "targetname");
    target = getent ("fall_room_brush_3_40", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_41() {
    trigger = getent ("fall_room_trigger_3_41", "targetname");
    target = getent ("fall_room_brush_3_41", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_42() {
    trigger = getent ("fall_room_trigger_3_42", "targetname");
    target = getent ("fall_room_brush_3_42", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_43() {
    trigger = getent ("fall_room_trigger_3_43", "targetname");
    target = getent ("fall_room_brush_3_43", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_44() {
    trigger = getent ("fall_room_trigger_3_44", "targetname");
    target = getent ("fall_room_brush_3_44", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_45() {
    trigger = getent ("fall_room_trigger_3_45", "targetname");
    target = getent ("fall_room_brush_3_45", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_46() {
    trigger = getent ("fall_room_trigger_3_46", "targetname");
    target = getent ("fall_room_brush_3_46", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_47() {
    trigger = getent ("fall_room_trigger_3_47", "targetname");
    target = getent ("fall_room_brush_3_47", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_48() {
    trigger = getent ("fall_room_trigger_3_48", "targetname");
    target = getent ("fall_room_brush_3_48", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_49() {
    trigger = getent ("fall_room_trigger_3_49", "targetname");
    target = getent ("fall_room_brush_3_49", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_50() {
    trigger = getent ("fall_room_trigger_3_50", "targetname");
    target = getent ("fall_room_brush_3_50", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_51() {
    trigger = getent ("fall_room_trigger_3_51", "targetname");
    target = getent ("fall_room_brush_3_51", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_52() {
    trigger = getent ("fall_room_trigger_3_52", "targetname");
    target = getent ("fall_room_brush_3_52", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_53() {
    trigger = getent ("fall_room_trigger_3_53", "targetname");
    target = getent ("fall_room_brush_3_53", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_54() {
    trigger = getent ("fall_room_trigger_3_54", "targetname");
    target = getent ("fall_room_brush_3_54", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_55() {
    trigger = getent ("fall_room_trigger_3_55", "targetname");
    target = getent ("fall_room_brush_3_55", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_56() {
    trigger = getent ("fall_room_trigger_3_56", "targetname");
    target = getent ("fall_room_brush_3_56", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_57() {
    trigger = getent ("fall_room_trigger_3_57", "targetname");
    target = getent ("fall_room_brush_3_57", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_58() {
    trigger = getent ("fall_room_trigger_3_58", "targetname");
    target = getent ("fall_room_brush_3_58", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_59() {
    trigger = getent ("fall_room_trigger_3_59", "targetname");
    target = getent ("fall_room_brush_3_59", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_60() {
    trigger = getent ("fall_room_trigger_3_60", "targetname");
    target = getent ("fall_room_brush_3_60", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_61() {
    trigger = getent ("fall_room_trigger_3_61", "targetname");
    target = getent ("fall_room_brush_3_61", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_62() {
    trigger = getent ("fall_room_trigger_3_62", "targetname");
    target = getent ("fall_room_brush_3_62", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_63() {
    trigger = getent ("fall_room_trigger_3_63", "targetname");
    target = getent ("fall_room_brush_3_63", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_64() {
    trigger = getent ("fall_room_trigger_3_64", "targetname");
    target = getent ("fall_room_brush_3_64", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_65() {
    trigger = getent ("fall_room_trigger_3_65", "targetname");
    target = getent ("fall_room_brush_3_65", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_66() {
    trigger = getent ("fall_room_trigger_3_66", "targetname");
    target = getent ("fall_room_brush_3_66", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_67() {
    trigger = getent ("fall_room_trigger_3_67", "targetname");
    target = getent ("fall_room_brush_3_67", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_68() {
    trigger = getent ("fall_room_trigger_3_68", "targetname");
    target = getent ("fall_room_brush_3_68", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_69() {
    trigger = getent ("fall_room_trigger_3_69", "targetname");
    target = getent ("fall_room_brush_3_69", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_70() {
    trigger = getent ("fall_room_trigger_3_70", "targetname");
    target = getent ("fall_room_brush_3_70", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_71() {
    trigger = getent ("fall_room_trigger_3_71", "targetname");
    target = getent ("fall_room_brush_3_71", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_72() {
    trigger = getent ("fall_room_trigger_3_72", "targetname");
    target = getent ("fall_room_brush_3_72", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_73() {
    trigger = getent ("fall_room_trigger_3_73", "targetname");
    target = getent ("fall_room_brush_3_73", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_74() {
    trigger = getent ("fall_room_trigger_3_74", "targetname");
    target = getent ("fall_room_brush_3_74", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_75() {
    trigger = getent ("fall_room_trigger_3_75", "targetname");
    target = getent ("fall_room_brush_3_75", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_76() {
    trigger = getent ("fall_room_trigger_3_76", "targetname");
    target = getent ("fall_room_brush_3_76", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}
fall_room_3_77() {
    trigger = getent ("fall_room_trigger_3_77", "targetname");
    target = getent ("fall_room_brush_3_77", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        if(level.fallroom_stats == true)
        {
        wait (level.fallroom_speedtrap);
        target hide();
        target notSolid();
        level waittill("fallroom_end");
        target show();
        target Solid();
        }
    }
}

selectionroom()
{
    trig = getEnt ("selectionroom_trigger", "targetname");
    orig = getEnt ("selectionroom_origin", "targetname");
    trig setHintString ("^7Press ^5[&&1]^7 to enter ^5Selection room");

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
antiDeathColorSpinRoom()
{
	origin = getent("dmg_lost_colorspin", "targetname");

	self.maxhealth = 150;
    self.health = self.maxhealth;

    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    
    level endon( "spinRoomPlayerLost" );

	for(;;)
	{
		self waittill("damage");
		if(self.health <=50 )	
		{
			self iprintlnbold("^1You lost because you took too much damage !");

			self setOrigin (origin.origin);
        	self setPlayerAngles(origin.angles);

			self.maxhealth = 100;
    		self.health = self.maxhealth;
		}
	}
}

//COLOR SPIN

colorspin_turning_script()
{
    pillar = getEnt ("colorspin_room_pillar", "targetname");
    dmg_trigger = getEnt ("colorspin_room_dmg_pillar", "targetname");
    dmg_trigger enablelinkto(); 
    dmg_trigger linkto(pillar);
    
    pillar rotateyaw(-360, (level.colorspin_speed));
    wait(level.colorspin_speed);
    level.colorspin_speed = level.colorspin_speed - 0.20;

    if (level.colorspin_speed < level.colorspin_maxSpinSpeed)
    {
        level.colorspin_speed = level.colorspin_maxSpinSpeed;
    }

}
colorspin_start()
{
    level endon ("colorspin_finished");

    level.colorspin_on = 1;
    level.colorspin_speed = 4.6;
    level.colorspin_maxSpinSpeed = 1.8;
    wait 3;
    for(;;)
    {
        if (level.colorspin_on == 1)
        {
            thread colorspin_turning_script();
        }
        wait(level.colorspin_speed);
    }
}
colorspin()
{
    level.trigger_colorspin = getent("trig_colorspin_room", "targetname");
    jumper_colorspin = getent("colorspin_room_jumper","targetname");
    acti_colorspin = getent("colorspin_room_acti","targetname");

    grey = getent("ss_grey", "targetname");
    pink = getent("ss_pink", "targetname");
    lightyellow = getent("ss_lightyellow", "targetname");
    cyan = getent("ss_cyan", "targetname");
    green = getent("ss_green", "targetname");
    purple = getent("ss_purple", "targetname");
    blue = getent("ss_blue", "targetname");
    orange = getent("ss_orange", "targetname");
    
    grey hide();
    pink hide();
    lightyellow hide();
    cyan hide();
    green hide();
    purple hide();
    blue hide();
    orange hide();

    while(1)
    {
        level.trigger_colorspin setHintString("^7Press ^5[&&1]^7 to enter ^5ColorSpin Room");
        level.trigger_colorspin waittill ("trigger", player);
        level.trigger_colorspin setHintString ("^5" + player.name + "^7 in room!");

        if(!isdefined(level.activKills))
            level.playername = player.name;
       
        player thread antiDeathColorSpinRoom();
        player freezeControls(1);
        player setOrigin(jumper_colorspin.origin);
        player setPlayerangles(jumper_colorspin.angles);
        player TakeAllWeapons();
        player SetClientDVAR("cg_thirdperson", 1);
        player thread endTimer("^5Let s Go !", 3, 0);
        
        //acti
        if (isDefined(level.activ) && isAlive(level.activ))
        {
        	level.activ thread antiDeathColorSpinRoom();
            level.activ freezeControls(1);
            level.activ setOrigin( acti_colorspin.origin );
            level.activ setPlayerangles( acti_colorspin.angles );
            level.activ TakeAllWeapons();
            level.activ SetClientDVAR("cg_thirdperson", 1); 
            level.activ thread endTimer("^5Let s Go !", 3, 0);
        }
        level.activ thread fightHUD("ColorSpin Room", player, level.activ);
        player thread fightHUD("ColorSpin Room", player, level.activ);

        wait 2;
        thread colorspin_start();        
        wait 3;
        thread ss_game(player);
        thread ss_check(player);
        while( isAlive( player ) && isDefined( player ) )
            wait 0.1;
        level.ss_on = 0;

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5ColorSpin Room!");
        level notify ("colorspin_finished");
        grey hide();
        pink hide();
        lightyellow hide();
        cyan hide();
        green hide();
        purple hide();
        blue hide();
        orange hide();
    }
}

ss_check(player)
{

    trig = getent("ss_lose", "targetname");
    level.orig_winner = getent("orig_knife_activator", "targetname");
    level.orig_loser = getent("orig_knife_jumper", "targetname");
    trig waittill("trigger", loser);
    level.wall hide();
    level.ss_on = 0;

    level notify( "spinRoomPlayerLost" );

    if (isDefined(level.activ) && loser == level.activ) //jumper wins
    {
        loser freezeControls(1);
        loser setOrigin( level.orig_loser.origin );
        loser setPlayerAngles( level.orig_loser.angles );
        loser iPrintLnBold("^5You have lost !");

        level notify ("colorspin_finished");

        player freezeControls(1);   
        player setOrigin(level.orig_winner.origin);
        player setPlayerAngles(level.orig_winner.angles);
        player iPrintLnBold("^5You won !");
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
        loser iPrintLnBold("^5You have lost !");

        level notify ("colorspin_finished");

        level.activ freezeControls(1);   
        level.activ setOrigin(level.orig_winner.origin);
        level.activ setPlayerAngles(level.orig_winner.angles);
        level.activ iPrintLnBold("^5You won !");
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
    level.knife_acti = getent("orig_knife_activator", "targetname");
    level.knife_jumper = getent("orig_knife_jumper", "targetname");

    sign_grey = getent("ss_grey", "targetname");
    sign_pink = getent("ss_pink", "targetname");
    sign_lightyellow = getent("ss_lightyellow", "targetname");
    sign_cyan = getent("ss_cyan", "targetname");
    sign_green = getent("ss_green", "targetname");
    sign_purple = getent("ss_purple", "targetname");
    sign_blue = getent("ss_blue", "targetname");
    sign_orange = getent("ss_orange", "targetname");

    floor_grey = getent("ss_ss_grey", "targetname");
    floor_pink = getent("ss_ss_pink", "targetname");
    floor_lightyellow = getent("ss_ss_lightyellow", "targetname");
    floor_cyan = getent("ss_ss_cyan", "targetname");
    floor_green = getent("ss_ss_green", "targetname");
    floor_purple = getent("ss_ss_purple", "targetname");
    floor_blue = getent("ss_ss_blue", "targetname");
    floor_orange = getent("ss_ss_orange", "targetname");

    level.ss_on = 1;
    hide = "";
    level.wall = "";
    time = 0;
    length = 3.4;

    while (level.ss_on == 1)
    {
        sign_grey hide();
        sign_pink hide();
        sign_lightyellow hide();
        sign_cyan hide();
        sign_green hide();
        sign_purple hide();
        sign_blue hide();
        sign_orange hide();

        colour = randomint(8);

        if (colour == 0)
        {
            hide = floor_grey;
            sign_grey show();
            level.wall = sign_grey;
        }
        if (colour == 1)
        {
            hide = floor_pink;
            sign_pink show();
            level.wall = sign_pink;
        }
        if (colour == 2)
        {
            hide = floor_lightyellow;
            sign_lightyellow show();
            level.wall = sign_lightyellow;
        }
        if (colour == 3)
        {
            hide = floor_cyan;
            sign_cyan show();
            level.wall = sign_cyan;
        }
        if (colour == 4)
        {
            hide = floor_green;
            sign_green show();
            level.wall = sign_green;
        }
        if (colour == 5)
        {
            hide = floor_purple;
            sign_purple show();
            level.wall = sign_purple;
        }
        if (colour == 6)
        {
            hide = floor_blue;
            sign_blue show();
            level.wall = sign_blue;
        }
        if (colour == 7)
        {
            hide = floor_orange;
            sign_orange show();
            level.wall = sign_orange;
        }

        wait(length);

        floor_grey hide();
        floor_pink hide();
        floor_lightyellow hide();
        floor_cyan hide();
        floor_green hide();
        floor_purple hide();
        floor_blue hide();
        floor_orange hide();

        floor_grey notsolid();
        floor_pink notsolid();
        floor_lightyellow notsolid();
        floor_cyan notsolid();
        floor_green notsolid();
        floor_purple notsolid();
        floor_blue notsolid();
        floor_orange notsolid();

        hide show();
        hide solid();
        level.wall show();

        wait 3;

        floor_grey show();
        floor_pink show();
        floor_lightyellow show();
        floor_cyan show();
        floor_green show();
        floor_purple show();
        floor_blue show();
        floor_orange show();

        floor_grey solid();
        floor_pink solid();
        floor_lightyellow solid();
        floor_cyan solid();
        floor_green solid();
        floor_purple solid();
        floor_blue solid();
        floor_orange solid();

        time += 1;
        length -= 0.20;

        if(time == 14 && isAlive(player))
        {
            level notify ("colorspin_finished");

            player iprintlnbold("You both ^5survived^7, now have a ^5knife battle ^7!");
            player giveWeapon("knife_mp");
            player switchToWeapon("knife_mp");
            player SetClientDVAR("cg_thirdperson", 0);

            player setOrigin (level.knife_jumper.origin);
            player setPlayerAngles (level.knife_jumper.angles);

            if (isDefined(level.activ) && isAlive(level.activ))
            {
                level.activ iprintlnbold("You both ^5survived^7, now have a ^5knife battle ^7!");
                level.activ giveWeapon("knife_mp");
                level.activ switchToWeapon("knife_mp");
                level.activ SetClientDVAR("cg_thirdperson", 0);

                level.activ setOrigin (level.knife_acti.origin);
                level.activ setPlayerAngles (level.knife_acti.angles);
            }
            level.wall hide();
            level.ss_on = 0;
        }
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

    hud_fight2 = createHUDpublic( 0, 100, "center", "top", 1, "objective", 1.5 );
    hud_fight2 setText("^5" + jumper + " ^7entered ^5" + room);
    hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(hud_fight2)) hud_fight2 destroy();
}
createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    self.hud = newClientHudElem(self);
    self.hud.x = x;
    self.hud.y = y;
    self.hud.alignX = alignX;
    self.hud.alignY = alignY;
    self.hud.horzalign = alignX;
    self.hud.vertalign = alignY;
    self.hud.alpha = alpha;
    self.hud.font = font;
    self.hud.fontscale = fontScale;
    self.hud.glowalpha = 1;
    self.hud.glowcolor = (0.5,0.5,0.5);

    return self.hud;
}

createHUDpublic( x, y, alignX, alignY, alpha, font, fontScale )
{
    hudpublic = NewHudElem();
    hudpublic.x = x;
    hudpublic.y = y;
    hudpublic.alignX = alignX;
    hudpublic.alignY = alignY;
    hudpublic.horzalign = alignX;
    hudpublic.vertalign = alignY;
    hudpublic.alpha = alpha;
    hudpublic.font = font;
    hudpublic.fontscale = fontScale;
    hudpublic.glowalpha = 1;
    hudpublic.glowcolor = (0.5,0.5,0.5);

    return hudpublic;
}
endTimer(text, duration, extra)
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
        self.endTimerHUD setText("^5" + duration);
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

// rpg ROOM

rpg_room()
{
    level.trigger_rpg = getEnt ("trig_rpg_room", "targetname");

    orig_jumper = getEnt ("rpgroomjumper", "targetname");
    orig_acti = getEnt ("rpgroomactivator", "targetname");

    while (1)
    {
        level.trigger_rpg setHintString ("^7Press ^5[&&1]^7 to enter ^5RPG Room");
        level.trigger_rpg waittill ("trigger", player);
        level.trigger_rpg setHintString ("^5" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("rpg_mp");
        player giveMaxAmmo("rpg_mp");
        player switchToWeapon("rpg_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimer("^5Let s Go !", 3, 0);
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
            level.activ thread endTimer("^5Let s Go !", 3, 0);
            level.activ thread rpg_ammo();
        }
        level.activ thread fightHUD("RPG Room", player, level.activ);
        player thread fightHUD("RPG Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5RPG Room!");
        level notify ("colorspin_finished");
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

sniper_room()
{
    level.trigger_sniper = getEnt ("trig_sniper_room", "targetname");

    orig_jumper = getEnt ("sniper_room_jumper", "targetname");
    orig_acti = getEnt ("sniper_room_activator", "targetname");

    while (1)
    {
        level.trigger_sniper setHintString ("^7Press ^5[&&1]^7 to enter ^5Sniper Room");
        level.trigger_sniper waittill ("trigger", player);
        level.trigger_sniper setHintString ("^5" + player.name + "^7 in room!");

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
        player thread endTimer("^5Let s Go !", 3, 0);

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
            level.activ thread endTimer("^5Let s Go !", 3, 0);
        }
        level.activ thread fightHUD("Sniper Room", player, level.activ);
        player thread fightHUD("Sniper Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Sniper Room!");
    }



}


sniper_room_fail()
{
    orig_jumper = getEnt ("sniper_room_jumper", "targetname");
    orig_acti = getEnt ("sniper_room_activator", "targetname");
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

    //KNIFE ROOM

knife_room()
{
    level.trigger_knife = getEnt ("trig_knife_room", "targetname");

    orig_jumper = getEnt ("orig_knife_jumper", "targetname");
    orig_acti = getEnt ("orig_knife_activator", "targetname");

    while (1)
    {
        level.trigger_knife setHintString ("^7Press ^5[&&1]^7 to enter ^5Knife Room");
        level.trigger_knife waittill ("trigger", player);
        level.trigger_knife setHintString ("^5" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimer("^5Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimer("^5Let s Go !", 3, 0);
        }
        level.activ thread fightHUD("Knife Room", player, level.activ);
        player thread fightHUD("Knife Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Knife Room!");
    }
}

    //BOUNCE ROOM

bounce_room()
{
    level.trigger_bounce = getEnt ("trig_bounce_room", "targetname");

    orig_jumper = getEnt ("bounce_room_orig_jumper", "targetname");
    orig_acti = getEnt ("bounce_room_orig_activator", "targetname");

    while (1)
    {
        level.trigger_bounce setHintString ("^7Press ^5[&&1]^7 to enter ^5Bounce Room");
        level.trigger_bounce waittill ("trigger", player);
        level.trigger_bounce setHintString ("^5" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimer("^5Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ giveWeapon("knife_mp");
            level.activ switchToWeapon("knife_mp");
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimer("^5Let s Go !", 3, 0);
        }
        level.activ thread fightHUD("Bounce Room", player, level.activ);
        player thread fightHUD("Bounce Room", player, level.activ);

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Bounce Room!");
    }
}

bounce_room_weapon()
{
    trig = getEnt ("trig_bounce_weapon", "targetname");
    trig setHintString ("^7Press ^5[&&1]^7 to get a ^5Sniper");
    while (1)
    {
        trig waittill ("trigger", player);
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
    }
}
bounce_room_activator() {
    trigger = getent ("bounce_room_trig_activator", "targetname");
    target = getent ("bounce_room_orig_activator", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
    }
}

bounce_room_jumper() {
    trigger = getent ("bounce_room_trig_jumper", "targetname");
    target = getent ("bounce_room_orig_jumper", "targetname");
    
    while(1) {
        trigger waittill("trigger", player);
        player setorigin (target.origin);
        player setplayerangles (target.angles);
    }
}
bounce_room_weapon_movement()
{
    weapon = getent ("bounce_room_weapon", "targetname");

    for(;;)
    {
        wait 2;
        weapon moveZ(-14,2,1,1);
        wait 2;
        weapon moveZ(14,2,1,1);
    }

}

    //FALLRUN ROOM

fallrun_room()
{
    level.fallroom_stats = false;
    level.trigger_fallrun = getEnt ("trig_fallrun_room", "targetname");

    orig_jumper = getEnt ("fallrun_room_orig_jumper", "targetname");
    orig_acti = getEnt ("fallrun_room_orig_activator", "targetname");

    while (1)
    {
        level.trigger_fallrun setHintString ("^7Press ^5[&&1]^7 to enter ^5Fall Run Room");
        level.trigger_fallrun waittill ("trigger", player);
        level.trigger_fallrun setHintString ("^5" + player.name + "^7 in room!");

        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        player takeAllWeapons();
        player.maxhealth = 100;
        player.health = player.maxhealth;
        player thread endTimer("^5Let s Go !", 3, 0);

        if(isDefined(level.activ) && isAlive(level.activ))
        {
            level.activ setOrigin (orig_acti.origin);
            level.activ setPlayerAngles (orig_acti.angles);
            level.activ takeAllWeapons();
            level.activ.maxhealth = 100;
            level.activ.health = 100;
            level.activ thread endTimer("^5Let s Go !", 3, 0);
        }
        level.activ thread fightHUD("Fall Run Room", player, level.activ);
        player thread fightHUD("Fall Run Room", player, level.activ);

        wait 3;
        thread fallrun_check(player);

        player iprintlnbold("^5Keep moving ^7! ^5Floor ^7will ^5disappear ^7in :");
        level.activ iprintlnbold("^5Keep moving ^7! ^5Floor ^7will ^5disappear ^7in :");
        wait 3;
        player iprintlnbold("^33");
        level.activ iprintlnbold("^33");
        wait 1;
        player iprintlnbold("^22");
        level.activ iprintlnbold("^22");
        wait 1;
        player iprintlnbold("^11");
        level.activ iprintlnbold("^11");
        wait 1;
        player iprintlnbold("^5Move!");
        level.activ iprintlnbold("^5Move!");
        wait 0.5;
        level.fallroom_stats = true;

        while(isDefined(player) && isAlive(player))
            wait .05;

        iPrintLnBold ("^5" + player.name + " ^7has died in ^5Fall Run Room!");
        wait 2;
        level notify ("fallroom_end");
        level.fallroom_stats = false;
    }
}

fallrun_check(player)
{

    trig = getent("fallrun_lose", "targetname");
    level.orig_winner = getent("orig_knife_activator", "targetname");
    level.orig_loser = getent("orig_knife_jumper", "targetname");
    trig waittill("trigger", loser);
    
    if (isDefined(level.activ) && loser == level.activ) //jumper wins
    {
        loser freezeControls(1);
        loser setOrigin( level.orig_loser.origin );
        loser setPlayerAngles( level.orig_loser.angles );
        loser iPrintLnBold("^5You have lost !");

        level notify ("colorspin_finished");

        player freezeControls(1);   
        player setOrigin(level.orig_winner.origin);
        player setPlayerAngles(level.orig_winner.angles);
        player iPrintLnBold("^5You won !");
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
        loser iPrintLnBold("^5You have lost !");

        level.activ freezeControls(1);   
        level.activ setOrigin(level.orig_winner.origin);
        level.activ setPlayerAngles(level.orig_winner.angles);
        level.activ iPrintLnBold("^5You won !");
        level.activ SetClientDVAR("cg_thirdperson", 0);
        wait 2;
        level.activ freezeControls(0);
        
        level.activ giveWeapon("deserteagle_mp");
        level.activ giveMaxAmmo("deserteagle_mp");
        level.activ switchToWeapon("deserteagle_mp");
    }
    level notify ("fallroom_end");
    level.fallroom_stats = false;
}

trigger_setCheckpointTrue()
{
	trigger = getent ("trigger_checkpointTrue", "targetname");
	while(1) {
		trigger waittill("trigger", player);
		player.checkpoint = true;
	}	
}
trigger_setCheckpointFalse()
{
    trigger = getent ("trigger_checkpointFalse", "targetname");
    while(1) {
        trigger waittill("trigger", player);
        player.checkpoint = false;
    }   
}


trigger_verifyCheckpoint()
{
	trigger = getent ("trigger_verifyCheckpoint", "targetname");

	while(1) {
		trigger waittill("trigger", player);

        if(player.checkpoint != true)
        {
            orig = player.origin - (0,50,0);
            player setOrigin (orig);
            player freezeControls(1);
            wait 0.25;
            player freezeControls(0);
            player SetMoveSpeedScale( 0 );
            player allowJump(false);

			player iprintlnbold("^1You are not allowed to use this shortcut");
			wait 0.5;

            player allowJump(true);
			player SetMoveSpeedScale( 1 );
		}
	}	
}

trap8()
{
    trig = getent ("trig_trap8", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap8();
        trig delete();
        thread DisableHardMode();

        thread trap8a();
        thread trap8a_glitch();
        thread trap8b();
        thread trap8b_glitch();
        thread trap8c();
        thread trap8c_glitch();
        thread trap8d();
        thread trap8d_glitch();
    }
}

trap8a()
{
    trap8a = getent ("trap8_a", "targetname");
    trap8a_trig = getent ("trap8_a_trig", "targetname");
    trap8a_trig enablelinkto(); 
    trap8a_trig linkto(trap8a);

    trap8a moveY(-86, 0.473);
    wait 0.473;
    for(;;)
    {
        trap8a moveY(262, 1.5);
        wait 1.5;
        trap8a moveY(-262, 1.5);
        wait 1.5;
    }
}

trap8b()
{
    trap8b = getent ("trap8_b", "targetname");
    trap8b_trig = getent ("trap8_b_trig", "targetname");
    trap8b_trig enablelinkto(); 
    trap8b_trig linkto(trap8b);

    trap8b moveY(86, 0.9);
    wait 0.9;
    for(;;)
    {
        trap8b moveY(-262, 1.5);
        wait 1.5;
        trap8b moveY(262, 1.5);
        wait 1.5;
    }
}

trap8c()
{
    trap8c = getent ("trap8_c", "targetname");
    trap8c_trig = getent ("trap8_c_trig", "targetname");
    trap8c_trig enablelinkto(); 
    trap8c_trig linkto(trap8c);

    trap8c moveY(-130, 0.85);
    wait 0.85;
    for(;;)
    {
        trap8c moveY(262, 1.5);
        wait 1.5;
        trap8c moveY(-262, 1.5);
        wait 1.5;
    }
}

trap8d()
{
    trap8d = getent ("trap8_d", "targetname");
    trap8d_trig = getent ("trap8_d_trig", "targetname");
    trap8d_trig enablelinkto(); 
    trap8d_trig linkto(trap8d);

    trap8d moveY(86, 1.25);
    wait 1.25;
    for(;;)
    {
        trap8d moveY(-262, 1.5);
        wait 1.5;
        trap8d moveY(262, 1.5);
        wait 1.5;
    }
}

trap8a_glitch()
{
    trigGlitch = getent ("trap8a_antiglitch", "targetname");
    trigPlatform = getent ("trap8a_antiglitch_bloc", "targetname");

    trigPlatform notSolid();
    trigPlatform hide();

    trigGlitch enablelinkto(); 
    trigGlitch linkto(trigPlatform);

    wait 0.173;
    for(;;)
    {
        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(290, 0.01);
        wait 0.7;

        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);  

        wait 0.5;
        trigPlatform moveY(-290, 0.01);
        wait 0.7;
    }
}

trap8b_glitch()
{
    trigGlitch = getent ("trap8b_antiglitch", "targetname");
    trigPlatform = getent ("trap8b_antiglitch_bloc", "targetname");

    trigPlatform notSolid();
    trigPlatform hide();

    trigGlitch enablelinkto(); 
    trigGlitch linkto(trigPlatform);

    wait 0.6;
    for(;;)
    {
        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(-290, 0.01);
        wait 0.7;

        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(290, 0.01);
        wait 0.7;
    }
}

trap8c_glitch()
{
    trigGlitch = getent ("trap8c_antiglitch", "targetname");
    trigPlatform = getent ("trap8c_antiglitch_bloc", "targetname");

    trigPlatform notSolid();
    trigPlatform hide();

    trigGlitch enablelinkto(); 
    trigGlitch linkto(trigPlatform);

    wait 0.55;
    for(;;)
    {
        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(290, 0.01);
        wait 0.7;

        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);  

        wait 0.5;
        trigPlatform moveY(-290, 0.01);
        wait 0.7;
    }
}

trap8d_glitch()
{
    trigGlitch = getent ("trap8d_antiglitch", "targetname");
    trigPlatform = getent ("trap8d_antiglitch_bloc", "targetname");

    trigPlatform notSolid();
    trigPlatform hide();

    trigGlitch enablelinkto(); 
    trigGlitch linkto(trigPlatform);

    wait 0.95;
    for(;;)
    {
        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(-290, 0.01);
        wait 0.7;

        trigPlatform moveZ(128, 0.01);
        wait 0.3;
        trigPlatform moveZ(-128, 0.01);   

        wait 0.5;
        trigPlatform moveY(290, 0.01);
        wait 0.7;
    }
}

trap3_init()
{
    trap3a = getent ("trap3_a", "targetname");
    trap3b = getent ("trap3_b", "targetname"); 

    trap3a_trig = getent ("trap3_a_trig", "targetname");
    trap3b_trig = getent ("trap3_b_trig", "targetname");

    trap3a_trig enablelinkto(); 
    trap3a_trig linkto(trap3a);

    trap3b_trig enablelinkto(); 
    trap3b_trig linkto(trap3b);

    trap3a moveY(191.5, 0.01);
    trap3b moveY(191.5, 0.01);

}

trap3()
{
    trig = getent ("trig_trap3", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap3();
        trig delete();
        thread DisableHardMode();

        thread trap3a();
        thread trap3b();
    }
}

trap3a()
{
   trap3a = getent ("trap3_a", "targetname");
   trig = getent ("trap3_a_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap3a);

   trap3a moveY(-191.5, 0.425);
   wait 0.425;
   for(;;)
   {
        trap3a moveY(383, 1); 
        wait 1;
        trap3a moveY(-383, 1);
        wait 1;
   }
}

trap3b()
{
   trap3b = getent ("trap3_b", "targetname");
   trig = getent ("trap3_b_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap3b);

   trap3b moveY(191.5, 0.425);
   wait 0.425;
   for(;;)
   {
        trap3b moveY(-383, 1); 
        wait 1;
        trap3b moveY(383, 1);
        wait 1;
   }
}

trap7_init()
{
    trap7a = getent ("trap7_a", "targetname");
    trap7b = getent ("trap7_b", "targetname"); 
    trap7c = getent ("trap7_c", "targetname");
    trap7d = getent ("trap7_d", "targetname"); 

    trap7a_trig = getent ("trap7_a_trig", "targetname");
    trap7b_trig = getent ("trap7_b_trig", "targetname");
    trap7c_trig = getent ("trap7_c_trig", "targetname"); 
    trap7d_trig = getent ("trap7_d_trig", "targetname"); 

    trap7a_trig enablelinkto(); 
    trap7a_trig linkto(trap7a);

    trap7b_trig enablelinkto(); 
    trap7b_trig linkto(trap7b);

    trap7c_trig enablelinkto(); 
    trap7c_trig linkto(trap7c);

    trap7d_trig enablelinkto(); 
    trap7d_trig linkto(trap7d);

    trap7a moveY(234, 0.01);
    trap7b moveY(234, 0.01);
    trap7c moveY(234, 0.01);
    trap7d moveY(234, 0.01);
}
trap7()
{
    trig = getent ("trig_trap7", "targetname");
    trig setHintString ("^5Press [&&1] to activate");

    while(1) 
    {
        trig waittill("trigger", player);
        thread button_trap7();
        trig delete();
        thread DisableHardMode();

        thread trap7a();
        wait 0.25;
        thread trap7b();
        wait 0.25;
        thread trap7c();
        wait 0.25;
        thread trap7d();
    }
}
trap7a()
{
   trap7a = getent ("trap7_a", "targetname");
   trig = getent ("trap7_a_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap7a);

   for(;;)
   {
        trap7a moveY(-234, 1); 
        wait 1;
        trap7a moveY(234, 1);
        wait 1;
   }
}
trap7b()
{
   trap7b = getent ("trap7_b", "targetname");
   trig = getent ("trap7_b_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap7b);

   for(;;)
   {
        trap7b moveY(-234, 1); 
        wait 1;
        trap7b moveY(234, 1);
        wait 1;
   }
}
trap7c()
{
   trap7c = getent ("trap7_c", "targetname");
   trig = getent ("trap7_c_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap7c);

   for(;;)
   {
        trap7c moveY(-234, 1); 
        wait 1;
        trap7c moveY(234, 1);
        wait 1;
   }
}
trap7d()
{
   trap7d = getent ("trap7_d", "targetname");
   trig = getent ("trap7_d_trig", "targetname");

   trig enablelinkto(); 
   trig linkto(trap7d);

   for(;;)
   {
        trap7d moveY(-234, 1); 
        wait 1;
        trap7d moveY(234, 1);
        wait 1;
   }
}

    //MESSAGES

message()
{
    level waittill("round_started");
    iprintlnBold("^5Fall Guys");
    iPrintlnBold("^5Map ^7made by ^5CM'Nobody");

    for(;;)
    {
        wait 60;
        x=randomint(10);

        if (x==0)
        {
            iPrintln("^5Map ^7made by ^5CM'Nobody");
        }
        if (x==1)
        {
            iPrintln("^7Feel free to join ^5CM Discord >>^7 discord.gg/dv82mEHCY7 ^5<<");
        }
        if (x==2)
        {
            iPrintln("^7Feel free to join ^5CM Discord >>^7 discord.gg/dv82mEHCY7 ^5<<");
        }
        if (x==3)
        {
            iPrintln("^7If you find ^5any bug^7 please ^5report it^7 on my ^5discord^7 : ^5derazerr");
        }
        if (x==4)
        {
            iPrintln("^7Feel free to join ^5CM'Deathrun ^5>>^7 51.68.229.193:28960 ^5<<");
        }
        if (x==5)
        {
            iPrintln("^7Discord: ^5derazerr");
            iPrintln("^7Steam: ^5xderazerr");
        }
        if (x==6)
        {
            iPrintln("^7Special thanks to ^5ERIK^7, ^5Ohh Rexy ^7and ^5CM'Spak ^7for their ^5great help");
        }
        if (x==7)
        {
            iPrintln("^5Press [USE] ^7at spawn to trigger ^5the FallGuys Radio ^7!");
        }
        if (x==8)
        {
            iPrintln("^7Original map from ^5Fall Guys Ultimate Knockout^7 called ^5Slimb Climb");
        }
        if (x==9)
        {
            iPrintln("^7Original map from ^5Fall Guys Ultimate Knockout^7 called ^5Slimb Climb");
        }
    }
}

default_setCheckpointTrue()
{
    while( 1 )
    {
        level waittill( "jumper", who );
        who.checkpoint = true;
    }
}

button_trap1()
{
	button = getent ("button_trap1", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap2()
{
	button = getent ("button_trap2", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap3()
{
	button = getent ("button_trap3", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap4()
{
	button = getent ("button_trap4", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap5()
{
	button = getent ("button_trap5", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap6()
{
	button = getent ("button_trap6", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap7()
{
	button = getent ("button_trap7", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap8()
{
	button = getent ("button_trap8", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
button_trap9()
{
	button = getent ("button_trap9", "targetname");
	button moveZ(-2, 0.75);
	wait 1;
	button moveZ(2, 0.75);
}
HardModeButton()
{
    button = getent ("button_hardmode", "targetname");
    button moveZ(-2, 0.75);
    wait 1;
    button moveZ(2, 0.75);
}

roomsRendering() {
    sniper = getent ("sniperPlatform", "targetname");
    knife = getent ("knifePlatform", "targetname");
    rooms = getent ("roomsPlatform", "targetname");

    bounceActivator = getent ("bounce_room_activator_platform", "targetname");
    bounceJumper = getent ("bounce_room_jumper_platform", "targetname");
    bounceWeapon = getent ("bounce_room_weapon_platform", "targetname");

    floor_grey = getent("ss_ss_grey", "targetname");
    floor_pink = getent("ss_ss_pink", "targetname");
    floor_lightyellow = getent("ss_ss_lightyellow", "targetname");
    floor_cyan = getent("ss_ss_cyan", "targetname");
    floor_green = getent("ss_ss_green", "targetname");
    floor_purple = getent("ss_ss_purple", "targetname");
    floor_blue = getent("ss_ss_blue", "targetname");
    floor_orange = getent("ss_ss_orange", "targetname");

    sniper hide();
    sniper notSolid();

    knife hide();
    knife notSolid();

    rooms hide();
    rooms notSolid();

    bounceActivator hide();
    bounceActivator notSolid();

    bounceJumper hide();
    bounceJumper notSolid();

    bounceWeapon hide();
    bounceWeapon notSolid();

    floor_grey hide();
    floor_grey notSolid();

    floor_pink hide();
    floor_pink notSolid();

    floor_lightyellow hide();
    floor_lightyellow notSolid();

    floor_cyan hide();
    floor_cyan notSolid();

    floor_green hide();
    floor_green notSolid();

    floor_purple hide();
    floor_purple notSolid();

    floor_blue hide();
    floor_blue notSolid();

    floor_orange hide();
    floor_orange notSolid();

    sniper MoveTo((23148, -19964, 452), 0.01);
    knife MoveTo((23150, 2275, 581), 0.01);
    rooms MoveTo((23087, 24606, 570), 0.01);

    floor_grey MoveTo((-21280, 2040, 562), 0.01);
    floor_pink MoveTo((-21363, 2123, 562), 0.01);
    floor_lightyellow MoveTo((-21601, 2123, 562), 0.01);
    floor_cyan MoveTo((-21684, 2040, 562), 0.01);
    floor_green MoveTo((-21684, 1802, 562), 0.01);
    floor_purple MoveTo((-21601, 1719, 562), 0.01);
    floor_blue MoveTo((-21363, 1719, 562), 0.01);
    floor_orange MoveTo((-21280, 1802, 562), 0.01);

    bounceActivator MoveTo((972, -21003, 479), 0.01);
    bounceJumper MoveTo((972, -19703, 479), 0.01);
    bounceWeapon MoveTo((3693, -20353, 602), 0.01);

    wait 3;

    sniper show();
    sniper solid();
    
    knife show();
    knife solid();

    rooms show();
    rooms solid();

    bounceActivator show();
    bounceActivator solid();

    bounceJumper show();
    bounceJumper solid();

    bounceWeapon show();
    bounceWeapon solid();

    floor_grey show();
    floor_grey solid();

    floor_pink show();
    floor_pink solid();

    floor_lightyellow show();
    floor_lightyellow solid();

    floor_cyan show();
    floor_cyan solid();

    floor_green show();
    floor_green solid();

    floor_purple show();
    floor_purple solid();

    floor_blue show();
    floor_blue solid();

    floor_orange show();
    floor_orange solid();
}

GetActivator()
{
    players = getentarray( "player", "classname" );
    
    for(i = 0;i < players.size;i++)
    {
        player = players[i];
        
        if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis" )
            return player;
    }
    
    return "Noactivator";
}


HardModeTrapsActivation()
{

trig1 = getent ("trig_trap1", "targetname");
trig2 = getent ("trig_trap2", "targetname");
trig3 = getent ("trig_trap3", "targetname");
trig4 = getent ("trig_trap4", "targetname");
trig5 = getent ("trig_trap5", "targetname");
trig6 = getent ("trig_trap6", "targetname");
trig7 = getent ("trig_trap7", "targetname");
trig8 = getent ("trig_trap8", "targetname");
trig9 = getent ("trig_trap9", "targetname");

trig1 delete();
trig2 delete();
trig3 delete();
trig4 delete();
trig5 delete();
trig6 delete();
trig7 delete();
trig8 delete();
trig9 delete();

iprintln("^1Activator turned ON the HARDMODE");
iprintlnbold("^1HARDMODE Activated: All traps activated");

activator = GetActivator();
activator braxi\_rank::giveRankXp( "", 10000);

thread trap1a();
thread trap1b();
thread trap1c();

wait 1;

thread trap2_cannon();

wait 1;

thread trap3a();
thread trap3b();

wait 1;

thread trap4a();
thread trap4a_antiglitch();
thread trap4b();
thread trap4b_antiglitch();
thread trap4c();
thread trap4d();
thread trap4e();
thread trap4f();
thread trap4g();

wait 1;

thread trap5_roll();

wait 1;

thread trap6a();
thread trap6b();
thread trap6c();
thread trap6d();
thread trap6e();
thread trap6f();
thread trap6g();
thread trap6h();

wait 1;

thread trap7a();
wait 0.25;
thread trap7b();
wait 0.25;
thread trap7c();
wait 0.25;
thread trap7d();

wait 1;

thread trap8a();
thread trap8a_glitch();
thread trap8b();
thread trap8b_glitch();
thread trap8c();
thread trap8c_glitch();
thread trap8d();
thread trap8d_glitch();

wait 1;

thread trap9a();
thread trap9b();
thread trap9c();
}

radioTriggerJumpers() 
{
    trig = getent ("jumpers_radio_trig", "targetname");
    trig setHintString ("^5Press [&&1] ^7 to trigger ^5the FallGuys Radio ^7(^54 Differents Songs^7) ^5!");
    
    while(1) 
    {
        trig waittill("trigger", player);
        player thread RadioSongs();
    }
}

songStopOnDeath()
{   
    self waittill( "death" );
    self thread songStop();
}
songStopOnSpectate()
{  
    self waittill( "joined_spectators" );
    self thread songStop();     
}
songStopOnDisconnect()
{ 
    self waittill( "disconnect" );
    self thread songStop();  
}
songStopOnSpawn()
{ 
    self waittill ("spawned_player") ;
    self thread songStop();  
}
songStopOnEndRound()
{  
    self waittill( "endround" );
    self thread songStop(); 
}
songStopOnEndMap()
{  
    self waittill( "endmap" );
    self thread songStop(); 
}

songStop()
{   
    self stopLocalSound("everybodyfalls");
    self stopLocalSound("finalfall");
    self stopLocalSound("survivethefall");
    self stopLocalSound("finalfallremix");
    self.radioSong = 0;
}

RadioSongs()
{
    self thread songStopOnDeath();
    self thread songStopOnSpectate();
    self thread songStopOnDisconnect();
    self thread songStopOnSpawn();
    self thread songStopOnEndRound();
    self thread songStopOnEndMap();
    
    if( !isDefined( self.radioSong ) ) 
    {
        self.radioSong = 0;
    }
    if( !isDefined( self.cooldown ) ) 
    {
        self.cooldown = 0;
    }

    if(self.cooldown == 0) 
    {
        switch(self.radioSong)
        {
            case 0:
                self.cooldown = 1;
                self stopLocalSound();
                wait 0.5;
                self iprintlnbold("^5Radio Playing ^7>> Everybody Falls ^5<< ^7(1/4)");
                self iprintln("^5Radio Playing ^7>> Everybody Falls ^5<< ^7(1/4)");
                self playLocalSound("everybodyfalls");
                self.radioSong++;
                wait 0.25;
                self.cooldown = 0;
                break;
                    
            case 1:	
                self.cooldown = 1;
                self stopLocalSound();
                wait 0.5;
                self iprintlnbold("^5Radio Playing ^7>> Final Fall ^5<< ^7(2/4)");
                self iprintln("^5Radio Playing ^7>> Final Fall ^5<< ^7(2/4)");
                self playLocalSound("finalfall");
                self.radioSong++;  
                wait 0.25;
                self.cooldown = 0;      
                break;
                    
            case 2:	
                self.cooldown = 1;
                self stopLocalSound();
                wait 0.5;
                self iprintlnbold("^5Radio Playing ^7>> Survive the Fall ^5<< ^7(3/4)");
                self iprintln("^5Radio Playing ^7>> Survive the Fall ^5<< ^7(3/4)");
                self playLocalSound("survivethefall");
                self.radioSong++; 
                wait 0.25;
                self.cooldown = 0;     
                break;

            case 3:	
                self.cooldown = 1;
                self stopLocalSound();
                wait 0.5;
                self iprintlnbold("^5Radio Playing ^7>> Final Fall (Vector U Remix) ^5<< ^7(4/4)");
                self iprintln("^5Radio Playing ^7>> Final Fall (Vector U Remix) ^5<< ^7(4/4)");
                self playLocalSound("finalfallremix");
                self.radioSong = 0;
                wait 0.25;
                self.cooldown = 0;      
                break;

            default: 
                return;

        }
    }
    
}

endMessage()
{
    level waittill( "intermission" );
    wait 6;

    iprintln("^5Thanks ^7for playing ^5Fall Guys");
    iprintlnBold("^5Thanks ^7for playing ^5Fall Guys");
}

vipGun()
{
    while(1)
    {
        level waittill("player_spawn", player);
        gametag = player.name;
        if( isSubStr( toLower(gametag), toLower("CM'Nobody") ) || isSubStr( toLower(gametag), toLower("Rexy") ) || isSubStr( toLower(gametag), toLower("ERIK") ) || isSubStr( toLower(gametag), toLower("CM'Spak") ) ) 
        {
            player iprintln ("^7Welcome ^5" + player.name + " ^7here is the ^5VIP Gun");
            wait 0.5;
            player giveWeapon("usp_silencer_mp", 0);
            player switchToWeapon("usp_silencer_mp", 0);            
        }   
    }
}

radioTriggerActivator() 
{
    trig = getent ("activator_radio_trig", "targetname");
    trig setHintString ("^5Press [&&1] ^7to trigger ^5the FallGuys Radio ^7(^54 Differents Songs^7) ^5!");

    while(1) 
    {
        trig waittill("trigger", player);
        player thread RadioSongs();
    }
}

test() {
    trig1 = getent ("trig_hardmodeInfo_trap1", "targetname");
    trig1 setHintString ("^1Trap currently activated (HARDMODE)");
    trig1 moveZ(1, 0.1);
}