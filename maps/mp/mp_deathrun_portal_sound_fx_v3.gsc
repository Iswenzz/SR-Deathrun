
main()
{

//mp_deathrun_portal_sound_fx_v3.gsc (c) rednose
//Welcome ff-extract guy!

//fx1

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 3936, 176, -380 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "looping_radio_mix";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 4528, 928, -400 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "turretsong";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 3159, 167, 46 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "still_alive";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( -5066, 1656, -18 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "portalende";

ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( -4719, -1591, 329 );
ent.v[ "angles" ] = ( 90, 90, 80 );
ent.v[ "soundalias" ] = "emt_powerline_hum3_loop";






}


