/* Map by Radon
Xfire: radionactive

Death Run mod by BraX.
Official Death Run Homepage: www.brax-online.pl */

main()
{
    getEnt("killfield","targetname") thread killfield();
    getEnt("drop1","targetname") thread dropblock(1);
    getEnt("drop2","targetname") thread dropblock(2);
    getEnt("drop3","targetname") thread dropblock(3);
    getEnt("drop4","targetname") thread dropblock(4);
    getEnt("drop5","targetname") thread dropblock(5);
    getEnt("drop6","targetname") thread dropblock(6);
    getEnt("drop7","targetname") thread dropblock(7);
    getEnt("drop8","targetname") thread dropblock(8);
    getEnt("drop9","targetname") thread dropblock(9);
    getEnt("drop10","targetname") thread dropblock(10);
    getEnt("movethespawnceiling","targetname") thread movethespawn();
    getEnt("openthedoorplease","targetname") thread revealtheactivator();
    getEnt("boardhider","targetname") thread hidetheboardofdoom(); //hides the wooden plank. I hope you have good memory.
    addTriggerToList("boardhider");
    getEnt("breakoffwoodenplatform","targetname") thread breakwoodenplatform(); //breaks off part of the long, wooden platform, spins it, and repeatedly raises and lowers it
    addTriggerToList("breakoffwoodenplatform");
    getEnt("secondplatform","targetname") thread secondplatform(); //spins the second platform, making it difficult to get on and off
    addTriggerToList("secondplatform");
    getEnt("demonwallactivator","targetname") thread afksmasher(); //jettisons all players off of the spawn platform
    addTriggerToList("demonwallactivator");
    getEnt("theredplatformbomber","targetname") thread reddeath(); //spins the long red platform
    addTriggerToList("theredplatformbomber");
    getEnt("saveyourassbutton","targetname") thread saveyourass(); //saves the activator - only works once
    addTriggerToList("saveyourassbutton");
    getEnt("saveyourassbutton2","targetname") thread saveyourass2(); //saves the activator with a magic carpet - only works once
    addTriggerToList("saveyourassbutton2");
    getEnt("motionblockofmotion","targetname") thread motionblockofmotionmovement();
    getEnt("lolblockactivator","targetname") thread lolblockactivator();
}

dropblock(number)
{
    for(;;)
    {
        self waittill("trigger",player);
        wait RandomIntRange(1,11);
        getEnt("drop" + number + "block","targetname") MoveZ(-192,1);
        wait 1;
        getEnt("drop" + number + "block","targetname") MoveZ(192,1);
        wait 1;
    }
}
saveyourass2()
{
    self waittill("trigger",player);
    getEnt("magiccarpet","targetname") MoveY(6144-3776,2,1,1);
}
revealtheactivator()
{
    self waittill("trigger",player);
    iprintlnbold("^7" + player.name + " has reached the ^1Activator ^7first!");
    getEnt("thedoortotheactivator","targetname") MoveX(2496-2240,1);
    getEnt("thedoortotheactivator","targetname") MoveZ(-272,2);
    wait 1;
    getEnt("thedoortotheactivator","targetname") MoveX(2240-2496,1);
}

movethespawn()
{
    self waittill("trigger",player);
    self hide();
    wait 5;
    iprintlnbold(player.name + " has turned on the UFO.");
    spawnplat = getEnt("spawncieling","targetname");
    spawnplat MoveY(2176-3136,4);
    spawnplat MoveX(0 - 1792 - (2304 - 2112),10);
    spawnplat MoveZ(428-640,10);
    wait 5;
    spawnplat MoveZ(-256,1);
}

saveyourass() //save your activator ass. Only works once
{
    self waittill("trigger",player);
    self hide();
    getEnt("saveyourasswall","targetname") MoveY(2048 - 3248,2);
}

reddeath() //slowly spin red platform
{
    self waittill("trigger",player);
    self hide();
    turnmearound = getEnt("spinningreddeath","targetname");
    for(;;)
    {
        turnmearound RotatePitch( 360, 30);
        wait 30;
    }
}

breakwoodenplatform() //break off the wooden platform
{
    self waittill("trigger",player);
    self hide();
    turnmearound = getEnt("woodenplatform1","targetname");
    for(;;)
    {
        turnmearound RotateYaw( 64, 5);
        turnmearound MoveZ( 512, 2, 1, 1);
        wait 5;
        turnmearound RotateYaw( 64, 5);
        turnmearound MoveZ( -512, 2, 1, 1);
        wait 5;
    }
}

motionblockofmotionmovement() //maze
{
    for(;;)
    {
        self MoveY(4992 - 4252,15);
        wait 20;
        self MoveY(4252 - 4992,10);
        wait 20;
    }
}

killfield() //kill players on bottom level
{
    for(;;)
    {
        self waittill("trigger",player);
        player suicide();
        wait 0.05;
    }
}
lolblockactivator() //prank
{
    self waittill("trigger",player);
    iprintln(player.name + " tripped a trap for 5 seconds.");
    getEnt("lolblock","targetname") MoveZ(512,2);
    wait 5;
    getEnt("lolblock","targetname") MoveZ(-512,2);
}
afksmasher() //causes the wall near the entrance to move slowly, pushing AFK players off of the first platform.
{
    self waittill("trigger", player);
    self hide();
    iprintlnbold("All players on the spawning platform");
    iprintlnbold("will be jettisoned in 10 seconds.");
    wait 5;
    getEnt("demonwall","targetname") MoveY(3136 - 2096,5);
    wait 5;
    getEnt("spawnplatformofdeath","targetname") MoveZ(-191,1);
}
secondplatform() //spins the second platform over and over again
{
    self waittill("trigger", player);
    self hide();
    turnmearound = getEnt("secondplatforment","targetname");
    turnmearound RotateYaw( 360, 5, 5);
    for(;;)
    {
        turnmearound RotateYaw( 360, 5);
        wait 5;
    }
}
hidetheboardofdoom() //makes the first wooden plank invisible
{
    self waittill("trigger", player);
    self hide();
    boardofdoom = getEnt("theboardfromhell","targetname");
    boardofdoom MoveZ(-10,1);
    boardofdoom hide();
}
addTriggerToList(name)
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}

//Backup 4:39 PM @ 28/6/2011
/*
debugDvars() //omitted from release
{

}

saveyourass() //save your activator ass. Only works once
{
    self waittill("trigger",player);
    getEnt("saveyourasswall","targetname") MoveY(2048 - 3248,2);
}

reddeath() //slowly spin red platform
{
    self waittill("trigger",player);
    turnmearound = getEnt("spinningreddeath","targetname");
    for(;;)
    {
        turnmearound RotatePitch( 360, 20);
        wait 20;
    }
}

breakwoodenplatform() //break off the wooden platform
{
    self waittill("trigger",player);
    turnmearound = getEnt("woodenplatform1","targetname");
    for(;;)
    {
        turnmearound RotateYaw( 64, 5);
        turnmearound MoveZ( 512, 2, 1, 1);
        wait 5;
        turnmearound RotateYaw( 64, 5);
        turnmearound MoveZ( -512, 2, 1, 1);
        wait 5;
    }
}

motionblockofmotionmovement() //maze
{
    for(;;)
    {
        self MoveY(4992 - 4252,15);
        wait 20;
        self MoveY(4252 - 4992,10);
        wait 20;
    }
}

killfield() //kill players on bottom level
{
    for(;;)
    {
        self waittill("trigger",player);
        player suicide();
        wait 0.05;
    }
}
lolblockactivator() //prank
{
    self waittill("trigger",player);
    iprintln(player.name + " tripped a trap for 5 seconds.");
    getEnt("lolblock","targetname") MoveZ(512,2);
    wait 5;
    getEnt("lolblock","targetname") MoveZ(-512,2);
}
afksmasher() //causes the wall near the entrance to move slowly, pushing AFK players off of the first platform.
{
    self waittill("trigger", player);
    iprintlnbold("All players on the spawning platform");
    iprintlnbold("will be jettisoned in 10 seconds.");
    wait 5;
    getEnt("demonwall","targetname") MoveY(3136 - 2096,5);
    wait 5;
    getEnt("spawnplatformofdeath","targetname") MoveZ(-191,1);
}
secondplatform() //spins the second platform over and over again
{
    self waittill("trigger", player);
    turnmearound = getEnt("secondplatforment","targetname");
    turnmearound RotateYaw( 360, 5, 5);
    for(;;)
    {
        turnmearound RotateYaw( 360, 5);
        wait 5;
    }
}
hidetheboardofdoom() //makes the first wooden plank invisible
{
    self waittill("trigger", player);
    boardofdoom = getEnt("theboardfromhell","targetname");
    boardofdoom hide();
}
addTriggerToList(name)
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}
*/