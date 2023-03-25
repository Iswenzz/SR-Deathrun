main()
{
maps\mp\_teleport::main();
maps\mp\_teleport2::main();
maps\mp\_teleport3::main();
maps\mp\_teleport4::main();
maps\mp\_teleport5::main();

precacheItem( "ak47_mp" );

thread music();
thread startdoor();
thread mapby();
thread addtriggers();
thread end();
thread secretenter();
thread b_weap();
thread bounce();
thread knife();
thread sniper();
thread k();
thread s();
thread b();
thread epic1();  
thread epic2();
thread epic3();
thread arrow2();
thread arrow1();
thread trap0b();
thread trap0a();
thread trap1();
thread trap2();
thread trap2b();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread lift();
thread lasers();
thread lasers2();
thread lasers3();
}

addtriggers()
{
    addTriggerToList("trap0_trig");
    addTriggerToList("trap1_trig");
    addTriggerToList("trap2_trig");
    addTriggerToList("trap3_trig");
    addTriggerToList("trap4_trig");
    addTriggerToList("trap5_trig");
    addTriggerToList("trap6_trig");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

music()
{
    level waittill( "round_started" );
    
    wait 1;
    
    ambientPlay( "dub" );
}

startdoor()
{
door = getent("door", "targetname");
{
wait 15;
door movez (-450,5,0,0.1);
iprintlnbold("^2Start door is ^3opening^7");
door waittill ("movedone");
door delete();
}
}

mapby()
{
level waittill( "round_started" );

wait(5);
thread drawInformation( 800, 0.8, 1, "Hardstyle" );
wait(4);
thread drawInformation( 800, 0.8, 1, "Map by Fahman" );
wait(1);
iprintln ("^2Thanks to ^1Wav3yMario");
wait(1);
iprintln ("^2Thanks to ^1Ares|Opti");
wait(1);
iprintln ("^2Thanks to ^1Ares|Galaxy");
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (9, 9, 9);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}

epic1()
{
epic = getent("epic", "targetname");

while ( 1 )
{

wait 0.1;

epic rotateroll(-360,3);
}
}

epic2()
{
epic2 = getent("epic2", "targetname");

while ( 1 )
{

wait 0.1;

epic2 rotateroll(-360,3);
}
}

epic3()
{
epic3 = getent("epic3", "targetname");

while ( 1 )
{

wait 0.1;

epic3 rotateroll(-360,3);
}
}

arrow1()
{
arrow1 = getent("arrow1", "targetname");

while ( 1 )
{

wait 0.1;

arrow1 movez( -34, 5, 1, 1 ); 
arrow1 waittill ("movedone");
arrow1 movez( 34, 5, 1, 1 ); 
arrow1 waittill ("movedone");
}
}

arrow2()
{
arrow2 = getent("arrow2", "targetname");

while ( 1 )
{

wait 0.1;

arrow2 movez( 34, 5, 1, 1 ); 
arrow2 waittill ("movedone");
arrow2 movez( -34, 5, 1, 1 ); 
arrow2 waittill ("movedone");
}
}

s()
{
s = getent("S", "targetname");

while ( 1 )
{

wait 0.1;

s rotateyaw(-360,7);
}
}

b()
{
b = getent("B", "targetname");

while ( 1 )
{

wait 0.1;

b rotateyaw(-360,7);
}
}

k()
{
k = getent("K", "targetname");

while ( 1 )
{

wait 0.1;

k rotateyaw(-360,7);
}
}

trap0b()
{
trap0b = getent("trap0b", "targetname");
trig = getent("trap0_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 0");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap0b rotateyaw(360,2);
}
}

trap0a()
{
trap0a = getent("trap0a", "targetname");
trig = getent("trap0_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 0");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap0a rotateyaw(-360,2);
}
}

trap1()
{
trap1 = getent("trap1", "targetname");
trig = getent("trap1_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 1");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap1 rotatepitch(360,3.5);
	}
}

trap2()
{
trap2 = getent("trap2", "targetname");
trig = getent("trap2_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 2");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap2 rotateroll(-360,2);
	}
}

trap2b()
{
trap2b = getent("trap2b", "targetname");
trig = getent("trap2_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 2");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap2b rotatepitch(-360,2);
	}
}
	
trap3()
{
trap3 = getent("trap3", "targetname");
trig = getent("trap3_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 3");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap3 rotateyaw(-360,5);
}
}

trap4()
{
trap4a = getent("trap4a", "targetname");
trap4b = getent("trap4b", "targetname");
trap4c = getent("trap4c", "targetname");
trig = getent("trap4_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 4");
trig waittill("trigger", who);
trig delete();
{
trap4a movez ( -112, 2, 1, 1 ); 
trap4a waittill ("movedone");
trap4b movez ( -112, 2, 1, 1 ); 
trap4b waittill ("movedone");
trap4c movez ( -112, 2, 1, 1 ); 
trap4c waittill ("movedone");
trap4a movez ( 112, 2, 1, 1 ); 
trap4a waittill ("movedone");
trap4b movez ( 112, 2, 1, 1 ); 
trap4b waittill ("movedone");
trap4c movez ( 112, 2, 1, 1 ); 
trap4c waittill ("movedone");
}
}

trap5()
{
trap5 = getent("trap5", "targetname");
trig = getent("trap5_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 5");
trig waittill("trigger", who);
trig delete();
while ( 1 )
{
wait 0.1;
trap5 rotateyaw(-360,2);
}
}

trap6()
{
trap6a = getent("trap6a", "targetname");
trap6b = getent("trap6b", "targetname");
hurt1 = getent("hurt1", "targetname");
hurt2 = getent("hurt2", "targetname");
trig = getent("trap6_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 6");

trig waittill("trigger", who);
trig delete();

hurt1 enablelinkto();
hurt1 linkto(trap6a);

hurt2 enablelinkto();
hurt2 linkto(trap6b);

while ( 1 )
{

wait 0.1;

trap6a rotateyaw(360,3);
trap6b rotateyaw(-360,3);
}
}

lift()
{
lift=getent("lift","targetname");		
while ( 1 )
{
wait 0.1;
lift movex (1056,6,1.1);
lift waittill ("movedone");
wait(5);
lift movex (-1056,6,1.1);
lift waittill("movedone");
wait(5);
}
}

lasers()
{
laser1=getent("laser1","targetname");		
laser1_hurt=getent("laser1_hurt","targetname");

laser1_hurt enablelinkto();
laser1_hurt linkto(laser1);

while ( 1 )
{
wait 0.1;
laser1 movez (-202,0.5,0.5);
laser1 waittill("movedone");
wait 0.1;
laser1 movez (202,0.5,0.5);
laser1 waittill("movedone");
wait 0.1;
}
}

lasers2()
{	
laser2=getent("laser2","targetname");	
laser2_hurt=getent("laser2_hurt","targetname");

laser2_hurt enablelinkto();
laser2_hurt linkto(laser2);


while ( 1 )
{
wait 0.1;
laser2 movez (202,0.5,0.5);
laser2 waittill("movedone");
wait 0.1;
laser2 movez (-202,0.5,0.5);
laser2 waittill("movedone");
wait 0.1;
}
}

lasers3()
{
laser3=getent("laser3","targetname");
laser3_hurt=getent("laser3_hurt","targetname");

laser3_hurt enablelinkto();
laser3_hurt linkto(laser3);


while ( 1 )
{
wait 0.1;
laser3 movez (-202,0.5,0.5);
laser3 waittill("movedone");
wait 0.1;
laser3 movez (202,0.5,0.5);
laser3 waittill("movedone");
wait 0.1;
}
}

sniper()
{
		level.snip_trig = getEnt( "s_trig", "targetname");
        jump = getEnt( "j_snip", "targetname" );
        acti = getEnt( "a_snip", "targetname" );
       
        while(1)
        {
                level.snip_trig waittill( "trigger", player );
                if( !isDefined( level.snip_trig ) )
                        return;
		
		level.knif_trig delete();    
		level.boun_trig delete(); 
		
			   
		ambientstop(20);
		ambientPlay( "dub2" ); 
		player freezeControls( true );                              
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m40a3_mp" );      
				player GiveWeapon( "remington700_mp" );  
				player GiveMaxAmmo( "m40a3_mp" );
				player GiveMaxAmmo( "remington700_mp" );
		level.activ freezeControls( true );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "remington700_mp" );  
				level.activ GiveWeapon( "m40a3_mp" );          
                level.activ GiveMaxAmmo( "m40a3_mp" ); 
				level.activ GiveMaxAmmo( "remington700_mp" );
				wait 0.05;
                player switchToWeapon( "remington700_mp" );
                level.activ SwitchToWeapon( "remington700_mp" );
        noti = SpawnStruct();
        noti.titleText = "^2--^6SNIPE BATTLE^2--";
        noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+"";
        noti.duration = 20;
        noti.glowcolor = (0,1,1);
        players = getEntArray("player", "classname");
        for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                player thread countdown();
                level.activ thread countdown();
                                     while( isAlive( player ) && isDefined( player ) )
                        wait 1;
                        iPrintlnBold( " ^9" + player.name + "^7 has been killed by ^9"+ level.activ.name+ "^7" );
                        player iPrintlnBold( "^1Please do not respawn." );
                        wait 2;
                        player suicide();
        }
}

countdown()
{
self iprintlnBold("^33");
wait 1;
self iprintlnBold("^22");
wait 1;
self iprintlnBold("^11");
wait 3;
self iprintlnBold("^8FIGHT!");
self freezeControls( false );
}	

knife()
{
		level.knif_trig = getEnt( "k_trig", "targetname");
        jump = getEnt( "j_knif", "targetname" );
        acti = getEnt( "a_knif", "targetname" );
       
	while(1)
	{
		level.knif_trig waittill( "trigger", player );
		if( !isDefined( level.knif_trig ) )
			return;
		
		level.snip_trig delete();
		level.boun_trig delete();
		
		ambientstop(20);
		ambientPlay( "dub3" );
		player freezeControls( true );                              
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );	
        level.activ freezeControls( true );  		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );		
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
        noti = SpawnStruct();      	
		noti.titleText = "^2--^3KNIFE BATTLE^2--";
        noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+"";
        noti.duration = 20;
        noti.glowcolor = (0,1,1);
        players = getEntArray("player", "classname");
        for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                player thread countdown();
                level.activ thread countdown();
                                     while( isAlive( player ) && isDefined( player ) )
                        wait 1;
                        iPrintlnBold( " ^9" + player.name + "^7 has been killed by ^9"+ level.activ.name+ "^7" );
						player iPrintlnBold( "^1Please do not respawn." );
                        wait 2;
                        player suicide();
        }
		}

bounce()
{
		level.boun_trig = getEnt( "b_trig", "targetname");
        jump = getEnt( "j_boun", "targetname" );
        acti = getEnt( "a_boun", "targetname" );
       
	while(1)
	{
		level.boun_trig waittill( "trigger", player );
		if( !isDefined( level.boun_trig ) )
			return;
		
		level.snip_trig delete();
		level.knif_trig delete();
		
		ambientstop(20);
		ambientPlay( "dub4" );
		player freezeControls( true );                              
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" );	
        level.activ freezeControls( true );  		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "knife_mp" );		
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ SwitchToWeapon( "knife_mp" );
        noti = SpawnStruct();      	
		noti.titleText = "^2--^3BOUNCE^2--";
        noti.notifyText ="^2"+player.name + " ^1VS ^2"+level.activ.name+"";
        noti.duration = 20;
        noti.glowcolor = (0,1,1);
        players = getEntArray("player", "classname");
        for(i=0;i<players.size;i++)
                players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
                player thread countdown();
                level.activ thread countdown();
                                     while( isAlive( player ) && isDefined( player ) )
                        wait 1;
                        iPrintlnBold( " ^9" + player.name + "^7 has been killed by ^9"+ level.activ.name+ "^7" );
						player iPrintlnBold( "^1Please do not respawn." );
                        wait 2;
                        player suicide();
        }
}

b_weap()
{
 
        trig = getent("b_weap","targetname");
        trig sethintstring("Press [USE] to pick up ak47");
	   
        while(1)
        {
                        trig waittill("trigger", player);									
				player TakeAllWeapons();
                player GiveWeapon( "ak47_mp" );      
				player GiveMaxAmmo( "ak47_mp" );
                player switchToWeapon( "ak47_mp" );
        }
}

secretenter()
{
 
        trig = getent("secret_enter2","targetname");
       
        while(1)
        {
                        trig waittill("trigger", player);						
						wait 1.0;
                        iprintlnbold( "^1 "+player.name+" ^3found secret!");			
        }
}

end()
{
	trig = getEnt("map_finish","targetname");
	trig waittill("trigger",player);	
	{
	iPrintLnBold("^5"+player.name+" "+"^6"+"reached the end first!");
}
}	

