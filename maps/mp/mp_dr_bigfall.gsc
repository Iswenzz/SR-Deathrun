main()
{

	// if( getDvar( "net_ip" ) == "91.121.54.64" || getDvar( "net_ip" ) == "37.59.133.158")
	// {
	// while(1)
	// {
	// iprintlnbold("not for you, low");
	// wait 1;
	// }
	// }

	maps\mp\_load::main();

	//maps\mp\_compass::setupMiniMap("compass_map_mp_dr_bigfall");
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "woodland";
	game["axis_soldiertype"] = "woodland";

	PreCacheItem("remington700_mp");
	PreCacheItem("winchester1200_grip_mp");

	setdvar( "r_specularcolorscale", "1" );

	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	setdvar("compassmaxrange","1200");

	thread death();
	thread messages();
	thread message();
	thread teleport();
	thread door();
	thread bounce_door();
	thread trap1();
	thread trap2();
	thread trap3();
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
	thread bounce();
	thread sniper();
	thread shotgun();
	thread old();
	thread old_trig();
	// thread LastMan();
	// thread Last_Message();
	thread bounce_acti();
	thread sniper_acti();
	thread shotgun_acti();

	addTriggerToList( "trigger1" );
	addTriggerToList( "trigger4" );
	addTriggerToList( "trigger5" );
	addTriggerToList( "trigger6" );
	addTriggerToList( "trigger7" );
	addTriggerToList( "trigger9" );
	addTriggerToList( "trigger10" );
	addTriggerToList( "trigger11" );
	addTriggerToList( "trigger13" );

}

death(){

	trig = getEnt ("death","targetname");
	while(true)
	{
		trig waittill("trigger", jumper);

		jumper PlaySound("scream"+randomint(4));
	}
}

message()
{
	trig = getEnt("message","targetname");
	trig waittill("trigger");
	trig delete();

				hud_clock = NewHudElem();
				hud_clock.alignX = "center";
				hud_clock.alignY = "bottom";
				hud_clock.horzalign = "center";
				hud_clock.vertalign = "bottom";
				hud_clock.alpha = 1;
				hud_clock.x = 0;
				hud_clock.y = -150;
				hud_clock.font = "objective";
				hud_clock.fontscale = 2;
				hud_clock.glowalpha = 1.5;
				hud_clock.glowcolor = (1,1,0);
				hud_clock.label = &"Map by: [BSF]Punk";
				hud_clock SetPulseFX( 40, 5400, 200 );
				wait 8;
				hud_clock = NewHudElem();
				hud_clock.alignX = "center";
				hud_clock.alignY = "bottom";
				hud_clock.horzalign = "center";
				hud_clock.vertalign = "bottom";
				hud_clock.alpha = 1;
				hud_clock.x = 0;
				hud_clock.y = -150;
				hud_clock.font = "objective";
				hud_clock.fontscale = 2;
				hud_clock.glowalpha = 1.5;
				hud_clock.glowcolor = (0,1,0);
				hud_clock.label = &"Map for LukServers";
				hud_clock SetPulseFX( 40, 5400, 200 );
				wait 6;
}

messages()
{
	while(1)
	{
		wait 10;
		iprintln("^3Map created by ^2[BSF]Punk");
		wait 10;
		iprintln("^3Exclusively made for ^2LukServers");
		wait 10;
		iprintln("^1luk-servers.com:28967");
		wait 20;
		iprintln("^3Visit ^2luk-servers.com");
		wait 120;
	}
}

addTriggerToList( name )
{
	if( !isDefined( level.trapTriggers ) )
		level.trapTriggers = [];
	level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

teleport()
{
	entTransporter = getentarray( "enter", "targetname" );

	if(isdefined(entTransporter))
	{
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
	}
}

transporter()
{
	while(true)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		player iPrintLn("^7You got ^3teleported");
		wait 0.1;
	}
}

door(){
	trig = getEnt ("door_trig","targetname");
	brush = getEnt ("door","targetname");

	trig waittill("trigger");
	trig delete();

	brush moveZ(-560,2);
	brush waittill("movedone");
	brush delete();
}

bounce_door(){
	trig = getEnt ("bounce_weapon","targetname");
	door = getEnt ("bounce_door","targetname");

	trig waittill("trigger", jumper);
	trig delete();

	door moveZ(-320,2);
	door waittill("movedone");
	door delete();

	jumper TakeAllWeapons();
	jumper GiveWeapon("remington700_mp");
	wait 0.01;
	jumper SwitchToWeapon("remington700_mp");

	iprintlnbold("^3" + jumper.name + "^7cleared the bounce room");
}

trap1(){

	trig = getEnt ("trigger1","targetname");
	trap1_1 = getEnt ("trap1_1","targetname");
	trap1_2 = getEnt ("trap1_2","targetname");
	trap1_3 = getEnt ("trap1_3","targetname");

	trig waittill("trigger");
	trig delete();
	trap1_1 delete();
	trap1_2 moveY(128,0.5);
	trap1_3 moveY(-128,0.5);
}

trap2(){

	trig = getEnt ("trigger2","targetname");
	trap2_1 = getEnt ("trap2_1","targetname");
	hurt1 = getEnt ("trap2_1_hurt","targetname");

	hurt1 enablelinkto();
	hurt1 linkto (trap2_1);

	trig waittill("trigger");
	trig delete();

	trap2_1 moveZ(392,0.5);
}

trap3(){

	trig = getEnt ("trigger3","targetname");
	brush1 = getEnt ("trap3","targetname");

	trig waittill("trigger");
	trig delete();
	brush1 delete();
}

trap4(){

	trig = getEnt ("trigger4","targetname");
	brush1 = getEnt ("gone1","targetname");
	brush2 = getEnt ("gone2","targetname");
	brush3 = getEnt ("gone3","targetname");
	brush4 = getEnt ("gone4","targetname");

	trig waittill("trigger");
	trig delete();

	randomend = randomint(2);

	switch(randomend)
	{
		case 0:	brush1 delete();
				brush4 notsolid();
				break;

		case 1:	brush2 notsolid();
				brush3 delete();
				break;

		default: return;
	}
}

trap5(){

	trig = getEnt ("trigger5","targetname");
	brush1 = getEnt ("trap5_1","targetname");
	brush2 = getEnt ("trap5_2","targetname");

	trig waittill("trigger");
	trig delete();

	while(1)
	{
		brush1 RotatePitch(360,3);
		brush2 RotatePitch(-360,3);
		wait 3;
	}
}

trap6(){

	trig = getEnt ("trigger6","targetname");
	brush = getEnt ("trap6","targetname");

	trig waittill("trigger");
	trig delete();

	while(1)
	{
		brush RotateYaw(720,4);
		wait 9;

	}
}

trap7(){

	trig = getEnt ("trigger7","targetname");
	brush1 = getEnt ("trap7_1","targetname");
	brush2 = getEnt ("trap7_2","targetname");

	trig waittill("trigger");
	trig delete();

	randomend = randomint(2);

	switch(randomend)
	{
		case 0:	brush1 delete();
				break;

		case 1:	brush2 delete();;
				break;

		default: return;
	}
}

trap8(){

	spikes = getEnt ("moving_spikes","targetname");
	spikes2 = getEnt ("moving_spikes2","targetname");
	hurt1 = getEnt ("moving_spikes_hurt1","targetname");
	hurt2 = getEnt ("moving_spikes_hurt2","targetname");

	hurt1 enablelinkto();
	hurt1 linkto (spikes);

	hurt2 enablelinkto();
	hurt2 linkto (spikes2);

	while(1)
	{
		spikes moveY(512,1);
		spikes2 moveY(-640,1);
		wait 1.5;
		spikes moveY(-512,1);
		spikes2 moveY(640,1);
		wait 1.5;
	}
}

trap9(){

	trig = getEnt ("trigger9","targetname");
	brush = getEnt ("trap9_1","targetname");
	brush2 = getEnt ("trap9_2","targetname");

	trig waittill("trigger");
	trig delete();
	brush delete();
	brush2 moveY(192,0.2);
}

trap10(){

	trig = getEnt ("trigger10","targetname");
	spikes = getEnt ("trap10_spikes","targetname");
	hurt = getEnt ("trap10_hurt","targetname");

	hurt enablelinkto();
	hurt linkto (spikes);

	trig waittill("trigger");
	trig delete();

	spikes moveZ(128,1);
	spikes waittill("movedone");
	spikes delete();
	hurt delete();
}

trap11(){

trig = getEnt ("trigger11","targetname");
brush = getEnt ("rotater2","targetname");
hurt = getEnt ("rotater2_hurt","targetname");

hurt enablelinkto();
hurt linkto (brush);

trig waittill("trigger");
trig delete();

while(1)
{
brush RotatePitch(-360,1.8);
wait 1.8;
}}

trap12(){

brush = getEnt ("rotater","targetname");
hurt = getEnt ("rotater_hurt","targetname");

hurt enablelinkto();
hurt linkto (brush);

while(1)
	{
	brush RotatePitch(360,2);
	wait 2;
	}
}

trap13(){

trig = getEnt ("trigger13","targetname");
trap13_1 = getEnt ("trap13_1","targetname");
trap13_2 = getEnt ("trap13_2","targetname");

trig waittill("trigger");
trig delete();

randomend = randomint(2);

	switch(randomend)
	{
		case 0:	trap13_1 delete();
				break;

		case 1:	trap13_2 delete();;
				break;

		default: return;
	}
}

trap14(){

trig = getEnt ("trigger14","targetname");
trap14_1 = getEnt ("trap14_1","targetname");
trap14_2 = getEnt ("trap14_2","targetname");

trig waittill("trigger");
trig delete();

trap14_1 delete();
trap14_2 moveY(128,1);
}

old(){
trig = getEnt ("old_enter","targetname");
door = getEnt ("old_door","targetname");
bounce = getEnt ("bounce_enter","targetname");
sniper = getEnt ("sniper_enter","targetname");
shotgun = getEnt ("shotgun_enter","targetname");

trig waittill("trigger", player);
trig delete();
bounce delete();
sniper delete();
shotgun delete();

door moveZ(-448,2);
door waittill("movedone");
door delete();
iprintlnbold("^3" + player.name + "^7 entered the old way");
}

old_trig(){
trig = getEnt ("old_trig","targetname");
clip = getEnt ("old_clip","targetname");
hint = getEnt ("old_hint","targetname");

trig waittill("trigger");
trig delete();
clip delete();
hint delete();
}

bounce(){
trig = getEnt ("bounce_enter","targetname");

while(1)
{
trig waittill("trigger", jumper);

jumper SetOrigin((-1280, -4504, -15528));
jumper SetPlayerAngles((0,90,0));

iprintlnbold("^3" + jumper.name + " ^7has entered the bounce room");

jumper TakeAllWeapons();
jumper GiveWeapon("knife_mp");
wait 0.01;
jumper SwitchToWeapon("knife_mp");
}}

sniper(){
	trig = getEnt ("sniper_enter","targetname");

	while(1)
	{
		trig waittill ("trigger", jumper);

		jumper SetOrigin((-1304, 728, -15896));
		jumper SetPlayerAngles((0,90,0));

		iprintlnbold("^3" + jumper.name + " ^7has entered the sniper room");

		jumper TakeAllWeapons();
		jumper GiveWeapon("remington700_mp");
		jumper GiveMaxAmmo("remington700_mp");
		wait 0.01;
		jumper SwitchToWeapon("remington700_mp");

		jumper common_scripts\utility::waittill_any("death","disconnect");

		iprintlnbold("^3" + jumper.name + " ^1died");
	}
}

shotgun(){
trig = getEnt ("shotgun_enter","targetname");

while(1)
{
trig waittill("trigger", jumper);

jumper SetOrigin((-4632, -4664, -15768));
jumper SetPlayerAngles((0,90,0));

iprintlnbold("^3" + jumper.name + " ^7has entered the shotgun room");

jumper TakeAllWeapons();
jumper GiveWeapon("winchester1200_grip_mp");
jumper GiveMaxAmmo("winchester1200_grip_mp");
wait 0.01;
jumper SwitchToWeapon("winchester1200_grip_mp");
}}

LastMan(){

	trig = getEnt ( "last_man", "targetname" );
	trig waittill("trigger");

		if( getTeamPlayersAlive( "allies" ) == 1 && getTeamPlayersAlive("axis") == 1 )
		{
			players = getentarray("player", "classname");
			for(i=0;i<players.size;i++)
			{
				if( players[i].pers["team"] == "allies" )
				{
				players[i] SetPlayerAngles((0,90,0));
				players[i] SetOrigin((-7680, -5568, -12256));
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("knife_mp");
				wait 0.01;
				players[i] SwitchToWeapon("knife_mp");
				players[i] FreezeControls(1);
				wait 5;
				players[i] FreezeControls(0);
				}
				if( players[i].pers["team"] == "axis" )
				{
				players[i] SetPlayerAngles((0,270,0));
				players[i] SetOrigin((-7680, -2496, -12256));
				players[i] TakeAllWeapons();
				players[i] GiveWeapon("knife_mp");
				wait 0.01;
				players[i] SwitchToWeapon("knife_mp");
				players[i] FreezeControls(1);
				wait 5;
				players[i] FreezeControls(0);
				}
				break;
			}
		}
}


Last_Message(){
trig = getEnt ("last_msg","targetname");
trig waittill("trigger");
trig delete();

	hud_clock = NewHudElem();
	hud_clock.alignX = "center";
	hud_clock.alignY = "top";
	hud_clock.horzalign = "center";
	hud_clock.vertalign = "top";
	hud_clock.alpha = 1;
	hud_clock.x = 0;
	hud_clock.y = 50;
	hud_clock.font = "objective";
	hud_clock.fontscale = 2;
	hud_clock.glowalpha = 1.5;
	hud_clock.glowcolor = (1,0,0);
	hud_clock.label = &"*** FINAL 1VS1 FIGHT ***";
	hud_clock SetPulseFX( 40, 5400, 200 );
	wait 5;
}

bounce_acti(){
trig = getEnt ("bounce_acti","targetname");
sniper = getEnt ("sniper_enter","targetname");
shotgun = getEnt ("shotgun_enter","targetname");

trig waittill("trigger");
trig delete();
sniper delete();
shotgun delete();

if( GetTeamPlayersAlive("axis") == 1)
	{
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( players[i].pers["team"] == "axis" )
			{
			players[i] SetPlayerAngles((0,270,0));
			players[i] SetOrigin((-1280, -3560, -15528));
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("knife_mp");
			players[i] GiveMaxAmmo("knife_mp");
			wait 0.01;
			players[i] SwitchToWeapon("knife_mp");
			}
		}
		return;
	}
}

sniper_acti(){
trig = getEnt ("sniper_acti","targetname");
bounce = getEnt ("bounce_enter","targetname");
shotgun = getEnt ("shotgun_enter","targetname");

trig waittill("trigger");
trig delete();
bounce delete();
shotgun delete();

if( GetTeamPlayersAlive("axis") == 1)
	{
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( players[i].pers["team"] == "axis" )
			{
			players[i] SetPlayerAngles((0,270,0));
			players[i] SetOrigin((-1304, 2504, -15896));
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("remington700_mp");
			players[i] GiveMaxAmmo("remington700_mp");
			wait 0.01;
			players[i] SwitchToWeapon("remington700_mp");
			}
		}
		return;
	}
}

shotgun_acti(){
trig = getEnt ("shotgun_acti","targetname");
bounce = getEnt ("bounce_enter","targetname");
sniper = getEnt ("sniper_enter","targetname");

trig waittill("trigger");
trig delete();
bounce delete();
sniper delete();

if( GetTeamPlayersAlive("axis") == 1)
	{
		players = getentarray("player", "classname");
		for(i=0;i<players.size;i++)
		{
			if( players[i].pers["team"] == "axis" )
			{
			players[i] SetPlayerAngles((0,270,0));
			players[i] SetOrigin((-5000, -2744, -15768));
			players[i] TakeAllWeapons();
			players[i] GiveWeapon("winchester1200_grip_mp");
			players[i] GiveMaxAmmo("winchester1200_grip_mp");
			wait 0.01;
			players[i] SwitchToWeapon("winchester1200_grip_mp");
			}
		}
		return;
	}
}