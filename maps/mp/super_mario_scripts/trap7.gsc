//////////////////////////////////////////////////////////////
//////////////////////map by jerkan///////////////////////////
//////////////////////////////////////////////////////////////
/////////////////////XFire: jerkan18//////////////////////////
//////////////////////////////////////////////////////////////
///////////////////e-mail: jerkan@net.hr//////////////////////
//////////////////////////////////////////////////////////////
////////////////www.jerkanmaps.weebly.com/////////////////////
//////////////////////////////////////////////////////////////

main()
{

	thread trap7();

}


trap7()

{
	granata = getEnt( "granata", "targetname" );
	killtrigger_t7 = getEnt( "killtrigger_t7", "targetname" );

	killtrigger_t7 enableLinkTo();
	killtrigger_t7 linkTo( granata );


	trig_t7 = getEnt( "trap7_trigger", "targetname" );
	brush1t7 = getEnt( "trap7_upitnik", "targetname" );
	brush2t7 = getEnt( "trap7_blok", "targetname" );
	brush3t7 = getEnt( "trap7_uputa", "targetname" );
	fxt7 = getent ( "t7_fx" ,"targetname" ); //origin

	t7_top_fx1 = getent ( "t7_top_fx1" ,"targetname" ); //origin
	t7_top_fx2 = getent ( "t7_top_fx2" ,"targetname" ); //origin

	granata movey( -96, 0.2 );
	wait 0.2;

	trig_t7 waittill("trigger", other);

	trig_t7 delete();
	brush1t7 delete();
	brush3t7 delete();
	brush2t7 movez( -32, 0.4 );

	fx = PlayFX( level._effect["artillery_flash"], fxt7.origin );
	fxt7 PlaySound("blockhit");

	wait 0.5;

	while( 1 )
	{

	fx2 = PlayFX( level._effect["artillery_flash"], t7_top_fx1.origin );
	granata PlaySound("smb_cannon");
	granata movey( 1080, 2 );
	wait 2;

	granata hide();
	granata rotateYaw( 180, 1 );
	wait 3;
	granata show();

	fx3 = PlayFX( level._effect["artillery_flash"], t7_top_fx2.origin );
	granata PlaySound("smb_cannon");
	granata movey( -1080, 2 );
	wait 2;

	granata hide();
	granata rotateYaw( 180, 1 );
	wait 3;
	granata show();

	}

}