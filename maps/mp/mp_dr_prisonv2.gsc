///-----------------------------------------------------------------------------------------------------------
// door script
//-----------------------------------------------------------------------------------------------------------

#include maps\mp\_utility;

main()
{
	thread scripted_door();
}

//-----------------------------------------------------------------------------------------------------------

scripted_door()
{
	//doortrigger 	= getentarray("doortrig",	"targetname");


	//if( isdefined(doortrigger))
	//{
		//for (i = 0; i < doortrigger.size; i++)
		//{
			//doortrigger[i] thread door_think();
		//}	
	//}
	array_thread(getentarray ("doortrig","targetname"), ::door_think);
}

//-----------------------------------------------------------------------------------------------------------

door_think()
{
	while (1)
	{
		self waittill ("trigger");
		
		thread door_move_modified();
	}
}

//-----------------------------------------------------------------------------------------------------------
// nach n sekunden automatisch schliessen
//-----------------------------------------------------------------------------------------------------------

door_move_modified()
{
	rot = -3600;

	time = 8;
	acc  = time/2;
	dec  = time/2;

	doormodel = getent(self.target, "targetname");
	
	org = doormodel getorigin();
	orgx = org[0];
	orgy = org[1];
	orgz = org[2];

	self playsound("door_mp_MAPNAME");

	// Trigger deaktivieren
	self triggerOff();

	// Tuer oeffnen
	doormodel rotateyaw (rot, time, acc, dec);
	wait(time - 0.1);

	// n sekunden warten
	wait(5);

	self playsound("door_mp_MAPNAME");

	// tuer schliessen
	doormodel rotateyaw (rot*-1, time, acc, dec);
	wait(time - 0.1);

	// trigger anschalten
//trigdoor delete ();
	self triggerOn();
}

//-----------------------------------------------------------------------------------------------------------
// IW Function

array_thread( entities, process, var, exclusions )
{
	if ( !isDefined( exclusions ) )
		exclusions = [];
		
	for ( index = 0; index < entities.size; index++ )
	{
		exclude = false;
		for ( exIndex = 0; exIndex < exclusions.size; exIndex++ )
		{
			if ( entities[index] != exclusions[exIndex] )
				exclude = true;
		}
		
		if ( exclude )
			continue;
			
		if ( isDefined( var ) )
			entities[index] thread [[process]]( var );
		else
			entities[index] thread [[process]]();
	}

thread doora () ;
thread dvericka () ;
thread dvere1 () ;
thread dvere2 () ;
}
doora ()
{
trigdoor = getent ("mujtrigger" , "targetname");
doora = getent ("mujbrush" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
doora moveZ (-200 , 1);
wait 12;
doora moveZ (200 , 14);
doora waittill ("movedone");

}

dvericka()
{
trigdoor = getent ("dverickatrig" , "targetname");
dvericka = getent ("dvericka" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
dvericka moveY (-300 , 1);
wait 4;
dvericka moveY (300 , 5);
dvericka waittill ("movedone");
}

dvere1()
{
trigdoor = getent ("dvere1trig" , "targetname");
dvere1 = getent ("dvere1" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
dvere1 moveZ (285 , 2);
wait 3;
dvere1 moveY (-300 , 2);
wait 3;
dvere1 moveY (300 , 4);
wait 3;
dvere1 moveZ (-285 , 5);

dvere1 waittill ("movedone");
}

dvere2 ()
{
trigdoor = getent ("mujtrigger1" , "targetname");
dvere2 = getent ("mujbrush1" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
dvere2 moveZ (10000 , 1);
dvere2 waittill ("movedone");

}