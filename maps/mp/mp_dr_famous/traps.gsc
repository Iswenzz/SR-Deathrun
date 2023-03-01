/*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]
	
*/

//Traps
main()
{
	thread entrancetrap1();
	addTriggerToList("poles_trig");
	thread entrancetrap2();
	addTriggerToList("spikes_trig");
	thread trap1();
	addTriggerToList("trap1_trig");
	thread trap2();
	addTriggerToList("trap2_trig");
	thread moveplatform();
	thread trap3();
	addTriggerToList("trap3_trig");	
}

entrancetrap1()//Spins Poles.
{
 poles = getEnt("poles","targetname");
 trig = getEnt("poles_trig","targetname");
 trig sethintstring("Press ^5[USE] ^7to Rotate the Poles!");
 trig waittill("trigger", player );
 while(1)
 {
	poles rotateRoll(720, 3 );
	wait 0.0125;
 }
}

entrancetrap2() //Brings Spikes out of the Ground.
{
spikes = getEnt("spikes","targetname");
 trig = getEnt("spikes_trig","targetname");
 killtrig = getEnt("kill_trig","targetname");
 trig sethintstring("Press ^5[USE] ^7to Raise the Spikes!");
 trig waittill("trigger", player );
 trig delete();
  killtrig enablelinkto ();
  killtrig linkto (spikes);
  spikes movez(45,3,1,2);
  spikes waittill("movedone");
  wait(2);
  spikes movez(-45,3,1,2);
  spikes waittill("movedone");
	}

trap1() //Removes the First Easy Platforms.
{
 platform = getEnt("trap1","targetname");
 trig = getEnt("trap1_trig","targetname");
 trig sethintstring("Press ^5[USE] ^7to Remove the Platforms!");
 trig waittill("trigger", player );
 trig delete();
 platform delete();
}

trap2() //Spins the Platform.
{
 platform = getEnt("trap2","targetname");
 trig = getEnt("trap2_trig","targetname");
 trig sethintstring("Press ^5[USE] ^7to Spin the Platform!");
 trig waittill("trigger", player );
 trig delete();
 while(1)
 {
   platform rotateYaw (720, 3 );
   wait 8;
 }
}

moveplatform() //Moves the Platform from One to the Other.
{
 platform = getEnt("move_plat","targetname");
 trig = getEnt("move_trig","targetname");
 trig waittill("trigger", player );
 trig delete();
while(1)
	{
	platform movex(4132,3,1,2);
	platform waittill("movedone");
	wait 2;
	platform movex(-4132,3,1,2);
	platform waittill("movedone");
	wait 5;
	}
}

trap3() //Crushes the Runners
{
  object = getEnt("smash", "targetname");
   trig = getEnt("trap3_trig","targetname");
  killtrig = getEnt("smashkill_trig","targetname");
  
  trig setHintString("Press ^5[USE] ^7to Crush the Runners!");
  trig waittill("trigger", player );
  trig delete();
  
  while(1)
  {
	killtrig enableLinkTo();
	 killtrig linkTo(object);
  
    object moveZ (-421, 1);
     object waittill ("movedone");
    object moveZ (421, 5);
	 object waittill ("movedone");
  }
}

//Free Run Trap Fix
addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name , "targetname" );
}

