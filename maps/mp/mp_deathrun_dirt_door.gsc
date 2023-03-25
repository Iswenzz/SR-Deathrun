main()
{
thread door_a();
thread door_b();
thread door_c();
}

door_a()
{
door_a = getentarray ("door_a" ,"targetname");

wait 15;

door_a[randomInt(door_a.size)] movez(-481, 2 );

}

door_b()
{
	trig = getent ("door_b_trig" , "targetname");
	trig waittill ("trigger",player);
	trig delete ();
	iprintlnbold ("^3---^1" + player.name + "^3--- ^2in second part!!");
	ambientPlay("doorb_dirt");
}

door_c()
{
	trig = getent ("door_c_trig" , "targetname");
	door_b = getent ("door_c" ,"targetname" );
	trig waittill ("trigger",player);
	trig delete ();
	iprintlnbold ("^3---^1" + player.name + "^3--- ^2open FINAL door!");
	ambientPlay("doorc_dirt");
	door_b movez (129 , 2);
}