main()
{
	level._effect[ "lightball" ] = loadfx( "spaceball_v2/lightball" );
	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_crystal_fx::main();
#/		
}