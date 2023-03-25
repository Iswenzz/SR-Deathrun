//Map Gsc By Easy
//First Deathrun map ever finished in 6 days
//AYYYEE FUCK UR ASS FOR RIPPING THIS GSC U FUCKING FAGGOT LMFAO
//Nice job downloading a ripper faggot :D have fun
//nah but kys :)
//aye but u really just ripped this for my shit scripts? this is legit my first map why u ripping moron?
/*
#######\              ######\        ##\       ########\
##  __##\            ##  __##\       #  |      ##  _____|
## |  ## |##\    ##\ ## /  \__|      \_/       ## |      ######\   #######\ ##\   ##\
#######  |\##\  ##  |\######\                  #####\    \____##\ ##  _____|## |  ## |
##  __##<  \##\##  /  \____##\                 ##  __|   ####### |\######\  ## |  ## |
## |  ## |  \###  /  ##\   ## |                ## |     ##  __## | \____##\ ## |  ## |
## |  ## |   \#  /   \######  |                ########\\####### |#######  |\####### |
\__|  \__|    \_/     \______/                 \________|\_______|\_______/  \____## |
                                                                            ##\   ## |
                                                                            \######  |
                                                                             \______/
/*/
main()
{
maps\mp\_load::main();

game["allies"] = "marines";
game["axies"] = "opfor";
game["attackers"] = "axis";
game["defenders"] = "allies";
game["allies_soldiertype"] = "desert";
game["axis_soldiertype"] = "desert";

	// setdvar("g_speed", "210");
	// setdvar("dr_jumpers_speed", "1.2");
	setDvar("bg_falldamagemaxheight", 300000 );
	setDvar("bg_falldamageminheight", 128000 );

	thread precache();
	thread startmaphints();
	thread startmessages();
	thread trap1();
	thread trap2();
	thread trap3();
	thread trap4();
	thread trap5();
	thread trap6();
	thread trap7();
	thread trap8();
	thread trap9();
	thread trap10();
	thread trap11();
	thread trap12();
	thread trap13();
	thread bigxblock();
	thread movelargeblock();
	thread finishmap();
	thread endgamebrickblast();
	thread endgamedeagle();
	thread endgamejump();
	thread endgameknife();
	thread endgamesniper();
	thread sniperblockmove();
	thread deadpool();
	thread teleporteasytoend();
	thread unlimitedmessages();
	thread bounceroomreturnjumper1();
	thread bounceroomreturnjumper2();
	thread bounceroomreturnacti1();
	thread bounceroomreturnacti2();
	thread pronesecret();
	thread opensecretbounceroom();
	thread smallstartsecret();
	thread givevipstuff();
	thread giveviprpd();
	thread finishsecretroom();
	thread easyactisecret();
	thread easyactiteleport();
	thread teleporteasytoacti();
	thread easygosnipe();
	thread easygoknife();
	thread easygojump();
	thread actimodel1();
	thread actimodel2();
	thread actimodel3();
	thread givesniperinjump();
	thread easygobrick();
	thread easygodeagle();
	thread joker();
	thread terminator();
	thread nico();
	thread nitrosong();
	thread easysecrettsong();
	thread jaxsong();
	thread badsong();
	thread easyguidsong();


	if(!isdefined(level.music))
        level.music=[];

    level.music[0]["song"]    ="H3ctic - Unbreakable";
    level.music[0]["alias"]    ="musicmenu1";
    level.music[1]["song"]    ="H3ctic - Struggling Forward";
    level.music[1]["alias"]    ="musicmenu2";
    level.music[2]["song"]    ="Blackbear - Califormula";
    level.music[2]["alias"]    ="musicmenu3";
    level.music[3]["song"]    ="Kyle - Nothing To Lose";
    level.music[3]["alias"]    ="musicmenu4";
    level.music[4]["song"]    ="Lil Yachty - D To The A";
    level.music[4]["alias"]    ="musicmenu5";
    level.music[5]["song"]    ="6 Dogs - Faygo Dreams";
    level.music[5]["alias"]    ="musicmenu6";



    thread musictrig();

	addTriggerToList("activatetrap1");
	addTriggerToList("activatetrap2");
	addTriggerToList("activatetrap3");
	addTriggerToList("activatetrap4");
	addTriggerToList("activatetrap5");
	addTriggerToList("activatetrap6");
	addTriggerToList("activatetrap7");
	addTriggerToList("activatetrap8");
	addTriggerToList("activatetrap9");
	addTriggerToList("activatetrap10");
	addTriggerToList("activatetrap11");
	addTriggerToList("activatetrap12");
	addTriggerToList("activatetrap13");

	//Precache Joker
	precacheShader("mtl_plr_baa_joker_head");
	precacheShader("mtl_plr_baa_joker_hair");
	precacheShader("mtl_plr_baa_joker_body");
	precacheModel("playermodel_baa_joker");

	//Precache Nico

	precacheShader("mtl_plr_gtaiv_nico_shoes");
	precacheShader("mtl_plr_gtaiv_nico_pants");
	precacheShader("mtl_plr_gtaiv_nico_head");
	precacheShader("mtl_plr_gtaiv_nico_hands");
	precacheShader("mtl_plr_gtaiv_nico_hair");
	precacheShader("mtl_plr_gtaiv_nico_body");
	precacheShader("mtl_plr_gtaiv_nico_teeth");
	precacheModel("playermodel_GTA_IV_NICO");

	//Precache Terminator
	precacheShader("mtl_plr_terminator_body");
	precacheShader("mtl_plr_terminator_head");
	precacheModel("playermodel_terminator");

	//Precache Deadpool
	precacheShader("mtl_deadpool_body");
	precacheShader("mtl_deadpool_eyes");
	precacheShader("mtl_deadpool_guns");
	precacheShader("mtl_deadpool_misc");
	precacheShader("mtl_deadpool_swords");
	precacheModel("deadpool");
	//End Precaching Models


}
//Method to wait for round start deathrun --->     level waittill( "round_started" )
//Method to wait for round end deathrun --->     level waittill( "round_ended" )
//Method To Give XP --->     self braxi\_rank::giveRankXP( "", 50000 );
//Refer to activator with ---->    level.activ
//This is so we can use brick blaster

precache()
{
    precacheItem( "brick_blaster_mp" );
	precacheItem( "rpd_mp" );

}

//End brick blaster pre cacheing
//Music

musicMenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );
    self endon( "music thread terminated" );

    self thread onDeath();
    self thread onDisconnect();

    self.hud_music = [];
    self.selection = 0;

    // create huds
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.6, "left", "top", 2 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 317, 204, 0.70, "center", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText("^9RvS Music Menu");
    self.hud_music[i].glowalpha=1;
    if(isdefined(level.randomcolor))
        self.hud_music[i].glowcolor=level.randomcolor;
    else
        self.hud_music[i].glowcolor=(1,0,0);

    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 357, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("^9Scroll: ^5[{+attack}] ^9| Select: ^5[{+activate}] ^9| Close: ^5[{+frag}]");

    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha=1;
        if(isdefined(level.randomcolor))
            self.hud_music[i].glowcolor=level.randomcolor;
        else
            self.hud_music[i].glowcolor=(1,0,0);

        entry = level.music[j];
        self.hud_music[i] setText(entry["song"]);
    }

    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );

    while(self.sessionstate == "playing")
    {
        wait 0.1;

        if(self attackButtonPressed())
        {
            self.hud_music[3+self.selection].alpha = 0.93;

            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            item = self.hud_music[3+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if(self useButtonPressed())
        {
            iprintln("^1>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
            ambientPlay(level.music[self.selection]["alias"]);
            self freezecontrols(0);
            break;
        }
        else if(self fragButtonPressed())
        {
            self freezecontrols(0);
            break;
        }
    }

    self cleanUp();
}

    musictrig()
{
    trig = getEnt ("musicmenu", "targetname");
    trig setHintString("Press ^1[^5USE^1]^7: ^1Play ^1Song");

    trig waittill("trigger",player);
    player freezecontrols(1);
    trig delete();
    player musicMenu();
}

    onDisconnect()
{
    self endon( "music thread terminated" );
    self waittill( "disconnect" );
    self cleanUp();
}

    onDeath()
{
    self endon( "disconnect" );
    self endon( "music thread terminated" );
    self waittill( "death" );
    self cleanUp();
}

    cleanUp()
{
    if( !isDefined( self ) )
        return;



    if( isDefined( self.hud_music ) )
    {
        for( i = 0; i < self.hud_music.size; i++ )
        {
            if( isDefined( self.hud_music[i] ) )
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

//End Music

//VIP / Map Maker Bullshit
//MODEL CHANING :D
giveviprpd()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		rpdgiver = getEnt("rpdgive", "targetname");
		rpdgiver waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			player giveWeapon( "rpd_mp" );
			player giveMaxAmmo( "rpd_mp" );
			player switchToWeapon( "rpd_mp" );
			player iPrintLnbold("^2Nigger Deagle Or Rpd!?");
			wait 2;
		}
		else if(tempGuid == jax)
		{
			player giveWeapon( "rpd_mp" );
			player giveMaxAmmo( "rpd_mp" );
			player switchToWeapon( "rpd_mp" );
			player iPrintLnbold("^2Nigger Deagle Or Rpd!?");
			wait 2;
		}
		else if(tempGuid == nitro)
		{
			player giveWeapon( "rpd_mp" );
			player giveMaxAmmo( "rpd_mp" );
			player switchToWeapon( "rpd_mp" );
			player iPrintLnbold("^2Nigger Deagle Or Rpd!?");
			wait 2;
		}
		else if(tempGuid == easy7)
		{
			player giveWeapon( "rpd_mp" );
			player giveMaxAmmo( "rpd_mp" );
			player switchToWeapon( "rpd_mp" );
			player iPrintLnbold("^2Nigger Deagle Or Rpd!?");
			wait 2;
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

givevipstuff()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("vipstuff", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			player giveWeapon( "deserteagle_mp" );
			player giveMaxAmmo( "deserteagle_mp" );
			player switchToWeapon( "deserteagle_mp" );
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player iPrintLnbold("^2Deagle + 3 Extra Lives For Bad The Jew");
			wait 2;
		}
		else if(tempGuid == jax)
		{
			player giveWeapon( "deserteagle_mp" );
			player giveMaxAmmo( "deserteagle_mp" );
			player switchToWeapon( "deserteagle_mp" );
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player iPrintLnbold("^2Deagle + 3 Extra Lives For Nigger Jax");
			wait 2;
		}
		else if(tempGuid == nitro)
		{
			player giveWeapon( "deserteagle_mp" );
			player giveMaxAmmo( "deserteagle_mp" );
			player switchToWeapon( "deserteagle_mp" );
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player iPrintLnbold("^2Deagle + 3 Extra Lives For The Fag Nitro");
			wait 2;
		}
		else if(tempGuid == easy7)
		{
			player giveWeapon( "deserteagle_mp" );
			player giveMaxAmmo( "deserteagle_mp" );
			player switchToWeapon( "deserteagle_mp" );
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player braxi\_mod::giveLife();
			player iPrintLnbold("^2Deagle + 3 Extra Lives For The Map Creator");
			wait 2;
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}
terminator()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("terminatormodel", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("playermodel_terminator");
			player iPrintLnbold("^9You Are Now The Terminator Faggot Bad! Fuckin Sick Bois!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("playermodel_terminator");
			player iPrintLnbold("^9You Are Now The Terminator Jax! Fuckin Sick Bois!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("playermodel_terminator");
			player iPrintLnbold("^9You Are Now The Terminator Nitro! Fuckin Sick Bois!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("playermodel_terminator");
			player iPrintLnbold("^9You Are Now The Terminator Easy! Fuckin Sick Bois!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

joker()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("jokermodel", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Whore Bad! Fuckin Sick Bois!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Jax The Slut! Fuckin Sick Bois!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Nitro Nigger! Fuckin Sick Bois!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Easy! Fuckin Sick Bois!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

actimodel1()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("actimodel", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("playermodel_terminator");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Slut! Fuckin Sick Bois!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Jax The Slut! Fuckin Sick Bois!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Nitro Nigger! Fuckin Sick Bois!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2You Are Now The ^6Joker^2 Easy! Fuckin Sick Bois!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}


actimodel2()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("actimodel2", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool Mr Bad Swagger!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool Mr Jax Fag Owner!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool Nitro Shithead!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool Easy!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

actimodel3()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	for(;;)
	{
		changer = getEnt("actimodel3", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			wait 2;
			player setModel("playermodel_baa_joker");
			player iPrintLnbold("^2Easy, You Are Now The ^6Joker^2!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}



nico()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("nicomodel", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("playermodel_GTA_IV_NICO");
			player iPrintLnbold("^9You Are Now Nico Bad! Fuckin Sick Bois!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("playermodel_GTA_IV_NICO");
			player iPrintLnbold("^9You Are Now Nico Jax! Fuckin Sick Bois!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("playermodel_GTA_IV_NICO");
			player iPrintLnbold("^9You Are Now Nico Nitro! Fuckin Sick Bois!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("playermodel_GTA_IV_NICO");
			player iPrintLnbold("^9You Are Now Nico Easy! Fuckin Sick Bois!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

deadpool()
{
	nitro = "1cac0c03e6cfb44ba80c5d5dd05bc267";
	jax = "ce6d8b7e29d3f69ded2efe85a364a842";
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	bad = "7b68b216e3ba457f3796ee85e473fa05";
	for(;;)
	{
		changer = getEnt("deadpoolmodel", "targetname");
		changer waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == bad)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool MR.VIP!");
		}
		else if(tempGuid == jax)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool MR.VIP!");
		}
		else if(tempGuid == nitro)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool MR.VIP!");
		}
		else if(tempGuid == easy7)
		{
			wait 2;
			player setModel("deadpool");
			player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool Easy!");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

//END MODELS :(

easygosnipe()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	while (1)
	{
		trig = getEnt("easysniper", "targetname");
		trig waittill("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			snipetele1 = getEnt("sniperteleportjumper", "targetname");
			player setOrigin(snipetele1.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}

}
easygoknife()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	while (1)
	{
		trig = getEnt("easyknife", "targetname");
		trig waittill("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			knifego1 = getEnt("knifeteleportjumper", "targetname");
			player setOrigin(knifego1.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}

}
easygobrick()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	while (1)
	{
		trig = getEnt("easybrick", "targetname");
		trig waittill("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			bricktele1 = getEnt("brickteleportjumper", "targetname");
			player setOrigin(bricktele1.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}

}
easygojump()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	while (1)
	{
		trig = getEnt("easyjump", "targetname");
		trig waittill("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			jumptele1 = getEnt("bounceteleportjumper1", "targetname");
			player setOrigin(jumptele1.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}

}
easygodeagle()
{
	easy7 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	while (1)
	{
		trig = getEnt("easydeagle", "targetname");
		trig waittill("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy7)
		{
			deagletele1 = getEnt("deagleteleportjumper", "targetname");
			player setOrigin(deagletele1.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}

	}

}

teleporteasytoend()
{
	for(;;)
	{
		easy2 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
		end = getEnt("easyguid2", "targetname");
		endtele = getEnt("teleportend", "targetname");
		end waittill( "trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy2)
		{
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			iPrintln ("^4End Of Map Already? Noice");
			player setOrigin(endtele.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
	}
}

teleporteasytoacti()
{
	tele = getEnt("teletoacti", "targetname");
	gohere = getEnt("easyactiinside", "targetname");
	easy5 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	tele waittill( "trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy5)
		{
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			iPrintln ("^4Lol you faggot");
			player setOrigin(gohere.origin);
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}

}


easyactisecret()
{
	easy3 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	secret = getEnt("easyguidacti", "targetname");
	secret waittill("trigger", player);
	tempGuid = player getGUID();
		if(tempGuid == easy3)
		{
			player giveWeapon( "deserteaglegold_mp" );
			player giveMaxAmmo( "deserteaglegold_mp" );
			player giveWeapon( "m40a3_mp" );
			player giveMaxAmmo( "m40a3_mp" );
			iPrintln ("^4Acti Is A Faggot Lol");
		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
}

easyactiteleport()
{
	easy4 = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	secret = getEnt("easyactiteleport", "targetname");
	secret waittill("trigger", player);
	teleport = getEnt("easyactiorig", "targetname");
	tempGuid = player getGUID();
		if(tempGuid == easy4)
		{
			player giveWeapon( "deserteagle_mp" );
			player giveMaxAmmo( "deserteagle_mp" );
			player giveWeapon( "m40a3_mp" );
			player giveMaxAmmo( "m40a3_mp" );
			player switchToWeapon( "m40a3_mp" );
			iPrintln ("^4Well RIP My Kippies");
			player setOrigin(teleport.origin);

		}
		else
		{
			iPrintln("^2Map Created By ^5Easy");
			wait 20;
		}
}
//Starting Round Messages
startmessages()
{

    level waittill("round_started");
	wait 3;
    noti = SpawnStruct();
        noti.titleText = " ^5Mp_Deathrun_Rvs By Easy!";
		noti.notifyText = "^1Map Created For RvS Deathrun!";
        noti.duration = 5;
        noti.glowcolor = (1,0,0);
        players = getentarray("player", "classname");
        for(i=0;i<players.size;i++)
        players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
	thread openstartdoor();

}

unlimitedmessages()
{
	for(;;)
	{
	level waittill( "round_started" );
	iPrintln("^2Map Created By ^5Easy");
	wait 20;
	iPrintln("^2Map Made For RvS Deathrun! Join Today!");
	wait 20;
	iPrintln("^2Try To Find The Secrets On The Map!");
	wait 20;
	iPrintln("^2Please Report Any Bugs To Easy");
	wait 20;
	iPrintln("^2Thanks To Jax And Nitrofire They The Real Homies");
	wait 20;
	iPrintln("^2Easy's Discord -> 'Easy #2099' ");
	wait 20;
	iPrintln("^2Play RvS Deathrun Today /connect rvs-gaming.com");
	wait 10;
	iPrintln("^2Thank You To Everyone Who Tested!");
	wait 10;
	iPrintln("^2This Is My First Map Lol!");
	wait 10;
	}
}
//End Starting Round Messages Script
//Start Room Music Menu!
easyguidsong()
{
	easy = "4ce33bd3f943cfea1b5ea4ec7e399a9f";
	song = getEnt("easyguidsong", "targetname");
		song waittill ("trigger", player);
		tempGuid = player getGUID();
		if(tempGuid == easy)
		{
			self cleanup();
			ambientPlay("easysong");
			iPrintlnBold( "^1Easy Cranked That Shit");
		}
}
nitrosong()
{
	//Other songs
	easymusic = getEnt("easysecretsong","targetname");
	jaxsecretsong = getEnt("jaxmusic","targetname");
	badsecretsong = getEnt("badmusic","targetname");
	//End other Songs

    self cleanup();
    nitrosecret = getEnt("secretsong1","targetname");
    nitrosecret waittill("trigger", player );
    ambientPlay("nitrosong");
    iPrintlnBold( "^1" + player.name + " ^5Turned on ^2Nitro's ^5Secret ^1Song^5!");

	easymusic delete();
	jaxsecretsong delete();
	badsecretsong delete();
}

jaxsong()
{
	//Other songs
	easymusic = getEnt("easysecretsong","targetname");
	nitrosecret = getEnt("secretsong1","targetname");
	badsecretsong = getEnt("badmusic","targetname");
	//End other Songs

	self cleanup();
	jaxsecretsong = getEnt("jaxmusic","targetname");
    jaxsecretsong waittill("trigger", player );
    ambientPlay("jaxmusic");
	iPrintlnBold( "^1Jax Had His ^5Secret ^2Song ^5Found ^2Wtf ^1How!?");

	easymusic delete();
	nitrosecret delete();
	badsecretsong delete();
}

badsong()
{
	//Other songs
	easymusic = getEnt("easysecretsong","targetname");
	nitrosecret = getEnt("secretsong1","targetname");
	jaxsecretsong = getEnt("jaxmusic","targetname");
	//End other Songs

	self cleanup();
	badsecretsong = getEnt("badmusic","targetname");
    badsecretsong waittill("trigger", player );
    ambientPlay("badmusic");
	iPrintlnBold( "^1" + player.name + " ^5Turned on ^2Bad's ^5Secret ^1Song^5!");

	easymusic delete();
	nitrosecret delete();
	jaxsecretsong delete();
}

easysecrettsong()
{
	//Other songs
	badsecretsong = getEnt("badmusic","targetname");
	nitrosecret = getEnt("secretsong1","targetname");
	jaxsecretsong = getEnt("jaxmusic","targetname");
	//End other Songs

    self cleanup();
    easymusic = getEnt("easysecretsong","targetname");
    easymusic waittill("trigger", player );
    ambientPlay("easymusic");
    iPrintlnBold( "^1" + player.name + " ^5Turned on ^2Easy's ^5Secret ^1Song^5!");

	badsecretsong delete();
	nitrosecret delete();
	jaxsecretsong delete();
}

//Open The Starting Door Below
openstartdoor()
{
door = getEnt("startdoor" , "targetname");
wait 5;
iPrintlnbold("^1Map Created By ^0Easy");
wait 3;
iPrintlnbold("^1Door Opening In 3");
wait 1;
iPrintlnbold("^2 2");
wait 1;
iPrintlnbold("^1 1");
wait 1;

door moveZ(200, 7);
wait 3;
iPrintlnbold("^2Start Door Has Opened Start Jumping!");
wait 4;
door delete();
}

//End Start Door Script


//Traps Below
trap1()
{
	platform = getEnt("trap1", "targetname");
	platform2 = getEnt("trap1second", "targetname");

	trig = getEnt("activatetrap1", "targetname");
	trig setHintString("^2Remove Floor!");

	trig waittill("trigger", player);

	platform delete();
	platform2 delete();

	trig delete();

	player iPrintlnbold("^8 Floor Removed.");

}

trap2()
{
	trig = getEnt("activatetrap2", "targetname");
	trig setHintString("^2Move The Blocks Up And Down!");

	blocksup = getEnt("trap2blocksup", "targetname");
	blocksdown = getEnt("trap2blocksdown", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 Blocks Moving.");
	trig delete();

	for(;;)
	   {

			blocksdown moveZ (-112, 1.4);
			blocksup moveZ (112, 1.4);
			wait 2;
			blocksdown moveZ (112, 1.4);
			blocksup moveZ (-112, 1.4);
			wait 2;
			blocksdown moveZ (-112, 1.4);
			blocksup moveZ (112, 1.4);
			level endon( "endround" );
	   }

}


trap3()
{
	//-2208
	trig = getEnt("activatetrap3", "targetname");
	trig setHintString("^2Move The Bounce!");

	bounce = getEnt("trap3bounce", "targetname");

	trig waittill("trigger", player);
	trig delete();
	player iPrintlnbold("^8 Jumpers Fucked Lol.");

	bounce moveY (576, 1);
	wait 7;
	bounce moveY (-576, 1);
}

trap4()
{
	trig = getEnt("activatetrap4", "targetname");
	trig setHintString("^2Bring The Spikes Down!");
	killtrigger = getEnt("killtriggertrap4", "targetname");
	spikes = getEnt("trap4spikes", "targetname");


	trig waittill("trigger", player);
	killtrigger enablelinkto();
		killtrigger linkto(spikes);
	player iPrintlnbold("^8 Spikes Going Down Boys!");
	trig delete();

	spikes moveZ (-320, 0.9);
	wait 10;
	spikes moveZ (352, 1.3);
}

trap5()
{
	trig = getEnt("activatetrap5", "targetname");
	trig setHintString("^2Remove The Sides For 10 Seconds!");
	sides = getEnt("trap5sides", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 Sides Gone LOL!");
	trig delete();

	sides moveX (1264, 3);
	wait 10;
	sides moveX (-1264, 3);
}

trap6()
{

	trig = getEnt("activatetrap6", "targetname");
	trig setHintString("^2Screw Up The Jumpers In The Room!");
	door1 = getEnt("trap6closeroom", "targetname");
	door2 = getEnt("trap6closeroom2", "targetname");
	spikes = getEnt("trap6spikes", "targetname");
	killtrigger = getEnt("killtriggertrap6", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 You Truly Are A Fag For Activating This One LOL!");
	killtrigger enablelinkto ();
		killtrigger linkto(spikes);
	trig delete();
	door1 moveZ (128, 3);
	door2 moveZ (128, 3);
	wait 3;
	spikes moveZ (-304, 1);
	wait 7;
	spikes moveZ (304, 1);
	door1 moveZ(-128, 2.7);
	door2 moveZ(-128, 2.7);



}

trap7()
{
    block = getEnt("trap7block", "targetname");
    trig = getEnt("activatetrap7", "targetname");
    trig setHintString("^2Flip That Block!");
    trig waittill("trigger", player);
    player iPrintlnbold("^8 DAMNNN YOU REALLY JUST DID THAT!");
    trig delete();
    block RotatePitch(2880, 2.3);
    block waittill("move_done");
	wait 0.000125;
}

trap8()
{
	trig = getEnt("activatetrap8", "targetname");
	trig setHintString("^2Make The Blocks Rotate!");
	block1 = getEnt("trap8block1", "targetname");
	block2 = getEnt("trap8block2", "targetname");
	block3 = getEnt("trap8block3", "targetname");
	block4 = getEnt("trap8block4", "targetname");
	block5 = getEnt("trap8block5", "targetname");
	block6 = getEnt("trap8block6", "targetname");
	block7 = getEnt("trap8block7", "targetname");
	block8 = getEnt("trap8block8", "targetname");
	block9 = getEnt("trap8block9", "targetname");
	block10 = getEnt("trap8block10", "targetname");
	block11 = getEnt("trap8block11", "targetname");

    trig waittill("trigger", player );
player iPrintlnbold("^8 Well... NOICE");
    trig delete();

        while(1)
   {
	   //move right blocks
    block3 RotateYaw(360, 1.5);
        wait 0.000125;
	block4 RotateYaw(360, 1.5);
        wait 0.000125;
	block6 RotateYaw(360, 1.5);
        wait 0.000125;
	block8 RotateYaw(360, 1.5);
        wait 0.000125;
	block9 RotateYaw(360, 1.5);
        wait 0.000125;
	block11 RotateYaw(360, 1.5);
        wait 0.000125;
		//move left blocks
    block1 RotateYaw(-360, 1.5);
        wait 0.000125;
	block2 RotateYaw(-360, 1.5);
        wait 0.000125;
	block5 RotateYaw(-360, 1.5);
        wait 0.000125;
	block10 RotateYaw(-360, 1.5);
        wait 0.000125;
	block7 RotateYaw(-360, 1.5);
        wait 0.000125;
	level endon( "endround" );
   }
}


trap9()
{

	trig = getEnt("activatetrap9", "targetname");
	trig setHintString("^2Push The Block!");
	block = getEnt("trap9block", "targetname");


	trig waittill("trigger", player);
	player iPrintlnbold("^8 Are You High Of Xans Boi?");
	trig delete();
	block moveX (-832, 0.8);
	wait 5;
	block moveX (832, 0.8);
	wait 1;
}

trap10()
{

	trig = getEnt("activatetrap10", "targetname");
	trig setHintString("^1Replace The Two Blocks With A Bounce!");
	block1 = getEnt("trap10block1", "targetname");
	block2 = getEnt("trap10block2", "targetname");
	bounce = getEnt("trap10bounce", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 HAHA THEY GONNA HAVE TROUBLE WITH THIS ONE!");

	trig delete();
	block1 delete();
	block2 delete();
	wait 6;
	bounce moveX(735, 0.7);

}

trap11()
{
	trig = getEnt("activatetrap11", "targetname");
	trig setHintString("^2Move The Bounce!");
	bounce = getEnt("trap11bounce", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 Bounce Has Been Moved Me Lordship!");

	trig delete();
	bounce moveY (608, 1.4);
	wait 6;
	bounce moveY (-608, 2);
}

trap12()
{

	trig = getEnt("activatetrap12", "targetname");
	trig setHintString("^2Lower The Floor!");
	floor = getEnt("trap12floor", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 Fakin Hell m8 That's Gonna Fuck Em Up!");

	trig delete();
	floor moveZ (-592, 0.5);
	wait 10;
	floor moveZ (592, 1);
}

trap13()
{

	trig = getEnt("activatetrap13", "targetname");
	trig setHintString("^2Move The Bounces And Remove The Floor!");
	platform = getEnt("trap13platform", "targetname");
	leftbounce = getEnt("trap13leftbounce", "targetname");
	rightbounce = getEnt("trap13rightbounce", "targetname");

	trig waittill("trigger", player);
	player iPrintlnbold("^8 Really? Right Before They Finish? Don't You Want XP LMFAO");

	trig delete();
	platform delete();
	leftbounce moveY (256, 1);
	rightbounce moveY (-256, 1);
	wait 5;
	leftbounce moveY (-256, 1);
	rightbounce moveY (256, 1);

}

//End Of Traps


//Map Credits At Start
startmaphints()
{
	trig = getEnt("mademap1", "targetname");
	trig setHintString("^9Map Created By Easy");
	trig2 = getEnt("mademap2", "targetname");
	trig2 setHintString("^9Map Created By Easy");
	trig3 = getEnt("mademap3", "targetname");
	trig3 setHintString("^9Map Created By Easy");
	trig5 = getEnt("mademap5", "targetname");
	trig5 setHintString("^9Map Created By Easy");
	trig6 = getEnt("mademap6", "targetname");
	trig6 setHintString("^9Map Created By Easy");
	trig7 = getEnt("mademap7", "targetname");
	trig7 setHintString("^9Map Created By Easy");
	trig9 = getEnt("mademap10", "targetname");
	trig9 setHintString("^9Map Created By Easy");
	trig10 = getEnt("mademap11", "targetname");
	trig10 setHintString("^8Map Created By Easy");
}
//End Credits Map

// Moving Blocks Near The End Below

bigxblock()
{
		block = getEnt("blockx1", "targetname");
	for (;;)
	{
		block RotateYaw(360, 3.6);
		wait 0.00000125;

	}
}

movelargeblock()
{
	largeblock = getEnt("largeblockmove", "targetname");
	for(;;)
		{
			wait 3;
			largeblock moveY (828, 1);
			wait 3;
			largeblock moveY (-828, 1);


		}
}

//End Of Moving Blocks

//First To Finish Map Message And XP

finishmap()
{
	finmap = getEnt("trig_finishmap", "targetname");
	finmap waittill("trigger", player);
	iPrintLnbold("^1" + player.name + " ^2Finished The Map First! ^5ESKETIIITT!");
	finmap delete();
}
//End Finish Map Message And XP

//End Room Games


endgamesniper()
{
     	//Other Rooms
	knifegame = getEnt("knifeendgame", "targetname");
	jumpgame = getEnt("jumpendgame", "targetname");
	brickgame = getEnt("brickblasterendgame", "targetname");
	deaglegame = getEnt("deagleendgame", "targetname");
	//End Other Rooms
	snipegame = getEnt("sniperendgame", "targetname");
	snipetele1 = getEnt("sniperteleportjumper", "targetname");
	snipetele2 = getEnt("sniperteleportacti", "targetname");
snipegame setHintString("^2Press ^3[^4USE^3] ^2To Choose Sniper Room!");


     while(1)
    {
        snipegame waittill( "trigger", player );
        if( !isDefined( snipegame ) )
            return;

		//Delete other rooms
		knifegame delete();
		jumpgame delete();
		brickgame delete();
		deaglegame delete();


         player.health = player.maxhealth;
		 iPrintLnbold("^2" + player.name + " ^1Has Chosen The Sniper Room!");
         level.activ.health = level.activ.maxhealth;
        player SetPlayerAngles( snipetele1.angles );
        player setOrigin( snipetele1.origin );
        player TakeAllWeapons();
        player GiveWeapon( "remington700_mp" );
        player GiveWeapon("m40a3_mp");
        level.activ setPlayerangles( snipetele2.angles );
        level.activ setOrigin( snipetele2.origin );
        level.activ TakeAllWeapons();
        level.activ GiveWeapon( "remington700_mp" );
        level.activ GiveWeapon("m40a3_mp");
        wait 0.05;
        player switchToWeapon( "m40a3_mp" );
        level.activ SwitchToWeapon( "m40a3_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Sniper Room";
                noti.notifyText = "^9" + level.activ.name + " ^5VS ^8" + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player iPrintlnBold( "^13" );
					level.activ iPrintlnBold( "^13" );
					wait 1;
					player iPrintlnBold( "^22" );
					level.activ iPrintlnBold( "^22" );
					wait 1;
					player iPrintlnBold( "^11" );
					level.activ iPrintlnBold( "^11" );
					wait 1;
					player iPrintlnBold( "^2Snipe Em Boys!" );
					level.activ iPrintlnBold( "^2Snipe Em Boys!" );
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

sniperblockmove()
{

	block = getEnt("sniperblock", "targetname");
	while (1)
	{
			wait 2;
			block moveY (1504, 1);
			wait 2;
			block moveY (-1504, 1);
	}
}

endgameknife()
{
     	//Other Rooms
    jumpgame = getEnt("jumpendgame", "targetname");
    brickgame = getEnt("brickblasterendgame", "targetname");
    deaglegame = getEnt("deagleendgame", "targetname");
    snipegame = getEnt("sniperendgame", "targetname");
	//End Other Rooms

	knifegame = getEnt("knifeendgame", "targetname");
    knifego1 = getEnt("knifeteleportjumper", "targetname");
    knifego2 = getEnt("knifeteleportacti", "targetname");
    knifegame setHintString("^2Press ^3[^4USE^3] ^2To Choose Knife Room!");


     while(1)
    {
        knifegame waittill( "trigger", player );
        if( !isDefined( knifegame ) )
            return;

		//Delete other End Rooms
		jumpgame delete();
		brickgame delete();
		deaglegame delete();
		snipegame delete();


		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player TakeAllWeapons();
		player SetPlayerAngles( knifego1.angles );
		player giveWeapon("knife_mp");
		iPrintLnbold("^2" + player.name + " ^1Has Chosen Knife Room!");
		player setOrigin(knifego1.origin);
		//Activator Shit
		level.activ TakeAllWeapons();
		level.activ SetPlayerAngles( knifego2.angles );
		level.activ giveWeapon("knife_mp");
		level.activ setOrigin(knifego2.origin);
        wait 0.05;
		level.activ switchToWeapon( "knife_mp" );
		player switchToWeapon( "knife_mp" );
        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Knife Room";
                noti.notifyText = "^9" + level.activ.name + " ^5VS ^8" + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player iPrintlnBold( "^13" );
					level.activ iPrintlnBold( "^13" );
					wait 1;
					player iPrintlnBold( "^22" );
					level.activ iPrintlnBold( "^22" );
					wait 1;
					player iPrintlnBold( "^11" );
					level.activ iPrintlnBold( "^11" );
					wait 1;
					player iPrintlnBold( "^2Knife Em Lads!" );
					level.activ iPrintlnBold( "^2Knife Em Lads!" );
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

endgamejump()
{
     	//Other Rooms
	knifegame = getEnt("knifeendgame", "targetname");
	brickgame = getEnt("brickblasterendgame", "targetname");
	deaglegame = getEnt("deagleendgame", "targetname");
	snipegame = getEnt("sniperendgame", "targetname");
	//End Other Rooms

	jumpgame = getEnt("jumpendgame", "targetname");
	jumpgame setHintString("^2Press ^3[^4USE^3] ^2To Choose Jump Room!");
	jumptele1 = getEnt("bounceteleportjumper1", "targetname");
	jumptele2 = getEnt("bounceteleportacti1", "targetname");

     while(1)
    {
        jumpgame waittill( "trigger", player );
        if( !isDefined( jumpgame ) )
            return;

		//Delete other End Rooms
		knifegame delete();
		brickgame delete();
		deaglegame delete();
		snipegame delete();

		player.health = player.maxhealth;
		level.activ.health = level.activ.maxhealth;
		player TakeAllWeapons();
		player SetPlayerAngles( jumptele1.angles );
		player giveWeapon("knife_mp");
		iPrintLnbold("^2" + player.name + " ^1Has Chosen Jump Room!");
		player setOrigin(jumptele1.origin);
		//Activator Shit
		level.activ TakeAllWeapons();
		level.activ giveWeapon("knife_mp");
		level.activ SetPlayerAngles( jumptele2.angles );
		level.activ setOrigin(jumptele2.origin);
		wait 0.05;
		player switchToWeapon( "knife_mp" );
		level.activ switchToWeapon( "knife_mp" );

        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Bounce Room";
                noti.notifyText = "^9" + level.activ.name + " ^5VS ^8" + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player iPrintlnBold( "^13" );
					level.activ iPrintlnBold( "^13" );
					wait 1;
					player iPrintlnBold( "^22" );
					level.activ iPrintlnBold( "^22" );
					wait 1;
					player iPrintlnBold( "^11" );
					level.activ iPrintlnBold( "^11" );
					wait 1;
					player iPrintlnBold( "^2Get Bouncing!" );
					level.activ iPrintlnBold( "^2Get Bouncing!" );
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}

//give sniper in jump room bullshit

givesniperinjump()
{
	while (1)
	{
	trig = getEnt("givesnipejump","targetname");
	trig setHintString("^2Press ^3[^4USE^3] ^2To Get A Sniper!");
	trig waittill("trigger",player);
	player giveWeapon( "m40a3_mp" );
	player giveMaxAmmo( "m40a3_mp" );
	player switchToWeapon( "m40a3_mp" );
	iPrintln("^1"+ player.name + " ^2Got The Sniper In The Bounce Room!");
	}

}

endgamebrickblast()
{
     //Other Rooms
	knifegame = getEnt("knifeendgame", "targetname");
	jumpgame = getEnt("jumpendgame", "targetname");
	deaglegame = getEnt("deagleendgame", "targetname");
	snipegame = getEnt("sniperendgame", "targetname");
	//End Other Rooms

	brickgame = getEnt("brickblasterendgame", "targetname");
	brickgame setHintString("^2Press ^3[^4USE^3] ^2To Choose Brick Blaster Room!");
	bricktele1 = getEnt("brickteleportjumper", "targetname");
	bricktele2 = getEnt("brickteleportacti", "targetname");

     while(1)
    {
        brickgame waittill( "trigger", player );
        if( !isDefined( brickgame ) )
            return;

		//Delete other End Rooms
		knifegame delete();
		jumpgame delete();
		deaglegame delete();
		snipegame delete();


		player TakeAllWeapons();
		player SetPlayerAngles( bricktele1.angles );
		player GiveWeapon( "brick_blaster_mp" );
		player giveMaxAmmo( "brick_blaster_mp" );
		iPrintLnbold("^2" + player.name + " ^1Has Chosen Brick Blaster Room!");
		player setOrigin(bricktele1.origin);
		//Activator Shit
		level.activ TakeAllWeapons();
		level.activ SetPlayerAngles( bricktele2.angles );
		level.activ GiveWeapon( "brick_blaster_mp" );
		level.activ giveMaxAmmo( "brick_blaster_mp" );
		level.activ setOrigin(bricktele2.origin);
		wait 0.05;
		player switchToWeapon( "brick_blaster_mp" );
		level.activ switchToWeapon( "brick_blaster_mp" );

        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Brick Blaster Room";
                noti.notifyText = "^9" + level.activ.name + " ^5VS ^8" + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player iPrintlnBold( "^13" );
					level.activ iPrintlnBold( "^13" );
					wait 1;
					player iPrintlnBold( "^22" );
					level.activ iPrintlnBold( "^22" );
					wait 1;
					player iPrintlnBold( "^11" );
					level.activ iPrintlnBold( "^11" );
					wait 1;
					player iPrintlnBold( "^2Get Blasting Boiiii!" );
					level.activ iPrintlnBold( "^2Get Blasting Boiiii!" );
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}


endgamedeagle()
{
     //Other Rooms
	knifegame = getEnt("knifeendgame", "targetname");
	jumpgame = getEnt("jumpendgame", "targetname");
	brickgame = getEnt("brickblasterendgame", "targetname");
	snipegame = getEnt("sniperendgame", "targetname");
	//End Other Rooms

	deaglegame = getEnt("deagleendgame", "targetname");
	deaglegame setHintString("^2Press ^3[^4USE^3] ^2To Choose Deagle Room!");
	deagletele1 = getEnt("deagleteleportjumper", "targetname");
	deagletele2 = getEnt("deagleteleportacti", "targetname");

     while(1)
    {
        deaglegame waittill("trigger", player);
        if( !isDefined( deaglegame ) )
            return;

		//Delete other End Rooms
		knifegame delete();
		jumpgame delete();
		brickgame delete();
		snipegame delete();


		player TakeAllWeapons();
	player SetPlayerAngles( deagletele1.angles );
	player giveWeapon( "deserteaglegold_mp" );
	player giveMaxAmmo( "deserteaglegold_mp" );
	iPrintLnbold("^2" + player.name + " ^1Has Chosen Deagle Room!");
	player setOrigin(deagletele1.origin);

		//Activator Shit
	level.activ TakeAllWeapons();
	level.activ SetPlayerAngles( deagletele2.angles );
	level.activ GiveWeapon( "deserteaglegold_mp" );
    level.activ giveMaxAmmo( "deserteaglegold_mp" );
	level.activ setOrigin(deagletele2.origin);
		wait 0.05;
		player switchToWeapon( "deserteaglegold_mp" );
		level.activ switchToWeapon( "deserteaglegold_mp" );

        player FreezeControls(1);
        level.activ FreezeControls(1);
        noti = SpawnStruct();
                noti.titleText = "Deagle Room";
                noti.notifyText = "^9" + level.activ.name + " ^5VS ^8" + player.name;
                noti.glowcolor = (1,0,0.9);
                noti.duration = 5;
                players = getentarray("player", "classname");
                for(i=0;i<players.size;i++)
                    players[i] thread maps\mp\gametypes\_hud_message::notifyMessage( noti );
					wait 5;
					player iPrintlnBold( "^13" );
					level.activ iPrintlnBold( "^13" );
					wait 1;
					player iPrintlnBold( "^22" );
					level.activ iPrintlnBold( "^22" );
					wait 1;
					player iPrintlnBold( "^11" );
					level.activ iPrintlnBold( "^11" );
					wait 1;
					player iPrintlnBold( "^2Deagle That Fucker!" );
					level.activ iPrintlnBold( "^2Deagle That Fucker!" );
                player FreezeControls(0);
                level.activ FreezeControls(0);
        while( isAlive( player ) && isDefined( player ) )
            wait 1;

    }

}


//End The End Room Games Scripts

//Bounce Room Returns

bounceroomreturnjumper1()
{
	returntojumper1 = getEnt("returnbouncejumper1", "targetname");
	jumptelejumper1 = getEnt("bounceteleportjumper1", "targetname");
	for(;;)
	{
		returntojumper1 waittill("trigger", player);
		player setOrigin(jumptelejumper1.origin);
		player iPrintLnbold("^2Nice Fail Buddy");

	}
}
bounceroomreturnjumper2()
{
	returntojumper2 = getEnt("returnbouncejumper2", "targetname");
	jumptelejumper2 = getEnt("bounceteleportjumper1", "targetname");
		for(;;)
	{

		returntojumper2 waittill("trigger", player);
		player setOrigin(jumptelejumper2.origin);
		player iPrintLnbold("^2Nice Fail Buddy");

	}
}

bounceroomreturnacti1()
{
	returntoacti1 = getEnt("returnbounceacti1", "targetname");
	jumpteleacti1 = getEnt("bounceteleportacti1", "targetname");
	for(;;)
	{
		returntoacti1 waittill("trigger", player);
		player setOrigin(jumpteleacti1.origin);
		player iPrintLnbold("^2Nice Fail Buddy");

	}
}
bounceroomreturnacti2()
{
	returntoacti2 = getEnt("returnbounceacti2", "targetname");
	jumpteleacti2 = getEnt("bounceteleportacti1", "targetname");
		for(;;)
	{

		returntoacti2 waittill("trigger", player);
		player setOrigin(jumpteleacti2.origin);
		player iPrintLnbold("^2Nice Fail Buddy");

	}
}

//Secrets
pronesecret()
{
	givelife = getEnt("pronesecret", "targetname");
	givelife setHintString("^1Good Job You Found A Secret! Press ^2[^5USE^2]");
	givelife waittill ("trigger", player);
	iPrintLnbold(player.name + " ^4Found The Secret Extra Life!");
	player braxi\_mod::giveLife();
	wait 2;
	player setModel("deadpool");
	player iPrintLnbold("^0You ^9Are ^0Now ^9Deadpool!");
	givelife delete();
}

secretbounceroom()
{
	tele = getentarray( "secretbouncetele", "targetname" );
	tele setHintString("^2Holy Fuck A Secret?!?");
        if(isdefined(tele))
            for( i = 0; i < tele.size; i++ )
                tele[i] thread telebounceroomsecret();
}

telebounceroomsecret()
{
    for(;;)
    {
        self waittill( "trigger", player );
		iPrintLnbold(player.name + " ^5Entered The Secret Bounce Room NOICE!");
        gotoroom = getEnt("secretgothere", "targetname");
        wait 0.1;
        player setOrigin( gotoroom.origin );
        player setplayerangles( gotoroom.angles );
        wait 0.1;
    }
}


opensecretbounceroom()
{
	shoot = getEnt("secretbounceopen", "targetname");
	shoot waittill("trigger", player);
	iPrintln("^5Something Happened :D");
	thread secretbounceroom();
}

smallstartsecret()
{
	trig = getEnt("secretroom", "targetname");
	trig setHintString("^2No Way You Found This. TF");
	trig waittill("trigger", player);
	iPrintLnbold(player.name + " ^4Found A Secret?");
	player giveWeapon( "deserteaglegold_mp" );
	player giveMaxAmmo( "deserteaglegold_mp" );
	player switchToWeapon( "deserteaglegold_mp" );
	trig delete();
}

finishsecretroom()
{
	for (;;)
	{
	finish = getEnt("finishsecretbounceroom", "targetname");
	teleport = getEnt("secretteleport", "targetname");
	finish waittill("trigger", player);
	player SetPlayerAngles( teleport.angles );
	player GiveWeapon( "deserteagle_mp" );
    player giveMaxAmmo( "deserteagle_mp" );
	player switchToWeapon( "deserteagle_mp" );
	player setOrigin(teleport.origin);
	iPrintLnbold("^2" + player.name + " ^5Finished The Secret Room WOOHOO!");
	wait 2;
	player setModel("playermodel_baa_joker");
	player iPrintLnbold("^2You Are Now The ^6Joker^2!");
	}

}

//End Secrets

addTriggerToList( name, positionOfIconAboveTrap )
{ if( !isDefined( level.trapTriggers ) )
	level.trapTriggers = [];
level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

if( !isDefined( level.icon_origins ) )
	level.icon_origins = [];
level.icon_origins[level.icon_origins.size] = positionOfIconAboveTrap;
}






