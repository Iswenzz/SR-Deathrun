main()
{
	addTriggerToList( "trig_trap_1" );
	addTriggerToList( "trig_trap_2" );
	addTriggerToList( "trig_trap_3" );
	addTriggerToList( "trig_trap_4" );
	addTriggerToList( "trig_trap_5" );
	addTriggerToList( "trig_trap_6" );
	addTriggerToList( "trig_trap_7" );
	addTriggerToList( "trig_trap_8" );
	addTriggerToList( "trig_trap_9" );
	addTriggerToList( "trig_trap_10" );
	addTriggerToList( "trig_trap_11" );
	addTriggerToList( "trig_trap_12" );
	addTriggerToList( "trig_trap_13" );
	addTriggerToList( "trig_trap_16" );

 maps\mp\_load::main();
 ambientPlay("mapsong");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 thread finalFight1();
 thread finalFight2();
 thread finalFight3();
 thread finalFight4();
 thread activator1();
 thread activator2();
 thread activator3();
 thread activator4();
 thread activator5();
 thread activator6();
 thread activator7();
 thread activator8();
 thread activator9();
 thread activator10();
 thread jumproompod1();
 thread jumproompod2();
 thread trap0();
 thread trap1();
 thread trap2();
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
 thread trap16();
 thread trap18();
 thread trap19();
 thread vrata1();
 thread vrata2();
 thread vrata3();
 thread vrata4();
 thread automove1();
 thread automove2();
 thread automove3();
 thread printCredits();
 thread secretroom();
 thread secret();
 thread pad1();
 thread pad2();
 thread pad3();
 thread pad4();
 thread pad5();
 thread pad6();
 thread pad7();
 thread pad8();
 thread pad9();
 thread pad10();
 thread pad11();
 thread pad12();
 thread pad13();
 thread pad14();
 thread pad15();
 thread pad16();
 thread pad17();
 thread pad18();
 thread pad19();
 thread pad20();
 thread pad21();
 thread pad22();
 thread pad23();
 thread pad24();
 thread specialroom();
 thread specialroom2();
 thread specialroom3();
 thread specialroom4();
 thread specialroom5();
 thread specialroom6();
 thread specialroom7();
 thread creator();

 level.dvar["time_limit"] = 6;

level.firsttime=true;

level.dvar["time_limit"] = 6;
	level.dvar["dr_timelimit"]=6;

}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}




 finalFight1()
{
    level.knife_trig = getEnt( "kniferoom", "targetname");
    jump = getEnt( "knife", "targetname" );
    acti = getEnt( "actiknife", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.bounce_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^3" + player.name + " ^7 HAS CHOSEN KNIFE^5!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}




 finalFight2()
{
    level.knife_trig = getEnt( "sniproom", "targetname");
    jump = getEnt( "scope", "targetname" );
    acti = getEnt( "actiscope", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.bounce_trig delete();
		level.firstenter=false;
		}
		
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
        iPrintlnBold( " ^3" + player.name + " ^7 HAS CHOSEN SCOPE^5!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}



 finalFight3()
{
    level.knife_trig = getEnt( "oldroom", "targetname");
    jump = getEnt( "old", "targetname" );
    acti = getEnt( "actiold", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.bounce_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^3" + player.name + " ^7 HAS CHOSEN OLD^5!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}




 finalFight4()
{
    level.knife_trig = getEnt( "jumproom", "targetname");
    jump = getEnt( "jump", "targetname" );
    acti = getEnt( "actijump", "targetname" );
    
    while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        if(level.firstenter==true)
		{
                level.snipe_trig delete();
                level.oldtrigger delete();
 		level.bounce_trig delete();
		level.firstenter=false;
		}
		
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "knife_mp" );       
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "knife_mp" );        
        wait 0.05;
        player switchToWeapon( "knife_mp" );
        level.activ SwitchToWeapon( "knife_mp" );
        iPrintlnBold( " ^3" + player.name + " ^7 HAS CHOSEN JUMP^5!" );
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}



 

 activator1()

{
  trig = getEnt( "teleport1", "targetname"); 
  target = getEnt( "actiteleport1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator2()

{
  trig = getEnt( "teleport2", "targetname"); 
  target = getEnt( "actiteleport2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}



activator3()

{
  trig = getEnt( "teleport3", "targetname"); 
  target = getEnt( "actiteleport3", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator4()

{
  trig = getEnt( "teleport4", "targetname"); 
  target = getEnt( "actiteleport4", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator5()

{
  trig = getEnt( "teleport5", "targetname"); 
  target = getEnt( "actiteleport5", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator6()

{
  trig = getEnt( "teleport6", "targetname"); 
  target = getEnt( "actiteleport6", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator7()

{
  trig = getEnt( "teleport7", "targetname"); 
  target = getEnt( "actiteleport7", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator8()

{
  trig = getEnt( "teleport8", "targetname"); 
  target = getEnt( "actiteleport8", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

activator9()

{
  trig = getEnt( "teleport9", "targetname"); 
  target = getEnt( "actiteleport9", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


activator10()

{
  trig = getEnt( "teleport10", "targetname"); 
  target = getEnt( "actiteleport10", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

jumproompod1()

{
  trig = getEnt( "jumpfail", "targetname"); 
  target = getEnt( "jumprespawn", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


jumproompod2()

{
  trig = getEnt( "jumpfail2", "targetname"); 
  target = getEnt( "jumprespawn2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


trap0()

{

trig = getEnt( "trig_trap0", "targetname" );

object = getent("trap0","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(1344, 5);

wait(15);

object movez(-1344, 5);

wait(15);
 
}

}



trap1()

{

trig = getEnt( "trig_trap1", "targetname" );

object = getent("trap1","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(2624, 5);

wait(15);

object movez(-2624, 5);

wait(15);
 
}

}



trap2()

{

trig = getEnt( "trig_trap2", "targetname" );

object1 = getent("trap2a","targetname");
object2 = getent("trap2b","targetname");
object3 = getent("trap2c","targetname");
object4 = getent("trap2d","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(5)

{

object1 rotateyaw(-720, 3);
object2 rotateyaw(-720, 3);
object3 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object2 rotateyaw(720, 3);
object3 rotateyaw(720, 3);
object4 rotateyaw(720, 3);

wait(3);
 
}

}


trap3()

{

trig = getEnt( "trig_trap3", "targetname" );

object1 = getent("trap3a","targetname");
object2 = getent("trap3b","targetname");
object3 = getent("trap3c","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);

wait(1);

object2 rotateroll(360, 1);

wait(2);

object2 rotateroll(-360, 1);

wait(1);
 
object3 rotateroll(360, 1);

wait(2);

object3 rotateroll(-360, 1);

wait(1);

 
}

}

trap4()

{

trig = getEnt( "trig_trap4", "targetname" );

object1 = getent("trap4a","targetname");
object2 = getent("trap4b","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);
object2 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);
object2 rotateroll(-360, 1);

wait(2);

 
}

}



trap5()

{

trig = getEnt( "trig_trap5", "targetname" );

object1 = getent("trap5a","targetname");
object2 = getent("trap5b","targetname");
object3 = getent("trap5c","targetname");
object4 = getent("trap5d","targetname");
object5 = getent("trap5e","targetname");
object6 = getent("trap5f","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);
object5 rotateyaw(-720, 3);

wait(5);

object2 rotateyaw(-720, 3);
object3 rotateyaw(-720, 3);
object6 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object4 rotateyaw(720, 3);
object5 rotateyaw(720, 3);


wait(5);

object2 rotateyaw(720, 3);
object3 rotateyaw(720, 3);
object6 rotateyaw(720, 3);


wait(5);

}

}


trap6()

{

trig = getEnt( "trig_trap6", "targetname" );

object1 = getent("trap6a","targetname");
object2 = getent("trap6b","targetname");
object3 = getent("trap6c","targetname");
object4 = getent("trap6d","targetname");
object5 = getent("trap6e","targetname");
object6 = getent("trap6f","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotatepitch(720, 1);
object2 rotatepitch(-720, 1);
object3 rotatepitch(720, 1);
object4 rotatepitch(-720, 1);
object5 rotatepitch(720, 1);
object6 rotatepitch(-720, 1);


wait(3);

object1 rotatepitch(-720, 1);
object2 rotatepitch(720, 1);
object3 rotatepitch(-720, 1);
object4 rotatepitch(720, 1);
object5 rotatepitch(-720, 1);
object6 rotatepitch(720, 1);

wait(3);
 
 

}

}

trap7()

{

trig = getEnt( "trig_trap7", "targetname" );

object1 = getent("trap7a","targetname");
object2 = getent("trap7b","targetname");
object3 = getent("trap7c","targetname");
object4 = getent("trap7d","targetname");
 
trig waittill ("trigger");

trig delete();
 

{

object4 movez(80, 2);

wait(1);

object3 movez(80, 2);

wait(2);

object1 movex(30, 2);
object2 movex(-30, 2);

wait(2);

object1 movex(-30, 2);
object2 movex(30, 2);

wait(2);

object1 movez(-88, 2);
object2 movez(-88, 2);

wait(2);

object1 movez(88, 2);
object2 movez(88, 2);


wait(10);

object4 movez(-100, 2);
object3 movez(-100, 2);
 
}

}


trap8()
{
 
trig = getEnt( "trig_trap8", "targetname" );
trap8 = getEnt( "trap8a", "targetname" );
trap8a = getEnt( "trap8b", "targetname" );
killtrigger = getent ("trap8_hurt" , "targetname");
killtrigger2 = getent ("trap8_hurta" , "targetname");
 
trig waittill ("trigger");
trig delete();
 
while( 1 )
{

killtrigger enablelinkto ();

killtrigger linkto (trap8);
killtrigger2 linkto (trap8a);

trap8 movey(128, 1);
trap8a movey(-136, 1);

wait 2;

trap8 movey(-128, 1);
trap8a movey(136, 1);


wait 2;

}

}



trap9()

{

trig = getEnt( "trig_trap9", "targetname" );

object1 = getent("trap9","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 3);


wait(5);

object1 rotateroll(-360, 3);

wait(5);

 
}

}


trap10()

{

trig = getEnt( "trig_trap10", "targetname" );

object1 = getent("trap10a","targetname");
object2 = getent("trap10b","targetname");
object3 = getent("trap10c","targetname");
object4 = getent("trap10d","targetname");
object5 = getent("trap10e","targetname");
object6 = getent("trap10f","targetname");
object7 = getent("trap10g","targetname");
object8 = getent("trap10h","targetname");
object9 = getent("trap10i","targetname");
object10 = getent("trap10j","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-720, 3);
object2 rotateyaw(-720, 3);
object3 rotateyaw(-720, 3);
object4 rotateyaw(-720, 3);
object5 rotateyaw(-720, 3);
object6 rotateyaw(-720, 3);
object7 rotateyaw(-720, 3);
object8 rotateyaw(-720, 3);
object9 rotateyaw(-720, 3);
object10 rotateyaw(-720, 3);

wait(5);

object1 rotateyaw(720, 3);
object2 rotateyaw(720, 3);
object3 rotateyaw(720, 3);
object4 rotateyaw(720, 3);
object5 rotateyaw(720, 3);
object6 rotateyaw(720, 3);
object7 rotateyaw(720, 3);
object8 rotateyaw(720, 3);
object9 rotateyaw(720, 3);
object10 rotateyaw(720, 3);

wait(5);
 

}

}


trap11()

{

trig = getEnt( "trig_trap11", "targetname" );

object = getent("trap11","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object rotateroll(360, 1);

wait(3);

object rotateroll(-360, 1);

wait(3);

}

}


trap12()

{

trig = getEnt( "trig_trap12", "targetname" );

object1 = getent("trap12a","targetname");
object2 = getent("trap12b","targetname");
object3 = getent("trap12c","targetname");
object4 = getent("trap12d","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(360, 1);
object2 rotateyaw(360, 1);
object3 rotateyaw(360, 1);
object4 rotateyaw(360, 1);

wait(2);

object1 rotateyaw(-360, 1);
object2 rotateyaw(-360, 1);
object3 rotateyaw(-360, 1);
object4 rotateyaw(-360, 1);

wait(2); 


}

}


trap13()

{

trig = getEnt( "trig_trap13", "targetname" );

object1 = getent("trap13a","targetname");
object2 = getent("trap13b","targetname");
object3 = getent("trap13c","targetname");
object4 = getent("trap13d","targetname");
object5 = getent("trap13e","targetname");
object6 = getent("trap13f","targetname");
object7 = getent("trap13g","targetname");
object8 = getent("trap13h","targetname");
object9 = getent("trap13i","targetname");
object10 = getent("trap13j","targetname");
object11 = getent("trap13k","targetname");
object12 = getent("trap13l","targetname");
object13 = getent("trap13lj","targetname");
object14 = getent("trap13m","targetname");
object15 = getent("trap13n","targetname");
object16 = getent("trap13nj","targetname");




 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(-360, 3);
object2 rotateyaw(-360, 3);
object3 rotateyaw(-360, 3);
object4 rotateyaw(-360, 3);
object5 rotateyaw(-360, 3);
object6 rotateyaw(-360, 3);
object7 rotateyaw(-360, 3);
object8 rotateyaw(-360, 3);
object9 rotateyaw(-360, 3);
object10 rotateyaw(-360, 3);
object11 rotateyaw(-360, 3);
object12 rotateyaw(-360, 3);
object13 rotateyaw(-360, 3);
object14 rotateyaw(-360, 3);
object15 rotateyaw(-360, 3);
object16 rotateyaw(-360, 3);

wait(5);

object1 rotateyaw(360, 3);
object2 rotateyaw(360, 3);
object3 rotateyaw(360, 3);
object4 rotateyaw(360, 3);
object5 rotateyaw(360, 3);
object6 rotateyaw(360, 3);
object7 rotateyaw(360, 3);
object8 rotateyaw(360, 3);
object9 rotateyaw(360, 3);
object10 rotateyaw(360, 3);
object11 rotateyaw(360, 3);
object12 rotateyaw(360, 3);
object13 rotateyaw(360, 3);
object14 rotateyaw(360, 3);
object15 rotateyaw(360, 3);
object16 rotateyaw(360, 3);

wait(5);
 

}

}

trap14()

{

trig = getEnt( "trig_trap14", "targetname" );

object1 = getent("trap14a","targetname");
object2 = getent("trap14b","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 movey(-88, 1);
object2 movey(88, 1);

wait(2);

object1 movey(88, 1);
object2 movey(-88, 1);

wait(2);

 
}

}

trap15()

{

trig = getEnt( "trig_trap15", "targetname" );

object1 = getent("trap15a","targetname");
object2 = getent("trap15b","targetname");
object3 = getent("trap15c","targetname");
object4 = getent("trap15d","targetname");


 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateroll(360, 1);

wait(2);

object1 rotateroll(-360, 1);

wait(1);

object2 rotateroll(360, 1);

wait(2);

object2 rotateroll(-360, 1);

wait(1);
 
object3 rotateroll(360, 1);

wait(2);

object3 rotateroll(-360, 1);

wait(1);

object4 rotateroll(360, 1);

wait(2);

object4 rotateroll(-360, 1);

wait(1); 


}

}

trap16()

{

trig = getEnt( "trig_trap16", "targetname" );

object1 = getent("trap16a","targetname");
object2 = getent("trap16b","targetname");
object3 = getent("trap16c","targetname");

trig waittill ("trigger");

trig delete();
 
while(1)

{

object1 rotateyaw(360, 1);
object2 rotateyaw(360, 1);
object3 rotateyaw(360, 1);

wait(2);

object1 rotateyaw(-360, 1);
object2 rotateyaw(-360, 1);
object3 rotateyaw(-360, 1);

wait(2);

 
}

}


trap17()

{

object = getent("trap17","targetname");

while(1)

{

object movez(-40, 1);

wait(1);

object movez(40, 1);

wait(1);

 
}

}


trap18()

{

trig = getEnt( "trig_trap18a", "targetname" );

object = getent("trap18b","targetname");

 
trig waittill ("trigger");

trig delete();

{

object movez(-128, 5);

wait(1);

}

}


trap19()

{

trig = getEnt( "trig_trap19", "targetname" );

object = getent("trap19b","targetname");

trig waittill ("trigger");

trig delete();
 

{

object movez(-128, 5);

wait(1);

}

}



vrata1()

{

trig = getEnt( "trig_trap25", "targetname" );

object = getent("trap25","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(-120, 5);

wait(3);


}

}


vrata2()

{

trig = getEnt( "trig_trap26", "targetname" );

object = getent("trap26","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(-120, 5);

wait(3);


}

}


vrata3()

{

trig = getEnt( "trig_trap27", "targetname" );

object = getent("trap27","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(-120, 5);

wait(3);


}

}


vrata4()

{

trig = getEnt( "trig_trap28", "targetname" );

object = getent("trap28","targetname");

 
trig waittill ("trigger");

trig delete();
 
while(1)

{

object movez(-120, 5);

wait(3);


}

}




automove1()


{


object1 = getent("trap20a","targetname");
object2 = getent("trap20b","targetname");
object3 = getent("trap20c","targetname");
object4 = getent("trap20d","targetname");
object5 = getent("trap20e","targetname");
object6 = getent("trap20f","targetname");
object7 = getent("trap20g","targetname");
object8 = getent("trap20h","targetname");
object9 = getent("trap20i","targetname");
object10 = getent("trap20j","targetname");
object11 = getent("trap20k","targetname");
object12 = getent("trap20l","targetname");


while(1)


{


object1 rotateyaw(-720, 7);
object2 rotateyaw(-720, 7);
object3 rotateyaw(-720, 7);
object4 rotateyaw(-720, 7);
object5 rotateyaw(-720, 7);
object6 rotateyaw(-720, 7);
object7 rotateyaw(-720, 7);
object8 rotateyaw(-720, 7);
object9 rotateyaw(-720, 7);
object10 rotateyaw(-720, 7);
object11 rotateyaw(-720, 7);
object12 rotateyaw(-720, 7);

wait(3);

object1 rotateyaw(720, 7);
object2 rotateyaw(720, 7);
object3 rotateyaw(720, 7);
object4 rotateyaw(720, 7);
object5 rotateyaw(720, 7);
object6 rotateyaw(720, 7);
object7 rotateyaw(720, 7);
object8 rotateyaw(720, 7);
object9 rotateyaw(720, 7);
object10 rotateyaw(720, 7);
object11 rotateyaw(720, 7);
object12 rotateyaw(720, 7);

wait(3);
 


}

}




automove2()

{


object1 = getent("trap21a","targetname");
object2 = getent("trap21b","targetname");
object3 = getent("trap21c","targetname");
object4 = getent("trap21d","targetname");
object5 = getent("trap21e","targetname");
object6 = getent("trap21f","targetname");
object7 = getent("trap21g","targetname");
object8 = getent("trap21h","targetname");
object9 = getent("trap21i","targetname");
object10 = getent("trap21j","targetname");
object11 = getent("trap21k","targetname");
object12 = getent("trap21l","targetname");
object13 = getent("trap21lj","targetname");
object14 = getent("trap21m","targetname");
object15 = getent("trap21n","targetname");
object16 = getent("trap21nj","targetname");

while(1)

{

object1 rotatepitch(720, 8);
object2 rotatepitch(720, 8);
object3 rotatepitch(720, 8);
object4 rotatepitch(720, 8);
object5 rotatepitch(720, 8);
object6 rotatepitch(720, 8);
object7 rotatepitch(720, 8);
object8 rotatepitch(720, 8);
object9 rotatepitch(720, 8);
object10 rotatepitch(720, 8);
object11 rotatepitch(720, 8);
object12 rotatepitch(720, 8);
object13 rotatepitch(720, 8);
object14 rotatepitch(720, 8);
object15 rotatepitch(720, 8);
object16 rotatepitch(720, 8);


wait(1);

object1 rotatepitch(720, 8);
object2 rotatepitch(720, 8);
object3 rotatepitch(720, 8);
object4 rotatepitch(720, 8);
object5 rotatepitch(720, 8);
object6 rotatepitch(720, 8);
object7 rotatepitch(720, 8);
object8 rotatepitch(720, 8);
object9 rotatepitch(720, 8);
object10 rotatepitch(720, 8);
object11 rotatepitch(720, 8);
object12 rotatepitch(720, 8);
object13 rotatepitch(720, 8);
object14 rotatepitch(720, 8);
object15 rotatepitch(720, 8);
object16 rotatepitch(720, 8);



wait(1);
 

}

}


automove3()

{


object1 = getent("trap23","targetname");


{

wait(15);

object1 movez(168, 7);

wait(1);

iPrintlnBold("^5opening ^3the ^5door^3...^5!!!");

wait(7);

iPrintlnBold("^5The ^3doors ^5is ^3open ^5!!!");

wait(10);

}

}


automove4()

{


object1 = getent("trap24a","targetname");
object2 = getent("trap24b","targetname");
object3 = getent("trap24c","targetname");
object4 = getent("trap24d","targetname");

while(1)

{

object1 movey(-40, 5);
object4 movey(40, 5);

wait(3);

object1 movey(40, 5);
object4 movey(-40, 5);


wait(3);

object3 movey(40, 5);
object4 movey(-40, 5);


wait(3);

object1 movey(-40, 5);
object2 movey(40, 5);

wait(3);
 

}

}



printCredits()
    {
            if( isDefined( self.logoText ) )
                    self.logoText destroy();
     
            self.logoText = newHudElem();
            self.logoText.y = 10;
            self.logoText.alignX = "center";
            self.logoText.alignY = "middle";
            self.logoText.horzAlign = "center_safearea";
     
            self.logoText.alpha = 0;
            self.logoText.sort = -3;
            self.logoText.fontScale = 1.6;
            self.logoText.archieved = true;
     
            for(;;)
            {
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Map made by ^5Mr.Xx^3(mapper) & ^5MadLion^3(scripter)^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^5xf:^3dragec1997 ^5& ^3madlion3 ^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Additional ^5Help ^3: ^5 ERIK :P(^3xf: efh007)^1,^5eBc|TrikX(^3xf:denomajstor)^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 1;
                    self.logoText setText("^5---^3Apollo^5---");
                    wait 3;
                    self.logoText fadeOverTime(1);
                    self.logoText.alpha = 0;
                    wait 1;
                }
       
        }


creator()

{

while( 1 )

{

iPrintLn("^4Map made by ^5Mr.Xx^7(mapper) & ^5MadLion ^7(scripter)");

wait(60);


iPrintLn("^4xfire: ^5dragec1997 ^7& ^5madlion3");

wait(60);

}

}

secretroom()

{
 
ambientPlay("song2"); //pjesma

trig = getEnt( "secretdoortrig", "targetname" );

object = getEnt( "secretdoor", "targetname" );
 
trig waittill ("trigger");

{

iPrintlnBold("^1OMG ^5you ^7found ^5my ^7secret^5!!");

wait 60;

object movez(-120, 3 );

wait 2;
   
}

}


secret()

{
  trig = getEnt( "fuckingsecret", "targetname"); 
  target = getEnt( "fuckingsecretroom", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles );
 
}

}


pad1()

{
  trig = getEnt( "pod1", "targetname"); 
  target = getEnt( "povrat1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


pad2()

{
  trig = getEnt( "pod27", "targetname"); 
  target = getEnt( "povrat27", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}


pad3()

{
  trig = getEnt( "pod26", "targetname"); 
  target = getEnt( "povrat26", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 


}
}



pad4()

{
  trig = getEnt( "pod2", "targetname"); 
  target = getEnt( "povrat2", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}



pad5()

{
  trig = getEnt( "pod3", "targetname"); 
  target = getEnt( "povrat3", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}



pad6()

{
  trig = getEnt( "pod4", "targetname"); 
  target = getEnt( "povrat4", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad7()

{
  trig = getEnt( "pod5", "targetname"); 
  target = getEnt( "povrat5", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}



pad8()

{
  trig = getEnt( "pod6", "targetname"); 
  target = getEnt( "povrat6", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad9()

{
  trig = getEnt( "pod7", "targetname"); 
  target = getEnt( "povrat7", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad10()

{
  trig = getEnt( "pod8", "targetname"); 
  target = getEnt( "povrat8", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad11()

{
  trig = getEnt( "pod9", "targetname"); 
  target = getEnt( "povrat9", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad12()

{
  trig = getEnt( "pod10", "targetname"); 
  target = getEnt( "povrat10", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad13()

{
  trig = getEnt( "pod11", "targetname"); 
  target = getEnt( "povrat11", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad14()

{
  trig = getEnt( "pod12", "targetname"); 
  target = getEnt( "povrat12", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad15()

{
  trig = getEnt( "pod13", "targetname"); 
  target = getEnt( "povrat13", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad16()

{
  trig = getEnt( "pod14", "targetname"); 
  target = getEnt( "povrat14", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad17()

{
  trig = getEnt( "pod15", "targetname"); 
  target = getEnt( "povrat15", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad18()

{
  trig = getEnt( "pod16", "targetname"); 
  target = getEnt( "povrat16", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad19()

{
  trig = getEnt( "pod17", "targetname"); 
  target = getEnt( "povrat17", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad20()

{
  trig = getEnt( "pod18", "targetname"); 
  target = getEnt( "povrat18", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad21()

{
  trig = getEnt( "pod19", "targetname"); 
  target = getEnt( "povrat19", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad22()

{
  trig = getEnt( "pod20", "targetname"); 
  target = getEnt( "povrat20", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




pad23()

{
  trig = getEnt( "pod21", "targetname"); 
  target = getEnt( "povrat21", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}





pad24()

{
  trig = getEnt( "pod22", "targetname"); 
  target = getEnt( "povrat22", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

rooms()

{
  trig = getEnt( "finalroom", "targetname"); 
  target = getEnt( "final", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}

rooms2()

{
  trig = getEnt( "back", "targetname"); 
  target = getEnt( "back1", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 

}

}




specialroom()

{
 

trig = getEnt( "special1", "targetname" );

object = getEnt( "special1a", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object movez(88, 5 );

wait 1;
   
}

}


specialroom2()

{
 

trig = getEnt( "special2", "targetname" );

object1 = getEnt( "special2a", "targetname" );
object2 = getEnt( "special2b", "targetname" );
object3 = getEnt( "special2c", "targetname" );
object4 = getEnt( "special2d", "targetname" );
object5 = getEnt( "special2e", "targetname" );
object6 = getEnt( "special2f", "targetname" );
object7 = getEnt( "special2g", "targetname" );
object8 = getEnt( "special2h", "targetname" );
object9 = getEnt( "special2i", "targetname" );
object10 = getEnt( "special2j", "targetname" );
object11 = getEnt( "special2k", "targetname" );
object12 = getEnt( "special2l", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object1 movez(-56, 1 );
object2 movez(-40, 1 );
object3 movez(-64, 1 );
object4 movez(-80, 2 );
object5 movez(-120, 2 );
object6 movez(-96, 2 );
object7 movez(-48, 3 );
object8 movez(-72, 3 );
object9 movez(-32, 3 );
object10 movez(-104, 4 );
object11 movez(-128, 4 );
object12 movez(-152, 4 );

wait 1;
   
}

}


specialroom3()

{
 

trig = getEnt( "special3", "targetname" );

object = getEnt( "special3a", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object movez(120, 5 );

wait 1;
   
}

}



specialroom4()

{
 

trig = getEnt( "special4", "targetname" );

object = getEnt( "special4a", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object movez(120, 5 );

wait 1;
   
}

}


specialroom5()

{
 

trig = getEnt( "special5", "targetname" );

object = getEnt( "special5a", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object movez(120, 5 );

wait 1;
   
}

}




specialroom6()

{
 

trig = getEnt( "special6", "targetname" );

object = getEnt( "special6a", "targetname" );
 
trig waittill ("trigger");

{


wait 1;

object movez(88, 5 );

wait 1;
   
}

}



specialroom7()

{
 

trig = getEnt( "special7", "targetname" );

object1 = getEnt( "special7a", "targetname" );
object2 = getEnt( "special7b", "targetname" );
object3 = getEnt( "special7c", "targetname" );
object4 = getEnt( "special7d", "targetname" );

 
trig waittill ("trigger");

{


wait 1;

object1 movez(-88, 1 );
object2 movez(-120, 2 );
object3 movez(-96, 3 );
object4 movez(-136, 4 );

wait 1;
   
}

}
