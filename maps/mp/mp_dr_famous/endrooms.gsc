/*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]

*/
rooms()
{
  thread EndRooms();
  thread jumpweapon();
}

EndRooms() //Map Endrooms (Thanks Jeffskye!)
{
    level.playerinroom = 0;
	thread AddRoom("Sniper Room","enter5","sniper1","sniper2","m40a3_mp","max","music7",0,0);
  thread AddRoom("Jump Room","enter6","jump1","jump2","knife_mp","max","music6",0,0);

}
AddRoom(roomname,trig,tele_jumper,tele_activator,weap,ammo,music,old,rush)
{
    while( 1 )
    {
        if(DefinedEntities(trig,tele_jumper))
        {
            getEnt(trig,"targetname") waittill("trigger",player);
            if(level.playerinroom)
                continue;

            level.playerinroom = 1;
            if(isDefined(player) && isAlive(player))
            {
                player setOrigin(getEnt(tele_jumper,"targetname").origin);
                player setPlayerAngles(getEnt(tele_jumper,"targetname").angles);
                  ambientPlay(music);
                if(!isDefined(old) || !old)
                {
                    player takeAllWeapons();
                }
                if(isDefined(weap) && isDefined(ammo))
                {
                    player giveWeapon(weap);
                    if(ammo == "max")
                        player giveMaxAmmo( weap );
                    else
                        player setWeaponAmmoClip( weap, ammo );
                    player switchToWeapon( weap );
                }
            }
            if(isDefined(level.activ) && isAlive(level.activ))
            {
                if(isDefined(tele_activator))
                {
                    level.activ setOrigin(getEnt(tele_activator,"targetname").origin);
                    level.activ setPlayerAngles(getEnt(tele_activator,"targetname").angles);
                }
                if(!isDefined(old) || !old)
                {
                    level.activ takeAllWeapons();
                }
                if(isDefined(weap) && isDefined(ammo))
                {
                    level.activ giveWeapon(weap);
                    if(ammo == "max")
                        level.activ giveMaxAmmo( weap );
                    else
                        level.activ setWeaponAmmoClip( weap, ammo );
                    level.activ switchToWeapon( weap );
                }
            }
            iprintlnBold("^2" + Player.name + " ^5Has Entered the ^2" + roomname);

              player freezeControls(true);
      			     level.activ freezeControls(true);
      			         wait 1;

      			  player iPrintLnBold("^23");
      			     level.activ iPrintLnBold("^23");
      			         wait 1;

      			  player iPrintLnBold("^32");
      			    level.activ iPrintLnBold("^32");
      			         wait 1;

      			  player iPrintLnBold("^91");
      			     level.activ iPrintLnBold("^91");
      			         wait 1;

      			  player iPrintLnBold("^6Fight!");
      			     level.activ iPrintLnBold("^6Fight!");
      			         wait 1;

      			player freezeControls(false);
      			level.activ freezeControls(false);
      			   wait 0.0125;

               if(!rush)
                   WaitForDeath(player);
               level.playerinroom = 0;
               iPrintLnBold("^2" + player.name + " ^5has ^9DIED!");
        }
        else
        {
            printLn("Try Again Later!");
            return;
        }
    }
}
DefinedEntities(trig,tele_jumper,telew_activator)
{
    if(!isDefined(trig) || !isDefined(tele_jumper))
        return 0;
    return 1;
}
WaitForDeath(player)
{
    while(isDefined(player) && isAlive(player))
        wait 0.05;
}

jumpweapon() //Gives the player a sniper at the end of the Jump Room
{
  trig = getEnt("jumpweapon","targetname");

  for(;;)
  {
    trig waittill("trigger", who);
     who giveWeapon("m40a3_mp");
     who giveMaxAmmo("m40a3_mp");
     who switchToWeapon("m40a3_mp");
   }
}
