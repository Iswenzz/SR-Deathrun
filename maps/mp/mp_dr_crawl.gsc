main()
{
precacheItem("rpg_mp");
PreCacheItem("deserteaglegold_mp");
        PreCacheItem("winchester1200_mp");
        PreCacheItem("skorpion_mp");
        PreCacheItem("remington700_mp");
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread trap8();
thread sniper_room();
thread knife_room();
thread wave_room();
thread givewep();
ambientPlay("epic");
addTriggerToList( "t1" );
		addTriggerToList( "t2" );
		addTriggerToList( "t3" );
		addTriggerToList( "t4" );
		addTriggerToList( "t5" );
		addTriggerToList( "t6" );
		addTriggerToList( "t7" );
		addTriggerToList( "t8" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

givewep()
{
        trigger = getEnt("wepsniper", "targetname");
        precacheItem("deserteaglegold_mp");    
        while(1)
        {
                trigger waittill("trigger", player);
                player takeallweapons();
                player GiveWeapon("deserteaglegold_mp");
                player SwitchToWeapon( "deserteaglegold_mp" );
        }
}


trap1()
{
trap1a = getent ("b1a", "targetname");
trap1b = getent ("b1b", "targetname");
trig1 = getent ("t1", "targetname");

trig1 waittill ("trigger");
trig1 delete();

	for(;;)
	{
		trap1a rotateRoll (-360, 3);
		trap1b rotateRoll (360, 3);
		wait 3;
	}
}

trap2()
{
brush = getEnt ("b2", "targetname");
trig = getEnt ("t2", "targetname");
trig waittill ("trigger");
trig delete();

brush moveX (584,1);
wait 1;
brush moveX (-584,1);
wait 1;
}

trap3()
{
brush = getEnt ("b3", "targetname");
trig = getEnt ("t3", "targetname");
trig waittill ("trigger");
trig delete();

brush moveY (-480,1);
wait 1;
brush moveY (480,1);
wait 1;
}

trap4()
{
brush = getEnt ("b4", "targetname");
trig = getEnt ("t4", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}

trap5()
{
brush = getEnt ("b5", "targetname");
trig = getEnt ("t5", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}


trap6()
{
brush = getEnt ("b6", "targetname");
trig = getEnt ("t6", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
wait 1;
}


 trap7()
{
   trig = getEnt ("t7" , "targetname");
   brush = getEnt ("b7trap" ,"targetname" );
   hurt = getEnt ("b7hurt" , "targetname");
   trig waittill ("trigger", player);  
   trig delete();  
   
   hurt enablelinkto();
   hurt linkto (brush);
  
    brush moveY (-710,5);
	wait 5;
    brush moveY (710,5);
	wait 5;
}

trap8()
{
brush = getEnt ("b8", "targetname");
trig = getEnt ("t8", "targetname");
trig waittill ("trigger");
trig delete();

brush moveZ (-314,1);
wait 1;
brush moveZ (314,1);
}


sniper_room()
{
    level.sniper_trig = getEnt( "sniper_room", "targetname");
        jump = getEnt( "sniper_jump", "targetname" );
        acti = getEnt( "sniper_acti", "targetname");
   
        while(1)
        {
                level.sniper_trig waittill( "trigger", player );
                if( !isDefined( level.sniper_trig ) )
                        return;
               
                level.wave_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "remington700_mp" );        
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "remington700_mp" );          
                wait 0.05;
                player switchToWeapon( "remington700_mp" );
                level.activ SwitchToWeapon( "remington700_mp" );
                iPrintlnBold( " ^6" + player.name + " has chosen snipe room!" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}              

knife_room()
{
    level.knife_trig = getEnt( "kroom", "targetname");
        jump = getEnt( "knife_jump", "targetname");
        acti = getEnt( "knife_acti", "targetname");
   
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.wave_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "tomahawk_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "tomahawk_mp" );              
                wait 0.05;
                player switchToWeapon( "tomahawk_mp" );
                level.activ SwitchToWeapon( "tomahawk_mp" );
                iPrintlnBold( " ^6" + player.name + " has chosen knife room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}
 
 
 wave_room()
{
    level.wave_trig = getEnt( "wave_room", "targetname");
        jump = getEnt( "wave_jump", "targetname");
        acti = getEnt( "wave_acti", "targetname");
   
        while(1)
        {
                level.wave_trig waittill( "trigger", player );
                if( !isDefined( level.wave_trig ) )
                        return;
               
                level.sniper_trig delete();
                level.knife_trig delete();
                                 
                                     
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "rpg_mp" );            
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ TakeAllWeapons();
                level.activ GiveWeapon( "rpg_mp" );              
                wait 0.05;
                player switchToWeapon( "rpg_mp" );
                level.activ SwitchToWeapon( "rpg_mp" );
                iPrintlnBold( " ^6" + player.name + " has chosen wave room" );                //change it as you wish
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
        }
}
 