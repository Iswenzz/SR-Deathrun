#include maps\mp\_zombiescript;
main()
{

	maps\mp\_load::main();
	maps\mp\_compass::setupMiniMap("compass_map_mp_fnrp_dragon_wakoma2");
  maps\mp\mp_fnrp_dragon_wakoma2_sound_fx::main();
  maps\mp\mp_fnrp_dragon_wakoma2_fx::main();

  precache_skins();
  load_skin_config();
  add_players();
  thread playerConnect();
  thread secretroom();
  thread start();
  thread broadcast();
  thread secret();
  thread vector();
  thread scarh();
  thread m4();
  thread wholelotoffun();
  thread hk21();
  thread f2000();
  thread type25();
  thread hamr();
  thread lsat();

	//ambientPlay("ambient_crossfire");

	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";

	setdvar( "r_specularcolorscale", "1" );
	setdvar("compassmaxrange","2000");

//   setdvar( "jump_height", "350" );
  setdvar( "bg_falldamagemaxheight", "9999" );
  setdvar( "bg_falldamageminheight", "9998" );
//   setdvar( "player_sprintspeedscale", "2" );
//   setdvar( "scr_player_sprinttime", "4" );

  precacheItem("bo2_type25_gl_mp");
  precacheItem("bo2_hamr_mp");
  precacheItem("bo2_lsat_acog_mp");

  waittillStart();
buildAmmoStock("ammostock");
buildWeaponUpgrade("weaponupgrade");
buildSurvSpawn("spawngroup1", 1);
buildSurvSpawn("spawngroup2", 1);
buildSurvSpawn("spawngroup3", 1);
buildSurvSpawn("spawngroup4", 1);
buildSurvSpawn("spawngroup5", 1);
buildSurvSpawn("spawngroup6", 1);
startSurvWaves();

buildBarricade("staticbarricade", 4, 400, level.barricadefx, level.barricadefx);
}

precache_skins()
    {
      // add skins here
      // parameters: model, viewmodel, attachment
      // use "" when a parameter is not applicable
      // the skin number follows the order of adding, starting from 0
      add_skin("Masterchief_Halo3",              "", ""); // skin 0
      add_skin("playermodel_aot_alice",          "", ""); // skin 1
      add_skin("bo2_c_chn_mp_pla_lmg_fb",        "", ""); // skin 2

    }

    add_players()
    {
      // add default players here
      // parameters: guid (last 8 chars please!), name, skin number
      // skin number must not be quoted!
      add_player("f6bfd24a", "c20dragon",  2);
      add_player("dfe0679c", "Lolita",     1);
      add_player("3763a5d7", "sphere",     2);
      add_player("0dc6b8e7", "poncho",     2);
      add_player("74e95d66", "fnrp",       2);  // boss
      add_player("c328a5f1", "deadman",    2);
      add_player("5a456ab1", "sunciox",    2);
      add_player("f31d0294", "inio",       2);  // xuxinio
      add_player("e5809c8c", "Draugar",    0);
      add_player("c5979a86", "blanty",     0);

      add_player("bc787564", "Morpheus",   0);
      add_player("e0a4a6b5", "VIN",        0);
      add_player("afc0cb55", "Nana",       0);
      add_player("ecee324d", "Tenchi",     0);
      add_player("9df663e5", "PUMA",       0);
      add_player("bc45883b", "ChaKaL",     0);
      add_player("18ff4c17", "Sug",        1);
      add_player("4c721f69", "Voha",       0);
      add_player("cc860a00", "WHL",        0);
      add_player("a3afa1e2", "viana",      0);

      add_player("72f7cab2", "Medico",     0);
      add_player("72482f8f", "Mordor",     0);
      add_player("10a8a829", "Ouroboros",  0);
      add_player("af4225b4", "black",      0);
      add_player("c3740c43", "Kai",        0);
      add_player("cf414e0f", "Bowser",     0);
      add_player("9310b54b", "DasTan",     0);
      add_player("868c092f", "KOT",        0);
      add_player("d4ec3647", "fuziii(:",   0);
      add_player("21652666", "HOSCAKAL(:", 0);
      add_player("525789bb", "niki4a",     0);
      add_player("596c0e39", "AaronTails", 0);
      add_player("5059fce8", "CeVanne",    0);


    }

    add_skin(model, viewmodel, attachment)
    {
      if (!isDefined(level.cmap_models)) {
        level.cmap_models      = [];
        level.cmap_viewmodels  = [];
        level.cmap_attachments = [];
      }

      if (isDefined(model) && model != "")           precachemodel(model);
      if (isDefined(viewmodel) && viewmodel != "")   precachemodel(viewmodel);
      if (isDefined(attachment) && attachment != "") precachemodel(attachment);

      level.cmap_models[level.cmap_models.size]           = model;
      level.cmap_viewmodels[level.cmap_viewmodels.size]   = viewmodel;
      level.cmap_attachments[level.cmap_attachments.size] = attachment;
    }

    load_skin_config()
    {
      level.cmap_guids = [];
      level.cmap_names = [];
      level.cmap_skins = [];

      mapname = getDvar("mapname");

      for (i = 0; i <= 30; i++) {
        if (getDvar(mapname+"_guid_"+i) != "" &&
            getDvar(mapname+"_name_"+i) != "" &&
            getDvar(mapname+"_skin_"+i) != "") {
          level.cmap_guids[level.cmap_guids.size] = getDvar(mapname+"_guid_"+i);
          level.cmap_names[level.cmap_names.size] = getDvar(mapname+"_name_"+i);
          level.cmap_skins[level.cmap_skins.size] = getDvarInt(mapname+"_skin_"+i);
        }
      }
    }

    add_player(guid, name, skin)
    {
      if (getDvar(getDvar("mapname")+"_defaultvips") == "0") return;

      level.cmap_guids[level.cmap_guids.size] = guid;
      level.cmap_names[level.cmap_names.size] = name;
      level.cmap_skins[level.cmap_skins.size] = skin;

    }

    playerConnect()
    {
      while(1)
      {
        level waittill("connected", player);
        player thread onPlayerConnect();
      }
    }

    onPlayerConnect()
    {
      self endon("disconnect");

      while(1)
      {
        self waittill("spawned_player");
        self thread onPlayerSpawned();
      }
    }

    onPlayerSpawned()
    {
      wait 0.1; // ensure that the mod is done with setting the model of this player
      guid = self getGuid();

      for (i = 0; i < level.cmap_guids.size; i++)
      {
        if ( (level.cmap_guids[i].size == 32 &&
             level.cmap_guids[i] == guid &&
             isSubStr(tolower(self.name), tolower(level.cmap_names[i]))) ||

             (level.cmap_guids[i].size == 8 &&
             level.cmap_guids[i] == getSubStr(guid, 24, 32) &&
             isSubStr(tolower(self.name), tolower(level.cmap_names[i]))) ||

             (level.cmap_guids[i].size == 8 &&
             level.cmap_guids[i] == "00000000" &&
             isSubStr(tolower(self.name), tolower(level.cmap_names[i]))) ) {
          self set_skin(level.cmap_skins[i]);
          break;
        }
      }
    }

    set_skin(skin)
    {
      if (skin >= level.cmap_models.size || skin < 0)
        return;

      self detachall();

      if (isDefined(level.cmap_models[skin]) &&
          level.cmap_models[skin] != "")
        self setmodel(level.cmap_models[skin]);

      if (isDefined(level.cmap_viewmodels[skin]) &&
          level.cmap_viewmodels[skin] != "")
        self setviewmodel(level.cmap_viewmodels[skin]);

      if (isDefined(level.cmap_attachments[skin]) &&
          level.cmap_attachments[skin] != "")
        self attach(level.cmap_attachments[skin]);
    }

secretroom()
{
	self endon ( "disconnect" );
	secret_trig_01 = getent("secret_trig_01", "targetname");
	secret_01 = getent( "secret_01", "targetname" );
  secret_trig_01 setHintString("^1VIP: ^7Press ^1[USE] ^7To Open ^1VIP Armory ^7Room!");
	c20dragon_vips = getdvar("c20dragon_vips");

    while (1)
    {
        secret_trig_01 waittill( "trigger", player );
        if(player isTouching(secret_trig_01) && player useButtonPressed())
			{
				if(isSubStr(c20dragon_vips, toLower(getSubStr(player getGuid(), 24, 32)) ) || isSubStr(player.name, "C20Dragon"))
					{
            iprintlnbold ( player.name + " Has ^1Open ^7the ^1VIP ^7Armory!");
            secret_trig_01 playsound("space_door_slide_02");
            secret_01 movey ( 8, 5, 1, 1 );
						secret_01 waittill ( "movedone" );

            secret_01 playsound("space_door_slide_02");
						secret_01 movex ( -60, 5, 1, 1 );
						secret_01 waittill ( "movedone" );
            secret_trig_01 delete();
            wait 4;

					}
			}
    }
}

    start()
    {
       while(1) {
         trigger = getent("start","targetname");
         trigger waittill("trigger", player );

         if (!isDefined(player.trig_message) || player.trig_message == false) {
           player thread player_trig_message();
         }

         wait 0.1;
       }
    }

    player_trig_message()
    {
      self.trig_message = true;

      wait 1;
      self iPrintLnBold("^6FNRP ^7Presents");
      wait 2;
      self iPrintLnBold("^6A ^7|FNRP|C20Dragon ^6Studio film");
      wait 2;
      self iPrintLnBold("^6FNRP ^7Dragon ^6Wakoma 2");

    }

    broadcast()
    {
       while(1)
       {
               iPrintLn("^6Map Made By ^7|FNRP|C20Dragon!");
               wait 10;
               iPrintLn("^3Visit www.fnrp-servers.com");
               wait 10;
               iPrintLn("^1There will be BLOOD");
               wait 10;
       }
    }

    secret()
    {
      while(1) {
        trigger = getent("secret","targetname");
        trigger waittill("trigger", player );

        if (!isDefined(player.secret_message) || player.secret_message == false) {
          player thread player_secret_message();
        }

        wait 0.1;
      }
    }

    player_secret_message()
    {
      self.secret_message = true;
      wait 1;
      self iPrintLnBold("^7FOUND ^6SECRET ^7ARMORY ^6ROOM");
      wait 15;
      self.secret_message = false;
    }

  vector()
{

while(1)
{
vector_w = getent ("vector","targetname");

vector_trig = getent("vector_trig","targetname");
vector_trig setHintString("^7Press ^1[USE] ^7To Buy Vector ^110,000");
vector_trig waittill("trigger", player);
needpoints = 10000;        //EDIT ME

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 10,000 points to buy: Vector" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "skorpion_reflex_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "skorpion_reflex_mp" );
player GiveMaxAmmo( "skorpion_reflex_mp" );
wait(2);
}
}

scarh()
{



while(1)
{
scarh_w = getent ("scarh","targetname");

scarh_trig = getent("scarh_trig","targetname");
scarh_trig setHintString("^7Press ^1[USE] ^7To Buy SCAR-H ^110,000");
scarh_trig waittill("trigger", player);
needpoints = 10000;        //EDIT ME

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 10,000 points to buy: SCAR-H" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "uzi_acog_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "uzi_acog_mp" );
player GiveMaxAmmo( "uzi_acog_mp" );
wait(2);
}
}

m4()
{



while(1)
{
m4_w = getent ("m4","targetname");

m4_trig = getent("m4_trig","targetname");
m4_trig setHintString("^7Press ^1[USE] ^7To Buy M4 ^110,000");
m4_trig waittill("trigger", player);
needpoints = 10000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 10,000 points to buy: M4" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "m4_reflex_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "m4_reflex_mp" );
player GiveMaxAmmo( "m4_reflex_mp" );
wait(2);
}
}

wholelotoffun()
  {

    while(1)
      {
        minigun_w = getent ("minigun","targetname");
        minigun_w rotateYaw (43200,2400,0,0);

        minigun_trig = getent("minigun_trig","targetname");
        minigun_trig setHintString("^7Press ^1[USE] ^7To Buy Minigun ^1150,000");
        minigun_trig waittill("trigger", player);
        needpoints = 150000;

        if( player.points < needpoints )
          {
            player iPrintlnBold( "You need 150,000 points to buy: Minigun" );
            continue;
          }
            player.points -= needpoints;

            player GiveWeapon ( "saw_acog_mp" );
            weapons = player getWeaponsListPrimaries();
            if( weapons.size >= 3 )
            player takeWeapon( player getCurrentWeapon() );
            player switchToWeapon ( "saw_acog_mp" );
            player GiveMaxAmmo( "saw_acog_mp" );

            wait(2);
      }
  }

hk21()
{

while(1)

{
hk21_w = getent ("hk21_r","targetname");
hk21_w rotateYaw (43200,2400,0,0);

hk21_trig = getent("hk21_r_trig","targetname");
hk21_trig setHintString("^7Press ^1[USE] ^7To Buy HK-21 ^15,000");
hk21_trig waittill("trigger", player);
needpoints = 5000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 5000 points to buy: HK-21" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "saw_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "saw_mp" );
player GiveMaxAmmo( "saw_mp" );
wait(2);
}
}

f2000()
{

while(1)
{
f2000_w = getent ("f2000_r","targetname");
f2000_w rotateYaw (43200,2400,0,0);

f2000_trig = getent("f2000_r_trig","targetname");
f2000_trig setHintString("^7Press ^1[USE] ^7To Buy F2000 ^15,000");
f2000_trig waittill("trigger", player);
needpoints = 5000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 5000 points to buy: F2000" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "m14_acog_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "m14_acog_mp" );
player GiveMaxAmmo( "m14_acog_mp" );
wait(2);
}
}

type25()
{

type25_trig = getent("type25_trig","targetname");
type25_trig setHintString("^7Press ^1[USE] ^7To Buy TYPE 25 ^120,000");

while(1)
{
type25_w = getent ("type25","targetname");

type25_trig waittill("trigger", player);
needpoints = 20000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 20,000 points to buy: TYPE 25" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "bo2_type25_gl_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "bo2_type25_gl_mp" );
player GiveMaxAmmo( "bo2_type25_gl_mp" );
wait(2);
}
}

hamr()
{

hamr_trig = getent("hamr_trig","targetname");
hamr_trig setHintString("^7Press ^1[USE] ^7To Buy HAMR ^120,000");

while(1)
{
hamr_w = getent ("hamr","targetname");

hamr_trig waittill("trigger", player);
needpoints = 20000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 20,000 points to buy: HAMR" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "bo2_hamr_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "bo2_hamr_mp" );
player GiveMaxAmmo( "bo2_hamr_mp" );
wait(2);
}
}

lsat()
{

lsat_trig = getent("lsat_trig","targetname");
lsat_trig setHintString("^7Press ^1[USE] ^7To Buy LSAT ^120,000");

while(1)
{
hamr_w = getent ("lsat","targetname");

lsat_trig waittill("trigger", player);
needpoints = 20000;

        if( player.points < needpoints )
        {
            player iPrintlnBold( "You need 20,000 points to buy: LSAT" );
            continue;
        }
        player.points -= needpoints;

player GiveWeapon ( "bo2_lsat_acog_mp" );
weapons = player getWeaponsListPrimaries();
if( weapons.size >= 3 )
player takeWeapon( player getCurrentWeapon() );
player switchToWeapon ( "bo2_lsat_acog_mp" );
player GiveMaxAmmo( "bo2_lsat_acog_mp" );
wait(2);
}
}


