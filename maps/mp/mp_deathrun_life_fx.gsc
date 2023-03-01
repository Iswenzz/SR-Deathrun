main()
{
	level._effect[ "torchfire" ] = loadfx( "fire/firelp_barrel_pm" );
	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_deathrun_crystal_fx::main();
#/		
}