main()
{

maps\mp\_load::main();
maps\mp\_asd_2::main();
maps\mp\_asd_3::main();
maps\mp\_asd_4::main();
maps\mp\_asd_5::main();
maps\mp\_asd_6::main();


	thread ambient1();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread ammobox();
	thread kkk35();
	thread orokmozgo();
	thread ammobox2();
	thread end();
	thread message1();
	thread kkk35_sniper();
	thread kkk35_pistol();
	thread kkk35_knife();
	thread kkk35_bounce();
	thread kkk35_mozgoja();
	thread rovidites();
	thread grabbed();
	thread maradtegy();


		addTriggerToList("trap1_trig");
		addTriggerToList("trap2_trig");
		addTriggerToList("trap3_trig");
		addTriggerToList("trap4_trig");
		addTriggerToList("trap5_trig");
		addTriggerToList("trap6_trig");
		addTriggerToList("maradtegy_trig");


}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

trap1()
{


kkk35_trap1 = getEnt ( "trap1", "targetname");
trigger = getEnt ( "trap1_trig", "targetname");

  trigger waittill( "trigger");
  trigger setHintString("^1Trap activated!");
  trigger delete();

  {

  kkk35_trap1 rotateyaw (1080,5);
  kkk35_trap1 waittill ("movedone");

  }

}

trap2()

{

  kkk35_trap2 = getent( "trap2", "targetname" );
  trig = getent( "trap2_trig", "targetname" );
  hurt = getEnt ("hurt1", "targetname");

  			hurt enablelinkto();
                  hurt linkto(kkk35_trap2);


  while(true)

        {
        trig waittill ("trigger");
        trig setHintString("^1Trap activated!");
        trig delete();
        kkk35_trap2 movex (370,1,0,0.6);
        kkk35_trap2 waittill ("movedone");


        wait 5;

        kkk35_trap2 movex(-370,1,0,0.6);
        kkk35_trap2 waittill ("movedone");
        }
}

trap3()

{

  kkk35_trap3 = getent( "trap3", "targetname" );
  trig = getent( "trap3_trig", "targetname" );
  hurt = getEnt ("hurt2", "targetname");

  			hurt enablelinkto();
                  hurt linkto(kkk35_trap3);

  while(true)

        {
        trig waittill ("trigger");
        trig delete();
        kkk35_trap3 movez (37,1,0,0.6);
        kkk35_trap3 waittill ("movedone");


        wait 1;

        kkk35_trap3 movez(-37,1,0,0.6);
        kkk35_trap3 waittill ("movedone");
        }
}

trap4()

{

  kkk35_trap4 = getent( "trap4", "targetname" );
  trig = getent( "trap4_trig", "targetname" );
  hurt = getEnt ("hurt3", "targetname");

  			hurt enablelinkto();
                  hurt linkto(kkk35_trap4);

  while(true)

        {
        trig waittill ("trigger");
        trig delete();
        kkk35_trap4 movex (-400,1,0,0.6);
        kkk35_trap4 waittill ("movedone");


        wait 1;

        kkk35_trap4 movex  (400,1,0,0.6);
        kkk35_trap4 waittill ("movedone");
        }
}

trap5()

{
  trig = getEnt( "trap5_trig", "targetname" );
  kkk35_trap5 = getEnt( "trap5", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  kkk35_trap5 delete();

}

trap6()

{
  trig = getEnt( "trap6_trig", "targetname" );
  kkk35_trap6 = getEnt( "trap6", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  kkk35_trap6 hide();
  wait 10;
  kkk35_trap6 show();
}

kkk35()

{

  kkk35_jaroka = getEnt ("kkk35", "targetname");

  while(1)
  {
  kkk35_jaroka moveY (200,2);
  wait 3;
  kkk35_jaroka moveX (-300,2);
  wait 3;
  kkk35_jaroka moveY (-200,2);
  wait 3;
  kkk35_jaroka moveX (300,2);
  wait 3;
  }
}

ammobox()
{
            trig = getEnt("ammo_trig","targetname");

           while(1)
           {
             trig waittill ("trigger", who);
             who GiveMaxAmmo( "remington700_mp" );         
           }
}

ammobox2()
{
            trig = getEnt("ammo2_trig","targetname");

           while(1)
           {
             trig waittill ("trigger", who);
             who GiveMaxAmmo( "deserteagle_mp" );         
           }
}

orokmozgo()

{
orokkkemozog = getent("orokmozgo", "targetname");
while(1)
{
orokkkemozog rotateyaw (10000,340);
orokkkemozog waittill("movedone");
}
}

end()
 {
 end = getent ("end","targetname");
 end waittill ("trigger",player );
 end delete ();


  iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^1>>The first<<");
  wait 1 ;
  }

message1()
{
	wait 6;
	iprintln ("^3This map was created by ^2kkk35");
	wait 3;
	iprintln ("^4Add me in Xfire ^1kkk35");
	wait 3;
	iprintln ("^1Please report the bugs on xfire!Thanks.");
}

kkk35_mozgoja()

{
kkk35_mozog = getent("kkk35_mozgoja", "targetname");
while(1)
{
kkk35_mozog movey(-400, 3);
kkk35_mozog waittill("movedone");
wait 2;
kkk35_mozog movey(400, 3);
kkk35_mozog waittill("movedone");
wait 2;
}
}

kkk35_sniper()
{
	level.snip_trig = getEnt( "trigger_sniper", "targetname");
	jump = getEnt( "sniper_jumper", "targetname" );
	acti = getEnt( "sniper_activator", "targetname" );
	
	while(1)
	{
		level.snip_trig waittill( "trigger", player );
		if( !isDefined( level.snip_trig ) )
			return;
		
		level.knife_trig delete();
            level.pistol_trig delete(); 
		level.bounce_trig delete();                      
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "remington700_mp" );
		player giveMaxAmmo( "remington700_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "remington700_mp" );
		level.activ GiveMaxAmmo( "remington700_mp" );
		wait 0.05;
		player switchToWeapon( "remington700_mp" );
		level.activ SwitchToWeapon( "remington700_mp" );
		iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^2Picked the snipe!");
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

kkk35_knife()
{
	level.knife_trig = getEnt( "trigger_knife", "targetname");
	jump = getEnt( "knife_jumper", "targetname" );
	acti = getEnt( "knife_activator", "targetname" );
	
	while(1)
	{
		level.knife_trig waittill( "trigger", player );
		if( !isDefined( level.knife_trig ) )
			return;
		
		level.snip_trig delete();
            level.pistol_trig delete();
		level.bounce_trig delete();
		AmbientPlay( "ambient3" );  
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );		
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^2Picked the knife!");	
		while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}
kkk35_pistol()
{
	level.pistol_trig = getEnt( "trigger_pistol", "targetname");
	jump = getEnt( "pistol_jumper", "targetname" );
	acti = getEnt( "pistol_activator", "targetname" );
	
	while(1)
	{
		level.pistol_trig waittill( "trigger", player );
		if( !isDefined( level.pistol_trig ) )
			return;
		
		level.knife_trig delete();
            level.snip_trig delete();
		level.bounce_trig delete();
		AmbientPlay( "ambient2" );  
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "deserteagle_mp" );
		player giveMaxAmmo( "deserteagle_mp" );
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "deserteagle_mp" );
		level.activ GiveMaxAmmo( "deserteagle_mp" );
		wait 0.05;
		player switchToWeapon( "deserteagle_mp" );
		level.activ SwitchToWeapon( "deserteagle_mp" );
		iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^2Picked the pistol!");	
            while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

kkk35_bounce()
{
	level.bounce_trig = getEnt( "trigger_bounce", "targetname");
	jump = getEnt( "bounce_jumper", "targetname" );
	acti = getEnt( "bounce_activator", "targetname" );
	
	while(1)
	{
		level.bounce_trig waittill( "trigger", player );
		if( !isDefined( level.bounce_trig ) )
			return;
		
		level.snip_trig delete();
            level.pistol_trig delete();
		level.knife_trig delete();
		AmbientPlay( "ambient4" );  
		player SetPlayerAngles( jump.angles );
		player setOrigin( jump.origin );
		player TakeAllWeapons();
		player GiveWeapon( "tomahawk_mp" );		
		level.activ setPlayerangles( acti.angles );
		level.activ setOrigin( acti.origin );
		level.activ TakeAllWeapons();
		level.activ GiveWeapon( "tomahawk_mp" );		
		wait 0.05;
		player switchToWeapon( "tomahawk_mp" );
		level.activ SwitchToWeapon( "tomahawk_mp" );
		iprintlnbold ("" + "." + "^1"+ player.name + "."+" ^2Picked the bounce!");	
		while( isAlive( player ) && isDefined( player ) )
		wait 1;
	}
}

rovidites()
 {
 rovidites = getent ("rovidites","targetname");
 rovidites waittill ("trigger",player );
 rovidites delete ();


  iprintlnbold ("^2WTF?!");
  wait 1;
  }

grabbed()
 {
 grabbed = getent ("grabbed","targetname");
 grabbed waittill ("trigger",player );
 grabbed delete ();


  iprintlnbold ("" + "^5." + "^5"+ player.name + "."+" ^7grabbed the ^2M40a3!");
  wait 1;
  }


maradtegy()

{
  trig = getEnt( "maradtegy_trig", "targetname" );
  kimaradt = getEnt( "maradtegy", "targetname" );

  trig waittill( "trigger", who );
  trig setHintString("^1Trap activated!");
  trig delete();
  kimaradt notsolid(); 
}

ambient1()
{
AmbientPlay ( "ambient1" );
wait 5;
iprintln("Now Playing: ^2Jeremih - Fuck You All The Time (Shlohmo Remix)");
}
