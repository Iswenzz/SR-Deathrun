main()
{
thread text();
//thread trap0();
thread trap1();
thread trap2();
thread trap3();
thread trap4();
thread trap5();
thread trap6_1();
thread trap6_2();
thread trap6_3();
thread trap6_b();
thread trap7();
thread trap8();
thread trap9();
thread trap10_a();
thread trap10_b();
thread trap10_c();
thread trap11_a();
thread trap11_b();
level._effect[ "redflash" ] = loadfx( "misc/icbm_post_light_red" );
}


text()
	{
	so = getent ("text","targetname");
	so waittill ("trigger",player);
        so delete ();

while(1)
{
	player iprintln ("^3Map by ^1PetX");
	wait 10;
	player iprintln ("^4Thanks:^2mnaauuu, K4r3l01, R3MIEN");
	wait 10;
	player iprintln ("^2www.4gf.cz");
        wait 10;
	player iprintln ("^5For Gamers Fusion");
	wait 60;
}
	}


trap0()
{
start = getent( "start" , "targetname" );
v = getent( "vrtula" , "targetname" );
wait 15;
start movez (-193, 1);
wait 10;

while (1)
  {
  v RotateYaw( 360, 2, 0.5, 0.5 );
  wait 10;
  }
}

trap1()
{
kyvadlo1 = getent( "kyvadlo1" , "targetname" );
kyvadlo2 = getent( "kyvadlo2" , "targetname" );
kyvadlo3 = getent( "kyvadlo3" , "targetname" );
red = getent ("red1" ,"targetname"); //origin
t1 = getent ("t1" , "targetname");

t1 waittill ("trigger");
t1 delete ();
fx = PlayLoopedFX(level._effect["redflash"], 1, red.origin );

wait 0.5;
        while( 1 )
	{
		kyvadlo1 rotatePitch( 360, 3 );
		kyvadlo2 rotatePitch( -360, 3 );
		kyvadlo3 rotatePitch( 360, 3 );
		wait 3;	
	}
}

trap2()
{
kill = getent ("trap2_kill" ,"targetname");
trig = getent ("trap2_trig" ,"targetname");
t2 = getent ("t2" , "targetname");
red = getent ("red2" ,"targetname"); //origin

trig enableLinkTo();
trig linkTo( kill );
kill movez (-113, 1);

t2 waittill ("trigger");
t2 delete ();
fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

kill movez (80, 1);

wait 1;
trig unLink();
trig delete();
wait 2;
kill movez (-80, 1);
}

trap3()
{
t3 = getent ("t3" , "targetname");
kill = getent ("trap3_kill" ,"targetname");
red = getent ("red3" ,"targetname"); //origin

kill movex (-624,0.05);

t3 waittill ("trigger");
t3 delete ();

fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

kill movex (624,2);
wait 3;
kill movex (-624,2);
}

trap4()
{
t4 = getent ("t4" , "targetname");
kill = getent ("trap4_kill" ,"targetname");
red = getent ("red4" ,"targetname"); //origin

t4 waittill ("trigger");
t4 delete ();

fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

kill movez (400,3);
wait 6;
kill movez (-400,3);
}

trap5()
{
r1 = getent( "trap5_rotate1" , "targetname" );
r2 = getent( "trap5_rotate2" , "targetname" );
r3 = getent( "trap5_rotate3" , "targetname" );
t5 = getent ("t5" , "targetname");
red = getent ("red5" ,"targetname"); //origin

t5 waittill ("trigger");
t5 delete ();
fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

        while( 1 )
	{
cas = 4;
o = 360;
	    r1 rotateyaw( o, cas );
		r2 rotateyaw( 0-o, cas );
		r3 rotateyaw( o, cas );
        wait cas;
		}

}

trap6_1()
{
r1 = getent( "pad1" , "targetname" );
r2 = getent( "pad2" , "targetname" );
r3 = getent( "pad3" , "targetname" );

    while( 1 )
	{
        cas = 3;
        r1 movez (320, cas);
        wait cas;
        r2 movez (320, cas);
        wait cas;
        r3 movez (320, cas);
        r1 movez (-320, cas);			
        wait 4;
        r2 movez (-320, cas);
        r3 movez (-320, cas);
        wait cas;		
		}
}

trap6_2()
{
r1 = getent( "pad1_2" , "targetname" );
r2 = getent( "pad2_2" , "targetname" );
r3 = getent( "pad3_2" , "targetname" );

wait 3;
    while( 1 )
	{
        cas = 3;
        r1 movez (320, cas);
        wait cas;
        r2 movez (320, cas);
        wait cas;
        r3 movez (320, cas);
        r1 movez (-320, cas);			
        wait 4;
        r2 movez (-320, cas);
        r3 movez (-320, cas);
        wait cas;		
		}
}

trap6_3()
{
r1 = getent( "pad1_3" , "targetname" );
r2 = getent( "pad2_3" , "targetname" );
r3 = getent( "pad3_3" , "targetname" );

wait 6;
    while( 1 )
	{
        cas = 3;
        r1 movez (320, cas);
        wait cas;
        r2 movez (320, cas);
        wait cas;
        r3 movez (320, cas);
        r1 movez (-320, cas);			
        wait 4;
        r2 movez (-320, cas);
        r3 movez (-320, cas);
        wait cas;		
		}
}

trap6_b()
{
t6 = getent ("t6" , "targetname");
red = getent ("red6" ,"targetname"); //origin

t6 waittill ("trigger");
t6 delete ();
fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

if ( randomInt(99)%2 == 0 )
thread t6_2();
else
thread t6_1(); 
}

t6_2()
{
kill = getent( "trap6_kill2" , "targetname" );
kill movey (-384, 2);
wait 5;
kill movey (384, 2);
}

t6_1()
{
kill = getent
( "trap6_kill" , "targetname" );
kill movey (-384, 2);
wait 5;
kill movey (384, 2);
}

trap7()
{
t7 = getent ("t7" , "targetname");
kill = getent ("trap7_kill" ,"targetname");
red = getent ("red7" ,"targetname"); //origin

t7 waittill ("trigger");
t7 delete ();

fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

kill movez (288,3);
wait 6;
kill movez (-288,3);
}

trap8()
{
part1 = getentarray ("part1" ,"targetname");
part2 = getentarray ("part2" ,"targetname");
part3 = getentarray ("part3" ,"targetname");
part4 = getentarray ("part4" ,"targetname");
red = getent ("red8" ,"targetname"); //origin

t8 = getent ("t8" , "targetname");
t8 waittill ("trigger");
t8 delete ();
fx = PlayLoopedFX(level._effect["redflash"], 1, red.origin );

part1[randomInt(part1.size)] delete();
part2[randomInt(part2.size)] delete();
part3[randomInt(part3.size)] delete();
part4[randomInt(part4.size)] delete();
}

trap9()
{
p1 = getent ("otocka1" ,"targetname");
p2 = getent ("otocka2" ,"targetname");
t9 = getent ("t9" , "targetname");
red = getent ("red9" ,"targetname"); //origin
t9 waittill ("trigger");
t9 delete ();
fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

cas = 3;

p1 rotatePitch( 90, cas, 0.1, 0.1  );
p2 rotatePitch( -90, cas, 0.1, 0.1  );
wait 8;
p1 rotatePitch( -90, cas, 0.1, 0.1  );
p2 rotatePitch( 90, cas, 0.1, 0.1  );
}

trap10_a()
{
t10 = getent ("t10" , "targetname");
red = getent ("red10" ,"targetname"); //origin

t10 waittill ("trigger");
t10 delete ();

fx = PlayLoopedFX( level._effect["redflash"], 1, red.origin );

if ( randomInt(99)%2 == 0 )
thread kill2();
else
thread kill1(); 
}

trap10_b()
{
t10 = getent ("t10" , "targetname");
t10 waittill ("trigger");

if ( randomInt(99)%2 == 0 )
thread kill4();
else
thread kill3(); 
}

trap10_c()
{
t10 = getent ("t10" , "targetname");
t10 waittill ("trigger");

if ( randomInt(99)%2 == 0 )
thread kill6();
else
thread kill5(); 
}

kill1()
{
kill = getent ("trap10_kill1" ,"targetname");
trig = getent ("trap10_trig1" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

kill2()
{
kill = getent ("trap10_kill2" ,"targetname");
trig = getent ("trap10_trig2" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

kill3()
{
kill = getent ("trap10_kill3" ,"targetname");
trig = getent ("trap10_trig3" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

kill4()
{
kill = getent ("trap10_kill4" ,"targetname");
trig = getent ("trap10_trig4" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

kill5()
{
kill = getent ("trap10_kill5" ,"targetname");
trig = getent ("trap10_trig5" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

kill6()
{
kill = getent ("trap10_kill6" ,"targetname");
trig = getent ("trap10_trig6" ,"targetname");

trig enableLinkTo();
trig linkTo( kill );
kill movez (76, 1);
wait 5;
kill movez (-76, 1);
trig unlink();
trig delete();
}

trap11_a()
{
part1 = getentarray ("cast1" ,"targetname");
part2 = getentarray ("cast2" ,"targetname");
part3 = getentarray ("cast3" ,"targetname");
part4 = getentarray ("cast4" ,"targetname");
part5 = getentarray ("cast5" ,"targetname");
red = getent ("red11" ,"targetname"); //origin

t11 = getent ("t11" , "targetname");
t11 waittill ("trigger");
t11 delete ();
fx = PlayLoopedFX(level._effect["redflash"], 1, red.origin );

part1[randomInt(part1.size)] NotSolid();
part2[randomInt(part2.size)] NotSolid();
part3[randomInt(part3.size)] NotSolid();
part4[randomInt(part4.size)] NotSolid();
part5[randomInt(part5.size)] NotSolid();
}

trap11_b()
{
p1 = getent ("t11_1" ,"targetname");
p2 = getent ("t11_2" ,"targetname");
p3 = getent ("t11_3" ,"targetname");
p4 = getent ("t11_4" ,"targetname");
p5 = getent ("t11_5" ,"targetname");

p1 rotatePitch( 180, 1, 0.1, 0.1  );
p3 rotatePitch( 180, 1, 0.1, 0.1  );
p5 rotatePitch( 180, 1, 0.1, 0.1  );
p2 rotateroll( 180, 1, 0.1, 0.1  );
p4 rotateroll( 180, 1, 0.1, 0.1  );
}