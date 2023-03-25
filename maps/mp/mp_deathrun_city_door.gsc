main()
{
thread door_a();
thread door_b();
}

door_a()
{
	trig = getent ("door_a_trig" , "targetname");
	door_a = getent ("door_a" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
	iprintlnbold ("^1" + player.name + " open door!");
	ambientPlay("doora");
	door_a movez (193 , 5);
}

door_b()
{
	trig = getent ("door_b_trig" , "targetname");
	door_b = getent ("door_b" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
	iprintlnbold ("^1" + player.name + " open FINAL door!");
	ambientPlay("doorb");
	door_b movez (257 , 5);
}