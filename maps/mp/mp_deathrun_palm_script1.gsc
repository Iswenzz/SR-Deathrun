//nekoukej!!
//nekoukej!!
//nekoukej!!
main()
{
thread pisek ();
thread palm_move ();
thread palm_rotate ();
thread prepadliste ();
thread prepadliste1 ();
thread prepadliste2 ();
thread prepadliste3 ();
thread prepadliste4 ();
thread prepadliste5 ();
thread prepadliste6 ();
thread prepadliste7 ();
thread prepadliste8 ();
thread start ();
thread end ();
thread kyvadla ();
}

pisek()
{
pisek = getent( "pisek" , "targetname" );
pisek_trig = getent( "t8" , "targetname" );

pisek_trig waittill ("trigger");
pisek_trig delete ();
pisek movez ( -128, 2, 0.4, 0.4);

thread smrt1 ();
}

smrt1()
{
	smrt1 = getentarray("smrt1" , "targetname");
	if (smrt1.size > 0)
	                 
	for(i = 0; i < smrt1.size; i++)
	{
		smrt1[i] thread smrt_think();
	}	
}

smrt_think()
{
	while (1)
	{
		self waittill ("trigger",other);
		
		if(isPlayer(other))
			other thread smrt_kill(self);
	}
}

smrt_kill(trigger)
{
	if(isDefined(self.smrt))
		return;
		
	self.smrt = true;

	if(isdefined(self) && self istouching(trigger))
	{
		origin = self getorigin();
		range = 300;
		maxdamage = 10;
		mindamage = 1;

		radiusDamage(origin, range, maxdamage, mindamage);
                wait 1;
		radiusDamage(origin, range, maxdamage, mindamage);
	}
	
	self.smrt = undefined;
}

palm_move()
{
palm1_mov = getent( "palm1_move" , "targetname" );
palm2_mov = getent ( "palm2_move" , "targetname" );
palm3_mov = getent ( "palm3_move" , "targetname" );
palm_move_trig = getent ( "t7" , "targetname" );

palm_move_trig waittill ("trigger");
palm_move_trig delete ();

while (1)
{
palm1_mov movex ( -592, 4, 0.4, 0.4);
wait 5;
palm2_mov movex ( 296, 4, 0.4, 0.4);
wait 5;
palm3_mov movex ( 592, 4, 0.4, 0.4);
wait 5;
palm3_mov movex ( -592, 4, 0.4, 0.4);
wait 5;
palm2_mov movex ( -296, 4, 0.4, 0.4);
wait 5;
palm1_mov movex ( 592, 4, 0.4, 0.4);
wait 5;
}
}

palm_rotate()
{
rotate = getent( "rotate" , "targetname" );
rotate_trig = getent( "t5" , "targetname" );

rotate_trig waittill ("trigger");
rotate_trig delete ();

while (1)
  {
  rotate RotateYaw( 360, 2, 0.5, 0.5 );
  wait 5;
  }
}

prepadliste()
{
prepadliste = getent( "prepadliste_player" , "targetname" );
prepadliste_trig = getent( "t1" , "targetname" );

prepadliste_trig waittill ("trigger");
prepadliste_trig delete ();
prepadliste delete ();

}

prepadliste8()
{
prepadliste8 = getent( "prepadliste8" , "targetname" );
prepadliste_trig8 = getent( "prepadliste_trig8" , "targetname" );

prepadliste_trig8 waittill ("trigger");
prepadliste8 delete ();
}

prepadliste7()
{
prepadliste7 = getent( "prepadliste7" , "targetname" );
prepadliste_trig7 = getent( "prepadliste_trig7" , "targetname" );

prepadliste_trig7 waittill ("trigger");
prepadliste7 delete ();
}

prepadliste6()
{
prepadliste6 = getent( "prepadliste6" , "targetname" );
prepadliste_trig6 = getent( "prepadliste_trig6" , "targetname" );

prepadliste_trig6 waittill ("trigger");
prepadliste6 delete ();
}

prepadliste5()
{
prepadliste5 = getent( "prepadliste5" , "targetname" );
prepadliste_trig5 = getent( "prepadliste_trig5" , "targetname" );

prepadliste_trig5 waittill ("trigger");
prepadliste5 delete ();
}

prepadliste4()
{
prepadliste4 = getent( "prepadliste4" , "targetname" );
prepadliste_trig4 = getent( "prepadliste_trig4" , "targetname" );

prepadliste_trig4 waittill ("trigger");
prepadliste4 delete ();
}

prepadliste3()
{
prepadliste3 = getent( "prepadliste3" , "targetname" );
prepadliste_trig3 = getent( "prepadliste_trig3" , "targetname" );

prepadliste_trig3 waittill ("trigger");
prepadliste3 delete ();
}

prepadliste2()
{
prepadliste2 = getent( "prepadliste2" , "targetname" );
prepadliste_trig2 = getent( "prepadliste_trig2" , "targetname" );

prepadliste_trig2 waittill ("trigger");
prepadliste2 delete ();
}

prepadliste1()
{
prepadliste1 = getent( "prepadliste1" , "targetname" );
prepadliste_trig1 = getent( "prepadliste_trig1" , "targetname" );

prepadliste_trig1 waittill ("trigger");
prepadliste1 delete ();
}

start()
{
start = getent( "start" , "targetname" );
brzda = getent( "brzda" , "targetname" );

wait 15;
brzda delete ();
start movey ( 960, 30, 0.4, 0.4);
}

end()
{
end = getent( "end" , "targetname" );
end_trig = getent( "end_trig" , "targetname" );

end_trig waittill ("trigger");
end_trig delete ();
end movez ( 130, 5, 0.4, 0.4);
}

kyvadla()
{
kyvadlo1 = getent( "kyvadlo1" , "targetname" );
kyvadlo2 = getent( "kyvadlo2" , "targetname" );

kyvadlo1 rotatePitch( -30, 0.05 );
kyvadlo2 rotatePitch( 30, 0.05 );
wait .05;
        while( 1 )
	{
		kyvadlo1 rotatePitch( 60, 1.8, 0.4, 0.4  );
		kyvadlo2 rotatePitch( -60, 1.8, 0.4, 0.4  );
		wait 1.8;
		kyvadlo1 rotatePitch( -60, 1.8, 0.4, 0.4 );
		kyvadlo2 rotatePitch( 60, 1.8, 0.4, 0.4  );
		wait 1.8;
	}

}
