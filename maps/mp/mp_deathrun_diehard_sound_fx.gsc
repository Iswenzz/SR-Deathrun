main()

{
//sound
ent = maps\mp\_createfx::createLoopSound();
ent.v[ "origin" ] = ( 300, 300, 300 ); // Enter the Coordinates !!! 
ent.v[ "angles" ] = ( 359, 360, 360 );
ent.v[ "soundalias" ] = "aliasname";