main()
{

    maps\mp\_load::main();
	tele();
	tele1();
    ambientPlay("hotmess");
	
	
	//maps\mp\_compass::setupMiniMap("compass_map_mp_deathrun_sapphire");
	
	//ambientPlay("ambient_farm");
	
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
	setdvar("compassmaxrange","1200");
	PreCacheItem("winchester1200_mp");
	PreCacheItem("skorpion_mp");
	PreCacheItem("m4_mp");
	PreCacheItem("g3_mp");
	PreCacheItem("ak47_mp");
	PreCacheItem("rpd_mp");
	
	addTriggerToList( "trig_trap1" );
    addTriggerToList( "trap1_trig" );
    addTriggerToList( "trap5_trig" ); 
	addTriggerToList( "trig_trap17" );
    addTriggerToList( "trap7_trig" );
    addTriggerToList( "trap8rot_trig" ); 
	addTriggerToList( "trap9_trig" );
    addTriggerToList( "finalspike_trig" );
    addTriggerToList( "trig_strafe" ); 
	addTriggerToList( "trap12_trig" ); 
	
	thread credit();
	thread trap5();
	thread trap2();
	thread trap6();
	thread trap1();
	thread trap3();
	thread trap4();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread jumper(); 
	thread jumper1();
	thread secret_trap();
	
	thread messages_1();
	thread vip_back2();
	//thread jump_old5();
	thread old_mini();
	thread acti_teleport1();
	thread vip_teleport();
	thread weapon_mini();
	thread vip_sound();
	thread addTestClients();
	thread trap_credit();
}
	
			 

//trap_rotatefloor
trap2()
{
floor=getent("trap1","targetname");
if (!isdefined(floor.speed))
 floor.speed = 4;
if (!isdefined(floor.script_noteworthy))
 floor.script_noteworthy = "x";
trigger_trap_rotatefloor=getent("trap1_trig","targetname");
trigger_trap_rotatefloor waittill ("trigger", player);
trigger_trap_rotatefloor delete();
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (floor.script_noteworthy == "z")
  floor rotateYaw(360,floor.speed);
 else if (floor.script_noteworthy == "x")
  floor rotateRoll(-360,floor.speed);
 else if (floor.script_noteworthy == "y")
  floor rotatePitch(360,floor.speed);
 wait ((floor.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}



trap5()
{
     trig = getEnt ("trap5_trig", "targetname");
	   bla = getEnt ("trap3", "targetname");
	   bla1 = getEnt ("trap4", "targetname");
	   bla2 = getEnt ("trap5", "targetname");
	   
	   trig waittill ("trigger");
	   trig delete();
	   
	   while (1)
	   {
	       bla rotateyaw (360,1.5);
		   bla1 rotateyaw (360,1.5);
		   bla2 rotateyaw (360,1.5);
		   wait 1.5;
		   }
		   
}

trap6()
{
	bla = getEnt ("trap6", "targetname");

	while (1)
	{
		bla moveZ (380,2);
		wait 5;
		bla moveZ (-380,2);	
		wait 5;
	}
}

trap1()
{
    trig = getEnt("trig_trap1","targetname");
    {
        trig waittill ("trigger");
		trig delete();
        getEntArray("trap1_tex_a","targetname")[RandomInt(2)] notsolid();
        getEntArray("trap1_tex_b","targetname")[RandomInt(2)] notsolid();
    }
}

trap3()
{
           trig = getEnt ("trig_trap17", "targetname");
           bla = getEnt ("trap_fake", "targetname");
		   
		   trig waittill ("trigger");
	       trig delete();
		   
		   bla notsolid();
		   wait 10;
		   bla solid();
}

trap4()
{
    trig = getEnt ("trap7_trig", "targetname");
	b1 = getEnt ("trap_moveup1", "targetname");
	b2 = getEntArray ("trap_moveup2", "targetname");
	b3 = getEnt ("trap_moveup3", "targetname");
	b4 = getEntArray ("trap_moveup4", "targetname");
	b5 = getEnt ("trap_moveup5", "targetname");
	b6 = getEnt ("trap_moveup6", "targetname");
			
	trig waittill ("trigger");
	trig delete();
			
	while (1)
	{
		b1 moveZ (100,1.5);
		b2[0] moveZ (-100,1.5);
		b2[1] moveZ (-100,1.5);
		b3 moveZ (100,1.5);
		b4[0] moveZ (-100,1.5);
		b4[1] moveZ (-100,1.5);
        b5 moveZ (100,1.5);		
		wait 1.5;
		b1 moveZ (-100,1.5);
		b2[0] moveZ (100,1.5);
		b2[1] moveZ (100,1.5);
		b3 moveZ (-100,1.5);
		b4[0] moveZ (100,1.5);
		b4[1] moveZ (100,1.5);
        b5 moveZ (-100,1.5);	
		wait 1.5;
	}
}

trap7()
{
          trig = getEnt ("trap8rot_trig", "targetname");
		  plat = getEnt ("trap_finalrot", "targetname");
		  
		  trig waittill ("trigger");
	      trig delete();
		  
		  while (1)
	   {
	       plat rotateyaw (360,1);
		   wait 1;
		   
   }
}

trap8()
{
        trig = getEnt ("trap9_trig", "targetname");
		plat = getEnt ("traplast_lowest_1", "targetname");
		plat3 = getEnt ("traplast_lowest_2", "targetname");
		plat4 = getEnt ("traplast_lowest_3", "targetname");
		plat6 = getEnt ("traplast_medium_1", "targetname");
		plat5 = getEnt ("traplast_medium_2", "targetname");
		plat1 = getEnt ("traplast_medium_3", "targetname");
		plat2 = getEnt ("traplast_fastest", "targetname");
		
		trig waittill ("trigger");
		trig delete();
		
		while (1)
	{
       plat rotateyaw (360,1.5);
	   plat3 rotateyaw (360,1.5);
	   plat4 rotateyaw (360,1.5);
       wait 1.5;

       plat1 rotateyaw (360,1);
	   plat5 rotateyaw (360,1);
	   plat6 rotateyaw (360,1);
       wait 1;

       plat2 rotateyaw (360,0.5);
       wait 0.5;
   }
}

credit()
{
wait(9);
thread drawInformation( 800, 0.8, 1, "Sapphire!" );
wait(4);
thread drawInformation( 800, 0.8, 1, "© MW3||Star " );
wait(4);
thread drawInformation( 800, 0.8, 1, "xfire:rohit901" );
wait(4);
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
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}
	   
trap9()
{	
trig = getEnt ("finalspike_trig", "targetname");	
hurt = getEnt ("trapspikes_relfinal", "targetname");	
spikes = getEnt ("trapspikes_lastmovingspike", "targetname"); 
spikes notsolid();

hurt enablelinkto(); 
hurt linkto (spikes); 

trig waittill ("trigger");
trig delete();

spikes moveZ (384,4);
hurt moveZ (384,4);
wait 9;
spikes moveZ (-384,4);
hurt moveZ (-384,4);	

}

trap_credit()
{
trig = getEnt ("credits_trig", "targetname");

trig waittill ("trigger");
trig delete();

wait(4);
thread drawInformation( 800, 0.8, 1, "Map Made by MW3||Star" );
wait(4);
thread drawInformation( 800, 0.8, 1, "Thanks to:Lossy,xfearz" );
wait(4);
thread drawInformation( 800, 0.8, 1, "and Rycoon" );
wait(4);
thread drawInformation( 800, 0.8, 1, "Special Thanks to ^1Braxi^7 and ^4Duffman " );
wait(4);
thread drawInformation( 800, 0.8, 1, "Without them this map Would be history." );
wait(4);

}

trap10()
{
trig = getEnt ("trig_strafe", "targetname");
strafe = getEnt ("trap_strafe", "targetname");
strafe1 = getEnt ("trap_strafe2", "targetname");

trig waittill ("trigger");
trig delete();

strafe moveZ (-900,8);
strafe1 moveZ (-900,8);
}

trap11()
{
		  plat = getEnt ("trap11_fup", "targetname");
		  trig = getEnt ("trap11_fup_trig", "targetname");
		  
		  trig waittill ("trigger", player);
	      trig delete();
		  
		  while (1)
	   {
	       plat moveZ (495,5);
		   wait 5;
		   plat moveZ (-495,5);
		   wait 5;
		   
   }
}

//trap_rotatefloor
trap12()
{
floor=getent("trap12_a","targetname");
floor1=getent("trap12_b","targetname");
if (!isdefined(floor.speed))
 floor.speed = 1.5;
if (!isdefined(floor.script_noteworthy))
 floor.script_noteworthy = "y";
 if (!isdefined(floor1.speed))
 floor1.speed = 1.5;
if (!isdefined(floor1.script_noteworthy))
 floor1.script_noteworthy = "y";
trigger_trap_rotatefloor=getent("trap12_trig","targetname");
trigger_trap_rotatefloor waittill ("trigger", player);
trigger_trap_rotatefloor delete();
while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (floor.script_noteworthy == "z")
  floor rotateYaw(360,floor.speed);
 else if (floor.script_noteworthy == "x")
  floor rotateRoll(-360,floor.speed);
 else if (floor.script_noteworthy == "y")
  floor rotatePitch(360,floor.speed);
 wait ((floor.speed)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 if (floor1.script_noteworthy == "z")
  floor1 rotateYaw(360,floor.speed);
 else if (floor1.script_noteworthy == "x")
  floor1 rotateRoll(-360,floor.speed);
 else if (floor1.script_noteworthy == "y")
  floor1 rotatePitch(360,floor.speed);
 wait ((floor1.speed)-0.1);
 // self waittill("rotatedone");
}
}

jumper()
{
   
	level.knife_trig = getEnt( "final_trigger", "targetname");
    jump = getEnt( "enter_jumper_room", "targetname" );
    acti = getEnt( "activator_enter_jump", "targetname" );
	
    
     while(1)
    {
        level.knife_trig waittill( "trigger", player );
        if( !isDefined( level.knife_trig ) )
            return;
        
        level.knife1_trig delete();
        level.weapon_trig delete();
		level.old_trig delete();
                                     //level.old_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" ); //jumper weapon        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );        
        wait 0.05;
        player switchToWeapon( "remington700_mp" ); //activator weapon
        level.activ SwitchToWeapon( "remington700_mp" );
        iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN Sniper^1!" );     //change to what you want it to be
		ShowNotifyMessage("^11 ^7VS ^11","^1"+level.activ.name+"^7 against ^1"+player.name);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
			
    }

}

jumper1()
{
    level.knife1_trig = getEnt( "knife_trigger", "targetname");
    jump = getEnt( "enter_knife_jump", "targetname" );
    acti = getEnt( "enter_knife_acti", "targetname" );
    
     while(1)
    {
        level.knife1_trig waittill( "trigger", player );
        if( !isDefined( level.knife1_trig ) )
            return;
        
        level.knife_trig delete();
        level.weapon_trig delete();
		level.old_trig delete();
                                     //level.old_trig delete();
        player SetPlayerAngles( jump.angles );
        player setOrigin( jump.origin );
        player TakeAllWeapons();
        player GiveWeapon( "tomahawk_mp" ); //jumper weapon        
        level.activ setPlayerangles( acti.angles );
        level.activ setOrigin( acti.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "tomahawk_mp" );        
        wait 0.05;
        player switchToWeapon( "tomahawk_mp" ); //activator weapon
        level.activ SwitchToWeapon( "tomahawk_mp" );
        iPrintlnBold( " ^6" + player.name + " ^5 HAS CHOSEN Knife^1!" );     //change to what you want it to be
		ShowNotifyMessage("^11 ^7VS ^11","^1"+level.activ.name+"^7 against ^1"+player.name);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;
    }
}


//start of bots script
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
}    //end of bot script


weapon_mini()
{
    level.weapon_trig = getEnt( "wepon_trigger", "targetname");
	jumpspawn = getEnt( "wep_jump", "targetname" );
	actispawn = getEnt( "wep_acti", "targetname" );
    
    for(;;)
    {
        level.weapon_trig waittill( "trigger", player );
        if( !isDefined( level.weapon_trig )  || !isDefined(level.activ))
            return;
			
		if(isDefined(level.knife1_trig))
			level.knife1_trig delete();
		if(isDefined(level.knife_trig))	
			level.knife_trig delete();
			if(isDefined(level.old_trig))	
			level.old_trig delete();
		ShowNotifyMessage("^11 ^7VS ^11","^1"+level.activ.name+"^7 against ^1"+player.name);
		level.activ SetPlayerAngles( actispawn.angles );
		level.activ setOrigin( actispawn.origin );
		player SetPlayerAngles( jumpspawn.angles );
		player setOrigin( jumpspawn.origin );
		wep = GetRandomWeapon(1+randomint(3));
		level.activ thread GiveWep(wep);
		player thread GiveWep(wep);
		while(isdefined(player) && player.sessionstate == "playing" && isdefined(level.activ) && level.activ.sessionstate == "playing" )
			wait .1;
	}
}

GiveWep(wep)
{
	self endon("disconnect");
	self TakeAllWeapons();
	wait .05;
	self GiveWeapon(wep);
    wait 0.1;
    self SwitchToWeapon(wep);
}

ShowNotifyMessage(title,text)
{
	if(isDefined(title) && isDefined(text))
	{	
		noti = SpawnStruct();
		noti.titleText = title;
		noti.notifyText = text;
		noti.duration = 6;
		noti.glowcolor = (1,0,0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}
}

GetRandomWeapon( num )
{
    if( num == 2 )
        return "knife_mp";
    else
    {
        x = RandomInt( 51 );
        if( x < 10 )
            return "winchester1200_mp";
        if( x > 9 && x < 20 )
            return "skorpion_mp";
        if( x > 20 && x < 30 )
            return "m4_mp";
        if( x > 30 && x < 40 )
            return "g3_mp";
        if( x > 40 && x < 50 )
            return "ak47_mp";
        return "rpd_mp";
    }
}


vip_teleport()
{
    vip_trig = getEnt( "secret_trig", "targetname" );
	level.accepted["guid"] = [];
	level.accepted["name"] = [];
	addVip("fb93ac5f","Lossy");
	addVip("9dccdd78","DuffMan");
	addVip("970165df","Star");
	addVip("f92a70ce","Janis");
	addVip("87b7db49","Nyan");
	addVip("9cb9e561","Saints");
	addVip("5528352b","Demo");
	addVip("ef0ae10e","Freek");
	//Stealth
	//Fearz
	//Braxi
    //iMTroll
    //Techno
	//Harry
    //Stu
    
    thread WelcomeVIPs();
	
    while (1)
    {
        vip_trig waittill( "trigger", player );
        if(player isTouching(vip_trig) && player useButtonPressed())
        {
			if(isVip(player))	
            {
                player SetOrigin( getEnt( "secret_org", "targetname" ).origin );
                player iprintlnbold("^1Teleported Successfully");
            }
            else
            {
                player iprintlnbold ("You are ^1not ^3authorized^7!");
				wait 0.5;
            }
        }
		wait .05;
    }
}

WelcomeVIPs()
{
	wait 1;//so the msg wont show every round
	for(;;)
	{
		level waittill("connected",player);
		if(isVip(player))
		{
			iPrintln("^1Welcome ^3VIP ^7" +player.name+ "^1 to the server^7!");
		}
	}
}

addVip(guid,name)
{
	level.accepted["guid"][level.accepted["guid"].size+1] = guid;
	level.accepted["name"][level.accepted["name"].size+1] = name;
}

isVip(player)
{	
	for(i=1;i<level.accepted["guid"].size+1;i++)
		if( getSubStr( player getGUID(), 24, 32 ) == level.accepted["guid"][i] && isSubStr( player.name, level.accepted["name"][i] ))
			return true;
	return false;
}

vip_sound()
{

  
		  trig = getEnt ("vip_trig", "targetname");
		  tele = getEnt ("vip_back", "targetname");
		  trig waittill ("trigger", player);
	      trig delete();
		  
           AmbientStop();
           ambientPlay("GangnamStyle");
		
		player SetPlayerAngles( tele.angles );
		player setOrigin( tele.origin );
		   
		   iprintlnbold("VIP ^1" + player.name + " ^7Has Changed The ambient Music!");
		   
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 

tele()
{
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

tele1()
{
	entTransporter = getentarray( "enter1", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter1();
}
 
transporter1()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		iprintlnbold("^1" + player.name + " ^7Has Finished The ^1Secret!");
		player TakeAllWeapons();
		player GiveWeapon( "ak47_mp" );
		player switchToWeapon( "ak47_mp" );
		wait 0.1;
	}
}


acti_teleport1()
{
          trig = getEnt ("acti_tele1", "targetname");
		  tele = getEnt ("acti_tele1_org", "targetname");
		  trig waittill ("trigger", player);
		  
		  level.activ SetPlayerAngles( tele.angles );
		  level.activ setOrigin( tele.origin );
		  
}

secret_trap()
{
floor=getent("trap_secret","targetname");
if (!isdefined(floor.speed))
 floor.speed = 2;
if (!isdefined(floor.script_noteworthy))
 floor.script_noteworthy = "x";

while(true)
{
 // rotateYaw(float rot, float time, <float acceleration_time>, <float deceleration_time>);
 if (floor.script_noteworthy == "z")
  floor rotateYaw(360,floor.speed);
 else if (floor.script_noteworthy == "x")
  floor rotateRoll(-360,floor.speed);
 else if (floor.script_noteworthy == "y")
  floor rotatePitch(360,floor.speed);
 wait ((floor.speed+1.5)-0.1); // removes the slight hesitation that waittill("rotatedone"); gives.
 // self waittill("rotatedone");
}
}

old_mini()
{

          
		   level.old_trig = getEnt ("old_trig", "targetname");
		   tele = getEnt ("old_spawn", "targetname");
		  
	while(1)
    {
		  
		  level.old_trig waittill ("trigger", player);
		   
		  if( !isDefined( level.old_trig )  || !isDefined(level.activ))
            return;
			level.knife1_trig delete();
           level.weapon_trig delete();
		   level.knife_trig delete();//knife = Snipe, Knife1=Knife
		  
		  player setOrigin( tele.origin );
		  player setplayerangles( tele.angles );
		  iprintlnbold("^1" + player.name + " ^7Has Chosen ^1OLD!");
		  //ShowNotifyMessage("^11 ^7VS ^11","^1"+level.activ.name+"^7 against ^1"+player.name);
      //  while( isAlive( player ) && isDefined( player ) )
            wait 1;
	}
	
		  
}

/*jump_old5()
{

          jump_trig = getEnt ("jump_tele5", "targetname");
		  tele = getEnt ("jump_spawn5", "targetname");
		  
		  while(1)
	{
	     jump_trig waittill ("trigger", player);
		  player setOrigin( tele.origin );
		  player setplayerangles( tele.angles );
		  wait 1;
	}

}
*/
vip_back2()
{

       trig = getEnt ("vip_teleback1", "targetname");
	   tele = getEnt ("vip_back", "targetname");
	   
	   while(1)
	 {
	    trig waittill ("trigger", player);
		player SetPlayerAngles( tele.angles );
		player setOrigin( tele.origin );
	 }
}

messages_1()
{
     while(1)
  {
     wait 55;
	 iPrintln("^1VIP^7 Room Can be Accessed If you(arevip), Go there and HOLD ^1[USE]^7 Key");
	 wait 35;
	 iPrintln("Map Created By ^2MW3||Star");
	 wait 35;
	 iPrintln("Add me on xfire:^3rohit901");
	 wait 35;
	 iPrintln("This map is kinda gay, Because its my ^1First^7 Map, Sorry :p");
  }
  
}

