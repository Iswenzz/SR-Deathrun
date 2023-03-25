main()
{
 maps\mp\_load::main();
 ambientPlay("mapsong");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

 thread trap0();
 thread trap1();
 thread trap2();
 thread trap3();
 thread trap5();
 thread trap6();
 thread teleport1();
 thread teleport2();
 thread teleport3();
 thread finalFight1();
 thread finalFight2();
 thread finalFight3();
 thread finalFight4();
 thread finalFight5();
 thread finalFight6();
 thread creator();

 addTriggerToList( "trig_trap1" );
 addTriggerToList( "trig_trap2" );
 addTriggerToList( "trig_trap3" );
 addTriggerToList( "trig_trap5" ); 
 addTriggerToList( "trig_trap6" ); 


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap0()
 
{
 
trap0a = getEnt( "trap0a", "targetname" );
trap0b = getEnt( "trap0b", "targetname" );
trap0c = getEnt( "trap0c", "targetname" ); 
trap0d = getEnt( "trap0d", "targetname" ); 
trap0e = getEnt( "trap0e", "targetname" );
trap0f = getEnt( "trap0f", "targetname" );

while( 1 )
{
 
trap0a rotateyaw( 720, 3 );
trap0b rotateyaw( 720, 3 ); 
trap0c rotateyaw( 720, 3 );
trap0d rotateyaw( 720, 3 );
trap0e rotateyaw( 720, 3 );
trap0f rotateyaw( 720, 3 );

wait 3;
 
trap0a rotateyaw( -720, 3 );
trap0b rotateyaw( -720, 3 ); 
trap0c rotateyaw( -720, 3 );
trap0d rotateyaw( -720, 3 );
trap0e rotateyaw( -720, 3 );
trap0f rotateyaw( -720, 3 );
 
wait 3;
 
}
}


trap1()
{
 
trig1 = getEnt( "trig_trap1", "targetname" ); 
trap1 = getEnt( "trap1", "targetname" );
 
trig1 waittill ("trigger");
trig1 delete();
 
while( 1 ) 
{

trap1 rotateyaw( 360, 3 );
wait 8;
trap1 rotateyaw( -360, 3 );
wait 8;

}
}

trap2()
{
 
trig2 = getEnt( "trig_trap2", "targetname" );
trap2 = getEnt( "trap2", "targetname" );
 
trig2 waittill ("trigger");
trig2 delete();
 
{

trap2 movex( 336, 3 );
wait 3;
trap2 movex( -336, 3 );
wait 3;

}
}

trap3()
{
 
trig3 = getEnt( "trig_trap3", "targetname" );
trap3 = getEnt( "trap3", "targetname" );
 
trig3 waittill ("trigger");
trig3 delete();
 
{

trap3 movez( -1000, 3 );
wait 3;
trap3 movez( 1000, 3 );
wait 3;

}
}



trap5()
{
 
trig5 = getEnt( "trig_trap5", "targetname" ); 
trap5 = getEnt( "trap5", "targetname" );
 
trig5 waittill ("trigger");
trig5 delete();
 
while( 1 ) 
{

trap5 rotateroll( 360, 1 );
wait 6;
trap5 rotateroll( -360, 1 );
wait 6;

}
}

trap6()
{
 
trig6 = getEnt( "trig_trap6", "targetname" );
trap6 = getEnt( "trap6", "targetname" );
 
trig6 waittill ("trigger");
trig6 delete();
 
{

trap6 movez( 200, 3 );
wait 3;
trap6 movez( -200, 3 );
wait 3;

}
}

 teleport1()
{
  trig = getEnt( "secretroom", "targetname"); 
  target = getEnt( "secret", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 
}
}

teleport2()
 
{
 
  trig = getEnt( "finishsecret", "targetname");
 
  target = getEnt( "finishsecretroom", "targetname");
 
  for(;;)
 
  {
 
     trig waittill ("trigger", player);
 
     player SetOrigin(target.origin);
 
     player SetPlayerAngles( target.angles );
     player GiveWeapon( "remington700_mp" );       
        wait 0.05;
        player switchToWeapon( "remington700_mp" );
 iPrintlnBold( " ^6" + player.name + " ^5 HAS FINISH THE SECRET ^1" );
 
    wait 1;
 
}
 
}

 teleport3()
{
  trig = getEnt( "teleportdno", "targetname"); 
  target = getEnt( "dno", "targetname");

  for(;;)
  {
     trig waittill ("trigger", player); 
     player SetOrigin(target.origin);
     player SetPlayerAngles( target.angles ); 
}
}

finalFight1()
{
    trig = getEnt( "oldroom", "targetname" );
    tele_activator = getEnt( "actiold", "targetname" );
    tele_jumper = getEnt( "old", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "knife_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Old Room");
        level.activ finalRoom( tele_activator, "knife_mp", 100 );
    }
    // code never gets here
}

finalFight2()
{
    trig = getEnt( "sniperroom", "targetname" );
    tele_activator = getEnt( "actisniper", "targetname" );
    tele_jumper = getEnt( "sniper", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "m40a3_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Sniper Room");
        level.activ finalRoom( tele_activator, "m40a3_mp", 100 );
    }
    // code never gets here
}
 



finalFight3()
{
    trig = getEnt( "kniferoom", "targetname" );
    tele_activator = getEnt( "actiknife", "targetname" );
    tele_jumper = getEnt( "knife", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "knife_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Knife Room");
        level.activ finalRoom( tele_activator, "knife_mp", 100 );
    }
    // code never gets here
}
 



finalFight4()
{
    trig = getEnt( "tomahawkroom", "targetname" );
    tele_activator = getEnt( "actitomahawk", "targetname" );
    tele_jumper = getEnt( "tomahawk", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "tomahawk_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Tomahawk Room");
        level.activ finalRoom( tele_activator, "tomahawk_mp", 100 );
    }
    // code never gets here
}
 

 


finalFight5()
{
    trig = getEnt( "jumproom", "targetname" );
    tele_activator = getEnt( "actijump", "targetname" );
    tele_jumper = getEnt( "jump", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "knife_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Jump Room");
        level.activ finalRoom( tele_activator, "knife_mp", 100 );
    }
    // code never gets here
}
 


finalFight6()
{
    trig = getEnt( "runroom", "targetname" );
    tele_activator = getEnt( "actirun", "targetname" );
    tele_jumper = getEnt( "run", "targetname" );
               
    level.finalJumper = undefined;
 
    while( 1 )
    {
        trig waittill( "trigger", player );
 
        // this will be blocked if jumper is currently in room and while its free run round
        if( isDefined( level.finalJumper ) || player.pers["team"] != "allies" )
            continue;
 
        level.finalJumper = player;
        level.finalJumper thread finalMonitor();
       
        level.finalJumper finalRoom( tele_jumper, "tomahawk_mp", 100 );
        iPrintLnBold(" ^6" + player.name + "^5 has entered the ^1Run Room");
        level.activ finalRoom( tele_activator, "tomahawk_mp", 100 );
    }
    // code never gets here
}
 
finalMonitor()
{
    self endon( "disconnect" );
    self thread monitorDisconnect();
 
    while( self.sessionstate == "playing" )
        wait 0.05;
    level.finalJumper = undefined;
}
 
monitorDisconnect()
{
    self waittill( "disconnect" );
    level.finalJumper = undefined;
}
 
finalRoom( tp, weap, health )
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
   
    self TakeAllWeapons(); //this should be called so it takes away insertion perk in dr 1.2
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
 
}
 

creator()
{
while(1)
 {
iPrintln( "^5Map ^7Made ^5By ^1Mr.Xx" );
wait 20;
iPrintln( "xFire: ^5dragec^71997" );
wait 10;
iPrintln( "^5Map ^7Made ^5By ^1Mr.Xx" );
wait 30;
}
}