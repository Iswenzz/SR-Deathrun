//////////////////////////////////////////////////////////////
//////////////////////map by jerkan///////////////////////////
//////////////////////////////////////////////////////////////
/////////////////////XFire: jerkan18//////////////////////////
//////////////////////////////////////////////////////////////
///////////////////e-mail: jerkan@net.hr//////////////////////
//////////////////////////////////////////////////////////////
////////////////www.jerkanmaps.weebly.com/////////////////////
//////////////////////////////////////////////////////////////

main()

{
trigger = spawn("trigger_radius", (-3499.54, -2704.88, 64.125), 0, 96, 48);
trigger.targetname = "endmap_trig";
trigger.radius = 96;
	
	maps\mp\_load::main();
	
	maps\mp\_compass::setupMiniMap("compass_map_mp_dr_sm_world");


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
	setdvar("compassmaxrange","2000");

	//setdvar("dr_timelimit","5");

	trigger = spawn( "trigger_radius", (-3499.54, -2704.88, 64.125), 0, 96, 48 );
		trigger.targetname = "endmap_trig";
		trigger.radius = 96;

	thread expandTimeLimit( 2 ); //time in min


	//scripte
	//*********************************************

	thread end_sr();

	maps\mp\mp_dr_sm_world_fx::main();
	maps\mp\super_mario_scripts\dodaci::main();
	maps\mp\super_mario_scripts\kornjace::main();
	maps\mp\super_mario_scripts\teleport::main();
	maps\mp\super_mario_scripts\gljive::main();
	maps\mp\super_mario_scripts\zvukovi::main();
	maps\mp\super_mario_scripts\letece_kornjace::main();
	maps\mp\super_mario_scripts\letece_kornjace2::main();
	maps\mp\super_mario_scripts\extra::main();
	maps\mp\super_mario_scripts\slidedoor::main();
	maps\mp\super_mario_scripts\slidedoor2::main();
	maps\mp\super_mario_scripts\trap1::main();
	maps\mp\super_mario_scripts\trap2::main();
	maps\mp\super_mario_scripts\trap3::main();
	maps\mp\super_mario_scripts\trap4::main();
	maps\mp\super_mario_scripts\trap5::main();
	maps\mp\super_mario_scripts\trap6::main();
	maps\mp\super_mario_scripts\trap7::main();
	maps\mp\super_mario_scripts\trap8::main();
	maps\mp\super_mario_scripts\trap9::main();
	maps\mp\super_mario_scripts\trap10::main();
	maps\mp\super_mario_scripts\trap11::main();
	maps\mp\super_mario_scripts\trap12::main();
	maps\mp\super_mario_scripts\trap13::main();
	maps\mp\super_mario_scripts\trap14::main();
	maps\mp\super_mario_scripts\trap15::main();
	maps\mp\super_mario_scripts\old::main();
	maps\mp\super_mario_scripts\sniper::main();
	maps\mp\super_mario_scripts\weapons::main();

	ambientPlay("mario_ambient");

	thread addtrapstofreerun();
	thread addtestclients();
}

end_sr()
{
	t1 = spawn("trigger_radius",(-3311,-2909,124-40),0,100,200);

	t1 thread endmap();
}

endmap()
{
	while(1)
	{
		self waittill("trigger",player);

		if(player.pers["team"] == "axis")
    		continue;

		if(isDefined(player.already_check) && player.already_check)
			continue;

		if(!player sr\api\_deathrun::order())
			player thread endmap_sefe();
        else
        {
        	player.already_check = true;
        	player thread already_check_reset();
        }
	}
}

endmap_sefe()
{
	self endon("death");
	self endon("disconnect");

	self freezeControls(1);
	self setOrigin(getEnt("endmap_trig","targetname").origin);
	wait 0.05;
	self freezeControls(0);
}

already_check_reset()
{
	self endon("disconnect");
	self waittill("death");

	self.already_check = undefined;
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
addtrapstofreerun()
{
	addTriggerToList("trap1_trigger");
	addTriggerToList("trap2_trigger");
	addTriggerToList("trap3_trigger");
	addTriggerToList("trap4_trigger");
	addTriggerToList("trap5_trigger");
	addTriggerToList("trap6_trigger");
	addTriggerToList("trap7_trigger");
	addTriggerToList("trap8_trigger");
	addTriggerToList("trap9_trigger");
	addTriggerToList("trap10_trigger");
	addTriggerToList("trap11_trigger");
	addTriggerToList("trap12_trigger");
	addTriggerToList("trap13_trigger");
	addTriggerToList("trap14_trigger");
	addTriggerToList("trap15_trigger");

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

expandTimeLimit( additional_time )
{
    wait 0.05; //wait for game to load mod script
    level.dvar["time_limit"] += additional_time;
}
