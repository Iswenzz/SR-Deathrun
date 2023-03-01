main()
{
	level._effect[ "crystal_blue_fire" ] = loadfx( "custome/crystal_blue_fire" );
	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_crystal_fx::main();
#/		
}