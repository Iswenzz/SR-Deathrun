/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles
														go to jwofl.es

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

																	                              .-----.
																	                            /7  .  (
																	                           /   .-.  \
																	                          /   /   \  \
																	                         / `  )   (   )
																	                        / `   )   ).  \
																	                      .'  _.   \_/  . |
																	     .--.           .' _.' )`.        |
																	    (    `---...._.'   `---.'_)    ..  \                               I am a time travelling magic frog!
																	     \            `----....___    `. \  |                                     I came here to tell you something very important,
																	      `.           _ ----- _   `._  )/  |									  there may be updates for this map in the future!
																	        `.       /"  \   /"  \`.  `._   |
																	          `.    ((O)` ) ((O)` ) `.   `._\
																	            `-- '`---'   `---' )  `.    `-.
																	               /                  ` \      `-.
																	             .'                      `.       `.
																	            /                     `  ` `.       `-.
																	     .--.   \ ===._____.======. `    `   `. .___.--`     .''''.
																	    ' .` `-. `.                )`. `   ` ` \          .' . '  8)
																	   (8  .  ` `-.`.               ( .  ` `  .`\      .'  '    ' /
																	    \  `. `    `-.               ) ` .   ` ` \  .'   ' .  '  /
																	     \ ` `.  ` . \`.    .--.     |  ` ) `   .``/   '  // .  /
																	      `.  ``. .   \ \   .-- `.  (  ` /_   ` . / ' .  '/   .'
																	        `. ` \  `  \ \  '-.   `-'  .'  `-.  `   .  .'/  .'
																	          \ `.`.  ` \ \    ) /`._.`       `.  ` .  .'  /
																	           |  `.`. . \ \  (.'               `.   .'  .'
																	        __/  .. \ \ ` ) \                     \.' .. \__
																	 .-._.-'     '"  ) .-'   `.                   (  '"     `-._.--.
																	(_________.-====' / .' /\_)`--..__________..-- `====-. _________)
																	                 (.'(.'
 																				 			touch me





~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
																							,~.
																					      ,-'__ `-,
																					     {,-'  `. }              ,')
																					    ,( a )   `-.__         ,',')~,
																					   <=.) (         `-.__,==' ' ' '}
																					     (   )                      /)
																					      `-'\   ,                    )
																					          |  \        `~.        /
																					          \   `._        \      /
																					           \     `._____,'    ,'
																					            `-.             ,'
																					               `-._     _,-'
																					                   77jj'
																					                  //_||				u will not stop
																							       _//--'/`           the curse of the chicken. ..

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~








										                                               ,g88bg,
										                                       ,g8888g, ),  "8b
										                            you? --->  ),  "88b<     CP
										                                      <     C8I \_ ,'|'  <------ me
										                                       \_ ,-'88,  |  (
										     Hello server manager,         	      |  |88b ,'   \
										     give me power?                     ,'   Y8P/ ,'   `,
										                                      ,' ,'   8( ,'     |
										                                    -@   ;    |(.;    ) (
										                                     `-,/   ,'( \(   / ,'
										  Yb,     ________                     /   / ,' /'  /  (
										   Y8baadP""""""""Yba,_             .-'  ,' _|-'  ,'   |
										aaadP"'             `""Yb,       .-'  _.'--'  _.-'     (
										`Y8(                    `"Yb, ,-' _.-(___..--'\ (      \
										  `Y,                      "/' ,-'    ,'       )/       )
										    Y,  (O)                `--"a,  _-'       ,-'        )
										    `Y,                        "Y-'       ,-'          /dbaa,,____,aa,_
										     `Y,       ,aa            ,'        ,'         _,-'     ``""""''  "Y,
										       Y,      d'8           /        ,'       _,-'               "Ya   `Y,
										       `b      8 8          (      ,-(     ,-''                     `Y,   Y,
										        Ya o  ,8 8          (     `-._\    "-.                        b   `b
										         Yb,_,dP 8           `-.      `-_     `-.                     Y    8
										          `""""  Y              `-._     \-._    `-_                  8    8
										                 I,                 `-._  `._`-._   `-._              8    8
										                 `b                     `,   )   ``-,   )             P    [
										                  `b                    ,' ,'      ,' ,'             d'    [
										                   d                    |,'        |,'              ,P     [
										                 ,d'    ,PY,         ,P"YaaaaaaP"Ybaaa,,_           d'     [
										                d"    ,P"  Y,        d'           8'  `""db,       d'      8
										               d'   ,P"    `Y,       8            I,     d'"b,     8a      P
										              d(    (       `Y,      P            `b    ,P  `Y,    8`Ya___d'
										              "Y,   "b,      `Y,    ,I             8    d'   `8    8  `"""'
										                "Y,   "b,  __ `8,   d'            ,8   ,P     8    8
										                  "Y,   "bd88b `b   8             I'   d'     Y,   8
										                    "Y,    888b 8   8             8   ,P      `b   8
										                      "Ya,,d888b8   P            d'  ,P'       8   Y,
										                         `"""",d"  ,I        ,adPb__aP'        Y   `b
										                           ,a8P,__aP'       d888888P'         ,d    8
										                          d8888888'         88888888       ,d888bbaaP
										                          88888888                         88888888'
										                                                           """"""""


_______________________________________________________________________________________________________________________________________________________________________________
_______________________________________________________________________________________________________________________________________________________________________________|
*/

#include maps\mp\gametypes\_hud_util;

main()
{
	thread mikeyInit();
	maps\mp\_load::main();

	PreCacheItem("m60e4_grip_mp");
	PreCacheItem("colt44_mp");
	PreCacheItem("dragunov_acog_mp");
	PreCacheItem("m40a3_acog_mp");
	//PreCacheModel("tag_origin");
	level.fart = loadfx( "familyguy/fart" );
	level.explos = loadfx( "familyguy/trap1" );
	level.guns = loadfx( "familyguy/guntrap" );
	level.red = loadfx( "familyguy/bomb" );
	level.sectrail = loadfx( "familyguy/viptrail" );
	level.vipfart = loadfx( "familyguy/vipfart" );
	level.viptrailtwo = loadfx( "familyguy/viptrailtwo" );
	level.viptrailthree = loadfx( "familyguy/viptrailthree" );
	level.viptrailfour = loadfx( "familyguy/trollsshit1" );
	level.viptrailfive = loadfx( "familyguy/trollvip" );
	level.pretty = loadfx( "familyguy/pretty" );
	level.chictrail = loadfx( "familyguy/chickentrail" );
	level.chi = loadfx( "familyguy/chidori" );

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	addTriggerToList("trigger1");
	addTriggerToList("trigger2");
	addTriggerToList("trigger3");
	addTriggerToList("trigger4");
	addTriggerToList("trigger6pt1");
	addTriggerToList("trigger6pt2");
	addTriggerToList("trigger6");
	addTriggerToList("trigger7");
	addTriggerToList("trigger8");
	addTriggerToList("trigger9");
	addTriggerToList("trigger10");
	addTriggerToList("trigger11");
	addTriggerToList("trigger123");
	addTriggerToList("trigger124");
	addTriggerToList("trigger121");
	addTriggerToList("trigger122");
	addTriggerToList("trigger13");
	addTriggerToList("trigger133");
	addTriggerToList("trigger14_1");
	addTriggerToList("trigger14_2");
	addTriggerToList("trigger14_3");
	addTriggerToList("trigger14_4");
	addTriggerToList("trigger16");
	addTriggerToList("trigger17");
	addTriggerToList("trigger18");
	addTriggerToList("trigger15");

	thread braintelep();
	thread watchforacti();
	thread trap_7();
	thread trap_4();
	thread trap_6();
	thread trap_18();
	thread trap_10();
	thread movingp();
	thread trap_6pt1();
	thread trap_6pt2();
	thread blue_stuff();
	thread blue_stuff2();
	thread trap_8();
	thread poison_dmg();
	thread trap3();
	thread trap_11();
	thread hat();
	thread actitele1();
	thread actitele2();
	thread trap121();
	thread trap122();
	thread trap123();
	thread trap124();
	thread trap13();
	thread trap133();
	thread trap16();
	thread trap_14_1();
	thread trap_14_2();
	thread trap_14_3();
	thread trap_14_4();
	thread blue1();
	thread blue2();
	thread red1();
	thread red2();
	thread trap_2();
	thread trap_1();
	thread trap_9();
	thread trap_15();
	thread trap_17();
	thread desttrigger();
	thread lastdoors();
	thread themesong();
	thread enddoor();
	thread endtele();
	thread saveme();
	thread bhoppush();
	thread watchplayersorsomethingstupid();
	thread secret();
	thread chicken();
	thread woflestrig();
	thread ogsec();
	thread fakeone();
	thread faketwo();
	thread realsecret();
	thread cjpoop();
	thread cjpooptwo();
	thread sectrale();
	thread bush();
	thread thred();
	thread old();
	thread knife();
	thread bunny();
	thread chickenn();
	thread andsay();
	thread andsay2();
	thread andsay3();
	//thread andsay4();
	//thread andsay5();
	//thread andsay6();
	thread moveOnTouch();
	thread gravroom();
	thread lolzz();
	thread golder();
	thread bouncing0();
	thread bouncing1();
	thread bouncing2();
	thread bouncing3();
	thread bouncing4();
	thread bouncing5();
	thread bouncing6();
	thread bouncing7();
	thread bouncing8();
	thread bouncing9();
	thread bouncing10();
	thread bouncing11();
	thread bouncing12();
	thread bouncing13();
	thread bouncing14();
	thread bouncing15();
	thread platformz();
	thread other();
	thread spawnEvent();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
                                                      $$$$$$$$$
                                                  $$$$$$$$$$$$$$$$$         $$$$$$
                                                $$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$$
                                              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                             $$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$
                                            $$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$.$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$..$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$$$....$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$        $$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$              $$$$$$$$$$$$$$$$$$$....$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$                 $$$$$$$$    .........$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$$                                  .....$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$ /< $$$*..                           .....$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$% 1    $$$$*                   .**$$$$....$$$$$$$$$$$$$$$$$$$$                Hey
                                    $$$$$$$-$$1 1          -           *$$$$$$$$........$$$$$$$$$$$$$$$$$$$$                 babe (im looking at you blade/mook/mikey)
                                    $$$$$$/ 1$1-1-------  / <                 .   .....$$$$$$$$$$$$$$$$$$$$$
                                    $$$$$$1 11  1-  $$  -1  1          .*------*.......$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1/ 1  1 -------1  1         $   $$     $.....$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1  1  1        1--1   /1      --------......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$1  1  .1       1 .1  1 1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      /  .1  1-1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      1 ..1 1  1             ......$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1 1  ..1    1  ..1 1  1           ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  .1    1  ..11  1     1     ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  ..1   1  ..1  .1/---.<     .......$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ..1  1   ..1 ..1          ........$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ...1 1  ..1  .1           .......$.$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1   ..11   ..1  .1           ......$..$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1 1    ..1   ..1  .1$$$$$$$   ......$...$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1            ..1  .1$$$$$    ......$...$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1            .1   .1.      .....$$...$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1                 .1..    $$...$....$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$$1                 .1..  $$$$.$...$$$$$$$$------..$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$$.               .1...$$$$$$$$$$$$$$$$$/      ----$$$$$$$$$$$$$$       $$$$$
                                 $$$$$$$$$$$$$$ $..             .1$$$$$$$$$$$$$$$$$$/.          -..$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$  $..           ..$..$$$$$$$$$$$$$$$/.            --------$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$$$$    $..          ..$..$$$$$$$$$$$$$$/.                      -$$$$$$$$$$$$$$
                                    $$$$$$$$$     $...         ..$..$$$$$$$$$$$$$/.               ....$$$$$$$$$$$$$$$$$$
                  .*$$$$$$$$$$$$$$$$$$$$$$         $...        ..$...$$$$$$$$$$/..              ...$$$.....     $$$$$$$
               .*$$                                $...       ...$....$$$$$$$$/..            .....$$$$$$$$$$$$$$--  ..$$
             *$$                                   $...       ...$....  $$$$$/..            ....              1   <  ..*$
            $                                      $..        ...$...     $$1..                  ........**$$$$$$$   ...*$
           $                                       $.        ...$....       $..           $   .....$$$$$$            ....*$
          $                                       $..        ...$...        $..           .$ .*..$$...               ....*$
          $                                       $.         ..*$...        $..          ...$.*.$*....              .....**$
         $                                       $.         ..*$...         $..           ...$ $*.....              .....**$
         $.                                     $..        ...*$...         $...           ...$**......             .....**$
        .$.             ..$                     $.        ...*$...           $..           ...$**......             .....**
        $..             ..$.                   $..       ....*$..            $..           ...$**........           .....**$
        $..             ...$..                $..        ...*$..             $...           ...$**.......           .....**$
        $..             ...$.. $             $..        ....*$..              $..           ...$**....$..   $       ....***$
        $..            ....$..$.            $..        ....*$..               $..           ....$**....$$. $         ...***$
       .$..             ....$$..           $..        ....*$..                $...          ....$**......$$.         ...***$
       *...             ....$..           $..        .....*$..                 $..           ....$**.....$..         ...***$
       $...             ....$..          $..        .....*$$.            $     $..           ....$**.....$..        ....***$
       $...              ...$..         $..         ....*$..$          $       $...           ...*$**...$..         ....***$
       $..               ...$..       $..          ....**$.. $       $          $...          ....*$**..$..         ....***$
       $..               ...$..      $..          ....**$..   $    .$           $...           ....*$**.$..         ....***$
       $..               ...$..    $...          .....**$..    $  ..$.          $...            ....*$*$*..         ...****$
       $..              ....$.    $..           .....**$..      $..$..           $...            ....*$$*..         ...****$
       $..              ....$.   $..           .....**$..       $..$..           $...            ....**$**..        ...****$
       $..              ...$.  $...           ......**$..       $**$..            $...            ....*$***..       ...****$
       $..             ....$. $..            ......**$..       ..$$...            $...             ...**$**.       ....***$
       $..             ....$$...           .......***$..       ..$$*..            $...             ....**$*.       ....***$
       $..             ...$...            .......***$..        ..$$*..            $...             .....***..      ....***$
       $...           ...$...            .......***$..         ..$$*...            $...             .....$*..      ....***$
       $...          ...$...            .......***$..         ...$.$*..            $...             ....**$*..     ....***$
       $...          ..$...            ........***$..        ...$*.$*...           $...             .....**$*..     ...***$
        $..         ...$..            ........***$..       ....*$ ..$*....         $...              .....**$*..    ..****$
        $..         ..$..            ........***$...     ....**$   ..$**....        $...             ......**$..    ..****$
        $..         ..$.           ..........***$...   ....**$$.    ..$***.....     $...            ........**$..   ..***$
        $...        .$.           ..........***$*........**$$..      ..$****........$....           .........**$.   ..***$
        $...        $.           ...........***$***..****$$...       ...$$*****......$...           .........**$.  ..***$
        $...        $           ...........***$********$$...           ...$$*********$....           ..........*$   ..***$
         $..                   ............***$*****$$$...               ...$$$$******$...            .........**$  ..**$
         $...                 ............***$$$$$$.....        .          .....$$$$$$$....           ..........*$  ..**$
         $...                 ...........***$*........          .              ........$...           ..........**$..**$
          $...               ...........****$*.......          ..                  ....$....           ..........*$..**$
          $...              ...........****$*......           ..                   .....$...            .........*$..**$
           $...             ..........****$*......            ..                  .......$....             ..........**$
           $...            ..........****$*......            ...                  ........$....            .........**$
            $...          ..........****$*......             ..                  ..........$....           ........**$
             $...         ........****$**......             ...                  ...........$....          .......**$
              $...       ........****$**.....              ....                 ............*$....         .......**$
              $....     ........****$**.....              ....                  .............*$....        ......**$
               $....    ......****$***.....              .....                   .............*$....      ......**$
                $....  .....****$****.....              .....                     ............**$....    ......***$
                 $........*****$****....                .....                      ...........***$..... ......**$$
                  $$**********$$***....                ......                      ...........*****$.........**$
                    $$*******$ $***....               .......                       .........*******$$......$$$
                      $$$$$$   $**....               .......                        .........*********$$$$$$
                               $*....               ........                         ........***********$
                               $*...               .........                         .........**********$
                               $*..                ........                           .........********$
                              $*...                ........                           .........*******$
                              $*...                ........                            ........******$
                              $...                  .......                            ........*****$
                             $....                  ....*.                              .......****$

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles
														go to jwofl.es

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


spawnEvent() {
	// cuz fuck the rules
	while( true ) {
		level waittill( "player_spawn", player );
		player setclientdvar("dynent_active", "1");
		// player setmovespeed(190);
		player show();
	}
}

addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

watchforacti() {
	level waittill( "activator", guy );
	wait 3;
	guy setmovespeed(300);
	guy thread noSpeedForYou();
	while( true ) {
		level waittill("fam_endroom");
		// guy setmovespeed(190);
	}
}

noSpeedForYou() {
	self waittill("death");
	// self setmovespeed(190);
}

trap_7()
{
	trig = getEnt( "trigger7", "targetname" );
	trig SetHintString("Press ^1&&1^7 to put meg inside of the them!");
	spikes = getEntArray( "trap7_spikes", "targetname" );
	button = getEnt("trap7_button", "targetname");
	hurt = getEnt("anything","targetname");
	for( i = 0; i < spikes.size; i++ )
		spikes[i] hide();
	hurt enableLinkTo();
	hurt LinkTo(spikes[0]);
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "megbrian");
	for( i = 0; i < spikes.size; i++ )
		spikes[i] show();
	for( i = 0; i < spikes.size; i++ )
		spikes[i] moveZ( 32, 0.2 );
	wait 6.5;
	for( i = 0; i < spikes.size; i++ )
		spikes[i] moveZ( -32, 0.75 );
	wait 0.75;
	for( i = 0; i < spikes.size; i++ )
			spikes[i] hide();
}

trap_4()
{
	thread linkHurtToModel( "4hurt", "trap4left" );
	thread linkHurtToModel( "4hurt2", "tra4right" );
	trig = getEnt( "trigger4", "targetname" );
	trig SetHintString("Press ^1&&1^7 to squish the runners!");
	trap4right = getEntArray( "trap4right", "targetname" );
	trap4left = getEntArray( "trap4left", "targetname" );
	button = getEnt("trap4_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "close");
	for( i = 0; i < trap4left.size; i++ )
		trap4left[i] moveY( -124, 0.9 );
	for( i = 0; i < trap4right.size; i++ )
		trap4right[i] moveY( 124, 0.9 );
	wait 6;
	who playsound( "open");
	for( i = 0; i < trap4left.size; i++ )
		trap4left[i] moveY( 124, 0.9 );
	for( i = 0; i < trap4right.size; i++ )
		trap4right[i] moveY( -124, 0.9 );

}

trap_6()
{
	trig = getEnt( "trigger6", "targetname" );
	trig SetHintString("Press ^1&&1^7 to crush everybody!");
	box1 = getEntArray( "trap6_box1", "targetname" );
	box2 = getEntArray( "trap6_box2", "targetname" );
	box3 = getEntArray( "trap6_box3", "targetname" );
	box4 = getEntArray( "trap6_box4", "targetname" );
	button = getEnt("trap6_button", "targetname");
	hurt = getEnt("hurtbox1","targetname");
	hurt enableLinkTo();
	hurt LinkTo(box1[0]);
	hurt2 = getEnt("hurtbox2","targetname");
	hurt2 enableLinkTo();
	hurt2 LinkTo(box2[0]);
	hurt3 = getEnt("hurtbox3","targetname");
	hurt3 enableLinkTo();
	hurt3 LinkTo(box3[0]);
	hurt4 = getEnt("hurtbox4","targetname");
	hurt4 enableLinkTo();
	hurt4 LinkTo(box4[0]);
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	for( i = 0; i < box1.size; i++ )
	{
		box1[i] moveY( 490, 1);
		box1[i] rotateRoll( 180, 1);
	}
	for( i = 0; i < box2.size; i++ )
	{
		box2[i] moveY( 490, 1);
		box2[i] rotateRoll( 180, 1);
	}
	for( i = 0; i < box3.size; i++ )
	{
		box3[i] moveY( -490, 1);
		box3[i] rotateRoll( 180, 1);
	}
	for( i = 0; i < box4.size; i++ )
	{
		box4[i] moveY( -490, 1);
		box4[i] rotateRoll( 180, 1);
	}
	wait 2.5;
	who playsound("end");
	for( i = 0; i < box1.size; i++ )
		box1[i] delete();
	for( i = 0; i < box2.size; i++ )
		box2[i] delete();
	for( i = 0; i < box3.size; i++ )
		box3[i] delete();
	for( i = 0; i < box4.size; i++ )
		box4[i] delete();
	hurt delete();
	hurt2 delete();
	hurt3 delete();
	hurt4 delete();
}

trap_18()
{
	trig = getEnt( "trigger18", "targetname" );
	trig SetHintString("Press ^1&&1^7 to make them flat!");
	thing = getEntArray( "trap18", "targetname" );
	button = getEnt("trap18_button", "targetname");
	hurt = getEnt("hurt18","targetname");
	hurt enableLinkTo();
	hurt LinkTo(thing[0]);
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	for( i = 0; i < thing.size; i++ )
		thing[i] moveZ( -150, 1 );
	wait 6.5;
	for( i = 0; i < thing.size; i++ )
		thing[i] moveZ( 150, 1 );
}

trap_10()
{
	trig = getEnt( "trigger10", "targetname" );
	trig SetHintString("Press ^1&&1^7 to send them down to their death!");
	thing = getEntArray( "watertrap", "targetname" );
	button = getEnt("trap10_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	for( i = 0; i < thing.size; i++ )
		thing[i] moveZ( -464, 6 );
	wait 9;
	for( i = 0; i < thing.size; i++ )
		thing[i] moveZ( 464, 6 );
}

movingp()
{
	brush1 = getEnt( "movingp1", "targetname" );
	brush2 = getEnt( "movingp2", "targetname" );

	p1 = getEnt( "part1", "targetname" );
	p3 = getEnt( "part3", "targetname" );
	p2 = getEnt( "part2", "targetname" );
	p4 = getEnt( "part4", "targetname" );

	for(;;) {
		brush1 moveTo( p2.origin, 4.5 );
		brush2 moveTo( p4.origin, 4.5 );
		wait 4.5;
		brush1 moveTo( p3.origin, 1.85 );
		brush2 moveTo( p1.origin, 1.85 );
		wait 1.85;
		brush1 moveTo( p4.origin, 4.5 );
		brush2 moveTo( p2.origin, 4.5 );
		wait 4.5;
		brush1 moveTo( p1.origin, 1.85 );
		brush2 moveTo( p3.origin, 1.85 );
		wait 1.85;
	}
}

trap_6pt1()
{
	go = getEnt( "bar1go", "targetname" );
	bar1 = getEnt( "bar1", "targetname" );
	trig = getEnt( "trigger6pt1", "targetname" );
	trig SetHintString("Press ^1&&1^7 to push them into the water!");
	button = getEnt("trap6pt1_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	bar1 moveTo( go.origin, 3.5 );
}

trap_6pt2()
{
	go = getEnt( "bar2go", "targetname" );
	trig = getEnt( "trigger6pt2", "targetname" );
	trig SetHintString("Press ^1&&1^7 to push them into the water AGAIN!");
	bar2 = getEnt( "bar2", "targetname" );
	button = getEnt("trap6pt2_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	bar2 moveTo( go.origin, 3.5 );
}

blue_stuff() {
	banktele = getEnt( "banktele", "targetname" );
	trig = getEnt( "thetele", "targetname" );
	for(;;) {
		trig waittill( "trigger", who );
		who playsound( "brianaww" );
		who SetOrigin( banktele.origin );
		who SetPlayerAngles( (banktele.angles) );
	}
}

blue_stuff2() {
	trig2 = getEnt( "bankdmg", "targetname" );

	for(;;) {
		trig2 waittill( "trigger", who );
		wait 1.5;
		who thread blue_stuff_kill( trig2 );
	}
}

blue_stuff_kill( killTrigger ) {
	self endon( "disconnect" );
	self endon( "death" );

	while( self isTouching( killTrigger ) ) {
		radiusDamage( self.origin, 1, 5, 5 );
		wait 2;
	}
}

trap_8()
{
	trig = getEnt( "trigger8", "targetname" );
	platform = getEnt( "trap8", "targetname" );
	dead= getEnt( "trap81", "targetname" );
	platform solid();
	platform moveX( -512, 0.5);
	wait 0.5;
	platform moveZ( 512, 0.5);
	wait 0.5;
	trig SetHintString("Press ^1&&1^7 to poison them!");
	button = getEnt("trap8_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "poison" );
	dead delete();
	wait 5;
	platform moveX( 512, 0.01 );
}

poison_dmg() {
	trig2 = getEnt( "poison", "targetname" );
	for(;;) {
		trig2 waittill( "trigger", who );
		wait 1.5;
		who thread poison_kill();
	}
}

poison_kill() {
	self endon( "disconnect" );
	self endon( "death" );

	for(;;) {
		radiusDamage( self.origin, 1, 10, 10 );
		wait 2;
	}
}


trap3()
{
	trap = getEnt("trap3", "targetname");
	trig = getEnt("trigger3", "targetname");
	button = getEnt("trap3_button", "targetname");
	trig SetHintString("Press ^1&&1^7 to let the evil monkey eat them!");
	trig waittill ("trigger", player);
	player playsound( "monkey" );
	button moveZ( -4, 0.5 );
	trig delete();
	player thread trap3others();
	player playsound( "wood2" );
	trap thread dealDamage();
	wait 6;
	trap notify("fuckingstopyoulittlebitch");
}

dealDamage() {
	self endon("fuckingstopyoulittlebitch");
	while( true ) {
		self waittill ("trigger", player);
		if( player isTouching( self ) ) {
			player.health += 160;
			player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToRight((-300,0,0)), "none", 0);
			wait 0.05;
		}
	}
}

trap3others()
{
	trap = getEnt("trap3", "targetname");
	fan1 = getEnt("fan1", "targetname");
	fan2 = getEnt("fan2", "targetname");
	fan3 = getEnt("fan3", "targetname");
	fan4 = getEnt("fan4", "targetname");
	fence = getEnt("fence", "targetname");
	level thread monkeyteeth();
 	fence hide();
	fence notSolid();
	fan1 rotatePitch( 3240, 6 );
	fan2 rotatePitch( 3240, 6 );
	fan3 rotatePitch( 3240, 6 );
	fan4 rotatePitch( 3240, 6 );
	wait 6;
	fence solid();
	fence show();
	trap delete();
}

monkeyteeth()
{
	bottomteeth = getEnt("bottomteeth", "targetname");
	topteeth = getEnt("topteeth", "targetname");
	for(i=0;i<15;i++) {
		bottomteeth moveZ( 7, 0.2 );
		topteeth moveZ( 5, 0.2 );
		wait 0.2;
		bottomteeth moveZ( -7, 0.2 );
		topteeth moveZ( -5, 0.2 );
		wait 0.2;
	}
}

trap_11()
{
	trig = getEnt( "trigger11", "targetname" );
	trig SetHintString("Press ^1&&1^7 to smash them to bits (for a hat..)!");
	right = getEntArray( "rightlog", "targetname" );
	left = getEntArray( "leftlog", "targetname" );
	button = getEnt("trap11_button", "targetname");
	hurt1 = getEnt("lefthurt","targetname");
	hurt1 enableLinkTo();
	hurt1 LinkTo(left[0]);
	hurt2 = getEnt("righthurt","targetname");
	hurt2 enableLinkTo();
	hurt2 LinkTo(right[0]);
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "logs" );
	wait 1.25;
	for( i = 0; i < right.size; i++ )
		right[i] rotatePitch( -90, 0.4 );
	for( i = 0; i < left.size; i++ )
		left[i] rotatePitch( 90, 0.4 );
	wait 6.5;
	for( i = 0; i < right.size; i++ )
		right[i] rotatePitch( 90, 2.5 );
	for( i = 0; i < left.size; i++ )
		left[i] rotatePitch( -90, 2.5 );
}

hat()
{
	trig = getEnt( "hat", "targetname" );
	trig waittill( "trigger", who);
	who PlayLocalSound( "hat" );
	trig delete();
}

actitele1()
{
	for(;;) {
		t2 = getEnt( "tele2", "targetname" );
		t2l = getEnt( "tele2loc", "targetname" );
		t1l = getEnt( "tele1loc", "targetname" );
		t2 waittill( "trigger", who );
		who SetOrigin( t2l.origin );
		who SetPlayerAngles( (t1l.angles) );
	}
}

actitele2()
{
	for(;;) {
		t1 = getEnt( "tele1", "targetname" );
		t1l = getEnt( "tele1loc", "targetname" );
		t2l = getEnt( "tele2loc", "targetname" );
		t1 waittill( "trigger", who );
		who SetOrigin( t1l.origin );
		who SetPlayerAngles( (t2l.angles) );
	}
}

trap121()
{
	trig = getEnt( "trigger121", "targetname" );
	trigother = getEnt( "trigger122", "targetname" );
	trig SetHintString("Press ^1&&1^7 to destroy the right plank!");
	button = getEnt("trap121_button", "targetname");
	plank = getEnt("plank2", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	trigother delete();
	wait 0.1;
	who playsound( "wood1" );
	plank delete();
}

trap122()
{
	trig = getEnt( "trigger122", "targetname" );
	trigother = getEnt( "trigger121", "targetname" );
	trig SetHintString("Press ^1&&1^7 to destroy the left plank!");
	button = getEnt("trap122_button", "targetname");
	plank = getEnt("plank1", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	trigother delete();
	wait 0.1;
	who playsound( "wood2" );
	plank delete();
}

trap123()
{
	trig = getEnt( "trigger123", "targetname" );
	trigother = getEnt( "trigger124", "targetname" );
	trig SetHintString("Press ^1&&1^7 to destroy the right plank!");
	button = getEnt("trap123_button", "targetname");
	plank = getEnt("plank4", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	trigother delete();
	wait 0.1;
	who playsound( "wood2" );
	plank delete();
}

trap124()
{
	trig = getEnt( "trigger124", "targetname" );
	trigother = getEnt( "trigger123", "targetname" );
	trig SetHintString("Press ^1&&1^7 to destroy the left plank!");
	button = getEnt("trap124_button", "targetname");
	plank = getEnt("plank3", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	trigother delete();
	wait 0.1;
	who playsound( "wood1" );
	plank delete();
}

trap13()
{
	thread linkHurtToModel( "balls1hurt", "balls1" );
	trig = getEnt( "trigger13", "targetname" );
	trig2 = getEnt( "trigger133", "targetname" );
	balls1hurt = getEnt( "balls1hurt", "targetname" );
	trig SetHintString("Press ^1&&1^7 to drop the grey boulders on them!");
	balls = getEntArray( "balls1", "targetname" );
	ballsother = getEntArray( "balls2", "targetname" );
	button = getEnt("trap13_button", "targetname");
	for( i = 0; i < balls.size; i++ )
		balls[i] hide();
	trig waittill( "trigger", who );
	trig2 delete();
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "laughing");
	for( i = 0; i < balls.size; i++ )
		balls[i] show();
	for( i = 0; i < balls.size; i++ )
		balls[i] moveZ( -232, 0.45 );
	wait 4;
	for( i = 0; i < balls.size; i++ )
		balls[i] moveZ( -1000, 0.1 );
	wait 0.1;
	for( i = 0; i < balls.size; i++ )
		balls[i] delete();
	who playsound("end");
}

trap133()
{
	thread linkHurtToModel( "balls2hurt", "balls2" );
	trig = getEnt( "trigger133", "targetname" );
	trig2 = getEnt( "trigger13", "targetname" );
	balls2hurt = getEnt( "balls2hurt", "targetname" );
	trig SetHintString("Press ^1&&1^7 to drop the brown boulders on them!");
	balls = getEntArray( "balls2", "targetname" );
	button = getEnt("trap133_button", "targetname");
	for( i = 0; i < balls.size; i++ )
		balls[i] hide();
	trig waittill( "trigger", who );
	trig2 delete();
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "laughing");
	for( i = 0; i < balls.size; i++ )
		balls[i] show();
	for( i = 0; i < balls.size; i++ )
		balls[i] moveZ( -232, 0.45 );
	wait 4;
	for( i = 0; i < balls.size; i++ )
		balls[i] moveZ( -1000, 0.1 );
	wait 0.1;
	for( i = 0; i < balls.size; i++ )
		balls[i] delete();
	who playsound("end");
}


trap16()
{
	thread linkHurtToModel( "wheels1hurt", "wheels1" );
	thread linkHurtToModel( "wheels2hurt", "wheels2" );
	trig = getEnt( "trigger16", "targetname" );
	trig SetHintString("Press ^1&&1^7 to let the stone wheels out!");
	pos1 = getEnt( "1pos1", "targetname" );
	pos2 = getEnt( "1pos2", "targetname" );
	wheels1 = getEntArray( "wheels1", "targetname" );
	button = getEnt("trap16_button", "targetname");
	wheels2 = getEntArray( "wheels2", "targetname" );
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] hide();
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] hide();
	trig waittill( "trigger", who );
	who playsound( "wheel");
	button moveZ( -4, 0.5 );
	trig delete();
	who thread trap162();
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] show();
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] moveTo( pos1.origin, 0.5 );
	wait 0.5;
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] moveTo( pos2.origin, 5 );
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] rotatePitch( 980, 5  );
	wait 5;
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] moveX( 50, 0.1  );
	wait 0.1;
	for( i = 0; i < wheels1.size; i++ )
		wheels1[i] delete();
}

linkHurtToModel( hurt, model )
{
	triggerHurt = getEntArray( hurt, "targetname" );
	model = getEntArray( model, "targetname" );
	// link the wheels
	for( a = 0; a < model.size; a ++ )
	{
		triggerHurt[a] enableLinkTo();
		triggerHurt[a] linkto(model[a]);
	}
}

getAllPlayers()
{
	return getEntArray( "player", "classname" );
}

trap162()
{
	spos1 = getEnt( "2pos1", "targetname" );
	spos2 = getEnt( "2pos2", "targetname" );
	wheels2 = getEntArray( "wheels2", "targetname" );
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] show();
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] moveTo( spos1.origin, 0.5 );
	wait 0.5;
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] moveTo( spos2.origin, 4.5 );
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] rotatePitch( 764, 4.5  );
	wait 4.5;
	for( i = 0; i < wheels2.size; i++ )
		wheels2[i] delete();
}

trap_14_1()
{
	trig = getEnt( "trigger14_1", "targetname" );
	trigother = getEnt( "trigger14_2", "targetname");
	trig SetHintString("Press ^1&&1^7 to make the blue door dangerous!");
	trig waittill( "trigger", who );
	nigtrig = getEnt( "14_1", "targetname" );
	bhoptele1 = getEnt( "bhoptele1", "targetname" );
	trig delete();
	trigother delete();
	for(;;)
	{
		nigtrig waittill ("trigger", who);
			who SetOrigin( bhoptele1.origin );
			who SetPlayerAngles( (bhoptele1.angles) );
	}
}

trap_14_2()
{
	trig = getEnt( "trigger14_2", "targetname" );
	trigother = getEnt( "trigger14_1", "targetname");
	trig SetHintString("Press ^1&&1^7 to make the red door dangerous!");
	trig waittill( "trigger", who );
	nigtrig = getEnt( "14_2", "targetname" );
	bhoptele1 = getEnt( "bhoptele1", "targetname" );
	trig delete();
	trigother delete();
	for(;;)
	{
		nigtrig waittill ("trigger", who);
			who SetOrigin( bhoptele1.origin );
			who SetPlayerAngles( (bhoptele1.angles) );
	}
}

trap_14_3()
{
	trig = getEnt( "trigger14_3", "targetname" );
	trigother = getEnt( "trigger14_4", "targetname");
	trig SetHintString("Press ^1&&1^7 to make the blue door dangerous!");
	trig waittill( "trigger", who );
	nigtrig = getEnt( "14_3", "targetname" );
	bhoptele1 = getEnt( "bhoptele1", "targetname" );
	trig delete();
	trigother delete();
	for(;;)
	{
		nigtrig waittill ("trigger", who);
			who SetOrigin( bhoptele1.origin );
			who SetPlayerAngles( (bhoptele1.angles) );
	}
}

trap_14_4()
{
	trig = getEnt( "trigger14_4", "targetname" );
	trigother = getEnt( "trigger14_3", "targetname");
	trig SetHintString("Press ^1&&1^7 to make the red door dangerous!");
	trig waittill( "trigger", who );
	nigtrig = getEnt( "14_4", "targetname" );
	bhoptele1 = getEnt( "bhoptele1", "targetname" );
	trig delete();
	trigother delete();
	for(;;)
	{
		nigtrig waittill ("trigger", who);
			who SetOrigin( bhoptele1.origin );
			who SetPlayerAngles( (bhoptele1.angles) );
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
                                                      $$$$$$$$$
                                                  $$$$$$$$$$$$$$$$$         $$$$$$
                                                $$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$$
                                              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                             $$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$
                                            $$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$.$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$..$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$$$....$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$        $$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$              $$$$$$$$$$$$$$$$$$$....$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$                 $$$$$$$$    .........$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$$                                  .....$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$ /< $$$*..                           .....$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$% 1    $$$$*                   .**$$$$....$$$$$$$$$$$$$$$$$$$$                Hey
                                    $$$$$$$-$$1 1          -           *$$$$$$$$........$$$$$$$$$$$$$$$$$$$$                 babe (im looking at you blade/mook/mikey)
                                    $$$$$$/ 1$1-1-------  / <                 .   .....$$$$$$$$$$$$$$$$$$$$$
                                    $$$$$$1 11  1-  $$  -1  1          .*------*.......$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1/ 1  1 -------1  1         $   $$     $.....$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1  1  1        1--1   /1      --------......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$1  1  .1       1 .1  1 1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      /  .1  1-1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      1 ..1 1  1             ......$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1 1  ..1    1  ..1 1  1           ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  .1    1  ..11  1     1     ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  ..1   1  ..1  .1/---.<     .......$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ..1  1   ..1 ..1          ........$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ...1 1  ..1  .1           .......$.$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1   ..11   ..1  .1           ......$..$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1 1    ..1   ..1  .1$$$$$$$   ......$...$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1            ..1  .1$$$$$    ......$...$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1            .1   .1.      .....$$...$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1                 .1..    $$...$....$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$$1                 .1..  $$$$.$...$$$$$$$$------..$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$$.               .1...$$$$$$$$$$$$$$$$$/      ----$$$$$$$$$$$$$$       $$$$$
                                 $$$$$$$$$$$$$$ $..             .1$$$$$$$$$$$$$$$$$$/.          -..$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$  $..           ..$..$$$$$$$$$$$$$$$/.            --------$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$$$$    $..          ..$..$$$$$$$$$$$$$$/.                      -$$$$$$$$$$$$$$
                                    $$$$$$$$$     $...         ..$..$$$$$$$$$$$$$/.               ....$$$$$$$$$$$$$$$$$$
                  .*$$$$$$$$$$$$$$$$$$$$$$         $...        ..$...$$$$$$$$$$/..              ...$$$.....     $$$$$$$
               .*$$                                $...       ...$....$$$$$$$$/..            .....$$$$$$$$$$$$$$--  ..$$
             *$$                                   $...       ...$....  $$$$$/..            ....              1   <  ..*$
            $                                      $..        ...$...     $$1..                  ........**$$$$$$$   ...*$
           $                                       $.        ...$....       $..           $   .....$$$$$$            ....*$
          $                                       $..        ...$...        $..           .$ .*..$$...               ....*$
          $                                       $.         ..*$...        $..          ...$.*.$*....              .....**$
         $                                       $.         ..*$...         $..           ...$ $*.....              .....**$
         $.                                     $..        ...*$...         $...           ...$**......             .....**$
        .$.             ..$                     $.        ...*$...           $..           ...$**......             .....**
        $..             ..$.                   $..       ....*$..            $..           ...$**........           .....**$
        $..             ...$..                $..        ...*$..             $...           ...$**.......           .....**$
        $..             ...$.. $             $..        ....*$..              $..           ...$**....$..   $       ....***$
        $..            ....$..$.            $..        ....*$..               $..           ....$**....$$. $         ...***$
       .$..             ....$$..           $..        ....*$..                $...          ....$**......$$.         ...***$
       *...             ....$..           $..        .....*$..                 $..           ....$**.....$..         ...***$
       $...             ....$..          $..        .....*$$.            $     $..           ....$**.....$..        ....***$
       $...              ...$..         $..         ....*$..$          $       $...           ...*$**...$..         ....***$
       $..               ...$..       $..          ....**$.. $       $          $...          ....*$**..$..         ....***$
       $..               ...$..      $..          ....**$..   $    .$           $...           ....*$**.$..         ....***$
       $..               ...$..    $...          .....**$..    $  ..$.          $...            ....*$*$*..         ...****$
       $..              ....$.    $..           .....**$..      $..$..           $...            ....*$$*..         ...****$
       $..              ....$.   $..           .....**$..       $..$..           $...            ....**$**..        ...****$
       $..              ...$.  $...           ......**$..       $**$..            $...            ....*$***..       ...****$
       $..             ....$. $..            ......**$..       ..$$...            $...             ...**$**.       ....***$
       $..             ....$$...           .......***$..       ..$$*..            $...             ....**$*.       ....***$
       $..             ...$...            .......***$..        ..$$*..            $...             .....***..      ....***$
       $...           ...$...            .......***$..         ..$$*...            $...             .....$*..      ....***$
       $...          ...$...            .......***$..         ...$.$*..            $...             ....**$*..     ....***$
       $...          ..$...            ........***$..        ...$*.$*...           $...             .....**$*..     ...***$
        $..         ...$..            ........***$..       ....*$ ..$*....         $...              .....**$*..    ..****$
        $..         ..$..            ........***$...     ....**$   ..$**....        $...             ......**$..    ..****$
        $..         ..$.           ..........***$...   ....**$$.    ..$***.....     $...            ........**$..   ..***$
        $...        .$.           ..........***$*........**$$..      ..$****........$....           .........**$.   ..***$
        $...        $.           ...........***$***..****$$...       ...$$*****......$...           .........**$.  ..***$
        $...        $           ...........***$********$$...           ...$$*********$....           ..........*$   ..***$
         $..                   ............***$*****$$$...               ...$$$$******$...            .........**$  ..**$
         $...                 ............***$$$$$$.....        .          .....$$$$$$$....           ..........*$  ..**$
         $...                 ...........***$*........          .              ........$...           ..........**$..**$
          $...               ...........****$*.......          ..                  ....$....           ..........*$..**$
          $...              ...........****$*......           ..                   .....$...            .........*$..**$
           $...             ..........****$*......            ..                  .......$....             ..........**$
           $...            ..........****$*......            ...                  ........$....            .........**$
            $...          ..........****$*......             ..                  ..........$....           ........**$
             $...         ........****$**......             ...                  ...........$....          .......**$
              $...       ........****$**.....              ....                 ............*$....         .......**$
              $....     ........****$**.....              ....                  .............*$....        ......**$
               $....    ......****$***.....              .....                   .............*$....      ......**$
                $....  .....****$****.....              .....                     ............**$....    ......***$
                 $........*****$****....                .....                      ...........***$..... ......**$$
                  $$**********$$***....                ......                      ...........*****$.........**$
                    $$*******$ $***....               .......                       .........*******$$......$$$
                      $$$$$$   $**....               .......                        .........*********$$$$$$
                               $*....               ........                         ........***********$
                               $*...               .........                         .........**********$
                               $*..                ........                           .........********$
                              $*...                ........                           .........*******$
                              $*...                ........                            ........******$
                              $...                  .......                            ........*****$
                             $....                  ....*.                              .......****$

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


desttrigger()
{
	dest = getEnt( "bhoptele", "targetname" );
	lasttp = getEnt( "bhoptele2", "targetname" );
	for(;;)
	{
		dest waittill ("trigger", who);
			who SetOrigin( lasttp.origin );
			who SetPlayerAngles( (lasttp.angles) );
	}
}

blue1()
{
	trig = getEnt( "blue1use1", "targetname" );
	door = getEntArray( "blue1", "targetname" );
	for(;;){
		trig waittill( "trigger", who );
			who playsound( "door");
			for( i = 0; i < door.size; i++ )
				door[i] rotateYaw( -90, 0.5);
			wait 1;
			trig waittill( "trigger", who );
				who playsound( "door");
				for( i = 0; i < door.size; i++ )
					door[i] rotateYaw( 90, 0.5);
				wait 1;
	}
}

blue2()
{
	trig = getEnt( "blue2use1", "targetname" );
	door = getEntArray( "blue2", "targetname" );
	for(;;){
		trig waittill( "trigger", who );
			who playsound( "door");
			for( i = 0; i < door.size; i++ )
				door[i] rotateYaw( -90, 0.5);
			wait 1;
			trig waittill( "trigger", who );
				who playsound( "door");
				for( i = 0; i < door.size; i++ )
					door[i] rotateYaw( 90, 0.5);
				wait 1;
	}
}

red1()
{
	trig = getEnt( "red1use1", "targetname" );
	door = getEntArray( "red1", "targetname" );
	for(;;){
		trig waittill( "trigger", who );
			who playsound( "door");
			for( i = 0; i < door.size; i++ )
				door[i] rotateYaw( -90, 0.5);
			wait 1;
			trig waittill( "trigger", who );
				who playsound( "door");
				for( i = 0; i < door.size; i++ )
					door[i] rotateYaw( 90, 0.5);
				wait 1;
	}
}

red2()
{
	trig = getEnt( "red2use1", "targetname" );
	door = getEntArray( "red2", "targetname" );
	for(;;){
		trig waittill( "trigger", who );
			who playsound( "door");
			for( i = 0; i < door.size; i++ )
				door[i] rotateYaw( -90, 0.5);
			wait 1;
			trig waittill( "trigger", who );
				who playsound( "door");
				for( i = 0; i < door.size; i++ )
					door[i] rotateYaw( 90, 0.5);
				wait 1;
	}
}

bhoppush()
{
	trap = getEnt("bhoppush", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToRight((200,0,200)), "none", 0);
        	wait 0.2;
		}
		wait 0.05;
    }
}

trap_2()
{
	trig = getEnt( "trigger2", "targetname" );
	mover = getEnt( "mover2", "targetname" );
	hurt = getEnt( "move2", "targetname" );
	hurt enableLinkTo();
	hurt LinkTo(mover);
	mover moveZ( -500, 0.1 );
	trig SetHintString("Press ^1&&1^7 to gas them with a fart!");
	kill = getEnt( "fartdeath", "targetname" );
	fart = getEnt( "fart", "targetname" );
	button = getEnt("trap2_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "fart");
	playFX(level.fart, fart.origin );
	for(i=0;i<45;i++) {
		mover moveZ( 500, 0.08 );
		wait 0.08;
		mover moveZ( -500, 0.08 );
		wait 0.08;
	}
	mover delete();
	hurt delete();
}


/*
blue_stuff_kill2( kill ) {
	self endon( "disconnect" );
	self endon( "death" );

	while( self isTouching( kill ) ) {
		radiusDamage( self.origin, 1, 20, 20 );
		wait 2;
	}
}
*/

trap_1()
{
	trig = getEnt( "trigger1", "targetname" );
	mover = getEnt( "mover1", "targetname" );
	hurt = getEnt( "move1", "targetname" );
	hurt enableLinkTo();
	hurt LinkTo(mover);
	mover moveZ( -500, 0.1 );
	laser = getEnt( "laser", "targetname" );
	kill = getEnt("1death", "targetname");
	laser hide();
	laser notSolid();
	trap1_fx1 = getEnt( "trap1_fx2", "targetname" );
	trap1_fx2 = getEnt( "trap1_fx3", "targetname" );
	trap1_fx3 = getEnt( "trap1_fx1", "targetname" );
	trig SetHintString("Press ^1&&1^7 to blow them up!");
	button = getEnt("trap1_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "giggle");
	laser show();
	wait 0.3;
	laser hide();
	who playsound("triple");
	playFX(level.explos, trap1_fx1.origin );
	playFX(level.explos, trap1_fx3.origin );
	playFX(level.explos, trap1_fx2.origin );
	mover moveZ( 500, 0.1 );
	wait 0.3;
	mover delete();
	hurt delete();
/*
	who thread delete();
	while( self isTouching( kill ) ) {
		who suicide();
		wait 0.25;
		kill delete();
	}
*/
}

/*
delete()
{
	kill = getEnt("1death", "targetname");
	wait 0.25;
	kill delete();
}
*/

trap_9()
{
	trig = getEnt( "trigger9", "targetname" );
	gun1 = getEnt( "gun1", "targetname" );
	gun2 = getEnt( "gun2", "targetname" );
	gun3 = getEnt( "gun3", "targetname" );
	gun4 = getEnt( "gun4", "targetname" );
	gun5 = getEnt( "gun5", "targetname" );
	mover = getEnt( "move", "targetname" );
	hurt = getEnt( "gunkill", "targetname" );
	hurt enableLinkTo();
	hurt LinkTo(mover);
	mover moveZ( -500, 0.1 );
	trig SetHintString("Press ^1&&1^7 to gun the runners!");
	button = getEnt("trap9_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "gunns");
	mover moveZ( 500, 0.1 );
	playFX(level.guns, gun1.origin );
	playFX(level.guns, gun2.origin );
	playFX(level.guns, gun3.origin );
	playFX(level.guns, gun4.origin );
	playFX(level.guns, gun5.origin );
	wait 5;
	mover delete();
	hurt delete();
}

trap_15()
{
	trig = getEnt( "trigger15", "targetname" );
	bomb = getEnt( "ugotme", "targetname" );
	//thing = spawn( "tag_origin", bomb getOrigin() );
	mover = getEnt( "mover3", "targetname" );
	hurter = getEnt( "move3", "targetname" );
	hurter enableLinkTo();
	hurter LinkTo(mover);
	mover moveZ( -500, 0.1 );
	temp = spawn("script_model", bomb getOrigin());
	temp setModel("tag_origin");
	thread playloopedfxontag(level.red, temp, "tag_origin", 3, "fuckyoubomb");
	//playLoopedFx(level.red, 1, (2828, -4968, 28));
	trig SetHintString("Press ^1&&1^7 to make them explode!");
	kill = getEnt( "bombhurt", "targetname" );
	button = getEnt("trap15_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	bomb playsound( "yougotme");
	bomb playsound("single");
	playFX(level.explos, bomb.origin );
	bomb StopLoopSound();
	bomb delete();
	mover moveZ( 500, 0.1 );
	temp delete();
	level notify("fuckyoubomb");
	wait 0.2;
	mover delete();
	hurter delete();
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
                                                      $$$$$$$$$
                                                  $$$$$$$$$$$$$$$$$         $$$$$$
                                                $$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$$
                                              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                             $$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$
                                            $$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$.$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$..$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$$$....$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$        $$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$              $$$$$$$$$$$$$$$$$$$....$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$                 $$$$$$$$    .........$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$$                                  .....$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$ /< $$$*..                           .....$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$% 1    $$$$*                   .**$$$$....$$$$$$$$$$$$$$$$$$$$                Hey
                                    $$$$$$$-$$1 1          -           *$$$$$$$$........$$$$$$$$$$$$$$$$$$$$                 babe (im looking at you blade/mook/mikey)
                                    $$$$$$/ 1$1-1-------  / <                 .   .....$$$$$$$$$$$$$$$$$$$$$
                                    $$$$$$1 11  1-  $$  -1  1          .*------*.......$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1/ 1  1 -------1  1         $   $$     $.....$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1  1  1        1--1   /1      --------......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$1  1  .1       1 .1  1 1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      /  .1  1-1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      1 ..1 1  1             ......$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1 1  ..1    1  ..1 1  1           ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  .1    1  ..11  1     1     ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  ..1   1  ..1  .1/---.<     .......$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ..1  1   ..1 ..1          ........$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ...1 1  ..1  .1           .......$.$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1   ..11   ..1  .1           ......$..$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1 1    ..1   ..1  .1$$$$$$$   ......$...$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1            ..1  .1$$$$$    ......$...$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1            .1   .1.      .....$$...$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1                 .1..    $$...$....$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$$1                 .1..  $$$$.$...$$$$$$$$------..$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$$.               .1...$$$$$$$$$$$$$$$$$/      ----$$$$$$$$$$$$$$       $$$$$
                                 $$$$$$$$$$$$$$ $..             .1$$$$$$$$$$$$$$$$$$/.          -..$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$  $..           ..$..$$$$$$$$$$$$$$$/.            --------$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$$$$    $..          ..$..$$$$$$$$$$$$$$/.                      -$$$$$$$$$$$$$$
                                    $$$$$$$$$     $...         ..$..$$$$$$$$$$$$$/.               ....$$$$$$$$$$$$$$$$$$
                  .*$$$$$$$$$$$$$$$$$$$$$$         $...        ..$...$$$$$$$$$$/..              ...$$$.....     $$$$$$$
               .*$$                                $...       ...$....$$$$$$$$/..            .....$$$$$$$$$$$$$$--  ..$$
             *$$                                   $...       ...$....  $$$$$/..            ....              1   <  ..*$
            $                                      $..        ...$...     $$1..                  ........**$$$$$$$   ...*$
           $                                       $.        ...$....       $..           $   .....$$$$$$            ....*$
          $                                       $..        ...$...        $..           .$ .*..$$...               ....*$
          $                                       $.         ..*$...        $..          ...$.*.$*....              .....**$
         $                                       $.         ..*$...         $..           ...$ $*.....              .....**$
         $.                                     $..        ...*$...         $...           ...$**......             .....**$
        .$.             ..$                     $.        ...*$...           $..           ...$**......             .....**
        $..             ..$.                   $..       ....*$..            $..           ...$**........           .....**$
        $..             ...$..                $..        ...*$..             $...           ...$**.......           .....**$
        $..             ...$.. $             $..        ....*$..              $..           ...$**....$..   $       ....***$
        $..            ....$..$.            $..        ....*$..               $..           ....$**....$$. $         ...***$
       .$..             ....$$..           $..        ....*$..                $...          ....$**......$$.         ...***$
       *...             ....$..           $..        .....*$..                 $..           ....$**.....$..         ...***$
       $...             ....$..          $..        .....*$$.            $     $..           ....$**.....$..        ....***$
       $...              ...$..         $..         ....*$..$          $       $...           ...*$**...$..         ....***$
       $..               ...$..       $..          ....**$.. $       $          $...          ....*$**..$..         ....***$
       $..               ...$..      $..          ....**$..   $    .$           $...           ....*$**.$..         ....***$
       $..               ...$..    $...          .....**$..    $  ..$.          $...            ....*$*$*..         ...****$
       $..              ....$.    $..           .....**$..      $..$..           $...            ....*$$*..         ...****$
       $..              ....$.   $..           .....**$..       $..$..           $...            ....**$**..        ...****$
       $..              ...$.  $...           ......**$..       $**$..            $...            ....*$***..       ...****$
       $..             ....$. $..            ......**$..       ..$$...            $...             ...**$**.       ....***$
       $..             ....$$...           .......***$..       ..$$*..            $...             ....**$*.       ....***$
       $..             ...$...            .......***$..        ..$$*..            $...             .....***..      ....***$
       $...           ...$...            .......***$..         ..$$*...            $...             .....$*..      ....***$
       $...          ...$...            .......***$..         ...$.$*..            $...             ....**$*..     ....***$
       $...          ..$...            ........***$..        ...$*.$*...           $...             .....**$*..     ...***$
        $..         ...$..            ........***$..       ....*$ ..$*....         $...              .....**$*..    ..****$
        $..         ..$..            ........***$...     ....**$   ..$**....        $...             ......**$..    ..****$
        $..         ..$.           ..........***$...   ....**$$.    ..$***.....     $...            ........**$..   ..***$
        $...        .$.           ..........***$*........**$$..      ..$****........$....           .........**$.   ..***$
        $...        $.           ...........***$***..****$$...       ...$$*****......$...           .........**$.  ..***$
        $...        $           ...........***$********$$...           ...$$*********$....           ..........*$   ..***$
         $..                   ............***$*****$$$...               ...$$$$******$...            .........**$  ..**$
         $...                 ............***$$$$$$.....        .          .....$$$$$$$....           ..........*$  ..**$
         $...                 ...........***$*........          .              ........$...           ..........**$..**$
          $...               ...........****$*.......          ..                  ....$....           ..........*$..**$
          $...              ...........****$*......           ..                   .....$...            .........*$..**$
           $...             ..........****$*......            ..                  .......$....             ..........**$
           $...            ..........****$*......            ...                  ........$....            .........**$
            $...          ..........****$*......             ..                  ..........$....           ........**$
             $...         ........****$**......             ...                  ...........$....          .......**$
              $...       ........****$**.....              ....                 ............*$....         .......**$
              $....     ........****$**.....              ....                  .............*$....        ......**$
               $....    ......****$***.....              .....                   .............*$....      ......**$
                $....  .....****$****.....              .....                     ............**$....    ......***$
                 $........*****$****....                .....                      ...........***$..... ......**$$
                  $$**********$$***....                ......                      ...........*****$.........**$
                    $$*******$ $***....               .......                       .........*******$$......$$$
                      $$$$$$   $**....               .......                        .........*********$$$$$$
                               $*....               ........                         ........***********$
                               $*...               .........                         .........**********$
                               $*..                ........                           .........********$
                              $*...                ........                           .........*******$
                              $*...                ........                            ........******$
                              $...                  .......                            ........*****$
                             $....                  ....*.                              .......****$

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


playloopedfxontag( effect, entity, tag, time, end ) {
	level endon(end);
	while( true ) {
		playfxontag(effect, entity, tag);
		wait time;
	}
}

trap_17()
{
	trig = getEnt( "trigger17", "targetname" );
	trig SetHintString("Press ^1&&1^7 to burn the runners with lasers!");
	l1 = getEnt( "l1", "targetname" );
	l2 = getEnt( "l2", "targetname" );
	l3 = getEnt( "l3", "targetname" );
	l4 = getEnt( "l4", "targetname" );
	l5 = getEnt( "l5", "targetname" );
	l6 = getEnt( "l6", "targetname" );
	l1h = getEnt( "lhurt1", "targetname" );
	l2h = getEnt( "lhurt2", "targetname" );
	l3h = getEnt( "lhurt3", "targetname" );
	l4h = getEnt( "lhurt4", "targetname" );
	l5h = getEnt( "lhurt5", "targetname" );
	l6h = getEnt( "lhurt6", "targetname" );
	l1h enableLinkTo();
	l2h enableLinkTo();
	l3h enableLinkTo();
	l4h enableLinkTo();
	l5h enableLinkTo();
	l6h enableLinkTo();
	l1h LinkTo(l1);
	l2h LinkTo(l2);
	l3h LinkTo(l3);
	l4h LinkTo(l4);
	l5h LinkTo(l5);
	l6h LinkTo(l6);
	l1 hide();
	l2 hide();
	l3 hide();
	l4 hide();
	l5 hide();
	l6 hide();
	l1 moveY( 1000, 0.1);
	l2 moveY( 1000, 0.1);
	l3 moveY( 1000, 0.1);
	l4 moveY( 1000, 0.1);
	l5 moveY( 1000, 0.1);
	l6 moveY( 1000, 0.1);
	button = getEnt("trap15_button", "targetname");
	trig waittill( "trigger", who );
	button moveZ( -4, 0.5 );
	trig delete();
	who playsound( "fantastic");
	l6 moveY( -1000, 0.25);
	l6 show();
	wait 0.25;
	l5 moveY( -1000, 0.25);
	l5 show();
	wait 0.25;
	l4 moveY( -1000, 0.25);
	l4 show();
	wait 0.25;
	l3 moveY( -1000, 0.25);
	l3 show();
	wait 0.25;
	l2 moveY( -1000, 0.25);
	l2 show();
	wait 0.25;
	l1 moveY( -1000, 0.25);
	l1 show();
	wait 5;
	l1 delete();
	l2 delete();
	l3 delete();
	l4 delete();
	l5 delete();
	l6 delete();
	l1h delete();
	l2h delete();
	l3h delete();
	l4h delete();
	l5h delete();
	l6h delete();
}

lastdoors()
{
	trig = getEnt( "ldoors", "targetname" );
	left = getEntArray( "dleft", "targetname" );
	right = getEntArray( "dright", "targetname" );
	for(;;){
		trig waittill( "trigger", who );
		for( i = 0; i < left.size; i++ )
			left[i] moveY( -124, 1.25 );
		for( i = 0; i < right.size; i++ ){
			right[i] moveY( 124, 1.25 );
			right[i] waittill("movedone");
		}
		for( i = 0; i < left.size; i++ )
			left[i] moveY( 124, 1.25 );
		for( i = 0; i < right.size; i++ ){
			right[i] moveY( -124, 1.25 );
			right[i] waittill("movedone");
		}

	}
}

themesong()
{
	level waittill( "round_started" );
	//visionsetnaked("mp_deathrun_familyguy");
	AmbientPlay("theme");
	//setExpFog(1, 2, 0, 0, 0, 0);
	trig = getEnt( "sign", "targetname" );
	trig waittill( "trigger", who );
	who PlayLocalSound( "sign" );
	trig delete();
}

enddoor()
{
	door = getEntArray( "teledoor", "targetname" );
	getin = getEnt( "omggetin", "targetname" );
	telefloor = getEnt( "telefloor", "targetname" );
	trigone = getEnt( "trigone", "targetname" );
	trigtwo = getEnt("insidetrig", "targetname");
	trigone SetHintString("Press ^1&&1^7 to open the door.");
	for(;;){
		trigone waittill( "trigger", who );
		trigone.origin -= (0, 500, 0);
		who setOrigin(getin.origin);
		for( i = 0; i < door.size; i++ ){
			door[i] moveY( 96, 0.5 );
			door[i] waittill("movedone");
		}
		who FreezeControls (1);
		trigtwo waittill( "trigger", who );
		who playSound( "ahahah" );
		for( i = 0; i < door.size; i++ ){
			door[i] moveY( -96, 0.15 );
			door[i] waittill("movedone");
		}
		wait 0.5;
		who FreezeControls (0);
		wait 2.5;
		telefloor notSolid();
		wait 4;
		telefloor Solid();
	}
}

endtele()
{
	trig = getEnt( "insidetrig", "targetname" );
	for(;;){
		jwofles = randomintRange(0, 4);
		trig waittill ("trigger", player);
		player thread fuckHeadDied();
		level notify("fam_endroom");
		if( jwofles == 0 ) {
			player thread endroom1();
			wait 5;
		}
		else if( jwofles == 1 ){
			player thread endroom2();
			wait 5;
		}
		else if( jwofles == 2 ){
			player thread endroom3();
			wait 5;
		}
		else{
			player thread endroom4();
			wait 5;
		}
	}
}

bitches()
{
	for(;;){
		trig = getEnt ("bitchtele", "targetname");
		location = getEnt ("bitchlocation", "targetname");
		trig waittill ("trigger", player);
		player Setorigin(location.origin);
	}
}

fuckHeadDied()
{
	self common_scripts\utility::waittill_any("death", "disconnect");
	trigone = getEnt( "trigone", "targetname" );
	trigone.origin += (0, 500, 0);
}

endroom1()
{
	self endon("death");
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	trig = getEnt ("endtele", "targetname");
	pos = getEnt ("universe1", "targetname");
	trig waittill ("trigger", player);
	thread endroom1_acti();
	iprintlnbold ("^1" + player.name + " ^7has gone in another universe!");
	AmbientStop( 1 );
	AmbientPlay( "enduni", 1 );
	player FreezeControls (1);
	player TakeAllWeapons();
	player Setorigin(pos.origin);
	player SetPlayerAngles( pos.angles );
	player GiveWeapon("m40a3_acog_mp");
	wait 0.05;
	Player SwitchToWeapon("m40a3_acog_mp");
	wait 2;
	player FreezeControls (0);

	player thread onDeath_endroom1();
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

onDeath_endroom1()
{
	self endon("disconnect");

	self waittill("death");
	thread endroom1();
}

endroom1_acti()
{
	pos = getEnt ("universe2", "targetname");
	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis" && isAlive(players[i]))
		{
			players[i] FreezeControls (1);
			players[i] TakeAllWeapons();
			players[i] Setorigin(pos.origin);
			players[i] SetPlayerAngles( pos.angles );
			players[i] GiveWeapon("m40a3_acog_mp");
			wait 0.05;
			players[i] SwitchToWeapon("m40a3_acog_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

endroom2()
{
	self endon("death");
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	trig = getEnt ("endtele", "targetname");
	pos = getEnt ("cave1", "targetname");
	trig waittill ("trigger", player);
	thread endroom2_acti();
	iprintlnbold ("^1" + player.name + " ^7has gone into Peter's brain???");
	AmbientStop( 1 );
	AmbientPlay( "tumor", 1 );
	player FreezeControls (1);
	player TakeAllWeapons();
	player Setorigin(pos.origin);
	player SetPlayerAngles( pos.angles );;
	wait 2;
	player FreezeControls (0);

	player thread onDeath_endroom2();
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

onDeath_endroom2()
{
	self endon("disconnect");

	self waittill("death");
	thread endroom2();
}

endroom2_acti()
{
	pos = getEnt ("cave2", "targetname");
	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] setgravity(800);
			players[i] setmovespeed(190);
			players[i] TakeAllWeapons();
			players[i] Setorigin(pos.origin);
			players[i] SetPlayerAngles( pos.angles );
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

endroom3()
{
	self endon("death");
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	trig = getEnt ("endtele", "targetname");
	pos = getEnt ("end1", "targetname");
	trig waittill ("trigger", player);
	thread endroom3_acti();
	iprintlnbold ("^1" + player.name + " ^7has gone in the near future!");
	AmbientStop( 1 );
	AmbientPlay( "mygod", 1 );
	player FreezeControls (1);
	player TakeAllWeapons();
	player Setorigin(pos.origin);
	player SetPlayerAngles( pos.angles );
	player GiveWeapon("dragunov_acog_mp");
	wait 0.05;
	Player SwitchToWeapon("dragunov_acog_mp");
	wait 2;
	player FreezeControls (0);

	player thread onDeath_endroom3();
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

onDeath_endroom3()
{
	self endon("disconnect");

	self waittill("death");
	thread endroom3();
}

endroom3_acti()
{
	pos = getEnt ("end2", "targetname");
	players = getentarray("player", "classname");
	for(i=0;i<=players.size;i++)
	{
		if(players[i].pers["team"] == "axis")
		{
			players[i] FreezeControls (1);
			players[i] TakeAllWeapons();
			players[i] Setorigin(pos.origin);
			players[i] SetPlayerAngles( pos.angles );
			players[i] GiveWeapon("dragunov_acog_mp");
			players[i] setgravity(800);
			players[i] setmovespeed(190);
			wait 0.05;
			players[i] SwitchToWeapon("dragunov_acog_mp");
			wait 2;
			players[i] FreezeControls (0);
		}
	}
}

endroom4()
{
	self endon("death");
	self endon( "disconnect" );
	self endon( "joined_team" );
	self endon( "joined_spectators" );

	trig = getEnt ("endtele", "targetname");
	trig waittill ("trigger", player);

	level.megActiScore = 0;
	level.playerScore = 0;
	level thread theFinalBlow( );

	if( isDefined( player )) {
		level.megKillerPlayer = player; // so fuck stupid
		debug("Player = "+player.name );
		player		thread megMonitorPlayer( getEnt ("meg1", "targetname" ), "megside" );
		player		thread monitorCuntsSuicide();
	}

	level.famActivators = findAllActi();
	for( a = 0; a < level.famActivators.size; a ++ ) {
		if( isDefined(level.famActivators[a].playingWithMeg) ) // skip
			level notify("megisded"); // reset course. Lets get that acti killking again

		level.famActivators[a].iIsActi = true;
		level.famActivators[a] thread monitorActiDeath();
		level.famActivators[a] thread megMonitorPlayer( getEnt ("meg2", "targetname" ), "megstwo" );
	}

	iprintlnbold ("^1" + player.name + " ^7has gone to meg street!");
}

setupPlayer( pos )
{
	self FreezeControls( true );
	// self setgravity(800);
	// self setmovespeed(190);
	AmbientStop( 1 );
	AmbientPlay( "megsucks", 1 );
	self TakeAllWeapons();
	self Setorigin(pos.origin);
	self SetPlayerAngles( pos.angles );
	self GiveWeapon("m40a3_mp");
	wait 0.01;
	self SwitchToWeapon("m40a3_mp");
	wait 2;
	self FreezeControls( false );
}

megUI() {
	debug(self.name + " has UI");
	// don't double thread for acti.
	if( !isDefined(self.megUi) )
		self.megUi = createText("CENTER", "CENTER", 0, -200, 1.4, "Activators Score: "+level.megActiScore+"\n"+level.megKillerPlayer.name+"'s Score: "+level.playerScore);

	while( self.playingWithMeg ) {
		level waittill("ameghasbeenshot");
		debug(self.name);
		debug("Updated ui? Acti Score: "+level.megActiScore+" Player Score: "+level.playerScore);
		if( isDefined(self.megUi) )
			self.megUi setText("Activators Score: "+level.megActiScore+"\n"+level.megKillerPlayer.name+"'s Score: "+level.playerScore); // wops
	}
}

megMonitorPlayer( pos, prefix ) {
	// some set up
	self.playingWithMeg = true;
	self.megSide = pos.targetname;
	self thread megUI();
	self thread unlimitedAmmo();
	self thread setupPlayer( pos );
	for( a = 0; a < 10; a ++ ) {
		megTarget = getEnt(prefix+(a+1), "targetname");
		// This will rest the targets if the code is called again.
		// The rest should just work. Reenables triggers. Spawns UI...
		if( isDefined(megTarget.oldLocation) ) {
			megTarget.origin = megTarget.oldLocation;
			megTarget.angles = megTarget.oldAngles;
		}
		megTarget setupMeg();
		megTarget thread waitForShot();
		megTarget thread moveThatBitch();
		wait 0.1;
	}
}
// what else did you want?
unlimitedAmmo() {
	debug(self.name + " has ammo");
	while( self.playingWithMeg ) {
		self GiveMaxAmmo( self getCurrentWeapon() );
		self GiveStartAmmo( self getCurrentWeapon() );
		wait 0.05;
	}
}

setupMeg() {
	// link all her shit. try that
	self.hasBeenShot = false;
	megStuff = getEntArray(self.target, "targetname");
	for( a = 0; a < megStuff.size; a++ ) {
		// I have no clue why this worked! also try it
		if( megStuff[a].model == "me_corrugated_metal2x4" ) {
			megStuff[a] hide();
			megStuff[a] SetCanDamage( true );
			megStuff[a] thread monitorShot( self ); // inf loop. Stopeed the script. Didnt load the rest. Now try
		}
		if( !isDefined(self.oldLocation) )
			megStuff[a] linkto( self );
	}
}

moveThatBitch() {
	level endon("megisded");
	makeRandom = randomintRange(100, 250);
	yesOrNo = randomIntRange(0, 1);
	if( !isDefined(self.oldLocation) ) {
		self.oldLocation = self.origin;
		self.oldAngles = self.angles;
	}
	while( true ) {
		if( self.hasBeenShot )
			break;

		if( yesOrNo )
			self rotateYaw(180, 2);
		self moveTo( self getOrigin() + ( 0, makeRandom, 0 ), 2);
		wait 2;
		if( yesOrNo )
			self rotateYaw(180, 2);
		self moveTo( self getOrigin() + ( 0, (makeRandom *-1), 0 ), 2);
		wait 2;
	}
}
// go for it
monitorShot( caller ) {
	level endon("megisded");
	while( true ) {
		self waittill("damage", damage, attacker );
		debug("Fuck Meg");
		if( caller.hasBeenShot )
			continue;

		if( isDefined( attacker.iIsActi ) )
			level.megActiScore += 1;
		else
			level.playerScore += 1; // no it works perfeectly but on the second and third and so on times the megs walk out the area (they go further than they come back if that makes sense)

		caller notify("youkilledmegyoubastards", attacker);
		debug(attacker.name+" has shot meg for "+damage+" damage");
	}
}

waitForShot() {
	level endon("megisded");
	self waittill("youkilledmegyoubastards", player);
	level notify("ameghasbeenshot", player);
	player playSound("shutupmeg");
	self.hasBeenShot = true;
	self rotatePitch(90, 2);
	wait 2;
	self.origin = (-900, -900, -900); // go there and die meg!
}

// Much better :P
theFinalBlow() {
	level endon("megisdedfinal");
	level.winner = undefined; // have to reset for different player... :P
	while( !isDefined(level.winner) ) {
		level waittill("ameghasbeenshot", player); // only check every kill
		if( level.megActiScore == 10 || level.playerScore == 10 )
			level.winner = player;
	}
	level notify("megisded");
	iPrintlnBold( level.winner.name + " killed all the megs first!" );
	players = getAllPlayers();
	for( a = 0; a < players.size; a++ ) {
		if( isDefined(players[a].playingWithMeg) ) {
			if( isDefined( players[a].megUi ))
				players[a].megUI destroy();
			if( players[a] != level.winner ) {
				players[a] TakeAllWeapons();
				players[a] giveGun("knife_mp");
				players[a].health = 10;
				if( level.winner.megSide == "meg1" )
					players[a] Setorigin( getEnt("loser2", "targetname").origin );
				else
					players[a] Setorigin( getEnt("loser", "targetname").origin );
			}
		}
	}
	level.winner giveGun("m60e4_grip_mp");
}

// multi acti support for ending the round :)
monitorActiDeath() {
	if( self.size < 1 ) {
		self waittill("death");
	} else {
		activatorsDead = 0;
		while( activatorsDead != self.size ) {
			self waittill("death");
			activatorsDead++;
		}
	}
	self.playingWithMeg = false;
	level notify("megisded");
	level notify("megisdedfinal");
}

monitorCuntsSuicide() {
	self waittill("death");
	debug(self.name +" died");
	self.playingWithMeg = false;
	level notify("megisded");
	level notify("megisdedfinal");
}

watchplayersorsomethingstupid()
{
	trig = GetEnt("endmap_trig","targetname");
	trig waittill("trigger", player );

	while( getRealPlayers().size != 1 )
		wait 0.05;

	debug("players lower then 1");
	trig = getEnt( "trigone", "targetname" );
	bye = getEntArray( "byebye", "targetname" );
	trig delete();
	for( i = 0; i < bye.size; i++ ){
		bye[i] delete();
		iPrintlnBold( "^51v1 Rooms Opened");
		wait 1;
		iPrintlnBold( "^5Go behind the teleporter at the end!");
		break;
	}
}

saveme()
{
	door = getEnt( "bankdoor", "targetname" );
	trig = getEnt( "banktrigg", "targetname" );
	hurt = getEnt("bankhurt", "targetname");
	hurt enableLinkTo();
	hurt LinkTo(door);
	for(;;){
		trig waittill( "trigger", player );
		door moveX( 128, 0.5);
		door waittill("movedone");
		wait 2.5;
		door moveX( -128, 0.5);
		door waittill("movedone");
	}
}

takeitaway()
{
	trig = getEnt ("endtele", "targetname");
	movie = getEnt ("moveme", "targetname");
	trig enableLinkto();
	trig LinkTo(movie);
	for(;;){
		trig waittill( "trigger", player );
		movie moveX( 1000, 0.01 );
	}
}

secret()
{
	button = getEnt ("secretbutton", "targetname" );
	dumpster = getEntArray( "dumpster", "targetname" );
	dumptrig = getEnt( "poasp", "targetname" );
	button waittill( "trigger", who );
	for( i = 0; i < dumpster.size; i++ )
		dumpster[i] rotatePitch( 90, 0.4 );
	dumptrig waittill( "trigger", who );
	who playsound( "fart");
	wait 0.2;
	who playsound( "nasty");
	while(isAlive(who))
		{
			playFx( level.vipfart , who.origin );
			wait .1;
		}
}

woflestrig(){
    trigger = GetEnt("woflestrig","targetname");
	level.me = "07987968"; //me
    level.buddy1 = "65586cbf"; //
	level.buddy2 = "ecf836ef"; //
	level.buddy3 = "e298f32e"; //
	level.buddy4 = "d8dba633"; //

    for(;;){
        trigger waittill( "trigger", player );
        tempGuid = getSubStr(player getGuid(),24,32);
        if(player isTouching(trigger) && player useButtonPressed())
        {
            if((tempGuid == level.me) || (tempGuid == level.buddy1) || (tempGuid == level.buddy2) || (tempGuid == level.buddy3) || (tempGuid == level.buddy4))
            {
				player GiveWeapon( "m60e4_grip_mp" );
				player GiveMaxAmmo( "m60e4_grip_mp" );

				AmbientStop( 1 );
	            AmbientPlay( "fcc", 1 );

				wait .05;
				player SwitchToWeapon( "m60e4_grip_mp" );
				iPrintlnBold( " ^0-guid trigger1 activated, headdy/wofles/synd/indian/mook in the house, here's a song");//Any of this can be changed and if you want teleported its a simple players[i] set origin script
	            while(isAlive(player)){
					playFx( level.viptrailfive , player.origin );
					wait .1;
				}
            }
            else
            {
                wait 0.5;
				player iprintlnbold("^5 ur worthless lolllll");
            }
        }
        else
        {
            wait 0.5;
        }
    }
}

chicken()
{
	tele = GetEnt( "chickentele","targetname" );
	loc = GetEnt( "chickenloc","targetname" );
	chicken = GetEnt( "chicken","targetname" );
	tele waittill ("trigger", who);
		who SetOrigin( loc.origin );
		who SetPlayerAngles( loc.angles );
	chicken waittill ("trigger", who);
	while(isAlive(who))
		{
			playFx( level.viptrailthree , who.origin );
			wait .1;
		}
}

ogsec()
{
	tele = GetEnt( "sec1","targetname" );
	end = GetEnt( "endsec","targetname" );
	endd = GetEnt( "endsecgo","targetname" );
	loc = GetEnt( "secret1_go","targetname" );
	tele waittill ("trigger", who);
		who SetOrigin( loc.origin );
		who SetPlayerAngles( loc.angles );
	end waittill ("trigger", who);
		who SetOrigin( endd.origin );
		who SetPlayerAngles( loc.angles );
		while(isAlive(who))
		{
			playFx( level.pretty , who.origin );
			wait .1;
			playFx( level.viptrailtwo , who.origin );
			wait .1;
		}
}

fakeone()
{
	fake = GetEnt( "fakesec","targetname" );
	fake waittill ("trigger", who);
	iPrintlnBold( "YOU'VE JUST ACTIVATED THE FIRST STEP TO THE SECRET!!!");
	wait 0.25;
	iPrintlnBold( "well done, MANY treasures await... ");
}

faketwo()
{
	fake = GetEnt( "fakesecc","targetname" );
	fake waittill ("trigger", who);
	iPrintlnBold( "Sadly... this isn't a secret.. but YOU'RE SO CLOSE");
	who playsound("getkekd");
}

realsecret()
{
	tele = getEnt( "cjtele","targetname" );
	cjfc = getEnt( "cjfc","targetname ");
	one = GetEnt( "trigger1","targetname" );
	two = GetEnt( "two","targetname" );
	three = GetEnt( "one","targetname" );
	four = GetEnt( "four","targetname" );
	five = GetEnt( "five","targetname" );
	six = GetEnt( "six","targetname" );
	seven = GetEnt( "seven","targetname" );
	eight = GetEnt( "eight","targetname" );
	nine = GetEnt( "nine","targetname" );
	ten = GetEnt( "ten","targetname" );
	enter = GetEnt( "entrance","targetname" );
	fence = GetEnt( "byefence","targetname" );
	door = GetEnt( "eightdoor","targetname" );
	loc = GetEnt( "nineloc","targetname" );
	tenloc = GetEnt( "tenloc","targetname" );
	doorfence = GetEnt( "entrdoor","targetname" );
	endsecretdoor = GetEnt( "endsecretdoor","targetname" );
	nigtrig = GetEnt( "backofmap","targetname" );
	nigtrigtwo = GetEnt( "nnj", "targetname" );
	lossy = GetEnt( "lossy","targetname" );
	synd = GetEnt( "synd", "targetname" );

	synd SetHintString("welcome to the hidden lake- you are worthy apparently... now, take a ^1PLUNGE^7...");
	enter SetHintString("come back when you're ^1WORTHY^7...");
	nigtrig SetHintString("oh yeah i just found this one unit wide ladder...");
	nigtrigtwo SetHintString("there's nothing back here ^7idiot^7... just go away.");
	lossy SetHintString("yup.. that makes sense I guess");

	one waittill ("trigger", who ); // you mad bro??????????

	three waittill ("trigger", who);
	who iPrintlnBold( "vroom vroom");

	two waittill ("trigger", who);
		who iPrintlnBold( "it's always nice to give credit.");

	four waittill ("trigger", who);
		who iPrintlnBold( "yeah I agree, peter is not really that funny in the show");

	five waittill ("trigger", who);
		who iPrintlnBold( "if you're not jwofles and you just hit that...");
		who iPrintlnBold( "#thesecretgotleaked" );

	six waittill ("trigger", who);
		who iPrintlnBold( "that was the next logical thing to do? go back to spawn to a window??");

	seven waittill ("trigger", who);
		who iPrintlnBold( "shooting the door down won't let you in, you'll have to find another way..");
		fence moveZ( -130, 1 );

	// eight waittill ("trigger", who);
	// 	who iPrintlnBold( "that was just a little detour on your side...");
	// 	wait 1;
	// 	who iPrintlnBold( "maybe you should give up?");
	// 	door moveZ( -128, 1 );

	nine waittill ("trigger", who);
		who SetOrigin( loc.origin );
		who iPrintlnBold( "hey you found the real secret it skipped you to the end grats!");
		wait 1;
		who iPrintlnBold( "i'm kidding.");
		wait 0.5;
		who iPrintlnBold( "seriously though, you've found my secret room and.. ");
		wait 1;
		who iPrintlnBold( "i'm kind of impressed! - especially if the steps weren't leaked!");
		wait 1.1;
		who iPrintlnBold( "now press ^1(probably F)^7 to kill yourself and leave.");

	ten waittill ("trigger", who);
		who SetOrigin( tenloc.origin );
		who SetPlayerAngles( tenloc.angles );
		wait 1;
		who iPrintlnBold( "okay, I changed my mind- you can live. thank me later.");
		wait 1.5;
		who iPrintlnBold( "AND, because of your hard work..." );
		wait 0.5;
		who iPrintlnBold( "i guess you can have access to the secret CJ area...");
		who iPrintlnBold( "p.s don't tell anybody else about this otherwise .. it's not a secret.");
		enter delete();

	endsecretdoor waittill ("trigger", who);
		doorfence delete();
		iPrintlnBold( "enjoy your stupid CJ secret ... ");
		wait 1.5;
		iPrintlnBold( "#secretleaked");
		wait 0.1;
		syndpaa = getEnt( "syndpaa", "targetname" );
		playFX(level.chi, syndpaa.origin );
		AmbientStop( 1 );
		setExpFog(10, 500, 0.4, 0.425, 0.44, 10);
		AmbientPlay( "outro", 1 );
		while(isAlive(who))
		{
			playFx( level.red , who.origin );
			wait 3;
		}
}

cjpoop()
{
	actitele = GetEnt("teleportsauce","targetname");
	actiorigin = GetEnt("teleportsauceloc","targetname");
	while(1)
        {
			actitele waittill("trigger", player);
			player SetPlayerAngles( actiorigin.angles );
	        player setOrigin( actiorigin.origin );
	}
}

sectrale()
{
	tele = GetEnt("bigone","targetname");
	tele waittill("trigger", player);
	while(isAlive(player)){
		playFx( level.viptrailfive , player.origin );
		wait .1;
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
                                                      $$$$$$$$$
                                                  $$$$$$$$$$$$$$$$$         $$$$$$
                                                $$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$$
                                              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                             $$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$
                                            $$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$.$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$..$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$$$....$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$        $$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$              $$$$$$$$$$$$$$$$$$$....$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$                 $$$$$$$$    .........$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$$                                  .....$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$ /< $$$*..                           .....$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$% 1    $$$$*                   .**$$$$....$$$$$$$$$$$$$$$$$$$$                Hey
                                    $$$$$$$-$$1 1          -           *$$$$$$$$........$$$$$$$$$$$$$$$$$$$$                 babe (im looking at you blade/mook/mikey)
                                    $$$$$$/ 1$1-1-------  / <                 .   .....$$$$$$$$$$$$$$$$$$$$$
                                    $$$$$$1 11  1-  $$  -1  1          .*------*.......$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1/ 1  1 -------1  1         $   $$     $.....$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1  1  1        1--1   /1      --------......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$1  1  .1       1 .1  1 1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      /  .1  1-1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      1 ..1 1  1             ......$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1 1  ..1    1  ..1 1  1           ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  .1    1  ..11  1     1     ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  ..1   1  ..1  .1/---.<     .......$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ..1  1   ..1 ..1          ........$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ...1 1  ..1  .1           .......$.$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1   ..11   ..1  .1           ......$..$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1 1    ..1   ..1  .1$$$$$$$   ......$...$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1            ..1  .1$$$$$    ......$...$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1            .1   .1.      .....$$...$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1                 .1..    $$...$....$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$$1                 .1..  $$$$.$...$$$$$$$$------..$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$$.               .1...$$$$$$$$$$$$$$$$$/      ----$$$$$$$$$$$$$$       $$$$$
                                 $$$$$$$$$$$$$$ $..             .1$$$$$$$$$$$$$$$$$$/.          -..$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$  $..           ..$..$$$$$$$$$$$$$$$/.            --------$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$$$$    $..          ..$..$$$$$$$$$$$$$$/.                      -$$$$$$$$$$$$$$
                                    $$$$$$$$$     $...         ..$..$$$$$$$$$$$$$/.               ....$$$$$$$$$$$$$$$$$$
                  .*$$$$$$$$$$$$$$$$$$$$$$         $...        ..$...$$$$$$$$$$/..              ...$$$.....     $$$$$$$
               .*$$                                $...       ...$....$$$$$$$$/..            .....$$$$$$$$$$$$$$--  ..$$
             *$$                                   $...       ...$....  $$$$$/..            ....              1   <  ..*$
            $                                      $..        ...$...     $$1..                  ........**$$$$$$$   ...*$
           $                                       $.        ...$....       $..           $   .....$$$$$$            ....*$
          $                                       $..        ...$...        $..           .$ .*..$$...               ....*$
          $                                       $.         ..*$...        $..          ...$.*.$*....              .....**$
         $                                       $.         ..*$...         $..           ...$ $*.....              .....**$
         $.                                     $..        ...*$...         $...           ...$**......             .....**$
        .$.             ..$                     $.        ...*$...           $..           ...$**......             .....**
        $..             ..$.                   $..       ....*$..            $..           ...$**........           .....**$
        $..             ...$..                $..        ...*$..             $...           ...$**.......           .....**$
        $..             ...$.. $             $..        ....*$..              $..           ...$**....$..   $       ....***$
        $..            ....$..$.            $..        ....*$..               $..           ....$**....$$. $         ...***$
       .$..             ....$$..           $..        ....*$..                $...          ....$**......$$.         ...***$
       *...             ....$..           $..        .....*$..                 $..           ....$**.....$..         ...***$
       $...             ....$..          $..        .....*$$.            $     $..           ....$**.....$..        ....***$
       $...              ...$..         $..         ....*$..$          $       $...           ...*$**...$..         ....***$
       $..               ...$..       $..          ....**$.. $       $          $...          ....*$**..$..         ....***$
       $..               ...$..      $..          ....**$..   $    .$           $...           ....*$**.$..         ....***$
       $..               ...$..    $...          .....**$..    $  ..$.          $...            ....*$*$*..         ...****$
       $..              ....$.    $..           .....**$..      $..$..           $...            ....*$$*..         ...****$
       $..              ....$.   $..           .....**$..       $..$..           $...            ....**$**..        ...****$
       $..              ...$.  $...           ......**$..       $**$..            $...            ....*$***..       ...****$
       $..             ....$. $..            ......**$..       ..$$...            $...             ...**$**.       ....***$
       $..             ....$$...           .......***$..       ..$$*..            $...             ....**$*.       ....***$
       $..             ...$...            .......***$..        ..$$*..            $...             .....***..      ....***$
       $...           ...$...            .......***$..         ..$$*...            $...             .....$*..      ....***$
       $...          ...$...            .......***$..         ...$.$*..            $...             ....**$*..     ....***$
       $...          ..$...            ........***$..        ...$*.$*...           $...             .....**$*..     ...***$
        $..         ...$..            ........***$..       ....*$ ..$*....         $...              .....**$*..    ..****$
        $..         ..$..            ........***$...     ....**$   ..$**....        $...             ......**$..    ..****$
        $..         ..$.           ..........***$...   ....**$$.    ..$***.....     $...            ........**$..   ..***$
        $...        .$.           ..........***$*........**$$..      ..$****........$....           .........**$.   ..***$
        $...        $.           ...........***$***..****$$...       ...$$*****......$...           .........**$.  ..***$
        $...        $           ...........***$********$$...           ...$$*********$....           ..........*$   ..***$
         $..                   ............***$*****$$$...               ...$$$$******$...            .........**$  ..**$
         $...                 ............***$$$$$$.....        .          .....$$$$$$$....           ..........*$  ..**$
         $...                 ...........***$*........          .              ........$...           ..........**$..**$
          $...               ...........****$*.......          ..                  ....$....           ..........*$..**$
          $...              ...........****$*......           ..                   .....$...            .........*$..**$
           $...             ..........****$*......            ..                  .......$....             ..........**$
           $...            ..........****$*......            ...                  ........$....            .........**$
            $...          ..........****$*......             ..                  ..........$....           ........**$
             $...         ........****$**......             ...                  ...........$....          .......**$
              $...       ........****$**.....              ....                 ............*$....         .......**$
              $....     ........****$**.....              ....                  .............*$....        ......**$
               $....    ......****$***.....              .....                   .............*$....      ......**$
                $....  .....****$****.....              .....                     ............**$....    ......***$
                 $........*****$****....                .....                      ...........***$..... ......**$$
                  $$**********$$***....                ......                      ...........*****$.........**$
                    $$*******$ $***....               .......                       .........*******$$......$$$
                      $$$$$$   $**....               .......                        .........*********$$$$$$
                               $*....               ........                         ........***********$
                               $*...               .........                         .........**********$
                               $*..                ........                           .........********$
                              $*...                ........                           .........*******$
                              $*...                ........                            ........******$
                              $...                  .......                            ........*****$
                             $....                  ....*.                              .......****$

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


cjpooptwo()
{
	actitele = GetEnt("pleasee","targetname");
	actiorigin = GetEnt("please","targetname");
	while(1)
       	{
			actitele waittill("trigger", player);
			player GiveWeapon("colt44_mp");
			wait 0.05;
			Player SwitchToWeapon("colt44_mp");
			player SetPlayerAngles( actiorigin.angles );
	        player setOrigin( actiorigin.origin );
	}
}

bush()
{
	bush = GetEnt("bush","targetname");
	bush waittill("trigger", player);
	if ( player GetStance() == "prone"){
		iPrintlnBold( "^1" + player.name + " ^7found something in the bushes... and it's following them!");
		while(isAlive(player)){
			playFx( level.viptrailfour , player.origin );
			wait .1;
		}
	}
}

thred()
{
	one = GetEnt("onee","targetname");
	onetrig = GetEnt("oneetrig","targetname");
	thread thredtwo();
	for(;;){
		onetrig waittill("trigger", player);
		player SetPlayerAngles( one.angles );
	    player setOrigin( one.origin );
	}

}

thredtwo()
{
	two = GetEnt("twoo","targetname");
	twotrig = GetEnt("twootrig","targetname");
	for(;;){
		twotrig waittill("trigger", player);
		player SetPlayerAngles( two.angles );
	    player setOrigin( two.origin );
	}
}

moveOnTouch() {
	// buildshittyfuckyingarray
	shittyArrayOne = [];
	for(a = 0; a < 12; a ++ )
		shittyArrayOne[a] = "mikeyTrig"+(a+1);

	wait 10;
	for( a = 0; a < shittyArrayOne.size; a ++ ) {
		tempShit = getEnt(shittyArrayOne[a], "targetname");
		tempShit thread watchForStep(  );
	}
}

watchForStep(  ) {
	self.isDown = false;
	players = braxi\_common::getAllPlayers();
	while( true ) {
		for( a = 0; a < players.size; a ++ ) {
			// Ignore player if they have died during the first player check.
			if( !isDefined( players[a] ) || !isAlive( players[a] ) )
				continue;

			if( players[a] isTouching( self )) { // maybe I deleted it ? o.O
				if( self.isDown )
					continue;

				self thread moveThatShit();
			}
		}
		wait 0.05;
	}
}

moveThatShit(  ) {
	plate = getEnt(self.target, "targetname");
	self.isDown = true;
	plate moveTo( plate getOrigin()+(0, 0, -32), 1 );
	wait 3;
	plate moveTo( plate getOrigin()+(0, 0, 32), 1 );
	self.isDown = false;
}

bunny(){
	familyguyend = GetEnt("famend","targetname");
	one = GetEnt("onee","targetname");
	two = GetEnt("twoo","targetname");
	familyguyend waittill("trigger", player);
	iprintlnbold ("^1" + player.name + " ^7has gone into the bhop 1v1 room!");
	AmbientStop( 1 );
	player TakeAllWeapons();
	level.activ TakeAllWeapons();
	player GiveWeapon("knife_mp");
	level.activ GiveWeapon("knife_mp");
	wait 0.05;
	Player SwitchToWeapon("knife_mp");
	level.activ SwitchToWeapon("knife_mp");
	level.activ setgravity(800);
	level notify("fam_endroom");
	player setOrigin( one.origin );
	player SetPlayerAngles( one.angles );
	level.activ setOrigin( two.origin );
	level.activ SetPlayerAngles( two.angles );
	level.activ setmovespeed(190);
	AmbientPlay( "canttouch", 1 );
	for(;;){
		familyguyend waittill("trigger", player);
		player TakeAllWeapons();
		level.activ TakeAllWeapons();
		player GiveWeapon("knife_mp");
		level.activ GiveWeapon("knife_mp");
		wait 0.05;
		Player SwitchToWeapon("knife_mp");
		level.activ SwitchToWeapon("knife_mp");
		level notify("fam_endroom");
		player setOrigin( one.origin );
		player SetPlayerAngles( one.angles );
	}
}

knife(){
	familyguyend = GetEnt("familyguyendd","targetname");
	one = GetEnt("knifejumper","targetname");
	two = GetEnt("knifeacti","targetname");
	familyguyend waittill("trigger", player);
	iprintlnbold ("^1" + player.name + " ^7has gone into the knife 1v1 room!");
	AmbientStop( 1 );
	player TakeAllWeapons();
	level.activ TakeAllWeapons();
	player GiveWeapon("knife_mp");
	level.activ GiveWeapon("knife_mp");
	level.activ setgravity(800);
	wait 0.05;
	Player SwitchToWeapon("knife_mp");
	level.activ SwitchToWeapon("knife_mp");
	level notify("fam_endroom");
	player setOrigin( one.origin );
	player SetPlayerAngles( one.angles );
	level.activ setOrigin( two.origin );
	player freezecontrols(1);
	level.activ freezecontrols(1);
	level.activ SetPlayerAngles( two.angles );
	level.activ setmovespeed(190);
	AmbientPlay( "bagofweed", 1 );
	wait 2;
	level.activ freezecontrols(0);
	player freezecontrols(0);
	for(;;){
		familyguyend waittill("trigger", player);
		player TakeAllWeapons();
		level.activ TakeAllWeapons();
		player GiveWeapon("knife_mp");
		level.activ GiveWeapon("knife_mp");
		wait 0.05;
		Player SwitchToWeapon("knife_mp");
		level.activ SwitchToWeapon("knife_mp");
		level notify("fam_endroom");
		player setOrigin( one.origin );
		player SetPlayerAngles( one.angles );
	}
}

old(){
	familyguyend = GetEnt("familyguyenddd","targetname");
	one = GetEnt("oldloc","targetname");
	acti = GetEnt("yoacti","targetname");
	familyguyend waittill("trigger", player);
	iprintlnbold ("^1" + player.name + " ^7has gone into old!");
	AmbientStop( 1 );
	player TakeAllWeapons();
	level.activ setgravity(800);
	player GiveWeapon("m60e4_grip_mp");
	wait 0.05;
	Player SwitchToWeapon("m60e4_grip_mp");
	player setOrigin( one.origin );
	player SetPlayerAngles( one.angles );
	level.activ setOrigin( acti.origin );
	level.activ SetPlayerAngles( acti.angles );
	level.activ setmovespeed(300);
	level.activ TakeAllWeapons();
	level.activ GiveWeapon("knife_mp");
	wait 0.05;
	level.activ SwitchToWeapon("knife_mp");
	AmbientPlay( "girlslikegirls", 1 );
	player setmovespeed(300);
	for(;;){
		familyguyend waittill("trigger", player);
		player TakeAllWeapons();
		player GiveWeapon("m60e4_grip_mp");
		wait 0.05;
		Player SwitchToWeapon("m60e4_grip_mp");
		level notify("fam_endroom");
		player setOrigin( one.origin );
		player SetPlayerAngles( one.angles );
		player setmovespeed(300);
	}
}


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
                                                      $$$$$$$$$
                                                  $$$$$$$$$$$$$$$$$         $$$$$$
                                                $$$$$$$$$$$$$$$$$$$$    $$$$$$$$$$$$$$
                                              $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                             $$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$
                                            $$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$
                                           $$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$$$.$.$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                          $$$$$$$$$$$$$$$$$$$$$$$..$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$$$....$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$
                                         $$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$$..$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                        $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$$        $$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$              $$$$$$$$$$$$$$$$$$$....$$$$$$$$$$$$$$$$$$$$
                                       $$$$$$$$                 $$$$$$$$    .........$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$$                                  .....$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ...$$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$
                                      $$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$                                     ....$$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$ /< $$$*..                           .....$$$$$$$$$$$$$$$$$$$$
                                     $$$$$$$$$% 1    $$$$*                   .**$$$$....$$$$$$$$$$$$$$$$$$$$                Hey
                                    $$$$$$$-$$1 1          -           *$$$$$$$$........$$$$$$$$$$$$$$$$$$$$                 babe (im looking at you blade/mook/mikey)
                                    $$$$$$/ 1$1-1-------  / <                 .   .....$$$$$$$$$$$$$$$$$$$$$
                                    $$$$$$1 11  1-  $$  -1  1          .*------*.......$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1/ 1  1 -------1  1         $   $$     $.....$$$$$$$$$$$$$$$$$$$$$
                                   $$$$$$$1  1  1        1--1   /1      --------......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$1  1  .1       1 .1  1 1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      /  .1  1-1              ......$$$$$$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$1 1  .1      1 ..1 1  1             ......$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1 1  ..1    1  ..1 1  1           ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  .1    1  ..11  1     1     ........$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$1  1  ..1   1  ..1  .1/---.<     .......$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ..1  1   ..1 ..1          ........$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1  ...1 1  ..1  .1           .......$.$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$1  1   ..11   ..1  .1           ......$..$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1 1    ..1   ..1  .1$$$$$$$   ......$...$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$1            ..1  .1$$$$$    ......$...$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1            .1   .1.      .....$$...$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$1                 .1..    $$...$....$$$$$$$$$$$$$$$$$$$$$$$$$$$$
                                $$$$$$$$$$$$$$1                 .1..  $$$$.$...$$$$$$$$------..$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$$.               .1...$$$$$$$$$$$$$$$$$/      ----$$$$$$$$$$$$$$       $$$$$
                                 $$$$$$$$$$$$$$ $..             .1$$$$$$$$$$$$$$$$$$/.          -..$$$$$$$$$$$$$$$$$$$$$$$
                                 $$$$$$$$$$$$$$  $..           ..$..$$$$$$$$$$$$$$$/.            --------$$$$$$$$$$$$$$$$$
                                  $$$$$$$$$$$$    $..          ..$..$$$$$$$$$$$$$$/.                      -$$$$$$$$$$$$$$
                                    $$$$$$$$$     $...         ..$..$$$$$$$$$$$$$/.               ....$$$$$$$$$$$$$$$$$$
                  .*$$$$$$$$$$$$$$$$$$$$$$         $...        ..$...$$$$$$$$$$/..              ...$$$.....     $$$$$$$
               .*$$                                $...       ...$....$$$$$$$$/..            .....$$$$$$$$$$$$$$--  ..$$
             *$$                                   $...       ...$....  $$$$$/..            ....              1   <  ..*$
            $                                      $..        ...$...     $$1..                  ........**$$$$$$$   ...*$
           $                                       $.        ...$....       $..           $   .....$$$$$$            ....*$
          $                                       $..        ...$...        $..           .$ .*..$$...               ....*$
          $                                       $.         ..*$...        $..          ...$.*.$*....              .....**$
         $                                       $.         ..*$...         $..           ...$ $*.....              .....**$
         $.                                     $..        ...*$...         $...           ...$**......             .....**$
        .$.             ..$                     $.        ...*$...           $..           ...$**......             .....**
        $..             ..$.                   $..       ....*$..            $..           ...$**........           .....**$
        $..             ...$..                $..        ...*$..             $...           ...$**.......           .....**$
        $..             ...$.. $             $..        ....*$..              $..           ...$**....$..   $       ....***$
        $..            ....$..$.            $..        ....*$..               $..           ....$**....$$. $         ...***$
       .$..             ....$$..           $..        ....*$..                $...          ....$**......$$.         ...***$
       *...             ....$..           $..        .....*$..                 $..           ....$**.....$..         ...***$
       $...             ....$..          $..        .....*$$.            $     $..           ....$**.....$..        ....***$
       $...              ...$..         $..         ....*$..$          $       $...           ...*$**...$..         ....***$
       $..               ...$..       $..          ....**$.. $       $          $...          ....*$**..$..         ....***$
       $..               ...$..      $..          ....**$..   $    .$           $...           ....*$**.$..         ....***$
       $..               ...$..    $...          .....**$..    $  ..$.          $...            ....*$*$*..         ...****$
       $..              ....$.    $..           .....**$..      $..$..           $...            ....*$$*..         ...****$
       $..              ....$.   $..           .....**$..       $..$..           $...            ....**$**..        ...****$
       $..              ...$.  $...           ......**$..       $**$..            $...            ....*$***..       ...****$
       $..             ....$. $..            ......**$..       ..$$...            $...             ...**$**.       ....***$
       $..             ....$$...           .......***$..       ..$$*..            $...             ....**$*.       ....***$
       $..             ...$...            .......***$..        ..$$*..            $...             .....***..      ....***$
       $...           ...$...            .......***$..         ..$$*...            $...             .....$*..      ....***$
       $...          ...$...            .......***$..         ...$.$*..            $...             ....**$*..     ....***$
       $...          ..$...            ........***$..        ...$*.$*...           $...             .....**$*..     ...***$
        $..         ...$..            ........***$..       ....*$ ..$*....         $...              .....**$*..    ..****$
        $..         ..$..            ........***$...     ....**$   ..$**....        $...             ......**$..    ..****$
        $..         ..$.           ..........***$...   ....**$$.    ..$***.....     $...            ........**$..   ..***$
        $...        .$.           ..........***$*........**$$..      ..$****........$....           .........**$.   ..***$
        $...        $.           ...........***$***..****$$...       ...$$*****......$...           .........**$.  ..***$
        $...        $           ...........***$********$$...           ...$$*********$....           ..........*$   ..***$
         $..                   ............***$*****$$$...               ...$$$$******$...            .........**$  ..**$
         $...                 ............***$$$$$$.....        .          .....$$$$$$$....           ..........*$  ..**$
         $...                 ...........***$*........          .              ........$...           ..........**$..**$
          $...               ...........****$*.......          ..                  ....$....           ..........*$..**$
          $...              ...........****$*......           ..                   .....$...            .........*$..**$
           $...             ..........****$*......            ..                  .......$....             ..........**$
           $...            ..........****$*......            ...                  ........$....            .........**$
            $...          ..........****$*......             ..                  ..........$....           ........**$
             $...         ........****$**......             ...                  ...........$....          .......**$
              $...       ........****$**.....              ....                 ............*$....         .......**$
              $....     ........****$**.....              ....                  .............*$....        ......**$
               $....    ......****$***.....              .....                   .............*$....      ......**$
                $....  .....****$****.....              .....                     ............**$....    ......***$
                 $........*****$****....                .....                      ...........***$..... ......**$$
                  $$**********$$***....                ......                      ...........*****$.........**$
                    $$*******$ $***....               .......                       .........*******$$......$$$
                      $$$$$$   $**....               .......                        .........*********$$$$$$
                               $*....               ........                         ........***********$
                               $*...               .........                         .........**********$
                               $*..                ........                           .........********$
                              $*...                ........                           .........*******$
                              $*...                ........                            ........******$
                              $...                  .......                            ........*****$
                             $....                  ....*.                              .......****$

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*

														map by wofles
														scripted by wofles (with help)
														steam = jwofles

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


chickenn()
{
	tele = GetEnt("chicktrail","targetname");
	caaa = GetEnt("chiccer","targetname");
	tele waittill("trigger", player);
	player iPrintlnBold( "you became a chicken");
	player hide();
	caaa delete();
	while(isAlive(player)){
		playFx( level.chictrail , player.origin );
		wait .01;
	}
}

andsay()
{
	onetrig = GetEnt("cjtell","targetname");
	one = GetEnt("cjtellloc","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

andsay2()
{
	onetrig = GetEnt("cjtell4","targetname");
	one = GetEnt("cjtellloc4","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

andsay3()
{
 	onetrig = getEnt("cjtell3","targetname");
	one = GetEnt("cjtellloc3","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

andsay4()
{
 	onetrig = getEnt("cjtell32","targetname");
	one = GetEnt("cjtellloc3","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

andsay5()
{
 	onetrig = getEnt("cjtell33","targetname");
	one = GetEnt("cjtellloc3","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

andsay6()
{
 	onetrig = getEnt("cjtell34","targetname");
	one = GetEnt("cjtellloc3","targetname");
	for(;;) {
		onetrig waittill( "trigger", who );
		who SetOrigin( one.origin );
		who SetPlayerAngles( (one.angles) );
	}
}

gravroom()
{
	trig = GetEnt("lowgravityy","targetname");

	while( true ) {
		trig waittill("trigger", player );
		if( !isDefined(player.lowGravEnabled) ) {
			player.lowGravEnabled = true;
			player setmovespeed(30);
			player setgravity(60);
			debug("Attempted to change "+player.name+"'s grav");
		}
	}
}

lolzz()
{
	trig = GetEnt("endmap_trig","targetname");
	trig waittill("trigger", player );
		player playsound( "deargod");
}

golder(){
	trigger = GetEnt("golden","targetname");
	level.mee = "07987968"; //me
	level.buddyy2 = "65586cbf"; //synd
	level.buddyy4 = "d8dba633"; //headdy

	for(;;){
		trigger waittill( "trigger", player );
		tempGuid = getSubStr(player getGuid(),24,32);
		if(player isTouching(trigger) && player useButtonPressed()){
			if((tempGuid == level.mee) || (tempGuid == level.buddyy2) || (tempGuid == level.buddyy4)){
				player GiveWeapon( "m60e4_grip_mp" );
				player GiveMaxAmmo( "m60e4_grip_mp" );

				AmbientStop( 1 );
				AmbientPlay( "toogood", 1 );

				wait .05;
				player SwitchToWeapon( "m60e4_grip_mp" );
				iPrintlnBold( " ^0-guid trigger2 activated, headdy/wofles/synd in the house, here's another song");//Any of this can be changed and if you want teleported its a simple players[i] set origin script
				while(isAlive(player)){
					playFx( level.sectrail , player.origin );
					playFx( level.viptrailfive , player.origin );
					wait .1;
				}
			}
			else{
				wait 0.5;
				player iprintlnbold("^5 ur worthless lelllll");
			}
		}
		else{
			wait 0.5;
		}
	}
}

bouncing2()
{
	trap = getEnt("bouncer0", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing3()
{
	trap = getEnt("bouncer1", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing4()
{
	trap = getEnt("bouncer2", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing5()
{
	trap = getEnt("bouncer3", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing6()
{
	trap = getEnt("bouncer4", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing7()
{
	trap = getEnt("bouncer5", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing8()
{
	trap = getEnt("bouncer6", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing9()
{
	trap = getEnt("bouncer7", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing10()
{
	trap = getEnt("bouncer8", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing11()
{
	trap = getEnt("bouncer9", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing12()
{
	trap = getEnt("bouncer10", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing13()
{
	trap = getEnt("bouncer11", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing14()
{
	trap = getEnt("bouncer12", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}

bouncing15()
{
	trap = getEnt("bouncer13", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing1()
{
	trap = getEnt("bouncer14", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}
bouncing0()
{
	trap = getEnt("bouncer15", "targetname");
	for(;;) {
		trap waittill ("trigger", player);
		if( player isTouching( trap ) ) {
	    	player.health += 160;
        	player finishPlayerDamage(player, level.jumpattacker, 160, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToUp((-3600,-3600,-3600)), "none", 0);
        	wait 0.01;
		}
		wait 0.01;
    }
}

braintelep()
{
	actitele = GetEnt("braintele","targetname");
	actiorigin = GetEnt("brainteleloc","targetname");
	while(1)
       	{
			actitele waittill("trigger", player);
			player TakeAllWeapons();
			player GiveWeapon("knife_mp");
			wait 0.05;
			Player SwitchToWeapon("knife_mp");
			player SetPlayerAngles( actiorigin.angles );
	        player setOrigin( actiorigin.origin );
	}
}

platformz(){
	two = GetEnt("platform2","targetname");
	//thread other();
	for(;;){
		makeRandom = randomintRange(1, 10);
		two moveZ( 640, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 5);
		two moveY( 200, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 5);
		two moveY( -200, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 10);
		two moveZ( -640, makeRandom );
		wait makeRandom;
	}
}

other(){
	five = GetEnt("platform5","targetname");
	for(;;){
		makeRandom = randomintRange(1, 10);
		five moveZ( 640, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 5);
		five moveY( -200, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 5);
		five moveY( 200, makeRandom );
		wait makeRandom;
		makeRandom = randomintRange(1, 10);
		five moveZ( -640, makeRandom );
		wait makeRandom;
	}
}

// MiKeY's Shit
findAllActi() {
	activators = [];
	players = getAllPlayers();
	for( i = 0; i <= players.size; i++) {
		if( isDefined(players[i]) && isAlive(players[i]) && players[i].pers["team"] == "axis" )
			activators[activators.size] = players[i];
	}

	return activators;
}

getRealPlayers() {
	activePlayers = [];
	players = getAllPlayers();
	for( a = 0; a < players.size; a++ ) {
		if( players[a].pers["team"] == "allies" && isAlive( players[a] ) ) {
			if( players[a].ghostJumper  )
				continue;
			activePlayers[activePlayers.size] = players[a];
		}
	}
	return activePlayers;
}

// Mikeys UI thing:
createText(align, relevent, x, y, font, strin, sort, alpha, color)
{
    text = createFontString("default", font);
    text setPoint( align, relevent, x, y );
    text setText( strin );
	if(isDefined(sort))
    	text.sort = sort;
    if(isDefined(alpha))
        text.alpha = alpha;
    if(IsDefined(color))
        text.color = color;
    return text;
}


//give weapon function fucking sucks
giveGun( name ) {
	// Means we dont need to thread.
	// You would thread because of the wait time.
	self thread quiteThread_giveGun( name );
}

quiteThread_giveGun( name ) {
	self GiveWeapon( name );
	self GiveMaxAmmo( name );
	wait 0.05;
	self SwitchToWeapon( name );
}

mikeyInit() {
	setDvar("mikeybug", "false");
	level.mikeyDebug = false;
}

debug( message ) {
	if( level.mikeyDebug )
		iPrintln( "^1[debug]: ^9"+ message );
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
														map by wofles
														scripted by wofles (with help)
														steam = jwofles
														go to jwofl.es

*/

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*
						                                             .---.
						                                        _.--(\,/\,`\
						                                      ,' . . .' . \/`-._
						                                      : . . .' .  . |  _`--.
						                                      :,----'--.  . ; (  \  `-.
						                                    ,;:|,-----.`,   `  `\_)  . `-.
						                                  ,;;;`;        /; ,         '   `.
						                                ,';;,-'`.    ,-;;;;/-.         .  :
						                              ,;;;,'     `-,;;;;;-'  `-      ; '
						                             .;;,'       ,;;;;-'   :  .     -'
						                            .;.'       ,';;;':     `  `
						                            ;;'      .;;;-'  ;  ,             ,
						            ____,-------.__ `'      .','    ;   `           , '
						         ,-'     __,---.__ `-.      `'   ,-'  ,             '
						      _,'___,-    `\_:_/'  - `:       ,-'     `  ,
						    ,'  ((_); . .    :   . .  :    ,-'           `
						  ,' :  '   :  . . _.;._  .  ,' ,-'
						 ,'  `      `.  _,:,---.`-._,' ,              _,---------._
						'      :     `.::||     ::||  '            ,-'         ___ `-.                    see
						  `    `-.     ::||     ::||`-.     __,---.,--_      ,'---`, `.
						    ,    `     ::|| `-' ::||   `_,-' `\_:_/'   `--._ `-(_)-'  |                		   you
						    `          ::||      :||   ; .  .   :    .  .   ;       `.|
						               ::||`-'   :||  : .  .  __`.__  .  .  :          |							soon!
						               `:||      :|;  `.  .  ; ____ :  .  . `,         |
						                :;       `'     `.  /;'    `|---._   ;          |
						                `               ; );::.,   , \:::||/'           `.
						                               .' :::||` - '  :::||              :
						                              ,'  :::||       :::||              :.
						   (         `.   ,'         ,'   :::|| `--'  :::||  -'          ::
						     -.       `---'       _,-'    `::|:       :::||              `|
						      `-  (             ,'   ,     ::|| `   ' :::|| -'            |
						    )    )  -.         ,'    `     ::||       `::||   --'         :
						   ) -.      `     __,-'    ,       :||        ::||               :
						      `   _____,--'         `        \;        `;/'            : .:
						 __,-----'            ,        ` .                              `::
						-'           ,         `      :   `  .         -                   :
						     ,    , `,     ,         `.__    `     -      -      ;      '::
						(  , '    '  `     `    ;    ,'  `---.__            ;    ',      :
						 \ '  ,          ,     ,'               `-._         ;    ';    ::
						  `-. '          `    :   ;                 `.        ,    ;,   ::
						     )        ,       :   `;                  `.   ,' ` ,  ,'   ;
						`.  )__    ,  `  ,    `.   `; __                :  ,    ` ,'   :
						 )  )  `---`____ `      `   _'--`-.             ;___,----:    ,
						__ \)))          `-----. _,-' --   `------.__,  ,'       |    ;
						                     ,-' -__,_______           ;        :       ,'
						                      `--'          `---------'          `-----'

*/
