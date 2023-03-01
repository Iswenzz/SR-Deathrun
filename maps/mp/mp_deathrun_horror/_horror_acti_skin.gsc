main()
{
precacheModel( "playermodel_mw2_usmc_smg_a" );
thread acti_skin();
}

acti_skin() //this is a trigger on the start
{
    trigger = getent ("acti_skin","targetname");
    for(;;)
    {
        trigger waittill ("trigger",user);     
		if ( isPlayer( user ) && isAlive( user ) && !(isdefined( user.acti_skin ) ))
            user setModel("playermodel_mw2_usmc_smg_a");
			user.acti_skin = true;
            wait 2;
    }
}