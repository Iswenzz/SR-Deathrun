main()
{
////////////////////////////////////////////////////////////////////////////
//////////////////////////////////mp_dr_hardest_game////////////////////////
////////////////////////////////////////////////////////////////////////////
/////////////Feel free to use these scripts for your deathrun map///////////
//////////////////////////////Any problems gives a shout////////////////////
////////////////////////////////////Xfire : teebag038///////////////////////
/////////////////////////////Credits for those who helped///////////////////
////////////////////////////////////////Pixel///////////////////////////////
////////////////////////////////////////Lootje//////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////


 maps\mp\_load::main();
 
 game["allies"] = "sas";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "woodland";
 game["axis_soldiertype"] = "woodland";

 setdvar( "r_specularcolorscale", "1" );
 setdvar("r_glowbloomintensity0",".25");
 setdvar("r_glowbloomintensity1",".25");
 setdvar("r_glowskybleedintensity0",".3");
 setdvar("compassmaxrange","1800");
 
 addTriggerToList( "trap1_switch" );
 addTriggerToList( "trap2_switch" );
 addTriggerToList( "trap3_switch" );
 addTriggerToList( "trap4_switch" );
 addTriggerToList( "trap5_switch" );
 addTriggerToList( "trap6_switch" );
 addTriggerToList( "trap7_switch" );
   
thread startgate();  
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6();
thread trap7();
thread poles();
thread elevator();
thread random_cone_thread_dont_know_why_i_made_it_lol_twat();
thread teleport();
thread teleport1();
thread teleport2();
thread teleport3();
thread teleport4();
thread teleport5();
thread teleport6();
thread sniper();
thread bounce();
thread knife();
thread race();
thread tiptoe();
thread racegivesniper();
thread race_teleport1();
thread race_teleport2();
thread race_teleport3();
thread race_teleport4();
thread race_teleport5();
thread race_teleport6();
thread race_teleport7();
thread race_teleport8();
thread race_teleport9();
thread race_teleport10();
thread movingbounce();
thread bouncefall();
thread wave1();
thread wave2();
thread wave3();
thread wave4();
thread wave5();
thread wave6();
thread wave7();
thread wave8();
thread wave9();
thread wave10();
thread wave11();
thread wave12();
thread wave13();
thread wave14();
thread wave15();
thread wave16();
thread wave17();
thread wave18();
thread wave19();
thread wave20();
thread wave21();
thread wave22();
thread wave23();
thread wave24();
thread wave25();
thread wave26();
thread wave27();
thread wave28();
thread wave29();
thread wave30();
thread wave31();
thread wave32();
thread tiptoefall1();
thread tiptoegivesniper();
thread main_music();
thread finnish_music();
thread sniper_music();
thread knife_music();
thread jump_music();
thread race_music();
thread tiptoe_music();
thread bounce_give_weapon();
}
main_music()
{
     level waittill( "round_started" );
     
     wait 1;
	 IPrintLn( "^1Now Playing ^3Worlds Hardest Game Theme" );
     ambientPlay ("main"); 
}
finnish_music()
{
     trigger = getent("finnish","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^4 Has Finished ^31st^1!" ); 
	 ambientstop(1);
	         
	         
	 IPrintLn( "^1Now Playing ^3Ludovico Einaudi - Experience (Starkey Remix)" );
	 ambientPlay ("finnish");
}
sniper_music()
{
     trigger = getent("sniper_music","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
	 ambientstop(1);
	         
	         
	 IPrintLn( "^1Now Playing ^3Sway - Still Speedin' [Instrumental]" );
	 ambientPlay ("sniper");
}
knife_music()
{
     trigger = getent("knife_music","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
	 ambientstop(1);
	         
	         
	 IPrintLn( "^1Now Playing ^3Nick Ingman & Terry Devine-King - Mars (Heavy Rain: The Origami Killer OST)" );
	 ambientPlay ("knife");
}
jump_music()
{
     trigger = getent("jump_music","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
	 ambientstop(1);
	         
	         
     IPrintLn( "^1Now Playing ^3Rihanna - Jump" );
	 ambientPlay ("jump");
}
race_music()
{
     trigger = getent("race_music","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
	 ambientstop(1);
	         
			 
			 
	 IPrintLn( "^1Now Playing ^3Planet Perfecto - Bullet In The Gun" );  
	 ambientPlay ("race");
}
tiptoe_music()
{
     trigger = getent("tiptoe_music","targetname");
	 
	 trigger waittill ("trigger", player );
     trigger delete();
	 wait 0.05;
               
	 ambientstop(1);
	         
	         
	 IPrintLn( "^1Now Playing ^3The Temper Trap - Sweet Disposition (Alto Remix) " );
	 ambientPlay ("tiptoe");
}
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
startgate()
{
  gate = getent("gate","targetname");
   
                             {
                             wait(21);
                             iprintlnbold("^4Good luck^1...");
                             gate movez (160,8);
                             gate waittill ("movedone");
                             wait(4);
                             }
}
trap1()
{
 trigger = getent("trap1_switch","targetname");
 
 ball1 = getent("ball1","targetname");
 ball2 = getent("ball2","targetname");
 statue1 = getent("statue1","targetname");
 
 killtrigger1 = getent("ball1_hurt","targetname");
 killtrigger2 = getent("ball2_hurt","targetname");
 
 killtrigger1 enablelinkto();
 killtrigger2 enablelinkto();
  
 killtrigger1 linkto (ball1);
 killtrigger2 linkto (ball2);
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball1 movex (-448,0.7);
						 ball2 movex (448,0.7);
						 statue1 movez (20,3);
						 wait(0.7);
						 ball1 movex (448,0.7);
						 ball2 movex (-448,0.7);
						 statue1 movez (-20,3);
						 wait(0.7);
						 }
}
trap2()
{
 trigger = getent("trap2_switch","targetname");
 
 ball3 = getent("ball3","targetname");
 statue2 = getent("statue2","targetname");
 
 killtrigger3 = getent("ball3_hurt","targetname");
 killtrigger3 enablelinkto();
 killtrigger3 linkto (ball3);
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball3 rotatePitch (-360,2);
						 statue2 movez (20,3);
						 wait(1);
						 ball3 rotatePitch (-360,2);
						 statue2 movez (-20,3);
						 wait(1);
						 }
}
trap3()
{
 trigger = getent("trap3_switch","targetname");
 
 ball4 = getent("ball4","targetname");
 statue3 = getent("statue3","targetname");
 
 killtrigger4 = getent("ball4_hurt","targetname");
 killtrigger4 enablelinkto();
 killtrigger4 linkto (ball4);
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball4 rotateYaw (360,4);
						 statue3 movez (20,3);
						 wait(1);
						 ball4 rotateYaw (360,4);
						 statue3 movez (-20,3);
						 wait(1);
						 }
}
trap4()
{
 
 trigger = getent("trap4_switch","targetname");
 
 ball5 = getent("ball5","targetname");
 ball6 = getent("ball6","targetname");
 ball7 = getent("ball7","targetname");
 ball8 = getent("ball8","targetname");
 statue4 = getent("statue4","targetname");
 platform = getent("platform","targetname");
 
 killtrigger5 = getent("ball5_hurt","targetname");
 killtrigger5 enablelinkto();
 killtrigger5 linkto (ball5);
 
 killtrigger6 = getent("ball6_hurt","targetname");
 killtrigger6 enablelinkto();
 killtrigger6 linkto (ball6);
 
 killtrigger7 = getent("ball7_hurt","targetname");
 killtrigger7 enablelinkto();
 killtrigger7 linkto (ball7);
 
 killtrigger8 = getent("ball8_hurt","targetname");
 killtrigger8 enablelinkto();
 killtrigger8 linkto (ball8);

 
 trigger waittill ("trigger", player );
 trigger delete();
 platform delete();
 
 while(1)
                         {
						 ball5 rotateYaw (360,4);
						 ball6 rotateYaw (360,4);
						 ball7 rotateYaw (360,4);
						 ball8 rotateYaw (360,4);
						 statue4 movez (20,3);
						 wait(1);
						 ball5 rotateYaw (360,4);
						 ball6 rotateYaw (360,4);
						 ball7 rotateYaw (360,4);
						 ball8 rotateYaw (360,4);
						 statue4 movez (-20,3);
						 wait(1);
						 }
}
poles()
{

 poles1 = getent("poles1","targetname");
 poles2 = getent("poles2","targetname");
 
 while(1)
                         {
						 poles1 movez (30,5);
						 poles2 movez (-30,5);
						 wait(1);
						 poles1 movez (-30,5);
						 poles2 movez (30,5);
						 wait(1);
						 poles1 movez (-30,5);
						 poles2 movez (30,5);
						 wait(1);
						 poles1 movez (30,5);
						 poles2 movez (-30,5);
						 wait(1);
						 }
}
elevator()
{
  ele = getent("ele","targetname");
  while(1)
{
  wait (2);
  ele movez (-448,4,2,2);
  ele waittill ("movedone");
  wait (2);
  ele movez(448,4,2,2);
  ele waittill ("movedone");
}
}
random_cone_thread_dont_know_why_i_made_it_lol_twat()
{
 cone1 = getent("cone1","targetname");
 cone2 = getent("cone2","targetname");
 cone3 = getent("cone3","targetname");
 cone4 = getent("cone4","targetname");
 cone5 = getent("cone5","targetname");
 cone6 = getent("cone6","targetname");
 cone7 = getent("cone7","targetname");
 cone8 = getent("cone8","targetname");
 cone9 = getent("cone9","targetname");
 cone10 = getent("cone10","targetname");
 
 while(1)
                         {
						 cone1 rotatePitch (90,2);
						 cone1 waittill ("rotatedone");
						 cone2 rotatePitch (90,2);
						 cone2 waittill ("rotatedone");
						 cone3 rotatePitch (90,2);
						 cone3 waittill ("rotatedone");
						 cone4 rotateRoll (90,2);
						 cone4 waittill ("rotatedone");
						 cone5 rotateRoll (90,2);
						 cone5 waittill ("rotatedone");
						 cone6 rotateRoll (90,2);
						 cone6 waittill ("rotatedone");
						 cone7 rotateRoll (90,2);
						 cone7 waittill ("rotatedone");
                         cone8 rotatePitch (90,2);
						 cone8 waittill ("rotatedone");
						 cone9 rotatePitch (90,2);
						 cone9 waittill ("rotatedone");
						 cone10 rotatePitch (90,2);
						 cone10 waittill ("rotatedone");
						 }
}
teleport()
{

 trigger = getent("jumper_teleport1","targetname");
 jumper_teleport1_origin = getent("jumper_teleport1_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(jumper_teleport1_origin.origin);
						 player setPlayerAngles(jumper_teleport1_origin.angles );
                         }
}
teleport1()
{

 trigger = getent("activator_teleport1","targetname");
 activator_teleport1_origin = getent("activator_teleport1_origin","targetname");

 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(activator_teleport1_origin.origin);
						 player setPlayerAngles(activator_teleport1_origin.angles );
						 }
}
teleport2()
{

 trigger = getent("jumper_teleport2","targetname");
 jumper_teleport2_origin = getent("jumper_teleport2_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(jumper_teleport2_origin.origin);
						 player setPlayerAngles(jumper_teleport2_origin.angles );
                         }
}
teleport3()
{

 trigger = getent("activator_teleport2","targetname");
 activator_teleport2_origin = getent("activator_teleport2_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(activator_teleport2_origin.origin);
						 player setPlayerAngles(activator_teleport2_origin.angles );
                         }
}
teleport4()
{
 
 trigger = getent("secret_teleport1","targetname");
 secret_teleport1_origin = getent("secret_teleport1_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
						 wait 0.05;
                         iPrintlnBold( " ^4" + player.name + "^3 Has Found the ^5Secret!" );
                         player setorigin(secret_teleport1_origin.origin);
						 player setPlayerAngles(secret_teleport1_origin.angles );
                         }
}
teleport5()
{
 
 trigger = getent("secret_teleport1_fall","targetname");
 secret_teleport1_fall_origin = getent("secret_teleport1_fall_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(secret_teleport1_fall_origin.origin);
						 player setPlayerAngles(secret_teleport1_fall_origin.angles );
                         }
}
teleport6()
{
 
 trigger = getent("secret_teleport2","targetname");
 secret_teleport2_origin = getent("secret_teleport2_origin","targetname");
 
 for(;;)
                         {
						 trigger waittill ("trigger", player );
                         player setorigin(secret_teleport2_origin.origin);
						 player setPlayerAngles(secret_teleport2_origin.angles );
						 player GiveWeapon( "deserteagle_mp" );
                         player giveMaxAmmo( "deserteagle_mp" );
						 player switchToWeapon( "deserteagle_mp" );
						 
						 iPrintlnBold( " ^4" + player.name + "^3 Has Finished the ^5Secret!" );
                         }
}
trap5()
{
 trigger = getent("trap5_switch","targetname");
 
 ball10 = getent("ball10","targetname");
 ball11 = getent("ball11","targetname");
 ball12 = getent("ball12","targetname");
 ball13 = getent("ball13","targetname");
 statue5 = getent("statue5","targetname");
 
 killtrigger10 = getent("ball10_hurt","targetname");
 killtrigger10 enablelinkto();
 killtrigger10 linkto (ball10);
 
 killtrigger11 = getent("ball11_hurt","targetname");
 killtrigger11 enablelinkto();
 killtrigger11 linkto (ball11);
 
 killtrigger12 = getent("ball12_hurt","targetname");
 killtrigger12 enablelinkto();
 killtrigger12 linkto (ball12);
 
 killtrigger13 = getent("ball13_hurt","targetname");
 killtrigger13 enablelinkto();
 killtrigger13 linkto (ball13);
 
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball10 movex (128,0.6);
						 ball11 movex (-128,0.6);
						 ball12 movey (128,0.6);
						 ball13 movey (-128,0.6);
						 statue5 movez (20,3);
						 wait(0.6);
						 ball10 movex (-128,0.6);
						 ball11 movex (128,0.6);
						 ball12 movey (-128,0.6);
						 ball13 movey (128,0.6);
						 statue5 movez (-20,3);
						 wait(0.6);
						 }
}
trap6()
{
 trigger = getent("trap6_switch","targetname");
 
 ball14 = getent("ball14","targetname");
 statue6 = getent("statue6","targetname");
 
 killtrigger14 = getent("ball14_hurt","targetname");
 killtrigger14 enablelinkto();
 killtrigger14 linkto (ball14);
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball14 rotateYaw (90,0.8);
						 statue6 movez (20,2);
						 wait(2);
						 ball14 rotateYaw (90,0.8);
						 statue6 movez (-20,2);
						 wait(2);
						 ball14 rotateYaw (90,0.8);
						 statue6 movez (20,2);
						 wait(2);
						 ball14 rotateYaw (90,0.8);
						 statue6 movez (-20,2);
						 wait(2);
						 }
}
trap7()
{
 trigger = getent("trap7_switch","targetname");
 
 ball15 = getent("ball15","targetname");
 ball16 = getent("ball16","targetname");
 ball17 = getent("ball17","targetname");
 ball18 = getent("ball18","targetname");
 
 statue7 = getent("statue7","targetname");
 
 killtrigger15 = getent("ball15_hurt","targetname");
 killtrigger15 enablelinkto();
 killtrigger15 linkto (ball15);
 
 killtrigger16 = getent("ball16_hurt","targetname");
 killtrigger16 enablelinkto();
 killtrigger16 linkto (ball16);
 
 killtrigger17 = getent("ball17_hurt","targetname");
 killtrigger17 enablelinkto();
 killtrigger17 linkto (ball17);
 
 killtrigger18 = getent("ball18_hurt","targetname");
 killtrigger18 enablelinkto();
 killtrigger18 linkto (ball18);
 
 
 trigger waittill ("trigger", player );
 trigger delete();
 
 while(1)
                         {
						 ball15 movex (64,0.2);
						 ball16 movex (-64,0.2);
						 ball17 movex (64,0.2);
						 ball18 movey (64,0.2);
						 statue7 movez (20,2);
						 wait(0.2);
						 ball15 movey (-64,0.2);
						 ball16 movey (64,0.2);
						 ball17 movey (192,0.2);
						 ball18 movex (-192,0.2);
						 statue7 movez (-20,2);
						 wait(0.2);
						 ball15 movex (-64,0.2);
						 ball16 movex (64,0.2);
						 ball17 movey (-192,0.2);
						 ball18 movex (192,0.2);
						 statue7 movez (20,2);
						 wait(0.2);
						 ball15 movey (64,0.2);
						 ball16 movey (-64,0.2);
						 ball17 movex (-64,0.2);
						 ball18 movey (-64,0.2);
						 statue7 movez (-20,2);
						 wait(0.2);
						 }
}
sniper()
{
        level.sniper_trig = getEnt( "sniper1", "targetname");
        jump = getEnt( "sniper2", "targetname" );
        acti = getEnt( "sniper3", "targetname" );
 
 
        while(1)
        {
                
				
				
			    level.sniper_trig waittill( "trigger", player );
            
				if( !isDefined( level.sniper_trig ) )
                        return;
						
               level.knife_trig delete();
               level.bounce_trig delete();
               level.race_trig delete();
               level.tiptoe_trig delete();	
						
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m40a3_mp" );
			    player giveMaxAmmo( "m40a3_mp" );
                player GiveWeapon( "remington700_mp" );
                player giveMaxAmmo( "remington700_mp" );
			    player switchToWeapon( "m40a3_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "m40a3_mp" );
						level.activ giveMaxAmmo( "m40a3_mp" );
						level.activ GiveWeapon( "remington700_mp" );
                        level.activ giveMaxAmmo( "remington700_mp" );
                        level.activ SwitchToWeapon( "m40a3_mp" );
                        wait 0.05;
                       
                }
                wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^3 Has Chosen sniper room!" ); 
            player freezecontrols(true);
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^1Fight^3!" );
            level.activ iPrintlnBold( "^1Fight^3!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
   }
}
bounce()
{
        level.bounce_trig = getEnt( "bounce1", "targetname");
        jump = getEnt( "bounce2", "targetname" );
        acti = getEnt( "bounce3", "targetname" );
 
 
        while(1)
        {
                level.bounce_trig waittill( "trigger", player );
                if( !isDefined( level.bounce_trig ) )
                        return;
 
                level.sniper_trig delete();
                level.knife_trig delete();
				level.race_trig delete();
				level.tiptoe_trig delete();
 
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" ); //jumper weapon  
                player switchToWeapon( "knife_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "knife_mp" );
                        level.activ SwitchToWeapon( "knife_mp" );
                        wait 0.05;
                       
                }
                wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^3 Has Chosen bounce room!" );     //change to what you want it to be
            player freezecontrols(true);
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^1Fight^3!" );
            level.activ iPrintlnBold( "^1Fight^3!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
   }
}
knife()
{
        level.knife_trig = getEnt( "knife1", "targetname");
        jump = getEnt( "knife2", "targetname" );
        acti = getEnt( "knife3", "targetname" );
 
 
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                        return;
 
                level.sniper_trig delete();
                level.bounce_trig delete();
				level.race_trig delete();
				level.tiptoe_trig delete();
				
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" ); //jumper weapon  
                player switchToWeapon( "knife_mp" );
				
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "knife_mp" );
                        level.activ SwitchToWeapon( "knife_mp" );
                        wait 0.05;
                       
                }
                wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^3 Has Chosen knife room!" );     //change to what you want it to be
            
			
			player freezecontrols(true);
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^1Fight^3!" );
            level.activ iPrintlnBold( "^1Fight^3!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                
				while( isAlive( player ) && isDefined( player ) )
                        
						wait 1;
   }
}
racegivesniper()
{

 race_give_sniper = getent("race_give_sniper","targetname");
 
 
                 while(1)
                 {
				         race_give_sniper waittill( "trigger", player );
						 
						 if( !isDefined( race_give_sniper ) )
                         
						 return;
						 
                         player GiveWeapon( "m40a3_mp" );
						 player giveMaxAmmo( "m40a3_mp" );
                         player GiveWeapon( "remington700_mp" );
                         player giveMaxAmmo( "remington700_mp" );
						 player switchToWeapon( "m40a3_mp" );
						 
						 wait 0.05;
                         }
}
race()
{
        level.race_trig = getEnt( "race1", "targetname");
        jump = getEnt( "race2", "targetname" );
        acti = getEnt( "race3", "targetname" );
 
 
        while(1)
        {
                level.race_trig waittill( "trigger", player );
                if( !isDefined( level.race_trig ) )
                        return;
						
                level.sniper_trig delete();
                level.bounce_trig delete();
				level.knife_trig delete();
				level.tiptoe_trig delete();
				
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" );
                player switchToWeapon( "knife_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "knife_mp" );
                        level.activ SwitchToWeapon( "knife_mp" );
                        wait 0.05;
                       
                }
                wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^3 Has Chosen Lets Race room!" );
            player freezecontrols(true);
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^1Lets race^3!" );
            level.activ iPrintlnBold( "^1Lets race^3!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
    }
}
tiptoe()
{
        level.tiptoe_trig = getEnt( "tiptoe1", "targetname");
        jump = getEnt( "tiptoe2", "targetname" );
        acti = getEnt( "tiptoe3", "targetname" );
 
 
        while(1)
        {
                level.tiptoe_trig waittill( "trigger", player );
                if( !isDefined( level.tiptoe_trig ) )
                        return;
 
                level.sniper_trig delete();
                level.bounce_trig delete();
				level.race_trig delete();
				level.knife_trig delete();
 
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player TakeAllWeapons();
                player GiveWeapon( "knife_mp" ); //jumper weapon  
                player switchToWeapon( "knife_mp" );
                if(isDefined(level.activ) && isAlive(level.activ))
                {
                        level.activ setPlayerangles( acti.angles );
                        level.activ setOrigin( acti.origin );
                        level.activ TakeAllWeapons();
                        level.activ GiveWeapon( "knife_mp" );
                        level.activ SwitchToWeapon( "knife_mp" );
                        wait 0.05;
                       
                }
                wait 0.05;
               
                iPrintlnBold( " ^1" + player.name + "^3 Has Chosen Tiptoe room!" );     //change to what you want it to be
            player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^12" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^11" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^1Fight^3!" );
            level.activ iPrintlnBold( "^6Fight^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;
   }
}
tiptoefall1() // cheers pixel for this one +1
{
	tiptoe_fall = getEnt("tiptoe_fall","targetname"); //Targetname of the trigger on the floor
	tiptoe_jump = getEnt("tiptoe_jump","targetname"); //script_origin at the jumpers side
	tiptoe_acti = getEnt("tiptoe_acti","targetname"); //script_origin at the activator's side

	while(1) //Looped so it can be actviated more than once
	{
		tiptoe_fall waittill("trigger", player ); //Trigger on the floor wait until the player has activated it
		if( player.pers["team"] == "allies" ) //If the player is on the jumper's team (allies)
		{
			player setOrigin( tiptoe_jump.origin ); //Set the player's origin to be at the jumper's side
			player setPlayerAngles( tiptoe_jump.angles ); //Set the player's angles to match the origin's.
		}
		else //If he is not on the jumper's team
		{		
			player setOrigin( tiptoe_acti.origin ); //Set the player's origin at the activator's side
			player setPlayerAngles( tiptoe_acti.angles ); //Set the player's angles to match the origin's.
		}
		wait .05; //Wait 0.05 seconds
	}
}
tiptoegivesniper()
{

 tiptoe_give_sniper = getent("tiptoe_give_sniper","targetname");
 
 
                 while(1)
                 {
				         tiptoe_give_sniper waittill( "trigger", player );
						 
						 if( !isDefined( tiptoe_give_sniper ) )
                         
						 return;
						 
                         player GiveWeapon( "m40a3_mp" );
						 player giveMaxAmmo( "m40a3_mp" );
                         player GiveWeapon( "remington700_mp" );
                         player giveMaxAmmo( "remington700_mp" );
						 player switchToWeapon( "m40a3_mp" );
						 
						 wait 0.05;
                         }
}
race_teleport1() // cheers pixel for this one +1
{
	race_fall1 = getEnt("race_fall1","targetname");
	race_jump1 = getEnt("race_jump1","targetname");
	race_acti1 = getEnt("race_acti1","targetname");

	while(1)
	{
		race_fall1 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump1.origin );
			player setPlayerAngles( race_jump1.angles );
		}
		else
		{		
			player setOrigin( race_acti1.origin );
			player setPlayerAngles(race_acti1.angles ); 
		}
		wait .05;
	}
}
race_teleport2() // cheers pixel for this one +1
{
	race_fall2 = getEnt("race_fall2","targetname");
	race_jump2 = getEnt("race_jump2","targetname");
	race_acti2 = getEnt("race_acti2","targetname");

	while(1)
	{
		race_fall2 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump2.origin );
			player setPlayerAngles( race_jump2.angles );
		}
		else
		{		
			player setOrigin( race_acti2.origin );
			player setPlayerAngles(race_acti2.angles ); 
		}
		wait .05;
	}
}
race_teleport3() // cheers pixel for this one +1
{
	race_fall3 = getEnt("race_fall3","targetname");
	race_jump3 = getEnt("race_jump3","targetname");
	race_acti3 = getEnt("race_acti3","targetname");

	while(1)
	{
		race_fall3 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump3.origin );
			player setPlayerAngles( race_jump3.angles );
		}
		else
		{		
			player setOrigin( race_acti3.origin );
			player setPlayerAngles(race_acti3.angles ); 
		}
		wait .05;
	}
}
race_teleport4() // cheers pixel for this one +1
{
	race_fall4 = getEnt("race_fall4","targetname");
	race_jump4 = getEnt("race_jump4","targetname");
	race_acti4 = getEnt("race_acti4","targetname");

	while(1)
	{
		race_fall4 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump4.origin );
			player setPlayerAngles( race_jump4.angles );
		}
		else
		{		
			player setOrigin( race_acti4.origin );
			player setPlayerAngles(race_acti4.angles ); 
		}
		wait .05;
	}
}
race_teleport5() // cheers pixel for this one +1
{
	race_fall5 = getEnt("race_fall5","targetname");
	race_jump5 = getEnt("race_jump5","targetname");
	race_acti5 = getEnt("race_acti5","targetname");

	while(1)
	{
		race_fall5 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump5.origin );
			player setPlayerAngles( race_jump5.angles );
		}
		else
		{		
			player setOrigin( race_acti5.origin );
			player setPlayerAngles(race_acti5.angles ); 
		}
		wait .05;
	}
}
race_teleport6() // cheers pixel for this one +1
{
	race_fall6 = getEnt("race_fall6","targetname");
	race_jump6 = getEnt("race_jump6","targetname");
	race_acti6 = getEnt("race_acti6","targetname");

	while(1)
	{
		race_fall6 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump6.origin );
			player setPlayerAngles( race_jump6.angles );
		}
		else
		{		
			player setOrigin( race_acti6.origin );
			player setPlayerAngles(race_acti6.angles ); 
		}
		wait .05;
	}
}
race_teleport7() // cheers pixel for this one +1
{
	race_fall7 = getEnt("race_fall7","targetname");
	race_jump7 = getEnt("race_jump7","targetname");
	race_acti7 = getEnt("race_acti7","targetname");

	while(1)
	{
		race_fall7 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump7.origin );
			player setPlayerAngles( race_jump7.angles );
		}
		else
		{		
			player setOrigin( race_acti7.origin );
			player setPlayerAngles(race_acti7.angles ); 
		}
		wait .05;
	}
}
race_teleport8() // cheers pixel for this one +1
{
	race_fall8 = getEnt("race_fall8","targetname");
	race_jump8 = getEnt("race_jump8","targetname");
	race_acti8 = getEnt("race_acti8","targetname");

	while(1)
	{
		race_fall8 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump8.origin );
			player setPlayerAngles( race_jump8.angles );
		}
		else
		{		
			player setOrigin( race_acti8.origin );
			player setPlayerAngles(race_acti8.angles ); 
		}
		wait .05;
	}
}
race_teleport9() // cheers pixel for this one +1
{
	race_fall9 = getEnt("race_fall9","targetname");
	race_jump9 = getEnt("race_jump9","targetname");
	race_acti9 = getEnt("race_acti9","targetname");

	while(1)
	{
		race_fall9 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump9.origin );
			player setPlayerAngles( race_jump9.angles );
		}
		else
		{		
			player setOrigin( race_acti9.origin );
			player setPlayerAngles(race_acti9.angles ); 
		}
		wait .05;
	}
}
race_teleport10() // cheers pixel for this one +1
{
	race_fall10 = getEnt("race_fall10","targetname");
	race_jump10 = getEnt("race_jump10","targetname");
	race_acti10 = getEnt("race_acti10","targetname");

	while(1)
	{
		race_fall10 waittill("trigger", player );
		if( player.pers["team"] == "allies" )
		{
			player setOrigin( race_jump10.origin );
			player setPlayerAngles( race_jump10.angles );
		}
		else
		{		
			player setOrigin( race_acti10.origin );
			player setPlayerAngles(race_acti10.angles ); 
		}
		wait .05;
	}
}
movingbounce()
{

 movingbounce1 = getent("movingbounce1","targetname");
 movingbounce2 = getent("movingbounce2","targetname");
 
 while(1)
                         {
						 movingbounce1 movex (-704,1);
						 movingbounce2 movex (704,1);
						 wait(1);
						 movingbounce1 movex (704,1);
						 movingbounce2 movex (-704,1);
						 wait(1);
						 }
}
bouncefall() // cheers pixel for this one +1
{
	fall = getEnt("fall","targetname"); //Targetname of the trigger on the floor
	spawn_jump = getEnt("spawn_jump","targetname"); //script_origin at the jumpers side
	spawn_acti = getEnt("spawn_acti","targetname"); //script_origin at the activator's side

	while(1) //Looped so it can be actviated more than once
	{
		fall waittill("trigger", player ); //Trigger on the floor wait until the player has activated it
		if( player.pers["team"] == "allies" ) //If the player is on the jumper's team (allies)
		{
			player setOrigin( spawn_jump.origin ); //Set the player's origin to be at the jumper's side
			player setPlayerAngles( spawn_jump.angles ); //Set the player's angles to match the origin's.
		}
		else //If he is not on the jumper's team
		{		
			player setOrigin( spawn_acti.origin ); //Set the player's origin at the activator's side
			player setPlayerAngles(spawn_acti.angles ); //Set the player's angles to match the origin's.
		}
		wait .05; //Wait 0.05 seconds
	}
}
wave1()
{
  wave1 = getent("wave1","targetname");
   while(1)
{
  wait (1);
  wave1 movez (240,4,1,1);
  wave1 waittill ("movedone");
  wait (1);
  wave1 movez(-240,4,1,1);
  wave1 waittill ("movedone");
}
}
wave2()
{
  wave2 = getent("wave2","targetname");
   while(1)
{
  wait (1);
  wave2 movez (192,4,1,1);
  wave2 waittill ("movedone");
  wait (1);
  wave2 movez(-192,4,1,1);
  wave2 waittill ("movedone");
}
}
wave3()
{
  wave3 = getent("wave3","targetname");
   while(1)
{
  wait (1);
  wave3 movez (144,4,1,1);
  wave3 waittill ("movedone");
  wait (1);
  wave3 movez(-144,4,1,1);
  wave3 waittill ("movedone");
}
}
wave4()
{
  wave4 = getent("wave4","targetname");
   while(1)
{
  wait (1);
  wave4 movez (96,4,1,1);
  wave4 waittill ("movedone");
  wait (1);
  wave4 movez(-96,4,1,1);
  wave4 waittill ("movedone");
}
}
wave5()
{
  wave5 = getent("wave5","targetname");
   while(1)
{
  wait (1);
  wave5 movez (48,4,1,1);
  wave5 waittill ("movedone");
  wait (1);
  wave5 movez (-48,4,1,1);
  wave5 waittill ("movedone");
}
}
wave6()
{
  wave6 = getent("wave6","targetname");
   while(1)
{
  wait (1);
  wave6 movez (96,4,1,1);
  wave6 waittill ("movedone");
  wait (1);
  wave6 movez (-96,4,1,1);
  wave6 waittill ("movedone");
}
}
wave7()
{
  wave7 = getent("wave7","targetname");
   while(1)
{
  wait (1);
  wave7 movez (144,4,1,1);
  wave7 waittill ("movedone");
  wait (1);
  wave7 movez (-144,4,1,1);
  wave7 waittill ("movedone");
}
}
wave8()
{
  wave8 = getent("wave8","targetname");
   while(1)
{
  wait (1);
  wave8 movez (192,4,1,1);
  wave8 waittill ("movedone");
  wait (1);
  wave8 movez (-192,4,1,1);
  wave8 waittill ("movedone");
}
}
wave9()
{
  wave9 = getent("wave9","targetname");
   while(1)
{
  wait (1);
  wave9 movez (240,4,1,1);
  wave9 waittill ("movedone");
  wait (1);
  wave9 movez (-240,4,1,1);
  wave9 waittill ("movedone");
}
}
wave10()
{
  wave10 = getent("wave10","targetname");
   while(1)
{
  wait (1);
  wave10 movez (192,4,1,1);
  wave10 waittill ("movedone");
  wait (1);
  wave10 movez (-192,4,1,1);
  wave10 waittill ("movedone");
}
}
wave11()
{
  wave11 = getent("wave11","targetname");
   while(1)
{
  wait (1);
  wave11 movez (144,4,1,1);
  wave11 waittill ("movedone");
  wait (1);
  wave11 movez (-144,4,1,1);
  wave11 waittill ("movedone");
}
}
wave12()
{
  wave12 = getent("wave12","targetname");
   while(1)
{
  wait (1);
  wave12 movez (96,4,1,1);
  wave12 waittill ("movedone");
  wait (1);
  wave12 movez (-96,4,1,1);
  wave12 waittill ("movedone");
}
}
wave13()
{
  wave13 = getent("wave13","targetname");
   while(1)
{
  wait (1);
  wave13 movez (48,4,1,1);
  wave13 waittill ("movedone");
  wait (1);
  wave13 movez (-48,4,1,1);
  wave13 waittill ("movedone");
}
}
wave15()
{
  wave15 = getent("wave15","targetname");
   while(1)
{
  wait (1);
  wave15 movez (144,4,1,1);
  wave15 waittill ("movedone");
  wait (1);
  wave15 movez (-144,4,1,1);
  wave15 waittill ("movedone");
}
}
wave16()
{
  wave16 = getent("wave16","targetname");
   while(1)
{
  wait (1);
  wave16 movez (192,4,1,1);
  wave16 waittill ("movedone");
  wait (1);
  wave16 movez (-192,4,1,1);
  wave16 waittill ("movedone");
}
}
wave17()
{
  wave17 = getent("wave17","targetname");
   while(1)
{
  wait (1);
  wave17 movez (240,4,1,1);
  wave17 waittill ("movedone");
  wait (1);
  wave17 movez (-240,4,1,1);
  wave17 waittill ("movedone");
}
}
wave18()
{
  wave18 = getent("wave18","targetname");
   while(1)
{
  wait (1);
  wave18 movez (192,4,1,1);
  wave18 waittill ("movedone");
  wait (1);
  wave18 movez (-192,4,1,1);
  wave18 waittill ("movedone");
}
}
wave19()
{
  wave19 = getent("wave19","targetname");
   while(1)
{
  wait (1);
  wave19 movez (144,4,1,1);
  wave19 waittill ("movedone");
  wait (1);
  wave19 movez (-144,4,1,1);
  wave19 waittill ("movedone");
}
}
wave20()
{
  wave20 = getent("wave20","targetname");
   while(1)
{
  wait (1);
  wave20 movez (96,4,1,1);
  wave20 waittill ("movedone");
  wait (1);
  wave20 movez (-96,4,1,1);
  wave20 waittill ("movedone");
}
}
wave21()
{
  wave21 = getent("wave21","targetname");
   while(1)
{
  wait (1);
  wave21 movez (48,4,1,1);
  wave21 waittill ("movedone");
  wait (1);
  wave21 movez (-48,4,1,1);
  wave21 waittill ("movedone");
}
}
wave22()
{
  wave22 = getent("wave22","targetname");
   while(1)
{
  wait (1);
  wave22 movez (96,4,1,1);
  wave22 waittill ("movedone");
  wait (1);
  wave22 movez (-96,4,1,1);
  wave22 waittill ("movedone");
}
}
wave23()
{
  wave23 = getent("wave23","targetname");
   while(1)
{
  wait (1);
  wave23 movez (144,4,1,1);
  wave23 waittill ("movedone");
  wait (1);
  wave23 movez (-144,4,1,1);
  wave23 waittill ("movedone");
}
}
wave24()
{
  wave24 = getent("wave24","targetname");
   while(1)
{
  wait (1);
  wave24 movez (192,4,1,1);
  wave24 waittill ("movedone");
  wait (1);
  wave24 movez (-192,4,1,1);
  wave24 waittill ("movedone");
}
}
wave25()
{
  wave25 = getent("wave25","targetname");
   while(1)
{
  wait (1);
  wave25 movez (240,4,1,1);
  wave25 waittill ("movedone");
  wait (1);
  wave25 movez (-240,4,1,1);
  wave25 waittill ("movedone");
}
}
wave26()
{
  wave26 = getent("wave26","targetname");
   while(1)
{
  wait (1);
  wave26 movez (192,4,1,1);
  wave26 waittill ("movedone");
  wait (1);
  wave26 movez (-192,4,1,1);
  wave26 waittill ("movedone");
}
}
wave27()
{
  wave27 = getent("wave27","targetname");
   while(1)
{
  wait (1);
  wave27 movez (144,4,1,1);
  wave27 waittill ("movedone");
  wait (1);
  wave27 movez (-144,4,1,1);
  wave27 waittill ("movedone");
}
}
wave28()
{
  wave28 = getent("wave28","targetname");
   while(1)
{
  wait (1);
  wave28 movez (96,4,1,1);
  wave28 waittill ("movedone");
  wait (1);
  wave28 movez (-96,4,1,1);
  wave28 waittill ("movedone");
}
}
wave29()
{
  wave29 = getent("wave29","targetname");
   while(1)
{
  wait (1);
  wave29 movez (48,4,1,1);
  wave29 waittill ("movedone");
  wait (1);
  wave29 movez (-48,4,1,1);
  wave29 waittill ("movedone");
}
}
wave30()
{
  wave30 = getent("wave30","targetname");
   while(1)
{
  wait (1);
  wave30 movez (96,4,1,1);
  wave30 waittill ("movedone");
  wait (1);
  wave30 movez (-96,4,1,1);
  wave30 waittill ("movedone");
}
}
wave31()
{
  wave31 = getent("wave31","targetname");
   while(1)
{
  wait (1);
  wave31 movez (144,4,1,1);
  wave31 waittill ("movedone");
  wait (1);
  wave31 movez (-144,4,1,1);
  wave31 waittill ("movedone");
}
}
wave32()
{
  wave32 = getent("wave32","targetname");
   while(1)
{
  wait (1);
  wave32 movez (192,4,1,1);
  wave32 waittill ("movedone");
  wait (1);
  wave32 movez (-192,4,1,1);
  wave32 waittill ("movedone");
}
}
wave14() //got trolled and now fixed
{
  wave14 = getent("wave14","targetname");
   while(1)
{
  wait (1);
  wave14 movez (96,4,1,1);
  wave14 waittill ("movedone");
  wait (1);
  wave14 movez (-96,4,1,1);
  wave14 waittill ("movedone");
}
}
bounce_give_weapon()
{

 bounce_give_weapon = getent("bounce_give_weapon","targetname");
 
 
                 while(1)
                 {
				         bounce_give_weapon waittill( "trigger", player );
						 
						 if( !isDefined( bounce_give_weapon ) )
                         
						 return;
						 
                         player GiveWeapon( "deserteagle_mp" );
                         player giveMaxAmmo( "deserteagle_mp" );
                         player switchToWeapon( "deserteagle_mp" );
						 wait 0.05;
                         }
}
