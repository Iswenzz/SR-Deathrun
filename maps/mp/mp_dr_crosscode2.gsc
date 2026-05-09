#include maps\mp\_utility;
#include common_scripts\utility;

///MAP MADE BY ERYK/LENTAVA
///DISCORD: lentavakalakukko

main()
{
 //   setDvar("scr_fog_disable", 1);
	maps\mp\_load::main();
    maps\mp\mp_dr_crosscode2_fx::main();

	//setdvar("bg_bobmax" , "0");
	setdvar("bg_falldamageminheight" , "99998");
	setdvar("bg_falldamagemaxheight" , "99999");
    level.sparks_fx = LoadFX("bl_sparknparts");
    level.sparks_teleport_fx = LoadFX("bl_sparknparts_teleport");
    precacheShellshock("flashbang");
    precacheitem( "crosscode_cold_mp" );
    precacheitem( "crosscode_heat_mp" );
    precacheitem( "crosscode_shock_mp" );
    precacheitem( "crosscode_wave_mp" );


	thread sniper();
	thread elemental();
	thread knife();
	thread antiglitcher();
    thread start_tp();
    thread start_tp_text();
    thread end_tp();
    thread end_tp_text();
    thread waterfall1();
    thread waterfall2();
    thread waterfalls_anim();

    thread bouncer();
    thread start_puzzle();
    thread startCountdown();
    thread music();
    thread musicbox();
    thread weaponBox();

	thread endmap();
//	thread credits();

    init_all_traps();
    thread trap1();
    thread trap2();
    thread trap3();
    thread trap4();
    thread trap5();
    thread trap6();
    thread trap7();
	addTriggerToList("trigger_trap1");
	addTriggerToList("trigger_trap2");
	addTriggerToList("trigger_trap3");
	addTriggerToList("trigger_trap4");
    addTriggerToList("trigger_trap5");
    addTriggerToList("trigger_trap6");
    addTriggerToList("trigger_trap7");

    precacheShader("shizuka_face");
    precacheShader("emilienator_face");
    precacheShader("message_bg");
    precacheShader("message_bg3");
    precacheShader("music_menu");
    precacheShader("music_menu4");

level.music=[];
level.music[0]["song"]   ="Flume - Smoke & Retribution";
level.music[0]["alias"]    ="flume_smoke";
level.music[1]["song"]    ="Bit Rush: Arcade Ahri";
level.music[1]["alias"]    ="bitrush";
level.music[2]["song"]    ="The M Machine - Shadow In The Rose Garden";
level.music[2]["alias"]    ="themmachine";
level.music[3]["song"]    ="FantomenK - A Tiny Spaceship's Final Mission";
level.music[3]["alias"]    ="fantomenk";

}

//--------------------------------------------------------------------TRAPS---------------------------------------------------------------------------//


init_all_traps()
    {

    // Pierwsza nowa pułapka (Trap 1)
    // Obiekt: trap1_activator, Trigger: trigger_trap1, Cel: trap1_origin
    thread create_target_anim("trap1_activator", "trigger_trap1", "trap1_origin");
    thread create_target_anim("trap2_activator", "trigger_trap2", "trap2_origin");
    thread create_target_anim("trap3_activator", "trigger_trap3", "trap3_origin");
    thread create_target_anim("trap4_activator", "trigger_trap4", "trap4_origin");
    thread create_target_anim("trap5_activator", "trigger_trap5", "trap5_origin");
    thread create_target_anim("trap6_activator", "trigger_trap6", "trap6_origin");
    thread create_target_anim("trap7_activator", "trigger_trap7", "trap7_origin");
    }

create_target_anim(ent_name, trig_name, orig_name)
{
    target_ent = getEnt(ent_name, "targetname");
    trigger    = getEnt(trig_name, "targetname");
    destination = getEnt(orig_name, "targetname");

    if(!isDefined(target_ent) || !isDefined(trigger) || !isDefined(destination))
        return;

    // Start idle motion
    trigger thread trigger_follow_ent(target_ent);
    target_ent thread target_idle_motion();

    trigger waittill("trigger", player);


    // Akcja po trafieniu
    trigger notify("stop_following");
    target_ent notify("stop_idle");
    player playLocalSound("switchactivate2");
    playLoopedFX(level.sparks_teleport_fx, 0.3, destination.origin);
    if(isDefined(trigger)) trigger delete();

    // Ruch w dół do punktu docelowego
    target_ent moveTo(destination.origin, 0.2, 0, 0);
    wait 0.2;

    // Szybkie kręcenie
    target_ent thread target_fast_spin();
}
target_fast_spin()
{
    self endon("death");
    while(1)
    {
        self rotateYaw(360, 0.4, 0, 0);
        wait 0.4;
    }
}
target_idle_motion()
{
    self endon("stop_idle");
    self endon("death");
    while(1)
    {
        self moveZ(16, 3, 0.5, 0.5);
        self rotateYaw(360, 3, 0, 0);
        wait 3.05;
        self moveZ(-16, 3, 0.5, 0.5);
        self rotateYaw(360, 3, 0, 0);
        wait 3.05;
    }
}
trigger_follow_ent(target)
{
    self endon("stop_following");
    self endon("death");
    while(1)
    {
        self.origin = target.origin;
        wait 0.05;
    }
}


trap1()
	{
		barrier = getent("trap1_barrier" , "targetname");
        barrier hide();
        barrier moveZ (-500, 0.1, 0, 0);
		trig = getent("trigger_trap1" , "targetname");
        hint = getent("hint1", "targetname");
		trig waittill("trigger" , player);
        hint delete();

        wait 0.1;
        barrier moveZ (500, 0.1, 0, 0);
        barrier show();
        wait 4.0;
        barrier hide();
        barrier moveZ (-500, 0.1, 0, 0);

	}

trap2()
	{
		barrier = getent("trap2_barrier" , "targetname");
        barrier hide();
        barrier moveZ (-500, 0.1, 0, 0);
		trig = getent("trigger_trap2" , "targetname");
        hint = getent("hint2", "targetname");
		trig waittill("trigger" , player);
        hint delete();

        wait 0.1;
        barrier moveZ (500, 0.1, 0, 0);
        barrier show();
        wait 4.0;
        barrier hide();
        barrier moveZ (-500, 0.1, 0, 0);

	}

trap3()
	{
		bounce = getent("trap3_bounce" , "targetname");
		trig = getent("trigger_trap3" , "targetname");
        hint = getent("hint3", "targetname");
		trig waittill("trigger" , player);
        hint delete();

    for(;;)
        {
        wait 0.1;
        bounce rotatePitch (720, 2, 0, 0);
        wait 5.0;
        }

	}

trap4()
    {
        ladder = getent("trap4_ladder" , "targetname");
        trig = getent("trigger_trap4" , "targetname");
        hint = getent("hint4", "targetname");
		trig waittill("trigger" , player);
        hint delete();

        wait 0.1;
        ladder delete();

    }

trap5()
	{
		bounce = getent("trap5_bounce" , "targetname");
		trig = getent("trigger_trap5" , "targetname");
        hint = getent("hint5", "targetname");
		trig waittill("trigger" , player);
        hint delete();

    for(;;)
        {
        wait 0.1;
        bounce rotatePitch (720, 2, 0, 0);
        wait 5.0;
        }

	}

trap6()
    {
        bridge = getent("trap6_bridge" , "targetname");
        trig = getent("trigger_trap6" , "targetname");
        hint = getent("hint6", "targetname");
		trig waittill("trigger" , player);
        hint delete();

        wait 0.1;
        bridge delete();

    }

trap7()
    {
        island = getent("trap7_island" , "targetname");
        grass = getent("trap7_grass" , "targetname");
        trig = getent("trigger_trap7" , "targetname");
        hint = getent("hint7", "targetname");
		trig waittill("trigger" , player);
        hint delete();

        wait 0.1;
        island moveZ (-500, 4, 0.2, 0);
        grass moveZ (-500, 4, 0.2, 0);
        wait 5;
        island moveZ (500, 4, 0, 0.2);
        grass moveZ (500, 4, 0, 0.2);

    }





//----------------------------------------------------------------SHIZUKA MUSIC BOX-------------------------------------------------------------------//



musicBox()
{
    trig = getent("trigger_shizuka","targetname");
    trig SetHintString("Press ^5[&&1]^7 to talk with Shizuka");
    trig waittill("trigger",p);
    trig delete();

    p freezecontrols(1);
	p thread musicfix();
    p musicMenu();
}

musicfix()
{
	self waittill( "death" );
	if(!isdefined(self))
        return;
    if(isdefined(self.hud_music))
    {
        for(i=0;i<self.hud_music.size;i++)
        {
            if(isdefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
}

musicMenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    self notify( "music thread terminated" );
    self endon( "music thread terminated" );

    self.hud_music = [];
    self.selection = 0;

    // --- POJAWIANIE SIĘ ---
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 900, 480, 0.93, "right", "bottom", 1.4 );
    self.hud_music[i] setShader( "shizuka_face", 140, 208 );
    self.hud_music[i].sort = 880;
    self.hud_music[i].alpha = 0;           // Startujemy od zera
    self.hud_music[i] moveOverTime(0.8);   // Przygotuj ruch
    self.hud_music[i] fadeOverTime(1);   // Przygotuj fade (identyczny czas!)
    self.hud_music[i].x = 700;             // Wykonaj ruch do X
    self.hud_music[i].alpha = 1;        // Wykonaj fade do 1

    i++; // 1: Dymek
    self.hud_music[i] = braxi\_mod::addTextHud( self, 550, 670, 0.93, "right", "bottom", 1.4 );
    self.hud_music[i] setShader( "message_bg3", 254, 90 );
    self.hud_music[i].sort = 880;
    self.hud_music[i].alpha = 0;
    self.hud_music[i] moveOverTime(0.8);
    self.hud_music[i] fadeOverTime(1);
    self.hud_music[i].y = 452;
    self.hud_music[i].alpha = 0.96;

    i++; // 2: Tło menu
    self.hud_music[i] = braxi\_mod::addTextHud( self, 320, -150, 0.93, "center", "top", 1.4 );
    self.hud_music[i] setShader( "music_menu4", 290, 120 );
    self.hud_music[i].sort = 880;
    self.hud_music[i].alpha = 0;
    self.hud_music[i] moveOverTime(0.8);
    self.hud_music[i] fadeOverTime(1);
    self.hud_music[i].y = 160;
    self.hud_music[i].alpha = 0.96;

    wait 0.85;

    i++; // 3: Tekst instrukcji
    self.hud_music[i] = braxi\_mod::addTextHud( self, 517, 388, 1, "right", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i] setText("^7Shizuka:^7\nHello Spheromancer!\nChoose song by clicking ^3[{+attack}]^7\nand select it with ^3[{+activate}]^7 button.");
    self.hud_music[i] setPulseFX( 50, 15000, 500 );

    i++; // 4: WIZUALNY TIMER
    self.hud_music[i] = braxi\_mod::addTextHud( self, 320, 245, 1, "center", "top", 1.4 );
    self.hud_music[i].sort = 886;
    self.hud_music[i].color = (1, 1, 1);
    timerHud = self.hud_music[i];
    timerHud setText("Selection time left: 15s"); // Tekst startowy

    // Piosenki (TERAZ ZACZYNAJĄ SIĘ OD INDEKSU 5)
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 320, 175+(j*16), 0.93, "center", "top", 1.4 );
        self.hud_music[i].sort = 886;
        self.hud_music[i].font = "objective";
        self.hud_music[i].glowalpha = 1;
        if(isdefined(level.randomcolor)) self.hud_music[i].glowcolor = level.randomcolor;
        else self.hud_music[i].glowcolor = (0.3, 0.7, 1.0);
        self.hud_music[i] setText(level.music[j]["song"]);
    }

    i++; // Poświata
    self.hud_music[i] = braxi\_mod::addTextHud( self, 320, 175, 0.4, "center", "top", 1.4 );
    indicator = self.hud_music[i];
    indicator.sort = 881;
    indicator setShader( "white", 270, 17 );
    self.hud_music[i].glowalpha = 0.45;
    indicator.color = (0.0, 0.5, 1.0);

     // --- TUTAJ WSTAW USTAWIENIA STARTOWE ---
    startSong = level.music[0]["song"]; // Pobieramy nazwę pierwszej piosenki
    startWidth = (startSong.size * 5.8) + 10; // Liczymy jej szerokość
    indicator setShader( "white", int(startWidth), 17 ); // Ustawiamy shader z nową szerokością
    // ---------------------------------------

	wait 0.2;
    self thread musicTimer(15, timerHud); // Przekazujemy HUD timera

    // --- PĘTLA WYBORU ---
    while(self.sessionstate == "playing")
    {
        wait 0.05;
        if(self attackButtonPressed())
        {
            // 1. Stary element wraca do niższej alfy
            self.hud_music[5+self.selection].alpha = 0.93;

            // 2. Zmiana wyboru
            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;

            // 3. Nowy element piosenki
            item = self.hud_music[5+self.selection];
            item.alpha = 1;

            // --- OBLICZANIE DYNAMICZNEJ SZEROKOŚCI ---
            songName = level.music[self.selection]["song"];
            // Obliczamy szerokość: liczba znaków * 8 pikseli + 30 marginesu
            newWidth = (songName.size * 5.8) + 10;

            // 4. ANIMACJA RUCHU I SKALOWANIA
            // W GSC scaleOverTime działa na szerokość i wysokość obiektu
            indicator moveOverTime(0.15);
            indicator scaleOverTime(0.15, int(newWidth), 17); // Płynna zmiana rozmiaru
            indicator.y = item.y;

            wait 0.15;
        }
         else if(self useButtonPressed())
        {
            // Zatrzymujemy obecną (losową) muzykę z płynnym wyciszeniem (2 sekundy)
            AmbientStop(2);
            wait 0.1;

            iprintln("^6>> ^7Now playing: ^1"+level.music[self.selection]["song"]);
            ambientPlay(level.music[self.selection]["alias"]);
            level.selectedmusicid = self.selection;

            self thread hideMusicHUD();
            return;
        }
    }
}

musicTimer(time, timerHud)
{
    self endon("disconnect");
    self endon("death");
    self endon("music thread terminated");

    while(time >= 0)
    {
        timerHud setText("Selection time left: " + time + "s");

        if(time <= 3) // Ostatnie 3 sekundy - Czerwony
            timerHud.color = (1, 0, 0);
        else if(time <= 5) // 5 i 4 sekundy - Pomarańczowy
            timerHud.color = (1, 0.5, 0);

        wait 1;
        time--;
    }

    iprintln("Time is over!");
    self thread hideMusicHUD();
}

hideMusicHUD()
{
    self notify( "music thread terminated" );

    // 1. Teksty i timer znikają (szybki fade)
    for(i=3; i<self.hud_music.size; i++)
    {
        if(isdefined(self.hud_music[i]))
        {
            self.hud_music[i] fadeOverTime(0.4);
            self.hud_music[i].alpha = 0;
        }
    }

    // 2. Główne grafiki (0, 1, 2) odjeżdżają i znikają jednocześnie
    // Postać Shizuki (Index 0)
    if(isdefined(self.hud_music[0]))
    {
        self.hud_music[0] moveOverTime(0.6);
        self.hud_music[0] fadeOverTime(0.6);
        self.hud_music[0].x = 900;
        self.hud_music[0].alpha = 0;
    }

    // Dymek (Index 1)
    if(isdefined(self.hud_music[1]))
    {
        self.hud_music[1] moveOverTime(0.6);
        self.hud_music[1] fadeOverTime(0.6);
        self.hud_music[1].y = 670;
        self.hud_music[1].alpha = 0;
    }

    // Tło menu (Index 2)
    if(isdefined(self.hud_music[2]))
    {
        self.hud_music[2] moveOverTime(0.6);
        self.hud_music[2] fadeOverTime(0.6);
        self.hud_music[2].y = -150;
        self.hud_music[2].alpha = 0;
    }

    wait 0.6; // Czekamy na koniec animacji ruchu i zanikania

    // 3. Kompletne usunięcie wszystkich elementów
    if(isdefined(self.hud_music))
    {
        for(i=0; i<self.hud_music.size; i++)
        {
            if(isdefined(self.hud_music[i]))
                self.hud_music[i] destroy();
        }
    }
    self freezecontrols(0);
}

music()
{
    wait 0.05;
    level waittill("round_started");

    // Jeśli gracz JUŻ wybrał coś w menu przed startem rundy, nie losuj
    if(isDefined(level.selectedmusicid))
        return;

    level.music_random = randomint(3);

    // Zatrzymujemy poprzednie dźwięki przed nowym startem
    AmbientStop(1);
    wait 0.1;

    switch(level.music_random)
    {
        case 0:
            AmbientPlay( "muGarden" );
            iPrintLN("^5>>^7 Now playing: Gaia's Garden");
            break;
        case 1:
            AmbientPlay( "muOldhideout" );
            iPrintLN("^5>>^7 Now playing: Old Hideout");
            break;
        case 2:
            AmbientPlay( "muTemplelake" );
            iPrintLN("^5>>^7 Now playing: Temple of the Lake");
            break;
    }
}

//----------------------------------------------------------------EMILIENATOR ELEMENTAL WEAPON SELECTION-------------------------------------------------------------------//

weaponBox()
{
    trig = getent("trigger_emilienator","targetname");
    trig SetHintString("Press ^5[&&1]^7 to talk with Emilienator");

    // Lista broni do wyboru
    level.map_weapons = [];
    level.map_weapons[0] = "deserteaglegold_mp";
    level.map_weapons[1] = "crosscode_cold_mp";
    level.map_weapons[2] = "crosscode_heat_mp";
    level.map_weapons[3] = "crosscode_shock_mp";
    level.map_weapons[4] = "crosscode_wave_mp";

    trig waittill("trigger", p);
    trig delete();

    p freezecontrols(1);
    p weaponMenu();

}



weaponMenu()
{
    self endon( "disconnect" );
    self endon( "death" );
    self notify( "weapon thread terminated" );
    self endon( "weapon thread terminated" );

    self.hud_weapons = [];
    self.selection = 0;

    // --- POJAWIANIE SIĘ (Kaskada 0.8s) ---
    i = 0;
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 900, 480, 0, "right", "bottom", 1.4 );
    self.hud_weapons[i] setShader( "emilienator_face", 140, 208 );
    self.hud_weapons[i] moveOverTime(0.8);
    self.hud_weapons[i].x = 700;
    self.hud_weapons[i] fadeOverTime(0.8);
    self.hud_weapons[i].alpha = 0.93;
    wait 0.15;

    i++; // 1: Dymek
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 550, 670, 0, "right", "bottom", 1.4 );
    self.hud_weapons[i] setShader( "message_bg3", 254, 90 );
    self.hud_weapons[i] moveOverTime(0.8);
    self.hud_weapons[i].y = 452;
    self.hud_weapons[i] fadeOverTime(0.8);
    self.hud_weapons[i].alpha = 0.93;
    wait 0.15;

    i++; // 2: Tło menu (Podniesione na Y=120 dla 5 broni)
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 320, -150, 0, "center", "top", 1.4 );
    self.hud_weapons[i] setShader( "music_menu4", 320, 180 );
    self.hud_weapons[i] moveOverTime(0.8);
    self.hud_weapons[i].y = 120;
    self.hud_weapons[i] fadeOverTime(0.8);
    self.hud_weapons[i].alpha = 0.93;

    wait 0.9;

    i++; // 3: Tekst instrukcji
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 517, 395, 1, "right", "bottom", 1.4 );
    self.hud_weapons[i] setText("^5Emilienator:^7\nNeed some firepower?\nChoose: ^3[{+attack}]^7\nTake: ^3[{+activate}]^7");

    i++; // 4: WIZUALNY TIMER
    self.hud_weapons[i] = braxi\_mod::addTextHud( self, 320, 260, 1, "center", "top", 1.4 );
    timerHud = self.hud_weapons[i];

    // 5+ Bronie
    for( j = 0; j < level.map_weapons.size; j++ )
    {
        i++;
        self.hud_weapons[i] = braxi\_mod::addTextHud( self, 320, 160+(j*16), 0.93, "center", "top", 1.4 );
        self.hud_weapons[i].sort = 882;
        self.hud_weapons[i].glowalpha = 0.45;
        self.hud_weapons[i].glowcolor = (0.8, 0.4, 1.0); // Fioletowy glow
        self.hud_weapons[i] setText(getWeaponDisplayName(level.map_weapons[j]));
    }

    i++; // Poświata (Indicator)
    indicator = braxi\_mod::addTextHud( self, 320, 160, 0.25, "center", "top", 1.4 );
    indicator.sort = 881;
    indicator.color = (0.7, 0.0, 1.0); // Fioletowy indicator
    self.hud_weapons[i] = indicator;

    // Ustawienie startowej szerokości paska
    startWidth = (getWeaponDisplayName(level.map_weapons[0]).size * 7) + 20;
    indicator setShader("white", int(startWidth), 17);

    self thread weaponTimer(15, timerHud);

    while(self.sessionstate == "playing")
    {
        wait 0.05;
        if(self attackButtonPressed())
        {
            self.hud_weapons[5+self.selection].alpha = 0.93;
            self.selection++;
            if( self.selection >= level.map_weapons.size ) self.selection = 0;

            item = self.hud_weapons[5+self.selection];
            item.alpha = 1;

            newWidth = (getWeaponDisplayName(level.map_weapons[self.selection]).size * 7) + 20;
            indicator moveOverTime(0.15);
            indicator scaleOverTime(0.15, int(newWidth), 17);
            indicator.y = item.y;
            wait 0.15;
        }
   else if(self useButtonPressed())
        {
            weap = level.map_weapons[self.selection];

            // Poprawiona nazwa z myślnikiem zamiast podkreślenia
            self playLocalSound("equipsound");

            self takeAllWeapons();
            self giveWeapon(weap);
            self giveMaxAmmo(weap);
            self switchToWeapon(weap);

            iprintln("^5>> ^7Received: ^1" + getWeaponDisplayName(weap));

            self thread hideWeaponHUD();
            return;
        }
    }
}

weaponTimer(time, timerHud)
{
    self endon("weapon thread terminated");
    self endon("disconnect");
    while(time >= 0)
    {
        timerHud setText("Selection time left: " + time + "s");
        if(time <= 3) timerHud.color = (1, 0, 0);
        else if(time <= 5) timerHud.color = (1, 0.5, 0);
        wait 1;
        time--;
    }
    self thread hideWeaponHUD();
}

hideWeaponHUD()
{
    self notify( "weapon thread terminated" );
    // Chowamy teksty
    for(i=3; i<self.hud_weapons.size; i++)
        if(isdefined(self.hud_weapons[i])) { self.hud_weapons[i] fadeOverTime(0.4); self.hud_weapons[i].alpha = 0; }

    // Odjazd grafik (kaskada)
    if(isdefined(self.hud_weapons[2])) { self.hud_weapons[2] moveOverTime(0.8); self.hud_weapons[2] fadeOverTime(0.8); self.hud_weapons[2].y = -150; self.hud_weapons[2].alpha = 0; wait 0.1; }
    if(isdefined(self.hud_weapons[1])) { self.hud_weapons[1] moveOverTime(0.8); self.hud_weapons[1] fadeOverTime(0.8); self.hud_weapons[1].y = 670; self.hud_weapons[1].alpha = 0; wait 0.1; }
    if(isdefined(self.hud_weapons[0])) { self.hud_weapons[0] moveOverTime(0.8); self.hud_weapons[0] fadeOverTime(0.8); self.hud_weapons[0].x = 900; self.hud_weapons[0].alpha = 0; }

    wait 0.8;
    // Niszczenie HUD
    if(isdefined(self.hud_weapons))
        for(i=0; i<self.hud_weapons.size; i++)
            if(isdefined(self.hud_weapons[i])) self.hud_weapons[i] destroy();

    self freezecontrols(0);
}

getWeaponDisplayName(weap)
{
    switch(weap)
    {
        case "crosscode_cold_mp": return "Cold Elemental";
        case "deserteaglegold_mp": return "Desert Eagle Gold";
        case "crosscode_heat_mp": return "Heat Elemental";
        case "crosscode_shock_mp": return "Shock Elemental";
        case "crosscode_wave_mp": return "Wave Elemental";
        default: return weap;
    }
}




//----------------------------------------------------------------WATERFALL LOGIC-------------------------------------------------------------------//

waterfall1()
{
    trig = getent("trigger_waterfall1","targetname");
    orig = getEnt("origin_waterfall1", "targetname");

    PlayFX(level.sparks_fx, orig.origin);
    soundEnt = spawn("script_origin", orig.origin);

    for(;;)
    {
        trig waittill("trigger",player);

        if(player istouching(trig))
        {
            if(distance(player.origin,orig.origin) < 1350)
                player PlaySound("waterfallfar");

            if(distance(player.origin,orig.origin) < 850)
                player PlaySound("waterfallmid");

            if(distance(player.origin,orig.origin) < 350)
                player PlaySound("waterfallclose");

            wait 1.5;
        }
        else
        {
        //    player StopSound("waterfallfar");
        //    player StopSound("waterfallmid");
        //    player StopSound("waterfallclose");
        }
    }
}

waterfall2()
{
    trig = getent("trigger_waterfall2","targetname");
    orig = getEnt("origin_waterfall2", "targetname");

    PlayFX(level.sparks_fx, orig.origin);
    soundEnt = spawn("script_origin", orig.origin);

    for(;;)
    {
        trig waittill("trigger",player);

        if(player istouching(trig))
        {
            if(distance(player.origin,orig.origin) < 1350)
                player PlaySound("waterfallfar");

            if(distance(player.origin,orig.origin) < 850)
                player PlaySound("waterfallmid");

            if(distance(player.origin,orig.origin) < 350)
                player PlaySound("waterfallclose");

            wait 1.5;
        }
        else
        {
        //    player StopSound("waterfallfar");
        //    player StopSound("waterfallmid");
        //    player StopSound("waterfallclose");
        }
    }
}

waterfalls_anim()
{
    brushes1 = getEnt("waterfall1","targetname");
    brushes2 = getEnt("waterfall2","targetname");

    wait 1;
    brushes1 hide();

    while(1)
    {
        wait 0.3;
        brushes1 show();
        brushes2 hide();
        wait 0.3;
        brushes2 show();
        brushes1 hide();
    }
}

//-----------------------------------------------------------------------------------------------------------------------------------//


addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );

}

GetActivator()
{
	players = getentarray( "player", "classname" );

	for(i = 0;i < players.size;i++)
	{
		player = players[i];

		if( isdefined( player ) && isplayer( player ) && isalive( player ) && player.pers["team"] == "axis"	)
			return player;
	}

	return undefined;
}

addTextHud( who, x, y, alpha, alignX, alignY, fontScale )
{
	if( isPlayer( who ) )
		hud = newClientHudElem( who );
	else
		hud = newHudElem();

	hud.x = x;
	hud.y = y;
	hud.alpha = alpha;
	hud.alignX = alignX;
	hud.alignY = alignY;
	hud.fontScale = fontScale;
	return hud;
}

removeTextActivator()
{
    if( isDefined( self.hud_textacti) )
    {
        self.hud_textacti destroy();
    }
}

createHUD( x, y, alignX, alignY, alpha, font, fontScale )
{
    hud = NewHudElem();
    hud.x = x;
    hud.y = y;
    hud.alignX = alignX;
    hud.alignY = alignY;
    hud.horzalign = alignX;
    hud.vertalign = alignY;
    hud.alpha = alpha;
    hud.font = font;
    hud.fontscale = fontScale;
    hud.glowalpha = 1;
    hud.glowcolor = (0.4, 0.6, 1);

    return hud;
}

fightHUD(room, jumper, activ)
{
    self notify("newFhud");
    self endon("newFhud");

    if (!isDefined(room))
        room = "undefined";
    if (!isDefined(jumper))
        jumper = "undefined";
    else
        jumper = jumper.name;
    if (!isDefined(activ))
        activ = "undefined";
    else
        activ = activ.name;

    waitTime = 3; //s
    offset = 200; //ms

    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();

    level.hud_fight = createHUD( 0, 85, "center", "top", 1, "objective", 1.5 );
    level.hud_fight setText("^5" + room);
    level.hud_fight setPulseFX( 40, waitTime*1000-offset, offset );

    level.hud_fight2 = createHUD( 0, 100, "center", "top", 1, "objective", 1.5 );
    level.hud_fight2 setText("^5" + jumper + " ^0VS^0 " + "^5" + activ);
    level.hud_fight2 setPulseFX( 40, waitTime*1000-offset, offset );

    wait waitTime;
    if (isDefined(level.hud_fight)) level.hud_fight destroy();
    if (isDefined(level.hud_fight2)) level.hud_fight2 destroy();
}

//---------------------------------------------------------------------------------------------------------//
accessHUD(player, message)
{
    player notify("access_hud");
    player endon("access_hud");

    waitTime = 5; //s
    offset = 200; //ms

    if (isDefined(player.hud_access))
        player.hud_access destroy();

    player.hud_access = player createHUD(0, 85, "center", "top", 1, "objective", 1.5);
    player.hud_access setText(message);
    player.hud_access setPulseFX(40, waitTime * 1000 - offset, offset);

    wait waitTime;

    if (isDefined(player.hud_access))
        player.hud_access destroy();
}

endmap()
{
    trig = getEnt("endmap_trig", "targetname");
    trig waittill ("trigger" , player );
    player playLocalSound("puzzlesolved");
    firstPlace = newHudElem();
    firstPlace.foreground = true;
    firstPlace.alpha = 1;
    firstPlace.alignX = "left";
    firstPlace.alignY = "middle";
    firstPlace.horzAlign = "left";
    firstPlace.vertAlign = "middle";
    firstPlace.x = -400;
    firstPlace.y = 0;
    firstPlace.sort = 0;
    firstPlace.font = "default";
    firstPlace.fontScale = 1.4;
    firstplace.hidewheninmenu = false;
    firstPlace.glowAlpha = 1;
    firstPlace.glowColor = (.3,.0,3);
    firstPlace settext("^5" + player.name + " ^7has finished ^5FIRST^7");
    firstPlace moveOverTime(2);
    firstPlace.x = 5;
    wait 5;
    firstPlace moveOverTime(2);
    firstPlace.x = -500;
    wait 7;
    firstPlace destroy();
}

///ROOMS
waitdead()
{
    activator = GetActivator();
    level.trigger_scope = getent("trigger_sniper","targetname");
    level.trigger_elemental = getent("trigger_elemental","targetname");
    level.trigger_knife = getent("trigger_knife","targetname");

    level.trigger_scope thread maps\mp\_utility::triggerOff();
    level.trigger_elemental thread maps\mp\_utility::triggerOff();
    level.trigger_knife thread maps\mp\_utility::triggerOff();

    self common_scripts\utility::waittill_any("death","disconnect");
    activator freezeControls(false);
    self freezeControls(false);
    activator.health = activator.maxhealth;
    level.trigger_scope thread maps\mp\_utility::triggerOn();
    level.trigger_elemental thread maps\mp\_utility::triggerOn();
    level.trigger_knife thread maps\mp\_utility::triggerOn();
}

RoomCountDown(text, duration, extra)
{
    self endon( "disconnect" );
    self endon( "death" );
    self endon( "spawned" );
    self endon( "joined_spectators" );

    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
    self.endTimerHUD = createHUD(0, 120, "center", "top", 1, "objective", 1.5);

    self freezeControls(1);
    wait extra;

    while (duration > 0)
    {
        self.endTimerHUD setText("^0" + duration);
        self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
        wait 1;
        duration--;
    }
    self.endTimerHUD setText(text);
    self.endTimerHUD setPulseFX( 40, 1000-200, 200 );
    self freezeControls(0);
    wait 1;
    if (isDefined(self.endTimerHUD)) self.endTimerHUD destroy();
}

antiglitcher()
{
level.activator1 = GetActivator();
level.activ = GetActivator();
self common_scripts\utility::waittill_any("death","disconnect");
	if(isDefined(self))
	{
		self notify("matchend");
	}
	else
	{
		level waittill("actiKill");
		self notify("matchend");
	}
self freezeControls(0);
level.activ notify("matchend");

	iPrintln("^5"+self.name+" ^7died^5!");
	wait 0.2;
	iPrintlnBold("^5Room selection opened^7!");
}

sniper()
{
    level.trigger_scope = getEnt ("trigger_sniper", "targetname");
    jumpersc = getEnt ("origin_jumper_sniper", "targetname");
    actisc = getEnt ("origin_acti_sniper", "targetname");

    for(;;)
    {
        level.trigger_scope waittill ("trigger", player);

        iPrintLnBold("^5 " + player.name + " ^7entered the ^5Scope ^7Room^5!");
        activator = GetActivator();
        player thread waitdead();

        thread fightHUD("Scope Room", player, activator);
        player thread RoomCountDown("^5ill each other !", 3, 0);
        activator thread RoomCountDown("^5Kill each other !", 3, 0);
        player setOrigin (jumpersc.origin);
        player setPlayerAngles (jumpersc.angles);
        activator setOrigin (actisc.origin);
        activator setPlayerAngles (actisc.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
        player giveWeapon("remington700_mp");
        activator giveWeapon("remington700_mp");
        player giveMaxAmmo("remington700_mp");
        activator giveMaxAmmo("remington700_mp");
        player giveWeapon("m40a3_mp");
        activator giveWeapon("m40a3_mp");
        player giveMaxAmmo("m40a3_mp");
        activator giveMaxAmmo("m40a3_mp");
        player switchToWeapon("m40a3_mp");
        activator switchToWeapon("m40a3_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
		activator.maxhealth = 100;
		activator.health = activator.maxhealth;
        while(isDefined(player) && isAlive(player))
        wait .05;

    }
}



elemental()
{
    trig_ele = getEnt("trigger_elemental", "targetname");
    jumperak = getEnt("origin_jumper_sniper", "targetname");
    actiak = getEnt("origin_acti_sniper", "targetname");

    for(;;)
    {
        trig_ele waittill("trigger", player);
        activator = GetActivator();

        // 1. Logika broni i HUD
        elementals = [];
        elementals[0] = "crosscode_cold_mp";
        elementals[1] = "crosscode_heat_mp";
        elementals[2] = "crosscode_shock_mp";
        elementals[3] = "crosscode_wave_mp";
        weapon_name = elementals[randomInt(elementals.size)];

        // 2. Wiadomości (Wyświetlą się zawsze dla gracza, który wszedł)
        iPrintLnBold("^5 " + player.name + " ^7entered the ^5Elemental ^7Room^1!");

        // HUD i Odliczanie dla Jumpera
        thread fightHUD("Crosscode Elemental Room", player, activator);
        player thread RoomCountDown("^5Kill each other !", 3, 0);

        // 3. Obsługa Jumpera (Ciebie)
        player thread waitdead();
        player setOrigin(jumperak.origin);
        player setPlayerAngles(jumperak.angles);
        player takeAllWeapons();
        player giveWeapon(weapon_name);
        player switchToWeapon(weapon_name);
        player giveMaxAmmo(weapon_name);
        player.health = 100;

        // 4. Obsługa Activatora (Tylko jeśli istnieje)
        if(isDefined(activator) && isAlive(activator))
        {
            activator thread RoomCountDown("^5Kill each other !", 3, 0);
            activator setOrigin(actiak.origin);
            activator setPlayerAngles(actiak.angles);
            activator takeAllWeapons();
            activator giveWeapon(weapon_name);
            activator switchToWeapon(weapon_name);
            activator giveMaxAmmo(weapon_name);
            activator.health = 100;
        }

        while(isDefined(player) && isAlive(player))
            wait 0.1;
    }
}


knife()
{
    level.trigger_weapon = getEnt ("trigger_knife", "targetname");

    jumperak = getEnt ("origin_jumper_sniper", "targetname");
    actiak = getEnt ("origin_acti_sniper", "targetname");

    for(;;)
    {
        level.trigger_weapon waittill ("trigger", player);

        iPrintLnBold("^5 " + player.name + " ^7entered the ^5Knife ^7Room^1!");
		activator = GetActivator();
        player thread waitdead();

        thread fightHUD("Knife Room", player, activator);
        player thread RoomCountDown("^5Kill each other !", 3, 0);
        activator thread RoomCountDown("^5Kill each other !", 3, 0);
        player setOrigin (jumperak.origin);
        player setPlayerAngles (jumperak.angles);
        activator setOrigin (actiak.origin);
        activator setPlayerAngles (actiak.angles);
        player takeAllWeapons();
        activator takeAllWeapons();
		player giveWeapon("knife_mp");
        player giveWeapon("hands_mp");
		activator giveWeapon("knife_mp");
        activator giveWeapon("hands_mp");
		player switchToWeapon("knife_mp");
        activator switchToWeapon("knife_mp");
        player.maxhealth = 100;
        player.health = player.maxhealth;
		activator.maxhealth = 100;
		activator.health = activator.maxhealth;
        while(isDefined(player) && isAlive(player))
        wait .05;

    }
}

credits()
{
  while(1)
	{
        wait 10;
        iPrintln("^5M^7ap created by ^5l^7entava");
		wait 1;
		iPrintln("Join ^5Velocity Discord^7 server: ^5https://vlct.mxme.pro/^7");
		iPrintln("You^5Tube^7 channel: www.youtube.com/@cod4eryk");
        wait 5;
		wait 0.5;
		iPrintln("^3C^7lippy for scripting and mapping help");
		wait 0.5;
		iPrintln("^3S^7loth and ^3S^7tendby for custom models");
		wait 0.5;
		iPrintln("^5M^7ap made for ^5Velocity Deathrun^7: 51.38.35.106:28960");
		wait 100;
        }


}


start_tp()
{
    level waittill("round_started");
    wait 10;

    fx_tp1 = getEnt("sparks_tp1", "targetname");
    fx_tp2 = getEnt("sparks_tp2", "targetname");
    fx_tp3 = getEnt("sparks_tp3", "targetname");
    fx_tp4 = getEnt("sparks_tp4", "targetname");

    trig = getEnt("triggers_start_teleport", "targetname");
    tele = getEnt("origin_start", "targetname");

    // Efekty wizualne na start
    PlayFX(level.sparks_teleport_fx, fx_tp1.origin);
    PlayFX(level.sparks_teleport_fx, fx_tp2.origin);
    PlayFX(level.sparks_teleport_fx, fx_tp3.origin);
    PlayFX(level.sparks_teleport_fx, fx_tp4.origin);

    fx_tp1 playSound("barrierup");

    while (1)
    {
        trig waittill("trigger", player);

        // WYWOŁANIE OSOBNEGO WĄTKU:
        // Skrypt nie czeka tutaj, tylko od razu wraca do waittill dla następnego gracza
        thread player_teleport_logic(player, tele);

        // Krótki wait, aby zapobiec zbugowaniu triggera,
        // gdy gracz stoi w nim nieruchomo (0.05 - 0.1s)
        wait 0.1;
    }
}
player_teleport_logic(player, tele)
{
    // Zabezpieczenie, aby jeden gracz nie odpalił teleportu dwa razy naraz
    if(isDefined(player.is_teleporting) && player.is_teleporting)
        return;

    player.is_teleporting = true;
    player freezeControls(1);
    player playLocalSound("teleport1s");

    // Czarny ekran (HUD)
    black = newClientHudElem(player);
    black.horzAlign = "left";
    black.vertAlign = "top";
    black.alignX = "left";
    black.alignY = "top";
    black.x = 0;
    black.y = 0;
    black.alpha = 0;
    black.color = (0,0,0);
    black SetShader("white", 4000, 4000);
    black FadeOverTime(0.2);
    black.alpha = 1;

    wait 0.8;

    // Przeniesienie gracza
    player setOrigin(tele.origin);
    player setPlayerAngles(tele.angles);

    player freezeControls(0);

    black FadeOverTime(0.3);
    black.alpha = 0;

    wait 0.3;

    if(isDefined(black))
        black destroy();

    player.is_teleporting = false;
}

end_tp()
{
	trig = getEnt("trigger_end_teleport", "targetname");
	tele = getEnt("origin_select", "targetname");

	while (1)
    {
    trig waittill("trigger", player);

    player freezeControls(1);
    player playLocalSound("teleport1s");

    // Czarny ekran
    black = newClientHudElem(player);
    black.horzAlign = "left";
    black.vertAlign = "top";
    black.alignX = "left";
    black.alignY = "top";
    black.x = 0;
    black.y = 0;
    black.alpha = 0;
    black.color = (0,0,0);
    black SetShader("white", 4000, 4000);
    black FadeOverTime(0.2);
    black.alpha = 1;

    wait 0.8;

    player setOrigin(tele.origin);
    player setPlayerAngles(tele.angles);

    player freezeControls(0);

    black FadeOverTime(0.3);
    black.alpha = 0;

    wait 0.3;
    black destroy();
    }
}

bouncer()
{
	trigger = getEnt("bouncer","targetname");

	while(1)
	{
		trigger waittill("trigger", player);
		thread bounce_the_player(player);
        player playLocalSound("jumppanel");
	}
}

bounce_the_player(player)
{
	oldpos = player.origin;
	strenght = 2;
	for( i=0; i<strenght; i++ )
	{
	    player.health += 230;
        player finishPlayerDamage(player, level.jumpattacker, 230, 0, "MOD_FALLING", "jump_mp", player.origin, AnglesToForward((-90,0,0)), "none", 0);
	}
}


//---------------------------------------------------SPAWN BARRIER AND TELEPORTS-------------------------------------//

start_tp_text()
{
    level waittill("round_started");
    wait 10;

    trig = getEnt("triggers_start_teleport", "targetname");
    while(1)
    {
    trig setHintString("Press ^5[&&1]^7 to start the journey.");
    wait 0.5;
    trig setHintString("Press ^5[&&1]^7 to start the journey..");
    wait 0.5;
    trig setHintString("Press ^5[&&1]^7 to start the journey...");
    wait 0.5;
    }
}

end_tp_text()
{
    trig = getEnt("trigger_end_teleport", "targetname");
    while(1)
    {
    trig setHintString("Press ^5[&&1]^7 to select the end room.");
    wait 0.5;
    trig setHintString("Press ^5[&&1]^7 to select the end room..");
    wait 0.5;
    trig setHintString("Press ^5[&&1]^7 to select the end room...");
    wait 0.5;
    }
}

start_puzzle()
{
    puzzle  = getEnt("brush_puzzle", "targetname");
    barrier = getEnt("brush_spawn_barrier", "targetname");
    trig    = getEnt("trigger_puzzle", "targetname");
    orig    = getEnt("puzzle_origin", "targetname");

    active_lines = getEnt("puzzle_line_activ", "targetname");
    active_lines hide();


    if(!isDefined(puzzle) || !isDefined(barrier) || !isDefined(trig) || !isDefined(orig))
    {
        println("Puzzle: Brakuje entity!");
        return;
    }

    trig thread follow_puzzle(trig, puzzle);
    puzzle thread puzzle_idle_move();
    thread puzzle_trigger(puzzle, barrier, trig, orig);
}


follow_puzzle(trig, puzzle)
{
    self endon("trigger_activated");

    while(1)
    {
        self.origin = puzzle.origin;
        wait 0.05;
    }
}


puzzle_idle_move()
{
    self endon("puzzle_stop");

    while(1)
    {
        self moveZ(16, 3, 0.5, 0.5);
        self rotateYaw(360, 3, 0, 0);
        wait 3.05;

        self moveZ(-16, 3, 0.5, 0.5);
        self rotateYaw(360, 3, 0, 0);
        wait 3.05;
    }
}


puzzle_trigger(puzzle, barrier, trig, orig)
{
    fx = getEnt("bl_sparks", "targetname");
    trig waittill("trigger", player);
    trig notify("trigger_activated");
    player playlocalsound("switchactivate2");
    trig delete();
    puzzle notify("puzzle_stop");

    wait 0.05;

    current = puzzle.origin;
    target  = orig.origin;
    diff = target - current;

    if(diff[0] != 0)
        puzzle moveX(diff[0], 0.2, 0, 0);

    if(diff[1] != 0)
        puzzle moveY(diff[1], 0.2, 0, 0);

    if(diff[2] != 0)
        puzzle moveZ(diff[2], 0.2, 0, 0);

    wait 0.25;


    puzzle thread fast_spin();

    lines = getEnt("puzzle_line", "targetname");
    lines hide();

    active_lines = getEnt("puzzle_line_activ", "targetname");
    active_lines show();


    fx1 = getEnt("sparks1", "targetname");
    fx2 = getEnt("sparks2", "targetname");
    fx3 = getEnt("sparks3", "targetname");
    fx4 = getEnt("sparks4", "targetname");
    fx5 = getEnt("sparks5", "targetname");
    fx6 = getEnt("sparks6", "targetname");
    fx7 = getEnt("sparks7", "targetname");
    fx8 = getEnt("sparks8", "targetname");
    fx9 = getEnt("sparks9", "targetname");
    fx10 = getEnt("sparks10", "targetname");
    fx11 = getEnt("sparks11", "targetname");
    fx12 = getEnt("sparks12", "targetname");
    fx13 = getEnt("sparks13", "targetname");
    fx14 = getEnt("sparks14", "targetname");
    fx15 = getEnt("sparks15", "targetname");
    fx16 = getEnt("sparks16", "targetname");
    fx17 = getEnt("sparks17", "targetname");
    fx18 = getEnt("sparks18", "targetname");

    PlayFX(level.sparks_fx, fx1.origin);
    fx1 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx2.origin);
    fx2 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx3.origin);
    fx3 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx4.origin);
    fx4 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx5.origin);
    fx5 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx6.origin);
    fx6 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx7.origin);
    fx7 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx8.origin);
    fx8 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx9.origin);
    fx9 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx10.origin);
    fx10 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx11.origin);
    fx11 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx12.origin);
    fx12 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx13.origin);
    fx13 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx14.origin);
    fx14 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx15.origin);
    fx15 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx16.origin);
    fx16 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx17.origin);
    fx17 playSound("elementalpolehit");
    wait 0.05;
    PlayFX(level.sparks_fx, fx18.origin);
    wait 0.05;

    barrier playSound("barrierdown");
    barrier notSolid();
    barrier moveZ(-200, 1, 0.5, 0);

}


fast_spin()
{
    while(1)
    {
        self rotateYaw(360, 0.4, 0, 0);
        wait 0.41;
    }
}

startCountdown()
{
    player = self; // ustawiamy zmienną player na bieżącego gracza

    active_lines = getEnt("spawn_rhombus_lines_activ", "targetname");
    active_lines hide();

    brush1 = getEnt("spawn_rhombus_active1", "targetname");
    brush2 = getEnt("spawn_rhombus_active2", "targetname");
    brush3 = getEnt("spawn_rhombus_active3", "targetname");
    wait 0.1;
    brush1 hide();
    brush2 hide();
    brush3 hide();

    level waittill("round_started");

    player thread accessHUD(player, "^5Teleports^7 will be available in ^510 seconds^7");
    wait 10;
    player thread accessHUD(player, "^5Teleports^7 are now ^5available^7");
    brush1 show();
    brush2 show();
    brush3 show();
    thread spawnRhombus1();
    thread spawnRhombus2();
    thread spawnRhombus3();
    thread spawnRhombusLines();
}

spawnRhombus1()
{
    brush1 = getEnt("spawn_rhombus_active1", "targetname");
    brush1end = getEnt("end_rhombus_active1", "targetname");
    brush1end2 = getEnt("sniper_rhombus_active1", "targetname");
    brush1end3 = getEnt("elem_rhombus_active1", "targetname");
    brush1end4 = getEnt("knife_rhombus_active1", "targetname");
    wait 0.1;
    while(1)
    {
    brush1 moveZ (48, 2, 0, 0);
    brush1end moveZ (48, 2, 0, 0);
    brush1end2 moveZ (48, 2, 0, 0);
    brush1end3 moveZ (48, 2, 0, 0);
    brush1end4 moveZ (48, 2, 0, 0);
    wait 2.1;
    brush1 moveZ (-48, 0.05, 0, 0);
    brush1end moveZ (-48, 0.05, 0, 0);
    brush1end2 moveZ (-48, 0.05, 0, 0);
    brush1end3 moveZ (-48, 0.05, 0, 0);
    brush1end4 moveZ (-48, 0.05, 0, 0);
    wait 0.1;
    }
}

spawnRhombus2()
{
    brush2 = getEnt("spawn_rhombus_active2", "targetname");
    brush2end = getEnt("end_rhombus_active2", "targetname");
    brush2end2 = getEnt("sniper_rhombus_active2", "targetname");
    brush2end3 = getEnt("elem_rhombus_active2", "targetname");
    brush2end4 = getEnt("knife_rhombus_active2", "targetname");
    wait 0.1;
    brush2 moveZ (40, 1.5, 0, 0);
    brush2end moveZ (40, 1.5, 0, 0);
    brush2end2 moveZ (40, 1.5, 0, 0);
    brush2end3 moveZ (40, 1.5, 0, 0);
    brush2end4 moveZ (40, 1.5, 0, 0);
    wait 1.6;

    while(1)
        {
        brush2 moveZ (-48, 0.05, 0, 0);
        brush2end moveZ (-48, 0.05, 0, 0);
        brush2end2 moveZ (-48, 0.05, 0, 0);
        brush2end3 moveZ (-48, 0.05, 0, 0);
        brush2end4 moveZ (-48, 0.05, 0, 0);
        wait 0.1;
        brush2 moveZ (48, 2, 0, 0);
        brush2end moveZ (48, 2, 0, 0);
        brush2end moveZ (48, 2, 0, 0);
        brush2end moveZ (48, 2, 0, 0);
        wait 2.1;
        }
}
spawnRhombus3()
{
    brush3 = getEnt("spawn_rhombus_active3", "targetname");
    brush3end = getEnt("end_rhombus_active3", "targetname");
    brush3end2 = getEnt("sniper_rhombus_active3", "targetname");
    brush3end3 = getEnt("elem_rhombus_active3", "targetname");
    brush3end4 = getEnt("knife_rhombus_active3", "targetname");
    wait 0.1;
    brush3 moveZ (32, 1, 0, 0);
    brush3end moveZ (32, 1, 0, 0);
    brush3end2 moveZ (32, 1, 0, 0);
    brush3end3 moveZ (32, 1, 0, 0);
    brush3end4 moveZ (32, 1, 0, 0);
    wait 1.1;

    while(1)
        {
        brush3 moveZ (-48, 0.05, 0, 0);
        brush3end moveZ (-48, 0.05, 0, 0);
        brush3end2 moveZ (-48, 0.05, 0, 0);
        brush3end3 moveZ (-48, 0.05, 0, 0);
        brush3end4 moveZ (-48, 0.05, 0, 0);
        wait 0.1;
        brush3 moveZ (48, 2, 0, 0);
        brush3end moveZ (48, 2, 0, 0);
        brush3end2 moveZ (48, 2, 0, 0);
        brush3end3 moveZ (48, 2, 0, 0);
        brush3end4 moveZ (48, 2, 0, 0);
        wait 2.1;
        }
}

spawnRhombusLines()
{
    lines = getEnt("spawn_rhombus_lines", "targetname");
    wait 0.1;
    lines hide();

    active_lines = getEnt("spawn_rhombus_lines_activ", "targetname");
    wait 0.1;
    active_lines show();
}


//------------------------------------------------------------------------------------------------------------------SECRET------------------------------------



//----------------------------------------------------------------------EXP---------------------------


//------------------------------------------------------------------------------------------------------------------------------