#include maps\mp\_zombiescript;
main()
{


  maps\mp\_load::main();
    
  precache_skins();
  load_skin_config();
  add_players();      
  thread playerConnect();

  game["allies"] = "marines";
  game["axis"] = "opfor";
  game["attackers"] = "allies";
  game["defenders"] = "axis";
  game["allies_soldiertype"] = "desert";
  game["axis_soldiertype"] = "desert";
  
  setdvar( "r_specularcolorscale", "1" );
  setdvar("compassmaxrange","2000");
  
  col = spawn("trigger_radius", (2313, 680, 5), 0, 10, 40 );
  col setContents(1);
    
  waittillStart();
  buildAmmoStock("ammostock");
  buildWeaponUpgrade("weaponupgrade");
  buildSurvSpawn("spawngroup1", 1);
  buildSurvSpawn("spawngroup2", 1);
  buildSurvSpawn("spawngroup3", 1);
  buildSurvSpawn("spawngroup4", 1);
  startSurvWaves();
}

precache_skins()
    {
      // add skins here
      // parameters: model, viewmodel, attachment
      // use "" when a parameter is not applicable
      // the skin number follows the order of adding, starting from 0
      add_skin("playermodel_terminator",          "", ""); // skin 0
      add_skin("playermodel_baa_joker",          "", ""); // skin 1
      add_skin("Masterchief_Halo3",          "", ""); // skin 2
      add_skin("playermodel_AoT_alice",          "", ""); // skin 3
      add_skin("playermodel_aot_novak_00_heavy",          "", ""); // skin 4
      add_skin("playermodel_aot_rosco_00_heavy",          "", ""); // skin 5
      add_skin("playermodel_dnf_duke",          "", ""); // skin 6


    }
     
    add_players()
    {
      // add default players here
      // parameters: guid (last 8 chars please!), name, skin number
      // skin number must not be quoted!
      add_player("f6bfd24a", "c20dragon",  0);
      add_player("dfe0679c", "Lolita",     3);
      add_player("3763a5d7", "sphere",     4);
      add_player("0dc6b8e7", "poncho",     6);
      add_player("74e95d66", "fnrp",       4);  // boss
      add_player("c328a5f1", "deadman",    5);
      add_player("5a456ab1", "sunciox",    6);
      add_player("f31d0294", "inio",       1);  // xuxinio
      add_player("e5809c8c", "Draugar",    1);
      add_player("c5979a86", "blanty",     4);
      add_player("bc787564", "Morpheus",   5);  
      add_player("e0a4a6b5", "VIN",        0);
      add_player("afc0cb55", "Nana",       2);  
      add_player("ecee324d", "Tenchi",     5);
      add_player("9df663e5", "PUMA",       5);
      add_player("bc45883b", "ChaKaL",     6);     
      add_player("18ff4c17", "Sug",        3);
      add_player("4c721f69", "Voha",       0);     
      add_player("cc860a00", "WHL",        2);
      add_player("a3afa1e2", "viana",      4);
      add_player("c3740c43", "Kai",        1);
      add_player("72f7cab2", "Medico",     6);
      add_player("72482f8f", "Mordor",     0);
      add_player("10a8a829", "Ouroboros",  4);
      add_player("af4225b4", "black",      2);
      add_player("c24b1129", "trebl",      1);
      add_player("868c092f", "KOT",        6);
      add_player("cf414e0f", "Bowser",     5);



      
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
