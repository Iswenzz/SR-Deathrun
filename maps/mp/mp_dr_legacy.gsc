#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include common_scripts\utility;

/*

Feel free to use any part of scripts!( ͡❛ ͜ʖ ͡❛ )


███╗░░░███╗░█████╗░██████╗░  ██████╗░██╗░░░██╗  ██████╗░███████╗░█████╗░████████╗██╗░░██╗
████╗░████║██╔══██╗██╔══██╗  ██╔══██╗╚██╗░██╔╝  ██╔══██╗██╔════╝██╔══██╗╚══██╔══╝██║░░██║
██╔████╔██║███████║██████╔╝  ██████╦╝░╚████╔╝░  ██║░░██║█████╗░░███████║░░░██║░░░███████║
██║╚██╔╝██║██╔══██║██╔═══╝░  ██╔══██╗░░╚██╔╝░░  ██║░░██║██╔══╝░░██╔══██║░░░██║░░░██╔══██║
██║░╚═╝░██║██║░░██║██║░░░░░  ██████╦╝░░░██║░░░  ██████╔╝███████╗██║░░██║░░░██║░░░██║░░██║
╚═╝░░░░░╚═╝╚═╝░░╚═╝╚═╝░░░░░  ╚═════╝░░░░╚═╝░░░  ╚═════╝░╚══════╝╚═╝░░╚═╝░░░╚═╝░░░╚═╝░░╚═╝

*/

main()
{
 maps\mp\_load::main();
 
 ///FX's load///
 level.smoke = LoadFx("dust/legacy_smoke");
 level.hammer_dust = LoadFx("smoke/legacy_hammer");
 level.glow = LoadFx("zapper/legacy_glow");


 game["allies"] = "sas";
 game["axis"] = "russian";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "woodland";
 game["axis_soldiertype"] = "woodland";
       
///DVARS       
	setdvar("r_specularcolorscale", "1");
    setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");
	setDvar("bg_falldamagemaxheight", 99999);
    setDvar("bg_falldamageminheight", 99998);
    
    ///Fx's looping///
    thread fx_load_on_start();

    ///Start scripts///
	thread welcome();
    thread messages_iprintln();
    thread dead_sound();
	thread startdoor();

    ///Secret Room Stuff///
    thread acti_secret_enter();
    thread acti_secret_finish();
    thread acti_secret_fail();
    thread secret_ladder();
    thread secret_enter();
    thread save_load_logic();
    thread RTD_check();

    ///Activator traps stuff///
    thread trap_slide_off();
    thread trap_cylinder_1_1();
    thread trap_cylinder_1_2();
    thread trap_bounce_off_1();
    thread trap_spikes();
	thread trap_hammer();
    thread trap_plat_fall();
    thread trap_cylinder_2();
    thread trap_mantle();
    thread trap_bounce_off_2();
    thread randomchoice();

    ///Activator teleports///
    thread acti_tp_1();
    thread acti_tp_2();
    thread acti_tp_3();
    thread acti_tp_4();
    
    ///Jumper Room Selection///
    thread room_selection();

    ///Jumper Rooms///
    thread old_room();
    thread sniper_room();
    thread knife_room();
    thread bounce_room();
    thread bounce_room_weapon();
    thread bounce_room_activator_fail();
    thread bounce_room_jumper_fail();
    thread pure_strafe_room();
    thread spinning_room();
    thread parkour_room();
    thread simonsays_room();


}

///Start scripts///
addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
} 

GetActivator()
{
	players = getentarray( "player", "classname" );
	
	for(i = 0;i < players.size;i++)
	{
		player = players[i];
		
		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}
	
	return "Noactivator";
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.5,0.5,0.5);

    return hud;
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^4" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^4" + jumper + " ^7VS^7 " + "^4" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

///Fx's looping///
fx_load_on_start()
{   
    fx_smoke = getEntArray("legacy_smoke", "targetname");
    fx_glow= getEntArray("legacy_glow", "targetname");
    fx_knife= getEntArray("fx_knife_vase", "targetname");


    level waittill("round_started");

    PlayFX(level.smoke, fx_smoke[0].origin);
    PlayFX(level.smoke, fx_smoke[1].origin);
    PlayFX(level.smoke, fx_smoke[2].origin);
    PlayFX(level.smoke, fx_smoke[3].origin);
    PlayFX(level.glow, fx_glow[0].origin);
    PlayFX(level.glow, fx_glow[1].origin);
    PlayFX(level.glow, fx_glow[2].origin);
    PlayFX(level.glow, fx_glow[3].origin);
    PlayFX(level.glow, fx_glow[4].origin);
    PlayFX(level.smoke, fx_knife[0].origin);
    PlayFX(level.smoke, fx_knife[1].origin);
    PlayFX(level.smoke, fx_knife[2].origin);
    PlayFX(level.smoke, fx_knife[3].origin);

    
}

welcome()  
{
    level waittill("round_started");
    noti = SpawnStruct();
    wait 2;
    noti.titleText = "^4Welcome ^7to ^4mp^7_^4dr^7_^4legacy^7!";
    noti.notifyText = "^4Map ^7By ^4death^7!";
    noti.duration = 8;
    noti.glowcolor = (4,4,4);
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)
    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

messages_iprintln()
{  
   level waittill("round_started");
   wait 2;
   for(;;)
{  
   wait 10;
 x = randomint(7);
   if (x==0)
{
   iPrintln("^4Mapped ^7and ^4scripted ^7by ^4death ^7!");
}

   if (x==1)
{
   iPrintln("^4Feel free ^7to ^4report ^7any ^4bugs ^7to my ^4Discord account ^7: ^4death01_ !");
}

   if (x==2)
{
   iPrintLn("^4Map speed: ^7[^4"+getDvar("g_speed")+"^7]^7, ^7[^4"+getDvar("dr_jumpers_speed")+"^7]");
}

   if (x==3)
{
   iPrintLn("^7Thanks to ^4CM'Nobody ^7for ^4helping me ^7with the ^4bugs ^7!");
}

   if (x==4)
{
   iPrintLn("^4Map ^7is ^4playable ^7on ^4 190+ speed ^7!");
}

   if (x==5)
{
   iPrintLn("^4Map ^7has ^4 1 Jumper Secret ^7and ^4 1 Activator Secret ^7with ^4RTD ^7somewhere on ^4map ^7!");
}

   if (x==6)
{
   iPrintLn("^4Map ^7has ^4 8 End rooms^7(^4Bounce^7,^4Spinning^7,^4Parkour^7,^4Knife^7,^4Sniper^7,^4Old^7,^4Simon Says ^7and ^4Pure Strafe^7) !");
}
}
}

dead_sound()
{
    triggers = getEntArray("trigger_hurt", "classname");
    for (i = 0; i < triggers.size; i++)
    for(;;)
    {
    triggers[i] waittill("trigger", player);
    
    wait 0.05;
    player PlayLocalSound("legacy_dead_sound");
    }

}
startdoor() 
{
	level waittill("round_started");
	door = getent("legacy_start_door","targetname");

    {  	
    iPrintlnBold( "^43" );
	wait(1);
	iPrintlnBold( "^42" );
	wait(1);
	iPrintlnBold( "^41" );
	wait(1);
	iPrintlnBold("^4Start door ^7is ^4opening^7!");
    thread randommusic();
    door moveZ(-700, 8);
    door waittill("movedone");
    door delete();

    }  
}

randommusic()
{
    wait 0.05;
    randommusic = randomint(5);

    if (randommusic == 0 )
    {
        ambientStop(2);
        AmbientPlay("legacy_sound_1");       
    }
    if (randommusic == 1 )
    {
        ambientStop(2);
        AmbientPlay("legacy_sound_2");       
    }
    if (randommusic == 2 )
    {
        ambientStop(2);
        AmbientPlay("legacy_sound_3");      
    }
    if (randommusic == 3 )
    {
        ambientStop(2);
        AmbientPlay("legacy_sound_4");     
    }
    if (randommusic == 4 )
    {
        ambientStop(2);
        AmbientPlay("legacy_sound_5");      
    }
}

///Secret Room Stuff///
acti_secret_enter()
{
    origin = getEnt("orig_acti_secret_enter","targetname");
    trig = getEnt("trig_acti_secret_enter","targetname");
	
	while(1)
	{   
        trig setHintString ("^7Press ^4[&&1]^7to enter ^4Activator Secret^7!");
		trig waittill ( "trigger", player );
        player thread teleport_screen_5(origin,trig,false);
	}
}

teleport_screen_5(origin,trig,freeze)
{
    self freezeControls(1);
        
   
    self iprintlnBOld ("^4You ^7entered in ^4Activator Secret Room ^7!");
    self PlayLocalSound("legacy_teleport");

    overlay = newClientHudElem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader ("white", 640, 480); 
    overlay.alignX = "left";
    overlay.alignY = "top";
    overlay.horzAlign = "fullscreen";
    overlay.vertAlign = "fullscreen";
    overlay.alpha = 0;

    overlay fadeOverTime(0.01);

    overlay.alpha = 1;

    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    wait 1;
        
    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    if(!freeze)
        self freezeControls(0);

    overlay fadeOverTime(0.5);

    overlay.alpha = 0;

    wait 0.5;
        
    overlay destroy();
}

acti_secret_finish()
{
   trig = getent("trig_acti_secret_finish", "targetname");
   tp = getent ("orig_acti_secret_finish", "targetname");

   for(;;)
    {  
    trig waittill("trigger", player);

    player PlayLocalSound("legacy_teleport");
    player iprintlnBOld ("^4You ^7finished ^4Activator Secret Room ^7!");
	player setOrigin(tp.origin);
    player setPlayerAngles(tp.angles);
    player FreezeControls(1);
    player PlayLocalSound("legacy_reward");
    player braxi\_rank::giveRankXP("", 1500);
    wait 1;
    player FreezeControls(0);
    }
}

acti_secret_fail()
{
   trig = getent("trig_acti_secret_fail", "targetname");
   tp = getent ("orig_acti_secret_enter", "targetname");

   for(;;)
    {  
    trig waittill("trigger", player);

    player PlayLocalSound("legacy_teleport");
    player iprintln ("^4You failed ^7!");
	player setOrigin(tp.origin);
    player setPlayerAngles(tp.angles);
    player FreezeControls(1);
    player PlayLocalSound("legacy_dead_sound");
    wait 0.1;
    player FreezeControls(0);
    }
}

secret_ladder()
{
   ladder = getent("secret_ladder", "targetname");
   trig = getent("trig_secret_ladder", "targetname");

   ladder hide();
   ladder notsolid();

   trig waittill ("trigger",player);

   {
    ladder show();
    ladder solid();

    iprintln ("^4" + player.name + " ^7opened the ^4Secret Room^7!");

    trig delete();
   } 

} 

secret_enter()
    {
    trig = getEnt ("trig_secret_enter", "targetname");
    tele = getEnt ("orig_secret_enter", "targetname");

    
    for(;;)
    {   
     trig waittill("trigger", player);
     player PlayLocalSound("legacy_teleport");
     player thread secret_timer();
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player.sc_pos = 0;
     player.insec = true;
     player iprintlnBOld ("^4You ^7entered in ^4Secret Room ^7!");

     player thread secret_finish();
    }
    }

    save_load_logic()
    {
    fail_trigger = getent("trig_fail","targetname");
    save_triggers = GetEntArray("save_triggers","targetname");
    
    for(i=0;i<save_triggers.size;i++)
    thread save_pos(save_triggers[i],i);

    while(1)
    {
    fail_trigger waittill("trigger",player);

    player SetOrigin( save_triggers[player.sc_pos].origin+(0,0,1) );
    }
    }

    save_pos(trig,pos)
    {
    while(1)
    {
    trig waittill("trigger",player);
        
    if(!IsDefined(player.sc_pos))
    player.sc_pos = pos;

    else if(IsDefined(player.sc_pos) && player.sc_pos < pos)
    {
    player.sc_pos = pos;
    player IPrintLn("^4" + " Secret Checkpoint " + "^7" + pos);
    }

    wait 0.1;
    }
    }

    secret_finish()
    {

    self endon( "spawned_player" );
    self endon( "joined_spectators" );
    self endon( "death" );

    trig = getEnt ("trig_secret_finish", "targetname");
    tele = getEnt ("orig_secret_finish", "targetname");

    
    for(;;)
    {   
     trig waittill("trigger", player);
     player PlayLocalSound("legacy_teleport");

      if(player != self)
        continue;

     player notify("secret_done");
	 player.secretTimer destroy();
	 player setOrigin(tele.origin);
     player setPlayerAngles(tele.angles);
     player.sc_pos = 0;
     player.insec = false;
     iprintln ("^4" + player.name + " ^7finished the ^4Secret Room^7!");
     player braxi\_rank::giveRankXP("", 6000);

      break;
    }
    }

secret_timer()
{
	self endon("secret_done");
	self endon("death");
	self endon("round_ended");
	self thread destroyOnDeath();
	
	if(isdefined(self.secretTimer))
	self.secretTimer destroy();

	self.secretTimer = newclienthudelem(self);
	self.secretTimer.foreground = true;
	self.secretTimer.alignX = "center";
	self.secretTimer.alignY = "bottom";
	self.secretTimer.horzAlign = "center";
	self.secretTimer.vertAlign = "bottom";
	self.secretTimer.x = 0;
	self.secretTimer.y = -7;
	self.secretTimer.sort = 5;
	self.secretTimer.fontScale = 1.4;
	self.secretTimer.font = "default";
	self.secretTimer.glowAlpha = 0;
	self.secretTimer.hidewheninmenu = true;
	self.secretTimer.label = &"^4Time left: ^7&&1";
	if(isdefined(level.randomcolor))
	self.secretTimer.glowColor = level.randomcolor;
	else 
	self.secretTimer.glowColor = (1,0,0);

	time = 100; 
	for(i=0;i<time;i++)
		{
			self.secretTimer setvalue(time-i);
			wait 1;
		}
		self.secretTimer setvalue(0);
		self suicide();

		if(isdefined(self.secretTimer))
		self.secretTimer destroy();
}

destroyOnDeath()
{

	self waittill("death");

	if(isDefined(self.secretTimer))

	self.secretTimer destroy();
}


///RTD SYSTEM
RTD_check()
{
trig = getent("trig_rtd", "targetname");
tp = getent ("orig_spawn", "targetname");

trig setHintString ("^7Press ^4[&&1]^7to open ^4RTD^7!");

    while(1)
    { 
    trig waittill("trigger", player);
    if(!isDefined(player.RTDused_fff))
    {
        player.RTDused_fff = true;
        player thread RTD_random_items();
    }
    else
    {
        player iprintlnbold("^1Told you not to use RTD again...");
        wait 2;
        player playLocalSound("legacy_dead_sound");
        player suicide();
    }
}
}

RTD_random_items()
{   
    tp = getent ("orig_spawn", "targetname");

    self FreezeControls(1);
    self iPrintLnBold ("^4RTD ^7is ^4opening^7...");
    self iPrintLnBold ("^7When ^4you ^7get ^4the item^7, don't use ^4RTD ^7again ^4or ^7you ^4will die^7!");
    self iPrintLnBold ("^7From ^4RTD ^7you can get ^4xp^7,^4life^7,^4death ^7or ^4teleport to spawn,^7 ^4Good Luck^7!");
    wait 6;
    randomitem = randomint(5);

    if (randomitem == 0)
    {
        self PlayLocalSound("legacy_reward");
        self iPrintLnBold("^4Yikes^7! ^4Teleported ^7to ^4spawn^7!");   
        self PlayLocalSound("legacy_teleport");
	    self setOrigin(tp.origin);
        self setPlayerAngles(tp.angles);
        wait 1;
        self FreezeControls(0);  
    }
    if (randomitem == 1)
    {
        self Suicide();
        self playLocalSound("legacy_dead_sound");
        self iPrintLnBold("^4Yikes^7! ^4Better luck ^7next ^4time^7!");     
        self FreezeControls(0);    
    }
    if (randomitem == 2)
    {
        
        self PlayLocalSound("legacy_reward");
        iPrintLnBold("^4" + self.name + " ^7won ^4RTD Mini XP Jackpot ^7:o"); 
        self braxi\_rank::giveRankXP("", 3000);
        self FreezeControls(0); 
    }
    if (randomitem == 3)
    {  
        
        iPrintLn("^4" + self.name + " ^7got a ^4life ^7from ^4RTD^7!"); 
        self PlayLocalSound("legacy_reward");
        self iPrintLnBold("^4You got ^7a ^4Life ^7from ^4RTD^7!");  
        self thread braxi\_mod::givelife();
        self FreezeControls(0); 
    }
    if (randomitem == 4)
    {
        
        self PlayLocalSound("legacy_reward");
        iPrintLnBold("^4" + self.name + " ^7won ^4RTD XP Jackpot ^7:o"); 
        self braxi\_rank::giveRankXP("", 6000);
        self FreezeControls(0); 
    }
}

///Activator traps stuff///
trap_slide_off()
{
   slide = getent("slide_off", "targetname");

   trig = getent("trig_slide_off", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated");

   for(;;)
  { 
   slide moveZ (304,2);
   wait 4;
   slide moveZ (-304,2);
   wait 4;
   }
} 

trap_cylinder_1_1()
{
   cylinders = getentArray("cylinders_1", "targetname");

   trig = getent("trig_cylinder_1_1", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");

   for(;;)
  { 
    thread cylinder_sounds();

   cylinders[0] rotateYaw (360,3);
   cylinders[1] rotateYaw (-360,3);
   cylinders[2] rotateYaw (360,3);
   cylinders[3] rotateYaw (-360,3);
   wait 5;
   cylinders[0] rotateYaw (360,3);
   cylinders[1] rotateYaw (-360,3);
   cylinders[2] rotateYaw (360,3);
   cylinders[3] rotateYaw (-360,3);
   wait 5;

   }
} 

cylinder_sounds()
{
    trig_sound = getentArray ("fx_cylinder","targetname");
     
    trig_sound[0] playsound ("legacy_concrete_spin");
    trig_sound[1] playsound ("legacy_concrete_spin");
    trig_sound[2] playsound ("legacy_concrete_spin");
    trig_sound[3] playsound ("legacy_concrete_spin");
    wait 5;
    trig_sound[0] playsound ("legacy_concrete_spin");
    trig_sound[1] playsound ("legacy_concrete_spin");
    trig_sound[2] playsound ("legacy_concrete_spin");
    trig_sound[3] playsound ("legacy_concrete_spin");
    wait 5;

}

trap_cylinder_1_2()
{
   cylinders = getentArray("cylinders_1", "targetname");

   trig = getent("trig_cylinder_1_2", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");

   for(;;)
  {  
    thread cylinder_sounds_2();

   cylinders[4] rotateYaw (740,3);
   cylinders[4] moveZ (-376,3);
   wait 4;
   cylinders[4] rotateYaw (-740,3);
   cylinders[4] moveZ (376,3);
   
   wait 6;
   

   }
} 

cylinder_sounds_2()
{
    trig_sound = getent ("fx_cilinders_2","targetname");
     
    trig_sound playsound ("legacy_concrete_spin");
    wait 4;
    trig_sound playsound ("legacy_concrete_spin");
    wait 4;

}

trap_bounce_off_1()
{
   bounce = getent("bounce_off_1", "targetname");

   trig = getent("trig_bounce_off_1", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");

   for(;;)
  { 
  
   bounce moveX (64,0.5);
   wait 2;
   bounce moveX (-64,1.5);
   wait 4;
   }
} 

trap_spikes()
{
   spikes = getent("spikes", "targetname");
   trig = getent("trig_spikes", "targetname");
   hurt_spikes = getent("hurt_spikes", "targetname");

   hurt_spikes enablelinkto();
   hurt_spikes linkto (spikes);

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");
   
   { 
   thread spikes_sounds();
   spikes moveZ (-160,0.5);
   spikes waittill ("movedone");



   }
} 

spikes_sounds()
{
    trig_sound = getentArray ("fx_spikes","targetname");

    {

    trig_sound[0] playsound ("legacy_spikes_fall");
    trig_sound[1] playsound ("legacy_spikes_fall");
    trig_sound[2] playsound ("legacy_spikes_fall");
    trig_sound[3] playsound ("legacy_spikes_fall");

    }
}

trap_hammer()
{
   hammer_1 = getent("hammer_1", "targetname");
   hammer_2 = getent("hammer_2", "targetname");
   hammer_3 = getent("hammer_3", "targetname");
   hammer_4 = getent("hammer_4", "targetname");
   hurt_1 = getent("hurt_hammer_1", "targetname");
   hurt_2 = getent("hurt_hammer_2", "targetname");
   hurt_3 = getent("hurt_hammer_3", "targetname");
   hurt_4 = getent("hurt_hammer_4", "targetname");

   trig = getent("trig_hammer", "targetname");

   hurt_1 enablelinkto();
   hurt_1 linkto (hammer_1);

   hurt_2 enablelinkto();
   hurt_2 linkto (hammer_2);

   hurt_3 enablelinkto();
   hurt_3 linkto (hammer_3);

   hurt_4 enablelinkto();
   hurt_4 linkto (hammer_4);

 

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");
   
   
   for(;;)
   {
   wait 0.01;
   thread hammer_sounds();

   hammer_1 rotateRoll (-720,3);
   hammer_2 rotateRoll (720,3);
   hammer_3 rotateRoll (-720,3);
   hammer_4 rotateRoll (720,3);
   }
}

hammer_sounds()
{
    trig_sound = getentArray ("fx_hammers","targetname");

    {
    wait 0.01;

    trig_sound[0] playsound ("legacy_hammer_rotate");
    trig_sound[1] playsound ("legacy_hammer_rotate");
    trig_sound[2] playsound ("legacy_hammer_rotate");
    trig_sound[3] playsound ("legacy_hammer_rotate");
    }
}

trap_plat_fall()
{
   plat_fall_1 = getent("plat_fall_1", "targetname");
   plat_fall_2 = getent("plat_fall_2", "targetname");
   trig = getent("trig_plat_fall", "targetname");
   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger");
   trig setHintString("^1Activated !");
   
   for(;;)
	{
    random_plat = randomint(2);

    if (random_plat == 0 )
    {
	plat_fall_1 notsolid();
    plat_fall_1 hide();
    plat_fall_2 solid();
    plat_fall_2 show();
	wait 4;
	plat_fall_1 solid();
    plat_fall_1 show();
    plat_fall_2 solid();
    plat_fall_2 show();
	wait 2;
    plat_fall_1 solid();
    plat_fall_1 show();
    plat_fall_2 notsolid();
    plat_fall_2 hide();
    wait 4;
    plat_fall_1 solid();
    plat_fall_1 show();
    plat_fall_2 solid();
    plat_fall_2 show();
	wait 2;
    }
    if (random_plat == 1)
    {
    plat_fall_2 notsolid();
    plat_fall_2 hide();
    plat_fall_1 solid();
    plat_fall_1 show();
	wait 4;
	plat_fall_2 solid();
    plat_fall_2 show();
    plat_fall_1 solid();
    plat_fall_1 show();
	wait 2;
    plat_fall_2 solid();
    plat_fall_2 show();
    plat_fall_1 notsolid();
    plat_fall_1 hide();
    wait 4;
    plat_fall_2 solid();
    plat_fall_2 show();
    plat_fall_1 solid();
    plat_fall_1 show();
	wait 2;   
    }
	}
}

trap_cylinder_2()
{
   cylinder_big = getent("cylinder_big", "targetname");

   trig = getent("trig_cylinder_2", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");

   for(;;)
  { 
   thread cylinder_sounds_3();
   
   cylinder_big rotateYaw (1080,3);
   wait 5;
   cylinder_big rotateYaw (-1080,3);
   wait 5;

   }
} 

cylinder_sounds_3()
{
    trig_sound = getent ("fx_cylinder_3","targetname");

    {

    trig_sound playsound ("legacy_concrete_spin");
    wait 5;
    trig_sound playsound ("legacy_concrete_spin");
    wait 5;
    }
}

trap_mantle()
{
   mantle_1 = getent("mantle_off_1", "targetname");
   mantle_2 = getent("mantle_off_2", "targetname");
   trig = getent("trig_mantles", "targetname");
   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger");
   trig setHintString("^1Activated !");
   
   for(;;)
	{
    mantle = randomint(2);

    if (mantle == 0 )
    {
	mantle_1 notsolid();
    mantle_1 hide();
    mantle_2 solid();
    mantle_2 show();
	wait 6;
	mantle_1 solid();
    mantle_1 show();
    mantle_2 solid();
    mantle_2 show();
	wait 3;
    mantle_1 solid();
    mantle_1 show();
    mantle_2 notsolid();
    mantle_2 hide();
    wait 6;
    mantle_1 solid();
    mantle_1 show();
    mantle_2 solid();
    mantle_2 show();
	wait 3;
    }
    if (mantle == 1)
    {
    mantle_2 notsolid();
    mantle_2 hide();
    mantle_1 solid();
    mantle_1 show();
	wait 6;
	mantle_2 solid();
    mantle_2 show();
    mantle_1 solid();
    mantle_1 show();
	wait 3;
    mantle_2 solid();
    mantle_2 show();
    mantle_1 notsolid();
    mantle_1 hide();
    wait 6;
    mantle_2 solid();
    mantle_2 show();
    mantle_1 solid();
    mantle_1 show();
	wait 3;   
    }
	}
}

trap_bounce_off_2()
{
   bounce_2_1 = getent("bounce_off_2_1", "targetname");
   bounce_2_2 = getent("bounce_off_2_2", "targetname");

   trig = getent("trig_bounce_off_2", "targetname");

   trig setHintString("^7Press ^4[&&1] ^7to ^4activate ^7a ^4trap^7!");
   trig waittill ("trigger", player);
   trig setHintString("^1Activated !");

   for(;;)
  { 
  
   bounce_2_1 moveY (-32,0.5);
   bounce_2_2 moveY (32,0.5);
   wait 2;
   bounce_2_1 moveY (32,1.5);
   bounce_2_2 moveY (-32,1.5);
   wait 4;
   }
}
///RANDOM FAIL(live or die)
randomchoice()
{
trig = getent ("trig_bounce_2_off_fail", "targetname");
tp_looser = getent ("orig_bounce_2_off_looser", "targetname");

for(;;)
{
    trig waittill ("trigger", player);
    player PlayLocalSound("legacy_teleport");
    player setOrigin(tp_looser.origin);
    player setPlayerAngles(tp_looser.angles);
    player FreezeControls(1);
    player thread playerGambling();
}

}

playerGambling() {

    tp_looser = getent ("orig_bounce_2_off_looser", "targetname");
    tp_winner = getent ("orig_bounce_2_off_winner", "targetname");

    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    self TakeAllWeapons();

    self iprintlnBOld("^4I ^7saved you from ^4death^7, ^4but ^7not from long...^4maybe ^7:/");
    wait 1;
    self iprintlnBOld("^4Now^7,^4I'm gambling ^7your ^4life ^7so you might ^4die ^7!"); 
    wait 1;
    self iprintlnBOld("^4Just be patient couple of seconds !"); 
    wait 4;

    randomtext = randomint(2);

    if (randomtext == 0 )
    {
        self iprintlnBOld("^2You are worthy to be alive!"); 
        self playlocalSound("yes");
        self setOrigin(tp_winner.origin);
        self setPlayerAngles(tp_winner.angles); 
        self FreezeControls(0); 
        self giveWeapon("knife_mp");
        self switchToWeapon("knife_mp");
    }
    if (randomtext == 1)
    {
        self iprintlnBOld("^1You are not worthy to be alive!"); 
        self playlocalSound("no");
        wait 1;
        self suicide ();
    }
}


///Activator teleports///
acti_tp_1()
{
    origin = getEnt("orig_acti_tp_1","targetname");
    trig = getEnt("trig_acti_tp_1","targetname");
	
	while(1)
	{   
        trig setHintString ("^7Press ^4[&&1]^7to ^4teleport ^7to ^4next stage^7!");
		trig waittill ( "trigger", player );
        player thread teleport_screen_1(origin,trig,false);
	}
}

teleport_screen_1(origin,trig,freeze)
{
    self freezeControls(1);
        
   

    self PlayLocalSound("legacy_teleport");

    overlay = newClientHudElem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader ("white", 640, 480); 
    overlay.alignX = "left";
    overlay.alignY = "top";
    overlay.horzAlign = "fullscreen";
    overlay.vertAlign = "fullscreen";
    overlay.alpha = 0;

    overlay fadeOverTime(0.01);

    overlay.alpha = 1;

    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    wait 1;
        
    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    if(!freeze)
        self freezeControls(0);

    overlay fadeOverTime(0.5);

    overlay.alpha = 0;

    wait 0.5;
        
    overlay destroy();
}

acti_tp_2()
{
    origin = getEnt("orig_acti_tp_2","targetname");
    trig = getEnt("trig_acti_tp_2","targetname");
	
	while(1)
	{   
        trig setHintString ("^7Press ^4[&&1]^7to ^4teleport ^7to ^4next stage^7!");
		trig waittill ( "trigger", player );
        player thread teleport_screen_2(origin,trig,false);
	}
}

teleport_screen_2(origin,trig,freeze)
{
    self freezeControls(1);
        
   

    self PlayLocalSound("legacy_teleport");

    overlay = newClientHudElem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader ("white", 640, 480); 
    overlay.alignX = "left";
    overlay.alignY = "top";
    overlay.horzAlign = "fullscreen";
    overlay.vertAlign = "fullscreen";
    overlay.alpha = 0;

    overlay fadeOverTime(0.01);

    overlay.alpha = 1;

    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    wait 1;
        
    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    if(!freeze)
        self freezeControls(0);

    overlay fadeOverTime(0.5);

    overlay.alpha = 0;

    wait 0.5;
        
    overlay destroy();
}

acti_tp_3()
{
    origin = getEnt("orig_acti_tp_3","targetname");
    trig = getEnt("trig_acti_tp_3","targetname");
	
	while(1)
	{   
        trig setHintString ("^7Press ^4[&&1]^7to ^4teleport ^7to ^4next stage^7!");
		trig waittill ( "trigger", player );
        player thread teleport_screen_3(origin,trig,false);
	}
}

teleport_screen_3(origin,trig,freeze)
{
    self freezeControls(1);
        
   

    self PlayLocalSound("legacy_teleport");

    overlay = newClientHudElem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader ("white", 640, 480); 
    overlay.alignX = "left";
    overlay.alignY = "top";
    overlay.horzAlign = "fullscreen";
    overlay.vertAlign = "fullscreen";
    overlay.alpha = 0;

    overlay fadeOverTime(0.01);

    overlay.alpha = 1;

    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    wait 1;
        
    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    if(!freeze)
        self freezeControls(0);

    overlay fadeOverTime(0.5);

    overlay.alpha = 0;

    wait 0.5;
        
    overlay destroy();
}

acti_tp_4()
{
    origin = getEnt("orig_acti_secret_finish","targetname");
    trig = getEnt("trig_acti_back_to_spawn","targetname");
	
	while(1)
	{   
        trig setHintString ("^7Press ^4[&&1]^7to ^4teleport ^7to ^4spawn^7!");
		trig waittill ( "trigger", player );
        player thread teleport_screen_4(origin,trig,false);
	}
}

teleport_screen_4(origin,trig,freeze)
{
    self freezeControls(1);
        
   

    self PlayLocalSound("legacy_teleport");

    overlay = newClientHudElem( self );
    overlay.x = 0;
    overlay.y = 0;
    overlay setshader ("white", 640, 480); 
    overlay.alignX = "left";
    overlay.alignY = "top";
    overlay.horzAlign = "fullscreen";
    overlay.vertAlign = "fullscreen";
    overlay.alpha = 0;

    overlay fadeOverTime(0.01);

    overlay.alpha = 1;

    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    wait 1;
        
    self setOrigin( origin.origin );
	self setplayerangles( origin.angles );

    if(!freeze)
        self freezeControls(0);

    overlay fadeOverTime(0.5);

    overlay.alpha = 0;

    wait 0.5;
        
    overlay destroy();
}

///Jumper Room Selection + Rooms///
room_selection() 
{
level.room_trig = getEnt( "trig_room_selection", "targetname");
room = getEnt( "orig_room_selection", "targetname" );
level.room_trig setHintString ("^7Press ^4[&&1]^7to enter ^4Room Selection^7!");

for(;;)
{
level.room_trig waittill( "trigger", player );
player PlayLocalSound("legacy_teleport");
if( !isDefined( level.room_trig ) )
return;

iPrintlnBold( " ^4" + player.name + " ^7is picking a ^4room^7!" );
acti = GetActivator();
if(level.firstenter == true)
{
	acti freezeControls(1);
	acti iPrintLnBold("^4" + player.name + " ^7is picking ^4room ^7so don't ^4move^7!");
	level notify("acti_antiglitch");
	level.firstenter = false;
}
player SetPlayerAngles( room.angles );
player setOrigin( room.origin );
player TakeAllWeapons();
player antiglitcher();
}
}

antiglitcher() 
{
level.activator1 = GetActivator();
level.activ = GetActivator();  

self common_scripts\utility::waittill_any("death","disconnect");

   
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		//wait 3;
		self notify("matchend");
	}
    self freezeControls(0);
    level.activ notify("matchend");

	iPrintln("^4"+self.name+" ^7died^4!"); 
	wait 0.2; 
	iPrintlnBold("^4Room selection opened^7!");
}

waitdead()
{
    activator = GetActivator();
    knife = getent("trig_knife_room","targetname");
    sniper = getent("trig_sniper_room","targetname");
    simon = getent("trig_simon_says_room","targetname");
    pure = getent("trig_pure_strafe_room","targetname");
    spin = getent("trig_spinning_room","targetname");
    parkour = getent("trig_parkour_room","targetname");
    bounce = getent("trig_bounce_room","targetname");
    knife thread maps\mp\_utility::triggerOff();
    sniper thread maps\mp\_utility::triggerOff();
    simon thread maps\mp\_utility::triggerOff();
    pure thread maps\mp\_utility::triggerOff();
    spin thread maps\mp\_utility::triggerOff();
    parkour thread maps\mp\_utility::triggerOff();
    bounce thread maps\mp\_utility::triggerOff();
    self common_scripts\utility::waittill_any("death","disconnect");
    level notify ("spin_finished");
    level notify ("finished_game");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    knife thread maps\mp\_utility::triggerOn();
    sniper thread maps\mp\_utility::triggerOn();
    simon thread maps\mp\_utility::triggerOn();
    pure thread maps\mp\_utility::triggerOn();
    spin thread maps\mp\_utility::triggerOn();
    parkour thread maps\mp\_utility::triggerOn();
    bounce thread maps\mp\_utility::triggerOn();
}

endTimer(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        //self iPrintLnBold (duration);
        self.endTimerHUD setText("^7" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
		//self iPrintLnBold(text);
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

///Jumper Rooms///
old_room()
{
    level.trigger_old = getEnt ("trig_old_room", "targetname");

    jumpero = getEnt ("orig_old_room_jumper", "targetname");
    actio = getEnt ("orig_acti_tp_3", "targetname");
    level.trigger_old setHintString ("^7Press ^4[&&1]^7to enter ^4Old Room^7!");

   for(;;)
    {
        level.trigger_old waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        activator thread endTimer("^4Old Room", 3, 0);
        player thread endTimer("^4Old Room", 3, 0);
        player thread fightHUD("Kill the activator !", player, activator);
        activator thread fightHUD("Kill the jumper !", player, activator);
	    player setOrigin (jumpero.origin);
        player setPlayerAngles (jumpero.angles);
        activator setOrigin (actio.origin);
        activator setPlayerAngles (actio.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
       
        
    }
}

sniper_room()
{
    level.trigger_scope = getEnt ("trig_sniper_room", "targetname");

    jumpersc = getEnt ("orig_sniper_jumper", "targetname");
    actisc = getEnt ("orig_sniper_activator", "targetname");
    level.trigger_scope setHintString ("^7Press ^4[&&1]^7to enter ^4Sniper Room^7!");

    for(;;)
    {

        level.trigger_scope waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        activator thread endTimer("^4Sniper Room", 3, 0);
        player thread endTimer("^4Sniper Room", 3, 0);
        player thread fightHUD("Scope the opponent !", player, activator);
        activator thread fightHUD("Scope the opponent !", player, activator);
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);    
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");   
        player.maxhealth = 100;
        

        while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

knife_room()
{
   level.trigger_knife = getEnt ("trig_knife_room", "targetname");

    jumperk = getEnt ("orig_knife_jumper", "targetname");
    actik = getEnt ("orig_knife_activator", "targetname");
    level.trigger_knife setHintString ("^7Press ^4[&&1]^7to enter ^4Knife Room^7!");

   for(;;)
    {
        level.trigger_knife waittill ("trigger", player);

        activator = getactivator();
        player thread waitdead();
        activator thread endTimer("^4Knife Room", 3, 0);
        player thread endTimer("^4Knife Room", 3, 0);
        player thread fightHUD("Knife the opponent !", player, activator);
        activator thread fightHUD("Knife the opponent !", player, activator);
	    player setOrigin (jumperk.origin);
        player setPlayerAngles (jumperk.angles);
        activator setOrigin (actik.origin);
        activator setPlayerAngles (actik.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
    }
}

bounce_room()
{
   level.trigger_bounce = getEnt ("trig_bounce_room", "targetname");

    jumperb = getEnt ("orig_bounce_jumper", "targetname");
    actib = getEnt ("orig_bounce_activator", "targetname");
    level.trigger_bounce setHintString ("^7Press ^4[&&1]^7to enter ^4Bounce Room^7!");

   for(;;)
    {
        level.trigger_bounce waittill ("trigger", player);


        activator = getactivator();
        player thread waitdead();
        activator thread endTimer("^4Bounce Room", 3, 0);
        player thread endTimer("^4Bounce Room", 3, 0);
        player thread fightHUD("Finish fast to easily kill your opponent !", player, activator);
        activator thread fightHUD("Finish fast to easily kill your opponent !", player, activator);
	    player setOrigin (jumperb.origin);
        player setPlayerAngles (jumperb.angles);
        activator setOrigin (actib.origin);
        activator setPlayerAngles (actib.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("knife_mp");
        activator giveWeapon("knife_mp");
        player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
                       while(isDefined(player) && isAlive(player))
            wait .05;
        
    }
}

bounce_room_weapon()
{
    trig = getEnt ("trig_bounce_sniper", "targetname");
    trig setHintString ("^7Press ^4[&&1]^7to pick up ^4Sniper^7!");

   while(10)
    {
        trig waittill ("trigger", player);

        player takeAllWeapons();
        player giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
		player giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        player switchToWeapon("m40a3_mp");
    }
}

bounce_room_activator_fail()
{
   trig = getent("trig_bounce_activator_fail", "targetname");
   tele = getent ("orig_bounce_activator", "targetname");

   for(;;)
    {   
	  trig waittill("trigger", player);
	  player setOrigin(tele.origin);
	  player setPlayerAngles (tele.angles);
      player iPrintLnBold("^1You Failed ^7!");
    }
}

bounce_room_jumper_fail()
{
   trig = getent("trig_bounce_jumper_fail", "targetname");
   tele = getent ("orig_bounce_jumper", "targetname");

   for(;;)
    {   
      trig waittill("trigger", player);
	  player setOrigin(tele.origin);
	  player setPlayerAngles (tele.angles);
      player iPrintLnBold("^1You Failed ^7!");
    }
}

pure_strafe_room()
{
   level.trigger_pure = getEnt ("trig_pure_strafe_room", "targetname");

    jumperp = getEnt ("orig_pure_strafe_jumper", "targetname");
    actip = getEnt ("orig_pure_strafe_activator", "targetname");

    level.trigger_pure setHintString ("^7Press ^4[&&1]^7to enter ^4Pure Strafe Room^7!");

    for(;;)
    {
        level.trigger_pure waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();
        activator thread endTimer("^4Pure Strafe Room", 3, 0);
        player thread endTimer("^4Pure Strafe Room", 3, 0);
        player thread fightHUD("Finish before the opponent !", player, activator);
        activator thread fightHUD("Finish before the opponent !", player, activator);
        player setOrigin (jumperp.origin);
        player setPlayerAngles (jumperp.angles);
        activator setPlayerAngles(actip.angles);
        activator setOrigin(actip.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon ("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
		thread pure_end(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

pure_end(who, who2)
{
	trig = getEnt ("trig_pure_strafe_finish", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", winner);
        winner PlayLocalSound("legacy_finish_him");
        winner freezeControls (1);
		winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner takeAllWeapons();
        winner iPrintLnBold("^2You won^7!");
        winner playlocalSound("legacy_reward");
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
		
		if (winner == who)
			loser = who2;
		else
			loser = who;
		
		if (isDefined(loser))
		{
			loser setOrigin (origLose.origin);
			loser setPlayerAngles (origLose.angles);
			loser freezeControls (1);
			loser takeAllWeapons();
            loser iPrintLnBold("^1You lost ^7!");
            loser playlocalSound("no");
		}
	}
}

spinning_room()
{
   level.trigger_spin = getEnt ("trig_spinning_room", "targetname");

    orig_jumper = getEnt ("orig_spinning_room_jumper", "targetname");
    orig_acti = getEnt ("orig_spinning_room_jumper", "targetname");
    level.trigger_spin setHintString ("^7Press ^4[&&1]^7to enter ^4Spinning Room^7!");

    for(;;)
    {
        level.trigger_spin waittill ("trigger", player);
        

        player thread waitdead();
        activator = GetActivator();   
        thread spin_wait();
        player SetClientDVAR("cg_thirdperson", 1);
        activator SetClientDVAR("cg_thirdperson", 1);
        activator thread endTimer("^4Spin Room", 3, 0);
        player thread endTimer("^4Spin Room", 3, 0);
        player thread fightHUD("Survive longer than opponent to prevent death !", player, activator);
        activator thread fightHUD("Survive longer than opponent to prevent death !", player, activator);
        player setOrigin (orig_jumper.origin);
        player setPlayerAngles (orig_jumper.angles);
        activator setPlayerAngles(orig_acti.angles);
        activator setOrigin(orig_acti.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player.maxhealth = 100;
		thread spin_end(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

spin_end(who, who2)
{
	trig = getEnt ("trig_spinning_room_fail", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", loser);

        loser freezeControls (1);
        loser setOrigin (origLose.origin);
		loser setPlayerAngles (origLose.angles);
		loser takeAllWeapons();
        loser SetClientDVAR("cg_thirdperson", 0);
        loser iPrintLnBold("^1You lost ^7!");
        loser playlocalSound("no");
        level notify ("spin_finished");
		
		if (loser == who)
			winner = who2;
		else
			winner = who;
		
		if (isDefined(winner))
		{
        winner freezeControls (1);
        winner PlayLocalSound("legacy_finish_him");
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner SetClientDVAR("cg_thirdperson", 0);
        winner takeAllWeapons();
        winner iPrintLnBold("^2You won^7!");
        winner playlocalSound("legacy_reward");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
		}
	}
}

spin_wait()
{
    wait 8;
    thread spin_launch();

}

spin_launch()
{
    level endon ("spin_finished");
    level.spin_on = 1;
    level.spin_speed = 6;
    for(;;)
    {
        if (level.spin_on == 1)
        {
            thread spin_script();
        }
        wait(level.spin_speed);
    }
}

spin_script()
{
    spinner = getEnt ("spinner", "targetname");
    random_spinner = randomint(3);

    if (random_spinner == 0)
    {
        spinner rotateyaw(-360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    else
    {
        spinner rotateyaw(360, (level.spin_speed));
        wait(level.spin_speed);
        level.spin_speed = level.spin_speed - 0.5;
    }
    if (level.spin_speed < 2)
    {
        level.spin_speed = 1.6;
    }

}

parkour_room()
{
   level.trigger_parkour = getEnt ("trig_parkour_room", "targetname");

    jumperp = getEnt ("orig_parkour_jumper", "targetname");
    actip = getEnt ("orig_parkour_activator", "targetname");

    level.trigger_parkour setHintString ("^7Press ^4[&&1]^7to enter ^4Parkour Room^7!");

    for(;;)
    {
        level.trigger_parkour waittill ("trigger", player);

        player thread waitdead();
        activator = GetActivator();  
        thread walls_wait();
        activator thread endTimer("^4Parkour Room", 3, 0);
        player thread endTimer("^4Parkour Room", 3, 0);
        player thread fightHUD("Survive longer than opponent to prevent death !", player, activator);
        activator thread fightHUD("Survive longer than opponent to prevent death !", player, activator);
        player setOrigin (jumperp.origin);
        player setPlayerAngles (jumperp.angles);
        activator setPlayerAngles(actip.angles);
        activator setOrigin(actip.origin);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("deserteagle_mp");
        activator giveWeapon("deserteagle_mp");
        player switchToWeapon ("deserteagle_mp");
        activator switchToWeapon("deserteagle_mp");
        player.maxhealth = 100;
		thread parkour_end(player, activator);
                       while(isDefined(player) && isAlive(player))
            wait .05;

    }
}

parkour_end(who, who2)
{
	trig = getEnt ("trig_parkour_fail", "targetname");
	origWin = getEnt ("winner", "targetname");
	origLose = getEnt ("looser", "targetname");
	
	while(1)
	{
		trig waittill("trigger", loser);

        loser freezeControls (1);
        loser setOrigin (origLose.origin);
		loser setPlayerAngles (origLose.angles);
		loser takeAllWeapons();
        loser SetClientDVAR("cg_thirdperson", 0);
        loser iPrintLnBold("^1You lost ^7!");
        loser playlocalSound("no");
        level notify ("finished_game");
		
		if (loser == who)
			winner = who2;
		else
			winner = who;
		
		if (isDefined(winner))
		{
        winner freezeControls (1);
        winner PlayLocalSound("legacy_finish_him");
        winner setOrigin (origWin.origin);
        winner setPlayerAngles (origWin.angles);
        winner SetClientDVAR("cg_thirdperson", 0);
        winner takeAllWeapons();
        winner iPrintLnBold("^2You won^7!");
        winner playlocalSound("legacy_reward");
        wait 1;
        winner freezeControls (0);
        winner giveWeapon("deserteagle_mp");
        winner giveMaxAmmo("deserteagle_mp");
        winner switchToWeapon("deserteagle_mp");
		}
	}
}

walls_wait()
{
    wait 8;
    thread walls_launch();

}

Walls_launch()
{
    level endon ("finished_game");
    
    level.walls_speed = 4;
    for(;;)
    {
        if (level.walls_speed == 0.8)
        {
            level.walls_speed = 1;
        }
        thread Walls_script();
        wait(level.walls_speed);
        wait 1;
        //iprintln("^4Wall Speed :" + level.walls_speed);
    }
}

Walls_script()
{
    wall1 = getent ("parkour_wall_1", "targetname");
    wall2 = getent ("parkour_wall_2", "targetname");
    wall3 = getent ("parkour_wall_3", "targetname");
    wall4 = getent ("parkour_wall_4", "targetname");
    wall5 = getent ("parkour_wall_5", "targetname");
    wall6 = getent ("parkour_wall_6", "targetname");
    wall7 = getent ("parkour_wall_7", "targetname");
    wall8 = getent ("parkour_wall_8", "targetname");
    wall9 = getent ("parkour_wall_9", "targetname");
    wall10 = getent ("parkour_wall_10", "targetname");

    wall1 hide();
    wall2 hide();
    wall3 hide();
    wall4 hide();
    wall5 hide();
    wall6 hide();
    wall7 hide();
    wall8 hide();
    wall9 hide();
    wall10 hide();

    random_wall = randomint(10);

    if (random_wall == 0)
    {
        wall1 show();
        wall1 Solid();
        wall1 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall1 hide();
     
        wall1 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 1)
    {
        wall2 show();
        wall2 Solid();
        wall2 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall2 hide();
     
        wall2 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }

    if (random_wall == 2)
    {
        wall3 show();
        wall3 Solid();
        wall3 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall3 hide();
      
        wall3 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 3)
    {
        wall4 show();
        wall4 Solid();
        wall4 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall4 hide();
     
        wall4 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 4)
    {
        wall5 show();
        wall5 Solid();
        wall5 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall5 hide();
     
        wall5 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 5)
    {
        wall6 show();
        wall6 Solid();
        wall6 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall6 hide();
     
        wall6 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }

    if (random_wall == 6)
    {
        wall7 show();
        wall7 Solid();
        wall7 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall7 hide();
      
        wall7 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 7)
    {
        wall8 show();
        wall8 Solid();
        wall8 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall8 hide();
     
        wall8 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 8)
    {
        wall9 show();
        wall9 Solid();
        wall9 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall9 hide();
      
        wall9 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
    if (random_wall == 9)
    {
        wall10 show();
        wall10 Solid();
        wall10 moveY(2000, (level.walls_speed));
        wait(level.walls_speed);
        wait 0.5;
        wall10 hide();
       
        wall10 moveY(-2000, 0.10);
        level.walls_speed = level.walls_speed - 0.20;
    }
}

simonsays_room()
{
    level.simonsays = getent("trig_simon_says_room", "targetname");
	level.simonsays_acti_tp = getent("orig_ss_activator","targetname");
	level.simonsays_jumper_tp = getent("orig_ss_jumper","targetname");

    one = getent("ss_ss_one", "targetname");
	two = getent("ss_ss_two", "targetname");
	tree = getent("ss_ss_three", "targetname");
	four = getent("ss_ss_four", "targetname");
	five = getent("ss_ss_five", "targetname");
	six = getent("ss_ss_six", "targetname");
	seven = getent("ss_ss_seven", "targetname");
	eight = getent("ss_ss_eight", "targetname");
	nine = getent("ss_ss_nine", "targetname");
	
    one hide();
	two hide();
	tree hide();
	four hide();
	five hide();
	six hide();
	seven hide();
	eight hide();
	nine hide();

	while(1)
    {
    	level.simonsays setHintString ("^7Press ^4[&&1]^7to enter ^4Simon Says Room^7!");
        level.simonsays waittill( "trigger", player );
    
    if(isDefined(level.actiBusy) && level.actiBusy == 1)
			player iprintlnbold("^4Activator ^7is ^4busy^7, wait a few ^4seconds^7!");
		else
		{
        if(!isDefined(level.simonsays))
            return;

        if(!isdefined(level.activKills))
			level.playername = player.name;
		
		//player
		player freezeControls(1);
        player setOrigin(level.simonsays_jumper_tp.origin);
		player setPlayerangles(level.simonsays_jumper_tp.angles);
		player TakeAllWeapons();
		player SetClientDVAR("cg_thirdperson", 1);
        player thread fightHUD("Jump on chosen ^1c^2o^3l^4o^4u^6r ^7to prevent death !", player, level.activ);
		
		//acti
		if (isDefined(level.activ) && isAlive(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.simonsays_acti_tp.origin );
			level.activ setPlayerangles( level.simonsays_acti_tp.angles );
			level.activ TakeAllWeapons();
			level.activ SetClientDVAR("cg_thirdperson", 1);	
			level.activ thread fightHUD("Jump on chosen ^1c^2o^3l^4o^4u^6r ^4to prevent death !", player, level.activ);
		}
        level.activ thread endTimer("^4Simon Says Room", 3, 0);
        player thread endTimer("^4Simon Says Room", 3, 0);
		
		wait 3;
		thread ss_game(player);
		thread ss_check(player);
		while( isAlive( player ) && isDefined( player ) )
			wait 0.1;
		level.ss_on = 0;

        while(isDefined(player) && isAlive(player))
            wait .05;

		}
    }
}

ss_check(player)
{
	trig = getent("trig_ss_fail", "targetname");
	level.winner = getent("winner", "targetname");
	level.loser = getent("looser", "targetname");

	trig waittill("trigger", loser);

	level.wall hide();
	level.ss_on = 0;

	if (isDefined(level.activ) && loser == level.activ) //jumper wins
	{
		loser freezeControls(1);
		loser setOrigin( level.loser.origin );
		loser setPlayerAngles( level.loser.angles );
		loser iPrintLnBold("^1You have lost!");
        loser playlocalSound("no");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");

		player freezeControls(1);	
        player PlayLocalSound("legacy_finish_him");
        player playlocalSound("legacy_reward");
		player setOrigin(level.winner.origin);
		player setPlayerAngles(level.winner.angles);
		player iPrintLnBold("^2You won!");
		player SetClientDVAR("cg_thirdperson", 0);
		wait 4;
		player freezeControls(0);
		
		player giveWeapon("knife_mp");
		player giveMaxAmmo("knife_mp");
		player switchToWeapon("knife_mp");
	}
	else //activator wins
	{
		loser freezeControls(1);
		loser setOrigin(level.loser.origin);
		loser setPlayerAngles(level.loser.angles);
		loser iPrintLnBold("^1You have lost!");
        loser playlocalSound("no");

		loser giveWeapon("knife_mp");
		loser giveMaxAmmo("knife_mp");
		loser switchToWeapon("knife_mp");
		
		if (isDefined(level.activ))
		{
			level.activ freezeControls(1);
			level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
			level.activ iPrintLnBold("^2You won!");
            level.activ playlocalSound("legacy_reward");
			level.activ SetClientDVAR("cg_thirdperson", 0);
			wait 4;
			level.activ freezeControls(0);
						
			level.activ giveWeapon("knife_mp");
			level.activ giveMaxAmmo("knife_mp");
			level.activ switchToWeapon("knife_mp");
		}
		else
			player iPrintLnBold("^1No activator ?!");
	}
}


ss_game(player)
{
    one = getent("ss_one", "targetname");
	two = getent("ss_two", "targetname");
	three = getent("ss_three", "targetname");
	four = getent("ss_four", "targetname");
	five = getent("ss_five", "targetname");
	six = getent("ss_six", "targetname");
	seven = getent("ss_seven", "targetname");
	eight = getent("ss_eight", "targetname");
	nine = getent("ss_nine", "targetname");

    ss_one = getent("ss_ss_one", "targetname");
	ss_two = getent("ss_ss_two", "targetname");
	ss_three = getent("ss_ss_three", "targetname");
	ss_four = getent("ss_ss_four", "targetname");
	ss_five = getent("ss_ss_five", "targetname");
	ss_six = getent("ss_ss_six", "targetname");
	ss_seven = getent("ss_ss_seven", "targetname");
	ss_eight = getent("ss_ss_eight", "targetname");
	ss_nine = getent("ss_ss_nine", "targetname");

	level.ss_on = 1;
	hide = "";
	level.wall = "";
	time = 0;
	length = 3.5;

	while (level.ss_on == 1)
	{
	    ss_one hide();
		ss_two hide();
		ss_three hide();
		ss_four hide();
		ss_five hide();
		ss_six hide();
		ss_seven hide();
		ss_eight hide();
		ss_nine hide();

		colour = randomint(9);
		if (colour == 0)
		{
			hide = one;
			level.wall = one;
		    ss_one show();
		}
		if (colour == 1)
		{
			hide = two;
			ss_two show();
			level.wall = two;
		}
		if (colour == 2)
		{
			hide = three;
			ss_three show();
			level.wall = three;
		}
		if (colour == 3)
		{
			hide = four;
			ss_four show();
			level.wall = four;
		}
		if (colour == 4)
		{
			hide = six;
			ss_six show();
			level.wall = six;
		}
		if (colour == 5)
		{
			hide = seven;
			ss_seven show();
			level.wall = seven;
		}
		if (colour == 6)
		{
			hide = five;
			ss_five show();
			level.wall = five;
		}
		if (colour == 7)
		{
			hide = eight;
			ss_eight show();
			level.wall = eight;
		}
		if (colour == 8)
		{
			hide = nine;
			ss_nine show();
			level.wall = nine;
		}

		wait(length);

        one hide();
		two hide();
		three hide();
		four hide();
		five hide();
		six hide();
		seven hide();
		eight hide();
		nine hide();

		one notsolid();
		two notsolid();
		three notsolid();
		four notsolid();
		five notsolid();
		six notsolid();
		seven notsolid();
		eight notsolid();
		nine notsolid();

		hide show();
		hide solid();
		level.wall show();

		wait 3;

        one show();
		two show();
		three show();
		four show();
		five show();
		six show();
		seven show();
		eight show();
		nine show();

		one solid();
		two solid();
		three solid();
		four solid();
		five solid();
		six solid();
		seven solid();
		eight solid();
		nine solid();

		time += 1;
		length -= 0.25;


        if(time == 14 && isAlive(player))
		{
			player iprintlnbold("^4You finished ^7SimonSays Room ^4, now kill the ^7Activator^4!");
            player setOrigin(level.loser.origin);
            player setPlayerAngles(level.loser.angles);
            player SetClientDVAR("cg_thirdperson", 0);
            player playlocalSound("yes");
			level.activ iprintlnbold("^4You finished ^7SimonSays Room ^4, now kill the ^7Jumper^4.");
            level.activ setOrigin( level.winner.origin );
			level.activ setPlayerAngles( level.winner.angles );
            level.activ SetClientDVAR("cg_thirdperson", 0);
            level.activ playlocalSound("yes");
			player giveWeapon("knife_mp");
			level.activ giveWeapon("knife_mp");
			player switchToWeapon("knife_mp");
			level.activ switchToWeapon("knife_mp");
			level.wall hide();
			level.ss_on = 0;
		}
	}
}