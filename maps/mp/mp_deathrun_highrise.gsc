/*
	Map by xFearZ
	Thanks to Viking for making the script so only one trap can be used at once his xfire: vikingkampfsau
	If you have any problem scripting add my xfire: iqwikscopez or vikings: vikingkampfsau
	You have no permission to use these scripts!
*/

main()
{
	maps\mp\_load::main();
	setExpFog(500, 1000, 0.4, 0.425, 0.44, 0.0);
	level.mortar = LoadFX("explosions/artilleryExp_dirt_brown_low");
	level.helecopter = LoadFX("explosions/helicopter_explosion_cobra_low");
	PreCacheItem("m40a3_mp");
	PreCacheItem("m14_mp");
	
	thread init();
	thread pusher();
	thread spinner();
	thread splatter();
	thread fan();
	thread mortar();
	thread helecopter();
	thread spinner2();
	thread pusher2();
	thread plane();
	thread slide();
	thread gay();
	thread comb();
	thread pvp();
	thread sniper();
	thread bounce();
	thread helicopter();
	thread text();
	thread fearz();
}

init()
{
	level.trapsuseable = true;
	
	while(1)
	{
	wait .1;
	
		if(!level.trapsuseable)
		{
			wait 15;
			level.trapsuseable = true;
		}
	}
}

text()
{
	for(;;)
	{
		iprintln("Map made by ^5FearZ");
		wait 60;
	}
}

fearz()
{
	wait 5;
	
	players = getentarray("player", "classname");
	for(i=0;i<players.size;i++)
	{
		if( GetSubStr( players[i] GetGuid(), 24, 32 ) == "c743c983" )
		{
			players[i] iprintLnBold("^3Hi!");
			iprintln ("Map maker " + players[i].name + " joined the game");
		}
	}
}

helicopter()
{
	
	trig = getEnt ("boat_trig", "targetname");
	target = getEnt ("helicopter1_origin", "targetname");
	helicopter1 = getEnt ("helicopter1", "targetname");
	helicopter2 = getEnt ("helicopter2", "targetname");
	
	helicopter1 hide();
	helicopter2 hide();
	
	trig waittill ("trigger", player);
	helicopter1 show();
	helicopter2 show();	
	iprintlnbold (player.name + " choosen helicopter wars!");
	thread acti_tele_helictoper();
	self thread helicopter_sound();
	
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	wait .1;
	player linkto(target);
	target linkto(helicopter1);
	player takeallweapons();
	player thread checkammo();
	iprintlnbold ("helictoper battle!");

	wait 1;
	iPrintLnbold ("3");
	wait 1;
	iPrintLnbold ("2");
	wait 1;
	iPrintLnbold ("1");
	wait 1;
	iPrintLnbold ("Begin! Good luck!");
	player GiveWeapon("m14_mp");
	player SwitchToWeapon("m14_mp");
	thread helictoper_move();


}

helicopter_sound()
{
	self endon ("death");
	
	helicopter1 = getEnt ("helicopter1", "targetname");
	while(1)
	{
		helicopter1 PlaySound( "helicopter_move" );
		wait 24;
	}
}

helictoper_move()
{
	helicopter1 = getEnt ("helicopter1", "targetname");
	helicopter2 = getEnt ("helicopter2", "targetname");
	helicopter1_clip = getEnt ("helicopter1_clip", "targetname");
	helicopter2_clip = getEnt ("helicopter2_clip", "targetname");
	ride1 = getEnt ("helictoper_ride1", "targetname");
	ride2 = getEnt ("helictoper_ride2", "targetname");
	ride3 = getEnt ("helictoper_ride3", "targetname");
	ride4 = getEnt ("helictoper_ride4", "targetname");
	ride5 = getEnt ("helictoper_ride5", "targetname");
	ride6 = getEnt ("helictoper_ride6", "targetname");
	ride7 = getEnt ("helictoper_ride7", "targetname");
	ride8 = getEnt ("helictoper_ride8", "targetname");
	ride9 = getEnt ("helictoper_ride9", "targetname");
	ride10 = getEnt ("helictoper_ride10", "targetname");
	ride11 = getEnt ("helictoper_ride11", "targetname");
	ride12 = getEnt ("helictoper_ride12", "targetname");
	
	helicopter1_clip linkto(helicopter1);
	helicopter2_clip linkto(helicopter2);
	
	for(;;)
	{
		helicopter2 moveTo( ride2.origin, 3 );
		helicopter1 moveTo( ride9.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride2.angles, 1 );	
		helicopter1 rotateTo( ride9.angles, 1 );	
		wait 2;
		helicopter2 moveTo( ride3.origin, 3 );
		helicopter1 moveTo( ride10.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride3.angles, 1 );	
		helicopter1 rotateTo( ride10.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride4.origin, 3 );
		helicopter1 moveTo( ride11.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride4.angles, 1 );	
		helicopter1 rotateTo( ride11.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride5.origin, 3 );
		helicopter1 moveTo( ride12.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride5.angles, 1 );	
		helicopter1 rotateTo( ride12.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride6.origin, 3 );
		helicopter1 moveTo( ride1.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride6.angles, 1 );	
		helicopter1 rotateTo( ride1.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride7.origin, 3 );
		helicopter1 moveTo( ride2.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride7.angles, 1 );	
		helicopter1 rotateTo( ride2.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride8.origin, 3 );
		helicopter1 moveTo( ride3.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride8.angles, 1 );	
		helicopter1 rotateTo( ride3.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride9.origin, 3 );
		helicopter1 moveTo( ride4.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride9.angles, 1 );	
		helicopter1 rotateTo( ride4.angles, 1 );
		wait 2;		
		helicopter2 moveTo( ride10.origin, 3 );
		helicopter1 moveTo( ride5.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride10.angles, 1 );	
		helicopter1 rotateTo( ride5.angles, 1 );
		wait 2;		
		helicopter2 moveTo( ride11.origin, 3 );
		helicopter1 moveTo( ride6.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride11.angles, 1 );	
		helicopter1 rotateTo( ride6.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride12.origin, 3 );
		helicopter1 moveTo( ride7.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride12.angles, 1 );	
		helicopter1 rotateTo( ride7.angles, 1 );
		wait 2;
		helicopter2 moveTo( ride1.origin, 3 );
		helicopter1 moveTo( ride8.origin, 3 );
		wait 1;
		helicopter2 rotateTo( ride1.angles, 1 );	
		helicopter1 rotateTo( ride8.angles, 1 );
		wait 2;
	}
	
}


acti_tele_helictoper()
{
	trig = getEnt ("acti_tele", "targetname");
	target = getEnt ("helicopter2_origin", "targetname");
	helicopter1 = getEnt ("helicopter2", "targetname");
	
	trig waittill ("trigger", player);
	
	player takeallweapons();
	player thread checkammo();
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	wait .1;
	player linkto(target);
	target linkto(helicopter1);
	wait 4;
	player GiveWeapon("m14_mp");
	player SwitchToWeapon("m14_mp");
}

checkammo()
{
	self endon ("death");

	for(;;)
	{
		self GiveMaxAmmo("m14_mp");
		wait 5;
	}
}

bounce()
{
	trig = getEnt ("bounce_trig", "targetname");
	target = getEnt ("jumper_bounce_tele", "targetname");
	
	trig waittill ("trigger", player);
	iprintlnbold (player.name + " choosen bounce!");
	thread acti_tele_bounce();
	
	player FreezeControls (1);
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	player GiveWeapon("knife_mp");
	player SwitchToWeapon("knife_mp");
	iprintlnbold ("Knife battle!");
	wait 1;
	iPrintLnbold ("3");
	wait 1;
	iPrintLnbold ("2");
	wait 1;
	iPrintLnbold ("1");
	wait 1;
	player FreezeControls(0);
	iPrintLnbold ("Begin! Good luck!");
}


acti_tele_bounce()
{
	trig = getEnt ("acti_tele", "targetname");
	target = getEnt ("acti_bounce_tele", "targetname");
	
	trig waittill ("trigger", player);
	
	player FreezeControls (1);
	player GiveWeapon("knife_mp");
	player SwitchToWeapon("knife_mp"); 
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	wait 4;
	player FreezeControls (0);
}

sniper()
{
	trig = getEnt ("sniper_trig", "targetname");
	target = getEnt ("jumper_tele_sniper", "targetname");
	
	trig waittill ("trigger", player);
	iprintlnbold (player.name + " choosen sniper!");
	thread acti_tele_sniper();
	
	player FreezeControls(1);
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	
	player GiveWeapon("m40a3_mp");
	player setWeaponAmmoClip( "m40a3_mp", 100 );
	player setweaponammostock( "m40a3_mp", 100 );
	player SwitchToWeapon("m40a3_mp");
	wait 1;
	iPrintLnbold ("3");
	wait 1;
	iPrintLnbold ("2");
	wait 1;
	iPrintLnbold ("1");
	wait 1;
	player FreezeControls(0);
	iPrintLnbold ("Begin! Good luck!");
}

acti_tele_sniper()
{
	trig = getEnt ("acti_tele", "targetname");
	target = getEnt ("acti_tele_sniper", "targetname");
	
	trig waittill ("trigger", player);
	
	player FreezeControls (1);
	
	player SetPlayerAngles( target.angles );
	player SetOrigin( target.origin );
	player GiveWeapon("m40a3_mp");
	player setWeaponAmmoClip( "m40a3_mp", 100 );
	player setweaponammostock( "m40a3_mp", 100 );
	player SwitchToWeapon("m40a3_mp");
	wait 4;
	player FreezeControls (0);
}

pvp()
{

	teleporter_jumpers = getEnt( "jumper_tele", "targetname" );
	
	wait 5;
    while(1)
    {
    wait .1;
	
		if(GetTeamPlayersAlive("allies") != 1 || GetTeamPlayersAlive("axis") != 1)
			continue;
		
			
		players = getentarray("player", "classname");
		for(i=0;i<=players.size;i++)
		{
			players[i] takeallweapons();
		
			if(players[i].pers["team"] == "allies")
			{
				players[i] TakeAllWeapons();
				players[i] SetOrigin(teleporter_jumpers.origin);
			}
			else if(players[i].pers["team"] == "axis")
			players[i] TakeAllWeapons();			
        }
		break;
    }
}


comb()
{
	trig = getEnt ("comb_trig", "targetname");
	comb = getEnt ("comb", "targetname");
	for(;;)
	{
		comb hide();
		wait 40;
		iprintln("Trap comb is ready!");
		trig waittill ("trigger", player);
		
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " used the comb!");
		comb show();
		
		comb moveX (-1232,3);
		wait 3;
		comb moveX (1232,3);
		wait 3;
	}
}

gay()
{
	trig = getEnt ("gay_trig", "targetname");
	target = getEnt ("gay_detector", "targetname");
	origin = getEnt ("earthquake", "targetname");
	
	for(;;)
	{
	
		wait 50;
		iprintln("Trap gay detector is ready!");
		trig waittill ("trigger", player);
		trig delete();
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " used the gay trap, watch out!");
		
		while(1)
		{	
			target waittill ("trigger", player);
			player freezecontrols (1);
			wait 1;
			player iprintlnbold("You have been choosen by the gay detector");
			iPrintLnBold(player.name + " has been choosen by the gay detector");
			wait 1;
			playFx( level.mortar, player.origin); 
			Earthquake( 1, 1, origin.origin, 1000 );
			player PlaySound("exp_suitcase_bomb_stereo");
			player freezecontrols (0);
			player suicide();
			wait 5;
			break;
		}
		break;
	}
}

slide()
{
	trig = getEnt ("slide_trig", "targetname");
	slide1 = getEnt ("slide1", "targetname");
	slide2 = getEnt ("slide2", "targetname");
	
	for(;;)
	{
		slide1 hide();
		slide2 hide();
		wait 30;
		iprintln("Trap slide is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " used the slide!");
		
		if( RandomInt(2) == 0 )
		{
			slide1 show();
			slide1 moveZ (704,1);
			wait 5;
			slide1 moveZ (-704,1);
		}
		else
		{
			slide2 show();
			slide2 moveZ (704,1);
			wait 5;
			slide2 moveZ (-704,1);
		}
	}
}

plane()
{
	trig = getEnt ("plane_trig", "targetname");
	plane2 = getEnt ("plane2", "targetname");
	plane1 = getEnt ("plane1", "targetname");
	hurt1 = getEnt ("plane1_hurt", "targetname");
	hurt2 = getEnt ("plane2_hurt", "targetname");
	plane1_move1 = getEnt ("plane1_move1", "targetname");
	plane1_move2 = getEnt ("plane1_move2", "targetname");
	plane2_move1 = getEnt ("plane2_move1", "targetname");
	plane2_move2 = getEnt ("plane2_move2", "targetname");
	origin = getEnt ("earthquake", "targetname");
	
	hurt1 enablelinkto();
	hurt1 linkto(plane1);
	
	hurt2 enablelinkto();
	hurt2 linkto(plane2);
	
	for(;;)
	{
		plane1 hide();
		plane2 hide();
		wait 35;
		iprintln("Trap plane is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " started the plane, watch out!");
		trig delete();
		
		if( RandomInt(2) == 0 )
		{
			plane1 show();
			plane1 moveTo( plane1_move1.origin, 3 );
			plane1 rotateTo( plane1_move1.angles, 3 );
			Earthquake( 2, 3, origin.origin, 1000 );
			wait 3;
			plane1 moveTo( plane1_move2.origin, 2 );
			plane1 rotateTo( plane1_move2.angles,2 );
			wait 3;
			hurt1 unlink();
			plane1 delete();
			hurt1 delete();
			break;
		}
		else
		{
			plane2 show();
			plane2 moveTo( plane2_move1.origin, 3 );
			plane2 rotateTo( plane2_move1.angles, 3 );
			Earthquake( 2, 3, origin.origin, 1000 );
			wait 3;
			plane1 moveTo( plane2_move2.origin, 2 );
			plane2 rotateTo( plane2_move2.angles, 2 );
			wait 3;
			hurt2 unlink();
			plane2 delete();
			hurt2 delete();
			break;
		}
	}
}

helecopter()
{
	chicken = getEnt( "helecopter", "targetname" );
	trig = getEnt( "helecopter_trig", "targetname" );
	hurt = getEnt ("helecopter_hurt", "targetname");
	origin = getEnt ("earthquake", "targetname");
	
	hurt enableLinkTo();
	hurt linkTo( chicken );
	for(;;)
	{
		wait 40;
		iprintln("Trap helicopter is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " started the helicopter, watch out!");
		trig delete();
			
		node = getEnt( chicken.target, "targetname" );
		chicken.orign = node.origin;
		chicken.angles = node.angles;
	
		while( isDefined( chicken ) )
		{
			if( isDefined( node.target ) )
			node = getEnt( node.target, "targetname" );
				else
			break;
			chicken moveTo( node.origin, 3 );
			chicken rotateTo( node.angles, 3 );
			wait 3;
		}
		
		chicken moveTo( origin.origin, 1 );
		chicken rotateTo( origin.angles, 1 );
		wait 0.5;
		playFx( level.helecopter, origin.origin);
		origin PlaySound("exp_suitcase_bomb_stereo");
		wait 0.5;
		Earthquake( 2, 1, origin.origin, 1000 );
		wait 0.5;
		chicken delete();
		hurt delete();
		break;
	}

}

mortar()
{
	trig = getEnt ("mortar_trig", "targetname");
	mortar = getEnt("morter", "targetname");
	hurt = getEnt ("morter_hurt", "targetname");
	earth = getEnt ("earthquake", "targetname");
	
	hurt enablelinkto();
	hurt linkto(mortar);
	
	for(;;)
	{
		wait 25;
		iprintln("Trap mortar is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
	
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " activated the mortar!");
		
		wait 3;
		mortar moveZ (96,0.1);
		wait 0.1;
		playFx( level.mortar, mortar.origin); 
		Earthquake( 1, 1, earth.origin, 1000 );
		mortar PlaySound("exp_suitcase_bomb_stereo");
		wait 2;
		mortar moveZ (-96,0.1);
	
	}
}

fan()
{
	trig = getEnt ("fan_trig", "targetname");
	hurt1 = getEnt ("fan_hurt1", "targetname");
	hurt2 = getEnt ("fan_hurt2", "targetname");
	fan = getEnt ("fan", "targetname");
	target1 = getEnt ("fan_target1", "targetname");
	target2 = getEnt ("fan_target2", "targetname");
	target3 = getEnt ("fan_target3", "targetname");
	target4 = getEnt ("fan_target4", "targetname");
	reset = getEnt ("fan_return", "targetname");
	
	hurt1 enablelinkto();
	hurt1 linkto(fan);
	hurt2 enablelinkto();
	hurt2 linkto(fan);
	
	for(;;)
	{
		fan hide();
		wait 25;
		iprintln("Trap fan is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		fan show();
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " activated the fan!");
		
		if( RandomInt(2) == 0 )		
		{
			fan rotatepitch(30,2);
			wait 0.1;
			fan rotateyaw (3600, 10);
			fan MoveTo(target1.origin, 2, .05, .05 );
			wait 2;
			fan MoveTo(reset.origin, 1, .05, .05 );
			wait 3;
			fan MoveTo(target4.origin, 2, .05, .05 );
			wait 2;
			fan MoveTo(reset.origin, 1, .05, .05 );
			wait 3;
			fan hide();
		}
		else
		{
			fan rotatepitch(30,2);
			wait 0.1;
			fan rotateyaw (3600, 10);
			fan MoveTo(target2.origin, 2, .05, .05 );
			wait 2;
			fan MoveTo(reset.origin, 1, .05, .05 );
			wait 3;
			fan MoveTo(target3.origin, 2, .05, .05 );
			wait 2;
			fan MoveTo(reset.origin, 1, .05, .05 );
			wait 3;	
			fan hide();
		}
	}
}

splatter()
{
	hurt1 = getEnt ("splatter1_hurt", "targetname");
	hurt2 = getEnt ("splatter2_hurt", "targetname");
	splatter1 = getEnt ("splatter1", "targetname");
	splatter2 = getEnt ("splatter2", "targetname");
	earth = getEnt ("earthquake", "targetname");
	trig = getEnt ("splatter_trig", "targetname");
	splitter = getEnt ("splatter_splitter", "targetname");
	
	hurt1 enablelinkto();
	hurt1 linkto(splatter1);
	hurt2 enablelinkto();
	hurt2 linkto(splatter2);
	
	for(;;)
	{
		splatter1 hide();
		splatter2 hide();
		splitter hide();
		wait 15;
		iprintln("Trap splatter is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		splatter1 show();
		splatter2 show();
		splitter show();	
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " activated the splatter!");

		if( RandomInt(2) == 0 )		
		{
			splatter1 rotatepitch (10,0.5);
			splatter1 rotateroll (10,0.5);
			wait 1;
			splatter1 rotatepitch (-10,0.5);
			splatter1 rotateroll (-10,0.5);
			wait 1;
			Earthquake( 1, 1, earth.origin, 1000 );
			wait 1;
			splatter1 moveZ (-432,1);
			wait 1;
			splatter1 moveZ (432,1);
			splatter2 hide();
			splatter1 hide();
			splitter hide();
		}
		else
		{
			splatter2 rotatepitch (10,1);
			splatter2 rotateroll (10,1);
			wait 2;
			splatter2 rotatepitch (-10,1);
			splatter2 rotateroll (-10,1);
			wait 2;
			Earthquake( 1, 3, earth.origin, 1000 );
			wait 3;
			splatter2 moveZ (-432,1);
			wait 3;
			splatter2 moveZ (432,1);
			splatter2 hide();
			splatter1 hide();
			splitter hide();
		}
	
	}
	
}

spinner()
{
	trig = getEnt ("spinner_trig", "targetname");
	spin = getEnt ("spinner", "targetname");
	patch = getEnt ("spinner_patch", "targetname");
	hurt1 = getEnt ("spinner_hurt1", "targetname");
	hurt2 = getEnt ("spinner_hurt2", "targetname");
	
	patch enablelinkto();
	patch linkto(spin);
	hurt1 enablelinkto();
	hurt1 linkto(spin);
	hurt2 enablelinkto();
	hurt2 linkto(spin);

	
	for(;;)
	{
		spin hide();
		wait 10;
		iprintln("Trap spinner is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		spin show();

		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " activated the spinner!");
		spin moveZ(208,1);
		wait 2;
		while(1)
		{
			spin rotateyaw (2160,15);
			wait 10;
			break;
		}
		spin moveZ (-208,1);
		wait 1;
	}
}

spinner2()
{
	trig = getEnt ("spinner2_trig", "targetname");
	spin = getEnt ("spinner", "targetname");
	patch = getEnt ("spinner_patch", "targetname");
	hurt1 = getEnt ("spinner_hurt1", "targetname");
	hurt2 = getEnt ("spinner_hurt2", "targetname");
	
	
	for(;;)
	{
		spin hide();
		wait 30;
		iprintln("Trap faster spinner is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		spin show();

		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " activated the faster spinner!");
		spin moveZ(208,1);
		wait 2;
		while(1)
		{
			spin rotateyaw (2160,8);
			wait 6;
			break;
		}
		spin moveZ (-208,1);
		wait 1;
	}
}	

pusher()
{
	trig = getEnt ("pusher_trigger", "targetname");
	push1 = getEnt ("pusher_1", "targetname");
	push2 = getEnt ("pusher_2", "targetname");
	push3 = getEnt ("pusher_3", "targetname");
	push4 = getEnt ("pusher_4", "targetname");
	
	
	for(;;)
	{
		push1 hide();
		push2 hide();
		push3 hide();
		push4 hide();
		wait 10;
		iprintln("Trap pusher is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " Activated the pushers!");
		
		if( RandomInt(2) == 0 )
		{	
			push1 show();
			push1 moveY (1408,4);
			wait 4;
			push3 show();
			push3 moveX (-1536,4);
			wait 4;
			push3 moveX (1536,4);
			wait 2;
			push1 moveY (-1408,4);
			wait 4;
		}
		else
		{
			push2 moveY (1408,4);
			push2 show();
			wait 4;
			push4 moveX (-1536,4);
			push4 show();
			wait 4;
			push4 moveX (1536,4);
			wait 2;
			push2 moveY (-1408,4);
			wait 4;

		}
	}
}

pusher2()
{
	trig = getEnt ("pusher2_trig", "targetname");
	push1 = getEnt ("pusher_1", "targetname");
	push2 = getEnt ("pusher_2", "targetname");
	push3 = getEnt ("pusher_3", "targetname");
	push4 = getEnt ("pusher_4", "targetname");
	
	
	for(;;)
	{
		push1 hide();
		push2 hide();
		push3 hide();
		push4 hide();
		wait 30;
		iprintln("Trap faster pusher is ready!");
		trig waittill ("trigger", player);
		
		if(!level.trapsuseable)
			continue;
		
		level.trapsuseable = false;
		
		player iprintlnbold("You must wait 15 seconds to use another trap");
		iPrintLnBold (player.name + " Activated the faster pushers!");
		
		if( RandomInt(2) == 0 )
		{	
			push1 show();
			push1 moveY (1408,2);
			wait 2;
			push3 show();
			push3 moveX (-1536,2);
			wait 2;
			push3 moveX (1536,2);
			wait 2;
			push1 moveY (-1408,2);
			wait 2;
		}
		else
		{
			push1 show();
			push1 moveY (1408,2);
			wait 2;
			push3 show();
			push3 moveX (-1536,2);
			wait 2;
			push3 moveX (1536,2);
			wait 2;
			push1 moveY (-1408,2);
			wait 2;

		}
	
	}
}