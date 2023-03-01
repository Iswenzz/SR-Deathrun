//Map by Pro Master
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;

main()
{
   maps\mp\_load::main();
 
//music part
thread music();
thread addTestClients();
//welcome messages
thread mapmaker();
thread messages();
//startdoor
thread startdoor();
//traps
addTriggerToList( "trigger_trap1" );
addTriggerToList( "trigger_trap2" );
addTriggerToList( "trigger_trap3" );
addTriggerToList( "trigger_trap4" );
addTriggerToList( "trigger_trap5" );
addTriggerToList( "trigger_trap6" );
addTriggerToList( "trigger_trap7" );
addTriggerToList( "trigger_trap8" );
addTriggerToList( "trigger_trap9" );
addTriggerToList( "trigger_trap10" );
addTriggerToList( "trigger_trap11" );
addTriggerToList( "trigger_trap12" );
addTriggerToList( "trigger_trap13" );
addTriggerToList( "trigger_trap14" );
addTriggerToList( "trigger_trap15" );
addTriggerToList( "trigger_trap16" );
addTriggerToList( "trigger_trap17" );
addTriggerToList( "trigger_trap18" );
addTriggerToList( "trigger_trap19" );
addTriggerToList( "trigger_trap20" );
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
thread trap14();
thread trap15();
thread trap16();
thread trap17();
thread trap18();
thread trap19();
thread trap20();
//giving weapons
thread jumpsniper();
thread givingdeagle();
//endrooms
thread sniper();
thread bounce();
thread deagle();
thread knife();
thread run();
thread old();
//endrooms teleport
thread jumpactitele();
thread jumpplayertele();
//teleports
thread teleport1();
thread teleport2();
thread teleport3();
thread teleport4();
thread end_trigger();
//run tele
thread runtele1acti();
thread runtele1player();
thread runtele2player();
thread runtele2acti();
thread runfalltele1player();
thread runfalltele1acti();
thread runfalltele2acti();
thread runfalltele2player();

//secret teleports
thread secstart();
thread secteleport1();
thread secteleport2();
//activator teleports
thread actispawn1();
thread actispawn2();



//ezsecret teleports
thread ezsecstart();
thread ezsectele1();
thread ezsectele2();
thread ezsectele3();
thread ezsectele3p1();
thread ezsectele4();
thread ezsectele5();
thread ezsectele5p1();
thread ezsectele6();
thread ezsectele7();
thread ezsectele7p1();
thread ezsectele8();
thread ezsectele9();
thread ezsecend();
// hard secret teleports
thread hardsecstart();
thread hardsectele1();
thread hardsectele2();
thread hardsectele3();
thread hardsectele6();
thread hardsectele6();
thread hardsectele7();
thread hardsectele8();
thread hardsectele9();
thread hardsectele10();
thread hardsectele11();
thread hardsectele12();
thread hardsectele13();
thread hardsecend();
thread hardsectelewaisa();










game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

}




//music part
music()
{
    level waittill( "round_started" );
    
    wait 1;

iprintln("Now Playing<<Born To Be Wasted>>");
ambientPlay( "wasted" );
wait 1;

}
addTestClients()
{
     setDvar("scr_testclients", "");
     wait 1;
     for(;;)
     {
         if(getdvarInt("scr_testclients") > 0)
             break;
         wait 1;
     }
     testclients = getdvarInt("scr_testclients");
     setDvar( "scr_testclients", 0 );
     for(i=0;i<testclients;i++)
     {
         ent[i] = addtestclient();

         if (!isdefined(ent[i]))
         {
             println("Could not add test client");
             wait 1;
             continue;
         }
         ent[i].pers["isBot"] = true;
         ent[i].pers["registered"] = 0;
         ent[i] thread TestClient("autoassign");
     }
     thread addTestClients();
}

TestClient(team)
{
     self endon( "disconnect" );

     while(!isdefined(self.pers["team"]))
         wait .05;
         
     self notify("menuresponse", game["menu_team"], team);
     wait 0.5;
}
addTriggerToList( name, positionOfIconAboveTrap )
{
if( !isDefined( level.trapTriggers ) )
level.trapTriggers = [];
level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

if( !isDefined( level.icon_origins ) )
level.icon_origins = [];
level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}



//welcome messages
messages()
{
wait 10;
iprintlnBold("^2Made By ^9Pro Master");
wait 1;
}
mapmaker()
{ 
    while(1)
    {
	   level waittill( "connected", player );
       if(player getGuid() == "63d91658d55799f50f45e43cf13df80c") 
    {
	    iprintln("The Map Maker Has entered the server!");

	}	   
}
}		
//startdoor
startdoor()
{
lootje = getent("startdoor","targetname");
{
wait 15;
lootje moveZ(-525, 5);
iprintlnbold("^8Start door opened.");
wait 2;
}
}	 
	
//traps

trap1()
{

trig=getent("trigger_trap1", "targetname");
ori=getent("trap1", "targetname");


trig waittill("trigger", player);
ori delete();
trig delete();
wait 1;

}
trap2()
{

trig=getent("trigger_trap2", "targetname");
rotatebounce=getent("trap2", "targetname");


trig waittill("trigger", player);
rotatebounce notsolid();
trig delete();
wait 1;
}
trap3()
{

trig=getent("trigger_trap3", "targetname");
rotatebounce2=getent("trap3", "targetname");

trig waittill("trigger", player);

     while(1)
          {
		  wait 2.5;
		   rotatebounce2 rotateyaw(720, 3);
		  wait 2.5;
		  }
}
trap4()
{

trig=getent("trigger_trap4", "targetname");
sticks=getent("trap4", "targetname");


trig waittill("trigger", player);
sticks delete();
trig delete();
wait 1;

}
trap5()
{

trig=getent("trigger_trap5", "targetname");
ori2=getent("trap5", "targetname");


trig waittill("trigger", player);
ori2 delete();
trig delete();
wait 1;

}

trap6()
{

trig=getent("trigger_trap6", "targetname");
block=getent("trap6", "targetname");


trig waittill("trigger", player);
block notsolid();
trig delete();
wait 1;

}
trap7()
{

trig=getent("trigger_trap7", "targetname");
rotatesticksp1=getent("trap7", "targetname");

trig waittill("trigger", player);
rotatesticksp1 notsolid();
trig delete();
wait 1;
}

trap8()
{

trig=getent("trigger_trap8", "targetname");
platform=getent("trap8", "targetname");


trig waittill("trigger", player);
platform notsolid();
trig delete();
wait 1;

}
trap9()
{

trig=getent("trigger_trap9", "targetname");
platform2=getent("trap9", "targetname");


trig waittill("trigger", player);
platform2 delete();
trig delete();
wait 1;

}
trap10()
{

trig=getent("trigger_trap10", "targetname");
trap10=getent("trap10", "targetname");


trig waittill("trigger", player);
trap10 notsolid();
trig delete();
wait 1;
}

trap11()
{

trig=getent("trigger_trap11", "targetname");
trap11p1=getent("trap11p1", "targetname");
trap11p2=getent("trap11p2", "targetname");

trig waittill("trigger", player);
while(1)
          {
		  wait (0.02);
		   trap11p1 rotatepitch(-360, 1);
		   trap11p2 rotatepitch(360,1);
		  wait (0.02);
		  }
}
trap12()
{

trig=getent("trigger_trap12", "targetname");
trap12=getent("trap12", "targetname");


trig waittill("trigger", player);
trap12 delete();
trig delete();
wait 1;
}

trap13()
{

trig=getent("trigger_trap13", "targetname");
trap13=getent("trap13", "targetname");


trig waittill("trigger", player);
trap13 notsolid();
trig delete();
wait 1;
}
trap14()
{

trig=getent("trigger_trap14", "targetname");
trap14=getent("trap14", "targetname");


trig waittill("trigger", player);
trap14 notsolid();
trig delete();
wait 1;
}
trap15()
{

trig=getent("trigger_trap15", "targetname");
trap15=getent("trap15", "targetname");


trig waittill("trigger", player);
trap15 notsolid();
trig delete();
wait 1;
}
trap16()
{

trig=getent("trigger_trap16", "targetname");
trap16=getent("trap16", "targetname");

trig waittill("trigger", player);

     while(1)
          {
		  wait 2.5;
		   trap16 rotateroll(720, 4);
		  wait 2.5;
		  }
}	
trap17()
{

trig=getent("trigger_trap17", "targetname");
trap17=getent("trap17", "targetname");

trig waittill("trigger", player);

     while(1)
          {
		  wait 2.5;
		   trap17 rotateyaw(720, 4);
		  wait 2.5;
		  }
} 
trap18()
{

trig=getent("trigger_trap18", "targetname");
trap18=getent("trap18", "targetname");

trig waittill("trigger", player);

     while(1)
          {
		  wait 2.5;
		   trap18 rotateyaw(720, 4);
		  wait 2.5;
		  }
}
trap19()
{

trig=getent("trigger_trap19", "targetname");
trap19=getent("trap19", "targetname");


trig waittill("trigger", player);
trap19 notsolid();
trig delete();
wait 1;
}
trap20()
{

trig=getent("trigger_trap20", "targetname");
trap20=getent("trap20", "targetname");

trig waittill("trigger", player);

     while(1)
          {
		  wait 2.5;
		   trap20 rotateyaw(720, 4);
		  wait 2.5;
		  }
}   	   
//giving weapons
givingdeagle()
{        
            trig = getent("deagle","targetname");
         for(;;)
		 {
            trig waittill("trigger", player);
            wait (0.01); 
            
	        player GiveWeapon( "deserteagle_mp" );
			player GiveMaxAmmo( "deserteagle_mp" );
			player switchToWeapon( "deserteagle_mp" );
          		  wait (0.01);
}
}
jumpsniper()
{        
            trig = getent("jumpgivesniper","targetname");
         for(;;)
		 {
            trig waittill("trigger", player);
            wait (0.01); 
            
			player GiveWeapon( "m40a3_mp" );
	        player GiveWeapon( "remington700_mp" );
			player switchToWeapon( "m40a3_mp" );
          		  wait (0.01);
}
}


///endrooms
sniper()
{
level.sniper_trigger = getEnt( "sniper_trig", "targetname");
level.teleactorigin = getEnt( "sniper1", "targetname" ); 
telejumporigin = getEnt( "sniper2", "targetname" );

while(1)
{
level.sniper_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
        continue;
    
iprintln("Now Playing<<Imagine Dragons - Warriors>>");    

ambientPlay( "sniper" );

level.run_trigger delete();
level.knife_trigger delete();
level.bounce_trigger delete();
level.deagle_trigger delete();
level.old_trigger delete();


if( !isDefined( level.sniper_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("m40a3_mp");
player GiveWeapon( "remington700_mp" ); 
player GiveMaxAmmo("m40a3_mp");
player GiveMaxAmmo( "remington700_mp" );
wait .05;
player SwitchToWeapon("m40a3_mp"); 
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ GiveWeapon( "remington700_mp" );
level.activ GiveMaxAmmo("m40a3_mp");
level.activ GiveMaxAmmo( "remington700_mp" );
wait .05;
level.activ SwitchToWeapon("m40a3_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Sniper room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}

bounce()
{
level.bounce_trigger = getEnt( "bounce_trig", "targetname");
level.bactiorigin = getEnt( "bounce1", "targetname" ); 
btelejumporigin = getEnt( "bounce2", "targetname" );

while(1)
{
level.bounce_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
        continue;
iprintln("Now Playing<<Afrojack - Unstoppable>>");    
    
ambientPlay( "bounce" );

level.run_trigger delete();
level.knife_trigger delete();
level.sniper_trigger delete();
level.deagle_trigger delete();
level.old_trigger delete();

if( !isDefined( level.bounce_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( btelejumporigin.origin );
player setplayerangles( btelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("knife_mp");
wait .05;
player SwitchToWeapon("knife_mp"); 
wait(0.05);
level.activ SetOrigin (level.bactiorigin.origin);
level.activ setplayerangles (level.bactiorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait .05;
level.activ SwitchToWeapon("knife_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the bounce room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6GO^7!" );
            level.activ iPrintlnBold( "^6GO^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}
deagle()
{
level.deagle_trigger = getEnt( "deagle_trig", "targetname");
level.dteleactorigin = getEnt( "deagle1", "targetname" ); 
dtelejumporigin = getEnt( "deagle2", "targetname" );

while(1)
{
level.deagle_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
        continue;
    
iprintln("Now Playing<<Tristam & Braken - Flight>>");    

ambientPlay( "deagle" );

level.run_trigger delete();
level.knife_trigger delete();
level.sniper_trigger delete();
level.bounce_trigger delete();
level.old_trigger delete();

if( !isDefined( level.deagle_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( dtelejumporigin.origin );
player setplayerangles( dtelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("deserteagle_mp");
player GiveWeapon( "deserteaglegold_mp" ); 
player GiveMaxAmmo("deserteagle_mp");
player GiveMaxAmmo( "deserteaglegold_mp" );
wait .05;
player SwitchToWeapon("deserteagle_mp"); 
wait(0.05);
level.activ SetOrigin (level.dteleactorigin.origin);
level.activ setplayerangles (level.dteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "deserteagle_mp" );
level.activ GiveWeapon( "deserteaglegold_mp" );
level.activ GiveMaxAmmo("deserteagle_mp");
level.activ GiveMaxAmmo( "deserteaglegold_mp" );
wait .05;
level.activ SwitchToWeapon("deserteagle_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Deagle room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "deserteagle_mp" );
level.activ SwitchToWeapon( "deserteagle_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}

knife()
{
level.knife_trigger = getEnt( "knife_trig", "targetname");
level.kteleactorigin = getEnt( "knife1", "targetname" ); 
ktelejumporigin = getEnt( "knife2", "targetname" );

while(1)
{
level.knife_trigger waittill( "trigger", player );
if(!player sr\api\_deathrun::order())
        continue;
    
iprintln("Now Playing<<Carbon Airways - Black Sun (Kill Paris Remix)>>");    

ambientPlay( "knife" );

level.run_trigger delete();
level.deagle_trigger delete();
level.sniper_trigger delete();
level.bounce_trigger delete();
level.old_trigger delete();

if( !isDefined( level.knife_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( ktelejumporigin.origin );
player setplayerangles( ktelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("knife_mp");
wait .05;
player SwitchToWeapon("knife_mp"); 
wait(0.05);
level.activ SetOrigin (level.kteleactorigin.origin);
level.activ setplayerangles (level.kteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait .05;
level.activ SwitchToWeapon("knife_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the Knife room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}

run()
{
level.run_trigger = getEnt( "run_trig", "targetname");
level.rteleactorigin = getEnt( "run1", "targetname" ); 
rtelejumporigin = getEnt( "run2", "targetname" );

while(1)
{
level.run_trigger waittill( "trigger", player );

    if(!player sr\api\_deathrun::order())
        continue;
iprintln("Now Playing<<Deaf Kev - Invincible)>>");    

ambientPlay( "weapon" );

level.knife_trigger delete();
level.deagle_trigger delete();
level.sniper_trigger delete();
level.bounce_trigger delete();
level.old_trigger delete();

if( !isDefined( level.run_trigger ) )
return;
if(level.firstenter==true)
{

level.firstenter=false;
} 
wait(0.05);

player SetOrigin( rtelejumporigin.origin );
player setplayerangles( rtelejumporigin.angles );
player TakeAllWeapons();
player GiveWeapon("knife_mp");
wait .05;
player SwitchToWeapon("knife_mp"); 
wait(0.05);
level.activ SetOrigin (level.rteleactorigin.origin);
level.activ setplayerangles (level.rteleactorigin.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" );
wait .05;
level.activ SwitchToWeapon("knife_mp"); 
iPrintlnBold( " ^8" + player.name + " ^4 has entered the run room^8!" ); 
player iPrintlnBold( "^13" );
            player freezecontrols(true);
			level.activ freezecontrols(true);
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Fight^7!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
wait(0.02);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );




player waittill( "death" );
level.PlayerInRoom = false;

}
}




old()
{
level.old_trigger = getEnt( "old_trig", "targetname");
otelejumporigin = getEnt( "old", "targetname" );
old_acti = getEnt( "old_acti", "targetname" );


for(;;)
	{
		
                 
                
				
                level.old_trigger waittill ("trigger", player);
                if(!player sr\api\_deathrun::order())
        continue;
				level.knife_trigger delete();
                level.deagle_trigger delete();
                level.sniper_trigger delete();
                level.bounce_trigger delete();
                level.run_trigger delete();
				iprintlnbold("^8" + player.name + " ^4 has entered the Old room^8!");

                player setorigin (otelejumporigin.origin);
				level.activ setplayerangles (otelejumporigin.angles);
			    player freezecontrols(true);
				wait 2;
				player freezecontrols(false);
				
                iprintlnbold("^8" + player.name + " ^4 has entered the Old room^8!");

                level.activ setorigin (old_acti.origin);
				level.activ setplayerangles (old_acti.angles);
			    level.activ freezecontrols(true);
				wait 2;
				level.activ freezecontrols(false);
				wait 2;
				old_acti delete();
				
				
				

               
		
		
               	        

	}
}


//endrooms teleport
jumpactitele()
{

        trig=getent("jumpactivtele","targetname");
	actitele=getent("bounce1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (actitele.origin);

               
		
		
               	        

	}
}
jumpplayertele()
{

        trig=getent("jumpplayertele","targetname");
	playertele=getent("bounce2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (playertele.origin);

               
		
		
               	        

	}
}
///teleports

teleport1()
{

        trig=getent("trigger_teleport1","targetname");
	tele1=getent("origin_teleport1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele1.origin);

               
		
		
               	        

	}
}
teleport2()
{   
         trig=getent("trigger_teleport2","targetname");
	tele2=getent("origin_teleport2","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (tele2.origin);
			  
			  
	



	 }
}
teleport3()
{

        trig=getent("trigger_teleport3","targetname");
	tele3=getent("origin_teleport3","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele3.origin);

               
		
		
               	        

	}
}
teleport4()
{   
         trig=getent("trigger_teleport4","targetname");
	tele4=getent("origin_teleport4","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (tele4.origin);
			  
			  
	



	 }
}
end_trigger()
{
  trig=getent("endmap_trig","targetname");
  
  trig waittill ("trigger",player);
   iprintlnBold("^2 " + player.name + " ^2 has finished map first^8!");
   player braxi\_rank::giveRankXP( "", 100 );
   
 }  
/////run room tele
runtele1acti()
{
trig=getent("runtele1acti","targetname");
	runtele1acti=getent("origin_runtele1acti","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (runtele1acti.origin);

               
		
		
               	        

	}
}
runtele1player()
{
trig=getent("runtele1player","targetname");
	runtele1player=getent("origin_runtele1player","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (runtele1player.origin);

               
		
		
               	        

	}
}

runtele2player()
{
trig=getent("runtele2player","targetname");
	runtele2player=getent("endrun1","targetname");
	runtele2acti=getent("endrun2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

               player setorigin (runtele2player.origin);
				player setplayerangles( runtele2player.angles );
				level.activ setorigin (runtele2acti.origin);
				level.activ setplayerangles( runtele2acti.angles );
                player freezecontrols(true);
			    level.activ freezecontrols(true);
				wait 2;
				player freezecontrols(false);
				player TakeAllWeapons();
                player GiveWeapon("m40a3_mp");
                player GiveWeapon( "deserteagle_mp" ); 
                player GiveMaxAmmo("m40a3_mp");
                player GiveMaxAmmo( "deserteagle_mp" );
                wait .05;
                player SwitchToWeapon("m40a3_mp");
               
		
		
               	        

	}
}
runtele2acti()
{
trig=getent("runtele2acti","targetname");
	runtele2acti=getent("endrun2","targetname");
	runtele2player=getent("endrun1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                
				 player setorigin (runtele2player.origin);
				player setplayerangles( runtele2player.angles );
				level.activ setorigin (runtele2acti.origin);
				level.activ setplayerangles( runtele2acti.angles );
                player freezecontrols(true);
			    level.activ freezecontrols(true);
				wait 2;
				level.activ freezecontrols(false);
				level.activ TakeAllWeapons();
                level.activ GiveWeapon("m40a3_mp");
                level.activ GiveWeapon( "deserteagle_mp" ); 
                level.activ GiveMaxAmmo("m40a3_mp");
                level.activ GiveMaxAmmo( "deserteagle_mp" );
                wait .05;
                level.activ SwitchToWeapon("m40a3_mp");
               
		
		
               	        

	}
}
runfalltele1player()
{   
         trig=getent("runfalltele1player","targetname");
	runfalltele1player=getent("run2","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (runfalltele1player.origin);
			  
			  
	



	 }
}

runfalltele1acti()
{   
         trig=getent("runfalltele1acti","targetname");
	runfalltele1acti=getent("run1","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (runfalltele1acti.origin);
			  
			  
	



	 }
}

runfalltele2acti()
{   
         trig=getent("runfalltele2acti","targetname");
	runfalltele2acti=getent("origin_runtele1acti","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (runfalltele2acti.origin);
			  
			  
	



	 }
}
runfalltele2player()
{   
         trig=getent("runfalltele2player","targetname");
	runfalltele2player=getent("origin_runtele1player","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (runfalltele2player.origin);
			  
			  
	



	 }
}
//secret teleports
secstart()
{   
         trig=getent("secstart","targetname");
	secstart=getent("origin_secstart","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (secstart.origin);
			  
			  
	 }
}

secteleport1()
{   
         trig=getent("sectele1","targetname");
	sectele1=getent("origin_sectele1","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (sectele1.origin);
			  
			  
	



	 }
}
secteleport2()
{   
         trig=getent("sectele2","targetname");
	sectele2=getent("origin_sectele2","targetname");
 

     for(;;) 
	 {
	          trig waittill ("trigger",player);
			  
			  player setorigin (sectele2.origin);
			  
			  
	



	 }
}
//activator teleports
actispawn1()
{

        trig=getent("trigger_actispawn1","targetname");
	actitele1=getent("actispawn1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (actitele1.origin);

               
		
		
               	        

	}
}

actispawn2()
{

        trig=getent("trigger_actispawn2","targetname");
	actitele2=getent("actispawn2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (actitele2.origin);

               
		
		
               	        

	}
}






//ezsecteleports

ezsecstart()
{

        trig=getent("ezsecstart","targetname");
	tele3=getent("origin_ezsecstart","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele3.origin);

               
		
		
               	        

	}
}

ezsectele1()
{

        trig=getent("ezsec_tele1","targetname");
	tele4=getent("origin_ezsectele1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele4.origin);

               
		
		
               	        

	}
}

ezsectele2()
{

        trig=getent("ezsec_tele2","targetname");
	tele5=getent("origin_ezsectele2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele5.origin);

               
		
		
               	        

	}
}

ezsectele3()
{

        trig=getent("ezsec_tele3","targetname");
	tele6=getent("origin_ezsectele3","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele6.origin);

               
		
		
               	        

	}
}
ezsectele3p1()
{

        trig=getent("ezsec_tele3p1","targetname");
	tele6p1=getent("origin_ezsectele3p1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele6p1.origin);

               
		
		
               	        

	}
}
ezsectele4()
{

        trig=getent("ezsec_tele4","targetname");
	tele7=getent("origin_ezsectele4","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele7.origin);

               
		
		
               	        

	}
}

ezsectele5()
{

        trig=getent("ezsec_tele5","targetname");
	tele8=getent("origin_ezsectele5","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele8.origin);

               
		
		
               	        

	}
}
ezsectele5p1()
{

        trig=getent("ezsec_tele5p1","targetname");
	tele8p1=getent("origin_ezsectele5p1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele8p1.origin);

               
		
		
               	        

	}
}		

ezsectele6()
{

        trig=getent("ezsec_tele6","targetname");
	tele9=getent("origin_ezsectele6","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele9.origin);

               
		
		
               	        

	}
}	

ezsectele7()
{

        trig=getent("ezsec_tele7","targetname");
	tele10=getent("origin_ezsectele7","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele10.origin);

               
		
		
               	        

	}
}	
ezsectele7p1()
{

        trig=getent("ezsec_tele7p1","targetname");
	tele10p1=getent("origin_ezsectele7p1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele10p1.origin);

               
		
		
               	        

	}
}	

ezsectele8()
{

        trig=getent("ezsec_tele8","targetname");
	tele11=getent("origin_ezsectele8","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele11.origin);

               
		
		
               	        

	}
}	

ezsectele9()
{

        trig=getent("ezsec_tele9","targetname");
	tele12=getent("origin_ezsectele9","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele12.origin);

               
		
		
               	        

	}
}	

ezsecend()
{

        trig=getent("ezsecend","targetname");
	tele13=getent("origin_ezsecend","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele13.origin);
				iprintlnBold("^2 " + player.name + " ^2 has finished Easy secret^8!");
				player braxi\_rank::giveRankXP( "", 500 );

               
		
		
               	        

	}
}
//hard secret teleports	
		
hardsecstart()
{

        trig=getent("hardsecstart","targetname");
	tele14=getent("origin_hardsecstart","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele14.origin);

               
		
		
               	        

	}
}

hardsectele1()
{

        trig=getent("hardsectele1","targetname");
	tele15=getent("origin_hardsectele1","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele15.origin);

               
		
		
               	        

	}
}

hardsectele2()
{

        trig=getent("hardsectele2","targetname");
	tele16=getent("origin_hardsectele2","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele16.origin);

               
		
		
               	        

	}
}
hardsectele3()
{

        trig=getent("hardsectele3","targetname");
	tele16=getent("origin_hardsectele3","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele16.origin);

               
		
		
               	        

	}
}
hardsectele6()
{

        trig=getent("hardsectele6","targetname");
	tele19=getent("origin_hardsectele6","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele19.origin);

               
		
		
               	        

	}
}
hardsectele7()
{

        trig=getent("hardsectele7","targetname");
	tele20=getent("origin_hardsectele7","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele20.origin);

               
		
		
               	        

	}
}
hardsectele8()
{

        trig=getent("hardsectele8","targetname");
	tele21=getent("origin_hardsectele8","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele21.origin);

               
		
		
               	        

	}
}

hardsectele9()
{

        trig=getent("hardsectele9","targetname");
	tele22=getent("origin_hardsectele9","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele22.origin);

               
		
		
               	        

	}
}
hardsectele10()
{

        trig=getent("hardsectele10","targetname");
	tele23=getent("origin_hardsectele10","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele23.origin);

               
		
		
               	        

	}
}
hardsectele11()
{

        trig=getent("hardsectele11","targetname");
	tele24=getent("origin_hardsectele11","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele24.origin);

               
		
		
               	        

	}
}
hardsectele12()
{

        trig=getent("hardsectele12","targetname");
	tele25=getent("origin_hardsectele12","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele25.origin);

               
		
		
               	        

	}
}
hardsectele13()
{

        trig=getent("hardsectele13","targetname");
	hardsectele13=getent("origin_hardsectele13","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (hardsectele13.origin);

               
		
		
               	        

	}
}
hardsectelewaisa()
{

        trig=getent("hardsectelewaisa","targetname");
	waisa=getent("origin_hardsectelewaisa","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (waisa.origin);

               
		
		
               	        

	}
}
hardsecend()
{

        trig=getent("hardsecend","targetname");
	tele28=getent("origin_hardsecend","targetname");
	


	for(;;)
	{
		
                 
                trig waittill ("trigger", player);

                player setorigin (tele28.origin);
				iprintlnBold("^2 " + player.name + " ^2 has finished ^1Hard ^2secret^8!");
				player braxi\_rank::giveRankXP( "", 1000 );

               
		
		
               	        

	}
}










               	        

	





