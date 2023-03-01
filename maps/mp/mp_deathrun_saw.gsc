main()
{
level.masterSpawn = spawn("script_origin", (-494,3,82));
level.masterSpawn.angles = (0,0,0);
level.masterSpawn placeSpawnPoint();

	maps\mp\_load::main();
	maps\mp\_teleport::main();
	
    game["allies"] = "sas";
	game["axis"] = "russian";
	game["attackers"] = "allies";
	game["defenders"] = "axis";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	trig = spawn("trigger_radius",(-2277,-2043,210),0,150,250);
	trig.radius = 150;
	trig.targetname = "endmap_trig";
	
	elevatorparts = getentarray("elevator","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread elevator();
	}
	}
	
	elevatorparts = getentarray("elevator2","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread elevator2();
	}
	}
	
	elevatorparts = getentarray("elevator3","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread elevator3();
	}
	}
	
	elevatorparts = getentarray("elevator4","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread elevator4();
	}
	}
	
	elevatorparts = getentarray("platform","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread platform();
	}
	}
	
	elevatorparts = getentarray("platform2","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread platform2();
	}
	}
	
	elevatorparts = getentarray("platform3","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread platform3();
	}
	}
	
	elevatorparts = getentarray("platform4","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread platform4();
	}
	}
	
	elevatorparts = getentarray("bobbing","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread bobbing();
	}
	}
	
	elevatorparts = getentarray("bobbing2","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread bobbing2();
	}
	}
	
	elevatorparts = getentarray("bobbing3","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread bobbing3();
	}
	}
	
	elevatorparts = getentarray("bobbing4","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread bobbing4();
	}
	}
	
	elevatorparts = getentarray("secret","targetname");
	if(isdefined(elevatorparts))
	{
	for(i=0;i<elevatorparts.size;i++)
	{
	wait(0.05);
	elevatorparts[i] thread secret();
	}
	}
	
	thread startdoor();
	// thread platform();
	// thread platform2();
	// thread platform3();
	// thread platform4();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap_spikes_left();
	thread elevator();
	thread elevator2();
	thread elevator3();
	thread elevator4();
	thread twister();
	thread twister2();
	thread teleportsniperroom();
	thread teleportjump();
	
	thread addTriggerToList( "trigger_spikes" );
	
	}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
 
startdoor()
{
door = getent("rise1","targetname");
wait(15);
iPrintLnBold("^4 Start Door is opening"); //Change the message if you want
door movez(200,10,1,9);
door waittill ("movedone");
}

trap1()
{
door = getent("trap","targetname");
trig = getEnt( "doors_trig", "targetname" );

trig waittill("trigger");
trig delete();
{	
door movez(320,2,0.5,1);
door waittill ("movedone");
}
}

 trap2()
{
door2=getent("trap2","targetname");
trig2 = getEnt( "doors_trig2", "targetname" );

trig2 waittill("trigger");
trig2 delete();
	
door2 movez(320,2,0.5,1);
door2 waittill ("movedone");
}

trap_spikes_left()
{
spikes = getEntarray("trap_spikes_left", "targetname");
hurt = getEnt("spikes_hurt", "targetname");	
level.spiketrig = getEnt("trigger_spikes", "targetname");
distance = 220; //change this to change the distance the spikes will travel
time = 2; //change this to make the spikes faster or slower
level.spiketrig waittill("trigger", player);
level.spiketrig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled)
{
player iPrintLnBold(""); //Change the message if you want
}
else
{
for(i=0;i<spikes.size;i++)
{
wait(0.05);
spikes[i] movex(220,1);
hurt.origin += (220,0,0);
spikes[i] waittill("movedone");
spikes[i] movex(-220,1);
spikes[i] waittill("movedone");
hurt delete();
}
}
}

elevator()
{
trigger = getEnt("trigger_elevator", "targetname");
trigger waittill("trigger", player);
trigger delete();
while(1)
{
wait(0.05);
self movez(440, 5, 1, 4);
self waittill("movedone");
wait(1);
self movez(-440, 6, 1, 5);
self waittill("movedone");
wait(2);
} 
}

elevator4()
{
trigger = getEnt("trigger_elevator4", "targetname");
trigger waittill("trigger", player);
trigger delete();
while(1)
{
wait(0.05);
self movez(-360, 5, 1, 4);
self waittill("movedone");
wait(1);
self movez(360, 6, 1, 5);
self waittill("movedone");
wait(2);
} 
}

elevator2()
{
trigger = getEnt("trigger_elevator2", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(100, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-100, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

elevator3()
{
trigger = getEnt("trigger_elevator3", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(100, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-100, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

trap3()
{
	trig = getEnt( "trigger3", "targetname" );
	brush = getEnt( "trap3", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 4; i++ )
	{
		brush rotateroll( 180, 2 );
		wait 2;
	}
	brush.angles = (0,0,0);
}

platform()
{
trigger = getEnt("trigger_platform", "targetname");
trigger waittill("trigger", player);
trigger delete();
while(1)
{
wait(0.05);
self movex(-340, 3, 1, 2);
self waittill("movedone");
wait(0.5);
self movex(340, 3, 1, 2);
self waittill("movedone");
wait(0.5);
} 
}

platform2()
{
// trigger = getEnt("trigger_platform2", "targetname");
// trigger waittill("trigger", player);
// trigger delete();
while(1)
{
wait(0.05);
self movex(400, 3, 1, 2);
self waittill("movedone");
wait(0.5);
self movex(-400, 3, 1, 2);
self waittill("movedone");
wait(0.5);
} 
}

platform3()
{
// trigger = getEnt("trigger_platform3", "targetname");
// trigger waittill("trigger", player);
// trigger delete();
while(1)
{
wait(0.05);
self movey(-200, 3, 1, 2);
self waittill("movedone");
wait(0.5);
self movey(200, 3, 1, 2);
self waittill("movedone");
wait(0.5);
} 
}

platform4()
{
// trigger = getEnt("trigger_platform4", "targetname");
// trigger waittill("trigger", player);
// trigger delete();
while(1)
{
wait(0.05);
self movey(400, 3, 1, 2);
self waittill("movedone");
wait(0.5);
self movey(-400, 3, 1, 2);
self waittill("movedone");
wait(0.5);
} 
}

twister()
{
	trig = getEnt( "trigger_twister", "targetname" );
	brush = getEnt( "twister", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 4; i++ )
	{
		brush rotateyaw( 360, 2 );
		wait 2;
	}
	brush.angles = (0,0,0);
}

twister2()
{
	trig = getEnt( "trigger_twister2", "targetname" );
	brush = getEnt( "twister2", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	for( i = 0; i < 4; i++ )
	{
		brush rotateyaw( -360, 2 );
		wait 2;
	}
	brush.angles = (0,0,0);
}

bobbing()
{
trigger = getEnt("trigger_bobbing", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

bobbing2()
{
trigger = getEnt("trigger_bobbing2", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

bobbing3()
{
trigger = getEnt("trigger_bobbing3", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

bobbing4()
{
trigger = getEnt("trigger_bobbing4", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(0.01);
self movez(210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
self movez(-210, 2, 0.5, 1);
self waittill("movedone");
wait(0.5);
} 
}

secret()
{
trigger = getEnt("trigger_secret", "targetname");
trigger waittill("trigger");
trigger delete();
while(1)
{
wait(15);
self movey(7, 8, 1, 2);
self waittill("movedone");
wait(10);
self movey(-7, 3, 1, 2);
wait(0.5);
} 
}

teleportsniperroom()
{	
level.actorigin = getEnt("sniperact", "targetname");
teleorigin = getEnt("teleport_origin", "targetname");
level.snipertrigger = getEnt("trigger_gamedoor_sniper", "targetname");
for(;;)
{
level.snipertrigger waittill("trigger", player);
///////RESPECT SCRIPT/////////////////////////
        if(!player sr\api\_deathrun::order())
            continue;
	///////RESPECT SCRIPT END/////////////////////////
level.classictrigger delete();
level.jumpertrigger delete();
wait(0.05);
player SetOrigin( teleorigin.origin );
player setplayerangles( teleorigin.angles );
wait(0.05);
iPrintLnBold(player.name+ "^1 has entered the sniper room"); //Change the message if you want
player takeallweapons();
player GiveWeapon("m40a3_mp");
player SwitchToWeapon( "m40a3_mp" );
level.activ SetOrigin( level.actorigin.origin );
level.activ setplayerangles( level.actorigin.angles );
wait(0.05);
level.activ takeallweapons();
level.activ GiveWeapon("m40a3_mp");
level.activ GiveWeapon("remington700_mp");
level.activ SwitchToWeapon( "m40a3_mp" );
level.actorigin delete();
}
}

teleportjump()
{
level.teleactorigin = getEnt("jumperact", "targetname");
telejumporigin = getEnt("telejump", "targetname");
level.jumpertrigger = getEnt("teleportjumproom", "targetname");
for(;;)
{
level.jumpertrigger waittill("trigger", player);
///////RESPECT SCRIPT/////////////////////////
        if(!player sr\api\_deathrun::order())
            continue;
	///////RESPECT SCRIPT END/////////////////////////
level.classictrigger delete();
level.snipertrigger delete();
wait(0.05);
player SetOrigin( telejumporigin.origin );
player setplayerangles( telejumporigin.angles );
wait(0.05);
level.activ SetOrigin (level.teleactorigin.origin);
level.activ setplayerangles (level.teleactorigin.angles);
level.teleactorigin delete();
iPrintLnBold(player.name+ "^1 has entered the JumpersRoom"); //Change the message if you want
}
}
