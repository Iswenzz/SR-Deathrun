main()
{
	maps\mp\_load::main();

	PreCacheItem("brick_blaster_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("rpg_mp");

	ambientplay( "beat" );
	
	thread SetTimeLimit( 8 );
	thread trap1();
	thread trap2();
	thread elev();
	thread trapelev();
	thread signs();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap11();
	thread trap12();
	thread trap13();
	thread trap14();
	thread trap15();
	thread trap16();
	thread secret();
	thread lazers1();
	thread lazers2();
	thread deagle();
	thread bounce();
	thread knife();
	thread snip();
	thread games();
	thread firstplace();
	thread derp();
	thread derp2();
	thread run();
	thread run_rpg();
	thread run_end();
	thread run_rotate();
	thread run_rotate2();
	thread run_ele();
	thread run_door1();
	thread run_door2();
	thread old();
	thread stage2();
	thread Acti_stage1();
	thread Acti_stage2();
	thread ammo1();
	thread ammo2();
	thread ammo3();
	thread bouncerspawn();
	thread bounceelev();
	thread bouncegun();
	thread lol();
	thread hardstart();
	thread hardfail1();
	thread hardfail2();
	thread hardfail3();
	thread hardend();
	addTriggerToList("trigger1");
        addTriggerToList("trigger2");
        addTriggerToList("trigger3");
        addTriggerToList("trigger5");
        addTriggerToList("trigger6");
        addTriggerToList("trigger7");
        addTriggerToList("trigger8");
        addTriggerToList("trigger9");
        addTriggerToList("trigger10");
        addTriggerToList("trigger11");
	addTriggerToList("trigger12");
	addTriggerToList("trigger13");
	addTriggerToList("trigger14");
	addTriggerToList("trigger15");
	addTriggerToList("notsolid2");

	precache();

	health = getentarray("run_health","targetname");
	for(i=0;i<health.size;i++)
		health[i] thread maxhealth();
}

touching(ent)
{
	level endon("game_ended");
	while(1)
	{
		players = getEntArray("player","classname");	
		for(i = 0; i < players.size; i++)
		{
			if(players[i] isTouching(ent))
				players[i] suicide();
		}
		wait .05;
	}
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

SetTimeLimit( time )
{
    wait 0.05;
	if( level.dvar["time_limit"] <= time )
		level.dvar["time_limit"] = time;
}

signs()
{
	sign1 = getent( "sign1", "targetname" );
	sign2 = getent( "sign2", "targetname" );
	sign3 = getent( "sign3", "targetname" );

 	for( ;; )
	{
	
		sign1 show();
		sign1 notsolid();
		sign2 hide();
		sign2 notsolid();
		sign3 hide();
		sign3 notsolid();
		wait 5;
		sign1 hide();
		sign1 notsolid();
		sign2 show();
		sign2 notsolid();
		sign3 hide();
		sign3 notsolid();
		wait 5;
		sign3 show();
		sign3 notsolid();
		sign2 show();
		sign2 notsolid();
		sign1 hide();
		sign1 notsolid();
		wait 5;
		
	}	
}


games()
{
     	level.games_trig = getEnt( "minigames", "targetname");
     	games = getEnt( "minigames_ori", "targetname" );
     
     	while(1)
     	{
         	level.games_trig waittill( "trigger", player );
         	if( !isDefined( level.games_trig ) )
         	return;

		level.games_trig SetHintstring ("^1Please wait!");

		level.old_trig delete();

         	player SetPlayerAngles( games.angles );
         	player setOrigin( games.origin );
	 	iPrintlnBold( " ^2" + player.name + " ^5 has entered the minigames section^1!" );
         	player TakeAllWeapons();
	 	player died();
	
	             
         	while( isAlive( player ) && isDefined( player ) )
		if( isDefined( level.activ ) && isAlive( level.activ ) )
             	wait 1;
     	}
}

died()
{
	self endon("disconnect");

	self waittill("death");
	iPrintlnBold("^2"+self.name+" ^5died^1!");
	iPrintlnBold("^2The Minigames Section is now ^5open^1.");
	level.games_trig SetHintstring ("^2Minigames.");
}

knife()
{
     	level.knife_trig = getEnt( "knife", "targetname");
     	jump = getEnt( "knife_jump", "targetname" );
     	acti = getEnt( "knife_acti", "targetname" );
     
     	while(1)
     	{
         	level.knife_trig waittill( "trigger", player );
         	if( !isDefined( level.knife_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "tomahawk_mp" );      
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "tomahawk_mp" ); 
		iPrintlnBold( " ^2" + player.name + " ^5 has entered the Knife room^1!" );               
         	wait 0.05;
         	player switchToWeapon( "tomahawk_mp" );
         	level.activ SwitchToWeapon( "tomahawk_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Fight^1!" );
		level.activ iPrintlnBold( "^5Fight^1!" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);
		     
     	}
}

bounce()
{
     	level.bounce_trig = getEnt( "assault", "targetname");
     	jump = getEnt( "bounce_tele_jump", "targetname" );
     	acti = getEnt( "bounce_tele_acti", "targetname" );
     
     	while(1)
     	{
         	level.bounce_trig waittill( "trigger", player );
         	if( !isDefined( level.bounce_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
		player giveweapon( "tomahawk_mp" );     
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
		level.activ giveweapon( "tomahawk_mp" ); 
		iPrintlnBold( " ^2" + player.name + " ^5 has entered the Bounce room^1!" );         
         	wait 0.05;
		level.activ switchtoweapon( "tomahawk_mp" );
		player switchtoweapon( "tomahawk_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Bounce^1!" );
		level.activ iPrintlnBold( "^5Bounce^1!" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);     
     	}
}

old()
{
   	level.old_trig = getEnt ("oldtrig" , "targetname");
   	brush = getEnt ("old" ,"targetname" );
	level.old_trig sethintstring( "Press ^3[Use] ^7to enter the old way." );

	if( !isDefined( level.freeRun ) )
	wait 0.1;

	if( isDefined( level.freeRun ) && level.freeRun )
	{

		level.games_trig delete();
		level.old_trig delete();
		level.secret_trig delete();
		return;
	}

   	level.old_trig waittill ("trigger",player);
	level.old_trig delete();
	level.games_trig delete();

	iPrintlnBold( " ^2" + player.name + " ^5 has entered the Old way^1!" );   
   
   	brush moveZ ( -600 , 4);
}
	
snip()
{
     	level.snip_trig = getEnt( "sniper", "targetname");
     	jump = getEnt( "snip_jump", "targetname" );
     	acti = getEnt( "snip_acti", "targetname" );
     
     	while(1)
     	{
         	level.snip_trig waittill( "trigger", player );
         	if( !isDefined( level.snip_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "m40a3_mp" );
	 	player givemaxammo( "m40a3_mp" );
         	player GiveWeapon( "remington700_mp" );
	 	player givemaxammo( "remington700_mp" );       
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "m40a3_mp" );
	 	level.activ givemaxammo( "m40a3_mp" );
         	level.activ GiveWeapon( "remington700_mp" );
	 	level.activ givemaxammo( "remington700_mp" );
		iPrintlnBold( " ^2" + player.name + " ^5 has entered the Sniper room^1!" );         		
		wait .5;
         	player switchToWeapon( "m40a3_mp" );
         	level.activ SwitchToWeapon( "m40a3_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Fight^1!" );
		level.activ iPrintlnBold( "^5Fight^1!" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}

deagle()
{
     	level.deagle_trig = getEnt( "deagle", "targetname");
     	jump = getEnt( "deagle_jump", "targetname" );
     	acti = getEnt( "deagle_acti", "targetname" );
     
     	while(1)
     	{
         	level.deagle_trig waittill( "trigger", player );
         	if( !isDefined( level.deagle_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "deserteagle_mp" );
	 	player givemaxammo( "deserteagle_mp" );      
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "deserteagle_mp" );
	 	level.activ givemaxammo( "deserteagle_mp" );
		iPrintlnBold( " ^2" + player.name + " ^5 has entered the Deagle room^1!" );         		
		wait 0.05;
         	player switchToWeapon( "deserteagle_mp" );
         	level.activ SwitchToWeapon( "deserteagle_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Fight^1!" );
		level.activ iPrintlnBold( "^5Fight^1!" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}

run()
{
     	level.run_trig = getEnt( "run_start", "targetname");
     	jump = getEnt( "run_jump", "targetname" );
     	acti = getEnt( "run_acti", "targetname" );
     
     	while(1)
     	{
         	level.run_trig waittill( "trigger", player );
         	if( !isDefined( level.run_trig ) )
         	return;

         	player SetPlayerAngles( jump.angles );
         	player setOrigin( jump.origin );
         	player TakeAllWeapons();
         	player GiveWeapon( "tomahawk_mp" );
	 	player givemaxammo( "tomahawk_mp" );      
         	level.activ setPlayerangles( acti.angles );
         	level.activ setOrigin( acti.origin );
         	level.activ TakeAllWeapons();
         	level.activ GiveWeapon( "rpg_mp" );
	 	level.activ givemaxammo( "rpg_mp" );
		iPrintlnBold( " ^2" + player.name + " ^5 has entered run^1!" );         		
		wait 0.05;
         	player switchToWeapon( "tomahawk_mp" );
         	level.activ SwitchToWeapon( "rpg_mp" );
		player freezecontrols(true); 
		level.activ freezecontrols(true);
		wait 1;
		player iPrintlnBold( "^53" );
		level.activ iPrintlnBold( "^53" );
		wait 1;
		player iPrintlnBold( "^52" );
		level.activ iPrintlnBold( "^52" );
		wait 1;
		player iPrintlnBold( "^51" );
		level.activ iPrintlnBold( "^51" );
		wait 1;
		player iPrintlnBold( "^5Run^1!" );
		level.activ iPrintlnBold( "^5Fight^1!" );
		player freezecontrols(false); 
		level.activ freezecontrols(false);        
     	}
}

run_ele()
{
   	brush = getEnt ("run_elev" ,"targetname" );
	brush1 = getEnt ("run_circles" ,"targetname" );
   

   	while( 1 )
   	{	
   
   		brush movez ( 496 , 2);
   		wait 4;
  		brush movez ( -496, 2 );
   		wait 4;
    	}
}

run_rotate()
{
	brush = getEnt ("run_circles" ,"targetname" );
   

   	while( 1 )
   	{	
   
   		brush rotateyaw( 360, 2 );
   		wait 2;
    	}
}

run_rotate2()
{
	brush = getEnt ("run_circle2" ,"targetname" );
   

   	while( 1 )
   	{	
   
   		brush rotateyaw( 360, 2 );
   		wait 2;
    	}
}

run_rpg()
{
	rpg = getEnt ("run_rpg", "targetname");

	while(1)
	{
		rpg waittill ( "trigger", who );
	
		who givemaxammo( "rpg_mp" );
		wait 2;
	}
}

run_door1()
{
     	level.door1_trig = getEnt( "run_door1trig", "targetname");
     	acti = getEnt( "run_acti", "targetname" );
	door = getEnt( "run_door1", "targetname" );
     
     	while(1)
     	{
         	level.door1_trig waittill( "trigger", player );
         	if( !isDefined( level.door1_trig ) )
         	return;

         	level.activ SetPlayerAngles( acti.angles );
         	level.activ setOrigin( acti.origin );
	 	iPrintlnBold( " ^2" + player.name + " ^5 has finnished run^1!" );

		level.activ takeallweapons();
		player giveweapon("deserteagle_mp");
		player givemaxammo("deserteagle_mp");
		wait .2;
		player switchtoweapon("deserteagle_mp");

		door movez ( -500 , 2);
   		wait 5;
  		door movez ( 500, 2 );
     	}
}

run_door2()
{
     	level.door2_trig = getEnt( "run_door2trig", "targetname");
     	acti = getEnt( "run_acti", "targetname" );
	door = getEnt( "run_door2", "targetname" );
     
     	while(1)
     	{
         	level.door2_trig waittill( "trigger", player );
         	if( !isDefined( level.door2_trig ) )
         	return;

         	level.activ SetPlayerAngles( acti.angles );
         	level.activ setOrigin( acti.origin );
	 	iPrintlnBold( " ^2" + player.name + " ^5 has finnished run^1!" );

		level.activ takeallweapons();
		player giveweapon("deserteagle_mp");
		player givemaxammo("deserteagle_mp");
		wait .2;
		player switchtoweapon("deserteagle_mp");

		door movez ( -500 , 2);
   		wait 5;
  		door movez ( 500, 2 );
     	}
}

run_end()
{
	end = getEnt ("run_end", "targetname");

	while(1)
	{
		end waittill ( "trigger", who );
	
		level.activ takeallweapons();
		level.activ giveweapon ( "knife_mp" );
		wait 0.05;
		level.activ switchtoweapon ( "knife_mp" );
	}
}

trap1()
{
	trig = getEnt("trigger1","targetname");
 	brush1 = getEnt("trap1_ran1","targetname");
 	brush2 = getEnt("trap1_ran2","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");
	random = randomInt(2);
	switch(random)
	{
		case 0:	brush1 delete();
				break;
				
		case 1:	brush2 delete();
				break;
				
		default: return;
	}
}

trap2()
{
	trig = getEnt("trigger2","targetname");
 	brush1 = getEnt("trap2_ran1","targetname");
 	brush2 = getEnt("trap2_ran2","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");
	random = randomInt(2);
	switch(random)
	{
		case 0:	brush1 delete();
				break;
				
		case 1:	brush2 delete();
				break;
				
		default: return;
	}
}
	
elev()
{
   	brush = getEnt ("trap_ele" ,"targetname" );
	wait 5;
 
	while(true) 
	{ 
		brush moveto ((-4664,-652,296.5),6,2,2); 
		brush waittill ("movedone"); 
		wait 5; 
		brush moveto ((-3624, -680, 11),6,2,2); 
		brush waittill ("movedone"); 
		wait 5; 
	}
}

trapelev()
{
   	brush = getEnt ("trap_ele" ,"targetname" );
	trig = getEnt("notsolid2","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");

	brush notsolid();
	wait 3;	
	brush solid();
}

trap3()
{
	trig = getEnt( "trigger3", "targetname" );
	brush = getEnt( "trap3", "targetname" );

	trig waittill( "trigger", player );
	trig SetHintstring ("^1Activated!");

	while( isDefined( brush ) )
	{
		brush rotateRoll( 360, 5 );
		wait 5;
	}
}

trap4()
{
	trig = getEnt( "trigger5", "targetname" );
	brush = getEnt( "trap5", "targetname" );

	trig waittill( "trigger", player );
	trig SetHintstring ("^1Activated!");

	while( isDefined( brush ) )
	{
		brush rotateRoll( 360, 4.5 );
		wait 4.5;
	}
}

trap5()
{
	trig = getEnt("trigger6","targetname");
 	brush1 = getEnt("trap6_ran1","targetname");
 	brush2 = getEnt("trap6_ran2","targetname");
	brush3 = getEnt("trap6_ran3","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");
	while(1)
	{
		brush1 rotateyaw( 360, 2 );
		wait 2;
		brush2 rotateyaw( 360, 2 );
		wait 2;
		brush3 rotateyaw( 360, 2 );
		wait 2;
	}
}
	
trap6()
{
   	trig = getEnt ("trigger7" , "targetname");
   	brush = getEnt ("trap7" ,"targetname" );

   	trig waittill ("trigger",player);  
	trig SetHintstring ("^1Activated!");

   	while( 1 )
   	{
   
   		brush moveZ ( 90 , 1);
   		wait 1;
  	 	brush moveZ ( -90, 1 );
   		wait 1;
	}
}

trap7()
{
	trig = getEnt("trigger8","targetname");
 	brush1 = getEnt("trap8_ran1","targetname");
 	brush2 = getEnt("trap8_ran2","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");
	random = randomInt(2);
	switch(random)
	{
		case 0:	brush1 delete();
				break;
				
		case 1:	brush2 delete();
				break;
				
		default: return;
	}
}

trap8()
{
	trig = getEnt( "trigger9", "targetname" );
	brush = getEnt( "trap9_1", "targetname" );	
	brush1 = getEnt( "trap9_2", "targetname" );

	trig waittill( "trigger", player );
	trig SetHintstring ("^1Activated!");

	while(1)
	{
		brush rotateroll( 360, 3 );
		brush1 rotateroll( -360, 3 );
		wait 3;
	}
}

trap9()
{
	trig = getEnt( "trigger10", "targetname" );
	brush = getEnt( "trap10", "targetname" );

	trig waittill( "trigger" );
	trig SetHintstring ("^1Activated!");

	while(1)
	{
		brush rotateyaw( 360, 2 );
		wait 2;
	}
}

trap11()
{
   	brush = getEnt ("trap12" ,"targetname" );
	trig = getEnt("trigger11","targetname");

	trig waittill("trigger");
	trig SetHintstring ("^1Activated!");

	brush notsolid();
	wait 4;	
	brush solid();
}


trap12()
{
   	trig = getEnt ("trigger12" , "targetname");
   	brush = getEnt ("trap13" ,"targetname" );
	
   	trig waittill ("trigger");
	trig SetHintstring ("^1Activated!");  
  
   	for( i = 0; i < 7; i++ )
	{
		brush rotateYaw( 360, 1 );
		wait 1;
	}
}

trap13()
{
   	brush = getEnt ("trap13_1" ,"targetname" );
   	brush1 = getEnt ("trap13_2" ,"targetname" );
	trig = getEnt ("trigger13" , "targetname");

	trig waittill ("trigger");
	trig SetHintstring ("^1Activated!");
     
   	while(1)
        {
		brush rotateRoll( 360, 1.5 );
		brush1 rotateRoll( -360, 1.5 );
		wait 1.5;
	}
}

trap14()
{
	brush = getEnt ("trap14_oben" ,"targetname" );
	things = getEnt ("things" ,"targetname" );
	trig = getEnt ("trigger14" , "targetname");

	trig waittill ("trigger");
	trig SetHintstring ("^1Activated!");

	brush notsolid();
	thread touching(brush);
   
   	while(1)
   	{
   	
		brush movez( -160 , .4);
		things movez( -160, .4);
  	 	wait 1;
		brush movez ( 160 , .4);
		things movez ( 160, .4);
		wait 1;
	}
}

trap15()
{
	trig = getEnt ("trigger15" , "targetname");
	brush = getEnt( "trap15_links", "targetname" );
	brush1 = getEnt( "trap15_rechts", "targetname" );

	trig waittill ("trigger");
	trig SetHintstring ("^1Activated!");

	brush notsolid();
	thread touching(brush);
	brush1 notsolid();
	thread touching(brush1);


	while(1)
	{
		brush rotateyaw( 360, 2.5 );
		brush1 rotateyaw( -360, 2.5 );
		wait 2.5;
	}
}

trap16()
{
	doors = getEnt ("trap16_doors" ,"targetname" );
	wall = getEnt ("trap16_wall" ,"targetname" );
	trig = getEnt ("trigger16" , "targetname");

	trig waittill ("trigger");
	trig SetHintstring ("^1Activated!");
   	
	doors movey( -306 , 2);
  	wait 2;
	wall movey ( 752 , 6);
	wait 6;
	wall movey ( -745 , 1);
	wait 1;
	doors movey( 306 , 2);
}

lazers1()
{
	lazer1 = getEnt ("trap11_1" , "targetname");
	
	lazer1 notsolid();
	thread touching(lazer1);

	while(1)
	{
		lazer1 movez( 192 , 0.7);
		wait 0.7;
		lazer1 movez( -192 , 0.7);
		wait 0.7;
	}
}

lazers2()
{
	lazer2 = getEnt ("lazer2" , "targetname");

	lazer2 notsolid();
	thread touching(lazer2);

	while(1)
	{
		lazer2 movex( 462 , 1.2);
		wait 1.2;
		lazer2 movex( -462 , 1.2);
		wait 1.2;
	}
}

derp()
{
	brush1 = getEnt ("elev2_1" , "targetname");

	while(1)
	{
		brush1 movez( -96 , 1);
		wait 1.5;
		brush1 movez( 96 , 1);
		wait 1.5;
	}
}

derp2()
{
	brush = getEnt ("elev2_2" , "targetname");

	while(1)
	{
		brush movex( 800 , 3);
		wait 4;
		brush movex( -800 , 3);
		wait 4;
	}
}


	
secret()
{
   	trig = getEnt ("trigger_secret" , "targetname");
   	trig waittill ("trigger",player);  
   	trig delete();

	player giveweapon ("brick_blaster_mp");
	player givemaxammo ("brick_blaster_mp");
	wait .5;
	player switchtoweapon("brick_blaster_mp");

}

stage2()
{
	trigger = getEnt ("stage2", "targetname");
	target = getEnt ("stage2_ori", "targetname");
	
	for(;;)
	{
		trigger waittill ("trigger", player);
		
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
	}
}

Acti_stage1()
{
	trig = getEnt ("stage1acti", "targetname");
	target1 = getEnt ("stage1_ran1", "targetname");
	target2 = getEnt ("stage1_ran2", "targetname");
	target3 = getEnt ("stage1_ran3", "targetname");
	target4 = getEnt ("stage1_ran4", "targetname");
	target5 = getEnt ("stage1_ran5", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		random = randomInt(5);
		switch(random)
		{
			case 0:	user SetOrigin(target1.origin);
				user SetPlayerAngles( target1.angles );
					break;
				
			case 1:	user SetOrigin(target2.origin);
				user SetPlayerAngles( target2.angles );
					break;

			case 2:	user SetOrigin(target3.origin);
				user SetPlayerAngles( target3.angles );
					break;
				
			case 3:	user SetOrigin(target4.origin);
				user SetPlayerAngles( target4.angles );
					break;

			case 4:	user SetOrigin(target5.origin);
				user SetPlayerAngles( target5.angles );
					break;
				
			default: return;
		}
	}
}

lol()
{
	lol = getEnt ("umad", "targetname");

	while(1)
	{
		lol movez( -10 , 1.5);
		wait 1.5;
		lol movez( 10, 1.5);
		wait 1.5;
	}
}

bouncegun()
{
	trig = getEnt("ak_trig","targetname");
	while(1)
	{
		trig waittill("trigger", player);
		player giveweapon("ak47_mp");
		player givemaxammo("ak47_mp");
		wait .2;
		player switchtoweapon("ak47_mp");
		wait 2;
	}
}

bounceelev()
{
	elev = getEnt ("bounce_ele", "targetname");

	while(1)
	{
		elev movez( 194 , 1.5);
		wait 1.5;
		elev movez( -194 , 1.5);
		wait 1.5;
	}
}

bouncerspawn()
{
trig = getent("bounce_tele", "targetname");
jump = getEnt( "bounce_tele_jump", "targetname" );
acti = getEnt( "bounce_tele_acti", "targetname" );

for(;;)
{
trig waittill( "trigger", player );
if(player.pers["team"] == "axis")
{
    level.activ setPlayerangles( acti.angles );
    level.activ setOrigin( acti.origin );
}
if(player.pers["team"] == "allies")
{
    player setplayerangles( jump.angles, 3 );
    player setorigin( jump.origin, 3 );
}
}
}
	
	
ammo1()
{
	snipe = getEnt ("sniper_ammo2", "targetname");

	while(1)
	{
		snipe waittill ("trigger", player);
		
		player Givemaxammo( "m40a3_mp" );
		player Givemaxammo( "remington700_mp" );
	}
}

ammo2()
{
	deagle = getEnt ("deagle_ammo1", "targetname");

	while(1)
	{
		deagle waittill ("trigger", player);
		
		player Givemaxammo( "deserteagle_mp" );
	}
}

ammo3()
{
	deagle = getEnt ("deagle_ammo2", "targetname");

	while(1)
	{
		deagle waittill ("trigger", player);
		
		player Givemaxammo( "deserteagle_mp" );
	}
}

hardstart()
{
	level.secret_trig = getEnt ("secret_entertrig", "targetname");
	target1 = getEnt ("hard_start", "targetname");
	
	for(;;)
	{
		level.secret_trig waittill ("trigger", user);
		user SetOrigin(target1.origin);
		user SetPlayerAngles( target1.angles );
	}
}

firstplace()
{
	trig = getent("first", "targetname");

	trig waittill("trigger", user);

	trig delete();

	iPrintlnBold( "^1>> ^5First Place^1 << \n ^2" + user.name + " ");
}  

hardfail1()
{
	trig = getEnt ("secret_tele1", "targetname");
	target1 = getEnt ("secret_fail1", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		user SetOrigin(target1.origin);
		user SetPlayerAngles( target1.angles );
	}
}

hardfail2()
{
	trig = getEnt ("secret_tele2", "targetname");
	target1 = getEnt ("secret_fail2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		user SetOrigin(target1.origin);
		user SetPlayerAngles( target1.angles );
	}
}

hardfail3()
{
	trig = getEnt ("secret_tele3", "targetname");
	target1 = getEnt ("secret_fail3", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		user SetOrigin(target1.origin);
		user SetPlayerAngles( target1.angles );
	}
}

thing1()
{
	brush = getEnt ("elev2_1", "targetname");

	while(1)
	{
		brush movex( 1008 , 3);
		wait 3;
		brush movez( 160 , 1);
		wait 1;
		brush movex( -1008 , 3);
		wait 3;
		brush movez( -160 , 1);
		wait 1;
	}
}

thing2()
{
	brush = getEnt ("elev2_2", "targetname");

	while(1)
	{
		brush movez( 160 , 1);
		wait 1;
		brush movex( -1008 , 3);
		wait 3;
		brush movez( -160 , 1);
		wait 1;
		brush movex( 1008 , 3);
		wait 3;
	}
}

hardend()
{
	trig = getEnt ("theend", "targetname");
	target1 = getEnt ("theend_ori", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		user SetOrigin(target1.origin);
		user SetPlayerAngles( target1.angles );
		iPrintlnBold( " ^2" + user.name + " ^5 is Godlike^1!" );
		user giveweapon( "ak47_mp" );
		user givemaxammo( "ak47_mp" );
		wait .1;
		user switchtoweapon( "ak47_mp" );
		user braxi\_rank::giveRankXP("", 25);
	}
}

Acti_stage2()
{
	trig = getEnt ("stage2acti", "targetname");
	target1 = getEnt ("stage2_ran1", "targetname");
	target2 = getEnt ("stage2_ran2", "targetname");
	target3 = getEnt ("stage2_ran3", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", user);
		random = randomInt(3);
		switch(random)
		{
			case 0:	user SetOrigin(target1.origin);
				user SetPlayerAngles( target1.angles );
					break;
				
			case 1:	user SetOrigin(target2.origin);
				user SetPlayerAngles( target2.angles );
					break;

			case 2:	user SetOrigin(target3.origin);
				user SetPlayerAngles( target3.angles );
					break;
				
			default: return;
		}
	}
}

precache()
{
	if(getDvar(getDvar("mapname") + "_allow_vender") == "")
		setDvar(getDvar("mp_dr_tron") + "_allow_vender", 1); // This creates the dvar to enable the vending machines

	if(getDvar(getDvar("mp_dr_tron") + "_health_wait") == "")
		setDvar(getDvar("mp_dr_tron") + "_health_wait", 10); // This creates the dvar to set the time between being able to get health again

	level.allow_vender = int(getDvar(getDvar("mp_dr_tron") + "_allow_vender"));
	level.vender_wait = int(getDvar(getDvar("mp_dr_tron") + "_health_wait"));

	for(i=1;i<5;i++)
		precacheModel("com_bottle" + i); // Precache (load) the com_bottle1, com_bottle2, com_bottle3 and com_bottle4 models

	level.venderbottles = [];
	level.venderbottlescurrent = 0;
	level.venderbottlesmax = 10;
}

maxhealth()
{
	self.targetname = undefined;
	self.target = undefined;

	randomMessages = []; //Change / add something if you want to.
	randomMessages[0] = "^5Sorry, try it later^1!";
	randomMessages[1] = "^5Careful! You'll break it^1!";
	randomMessages[2] = "^5Oh no! There's none left^1!";
	randomMessages[3] = "^5You're hungry ain't ya^1?";

	for(;;)
	{
		self waittill("trigger", player);
		if(player.sessionstate != "playing")
			continue;

		if(!level.allow_vender)
		{
			player iPrintlnBold("^2Sorry, fat rats are not allowed on this server");
			continue;
		}

		if(isDefined(player.healthwait))
		{
			player iPrintlnBold(randomMessages[randomInt(randomMessages.size)]); 
			continue;
		}

		player.healthwait = true;
		if(player.health < player.maxhealth)// If the players health is not at the max
		{
			player.health = player.maxhealth;
			player iPrintlnBold("^5Yummy^1!");//Change it if you want to.
			player iPrintln("^1Health Restored!");
		}
		else
			player iPrintlnBold("^5You already have full health^1."); //Change it if you want to.
		player thread healthwait();
	}
}

healthwait()
{
	self endon("disconnect"); // Kill the thread if the player disconnects
	wait level.vender_wait; // Wait how long level.vender_wait is
	self.healthwait = undefined; // Make self.healthwait undefined
}