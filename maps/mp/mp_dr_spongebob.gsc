main()

{
 maps\mp\_load::main();

 addTriggerToList( "activatortrap1" );
 addTriggerToList( "activatortrap2" );
 addTriggerToList( "activatortrap3" );
 addTriggerToList( "activatortrap4" );
 addTriggerToList( "activatortrap5" );
 addTriggerToList( "activatortrap6" );
 addTriggerToList( "activatortrap7" );
 addTriggerToList( "activatortrap8" );
 addTriggerToList( "activatortrap9" );
 addTriggerToList( "activatortrap10" );
 addTriggerToList( "activatortrap11" );
 addTriggerToList( "activatortrap12" );
 addTriggerToList( "activatortrap13" );
 addTriggerToList( "activatortrap14" );
 addTriggerToList( "activatortrap15" );
 addTriggerToList( "activatortrap16" );
 addTriggerToList( "activatortrap17" );
 addTriggerToList( "activatortrap18" );
 addTriggerToList( "activatortrap19" );




 game["allies"] = "marines";
 game["axis"] = "opfor";
 game["attackers"] = "axis";
 game["defenders"] = "allies";
 game["allies_soldiertype"] = "desert";
 game["axis_soldiertype"] = "desert";

	// setdvar("g_speed" ,"190");
	// setdvar("dr_jumpers_speed" ,"1");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".1");
	setdvar("r_glowbloomintensity1",".1");
	setdvar("r_glowskybleedintensity0",".1");

	preCacheItem( "rpg_mp" );
	preCacheItem( "m60e4_mp" );
	preCacheItem( "m4_reflex_mp" );

thread opendoor();
thread creditname();
thread credits();
thread secretmusic();
thread maptrap1();
thread maptrap2();
thread maptrap3();
thread maptrap4();
thread maptrap5();
thread teleporter();
thread teleporter2();
thread maptrap6();
thread maptrap7();
thread maptrap8();
thread maptrap8addon();
thread maptrap9();
thread lift();
thread maptrap10();
thread maptrap11();
thread maptrap12();
thread maptrap12addon();
thread maptrap13();
thread lettingdown();
thread lettingdown2();
thread lettingdown3();
thread lettingdown4();
thread lettingdown5();
thread lettingdown6();
thread lettingdown7();
thread lettingdown8();
thread lettingdown9();
thread lettingdown10();
thread lettingdown11();
thread lettingdown12();
thread lettingdown13();
thread lettingdown14();
thread lettingdown15();
thread lettingdown16();
thread lettingdown17();
thread lettingdown18();
thread lettingdown19();
thread lettingdown20();
thread maptrap14();
thread maptrap15();
thread maptrap16();
thread endrooms();
thread sniper();
thread bounce();
thread bouncegun();
thread bouncetele();
thread bouncetele2();
thread music_trig();
thread music_trig2();
thread music_trig3();
thread music_trig4();
thread music_trig5();
thread music_trig6();
thread sound_trig1();
thread sound_trig2();
thread weapon();
thread rpg();
thread rpgmover();
thread rpgammo();
thread rpgammo2();
thread rpgammo3();
thread rpgammo4();
thread race();
thread raceuse();
thread raceusesecond();
thread teleporter3();
thread teleporter4();
thread maptrap17();
thread maptrap18();
thread maptrap18addon();
thread maptrap19();
thread chocochase();
thread chasing();
thread chasingfail();
thread mapchocotrap1();
thread mapchocotrap2();
thread mapchocotrap3();
thread thefail();
thread thewin();
thread ruined();
thread raceback();
thread raceback2();
thread snipefail();
thread snipefail2();
thread old();
thread secret();
thread donesecret();


	}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}


opendoor()
{
putdoordown = getEnt ("welcome", "targetname");
door = getEnt ("doorlift", "targetname");
putdoordown waittill ("trigger");
wait 8;
iprintlnBold("^4Spongebob Squarepants");
door moveZ (-240, 3);
AmbientPlay( "song1" );
}

creditname()
{
trig = getEnt ("welcome", "targetname");
brush = getEnt ("krishmover", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush rotateYaw (360, 4);
wait 0.05;
}
}

credits()
{
trig = getEnt ("welcome", "targetname");
trig waittill ("trigger", player);
while(1)
{
iPrintln("Any bugs seen, please report it to my steam: KHH12/Krish34");
wait 40;
}
}

secretmusic()
{
trig = getEnt ("secretmusic1", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2...");
trig = getEnt ("secretmusic2", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2....");
trig = getEnt ("secretmusic3", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2.....");
trig = getEnt ("secretmusic4", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2......");
trig = getEnt ("secretmusic5", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2.......");
trig = getEnt ("secretmusic6", "targetname");
trig waittill ("trigger", player);
AmbientStop(3);
MusicStop(3);
wait 3;
MusicPlay ("song2");
}

maptrap1()
{
trapbrush = getEnt ("trap1", "targetname");
trapactivation = getEnt ("activatortrap1", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ( "^1Activated" );

trapbrush moveZ (256, 0.25);
trapbrush waittill ("movedone");
trapbrush moveZ (-256, 4);

trapactivation delete();
}

maptrap2()
{
trapbrush = getEnt ("trap2part1", "targetname");
trapbrushpartly = getEnt ("trap2part2", "targetname");
trapactivation = getEnt ("activatortrap2", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ( "^1Activated" );

while(1)
{
trapbrush moveX (250, 0.7);
trapbrushpartly moveX (-250, 0.7);
trapbrush waittill ("movedone");
trapbrush moveX (-250, 0.7);
trapbrushpartly moveX (250, 0.7);
trapbrush waittill ("movedone");
}
trapactivation delete();
}

maptrap3()
{
trapbrushrotate = getEnt ("trap3part1", "targetname");
trapbrushrotatepart = getEnt ("trap3part2", "targetname");
trapbrushrotatepartly = getEnt ("trap3part3", "targetname");
trapactivation = getEnt ("activatortrap3", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ( "^1Activated" );

while(1)
{
trapbrushrotate rotatePitch (360, 1.5);
trapbrushrotatepart rotatePitch (360, 1.5);
trapbrushrotatepartly rotatePitch (360, 1.5);
wait 0.05;
}
trapactivation delete();
}

maptrap4()
{
brush = getEnt ("trap4part1", "targetname");
trig = getEnt ("trap4part2", "targetname");
trapactivation = getEnt ("activatortrap4", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trapactivation waittill ("trigger", player);
trapactivation setHintString ( "^1Activated" );

brush moveZ (250, 1);
wait 5;
brush moveZ (-250, 1);


trapactivation delete();
}

maptrap5()
{
brush = getEnt ("trap5part1", "targetname");
brush2 = getEnt ("hiddenblock1", "targetname");
mine = getEnt ("minefield", "targetname");
trapactivation = getEnt ("activatortrap5", "targetname");
holdmine = getEnt ("mineholder", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ( "^1Activated" );

brush moveX (192, 1);
brush2 moveZ (144, 1);
mine enableLinkTo();
mine LinkTo(holdmine);
wait 2;
holdmine moveZ (64, 1);
wait 2;
holdmine moveZ (-64, 1);
brush moveX (-192, 1);
brush2 moveZ (-144, 1);
}

teleporter()
{
trig = getEnt ("teleport1", "targetname");
tele = getEnt ("orig", "targetname");

for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( tele.origin );


	}
}

teleporter2()
{
trig = getEnt ("teleport2", "targetname");
tele = getEnt ("orig1", "targetname");

for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( tele.origin );

	}
}

maptrap6()
{
brush = getEnt ("trap6part1", "targetname");
trig = getEnt ("trap6part2", "targetname");
trapactivation = getEnt ("activatortrap6", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trapactivation waittill ("trigger", player);
trapactivation sethintString ("^1Activated");

while(1)
{
brush moveZ (432, 1.5);
wait 4;
brush moveZ (-432, 1.5);
wait 10;
}
trapactivation delete();
}

maptrap7()
{

brush = getEnt ("trap7part1", "targetname");
brush2 = getEnt ("trap7part2", "targetname");
brush3 = getEnt ("trap7part3", "targetname");
trigger = getEnt( "activatortrap7" , "targetname" );

trigger waittill( "trigger" , player );
trigger sethintString ("^1Activated");

while(1)
{
brush rotatePitch (360, 2);
brush2 rotatePitch (360, 2);
brush3 rotatePitch (360, 2);
wait 3;
}
trigger delete();

}
maptrap8()
{

brush = getEnt ("trap8part1", "targetname");
brush2 = getEnt ("trap8part2", "targetname");
brush3 = getEnt ("trap8part3", "targetname");
trapactivation = getEnt ("activatortrap8", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

 while(1)
 {
  brush moveY (-448, 3);
  brush2 moveY (-448, 3);
  brush3 moveY (-448, 3);
  brush waittill( "movedone" );
  brush moveZ (176, 1);
  brush2 moveZ (176, 1);
  brush3 moveZ (176, 1);
  brush waittill( "movedone" );
  brush moveY (896, 2);
  brush2 moveY (896, 2);
  brush3 moveY (896, 2);
  brush waittill( "movedone" );
  brush moveZ (-176, 1);
  brush2 moveZ (-176, 1);
  brush3 moveZ (-176, 1);
  brush waittill( "movedone" );
  brush moveY (-448, 3);
  brush2 moveY (-448, 3);
  brush3 moveY (-448, 3);
  brush waittill( "movedone" );
 }
trapactivation delete();

}

maptrap8addon()
{
brush = getEnt ("trap8part4", "targetname");
trapactivation = getEnt ("activatortrap8", "targetname");

trapactivation waittill ("trigger", player);
while(1)
{
brush moveX (-80, 2, 1, 1);
brush waittill ("movedone");
brush moveX (80, 2, 1, 1);
brush waittill ("movedone");
 }
}
maptrap9()
{
brush = getEnt ("trap9part1", "targetname");
brush2 = getEnt ("trap9part2", "targetname");
trig = getEnt ("trap9part3", "targetname");
trapactivation = getEnt ("activatortrap9", "targetname");

trig enableLinkTo();
trig LinkTo (brush);
trig LinkTo (brush2);

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

while(1)
{
brush moveX(-39, 2, 1, 1);
brush2 moveX (39, 2, 1, 1);
brush waittill ("movedone");
brush moveX(39, 2, 1, 1);
brush2 moveX (-39, 2, 1, 1);
brush waittill ("movedone");
}
trapactivation delete();
}

lift()
{
brush = getEnt ("elevator3", "targetname");
trig = getEnt ("mover3", "targetname");

trig waittill ("trigger", player);
while(1)
{
brush moveZ (176, 1, 0.5, 0.5);
brush waittill ("movedone");
brush moveY (-640, 5, 2.5, 2.5);
brush waittill ("movedone");
brush moveZ (-176, 1, 0.5, 0.5);
brush waittill ("movedone");
brush moveY (640, 5, 2.5, 2.5);
wait 10;
}
}


maptrap10()
{
brush = getEnt ("trap10", "targetname");
trig = getEnt ("trap10part2", "targetname");
trapactivation = getEnt ("activatortrap10", "targetname");

trig enableLinkTo();
trig LinkTo (brush);

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

while(1)
{
brush moveX (-1216, 2, 1, 1);
wait 3;
brush moveX (1216, 2, 1, 1);
wait 15;
}

trapactivation delete();
}

maptrap11()
{
brush = getEnt ("trap11", "targetname");
trapactivation = getEnt ("activatortrap11", "targetname");

trapactivation waittill ("trigger", player);
trapactivation sethintString ("^1Activated");
while(1)
{
brush rotateRoll (360, 3.5);
wait 0.05;
}
trapactivation delete();
}

maptrap12()
{
brush = getEnt ("trap12part1", "targetname");
trapactivation = getEnt ("activatortrap12", "targetname");

trapactivation waittill ("trigger", player);
trapactivation sethintString ("^1Activated");

while(1)
{
brush rotatePitch (360, 4);
wait 3;
}
trapactivation delete();
}

maptrap12addon()
{
brush2 = getEnt ("trap12part2", "targetname");
trapactivation = getEnt ("activatortrap12", "targetname");

trapactivation waittill ("trigger", player);
while(1)
{
brush2 rotatePitch (-360, 3);
wait 3;
}
}


maptrap13()
{
brush = getEnt ("trap13part1", "targetname");
trig = getEnt ("trap13part2", "targetname");
trapactivation = getEnt ("activatortrap13", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trapactivation waittill ("trigger", player);
trapactivation sethintString ("^1Activated");

while(1)
{
brush moveZ (-176, 0.7);
brush waittill ("movedone");
brush moveZ (176, 0.7);
brush waittill ("movedone");
}
trapactivation delete();
}

lettingdown()
{
brush = getEnt ("letdownplat1", "targetname");
trig = getEnt ("letdown1", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown2()
{
brush = getEnt ("letdownplat2", "targetname");
trig = getEnt ("letdown2", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown3()
{
brush = getEnt ("letdownplat3", "targetname");
trig = getEnt ("letdown3", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown4()
{
brush = getEnt ("letdownplat4", "targetname");
trig = getEnt ("letdown4", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown5()
{
brush = getEnt ("letdownplat5", "targetname");
trig = getEnt ("letdown5", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown6()
{
brush = getEnt ("letdownplat6", "targetname");
trig = getEnt ("letdown6", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown7()
{
brush = getEnt ("letdownplat7", "targetname");
trig = getEnt ("letdown7", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown8()
{
brush = getEnt ("letdownplat8", "targetname");
trig = getEnt ("letdown8", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown9()
{
brush = getEnt ("letdownplat9", "targetname");
trig = getEnt ("letdown9", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown10()
{
brush = getEnt ("letdownplat10", "targetname");
trig = getEnt ("letdown10", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown11()
{
brush = getEnt ("letdownplat11", "targetname");
trig = getEnt ("letdown11", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown12()
{
brush = getEnt ("letdownplat12", "targetname");
trig = getEnt ("letdown12", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown13()
{
brush = getEnt ("letdownplat13", "targetname");
trig = getEnt ("letdown13", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown14()
{
brush = getEnt ("letdownplat14", "targetname");
trig = getEnt ("letdown14", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown15()
{
brush = getEnt ("letdownplat15", "targetname");
trig = getEnt ("letdown15", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown16()
{
brush = getEnt ("letdownplat16", "targetname");
trig = getEnt ("letdown16", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown17()
{
brush = getEnt ("letdownplat17", "targetname");
trig = getEnt ("letdown17", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown18()
{
brush = getEnt ("letdownplat18", "targetname");
trig = getEnt ("letdown18", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown19()
{
brush = getEnt ("letdownplat19", "targetname");
trig = getEnt ("letdown19", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}
lettingdown20()
{
brush = getEnt ("letdownplat20", "targetname");
trig = getEnt ("letdown20", "targetname");
trig waittill ("trigger", player);
while(1)
{
brush moveZ (-32, 1, 0.5, 0.5);
wait 4;
brush moveZ (32, 1, 0.5, 0.5);
trig waittill ("trigger", player);
}
}

maptrap14()
{
brush = getEnt ("letdownplat1", "targetname");
brush2 = getEnt ("letdownplat2", "targetname");
brush3 = getEnt ("letdownplat3", "targetname");
brush4 = getEnt ("letdownplat4", "targetname");
brush5 = getEnt ("letdownplat5", "targetname");
brush6 = getEnt ("letdownplat6", "targetname");
brush7 = getEnt ("letdownplat7", "targetname");
brush8 = getEnt ("letdownplat8", "targetname");
brush9 = getEnt ("letdownplat9", "targetname");
brush10 = getEnt ("letdownplat10", "targetname");
brush11 = getEnt ("letdownplat11", "targetname");
brush12 = getEnt ("letdownplat12", "targetname");
brush13 = getEnt ("letdownplat13", "targetname");
brush14 = getEnt ("letdownplat14", "targetname");
brush15 = getEnt ("letdownplat15", "targetname");
brush16 = getEnt ("letdownplat16", "targetname");
brush17 = getEnt ("letdownplat17", "targetname");
brush18 = getEnt ("letdownplat18", "targetname");
brush19 = getEnt ("letdownplat19", "targetname");
brush20 = getEnt ("letdownplat20", "targetname");
brushhelper = getEnt ("jellyfish", "targetname");
trapactivation = getEnt ("activatortrap14", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

brushhelper moveZ (-112, 1);
wait 1;
brush moveZ (-32, 1, 0.5, 0.5);
brush2 moveZ (-32, 1, 0.5, 0.5);
brush3 moveZ (-32, 1, 0.5, 0.5);
brush4 moveZ (-32, 1, 0.5, 0.5);
brush5 moveZ (-32, 1, 0.5, 0.5);
brush6 moveZ (-32, 1, 0.5, 0.5);
brush7 moveZ (-32, 1, 0.5, 0.5);
brush8 moveZ (-32, 1, 0.5, 0.5);
brush9 moveZ (-32, 1, 0.5, 0.5);
brush10 moveZ (-32, 1, 0.5, 0.5);
brush11 moveZ (-32, 1, 0.5, 0.5);
brush12 moveZ (-32, 1, 0.5, 0.5);
brush13 moveZ (-32, 1, 0.5, 0.5);
brush14 moveZ (-32, 1, 0.5, 0.5);
brush15 moveZ (-32, 1, 0.5, 0.5);
brush16 moveZ (-32, 1, 0.5, 0.5);
brush17 moveZ (-32, 1, 0.5, 0.5);
brush18 moveZ (-32, 1, 0.5, 0.5);
brush19 moveZ (-32, 1, 0.5, 0.5);
brush20 moveZ (-32, 1, 0.5, 0.5);
wait 5;
brushhelper moveZ (112, 1);
brush moveZ (32, 1, 0.5, 0.5);
brush2 moveZ (32, 1, 0.5, 0.5);
brush3 moveZ (32, 1, 0.5, 0.5);
brush4 moveZ (32, 1, 0.5, 0.5);
brush5 moveZ (32, 1, 0.5, 0.5);
brush6 moveZ (32, 1, 0.5, 0.5);
brush7 moveZ (32, 1, 0.5, 0.5);
brush8 moveZ (32, 1, 0.5, 0.5);
brush9 moveZ (32, 1, 0.5, 0.5);
brush10 moveZ (32, 1, 0.5, 0.5);
brush11 moveZ (32, 1, 0.5, 0.5);
brush12 moveZ (32, 1, 0.5, 0.5);
brush13 moveZ (32, 1, 0.5, 0.5);
brush14 moveZ (32, 1, 0.5, 0.5);
brush15 moveZ (32, 1, 0.5, 0.5);
brush16 moveZ (32, 1, 0.5, 0.5);
brush17 moveZ (32, 1, 0.5, 0.5);
brush18 moveZ (32, 1, 0.5, 0.5);
brush19 moveZ (32, 1, 0.5, 0.5);
brush20 moveZ (32, 1, 0.5, 0.5);

trapactivation delete();
}

maptrap15()
{
brush = getEnt ("trap15part1", "targetname");
brush2 = getEnt ("trap15part2", "targetname");
trapactivation = getEnt ("activatortrap15", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

brush moveZ (-416, 1);
wait 3;
brush2 moveZ (400, 1);
while(1)
{
brush2 rotatePitch (360, 2);
wait 5;
}

trapactivation delete();
}

maptrap16()
{
brush = getEnt ("trap16part1", "targetname");
trig = getEnt ("trap16part2", "targetname");
trapactivation = getEnt ("activatortrap16", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trapactivation waittill ("trigger", player);

while(1)
{
brush moveY (112, 3, 1.5, 1.5);
brush waittill ("movedone");
brush moveY (-112, 3, 1.5, 1.5);
brush waittill ("movedone");
}
trapactivation delete();
}


endrooms()
{
trig = getEnt ("teleport5", "targetname");
origination = getEnt ("orig5", "targetname");

for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );

	}
	}

sniper()
{
        level.sniper_trig = getEnt( "sniper_trig", "targetname"); //trigger
		level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        sniper = getEnt( "sniper1", "targetname" ); //jumper origin
        acti = getEnt( "sniper2", "targetname" ); //acti origin

        while(1)
{
                level.sniper_trig waittill( "trigger", player);
                if( !isDefined( level.sniper_trig ) )
                return;

              level.race_trig hide(); //deletes all other rooms from being used.
              level.weapon_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.rpg_trig hide();
			  level.choco_trig hide();
			  level.sniper_trig hide();

            player SetPlayerAngles( sniper.angles );
                player setOrigin( sniper.origin );
                player TakeAllWeapons();
                player GiveWeapon( "m40a3_mp" ); //Gives player weapon
                player giveMaxAmmo( "m40a3_mp" ); //Gives player ammo
                player GiveWeapon( "remington700_mp" );
                player giveMaxAmmo( "remington700_mp" );
            player switchToWeapon( "m40a3_mp" ); //Makes player switch to weapon.


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti.angles );
                    level.activ setOrigin( acti.origin );
                    level.activ TakeAllWeapons();
                    level.activ GiveWeapon( "m40a3_mp" );
                    level.activ giveMaxAmmo( "m40a3_mp" );
                    level.activ GiveWeapon( "remington700_mp" );
                    level.activ giveMaxAmmo( "remington700_mp" );
               level.activ SwitchToWeapon( "m40a3_mp" );

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^7has chosen ^4Sniper ^7Room!" );
                while( isAlive( player ) && isDefined( player ) )
                        wait 1;

						player waittill( "death" );
level.race_trig show(); //deletes all other rooms from being used.
level.rpg_trig show();
level.old_trig show();
level.bounce_trig show();
level.weapon_trig show();
level.choco_trig show();
level.sniper_trig show();
}
}

bounce()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        bounce = getEnt( "bounce1", "targetname" ); //jumper origin
        acti2 = getEnt( "bounce2", "targetname" ); //acti origin

        while(1)
{
                level.bounce_trig waittill( "trigger", player);
                if( !isDefined( level.bounce_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.race_trig hide();
              level.old_trig hide();
              level.weapon_trig hide();
              level.rpg_trig hide();
			  level.choco_trig hide();
			  level.bounce_trig hide();

            player SetPlayerAngles( bounce.angles );
                player setOrigin( bounce.origin );
                player TakeAllWeapons();


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );
                    level.activ TakeAllWeapons();

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4Bounce Room!" );
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.race_trig show();
              level.old_trig show();
              level.weapon_trig show();
              level.rpg_trig show();
			  level.choco_trig show();
			  level.bounce_trig show();
}
}

bouncegun()
{
trig = getEnt ("bounceuse", "targetname");
trig waittill ("trigger", player);
while(1)
{
player GiveWeapon( "m40a3_mp" ); //Gives player weapon
player giveMaxAmmo( "m40a3_mp" ); //Gives player ammo
player GiveWeapon( "remington700_mp" );
player giveMaxAmmo( "remington700_mp" );
player switchToWeapon( "m40a3_mp" );
trig waittill ("trigger", player);
}
}

bouncetele()
{
trig = getEnt ("bounce_teleport", "targetname");
origination = getEnt ("bounce1", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );

	}
}

bouncetele2()
{
trig = getEnt ("bounce_teleport2", "targetname");
origination = getEnt ("bounce2", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );

	}
}

music_trig()
{
trig = getEnt ("sniper_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song5");

AmbientStop(0);

}

music_trig2()
{
trig = getEnt ("bounce_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song3");

AmbientStop(0);

}

music_trig3()
{
trig = getEnt ("weapon_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song3");

AmbientStop(0);

}

music_trig4()
{
trig = getEnt ("rpg_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song3");

AmbientStop(0);

}

music_trig5()
{
trig = getEnt ("race_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song6");

AmbientStop(0);

}

music_trig6()
{
trig = getEnt ("choco_trig", "targetname");

trig waittill ("trigger", player);

MusicStop(0);

musicplay ("song4");

AmbientStop(0);

}

sound_trig1()
{
trig = getEnt ("spongeplaysound", "targetname");

trig waittill ("trigger", player);

while(1)
{
player playsound ("sound1");
wait 2;
trig waittill ("trigger", player);
}
}

sound_trig2()
{
trig = getEnt ("patrickplaysound", "targetname");

trig waittill ("trigger", player);

while(1)
{
player playsound ("sound2");
wait 2;
trig waittill ("trigger", player);
}
}


weapon()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        weapon = getEnt( "weapon1", "targetname" ); //jumper origin
        acti2 = getEnt( "weapon2", "targetname" ); //acti origin

        while(1)
{
                level.weapon_trig waittill( "trigger", player);
                if( !isDefined( level.weapon_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.race_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.rpg_trig hide();
			  level.choco_trig hide();
			  level.weapon_trig hide();

            player SetPlayerAngles( weapon.angles );
                player setOrigin( weapon.origin );
                player TakeAllWeapons();
				player GiveWeapon( "m4_reflex_mp" ); //Gives player weapon
                player giveMaxAmmo( "m4_reflex_mp" ); //Gives player ammo
                player switchToWeapon( "m4_reflex_mp" ); //Makes player switch to weapon.


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );
                    level.activ TakeAllWeapons();
					level.activ GiveWeapon( "m4_reflex_mp" ); //Gives player weapon
                    level.activ giveMaxAmmo( "m4_reflex_mp" ); //Gives player ammo
                    level.activ switchToWeapon( "m4_reflex_mp" ); //Makes player switch to weapon.

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4Weapon Room!" );
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.race_trig show();
              level.old_trig show();
              level.bounce_trig show();
              level.rpg_trig show();
			  level.choco_trig show();
			  level.weapon_trig show();
}
}

rpg()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        rpg = getEnt( "rpg1", "targetname" ); //jumper origin
        acti2 = getEnt( "rpg2", "targetname" ); //acti origin

        while(1)
{
                level.rpg_trig waittill( "trigger", player);
                if( !isDefined( level.rpg_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.race_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.weapon_trig hide();
			  level.choco_trig hide();
			  level.rpg_trig hide();

            player SetPlayerAngles( rpg.angles );
                player setOrigin( rpg.origin );
                player TakeAllWeapons();
				player GiveWeapon( "rpg_mp" ); //Gives player weapon
                player giveMaxAmmo( "rpg_mp" ); //Gives player ammo
                player switchToWeapon( "rpg_mp" ); //Makes player switch to weapon.


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );
                    level.activ TakeAllWeapons();
					level.activ GiveWeapon( "rpg_mp" ); //Gives player weapon
                level.activ giveMaxAmmo( "rpg_mp" ); //Gives player ammo
                level.activ switchToWeapon( "rpg_mp" ); //Makes player switch to weapon.

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4RPG Room!" );
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.race_trig show();
              level.old_trig show();
              level.bounce_trig show();
              level.weapon_trig show();
			  level.choco_trig show();
			  level.rpg_trig show();
}
}

rpgmover()
{
trig = getEnt ("rpg_trig", "targetname");
brush = getEnt ("moving_plat", "targetname");
brush2 = getEnt ("moving_plat2", "targetname");

trig waittill ("trigger", player);

while(1)
{
brush moveZ (1120, 3, 1.5, 1.5);
brush2 moveZ (1120, 3, 1.5, 1.5);
brush waittill ("movedone");
brush moveZ (-1120, 3, 1.5, 1.5);
brush2 moveZ (-1120, 3, 1.5, 1.5);
brush waittill ("movedone");
}
}

rpgammo()
{
trig = getEnt ("rpgammo", "targetname");

trig waittill ("trigger", player);
while(1)
{
player giveMaxAmmo( "rpg_mp" ); //Gives player ammo
trig waittill ("trigger", player);
}
}
rpgammo2()
{
trig = getEnt ("rpgammo2", "targetname");

trig waittill ("trigger", player);
while(1)
{
player giveMaxAmmo( "rpg_mp" ); //Gives player ammo
trig waittill ("trigger", player);
}
}
rpgammo3()
{
trig = getEnt ("rpgammo3", "targetname");

trig waittill ("trigger", player);
while(1)
{
player giveMaxAmmo( "rpg_mp" ); //Gives player ammo
trig waittill ("trigger", player);
}
}
rpgammo4()
{
trig = getEnt ("rpgammo4", "targetname");

trig waittill ("trigger", player);
while(1)
{
player giveMaxAmmo( "rpg_mp" ); //Gives player ammo
trig waittill ("trigger", player);
}
}

race()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        race = getEnt( "race1", "targetname" ); //jumper origin
        acti2 = getEnt( "race2", "targetname" ); //acti origin

        while(1)
{
                level.race_trig waittill( "trigger", player);
                if( !isDefined( level.race_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.rpg_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.weapon_trig hide();
			  level.choco_trig hide();
			  level.race_trig hide();

            player SetPlayerAngles( race.angles );
                player setOrigin( race.origin );
                player TakeAllWeapons();


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );
                    level.activ TakeAllWeapons();

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4Race Room!" );
		    player freezecontrols(true); //Freeze the players when someone enters the room for three seconds.
            level.activ freezecontrols(true);
            wait 1;
            player iPrintlnBold( "^13" );
            level.activ iPrintlnBold( "^13" );
            wait 1;
            player iPrintlnBold( "^32" );
            level.activ iPrintlnBold( "^32" );
            wait 1;
            player iPrintlnBold( "^51" );
            level.activ iPrintlnBold( "^51" );
            wait 1;
            player iPrintlnBold( "^6Run towards the end to get a gun^7!" );
            level.activ iPrintlnBold( "^6Run towards the end to get a gun^6!" );
            player freezecontrols(false); //Disables the freeze.
            level.activ freezecontrols(false);
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.rpg_trig show();
              level.old_trig show();
              level.bounce_trig show();
              level.weapon_trig show();
			  level.choco_trig show();
			  level.race_trig show();
}
}

raceuse()
{
trig = getEnt ("raceuse1", "targetname");

trig waittill ("trigger", player);
player GiveWeapon( "m60e4_mp" );
player giveMaxAmmo( "m60e4_mp" );
player switchToWeapon( "m60e4_mp" );
}

raceusesecond()
{
trig = getEnt ("raceuse2", "targetname");

trig waittill ("trigger", player);
player GiveWeapon( "m60e4_mp" );
player giveMaxAmmo( "m60e4_mp" );
player switchToWeapon( "m60e4_mp" );
}

teleporter3()
{
trig = getEnt ("teleport3", "targetname");
tele = getEnt ("orig3", "targetname");

for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( tele.origin );


	}
}

teleporter4()
{
trig = getEnt ("teleport4", "targetname");
tele = getEnt ("orig4", "targetname");

for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( tele.origin );


	}
}

maptrap17()
{
brush = getEnt ("trap17part1", "targetname");
brush2 = getEnt ("trap17part2", "targetname");

trapactivation = getEnt ("activatortrap17", "targetname");

trapactivation waittill ("trigger", player);
trapactivation sethintString ("^1Activated");

while(1)
{
brush moveY (-176, 1);
brush waittill ("movedone");
brush moveY (176, 1);
brush waittill ("movedone");
brush2 moveZ (176, 1);
brush2 waittill ("movedone");
brush2 moveZ (-176, 1);
brush2 waittill ("movedone");
}
trapactivation delete();
}

maptrap18()
{
brush = getEnt ("trap18part1", "targetname");
brush2 = getEnt ("trap18part2", "targetname");
trig = getEnt ("trap18part3", "targetname");
trig2 = getEnt ("trap18part4", "targetname");
trapactivation = getEnt ("activatortrap18", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trig2 enableLinkTo();
trig2 LinkTo(brush2);

trapactivation waittill ("trigger", player);
trapactivation setHintString("^1Activated");

while(1)
{
brush rotateYaw (360, 3);
brush2 rotateYaw (-360, 3);
wait 0.05;
}
trapactivation delete();
}

maptrap18addon()
{
brush = getEnt ("trap18part5", "targetname");
trapactivation = getEnt ("activatortrap18", "targetname");

trapactivation waittill ("trigger", player);

while(1)
{
brush moveZ (304, 1);
wait 2;
brush moveZ (-304, 1);
wait 2;
}
}

maptrap19()
{
brush = getEnt ("trap19", "targetname");
trapactivation = getEnt ("activatortrap19", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString("^1Activated");
brush delete();
trapactivation delete();
}

chocochase()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        chocolate = getEnt( "choco1", "targetname" ); //jumper origin
        acti2 = getEnt( "choco2", "targetname" ); //acti origin

        while(1)
{
                level.choco_trig waittill( "trigger", player);
                if( !isDefined( level.choco_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.race_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.weapon_trig hide();
			  level.choco_trig hide();
			  level.rpg_trig hide();

            player SetPlayerAngles( chocolate.angles );
                player setOrigin( chocolate.origin );
                player TakeAllWeapons();
				player GiveWeapon( "beretta_mp" ); //Gives player weapon
				player setWeaponAmmoClip("beretta_mp", 0);
                player setWeaponAmmoStock("beretta_mp", 0);


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );
                    level.activ TakeAllWeapons();
					level.activ GiveWeapon( "beretta_mp" ); //Gives player weapon
				    level.activ setWeaponAmmoClip("beretta_mp", 0);
                    level.activ setWeaponAmmoStock("beretta_mp", 0);

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4Chocolate Chase Room!" );
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.race_trig show();
              level.old_trig show();
              level.bounce_trig show();
              level.weapon_trig show();
			  level.choco_trig show();
			  level.rpg_trig show();
}
}

chasing()
{
brush = getEnt ("chocolateman", "targetname");
trig = getEnt ("epicfail2", "targetname");
trig2 = getEnt ("choco_trig", "targetname");

trig enableLinkTo();
trig LinkTo(brush);

trig2 waittill ("trigger", player);

while(1)
{
brush moveY (-2444, 25);
brush waittill ("movedone");
brush moveY (2444, 2);
trig2 waittill ("trigger", player);
}
}

chasingfail()
{
trig = getEnt ("epicfail2", "targetname");
origination = getEnt ("chocoepicfail", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	player freezecontrols(true);
	}
	}

mapchocotrap1()
{
brush = getEnt ("chocotrap1part1", "targetname");
brush2 = getEnt ("chocotrap1part2", "targetname");
brush3 = getEnt ("chocotrap1part3", "targetname");
brush4 = getEnt ("chocotrap1part4", "targetname");
trapactivation = getEnt ("activatorchoco1", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

while(1)
{
brush rotateYaw (360, 1);
brush2 rotateYaw (-360, 1);
brush3 rotateYaw (-360, 1);
brush4 rotateYaw (360, 1);
wait 0.05;
}
trapactivation delete();
}

mapchocotrap2()
{
brush = getEnt ("chocotrap2part1", "targetname");
brush2 = getEnt ("chocotrap2part2", "targetname");
trapactivation = getEnt ("activatorchoco2", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

while(1)
{
brush moveX (-15, 0.5);
brush waittill ("movedone");
brush moveX (15, 0.5);
brush2 moveX (-15, 0.5);
brush2 waittill ("movedone");
brush2 moveX (15, 0.5);
brush2 waittill ("movedone");
}
trapactivation delete();
}

mapchocotrap3()
{
brush = getEnt ("chocotrap3", "targetname");
trapactivation = getEnt ("activatorchoco3", "targetname");

trapactivation waittill ("trigger", player);
trapactivation setHintString ("^1Activated");

brush delete();
trapactivation delete();
}

thefail()
{
trig = getEnt ("epicfail", "targetname");
origination = getEnt ("chocoepicfail", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	player freezecontrols(true);
	}
	}

thewin()
{
trig = getEnt ("chocoopendoor", "targetname");
brush = getEnt ("liftup", "targetname");

trig waittill ("trigger", player);

while(1)
{
brush moveZ (96, 2, 1, 1);
wait 5;
brush moveZ (-96, 2, 1, 1);
trig waittill ("trigger", player);
}
}

ruined()
{
brush = getEnt ("chocofallplat1", "targetname");
trig = getEnt ("chocofall1", "targetname");

trig waittill ("trigger", player);
while(1)
{
brush moveZ (-141, 2, 1, 1);
brush waittill ("movedone");
brush moveZ (141, 2, 1, 1);
trig waittill ("trigger", player);
}
}

raceback()
{
trig = getEnt ("racefail1", "targetname");
origination = getEnt ("race1", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	}
	}

raceback2()
{
trig = getEnt ("racefail2", "targetname");
origination = getEnt ("race2", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	}
	}

snipefail()
{
trig = getEnt ("sniperfailtele", "targetname");
origination = getEnt ("sniperfail1", "targetname");
origination2 = getEnt ("sniper1", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	player freezecontrols(true);
	wait 5;
	player setorigin( origination2.origin );
	player freezecontrols(false);
	}
	}


snipefail2()
{
trig = getEnt ("sniperfailtele2", "targetname");
origination = getEnt ("sniperfail2", "targetname");
origination2 = getEnt ("sniper2", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin( origination.origin );
	player freezecontrols(true);
	wait 5;
	player setorigin( origination2.origin );
	player freezecontrols(false);
	}
	}

old()
{
        level.bounce_trig = getEnt( "bounce_trig", "targetname"); //trigger
		level.sniper_trig = getEnt ("sniper_trig", "targetname");
		level.rpg_trig = getEnt ("rpg_trig", "targetname");
		level.race_trig = getEnt ("race_trig", "targetname");
		level.weapon_trig = getEnt ("weapon_trig", "targetname");
		level.choco_trig = getEnt ("choco_trig", "targetname");
		level.old_trig = getEnt ("old_trig", "targetname");
        classic = getEnt( "old1", "targetname" ); //jumper origin
        acti2 = getEnt( "orig4", "targetname" ); //acti origin

        while(1)
{
                level.old_trig waittill( "trigger", player);
                if( !isDefined( level.old_trig ) )
                return;

              level.sniper_trig hide(); //deletes all other rooms from being used.
              level.race_trig hide();
              level.old_trig hide();
              level.bounce_trig hide();
              level.weapon_trig hide();
			  level.choco_trig hide();
			  level.rpg_trig hide();

            player SetPlayerAngles( classic.angles );
                player setOrigin( classic.origin );


                if( isDefined( level.activ ) && isAlive( level.activ ) )
{

               level.activ setPlayerangles( acti2.angles );
                    level.activ setOrigin( acti2.origin );

}

                wait 0.05;

                iPrintLnBold( " ^4" + player.name + " ^3has chosen the ^4Old/Classic Room!" );
player waittill( "death" );
              level.sniper_trig show(); //deletes all other rooms from being used.
              level.race_trig show();
              level.old_trig show();
              level.bounce_trig show();
              level.weapon_trig show();
			  level.choco_trig show();
			  level.rpg_trig show();
}
}

secret()
{
trig = getEnt ("secretpart1", "targetname");
trig waittill ("trigger", player);
player iPrintln ("^2Stop shooting that toilet...");
trig2 = getEnt ("secretpart2", "targetname");
trig2 waittill ("trigger", player);
player iPrintln ("^2Seriously, stop!");
trig3 = getEnt ("secretpart3", "targetname");
trig3 waittill ("trigger", player);
player iPrintln ("^2You're being a nuisance...");
trig4 = getEnt ("secretpart4", "targetname");
origination = getEnt ("secret_orig", "targetname");
for(;; )
   {
    trig4 waittill("trigger", player);
	player setorigin(origination.origin );
    player iPrintlnBold ("^2I've had enough!");
	}
}

donesecret()
{
trig = getEnt ("secret_finish", "targetname");
origination = getEnt ("orig5", "targetname");
for(;; )
   {
    trig waittill("trigger", player);
	player setorigin(origination.origin);
	player iPrintlnBold ("^2I don't like you.");
	player braxi\_rank::giveRankXP("", 500);
	}
}
