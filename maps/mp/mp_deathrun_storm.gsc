/*
╔═════╗╔════╗╔════╗╔╗  ╔╗╔════╗ ╔════╗╔════╗╔════╗
╚╣ ╔╗ ║║ ╔╗	║╠╦═══╝║║  ║║║    ║ ╚══╗ ║║ ╔╗ ║║ ╔╗ ║
 ║ ║║ ║║ ╚╝ ║╠╩══╗ ║║  ║║║ ╔╗ ║ ╔══╝ ║║ ║║ ║║ ╚╝ ║
 ║ ║║ ║║╔══╗║╠╦══╝ ║║  ║║║ ║║ ║ ║ ╔══╝║ ║║ ║╠═╦╦╦╝
╔╣ ╚╝ ║║║  ║║║║    ║╚══╝║║ ╚╝ ╠╗║ ╚══╗║ ╚╝ ║║ ║║╠╗╔═╗
╚═════╝╚╝  ╚╝╚╝	   ╚════╝╚════╩╝╚════╝╚════╝╚═╝╚╩╝╚═╝

                              ___________________________________________________________________________
                             //_______________- Yolo -Scripted by DafuqzoR Made by Sakon -______________\\
                             \\ If you have a question about the following code, x-Fire add me borstey88//
                              \\!Please don't use this code or any variant of it without my permission!//
                               \\¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯//
							
THANKS ;)							
*/


main()
{
            
    maps\mp\_load::main();
    
    
    ambientPlay("song1"); 
    
    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";
	
	setDvar("bg_falldamagemaxheight", 20000 );
	setDvar("bg_falldamageminheight", 15000 );

    thread start();
	thread trap1();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread sniper();
	thread jump();
	thread knife();
	thread text();
	thread deco1();
	thread acti4();
	thread acti5();
	thread pad();
					addTriggerToList("trap1_trig");
					addTriggerToList("trap8_trig");
					addTriggerToList("trap3_trig");
					addTriggerToList("trap4_trig");
					addTriggerToList("trap5_trig");
					addTriggerToList("trap6_trig");
					addTriggerToList("trap7_trig");
					addTriggerToList("trap9_trig");
					addTriggerToList("trap10_trig");					
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

pad()
{
level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
jumpx = getentarray ("jump","targetname");
for(i = 0; i < jumpx.size; i++)
jumpx[i] thread jump_pad_think();
}

jump_pad_think()
{
glow = getent (self.target, "targetname");
air1 = getent (glow.target, "targetname");
air2 = getent (air1.target, "targetname");
air3 = getent (air2.target, "targetname");
air4 = getent (air3.target, "targetname");

maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

while (1)
{
self waittill ("trigger",user);
if (user istouching(self))
{
//throw = user.origin + (100, 100, 0);
air = spawn ("script_model",(0,0,0));
air.origin = user.origin;
air.angles = user.angles;
user linkto (air);
air moveto (air1.origin, 1);
wait 1;
air moveto (air2.origin, 1);
wait 1;
air moveto (air3.origin, 1);
wait 1;
air moveto (air4.origin, 1);
wait 1;
user unlink();
wait 1;
}
}
}

acti4()
{
	trig = getEnt ("back_2_trig", "targetname");
    end = getEnt ("back_2", "targetname");    
    while(1)
    {
        trig waittill ("trigger", player);     
	
        player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}


acti5()
{
	trig = getEnt ("back_1_trig", "targetname");
    end = getEnt ("back_1", "targetname");    
    while(1)
    {
        trig waittill ("trigger", player);     
	
        player SetOrigin(end.origin);
        player SetPlayerAngles( end.angles );
	}
}

trap4()
{
		trap4_1 = getEnt ("trap4_1", "targetname");
		trap4_2 = getEnt ("trap4_2", "targetname");
		trap4_3 = getEnt ("trap4_3", "targetname");
		trap4_4 = getEnt ("trap4_4", "targetname");
		trig = getEnt ("trap4_trig", "targetname");
		
	trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
	trap4_1 RotatePitch (360, 3);
	trap4_3 RotatePitch (360, 3);
	trap4_4 RotatePitch (-360, 3);
	trap4_2 RotatePitch (-360, 3);
	wait 1;
	}
} 

trap5()
{
		trap5_1 = getEnt ("trap5_1", "targetname");
		trap5_2 = getEnt ("trap5_2", "targetname");
		trap5_3 = getEnt ("trap5_3", "targetname");
		trap5_4 = getEnt ("trap5_4", "targetname");
		trig = getEnt ("trap5_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
	trap5_1 Rotatepitch   (360, 5);
	wait 3;
	trap5_2 Rotatepitch   (-360, 5);
	wait 3;
	trap5_3 Rotatepitch   (360, 5);
	wait 3;
	trap5_4 Rotatepitch   (-360, 5);
	wait 1;
	}
}

trap7()
{
		trap7_1 = getEnt ("trap7_1", "targetname");
		trap7_2 = getEnt ("trap7_2", "targetname");
		trap7_3 = getEnt ("trap7_3", "targetname");
		trap7_4 = getEnt ("trap7_4", "targetname");
		trap7_5 = getEnt ("trap7_5", "targetname");
		trap7_6 = getEnt ("trap7_6", "targetname");
		trap7_7 = getEnt ("trap7_7", "targetname");
		trig = getEnt ("trap7_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
    trap7_1 moveZ (-250,1);
	trap7_2 moveZ (-200,2);
	trap7_3 moveZ (-150,3);
	trap7_4 moveZ (-100,4);
	trap7_5 moveZ (-150,3);
	trap7_6 moveZ (-200,2);
	trap7_7 moveZ (-250,1);
	wait 3;
	trap7_3 RotateRoll (360, 3);
	trap7_5 RotateRoll (-360, 3);
	trap7_1 RotateRoll (360, 5);
	trap7_7 RotateRoll (-360, 5);
	wait 3;
    trap7_1 moveZ (250,1);
	trap7_2 moveZ (200,2);
	trap7_3 moveZ (150,3);
	trap7_4 moveZ (100,4);
	trap7_5 moveZ (150,3);
	trap7_6 moveZ (200,2);
	trap7_7 moveZ (250,1);
	wait 3;
	trap7_3 RotateRoll (360, 3);
	trap7_5 RotateRoll (-360, 3);
	trap7_1 RotateRoll (360, 5);
	trap7_7 RotateRoll (-360, 5);
	wait 3;
	trap7_1 moveZ (-250,1);
	trap7_2 moveZ (-200,2);
	trap7_3 moveZ (-150,3);
	trap7_4 moveZ (-100,4);
	trap7_5 moveZ (-150,3);
	trap7_6 moveZ (-200,2);
	trap7_7 moveZ (-250,1);
	wait 3;
	trap7_3 RotateRoll (360, 3);
	trap7_5 RotateRoll (-360, 3);
	trap7_1 RotateRoll (360, 5);
	trap7_7 RotateRoll (-360, 5);
	wait 3;
    trap7_1 moveZ (250,1);
	trap7_2 moveZ (200,2);
	trap7_3 moveZ (150,3);
	trap7_4 moveZ (100,4);
	trap7_5 moveZ (150,3);
	trap7_6 moveZ (200,2);
	trap7_7 moveZ (250,1);
	wait 3;
	trap7_3 RotateRoll (360, 3);
	trap7_5 RotateRoll (-360, 3);
	trap7_1 RotateRoll (360, 5);
	trap7_7 RotateRoll (-360, 5);
	wait 3;
	}
}


trap6()
{
		trap6_1 = getEnt ("trap6_1", "targetname");
		trap6_2 = getEnt ("trap6_2", "targetname");
		trig = getEnt ("trap6_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
    trap6_1 moveZ (50,1);
	trap6_2 moveZ (-50,1);
	wait 1;
	trap6_1 moveZ (-50,1);
	trap6_2 moveZ (50,1);
	wait 1;
	trap6_1 moveZ (-50,1);
	trap6_2 moveZ (50,1);
	wait 1;
	trap6_1 moveZ (50,1);
	trap6_2 moveZ (-50,1);
	wait 1;
	}
}

trap3()  
{  
    trap3_1 = getEnt ("trap3_1", "targetname");  
    trap3_2 = getEnt ("trap3_2", "targetname");  
    trap3_3 = getEnt ("trap3_3", "targetname");  
    trap3_4 = getEnt ("trap3_4", "targetname");  
    trig = getEnt ("trap3_trig", "targetname");  

    hurt1 = getEnt("trap3_1h","targetname"); 
    hurt2 = getEnt("trap3_2h","targetname"); 
    hurt3 = getEnt("trap3_3h","targetname"); 
    hurt4 = getEnt("trap3_4h","targetname"); 
     
    hurt1 EnableLinkTo(); 
    hurt2 EnableLinkTo(); 
    hurt3 EnableLinkTo(); 
    hurt4 EnableLinkTo(); 
     
    hurt1 LinkTo(trap3_1); 
    hurt2 LinkTo(trap3_2); 
    hurt3 LinkTo(trap3_3); 
    hurt4 LinkTo(trap3_4); 
     
    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");  
    trig waittill ("trigger");
    trig setHintString ("^0Activated^2!");  

    while(1)  
    {  
        trap3_1 moveZ (-180,0.8);  
        trap3_2 moveZ (-180,0.8);  
        trap3_3 moveZ (-180,0.8);  
        trap3_4 moveZ (-180,0.8);  
        wait 1;  
        trap3_1 moveZ (180,0.8);  
        trap3_2 moveZ (180,0.8);  
        trap3_3 moveZ (180,0.8);  
        trap3_4 moveZ (180,0.8);  
        wait 1;  
        trap3_1 moveZ (-180,0.8);  
        trap3_2 moveZ (-180,0.8);  
        trap3_3 moveZ (-180,0.8);  
        trap3_4 moveZ (-180,0.8);  
        wait 1;  
        trap3_1 moveZ (180,0.8);  
        trap3_2 moveZ (180,0.8);  
        trap3_3 moveZ (180,0.8);  
        trap3_4 moveZ (180,0.8);  
        wait 1;  
    }  
} 

trap1()
{
		trap1_1 = getEnt ("trap1_1", "targetname");
		trap1_2 = getEnt ("trap1_2", "targetname");
		trig = getEnt ("trap1_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	
	trap1_1 RotatePitch (90, 3);
	trap1_2 RotatePitch (-90, 3);
	wait 1;
	}
	
trap8()
{
		trap8 = getEnt ("trap8", "targetname");
		trap8_1 = getEnt ("trap8_1", "targetname");
		trig = getEnt ("trap8_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
	trap8 RotatePitch (360, 4);
	trap8_1 Rotateyaw (360, 2);
	wait 1;
	trap8_1 moveZ (60,0.8);
	wait 1;
	trap8_1 moveZ (-60,0.8);
	wait 1;
	trap8_1 moveZ (60,0.8);
	wait 1;
	trap8_1 moveZ (-60,0.8);
	wait 1;
	}
}

trap9()
{
		trap9 = getEnt ("trap9", "targetname");
		trap9_1 = getEnt ("trap9_1", "targetname");
		trig = getEnt ("trap9_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
	trap9 RotatePitch (-360, 4);
	trap9_1 Rotateyaw (-360, 2);
	wait 1;
	trap9_1 moveZ (60,0.8);
	wait 1;
	trap9_1 moveZ (-60,0.8);
	wait 1;
	trap9_1 moveZ (60,0.8);
	wait 1;
	trap9_1 moveZ (-60,0.8);
	wait 1;
	}
}

trap10()
{
		trap10 = getEnt ("trap10", "targetname");
		trap10_1 = getEnt ("trap10_1", "targetname");
		trig = getEnt ("trap10_trig", "targetname");

    trig setHintString ("^3USE ^4T^0o ^1A^0ctivate^2!");
	trig waittill ("trigger", player);
	trig setHintString ("^0Activated^2!");
	
	while(1)
	{
	trap10 RotatePitch (360, 4);
	trap10_1 Rotateyaw (360, 2);
	wait 1;
	trap10_1 moveZ (60,0.8);
	wait 1;
	trap10_1 moveZ (-60,0.8);
	wait 1;
	trap10_1 moveZ (60,0.8);
	wait 1;
	trap10_1 moveZ (-60,0.8);
	wait 1;
	}
}

text()
{	
	s = getEnt ("sniper", "targetname");
	b = getEnt ("bounce", "targetname");
	k = getEnt ("knife", "targetname");

    while(1)
	{
	s Rotateyaw (360, 3);
	b Rotateyaw (360, 3);
	k Rotateyaw (360, 3);
	wait 1;
	}
}


start()
{
		start = getEnt ("start", "targetname");
		trig = getEnt ("start_trig", "targetname");

    trig setHintString ("^1P^0ress ^1T^0o ^1O^0pen^2!");
	trig waittill ("trigger", player);
	
	while(1)
	{
    start moveZ (-150,5);
	wait 5;
	}
}

deco1()
{
		deco1 = getEnt ("deco1", "targetname");
	
	while(1)
	{
	deco1 Rotateyaw (-360, 2);
	deco1 moveZ (-150,0.5);
	wait 1;
	deco1 Rotateyaw (-360, 2);
	deco1 moveZ (150,0.5);
	wait 1;
	deco1 Rotateyaw (-360, 2);
	deco1 moveZ (-150,0.5);
	wait 1;
	deco1 Rotateyaw (-360, 2);
	deco1 moveZ (150,0.5);
	wait 1;
	}
}

sniper()
{
 
        level.final_sniper_trig = getEnt( "final_sniper_trig", "targetname");
    jump = getEnt( "sniper_j", "targetname" );
    acti = getEnt( "sniper_a", "targetname" );
 
 
     while(1)
    {
        level.final_sniper_trig waittill( "trigger", player );
        if( !isDefined( level.final_sniper_trig ) )
            return;
       
                //level.final_sniper_trig delete();
                level.final_knife_trig delete();
                level.final_jump_trig delete();
                        AmbientStop( 4 );
                        wait 1;
                        AmbientPlay ("song4" );
 
               
         player.health = player.maxhealth;
                 level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
                player GiveWeapon( "m40a3_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon( "m40a3_mp" );        
        wait 0.05;
        player switchToWeapon( "remington700_mp" );
        level.activ SwitchToWeapon( "remington700_mp" );
        player FreezeControls(1);
                level.activ FreezeControls(1);
                noti = SpawnStruct();
                                noti.titleText = "Sniper Room";
                                noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
                                noti.glowcolor = (0,0.2,0.9);
                                noti.duration = 5;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                wait 5;
                                player FreezeControls(0);
                                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
                       
    }
 
}
 
jump()
{
 
        level.final_jump_trig = getEnt( "final_jump_trig", "targetname");
    jump = getEnt( "jump_a", "targetname" );
    acti = getEnt( "jump_p", "targetname" );
       
       
       
     while(1)
    {
        level.final_jump_trig waittill( "trigger", player );
        if( !isDefined( level.final_jump_trig ) )
            return;
       
                level.final_sniper_trig delete();
                level.final_knife_trig delete();
                //level.final_jump_trig delete();
                    AmbientStop( 4 );
                        wait 1;
                        AmbientPlay ("song2" );
 
     
         player.health = player.maxhealth;
                 level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
                player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        player FreezeControls(1);
                level.activ FreezeControls(1);
                noti = SpawnStruct();
                                noti.titleText = "^7Bounce Room";
                                noti.notifyText = level.activ.name + " ^3VS^7 " + player.name;
                                noti.glowcolor = (0.9,0,0.9);
                                noti.duration = 5;
                                players = getentarray("player", "classname");
                                for(i=0;i<players.size;i++)
                                        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                                wait 5;
                                player FreezeControls(0);
                                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}
 
knife()
{
 
        level.final_knife_trig = getEnt( "final_knife_trig", "targetname");
    jump = getEnt( "enter_jumper_k", "targetname" );
    acti = getEnt( "activator_enter_k", "targetname" );
               
               
               
     while(1)
    {
        level.final_knife_trig waittill( "trigger", player );
        if( !isDefined( level.final_knife_trig ) )
            return;
       
                level.final_sniper_trig delete();
                //level.final_knife_trig delete();
                level.final_jump_trig delete();
            AmbientStop( 4 );
                        wait 1;
                        AmbientPlay ("song3" );
     
         player.health = player.maxhealth;
                 level.activ.health = level.activ.maxhealth;
                player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );
                player GiveWeapon( "knife_mp" );        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
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
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}