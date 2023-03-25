/*

              _..-'(                       )`-.._
           ./'. '||\\.       (\_/)       .//||` .`\.
        ./'.|'.'||||\\|..    )O O(    ..|//||||`.`|.`\.
     ./'..|'.|| |||||\`````` '`"'` ''''''/||||| ||.`|..`\.
   ./'.||'.|||| ||||||||||||.     .|||||||||||| ||||.`||.`\.
  /'|||'.|||||| ||||||||||||{     }|||||||||||| ||||||.`|||`\
 '.|||'.||||||| ||||||||||||{     }|||||||||||| |||||||.`|||.`
'.||| ||||||||| |/'   ``\||``     ''||/''   `\| ||||||||| |||.`
|/' \./'     `\./         \!|\   /|!/         \./'     `\./ `\|
V    V         V          }' `\ /' `{          V         V    V
`    `         `               V               '         '    '


		**************************************************
		*       NitroFire                                *
		*                                                *
		* Steam:      NitroFire1289                      *
		* Script Name:   mp_deathrun_graffiti.gsc        *
		* Script By :     NitroFire                      *
		**************************************************

		[If you plan to use this script, please give credit where it is due.]

*/
#include maps\mp\mp_deathrun_graffiti\_utilities;
#include maps\mp\mp_deathrun_graffiti\_traps;
#include maps\mp\mp_deathrun_graffiti\_endRooms;
#include maps\mp\mp_deathrun_graffiti\_vip;


main() {
    game["allies"] = "marines";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "desert";
    game["axis_soldiertype"] = "desert";

	

    // Fixes and Visual Tweaks
    //VisionSetNaked( "mp_deathrun_graffiti", 0); // Todo: Add Vision Later

	//########################### Threads ############################\\

	thread maps\mp\mp_deathrun_graffiti\_utilities::doUtilities();
  // thread maps\mp\mp_deathrun_graffiti\_traps::doTraps();
  // thread maps\mp\mp_deathrun_graffiti\_endRooms::doEndRooms();
  // thread maps\mp\mp_deathrun_graffiti\_vip::doVip();

	//########################### End Threads ########################\\

	level waittill("round_started");
    thread sendMessage("^1>>^7Welcome to ^1mp_deathrun_graffiti ^7by ^1NitroFire^7!^1<<");
}

/*
  * @param msg - Enter the message you would like to be printed
*/ 
sendMessage(msg) {
  players = getentarray("player" , "classname");

    noti = SpawnStruct();
    noti.titleText = msg;
    noti.duration = 5;
    noti.glowcolor = (1, 0, 0);
        
    for(i=0; i<players.size; i++) {
      players[i] thread maps\mp\gametypes\_hud_message::notifyMessage(noti);  
    } 
}