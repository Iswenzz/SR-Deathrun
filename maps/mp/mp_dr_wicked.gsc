main()
{
    maps\mp\_load::main();
	
	level.wall_explosion_fx = LoadFX("explosions/boom");
	level.end_boom_fx = LoadFX("explosions/wall_explosion_pm_a");
	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	
	thread acti();
	thread acti2();
	thread platform();
	thread trap1a();
	thread trap1b();
	thread trap2_rotating();
	thread trap3_pushers();
	thread jump();
	thread jump2();
	thread trap4();
	thread trap5();
	thread trap6();
	thread fx();
	thread credits();
	thread acti_jump();
	thread trap7();
	thread trap8();
	thread secret_unlock();
	thread secret_back();
	thread trap9();
	thread platforms2();
	thread end_boom();
	thread Jumper_move_end();
	
	ambientPlay("scary");
                game["allies"] = "marines";
               game["axis"] = "opfor";
               game["attackers"] = "axis";
               game["defenders"] = "allies";
               game["allies_soldiertype"] = "desert";
               game["axis_soldiertype"] = "desert";

    
    setdvar( "r_specularcolorscale", "1" );
    
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
    setdvar("compassmaxrange","1800");
	setExpFog(100, 1000, 0.4, 0.425, 0.44, 0.0);
}


secret_unlock()
{
unlock = getEnt ("secret_unlock", "targetname");

unlock waittill ("trigger");

thread secret_enter();
}
secret_enter()
{
	tele = getEnt ( "secret_enter", "targetname" );
	target = getEnt ("secret2", "targetname");
	for(;;)
{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have entered the secret room, Enjoy^1!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
}
}
secret_back()
{
	tele = getEnt ( "secret_back", "targetname" );
	target = getEnt ("air3", "targetname");
	glow = getEnt ("secretglow", "targetname");
	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));
	for(;;)
{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported back!");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
}
}

credits()
{
wait(12);
thread drawInformation( 800, 0.8, 1, "Map made by AoD'DazE" );
wait(4);
thread drawInformation( 800, 0.8, 1, "Visit us: AoD-Gaming.com" );
wait(4);
}

drawInformation( start_offset, movetime, mult, text )
{
	start_offset *= mult;
	hud = new_ending_hud( "center", 0.1, start_offset, 90 );
	hud setText( text );
	hud moveOverTime( movetime );
	hud.x = 0;
	wait( movetime );
	wait( 3 );
	hud moveOverTime( movetime );
	hud.x = start_offset * -1;

	wait movetime;
	hud destroy();
}

new_ending_hud( align, fade_in_time, x_off, y_off )
{
	hud = newHudElem();
    hud.foreground = true;
	hud.x = x_off;
	hud.y = y_off;
	hud.alignX = align;
	hud.alignY = "middle";
	hud.horzAlign = align;
	hud.vertAlign = "middle";

 	hud.fontScale = 3;

	hud.color = (0.8, 1.0, 0.8);
	hud.font = "objective";
	hud.glowColor = (0.3, 0.6, 0.3);
	hud.glowAlpha = 1;

	hud.alpha = 0;
	hud fadeovertime( fade_in_time );
	hud.alpha = 1;
	hud.hidewheninmenu = true;
	hud.sort = 10;
	return hud;
}


acti()
{
	tele = getEnt ( "acti_enter", "targetname" );
	target = getEnt ("acti_gohere", "targetname");
	glow = getEnt ("glow2", "targetname");
	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));
	for(;;)
	{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		
}
}

acti2()
{
	tele = getEnt ( "acti_tele2", "targetname" );
	target = getEnt ("acti_gohere2", "targetname");
	glow = getEnt ("acti_teleglow2", "targetname");
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));
	for(;;)
	{
		tele waittill ("trigger", player);
		player iprintlnbold ("You have been teleported");
		player SetOrigin(target.origin);
		player SetPlayerAngles( target.angles );
		
}
}
fx()
{
ff1 = getEnt ("firefly1", "targetname");
ff2 = getEnt ("firefly2", "targetname");
ff3 = getEnt ("firefly3", "targetname");
ff5 = getEnt ("air1", "targetname");
ff6 = getEnt ("firefly5", "targetname");
ff7 = getEnt ("firefly6", "targetname");
ff8 = getEnt ("firefly7", "targetname");
ff9 = getEnt ("firefly8", "targetname");
ff10 = getEnt ("firefly9", "targetname");
ff11 = getEnt ("firefly10", "targetname");
ff12 = getEnt ("firefly11", "targetname");
ff13 = getEnt ("firefly12", "targetname");
ff14 = getEnt ("firefly13", "targetname");
ff15 = getEnt ("firefly14", "targetname");
ff18 = getEnt ("firefly17", "targetname");
ff19 = getEnt ("firefly18", "targetname");
water1 = getEnt ("water1", "targetname");
water2 = getEnt ("water2", "targetname");
water3 = getEnt ("water3", "targetname");
thunder1 = getEnt ("thunder1", "targetname");
thunder2 = getEnt ("thunder2", "targetname");
thunder3 = getEnt ("thunder3", "targetname");
thunder6 = getEnt ("thunder6", "targetname");
arena1 = getEnt ("arena1", "targetname");
arena2 = getEnt ("arena1_1", "targetname");
arena4 = getEnt ("arena1_3", "targetname");
arena5 = getEnt ("arena1_4", "targetname");
arena6 = getEnt ("arena1_5", "targetname");
arena7 = getEnt ("arena1_6", "targetname");
arena8 = getEnt ("arena1_7", "targetname");
arena9 = getEnt ("arena1_8", "targetname");
secret2 = getEnt ("secret2", "targetname");
secret3 = getEnt ("secret3", "targetname");
secret4 = getEnt ("secret4", "targetname");
secret5 = getEnt ("secret5", "targetname");
nearend1 = getEnt ("fireflieslb1", "targetname");
nearend2 = getEnt ("fireflieslb2", "targetname");
nearend3 = getEnt ("fireflieslb3", "targetname");
nearend4 = getEnt ("fireflieslb4", "targetname");
nearend5 = getEnt ("fireflieslb5", "targetname");
nearend6 = getEnt ("fireflieslb6", "targetname");



	level._effect[ "fireflies" ] = loadfx( "misc/fireflies" );
		level._effect[ "firefliess" ] = loadfx( "misc/firefliess" );
	level._effect[ "water" ] = loadfx( "misc/water" );
	level._effect[ "thunder1" ] = loadfx( "weather/lightning_bolt_lrg");
	level._effect[ "fireflies2" ] = loadfx( "misc/fireflies2" );
	level._effect[ "fireflieslb" ] = loadfx( "misc/fireflieslb" );
	maps\mp\_fx::loopfx("firefliess", (ff1.origin), 3, (ff1.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("firefliess", (ff2.origin), 3, (ff2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff3.origin), 3, (ff3.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff5.origin), 3, (ff5.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff6.origin), 3, (ff6.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff7.origin), 3, (ff7.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff8.origin), 3, (ff8.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff9.origin), 3, (ff9.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff10.origin), 3, (ff10.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff11.origin), 3, (ff11.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff12.origin), 3, (ff12.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff13.origin), 3, (ff13.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff14.origin), 3, (ff14.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff15.origin), 3, (ff15.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff18.origin), 3, (ff18.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies", (ff19.origin), 3, (ff19.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("water", (water1.origin), 3, (water1.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("water", (water2.origin), 3, (water2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("water", (water3.origin), 3, (water3.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("thunder1", (thunder1.origin), 3, (thunder1.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("thunder1", (thunder2.origin), 3, (thunder2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("thunder1", (thunder3.origin), 3, (thunder3.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("thunder1", (thunder6.origin), 3, (thunder6.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena1.origin), 3, (arena1.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena2.origin), 3, (arena2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena4.origin), 3, (arena4.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena5.origin), 3, (arena5.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena6.origin), 3, (arena6.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena7.origin), 3, (arena7.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena8.origin), 3, (arena8.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (arena9.origin), 3, (arena9.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies2", (secret2.origin), 3, (secret2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies2", (secret3.origin), 3, (secret3.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies2", (secret4.origin), 3, (secret4.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflies2", (secret5.origin), 3, (secret5.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend1.origin), 3, (nearend1.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend2.origin), 3, (nearend2.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend3.origin), 3, (nearend3.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend4.origin), 3, (nearend4.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend5.origin), 3, (nearend5.origin) + (0, 0, 90));
	maps\mp\_fx::loopfx("fireflieslb", (nearend6.origin), 3, (nearend6.origin) + (0, 0, 90));

	
}
platform()
{

platform = getEnt ("moving1", "targetname");

while(true)
{

platform moveX (-590, 2);
wait 2;
platform moveX (590, 2);
wait 2;
}
}


trap1a()
{
trap1a = getEnt ("trap1a", "targetname");
hurta = getEnt ("trap1a_hurt", "targetname");

hurta EnableLinkTo();
hurta LinkTo(trap1a);

while(true)
{

trap1a moveY(288,0.7);
wait(0.7);
trap1a moveY(-288,0.6);
wait(0.6);
}
}

trap1b()
{
trap1b = getEnt ("trap1b", "targetname");
hurtb = getEnt ("trap1b_hurt", "targetname");

hurtb EnableLinkTo();
hurtb Linkto(trap1b);

while(true)
{

trap1b moveY(-288,.7);
wait(.7);
trap1b moveY(288,.6);
wait(.6);
}
}

platforms2()
{
pf1 = getEnt ("endplatform1", "targetname");
pf2 = getEnt ("endplatform2", "targetname");
trig = getEnt ("platforms2", "targetname");

trig waittill ("trigger");
trig delete();

while(true)
{

pf1 moveY (672,2.3,.4,0.4);
pf2 moveY (-672,2.3,.4,0.4);
wait 2.5;
pf1 moveZ (-128,0.5,0.1,0.1);
pf2 moveZ (128,0.5,0.1,0.1);
wait 0.7;
pf1 moveY (-672,2.3,0.2,0.2);
pf2 moveY (672,2.3,0.2,0.2);
wait 2.5;
pf1 moveZ (128,0.5,0.1,0.1);
pf2 moveZ (-128,0.5,0.1,0.1);
wait 0.7;
}
}
trap2_rotating()
{

trap = getEnt ("trap2", "targetname");
trig = getEnt ("trap2_trig", "targetname");

trig waittill ("trigger", user);
trig delete();

while(true)
{

trap rotateRoll(1080,7.5);
wait 7.5;

}
}

trap3_pushers()
{

trapa = getEnt ("trap3a", "targetname");
trapb = getEnt ("trap3b", "targetname");
trapc = getEnt ("trap3c", "targetname");
trig = getEnt ("trap3_trig", "targetname");

trig waittill ("trigger", user);
trig delete();

while(true)
{

trapa moveX (272, 0.43);
trapb moveX (-272, 0.43);
trapc moveX (272, 0.43);
wait 0.43;
trapa moveX (-272, 0.5);
trapb moveX (272, 0.5);
trapc moveX (-272, 0.5);
wait 0.5;
trapa moveX (272, 0.55);
trapb moveX (-272, 0.55);
trapc moveX (272, 0.55);
wait 0.55;
trapa moveX (-272, 0.5);
trapb moveX (272, 0.5);
trapc moveX (-272, 0.5);
wait 0.5;
}
}

jump()
{
	jumpx = getent ("jump","targetname");
	glow = getent ("glow","targetname");
	air1 = getent ("air1","targetname");
	air2 = getent ("air2","targetname");
	air3 = getent ("air3","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = .5;
	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait .5;
			air moveto (air2.origin, time);
			wait .25;
			air moveto (air3.origin, time);
			wait .5;
			user unlink();
			wait 1;
}
}
}

jump2()
{
	jump2 = getent ("jump2","targetname");
	glow = getent ("glow3","targetname");
	air1 = getent ("air4","targetname");
	air2 = getent ("air5","targetname");
	air3 = getent ("air6","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = .5;
	for(;;)
{
		jump2 waittill ("trigger",user);
		if (user istouching(jump2))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait .5;
			air moveto (air2.origin, time);
			wait .25;
			air moveto (air3.origin, time);
			wait .5;
			user unlink();
			wait 1;
}
}
}
acti_jump()
{
	jumpx = getent ("a_jump","targetname");
	glow = getent ("a_glow","targetname");
	air1 = getent ("a_air1","targetname");
	air2 = getent ("a_air2","targetname");
	air3 = getent ("a_air3","targetname");

	level._effect[ "beacon_glow" ] = loadfx( "misc/ui_pickup_available" );
	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = .5;
	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait .5;
			air moveto (air2.origin, time);
			wait .25;
			air moveto (air3.origin, time);
			wait .5;
			user unlink();
			wait 1;
}
}
}


trap4()
{

pusher = getEnt ("trap4_pusher", "targetname");
trig = getEnt ("trap4_trig", "targetname");

trig waittill ("trigger");

wait 0.05;
{

trig delete();
pusher moveY (260, 0.5);
wait 2.5;
pusher moveY (-260, 1);
wait 1.5;

}
}

trap5()
{
platforms1 = getEnt ("trap5_1", "targetname");
platforms2 = getEnt ("trap5_2", "targetname");
platforms3 = getEnt ("trap5_3", "targetname");
platforms4 = getEnt ("trap5_4", "targetname");
trig = getEnt ("trap5_trig", "targetname");

trig waittill ("trigger");
trig delete();
wait(0.05);
{
thread trap5_1();
thread trap5_2();
thread trap5_3();
thread trap5_4();
thread trap5_5();
}
}
trap5_1()
{
platforms1 = getEnt ("trap5_1", "targetname");
while(true)
{
platforms1 moveZ (90, 0.6);
wait 0.6;
platforms1 moveZ (-180, 1.4);
wait 1.4;
platforms1 moveZ (90, 0.6);
wait 0.6;
}
}
trap5_2()
{
platforms2 = getEnt ("trap5_2", "targetname");
while(true)
{
platforms2 moveZ (-80, .6);
wait .6;
platforms2 moveZ (160, 1.35);
wait 1.35;
platforms2 moveZ (-80, .6);
wait .6;
}
}

trap5_3()
{
platforms3 = getEnt ("trap5_3", "targetname");
while(true)
{

platforms3 moveZ (80, 0.5);
wait .5;
platforms3 moveZ (-160, .75);
wait .75;
platforms3 moveZ (80, 0.5);
wait .5;
}
}
trap5_4()
{
platforms4 = getEnt ("trap5_4", "targetname");
while(true)
{
platforms4 moveZ (-80, 0.75);
wait 0.75;
platforms4 moveZ (160, 1);
wait 1;
platforms4 moveZ (-80, 0.75);
wait .75;
}
}
trap5_5()
{
platform5 = getEnt ("trap5_5", "targetname");
while(true)
{
platform5 moveZ (80, 0.75);
wait .75;
platform5 moveZ (-160, 0.50);
wait .5;
platform5 moveZ (80, 0.75);
wait 0.75;
}
}
trap6()
{

trigger = getEnt ("trap6_trig", "targetname");

trigger waittill ("trigger");
trigger delete();
wait 0.05;
{
thread hammers1();
thread hammers2();
wait 1;
}
}
hammers1()
{
hammer1 = getEnt ("trap6_1", "targetname");
hammer2 = getEnt ("trap6_3", "targetname");

while(true)
{
hammer1 rotatePitch (-360, 1.6);
hammer2 rotatePitch (-360, 1.6);
wait 1.6;
}
}
hammers2()
{
hammer1 = getEnt ("trap6_2", "targetname");
hammer2 = getEnt ("trap6_4", "targetname");

while(true)
{
hammer1 rotatePitch (360, 1.4);
hammer2 rotatePitch (360, 1.4);
wait 1.4;
}
}

trap7()
{
    trig = getEnt("trap7_trig", "targetname");
    trapa = getEnt("brushes1", "targetname");
    trapb = getEnt("brushes2", "targetname");

    trig waittill("trigger");
    trig delete();

    possibility = randomIntRange(0,1);
    if(possibility == 0)
    {
        trapa hide();
        trapa notSolid();
    }
    
    if(possibility == 1)
    
    {
        trapb hide();
        trapb notSolid();
    }
}

trap8()
{
wall1 = getEnt ("trap8_1", "targetname");
wall2 = getEnt ("trap8_2", "targetname");
boom1_2 = getEnt ("wall1_2", "targetname");
trig = getEnt ("trap8_trig", "targetname");

level._effect[ "explosion" ] = loadfx( "explosions/boom" );

trig waittill ("trigger");
trig delete();
wait 0.05;

Earthquake( 1, 4, boom1_2.origin, 550 );

	PlayFX( level.wall_explosion_fx, (-1548,404,-128) );
			wait 0.05;
			MusicPlay ("floor_boom");
	PlayFX( level.wall_explosion_fx, (-1324,404,-128) );
			wait 0.05;
wall1 hide();
wall1 notSolid();
wall2 hide();
wall2 notSolid();

}
trap9()
{

spinner = getEnt ("trap9", "targetname");
trig = getEnt ("trap9_trig", "targetname");

trig waittill ("trigger");

while(true)
{

spinner rotateYaw (900,2.5,0.3,0.3);
spinner waittill ("rotatedone");
wait .4;
spinner rotateYaw (-900,2.5,0.3,0.3);
spinner waittill ("rotatedone");
wait .4;
spinner rotateYaw (-900,2.5,0.3,0.3);
spinner waittill ("rotatedone");
wait .4;
spinner rotateYaw (900,2.5,0.3,0.3);
spinner waittill ("rotatedone");
wait .4;
spinner rotateYaw (-900,2.5,0.3,0.3);
spinner waittill ("rotatedone");
wait .4;
}
}

end_boom()
{

trig = getEnt ("endboom_trig", "targetname");
wall = getEnt ("endwall", "targetname");
acti = getEnt ("end_acti", "targetname");

trig waittill ("trigger", user);
iPrintlnBold( " ^1" + user.name + " ^7 Has Reached The End!" ); 
trig delete();

PlayFX( level.end_boom_fx, (-872,1824,96) );
	MusicPlay ("floor_boom");
		wait 0.1;
PlayFX( level.end_boom_fx, (-704,1824,96) );
		wait 0.1;
PlayFX( level.end_boom_fx, (-560,1824,96) );
wall delete();
wait 1;
thread activator();
}

activator()
{
	

	acti = undefined;

	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( players[i].pers["team"] == "axis" && isAlive(players[i]) )
		{
			acti = players[i];
			break;
		}
	}
	
	
moveacti = getEnt ("end_acti", "targetname");

if( GetTeamPlayersAlive("axis") == 1)
{
acti setOrigin( moveacti.origin );
acti setPlayerangles( moveacti.angles );
acti TakeAllWeapons();
acti GiveWeapon( "tomahawk_mp" );
wait 0.05;
acti SwitchToWeapon( "tomahawk_mp" );
wait 1;

}
}
Jumper_move_end()
{

	jumpx = getent ("endmap_trig","targetname");
	glow = getent ("endglow","targetname");
	air1 = getent ("e_air1","targetname");
	air2 = getent ("e_air2","targetname");
	air3 = getent ("e_air3","targetname");
	air4 = getent ("e_air4","targetname");
	air5 = getent ("e_air5","targetname");

	maps\mp\_fx::loopfx("beacon_glow", (glow.origin), 3, (glow.origin) + (0, 0, 90));

	time = 0.5;
	for(;;)
{
		jumpx waittill ("trigger",user);
		if (user istouching(jumpx))
		{
			//throw = user.origin + (100, 100, 0);
			air = spawn ("script_model",(0,0,0));
			air.origin = user.origin;
			air.angles = user.angles;
			user linkto (air);
			air moveto (air1.origin, time);
			wait 0.5;
			air moveto (air2.origin, time);
			wait 0.5;
			air moveto (air3.origin, time);
			wait 0.5;
			air moveto (air4.origin, time);
			wait 0.25;
			air moveto (air5.origin, time);
			wait 0.25;
			user unlink();
			user TakeAllweapons();
			user GiveWeapon( "tomahawk_mp" );
			wait 0.05;
			user SwitchToWeapon( "tomahawk_mp" );
			wait 1;
}
}
}
