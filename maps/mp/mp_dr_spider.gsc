main()
{
thread dooro();
thread doorx();
thread doora();
thread doorq();
thread doorl();
thread vecicka();
}


dooro()
{
trigdoor = getent ("trap1trig" , "targetname");
dooro = getent ("trap1" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
dooro moveX (-300 , 1);
wait 5;
dooro moveX (200 , 1);
wait 1;
dooro moveX (-200 , 1);
wait 1;
dooro moveX (250 , 1);
wait 1;
dooro moveX (-250 , 1);
wait 1;
dooro moveX (300 , 1);
}



doorx()
{
trigdoor = getent ("trap2trig" , "targetname");
doorx = getent ("trap2" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
doorx moveZ (-1000 , 3);
wait 15;
doorx moveZ (1000 , 3);
wait 3;
}

doora()
{
trigdoor = getent ("trap3trig" , "targetname");
doora = getent ("trap3" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
doora moveZ (1000 ,0.01);
}


doorq()
{
trigdoor = getent ("trap5trig" , "targetname");
doorq = getent ("trap5" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
doorq moveZ (-2000 , 1);
}

doorl()
{
trigdoor = getent ("trap6trig" , "targetname");
doorl = getent ("trap6" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
doorl moveX (-1000 , 2);
wait 4;
doorl moveY (1000 , 6);
}

vecicka()
{
trigdoor = getent ("trap7trig" , "targetname");
vecicka = getent ("trap7" ,"targetname" );
trigdoor waittill ("trigger",player);
trigdoor delete ();
vecicka moveZ (230 , 8);
}