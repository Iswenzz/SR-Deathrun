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

	thread leteca_kopa1();
	thread leteca_kopa2();

}


leteca_kopa1()

{

	kopa_leteca1 = getEnt( "kopa_leteca1", "targetname" );
	killtrigger = getEnt( "kill-trig_kopa1", "targetname" );

	killtrigger enableLinkTo();
	killtrigger linkTo( kopa_leteca1 );

	while( 1 )
	{

	kopa_leteca1 movey ( 256, 2 );
	wait 2;
	kopa_leteca1 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca1 movex ( 608, 5 );
	wait 5;
	kopa_leteca1 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca1 movey ( -256, 2 );
	wait 2;
	kopa_leteca1 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca1 movex ( -608, 5 );
	wait 5;
	kopa_leteca1 rotateYaw( -90, 0.5 );
	wait 0.5;

	}
}


leteca_kopa2()

{

	kopa_leteca2 = getEnt( "kopa_leteca2", "targetname" );
	killtrigger = getEnt( "kill-trig_kopa2", "targetname" );

	killtrigger enableLinkTo();
	killtrigger linkTo( kopa_leteca2 );

	while( 1 )
	{

	kopa_leteca2 movey ( -256, 2 );
	wait 2;
	kopa_leteca2 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca2 movex ( -608, 5 );
	wait 5;
	kopa_leteca2 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca2 movey ( 256, 2 );
	wait 2;
	kopa_leteca2 rotateYaw( -90, 0.5 );
	wait 0.5;
	kopa_leteca2 movex ( 608, 5 );
	wait 5;
	kopa_leteca2 rotateYaw( -90, 0.5 );
	wait 0.5;


	}
}
