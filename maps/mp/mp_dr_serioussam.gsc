#include common_scripts\utility;
#include maps\mp\_utility;
main()
{

/////////////////////////////////////////////////////////////////////////
/////////////////////////\ \/////////////////////////////////////////////
////////// _ __    __   \_\ \    ___     ___     ____     __  /////////// 
///////////\`'__\/'__`\ /'_` \ /' _ `\  / __`\  /',__\  /'__`\ //////////
//////////\ \ \//\  __//\ \ \ \/\ \/\ \/\ \ \ \/\__, `\/\  __/ //////////
////////// \ \_\\ \____\ \___,_\ \_\ \_\ \____/\/\____/\ \____\ /////////
//////////  \/_/ \/____/\/__,_ /\/_/\/_/\/___/  \/___/  \/____/ /////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////
//Enjoy my poorly written code! :)
//Special Thanks to Erik for the massive help in scripting!

//Contact Details:
//Web:     rednosemaps.com
//Discord: rednose#9528
//Mail:    rednose@rednosemaps.com

	//Precache and Fx Stuff
	PrecacheModel("vehicle_mi24p_hind_mp");
	PrecacheModel("vehicle_mig29_desert");
	PrecacheModel("projectile_cbu97_clusterbomb");
	precacheItem( "airstrike_mp" );
	precacheModel( "serious_sam_rednose" );
	precacheModel( "viewhands_dnf_duke" );
	precacheModel( "playermodel_dnf_duke" );
	PrecacheShellShock("frag_grenade_mp");
	PrecacheShellShock("teargas");
	precacheItem( "deserteaglegold_mp" );
	precacheItem( "deserteagle_mp" );
	precacheItem( "rpg_mp" );
	precacheItem( "knife_mp" );
	precacheItem( "ak47_mp" );
	precacheItem( "barrett_mp" );
	precacheItem( "gl_g36c_mp" );
	precacheItem( "mp5_reflex_mp" );
	precacheItem( "ak74u_mp" );
	precacheItem( "rpd_grip_mp" );
	precacheItem( "tomahawk_mp" );
	precacheItem( "dragunov_acog_mp" );
	precacheItem( "skorpion_mp" );
	precacheItem( "winchester1200_mp" );
	precacheItem( "m60e4_mp" );
	precacheItem( "barrett_acog_mp" );
	precacheItem( "dragunov_mp" );
	precacheItem( "m14_reflex_mp" );
	precacheItem( "m21_mp" );
	precacheItem( "remington700_mp" );
	level.lightning_fx = LoadFX("rednose/lightning");
	level.lightning_green_fx = LoadFX("rednose/lightning_green");
	level.lightning_pink_fx = LoadFX("rednose/lightning_pink");
	level.airstrike["bomb"] = LoadFX("explosions/clusterbomb");
	level.airstrike["explosion"] = LoadFX("explosions/tanker_explosion");
	level.sparks_small = LoadFX("custom/sparks_small");
	level.lightning_serious = LoadFX("custom/lightning_serious");
	level.gas_trap = LoadFX("custom/gas_trap");
	level.trap_dust = LoadFX("custom/trap_dust");
	level.lightning_serious_origin = LoadFX("custom/lightning_serious_origin");
	level.car_damage_blacksmoke = LoadFX("custom/car_damage_blacksmoke_18");
	level.flamethrower_trap = LoadFX("custom/flamethrower_trap");
	level.acid_sprinklers = LoadFX("custom/acid_sprinklers");
	level.acid_pool = LoadFx ("custom/acid_pool");
	level.dead_acid = LoadFx ("custom/dead_acid");
	level._effect[ "flamethrower_trap" ] = loadfx( "custom/flamethrower_trap" ); 
	level.flamethrower_standby = LoadFX("custom/flamethrower_standby");
	level._effect[ "explosion" ] = loadfx( "explosions/tanker_explosion" ); 
	level.gastrap = LoadFX("custom/gas_trap");
	level.splash_fx = LoadFX("custom/watersplash");
	level.smoke_tele = LoadFX("custom/smoke_tele");
	level.greenlight_fx = LoadFX("misc/aircraft_light_wingtip_green");
	level.footstep_water = LoadFX("custom/footstep_water_c");
	level.wall_explosion_grnd = LoadFX("explosions/wall_explosion_grnd");
	level.teddy_blood = LoadFX("impacts/deathfx_bloodpool_ambush");
	level.teddy_blood_hit = LoadFX("impacts/flesh_hit_knife");
	level.bounce = LoadFX("impacts/flesh_hit_knife");
	level.c4_fx = LoadFX("explosions/aa_explosion");
	level.c4_blink = LoadFX("misc/light_c4_blink");
	level.orb_up_serious = LoadFX("custom/orb_up_serious");
	level.trail_rainbow = LoadFX("custom/trail_rainbow");
	level.laser_center = LoadFX("masseffect/laser_center");
	level.sandstorm = LoadFX("custom/sandstorm");
	level.sandstorm_spray = LoadFX("custom/sandstorm_spray");
	level.sandstorm_spray_fence = LoadFX("custom/sandstorm_spray_fence");	
	level.mist_serious = LoadFX("custom/mist_serious");	
	level.confetti = LoadFX("custom/confetti");	

	//ext. Scripts
	maps\mp\_load::main();
	maps\mp\_seriousdeath::main();
	maps\createart\mp_dr_serioussam_art::main();
	maps\mp\mp_dr_serioussam_fx::main();
	maps\mp\mp_dr_serioussam_sound_fx::main();
	
	//Misc
	thread addtrapstofreerun();
	thread credits_beg();
	thread expandTimeLimit_std();
	thread secretcall();
	thread teddy();
	thread randomquotes();
	thread moron_button();
	thread text();
	thread watersplash();
	thread waterwalking();
	thread waterwalking_2();
	thread flamethrower_connect();
	thread bobbing_moving();
	thread set_custom_model();
	thread addtestclients();
	thread opengate();
	thread opengate_2();
	thread opengate_3();
	thread opengate_4();
	thread opengate_5();
	thread opengate_6();
	thread opengate_7();
	thread slicer_1();
	thread slicer_2();
	thread movingpatterns();
	thread FlyingHelicopter();
	thread GraphicSettings();
	thread expl_wall();
	thread check_lastjumper();
	thread hexagone_spin();
	thread teleport_1();
	thread teleport_2();
	thread teleport_3();
	thread teleport_4();
	thread teleport_5();
	thread teleport_6();
	thread teleport_7();
	thread teleport_8();
	thread speedbounce_1();
	thread speedbounce_2();
	thread speedbounce_3();
	thread speedbounce_4();
	thread speedbounce_1_1();
	thread speedbounce_2_1();
	thread speedbounce_3_1();
	thread speedbounce_4_1();
	thread reverb_cave();
	thread reverb_cave_deactivate();
	thread knife1vs1();
	thread trail_1();
	thread trail_2();
	thread onPlayerConnect();
	thread delete_kill_hexagone();
	thread symbol();
	thread symbol_secret_1();
	thread shootweapon_speed();
	thread getdeaglespeed_a();
	thread getdeaglespeed_j();
	thread getdeaglespeed_j_2();
	thread getdeaglespeed_a_2();
	thread ammorestock_j();
	thread ammorestock_a();
	thread ammorestock_sand();
	thread getpistolsymbols();
	thread tele_symbols();
	thread tele_symbols_1();
	thread symbols_door_1();
	thread symbols_door_2();
	thread symbols_door_3();
	thread symbols_door_4();
	thread symbols_finish();
	thread nomusic();
	thread rpg_grab();
	thread tele_rpg();
	thread cakealie();
	thread shootmysign();
	thread ambient();

	//Traps
	thread trap_01(); //lightning trap			***DONE***
	thread trap_02(); //airstrike trap 			***DONE***
	thread trap_03(); //moving platforms trap 	***DONE***
	thread trap_04(); //electroshock trap 		***DONE***
	thread trap_05(); //crusher trap			***DONE***
	thread trap_06(); //c4 trap					***DONE***
	thread trap_07(); //teargas trap			***DONE***
	thread trap_08(); //acid trap				***DONE***
	thread trap_09(); //RPG trap				***DONE***
	
	//Finals
	thread finaltele1(); //teleport to endgames
	thread finaltele2(); 
	thread finaltele3(); 
	thread finaltele4(); 
	thread finaltele5();
	
	thread hexagone();  //Hex-A-Gone inspired Endgame
	thread pool();	    //pool Endgame
	thread iamspeed();	//bounce+running Endgame
	thread sandstorm(); //whats that songs name again?
	thread knifegame(); //special 1vs1 knife trade game
	
//	ambientPlay("ambient"); //random ambient track
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
}


//////////////////			 //////////////////
//////////////////   Misc.   //////////////////
//////////////////			 //////////////////


ambient() //ambient only when there is a round active
{
   level waittill("round_started");
   ambientPlay("ambient");
}

nomusic()//no map ambient when the mod music kicks in
{
    level waittill( "round_ended" );
    ambientStop( 1 );
}

onPlayerConnect()
{
    level endon("game_ended");
    for(;;)
{
    level waittill("connected", player);
    player thread onPlayerSpawned();
}
}

onPlayerSpawned() //moves the light at trap9 so no strange lighting appears
{
    self endon("disconnect");
	emergencylight_on = getEnt("emergencylight_on", "targetname");
	emergencylight_on movey(50,0.1);
}
	
// add trigs to freerun
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trigger1");
	addTriggerToList("trigger2");
	addTriggerToList("trigger3");
	addTriggerToList("trigger4");
	addTriggerToList("trigger5");
	addTriggerToList("trigger6");
	addTriggerToList("trigger7");
	addTriggerToList("trigger8");
	addTriggerToList("trigger9");
}

expandTimeLimit_std() //just because the map is a bit longer than normal
{
    wait 0.05; //wait for game to load mod script
    level.dvar["time_limit"] += 5;//expands it by 5 min
}

credits_beg() //trigger at spawn
{
	trig = getEnt( "credits_beg", "targetname" );
	trig waittill( "trigger", who );
	trig delete();
	
//	wait (5);
//	ambientPlay("ambient"); //random ambient track
	
	wait(5);
	players = getentarray("player", "classname");
	noti = SpawnStruct();
	noti.titleText = "Map by";
	noti.notifyText = "^1red^7nose";
	noti.duration = 10;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

randomquotes() //random serious same quotes played locally to the player
{
    wait 7;
    players = getentarray("player", "classname");
    for(i = 0; i < players.size; i++)
    {
    players[i] thread quotesound();
    }

}

quotesound()
{
self endon("death");
if( self.pers["team"] == "allies" && isAlive(self))
{
    for(;;)
    {
    wait 1 +RandomFloatRange(10, 40); //random wait
    self PlaySoundToPlayer( "quote", self );
    wait 1 +RandomFloatRange(30, 50); //random wait
    }
}
} 

text() //text lines at the bottom left
{
    for(;;)
    {
        wait 60;
        iPrintln("^1>> ^2Map made by ^1red^7nose");
	    wait 60;
		iPrintln("^1>> ^7visit: ^2rednosemaps.com");
	    wait 60;
    }
}

set_custom_model() // sets the sam models for jumpers and activator
{
	while(1)
	{
		level waittill( "jumper", who ); 
		
		if(who.pers["team"] == "allies")
		{
			who detachAll();
			who setModel( "playermodel_dnf_duke" );
			who setViewModel("viewhands_dnf_duke");				// adds the model 
		} else
		if(who.pers["team"] == "axis")
		{
			who thread seriousmodelclassic();
		}
	}
}

seriousmodelclassic()
{
	self endon("disconnect");
	
	self detachAll();
	self setModel( "serious_sam_rednose" ); // adds the model 
	self setViewModel("viewhands_dnf_duke"); //adds the viewhands
}

addTestClients() //bots
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
}

/* bobbing_bottles() //i am hitting limits so no bobbing bottles in the water :(
{
	obj1 = getent("bottle1","targetname"); //get the script_model entity
	obj2 = getent("bottle2","targetname");
	obj3 = getent("bottle3","targetname"); 
	obj4 = getent("bottle4","targetname"); 
	
	wait randomfloat(2.5); //generate a random number of seconds between bobs
	
	org1 = (285, 9518, 494); //define origin or location of your boat/script_model
	org2 = (382, 9684, 494); 
	org3 = (-536, 9445, 494); 
	org4 = (320, 9906, 494); 

	timer = 1; //bobbing speed - higher number = slower bobbing
	
	for(;;)
	{
		obj1 moveto (org1 + (0,0,1), timer, timer * 0.5, timer * 0.5); // 2 is num. of units to go over Orig.
		obj2 moveto (org2 + (0,0,-1), timer, timer * 0.5, timer * 0.5);
		obj3 moveto (org3 + (0,0,-1), timer, timer * 0.5, timer * 0.5);
		obj4 moveto (org4 + (0,0,-1), timer, timer * 0.5, timer * 0.5);
		wait timer;
		obj1 moveto (org1 + (0,0,-1), timer, timer * 0.5, timer * 0.5); // 2 is num. of units to go over Orig.
		obj2 moveto (org2 + (0,0,1), timer, timer * 0.5, timer * 0.5);
		obj3 moveto (org3 + (0,0,1), timer, timer * 0.5, timer * 0.5);
		obj4 moveto (org4 + (0,0,1), timer, timer * 0.5, timer * 0.5);
		wait timer;
	}
} */

opengate()
{
	for(;;)
	{
		//we do not want to open the gate in free round, so we check if there is an activator
		//and only open the gate if there is one
		activator = undefined;
		players = getentarray( "player", "classname" );
		
		for( i = 0; i < players.size; i++ )
		{
			if( players[i].pers["team"] == "axis" )
			{
				activator = players[i];
				break;
			}
		}
		
		if( isDefined(activator) )
			break;
			
		wait(0.1);
	}
	
	trig = getEnt( "opentrigger", "targetname" );
	door1 = getEnt( "door1", "targetname" );
	door2 = getEnt( "door2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	door1 movex( -180, 6 );
	door2 movex( 180, 6 );
	door1 PlaySound ("gateopen");
	door2 PlaySound ("gateopen");

}

opengate_2()
{
	trig = getEnt( "opentrigger_2", "targetname" );
	hazarddoor = getEnt( "hazarddoor", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	hazarddoor movez( -236, 6 );
	hazarddoor PlaySound ("gateopen");
}

FlyingHelicopter()
{
	while(1)
	{
		players = getentarray("player", "classname");
		if( players.size > 0 )
			break;
		wait .5;
	}
	players = getentarray("player", "classname");
	player = players[RandomInt(players.size)];
	
	x = randomIntRange(0,5);
	
	targets = getEntArray("choppa_path", "targetname");
	chopper = spawn_helicopter( player, targets[RandomInt(targets.size)].origin, (0,0,0), "cobra_mp", "vehicle_mi24p_hind_mp" );
	chopper playLoopSound( "mp_cobra_helicopter" );
	chopper.owner = undefined;
	chopper.maxhealth = 1;
	chopper.health = chopper.maxhealth;
	chopper setDamageStage( x ); //random damage stage 3=full health, 0=burning
	chopper setSpeed( 25, 15 );
	wait 1;
	
	while(1)
	{
		chopper setVehGoalPos( targets[RandomInt(targets.size)].origin, true );
		chopper waittill("goal");
		chopper setGoalYaw( RandomInt(361) );
		wait 3+RandomInt(5);
	}
}

spawn_helicopter( owner, origin, angles, model, targetname )
{
	chopper = spawnHelicopter( owner, origin, angles, model, targetname );
	return chopper;
}

GraphicSettings() //look enhancements
{
	SetDvar( "r_glowTweakEnable", 1 );
	SetDvar( "r_glowUseTweaks", 1 );
	SetDvar( "r_specularcolorscale", "5" );
	SetDvar( "r_specular", 1 );
	//SetDvar( "r_filmUseTweaks", 1 );
	SetDvar( "r_filmTweakContrast", 1.5 );
	SetDvar( "r_glowTweakBloomCutoff", 0.65 );
	SetDvar( "r_glowTweakBloomIntensity", 1 );
	SetDvar( "r_specularmap", 1 );
	SetDvar( "r_dlightLimit", 4 );
	SetDvar( "r_distortion", 1 );
	SetDvar( "r_drawDecals", 1 );
}

shootmysign()
{
	trigger = getent ("noshootsign","targetname"); 
	
	for(;;)
    {
	trigger waittill("trigger",player);
	
//	player iprintlnBold ("ouch");
	player finishPlayerDamage(player, player, 25, 0, "MOD_FALLING", "shock_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
	wait 0.05;
    }
} 

secretcall() //small easteregg that lets sam call sam
{
	triggersend = getent ("secretcallsend","targetname"); //trigger_use_touch
	triggerrec = getent ("secretcallrec","targetname"); //trigger_use_touch
	callsoundsend = getent ("callsoundsend","targetname"); //sender telephone script_model
	callsoundrec = getent ("callsoundrec","targetname"); //receiver telephone script_model
	triggerrec maps\mp\_utility::triggerOff(); //disables the receiving trigger

	triggersend waittill ("trigger", player); //the following lines activate after the user presses f @ the trigger
	triggersend delete (); //we can only use the trigger once
	
//	iPrintln("sent"); //used to debug
	wait(1);
	iprintln("^1"+ player.name + " "+ "^7is calling someone");
	callsoundsend playsound ("startphonecall"); //plays a sound
	wait(3.5);
	callsoundsend playloopsound ("ring_send"); //plays a sound
	wait(0.5);
	callsoundrec playloopsound ("ring_rec"); //plays a sound
	triggerrec maps\mp\_utility::triggerOn(); //enables the receiving trigger
	
	triggerrec sethintstring("Press ^3[USE] ^7to answer ^1"  + player.name +  "^7's call"); //sets the hintstring on the trigger
	triggerrec waittill ("trigger", player);//when the called player answers the phone, we start the next few lines
	triggerrec delete (); //we can only use the trigger once

	callsoundrec stoploopsound("ring_rec"); //stop the ringing
	callsoundsend stoploopsound("ring_send"); //stop the ringing
	iprintln("^1"+ player.name + " "+ "^7answered the phone");

	wait(0.75);
	
	callsoundrec playsound ("SecretCall2"); //start the sound
//	iPrintln("playrec"); //used to debug
	
	wait(0.4);
	callsoundsend playsound ("SecretCall1"); //start the sound
//	iPrintln("playsent"); //used to debug
}

bobbing_moving() //bobbing and moving platforms for trap_03
{
	platform1 = getent("platform1","targetname"); //get the entitys
	platform2 = getent("platform2","targetname"); 
	platform3 = getent("platform3","targetname"); 
	platform3_1 = getent("platform3_1","targetname"); 
	platform4 = getent("platform4","targetname"); 
	platform5 = getent("platform5","targetname"); 
	platform5_1 = getent("platform5_1","targetname"); 
	platform6 = getent("platform6","targetname"); 
	platform6_1 = getent("platform6_1","targetname"); 
	platform7 = getent("platform7","targetname"); 
	platform8 = getent("platform8","targetname"); 
	platform8_1 = getent("platform8_1","targetname"); 
	
	wait randomfloat(2); //generate a random number of seconds between bobs
	
	org1 = (-288, 7088, 400); //define origin or location of the entitys
	org2 = (240, 7104, 400); 
	org3 = (-16, 7232, 400); 
	org3_1 = (368, 7344, 400); 
	org4 = (192, 7504, 400); 
	org5 = (-336, 7616, 400); 
	org5_1 = (288, 7744, 400); 
	org6 = (-176, 7856, 400); 
	org6_1 = (-256, 7376, 400); 
	org7 = (224, 8064, 400); 
	org8 = (-288, 8144, 400); 
	org8_1 = (-16, 8080, 400); 
							
							
	timer = 1; //bobbing speed - higher number = slower bobbing
	
	for(;;)
	{
		platform1 moveto (org1 + (0,75,0), timer, timer * 0.5, timer * 0.5);		// 2 is num. of units to go over Orig.
		platform2 moveto (org2 + (0,0,2), timer, timer * 0.5, timer * 0.5);
		platform3 moveto (org3 + (100,0,0), timer, timer * 0.5, timer * 0.5);
		platform3_1 moveto (org3_1 + (0,-50,0), timer, timer * 0.5, timer * 0.5);
		platform4 moveto (org4 + (-150,0,0), timer, timer * 0.5, timer * 0.5);
		platform5 moveto (org5 + (0,0,2), timer, timer * 0.5, timer * 0.5);
		platform5_1 moveto (org5_1 + (0,0,2), timer, timer * 0.5, timer * 0.5);
		platform6 moveto (org6 + (0,-100,2), timer, timer * 0.5, timer * 0.5);
		platform6_1 moveto (org6_1 + (100,0,2), timer, timer * 0.5, timer * 0.5);
		platform7 moveto (org7 + (0,100,0), timer, timer * 0.5, timer * 0.5);
		platform8 moveto (org8 + (0,-100,0), timer, timer * 0.5, timer * 0.5);
		platform8_1 moveto (org8_1 + (-75,0,2), timer, timer * 0.5, timer * 0.5);
		wait timer;
		platform1 moveto (org1 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform2 moveto (org2 + (0,0,-2), timer, timer * 0.5, timer * 0.5);
		platform3 moveto (org3 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform3_1 moveto (org3_1 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform4 moveto (org4 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform5 moveto (org5 + (0,0,-2), timer, timer * 0.5, timer * 0.5);
		platform5_1 moveto (org5_1 + (0,0,-2), timer, timer * 0.5, timer * 0.5);
		platform6 moveto (org6 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform6_1 moveto (org6_1 + (0,0,0), timer, timer * 0.5, timer * 0.5);
		platform7 moveto (org7 + (0,-100,0), timer, timer * 0.5, timer * 0.5);
		platform8 moveto (org8 + (0,50,0), timer, timer * 0.5, timer * 0.5);
		platform8_1 moveto (org8_1 + (0,0,0), timer, timer * 0.5, timer * 0.5);

		wait timer;
	}
}

watersplash() //creates a watersplash fx and sound where the player falls into the water
{
	trig = getent("water", "targetname");
	
	while(1)
	{
	trig waittill ("trigger", who);	
		who PlaySound ("splash");
		PlayFX( level.splash_fx, who.origin );
	wait (.1);
		
	}
}

waterwalking() //creates an splash fx where the player walks
{
	trig = getent("waterwalking", "targetname");
	
	while(1)
	{
	trig waittill ("trigger", who);	
//	who PlaySound ("splash");
	PlayFX( level.footstep_water, who.origin );
	wait (1);	
	}
}

waterwalking_2()
{
	trig = getent("waterwalking2", "targetname");
	
	while(1)
	{
	trig waittill ("trigger", who);	
//	who PlaySound ("splash");
	PlayFX( level.footstep_water, who.origin );
	wait (1);	
	}
}

flamethrower_connect() //plays a standby fx at the flamethrower trap
{
	for(;;)
	{
	level waittill("connected", player);
	wait (1);
	thread flamethrower_standby();
	}
}

flamethrower_standby()
{
	stb_f1_origin = getEnt("stb_f1_origin","targetname"); //script_model -> "tag_origin" used to play the fx
	stb_f4_origin = getEnt("stb_f4_origin","targetname");
	stb_f6_origin = getEnt("stb_f6_origin","targetname");
	stb_f9_origin = getEnt("stb_f9_origin","targetname");

	
	while (1)
	{
		PlayFXOnTag( level.flamethrower_standby, stb_f1_origin , "tag_origin" ); //start the fx
		PlayFXOnTag( level.flamethrower_standby, stb_f4_origin , "tag_origin" );
		PlayFXOnTag( level.flamethrower_standby, stb_f6_origin , "tag_origin" );
		PlayFXOnTag( level.flamethrower_standby, stb_f9_origin , "tag_origin" );
		wait (6);
	}
}	

expl_wall() //sets up the fx, sound etc at the exploding wall
{
	trigger = getEnt( "expl_wall_trigger", "targetname" ); //trigger used to activate
	brush = getEnt( "expl_wall", "targetname" ); 
	tnt_1 = getEnt( "tnt_1", "targetname" );
	tnt_2 = getEnt( "tnt_2", "targetname" );
	tnt_3 = getEnt( "tnt_3", "targetname" );
	shelltrigger = getEnt( "shellshock_door", "targetname" );
	c4_click = getEnt( "c4_click", "targetname" );
	expl_wall_origin = getEnt("expl_wall_origin","targetname"); //script_model used to play the fx
	expl_wall_sound = getEnt( "expl_wall_sound", "targetname" ); //script_origin used to play sound
	expl_wall_hurt = getent ("expl_wall_hurt","targetname");//damage trigger used to kill the player if trap= activated
	expl_wall_hurt maps\mp\_utility::triggerOff(); //disable the dmg trigger

	
	trigger waittill ("trigger", who);
	trigger delete (); //delete the activation trigger if once activated
	
		wait(0.25);
		c4_click playsound ("weap_detpack_trigger"); //start the sound	
		wait(0.65);
		Earthquake( 0.5, 3, (-31,25200,463), 700 );
		PlayFXOnTag( level.wall_explosion_grnd, expl_wall_origin , "tag_origin" ); //start the fx
		expl_wall_sound playsound ("door_expl"); //start the sound
		wait(0.1);
		thread shellshock_door_trig();
		wait(0.1);
		tnt_1 delete();
		tnt_2 delete();
		tnt_3 delete();
		brush delete();
		expl_wall_hurt maps\mp\_utility::triggerOn();
		wait(0.15);
		expl_wall_hurt maps\mp\_utility::triggerOff();
		wait(1.5);
		thread shellshock_door_delete();
}


shellshock_door_trig() //creates a shellshock effect when standing by the door at the explosion or shortly after
{
    level endon("door_shell_delete");
    trigger = getent ("shellshock_door","targetname");
    for(;;)
    {
    trigger waittill( "trigger", player );
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
        {
        if(players[i] isTouching( trigger ) && isAlive( players[i] )  )
        {
            if(!isDefined (players[i].shelldoor))
            players[i].shelldoor=false;
            
            if(players[i].shelldoor==false)
            {
            players[i] thread shelldoor_func();
            }
        }
        }
    wait 0.1;
    }
}

shelldoor_func()
{
    if(!level.freeRun)
    {
    if(self.shelldoor==false)
    {
    self.shelldoor=true;
    self ShellShock("frag_grenade_mp", 3.5 );
    wait 5;
    self.shelldoor=false;
    }
    }
}

shellshock_door_delete() //delete the trigger after the fog is gone so it will not activate anymore
{
    level notify("door_shell_delete");
    trigger = getent ("shellshock_door","targetname");    
    trigger delete();
//	iPrintlnbold ("gastrigdeleted");
}   


c4_blink_activate() //activates the blinking and beeping at the c4 trap
{
	c4_blink_1 = getEnt("c4_blink_1","targetname"); //fx for trap 06
	c4_blink_2 = getEnt("c4_blink_2","targetname");
	c4_blink_3 = getEnt("c4_blink_3","targetname");
	c4_blink_4 = getEnt("c4_blink_4","targetname");
	c4_blink_5 = getEnt("c4_blink_5","targetname");
	c4_blink_6 = getEnt("c4_blink_6","targetname");
	c4_blink_7 = getEnt("c4_blink_7","targetname");
	c4_blink_8 = getEnt("c4_blink_8","targetname");
	c4_blink_9 = getEnt("c4_blink_9","targetname");		
	
	c4_beep1 = getEnt("c4_beep_1","targetname");
	c4_beep2 = getEnt("c4_beep_2","targetname");
	
//	trigger waittill ("trigger", who);
//	trigger delete (); //delete the activation trigger if once activated

			PlayFXOnTag( level.c4_blink, c4_blink_1 , "tag_origin" );			//fx for trap 06
			PlayFXOnTag( level.c4_blink, c4_blink_2 , "tag_origin" ); 
			PlayFXOnTag( level.c4_blink, c4_blink_3 , "tag_origin" );
			wait (.15);
			PlayFXOnTag( level.c4_blink, c4_blink_4 , "tag_origin" ); 
			PlayFXOnTag( level.c4_blink, c4_blink_5 , "tag_origin" ); 
			PlayFXOnTag( level.c4_blink, c4_blink_6 , "tag_origin" ); 
			wait (.15);
			PlayFXOnTag( level.c4_blink, c4_blink_7 , "tag_origin" ); 
			PlayFXOnTag( level.c4_blink, c4_blink_8 , "tag_origin" ); 
			wait (.15);
			PlayFXOnTag( level.c4_blink, c4_blink_9 , "tag_origin" ); 
			c4_beep1 playloopsound ("c4_beep"); //plays a sound
			c4_beep2 playloopsound ("c4_beep");
			
}

moron_button() //Secret that calls you a moron
{
	self endon("disconnect");
	self endon("death");
	trigger = getent ("moron_button_trigger","targetname"); //trigger_use_touch
	buttonsound = getent ("buttonsound","targetname"); //plays the sound at the button
	text = randomInt(5);
    switch(text)
            {
            case 0:
            trigger SetHintString( "Press ^3[USE] ^7to gain an extra life!" );
            break;
            case 1:
            trigger SetHintString( "Press ^3[USE] ^7to get teleported to the finish!" );
            break;
            case 2:
            trigger SetHintString( "Press ^3[USE] ^7to enable GodMode!" );
            break;
            case 3:
            trigger SetHintString( "Press ^3[USE] ^7to change to the next map!" );
            break;
            case 4:
            trigger SetHintString( "Press ^3[USE] ^7to enable noclip" );
            break;
            }

	trigger waittill ("trigger", player); //the following lines activate after the user presses f @ the trigger
	trigger delete (); //we can only use the trigger once
	

	
	wait(.5);
	buttonsound playsound ("Look_at_that"); //plays a sound
	wait(2);
	iprintln("^1"+ player.name + " "+ "^7really pressed that mysterious button...");
	texttoplayer = randomInt(3);
	switch(texttoplayer)
            {
            case 0:
			player iprintlnBold ("Could you carry that for me? Thanks!");
            break;
            case 1:
			player iprintlnBold ("Bad idea buddy...");
            break;
            case 2:
			player iprintlnBold ("You REALLY want me to shoot you in the leg??? Okay then.");
            break;
            }
			
	player setMoveSpeedScale(0.4); //slows the player down
	player allowjump(false); //no jumping anymore
	wait (5); //waits 1 min
	sayall = randomInt(5);
    switch(sayall)
            {
            case 0:
			player sayall ("Guys, can someone carry me? My legs are getting tired.");
            break;
            case 1:
			player sayall ("Shit, that is one heavy backpack!");
            break;
            case 2:
			player sayall ("I'm feeling a bit dizzy...");
            break;
            case 3:
			player sayall ("Mommy, my legs hurt.");
            break;
            case 4:
			player sayall ("I am speed!");
            break;
            }
	wait (42); //waits 1 min
	player iprintlnBold ("Enough of that, I am not a monster :)");
	wait (3);
	player setMoveSpeedScale(1.05); //resets the punishments
	player allowjump(true);
}

teddy() //Secret, shooting the teddy will trigger this one (no knifes and no explosives)
{
	trigger = getent ("teddy_trig","targetname"); //trigger_damage
	teddysound = getent ("teddy","targetname"); //plays the sound at the teddy

	trigger waittill ("trigger"); //the following lines activate after the player shoots the trigger
	trigger delete (); //we can only use the trigger once
	
	teddyactivate = randomInt(3); //33% chance
    switch(teddyactivate)
            {
            case 0:
			PlayFX( level.teddy_blood_hit, (-653,8995,529) );
			wait(.1);
			teddysound playsound ("teddy_wound"); //plays a sound
			wait(1);
			PlayFX( level.teddy_blood, (-656,8990,524) );
			teddysound playsound ("teddy_death"); //plays a sound
            break;
            case 1:
            break;
			case 2:
            break;
            }
}

teleport_1() //teleports of the activator
{    
    trig = getent ("teleporttrig_1","targetname");    
    targ = getent("teleport_target1", "targetname");  
    handle = getent("telehandle_1", "targetname");    
    greenlight_fx_origin = getent("tele_green_1", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//		iprintln ("endroom ^1NOW"); //used to debug
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
        handle rotatePitch(-170, 0.75, 0.1, 0.1);
        wait (.75);
        PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
        handle PlaySound ("breaker");
        wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
            PlayFX( level.smoke_tele, (2310,4917,586));
            player playlocalsound ("quote");
    //        }
        }
    wait 0.05;
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}


teleport_2()
{    
    trig = getent ("teleporttrig_2","targetname");    
    targ = getent("teleport_target2", "targetname");  
    handle = getent("telehandle_2", "targetname");    
	greenlight_fx_origin = getent("tele_green_2", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (-24,8499,782));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}

teleport_3()
{    
    trig = getent ("teleporttrig_3","targetname");    
    targ = getent("teleport_target3", "targetname");  
    handle = getent("telehandle_3", "targetname");    
	greenlight_fx_origin = getent("tele_green_3", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();	
		level.finaltp_trig5 maps\mp\_utility::triggerOff();		
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (-977,9677,858));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}

teleport_4()
{    
    trig = getent ("teleporttrig_4","targetname");    
    targ = getent("teleport_target4", "targetname");  
    handle = getent("telehandle_4", "targetname");    
	greenlight_fx_origin = getent("tele_green_4", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (318,13359,428));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}

teleport_5()
{    
    trig = getent ("teleporttrig_5","targetname");    
    targ = getent("teleport_target5", "targetname");  
    handle = getent("telehandle_5", "targetname");    
	greenlight_fx_origin = getent("tele_green_5", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		thread c4_blink_activate();
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (-210,17341,492));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}

teleport_6()
{    
    trig = getent ("teleporttrig_6","targetname");    
    targ = getent("teleport_target6", "targetname");  
    handle = getent("telehandle_6", "targetname");    
	greenlight_fx_origin = getent("tele_green_6", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (121,21701,957));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}

teleport_7()
{    
    trig = getent ("teleporttrig_7","targetname");    
    targ = getent("teleport_target7", "targetname");  
    handle = getent("telehandle_7", "targetname");    
	greenlight_fx_origin = getent("tele_green_7", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (552,24701,1005));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}


teleport_8()
{    
    trig = getent ("teleporttrig_8","targetname");    
    targ = getent("teleport_target8", "targetname");  
    handle = getent("telehandle_8", "targetname");    
	greenlight_fx_origin = getent("tele_green_8", "targetname");    

    for(;;)
    {
    trig waittill("trigger",player);
//	iprintln ("endroom ^1NOW");
        level.finaltp_trig maps\mp\_utility::triggerOff();
        level.finaltp_trig2 maps\mp\_utility::triggerOff();
        level.finaltp_trig3 maps\mp\_utility::triggerOff();
        level.finaltp_trig4 maps\mp\_utility::triggerOff();
		level.finaltp_trig5 maps\mp\_utility::triggerOff();
		handle rotatePitch(-170, 0.75, 0.1, 0.1);
		wait (.75);
		PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
		handle PlaySound ("breaker");
		wait (1);
        if( player.pers["team"] != "spectator" )
        {
    //        if( player.pers["team"] == "axis" )
    //        {
            player setPlayerangles( targ.angles );
            player setOrigin( targ.origin );
			PlayFX( level.smoke_tele, (-247,26718,1005));
			player playlocalsound ("quote");
    //        }
        }
    wait 0.05;  
        level.finaltp_trig maps\mp\_utility::triggerOn();
        level.finaltp_trig2 maps\mp\_utility::triggerOn();
        level.finaltp_trig3 maps\mp\_utility::triggerOn();
        level.finaltp_trig4 maps\mp\_utility::triggerOn();
		level.finaltp_trig5 maps\mp\_utility::triggerOn();
    }
wait 0.05;
}



reverb_cave() //plays a reverb effect in the cave, thanks to Erik and Speedex for the dedication at this script, i would have scrapped it long ago lol
{
    trigger = getEnt( "reverb_cave_enter", "targetname" );

    while(true)
    {
    trigger waittill( "trigger", player );
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)
    {
        if(players[i] isTouching( trigger ) && isAlive( players[i] )  )
        {
        players[i] thread reverb_loop();
        }
    }
    wait 0.5;
    }
    wait 1;
}


reverb_loop()
{
self endon("death");
self endon("disconnect");
self endon("joined_spectators");
self endon("stop_reverb");

self.reverb=true;
//self sayall("i am reverbing");
for(;;)
{
self setReverb("snd_enveffectsprio_level", "cave", 0.85, .45, 2);
wait 2;
}
wait 1;
}

reverb_cave_deactivate()
{
    trigger = getEnt( "reverb_cave_deactivate", "targetname" );

    for(;;)
    {
    trigger waittill( "trigger", player );
    players = getentarray("player", "classname");
    for(i=0;i<players.size;i++)
    {
        if(players[i] isTouching( trigger ) && isAlive( players[i] ) && isDefined( player.reverb ) && player.reverb == true )
        {
        players[i].reverb=false;
 //       players[i] sayall ("i am deactivating reverbing");
        players[i] setReverb("snd_enveffectsprio_level", "room", 0.5, 0, 2);
        players[i] notify("stop_reverb");
        }
    }
    wait 0.5;
    }
    wait 1;
}

slicer_1() //slicers at the end of endroom 2fast4you
{
	brush = getent("slicer_1","targetname");
	dmg1 = getent ("slicer_dmg_1","targetname");

	dmg1 enablelinkto();
	dmg1 linkto(brush);


	while(1)
	{
		brush movex( -400, 2 );
		brush waittill ("movedone");
		wait (.5);
		brush movex( 400, 1 );
		brush waittill ("movedone");
		wait (.5);
	}

}

slicer_2()
{
	brush = getent("slicer_2","targetname");
	dmg2 = getent ("slicer_dmg_2","targetname");

	dmg2 enablelinkto();
	dmg2 linkto(brush);
	
	while(1)
	{
		brush movex( 400, 2 );
		brush waittill ("movedone");
		wait (.5);
		brush movex( -400, 1 );
		brush waittill ("movedone");
		wait (.5);
	}
	
}


/////////////////////////////////
//////////////TRAPS//////////////
/////////////////////////////////


trap_01() //Lighting Trap
{
	trig = getent ("trigger1","targetname");
	dmg = getent ("trap01_dmg","targetname");
	sound =	getent("lightning_sound","targetname");

	dmg maps\mp\_utility::triggerOff();
	
	trig waittill( "trigger", player );
	trig PlaySound ("weap_detpack_trigger");
	trig delete(); 
	

	dmg maps\mp\_utility::triggerOn();	

	PlayFX( level.lightning_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_fx, (0,340,500) );
	PlayFX( level.lightning_fx, (-179,525,500) );
	PlayFX( level.lightning_fx, (174,340,500) );
	PlayFX( level.lightning_fx, (174,55,500) );
	PlayFX( level.lightning_fx, (-178,55,500) );

	wait 1+RandomFloat(2);

	PlayFX( level.lightning_pink_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_pink_fx, (0,340,500) );
	PlayFX( level.lightning_pink_fx, (-179,525,500) );
	PlayFX( level.lightning_pink_fx, (174,340,500) );
	PlayFX( level.lightning_pink_fx, (174,55,500) );
	PlayFX( level.lightning_pink_fx, (-178,55,500) );

	wait 1+RandomFloat(2);

	PlayFX( level.lightning_green_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_green_fx, (0,340,500) );
	PlayFX( level.lightning_green_fx, (-179,525,500) );
	PlayFX( level.lightning_green_fx, (174,340,500) );
	PlayFX( level.lightning_green_fx, (174,55,500) );
	PlayFX( level.lightning_green_fx, (-178,55,500) );

	wait 1+RandomFloat(2);

	PlayFX( level.lightning_pink_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_pink_fx, (0,340,500) );
	PlayFX( level.lightning_pink_fx, (-179,525,500) );
	PlayFX( level.lightning_pink_fx, (174,340,500) );
	PlayFX( level.lightning_pink_fx, (174,55,500) );
	PlayFX( level.lightning_pink_fx, (-178,55,500) );

	wait 1+RandomFloat(2);

	PlayFX( level.lightning_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_fx, (0,340,500) );
	PlayFX( level.lightning_fx, (-179,525,500) );
	PlayFX( level.lightning_fx, (174,340,500) );
	PlayFX( level.lightning_fx, (174,55,500) );
	PlayFX( level.lightning_fx, (-178,55,500) );


	wait 1+RandomFloat(2);
	
	
	PlayFX( level.lightning_pink_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_pink_fx, (0,340,500) );
	PlayFX( level.lightning_pink_fx, (-179,525,500) );
	PlayFX( level.lightning_pink_fx, (174,340,500) );
	PlayFX( level.lightning_pink_fx, (174,55,500) );
	PlayFX( level.lightning_pink_fx, (-178,55,500) );

	wait 1+RandomFloat(2);
	
	
	PlayFX( level.lightning_green_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_green_fx, (0,340,500) );
	PlayFX( level.lightning_green_fx, (-179,525,500) );
	PlayFX( level.lightning_green_fx, (174,340,500) );
	PlayFX( level.lightning_green_fx, (174,55,500) );
	PlayFX( level.lightning_green_fx, (-178,55,500) );

	wait 1+RandomFloat(3);
	
	PlayFX( level.lightning_fx, (0,238,500) );
		sound PlaySound ("lightning");
	PlayFX( level.lightning_fx, (0,340,500) );
	PlayFX( level.lightning_fx, (-179,525,500) );
	PlayFX( level.lightning_fx, (174,340,500) );
	PlayFX( level.lightning_fx, (174,55,500) );
	PlayFX( level.lightning_fx, (-178,55,500) );

	wait 1;
	
	dmg maps\mp\_utility::triggerOff();
	dmg delete();
	
}



movingpatterns()
{
	pat1 = getent("pat1","targetname");
	pat2 = getent("pat2","targetname");

	while(1)
		{
		pat1 movey( -112, 0.4 );
		pat1 waittill ("movedone");
		pat2 movey( 112, 0.4 );
		pat2 waittill ("movedone");
		wait(1);
		pat1 movey( 112, 0.4 );
		pat1 waittill ("movedone");
		pat2 movey( -112, 0.4 );
		pat2 waittill ("movedone");
		}
}


trap_02() //Airstrike Trap
{
	trig = getEnt("trigger2", "targetname");
	
	trig waittill("trigger", who );
	trig PlaySound ("weap_detpack_trigger");
	trig delete();
	
	x = (0,RandomInt(361),0);		//361 = 0-360
	for(i=0;i<6;i++)
	{
		thread StartAirstrike( x );
		wait 2+RandomFloat(2);
	}
}

StartAirstrike( direction )
{
	center = (1,4337,4500);
	x = (RandomIntRange(-1000,1000),RandomIntRange(-1000,1000),RandomIntRange(-50,50));
	startPos = center-AnglesToForward( direction )*18000+x;
	endPos = center+AnglesToForward( direction )*18000+x;
	
	jet = Spawn("script_model", startPos);
	jet SetModel("vehicle_mig29_desert");
	jet playLoopSound("veh_mig29_dist_loop");
	jet.angles = direction;
//	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_right" );
//	playfxontag( level.fx_airstrike_afterburner, jet, "tag_engine_left" );
//	playfxontag( level.fx_airstrike_contrail, jet, "tag_right_wingtip" );
//	playfxontag( level.fx_airstrike_contrail, jet, "tag_left_wingtip" );
	bomb = Spawn("script_model", jet.origin );
	bomb SetModel("projectile_cbu97_clusterbomb");
	bomb LinkTo( jet );
	
	flyTime = Distance( startPos, endPos ) / 7500;
	jet MoveTo( endPos, flytime, 0, 0 );
	wait flyTime/2;
	bomb thread ThrowBomb();
	wait flyTime/2;
	jet delete();
}

ThrowBomb()
{
	self UnLink();
	self RotatePitch( 90, 1.5 );
	
	trace = BulletTrace( self.origin, self.origin-(0,0,4500), false, self );
	flyTime = Distance( self.origin, trace["position"] ) / 1750;
	self MoveTo( trace["position"], flyTime, flyTime, 0 );
	
	wait flyTime;
	
	EarthQuake( 1.5, 1.5, trace["position"], 1000 );
	PlayFX( level.airstrike["explosion"], trace["position"] );
	PlayFX( level.airstrike["bomb"], self.origin );
	self PlaySound("artillery_impact");
	//DoRadiusDamage( trace["position"], 500, 1000, 50, self, self, "airstrike_mp");
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive( players[i] ) && Distance( trace["position"], players[i].origin) <= 700) 
			players[i] suicide();
	}
	wait 0.5;
	self PlaySound("exp_suitcase_bomb_main");
	self delete();

}


opengate_3() //following threads open a few doors
{
	trig = getEnt( "opentrigger3", "targetname" );
	door1 = getEnt( "door3_1", "targetname" );
	door2 = getEnt( "door3_2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	door1 movex( -42, 1 );
	door2 movex( 42, 1 );
	door1 PlaySound ("doorstonesmall");
	door2 PlaySound ("doorstonesmall");

}


opengate_4()
{
	trig = getEnt( "opentrigger4", "targetname" );
	door1 = getEnt( "door4_1", "targetname" );
	door2 = getEnt( "door4_2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	door1 movex( -59, 1 );
	door2 movex( 59, 1 );
	door1 PlaySound ("doorstonesmall");
	door2 PlaySound ("doorstonesmall");

}

opengate_5()
{
	trig = getEnt( "opentrigger5", "targetname" );
	door1 = getEnt( "door5_1", "targetname" );
	door2 = getEnt( "door5_2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	door1 movex( -42, 1 );
	door2 movex( 42, 1 );
	door1 PlaySound ("doorstonesmall");
	door2 PlaySound ("doorstonesmall");

}


opengate_6() //Gas Trap
{
	trigger = getEnt( "opentrigger_6", "targetname" );
	door = getEnt( "gas_playerdoor", "targetname" );
	gasclip = getEnt( "gas_clip", "targetname" );

	trigger waittill( "trigger", who );
	trigger delete();

	wait (2.5);
	door PlaySound ("gateopen_slow");
	door movey( 3, .5 );
	wait (.5);
	door movez( -150, 7 );
	wait (5.5);
	gasclip delete();
}

opengate_7()
{
	trig = getEnt( "opentrigger7", "targetname" );
	door1 = getEnt( "door7_1", "targetname" );
	door2 = getEnt( "door7_2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	door1 movex( -42, 1 );
	door2 movex( 42, 1 );
	door1 PlaySound ("doorstonesmall");
	door2 PlaySound ("doorstonesmall");

}


trap_03() //flamethrower trap
{
	trigger = getEnt( "trigger3", "targetname" );
	random = randomint(4); //randomint to choose from the cases
	f1_origin = getEnt("f1_origin","targetname"); //script_model used to play the fx and sound
	f2_origin = getEnt("f2_origin","targetname");
	f3_origin = getEnt("f3_origin","targetname");
	f4_origin = getEnt("f4_origin","targetname");
	f5_origin = getEnt("f5_origin","targetname");
	f6_origin = getEnt("f6_origin","targetname");
	f7_origin = getEnt("f7_origin","targetname");
	f8_origin = getEnt("f8_origin","targetname");
	f9_origin = getEnt("f9_origin","targetname");
	f10_origin = getEnt("f10_origin","targetname");
	flamedmg1 = getent ("flamedmg1","targetname");//damage trigger used to kill the player if trap= activated
	flamedmg2 = getent ("flamedmg2","targetname");
	flamedmg3 = getent ("flamedmg3","targetname");
	flamedmg4 = getent ("flamedmg4","targetname");
	flamedmg5 = getent ("flamedmg5","targetname");
	flamedmg6 = getent ("flamedmg6","targetname");
	flamedmg7 = getent ("flamedmg7","targetname");
	flamedmg8 = getent ("flamedmg8","targetname");
	flamedmg9 = getent ("flamedmg9","targetname");
	flamedmg10 = getent ("flamedmg10","targetname");
	flamedmg1 maps\mp\_utility::triggerOff(); //disable the dmg trigger
	flamedmg2 maps\mp\_utility::triggerOff(); 
	flamedmg3 maps\mp\_utility::triggerOff(); 
	flamedmg4 maps\mp\_utility::triggerOff(); 
	flamedmg5 maps\mp\_utility::triggerOff(); 
	flamedmg6 maps\mp\_utility::triggerOff(); 
	flamedmg7 maps\mp\_utility::triggerOff(); 
	flamedmg8 maps\mp\_utility::triggerOff(); 
	flamedmg9 maps\mp\_utility::triggerOff(); 
	flamedmg10 maps\mp\_utility::triggerOff(); 
		
	trigger waittill ("trigger");
	trigger PlaySound ("weap_detpack_trigger");
	trigger delete (); //delete the activation trigger if once activated
	wait(0.5);
	

	switch(random)
	{
		case 0:
//	iPrintln("case0");
			PlayFXOnTag( level.flamethrower_trap, f3_origin , "tag_origin" ); //start the fx
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f1_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f7_origin , "tag_origin" );
			f3_origin playsound ("flamethrower_trap_sound"); //start the sound	
			f6_origin playsound ("flamethrower_trap_sound");
			f1_origin playsound ("flamethrower_trap_sound");
			f7_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg3 maps\mp\_utility::triggerOn(); //enable the dmg trigger
			flamedmg6 maps\mp\_utility::triggerOn();
			flamedmg1 maps\mp\_utility::triggerOn();
			flamedmg7 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg3 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg1 maps\mp\_utility::triggerOff(); 
			flamedmg7 maps\mp\_utility::triggerOff(); 
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f9_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f2_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f3_origin , "tag_origin" );
			f9_origin playsound ("flamethrower_trap_sound");
			f6_origin playsound ("flamethrower_trap_sound");
			f2_origin playsound ("flamethrower_trap_sound");
			f3_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg9 maps\mp\_utility::triggerOn();
			flamedmg6 maps\mp\_utility::triggerOn();
			flamedmg2 maps\mp\_utility::triggerOn();
			flamedmg3 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg9 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg2 maps\mp\_utility::triggerOff(); 
			flamedmg3 maps\mp\_utility::triggerOff();	
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f1_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f2_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f9_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f10_origin , "tag_origin" );
			f1_origin playsound ("flamethrower_trap_sound");
			f2_origin playsound ("flamethrower_trap_sound");
			f9_origin playsound ("flamethrower_trap_sound");
			f10_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg1 maps\mp\_utility::triggerOn();
			flamedmg2 maps\mp\_utility::triggerOn();
			flamedmg9 maps\mp\_utility::triggerOn();
			flamedmg10 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg1 maps\mp\_utility::triggerOff(); 
			flamedmg2 maps\mp\_utility::triggerOff(); 
			flamedmg9 maps\mp\_utility::triggerOff(); 
			flamedmg10 maps\mp\_utility::triggerOff();	
		break;
				
		case 1:	
//	iPrintln("case1");
			PlayFXOnTag( level.flamethrower_trap, f5_origin , "tag_origin" ); //start the fx
			PlayFXOnTag( level.flamethrower_trap, f8_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f2_origin , "tag_origin" );
			f5_origin playsound ("flamethrower_trap_sound"); //start the sound	
			f8_origin playsound ("flamethrower_trap_sound");
			f6_origin playsound ("flamethrower_trap_sound");
			f2_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg5 maps\mp\_utility::triggerOn(); //enable the dmg trigger
			flamedmg8 maps\mp\_utility::triggerOn();
			flamedmg6 maps\mp\_utility::triggerOn();
			flamedmg2 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg5 maps\mp\_utility::triggerOff(); 
			flamedmg8 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg2 maps\mp\_utility::triggerOff(); 
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f3_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f5_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f7_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f9_origin , "tag_origin" );
			f3_origin playsound ("flamethrower_trap_sound");
			f5_origin playsound ("flamethrower_trap_sound");
			f7_origin playsound ("flamethrower_trap_sound");
			f9_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg3 maps\mp\_utility::triggerOn();
			flamedmg5 maps\mp\_utility::triggerOn();
			flamedmg7 maps\mp\_utility::triggerOn();
			flamedmg9 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg3 maps\mp\_utility::triggerOff(); 
			flamedmg5 maps\mp\_utility::triggerOff(); 
			flamedmg7 maps\mp\_utility::triggerOff(); 
			flamedmg9 maps\mp\_utility::triggerOff();
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f4_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f1_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f8_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			f4_origin playsound ("flamethrower_trap_sound");
			f1_origin playsound ("flamethrower_trap_sound");
			f8_origin playsound ("flamethrower_trap_sound");
			f6_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg4 maps\mp\_utility::triggerOn();
			flamedmg1 maps\mp\_utility::triggerOn();
			flamedmg8 maps\mp\_utility::triggerOn();
			flamedmg6 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg4 maps\mp\_utility::triggerOff(); 
			flamedmg1 maps\mp\_utility::triggerOff(); 
			flamedmg8 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff();
		break;
			
			case 2:	
//	iPrintln("case2");
			PlayFXOnTag( level.flamethrower_trap, f1_origin , "tag_origin" ); //start the fx
			PlayFXOnTag( level.flamethrower_trap, f3_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f5_origin , "tag_origin" );
			f1_origin playsound ("flamethrower_trap_sound"); //start the sound	
			f3_origin playsound ("flamethrower_trap_sound");
			f5_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg1 maps\mp\_utility::triggerOn(); //enable the dmg trigger
			flamedmg3 maps\mp\_utility::triggerOn();
			flamedmg5 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg1 maps\mp\_utility::triggerOff(); 
			flamedmg3 maps\mp\_utility::triggerOff(); 
			flamedmg5 maps\mp\_utility::triggerOff(); 
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" ); //start the fx
			PlayFXOnTag( level.flamethrower_trap, f8_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f10_origin , "tag_origin" );
			f6_origin playsound ("flamethrower_trap_sound"); //start the sound	
			f8_origin playsound ("flamethrower_trap_sound");
			f10_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg6 maps\mp\_utility::triggerOn(); //enable the dmg trigger
			flamedmg8 maps\mp\_utility::triggerOn();
			flamedmg10 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg8 maps\mp\_utility::triggerOff(); 
			flamedmg10 maps\mp\_utility::triggerOff(); 
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f1_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f5_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f10_origin , "tag_origin" );
			f1_origin playsound ("flamethrower_trap_sound");
			f5_origin playsound ("flamethrower_trap_sound");
			f6_origin playsound ("flamethrower_trap_sound");
			f10_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg1 maps\mp\_utility::triggerOn();
			flamedmg5 maps\mp\_utility::triggerOn();
			flamedmg6 maps\mp\_utility::triggerOn();
			flamedmg10 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg1 maps\mp\_utility::triggerOff(); 
			flamedmg5 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg10 maps\mp\_utility::triggerOff();
		break;
			
			case 3:	
//	iPrintln("case3");
			PlayFXOnTag( level.flamethrower_trap, f4_origin , "tag_origin" ); //start the fx
			PlayFXOnTag( level.flamethrower_trap, f2_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f6_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f7_origin , "tag_origin" );
			f4_origin playsound ("flamethrower_trap_sound"); //start the sound	
			f2_origin playsound ("flamethrower_trap_sound");
			f6_origin playsound ("flamethrower_trap_sound");
			f7_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg4 maps\mp\_utility::triggerOn(); //enable the dmg trigger
			flamedmg2 maps\mp\_utility::triggerOn();
			flamedmg6 maps\mp\_utility::triggerOn();
			flamedmg7 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg4 maps\mp\_utility::triggerOff(); 
			flamedmg2 maps\mp\_utility::triggerOff(); 
			flamedmg6 maps\mp\_utility::triggerOff(); 
			flamedmg7 maps\mp\_utility::triggerOff(); 
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f3_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f7_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f8_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f10_origin , "tag_origin" );
			f3_origin playsound ("flamethrower_trap_sound");
			f7_origin playsound ("flamethrower_trap_sound");
			f8_origin playsound ("flamethrower_trap_sound");
			f10_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg3 maps\mp\_utility::triggerOn();
			flamedmg7 maps\mp\_utility::triggerOn();
			flamedmg8 maps\mp\_utility::triggerOn();
			flamedmg10 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg3 maps\mp\_utility::triggerOff(); 
			flamedmg7 maps\mp\_utility::triggerOff(); 
			flamedmg8 maps\mp\_utility::triggerOff(); 
			flamedmg10 maps\mp\_utility::triggerOff();
			
				wait randomIntRange(3,10); 

			PlayFXOnTag( level.flamethrower_trap, f2_origin , "tag_origin" ); 
			PlayFXOnTag( level.flamethrower_trap, f4_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f5_origin , "tag_origin" );
			PlayFXOnTag( level.flamethrower_trap, f9_origin , "tag_origin" );
			f2_origin playsound ("flamethrower_trap_sound");
			f4_origin playsound ("flamethrower_trap_sound");
			f5_origin playsound ("flamethrower_trap_sound");
			f9_origin playsound ("flamethrower_trap_sound");

			wait (.25);
			flamedmg2 maps\mp\_utility::triggerOn();
			flamedmg4 maps\mp\_utility::triggerOn();
			flamedmg5 maps\mp\_utility::triggerOn();
			flamedmg9 maps\mp\_utility::triggerOn();
			wait (3);
			flamedmg2 maps\mp\_utility::triggerOff(); 
			flamedmg4 maps\mp\_utility::triggerOff(); 
			flamedmg5 maps\mp\_utility::triggerOff(); 
			flamedmg9 maps\mp\_utility::triggerOff();
		
		
		default: return;
	}
}

trap_04() //swimming pool electroshock trap
{
	trigger = getent ("trigger4","targetname"); //trigger used to activate the trap
	dmg = getent ("trigger_dmg_4","targetname"); //damage trigger used to kill the player if trap= activated
	sparksound = getent ("sparksound","targetname"); //used to play the sound
	generator = getent ("generator","targetname"); //used to play the sound
	dmg maps\mp\_utility::triggerOff(); //disable the dmg trigger
	
	trigger waittill ("trigger");
	trigger PlaySound ("weap_detpack_trigger");
	trigger delete (); //delete the activation trigger if once activated
	
	generator playsound ("compressor"); //start the generator sound
	playFX( level.car_damage_blacksmoke, (737,9941,585) ); //play smoke fx
	
	wait(0.5);
	
	dmg maps\mp\_utility::triggerOn(); //enable the dmg trigger
	sparksound playsound ("sparksound"); //start the spark sound
		playFX( level.lightning_serious, (320,9686,490) ); //play lightning fx
		playFX( level.lightning_serious, (-320,9686,490) ); 
		playFX( level.lightning_serious_origin, (426,9857,490) ); //play lightning origin fx at cable end
		playFX( level.sparks_small, (420,9855,490) );
	wait(16.5);
	dmg maps\mp\_utility::triggerOff(); //disable the dmg trigger
}


trap_05() //crusher trap
{
	trigger = getent ("trigger5","targetname");
	random = randomint(4);
	brush1 = getent("smash1","targetname");
	brush2 = getent("smash2","targetname");
	brush3 = getent("smash3","targetname");
	brush4 = getent("smash4","targetname");
	brush5 = getent("smash5","targetname");
	dmg1 = getent ("dmg_smash1","targetname");
	dmg2 = getent ("dmg_smash2","targetname");
	dmg3 = getent ("dmg_smash3","targetname");
	dmg4 = getent ("dmg_smash4","targetname");
	dmg5 = getent ("dmg_smash5","targetname");

	trigger waittill ("trigger", who);
	trigger PlaySound ("weap_detpack_trigger");
	trigger delete ();

	dmg1 enablelinkto();
	dmg1 linkto(brush1);
	dmg2 enablelinkto();
	dmg2 linkto(brush2);
	dmg3 enablelinkto();
	dmg3 linkto(brush3);
	dmg4 enablelinkto();
	dmg4 linkto(brush4);
	dmg5 enablelinkto();
	dmg5 linkto(brush5);


	switch(random)
	{
		case 0:
	
			while(1)
			{
			brush1 movez( -300, 0.4 );
			brush1 PlaySound ("stoneimpact");
			brush1 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,12936,422), 400 );
			PlayFX( level.trap_dust, (-34,12936,425) );
			
			wait randomIntRange(0,4); 
			
			brush1 movez( 300, 2 );
			brush1 PlaySound ("stonemove");
			
			brush2 movez( -300, 0.4 );
			brush2 PlaySound ("stoneimpact");
			brush2 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13112,422), 400 );
			PlayFX( level.trap_dust, (-34,13112,425) );

			wait randomIntRange(0,4); 
			
			brush2 movez( 300, 2 );
			brush2 PlaySound ("stonemove");
			
			brush3 movez( -300, 0.4 );
			brush3 PlaySound ("stoneimpact");
			brush3 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13291,422), 400 );
			PlayFX( level.trap_dust, (-34,13291,425) );
			
			wait randomIntRange(0,4); 
			
			brush3 movez( 300, 2 );
			brush3 PlaySound ("stonemove");
			
			brush4 movez( -300, 0.4 );
			brush4 PlaySound ("stoneimpact");
			brush4 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13498,422), 400 );
			PlayFX( level.trap_dust, (-34,13498,425) );
			
			wait randomIntRange(0,4); 
			
			brush4 movez( 300, 2 );
			brush4 PlaySound ("stonemove");
			
			brush5 movez( -300, 0.4 );
			brush5 PlaySound ("stoneimpact");
			brush5 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13675,422), 400 );
			PlayFX( level.trap_dust, (-34,13675,425) );
			
			wait randomIntRange(0,4); 
			
			brush5 movez( 300, 2 );
			brush5 PlaySound ("stonemove");
			}
		            break;
		case 1:
		
			while(1)
			{
			brush3 movez( -300, 0.4 );
			brush3 PlaySound ("stoneimpact");
			brush3 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13291,422), 400 );
			PlayFX( level.trap_dust, (-34,13291,425) );
			
			wait randomIntRange(0,4); 
			
			brush3 movez( 300, 2 );
			brush3 PlaySound ("stonemove");
			
			brush1 movez( -300, 0.4 );
			brush1 PlaySound ("stoneimpact");
			brush1 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,12936,422), 400 );
			PlayFX( level.trap_dust, (-34,12936,425) );

			wait randomIntRange(0,4); 
			
			brush1 movez( 300, 2 );
			brush1 PlaySound ("stonemove");
			
			brush2 movez( -300, 0.4 );
			brush2 PlaySound ("stoneimpact");
			brush2 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13112,422), 400 );
			PlayFX( level.trap_dust, (-34,13112,425) );
			
			wait randomIntRange(0,4); 
			
			brush2 movez( 300, 2 );
			brush2 PlaySound ("stonemove");
			
			brush5 movez( -300, 0.4 );
			brush5 PlaySound ("stoneimpact");
			brush5 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13675,422), 400 );
			PlayFX( level.trap_dust, (-34,13675,425) );
			
			wait randomIntRange(0,4); 
			
			brush5 movez( 300, 2 );
			brush5 PlaySound ("stonemove");
			
			brush4 movez( -300, 0.4 );
			brush4 PlaySound ("stoneimpact");
			brush4 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13498,422), 400 );
			PlayFX( level.trap_dust, (-34,13498,425) );
			
			wait randomIntRange(0,4); 
			
			brush4 movez( 300, 2 );
			brush4 PlaySound ("stonemove");
			}
		            break;	
		case 2:
		
			while(1)
			{

			brush5 movez( -300, 0.4 );
			brush5 PlaySound ("stoneimpact");
			brush5 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13675,422), 400 );
			PlayFX( level.trap_dust, (-34,13675,425) );
			
			wait randomIntRange(0,4); 
			
			brush5 movez( 300, 2 );
			brush5 PlaySound ("stonemove");
			
			brush4 movez( -300, 0.4 );
			brush4 PlaySound ("stoneimpact");
			brush4 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13498,422), 400 );
			PlayFX( level.trap_dust, (-34,13498,425) );
			
			wait randomIntRange(0,4); 
			
			brush4 movez( 300, 2 );
			brush4 PlaySound ("stonemove");
			
			brush3 movez( -300, 0.4 );
			brush3 PlaySound ("stoneimpact");
			brush3 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13291,422), 400 );
			PlayFX( level.trap_dust, (-34,13291,425) );
			
			wait randomIntRange(0,4); 
			
			brush3 movez( 300, 2 );
			brush3 PlaySound ("stonemove");
			
			brush2 movez( -300, 0.4 );
			brush2 PlaySound ("stoneimpact");
			brush2 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,13112,422), 400 );
			PlayFX( level.trap_dust, (-34,13112,425) );
			
			wait randomIntRange(0,4); 
			
			brush2 movez( 300, 2 );
			brush2 PlaySound ("stonemove");
			
			brush1 movez( -300, 0.4 );
			brush1 PlaySound ("stoneimpact");
			brush1 waittill ("movedone");
			Earthquake( 0.3, 2, (-34,12936,422), 400 );
			PlayFX( level.trap_dust, (-34,12936,425) );

			wait randomIntRange(0,4); 
			
			brush1 movez( 300, 2 );
			brush1 PlaySound ("stonemove");
			}
			            break;
			case 3:
		
			while(1)
			{
            level.waittill_count = 2;        
            level.waittill_brush = 0;
			brush5 movez( -300, 0.4 );
			brush1 movez( -300, 0.4 );
			brush5 PlaySound ("stoneimpact");
			brush1 PlaySound ("stoneimpact");
			brush5 thread waittill_brush();
			brush1 thread waittill_brush();
			level waittill ("movedone_brush");
			Earthquake( 0.3, 2, (-34,13675,422), 400 );
			Earthquake( 0.3, 2, (-34,12936,422), 400 );
			PlayFX( level.trap_dust, (-34,13675,425) );
			PlayFX( level.trap_dust, (-34,12936,425) );

			wait randomIntRange(3,4); 
			
            level.waittill_count = 2;        
            level.waittill_brush = 0;
			brush5 movez( 300, 2 );
			brush1 movez( 300, 2 );
			brush5 PlaySound ("stonemove");
			brush1 PlaySound ("stonemove");
			brush5 thread waittill_brush();
			brush1 thread waittill_brush();
			level waittill ("movedone_brush");
			
            level.waittill_count = 2;        
            level.waittill_brush = 0;
			brush4 movez( -300, 0.4 );
			brush2 movez( -300, 0.4 );
			brush4 PlaySound ("stoneimpact");
			brush2 PlaySound ("stoneimpact");
			brush4 thread waittill_brush();
			brush2 thread waittill_brush();
			level waittill ("movedone_brush");
			Earthquake( 0.3, 2, (-34,13498,422), 400 );
			Earthquake( 0.3, 2, (-34,13112,422), 400 );
			PlayFX( level.trap_dust, (-34,13498,425) );
			PlayFX( level.trap_dust, (-34,13112,425) );
			
			wait randomIntRange(3,4); 
			
            level.waittill_count = 2;        
            level.waittill_brush = 0;
			
			brush4 movez( 300, 2 );
			brush2 movez( 300, 2 );
			brush4 PlaySound ("stonemove");
			brush2 PlaySound ("stonemove");
			brush4 thread waittill_brush();
			brush2 thread waittill_brush();
			level waittill ("movedone_brush");
			
			
            level.waittill_count = 1;        
            level.waittill_brush = 0;
			brush3 movez( -300, 0.4 );
			brush3 PlaySound ("stoneimpact");
			brush3 thread waittill_brush();
			level waittill ("movedone_brush");
			Earthquake( 0.3, 2, (-34,13291,422), 400 );
			PlayFX( level.trap_dust, (-34,13291,425) );
			
			wait randomIntRange(3,4); 
			
            level.waittill_count = 1;        
            level.waittill_brush = 0;
			brush3 movez( 300, 2 );
			brush3 PlaySound ("stonemove");
			brush3 thread waittill_brush();
			level waittill ("movedone_brush");
			}
		
		default: return;
	}
}

//Thanks to ERIK
//fixes the waittills for two crushers
waittill_brush()
{
self waittill ("movedone");
level.waittill_brush++;
if(level.waittill_brush == level.waittill_count)
level notify ("movedone_brush");
}


trap_06() //c4 trap
{
	trig = getent ("trigger6","targetname");
	dmg1 = getent ("c4_dmg_1","targetname");
	dmg2 = getent ("c4_dmg_2","targetname");
	dmg3 = getent ("c4_dmg_3","targetname");
	dmg4 = getent ("c4_dmg_4","targetname");
	dmg5 = getent ("c4_dmg_5","targetname");
	dmg6 = getent ("c4_dmg_6","targetname");
	dmg7 = getent ("c4_dmg_7","targetname");
	dmg8 = getent ("c4_dmg_8","targetname");
	dmg9 = getent ("c4_dmg_9","targetname");
	c41 = getEnt( "c41", "targetname" );
	c42 = getEnt( "c42", "targetname" );
	c43 = getEnt( "c43", "targetname" );
	c44 = getEnt( "c44", "targetname" );
	c45 = getEnt( "c45", "targetname" );
	c46 = getEnt( "c46", "targetname" );
	c47 = getEnt( "c47", "targetname" );
	c48 = getEnt( "c48", "targetname" );
	c49 = getEnt( "c49", "targetname" );

	c4_blink_1 = getEnt("c4_blink_1","targetname");
	c4_blink_2 = getEnt("c4_blink_2","targetname");
	c4_blink_3 = getEnt("c4_blink_3","targetname");
	c4_blink_4 = getEnt("c4_blink_4","targetname");
	c4_blink_5 = getEnt("c4_blink_5","targetname");
	c4_blink_6 = getEnt("c4_blink_6","targetname");
	c4_blink_7 = getEnt("c4_blink_7","targetname");
	c4_blink_8 = getEnt("c4_blink_8","targetname");
	c4_blink_9 = getEnt("c4_blink_9","targetname");

	c4_beep1 = getEnt("c4_beep_1","targetname");
	c4_beep2 = getEnt("c4_beep_2","targetname");
	explode = randomint(5);
	
	
	dmg1 maps\mp\_utility::triggerOff();
	dmg2 maps\mp\_utility::triggerOff();
	dmg3 maps\mp\_utility::triggerOff();
	dmg4 maps\mp\_utility::triggerOff();
	dmg5 maps\mp\_utility::triggerOff();
	dmg6 maps\mp\_utility::triggerOff();
	dmg7 maps\mp\_utility::triggerOff();
	dmg8 maps\mp\_utility::triggerOff();	
	dmg9 maps\mp\_utility::triggerOff();	


	trig waittill( "trigger", player );
	trig PlaySound ("weap_detpack_trigger");
	trig delete();
	

	
	switch(explode)
	{
		case 0:
//					iprintlnBold ("case 0");
			c4_beep1 stopLoopSound();
			c4_beep2 stopLoopSound();
			wait 0.1 +RandomFloatRange(0.25, 0.5); //random wait
		
		 	c4_blink_1 delete();
			PlayFX( level.c4_fx, (-731,17173,405) ); //c41
			c41 PlaySound("c4");
			c41 delete();
			dmg1 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg1 maps\mp\_utility::triggerOff();	
			
			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_3 delete();
			PlayFX( level.c4_fx, (-740,17478,502) ); //c43
			c43 PlaySound("c4");
			c43 delete();
			dmg3 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg3 maps\mp\_utility::triggerOff();

			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_7 delete();
			PlayFX( level.c4_fx, (-442,17731,563) ); //c47
			c47 PlaySound("c4");
			c47 delete();
			dmg7 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg7 maps\mp\_utility::triggerOff();
			
			wait (1);
			
			c4_blink_2 delete();
			c4_blink_4 delete();
			c4_blink_5 delete();
			c4_blink_6 delete();
			c4_blink_8 delete();
			c4_blink_9 delete(); 
			break;
		case 1:
//					iprintlnBold ("case 1");
			c4_beep1 stopLoopSound();
			c4_beep2 stopLoopSound();
			wait 0.1 +RandomFloatRange(0.25, 0.5); //random wait
		
		 	c4_blink_2 delete();
			PlayFX( level.c4_fx, (-800,17271,489) ); //c42
			c42 PlaySound("c4");
			c42 delete();
			dmg2 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg2 maps\mp\_utility::triggerOff();	
			
			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_4 delete();
			PlayFX( level.c4_fx, (-521,17347,411) ); //c44
			c44 PlaySound("c4");
			c44 delete();
			dmg4 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg4 maps\mp\_utility::triggerOff();

			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_6 delete();
			PlayFX( level.c4_fx, (-225,17682,407) ); //c46
			c46 PlaySound("c4");
			c46 delete();
			dmg6 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg6 maps\mp\_utility::triggerOff();
			
			wait (1);
			
			c4_blink_1 delete();
			c4_blink_3 delete();
			c4_blink_5 delete();
			c4_blink_7 delete();
			c4_blink_8 delete();
			c4_blink_9 delete(); 
			break;
		case 2:
//					iprintlnBold ("case 2");
			c4_beep1 stopLoopSound(); 
			c4_beep2 stopLoopSound();
			wait 0.1 +RandomFloatRange(0.25, 0.5); //random wait
		
		 	c4_blink_9 delete();
			PlayFX( level.c4_fx, (-58,17808,406) ); //c49
			c49 PlaySound("c4");
			c49 delete();
			dmg9 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg9 maps\mp\_utility::triggerOff();	
			
			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_5 delete();
			PlayFX( level.c4_fx, (-590,17610,518) ); //c45
			c45 PlaySound("c4");
			c45 delete();
			dmg5 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg5 maps\mp\_utility::triggerOff();

			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_8 delete();
			PlayFX( level.c4_fx, (-226,17916,563) ); //c48
			c48 PlaySound("c4");
			c48 delete();
			dmg8 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg8 maps\mp\_utility::triggerOff();
			
			wait (1);
			
			c4_blink_1 delete();
			c4_blink_2 delete();
			c4_blink_3 delete();
			c4_blink_4 delete();
			c4_blink_6 delete();
			c4_blink_7 delete(); 
			break;
		case 3:
//				iprintlnBold ("case 3");
			c4_beep1 stopLoopSound();
			c4_beep2 stopLoopSound();
			wait 0.1 +RandomFloatRange(0.25, 0.5); //random wait
		
		 	c4_blink_6 delete();
			PlayFX( level.c4_fx, (-225,17682,407) ); //c46
			c46 PlaySound("c4");
			c46 delete();
			dmg6 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg6 maps\mp\_utility::triggerOff();	
			
			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_1 delete();
			PlayFX( level.c4_fx, (-731,17173,405) ); //c41
			c41 PlaySound("c4");
			c41 delete();
			dmg1 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg1 maps\mp\_utility::triggerOff();

			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_9 delete();
			PlayFX( level.c4_fx, (-58,17808,406) ); //c49
			c49 PlaySound("c4");
			c49 delete();
			dmg9 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg9 maps\mp\_utility::triggerOff();
			
			wait (1);
			
			c4_blink_2 delete();
			c4_blink_3 delete();
			c4_blink_4 delete();
			c4_blink_5 delete();
			c4_blink_7 delete(); 
			c4_blink_8 delete();
			break;
		case 4:
//			iprintlnBold ("case 4");
			c4_beep1 stopLoopSound(); 
			c4_beep2 stopLoopSound();
			wait 0.1 +RandomFloatRange(0.25, 0.5); //random wait
		
		 	c4_blink_4 delete();
			PlayFX( level.c4_fx, (-521,17347,411) ); //c44
			c44 PlaySound("c4");
			c44 delete();
			dmg4 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg4 maps\mp\_utility::triggerOff();	
			
			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_5 delete();
			PlayFX( level.c4_fx, (-590,17610,518) ); //c45
			c45 PlaySound("c4");
			c45 delete();
			dmg5 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg5 maps\mp\_utility::triggerOff();

			wait 0.1 +RandomFloatRange(0.25, 1); //random wait
		
		 	c4_blink_7 delete();
			PlayFX( level.c4_fx, (-442,17731,563) ); //c47
			c47 PlaySound("c4");
			c47 delete();
			dmg7 maps\mp\_utility::triggerOn();	
			wait (.1);
			dmg7 maps\mp\_utility::triggerOff();
			
			wait (1);
			
			c4_blink_1 delete();
			c4_blink_2 delete();
			c4_blink_3 delete();
			c4_blink_6 delete();
			c4_blink_8 delete();
			c4_blink_9 delete();
		    break;
	}



}



trap_07() //gas trap
{
	trigger = getent ("trigger7","targetname"); //trigger used to activate the trap
	gassound = getent ("gassound","targetname"); //used to play the sound
	shellshocktrigger = getent ("shellshocktrigger","targetname");	
	choketrigger = getent ("choke","targetname");	
	triggerhurt = getent ("gas_hurt","targetname");
	
		triggerhurt maps\mp\_utility::triggerOff();

	trigger waittill ("trigger");
	trigger PlaySound ("weap_detpack_trigger");
	trigger delete (); //delete the activation trigger if once activated
	
	thread platsgas();

	wait(1);
	
		gassound playsound ("smokegrenade_explode_default"); //start the sound
		playFX( level.gas_trap, (-257,21541,142) ); //play fx
		playFX( level.gas_trap, (-593,21541,142) ); 
		playFX( level.gas_trap, (87,21541,142) );
		playFX( level.gas_trap, (87,21862,142) );
		playFX( level.gas_trap, (-257,21862,142) );
		playFX( level.gas_trap, (-609,21862,142) );
		
	wait (2);
	thread shellshocktrigger();
	thread dmgtriggergas();
	wait (7);
	shellshocktrigger delete();
	choketrigger delete();

}


shellshocktrigger()
{
	trigger = getent ("shellshocktrigger","targetname");	
	choketrigger = getent ("choke","targetname");
	trigger waittill( "trigger", player );
	

		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
			
		if(players[i] isTouching( trigger )  && isAlive( players[i] )  )
		{
//			players[i] ShellShock("teargas", 13 );
			players[i] thread function_gas();
		}
		else
        {
        }	
}	


function_gas() // Thanks to Arfy!
{
  self endon("disconnect");
  self endon("death");
  self ShellShock("teargas", 10 );
//iprintln ("shellrunning");
  wait 0.1 +RandomFloatRange(1, 3); //random wait
  self  playLocalSound ("choke");
//  self sayall ("I choked!");
}




dmgtriggergas() //tries to create realistic damage to the player rather than killing him instantly
{
	trigger = getent ("gas_hurt","targetname");
	
//	trigger waittill( "trigger");
	
	trigger maps\mp\_utility::triggerOn();
	wait (.05);
	trigger maps\mp\_utility::triggerOff();
	
	wait (2.5);
	
	trigger maps\mp\_utility::triggerOn();
	wait (.05);
	trigger maps\mp\_utility::triggerOff();
	
	trigger maps\mp\_utility::triggerOn();
	wait (.05);
	trigger maps\mp\_utility::triggerOff();
	
	wait (2.5);
	
	trigger maps\mp\_utility::triggerOn();
	wait (.05);
	trigger maps\mp\_utility::triggerOff();
	
	wait (2.5);
	
	trigger maps\mp\_utility::triggerOn();
//	iprintln ("dmgdone");
}


platsgas() //moves the platforms down into the gas
{
	platsgas1 = getEnt( "platsgas1", "targetname" );
	platsgas2 = getEnt( "platsgas2", "targetname" );
	platsgas3 = getEnt( "platsgas3", "targetname" );
	platsgas4 = getEnt( "platsgas4", "targetname" );
	platsgas5 = getEnt( "platsgas5", "targetname" );
	platsgas6 = getEnt( "platsgas6", "targetname" );
	down = randomInt(7);
	
    switch(down)
            {
            case 0:
			platsgas1 movez (-480, 1);
			platsgas1 PlaySound ("doorstonesmall");
			platsgas4 movez (-480, 1);
			platsgas4 PlaySound ("doorstonesmall");
			wait (1.5);
			platsgas1 notSolid(); //if somehow something gets stuck, we bypass that by making the brush notsolid
			platsgas4 notSolid();
            break;
            case 1:
			platsgas2 movez (-480, 1);
			platsgas2 PlaySound ("doorstonesmall");
			platsgas5 movez (-480, 1);
			platsgas5 PlaySound ("doorstonesmall");
			platsgas2 notSolid();
			platsgas5 notSolid();
            break;
            case 2:
			platsgas6 movez (-480, 1);
			platsgas6 PlaySound ("doorstonesmall");
			platsgas3 movez (-480, 1);
			platsgas3 PlaySound ("doorstonesmall");
			platsgas6 notSolid();
			platsgas3 notSolid();
            break;
            case 3:
			platsgas1 movez (-480, 1);
			platsgas1 PlaySound ("doorstonesmall");
			platsgas6 movez (-480, 1);
			platsgas6 PlaySound ("doorstonesmall");
			platsgas1 notSolid();
			platsgas6 notSolid();
            break;
            case 4:
			platsgas2 movez (-480, 1);
			platsgas2 PlaySound ("doorstonesmall");
			platsgas3 movez (-480, 1);
			platsgas3 PlaySound ("doorstonesmall");
			platsgas2 notSolid();
			platsgas3 notSolid();
            break;
			case 5:
			platsgas4 movez (-480, 1);
			platsgas4 PlaySound ("doorstonesmall");
			platsgas6 movez (-480, 1);
			platsgas6 PlaySound ("doorstonesmall");
			platsgas4 notSolid();
			platsgas6 notSolid();
            break;
			case 6:
			platsgas2 movez (-480, 1);
			platsgas2 PlaySound ("doorstonesmall");
			platsgas4 movez (-480, 1);
			platsgas4 PlaySound ("doorstonesmall");
			platsgas2 notSolid();
			platsgas4 notSolid();
            break;
            }
}


trap_08() //acid blops2 trap
{
	trigger = getent ("trigger8","targetname"); //trigger used to activate the trap
	acidsound1 = getent ("acidsound1","targetname"); //used to play the sound	
	acidsound2 = getent ("acidsound2","targetname"); //used to play the sound	
	triggerhurt50 = getent ("acid_hurt50","targetname");
	triggerhurt30 = getent ("acid_hurt30","targetname");
	shell = getent ("acid_shell","targetname");	
	handle = getEnt("handle","targetname");
	triggerhurt30 maps\mp\_utility::triggerOff(); //turn the dmg triggers off
	triggerhurt50 maps\mp\_utility::triggerOff();
	
	a1_origin = getEnt("a1_origin","targetname"); //script_model used to play the fx
	a2_origin = getEnt("a2_origin","targetname"); 
	a3_origin = getEnt("a3_origin","targetname"); 
	a4_origin = getEnt("a4_origin","targetname");

	b1_origin = getEnt("b1_origin","targetname"); 
	b2_origin = getEnt("b2_origin","targetname"); 
	b3_origin = getEnt("b3_origin","targetname");
	b4_origin = getEnt("b4_origin","targetname");
	
	c1_origin = getEnt("c1_origin","targetname"); 
	c2_origin = getEnt("c2_origin","targetname"); 
	c3_origin = getEnt("c3_origin","targetname");
	c4_origin = getEnt("c4_origin","targetname");
	
	d1_origin = getEnt("d1_origin","targetname"); 
	d2_origin = getEnt("d2_origin","targetname"); 
	d3_origin = getEnt("d3_origin","targetname");
	d4_origin = getEnt("d4_origin","targetname");
	
	e1_origin = getEnt("e1_origin","targetname"); 
	e2_origin = getEnt("e2_origin","targetname"); 
	e3_origin = getEnt("e3_origin","targetname");
	e4_origin = getEnt("e4_origin","targetname");
	
	g1_origin = getEnt("g1_origin","targetname"); 
	g2_origin = getEnt("g2_origin","targetname"); 
	g3_origin = getEnt("g3_origin","targetname");
	g4_origin = getEnt("g4_origin","targetname");
	
	greenlight_fx_origin = getEnt("greenlight_fx_origin","targetname");


	trigger waittill ("trigger");
	trigger PlaySound ("weap_detpack_trigger");
	trigger delete (); //delete the activation trigger if once activated
	handle rotatePitch(-170, 1, 0.1, 0.1);
	wait (.4);
	PlayFXOnTag( level.greenlight_fx, greenlight_fx_origin , "tag_origin" ); //start the green light fx
	handle PlaySound ("breaker");
	
	wait (.1);
		acidsound1 playsound ("acidsound"); //start the sound
		acidsound2 playsound ("acidsound"); //start the sound

		PlayFXOnTag( level.acid_sprinklers, a1_origin , "tag_origin" ); //start the fx
		PlayFXOnTag( level.acid_sprinklers, a2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, a3_origin , "tag_origin" );

		PlayFXOnTag( level.acid_sprinklers, b1_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, b2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, b3_origin , "tag_origin" );
		
		PlayFXOnTag( level.acid_sprinklers, c1_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, c2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, c3_origin , "tag_origin" );
		
		PlayFXOnTag( level.acid_sprinklers, d1_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, d2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, d3_origin , "tag_origin" );
		
		PlayFXOnTag( level.acid_sprinklers, e1_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, e2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, e3_origin , "tag_origin" );
		
		PlayFXOnTag( level.acid_sprinklers, g1_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, g2_origin , "tag_origin" );
		PlayFXOnTag( level.acid_sprinklers, g3_origin , "tag_origin" );
		
		wait (1);
		thread acid_shell();
		wait (1);
		PlayFX( level.dead_acid, (-253,24778,432) );
		PlayFXOnTag( level.acid_pool, a4_origin , "tag_origin" ); //start the fx
		PlayFXOnTag( level.acid_pool, b4_origin , "tag_origin" );
		PlayFXOnTag( level.acid_pool, c4_origin , "tag_origin" );
		PlayFXOnTag( level.acid_pool, d4_origin , "tag_origin" );
		PlayFXOnTag( level.acid_pool, e4_origin , "tag_origin" );
		PlayFXOnTag( level.acid_pool, g4_origin , "tag_origin" );
		
		triggerhurt50 maps\mp\_utility::triggerOn();
		wait (0.01);
		triggerhurt50 maps\mp\_utility::triggerOff();
		wait (2);
		triggerhurt30 maps\mp\_utility::triggerOn();
		wait (0.01);
		triggerhurt30 maps\mp\_utility::triggerOff();
		wait (2);
		triggerhurt50 maps\mp\_utility::triggerOn();
		shell maps\mp\_utility::triggerOff();

		wait (7);
		triggerhurt50 maps\mp\_utility::triggerOff();		//deactivates the hurt trig
		wait (.5);
		thread acid_shell_delete();
		wait (.5);
		thread gas_sound();
//		iPrintlnbold ("gas sound active");
		wait (18);
//		iPrintlnbold ("waitover");
		thread gas_sound_delete();
}



 
acid_shell() //activates the shellshock fx and cough sound
{
    level endon("acid_shell_flag");
    trigger = getent ("acid_shell","targetname");
    for(;;)
    {
    trigger waittill( "trigger", player );
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
        {
        if(players[i] isTouching( trigger ) && isAlive( players[i] )  )
        {
            if(!isDefined (players[i].acid))
            players[i].acid=false;
            
            if(players[i].acid==false)
            {
            players[i] thread acid_shell_func();
            }
        }
        }
    wait 0.1;
    }
}

acid_shell_func()
{
    if(!level.freeRun)
    {
    if(self.acid==false)
    {
    self.acid=true;
	self ShellShock("teargas", 7 );
	wait 0.1 +RandomFloatRange(1, 3);
    self playlocalsound ("choke");
    self.acid=false;
    }
    }
}

acid_shell_delete()
{
    level notify("acid_shell_flag");
    trigger = getent ("acid_shell","targetname");    
    trigger delete();
}   
 
 
gas_sound() //just a small detail, lets the player cough if he moves through the acid trap after it's been activated and the fog is still there. for that it is absolutely overengineered...
{
    level endon("gas_sound_delete");
    trigger = getent ("gas_breath","targetname");
    for(;;)
    {
    trigger waittill( "trigger", player );
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
        {
        if(players[i] isTouching( trigger ) && isAlive( players[i] )  )
        {
            if(!isDefined (players[i].gas))
            players[i].gas=false;
            
            if(players[i].gas==false)
            {
            players[i] thread gas_sound_func();
//            players[i] sayall ("i am breathing gas");
            }
        }
        }
    wait 0.1;
    }
}

gas_sound_func()
{
    if(!level.freeRun)
    {
    if(self.gas==false)
    {
    self.gas=true;
    self playlocalsound ("gas_breath");
    wait 5;
    self.gas=false;
    }
    }
}

gas_sound_delete() //delete the trigger after the fog is gone so it will not activate anymore
{
    level notify("gas_sound_delete");
    trigger = getent ("gas_breath","targetname");    
    trigger delete();
//	iPrintlnbold ("gastrigdeleted");
}   

trap_09() //rpg trap
{
	trig = getEnt("trigger9", "targetname");	
	rpg_deco = getEnt("rpg_deco", "targetname");	
	rpgtowerbrush1 = getEnt("rpgtowerbrush1", "targetname");	
	rpgtowerbrush2 = getEnt("rpgtowerbrush2", "targetname");
	tower_alarm = getEnt("tower_alarm", "targetname");
	
	trig waittill("trigger", player);
	trig delete();
	
	rpg_deco playsound ( "mp_oldschool_pickup_01" );
	rpg_deco delete();
	thread rotate_emergency();
	tower_alarm playloopsound ( "alarm_missile_incoming_01" );
		noti = SpawnStruct(); //text to activator
		noti.notifyText = "You are the trap, shoot the jumpers!";
		noti.duration = 6;
		noti.glowcolor = (0.5,0,1);
		player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	player TakeAllWeapons();
	player GiveWeapon( "rpg_mp" );
	player giveStartAmmo ( "rpg_mp" );
//	player SetWeaponAmmoStock( "rpg_mp", 5 );
//	player setWeaponAmmoClip( "rpg_mp", 5 );
	wait (.05);
	player SwitchToWeapon( "rpg_mp" );
//	iprintlnBold ("The Activator has a RPG, seek cover!");
	wait (.05);
	rpgtowerbrush1 movez (-65, 1);
	rpgtowerbrush1 PlaySound ("doorstonesmall");
	rpgtowerbrush2 movey (50, 1);
	rpgtowerbrush2 PlaySound ("doorstonesmall");
	wait (12);
	tower_alarm stoploopsound ( "alarm_missile_incoming_01" );
}

rotate_emergency()
{
	emergencylight_on = getEnt("emergencylight_on", "targetname");

	emergencylight_on movey(-50,0.1);
	wait (.1);
	while (1)
	{
	emergencylight_on rotatePitch(360, 0.5);
	wait (.5);
	}
}

//////////////////			 //////////////////
//////////////////FINALFIGHTS//////////////////
//////////////////			 //////////////////

monitor()
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


room( tp, weap, health ) //thread used on all finaltele threads for setting health, angles, origin and sometimes weapon
{
    self SetPlayerAngles( tp.angles );
    self SetOrigin( tp.origin );
    
    self TakeAllWeapons();
    self GiveWeapon( weap );
    self GiveMaxAmmo( weap );
    self SwitchToWeapon( weap );
    
    self.maxhealth = health;
    self.health = self.maxhealth;
}

finaltele1() //hexagone
{
    level.endRoomState=false;
    level.finaltele1=0;
    level.finaltp_trig = getEnt("final_1", "targetname");
    porterA = getEnt("porter_activator_1", "targetname");
    porterJ = getEnt("porter_jumper_1", "targetname");
    porterA2 = getEnt("porter_activator_1_1", "targetname");
    porterJ2 = getEnt("porter_jumper_1_1", "targetname");
    
    level.finalJumper = undefined;

    while( 1 )
    {
        level.finaltp_trig waittill( "trigger", player );
        
        if( level.freeRun )
            break;

        if( isDefined( player ) && player.pers["team"] != "allies" )
            continue;
		
        if( level.endRoomState==false )
		{
		level.finaltp_trig2 delete();
		level.finaltp_trig3 delete();
		level.finaltp_trig4 delete();
		level.finaltp_trig5 delete();
		level.endRoomState=true;
		}

        level.finaltp_trig maps\mp\_utility::triggerOff();

        level.finalJumper = player;
		iprintln("^1"+ player.name + " "+ "^7entered Hex-A-Gone");
        if(level.finaltele1>0)
        {
        level.finalJumper room( porterJ2, "rpg_mp", 100 );
        level.activ room( porterA2, "rpg_mp", 100 );
		player thread rpg_refill();
		level.activ thread rpg_refill();
        }
        else
        {
        level.finalJumper room( porterJ, "knife_mp", 100 );
        level.activ room( porterA, "knife_mp", 100 );    
        level.finaltele1++;
        }
        player waittill_any("death", "disconnect","joined_spectators");
		level.dvar[ "afk_warn" ] = 999;
		level.dvar[ "afk_time"] = 1000;
		setDvar("bg_falldamagemaxheight", 2000 );
		setDvar("bg_falldamageminheight", 1500 );

		wait (2.5);
        level.finaltp_trig maps\mp\_utility::triggerOn();


    }
    wait 1;
}

delete_kill_hexagone() // avoids, that the jumpers just wait for the activator to fall down the hexagons and die
{
	trigger = getEnt ("delete_kill_hexagone", "targetname");
	hexagone_kill = getEnt ("hexagone_kill", "targetname");
	
	trigger waittill ("trigger", player);
	trigger delete();
	
	wait (1);
	hexagone_kill delete();
//	iprintlnBold ("killtriggerhexadeleted");
	
}


finaltele2() //pool
{
    level.finaltp_trig2 = getEnt("final_2", "targetname");
    porterA = getEnt("porter_activator_2", "targetname");
    porterJ = getEnt("porter_jumper_2", "targetname");

    while( 1 )
    {
        level.finaltp_trig2 waittill( "trigger", player );

        if( level.freeRun )
            break;

        if( isDefined( player ) && player.pers["team"] != "allies" )
            continue;
        
        if( level.endRoomState==false )
        {
        level.finaltp_trig delete();
        level.finaltp_trig3 delete();
        level.finaltp_trig4 delete();
        level.finaltp_trig5 delete();
        level.endRoomState=true;
        }

        level.finaltp_trig2 maps\mp\_utility::triggerOff();

        level.finalJumper = player;
        iprintln("^1"+ player.name + " "+ "^7entered Swimming Pool");
        level.finalJumper room( porterJ,"knife_mp", 100 );
        level.activ room( porterA,"knife_mp", 100 );
        wait 0.1;
        level.finalJumper GetRandomWeapon(randomIntRange(0, 6));
        wait 0.1;
        level.dvar[ "afk_warn" ] = 999;
        level.dvar[ "afk_time"] = 1000;
        setDvar("bg_falldamagemaxheight", 2000 );
        setDvar("bg_falldamageminheight", 1500 );
        player waittill_any("death", "disconnect", "joined_spectators");
        wait (2.5);
        level.finaltp_trig2 maps\mp\_utility::triggerOn();

    }
    wait 1;
}

GetRandomWeapon( num ) //chooses a random weapon
{
    switch(num)
    {
        case 0:    self GiveRandomWeapon("m60e4_mp"); break;
        case 1:    self GiveRandomWeapon("deserteagle_mp"); break;
        case 2:    self GiveRandomWeapon("rpg_mp"); break;
        case 3:    self GiveRandomWeapon("m60e4_mp"); break;
        case 4:    self GiveRandomWeapon("ak47_mp"); break;
        case 5:    self GiveRandomWeapon("dragunov_acog_mp"); break;
    }
    wait 1;
}


GiveRandomWeapon( wep ) //gives the jumper and the activator the same random weapon
{
	self giveWeapon( wep );
	self switchToWeapon( wep );
	self giveMaxAmmo( wep );
	level.activ giveWeapon( wep );
	level.activ switchToWeapon( wep );
	level.activ giveMaxAmmo( wep );	
}


finaltele3() //2fast4you
{
    level.finaltp_trig3 = getEnt("final_3", "targetname");
    porterA = getEnt("porter_activator_3", "targetname");
    porterJ = getEnt("porter_jumper_3", "targetname");


    while( 1 )
    {
        level.finaltp_trig3 waittill( "trigger", player );

        if( level.freeRun )
            break;

        if( isDefined( player ) && player.pers["team"] != "allies" )
            continue;
		
        if( level.endRoomState==false )
		{
		level.finaltp_trig delete();
		level.finaltp_trig2 delete();
		level.finaltp_trig4 delete();
		level.finaltp_trig5 delete();
		level.endRoomState=true;
		}

        level.finaltp_trig3 maps\mp\_utility::triggerOff();

        level.finalJumper = player;
		iprintln("^1"+ player.name + " "+ "^7entered 2 Fast 4 U");
        level.finalJumper room( porterJ, "knife_mp", 100 );
        level.activ room( porterA, "knife_mp", 100 );
		
		level.dvar[ "afk_warn" ] = 999;
		level.dvar[ "afk_time"] = 1000;
		setDvar("bg_falldamagemaxheight", 2000 );
		setDvar("bg_falldamageminheight", 1500 );
		level.activ setMoveSpeedScale(2);
		level.finalJumper setMoveSpeedScale(2);
	
        player waittill_any("death", "disconnect", "joined_spectators");

		wait (2.5);
        level.finaltp_trig3 maps\mp\_utility::triggerOn();

    }
    wait 1;
}


finaltele4() //Sandstorm
{
    level.finaltp_trig4 = getEnt("final_4", "targetname");
    porterA = getEnt("porter_activator_4", "targetname");
    porterJ = getEnt("porter_jumper_4", "targetname");

	
    while( 1 )
    {
        level.finaltp_trig4 waittill( "trigger", player );

        if( level.freeRun )
            break;

        if( isDefined( player ) && player.pers["team"] != "allies" )
            continue;

        if( level.endRoomState==false )
		{
		level.finaltp_trig delete();
		level.finaltp_trig2 delete();
		level.finaltp_trig3 delete();
		level.finaltp_trig5 delete();
		level.endRoomState=true;
		}

        level.finaltp_trig4 maps\mp\_utility::triggerOff();

        level.finalJumper = player;
		iprintln("^1"+ player.name + " "+ "^7entered Sandstorm");
        level.finalJumper room( porterJ, "knife_mp", 25 );
        level.activ room( porterA, "knife_mp", 25 );
		wait 0.1;
        level.finalJumper GetRandomWeapon1(randomIntRange(0, 7));
		wait 0.1;
		level.dvar[ "afk_warn" ] = 999;
		level.dvar[ "afk_time"] = 1000;
		setDvar("bg_falldamagemaxheight", 2000 );
		setDvar("bg_falldamageminheight", 1500 );
        player waittill_any("death", "disconnect", "joined_spectators");

		wait (2.5);
        level.finaltp_trig4 maps\mp\_utility::triggerOn();

    }
    wait 1;
}


GetRandomWeapon1( num )
{
    switch(num)
    {
        case 0:    self GiveRandomWeapon1("barrett_mp"); break;
        case 1:    self GiveRandomWeapon1("barrett_acog_mp"); break;
        case 2:    self GiveRandomWeapon1("dragunov_mp"); break;
        case 3:    self GiveRandomWeapon1("m14_reflex_mp"); break;
        case 4:    self GiveRandomWeapon1("dragunov_acog_mp"); break;
        case 5:    self GiveRandomWeapon1("m21_mp"); break;
		case 6:    self GiveRandomWeapon1("remington700_mp"); break;
    }
    wait 1;
}


GiveRandomWeapon1( wep )
{
	self giveWeapon( wep );
	self switchToWeapon( wep );
	self giveMaxAmmo( wep );
	level.activ giveWeapon( wep );
	level.activ switchToWeapon( wep );
	level.activ giveMaxAmmo( wep );	
}




finaltele5() //knife game
{
	level.finaltp_trig5 = getEnt("final_5", "targetname");

	if( GetTeamPlayersAlive("allies") > 1 && !level.freeRun ) //only teleports if there is a last jumper
		return;
	
	porterA = getEnt("porter_activator_5", "targetname");
	porterJ = getEnt("porter_jumper_5", "targetname");
	
    while( 1 )
    {
        level.finaltp_trig5 waittill( "trigger", player );

        if( level.freeRun )
            break;
			
		if( level.jumpers > 1 && !level.freeRun )
		break;

        if( isDefined( player ) && player.pers["team"] != "allies" )
            continue;

        if( level.endRoomState==false )
		{
		level.finaltp_trig delete();
		level.finaltp_trig2 delete();
		level.finaltp_trig3 delete();
		level.finaltp_trig4 delete();
		level.endRoomState=true;
		}

        level.finaltp_trig5 maps\mp\_utility::triggerOff();

        level.finalJumper = player;
		iprintln("^1"+ player.name + " "+ "^7entered Knife Game");
        level.finalJumper room( porterJ, "knife_mp", 100 );
        level.activ room( porterA, "knife_mp", 100 );
		level.dvar[ "afk_warn" ] = 999;
		level.dvar[ "afk_time"] = 1000;
		setDvar("bg_falldamagemaxheight", 2000 );
		setDvar("bg_falldamageminheight", 1500 );
		level.activ setMoveSpeedScale(1.5);
		level.finalJumper setMoveSpeedScale(1.5);
        player waittill_any("death", "disconnect", "joined_spectators");

		wait (2.5);
        level.finaltp_trig5 maps\mp\_utility::triggerOn();

    }
    wait 1;
}



check_lastjumper() //opens the door for the knife game if there is a last jumper
{
	trigger = getEnt( "check_lastjumper", "targetname" );
	brush = getEnt( "door_1vs1", "targetname" );
	
	trigger waittill( "trigger", player );
	trigger delete();
	
		if( level.jumpers > 1 && !level.freeRun )
		return;
	
	brush movez (-150, 1);
	brush playsound ("doorstonesmall");
//	iprintlnBold ("lastjumper");
}


rpg_refill() //refills the rpg infinitely in the second hexagone stage
{
self endon("death");
self endon("disconnect");
self endon("joined_spectators");
for(;;)
{
self SetWeaponAmmoStock( "rpg_mp", 300 );
wait 5;
}
}
	
	
//I am sure there are nicer ways to deal with this, but hey it works
hexagone()
{
	trigger = getent ("hexagone","targetname");
//	deserttrig = getEnt("give_rpg", "targetname");	
	clip_fallguy1 = getent ("clip_fallguy1","targetname");
	clip_fallguy2 = getent ("clip_fallguy2","targetname");
	hexaparty = randomInt(5); //chance of spawning disco fx
	givemerpg = randomInt(5); //chance of rpg after 30secs


	thread h1(); //first platform
	thread h2();
	thread h3();
	thread h4();
	thread h5();
	thread h6();
	thread h7();
	thread h8();
	thread h9();
	thread h10();
	thread h11();
	thread h12();
	thread h13();
	thread h14();
	thread h15();
	thread h16();
	thread h17();
	thread h18();
	thread h19();
	thread h20();
	thread h21();
	thread h22();
	thread h23();
	thread h24();
	thread h25();
	
	thread h26(); //second platform
	thread h27();
	thread h28();
	thread h29();
	thread h30();
	thread h31();
	thread h32();
	thread h33();
	thread h34();
	thread h35();
	thread h36();
	thread h37();
	thread h38();
	thread h39();
	thread h40();
	thread h41();
	thread h42();
	thread h43();
	thread h44();
	thread h45();
	thread h46();
	thread h47();
	thread h48();
	thread h49();
	thread h50();
	
	thread h51(); //third platform
	thread h52();
	thread h53();
	thread h54();
	thread h55();
	thread h56();
	thread h57();
	thread h58();
	thread h59();
	thread h60();
	thread h61();
	thread h62();
	thread h63();
	thread h64();
	thread h65();
	thread h66();
	thread h67();
	thread h68();
	thread h69();
	thread h70();
	thread h71();
	thread h72();
	thread h73();
	thread h74();
	thread h75();
	
	thread h76(); //fourth platform
	thread h77();
	thread h78();
	thread h79();
	thread h80();
	thread h81();
	thread h82();
	thread h83();
	thread h84();
	thread h85();
	thread h86();
	thread h87();
	thread h88();
	thread h89();
	thread h90();
	thread h91();
	thread h92();
	thread h93();
	thread h94();
	thread h95();
	thread h96();
	thread h97();
	thread h98();
	thread h99();
	thread h100();
	
/* 	thread h101(); //fifth platform
	thread h102(); //gone due to engine limits :(
	thread h103();
	thread h104();
	thread h105();
	thread h106();
	thread h107();
	thread h108();
	thread h109();
	thread h110();
	thread h111();
	thread h112();
	thread h113();
	thread h114();
	thread h115();
	thread h116();
	thread h117();
	thread h118();
	thread h119();
	thread h120();
	thread h121();
	thread h122();
	thread h123();
	thread h124();
	thread h125(); */
	
	trigger waittill ("trigger", player);
	trigger delete ();
	
//	iprintlnBold ("jumper arrived hexagon");

	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}


	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	
	acti FreezeControls(1);
	player FreezeControls(1);
//	player TakeAllWeapons();

	AmbientStop(2);
	MusicStop(2);
	wait (2);
	AmbientPlay("survivethefall");
	
	noti = SpawnStruct();
	noti.titleText = "Hex - A - Gone";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 4;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
	wait (3);
	iprintln ("Song Name: ^3Fall Guys - Survive The Fall (SATOSHI Remix)");
	wait (3);

	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 4;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
		
	noti = SpawnStruct(); //text to jumper
	noti.notifyText = "Move quick, the platforms are disappearing!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	noti = SpawnStruct(); //text to activator
	noti.notifyText = "Move quick, the platforms are disappearing!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait (11.15);	
	
		    switch(hexaparty)
            {
            case 0:
			break;
            case 1:
			thread hexaparty();
            break;
            case 2:
            break;
			case 3:
            break;
			case 4:
            break;
            }
			
	acti FreezeControls(0);
	player FreezeControls(0);
	
	wait (1.5);	
	clip_fallguy1 delete();
	clip_fallguy2 delete();
	
	wait (30);
			switch(givemerpg)
            {
            case 0:
			break;
            case 1:
			acti GiveWeapon( "rpg_mp" );
			player GiveWeapon( "rpg_mp" );
			wait .01;
			acti SwitchToWeapon( "rpg_mp" );
			player SwitchToWeapon( "rpg_mp" );
            break;
            case 2:
            break;
			case 3:
            break;
			case 4:
            break;
            }

}

hexaparty() //disco fog fx
{
while(1)
	{
	SetExpFog(512, 1024, 1, 0, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 1, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 1, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.8, 0, 0.6, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 0.6, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.2, 1, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 0.4, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 0.2, 0.2, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 1, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0.6, 0, 0.4, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 0, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0.6, 1, 0.6, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 0, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 1, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 1, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.8, 0, 0.6, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 0.6, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.2, 1, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 0.4, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0, 0, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 0.2, 0.2, 0);
	wait .5;
	SetExpFog(512, 1024, 0.4, 1, 1, 0);
	wait .5;
	SetExpFog(512, 1024, 0.6, 0, 0.4, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 0, 0.8, 0);
	wait .5;
	SetExpFog(512, 1024, 1, 1, 0, 0);
	wait .5;
	SetExpFog(512, 1024, 0.6, 1, 0.6, 0);
	}
}


hexagone_spin() //spins the whole thing around the platforms
{
    brushes = getEntArray ("hexagonespin", "targetname");

    while(1)
    {
        for(i=0;i<brushes.size;i++)
        {
        brushes[i] rotateYaw(360, 240);
		wait (240);
        }
    }
    wait .05;
}


//please ignore this mess the next 1500 lines
h1()
{
	padtrig_1 = getent ("padtrig_1","targetname");
	pad_1 = getEnt( "pad_1", "targetname" );
	
	padtrig_1 waittill( "trigger");
	padtrig_1 delete();
	pad_1 movez (-10, 0.20);
	pad_1 waittill ("movedone");
	wait .15;
	pad_1 playsound ("plopsound");
	wait .80;
	pad_1 delete();	
}

h2()
{
	padtrig_2 = getent ("padtrig_2","targetname");
	pad_2 = getEnt( "pad_2", "targetname" );
	
	padtrig_2 waittill( "trigger");
	padtrig_2 delete();
	pad_2 movez (-10, 0.20);
	pad_2 waittill ("movedone");
	wait .15;
	pad_2 playsound ("plopsound");
	wait .80;
	pad_2 delete();	
}

h3()
{
	padtrig_3 = getent ("padtrig_3","targetname");
	pad_3 = getEnt( "pad_3", "targetname" );
	
	padtrig_3 waittill( "trigger");
	padtrig_3 delete();
	pad_3 movez (-10, 0.20);
	pad_3 waittill ("movedone");
	wait .15;
	pad_3 playsound ("plopsound");
	wait .80;
	pad_3 delete();	
}

h4()
{
	padtrig_4 = getent ("padtrig_4","targetname");
	pad_4 = getEnt( "pad_4", "targetname" );
	
	padtrig_4 waittill( "trigger");
	padtrig_4 delete();
	pad_4 movez (-10, 0.20);
	pad_4 waittill ("movedone");
	wait .15;
	pad_4 playsound ("plopsound");
	wait .80;
	pad_4 delete();	
}

h5()
{
	padtrig_5 = getent ("padtrig_5","targetname");
	pad_5 = getEnt( "pad_5", "targetname" );
	
	padtrig_5 waittill( "trigger");
	padtrig_5 delete();
	pad_5 movez (-10, 0.20);
	pad_5 waittill ("movedone");
	wait .15;
	pad_5 playsound ("plopsound");
	wait .80;
	pad_5 delete();	
}

h6()
{
	padtrig_6 = getent ("padtrig_6","targetname");
	pad_6 = getEnt( "pad_6", "targetname" );
	
	padtrig_6 waittill( "trigger");
	padtrig_6 delete();
	pad_6 movez (-10, 0.20);
	pad_6 waittill ("movedone");
	wait .15;
	pad_6 playsound ("plopsound");
	wait .80;
	pad_6 delete();	
}

h7()
{
	padtrig_7 = getent ("padtrig_7","targetname");
	pad_7 = getEnt( "pad_7", "targetname" );
	
	padtrig_7 waittill( "trigger");
	padtrig_7 delete();
	pad_7 movez (-10, 0.20);
	pad_7 waittill ("movedone");
	wait .15;
	pad_7 playsound ("plopsound");
	wait .80;
	pad_7 delete();	
}

h8()
{
	padtrig_8 = getent ("padtrig_8","targetname");
	pad_8 = getEnt( "pad_8", "targetname" );
	
	padtrig_8 waittill( "trigger");
	padtrig_8 delete();
	pad_8 movez (-10, 0.20);
	pad_8 waittill ("movedone");
	wait .15;
	pad_8 playsound ("plopsound");
	wait .80;
	pad_8 delete();	
}



h9()
{
	padtrig_9 = getent ("padtrig_9","targetname");
	pad_9 = getEnt( "pad_9", "targetname" );
	
	padtrig_9 waittill( "trigger");
	padtrig_9 delete();
	pad_9 movez (-10, 0.20);
	pad_9 waittill ("movedone");
	wait .15;
	pad_9 playsound ("plopsound");
	wait .80;
	pad_9 delete();	
}

h10()
{
	padtrig_10 = getent ("padtrig_10","targetname");
	pad_10 = getEnt( "pad_10", "targetname" );
	
	padtrig_10 waittill( "trigger");
	padtrig_10 delete();
	pad_10 movez (-10, 0.20);
	pad_10 waittill ("movedone");
	wait .15;
	pad_10 playsound ("plopsound");
	wait .80;
	pad_10 delete();	
}

h11()
{
	padtrig_11 = getent ("padtrig_11","targetname");
	pad_11 = getEnt( "pad_11", "targetname" );
	
	padtrig_11 waittill( "trigger");
	padtrig_11 delete();
	pad_11 movez (-10, 0.20);
	pad_11 waittill ("movedone");
	wait .15;
	pad_11 playsound ("plopsound");
	wait .80;
	pad_11 delete();	
}

h12()
{
	padtrig_12 = getent ("padtrig_12","targetname");
	pad_12 = getEnt( "pad_12", "targetname" );
	
	padtrig_12 waittill( "trigger");
	padtrig_12 delete();
	pad_12 movez (-10, 0.20);
	pad_12 waittill ("movedone");
	wait .15;
	pad_12 playsound ("plopsound");
	wait .80;
	pad_12 delete();	
}

h13()
{
	padtrig_13 = getent ("padtrig_13","targetname");
	pad_13 = getEnt( "pad_13", "targetname" );
	
	padtrig_13 waittill( "trigger");
	padtrig_13 delete();
	pad_13 movez (-10, 0.20);
	pad_13 waittill ("movedone");
	wait .15;
	pad_13 playsound ("plopsound");
	wait .80;
	pad_13 delete();	
}

h14()
{
	padtrig_14 = getent ("padtrig_14","targetname");
	pad_14 = getEnt( "pad_14", "targetname" );
	
	padtrig_14 waittill( "trigger");
	padtrig_14 delete();
	pad_14 movez (-10, 0.20);
	pad_14 waittill ("movedone");
	wait .15;
	pad_14 playsound ("plopsound");
	wait .80;
	pad_14 delete();	
}

h15()
{
	padtrig_15 = getent ("padtrig_15","targetname");
	pad_15 = getEnt( "pad_15", "targetname" );
	
	padtrig_15 waittill( "trigger");
	padtrig_15 delete();
	pad_15 movez (-10, 0.20);
	pad_15 waittill ("movedone");
	wait .15;
	pad_15 playsound ("plopsound");
	wait .80;
	pad_15 delete();	
}

h16()
{
	padtrig_16 = getent ("padtrig_16","targetname");
	pad_16 = getEnt( "pad_16", "targetname" );
	
	padtrig_16 waittill( "trigger");
	padtrig_16 delete();
	pad_16 movez (-10, 0.20);
	pad_16 waittill ("movedone");
	wait .15;
	pad_16 playsound ("plopsound");
	wait .80;
	pad_16 delete();	
}

h17()
{
	padtrig_17 = getent ("padtrig_17","targetname");
	pad_17 = getEnt( "pad_17", "targetname" );
	
	padtrig_17 waittill( "trigger");
	padtrig_17 delete();
	pad_17 movez (-10, 0.20);
	pad_17 waittill ("movedone");
	wait .15;
	pad_17 playsound ("plopsound");
	wait .80;
	pad_17 delete();	
}

h18()
{
	padtrig_18 = getent ("padtrig_18","targetname");
	pad_18 = getEnt( "pad_18", "targetname" );
	
	padtrig_18 waittill( "trigger");
	padtrig_18 delete();
	pad_18 movez (-10, 0.20);
	pad_18 waittill ("movedone");
	wait .15;
	pad_18 playsound ("plopsound");
	wait .80;
	pad_18 delete();	
}

h19()
{
	padtrig_19 = getent ("padtrig_19","targetname");
	pad_19 = getEnt( "pad_19", "targetname" );
	
	padtrig_19 waittill( "trigger");
	padtrig_19 delete();
	pad_19 movez (-10, 0.20);
	pad_19 waittill ("movedone");
	wait .15;
	pad_19 playsound ("plopsound");
	wait .80;
	pad_19 delete();	
}

h20()
{
	padtrig_20 = getent ("padtrig_20","targetname");
	pad_20 = getEnt( "pad_20", "targetname" );
	
	padtrig_20 waittill( "trigger");
	padtrig_20 delete();
	pad_20 movez (-10, 0.20);
	pad_20 waittill ("movedone");
	wait .15;
	pad_20 playsound ("plopsound");
	wait .80;
	pad_20 delete();	
}

h21()
{
	padtrig_21 = getent ("padtrig_21","targetname");
	pad_21 = getEnt( "pad_21", "targetname" );
	
	padtrig_21 waittill( "trigger");
	padtrig_21 delete();
	pad_21 movez (-10, 0.20);
	pad_21 waittill ("movedone");
	wait .15;
	pad_21 playsound ("plopsound");
	wait .80;
	pad_21 delete();	
}



h22()
{
	padtrig_22 = getent ("padtrig_22","targetname");
	pad_22 = getEnt( "pad_22", "targetname" );
	
	padtrig_22 waittill( "trigger");
	padtrig_22 delete();
	pad_22 movez (-10, 0.20);
	pad_22 waittill ("movedone");
	wait .15;
	pad_22 playsound ("plopsound");
	wait .80;
	pad_22 delete();	
}

h23()
{
	padtrig_23 = getent ("padtrig_23","targetname");
	pad_23 = getEnt( "pad_23", "targetname" );
	
	padtrig_23 waittill( "trigger");
	padtrig_23 delete();
	pad_23 movez (-10, 0.20);
	pad_23 waittill ("movedone");
	wait .15;
	pad_23 playsound ("plopsound");
	wait .80;
	pad_23 delete();	
}

h24()
{
	padtrig_24 = getent ("padtrig_24","targetname");
	pad_24 = getEnt( "pad_24", "targetname" );
	
	padtrig_24 waittill( "trigger");
	padtrig_24 delete();
	pad_24 movez (-10, 0.20);
	pad_24 waittill ("movedone");
	wait .15;
	pad_24 playsound ("plopsound");
	wait .80;
	pad_24 delete();	
}

h25()
{
	padtrig_25 = getent ("padtrig_25","targetname");
	pad_25 = getEnt( "pad_25", "targetname" );
	
	padtrig_25 waittill( "trigger");
	padtrig_25 delete();
	pad_25 movez (-10, 0.20);
	pad_25 waittill ("movedone");
	wait .15;
	pad_25 playsound ("plopsound");
	wait .80;
	pad_25 delete();	
}

h26()
{
	padtrig_26 = getent ("padtrig_26","targetname");
	pad_26 = getEnt( "pad_26", "targetname" );
	
	padtrig_26 waittill( "trigger");
	padtrig_26 delete();
	pad_26 movez (-10, 0.20);
	pad_26 waittill ("movedone");
	wait .15;
	pad_26 playsound ("plopsound");
	wait .80;
	pad_26 delete();	
}

h27()
{
	padtrig_27 = getent ("padtrig_27","targetname");
	pad_27 = getEnt( "pad_27", "targetname" );
	
	padtrig_27 waittill( "trigger");
	padtrig_27 delete();
	pad_27 movez (-10, 0.20);
	pad_27 waittill ("movedone");
	wait .15;
	pad_27 playsound ("plopsound");
	wait .80;
	pad_27 delete();	
}

h28()
{
	padtrig_28 = getent ("padtrig_28","targetname");
	pad_28 = getEnt( "pad_28", "targetname" );
	
	padtrig_28 waittill( "trigger");
	padtrig_28 delete();
	pad_28 movez (-10, 0.20);
	pad_28 waittill ("movedone");
	wait .15;
	pad_28 playsound ("plopsound");
	wait .80;
	pad_28 delete();	
}

h29()
{
	padtrig_29 = getent ("padtrig_29","targetname");
	pad_29 = getEnt( "pad_29", "targetname" );
	
	padtrig_29 waittill( "trigger");
	padtrig_29 delete();
	pad_29 movez (-10, 0.20);
	pad_29 waittill ("movedone");
	wait .15;
	pad_29 playsound ("plopsound");
	wait .80;
	pad_29 delete();	
}

h30()
{
	padtrig_30 = getent ("padtrig_30","targetname");
	pad_30 = getEnt( "pad_30", "targetname" );
	
	padtrig_30 waittill( "trigger");
	padtrig_30 delete();
	pad_30 movez (-10, 0.20);
	pad_30 waittill ("movedone");
	wait .15;
	pad_30 playsound ("plopsound");
	wait .80;
	pad_30 delete();
}

h31()
{
	padtrig_31 = getent ("padtrig_31","targetname");
	pad_31 = getEnt( "pad_31", "targetname" );
	
	padtrig_31 waittill( "trigger");
	padtrig_31 delete();
	pad_31 movez (-10, 0.20);
	pad_31 waittill ("movedone");
	wait .15;
	pad_31 playsound ("plopsound");
	wait .80;
	pad_31 delete();	
}

h32()
{
	padtrig_32 = getent ("padtrig_32","targetname");
	pad_32 = getEnt( "pad_32", "targetname" );
	
	padtrig_32 waittill( "trigger");
	padtrig_32 delete();
	pad_32 movez (-10, 0.20);
	pad_32 waittill ("movedone");
	wait .15;
	pad_32 playsound ("plopsound");
	wait .80;
	pad_32 delete();	
}

h33()
{
	padtrig_33 = getent ("padtrig_33","targetname");
	pad_33 = getEnt( "pad_33", "targetname" );
	
	padtrig_33 waittill( "trigger");
	padtrig_33 delete();
	pad_33 movez (-10, 0.20);
	pad_33 waittill ("movedone");
	wait .15;
	pad_33 playsound ("plopsound");
	wait .80;
	pad_33 delete();	
}



h34()
{
	padtrig_34 = getent ("padtrig_34","targetname");
	pad_34 = getEnt( "pad_34", "targetname" );
	
	padtrig_34 waittill( "trigger");
	padtrig_34 delete();
	pad_34 movez (-10, 0.20);
	pad_34 waittill ("movedone");
	wait .15;
	pad_34 playsound ("plopsound");
	wait .80;
	pad_34 delete();	
}

h35()
{
	padtrig_35 = getent ("padtrig_35","targetname");
	pad_35 = getEnt( "pad_35", "targetname" );
	
	padtrig_35 waittill( "trigger");
	padtrig_35 delete();
	pad_35 movez (-10, 0.20);
	pad_35 waittill ("movedone");
	wait .15;
	pad_35 playsound ("plopsound");
	wait .80;
	pad_35 delete();	
}

h36()
{
	padtrig_36 = getent ("padtrig_36","targetname");
	pad_36 = getEnt( "pad_36", "targetname" );
	
	padtrig_36 waittill( "trigger");
	padtrig_36 delete();
	pad_36 movez (-10, 0.20);
	pad_36 waittill ("movedone");
	wait .15;
	pad_36 playsound ("plopsound");
	wait .80;
	pad_36 delete();	
}

h37()
{
	padtrig_37 = getent ("padtrig_37","targetname");
	pad_37	= getEnt( "pad_37", "targetname" );
	
	padtrig_37 waittill( "trigger");
	padtrig_37 delete();
	pad_37 movez (-10, 0.20);
	pad_37 waittill ("movedone");
	wait .15;
	pad_37 playsound ("plopsound");
	wait .80;
	pad_37 delete();	
}

h38()
{
	padtrig_38 = getent ("padtrig_38","targetname");
	pad_38 = getEnt( "pad_38", "targetname" );
	
	padtrig_38 waittill( "trigger");
	padtrig_38 delete();
	pad_38 movez (-10, 0.20);
	pad_38 waittill ("movedone");
	wait .15;
	pad_38 playsound ("plopsound");
	wait .80;
	pad_38 delete();	
}

h39()
{
	padtrig_39 = getent ("padtrig_39","targetname");
	pad_39 = getEnt( "pad_39", "targetname" );
	
	padtrig_39 waittill( "trigger");
	padtrig_39 delete();
	pad_39 movez (-10, 0.20);
	pad_39 waittill ("movedone");
	wait .15;
	pad_39 playsound ("plopsound");
	wait .80;
	pad_39 delete();	
}

h40()
{
	padtrig_40 = getent ("padtrig_40","targetname");
	pad_40 = getEnt( "pad_40", "targetname" );
	
	padtrig_40 waittill( "trigger");
	padtrig_40 delete();
	pad_40 movez (-10, 0.20);
	pad_40 waittill ("movedone");
	wait .15;
	pad_40 playsound ("plopsound");
	wait .80;
	pad_40 delete();	
}

h41()
{
	padtrig_41 = getent ("padtrig_41","targetname");
	pad_41 = getEnt( "pad_41", "targetname" );
	
	padtrig_41 waittill( "trigger");
	padtrig_41 delete();
	pad_41 movez (-10, 0.20);
	pad_41 waittill ("movedone");
	wait .15;
	pad_41 playsound ("plopsound");
	wait .80;
	pad_41 delete();	
}

h42()
{
	padtrig_42 = getent ("padtrig_42","targetname");
	pad_42 = getEnt( "pad_42", "targetname" );
	
	padtrig_42 waittill( "trigger");
	padtrig_42 delete();
	pad_42 movez (-10, 0.20);
	pad_42 waittill ("movedone");
	wait .15;
	pad_42 playsound ("plopsound");
	wait .80;
	pad_42 delete();	
}

h43()
{
	padtrig_43 = getent ("padtrig_43","targetname");
	pad_43 = getEnt( "pad_43", "targetname" );
	
	padtrig_43 waittill( "trigger");
	padtrig_43 delete();
	pad_43 movez (-10, 0.20);
	pad_43 waittill ("movedone");
	wait .15;
	pad_43 playsound ("plopsound");
	wait .80;
	pad_43 delete();	
}

h44()
{
	padtrig_44 = getent ("padtrig_44","targetname");
	pad_44 = getEnt( "pad_44", "targetname" );
	
	padtrig_44 waittill( "trigger");
	padtrig_44 delete();
	pad_44 movez (-10, 0.20);
	pad_44 waittill ("movedone");
	wait .15;
	pad_44 playsound ("plopsound");
	wait .80;
	pad_44 delete();	
}

h45()
{
	padtrig_45 = getent ("padtrig_45","targetname");
	pad_45 = getEnt( "pad_45", "targetname" );
	
	padtrig_45 waittill( "trigger");
	padtrig_45 delete();
	pad_45 movez (-10, 0.20);
	pad_45 waittill ("movedone");
	wait .15;
	pad_45 playsound ("plopsound");
	wait .80;
	pad_45 delete();	
}

h46()
{
	padtrig_46 = getent ("padtrig_46","targetname");
	pad_46 = getEnt( "pad_46", "targetname" );
	
	padtrig_46 waittill( "trigger");
	padtrig_46 delete();
	pad_46 movez (-10, 0.20);
	pad_46 waittill ("movedone");
	wait .15;
	pad_46 playsound ("plopsound");
	wait .80;
	pad_46 delete();	
}



h47()
{
	padtrig_47 = getent ("padtrig_47","targetname");
	pad_47 = getEnt( "pad_47", "targetname" );
	
	padtrig_47 waittill( "trigger");
	padtrig_47 delete();
	pad_47 movez (-10, 0.20);
	pad_47 waittill ("movedone");
	wait .15;
	pad_47 playsound ("plopsound");
	wait .80;
	pad_47 delete();	
}

h48()
{
	padtrig_48 = getent ("padtrig_48","targetname");
	pad_48 = getEnt( "pad_48", "targetname" );
	
	padtrig_48 waittill( "trigger");
	padtrig_48 delete();
	pad_48 movez (-10, 0.20);
	pad_48 waittill ("movedone");
	wait .15;
	pad_48 playsound ("plopsound");
	wait .80;
	pad_48 delete();	
}

h49()
{
	padtrig_49 = getent ("padtrig_49","targetname");
	pad_49 = getEnt( "pad_49", "targetname" );
	
	padtrig_49 waittill( "trigger");
	padtrig_49 delete();
	pad_49 movez (-10, 0.20);
	pad_49 waittill ("movedone");
	wait .15;
	pad_49 playsound ("plopsound");
	wait .80;
	pad_49 delete();	
}

h50()
{
	padtrig_50 = getent ("padtrig_50","targetname");
	pad_50 = getEnt( "pad_50", "targetname" );
	
	padtrig_50 waittill( "trigger");
	padtrig_50 delete();
	pad_50 movez (-10, 0.20);
	pad_50 waittill ("movedone");
	wait .15;
	pad_50 playsound ("plopsound");
	wait .80;
	pad_50 delete();	
}

//please send help

h51()
{
	padtrig_51 = getent ("padtrig_51","targetname");
	pad_51 = getEnt( "pad_51", "targetname" );
	
	padtrig_51 waittill( "trigger");
	padtrig_51 delete();
	pad_51 movez (-10, 0.20);
	pad_51 waittill ("movedone");
	wait .15;
	pad_51 playsound ("plopsound");
	wait .80;
	pad_51 delete();	
}

h52()
{
	padtrig_52 = getent ("padtrig_52","targetname");
	pad_52 = getEnt( "pad_52", "targetname" );
	
	padtrig_52 waittill( "trigger");
	padtrig_52 delete();
	pad_52 movez (-10, 0.20);
	pad_52 waittill ("movedone");
	wait .15;
	pad_52 playsound ("plopsound");
	wait .80;
	pad_52 delete();	
}

h53()
{
	padtrig_53 = getent ("padtrig_53","targetname");
	pad_53 = getEnt( "pad_53", "targetname" );
	
	padtrig_53 waittill( "trigger");
	padtrig_53 delete();
	pad_53 movez (-10, 0.20);
	pad_53 waittill ("movedone");
	wait .15;
	pad_53 playsound ("plopsound");
	wait .80;
	pad_53 delete();	
}

h54()
{
	padtrig_54 = getent ("padtrig_54","targetname");
	pad_54 = getEnt( "pad_54", "targetname" );
	
	padtrig_54 waittill( "trigger");
	padtrig_54 delete();
	pad_54 movez (-10, 0.20);
	pad_54 waittill ("movedone");
	wait .15;
	pad_54 playsound ("plopsound");
	wait .80;
	pad_54 delete();	
}

h55()
{
	padtrig_55 = getent ("padtrig_55","targetname");
	pad_55 = getEnt( "pad_55", "targetname" );
	
	padtrig_55 waittill( "trigger");
	padtrig_55 delete();
	pad_55 movez (-10, 0.20);
	pad_55 waittill ("movedone");
	wait .15;
	pad_55 playsound ("plopsound");
	wait .80;
	pad_55 delete();
}

h56()
{
	padtrig_56 = getent ("padtrig_56","targetname");
	pad_56 = getEnt( "pad_56", "targetname" );
	
	padtrig_56 waittill( "trigger");
	padtrig_56 delete();
	pad_56 movez (-10, 0.20);
	pad_56 waittill ("movedone");
	wait .15;
	pad_56 playsound ("plopsound");
	wait .80;
	pad_56 delete();	
}

h57()
{
	padtrig_57 = getent ("padtrig_57","targetname");
	pad_57 = getEnt( "pad_57", "targetname" );
	
	padtrig_57 waittill( "trigger");
	padtrig_57 delete();
	pad_57 movez (-10, 0.20);
	pad_57 waittill ("movedone");
	wait .15;
	pad_57 playsound ("plopsound");
	wait .80;
	pad_57 delete();	
}

h58()
{
	padtrig_58 = getent ("padtrig_58","targetname");
	pad_58 = getEnt( "pad_58", "targetname" );
	
	padtrig_58 waittill( "trigger");
	padtrig_58 delete();
	pad_58 movez (-10, 0.20);
	pad_58 waittill ("movedone");
	wait .15;
	pad_58 playsound ("plopsound");
	wait .80;
	pad_58 delete();	
}



h59()
{
	padtrig_59 = getent ("padtrig_59","targetname");
	pad_59 = getEnt( "pad_59", "targetname" );
	
	padtrig_59 waittill( "trigger");
	padtrig_59 delete();
	pad_59 movez (-10, 0.20);
	pad_59 waittill ("movedone");
	wait .15;
	pad_59 playsound ("plopsound");
	wait .80;
	pad_59 delete();	
}

h60()
{
	padtrig_60 = getent ("padtrig_60","targetname");
	pad_60 = getEnt( "pad_60", "targetname" );
	
	padtrig_60 waittill( "trigger");
	padtrig_60 delete();
	pad_60 movez (-10, 0.20);
	pad_60 waittill ("movedone");
	wait .15;
	pad_60 playsound ("plopsound");
	wait .80;
	pad_60 delete();	
}

h61()
{
	padtrig_61 = getent ("padtrig_61","targetname");
	pad_61 = getEnt( "pad_61", "targetname" );
	
	padtrig_61 waittill( "trigger");
	padtrig_61 delete();
	pad_61 movez (-10, 0.20);
	pad_61 waittill ("movedone");
	wait .15;
	pad_61 playsound ("plopsound");
	wait .80;
	pad_61 delete();	
}

h62()
{
	padtrig_62 = getent ("padtrig_62","targetname");
	pad_62	= getEnt( "pad_62", "targetname" );
	
	padtrig_62 waittill( "trigger");
	padtrig_62 delete();
	pad_62 movez (-10, 0.20);
	pad_62 waittill ("movedone");
	wait .15;
	pad_62 playsound ("plopsound");
	wait .80;
	pad_62 delete();	
}

h63()
{
	padtrig_63 = getent ("padtrig_63","targetname");
	pad_63 = getEnt( "pad_63", "targetname" );
	
	padtrig_63 waittill( "trigger");
	padtrig_63 delete();
	pad_63 movez (-10, 0.20);
	pad_63 waittill ("movedone");
	wait .15;
	pad_63 playsound ("plopsound");
	wait .80;
	pad_63 delete();	
}

h64()
{
	padtrig_64 = getent ("padtrig_64","targetname");
	pad_64 = getEnt( "pad_64", "targetname" );
	
	padtrig_64 waittill( "trigger");
	padtrig_64 delete();
	pad_64 movez (-10, 0.20);
	pad_64 waittill ("movedone");
	wait .15;
	pad_64 playsound ("plopsound");
	wait .80;
	pad_64 delete();	
}

h65()
{
	padtrig_65 = getent ("padtrig_65","targetname");
	pad_65 = getEnt( "pad_65", "targetname" );
	
	padtrig_65 waittill( "trigger");
	padtrig_65 delete();
	pad_65 movez (-10, 0.20);
	pad_65 waittill ("movedone");
	wait .15;
	pad_65 playsound ("plopsound");
	wait .80;
	pad_65 delete();	
}

h66()
{
	padtrig_66	= getent ("padtrig_66","targetname");
	pad_66 = getEnt( "pad_66", "targetname" );
	
	padtrig_66 waittill( "trigger");
	padtrig_66 delete();
	pad_66 movez (-10, 0.20);
	pad_66 waittill ("movedone");
	wait .15;
	pad_66 playsound ("plopsound");
	wait .80;
	pad_66 delete();	
}

h67()
{
	padtrig_67 = getent ("padtrig_67","targetname");
	pad_67 = getEnt( "pad_67", "targetname" );
	
	padtrig_67 waittill( "trigger");
	padtrig_67 delete();
	pad_67 movez (-10, 0.20);
	pad_67 waittill ("movedone");
	wait .15;
	pad_67 playsound ("plopsound");
	wait .80;
	pad_67 delete();	
}

h68()
{
	padtrig_68 = getent ("padtrig_68","targetname");
	pad_68 = getEnt( "pad_68", "targetname" );
	
	padtrig_68 waittill( "trigger");
	padtrig_68 delete();
	pad_68 movez (-10, 0.20);
	pad_68 waittill ("movedone");
	wait .15;
	pad_68 playsound ("plopsound");
	wait .80;
	pad_68 delete();	
}

h69()
{
	padtrig_69 = getent ("padtrig_69","targetname");
	pad_69 = getEnt( "pad_69", "targetname" );
	
	padtrig_69 waittill( "trigger");
	padtrig_69 delete();
	pad_69 movez (-10, 0.20);
	pad_69 waittill ("movedone");
	wait .15;
	pad_69 playsound ("plopsound");
	wait .80;
	pad_69 delete();	
}

h70()
{
	padtrig_70 = getent ("padtrig_70","targetname");
	pad_70 = getEnt( "pad_70", "targetname" );
	
	padtrig_70 waittill( "trigger");
	padtrig_70 delete();
	pad_70 movez (-10, 0.20);
	pad_70 waittill ("movedone");
	wait .15;
	pad_70 playsound ("plopsound");
	wait .80;
	pad_70 delete();	
}

h71()
{
	padtrig_71 = getent ("padtrig_71","targetname");
	pad_71 = getEnt( "pad_71", "targetname" );
	
	padtrig_71 waittill( "trigger");
	padtrig_71 delete();
	pad_71 movez (-10, 0.20);
	pad_71 waittill ("movedone");
	wait .15;
	pad_71 playsound ("plopsound");
	wait .80;
	pad_71 delete();	
}



h72()
{
	padtrig_72 = getent ("padtrig_72","targetname");
	pad_72 = getEnt( "pad_72", "targetname" );
	
	padtrig_72 waittill( "trigger");
	padtrig_72 delete();
	pad_72 movez (-10, 0.20);
	pad_72 waittill ("movedone");
	wait .15;
	pad_72 playsound ("plopsound");
	wait .80;
	pad_72 delete();	
}

h73()
{
	padtrig_73 = getent ("padtrig_73","targetname");
	pad_73 = getEnt( "pad_73", "targetname" );
	
	padtrig_73 waittill( "trigger");
	padtrig_73 delete();
	pad_73 movez (-10, 0.20);
	pad_73 waittill ("movedone");
	wait .15;
	pad_73 playsound ("plopsound");
	wait .80;
	pad_73 delete();	
}

h74()
{
	padtrig_74 = getent ("padtrig_74","targetname");
	pad_74 = getEnt( "pad_74", "targetname" );
	
	padtrig_74 waittill( "trigger");
	padtrig_74 delete();
	pad_74 movez (-10, 0.20);
	pad_74 waittill ("movedone");
	wait .15;
	pad_74 playsound ("plopsound");
	wait .80;
	pad_74 delete();	
}

h75()
{
	padtrig_75 = getent ("padtrig_75","targetname");
	pad_75 = getEnt( "pad_75", "targetname" );
	
	padtrig_75 waittill( "trigger");
	padtrig_75 delete();
	pad_75 movez (-10, 0.20);
	pad_75 waittill ("movedone");
	wait .15;
	pad_75 playsound ("plopsound");
	wait .80;
	pad_75 delete();	
}

h76()
{
	padtrig_76 = getent ("padtrig_76","targetname");
	pad_76 = getEnt( "pad_76", "targetname" );
	
	padtrig_76 waittill( "trigger");
	padtrig_76 delete();
	pad_76 movez (-10, 0.20);
	pad_76 waittill ("movedone");
	wait .15;
	pad_76 playsound ("plopsound");
	wait .80;
	pad_76 delete();	
}

h77()
{
	padtrig_77 = getent ("padtrig_77","targetname");
	pad_77 = getEnt( "pad_77", "targetname" );
	
	padtrig_77 waittill( "trigger");
	padtrig_77 delete();
	pad_77 movez (-10, 0.20);
	pad_77 waittill ("movedone");
	wait .15;
	pad_77 playsound ("plopsound");
	wait .80;
	pad_77 delete();	
}

h78()
{
	padtrig_78 = getent ("padtrig_78","targetname");
	pad_78 = getEnt( "pad_78", "targetname" );
	
	padtrig_78 waittill( "trigger");
	padtrig_78 delete();
	pad_78 movez (-10, 0.20);
	pad_78 waittill ("movedone");
	wait .15;
	pad_78 playsound ("plopsound");
	wait .80;
	pad_78 delete();	
}

h79()
{
	padtrig_79 = getent ("padtrig_79","targetname");
	pad_79 = getEnt( "pad_79", "targetname" );
	
	padtrig_79 waittill( "trigger");
	padtrig_79 delete();
	pad_79 movez (-10, 0.20);
	pad_79 waittill ("movedone");
	wait .15;
	pad_79 playsound ("plopsound");
	wait .80;
	pad_79 delete();	
}

h80()
{
	padtrig_80 = getent ("padtrig_80","targetname");
	pad_80 = getEnt( "pad_80", "targetname" );
	
	padtrig_80 waittill( "trigger");
	padtrig_80 delete();
	pad_80 movez (-10, 0.20);
	pad_80 waittill ("movedone");
	wait .15;
	pad_80 playsound ("plopsound");
	wait .80;
	pad_80 delete();
}

h81()
{
	padtrig_81 = getent ("padtrig_81","targetname");
	pad_81 = getEnt( "pad_81", "targetname" );
	
	padtrig_81 waittill( "trigger");
	padtrig_81 delete();
	pad_81 movez (-10, 0.20);
	pad_81 waittill ("movedone");
	wait .15;
	pad_81 playsound ("plopsound");
	wait .80;
	pad_81 delete();	
}

h82()
{
	padtrig_82 = getent ("padtrig_82","targetname");
	pad_82 = getEnt( "pad_82", "targetname" );
	
	padtrig_82 waittill( "trigger");
	padtrig_82 delete();
	pad_82 movez (-10, 0.20);
	pad_82 waittill ("movedone");
	wait .15;
	pad_82 playsound ("plopsound");
	wait .80;
	pad_82 delete();	
}

h83()
{
	padtrig_83 = getent ("padtrig_83","targetname");
	pad_83 = getEnt( "pad_83", "targetname" );
	
	padtrig_83 waittill( "trigger");
	padtrig_83 delete();
	pad_83 movez (-10, 0.20);
	pad_83 waittill ("movedone");
	wait .15;
	pad_83 playsound ("plopsound");
	wait .80;
	pad_83 delete();	
}



h84()
{
	padtrig_84 = getent ("padtrig_84","targetname");
	pad_84 = getEnt( "pad_84", "targetname" );
	
	padtrig_84 waittill( "trigger");
	padtrig_84 delete();
	pad_84 movez (-10, 0.20);
	pad_84 waittill ("movedone");
	wait .15;
	pad_84 playsound ("plopsound");
	wait .80;
	pad_84 delete();	
}

h85()
{
	padtrig_85 = getent ("padtrig_85","targetname");
	pad_85 = getEnt( "pad_85", "targetname" );
	
	padtrig_85 waittill( "trigger");
	padtrig_85 delete();
	pad_85 movez (-10, 0.20);
	pad_85 waittill ("movedone");
	wait .15;
	pad_85 playsound ("plopsound");
	wait .80;
	pad_85 delete();	
}

h86()
{
	padtrig_86 = getent ("padtrig_86","targetname");
	pad_86 = getEnt( "pad_86", "targetname" );
	
	padtrig_86 waittill( "trigger");
	padtrig_86 delete();
	pad_86 movez (-10, 0.20);
	pad_86 waittill ("movedone");
	wait .15;
	pad_86 playsound ("plopsound");
	wait .80;
	pad_86 delete();	
}

h87()
{
	padtrig_87 = getent ("padtrig_87","targetname");
	pad_87	= getEnt( "pad_87", "targetname" );
	
	padtrig_87 waittill( "trigger");
	padtrig_87 delete();
	pad_87 movez (-10, 0.20);
	pad_87 waittill ("movedone");
	wait .15;
	pad_87 playsound ("plopsound");
	wait .80;
	pad_87 delete();	
}

h88()
{
	padtrig_88 = getent ("padtrig_88","targetname");
	pad_88 = getEnt( "pad_88", "targetname" );
	
	padtrig_88 waittill( "trigger");
	padtrig_88 delete();
	pad_88 movez (-10, 0.20);
	pad_88 waittill ("movedone");
	wait .15;
	pad_88 playsound ("plopsound");
	wait .80;
	pad_88 delete();	
}

h89()
{
	padtrig_89 = getent ("padtrig_89","targetname");
	pad_89 = getEnt( "pad_89", "targetname" );
	
	padtrig_89 waittill( "trigger");
	padtrig_89 delete();
	pad_89 movez (-10, 0.20);
	pad_89 waittill ("movedone");
	wait .15;
	pad_89 playsound ("plopsound");
	wait .80;
	pad_89 delete();	
}

h90()
{
	padtrig_90 = getent ("padtrig_90","targetname");
	pad_90 = getEnt( "pad_90", "targetname" );
	
	padtrig_90 waittill( "trigger");
	padtrig_90 delete();
	pad_90 movez (-10, 0.20);
	pad_90 waittill ("movedone");
	wait .15;
	pad_90 playsound ("plopsound");
	wait .80;
	pad_90 delete();	
}

h91()
{
	padtrig_91	= getent ("padtrig_91","targetname");
	pad_91 = getEnt( "pad_91", "targetname" );
	
	padtrig_91 waittill( "trigger");
	padtrig_91 delete();
	pad_91 movez (-10, 0.20);
	pad_91 waittill ("movedone");
	wait .15;
	pad_91 playsound ("plopsound");
	wait .80;
	pad_91 delete();	
}

h92()
{
	padtrig_92 = getent ("padtrig_92","targetname");
	pad_92 = getEnt( "pad_92", "targetname" );
	
	padtrig_92 waittill( "trigger");
	padtrig_92 delete();
	pad_92 movez (-10, 0.20);
	pad_92 waittill ("movedone");
	wait .15;
	pad_92 playsound ("plopsound");
	wait .80;
	pad_92 delete();	
}

h93()
{
	padtrig_93 = getent ("padtrig_93","targetname");
	pad_93 = getEnt( "pad_93", "targetname" );
	
	padtrig_93 waittill( "trigger");
	padtrig_93 delete();
	pad_93 movez (-10, 0.20);
	pad_93 waittill ("movedone");
	wait .15;
	pad_93 playsound ("plopsound");
	wait .80;
	pad_93 delete();	
}

h94()
{
	padtrig_94 = getent ("padtrig_94","targetname");
	pad_94 = getEnt( "pad_94", "targetname" );
	
	padtrig_94 waittill( "trigger");
	padtrig_94 delete();
	pad_94 movez (-10, 0.20);
	pad_94 waittill ("movedone");
	wait .15;
	pad_94 playsound ("plopsound");
	wait .80;
	pad_94 delete();	
}

h95()
{
	padtrig_95 = getent ("padtrig_95","targetname");
	pad_95 = getEnt( "pad_95", "targetname" );
	
	padtrig_95 waittill( "trigger");
	padtrig_95 delete();
	pad_95 movez (-10, 0.20);
	pad_95 waittill ("movedone");
	wait .15;
	pad_95 playsound ("plopsound");
	wait .80;
	pad_95 delete();	
}

h96()
{
	padtrig_96 = getent ("padtrig_96","targetname");
	pad_96 = getEnt( "pad_96", "targetname" );
	
	padtrig_96 waittill( "trigger");
	padtrig_96 delete();
	pad_96 movez (-10, 0.20);
	pad_96 waittill ("movedone");
	wait .15;
	pad_96 playsound ("plopsound");
	wait .80;
	pad_96 delete();	
}



h97()
{
	padtrig_97 = getent ("padtrig_97","targetname");
	pad_97 = getEnt( "pad_97", "targetname" );
	
	padtrig_97 waittill( "trigger");
	padtrig_97 delete();
	pad_97 movez (-10, 0.20);
	pad_97 waittill ("movedone");
	wait .15;
	pad_97 playsound ("plopsound");
	wait .80;
	pad_97 delete();	
}

h98()
{
	padtrig_98 = getent ("padtrig_98","targetname");
	pad_98 = getEnt( "pad_98", "targetname" );
	
	padtrig_98 waittill( "trigger");
	padtrig_98 delete();
	pad_98 movez (-10, 0.20);
	pad_98 waittill ("movedone");
	wait .15;
	pad_98 playsound ("plopsound");
	wait .80;
	pad_98 delete();	
}

h99()
{
	padtrig_99 = getent ("padtrig_99","targetname");
	pad_99 = getEnt( "pad_99", "targetname" );
	
	padtrig_99 waittill( "trigger");
	padtrig_99 delete();
	pad_99 movez (-10, 0.20);
	pad_99 waittill ("movedone");
	wait .15;
	pad_99 playsound ("plopsound");
	wait .80;
	pad_99 delete();	
}

h100()
{
	padtrig_100 = getent ("padtrig_100","targetname");
	pad_100 = getEnt( "pad_100", "targetname" );
	
	padtrig_100 waittill( "trigger");
	padtrig_100 delete();
	pad_100 movez (-10, 0.20);
	pad_100 waittill ("movedone");
	wait .15;
	pad_100 playsound ("plopsound");
	wait .80;
	pad_100 delete();	
}

//limits :(

/* h101()
{
	padtrig_101 = getent ("padtrig_101","targetname");
	pad_101 = getEnt( "pad_101", "targetname" );
	
	padtrig_101 waittill( "trigger");
	padtrig_101 delete();
	pad_101 movez (-10, 0.20);
	pad_101 waittill ("movedone");
	wait .15;
	pad_101 playsound ("plopsound");
	wait .80;
	pad_101 delete();	
}

h102()
{
	padtrig_102 = getent ("padtrig_102","targetname");
	pad_102 = getEnt( "pad_102", "targetname" );
	
	padtrig_102 waittill( "trigger");
	padtrig_102 delete();
	pad_102 movez (-10, 0.20);
	pad_102 waittill ("movedone");
	wait .15;
	pad_102 playsound ("plopsound");
	wait .80;
	pad_102 delete();	
}

h103()
{
	padtrig_103	= getent ("padtrig_103","targetname");
	pad_103 = getEnt( "pad_103", "targetname" );
	
	padtrig_103 waittill( "trigger");
	padtrig_103 delete();
	pad_103 movez (-10, 0.20);
	pad_103 waittill ("movedone");
	wait .15;
	pad_103 playsound ("plopsound");
	wait .80;
	pad_103 delete();	
}

h104()
{
	padtrig_104 = getent ("padtrig_104","targetname");
	pad_104 = getEnt( "pad_104", "targetname" );
	
	padtrig_104 waittill( "trigger");
	padtrig_104 delete();
	pad_104 movez (-10, 0.20);
	pad_104 waittill ("movedone");
	wait .15;
	pad_104 playsound ("plopsound");
	wait .80;
	pad_104 delete();	
}

h105()
{
	padtrig_105 = getent ("padtrig_105","targetname");
	pad_105 = getEnt( "pad_105", "targetname" );
	
	padtrig_105 waittill( "trigger");
	padtrig_105 delete();
	pad_105 movez (-10, 0.20);
	pad_105 waittill ("movedone");
	wait .15;
	pad_105 playsound ("plopsound");
	wait .80;
	pad_105 delete();
}

h106()
{
	padtrig_106 = getent ("padtrig_106","targetname");
	pad_106 = getEnt( "pad_106", "targetname" );
	
	padtrig_106 waittill( "trigger");
	padtrig_106 delete();
	pad_106 movez (-10, 0.20);
	pad_106 waittill ("movedone");
	wait .15;
	pad_106 playsound ("plopsound");
	wait .80;
	pad_106 delete();	
}

h107()
{
	padtrig_107 = getent ("padtrig_107","targetname");
	pad_107 = getEnt( "pad_107", "targetname" );
	
	padtrig_107 waittill( "trigger");
	padtrig_107 delete();
	pad_107 movez (-10, 0.20);
	pad_107 waittill ("movedone");
	wait .15;
	pad_107 playsound ("plopsound");
	wait .80;
	pad_107 delete();	
}

h108()
{
	padtrig_108 = getent ("padtrig_108","targetname");
	pad_108 = getEnt( "pad_108", "targetname" );
	
	padtrig_108 waittill( "trigger");
	padtrig_108 delete();
	pad_108 movez (-10, 0.20);
	pad_108 waittill ("movedone");
	wait .15;
	pad_108 playsound ("plopsound");
	wait .80;
	pad_108 delete();	
}



h109()
{
	padtrig_109 = getent ("padtrig_109","targetname");
	pad_109 = getEnt( "pad_109", "targetname" );
	
	padtrig_109 waittill( "trigger");
	padtrig_109 delete();
	pad_109 movez (-10, 0.20);
	pad_109 waittill ("movedone");
	wait .15;
	pad_109 playsound ("plopsound");
	wait .80;
	pad_109 delete();	
}

h110()
{
	padtrig_110 = getent ("padtrig_110","targetname");
	pad_110 = getEnt( "pad_110", "targetname" );
	
	padtrig_110 waittill( "trigger");
	padtrig_110 delete();
	pad_110 movez (-10, 0.20);
	pad_110 waittill ("movedone");
	wait .15;
	pad_110 playsound ("plopsound");
	wait .80;
	pad_110 delete();	
}

h111()
{
	padtrig_111 = getent ("padtrig_111","targetname");
	pad_111 = getEnt( "pad_111", "targetname" );
	
	padtrig_111 waittill( "trigger");
	padtrig_111 delete();
	pad_111 movez (-10, 0.20);
	pad_111 waittill ("movedone");
	wait .15;
	pad_111 playsound ("plopsound");
	wait .80;
	pad_111 delete();	
}

h112()
{
	padtrig_112 = getent ("padtrig_112","targetname");
	pad_112	= getEnt( "pad_112", "targetname" );
	
	padtrig_112 waittill( "trigger");
	padtrig_112 delete();
	pad_112 movez (-10, 0.20);
	pad_112 waittill ("movedone");
	wait .15;
	pad_112 playsound ("plopsound");
	wait .80;
	pad_112 delete();	
}

h113()
{
	padtrig_113 = getent ("padtrig_113","targetname");
	pad_113 = getEnt( "pad_113", "targetname" );
	
	padtrig_113 waittill( "trigger");
	padtrig_113 delete();
	pad_113 movez (-10, 0.20);
	pad_113 waittill ("movedone");
	wait .15;
	pad_113 playsound ("plopsound");
	wait .80;
	pad_113 delete();	
}

h114()
{
	padtrig_114 = getent ("padtrig_114","targetname");
	pad_114 = getEnt( "pad_114", "targetname" );
	
	padtrig_114 waittill( "trigger");
	padtrig_114 delete();
	pad_114 movez (-10, 0.20);
	pad_114 waittill ("movedone");
	wait .15;
	pad_114 playsound ("plopsound");
	wait .80;
	pad_114 delete();	
}

h115()
{
	padtrig_115 = getent ("padtrig_115","targetname");
	pad_115 = getEnt( "pad_115", "targetname" );
	
	padtrig_115 waittill( "trigger");
	padtrig_115 delete();
	pad_115 movez (-10, 0.20);
	pad_115 waittill ("movedone");
	wait .15;
	pad_115 playsound ("plopsound");
	wait .80;
	pad_115 delete();	
}

h116()
{
	padtrig_116	= getent ("padtrig_116","targetname");
	pad_116 = getEnt( "pad_116", "targetname" );
	
	padtrig_116 waittill( "trigger");
	padtrig_116 delete();
	pad_116 movez (-10, 0.20);
	pad_116 waittill ("movedone");
	wait .15;
	pad_116 playsound ("plopsound");
	wait .80;
	pad_116 delete();	
}

h117()
{
	padtrig_117 = getent ("padtrig_117","targetname");
	pad_117 = getEnt( "pad_117", "targetname" );
	
	padtrig_117 waittill( "trigger");
	padtrig_117 delete();
	pad_117 movez (-10, 0.20);
	pad_117 waittill ("movedone");
	wait .15;
	pad_117 playsound ("plopsound");
	wait .80;
	pad_117 delete();	
}

h118()
{
	padtrig_118 = getent ("padtrig_118","targetname");
	pad_118 = getEnt( "pad_118", "targetname" );
	
	padtrig_118 waittill( "trigger");
	padtrig_118 delete();
	pad_118 movez (-10, 0.20);
	pad_118 waittill ("movedone");
	wait .15;
	pad_118 playsound ("plopsound");
	wait .80;
	pad_118 delete();	
}

h119()
{
	padtrig_119 = getent ("padtrig_119","targetname");
	pad_119	= getEnt( "pad_119", "targetname" );
	
	padtrig_119 waittill( "trigger");
	padtrig_119 delete();
	pad_119 movez (-10, 0.20);
	pad_119 waittill ("movedone");
	wait .15;
	pad_119 playsound ("plopsound");
	wait .80;
	pad_119 delete();	
}

h120()
{
	padtrig_120 = getent ("padtrig_120","targetname");
	pad_120 = getEnt( "pad_120", "targetname" );
	
	padtrig_120 waittill( "trigger");
	padtrig_120 delete();
	pad_120 movez (-10, 0.20);
	pad_120 waittill ("movedone");
	wait .15;
	pad_120 playsound ("plopsound");
	wait .80;
	pad_120 delete();	
}

h121()
{
	padtrig_121 = getent ("padtrig_121","targetname");
	pad_121	= getEnt( "pad_121", "targetname" );
	
	padtrig_121 waittill( "trigger");
	padtrig_121 delete();
	pad_121 movez (-10, 0.20);
	pad_121 waittill ("movedone");
	wait .15;
	pad_121 playsound ("plopsound");
	wait .80;
	pad_121 delete();	
}



h122()
{
	padtrig_122 = getent ("padtrig_122","targetname");
	pad_122 = getEnt( "pad_122", "targetname" );
	
	padtrig_122 waittill( "trigger");
	padtrig_122 delete();
	pad_122 movez (-10, 0.20);
	pad_122 waittill ("movedone");
	wait .15;
	pad_122 playsound ("plopsound");
	wait .80;
	pad_122 delete();	
}

h123()
{
	padtrig_123 = getent ("padtrig_123","targetname");
	pad_123 = getEnt( "pad_123", "targetname" );
	
	padtrig_123 waittill( "trigger");
	padtrig_123 delete();
	pad_123 movez (-10, 0.20);
	pad_123 waittill ("movedone");
	wait .15;
	pad_123 playsound ("plopsound");
	wait .80;
	pad_123 delete();	
}

h124()
{
	padtrig_124 = getent ("padtrig_124","targetname");
	pad_124 = getEnt( "pad_124", "targetname" );
	
	padtrig_124 waittill( "trigger");
	padtrig_124 delete();
	pad_124 movez (-10, 0.20);
	pad_124 waittill ("movedone");
	wait .15;
	pad_124 playsound ("plopsound");
	wait .80;
	pad_124 delete();	
}

h125()
{
	padtrig_125 = getent ("padtrig_125","targetname");
	pad_125 = getEnt( "pad_125", "targetname" );
	
	padtrig_125 waittill( "trigger");
	padtrig_125 delete();
	pad_125 movez (-10, 0.20);
	pad_125 waittill ("movedone");
	wait .15;
	pad_125 playsound ("plopsound");
	wait .80;
	pad_125 delete();	
}
 */

pool() //swimming pool endroom
{
	trigger = getent ("pool","targetname");
	milos_1 = getent ("milos_1","targetname");
	milos_2 = getent ("milos_2","targetname");
	milos_3 = getent ("milos_3","targetname");
	milos_4 = getent ("milos_4","targetname");
	milos_5 = getent ("milos_5","targetname");
	milos_6 = getent ("milos_6","targetname");
	milos_7 = getent ("milos_7","targetname");
	milos_8 = getent ("milos_8","targetname");
	milos_9 = getent ("milos_9","targetname");
	milos_10 = getent ("milos_10","targetname");
	milos_11 = getent ("milos_11","targetname");
	milos_12 = getent ("milos_12","targetname");
	milos_1 hide(); //hides ricardo 
	milos_2 hide(); 
	milos_3 hide(); 
	milos_4 hide(); 
	milos_5 hide(); 
	milos_6 hide(); 
	milos_7 hide(); 
	milos_8 hide(); 
	milos_9 hide(); 
	milos_10 hide(); 
	milos_11 hide(); 
	milos_12 hide(); 
	milosrandom = randomInt(8); //chance of spawning milos flick

	trigger waittill ("trigger", player);
	trigger delete ();
	
	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}

	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	
//	iprintlnBold ("jumper arrived pool");
	acti FreezeControls(1);
	player FreezeControls(1);
//	player TakeAllWeapons();
	
	AmbientStop(2);
	MusicStop(2);
	wait (2);
	AmbientPlay("ugotthat");
	PlayFX( level.orb_up_serious, (-24845,22330,2615) );

	
	noti = SpawnStruct();
	noti.titleText = "Swimming Pool";
	noti.notifyText = "Activator VS Jumper";
	noti.duration = 4;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
		
	wait (3);	
	iprintln ("Song Name: ^3Halogen - U Got That");
	wait (3);
	
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "GET READY!";
	noti.duration = 4;
	noti.glowcolor = (0,0,2);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	noti = SpawnStruct(); //text to jumper
	noti.notifyText = "Kill the Activator to assert dominance!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	noti = SpawnStruct(); //text to activator
	noti.notifyText = "Kill the Jumper to assert dominance!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait (12.5);	
	
	    switch(milosrandom) //activates ricardo only if case0 is selected randomly
            {
            case 0:
			thread milos_dance();
			thread milos_dance_2();
			thread milos_dance_3();
			thread milos_dance_4();
			thread milos_dance_5();
			thread milos_dance_6();            
			break;
            case 1:
            break;
            case 2:
            break;
            case 3:
            break;
            case 4:
            break;
			case 5:
            break;
			case 6:
            break;
			case 7:
            break;
            }

	acti FreezeControls(0);
	player FreezeControls(0);
}

milos_dance() //does the milos flick
{
	milos_1 = getent ("milos_1","targetname");
	milos_2 = getent ("milos_2","targetname");
	
	while(1)
	{
		milos_1 show();
		wait 0.46;
		milos_1 hide();
		milos_2 show();
		wait 0.46;
		milos_2 hide();
	}
}

milos_dance_2()
{
	milos_3 = getent ("milos_3","targetname");
	milos_4 = getent ("milos_4","targetname");
	
	while(1)
	{
		milos_3 show();
		wait 0.46;
		milos_3 hide();
		milos_4 show();
		wait 0.46;
		milos_4 hide();
	}
}

milos_dance_3()
{
	milos_5 = getent ("milos_5","targetname");
	milos_6 = getent ("milos_6","targetname");
	
	while(1)
	{
		milos_5 show();
		wait 0.46;
		milos_5 hide();
		milos_6 show();
		wait 0.46;
		milos_6 hide();
	}
}

milos_dance_4()
{
	milos_7 = getent ("milos_7","targetname");
	milos_8 = getent ("milos_8","targetname");
	
	while(1)
	{
		milos_7 show();
		wait 0.46;
		milos_7 hide();
		milos_8 show();
		wait 0.46;
		milos_8 hide();
	}
}

milos_dance_5()
{
	milos_9 = getent ("milos_9","targetname");
	milos_10 = getent ("milos_10","targetname");
	
	while(1)
	{
		milos_9 show();
		wait 0.46;
		milos_9 hide();
		milos_10 show();
		wait 0.46;
		milos_10 hide();
	}
}

milos_dance_6()
{
	milos_11 = getent ("milos_11","targetname");
	milos_12 = getent ("milos_12","targetname");
	
	while(1)
	{
		milos_11 show();
		wait 0.46;
		milos_11 hide();
		milos_12 show();
		wait 0.46;
		milos_12 hide();
	}
}


iamspeed() //2fast4you endgame
{
	trigger = getent ("iamspeed","targetname");
//	weapon = randomInt(8); //random weapon


	trigger waittill ("trigger", player);
	trigger delete ();

	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}

/* 	level.dvar[ "afk_warn" ] = 999;
	level.dvar[ "afk_time"] = 1000;
	setDvar("bg_falldamagemaxheight", 2000 );
	setDvar("bg_falldamageminheight", 1500 );
	acti setMoveSpeedScale(2);
	player setMoveSpeedScale(2); */ //is now in finaltele3
	
//	iprintlnBold ("jumper arrived speed");
	acti FreezeControls(1);
	player FreezeControls(1);
//	player TakeAllWeapons();
	
	AmbientStop(2);
	MusicStop(2);
	wait (2);
	AmbientPlay("running90s");
	wait (.25);
	PlayFX( level.laser_center, (-13020,21518,2959) ); //first lasers
	PlayFX( level.laser_center, (-15516,21518,2959) );

	
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "2 FAST 4 U";
	noti.duration = 4;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait (3);
	iprintln ("Song Name: ^3Initial D - Running in The 90s");
	wait (3);
	
	PlayFX( level.laser_center, (-13020,20238,2959) ); //second lasers
	PlayFX( level.laser_center, (-15516,20238,2959) );
	
	noti = SpawnStruct(); //text to jumper
	noti.notifyText = "Get to the finish and kill the Activator!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	noti = SpawnStruct(); //text to activator
	noti.notifyText = "Get to the finish and kill the Jumper!";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

	wait (4.5);	
	
	PlayFX( level.laser_center, (-13020,18958,2959) ); //third lasers
	PlayFX( level.laser_center, (-15516,18958,2959) );

	wait (1.5);	
	
	PlayFX( level.laser_center, (-13020,17678,2959) ); //fourth lasers
	PlayFX( level.laser_center, (-15516,17687,2959) );
	acti FreezeControls(0);
	player FreezeControls(0);

}


speedbounce_1() //the bounce pads
{
trigger = getent("speedbounce_1" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}


speedbounce_2()
{
trigger = getent("speedbounce_2" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

speedbounce_3()
{
trigger = getent("speedbounce_3" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

speedbounce_4()
{
trigger = getent("speedbounce_4" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

speedbounce_1_1()
{
trigger = getent("speedbounce_1_1" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}


speedbounce_2_1()
{
trigger = getent("speedbounce_2_1" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

speedbounce_3_1()
{
trigger = getent("speedbounce_3_1" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

speedbounce_4_1()
{
trigger = getent("speedbounce_4_1" , "targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		trigger playsound ("boing");
		bouncerspeed(player);
		wait 0.05;
	}
}

trail_1() //trail fx by Erik
{
	trigger = getent("trail_1" , "targetname");
	trigger waittill ("trigger", player);

//	iprintln ("trailacti");
	playFxOnTag( level.trail_rainbow, player, "pelvis" ); //thanks to Erik!
	trigger maps\mp\_utility::triggerOff();
	wait (17.5);
	trigger maps\mp\_utility::triggerOn();
}

trail_2()
{
	trigger = getent("trail_2" , "targetname");
	trigger waittill ("trigger", player);
	
//	iprintln ("trailjump");
	playFxOnTag( level.trail_rainbow, player, "pelvis" ); //thanks to Erik!
	trigger maps\mp\_utility::triggerOff();
	wait (17.5);
	trigger maps\mp\_utility::triggerOn();
}



bouncerspeed(who) //the actual bounce (changes strength with the fps, thats IWengine, welp)
{
oldpos = who.origin;
playFx ( level.bounce, who.origin );
strenght = 3.75;
	for(i=0;i<strenght;i++)
	{
	who.health += 170;
	who finishPlayerDamage(who, level.jumpattacker, 170, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-90,0,0)), "none", 0);
	}
}



symbol() //symbols Secret made by Erik
{
	randombrusher1 = [];
	randombrusher2 = [];
	randombrusher3 = [];
	randombrusher4 = [];
	randombrusher1 = getEntArray("symbol_row1", "targetname");	
	randombrusher2 = getEntArray("symbol_row2", "targetname");	
	randombrusher3 = getEntArray("symbol_row3", "targetname");	
	randombrusher4 = getEntArray("symbol_row4", "targetname");	
 
    for(i = 0; i < randombrusher1.size; i++)
		randombrusher1[i] symbol_hide();
 
    for(i = 0; i < randombrusher2.size; i++)
		randombrusher2[i] symbol_hide();
 
    for(i = 0; i < randombrusher3.size; i++)
		randombrusher3[i] symbol_hide();
 
    for(i = 0; i < randombrusher4.size; i++)
		randombrusher4[i] symbol_hide();
 
	wait 0.5;
	randombrusher1[randomInt(randombrusher1.size)] symbol_sub(randombrusher1);
	randombrusher2[randomInt(randombrusher2.size)] symbol_sub(randombrusher2);
	randombrusher3[randomInt(randombrusher3.size)] symbol_sub(randombrusher3);
	randombrusher4[randomInt(randombrusher4.size)] symbol_sub(randombrusher4);
}
 
symbol_hide()
{
trigger = getent(self.target,"targetname");
brush = getent(trigger.target,"targetname");
brush hide();
}
 
symbol_sub(array)
{
    for(i = 0; i < array.size; i++)
    {
	array[i].state = false;
	array[i] thread symbol_sub_trigger();
    }
	self.state = true;	
	trigger = getent(self.target,"targetname");
	brush = getent(trigger.target,"targetname");
	brush show();
}
 
symbol_sub_trigger()
{
trigger = getent(self.target,"targetname");
	for(;;)
	{
	trigger waittill("trigger",player);
		if(self.state == true)
		{
		bouncer(player);
		wait 0.05;
		//player transmit(80,2);
		wait 0.05;
		}
		else
		{
			self hide();
			self notSolid();
			wait 3;
			self show();
			self Solid();
		}
	}
}
 
bouncer(who)
{
oldpos = who.origin;
playFx ( level.bounce, who.origin );
strenght = 4;
	for(i=0;i<strenght;i++)
	{
	who.health += 170;
	who finishPlayerDamage(who, level.jumpattacker, 170, 0, "MOD_FALLING", "jump_mp", who.origin, AnglesToForward((-90,0,0)), "none", 0);
	who playsound ("boing");
	}
}

symbol_secret_1()
{
	trigger = getEnt( "symbolsecrettrig_1", "targetname" );
	door = getEnt( "symbolsecret_1", "targetname" );

	trigger waittill( "trigger", who );
	trigger delete();
	
	wait (5);
	
	door PlaySound ("please_mister");

	wait (5);
	
	door movez( 130, 1 );
	door PlaySound ("doorstonesmall");
}

shootweapon_speed() //gets you a random weapon if you are the first to shoot the target in the head
{
	trigger = getEnt( "shootweapon_speed", "targetname" );
	brush = getEnt ("blocker_speed" , "targetname");
	clip = getEnt ("clip_speed" , "targetname");
	targetdummy = getEnt ("target_flip" , "targetname");
	triggerj = getEnt ("getdeaglespeed_j" , "targetname");
	triggera = getEnt ("getdeaglespeed_a" , "targetname");
	triggertdowna = getEnt ("getdeaglespeed_a_tdown" , "targetname");
	triggertdownj = getEnt ("getdeaglespeed_j_tdown" , "targetname");
	weapon = randomInt(6); //random weapon	

	trigger waittill ("trigger", player);
	trigger delete();
	
	PlayFX( level.laser_center, (-13535,13728,3334) );
	PlayFX( level.laser_center, (-15071,13728,3334) );
	targetdummy rotatePitch(-90, 0.5, 0.1, 0.1);
	targetdummy playSound ("headshot");

	clip delete();
	
		switch(weapon)
            {
            case 0:
			player GiveWeapon( "deserteaglegold_mp" );
			wait .01;
			player SwitchToWeapon( "deserteaglegold_mp" );
            break;
            case 1:
			player GiveWeapon( "barrett_mp" );
			wait .01;
			player SwitchToWeapon( "barrett_mp" );
            break;
            case 2:
			player GiveWeapon( "gl_g36c_mp" );
			wait .01;
			player SwitchToWeapon( "gl_g36c_mp" );
            break;
			case 3:
			player GiveWeapon( "mp5_reflex_mp" );
			wait .01;
			player SwitchToWeapon( "mp5_reflex_mp" );
            break;
			case 4:
			player GiveWeapon( "ak74u_mp" );
			wait .01;
			player SwitchToWeapon( "ak74u_mp" );
            break;
			case 5:
			player GiveWeapon( "rpd_grip_mp" );
			wait .01;
			player SwitchToWeapon( "rpd_grip_mp" );
            break;
            }
			
			wait (2.5);
			brush movez( -65, 1 );
			brush PlaySound ("doorstonesmall");
		triggertdownj maps\mp\_utility::triggerOn(); //enable the trigger
		triggertdowna maps\mp\_utility::triggerOn(); //enable the trigger
		
		triggerj maps\mp\_utility::triggerOff(); //disables the trigger
		triggera maps\mp\_utility::triggerOff(); //disables the trigger

}
	

getdeaglespeed_j() //gets the jumper his deagle

{
	trigger = getEnt ("getdeaglespeed_j" , "targetname");
	triggertdownj = getEnt ("getdeaglespeed_j_tdown" , "targetname");
	deaglemodel_j  = getEnt ("deaglemodel_j" , "targetname");
	
	triggertdownj maps\mp\_utility::triggerOff(); //disables the trigger

//	trigger waittill ("trigger", player);
//	trigger delete();
	
		while(isDefined(trigger))
	{
		trigger waittill( "trigger", player );
		trigger sethintstring (" ");
		player GiveWeapon( "deserteaglegold_mp" );
		wait .01;
		player SwitchToWeapon( "deserteaglegold_mp" );
		
		deaglemodel_j playsound ( "mp_oldschool_pickup_01" );
		deaglemodel_j hide();
		noti = SpawnStruct(); //text to jumper
		noti.notifyText = "Shoot the target in the head!";
		noti.duration = 4;
		noti.glowcolor = (0.5,0,1);
		player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

		wait 30;
		trigger sethintstring ("Press ^3[Use]^7 to get a Desert Eagle");
		deaglemodel_j show();
	}
	
}

getdeaglespeed_a() //gets the activator his deagle
{
	trigger = getEnt ("getdeaglespeed_a" , "targetname");
	triggertdowna = getEnt ("getdeaglespeed_a_tdown" , "targetname");
	deaglemodel_a  = getEnt ("deaglemodel_a" , "targetname");

	triggertdowna maps\mp\_utility::triggerOff(); //disables the trigger
//	trigger waittill ("trigger", player);
//	trigger delete();
	
	
		while(isDefined(trigger))
	{
		trigger waittill( "trigger", player );
		trigger sethintstring (" ");
		player GiveWeapon( "deserteaglegold_mp" );
		wait .01;
		player SwitchToWeapon( "deserteaglegold_mp" );
		
		deaglemodel_a playsound ( "mp_oldschool_pickup_01" );
		deaglemodel_a hide();
		noti = SpawnStruct(); //text to activator
		noti.notifyText = "Shoot the target in the head!";
		noti.duration = 4;
		noti.glowcolor = (0.5,0,1);
		player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

		wait 30;
		trigger sethintstring ("Press ^3[Use]^7 to get a Desert Eagle");
		deaglemodel_a show();
	}
}


getdeaglespeed_j_2()
{
	trigger = getEnt ("getdeaglespeed_j_tdown" , "targetname");
	deaglemodel_j  = getEnt ("deaglemodel_j" , "targetname");
	
//	trigger waittill ("trigger", player);
//	trigger delete();
	
		while(isDefined(trigger))
	{
		trigger waittill( "trigger", player );
		trigger sethintstring (" ");
		player GiveWeapon( "deserteaglegold_mp" );
		wait .01;
		player SwitchToWeapon( "deserteaglegold_mp" );
		
		deaglemodel_j playsound ( "mp_oldschool_pickup_01" );
		deaglemodel_j hide();

		wait 30;
		trigger sethintstring ("Press ^3[Use]^7 to get a Desert Eagle");
		deaglemodel_j show();
	}
	
}

getdeaglespeed_a_2()
{
	trigger = getEnt ("getdeaglespeed_a_tdown" , "targetname");
	deaglemodel_a  = getEnt ("deaglemodel_a" , "targetname");

//	trigger waittill ("trigger", player);
//	trigger delete();
	
		while(isDefined(trigger))
	{
		trigger waittill( "trigger", player );
		trigger sethintstring (" ");
		player GiveWeapon( "deserteaglegold_mp" );
		wait .01;
		player SwitchToWeapon( "deserteaglegold_mp" );
		
		deaglemodel_a playsound ( "mp_oldschool_pickup_01" );
		deaglemodel_a hide();

		wait 30;
		trigger sethintstring ("Press ^3[Use]^7 to get a Desert Eagle");
		deaglemodel_a show();
	}
}



ammorestock_j() //ammo refill for the deagle
{
	trig = getEnt( "ammorestock_j", "targetname" );
	ammosound = getEnt( "ammosound", "targetname" );
	
	while(isDefined(trig))
	{
		trig waittill( "trigger", player );
		trig sethintstring (" "); //clears the hintstring
		player SetWeaponAmmoStock( "deserteagle_mp", 300 );
		ammosound playsound ( "mp_oldschool_pickup_01" );
		wait 10;
		trig sethintstring ("Press ^3[Use]^7 to refill your pistol ammo");
	}

}

ammorestock_a() //ammo refill for the deagle
{
	trig = getEnt( "ammorestock_a", "targetname" );
	ammosound = getEnt( "ammosound1", "targetname" );

	while(isDefined(trig))
	{
		trig waittill( "trigger", player );
		trig sethintstring (" ");
		player SetWeaponAmmoStock( "deserteagle_mp", 300 );
		ammosound playsound ( "mp_oldschool_pickup_01" );
		wait 10;
		trig sethintstring ("Press ^3[Use]^7 to refill your pistol ammo");
	}

}



sandstorm() //sandstorm endgame
{
	trigger = getEnt( "sandstorm", "targetname" );
	trigger waittill ("trigger", player);
	song = randomInt(2);
	trigger delete ();
	
	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}

	switch(song)
    {
        case 0:
			acti FreezeControls(1);
			player FreezeControls(1);
		//	player TakeAllWeapons();
			/* level.blackhud = NewHudElem();
			level.blackhud.horzalign = "fullscreen";
			level.blackhud.vertalign = "fullscreen";
			level.blackhud.color = (0,0,0);
			level.blackhud setShader("white", 640, 480 ); */	

			PlayFX( level.sandstorm, (-17180,20395,2326) );
			PlayFX( level.sandstorm, (-18844,20395,2326) );
			PlayFX( level.sandstorm, (-20636,20395,2326) );
			
			PlayFX( level.sandstorm_spray, (-18985,23398,2529) );
			PlayFX( level.sandstorm_spray_fence, (-18985,20472,2412) );
			
			AmbientStop(2);
			MusicStop(2);
			SetExpFog(512, 768, 0.572, 0.508, 0.416, 5);
			wait (2);
			AmbientPlay("sandstorm");

			
			/* level.blackhud.alpha = 1; //creates a half decent fade in from black
			wait (0.05);
			level.blackhud.alpha = 0.9;
			wait (0.05);
				level.blackhud.alpha = 0.8;
			wait (0.05);
				level.blackhud.alpha = 0.7;
			wait (0.05);
				level.blackhud.alpha = 0.6;
			wait (0.05);
				level.blackhud.alpha = 0.5;
			wait (0.05);
				level.blackhud.alpha = 0.4;
			wait (0.05);
				level.blackhud.alpha = 0.3;
			wait (0.05);
				level.blackhud.alpha = 0.2;
			wait (0.05);
				level.blackhud.alpha = 0.1;
			wait (0.05);
				level.blackhud.alpha = 0;
			wait (0.05); */
			
			wait (3.45);

			noti = SpawnStruct();
			noti.titleText = acti.name + " VS " + player.name;
			noti.notifyText = "One Shot, One Kill";
			noti.duration = 6;
			noti.glowcolor = (0,0,1);
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				
			wait (4);
			iprintln ("Song Name: ^3Darude - Sandstorm (Sub Sonik Remix)");
			wait (4);
			
			noti = SpawnStruct(); //text to jumper
			noti.notifyText = "Use your Sniper to kill the Activator!";
			noti.duration = 6;
			noti.glowcolor = (0,0,1);
			player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			
			noti = SpawnStruct(); //text to activator
			noti.notifyText = "Use your Sniper to kill the Jumper!";
			noti.duration = 6;
			noti.glowcolor = (0,0,1);
			acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

			wait (10.5);	
			earthquake(0.10, 480, (-18872,20900,2409), 4000);	

			acti FreezeControls(0);
			player FreezeControls(0);
			break;
		case 1:
			acti FreezeControls(1);
			player FreezeControls(1);
		//	player TakeAllWeapons();
/* 			level.blackhud = NewHudElem();
			level.blackhud.horzalign = "fullscreen";
			level.blackhud.vertalign = "fullscreen";
			level.blackhud.color = (0,0,0);
			level.blackhud setShader("white", 640, 480 ); */
			
//			earthquake(0.3, 30, (-18872,22145,2409), 2500);		
			PlayFX( level.sandstorm, (-17180,20395,2326) );
			PlayFX( level.sandstorm, (-18844,20395,2326) );
			PlayFX( level.sandstorm, (-20636,20395,2326) );
			
			PlayFX( level.sandstorm_spray, (-18985,23398,2529) );
			PlayFX( level.sandstorm_spray_fence, (-18985,20472,2412) );
			
			AmbientStop(2);
			MusicStop(2);
			SetExpFog(512, 768, 0.572, 0.508, 0.416, 5);
			wait (2);
			AmbientPlay("sandstorm_vorn");

			
/* 			level.blackhud.alpha = 1; //creates a half decent fade in from black
			wait (0.05);
			level.blackhud.alpha = 0.9;
			wait (0.05);
				level.blackhud.alpha = 0.8;
			wait (0.05);
				level.blackhud.alpha = 0.7;
			wait (0.05);
				level.blackhud.alpha = 0.6;
			wait (0.05);
				level.blackhud.alpha = 0.5;
			wait (0.05);
				level.blackhud.alpha = 0.4;
			wait (0.05);
				level.blackhud.alpha = 0.3;
			wait (0.05);
				level.blackhud.alpha = 0.2;
			wait (0.05);
				level.blackhud.alpha = 0.1;
			wait (0.05);
				level.blackhud.alpha = 0;
			wait (0.05); */
			
			wait (3.45);

			noti = SpawnStruct();
			noti.titleText = acti.name + " VS " + player.name;
			noti.notifyText = "One Shot, One Kill";
			noti.duration = 6;
			noti.glowcolor = (0,0,1);
			for(i=0;i<players.size;i++)
			players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
				
			wait (4);
			iprintln ("Song Name: ^3Darude - Sandstorm (VORN Remix)");
			wait (4);
			
			noti = SpawnStruct(); //text to jumper
			noti.notifyText = "Use your Sniper to kill the Activator!";
			noti.duration = 8;
			noti.glowcolor = (0,0,1);
			player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
			
			noti = SpawnStruct(); //text to activator
			noti.notifyText = "Use your Sniper to kill the Jumper!";
			noti.duration = 8;
			noti.glowcolor = (0,0,1);
			acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );

			wait (16);	
			earthquake(0.10, 480, (-18872,20900,2409), 4000);	

			acti FreezeControls(0);
			player FreezeControls(0);
		
            break;
	}
}

ammorestock_sand()
{
	trig = getEnt( "refill_sand", "targetname" );
	ammosound = getEnt( "refill_case", "targetname" );
	
	while(isDefined(trig))
	{
		trig waittill( "trigger", player );
		trig sethintstring (" "); //clears the hintstring
		player SetWeaponAmmoStock( "barrett_mp", 300 );
		player SetWeaponAmmoStock( "dragunov_mp", 300 );
		player SetWeaponAmmoStock( "m14_reflex_mp", 300 );
		player SetWeaponAmmoStock( "m21_mp", 300 );
		player SetWeaponAmmoStock( "remington700_mp", 300 );
		ammosound playsound ( "mp_oldschool_pickup_01" );
		wait 2.5;
		trig sethintstring ("Press ^3[Use]^7 to refill your sniper ammo");
	}

}

knifegame() //1vs1 special endgame
{
	trigger = getent ("knifegame","targetname");
	trigger waittill ("trigger", player);
	trigger delete ();

	acti = undefined;
	jumper = undefined;
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "allies" && isAlive(players[i]) )
		{
			jumper = players[i];
			break;
		}
	}
	
	acti FreezeControls(1);
	player FreezeControls(1);
	SetExpFog(1024, 2048, 0.572, 0.508, 0.416, 5);

	AmbientStop(2);
	MusicStop(2);
	wait (2);
	
	AmbientPlay("bennyhill");
	wait (.25);
	PlayFX( level.mist_serious, (-218,-10282,55) ); //mist

	
	noti = SpawnStruct();
	noti.titleText = acti.name + " VS " + player.name;
	noti.notifyText = "Knife Game";
	noti.duration = 4;
	noti.glowcolor = (0,0,1);
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	
	wait (3);
	iprintln ("Song Name: ^3Boots Randolph - Yakety Sax");
	wait (3);
	
	noti = SpawnStruct(); //text to jumper
	noti.titleText = "Run or Attack!";
	noti.notifyText = "The ^1Knife ^7gets traded between you and the Activator";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	noti = SpawnStruct(); //text to activator
	noti.titleText = "Run or Attack!";
	noti.notifyText = "The ^1Knife ^7gets traded between you and the Jumper";
	noti.duration = 6;
	noti.glowcolor = (0,0,1);
	acti thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait (10.5);

	acti FreezeControls(0);
	player FreezeControls(0);
}


knife1vs1() //trades the knife between acti and jumper, thanks to erik for the script!
{
trigger = getEnt("knife1vs1", "targetname");
	for(;;)
	{
	trigger waittill( "trigger", jumper );
	wait (18.5);
	jumper thread knife_sub();
	jumper waittill_any("death", "disconnect");
	level notify("end_knife");
	}
}

knife_sub()
{
level endon("end_knife");
	for(;;)
	{
	level.activ takeallweapons();
	level.activ iprintln ("The knife was taken away from you!");
	self takeallweapons();
	self giveWeapon("knife_mp");
	self SwitchToWeapon("knife_mp");
	self iprintln ("You were given the knife!");
	wait 8 + randomInt(5);
	self takeallweapons();
	self iprintln ("The knife was taken away from you!");
	level.activ takeallweapons();
	level.activ giveWeapon("knife_mp");
	level.activ switchToWeapon("knife_mp");
	level.activ iprintln ("You were given the knife!");
	wait 8 + randomInt(5);
	}
}

tele_symbols() //teleporter to the symbols secret
{
	entTransporter = getentarray( "enter", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}
 
transporter()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

getpistolsymbols() //gets you a deagle
{
	trigger = getEnt ("getpistolsymbols" , "targetname");
	trigger waittill ("trigger", player);
	
		player GiveWeapon( "deserteaglegold_mp" );
		wait .01;
		player SwitchToWeapon( "deserteaglegold_mp" );
		trigger playsound ( "mp_oldschool_pickup_01" );
		trigger delete();
		
	noti = SpawnStruct(); //text to activator
	noti.notifyText = "I wonder where I need this";
	noti.duration = 6;
	noti.glowcolor = (0,0.5,1);
	player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
}

symbols_door_1() //symbols secret (another workaround, yay)
{
	sy_shootme_1 = getEnt( "sy_shootme_1", "targetname" );
	sy_shootme_2 = getEnt( "sy_shootme_2", "targetname" );
	sy_shootme_3 = getEnt( "sy_shootme_3", "targetname" );
	sy_shootme_4 = getEnt( "sy_shootme_4", "targetname" );
	sy_shootme_2 maps\mp\_utility::triggerOff();//turn the other trigs off, so we have to shoot them one by one 1->2->3->4->door opens with tele inside
	sy_shootme_3 maps\mp\_utility::triggerOff();
	sy_shootme_4 maps\mp\_utility::triggerOff();

	sy_shootme_1 waittill( "trigger", player );
	sy_shootme_1 delete();
	player braxi\_rank::giveRankXP( "win", 5);
	sy_shootme_2 maps\mp\_utility::triggerOn();
}

symbols_door_2() //symbols secret
{
	sy_shootme_2 = getEnt( "sy_shootme_2", "targetname" );
	sy_shootme_3 = getEnt( "sy_shootme_3", "targetname" );
	sy_shootme_4 = getEnt( "sy_shootme_4", "targetname" );
	sy_shootme_3 maps\mp\_utility::triggerOff();
	sy_shootme_4 maps\mp\_utility::triggerOff();

	sy_shootme_2 waittill( "trigger", player );
	sy_shootme_2 delete();
	player braxi\_rank::giveRankXP( "win", 5);
	sy_shootme_3 maps\mp\_utility::triggerOn();
}

symbols_door_3() //symbols secret
{
	sy_shootme_3 = getEnt( "sy_shootme_3", "targetname" );
	sy_shootme_4 = getEnt( "sy_shootme_4", "targetname" );
	sy_shootme_4 maps\mp\_utility::triggerOff();

	sy_shootme_3 waittill( "trigger", player );
	sy_shootme_3 delete();
	player braxi\_rank::giveRankXP( "win", 5);
	sy_shootme_4 maps\mp\_utility::triggerOn();
}

symbols_door_4() //symbols secret
{
	sy_shootme_4 = getEnt( "sy_shootme_4", "targetname" );
	door1 = getEnt( "door8_1", "targetname" );
	door2 = getEnt( "door8_2", "targetname" );

	sy_shootme_4 waittill( "trigger", player );
	sy_shootme_4 delete();
	player braxi\_rank::giveRankXP( "win", 10);
	door1 movex( 45, 1 );
	door2 movex( -45, 1 );
	door1 PlaySound ("doorstonesmall");
	door2 PlaySound ("doorstonesmall");
}

symbols_finish() //symbols secret
{
	trigger = getEnt ("symbols_finish" , "targetname");
	trigger waittill ("trigger", player);

	trigger delete();
	
	wait (.5);
    player playlocalsound ("quote_life");
	iprintln("^1"+ player.name + " "+ "^7finished the secret chamber.");
	
		noti = SpawnStruct(); //text to winner
		noti.notifyText = "You earned an additional life and some XP!";
		noti.duration = 5;
		noti.glowcolor = (0.5,0.5,0.5);
		player thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
	wait (.5);
	player braxi\_mod::giveLife();
	wait (.5);
	player braxi\_rank::giveRankXP( "win", 250);
	iprintln("Secret made by Erik");
}

tele_symbols_1()
{
	entTransporter = getentarray( "exit", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter_finish();
	}
}
 
transporter_finish()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
		playFxOnTag( level.trail_rainbow, player, "pelvis" );
	}
}

rpg_grab() //gets you the rpg at the secret
{
	trigger = getEnt ("rpg_grab_trig" , "targetname");
	rpg = getEnt ("rpg_grab" , "targetname");
	trigger waittill ("trigger", player);
	trigger delete();
	
	rpg playsound ("mp_oldschool_pickup_01");
	rpg delete();
	
	player GiveWeapon( "rpg_mp" );
	player giveStartAmmo ( "rpg_mp" );
	player SetWeaponAmmoStock( "rpg_mp", 5 );
	player setWeaponAmmoClip( "rpg_mp", 5 );
	wait (.05);
	player SwitchToWeapon( "rpg_mp" );
	player PlaySoundToPlayer( "look_at_the_size_of_that_thing", player );
	player braxi\_rank::giveRankXP( "win", 25);
}

tele_rpg()
{
	entTransporter = getentarray( "rpg_tele", "targetname" );
 
	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter_rpg();
	}
}

transporter_rpg()
{
	while(true)
	{
		self waittill( "trigger", player );
		self playsound ("breaker");
		wait (.5);
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

cakealie() //im making a note here: huge success!
{
	trigger = getEnt ("cakealie" , "targetname");
	trigger sethintstring("So the Cake wasn't a lie after all...\nIt was just hidden in ^3Serious Sam"); //sets the hintstring on the trigger
	trigger waittill ("trigger", player);
	trigger playsound ("sad_party_horn_01");
	trigger delete();
	
	PlayFX( level.confetti, (355,476,790) );
	player braxi\_rank::giveRankXP( "win", 10);
	wait (1.5);
	player PlaySoundToPlayer( "heh_party_time", player );
}

/////////////////////////////////////////////////////////////////////////
/////////////////////////\ \/////////////////////////////////////////////
////////// _ __    __   \_\ \    ___     ___     ____     __  /////////// 
///////////\`'__\/'__`\ /'_` \ /' _ `\  / __`\  /',__\  /'__`\ //////////
//////////\ \ \//\  __//\ \ \ \/\ \/\ \/\ \ \ \/\__, `\/\  __/ //////////
////////// \ \_\\ \____\ \___,_\ \_\ \_\ \____/\/\____/\ \____\ /////////
//////////  \/_/ \/____/\/__,_ /\/_/\/_/\/___/  \/___/  \/____/ /////////
/////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////