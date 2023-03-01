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

	thread trap1();


}


trap1()

{
	trig_t1 = getEnt( "trap1_trigger", "targetname" );
	brushGroup1 = getEntArray( "trap1_brush1", "targetname" );
	brushGroup2 = getEntArray( "trap1_brush2", "targetname" );
	brush3t1 = getEnt( "trap1_upitnik", "targetname" );
	brush4t1 = getEnt( "trap1_blok", "targetname" );
	brush5t1 = getEnt( "trap1_uputa", "targetname" );
	brush6t1 = getEnt( "upitnik_t1", "targetname" );
	fxt1 = getent ( "t1_fx" ,"targetname" ); //origin
	fxt1_2 = getent ( "t1_fx2" ,"targetname" ); //origin
	fxt1_3 = getent ( "t1_fx3" ,"targetname" ); //origin
	fxt1_4 = getent ( "t1_fx4" ,"targetname" ); //origin
	fxt1_5 = getent ( "t1_fx5" ,"targetname" ); //origin
	
	brush6t1 hide();


	trig_t1 waittill("trigger", other);
	trig_t1 delete();
	brush3t1 delete();
	brush5t1 delete();
	brush4t1 movez( -32, 0.2 );

	brush6t1 show();

	brushGroup1[randomInt(brushGroup1.size)] notSolid();
	brushGroup2[randomInt(brushGroup2.size)] notSolid();

	fx = PlayFX( level._effect["flashbang"], fxt1.origin );
	fxt1 PlaySound("blockhit");

	fx2 = PlayFX( level._effect["circuit_breaker"], fxt1_2.origin );
	fx3 = PlayFX( level._effect["circuit_breaker"], fxt1_3.origin );
	fx4 = PlayFX( level._effect["circuit_breaker"], fxt1_4.origin );
	fx5 = PlayFX( level._effect["circuit_breaker"], fxt1_5.origin );

	wait 1;

}