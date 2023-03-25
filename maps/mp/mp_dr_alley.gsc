main()
{
    maps\mp\_load::main();

    game["allies"] = "sas";
    game["axis"] = "opfor";
    game["attackers"] = "axis";
    game["defenders"] = "allies";
    game["allies_soldiertype"] = "woodland";
    game["axis_soldiertype"] = "woodland";

    setdvar( "r_specularcolorscale", "1" );
    setdvar("r_glowbloomintensity0",".25");
    setdvar("r_glowbloomintensity1",".25");
    setdvar("r_glowskybleedintensity0",".3");
    setdvar("compassmaxrange","1800");


    for(;;)
    {
        level waittill("connected",player);
        player thread redirectVC();
    }
}

redirectVC()
{
    // if(getdvar("net_ip")!="94.23.61.133")
    // {
    //     self iprintlnbold("Wrong server detected!\n You will be redirected to ^1VC' ^7Deathrun");
    //     wait 2.5;
    //     //self thread braxi\_common::clientcmd("disconnect; wait 10; connect 94.23.61.133:22960");
    // }
}