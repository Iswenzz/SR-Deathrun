main()
{

/*
MAP CREATED AND SCRIPTED BY CHUBBS317
*/

maps\mp\_load::main();

ambientPlay("ambient1");

game["allies"] = "marines";
game["axis"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

precacheItem("m40a3_mp");
precacheItem("deserteagle_mp");
precacheItem("rpg_mp");
precacheItem("remington700_mp");
precacheItem("knife_mp");
precacheItem("m14_mp");

setdvar( "r_specularcolorscale", "1" );

setdvar("r_glowbloomintensity0",".25");
setdvar("r_glowbloomintensity1",".25");
setdvar("r_glowskybleedintensity0",".3");
setdvar("compassmaxrange","1800");

	thread teleport();
	thread addTestClients();
	thread trap_1();
	thread trap_2();
	/////trap3/////
	thread ele1();
	thread ele2();
	///////////////
	thread trap_4a();
	thread trap_4b();
	thread trap_5();
	thread trap_6a();
	thread trap_6b();
	thread trap_7a();
	thread tunnel_car1();
	thread tunnel_car2();
	thread tunnel_car3();
	thread tunnel_car4();
	thread tunnel_trapL();
	thread tunnel_trapR();
	thread tunnel_trapT();
	thread tunnel_trapB();
	thread old_bridge();
	thread old_clips();
	thread old_tele();
	thread sniper_tele();
	thread sniper_songchange();
	thread knife_tele();
	thread knife_songchange();
	thread jump_wep();
	thread wep_rotate();
	thread jump_tele();
	thread jump_songchange();
	
	addTriggerToList( "trap_1trig" );
    addTriggerToList( "trap_2trig" );
    addTriggerToList( "trap_3trig" );
    addTriggerToList( "trap_4trig" );
    addTriggerToList( "trap_5trig" );
    addTriggerToList( "trap_6trig" );
    addTriggerToList( "trap_7trig" );
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

///testbots///
addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();

        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}
TestClient(team)
{
    self endon( "disconnect" );

    while(!isdefined(self.pers["team"]))
        wait .05;
        
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}

///end///

teleport()
{
	entTransporter = getentarray( "enter", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}
 
transporter()
{
	for(;;)
	{
		self waittill( "trigger", player );
		entTarget = getEnt( self.target, "targetname" );
		wait 0.1;
		player setOrigin( entTarget.origin );
		player setplayerangles( entTarget.angles );
		wait 0.1;
	}
}

trap_1()
{
trig = getent ("trap_1trig", "targetname");
floor = getent ("trap_1", "targetname");

trig waittill ("trigger");

floor movez (200, 0.5);
wait 2;
floor movez (-200, 2);
wait 2;
}

trap_2()
{
trig = getent ("trap_2trig", "targetname");
Pusher1 = getent ("trap_2", "targetname");
Pusher2 = getent ("trap_2a", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		Pusher1 movey (-576, 0.3);
		wait 1;
		Pusher1 movey (576, 0.3);
		wait 1;
		Pusher2 movey (576, 0.3);
		wait 1;
		Pusher2 movey (-576, 0.3);
		wait 1;
	}
}

ele1()
{
ele1 = getent ("ele1", "targetname");
ele2 = getent ("ele2", "targetname");
trig = getent ("trap_3trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		ele1 movez (112, 1);
		wait 1;
		ele1 movez (-198, 1);
		wait 1;
		ele1 movez (86, 1);
		wait 1;
	}
}

ele2()
{
ele1 = getent ("ele1", "targetname");
ele2 = getent ("ele2", "targetname");
trig = getent ("trap_3trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		ele2 movez (-86, 1);
		wait 1;
		ele2 movez (198, 1);
		wait 1;
		ele2 movez (-112, 1);
		wait 1;
	}
}

trap_4a()
{
brush = getent ("trap_4", "targetname");
trig = getent ("trap_4trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		brush rotateRoll (360, 1);
		wait 2;
	}
}

trap_4b()
{
brush = getent ("trap_4a", "targetname");
trig = getent ("trap_4trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		brush rotateRoll (-360, 1);
		wait 2;
	}
}

trap_5()
{
floor = getent ("trap_5", "targetname");
trig = getent ("trap_5trig", "targetname");

trig waittill ("trigger");

floor movez (-200, 1);
wait 3;
floor movez (200, 1);
}

trap_6a()
{
hammer_1 = getent ("trap_6a", "targetname");
trig = getent ("trap_6trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		hammer_1 rotateRoll (360, 4);
		wait 2;
	}
}

trap_6b()
{
hammer_2 = getent ("trap_6b", "targetname");
trig = getent ("trap_6trig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		hammer_2 rotateRoll (-360, 3);
		wait 2;
	}
}

trap_7a()
{
floor = getent ("trap_7a", "targetname");
trig = getent ("trap_7trig", "targetname");

trig waittill ("trigger");

floor notsolid();
}

tunnel_car1()
{
car = getent ("tunnel_car1", "targetname");

	for(;;)
	{
		car movex (4928, 15);
		wait 17;
		car movez (-192, 2);
		wait 5;
		car movex (-4928, 15);
		wait 17;
		car movez (192, 2);
		wait 5;
	}
}

tunnel_car2()
{
car = getent ("tunnel_car2", "targetname");

	for(;;)
	{
		car movez (192, 2);
		wait 5;
		car movex (4928, 15);
		wait 17;
		car movez (-192, 2);
		wait 5;
		car movex (-4928, 15);
		wait 17;
	}
}

tunnel_car3()
{
car = getent ("tunnel_car3", "targetname");

	for(;;)
	{
		car movex (-4928, 15);
		wait 17;
		car movez (192, 2);
		wait 5;
		car movex (4928, 15);
		wait 17;
		car movez (-192, 2);
		wait 5;
	}
}

tunnel_car4()
{
car = getent ("tunnel_car4", "targetname");

	for(;;)
	{
		car movez (-192, 2);
		wait 5;
		car movex (-4928, 15);
		wait 17;
		car movez (192, 2);
		wait 5;
		car movex (4928, 15);
		wait 17;
	}
}

//tunnel trap

tunnel_trapL()
{
pole = getent ("tunnel_trapL", "targetname");

	for (;;)
	{
		pole movey (-1088, 4);
		wait 4;
		pole movey (1088, 4);
		wait 4;
	}
}

tunnel_trapR()
{
pole = getent ("tunnel_trapR", "targetname");

	for (;;)
	{
		pole movey (1088, 4);
		wait 4;
		pole movey (-1088, 4);
		wait 4;
	}
}

tunnel_trapT()
{
pole = getent ("tunnel_trapT", "targetname");

	for (;;)
	{
		pole movez (-480, 4);
		wait 4;
		pole movez (480, 4);
		wait 4;
	}
}

tunnel_trapB()
{
pole = getent ("tunnel_trapB", "targetname");

	for (;;)
	{
		pole movez (480, 4);
		wait 4;
		pole movez (-480, 4);
		wait 4;
	}
}

old_bridge()
{
bridge = getent ("old_bridge", "targetname");
trig = getent ("old_trigger", "targetname");

trig waittill ("trigger");

bridge movez (528, 2);
wait 2;
}

old_clips()
{
clips = getent ("old_clips", "targetname");
trig = getent ("old_trigger", "targetname");

trig waittill ("trigger");

clips movez (-5000, 0.1);
}

old_tele()
{
snipertrig = getent ("sniper_trigger", "targetname");
oldtrig = getent ("old_trigger", "targetname");
oldactitele = getEnt ("old_acti_tele", "targetname");
knifetrig = getent ("knife_trigger", "targetname");
jumptrig = getent ("jump_trigger", "targetname");

	for(;;)
	{
		oldtrig waittill ("trigger", player);
		snipertrig delete();
		knifetrig delete();
		oldtrig delete();
		jumptrig delete();
		wait(0.05);
		level.activ SetOrigin (oldactitele.origin);
		level.activ setplayerangles (oldactitele.angles);
		wait(0.05);
		iPrintLnBold(player.name+ "^4 has used the ^1Old Trigger!");
		while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

sniper_tele()
{
knifetrig = getent ("knife_trigger", "targetname");
oldtrig = getent ("old_trigger", "targetname");
snipertrig = getent ("sniper_trigger", "targetname");
sniperactitele = getent ("sniper_acti_tele", "targetname");
sniperjumpertele = getent ("sniper_jumper_tele", "targetname");
jumptrig = getent ("jump_trigger", "targetname");

	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );

snipertrig waittill("trigger", player);
knifetrig delete();
oldtrig delete();
jumptrig delete();
wait(0.05);

player SetOrigin (sniperjumpertele.origin);
player setplayerangles (sniperjumpertele.angles);
player TakeAllWeapons();
player GiveWeapon ("m40a3_mp"); 
player GiveWeapon ("remington700_mp"); 
wait(0.05);

level.activ SetOrigin (sniperactitele.origin);
level.activ setplayerangles (sniperactitele.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon ("m40a3_mp");
level.activ GiveWeapon ("remington700_mp");
player GiveWeapon ("m40a3_mp"); 
player GiveWeapon ("remington700_mp"); 
wait(0.05);

player switchToWeapon ("m40a3_mp");
level.activ SwitchToWeapon ("m40a3_mp");
iPrintLnBold(player.name+ "^4 has entered the ^1Sniper Room");
wait 0.4;

player thread onDeath_sniper();
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

onDeath_sniper()
{
	self endon("disconnect");
	
	self waittill("death");
	thread sniper_tele();
}

sniper_songchange()
{
trig = getEnt( "sniper_trigger", "targetname" );
trig waittill ("trigger", player);
AmbientStop();
ambientPlay("Ambient2");
}

Knife_tele()
{
snipertrig = getent ("sniper_trigger", "targetname");
oldtrig = getent ("old_trigger", "targetname");
knifetrig = getent ("knife_trigger", "targetname");
knifeactitele = getent ("knife_acti_tele", "targetname");
knifejumpertele = getent ("knife_jumper_tele", "targetname");
jumptrig = getent ("jump_trigger", "targetname");

	self endon("death");
	self endon( "disconnect" );	
	self endon( "joined_team" );
	self endon( "joined_spectators" );


knifetrig waittill("trigger", player);
snipertrig delete();
oldtrig delete();
jumptrig delete();
wait(0.05);
player SetOrigin (knifejumpertele.origin);
player setplayerangles (knifejumpertele.angles);
player TakeAllWeapons();
player GiveWeapon ("knife_mp"); 
wait(0.05);
level.activ SetOrigin (knifeactitele.origin);
level.activ setplayerangles (knifeactitele.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon ("knife_mp");
wait(0.05);
player switchToWeapon ("knife_mp");
level.activ SwitchToWeapon ("knife_mp");
iPrintLnBold(player.name+ "^4 has entered the ^1Knife Room");
wait 0.4;
player thread onDeath_knife();
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

onDeath_knife()
{
	self endon("disconnect");
	
	self waittill("death");
	thread knife_tele();
}

knife_songchange()
{
trig = getEnt( "knife_trigger", "targetname" );
trig waittill ("trigger", player);
AmbientStop();
ambientPlay("Ambient3");
}

jump_tele()
{
snipertrig = getent ("sniper_trigger", "targetname");
oldtrig = getent ("old_trigger", "targetname");
knifetrig = getent ("old_trigger", "targetname");
jumptrig = getent ("jump_trigger", "targetname");
jumpactitele = getent ("jump_acti_tele", "targetname");
jumpjumpertele = getent ("jump_jumper_tele", "targetname");

self endon("death");
self endon( "disconnect" );	
self endon( "joined_team" );
self endon( "joined_spectators" );

jumptrig waittill("trigger", player);
snipertrig delete();
oldtrig delete();
knifetrig delete();
wait(0.05);
player SetOrigin (jumpjumpertele.origin);
player setplayerangles (jumpjumpertele.angles);
player TakeAllWeapons();
player GiveWeapon ("knife_mp"); 
wait(0.05);
level.activ SetOrigin (jumpactitele.origin);
level.activ setplayerangles (jumpactitele.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon ("knife_mp");
wait(0.05);
player switchToWeapon ("knife_mp");
level.activ SwitchToWeapon ("knife_mp");
iPrintLnBold(player.name+ "^4 has entered the ^1Jump Room");
wait 0.4;
player thread onDeath_jump();
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

onDeath_jump()
{
	self endon("disconnect");
	
	self waittill("death");
	thread jump_tele();
}

jump_songchange()
{
trig = getEnt( "jump_trigger", "targetname" );
trig waittill ("trigger", player);
AmbientStop();
ambientPlay("Ambient4");
}

wep_rotate()
{
m14 = getent ("m14", "targetname");

	for (;;)
	{
		m14 rotateYaw (360, 4);
		wait 4;
	}
}
	
jump_wep()
{
trigger = getent ("give_wep_trig", "targetname");

	for (;;)
	{
		trigger waittill ("trigger", user);
		wait(0.2);
		user iPrintLnBold(user.name+ "^4 has gotten the Jump Room ^1weapon!");
		wait(0.1);	
		user giveWeapon ("m14_mp");
		user giveMaxammo ("m14_mp");
		wait 0.1;
		user switchToWeapon ("m14_mp");
	}
}