main()
{
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
	setDvar( "compassmaxrange", "1024" );

	// total traps: 8
	// activated by user: 7
	// always active (and, or hidden): 2
	thread trap_1();
	thread trap_2();
	thread trap_3();
	thread trap_4_1();
	thread trap_4_2();
	thread auto_1();
	thread auto_2();
	thread auto_3();
	thread trap_5();
	thread final();
	thread final2();

	// BraX >>>
	addTriggerToList( "switch" );
	addTriggerToList( "trigger2" );
	addTriggerToList( "trigger4" );
	addTriggerToList( "trigger3" );
	addTriggerToList( "trigger5" );
	
	// HEY HEY REDNOSE WAS HERE!!!
}


addTriggerToList( targetname )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( targetname, "targetname" );
}
// <<< BraX

trap_1()
{
elevator=getent("elevator","targetname");
trig=getent("switch","targetname");
while(1)
{
trig waittill ("trigger");
trig delete();
elevator movez (316,0.5,0,0);
elevator waittill ("movedone");
wait(1);
elevator movez (-316,5,3,0);
elevator waittill ("movedone");

}
}


auto_1()
{
	brush1 = getEnt( "brush1", "targetname" );
	brush2 = getEnt( "brush2", "targetname" );

while (1)
{
	brush1 movez(-208,2);
	brush2 movez(208,3);
	wait 3;
	brush1 movez(208,2);
	brush2 movez(-208,3);
	wait 3;


}
}

trap_2()
{
	trap=getent("trap_2_1","targetname");
	trap2=getent("trap_2_2","targetname");
	trap3=getent("trap_2_3","targetname");
	trap4=getent("trap_2_4","targetname");
	trap5=getent("trap_2_5","targetname");
	trap6=getent("trap_2_6","targetname");
	trap7=getent("trap_2_7","targetname");
	trap8=getent("trap_2_8","targetname");
	trap9=getent("trap_2_9","targetname");
	trap10=getent("trap_2_10","targetname");
	trap11=getent("trap_2_11","targetname");
	trap12=getent("trap_2_12","targetname");
	trap13=getent("trap_2_13","targetname");
	trap14=getent("trap_2_14","targetname");
	trap15=getent("trap_2_15","targetname");
	trap16=getent("trap_2_16","targetname");
	trap17=getent("trap_2_17","targetname");
	trap18=getent("trap_2_18","targetname");
	trap19=getent("trap_2_19","targetname");
	trig=getent("trigger2","targetname");
	while(1)
	{
		trig waittill ("trigger");
		trig delete();
		trap movex (528,0.1,0,0);
		trap2 movex (544,0.2,0,0);
		trap3 movex (560,0.3,0,0);
		trap4 movex (576,0.4,0,0);
		trap5 movex (592,0.5,0,0);
		trap6 movex (608,0.6,0,0);
		trap7 movex (624,0.7,0,0);
		trap8 movex (640,0.8,0,0);
		trap9 movex (656,0.9,0,0);
		trap10 movex (672,1,0,0);
		trap11 movex (688,1.1,0,0);
		trap12 movex (704,1.2,0,0);
		trap13 movex (720,1.3,0,0);
		trap14 movex (736,1.4,0,0);
		trap15 movex (752,1.5,0,0);
		trap16 movex (768,1.6,0,0);
		trap17 movex (784,1.7,0,0);
		trap18 movex (800,1.8,0,0);
		trap19 movex (816,1.9,0,0);
		trap waittill ("movedone");
		trap2 waittill ("movedone");
		trap3 waittill ("movedone");
		trap4 waittill ("movedone");
		trap5 waittill ("movedone");
		trap6 waittill ("movedone");
		trap7 waittill ("movedone");
		trap8 waittill ("movedone");
		trap9 waittill ("movedone");
		trap10 waittill ("movedone");
		trap11 waittill ("movedone");
		trap12 waittill ("movedone");
		trap13 waittill ("movedone");
		trap14 waittill ("movedone");
		trap15 waittill ("movedone");
		trap16 waittill ("movedone");
		trap17 waittill ("movedone");
		trap18 waittill ("movedone");
		trap19 waittill ("movedone");
		wait 1;
		trap movex (-528,5,3,0);
		trap2 movex (-528,5,3,0);
		trap3 movex (-528,5,3,0);
		trap4 movex (-528,5,3,0);
		trap5 movex (-528,5,3,0);
		trap6 movex (-528,5,3,0);
		trap7 movex (-528,5,3,0);
		trap8 movex (-528,5,3,0);
		trap9 movex (-528,5,3,0);
		trap10 movex (-528,5,3,0);
		trap11 movex (-528,5,3,0);
		trap12 movex (-528,5,3,0);
		trap13 movex (-528,5,3,0);
		trap14 movex (-528,5,3,0);
		trap15 movex (-528,5,3,0);
		trap16 movex (-528,5,3,0);
		trap17 movex (-528,5,3,0);
		trap18 movex (-528,5,3,0);
		trap19 movex (-528,5,3,0);
		trap waittill ("movedone");
		trap2 waittill ("movedone");
		trap3 waittill ("movedone");
		trap4 waittill ("movedone");
		trap5 waittill ("movedone");
		trap6 waittill ("movedone");
		trap7 waittill ("movedone");
		trap8 waittill ("movedone");
		trap9 waittill ("movedone");
		trap10 waittill ("movedone");
		trap11 waittill ("movedone");
		trap12 waittill ("movedone");
		trap13 waittill ("movedone");
		trap14 waittill ("movedone");
		trap15 waittill ("movedone");
		trap16 waittill ("movedone");
		trap17 waittill ("movedone");
		trap18 waittill ("movedone");
		trap19 waittill ("movedone");
		
	}

}

trap_4_1()
{
	trap=getent("trap_4_1","targetname");
	doors=getent("doors","targetname");
	trig=getent("trigger4","targetname");
	while(1)
	{
		trig waittill ("trigger");
		trig delete();
		doors movex (-79,1,0,0);
		wait 2;
		trap movex (316,1,0,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movez (-56,0.3,0);
		trap waittill ("movedone");;
		wait 0.1;
		trap movex (-564,2,0,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movez (32,0.3,0);
		trap waittill ("movedone");
		wait 0.1;
		trap movex (564,2,0,0);
		trap waittill ("movedone");
		wait 2;
		doors movex (79,1,0,0);

	}

}

trap_4_2()
{
	trap2=getent("trap_4_2","targetname");
	trig=getent("trigger4","targetname");
	while(1)
	{
		trig waittill ("trigger");
		wait 3;
		trap2 movex (564,1,0,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movez (32,0.3,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movex (-564,2,0,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movez (-32,0.3,0);
		trap2 waittill ("movedone");
		wait 0.1;
		trap2 movex (564,2,0,0);
		trap2 waittill ("movedone");

	}

}




auto_2()
{

	brush = getEnt( "trap_3", "targetname" );

	while (1)
	{
		brush rotateYaw( 360, 2 );
		wait 1;
	}
}

trap_3()
{
	trig = getEnt( "trigger3", "targetname" );
	brush = getEnt( "trap_3", "targetname" );


	while (1)
	{
		trig waittill ("trigger");
		trig delete();
		brush movez (-200,1,0,0);
		brush waittill ("movedone");
		wait(2);
		brush movez (200,3,0,0);
		brush waittill ("movedone");
	}
}

auto_3()
{
	brushGroup = getEnt( "auto_2_1", "targetname" );
	brush = getEnt( "auto_2_2", "targetname" );

while (1)
{
	brushGroup movex(80,0.2);
	brush movez(-80,0.2);
	wait 0.2;
	brushGroup movez(-80,0.2);
	brush movex(-80,0.2);
	wait 0.2;
	brushGroup movex(-80,0.2);
	brush movez(80,0.2);
	wait 0.2;
	brushGroup movez(80,0.2);
	brush movex(80,0.2);
	wait 0.2;


}
}

trap_5()
{
	trig = getEnt( "trigger5", "targetname" );
	brush = getEnt( "trap_5", "targetname" );

	trig waittill( "trigger", who );
	trig delete();

	while (1)
	{
		brush rotateYaw( -360, 2 );
		wait 1;
	}
}

final()
{
	door = getEnt( "door_final", "targetname" );
	clip = getEnt( "clip_final", "targetname" );
	trig = getEnt( "trig_final", "targetname" );

for (i=0;i<1;i++)
{
trig waittill ("trigger");
trig delete();
	door movex(600,1);
	clip movez(-200,0.2);
	wait 0.2;
}
}

final2()
{
	door = getEnt( "door_final", "targetname" );
	stairs = getEnt( "final_stairs1", "targetname" );
	stairs2 = getEnt( "final_stairs2", "targetname" );
	stairs3 = getEnt( "final_stairs3", "targetname" );
	stairs4 = getEnt( "final_stairs4", "targetname" );
	stairs5 = getEnt( "final_stairs5", "targetname" );
	stairs6 = getEnt( "final_stairs6", "targetname" );
	stairs7 = getEnt( "final_stairs7", "targetname" );
	stairs8 = getEnt( "final_stairs8", "targetname" );
	trig = getEnt( "trig_final2", "targetname" );

for (i=0;i<1;i++)
{
trig waittill ("trigger");
trig delete();
	stairs movex (-584,0.2);
	stairs2 movex (-552,0.4);
	stairs3 movex (-520,0.6);
	stairs4 movex (-488,0.8);
	stairs5 movex (-456,1);
	stairs6 movex (-424,1.2);
	stairs7 movex (-392,1.4);
	stairs8 movex (-360,1.6);
	door movez(-440,2);
	wait 0.2;
}
}