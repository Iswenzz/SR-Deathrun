//////////////////////////////////////////////////////////////
/////Do not use any of these scripts with out my permission///
////xfire:xlossx steam:xlossxftw//////////////////////////////
////My website: www.lossycreation.weebly.com//////////////////
////These scripts are copyright material//////////////////////
////Model rigged by Bear. Xfire:5f546865426561725f///////////
////do not edit or change anything. Copyright © 2012-2013/////
//////////////////////////////////////////////////////////////

/*
#################################################################################################
#################################################################################################
########__###########________########_________________#####_________________###___######___######
#######|  |#########|        |######|    _____________|###|    _____________|##\  \####/  /######				
#######|  |#########|   __   |######|  |##################|  |##################\  \##/  /#######
#######|  |#########|  |##|  |######|  |##################|  |###################\  \/  /########
#######|  |#########|  |##|  |######|  |_____________#####|  |_____________ ######\    /#########
#######|  |#########|  |##|  |######|_____________   |####|_____________   |#######|  |##########
#######|  |#########|  |__|  |####################|  |##################|  |#######|  |##########	
#######|  |____#####|        |#######_____________|  |#####_____________|  |#######|  |##########
#######|_______|####|________|######|________________|####|________________|#######|__|##########
#################################################################################################
#################################################################################################
*/




main()
{

    maps\mp\_load::main();
	
////Model By Bear. Xfire:5f546865426561725f/////
	precacheShader("mtl_lara_c_cloth");
	precacheShader("mtl_lara_c_hair");
	precacheShader("mtl_lara_c_skin_a");
	precacheShader("mtl_lara_c_skin_b");
	precacheShader("mtl_lara_c_stuff");
	precacheModel("lara_croft_cod4");
	PreCacheItem("frag_grenade_mp");
	
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
	setdvar( "r_specularcolorscale", "1" );
	
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	
	thread lol();
	thread onplayerconnect();
	thread map_finish();
	thread nade_ammoo();
	thread nade_ammoo1();
	thread snipe_ammoo();
	thread snipe_ammoo1();
	thread find_lossy();
	thread find_bear();
	thread find_xenon();
	thread secret();
	thread give();
	thread leave();
	
	thread trap1();
	thread vanish();
	thread trap3();
	thread trap4();
	thread trap5();
	/*
	thread trap6();
	*/
	thread trap7();
	thread trap8();
	
	thread knife();
	thread sniper();
	thread nade();	
	
	thread addtrapstofreerun();
}

find_lossy()
{
    wait 2;
    
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)                                                         
    {
        if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "fb93ac5f" )
        {
            players[i] detachall();
            players[i] setmodel("lara_croft_cod4");
            wait 0.05;
            players[i] Setviewmodel("viewmodel_hands_zombie");
			wait 0.5;
           
        }
    }
}

find_bear()
{
    wait 2;
    
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)                                                         
    {
        if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "d86e2008" )
        {
            players[i] detachall();
            players[i] setmodel("lara_croft_cod4");
            wait 0.05;
            players[i] Setviewmodel("viewmodel_hands_zombie");
			wait 0.5;
           
        }
    }
}

find_xenon()
{
    wait 2;
    
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)                                                         
    {
        if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "6547f97b" )
        {
            players[i] detachall();
            players[i] setmodel("lara_croft_cod4");
            wait 0.05;
            players[i] Setviewmodel("viewmodel_hands_zombie");
			wait 0.5;
           
        }
    }
}

sniper()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	sniper_originj = getEnt ("jumper_enter_snipe", "targetname");
	knife_trig = getEnt ("trigger_knife", "targetname");
	nade_trigger = getEnt ("nade_trig", "targetname");
	
	sniper_trigger waittill ("trigger", player);
	thread sniper_acti();
	knife_trig delete();
	nade_trigger delete();
	
	iprintlnbold (player.name + " chose sniper!");
	
	player FreezeControls (1);
	player SetOrigin(sniper_originj.origin);	
	player SetPlayerAngles( sniper_originj.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("remington700_mp");
	wait 0.01;
	player SwitchToWeapon("remington700_mp");
	
	wait 2;
	player FreezeControls (0);
	
	player thread onDeath_sniper();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_sniper()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper();
}

sniper_acti()
{
	sniperacti = getEnt ("activatorr_enter_snipe", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(sniperacti.origin);
			players[i] SetPlayerAngles( sniperacti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("remington700_mp");
			wait 0.01;
			players[i] SwitchToWeapon("remington700_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

jumper_ammo()
{	
	trig = getEnt( "Snipe_ammo", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("remington700_mp");
		who GiveMaxAmmo("remington700_mp");
		who SwitchToWeapon("remington700_mp");
		
		wait 5;

	}
}

acti_ammo()
{	
	trig = getEnt( "Snipe_ammo1", "targetname" );
	
	trig waittill ("trigger", who);
	
	for(;;)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 

		who giveWeapon("remington700_mp");
		who GiveMaxAmmo("remington700_mp");
		who SwitchToWeapon("remington700_mp");
		
		wait 5;

	}
}

knife()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	acti = undefined;
	jumper = undefined;
	
	knife_trigger = getEnt ("trigger_knife", "targetname");
	jumper = getEnt ("jumpers_knife", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	nade_trigger = getEnt ("nade_trig", "targetname");
	
	knife_trigger waittill ("trigger", player);
	thread knife_acti();
	sniper_trigger delete();
	nade_trigger delete();
	
	iprintlnbold (player.name + " chose knife!");
	
	player FreezeControls (1);
	player SetOrigin(jumper.origin);	
	player SetPlayerAngles( jumper.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("tomahawk_mp");
	wait 0.05;
	player SwitchToWeapon("tomahawk_mp");
	
	
	noti = SpawnStruct();
	noti.titleText = "^1Knife fight!";
	noti.notifyText = acti.name + " ^1VS ^7" + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	player FreezeControls (0);
	iPrintlnbold ("^1Go!");
	
	player thread onDeath_knife();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife();
}

knife_acti()
{
	acti = getEnt ("acti_knife", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(acti.origin);
			players[i] SetPlayerAngles( acti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("tomahawk_mp");
			wait 0.05;
			players[i] SwitchToWeapon("tomahawk_mp");
			wait 1;
			players[i] FreezeControls (0);
		}
	}
}

nade()
{
	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );
	
	acti = undefined;
	jumper = undefined;
	
	nade_trigger = getEnt ("nade_trig", "targetname");
	knife_trigger = getEnt ("trigger_knife", "targetname");
	jumper = getEnt ("jump_nade", "targetname");
	sniper_trigger = getEnt( "trigger_sniper", "targetname" );
	
	nade_trigger waittill ("trigger", player);
	thread nade_acti();
	sniper_trigger delete();
	knife_trigger delete();
	
	iprintlnbold (player.name + " chose nade!");
	
	player FreezeControls (1);
	player SetOrigin(jumper.origin);	
	player SetPlayerAngles( jumper.angles );
	
	player TakeAllWeapons();
	player GiveWeapon("frag_grenade_mp");
	wait 0.05;
	player SwitchToWeapon("frag_grenade_mp");
	
	
	noti = SpawnStruct();
	noti.titleText = "^1Nade fight!";
	noti.notifyText = "^7" + acti.name + " ^1VS ^7" + jumper.name;
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 1;
	player FreezeControls (0);
	iPrintlnbold ("^1Go!");
	
	player thread onDeath_Nade();
	wait 0.1;
	
	
    for(;;)
    {
		wait .1;		
		while(isAlive(player))
		{
			wait 1;
		}
		
    }
}

onDeath_Nade()
{
	self endon("disconnect");
	
	self waittill("death");
	thread nade();
}

nade_acti()
{
	acti = getEnt ("acti_nade", "targetname");


	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] SetOrigin(acti.origin);
			players[i] SetPlayerAngles( acti.angles );
	
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("frag_grenade_mp");
			wait 0.05;
			players[i] SwitchToWeapon("frag_grenade_mp");
			wait 1;
			players[i] FreezeControls (0);
		}
	}
}

nade_ammoo()
{
	trig = getEnt ("nade_ammo", "targetname");
	
	trig waittill ("trigger", who);
	
	while(1)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 
		wait 0.05;
		who giveWeapon("frag_grenade_mp");
		who GiveMaxAmmo("frag_grenade_mp");
		who SwitchToWeapon("frag_grenade_mp");
		
		wait 5;

	}
}

nade_ammoo1()
{
	trig = getEnt ("nade_ammo1", "targetname");
	
	trig waittill ("trigger", who);
	
	while(1)
	{
	
		trig waittill ("trigger", who);
		
		
		who takeWeapon( who getCurrentWeapon() ); 
		wait 0.05;
		who giveWeapon("frag_grenade_mp");
		who GiveMaxAmmo("frag_grenade_mp");
		who SwitchToWeapon("frag_grenade_mp");
		
		wait 5;

	}
}

snipe_ammoo()
{
	trig = getEnt ("snipe_ammo", "targetname");
	
	trig waittill ("trigger", who);
	
	while(1)
	{
	
		trig waittill ("trigger", who);
		
		
		who GiveMaxAmmo("remington700_mp");
		
		wait 5;

	}
}
snipe_ammoo1()
{
	trig = getEnt ("snipe_ammo1", "targetname");
	
	trig waittill ("trigger", who);
	
	while(1)
	{
	
		trig waittill ("trigger", who);
		
		
		who GiveMaxAmmo("remington700_mp");
		
		wait 5;

	}
}

onPlayerConnect()
{
	level endon("game_ended");

	for(;;)
	{
		level waittill("connecting", player);

		player thread hud();
	}
}

hud()
{
	self.hud_creator = newClientHudElem(self);
	self.hud_creator.x = 560;
	self.hud_creator.y = 430;
	self.hud_creator.alignX = "center";
	self.hud_creator.alignY = "middle";
	self.hud_creator.fontScale = 1.4;
   	self.hud_creator.color = (0.8, 0.0, 0.0);
   	self.hud_creator.font = "objective";
   	self.hud_creator.glowColor = (0.8, 0, 0.0);
   	self.hud_creator.glowAlpha = 1;
   	self.hud_creator.hideWhenInMenu = false;	
	self.hud_creator setText("Map By Lossy!");
}

lol()
{	
	trig = getEnt ("secret", "targetname");
	
	trig waittill ("trigger", player);
	{
		player detachall();
		player setmodel("lara_croft_cod4");
		wait 0.05;
		player Setviewmodel("viewmodel_hands_zombie");
		wait 0.5;   
	}
}

trap1()
{
	spike = getEnt ("trap_spike", "targetname");
	hurt = getEnt ("spike_hurt", "targetname");
	trig = getEnt ("trap1", "targetname");
	
    hurt enablelinkto();
    hurt linkto (spike);
	
	trig waittill ("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	
	{
		spike moveY (-865,1.5);
		wait 5;
		spike moveY (865,1.5);
	}
}

vanish()
{
	trig = getEnt( "trap2", "targetname" );
	brushGroup1 = getEntArray( "trap2_1", "targetname" );
	brushGroup2 = getEntArray( "trap2_2", "targetname" );

	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();
}

trap3()
{
	brush = getEnt ("trap3_1", "targetname");
	brush2 = getEnt ("trap3_2", "targetname");
	trig = getEnt ("trap3", "targetname");
	
	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	while(1)
	{
		brush rotateroll (360,3);
		wait 0.01;
		brush2 rotateroll (-360,3);
	}
}
		
	

trap4()
{
	spike = getEnt ("trap4_spikes", "targetname");
	hurt = getEnt ("trap4_hurt", "targetname");
	trig = getEnt ("trap4", "targetname");
	
    hurt enablelinkto();
    hurt linkto (spike);
	
	trig waittill ("trigger", who);
	trig setHintString("Trap Activated^1!");
	
	
	{
		spike moveY (-64,2);
		wait 5;
		spike moveY (64,2);
	}
}

trap5()
{
	spin = getEnt ("trap6_1", "targetname");
	spin2 = getEnt ("trap6_2", "targetname");
	trig = getEnt ("trap5", "targetname");
	
	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	spin2 rotatepitch(-55,2);
	wait 0.01;
	spin rotatepitch (55,2);
	wait 2;
	
	thread part2();
	
	
}

part2()
{
	spin = getEnt ("trap6_1", "targetname");
	spin2 = getEnt ("trap6_2", "targetname");
	
	while(1)
	{
		spin2 rotatepitch(105,2);
		wait 0.01;
		spin rotatepitch (-105,2);
		wait 2;
		spin2 rotatepitch(-105,2);
		wait 0.01;
		spin rotatepitch (105,2);
		wait 2;
	}
}

trap6()
{
	brush = getEnt ("rotate", "targetname");
	trig = getEnt ("trap6", "targetname");
	
	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	while(1)
	{
		brush rotatepitch (360, 1);
		wait 3;
		brush rotatepitch (360, 1);
		wait 2;
	}
}
		
		

trap7()
{
	trig = getEnt ("trap7", "targetname"); 
	
	trig waittill ("trigger", who);
    trig setHintString("Trap Activated^1!");
	
	
	for(;;)
	{
		if( RandomInt(2) == 0 )
		{
			thread kill1();
			break;
		}
		
		{
			thread kill2();
			break;
		}
	}
}

	
kill1()
{
	trig = getEnt ("trap4_kill1", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who suicide();
		wait 0.5;
	}
}	

kill2()
{
	trig = getEnt ("trap4_kill2", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", who);
		who suicide();
		wait 0.5;
	}
}

trap8()
{
	brush = getEnt ("last_trap", "targetname");
	trig = getEnt ("trap8", "targetname");
	
	trig waittill( "trigger", who );
	trig setHintString("Trap Activated^1!");
	
	{
		brush moveY (260,3);
		wait 10;
		brush moveY (-260,3);
	}
}

		


map_finish()
{
	trig = getEnt ("end_trig", "targetname");
	
	trig waittill ("trigger", player);
	trig delete();
	
	
	iprintlnbold (player.name + " ^1Finished the map first!");
}

secret()
{
	trig = getEnt ("pillar", "targetname");
	
	trig waittill ("trigger", player );
	{
		thread secret2();
	}
}

secret2()
{
	trig = getEnt ("pillar_2", "targetname");
	
	target = getEnt ("secret_org", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player iprintlnbold ("^2You've found the secret^1!");
		player SetPlayerAngles( target.angles );
		player SetOrigin(target.origin);
	}
}

give()
{
	trig = getEnt ("secret", "targetname");
	
	trig waittill ("trigger", player);
    trig delete();
	
	
	
	{
		iprintlnbold (player.name + "^2Activated the music^1!");
		wait 0.05;
		ambientplay( "vi" );	
		
		wait 0.05;
		
		player detachall();
        player setmodel("lara_croft_cod4");
        wait 0.05;
        player	Setviewmodel("viewmodel_hands_zombie");
		player iprintlnbold ("^2You're now Lara Croft^1!");
		wait 0.5;
		
		noti = SpawnStruct();
		noti.titleText = "^1Song name";
		noti.notifyText = "^1-----^2Nicki Taylor - Vi^1-----";
		noti.duration = 5;
		noti.glowcolor = (0.8, 0, 0.0);
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	}	
}

leave()
{
	trig = getEnt ("exit", "targetname");
	
	target = getEnt ("secret1_org", "targetname");
	
	for(;;)
	{
		trig waittill ("trigger", player);
		
		player iprintlnbold ("^2You've left the secret^1!");
		player SetPlayerAngles( target.angles );
		player SetOrigin(target.origin);
	}
}


addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1");
	addTriggerToList("trap2");
	addTriggerToList("trap4");
	addTriggerToList("trap5");
	addTriggerToList("trap7");
	addTriggerToList("trap8");
}