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

setdvar( "r_specularcolorscale", "1" );

setdvar("r_glowbloomintensity0",".25");
setdvar("r_glowbloomintensity1",".25");
setdvar("r_glowskybleedintensity0",".3");
setdvar("compassmaxrange","1800");

	thread start_door();
	thread AddTestClients();
	thread spinning_floor();
	thread sniper_songchange();
	thread knife_songchange();
	thread blade_1();
	thread blade_2();
	thread door_b();
	thread door_bb();
	thread door_cc();
	thread door_c();
	thread door_d();
	thread door_e();
	thread door_f();
	thread door_g();
	thread door_h();
	thread door_i();
	thread door_j();
	thread door_k();
	thread door_l();
	thread door_m();
	thread door_n();
	thread door_o();
	thread door_p();
	thread door_q();
	thread door_r();
	thread door_s();
	thread door_t();
	thread door_u();
	thread door_v();
	thread door_w();
	thread teleport();
	thread pony_tele();
	thread give_deagle();
	thread sniper_room();
	thread ammo_box();
	thread floor_deleter();
	thread knife_room();
	thread old_room();
	thread old_wall_1();
	thread old_wall_2();
	thread old_wall_3();
	thread old_wall_4();
}

//testing///////////////////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////////////////

give_deagle()
{
trigger = getent ("give_deagle_trig","targetname");
{
trigger waittill ("trigger",user);
wait(0.2);
user iprintlnbold("You found the PONY!");
wait(0.1);	
user giveWeapon( "m40a3_mp");
user giveMaxammo("m40a3_mp");
wait 0.1;
user switchToWeapon("m40a3_mp");
}
}

floor_deleter()
{
trig = getent ("floor_deleter", "targetname");
floor = getent ("floor", "targetname");

trig waittill ("trigger");

floor movez (-8000, 0.1);
}

ammo_box()
{
trigger = getent ("ammo_box", "targetname");

	for(;;)
	{
		trigger waittill ("trigger", user);
		user giveMaxammo("m40a3_mp");
		user giveMaxammo("remington700_mp");
	}
}

pony_tele()
{
	entTransporter = getentarray( "give_deagle_trig", "targetname" );
	if(isdefined(entTransporter))
		for( i = 0; i < entTransporter.size; i++ )
			entTransporter[i] thread transporter();
}

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

//ambientsoundchange

knife_songchange()
{
trig = getEnt( "teleportkniferoom", "targetname" );
trig waittill ("trigger", player);
AmbientStop();
ambientPlay("Ambient2");
}

sniper_songchange()
{
trig = getEnt( "teleportsniperroom", "targetname" );
trig waittill ("trigger", player);
AmbientStop();
ambientPlay("Ambient3");
}

//Moving Objects

start_door()
{

door = getent ("start_door", "targetname");
trig = getent ("start_doortrig", "targetname");

trig waittill ("trigger");

door movez (-500, 4);
}

blade_1()
{
floor = getent ("door_x", "targetname");

	for(;;)
	{
		floor rotateYaw (360, 3);
		wait 3;
	}
}

blade_2()
{
floor = getent ("door_y", "targetname");

	for(;;)
	{
		floor rotateYaw (-360, 3);
		wait 3;
	}
}

door_b()
{
door = getent ("door_b", "targetname");

	for(;;)
	{
		door movex (784,3);
		wait 3;
		door movex (-784,3);
		wait 3;
	}
}

door_c()
{

door = getent ("door_c", "targetname");

	for(;;)
	{
		door movex (-784,3);
		wait 3;
		door movex (784,3);
		wait 3;
	}

}

door_bb()
{
door = getent ("door_b", "targetname");
trig = getent ("door_btrig", "targetname");

trig waittill ("trigger");

door movez (-300, 3);
wait 3;
door movez (300, 3);
wait 3;
}

door_cc()
{
door = getent ("door_c", "targetname");
trig = getent ("door_btrig", "targetname");

trig waittill ("trigger");

door movez (-300, 3);
wait 3;
door movez (300, 3);
wait 3;
}

door_d()
{
	door = getent("door_d", "targetname");
	
	for(;;)
	{
		door RotateRoll( 360, 2 );
		wait 2;
	}
}

door_e()
{
	door = getent("door_e", "targetname");
	
	for(;;)
	{
		door RotateRoll( -360, 2 );
		wait 2;
	}
}

door_f()
{
	door = getent("door_f", "targetname");
	
	for(;;)
	{
		door RotateRoll( 360, 2 );
		wait 2;
	}
}

door_g()
{
	door = getent("door_g", "targetname");
	
	for(;;)
	{
		door RotateRoll( -360, 2 );
		wait 2;
	}
}

door_h()
{
	door = getent("door_h", "targetname");
	
	for(;;)
	{
		door movez( 208, 2 );
		wait 2;
		door movez( -208, 2 );
		wait 2;
	}
}

door_i()
{
	door = getent("door_i", "targetname");
	
	for(;;)
	{
		door movez( -208, 2 );
		wait 2;
		door movez( 208, 2 );
		wait 2;
	}
}

door_j()
{
	door = getent("door_j", "targetname");
	
	for(;;)
	{
		door RotateYaw( -360, 5 );
		wait 5;
		door RotateYaw( 360, 5 );
		wait 5;
	}
}

door_k()
{
	door = getent("door_k", "targetname");
	
	for(;;)
	{
		door RotateYaw( 360, 5 );
		wait 5;
		door RotateYaw( -360, 5 );
		wait 5;
	}
}

door_l()
{
	door = getent("door_l", "targetname");
	
	for(;;)
	{
		door RotateYaw( -360, 3 );
		wait 3;
	}
}

door_m()
{
	door = getent("door_m", "targetname");
	
	for(;;)
	{
		door RotateYaw( 360, 3 );
		wait 3;
	}
}

//Activator Traps

door_n()
{

door = getent ("door_n", "targetname");
trig = getent ("door_ntrig", "targetname");

trig waittill ("trigger");

door movez (-8000, 0.1);
wait 0.1;
}

door_o()
{

door = getent ("door_o", "targetname");
trig = getent ("door_otrig", "targetname");

trig waittill ("trigger");

door movez (-256, 2);
wait 4;
door movez (256, 2);
}

door_p()
{

door = getent ("door_p", "targetname");
trig = getent ("door_ptrig", "targetname");

trig waittill ("trigger");

door RotateYaw (360, 5);
wait 5;
}

//Sweeper

door_q()
{

door = getent ("door_q", "targetname");
trig = getent ("door_qtrig", "targetname");

trig waittill ("trigger");

	for (;;)
	{
		door movex (672, 4);
		wait 4;
		door movez (496, 4);
		wait 4;
		door movex (-672, 4);
		wait 4;
		door movez (-496, 4);
		wait 4;
	}
}

door_r()
{

door = getent ("door_r", "targetname");
trig = getent ("door_qtrig", "targetname");

trig waittill ("trigger");

	for (;;)
	{
		door movez (-496, 4);
		wait 4;
		door movex (672, 4);
		wait 4;
		door movez (496, 4);
		wait 4;
		door movex (-672, 4);
		wait 4;
	}
}

door_s()
{

door = getent ("door_s", "targetname");
trig = getent ("door_qtrig", "targetname");

trig waittill ("trigger");

	for (;;)
	{
		door movex (-672, 4);
		wait 4;
		door movez (-496, 4);
		wait 4;
		door movex (672, 4);
		wait 4;
		door movez (496, 4);
		wait 4;
	}
}

door_t()
{

door = getent ("door_t", "targetname");
trig = getent ("door_qtrig", "targetname");

trig waittill ("trigger");

	for (;;)
	{
		door movez (496, 4);
		wait 4;
		door movex (-672, 4);
		wait 4;
		door movez (-496, 4);
		wait 4;
		door movex (672, 4);
		wait 4;
	}
}

spinning_floor()
{
trig = getent ("spinning_floortrig", "targetname");
floor = getent ("spinning_floor", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		floor rotatePitch (-360, 3);
		wait 3;
		floor rotatePitch (360, 3);
		wait 3;
	}
}

//Bobbing Poles

door_u()
{

door = getent ("door_u", "targetname");
trig = getent ("door_utrig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		door movez (-44, 1.5);
		wait 1.5;
		door movez (44, 1.5);
		wait 1.5;
	}
}

door_v()
{

door = getent ("door_v", "targetname");
trig = getent ("door_vtrig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		door movez (-44, 1.5);
		wait 1.5;
		door movez (44, 1.5);
		wait 1.5;
	}
}

door_w()
{

door = getent ("door_w", "targetname");
trig = getent ("door_vtrig", "targetname");

trig waittill ("trigger");

	for(;;)
	{
		door movez (44, 1.5);
		wait 1.5;
		door movez (-44, 1.5);
		wait 1.5;
	}
}

//Final Rooms

sniper_room()
{
level.teleactorigin3 = getEnt("sniperact", "targetname");
telesniperorigin = getEnt("telesniper", "targetname");
level.snipertrigger = getEnt("teleportsniperroom", "targetname");
for(;;)
{
self endon("death");
level.snipertrigger waittill("trigger", player);
level.knifetrigger delete();
level.oldtrigger delete();
wait(0.05);
player SetOrigin( telesniperorigin.origin );
player setplayerangles( telesniperorigin.angles );
player TakeAllWeapons();
player GiveWeapon( "m40a3_mp" ); 
player GiveWeapon( "remington700_mp" ); 
wait(0.05);
level.activ SetOrigin (level.teleactorigin3.origin);
level.activ setplayerangles (level.teleactorigin3.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "m40a3_mp" );
level.activ GiveWeapon( "remington700_mp" );
player GiveWeapon( "m40a3_mp" ); 
player GiveWeapon( "remington700_mp" ); 
wait(0.05);
player switchToWeapon( "m40a3_mp" );
level.activ SwitchToWeapon( "m40a3_mp" );
level.telesniperorigin delete();
iPrintLnBold(player.name+ "^4 has entered the ^1Sniper Room");
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

knife_room()
{
level.teleactorigin4 = getEnt("knifeact", "targetname");
teleknifeorigin = getEnt("teleknife", "targetname");
level.knifetrigger = getEnt("teleportkniferoom", "targetname");
for(;;)
{
self endon("death");
level.knifetrigger waittill("trigger", player);
level.snipertrigger delete();
level.oldtrigger delete();
wait(0.05);
player SetOrigin( teleknifeorigin.origin );
player setplayerangles( teleknifeorigin.angles );
player TakeAllWeapons();
player GiveWeapon( "knife_mp" ); 
wait(0.05);
level.activ SetOrigin (level.teleactorigin4.origin);
level.activ setplayerangles (level.teleactorigin4.angles);
level.activ TakeAllWeapons();
level.activ GiveWeapon( "knife_mp" ); 
wait(0.05);
player switchToWeapon( "knife_mp" );
level.activ SwitchToWeapon( "knife_mp" );
level.teleknifeorigin delete();
iPrintLnBold(player.name+ "^4 has entered the ^1Knife Room");
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

old_room()
{
level.oldtrigger = getent ("old_trigger", "targetname");
level.teleactorigin5 = getEnt("final_acti_tele", "targetname");
for(;;)
{
self endon("death");
level.oldtrigger waittill("trigger", player);
level.snipertrigger delete();
level.knifetrigger delete();
level.oldtrigger delete();
wait(0.05);
level.activ SetOrigin (level.teleactorigin5.origin);
level.activ setplayerangles (level.teleactorigin5.angles);
wait(0.05);
iPrintLnBold(player.name+ "^4 has gone the ^1Old Way!");
while( isAlive( player ) && isDefined( player ) )
            wait 1;
}
}

old_wall_1()
{
level.oldtrigger = getent ("old_trigger", "targetname");
wall_1 = getent ("old_wall_1", "targetname");

level.oldtrigger waittill ("trigger");

level.knifetrigger delete();
level.snipertrigger delete();
wait (0.05);

wall_1 movex (1056, 4);
}

old_wall_2()
{
level.oldtrigger = getent ("old_trigger", "targetname");
wall_2 = getent ("old_wall_2", "targetname");

level.oldtrigger waittill ("trigger");

wall_2 movey (990, 4);
}

old_wall_3()
{
level.oldtrigger = getent ("old_trigger", "targetname");
wall_3 = getent ("old_wall_3", "targetname");

level.oldtrigger waittill ("trigger");

wall_3 movex (-1056, 4);
}

old_wall_4()
{
level.oldtrigger = getent ("old_trigger", "targetname");
wall_4 = getent ("old_wall_4", "targetname");

level.oldtrigger waittill ("trigger");

wall_4 movey (-990, 4);
}