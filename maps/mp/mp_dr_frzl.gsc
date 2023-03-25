// MIT License

// Copyright (c) 2020 Fraser Watt

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

main() {
	maps\mp\mp_dr_frzl_fx::main();
	maps\mp\_load::main();
	maps\mp\_explosive_barrels::main();

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	level.trapTriggers = [];
	level.roomOccupied = false;
	self.activatedTraps = [];
	self.trapCount = 8;
	self.miscCount = 39;
	self.activatorDoor = false;
	self.messages = "Created by Frazzle.;This map can be found on GitHub @Frazzle;Discord: frazzle#6627;Report any bugs found to the GitHub repository";
	self.secretReward = 1000; //Amount of XP to be awarded when secret is finished (Only 1st person gets the max reward)
	self.secretRewardOffset = 250; //Amount of XP to be subtracted from the secret reward on completion
	
	//Music info (name, duration)
	self.songs = [];
	self.songs[0] = [];
	self.songs[0][0] = "Miracle (feat. Daimy Lotus)";
	self.songs[0][1] = 191;
	self.songs[1] = [];
	self.songs[1][0] = "Hope";
	self.songs[1][1] = 288;
	self.songs[2] = [];
	self.songs[2][0] = "Fearless Pt. II";
	self.songs[2][1] = 194;
	self.songs[3] = [];
	self.songs[3][0] = "Happi (feat. bby ivy)";
	self.songs[3][1] = 163;
	self.songs[4] = [];
	self.songs[4][0] = "Turn It Up";
	self.songs[4][1] = 185;
	//Music Info End

	//Access to vip gun & knife
	self.vipList = [];
	self.vipList["2310346615340603288"] = true; //Map creator
	//Add guids here
	//Access to vip gun & knife End

	precacheItem("m40a3_mp");
	precacheItem("remington700_mp"); //sniper room
	precacheItem("knife_mp"); //ss, knife, bounce rooms
	precacheItem("frag_grenade_mp"); //nade room
	preCacheItem("flash_grenade_mp"); //flash room
	preCacheItem("p90_mp");
	preCacheItem("m16_mp");
	preCacheItem("dragunov_mp");
	preCacheItem("g36c_mp");
	preCacheItem("mp5_mp");
	preCacheItem("g3_mp");
	preCacheItem("m1014_mp");
	preCacheItem("m60e4_mp");
	preCacheItem("uzi_mp");
	preCacheItem("ak47_mp"); //weapon room
	preCacheItem("deserteagle_mp");
	preCacheItem("colt45_mp");
	preCacheItem("defaultweapon_mp"); //pistol room
	preCacheItem("rpg_mp"); //rpg room
	preCacheItem("beretta_mp"); //old 1v1
	preCacheItem("mp44_mp");
	preCacheItem("ak74u_mp"); //armoury
	preCacheItem("ice_pick_mp"); //Created by Mist
	preCacheItem("dischord_mp"); //Created by VC'Fox, secret weapons
	preCacheModel("playermodel_kermit_the_frog");
	preCacheModel("viewhands_kermit"); //Created by VC'Fox, secret model
	preCacheMenu("frzl_music");
	preCacheMenu("frzl_music_main"); //Custom music menu

	thread startPlatform();
	thread preventActivatorCamp();
	thread timedMessages();

	for (id = 0; id < self.trapCount; id++) {
		thread trapData(id);
	}

	for (id = 0; id < self.miscCount; id++) {
		thread miscData(id);
	}

	createPlatformGame();
	createPasswordGame();
	asciiGame();
	activatorAreaProps(false);
}

trapAnim(target) {
	trapButton = getEnt(target, "targetname");
	trapButton moveZ(-5, 0.5);
}

miscAnim(miscButton, axis, amount, time, resetPosition) {
	waitTime = time;

	if (waitTime < 1)
		waitTime += 0.1;

	switch(axis) {
		case "X":
		case "x":
			miscButton moveX(amount, time);			
			wait(waitTime);
			if (resetPosition)
				miscButton moveX(0 - amount, time);
			break;
		case "Y":
		case "y":
			miscButton moveY(amount, time);			
			wait(waitTime);
			if (resetPosition)
				miscButton moveY(0 - amount, time);
			break;
		case "Z":
		case "z":
			miscButton moveZ(amount, time);			
			wait(waitTime);
			if (resetPosition)
				miscButton moveZ(0 - amount, time);
			break;
		default:
			break;
	}
}

spinTrapAxis(spinner, axis, time, interval) {
	switch(axis) {
		case "ROLL":
		case "roll":
			spinner rotateRoll(360, time);
			wait(time);
			break;
		case "YAW":
		case "yaw":
			spinner rotateYaw(360, time);
			wait(time);
			break;
		case "PITCH":
		case "pitch":
			spinner rotatePitch(360, time);
			wait(time);
			break;
	}

	if (interval)
		wait(interval);
}

spinTrap(trapId, spinner, axis, time, interval, stopOnActivate, removeCollisionOnActivate) {
	if (stopOnActivate) {
		while (!self.activatedTraps[trapId]) {
			spinTrapAxis(spinner, axis, time, interval);
		}

		if (removeCollisionOnActivate)
			spinner notSolid();
	} else {
		collisionRemoved = false;

		while (true) {
			if (removeCollisionOnActivate && self.activatedTraps[trapId] && !collisionRemoved) {
				spinner notSolid();
			}

			spinTrapAxis(spinner, axis, time, interval);
		}
	}
}

moverTrapAxis(mover, axis, amount, time, interval) {
	switch(axis) {
		case "X":
		case "x":
			mover moveX(amount, time);
			wait(time);
			mover moveX(0 - amount, time);
			wait(time);
			break;
		case "Y":
		case "y":
			mover moveY(amount, time);
			wait(time);
			mover moveY(0 - amount, time);
			wait(time);
			break;
		case "Z":
		case "z":
			mover moveZ(amount, time);
			wait(time);
			mover moveZ(0 - amount, time);
			wait(time);
			break;
		case "ROLL":
		case "roll":
			mover rotateRoll(amount, time);
			wait(time);
			mover rotateRoll(0 - amount, time);
			wait(time);
			break;
		case "YAW":
		case "yaw":
			mover rotateYaw(amount, time);
			wait(time);
			mover rotateYaw(0 - amount, time);
			wait(time);
			break;
		case "PITCH":
		case "pitch":
			mover rotatePitch(amount, time);
			wait(time);
			mover rotatePitch(0 - amount, time);
			wait(time);
			break;
	}

	if (interval)
		wait(interval);
}	

moverTrap(trapId, mover, axis, amount, time, interval, stopOnActivate, removeCollisionOnActivate) {
	if (stopOnActivate) {
		while (!self.activatedTraps[trapId]) {
			moverTrapAxis(mover, axis, amount, time, interval);
		}

		if (removeCollisionOnActivate)
			mover notSolid();
	} else {
		collisionRemoved = false;

		while (true) {
			if (removeCollisionOnActivate && self.activatedTraps[trapId] && !collisionRemoved) {
				mover notSolid();
			}

			moverTrapAxis(mover, axis, amount, time, interval);
		}
	}	
}

//Start door moving platform
startPlatform() {
	level waittill("round_started");
	startPlatform = getEnt("start_platform", "targetname");

	wait(7);

	iPrintLnBold("^4Moving in..");

	for (i = 3; i > 0; i--) {
		iPrintLnBold("^" + i + "" + i);
		wait(1);
	} //platform moving countdown

	while(true) {
		startPlatform moveX(250, 2, 1, 1);

		wait(2.5);

		startPlatform moveZ(-750, 2, 1, 1);

		wait(2.5);

		startPlatform moveX(-250, 2, 1, 1);

		wait(10);

		startPlatform moveX(250, 2, 1, 1);		

		wait(2.5);

		startPlatform moveZ(750, 2, 1, 1);	

		wait(2.5);

		startPlatform moveX(-250, 2, 1, 1);

		wait(5);
	}
}

//Prevent activator from camping at spawn
preventActivatorCamp() {
	level waittill("round_started");
	wait(20);
	trigger = getEnt("activator_camp_trigger", "targetname");
	trigger waittill("trigger", player);

	spawn = getEnt("activator_camp_spawn", "targetname");
	player setOrigin(spawn.origin);
	player setPlayerAngles(spawn.angles);
	player iPrintLnBold("^1Camping up top doesn't work :)");
	trigger delete();
}

//Timed informative messages/credits
timedMessages() {
	count = 0;
	messages = strTok(self.messages, ";");

	while (true) {
		iPrintLn("^1>> ^7" + messages[count]);
		count++;
		if (count >= messages.size)
			count = 0;
		wait(10);
	}
}
//Trap functionality
trapData(id) {
	self.activatedTraps[id] = false;
	level.trapTriggers[id] = getEnt("trap_" + id + "_trigger", "targetname");

	switch(id) { //before activation functionality
		case 2: //Remove spinner collision trap
		    //Make spinners spin
			trapWire = getEnt("trap_2_wire", "targetname");
			trapWire hide();
			for (i = 0; i < 2; i++) {
				thread spinTrap(id, getEnt("trap_2_spinner_" + i, "targetname"), "yaw", 0.7, false, false, true);
			}
			break;
		case 3:
			//attach hurt trigger to crusher trap
			crusher = getEnt("trap_3_crusher", "targetname");
			crusherTrigger = getEnt("trap_3_crusher_trigger", "targetname");
			crusherTrigger enableLinkTo();
			crusherTrigger linkTo(crusher);
			break;
		case 5: //Small pillars moving up and down
			//Remove collision from fake middle platform
			pillar = getEnt("trap_5_pillar_fake", "targetname");
			pillar notSolid();
			break;
		case 6: //Knock off moving platform
			//Make platform move
			thread moverTrap(id, getEnt("trap_6_platform", "targetname"), "x", 357, 2, false, false, false);
			//attach hurt trigger to knocker trap
			knocker = getEnt("trap_6_knocker", "targetname");
			knockerTrigger = getEnt("trap_6_knocker_trigger", "targetname");
			knockerTrigger enableLinkTo();
			knockerTrigger linkTo(knocker);
			knocker notSolid(); //remove knocker collision so it doesn't get jammed
			break;
		default:
			break;
	}

	level.trapTriggers[id] waittill("trigger", player);
	self.activatedTraps[id] = true;

	switch(id) { //after activation functionality
		case 0: //Floor removal trap
			trapRandom = randomIntRange(0, 2);
			trapFloor = getEnt("trap_0_" + trapRandom, "targetname");
			trapFloor delete();
			break;
		case 1: //Ladder removal trap
			trapRandom = randomIntRange(0, 2);
			trapLadder = getEnt("trap_1_" + trapRandom, "targetname");
			trapLadder delete();
			break;
		case 2: //Remove spinner collision trap
			trapWire = getEnt("trap_2_wire", "targetname");
			trapWire show();
			break;
		case 3: //Maze crusher
			yOffset = 304;

			//open crusher doors
			for (i = 0; i < 2; i++) {
				door = getEnt("trap_3_h_door_" + i, "targetname");
				door moveY(yOffset, 2);
				yOffset *= -1;
			} //horizontal roof doors

			//close maze doors
			door = getEnt("trap_3_v_door_0", "targetname");
			door moveZ(98, 2); //vertical maze doors
			wait(2);

			crusher = getEnt("trap_3_crusher", "targetname");
			crusher moveZ(-253, 5); //crusher
			wait(5);

			wait(2); //make sure everyone in the maze is dead

			//move crusher back up
			crusher = getEnt("trap_3_crusher", "targetname");
			crusher moveZ(253, 5); //crusher
			wait(5);

			yOffset = -304;

			//open maze doors
			door = getEnt("trap_3_v_door_0", "targetname");
			door moveZ(-98, 2); //vertical maze doors

			//close crusher doors
			for (i = 0; i < 2; i++) {
				door = getEnt("trap_3_h_door_" + i, "targetname");
				door moveY(yOffset, 2);
				yOffset *= -1;
			} //horizontal roof doors
			wait(2);
			break;
		case 4: //Remove 2 Square platforms
			for (row = 0; row < 2; row++) {
				square = getEnt("trap_4_platform_" + row + "_" + randomIntRange(0, 2), "targetname");
				square notSolid();
			}
			break;
		case 5: //Small pillars, delete 2 rows
			for (row = 0; row < 2; row++) {
				pillars = getEnt("trap_5_pillar_" + randomIntRange(0, 3), "targetname");
				while (!isDefined(pillars)) {
					pillars = getEnt("trap_5_pillar_" + randomIntRange(0, 3), "targetname");
					wait(0.1);
				}
				pillars delete();
			}
			break;
		case 6: //Knock off moving platform
			knocker = getEnt("trap_6_knocker", "targetname");
			knocker moveZ(-114.5, 0.5); //move down
			wait(0.6);
			knocker moveX(219.5, 0.5); //move forward
			wait(0.6);
			knocker moveX(-219.5 + -218.5, 0.5); //move back
			wait(0.6);
			knocker moveX(218.5, 0.5); //move forward to middle
			wait(0.6);
			knocker moveZ(114.5, 0.5); //move up
			wait(0.6);
			break;
		case 7: //Rotate bounce
			thread spinTrap(id, getEnt("trap_7_bounce", "targetname"), "yaw", 2, 2, false, false);
			break;
		default:
			break;
	}

	level.trapTriggers[id] delete();
	trapAnim("trap_" + id + "_button");
}

miscData(id) {
	while (true) {
		miscTrigger = getEnt("misc_" + id + "_trigger", "targetname");

		if (!isDefined(miscTrigger))
			return;

		miscTrigger waittill("trigger", player);

		switch(id) {
			case 0: //VIP Button
				if (isDefined(player.guid) && isDefined(self.vipList[player.guid]) && self.vipList[player.guid]) { //Give map weapons & model to creator
					player giveWeapon("ice_pick_mp");
					player giveMaxAmmo("ice_pick_mp");
					player giveWeapon("dischord_mp");
					player giveMaxAmmo("dischord_mp");
					player setModel("playermodel_kermit_the_frog");
					player setViewModel("viewhands_kermit");
					miscAnim(getEnt("misc_" + id + "_button", "targetname"), "y", 6, 0.5, true);
				} else if (isDefined(player.pers["vip"]) && player.pers["vip"]) {
					player suicide();
					miscAnim(getEnt("misc_" + id + "_button", "targetname"), "y", 6, 0.5, true);
				} else
					player iPrintLn("^1>> ^7Access denied");
				break;
			case 1: //End door
				miscAnim(getEnt("misc_" + id + "_door", "targetname"), "x", 120, 5, false);
				break;
			case 2:
			case 3:
			case 4:
			case 5:
			case 6:
			case 7:
			case 8:
			case 9:
			case 10:
			case 11:
			case 12:
			case 13: //End Rooms
				if (isDefined(level.freeRun) && level.freeRun && id == 11) { //Prevent old mayhem from being picked in freerun
					player iPrintLnBold("^1This room doesn't work in freerun!");
					continue;
				}

				if (isDefined(player.ghost) && player.ghost) {
					player suicide();
					continue;
				} //kill players in ghost mode

				if (player.pers["team"] == "axis") //only accept jumper triggers
					continue;

				if (isDefined(level.disableRoomPlugin) && !level.disableRoomPlugin) { //check if respect plugin is enabled
					if (!respectPluginCheck(player, id))
						continue;
				} else if (level.roomOccupied)
					continue;

				if (!(isDefined(level.disableRoomPlugin) && !level.disableRoomPlugin)) { //check if respect plugin is disabled
					if (id == 13) //don't close activator door if respect plugin is disabled
						continue;
					level.roomOccupied = true;
					player thread roomDeathListener();
				}

				players = [];
				players[0] = player;
				if (isDefined(level.activ) && isAlive(level.activ)) {
					players[1] = level.activ;
				}
				spawnSide = [];
				spawnSide[0] = randomInt(2);
				spawnSide[1] = 0;
				if (spawnSide[0] == spawnSide[1])
					spawnSide[1] = 1;

				switch(id) {
					case 2: //Sniper room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Sniper");

						spawnPoint = randomInt(3);

						for (side = 0; side < spawnSide.size; side++)
							thread roomTeleportListener(id, side, 3);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_2_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("m40a3_mp");
							players[player] giveMaxAmmo("m40a3_mp");
							players[player] giveWeapon("remington700_mp");
							players[player] giveMaxAmmo("remington700_mp");
							players[player] switchToWeapon("m40a3_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 3: //Weapon room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Weapon");

						spawnPoint = randomInt(3);
						randomWeapon = "saw_mp";
						switch(randomInt(10)) {
							case 0:
								randomWeapon = "p90_mp";
								break;
							case 1:
								randomWeapon = "m16_mp";
								break;
							case 2:
								randomWeapon = "dragunov_mp";
								break;
							case 3:
								randomWeapon = "g36c_mp";
								break;
							case 4:
								randomWeapon = "mp5_mp";
								break;
							case 5:
								randomWeapon = "g3_mp";
								break;
							case 6:
								randomWeapon = "m1014_mp";
								break;
							case 7:
								randomWeapon = "m60e4_mp";
								break;
							case 8:
								randomWeapon = "uzi_mp";
								break;
							case 9:
								randomWeapon = "ak47_mp";
								break;
						}

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_3_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("knife_mp");
							players[player] giveWeapon(randomWeapon);
							players[player] giveMaxAmmo(randomWeapon);
							players[player] switchToWeapon(randomWeapon);
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 4: //Knife room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Knife");

						spawnPoint = randomInt(3);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_4_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("knife_mp");
							players[player] switchToWeapon("knife_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 5: //Nade room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Nade");

						spawnPoint = randomInt(2);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_5_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("frag_grenade_mp");
							players[player] switchToWeapon("frag_grenade_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 6: //RPG room
						iPrintLnBold("^1" + player.name + " ^7chose ^5RPG");

						spawnPoint = randomInt(3);

						for (side = 0; side < spawnSide.size; side++)
							thread roomTeleportListener(2, side, 3);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_2_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(200);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("rpg_mp");
							players[player] giveMaxAmmo("rpg_mp");
							players[player] switchToWeapon("rpg_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 7: //Pistol room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Pistol");

						spawnPoint = randomInt(3);
						randomWeapon = "deserteaglegold_mp";
						switch(randomInt(3)) {
							case 0:
								randomWeapon = "deserteagle_mp";
								break;
							case 1:
								randomWeapon = "colt45_mp";
								break;
							case 2:
								randomWeapon = "defaultweapon_mp";
								break;
						}

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_3_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("knife_mp");
							players[player] giveWeapon(randomWeapon);
							players[player] giveMaxAmmo(randomWeapon);
							players[player] switchToWeapon(randomWeapon);
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 8: //Flashbang room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Flashbang");

						spawnPoint = 0;

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_8_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(1);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("flash_grenade_mp");
							players[player] switchToWeapon("flash_grenade_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Flash!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 9: //Simon says room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Simon Says");

						spawnPoint = randomInt(2);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_9_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown

						ssGame(id, players, spawnSide, 2);
						break;
					case 10: //Bounce room
						iPrintLnBold("^1" + player.name + " ^7chose ^5Bounce");

						spawnPoint = randomInt(4);

						for (side = 0; side < spawnSide.size; side++)
							thread roomTeleportListener(id, side, 4);

						for (player = 0; player < players.size; player++) {
							spawn = getEnt("misc_10_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
							players[player] setOrigin(spawn.origin);
							players[player] setPlayerAngles(spawn.angles);
							players[player] setNormalHealth(100);
							players[player] freezeControls(true);
							players[player] takeAllWeapons();
							players[player] giveWeapon("knife_mp");
							players[player] switchToWeapon("knife_mp");
						}

						for (count = 3; count >= 0; count--) {							
							for (player = 0; player < players.size; player++) {
								if (count != 0)
									players[player] iPrintLnBold("^" + count + "" + count);
								else {
									players[player] iPrintLnBold("^5Fight!");
									players[player] freezeControls(false);
								}
							}
							wait(1);
						} //countdown
						break;
					case 11: //Old room (Mayhem)
						iPrintLnBold("^1" + player.name + " ^7chose ^5Old ^7(^2Jumpers ^7vs ^1Activator^7)");
						for (room = 2; room < 14; room++) {
							trigger = getEnt("misc_" + room + "_trigger", "targetname");
							trigger delete();
						} //delete room triggers

						trigger = getEnt("misc_20_trigger", "targetname");
						trigger delete(); //remove activator barrier

						activatorAreaProps(true, true);

						if (isDefined(players[1])) {
							spawn = getEnt("activator_camp_spawn", "targetname");
							players[1] setOrigin(spawn.origin);
							players[1] setPlayerAngles(spawn.angles);
							players[1] setNormalHealth(200);
							players[1] takeAllWeapons();
							players[1] giveWeapon("knife_mp");
							players[1] switchToWeapon("knife_mp");
							players[1] iPrintLnBold("^1Grab a weapon and slaughter the jumpers!");
						} //move activator to safe area

						thread oldBlacklistListener();

						doorTop = getEnt("armoury_door_top", "targetname");
						doorBottom = getEnt("armoury_door_bottom", "targetname");

						doorTop moveZ(45, 3);
						doorBottom moveZ(-45, 3);
						activatorDoor(true);
						break;
					case 12: //Old room (1v1)
						iPrintLnBold("^1" + player.name + " ^7chose ^5Old ^7(^21 ^7vs ^11^7)");
						for (player = 0; player < players.size; player++) {
							players[player] setNormalHealth(100);

							if (isDefined(level.freeRun) && level.freeRun) { //remove weapons if freerun
								players[player] takeAllWeapons();
								players[player] giveWeapon("knife_mp");
								players[player] switchToWeapon("knife_mp");
							} else {
								if (players[player] hasWeapon("raygun_mp")) { //remove raygun
									players[player] takeWeapon("raygun_mp");
									players[player] giveWeapon("beretta_mp");
									players[player] switchToWeapon("beretta_mp");
								}

								if (isDefined(level.dvar["vipWeapon"]) && players[player] hasWeapon(level.dvar["vipWeapon"])) { //remove vip weapon
									players[player] takeWeapon(level.dvar["vipWeapon"]);
									players[player] giveWeapon("beretta_mp");
									players[player] switchToWeapon("beretta_mp");
								}
							}

							if (player > 0) {
								spawn = getEnt("activator_old_spawn", "targetname");								
								players[player] setOrigin(spawn.origin);
								players[player] setPlayerAngles(spawn.angles);
							}
						}
						if (!self.activatorDoor)
							activatorDoor(true);
						thread oldBlacklistListener();
						break;
					case 13:
						thread activatorDoor(false);
						spawn = getEnt("misc_13_spawn", "targetname");
						ent = spawn ("script_model", (0, 0, 0));
						ent.origin = player.origin;
						ent.angles = player.angles;
						player linkTo(ent);
						ent moveTo(spawn.origin, 0.3);
						wait(0.35);
						player unlink();
						break;
					default:
						break;
				}
				break;
			case 14: //Bounce room weapon pickup
				if (!player hasWeapon("m40a3_mp")) {
					player giveWeapon("m40a3_mp");

				}
				player giveMaxAmmo("m40a3_mp");
				player switchToWeapon("m40a3_mp");
				break;
			case 15: //Nade room ammo replenishment
			case 16:
				if (player hasWeapon("frag_grenade_mp"))
					player giveMaxAmmo("frag_grenade_mp");
				wait(1);
				break;
			case 17: //Flashbang room ammo replenishment
				if (player.pers["team"] == "axis")
					continue;
				if (player hasWeapon("flash_grenade_mp"))
					player giveMaxAmmo("flash_grenade_mp");
				wait(1);
				break;
			case 18:
				if (player.pers["team"] == "allies")
					continue;
				if (player hasWeapon("flash_grenade_mp"))
					player giveMaxAmmo("flash_grenade_mp");
				wait(1);
				break;
			case 19:
				if (player hasWeapon("rpg_mp"))
					player giveMaxAmmo("rpg_mp");
				wait(1);
				break;
			case 20:
				if (player.pers["team"] == "allies")
					continue;
				spawn = getEnt("misc_20_spawn", "targetname");
				player setOrigin(spawn.origin);
				player setPlayerAngles(spawn.angles);
				break;
			case 21:
			case 22:
			case 23:
			case 24:
			case 25:
			case 26:
			case 27:
			case 28:
			case 29: //Armoury weapons
			case 30:
			case 31: //Addon weapons
				weapon = "beretta_mp";
				switch (id) {
					case 21:
						weapon = "g3_mp";
						break;
					case 22:
						weapon = "m1014_mp";
						break;
					case 23:
						weapon = "mp5_mp";
						break;
					case 24:
						weapon = "mp44_mp";
						break;
					case 25:
						weapon = "ak74u_mp";
						break;
					case 26:
						weapon = "m16_mp";
						break;
					case 27:
						weapon = "remington700_mp";
						break;
					case 28:
						weapon = "dragunov_mp";
						break;
					case 29:
						weapon = "m40a3_mp";
						break;
					case 30:
						weapon = "ice_pick_mp"; //Created by VC'Fox
						break;
					case 31:
						weapon = "dischord_mp"; //Created by Mist
						break;				
				}

				player giveWeapon(weapon);
				player giveMaxAmmo(weapon);
				player switchToWeapon(weapon);
				break;
			case 32: //Addon model
				player setModel("playermodel_kermit_the_frog");
				player setViewModel("viewhands_kermit"); //Created by VC'Fox
				break;
			case 33: //Secret finish trigger
				if (self.secretReward <= 0) //skip if xp reward has been used up
					continue;
				if (isDefined(player.pers["secret"]) && player.pers["secret"]) //skip if player has already finished
					continue;
				player braxi\_rank::giveRankXP(undefined, self.secretReward); //give player xp
				player iPrintLnBold("You got ^1" + self.secretReward + "^3XP ^7 for completing the secret!"); //notify player
				player.pers["secret"] = true; //set player has finished secret
				self.secretReward -= self.secretRewardOffset; //decrease reward amount
				break;
			case 34: //Music selection
				player openMenu("frzl_music_main");
				player waittill("menuresponse", menu, response);

				if (menu == "frzl_music_main")
					switch(response) {
						case "1":
						case "2":
						case "3":
						case "4":
						case "5":
							songData = self.songs[int(response) - 1];
							ambientPlay("frzl_music_" + response);
							iPrintLn("^1>> ^7Now Playing: " + songData[0]);
							wait(songData[1]);
							iPrintLn("^1>> ^7You can now request a new song");
							break;
					};
				break;
			case 35:
			case 36:
			case 37:
			case 38: //Secret teleports
				spawn = getEnt("misc_" + id + "_spawn", "targetname");
				player setOrigin(spawn.origin);
				player setPlayerAngles(spawn.angles);
				break;
			default:
				break;
		}

		wait(0.1);
	}
}

roomTeleportListener(roomId, side, spawnCount) { //teleport players who fall to a revelvant spawn point
	trigger = getEnt("misc_" + roomId + "_teleport_" + side, "targetname");

	if (isDefined(trigger))
		while(level.roomOccupied || (isDefined(level.inRoomPlugin) && level.inRoomPlugin)) {
			trigger waittill("trigger", player);
			spawnPoint = randomInt(spawnCount);
			spawn = getEnt("misc_" + roomId + "_spawn_" + side + "_" + spawnPoint, "targetname");
			player setOrigin(spawn.origin);
			player setPlayerAngles(spawn.angles);
		};
}

oldBlacklistListener() { //Remove vip and raygun when entering old
	trigger = getEnt("old_blacklist_trigger", "targetname");
	trigger waittill("trigger", player);

	if (player hasWeapon("raygun_mp")) { //remove raygun
		player takeWeapon("raygun_mp");
		player giveWeapon("beretta_mp");
		player switchToWeapon("beretta_mp");
	}

	if (isDefined(level.dvar["vipWeapon"]) && player hasWeapon(level.dvar["vipWeapon"])) { //remove vip weapon
		player takeWeapon(level.dvar["vipWeapon"]);
		player giveWeapon("beretta_mp");
		player switchToWeapon("beretta_mp");
	}
}

//trigger_once passive trap, variation of "Tip Toe" from Fall Guys
createPlatformGame() {
	platformColumns = 3;
	platformRows = 5;
	realPlatforms = [];

	//generate stable platforms
	realPlatforms[0] = randomIntRange(0, platformColumns);

	for (row = 1; row < platformRows; row++) {
		realPlatforms[row] = randomIntRange(0, platformColumns);
	}

	//add dummy platforms
	for (row = 0; row < platformRows; row++) {
		for (column = 0; column < platformColumns; column++) {
			platformIndicatiorOn = getEnt("platform_game_" + row + "_" + column + "_on", "targetname");

			if (realPlatforms[row] != column) {
				thread addDummyPlatform(row, column);
				platformIndicatiorOn hide();
			} else {
				platformIndicatiorOff = getEnt("platform_game_" + row + "_" + column + "_off", "targetname");
				platformIndicatiorOff hide();
			}
		}
	}
}

addDummyPlatform(row, column) {
	platform = getEnt("platform_game_" + row + "_" + column, "targetname");
	platformTrigger = getEnt("platform_game_" + row + "_" + column + "_trigger", "targetname");
	platformTrigger waittill("trigger", player);
	platform moveZ(-75, 0.3);
	wait(0.3);
	platform delete();
}

//use-touch trigger color based password system (Map checkpoint, slows down gameplay)
createPasswordGame() {
	//0 - Blue (Background / Unselected)
	//1 - Red
	//2 - Green

	self.passwordGamePassword = [];
	self.passwordGameInput = [];
	self.passwordGameColumns = 6;
	self.passwordGameRows = 2;
	self.passwordGameColours = 3;
	self.passwordGameButtons = 3;
	self.passwordGameEnabled = true;

	//hide everything but blue
	passwordGameReset(0, self.passwordGameRows, 0);

	//generate password
	for (column = 0; column < self.passwordGameColumns; column++) {
		self.passwordGamePassword[column] = randomIntRange(1, self.passwordGameColours);
		passwordBrush = getEnt("password_game_1_" + column + "_0", "targetname");
		passwordBrush hide(); //hide background
		passwordBrush = getEnt("password_game_1_" + column + "_" + self.passwordGamePassword[column], "targetname");
		passwordBrush show(); //show password character (red/blue)
	}

	for (button = 0; button < self.passwordGameButtons; button++) {
		thread passwordGameListener(button);
	}
}

passwordGameMatch(passwordA, passwordB) {
	if (passwordA.size != passwordB.size)
		return false;

	for (i = 0; i < passwordA.size; i++) {
		if (passwordA[i] != passwordB[i])
			return false;
	}

	return true;
}

passwordGameListener(id) {
	trigger = getEnt("password_game_trigger_" + id, "targetname");

	while(self.passwordGameEnabled) {		
		trigger waittill("trigger", player);

		if (self.passwordGameEnabled) {
			switch(id) {
				case 0:
					if (self.passwordGamePassword.size == self.passwordGameInput.size && passwordGameMatch(self.passwordGamePassword, self.passwordGameInput)) { //check if password matches
						self.passwordGameEnabled = false;
						passwordGameReset(0, self.passwordGameRows, 2); //set all blocks to green to indicate it was a success
						
						iPrintLnBold("^1" + player.name + " ^7has unlocked the checkpoint!");

						door = getEnt("password_game_door", "targetname");
						door moveZ(97, 5); //open the door
					} else {
						self.passwordGameInput = [];
						passwordGameReset(0, self.passwordGameRows - 1, 0); //reset user input
					}
					break;
				case 1:
				case 2:
					if (self.passwordGamePassword.size != self.passwordGameInput.size) {
						passwordBrush = getEnt("password_game_0_" + self.passwordGameInput.size + "_0", "targetname");
						passwordBrush hide(); //hide background
						passwordBrush = getEnt("password_game_0_" + self.passwordGameInput.size + "_" + id, "targetname");
						passwordBrush show(); //show password character (red/blue)
						self.passwordGameInput[self.passwordGameInput.size] = id;
					}
					break;
			}
		}
	}

	trigger delete();
}

passwordGameReset(rowIdx, rowCount, showColourIdx) {
	for (row = rowIdx; row < rowCount; row++) {
		for (column = 0; column < self.passwordGameColumns; column++) {
			for (colour = 0; colour < self.passwordGameColours; colour++) {
				passwordBrush = getEnt("password_game_" + row + "_" + column + "_" + colour, "targetname");
				if (showColourIdx == colour) 
					passwordBrush show();
				else
					passwordBrush hide();
			}
		}
	}
}

//ASCII Decimal input using damage triggers (supports ASCII Decimal 32-126)
asciiMap() { //Create an array map of ascii characters
	ascii = "! \" # $ % & ' ( ) * + , - . / 0 1 2 3 4 5 6 7 8 9 : ; < = > ? @ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z [ \\ ] ^ _ ` a b c d e f g h i j k l m n o p q r s t u v w x y z { | } ~";
	ascii = strTok(ascii, " ");
	asciiMap = [];
	asciiMap["toChar"] = [];
	asciiMap["toNumber"] = [];
	asciiMap["offset"] = 32;

	asciiMap["toChar"][0] = " ";
	asciiMap["toNumber"][" "] = 0;

	for (id = 0; id < ascii.size; id++) {
		asciiMap["toChar"][id + 1] = ascii[id];
		asciiMap["toNumber"][ascii[id]] = id + 1;
	}

	return asciiMap;
}

asciiGame() {
	self.asciiMap = asciiMap();
	self.asciiGamePassword = asciiGameCreatePassword("F R Z L", " ");
	self.asciiGameInput = [];
	self.asciiGameButtons = 12;
	self.asciiGameStatus = 3;
	self.asciiGameEnabled = true;

	for (button = 0; button < self.asciiGameButtons; button++) {
		thread asciiGameListener(button);
	}

	asciiGameStatus(0);
}

asciiGameCreatePassword(str, delim) { //Transform a word into an array of ascii decimals
	password = [];
	chars = strTok(str, delim);

	for (char = 0; char < chars.size; char++) {
		password[char] = [];
		digits = [];
		num = self.asciiMap["toNumber"][chars[char]] + self.asciiMap["offset"];

		while (num > 0) {
			digit = int(num % 10);
			digits[digits.size] = digit;
			num = int(num / 10);
		}

		if (digits.size < 3)
			digits[digits.size] = 0;

		for (i = digits.size - 1; i >= 0; i--) 
			password[char][password[char].size] = digits[i];
	}

	return password;
}

asciiGameListener(id) { //Handle ascii number inputs (0-9) and clear (10) and enter (11)
	trigger = getEnt("ascii_game_trigger_" + id, "targetname");

	while(self.asciiGameEnabled) {
		trigger waittill("trigger", player);

		if (self.asciiGameEnabled) {
			switch(id) {
				case 10:
					self.asciiGameInput = [];
					asciiGameStatus(0);
					iPrintLn("^1>> ^7ASCII Game: ^7The input has been ^1reset");
					break;
				case 11:
					inputStr = asciiGameToString(self.asciiGameInput);
					if (inputStr == "")
						inputStr = "[^1EMPTY^3]";

					if (asciiGameMatch(self.asciiGamePassword, self.asciiGameInput)) {
						self.asciiGameEnabled = false;
						iPrintLn("^1>> ^7ASCII Game: ^3" + inputStr + " ^7was the ^2correct ^7answer!");
						iPrintLnBold("^1" + player.name + " ^7unlocked the secret!");
						door = getEnt("ascii_game_door", "targetname");
						door moveY(64, 5);
						asciiGameStatus(2);
					} else {
						iPrintLn("^1>> ^7ASCII Game: ^3" + inputStr + " ^7was the ^1wrong ^7answer, try again!");
						asciiGameStatus(1);
					}
					break;
				default:
					if (self.asciiGameInput.size == 0) {
						self.asciiGameInput[self.asciiGameInput.size] = [];
						self.asciiGameInput[self.asciiGameInput.size - 1][0] = id;
					} else if (self.asciiGameInput[self.asciiGameInput.size - 1].size < 3) {
						self.asciiGameInput[self.asciiGameInput.size - 1][self.asciiGameInput[self.asciiGameInput.size - 1].size] = id;
					} else {
						self.asciiGameInput[self.asciiGameInput.size] = [];
						self.asciiGameInput[self.asciiGameInput.size - 1][0] = id;
					}
					asciiGameStatus(0);
					break;
			}
		}
	}

	trigger delete();
}

asciiGameStatus(id) { //Set visual status of ascii response
	//0 - Blue (Normal)
	//1 - Red (Wrong)
	//2 - Green (Correct)
	for (i = 0; i < self.asciiGameStatus; i++) {
		statusBrush = getEnt("ascii_game_status_" + i, "targetname");
		if (i != id)
			statusBrush hide();
		else
			statusBrush show();
	}
}

asciiGameToString(chars) { //Tranform array of ascii decimals into a string
	inputStr = "";
	//inputNumStr = "";

	for (char = 0; char < chars.size; char++) {
		if (isDefined(chars[char][2])) {
			num = (chars[char][0] * 100) + (chars[char][1] * 10) + chars[char][2] - self.asciiMap["offset"];

			//inputNumStr += "[ ^1" + num + "^7, (^2" + chars[char][0] + "^7, ^2" + chars[char][1] + "^7, ^2" + chars[char][2] + "^7) ]";

			if (isDefined(self.asciiMap["toChar"][num]))
				inputStr += self.asciiMap["toChar"][num];
			else
				inputStr += "?";
		}
	}

	//iPrintLn("^1>> ^7ASCII Game: " + inputNumStr);
	return inputStr;
}

asciiGameMatch(passwordA, passwordB) { //Check if two ascii decimal arrays match
	if (passwordA.size != passwordB.size)
		return false;
	
	for (i = 0; i < passwordA.size; i++) {
		if (passwordA[i].size != passwordB[i].size)
			return false;
		for (j = 0; j < passwordA[i].size; j++) {
			if (passwordA[i][j] != passwordB[i][j])
				return false;
		}
	}

	return true;
}

activatorDoor(open) { //toggle opening and closing of activator door
	doorTop = getEnt("activator_door_top", "targetname");
	doorBottom = getEnt("activator_door_bottom", "targetname");
	doorBottomLeft = getEnt("activator_door_bottom_left", "targetname");
	doorBottomRight = getEnt("activator_door_bottom_right", "targetname");
	doorBarrier = getEnt("activator_door_barrier", "targetname");

	self.activatorDoor = open;

	if (open) {
		doorTop moveZ(98, 5);
		wait(1.5);
		doorBottom moveZ(-41, 2.5);
		wait(2.5);
		doorBottomLeft moveX(80, 1);
		doorBottomRight moveX(-80, 1);
		wait(1);
		doorBarrier notSolid();
	} else {
		doorBarrier solid();
		doorTop moveZ(-98, 5);
		doorBottomLeft moveX(-80, 1);
		doorBottomRight moveX(80, 1);
		wait(1);		
		doorBottom moveZ(41, 2.5);
		wait(4);
	}
}

activatorAreaProps(show, move) {
	props = getEntArray("activator_room_props", "targetname");

	for (i = 0; i < props.size; i++) {
		if (show) {
			props[i] show();
			props[i] solid();
		} else {
			props[i] hide();
			props[i] notSolid();
		}

		if (isDefined(move)) {
			if (move)
				props[i].origin -= (0, 256, 0);
			else
				props[i].origin += (0, 256, 0);
		}
	}
}

ssGame(id, participants, spawnSide, spawnCount) { //Simon says end room game
	self.ssGameColours = 9; //amount of platforms/colours
	self.ssGameLength = 2; //initial amount of time in seconds players have to move
	self.ssGameActive = true;

	thread ssGameListener(id, participants, spawnSide, spawnCount); //Create listener to check if a player has failed

	while ((level.roomOccupied || (isDefined(level.inRoomPlugin) && level.inRoomPlugin)) && self.ssGameActive) {
		ssGameSetColour(self.ssGameColours, "platform"); //Reset platforms

		randomColour = randomInt(self.ssGameColours);
		ssGameSetColour(randomColour, "active"); //Show the colour to players

		wait(self.ssGameLength); //wait x amount of time for players to get in position

		if (!self.ssGameActive)
			break;

		ssGameSetColour(randomColour, "platform"); //Remove all platforms except the active colour

		wait(2); //Wait for someone to die..

		if (!self.ssGameActive)
			break;

		self.ssGameLength -= 0.2; //lessen the wait period between showing and removing

		if (self.ssGameLength < 0 && self.ssGameActive) { //End the game as it has been going on to long
			break;
		}
	}

	wasActive = self.ssGameActive;
	self.ssGameActive = false;

	if (level.roomOccupied || (isDefined(level.inRoomPlugin) && level.inRoomPlugin)) { //check if the end fight is still active
		if (wasActive) { //check if the game ended manually
			//initiate a knife fight
			ssGameSetColour(self.ssGameColours, "platform"); //Reset platforms

			spawnPoint = randomInt(spawnCount);

			for (player = 0; player < participants.size; player++) {
				if (isDefined(participants[player])) {
					spawn = getEnt("misc_" + id + "_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
					participants[player] setOrigin(spawn.origin);
					participants[player] setPlayerAngles(spawn.angles);
					participants[player] setNormalHealth(100);
					participants[player] freezeControls(true);
					participants[player] takeAllWeapons();
					participants[player] giveWeapon("knife_mp");
					participants[player] switchToWeapon("knife_mp");
				}
			}

			for (side = 0; side < spawnSide.size; side++)
				thread roomTeleportListener(id, side, spawnCount);

			for (count = 3; count >= 0; count--) {							
				for (player = 0; player < participants.size; player++) {
					if (count != 0)
						participants[player] iPrintLnBold("^" + count + "" + count);
					else {
						participants[player] iPrintLnBold("^5Fight!");
						participants[player] freezeControls(false);
					}
				}
				wait(1);
			} //countdown
		}
	}
	
	if (!(level.roomOccupied || (isDefined(level.inRoomPlugin) && level.inRoomPlugin)) || wasActive)
		self notify("ssGameOver");

	ssGameSetColour(self.ssGameColours, "platform"); //Reset platforms
	
}

ssGameSetColour(id, type) { //Hide/Show platforms
	for (i = 0; i < self.ssGameColours; i++) {
		colour = getEnt("ss_" + i + "_" + type, "targetname");

		if (i != id && id != self.ssGameColours) {
			colour hide();
			if (type == "platform")
				colour notSolid();
		} else {
			colour show();
			if (type == "platform")
				colour solid();			
		}
	}
}

ssGameListener(id, participants, spawnSide, spawnCount) { //Listen for player falling
	while (self.ssGameActive) {
		self endon("ssGameOver");
		trigger = getEnt("ss_trigger", "targetname");
		trigger waittill("trigger", loser);

		if (self.ssGameActive) { //Freeze the loser, give the winner a weapon
			self.ssGameActive = false;
			ssGameSetColour(self.ssGameColours, "platform"); //Reset platforms

			spawnPoint = randomInt(spawnCount);

			for (side = 0; side < spawnSide.size; side++)
				thread roomTeleportListener(id, side, spawnCount);

			for (player = 0; player < participants.size; player++) {
				if (isDefined(participants[player])) {
					spawn = getEnt("misc_" + id + "_spawn_" + spawnSide[player] + "_" + spawnPoint, "targetname");
					participants[player] setOrigin(spawn.origin);
					participants[player] setPlayerAngles(spawn.angles);
					participants[player] setNormalHealth(100);
					participants[player] freezeControls(true);
					participants[player] takeAllWeapons();

					if (participants[player] != loser) { //give the winner a weapon
						participants[player] giveWeapon("knife_mp");
						participants[player] switchToWeapon("knife_mp");
					}
				}
			}

			for (count = 3; count >= 0; count--) {							
				for (player = 0; player < participants.size; player++) {
					if (count != 0)
						participants[player] iPrintLnBold("^" + count + "" + count);
					else {
						if (participants[player] != loser)
							participants[player] freezeControls(false);
					}
				}
				wait(1);
			} //countdown
		}
	}
}

roomDeathListener() { //listen for player death in end room
	while (isDefined(self) && isAlive(self)) {
		wait(0.1);
	}

	level.roomOccupied = false;
}

//Respect plugin
respectPluginCheck(player, id) { //support for _respect plugin
	if (level.finishPosition[level.playerEnterNum].guid != player.guid || (level.inRoomPlugin && id != 13) ) {
		player IPrintLnBold("^1Wait your turn");
		//teleport player here
		player setOrigin((-3428.0, -128.0, -736.0));
		player setPlayerAngles((0.0, -90.0, 0.0));
		return false;
	}

	if (level.inRoomPlugin)
		return true;

	player notify("romm_enter_plugin"); //stop the onQueueDeath check
	level.inRoomPlugin = true;
	player thread respectPluginOnRoomDeath();
	respectPluginUpdateHud();
	return true;
}

respectPluginOnRoomDeath() {
	while(isAlive(self) && isDefined(self))
		wait(0.1);
	level.playerEnterNum++;
	level.inRoomPlugin = false;
	respectPluginUpdateHud();
}

respectPluginUpdateHud() {
	queueStr = "";
	for (i = level.playerEnterNum; i < level.finishPosition.size; i++)
		queueStr += level.finishPosition[i].name + "\n";
	level.queueHud SetText(queueStr);
}