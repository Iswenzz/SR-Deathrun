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

	thread trap10();



}


trap10()

{
	gomba_t10 = getEnt( "gomba_t10", "targetname" );
	killtrigger_t10 = getEnt( "killtrigger_t10", "targetname" );


	trig_t10 = getEnt( "trap10_trigger", "targetname" );
	brush1t10 = getEnt( "trap10_upitnik", "targetname" );
	brush2t10 = getEnt( "trap10_blok", "targetname" );
	brush3t10 = getEnt( "trap10_uputa", "targetname" );
	fxt10 = getent ( "t10_fx" ,"targetname" ); //origin

	origin_t10 = getent ( "origin_t10" ,"targetname" ); //origin

	killtrigger_t10 enableLinkTo();
	killtrigger_t10 linkTo( gomba_t10 );

	trig_t10 waittill("trigger", other);

	trig_t10 delete();
	brush1t10 delete();
	brush3t10 delete();
	brush2t10 movez( -32, 0.4 );

	fx = PlayFX( level._effect["artillery_flash"], fxt10.origin );
	fxt10 PlaySound("blockhit");



	while( 1 )
	{

	gomba_t10 PlaySound("bowser");

	gomba_t10 movez( -144, 0.5 );
	wait 0.5;
	earthquake( 2, 1, origin_t10.origin, 300 );

	wait 2;

	gomba_t10 PlaySound("hydraulics");
	gomba_t10 movez( 144, 1 );
	wait 5;
	}

}