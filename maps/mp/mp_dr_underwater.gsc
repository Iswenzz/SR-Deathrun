main()
{
maps\mp\_teleport2::main();
level.Underwater = "Underwater";

precacheItem( "ak47_mp" );

thread end();
thread addtriggers();
thread secretfinish();
thread knife();
thread sniper();
thread door();
thread old_door();
thread mapby();
thread lift();
thread lift2();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread music();
thread secret();
}

addtriggers()
{
    addTriggerToList("trap1_trig");
    addTriggerToList("trap2_trig");
    addTriggerToList("trap3_trig");
    addTriggerToList("trap4_trig");
    addTriggerToList("trap5_trig");
    addTriggerToList("trap6_trig");
    addTriggerToList("trap7_trig");
    addTriggerToList("trap8_trig");
}

addTriggerToList( name )
{
  if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
  level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

Secretfinish()
{
 
        trig = getent("teleport","targetname");
        tele = getent("secret_finish", "targetname");
       
        while(1)
        {
                        trig waittill("trigger", player);						
						wait 1.0;
                        iprintlnbold( "^1 "+ player.name +"^7 is ^3Godlike!");
				player setorigin(tele.origin);				
				player TakeAllWeapons();
                player GiveWeapon( "ak47_mp" );      
				player GiveMaxAmmo( "ak47_mp" );
                player switchToWeapon( "ak47_mp" );
        }
}

mapby()
{
trigger = getent ("mapby", "targetname");
while(1)
{
trigger waittill ("trigger", user);
wait(1);
user iprintlnBold ("^1Map by ^3Fahman");
wait(1);
user iprintln ("^1Thanks to ^3Dolphin");
wait(1);
user iprintln ("^1Thanks to ^3Wav3yMario");
wait(1);
user iprintln ("^1Thanks to ^3Ares|Opti");
}
}

door()
{
door = getent("door", "targetname");
{
wait 15;
door movez (-450,5,0,0.1);
iprintlnbold("^7Start door is ^3opening^7");
door waittill ("movedone");
door delete();
}
}

old_door()
{
knif = getent("knif_trig", "targetname");
snip = getent("snip_trig", "targetname");
door = getent("old_door", "targetname");
trigger = getent ("trig_old", "targetname");
trigger sethintstring("Press [USE] to open old Door");
{
trigger waittill("trigger", who);
trigger delete();
knif delete();
snip delete();

ambientstop(20);
ambientPlay( "dub1" );
iprintln ("^7Now playing: ^6Kid Sister - Pro Nails (Rusko Dubstep Remix)");
iprintlnbold("^7Old door is ^3opening^7");
door movez (352,5,0,0.1);
door waittill ("movedone");
door delete();
}
}

lift()
{
lift=getent("lift","targetname");
lift_trig=getent("lift_trig","targetname");
while (1)		
{
lift_trig waittill ("trigger");
lift movez (-370,4,1.1);
lift waittill ("movedone");
wait(5);
lift movez (370,4,1.1);
lift waittill("movedone");
wait(1);
}
}

trap1()
{
trap1 = getent("trap1", "targetname");
trap1b = getent("trap1b", "targetname");
trap1c = getent("trap1c", "targetname");
trig = getent("trap1_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 1");

trig waittill("trigger", who);
trig delete();
while ( 1 )
{

wait 0.1;

trap1b rotateyaw(-360,5);
trap1c rotateyaw(-360,5);
trap1 rotateyaw(-360,8);
}
}

trap2()
{
trap2 = getent("trap2", "targetname");
trig = getent("trap2_trig", "targetname");

trig sethintstring("Press [USE] to activate Trap 2");
trig waittill("trigger", who);
trig delete();

trap2 movez (-100,4,1,2);
wait (7);
trap2 movez (100,4,1,2);
wait (1.1);
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
trap3 rotateyaw(-360,1);
}
}

trap4()
{
trap4 = getent("trap4", "targetname");
trap4b = getent("trap4b", "targetname");
trig = getent("trap4_trig","targetname");

trig sethintstring("Press [USE] to activate Trap 4");
trig waittill("trigger", who);
trig delete();

trap4 movex (-192,2.5,1,1);
wait (0.1);
trap4b movex (192,2.5,1,1);
wait (8);
trap4 movex (192,2.5,1,1);
wait (0.1);
trap4b movex (-192,2.5,1,1);
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
trap5 rotateyaw(-360,1.3);
}
}
		
lift2()
{
lift2=getent("lift2","targetname");
lift2_trig=getent("lift2_trig","targetname");
while (1)		
{
lift2_trig waittill ("trigger");
lift2 movey(550,3,1.1);
lift2 waittill ("movedone");
wait(5);
lift2 movey(-550,3,1,1);
lift2 waittill("movedone");
wait(1);
}
}

trap6()
{
trap6 = getent("trap6", "targetname");
trig = getent("trap6_trig", "targetname");
hurt = getent("trap6_hurt", "targetname");
trig sethintstring("Press [USE] to activate Trap 6");
trig waittill("trigger", who);
trig delete();

hurt enablelinkto();
hurt linkto(trap6);

trap6 movez(208,2);
wait (4);
trap6 movez(-208,2);
}

trap7()
{
trap7 = getent("trap7", "targetname");
trig = getent("trap7_trig", "targetname");
trig sethintstring("Press [USE] to activate Trap 7");
trig waittill("trigger", who);
trig delete();
{
trap7 movex(-259,2,1,1);
trap7 waittill("movedone");
wait (4);
trap7 movex(259,2,1,1);
}
}

trap8()
{
trap8 = getent("trap8", "targetname");
trig = getent("trap8_trig", "targetname");
hurt = getent("trap8_hurt", "targetname");
trig sethintstring("Press [USE] to activate Trap 8");
trig waittill("trigger", who);
trig delete();

hurt enablelinkto();
hurt linkto(trap8);

trap8 movez(112,4);
wait (4);
trap8 movez(-112,4);
}

music()
{
    level waittill( "round_started" );
    
    wait 1;
    
    ambientPlay( "dub" );
	iprintln ("^7Now playing: ^6Kid Cudi - Pursuit Of Happiness ft. MGMT ");
}

secret()
{
door = getent("secret", "targetname");
trigger = getent ("trig_secret", "targetname");
{
trigger waittill("trigger", who);
door movez (352,1,0,0.1);
door waittill ("movedone");
door delete();
}
}

sniper()
{
        old = getent ("trig_old", "targetname");
		level.snip_trig = getEnt( "snip_trig", "targetname");
        jump = getEnt( "j_snip", "targetname" );
        acti = getEnt( "a_snip", "targetname" );
       
        while(1)
        {
                level.snip_trig waittill( "trigger", player );
                if( !isDefined( level.snip_trig ) )
                        return;
               
			    level.knif_trig delete();
				old delete();
		
		ambientstop(20);
		ambientPlay( "dub2" );
        iprintln ("^7Now playing: ^6Naruto The Raising Fighting Spirit Dubstep");
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
                player switchToWeapon( "m40a3_mp" );
                level.activ SwitchToWeapon( "m40a3_mp" );
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

knife()
{
        old = getent ("trig_old", "targetname");
		level.knif_trig = getEnt( "knif_trig", "targetname");
        jump = getEnt( "j_knif", "targetname" );
        acti = getEnt( "a_knif", "targetname" );
       
	while(1)
	{
		level.knif_trig waittill( "trigger", player );
		if( !isDefined( level.knif_trig ) )
			return;
		
		level.snip_trig delete();
		old delete();
		
		ambientstop(20);
		ambientPlay( "dub3" );
        iprintln ("^7Now playing: ^6Cracks Flux Pavilion Remix");
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

end()
{
	trig = getEnt("endmap_trig","targetname");
	trig waittill("trigger",player);	
	{
	iPrintLnBold("^5"+player.name+" "+"^6"+"reached the end!");
}
}