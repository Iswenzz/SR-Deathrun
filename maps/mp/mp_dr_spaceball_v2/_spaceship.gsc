main()
{
thread spaceship();
thread move2();
thread move3();
thread move4();
thread move5();
thread move6();
thread move7();
thread move8();
thread move9();
thread move10();
thread move11();
}

spaceship()
{
level.ship = getent("spaceship","targetname");
go1 = getent("go1","targetname");
acti = getent("acti1","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go1.origin, 2 );
level.ship rotateto ( go1.angles, 2 );
level.ship waittill("movedone");
}
}

move2()
{
go2 = getent("go2","targetname");
acti = getent("acti2","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go2.origin, 2 );
level.ship rotateto ( go2.angles, 2 );
level.ship waittill("movedone");
}
}

move3()
{
go3 = getent("go3","targetname");
acti = getent("acti3","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go3.origin, 3 );
level.ship rotateto ( go3.angles, 3 );
level.ship waittill("movedone");
}
}

move4()
{
go4 = getent("go4","targetname");
acti = getent("acti4","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go4.origin, 3 );
level.ship rotateto ( go4.angles, 2 );
level.ship waittill("movedone");
}
}

move5()
{
go5 = getent("go5","targetname");
acti = getent("acti5","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go5.origin, 3 );
level.ship rotateto ( go5.angles, 4);
level.ship waittill("movedone");
}
}

move6()
{
go6 = getent("go6","targetname");
acti = getent("acti6","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go6.origin, 3 );
level.ship rotateto ( go6.angles, 3);
level.ship waittill("movedone");
}
}

move7()
{
go7_1 = getent("go7_1","targetname");
go7_2 = getent("go7_2","targetname");
acti = getent("acti7","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go7_1.origin, 3 );
level.ship rotateto ( go7_1.angles, 4);
wait 4;
level.ship moveto( go7_2.origin, 5 );
level.ship rotateto ( go7_2.angles, 6);
level.ship waittill("movedone");
//level.ship waittill("rotatedone"); <-- just bugged the player while rotate was done....
}
}

move8()
{
go8 = getent("go8","targetname");
acti = getent("acti8","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go8.origin, 3 );
level.ship rotateto ( go8.angles, 3);
level.ship waittill("movedone");
}
}

move9()
{
go9 = getent("go9","targetname");
acti = getent("acti9","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go9.origin, 3 );
level.ship rotateto ( go9.angles, 3);
level.ship waittill("movedone");
}
}

move10()
{
go10 = getent("go10","targetname");
acti = getent("acti10","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go10.origin, 3 );
level.ship rotateto ( go10.angles, 3);
level.ship waittill("movedone");
}
}

move11()
{
go11 = getent("go11","targetname");
acti = getent("acti11","targetname");
acti waittill("trigger", user );
acti delete();
{
level.ship moveto( go11.origin, 3 );
level.ship rotateto ( go11.angles, 3);
level.ship waittill("movedone");
}
}

