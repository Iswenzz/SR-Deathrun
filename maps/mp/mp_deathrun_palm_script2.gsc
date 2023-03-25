//nekoukej!!
//nekoukej!!
//nekoukej!!

main()
{
level._effect[ "heli_crash_dust" ]			        = loadfx( "dust/heli_crash_dust" );

thread pad ();
thread kolesa ();
thread kolesa1 ();
thread prepadlina ();
}
pad()
{
pad = getent( "pad" , "targetname" );
player = getent( "pad_player" , "targetname" );
origin1 = getent( "origin1" , "targetname" );
origin2 = getent( "origin2" , "targetname" );
origin3 = getent( "origin3" , "targetname" );
origin4 = getent( "origin4" , "targetname" );
pad_trig = getent( "t6" , "targetname" );

pad_trig waittill ("trigger");
pad_trig delete ();
pad movez ( -512, 1, 0.01, 0.01);
wait 0.86;
player delete ();

pad waittill ("movedone");
earthquake( 3, 1, pad.origin, 1024 );

heli_crash_dust = playFx(level._effect["heli_crash_dust"], ( origin1.origin), anglestoforward ((270,90,0)), anglestoup((0,0,0)));	
heli_crash_dust = playFx(level._effect["heli_crash_dust"], ( origin2.origin), anglestoforward ((270,90,0)), anglestoup((0,0,0)));	
heli_crash_dust = playFx(level._effect["heli_crash_dust"], ( origin3.origin), anglestoforward ((270,90,0)), anglestoup((0,0,0)));	
heli_crash_dust = playFx(level._effect["heli_crash_dust"], ( origin4.origin), anglestoforward ((270,90,0)), anglestoup((0,0,0)));

}

kolesa()
{
koleso1 = getent( "koleso1" , "targetname" );
koleso2 = getent( "koleso2" , "targetname" );
trig = getent( "t3" , "targetname" );

trig waittill ("trigger");
trig delete ();
koleso1 rotateRoll( 90, 6, 0.1, 0.1  );
wait 5;
        while( 1 )
	{
		koleso1 rotateRoll( 360, 6, 0.1, 0.1  );
		koleso2 rotateRoll( -360, 6, 0.1, 0.1  );
                wait 0.01;
	}

}

kolesa1()
{
koleso3 = getent( "koleso3" , "targetname" );
koleso4 = getent( "koleso4" , "targetname" );
trig = getent( "t4" , "targetname" );

trig waittill ("trigger");
trig delete ();
koleso4 rotatePitch( 90, 1.8, 0.4, 0.4  );
wait 3; 

        while( 1 )
	{
		koleso3 rotatePitch( -90, 1.8, 0.4, 0.4  );
		koleso4 rotatePitch( 90, 1.8, 0.4, 0.4  );
		wait 3;
		koleso3 rotatePitch( -90, 1.8, 0.4, 0.4 );
		koleso4 rotatePitch( 90, 1.8, 0.4, 0.4  );
		wait 3;
	}

}

prepadlina()
{
prepadlina = getent( "prepadlina" , "targetname" );
trig = getent( "t2" , "targetname" );

trig waittill ("trigger");
trig delete ();
prepadlina delete ();

}

