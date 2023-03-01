/*
╔═════╗╔════╗╔════╗╔╗  ╔╗╔════╗ ╔════╗╔════╗╔════╗
╚╣ ╔╗ ║║ ╔╗     ║╠╦═══╝║║  ║║║    ║ ╚══╗ ║║ ╔╗ ║║ ╔╗ ║
 ║ ║║ ║║ ╚╝ ║╠╩══╗ ║║  ║║║ ╔╗ ║ ╔══╝ ║║ ║║ ║║ ╚╝ ║
 ║ ║║ ║║╔══╗║╠╦══╝ ║║  ║║║ ║║ ║ ║ ╔══╝║ ║║ ║╠═╦╦╦╝
╔╣ ╚╝ ║║║  ║║║║    ║╚══╝║║ ╚╝ ╠╗║ ╚══╗║ ╚╝ ║║ ║║╠╗╔═╗
╚═════╝╚╝  ╚╝╚╝          ╚════╝╚════╩╝╚════╝╚════╝╚═╝╚╩╝╚═╝
//   ________  ___  ___  _______   _______   ________  
//  |\   ____\|\  \|\  \|\  ___ \ |\  ___ \ |\   __  \  
//  \ \  \___|\ \  \\\  \ \   __/|\ \   __/|\ \  \|\  \
//   \ \_____  \ \   __  \ \  \_|/_\ \  \_|/_\ \   ____\
//    \|____|\  \ \  \ \  \ \  \_|\ \ \  \_|\ \ \  \___|
//      ____\_\  \ \__\ \__\ \_______\ \_______\ \__\  
//     |\_________\|__|\|__|\|_______|\|_______|\|__|  
//     \|_________|                                    
//
**READ**
This map was made by Dafuxzor. It was a server only map. Dafuxzor quit cod4 and did not give the map .gsc to anyone (as far as I know).
So I decided to re write it as this is one of my fav map :D
I do not take any credit for this map.
Enjoy
 
-Sheep Wizard
 
------------------------------------
Edit from Blade
 
To maps.gsc
case "mp_deathrun_sick_v2":
                        trigger = spawn( "trigger_radius", (1868.27, -140.207, 704.125), 0, 160, 105 );
                        trigger.targetname = "endmap_trig";
                        break;
------------------------------------
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
 
        setDvar( "bg_fallDamageMinHeight", 9999 );
        setDvar( "bg_fallDamageMaxHeight", 10000);
 
        trigger = spawn( "trigger_radius", (1868.27, -140.207, 704.125), 0, 160, 105 );
                        trigger.targetname = "endmap_trig";

        thread spam();
        thread speed();
        thread unspeed();
        thread fail1();
        thread fail2();
        thread elevator();
        thread tele();
        thread love();
        thread trap_1();
        thread trap_2();
        thread trap_3();
        thread trap_4();
        thread trap_5();
        thread trap_6();
        thread trap_7();
        thread sniper();
        thread knife();
    thread deagle();
 
        addTriggerToList("trap1_trig");
        addTriggerToList("trap2_trig");
        addTriggerToList("trap3_trig");
        addTriggerToList("trap4_trig");
        addTriggerToList("trap5_trig");
        addTriggerToList("trap6_trig");
        addTriggerToList("trap7_trig");
}
 
addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
 
spam()
{
        level waittill("round_started");
        ambientPlay("sick");
        for(;;)
        {
                wait 10;
                iPrintLn("^1>> ^7Map by ^6DafuqzoR^7!");
                wait 10;
                iPrintLn("^1>> ^7GSC re-written by ^6Sheep Wizard^7!");
                wait 10+randomint(100);
        }
}
 
speed()
{
        trig = getEnt("speed_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                player SetMoveSpeedScale( 1.5 );
        }
}
 
unspeed()
{
        trigger = spawn( "trigger_radius", (-1246.45, 1964.91, 400.125), 0, 110, 90 );
        trigger.targetname = "unspeed_trig";
        trig = getEnt("unspeed_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                player SetMoveSpeedScale( 1 );
        }
}
 
fail1()
{
        trigger = spawn( "trigger_radius", (-1552.01, -698.715, -538.65), 0, 740, 10 );
        trigger.targetname = "fail1_trig";
        trig = getEnt("fail1_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                player freezeControls(1);
                player setOrigin((-1543,-959,384));
                wait 0.05;
                player freezeControls(0);
        }
}
 
fail2()
{
        trigger = spawn( "trigger_radius", (-1550.04, 727.724, -538.431), 0, 605, 10 );
        trigger.targetname = "fail2_trig";
        trig = getEnt("fail2_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                player freezeControls(1);
                player setOrigin((-1541,-16,348));
                wait 0.05;
                player freezeControls(0);
        }
}
 
elevator()
{
        brush1 = getEnt("move", "targetname");
        trig = getent("move_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                brush1 movex(-550,2);
                brush1 waittill("movedone");
                wait 1;
                brush1 movex(550,2);
        }
}
 
tele()
{
        trigger = spawn( "trigger_radius", (-1966.2, 1979.14, 928.125), 0, 25, 70 );
        trigger.targetname = "teleport_trig";
        trig = getEnt("teleport_trig", "targetname");
        for(;;)
        {
                trig waittill("trigger", player);
                player setOrigin((-851,1544,371));
                player SetPlayerAngles( (0, 360, 0) );
        }
}
 
love()
{
        brush = getEnt("love", "targetname");
        wait 1;
        brush delete();
}
 
 
//Traps\\
gettrigger(trigname)
{
    trig = getent(trigname, "targetname");
    trig waittill("trigger", player);
}
 
trap_1()
{
        //trigger = spawn( "trigger_radius", (1453.37, -973.076, 400.125), 0, 25, 75 );
        //trigger.targetname = "trap1_trig";
        brush1 = getent("trap1_1", "targetname");
        brush2 = getent("trap1_2", "targetname");
        gettrigger("trap1_trig");
        for(;;)
        {
                brush1 moveY(350, 1);
                brush2 moveY(-350, 1);
                brush2 waittill("movedone");
                brush1 moveY(-350, 1);
                brush2 moveY(350, 1);
                brush2 waittill("movedone");
        }
}
 
 
trap_2()
{
        brush1 = getent("trap2_1", "targetname");
        brush2 = getent("trap2_2", "targetname");
        brush3 = getent("trap2_3", "targetname");
        gettrigger("trap2_trig");
        for(;;)
        {
                brush1 rotateroll(360, 1.6);
                brush2 rotateroll(-360, 1.6);
                brush3 rotateroll(360, 1.6);
                wait 1.6;
        }
}
 
 
trap_3()
{
        brush1 = getent("trap3", "targetname");
        gettrigger("trap3_trig");      
        for(;;)
        {
                brush1 rotateYaw(360, 4);
                wait 4;
        }
 
}
 
 
trap_4()
{
        brush1 = getent("trap4", "targetname");
        gettrigger("trap4_trig");
        brush1 moveZ(-800, 6);
        brush1 waittill("movedone");
        brush1 delete();
}
 
 
trap_5()
{
        brush1 = getent("trap5", "targetname");
        gettrigger("trap5_trig");
        brush1 delete();
        earthquake(0.5, 2.5, (-87,1556,314), 400);
}
 
 
trap_6()//This trap has been modified from the original
{
        brush1 = getent("trap6", "targetname");
        gettrigger("trap6_trig");
        brush1 moveY(-900, 2);
        wait 2;
        brush1 moveY(900, 2);
}
 
 
trap_7()
{
        brush1 = getent("trap7", "targetname");
        gettrigger("trap7_trig");
        for(;;)
        {
                brush1 rotateYaw(90, 1.5);
                brush1 waittill("rotatedone");
                brush1 rotateYaw(-90, 1.5);
                brush1 waittill("rotatedone");
 
        }
}
//end of traps\\
 
sniper()
{
 
        level.final_sniper_trig = getEnt( "final_sniper_trig", "targetname");
    jump = getEnt( "sniper_j", "targetname" );
    acti = getEnt( "sniper_a", "targetname" );
        level.firstenter=true;
    while(1)
    {
        level.final_sniper_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
            continue;
        if( !isDefined( level.final_sniper_trig ) )
            return;
       
        if(level.firstenter==true)
        {
                level.firstenter=false;
                ambientStop(2);
                wait 2;
                ambientPlay("sniper");
                level.final_knife_trig delete();
                level.final_dgl_trig delete();
        }
                if(isdefined(level.activ))
                {
                player.health = player.maxhealth;
                level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("remington700_mp","m40a3_mp");        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ setroomgun("remington700_mp","m40a3_mp");
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                noti.titleText = "Sniper Room";
                                noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
                                noti.glowcolor = (1,0,0.9);
                                noti.duration = 5;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                        wait 5;
                        player FreezeControls(0);
                        level.activ FreezeControls(0);
                }
                else
                {
                player.health = player.maxhealth;
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("remington700_mp","m40a3_mp");        
                player FreezeControls(1);
                        wait 5;
                        player FreezeControls(0);
                }
        while( isAlive( player ) && isDefined( player ) )
            wait 1;            
    }
}
 
knife()
{
        level.final_knife_trig = getEnt( "final_knife_trig", "targetname");
    jump = getEnt( "enter_jumper_k", "targetname" );
    acti = getEnt( "activator_enter_k", "targetname" );
        level.firstenter=true;
    while(1)
    {
        level.final_knife_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
            continue;
        if( !isDefined( level.final_knife_trig ) )
            return;
       
                if(level.firstenter==true)
        {
                level.firstenter=false;
                ambientStop(2);
                wait 2;
                ambientPlay("dgl");
                level.final_sniper_trig delete();
                level.final_dgl_trig delete();
        }
                if(isdefined(level.activ))
                {
                player.health = player.maxhealth;
                level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("knife_mp","g36c_gl_mp");        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ setroomgun("knife_mp","g36c_gl_mp");
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                noti.titleText = "^7Knife Room";
                                noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
                                noti.glowcolor = (0.9,0,0.9);
                                noti.duration = 5;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                        wait 5;
                        player FreezeControls(0);
                        level.activ FreezeControls(0);
                }
                else
                {
                        player.health = player.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("knife_mp","g36c_gl_mp");        
                player FreezeControls(1);
                        wait 5;
                        player FreezeControls(0);
                }
        while( isAlive( player ) && isDefined( player ) )
            wait 1;            
    }
}
 
deagle()
{
        trigger = spawn( "trigger_radius", (1847.88, -297.39, 192.125), 0, 55, 30 );
        trigger.targetname = "final_deagle_trig";
        level.final_dgl_trig = getEnt( "final_deagle_trig", "targetname");
    jump = getEnt( "enter_jumper_d", "targetname" );
    acti = getEnt( "activator_enter_d", "targetname" );
        level.firstenter=true;
    while(1)
    {
        level.final_dgl_trig waittill( "trigger", player );
        if(!player sr\api\_deathrun::order())
            continue;
        if( !isDefined( level.final_dgl_trig ) )
            return;
       
                if(level.firstenter==true)
        {
                level.firstenter=false;
                ambientStop(2);
                wait 2;
                ambientPlay("dgl");
                level.final_sniper_trig delete();
                level.final_knife_trig delete();
        }
                if(isdefined(level.activ))
                {
                player.health = player.maxhealth;
                level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("deserteagle_mp",undefined);        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ setroomgun("deserteagle_mp",undefined);
                player FreezeControls(1);
                        level.activ FreezeControls(1);
                        noti = SpawnStruct();
                                noti.titleText = "^7Deagle Room";
                                noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
                                noti.glowcolor = (0.9,0,0.9);
                                noti.duration = 5;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                wait 5;
                        wait 5;
                        player FreezeControls(0);
                        level.activ FreezeControls(0);
                }
                else
                {
                        player.health = player.maxhealth;
                        player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player setroomgun("deserteagle_mp",undefined);        
                player FreezeControls(1);
                        wait 5;
                        player FreezeControls(0);
                }
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}
 
setroomgun(weap,weap2)
{
    if(isdefined(weap))
    {
        self giveweapon(weap);
        self givemaxammo(weap);
    }
    if(isdefined(weap2))
    {
        self giveweapon(weap2);
        self givemaxammo(weap2);
    }
    self switchtoweapon(weap);
}