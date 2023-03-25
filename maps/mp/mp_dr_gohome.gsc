///////////////////////////////////////////////////////////////////////
//Made by:Dr. Uzi           |Xfire:undefinedno1                     //
//Edit with Permission!     |Traps:12 (1 anytime active)           //
//ePiC Clan!!!              |Yep, working XP giving4trapactivation//
//Too many people, too short place to say my thanks :S           //
//Some cool Sir: Viking, XfearZ, Wingzor, Rednose, and...       //
/////////////////////////////////////////////////////////////////
main()
{
	maps\mp\_load::main();
	maps\mp\_breakglass::main();
	maps\mp\_teleport::main();
	
	thread starts();
	thread traps();
	thread teleports();
	thread secrets();
	thread addtrapstofreerun();
}
starts()
{//they're the startings
	thread mapstart();
	thread actistart();
}
mapstart()
{
	obj = getent("mapstart","targetname");
	wait 9;
	obj movez(-250, 3);
	obj waittill("movedone");
	obj delete();
}
actistart()
{
	obj = getent("actistart","targetname");
	trig = getent("starter", "targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	obj movey(250, 1);
	who iprintlnbold ("^1Take no prisoners comrades!");
}
traps()
{
	//Haha, the traps!
	thread trap1();
	thread door();
	thread trap2();
	thread nemallmeg();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread traphide();
	thread trap10();
	thread kell();
	thread leesik();
	thread titok();
	thread fake();
}
trap1()
{
	trig = getent("trap1acti", "targetname");
	obj1 = getent("trap1_1","targetname");
	obj2 = getent("trap1_2","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 1 ^2Activated");
	while(1)
	{
    	obj1 movez(-70,3);
	obj2 movez(70, 3);
	obj1 waittill("movedone");
	obj1 movez(70,3);
	obj2 movez(-70, 3);
	obj1 waittill("movedone");
	obj1 rotateYaw(360,10);
	obj2 rotateYaw(360,10);
	obj1 waittill("movedone");
	}
}

door()
{
	trig = getent("trap2dooropen", "targetname");
	obj = getent("trap2door","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	obj movex(-240, 3);
	obj delete();
	self iprintln ("^1Take no prisoners comrades!");
}

trap2()
{
	trig = getent("trap2acti", "targetname");
	obj = getent("trap2","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 2 ^2Activated");
	obj movex(630, 1);
	obj waittill("movedone");
	obj movex(630, 4);
	wait(5);
}

nemallmeg()
{
	obj = getent("izegmozog","targetname");
	while(1)
	{
	obj movey(-260, 1);
	obj waittill("movedone");
	wait 0.5;
	obj movey(260, 1);
	obj waittill("movedone");
	wait 0.5;
	}
}

trap3()
{
	trig = getent("trap3acti", "targetname");
	obj1 = getent("trap3_1","targetname");
	obj2 = getent("trap3_2","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 3 ^2Activated");
	obj1 movex(-442, 3);
	obj2 movex(442, 3);
	obj1 waittill("movedone");
	obj1 movex(442, 5);
	obj2 movex(-442, 5);
	wait(5);
}

trap4()
{
	trig = getent("trap4acti", "targetname");
	obj11 = getent("trap4_11","targetname");
	obj12 = getent("trap4_12","targetname");
	obj13 = getent("trap4_13","targetname");
	obj14 = getent("trap4_14","targetname");
	obj21 = getent("trap4_21","targetname");
	obj22 = getent("trap4_22","targetname");
	obj23 = getent("trap4_23","targetname");
	obj24 = getent("trap4_24","targetname");
	trig waittill( "trigger", who );
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 4 ^2Activated");
	obj11 movex(602, 2);
	obj12 movex(602, 2);
	obj13 movex(602, 2);
	obj14 movex(602, 2);
	obj21 movex(-602, 2);
	obj22 movex(-602, 2);
	obj23 movex(-602, 2);
	obj24 movex(-602, 2);
	obj11 waittill("movedone");
	wait(5);

}

trap5()  //xfearz, first I think that didn't work LOL TY m8!
{
	trig = getent("trap5acti", "targetname");
	obj1 = getent("trap5","targetname");
	hurt = getent("hurt","targetname");
   	hurt enablelinkto();
    	hurt linkto (obj1);
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 5 ^2Activated");
	obj1 movez(300,2);
	obj1 waittill("movedone");
	obj1 delete();
	wait(5);
}

trap6()
{
	trig = getent("trap6acti", "targetname");
	obj1 = getent("trap6_1","targetname");
	obj2 = getent("trap6_2","targetname");
	obj3 = getent("trap6_3","targetname");
	obj4 = getent("trap6_4","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 6 ^2Activated");
	while(1)
	{
		obj1 rotateYaw(360,5);
		obj2 rotateYaw(360,5);
		obj3 rotateYaw(360,5);
		obj4 rotateYaw(360,5);
		obj1 waittill("rotatedone");
		wait 0.1;
	}
}
trap7()
{
	trig = getent("trap7acti", "targetname");
	obj1 = getent("trap7_1","targetname");
	obj2 = getent("trap7_2","targetname");
	obj3 = getent("trap7_3","targetname");
	obj4 = getent("trap7_4","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 7 ^2Activated");
	while(1)
	{
		obj1 rotateYaw(360,10);
		obj2 rotateYaw(360,10);
		obj3 rotateYaw(360,10);
		obj4 rotateYaw(360,10);
		obj1 waittill("rotatedone");
		wait 5;
		obj1 rotateYaw(360,10);
		obj2 rotateYaw(360,10);
		obj3 rotateYaw(360,10);
		obj4 rotateYaw(360,10);
		obj1 waittill("rotatedone");
		wait 2;
		obj1 rotateYaw(360,10);
		obj2 rotateYaw(360,10);
		obj3 rotateYaw(360,10);
		obj4 rotateYaw(360,10);
		obj1 waittill("rotatedone");
		wait 5;
	}
}
trap8()
{
	trig = getent("trap8acti", "targetname");
	obj1 = getent("trap8","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 9 ^2Activated");
	while(1)
	{
		obj1 rotatePitch (360 , 2 );
		obj1 waittill("rotatedone");
		wait 2;
	}
}
trap9()
{
	trig = getent("trap9acti", "targetname");
	obj1 = getent("trap9","targetname");
	hurt = getent("trap9_hurt","targetname");
    	hurt enablelinkto();
    	hurt linkto (obj1);
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 10 ^2Activated");
	obj1 movez(-1600, 1);
}
traphide()
{
	trig = getent("trap11acti", "targetname");
	obj1 = getent("trap11_1","targetname");
	obj2 = getent("trap11_2","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	iprintln ("^1Trap 8 ^2Activated");
	obj1 movez(-200,1);
	obj2 movez(-200,1);
	wait 1.5;
	obj1 movez(200,1);
	obj2 movez(200,1);
}
trap10()
{
	trig = getent("trap10acti", "targetname");
	obj1 = getent("trap10","targetname");
	obj2 = getent("trap10_1","targetname");
	obj3 = getent("trap10_2","targetname");
	trig waittill( "trigger", who ); 
	obj1 delete();
	wait 0.2;
	iprintln ("^1Trap 11 ^2Activated");
	obj2 delete();
	wait 0.2;
	obj3 delete();
}
kell()
{
	trig = getent("lol", "targetname");
	obj1 = getent("mozog1","targetname");
	obj2 = getent("mozog2","targetname");
	obj3 = getent("mozog3","targetname");
	obj4 = getent("mozog4","targetname");
	obj5 = getent("mozog5","targetname");
	obj6 = getent("mozog6","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	while(1)
	{
		wait 1.5;
		obj1 movez(200,1);
		obj2 movez(200,1);
		obj3 movez(200,1);
		obj4 movez(200,1);
		obj5 movez(200,1);
		obj6 movez(200,1);
		wait 2.5;
		obj1 movez(-200,1);
		obj2 movez(-200,1);
		obj3 movez(-200,1);
		obj4 movez(-200,1);
		obj5 movez(-200,1);
		obj6 movez(-200,1);
		wait 0.5;
	}
}
leesik()
{
	trig = getent("letrig", "targetname");
	obj1 = getent("open2acti","targetname");
	trig waittill( "trigger", who ); 
	wait 0.1;
	trig delete();
	wait 0.1;
	obj1 delete();
	wait(5);
}
fake()  //Heh, ez megöli a n00b jumpereket ^^
{
	trig = getent("noob","targetname");
	killwater = getent("noobwater","targetname");
	umad = getent("noobend","targetname");
	trig waittill( "trigger", who );
	trig delete();
	noti = SpawnStruct();
	noti.titleText = "^1Oh, we found a noob!";
	noti.notifyText = "^3I finish HIM!!!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	
}
teleports()
{//The teleport part
    thread portal4part2();
    thread UziTrigger();
    thread SniperTrigger();
    thread KnifeTrigger();
    thread JumpTrigger();
}
portal4part2() //MR-X VERY GOOD SCRIPT! xd
{
	 seta = getent ("seta","targetname");
	 sets = getent ("seta.target","targetname");
	 
	 while (1)
		{
		seta waittill ("trigger",Mrx); // ;D
		Mrx setorigin (sets.origin , 0.5);
		Mrx iprintlnbold ("^1Victory is near!");
		wait 0.5 ;
		}
}
UziTrigger()  //XfearZ, thanks again ^^
{
    wait 2;
    players = getentarray("player", "classname");
	trig = getEnt ("teletrigger", "targetname");
	trig1 = getEnt ("knifetrigger", "targetname");
	trig2 = getEnt ("jumptrigger", "targetname");
	trig3 = getEnt ("sniptrigger", "targetname");
    jumperteleported = false;
    activatorteleported = false;
	
	trig waittill ("trigger");
	trig delete();

    while(!jumperteleported && !activatorteleported)
    {
    wait 1;
        jumpersalive = GetTeamPlayersAlive("allies");
        activatorsalive = GetTeamPlayersAlive("axis");

        {
		iprintlnbold("^1Free for ^2Uzi ^7!");
		iprintlnbold("^2Let's do this^7!");	
		
            for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(players[i].pers["team"] == "allies" && isAlive(players[i]))
                {
                    teleporter_jumpers = getent("uzi_jumpers", "targetname");
                    players[i] SetOrigin(teleporter_jumpers.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("uzi_mp");
					players[i] setWeaponAmmoClip( "uzi_mp", 200 );
					players[i] setweaponammostock( "uzi_mp", 200 );
					wait 0.05;
					players[i] SwitchToWeapon("uzi_mp");
                    jumperteleported = true;
                }
                else if(players[i].pers["team"] == "axis" && isAlive(players[i]))
                {
                    teleporter_activators = getent("uzi_activators", "targetname");
                    players[i] SetOrigin(teleporter_activators.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("uzi_mp");
					players[i] setWeaponAmmoClip( "uzi_mp", 200 );
					players[i] setweaponammostock( "uzi_mp", 200 );
					wait 0.05;
					players[i] SwitchToWeapon("uzi_mp");
                    activatorteleported = true;
                }
            }
        }
    wait 0.1;
    }
}
SniperTrigger()
{
    wait 2;
    players = getentarray("player", "classname");
	trig = getEnt ("sniptrigger", "targetname");
    jumperteleported = false;
    activatorteleported = false;
	
	trig waittill ("trigger");
	trig delete();

    while(!jumperteleported && !activatorteleported)
    {
    wait 1;
        jumpersalive = GetTeamPlayersAlive("allies");
        activatorsalive = GetTeamPlayersAlive("axis");

        {
		iprintlnbold("^1Sniper ^2Fighter ^7!");
		iprintlnbold("^2Let's do this^7!");	
		
            for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(players[i].pers["team"] == "allies" && isAlive(players[i]))
                {
                    teleporter_jumpers = getent("sniper_jumpers", "targetname");
                    players[i] SetOrigin(teleporter_jumpers.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("remington700_mp");
					players[i] setWeaponAmmoClip( "remington700_mp", 20 );
					players[i] setweaponammostock( "remington700_mp", 20 );
					wait 0.05;
					players[i] SwitchToWeapon("remington700_mp");
                    jumperteleported = true;
                }
                else if(players[i].pers["team"] == "axis" && isAlive(players[i]))
                {
                    teleporter_activators = getent("sniper_activators", "targetname");
                    players[i] SetOrigin(teleporter_activators.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("remington700_mp");
					players[i] setWeaponAmmoClip( "remington700_mp", 20 );
					players[i] setweaponammostock( "remington700_mp", 20 );
					wait 0.05;
					players[i] SwitchToWeapon("remington700_mp");
                    activatorteleported = true;
                }
            }
        }
    wait 0.1;
    }
}
KnifeTrigger()
{
    wait 2;
    players = getentarray("player", "classname");
	trig = getEnt ("knifetrigger", "targetname");
    jumperteleported = false;
    activatorteleported = false;
	
	trig waittill ("trigger");
	trig delete();

    while(!jumperteleported && !activatorteleported)
    {
    wait 1;
        jumpersalive = GetTeamPlayersAlive("allies");
        activatorsalive = GetTeamPlayersAlive("axis");

        {
		iprintlnbold("^1Knife ^2time^7!");
		iprintlnbold("^2Let's do this^7!");	
		
            for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(players[i].pers["team"] == "allies" && isAlive(players[i]))
                {
                    teleporter_jumpers = getent("teleporter_jumpers", "targetname");
                    players[i] SetOrigin(teleporter_jumpers.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("deserteagle_mp");
					players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
					players[i] setweaponammostock( "deserteagle_mp", 0 );
					wait 0.05;
					players[i] SwitchToWeapon("deserteagle_mp");
                    jumperteleported = true;
                }
                else if(players[i].pers["team"] == "axis" && isAlive(players[i]))
                {
                    teleporter_activators = getent("teleporter_activators", "targetname");
                    players[i] SetOrigin(teleporter_activators.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("deserteagle_mp");
					players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
					players[i] setweaponammostock( "deserteagle_mp", 0 );
					wait 0.05;
					players[i] SwitchToWeapon("deserteagle_mp");
                    activatorteleported = true;
                }
            }
        }
    wait 0.1;
    }
}
JumpTrigger()
{
    wait 2;
    players = getentarray("player", "classname");
	trig = getEnt ("jumptrigger", "targetname");
    jumperteleported = false;
    activatorteleported = false;
	
	trig waittill ("trigger");
	trig delete();

    while(!jumperteleported && !activatorteleported)
    {
    wait 1;
        jumpersalive = GetTeamPlayersAlive("allies");
        activatorsalive = GetTeamPlayersAlive("axis");

        {
		iprintlnbold("^1Jumper ^2Master ^7!");
		iprintlnbold("^2Let's do this^7!");	
		
            for(i=0;i<=players.size;i++)
            {
            wait 0.1;
                if(players[i].pers["team"] == "allies" && isAlive(players[i]))
                {
                    teleporter_jumpers = getent("jump_jumpers", "targetname");
                    players[i] SetOrigin(teleporter_jumpers.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("deserteagle_mp");
					players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
					players[i] setweaponammostock( "deserteagle_mp", 0 );
					wait 0.05;
					players[i] SwitchToWeapon("deserteagle_mp");
                    jumperteleported = true;
                }
                else if(players[i].pers["team"] == "axis" && isAlive(players[i]))
                {
                    teleporter_activators = getent("jump_activators", "targetname");
                    players[i] SetOrigin(teleporter_activators.origin);
					players[i] TakeAllWeapons();
					players[i] GiveWeapon("deserteagle_mp");
					players[i] setWeaponAmmoClip( "deserteagle_mp", 0 );
					players[i] setweaponammostock( "deserteagle_mp", 0 );
					wait 0.05;
					players[i] SwitchToWeapon("deserteagle_mp");
                    activatorteleported = true;
                }
            }
        }
    wait 0.1;
    }
}
addTriggerToList( name )
{
   if( !isDefined( level.trapTriggers ) )
      level.trapTriggers = [];
   level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
secrets()
{
thread titok();
thread titok2();
}
titok()
{
	trig = getent("titoknyito","targetname");
	obj = getent("titkosajto","targetname");
	troll = getent("eznemkell","targetname");
	trig waittill( "trigger", who );
	trig delete();
	noti = SpawnStruct();
	noti.titleText = "^1Secret has been found!";
	noti.notifyText = "^3Go to the ^8WC ^3and collect the UZI!!!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	troll delete();
	obj delete();
	wait 1 ;
	
}
titok2()
{
	trig = getent("secretdead","targetname");
	obj = getent("secretdead1","targetname");
	trig waittill( "trigger", who );
	trig delete();
	noti = SpawnStruct();
	noti.titleText = "^1Secret has been found!";
	noti.notifyText = "^3What is ^8THIS ^3place?!";
	noti.duration = 5;
	noti.glowcolor = (1,0,0);
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
		players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	wait 5;
	iprintlnbold("^2It's a TRAP, OMFG, ^1RUN RUN RUN^7!!");
	wait 3;
	obj delete();
	wait 1;
	
}
addtrapstofreerun()
{
	addTriggerToList("trap1acti");
	addTriggerToList("trap2acti");
	addTriggerToList("trap3acti");
	addTriggerToList("trap4acti");
	addTriggerToList("trap5acti");
	addTriggerToList("trap6acti");
	addTriggerToList("trap7acti");
	addTriggerToList("trap8acti");
	addTriggerToList("trap9acti");
	addTriggerToList("trap10acti");
	addTriggerToList("trap11acti");
}
