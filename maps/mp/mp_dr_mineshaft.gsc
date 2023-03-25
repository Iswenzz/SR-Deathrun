// Map: mp_Derpyrobin3
// Made by: Robin 

main() 
{
maps\mp\_load::main();

  precacheItem("rpg_mp");
  precacheItem("m40a3_mp"); 
  precacheItem("knife_mp");
   precacheItem("ak74u_mp");
  
  ambientPlay("kasbohorizon");

 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";
 
 //guid
 thread guid();
 
 //rotate activator handler
 thread actiTrapInArray();
 
 //Startingdoor
 thread startDoor();
 
 //minecart
 thread minecart();
 thread minecart_teleport();
 
 
 //traps
 thread trap1();
 thread trap2();
 thread trap3();
 thread trap4();
 thread trap5();
 thread trap6();
 thread trap7();
 thread trap8();
 thread trap9();
 thread trap10();
 thread trap11();
 thread trap12();
 thread trap13();
 thread trap14();
 thread trap15();
 thread trap16();
 thread trap17();

				//adds trigger to list so you cant activate on free run
 				addTriggerToList( "trap1_trig" );
				addTriggerToList( "trap2_trig" );
				addTriggerToList( "trap3_trig" );
 				addTriggerToList( "trap4_trig" );
				addTriggerToList( "trap5_trig" );
				addTriggerToList( "trap6_trig" );
 				addTriggerToList( "trap7_trig" );
				addTriggerToList( "trap8_trig" );
				addTriggerToList( "trap9_trig" );
 				addTriggerToList( "trap10_trig" );
				addTriggerToList( "trap11_trig" );
				addTriggerToList( "trap12_trig" );
 				addTriggerToList( "trap13_trig" );
				addTriggerToList( "trap14_trig" );
				addTriggerToList( "trap15_trig" );
 				addTriggerToList( "trap16_trig" );
				addTriggerToList( "trap17_trig" );

 thread platform5();
 
 thread eersteGrotVierkanten();
 thread tweedeGrotVierkanten();
 
 thread liftElevatorDing();
 
 thread vierkantenNaarBeneden();

 thread liftenSpikeRoom1();
 thread liftenSpikeRoom2();
 thread liftenSpikeRoom3();
  
 thread heenEnWeer_thread();

thread mineblokje1();
thread mineblokje2();

 thread minelift2();

//Endrooms
thread knifeRoom();
thread bounceRoom();
thread sniperRoom();

//secret
thread secret();

//variabelen
level.vierkantenNotStarted = false;
level.secretActivated = false;

thread bounceroom_secretBouncesInArray();
}


	addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
} 


//Guid
guid()
{
	trig = getEnt("guid_trig","targetname");
	
	guidRobin = false;
	guidDubzy = false;
	guidGenesis = false;
	
	while(true) {
			trig waittill("trigger", player);
			{
			if (player getGuid() == "5f783dc7e863a84cd002257f3b16d6b1" && guidRobin == false) {
			  iPrintlnBold("^5 The boon who made this awful map is in ^3 the server:CC");
			  iPrintlnBold("^5 dont hate me pls");	  	
			 player GiveWeapon("rpg_mp");
			 player SwitchToWeapon("rpg_mp");
		 	player GiveMaxAmmo( self.pers["rpg_mp"] );
			guidRobin = true;
			
		  }
			  
		 else if (player getGuid() == "4a02a407846f1511ea254f9da0ad3ac3" && guidDubzy == false) {
			 iPrintlnBold("^3 Dubzy is in the house!!!!");
			 iPrintlnBold("^3 yus yus");
			 player GiveWeapon("rpg_mp");
			 player SwitchToWeapon("rpg_mp");
			player GiveMaxAmmo( self.pers["rpg_mp"] );
			guidDubzy = true;
		  }
			  
			  
		  else if (player getGuid() == "64d34a3b7d6b0894a463f38d45203980" && guidGenesis == false) {
			  iPrintlnBold("^4 it's Genesis^^");
	   		  iPrintlnBold("^4 Special thanks to him");
			  player GiveWeapon("rpg_mp");
			  player SwitchToWeapon("rpg_mp");
			  guidGenesis = false;
			 }
			 
		  else if (player getGuid() == "8dac71a52f5a77bee5ac0r1712ce8ccf" && guidRobin == false) {
			  iPrintlnBold("^5 The boon who made this awful map is in ^3 the server:CC");
			  iPrintlnBold("^5 dont hate me pls");	  	
			 player GiveWeapon("rpg_mp");
			 player SwitchToWeapon("rpg_mp");
		 	player GiveMaxAmmo( self.pers["rpg_mp"] );
			guidRobin = true;
			
		  }
		    
			else {
				player iPrintlnBold("^3 Acces denied!");
			 }
			 
	}
	}
}


startDoor()
{	
	door1 = getEnt("startDoor1","targetname");
	door2 = getEnt("startDoor2","targetname");
	
	
	wait(15);
	{
	
	door1 moveY(600,8,1,1);
	door2 moveY(-600,8,1,1);
	door2 waittill("movedone");
	}

}

rotateActiTrap(trapNumber)
{
	if(trapNumber < 8){	
		level.trap[trapNumber]  notsolid();
		level.trap[trapNumber] rotatePitch(-100,2);
		level.trap[trapNumber]  waittill("rotatedone");
		}
	else{
		level.trap[trapNumber]  notsolid();
		level.trap[trapNumber] rotateRoll(100,2);
		level.trap[trapNumber]  waittill("rotatedone");
	}
}

actiTrapInArray()
{
		level.trap = [];
		level.trap[0] = getEnt("trapActivators","targetname");
		level.trap[1] = getEnt("trapActivators2","targetname");
		level.trap[2] = getEnt("trapActivators3","targetname");
		level.trap[3] = getEnt("trapActivators4","targetname");
		level.trap[4] = getEnt("trapActivators5","targetname");//by accident lol but too much work to do over
		level.trap[5] = getEnt("trapActivators17","targetname");
		level.trap[6] = getEnt("trapActivators6","targetname");
		level.trap[7] = getEnt("trapActivators7","targetname");
		level.trap[8] = getEnt("trapActivators8","targetname");
		level.trap[9] = getEnt("trapActivators9","targetname");
		level.trap[10] = getEnt("trapActivators10","targetname");
		level.trap[11] = getEnt("trapActivators11","targetname");
		level.trap[12] = getEnt("trapActivators12","targetname");
		level.trap[13] = getEnt("trapActivators13","targetname");
		level.trap[14] = getEnt("trapActivators14","targetname");
		level.trap[15] = getEnt("trapActivators15","targetname");
		level.trap[16] = getEnt("trapActivators16","targetname");
}



trap1() 
{
	trig = getEnt("trap1_trig","targetname");

  
	trig waittill("trigger");
	thread rotateActiTrap(0);
	trig setHintString ("^3Activated!"); 
	
	{
	thread trap1_move1();
	thread trap1_move2();
	}
}

trap1_move1()
{
		mover = getEnt("platform1","targetname");
		push1 = getEnt("platform1_push_1","targetname");
		
		push1 moveY(199,1);
		push1 waittill("movedone");
		
		while(true)
		{
		push1 moveY(-199,1);
		mover moveY(-199,1);
		mover waittill("movedone");
		wait(1.5);
		push1 moveY(199,1);
		mover moveY(199,1);	
		mover waittill("movedone");
		wait(1.5);
		}
}

trap1_move2()
{
		mover = getEnt("platform2","targetname");
		push2 = getEnt("platform1_push_2","targetname");
		
		push2 moveY(-199,1);
		push2 waittill("movedone");
		
		while(true)
		{
		push2 moveY(199,1);
		mover moveY(199,1);
		mover waittill("movedone");
		wait(1.5);
		push2 moveY(-199,1);
		mover moveY(-199,1);
		mover waittill("movedone");
		wait(1.5);
		}
}

trap2()
{
	
	push1 = getEnt("platform4_push1","targetname");
	push2 = getEnt("platform4_push2","targetname");
	trig = getEnt("trap2_trig","targetname");
	trapActivator = getEnt("trapActivator","targetname");
  
	trig waittill("trigger");
	thread rotateActiTrap(1);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		push1 rotatePitch(360,4);
		wait(4);
		push2 rotatePitch(360,4);
		wait(4);
	
	}
}


trap3() 
{

	spikes = getEnt("trap3_spikes","targetname");
	trig = getEnt("trap3_trig","targetname");
	hurt = getEnt("trap3_spikes_hurt","targetname");
		
	hurt enablelinkto();
	hurt linkto(spikes); 
	
	trig waittill("trigger"); 
	thread rotateActiTrap(2);
	trig setHintString ("^3Activated!"); 
	{
		thread trap3_safeplaceBoven();
		wait(1);
		spikes moveZ(-266,3);
		spikes waittill("movedone");
		wait(3);
		spikes moveZ(266,3);
		spikes waittill("movedone");
		thread safePlaceA();
		thread safePlaceB();
	}

}

trap3_safeplaceBoven()
{
	platform = getEnt("trap3_safeplaceBoven","targetname");
	hurt = getEnt("trap3_safeplaceBoven_hurt","targetname");

	hurt enablelinkto();
	hurt linkto(platform); 
	
	{
			platform moveY(200,0.5);
			platform waittill("movedone");
	
	}


}


safePlaceA() 
{
	trig = getEnt("safePlace1_trig","targetname");
	safeplace = getEnt("safePlace1","targetname");
	
	trig waittill("trigger");
	{
		trig setHintString ("press [USE] to get high"); 		
		safeplace moveZ(161,2,0.5,0.5);
		safeplace waittill("movedone");
	}


}

safePlaceB() 
{
	trig = getEnt("safePlace2_trig","targetname");
	safeplace = getEnt("safePlace2","targetname");
	
	trig waittill("trigger");
	{
		trig setHintString ("press [USE] to get high");		
		safeplace moveZ(212,2,0.5,0.5);
		safeplace waittill("movedone");	
	}

}


trap4()
{
	trig = getEnt("trap4_trig","targetname");
	trig2 = getEnt("vierkantenNaarBenedenTrig", "targetname");
	vierkanten1 = getEnt("vierkantenNaarBeneden1", "targetname");
	vierkanten2 = getEnt("vierkantenNaarBeneden2", "targetname");
	

	
		trig waittill("trigger");
		level.stopIt = true;
		
		thread rotateActiTrap(3);
		trig setHintString ("^3Activated!"); 
		
		
		
	
	
	{
		if(level.isUp){
			self waittill( "start_me" );
			vierkanten1 moveZ(-155,3);
			vierkanten2 moveZ(-155,3);
			vierkanten2 waittill("movedone");
			wait(3);
			vierkanten1 moveZ(155,3);
			vierkanten2 moveZ(155,3);
			vierkanten2 waittill("movedone");	
			self notify( "vierkantenNaarBeneden" );	
			level.stopIt = false;
		}
		
		else if(level.isDown) {
			self waittill( "start_me" );
			vierkanten1 moveZ(-300,3);
			vierkanten2 moveZ(-300,3);  
			vierkanten2 waittill("movedone");
			wait(3);
			vierkanten1 moveZ(300,3);
			vierkanten2 moveZ(300,3);
			vierkanten2 waittill("movedone");
			self notify( "vierkantenNaarBeneden" );	
			level.stopIt = false;
		}
		
		else if(level.vierkantenNotStarted == false){
			trig2 delete();
			vierkanten1 moveZ(-300,5);
			vierkanten2 moveZ(-300,5);
			vierkanten2 waittill("movedone");
			wait(3);
			vierkanten1 moveZ(300,5);
			vierkanten2 moveZ(300,5);
			vierkanten2 waittill("movedone");	
			wait(3);
			thread vierkantenNaarBeneden();
		}
	}
}



vierkantenNaarBeneden()
{
	trig = getEnt("vierkantenNaarBenedenTrig", "targetname");
	vierkanten1 = getEnt("vierkantenNaarBeneden1", "targetname");
	vierkanten2 = getEnt("vierkantenNaarBeneden2", "targetname");
	
	level.stopIt = false;
	
	level.isDown = false;
	level.isUp = false;
	
		
	
	trig waittill("trigger");
	level.vierkantenNotStarted = true;
	

	while(true)
	{
		vierkanten1 moveZ(-145,1,0.5,0.5);
		wait(0.5);
		vierkanten2 moveZ(-145,1,0.5,0.5);
		vierkanten2 waittill("movedone");
		level.isUp = false;
		level.isDown = true;
		self notify( "start_me" );
		
		if(level.stopIt == true)
		self waittill( "vierkantenNaarBeneden" );
		
		wait(3);
		vierkanten1 moveZ(145,1,0.5,0.5);
		wait(0.5);
		vierkanten2 moveZ(145,1,0.5,0.5);
		vierkanten2 waittill("movedone");
		level.isDown = false;
		level.isUp = true;
		self notify( "start_me" );
		if(level.stopIt == true)
		self waittill( "vierkantenNaarBeneden" );
		wait(3);


	}
}




trap5()
{	
	trig = getEnt("trap5_trig", "targetname");
		
     trig waittill("trigger");
	 thread rotateActiTrap(4);
	 {
	 trig setHintString ("^3Activated!"); 
	 thread trap5_vierkanten1();
	 thread trap5_vierkanten2();
	 thread trap5_vierkanten3();
	 thread trap5_lift1();
	 thread trap5_lift2();
	 }
}




//trap 5 yolo
trap5_vierkanten1()
{
	vierkant1  = getEnt("trap5_vierkanten1", "targetname");

	while(true)
	{
		vierkant1 rotateYaw(-90,0.3);
		vierkant1 waittill("rotatedone");
	}
}

trap5_vierkanten2()
{
	vierkant2  = getEnt("trap5_vierkanten2", "targetname");
		
	while(true)
	{
		vierkant2 rotateYaw(-90,0.3);
		vierkant2 waittill("rotatedone");
	}
}

trap5_vierkanten3()
{
	vierkant3  = getEnt("trap5_vierkanten3", "targetname");
		
	while(true)
	{
		vierkant3 rotateYaw(-90,0.3);
		vierkant3 waittill("rotatedone");
	}
}


trap5_lift1()
{
	lift1 = getEnt("trap5_lift1","targetname");

	while(true)
	{
		lift1 moveY(-452,2);
		lift1 waittill("movedone");
		lift1 moveY(452,2);
		lift1 waittill("movedone");
	}


}

trap5_lift2()
{
	lift2 = getEnt("trap5_lift2","targetname");
		
	while(true)
	{
		lift2 moveY(452,2);
		lift2 waittill("movedone");
		lift2 moveY(-452,2);
		lift2 waittill("movedone");
	}


}

trap6()
{
	trig = getEnt("trap6_trig","targetname");
	spikes = getEnt("trap6_spikes","targetname");
	hurt = getEnt("trap6_trig_hurt","targetname");
	
	hurt enablelinkto();
	hurt linkto(spikes); 

	
	trig waittill("trigger");
	thread rotateActiTrap(5);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		spikes moveY(-51,1,0.5,0.5);
		spikes waittill("movedone");
		wait(1);
		spikes moveY(51,1);
		spikes waittill("movedone");
		wait(1.5);
	}
}

trap7()
{
	trig = getEnt("trap7_trig","targetname");
	rotator = getEnt("trap7_rotator","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(6);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		rotator rotateRoll(360,4);
		rotator waittill("rotatedone");
	}
}

trap8()
{
	trig = getEnt("trap8_trig","targetname");
	downers = getEnt("trap8_downers","targetname");
	hurt = getEnt("trap8_downers_hurt","targetname");

	hurt enablelinkto();
	hurt linkto(downers); 

	trig waittill("trigger");
	thread rotateActiTrap(7);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		downers moveZ(-234,1);
		downers waittill("movedone");
		wait(2);
		downers moveZ(234,1);
		downers waittill("movedone");
		wait(2);
	}
}
	
trap9()
{
	trig = getEnt("trap9_trig","targetname");
	downer = getEnt("trap9_downer","targetname");
	platform = getEnt("trap9_platform","targetname");
	hurt = getEnt("trap9_downer_hurt","targetname");
	
	hurt enablelinkto();
	hurt linkto(downer); 
	
	trig waittill("trigger");
	thread rotateActiTrap(8);
	trig setHintString ("^3Activated!"); 
	

		
	while(true)
	{
		downer moveZ(-171,1.5,0.6,0.6);
		downer waittill("movedone");
		downer moveZ(171,1.5,0.6,0.6);
		platform moveZ(171,1.5,0.6,0.6);
		platform waittill("movedone");
		wait(1);
		downer moveZ(-171,1.5,0.6,0.6);
		platform moveZ(-171,1.5,0.6,0.6);
		platform waittill("movedone");
		downer moveZ(171,1.5,0.6,0.6);		
		downer waittill("movedone");
		wait(1);
	}
}

trap10()
{
	trig = getEnt("trap10_trig","targetname");
	rotate1 = getEnt("trap10_rotate1","targetname");
	rotate2 = getEnt("trap10_rotate2","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(9);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		rotate1 rotateRoll(360,1);
		rotate1 waittill("rotatedone");
	    rotate2 rotateRoll(360,1);
		rotate2 waittill("rotatedone");
	}
}

trap11()
{
	trig = getEnt("trap11_trig","targetname");
	bounce = getEnt("trap11_bounce","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(10);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		bounce rotateRoll(90,1.5);
		bounce waittill("rotatedone");
		wait(1);
		bounce rotateRoll(-90,1.5);
		bounce waittill("rotatedone");
		wait(1);
	}
}

trap12()
{
	trig = getEnt("trap12_trig","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(11);
	trig setHintString ("^3Activated!"); 
	{
	thread trap12_mover1();
	thread trap12_mover2();
	}
}
	
	
trap12_mover1()
{
	mover1 = getEnt("trap12_mover1","targetname");
	hurt = getEnt("trap12_mover1_hurt","targetname");
	
	hurt enablelinkto();
	hurt linkto(mover1); 
	
	while(true)
	{
		mover1 moveX(-329,2);
		mover1 waittill("movedone");
		mover1 moveX(329,2);
		mover1 waittill("movedone");
		}
}

trap12_mover2()
{
	mover2 = getEnt("trap12_mover2","targetname");
	hurt = getEnt("trap12_mover2_hurt","targetname");
	
	hurt enablelinkto();
	hurt linkto(mover2); 
	
	while(true)
	{
		mover2 moveX(329,2);
		mover2 waittill("movedone");
		mover2 moveX(-329,2);
		mover2 waittill("movedone");
		}
}

trap13()
{
	trig = getEnt("trap13_trig","targetname");
	
	
	moveUp2 = getEnt("trap13_moveUp2","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(12);
	trig setHintString ("^3Activated!"); 
	thread trap13_moveUp1();
	thread trap13_moveUp2();
}

trap13_moveUp1()
{
	moveUp1 = getEnt("trap13_moveUp1","targetname");
	
	while(true)
	{
		moveUp1 moveZ(65,1);
		moveUp1 waittill("movedone");
		moveUp1 moveZ(-65,1);
		moveUp1 waittill("movedone");
	    wait(4);
	}
}

trap13_moveUp2()
{
	moveUp2 = getEnt("trap13_moveUp2","targetname");
	
	

	while(true)
	{	
	    wait(3);
		moveUp2 moveZ(65,1);
		moveUp2 waittill("movedone");
		moveUp2 moveZ(-65,1);
		moveUp2 waittill("movedone");
		 wait(1);
	}
}

trap14()
{
	trig = getEnt("trap14_trig","targetname");
	mover = getEnt("trap14_mover","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(13);
	trig setHintString ("^3Activated!"); 
	mover moveY(-150,2);
	mover waittill("movedone");
	
	while(true)
	{
	mover moveY(394,4);
	mover waittill("movedone");
	mover moveY(-394,4);
	mover waittill("movedone");
	}
}

trap15()
{
	trig = getEnt("trap15_trig","targetname");
	mover  = getEnt("trap15_mover","targetname");
	hurt = getEnt("trap15_mover_hurt","targetname");
	
	hurt enablelinkto();
	hurt linkto(mover); 
	
	trig waittill("trigger");
	thread rotateActiTrap(14);
	trig setHintString ("^3Activated!"); 
	mover moveZ(-135,1);
	mover waittill("movedone");
	
	while(true)
	{
		mover moveY(489,2);
		mover waittill("movedone");
		mover moveY(-489,2);
		mover waittill("movedone");
	}
}

trap16()
{
	trig = getEnt("trap16_trig","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(15);
	trig setHintString ("^3Activated!"); 
	{
		thread trap16_move1();
		thread trap16_move2();
	}
}

trap16_move1()
{
	mover = getEnt("trap16_mover1","targetname");
	platform = getEnt("trap16_platform1","targetname");
	
		mover moveX(159,2);
		mover waittill("movedone");
	
	while(true)
	{
		mover moveX(-159,2);
		platform moveX(-159,2);
		platform waittill("movedone");
		wait(1);
		mover moveX(159,2);
		platform moveX(159,2);
		platform waittill("movedone");
	
	}
}


trap16_move2()
{
	mover = getEnt("trap16_mover2","targetname");
	platform = getEnt("trap16_platform2","targetname");
	
	mover moveX(-159,2);
	mover waittill("movedone");
	
	while(true)
	{

		mover moveX(159,2);
		platform moveX(159,2);
		platform waittill("movedone");
		wait(1);
		mover moveX(-159,2);
		platform moveX(-159,2);
		platform waittill("movedone");
	}
}

trap17()
{
	trig = getEnt("trap17_trig","targetname");
	mover = getEnt("trap17_mover","targetname");
	
	trig waittill("trigger");
	thread rotateActiTrap(16);
	trig setHintString ("^3Activated!"); 
	
	while(true)
	{
		mover moveX(-751,3);
		mover waittill("movedone");
		wait(1.5);
		mover moveX(751,3);
		mover waittill("movedone");
		wait(1.5);
	}
}


eersteGrotVierkanten()
{
	vierkanten = getEnt("vierkantengrot1", "targetname");
	vierkanten2 = getEnt("vierkantengrot2", "targetname");
	vierkanten3 = getEnt("vierkantengrot3", "targetname");
	
	while(true)
	{
	vierkanten rotateRoll(90,1);
	wait(0.4);
	vierkanten2 rotateRoll(90,1);
	wait(0.4);
	vierkanten3 rotateRoll(90,1);
	wait(3);
	vierkanten rotateRoll(-90,1);
	wait(0.4);
	vierkanten2 rotateRoll(-90,1);
	wait(0.4);
	vierkanten3 rotateRoll(-90,1);
	wait(3);
	}

}

tweedeGrotVierkanten()
{
	vierkanten = getEnt("vierkantengrot4", "targetname");
	vierkanten2 = getEnt("vierkantengrot5", "targetname");
	vierkanten3 = getEnt("vierkantengrot6", "targetname");
	
	while(true)
	{
	vierkanten rotateRoll(-90,1);
	wait(0.4);
	vierkanten2 rotateRoll(-90,1);
	wait(0.4);
	vierkanten3 rotateRoll(-90,1);
	wait(3);
	
	
	
	vierkanten rotateRoll(90,1);
	wait(0.4);
	vierkanten2 rotateRoll(90,1);
	wait(0.4);
	vierkanten3 rotateRoll(90,1);
	wait(3);
	}

}


platform5()
{
	push1 = getEnt("platform5_push1","targetname");
	push2 = getEnt("platform5_push2","targetname");
	platform = getEnt("platform5_platform","targetname");
	
	
	while(true)
	{
		push1 moveZ(-147,2);
		platform moveZ(-147,2);
		wait(3);
		push1 moveZ(147,2);
		push2 moveZ(147,2);
		platform moveZ(147,2);
		wait(3);
		push2 moveZ(-147,2);
	}
}

liftElevatorDing() 
{
	 {
		//Eleveator omhoog
		thread liftElevatorDingA();

	 }
	  

}



liftElevatorDingA() 
{
	 ding6 = getEnt("elevatorOmhoog", "targetname");

	 while(true)
	 {
		ding6 moveZ(133,1.5);
		ding6 waittill("movedone");
		ding6 moveZ(-133, 1.5);
		ding6 waittill("movedone");
	 }
	  

}




//lift nummer 1
liftenSpikeRoom1()
{
	{
	lift2 = getent("lift2_spikeroom","targetname");
	trigger = getent("lift2trigger_spikeroom","targetname");

	while(1)
		{
			trigger waittill ("trigger");
			lift2 moveZ(159,1);
			lift2 waittill("movedone");
			wait(2);
			lift2 moveZ(-159,1);
			lift2 waittill("movedone");
			wait(2);
		}
	}
}
//lift nummer 2
liftenSpikeRoom2()
{
	{
	lift2 = getent("lift4_spikeroom","targetname");
	trigger = getent("lift4trigger_spikeroom","targetname");

	while(1)
		{
			trigger waittill ("trigger");
			lift2 moveZ(159,1);
			wait(2);
			lift2 moveZ(-159,1);
			wait(2);
		}
	}
}

//lift nummer 3


liftenSpikeRoom3()
{
	{
	lift2 = getent("spikeblok_laatste","targetname");
	trigger = getent("spiketrigger_laatste","targetname");

	while(1)
		{
			trigger waittill ("trigger");
			lift2 moveZ(159,1);
			wait(2);
			lift2 moveZ(-159,1);
			wait(2);
		}
	}
}

//heen en weer ding na liftenspikesroom
heenEnWeer_thread()
{
lift = getent("heenEnWeer2","targetname");

	while(1)
	{
		lift moveX (-395,2,1,1);
		lift waittill ("movedone"); 
		lift moveX(395,2,1,1);
		lift waittill ("movedone"); 
	}
}

// 2 blokjes, tweede route endcave
mineblokje1()
{
mineblokje1 = getent("mineblokje1","targetname");

while(1)
{
mineblokje1 moveX (-300,1);
mineblokje1 waittill ("movedone");
mineblokje1 moveX (300,1);
mineblokje1 waittill ("movedone");
}
}

mineblokje2()
{
mineblokje2 = getent ("mineblokje2","targetname");

while(1)
{
mineblokje2 moveY (280,1);
mineblokje2 waittill ("movedone");
mineblokje2 moveY (-280,1);
mineblokje2 waittill ("movedone");
}
}


//lift einde map
minelift2()
{
minelift2 = getent ("minelift2","targetname");
trig = getEnt("snowtunnel2","targetname");

	while(true)
	{
		trig waittill("trigger");
		wait(2);
		minelift2 moveZ (-4445,2);	
		minelift2 waittill("movedone");
		wait (6);
		minelift2 moveZ (4445,2);
		minelift2 waittill("movedone");
		wait (2);
	}
}


//Endrooms

bounceRoom()
{

	bounce_door1 = getEnt("bounce_door1", "targetname");
	bounce_door2 = getEnt("bounce_door2", "targetname");
	level.bounceTrig = getEnt("trig_bounceroom", "targetname");
	acti = getEnt("acti_bounce","targetname");
	
	{
	level.bounceTrig waittill("trigger", player);
	level.knifeTrig delete();
	level.sniperTrig delete();

	iPrintlnBold( " ^7" + player.name + " ^1 opened the bounce room." ); 
	player iPrintlnBold("^1 you get only 1 try , so good luck, sir");
	level.activ iPrintlnBold("^1 you get only 1 try , so good luck, sir");
	bounce_door1 moveX(-1,2);
	bounce_door2 moveX(-1,2);
	bounce_door2 waittill("movedone");
	wait(0.5);
	bounce_door1 moveY(137,2);
	bounce_door2 moveY(-137,2);
	
	level.activ SetOrigin (acti.origin);
	level.activ setplayerangles (acti.angles);
	
	level.activ TakeAllWeapons();
	level.activ GiveWeapon( "knife_mp" ); 
	level.activ SwitchToWeapon( "knife_mp" );
	

	thread bounceroom_weapon_trig();
	thread bounceroom_end_acti();
	thread bounceroom_teleport();
	thread bounceRoomTriggerInArray();
	thread bounceRoomMoverInArray();
	
		if(level.secretActivated) {
	  AmbientStop( 1 );
	  ambientPlay("secret_derpyrobin",1);
	  }
	  
	 else {
		AmbientStop( 1 );
		ambientPlay("endroom",1);
	 }
	
	
	thread bounceRoom_makeFromBounceroomSecretBounceRoom();

	}
}

bounceroom_weapon_trig()
{
	trig = getEnt("bounceroom_weapon_trig","targetname");
	
	while(true)
	{
		trig waittill("trigger", player);
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" ); 
		player switchToWeapon( "knife_mp" );
		
	}
}

bounceRoom_makeFromBounceroomSecretBounceRoom()
{
		if(level.secretActivated) {
			for(i = 0 ; i < 14 ; i++)
			{
				thread bounceroom_secretBounces(i);
			}
		}
		
	for(i = 0 ; i < 16 ; i++)
	{
		thread bounceRoomTrigger(i);
	}
	
}


bounceroom_secretBounces(bounceNumber)
{
			while(true)
			{
				level.bounceRoom_bounces[bounceNumber]  rotateYaw(360,3);
				level.bounceRoom_bounces[bounceNumber]   waittill("rotatedone");
			}
}


bounceRoomTrigger(trigNumber)
{

while(true)
	{
		level.bounceRoomTrig[trigNumber] waittill("trigger");
		thread bounceRoomMover(trigNumber);
	}
}


bounceRoomMover(moverNumber)
{

	if(level.secretActivated){
		if(moverNumber == 0 || moverNumber ==  13)  {
		level.bounceRoomMover[moverNumber] moveZ(150,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-150,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
		
		else if(moverNumber == 11 || moverNumber ==  3)  {
		level.bounceRoomMover[moverNumber] moveZ(130,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-130,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
		
		else {
		level.bounceRoomMover[moverNumber] moveZ(200,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-200,1,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
	}
	
	else {
	
		if(moverNumber == 0 || moverNumber ==  15)  {
		level.bounceRoomMover[moverNumber] moveZ(150,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-150,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
		
		else if(moverNumber == 12 || moverNumber ==  3)  {
		level.bounceRoomMover[moverNumber] moveZ(130,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-130,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
		
		else {
		level.bounceRoomMover[moverNumber] moveZ(200,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		level.bounceRoomMover[moverNumber] moveZ(-200,3,0.5,0.5);
		level.bounceRoomMover[moverNumber] waittill("movedone");
		}
		
		
	}
}


bounceRoomMoverInArray()
{
		level.bounceRoomMover = [];
		level.bounceRoomMover[0] = getEnt("bounceroom_mover1","targetname");
		level.bounceRoomMover[1] = getEnt("bounceroom_mover2","targetname");
		level.bounceRoomMover[2] = getEnt("bounceroom_mover3","targetname");
		level.bounceRoomMover[3] = getEnt("bounceroom_mover4","targetname");
		level.bounceRoomMover[4] = getEnt("bounceroom_mover5","targetname");
		level.bounceRoomMover[5] = getEnt("bounceroom_mover6","targetname");
		level.bounceRoomMover[6] = getEnt("bounceroom_mover7","targetname");
		level.bounceRoomMover[7] = getEnt("bounceroom_mover8","targetname");
		level.bounceRoomMover[8] = getEnt("bounceroom_mover9","targetname");
		level.bounceRoomMover[9] = getEnt("bounceroom_mover10","targetname");
		level.bounceRoomMover[10] = getEnt("bounceroom_mover11","targetname");
		level.bounceRoomMover[11] = getEnt("bounceroom_mover12","targetname");
		level.bounceRoomMover[12] = getEnt("bounceroom_mover13","targetname");
		level.bounceRoomMover[13] = getEnt("bounceroom_mover14","targetname");
		level.bounceRoomMover[14] = getEnt("bounceroom_mover15","targetname");
		level.bounceRoomMover[15] = getEnt("bounceroom_mover16","targetname");
}

bounceRoomTriggerInArray()
{
		level.bounceRoomTrig = [];
		level.bounceRoomTrig[0] = getEnt("bounceroom_mover1_trig","targetname");
		level.bounceRoomTrig[1] = getEnt("bounceroom_mover2_trig","targetname");
		level.bounceRoomTrig[2] = getEnt("bounceroom_mover3_trig","targetname");
		level.bounceRoomTrig[3] = getEnt("bounceroom_mover4_trig","targetname");
		level.bounceRoomTrig[4] = getEnt("bounceroom_mover5_trig","targetname");
		level.bounceRoomTrig[5] = getEnt("bounceroom_mover6_trig","targetname");
		level.bounceRoomTrig[6] = getEnt("bounceroom_mover7_trig","targetname");
		level.bounceRoomTrig[7] = getEnt("bounceroom_mover8_trig","targetname");
		level.bounceRoomTrig[8] = getEnt("bounceroom_mover9_trig","targetname");
		level.bounceRoomTrig[9] = getEnt("bounceroom_mover10_trig","targetname");
		level.bounceRoomTrig[10] = getEnt("bounceroom_mover11_trig","targetname");
		level.bounceRoomTrig[11] = getEnt("bounceroom_mover12_trig","targetname");
		level.bounceRoomTrig[12] = getEnt("bounceroom_mover13_trig","targetname");
		level.bounceRoomTrig[13] = getEnt("bounceroom_mover14_trig","targetname");
		level.bounceRoomTrig[14] = getEnt("bounceroom_mover15_trig","targetname");
		level.bounceRoomTrig[15] = getEnt("bounceroom_mover16_trig","targetname");
}




bounceroom_secretBouncesInArray()
{
		level.bounceRoom_bounces = [];
		level.bounceRoom_bounces[0] = getEnt("secret_bounceroom_moving1","targetname");
		level.bounceRoom_bounces[1] = getEnt("secret_bounceroom_moving2","targetname");
		level.bounceRoom_bounces[2] = getEnt("secret_bounceroom_moving3","targetname");
		level.bounceRoom_bounces[3] = getEnt("secret_bounceroom_moving4","targetname");
		level.bounceRoom_bounces[4] = getEnt("secret_bounceroom_moving5","targetname");
		level.bounceRoom_bounces[5] = getEnt("secret_bounceroom_moving6","targetname");
		level.bounceRoom_bounces[6] = getEnt("secret_bounceroom_moving7","targetname");
		level.bounceRoom_bounces[7] = getEnt("secret_bounceroom_moving8","targetname");
		level.bounceRoom_bounces[8] = getEnt("secret_bounceroom_moving9","targetname");
		level.bounceRoom_bounces[9] = getEnt("secret_bounceroom_moving10","targetname");
		level.bounceRoom_bounces[10] = getEnt("secret_bounceroom_moving11","targetname");
		level.bounceRoom_bounces[11] = getEnt("secret_bounceroom_moving12","targetname");
		level.bounceRoom_bounces[12] = getEnt("secret_bounceroom_moving13","targetname");
		level.bounceRoom_bounces[13] = getEnt("secret_bounceroom_moving14","targetname");
}



bounceroom_end_acti()
{
	trig = getEnt("bounceroom_einde_trig1","targetname");
	floor1 = getEnt("bounceroom_end_floor1","targetname");
	floor2 = getEnt("bounceroom_end_floor2","targetname");

	
	trig waittill("trigger", player);
	{
		player TakeAllWeapons();
		player GiveWeapon("ak74u_mp" ); 
		player SwitchToWeapon( "ak74u_mp" );
		wait(5);
		floor1 moveY(200,3);
		floor2 moveY(-200,3);
		floor2 waittill("rotatedone");

	}
	
	while(true)
	{
		trig waittill("trigger", player);
		player TakeAllWeapons();
		player GiveWeapon("ak74u_mp" ); 
		player SwitchToWeapon( "ak74u_mp" );

	}
}


bounceroom_teleport()
{
	plek1 = getEnt("bounceroom_randomplek1","targetname");
	plek2 = getEnt("bounceroom_randomplek2","targetname");
	plek3 = getEnt("bounceroom_randomplek3","targetname");
	plek4 = getEnt("bounceroom_randomplek4","targetname");
	
	trig = getEnt("bounceroom_teleport_trig","targetname");
		
	while(true)
	{
		trig waittill("trigger", player);
		rand = randomInt(4);
		if(rand == 0)
		rand = plek1;
		else if (rand == 1)
		rand = plek2;
		else if (rand == 2)
		rand = plek3;
		else
		rand = plek4;
		
		
		player SetOrigin (rand.origin);
		player setplayerangles (rand.angles);
	}

}



sniperRoom()
{

	sniper_door1 = getEnt("sniper_door1", "targetname");
	sniper_door2 = getEnt("sniper_door2", "targetname");
	level.sniperTrig = getEnt("trig_sniperroom", "targetname");
	
	{
	level.sniperTrig waittill("trigger", player);
	level.knifeTrig delete();
	level.bounceTrig delete();
	
	iPrintlnBold( " ^7" + player.name + " ^1 opened the sniper room." ); 
	sniper_door1 moveY(3,2);
	sniper_door2 moveY(3,2);
	wait(0.5);
	sniper_door1 moveX(137,2);
	sniper_door2 moveX(-137,2);
	

	thread sniperRoom_weapon_trig();
	thread sniperRoomLift();
	thread sniperRoomMiddelLift();
	
		if(level.secretActivated) {
	  AmbientStop( 1 );
	  ambientPlay("secret_derpyrobin",1);
	  }
	  
	 else {
		AmbientStop( 1 );
		ambientPlay("endroom",1);
	 }
	
	
	if(level.secretActivated)
	{
		thread sniperRoomSecretMovingThings1();
		thread sniperRoomSecretMovingThings2();
		thread sniperRoomSecretMovingThings3();
		thread sniperRoomSecretMovingThings4();
		thread sniperRoomSecretBounce1();
		thread sniperRoomSecretBounce2();
	}

	}

}

actiToSniperRoom()
{
	acti = getEnt("acti_snipero","targetname");
	{
		level.activ SetOrigin (acti.origin);
		level.activ setplayerangles (acti.angles);
		iPrintlnBold("acti is her");
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "m40a3_mp" ); 
		level.activ SwitchToWeapon( "m40a3_mp" );
	}
}

sniperRoom_weapon_trig()
{
	trig = getEnt("sniperroom_weapon_trig","targetname");
	
	while(true)
	{
		trig waittill("trigger", player);
		player TakeAllWeapons();
		player GiveWeapon( "m40a3_mp" ); 
		player SwitchToWeapon( "m40a3_mp" );
	}
}


sniperRoomSecretBounce1()
{
	bounces = getEnt("secret_sniperRoom_bounce1","targetname");
	
	while(true)
	{
		bounces rotateYaw(360,4);
		bounces waittill("rotatedone");
	}
}

sniperRoomSecretBounce2()
{
	bounces = getEnt("secret_sniperRoom_bounce2","targetname");
	
	while(true)
	{
		bounces rotateYaw(360,4);
		bounces waittill("rotatedone");
	}
}

sniperRoomSecretMovingThings1()
{
	movingThing = getEnt("secret_sniperRoom_moving1","targetname");
	
	wait(10);
	
	while(true)
	{
		movingThing moveX(-970,2);
		movingThing waittill("movedone");
		movingThing moveX(970,2);
		movingThing waittill("movedone");	
	}

}


sniperRoomSecretMovingThings2()
{
	movingThing = getEnt("secret_sniperRoom_moving2","targetname");
	
	wait(10);
	
	while(true)
	{
		movingThing moveX(-318,1.3);
		movingThing waittill("movedone");
		movingThing moveX(318,1.3);
		movingThing waittill("movedone");	
	}
}

sniperRoomSecretMovingThings3()
{
	movingThing = getEnt("secret_sniperRoom_moving3","targetname");
	
	wait(10);
	
	while(true)
	{
		movingThing moveX(970,2);
		movingThing waittill("movedone");
		movingThing moveX(-970,2);
		movingThing waittill("movedone");	
	}
}

sniperRoomSecretMovingThings4()
{
	movingThing = getEnt("secret_sniperRoom_moving4","targetname");
	
	wait(10);
	
	while(true)
	{
		movingThing moveX(318,1.3);
		movingThing waittill("movedone");
		movingThing moveX(-318,1.3);
		movingThing waittill("movedone");	
	}	
}

sniperRoomLift()
{
	trig = getEnt("sniperRoom_lift_trig","targetname");
	lift = getEnt("sniperRoom_LiftDeEerste","targetname");


		trig waittill("trigger", player);
		thread sniperRoom_lift_bovenPlatform();
		wait(1.5);
		lift moveZ(807,5);
		lift waittill("movedone");
		player iPrintlnBold("^3 Good luck^^");
		level.activ iPrintlnBold("^3 Good luck^^");
		thread actiToSniperRoom();
		thread sniperRoomLift_doors();
		wait(3);
		lift moveZ(-807,5);
		lift waittill("movedone");
		wait(2);

	while(true)
	{
		trig waittill("trigger");
		thread sniperRoom_lift_bovenPlatform();
		lift moveZ(807,5);
		lift waittill("movedone");
		wait(3);
		lift moveZ(-807,5);
		lift waittill("movedone");
	}
}


sniperRoom_lift_bovenPlatform()
{
	platform = getEnt("sniperRoom_lift_bovenPlatform","targetname");

	{
		wait(3);
		platform moveX(-175,2);
		platform waittill("movedone");
		wait(1);
		platform moveX(175,2);
		platform waittill("movedone");
	
	}
}

sniperRoomMiddelLift()
{
	trig = getEnt("sniperRoom_middenLift_trig","targetname");
	lift = getEnt("sniperRoom_middenLift","targetname");
	
		while(true)
		{
			trig waittill("trigger");
			lift moveZ(363,1);
			lift waittill("movedone");
			wait(2);
			lift moveZ(-363,1);
			lift waittill("movedone");
			wait(1);
		}
}
	



sniperRoomLift_doors()
{
	doors = getEnt("sniperRoom_doors","targetname");
	
	{
		doors moveZ(-160,2);
		doors waittill("movedone");
	}
}
knifeRoom()
{

	knife_door1 = getEnt("knife_door1", "targetname");
	knife_door2 = getEnt("knife_door2", "targetname");
	level.knifeTrig = getEnt("trig_kniferoom", "targetname");
	acti = getEnt("acti_knife","targetname");
	
	{
	level.knifeTrig  waittill("trigger", player);
	level.sniperTrig delete();
	level.bounceTrig delete();
	
	iPrintlnBold( " ^7" + player.name + " ^1 opened the knife room." ); 
	
	knife_door1 moveY(-3,2);
	knife_door2 moveY(-3,2);
	wait(0.5);
	knife_door1 moveX(-139,2);
	knife_door2 moveX(139,2);
	
	level.activ SetOrigin (acti.origin);
	level.activ setplayerangles (acti.angles);
	level.activ TakeAllWeapons();
	level.activ GiveWeapon( "knife_mp" ); 
	level.activ SwitchToWeapon( "knife_mp" );
	
	
	thread kniferoom_weapon_trig();
	thread kniferoom_minecart1();
	thread kniferoom_minecart2();
	
		if(level.secretActivated) {
	  AmbientStop( 1 );
	  ambientPlay("secret_derpyrobin",1);
	  }
	  
	 else {
		AmbientStop( 1 );
		ambientPlay("endroom",1);
	 }
	
	  
	  
	}
	
}


kniferoom_weapon_trig()
{
	trig = getEnt("kniferoom_weapon_trig","targetname");
	
	while(true)
	{
		trig waittill("trigger", player);
		player TakeAllWeapons();
		player GiveWeapon( "knife_mp" ); 
		player switchToWeapon( "knife_mp" );
	}
}

kniferoom_minecart1()
{
	trig = getEnt("kniferoom_minecart1_trig","targetname");
	minecart = getEnt("kniferoom_minecart1","targetname");
	
	trig enablelinkto();
	trig linkto(minecart); 
	
	if(level.secretActivated)
	{
		while(true) {
			trig waittill("trigger");
			minecart moveX(-3415,2);
			minecart waittill("movedone");
			trig waittill("trigger");
			minecart moveX(3415,2);
			minecart waittill("movedone");
		}
	}
	
	else {
		while(true)
		{
			trig waittill("trigger");
			minecart moveX(-3415,5);
			minecart waittill("movedone");
			trig waittill("trigger");
			minecart moveX(3415,5);
			minecart waittill("movedone");
		}
	}

}

kniferoom_minecart2()
{
	trig = getEnt("kniferoom_minecart2_trig","targetname");
	minecart = getEnt("kniferoom_minecart2","targetname");
	
	trig enablelinkto();
	trig linkto(minecart); 
	
	if(level.secretActivated)
	{
		while(true) {
			trig waittill("trigger");
			minecart moveX(3415,2);
			minecart waittill("movedone");
			trig waittill("trigger");
			minecart moveX(-3415,2);
			minecart waittill("movedone");
		}
	}
	
	else {
		while(true)
		{
			trig waittill("trigger");
			minecart moveX(3415,5);
			minecart waittill("movedone");
			trig waittill("trigger");
			minecart moveX(-3415,5);
			minecart waittill("movedone");
		}
	}

}

secret()
{
	secret1 = getEnt("secret_trig1","targetname");
	secret2 = getEnt("secret_trig2","targetname");
	secret3 = getEnt("secret_trig3","targetname");
	secret4 = getEnt("secret_trig4","targetname");
	orig = getEnt("secret_origin","targetname");
	
	secret1 waittill("trigger", player);
	player iPrintlnBold("U made it even more pointless...");
	secret2 waittill("trigger",player);
	player iPrintlnBold("Stop with this plssssssss");
	secret3 waittill("trigger", player);
	player iPrintlnBold("Stahhpoppppp");
	secret4 waittill("trigger", player);
	player SetOrigin (orig.origin);
	player setplayerangles (orig.angles);
	iPrintlnBold("The chamber of secrets has been opened");
	level.secretActivated = true;
	
}

minecart_teleport()
{
	endTp = getEnt("minecart_teleport_end_origin","targetname");
	trig = getEnt("minecart_teleport_end_trig","targetname");
	
	trig waittill("trigger", player);
	{
		player SetOrigin (endTp.origin);
		player setplayerangles (endTp.angles);
	}
}


minecart() 
{
	trig = getEnt("minecart10_trig","targetname");
	minecart = getEnt("minecart9","targetname");
	
	trig enablelinkto();
	trig linkto(minecart); 

	{
		//1st trap
		trig waittill("trigger");
		minecart moveX(981,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		//2nd trap
		trig waittill("trigger");
		minecart moveX(1434,1,0.5,0.5);
		minecart waittill("movedone");
		
		//3rd trap
		trig waittill("trigger");
		minecart moveX(840,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		//4th trap
		trig waittill("trigger");
		minecart moveX(214,0.5);
		minecart waittill("movedone");
		minecart rotateYaw(90,0.5);
		minecart waittill("rotatedone");
		thread minecartMove2();
		minecart moveZ(-163,1);
		minecart waittill("movedone");
		minecart moveY(378,1,0.5,0.5);
		minecart waittill("movedone");
		minecart rotateYaw(-90,0.5);
		minecart waittill("rotatedone");
		minecart moveX(352,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		//5th trap
		trig waittill("trigger");
		minecart moveX(531,1,0.5,0.5);//893
		minecart waittill("movedone");
		wait(1);
		
		//6th trap
		trig waittill("trigger");
		minecart moveX(1990,2,0.5,0.5);//893
		minecart waittill("movedone");
		minecart rotateYaw(-90, 0.5);
		minecart waittill("rotatedone");
		minecart moveY(-544,1.5);
		minecart waittill("movedone");
		minecart rotateYaw(90,0.5);
		minecart waittill("rotatedone");
		minecart moveX(453,1,0.5,0.5);//893
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");
		minecart moveX(1744,1,0.5,0.5);//893
		minecart waittill("movedone");
		
		trig waittill("trigger");		
		minecart moveX(377,1,0.5,0.5);//893
		minecart waittill("movedone");
		minecart rotateYaw(90,0.5);
		minecart waittill("rotatedone");
		minecart moveY(140,1,0.5,0.5);//893
		wait(1);
		
		
		trig waittill("trigger");
		minecart moveY(585,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");
		minecart moveY(530,1,0.5,0.5);
		minecart waittill("movedone");
		minecart moveZ(-220,1.5);
		thread minecartMove3();
		minecart waittill("movedone");
		minecart moveY(-808,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");		
		minecart moveY(-209,1,0.5,0.5);
		minecart waittill("movedone");
		minecart moveZ(-255,1.5);
		thread minecartMove4();
		minecart waittill("movedone");
		minecart moveY(471,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
	
		trig waittill("trigger");	
		minecart moveY(130,1,0.5,0.5);
		minecart waittill("movedone");
		minecart moveZ(-149,1.5);
		thread minecartMove5();
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");	
		thread minecartMove5_up();
		minecart moveY(-400,1,0.5,0.5);
		minecart waittill("movedone");
		minecart moveZ(-230,1.5);
		thread minecartMove6();
		minecart waittill("movedone");
		minecart moveY(349,1,0.5,0.5);
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");
		minecart moveY(247,1,0.5,0.5);
		minecart waittill("movedone");
		minecart moveZ(-320,2);
		thread minecartMove7();
		minecart waittill("movedone");
		wait(1);
		
		trig waittill("trigger");		
		minecart moveY(1625,1,0.5,0.5);//2533
		minecart waittill("movedone");		
		
		trig waittill("trigger");	
		minecart moveY(908,2,0.5,0.5);//2533
		minecart waittill("movedone");						
		minecart rotateYaw(-90,1.5);
		minecart waittill("rotatedone");
		minecart moveX(1470,3,0.5,0.5);
		minecart waittill("movedone");	
		minecart rotateYaw(-90,0.5);
		minecart waittill("rotatedone");
		minecart moveY(-635,2,0.5,0.5);
		minecart waittill("movedone");		

	}

}



minecartMove2()
{
	minecart_MoveCartDown2 = getEnt("minecartMove2","targetname");
	{
		minecart_MoveCartDown2 moveZ(-163,1);
		minecart_MoveCartDown2 waittill("movedone");
	
	}

}

minecartMove3()
{
	minecartMove3 = getEnt("minecartMove3","targetname");
	
	{
		minecartMove3 moveZ(-220, 1.5);
		minecartMove3 waittill("movedone");
	
	}

}

minecartMove4()
{
	minecartMove4 = getEnt("minecartMove4","targetname");
	
	{
		minecartMove4 moveZ(-255, 1.5);
		minecartMove4 waittill("movedone");
	
	}

}

minecartMove5()
{
	minecartMove5 = getEnt("minecartMove5","targetname");
	
	{
		minecartMove5 moveZ(-149,1.5);
		minecartMove5 waittill("movedone");
	
	}

}


minecartMove5_up()
{
	minecartMove5 = getEnt("minecartMove5","targetname");
	
	{
		wait(1);
		minecartMove5 moveZ(149,1.5);
		minecartMove5 waittill("movedone");
	
	}

}

minecartMove6()
{
	minecartMove6 = getEnt("minecartMove6","targetname");
	
	{
		minecartMove6 moveZ(-230,1.5);
		minecartMove6 waittill("movedone");
	
	}

}

minecartMove7()
{
	minecartMove7 = getEnt("minecartMove7","targetname");
	
	{
		minecartMove7 moveZ(-320,2);
		minecartMove7 waittill("movedone");
	
	}

}


