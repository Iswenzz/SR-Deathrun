

main()
{

    	maps\mp\_load::main();  
 	
    	setdvar("r_specularcolorscale", "1");
 	

 	thread spawnDoor();
 	thread antiGlitch();
 	thread actiTrapOne();
 	thread actiTrapTwo();
 	thread actiTrapThree();
 	thread actiTrapFour();
 	thread actiTrapFive();
 	thread actiTrapSix();
 	thread actiTrapSeven();
 	thread actiTrapEight();
 	thread actiTrapNine();
 	thread actiTrapTen();
 	thread endOld();
 	thread endPistol();
 	thread endSniper();
 	thread endGame();


    	addTriggerToList("trap_1_trig");
    	addTriggerToList("trap_2_trig");
    	addTriggerToList("trap_3_trig");
    	addTriggerToList("trap_4_trig");
    	addTriggerToList("trap_5_trig");
    	addTriggerToList("trap_6_trig");
    	addTriggerToList("trap_7_trig");
    	addTriggerToList("trap_8_trig");
    	addTriggerToList("trap_9_trig");
    	addTriggerToList("trap_10_trig");

}


addTriggerToList(name, positionOfIconAboveTrap) //This is the updated function for Deathrun 1.3... I'm not too sure how the icon positioning works yet, so I'm only using the first parameter until the version comes out and I can toy with it. heh
{

    	if( !isDefined(level.trapTriggers))

    	   	level.trapTriggers = [];


    	level.trapTriggers[level.trapTriggers.size] = getEnt(name, "targetname");
	
    	if( !isDefined(level.icon_origins))

    		level.icon_origins = [];


    	level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;

} 

spawnDoor()
{

	door = getEnt("spawndoor", "targetname");

	level waittill("round_started");

	wait 2; //I hate waiting too long for the round to start.

	door rotatePitch(90, 3.5, 1, 0.75); //I used a NoDraw/NotSolid texture that is attached onto the bottom of the spawn door, to make it look like it's actually lowering in a realistic way.

	wait 3.45;

    	door delete();

    	wait 10;

    	iPrintLn("^3[Callan]:^7 Map by me."); //I had to credit myself somewhere.

}

antiGlitch()
{

	trig = getEnt("tp_spawn", "targetname");

	for(;;) {
	
		trig waittill("trigger", player);

		origin = level.spawn[player.pers["team"]][randomInt(player.pers["team"].size)].origin; //BraXi's code used for Deathrun's Admin CP
		player setOrigin(origin);
		iPrintln("^3[server]:^7 Player glitched.");

	}

}

actiTrapOne()
{

	trig = getEnt("trap_1_trig", "targetname");
	obj1 = getEnt("trap_1_1", "targetname");
	obj2 = getEnt("trap_1_2", "targetname");
	obj1_1 = getEnt("trap_1_1_1", "targetname");
	obj2_1 = getEnt("trap_1_2_1", "targetname");

	obj1_1 enableLinkTo();
	obj2_1 enableLinkTo();
	obj1_1 linkTo(obj1);
	obj2_1 linkTo(obj2);

	trig waittill("trigger");

	trig delete();
	obj1 rotateRoll(90, 0.4, 0, 0.15);
	obj1 moveY(94, 0.35);
	obj2 rotateRoll(-90, 0.4, 0, 0.15);
	obj2 moveY(-94, 0.35);
	
	wait 6;

	obj1 rotateRoll(-90, 0.8, 0, 0.30);
	obj1 moveY(-94, 0.70);
	obj2 rotateRoll(90, 0.8, 0, 0.30);
	obj2 moveY(94, 0.70);

}

actiTrapTwo()
{

	trig = getEnt("trap_2_trig", "targetname");
	obj1 = getEnt("trap_2_1", "targetname");

	trig waittill("trigger");
	
	trig delete();

	for(;;) {

		obj1 moveY(-272, 1, 0.1, 0.1);	
		wait 1.5;
		obj1 moveY(272, 1, 0.1, 0.1);
		wait 1.5;

	}

}

actiTrapThree()
{

	trig = getEnt("trap_3_trig", "targetname");
	obj1 = getEnt("trap_3_1", "targetname");
	obj2 = getEnt("trap_3_4", "targetname");
	obj3 = getEnt("trap_3_5", "targetname");

	//obj2 enableLinkTo();
	//obj3 enableLinkTo();
	obj2 linkTo(obj1);
	obj3 linkTo(obj1);

	trig waittill("trigger");

	trig delete();
	obj1 moveY(-250, 0.5, 0, 0.2);

	wait 1;

	obj1 moveY(250, 3, 1.2, 1.2);

}

actiTrapFour()
{

	trig = getEnt("trap_4_trig", "targetname");
	obj1 = getEnt("trap_4_1", "targetname");
	obj2 =  getEnt("trap_4_2", "targetname");

	obj2 enableLinkTo();
	obj2 linkTo(obj1);

	trig waittill("trigger");

	trig delete();
	obj1 moveZ(288, 0.8, 0.1, 0.05);
	
	obj1 waittill("movedone");

	wait 1;

	obj1 moveZ(-288, 4, 2, 1);

}

actiTrapFive()
{

	trig = getEnt("trap_5_trig", "targetname");
	obj1 = getEnt("trap_5_1", "targetname");
	obj2 = getEnt("trap_5_2", "targetname");

	obj2 enableLinkTo();
	obj2 linkTo(obj1);

	trig waittill("trigger");

	trig delete();
	obj1 moveZ(-288, 0.8, 0.1, 0.05);
	
	obj1 waittill("movedone");

	wait 1;

	obj1 moveZ(288, 4, 2, 1);

}

actiTrapSix()
{

	trig = getEnt("trap_6_trig", "targetname");
	obj1 = getEnt("trap_6_1", "targetname");
	obj2 =  getEnt("trap_6_2", "targetname");

	obj2 enableLinkTo();
	obj2 linkTo(obj1);

	trig waittill("trigger");

	trig delete();
	obj1 moveZ(288, 0.8, 0.1, 0.05);
	
	obj1 waittill("movedone");
	wait 1;

	obj1 moveZ(-288, 4, 2, 1);

}

actiTrapSeven()
{

	trig = getEnt("trap_7_trig", "targetname");
	obj1 = getEnt("trap_7_1", "targetname");

	trig waittill("trigger");

	trig delete();

	for(;;) {

		obj1 rotateRoll(360, 2);
		wait 2;

	}

}

actiTrapEight() 
{

	trig = getEnt("trap_8_trig", "targetname");
	obj1 = getEnt("trap_8_1", "targetname");

	trig waittill("trigger");
	trig delete();

	obj1 rotatePitch(90, 1, 0, 0.5);
	obj1 moveX(-16, 1);
	
	wait 5;

	obj1 rotatePitch(-90, 2, 0.5, 1);
	obj1 moveX(16, 2);

}

actiTrapNine() 
{

	trig = getEnt("trap_9_trig", "targetname");
	obj1 = getEnt("trap_9_1", "targetname");

	trig waittill("trigger");

	trig delete();

	for(;;) { //Algorithm used for that spinning trap toward the end of the map.

		for(i = 0; i < 3; i++) {

			for(j = 0; j < 15; j++) {

				obj1 rotateYaw(360, 0.3); //Trap is intended to slow the player down, mostly.
				wait 0.3;

			}

			wait 0.8;

			for(k = 0; k < 10; k++) {

				obj1 rotateYaw(360, 0.6);
				wait 0.6;

			}

			wait 0.5;

			for(l = 0; l < 5; l++) {

				obj1 rotateYaw(360, 0.9);
				wait 0.9;

			}

			wait 1.4;

		}

	}

}

actiTrapTen() 
{

	obj1 = getEnt("trap_10_1", "targetname");
	trig = getEnt("trap_10_trig", "targetname");

	trig waittill("trigger");

	trig delete();

	obj1 moveZ(-144, 0.5, 0.2, 0.2);

	wait 0.45;
	
	obj1 delete();
	
}

endOld()
{
	door = getEnt("end_old_door", "targetname");
	level.oldTrig = getEnt("end_old_trig", "targetname");
	i = undefined;

	while(1)
	{
		level.oldTrig waittill("trigger", player);

		if(!player sr\api\_deathrun::order())
			continue;

		if(!isDefined(player.old_t))
			iPrintlnBold("^1" + player.name + " ^7has chosen the ^5Original^7 way.");

		player.old_t = true;

		if(!isDefined(i))
		{
			i = true;
			level.oldTrig delete();
			level.pistolTrig delete();
			level.sniperTrig delete();
			door rotateYaw(110, 1.5, 0.6, 0.6);
		}
	}
}

endPistol() //I originally looked at mp_dr_bounce's script for end rooms and have kinda stuck with that format, cleaning the code up and adding other features in as I see fit.
{

	level.pistolTrig = getEnt("end_pistol_trig", "targetname");
	pistolDoor = getEnt("end_pistol_door", "targetname");
	i = undefined;

	for(;;) {

		level.pistolTrig waittill("trigger", jumper);

		if(!jumper sr\api\_deathrun::order())
			continue;

		if(!isDefined(i))
		{
			i = true;
			pistolDoor rotateYaw(-105, 1.5, 0.6, 0.6);
			level.oldTrig delete();
			level.sniperTrig delete();
		}

		if(!isDefined(level.pistolTrig))

       		    	return;


       		jumper freezeControls(true);
       		jumper setOrigin((-2696, 8, 968));
       		jumper setPlayerAngles((0, 180, 0));

       		wait 0.1;

       		jumper takeAllWeapons();
       		jumper giveWeapon("deserteagle_mp");
       		jumper giveMaxAmmo("deserteagle_mp");

       		wait 0.1;

       		jumper switchToWeapon("deserteagle_mp");
       		jumper.health = jumper.maxHealth;
 		xPrintlnBold(jumper, "Pistol");

       		thread endPistolActivator();

               	wait 1.8; //Sometimes there's some timing glitch with teleporting, and it looks very poor. This pretty much puts a stop to it.

               	jumper freezeControls(false);

       		while(isAlive(jumper) && isDefined(jumper))

       		    	wait 1;  
 
    	}

}
 
endPistolActivator()
{

    	if(getTeamPlayersAlive("axis") == 1) {

        		people = getEntArray("player", "classname");
 
        		for(x = 0; x < people.size; x++) {

            			if(people[x].pers["team"] == "axis") {

            				people[x] freezeControls(true);
               			people[x] setOrigin((-3128, 8, 968));
               			people[x] setPlayerAngles((0, 360, 0));

               			wait 0.1;

               			people[x] takeAllWeapons();
               			people[x] giveWeapon("deserteagle_mp");
               			people[x] giveMaxAmmo("deserteagle_mp");

               			wait 0.1;

               			people[x] switchToWeapon("deserteagle_mp");
               			people[x].health = people[x].maxHealth;

               			wait 1.8;

               			people[x] freezeControls(false);

           			}

        		}

    	}

}

endSniper()
{

	level.sniperTrig = getEnt("end_sniper_trig", "targetname");
	sniperDoor = getEnt("end_sniper_door", "targetname");
	i = undefined;

	for(;;) {

		level.sniperTrig waittill("trigger", jumper);

		if(!jumper sr\api\_deathrun::order())
			continue;

		if(!isDefined(i))
		{
			i = true;
			sniperDoor rotateYaw(-105, 1.5, 0.6, 0.6);
			level.oldTrig delete();
			level.pistolTrig delete();
		}

		if(!isDefined(level.sniperTrig))

       		    	return;


       		jumper freezeControls(true);
       		jumper setOrigin((-2912, 1144, 968));
       		jumper setPlayerAngles((0, 270, 0));

       		wait 0.1;

       		jumper takeAllWeapons();
       		jumper giveWeapon("remington700_mp");
       		jumper giveMaxAmmo("remington700_mp");

       		wait 0.1;

       		jumper switchToWeapon("remington700_mp");
       		jumper.health = jumper.maxHealth;
 		xPrintlnBold(jumper, "Sniper");

       		thread endSniperActivator();

               	wait 1.8;

               	jumper freezeControls(false);

       		while(isAlive(jumper) && isDefined(jumper))

       		    	wait 1;
 
    	}

}
 
endSniperActivator()
{

    	if(getTeamPlayersAlive("axis") == 1) {

        		people = getEntArray("player", "classname");
 
        		for(x = 0; x < people.size; x++) {

            			if(people[x].pers["team"] == "axis") {

            				people[x] freezeControls(true);
               			people[x] setOrigin((-2912, 264, 968));
               			people[x] setPlayerAngles((0, 90, 0));

               			wait 0.1;

               			people[x] takeAllWeapons();
               			people[x] giveWeapon("remington700_mp");
               			people[x] giveMaxAmmo("remington700_mp");

               			wait 0.1;

               			people[x] switchToWeapon("remington700_mp");
               			people[x].health = people[x].maxHealth;

               			wait 1.8;

               			people[x] freezeControls(false);

           			}

        		}

    	}

}

xPrintlnBold(player, room)
{

	x = randomInt(15);
	word = "undefined";

	switch(x) {

		case 0:
			word = "took on the activator in";
			break;

		case 1:
			word = "persued";
			break;

		case 3:
			word = "navigated into";
			break;

		case 4:
			word = "stepped foot upon";
			break;

		case 5:
			word = "made his way into";
			break;

		case 6:
			word = "has been imported into";
			break;

		case 7:
			word = "made it to";
			break;

		case 8:
			word = "travelled through spacetime toward";
			break;

		case 9:
			word = "smells. And entered";
			break;

		case 10:
			word = "challenged the activator in";
			break;

		case 11:
			word = "is now fighting for their life in";
			break;

		case 12:
			word = "chose";
			break;

		case 13:
			word = "accessed the";
			break;

		case 14:
			word = "initallized " + room + "Room.exe.";
			break;

		default:
			word = "entered";
			break;
		

	}

	if(x != 14)
	
		iPrintlnBold("^1" + player.name + " ^7" + word + " the ^5" + room + "^7 room.");

	else

		iPrintlnBold("^1" + player.name + " ^7" + word);


}

endGame()
{

	level waittill("intermission");

	wait 40;

	iPrintLn("Add the map maker on Steam/Xfire by adding 'comicalcallan', if you want to. I don't care.");

}







/**





**/
