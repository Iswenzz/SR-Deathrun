main()
{
precacheModel( "playermodel_ghost_recon" );
thread jumper_skin();
}

jumper_skin() //this is a trigger on the start
{
    trigger = getent ("jumpers_skin","targetname");
    for(;;)
    {
        trigger waittill ("trigger",user);     
		if ( isPlayer( user ) && isAlive( user ) && !(isdefined( user.jumper_skin ) )) //when jumper(s) die he(they) get it again
            user detachAll();
            user setModel("playermodel_ghost_recon");
			user.jumper_skin = true;
            wait 0.1;
    }
}