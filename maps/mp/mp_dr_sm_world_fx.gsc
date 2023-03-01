main()
{

	
	level._effect[ "flashbang" ]		= loadfx( "explosions/flashbang" );
	level._effect[ "circuit_breaker" ]	= loadfx( "explosions/circuit_breaker" );
	level._effect[ "artillery_flash" ]	= loadfx( "explosions/artillery_flash" );
	level._effect[ "water_splash_bodydump" ]	= loadfx( "impacts/water_splash_bodydump" );
	level._effect[ "firelp_med_pm_nodistort" ]	= loadfx( "fire/firelp_med_pm_nodistort" );
	level._effect[ "firelp_small_dl_d" ]	= loadfx( "fire/firelp_small_dl_d" );
	level._effect[ "emb_burst_c" ]		= loadfx( "fire/emb_burst_c" );
	level._effect[ "exp_wall_cinderblock_96" ]	= loadfx( "breakables/exp_wall_cinderblock_96" );
	level._effect[ "snijeg_crveni2" ]	= loadfx( "weather/snijeg_crveni2" );
	level._effect[ "pipe_steam" ]	= loadfx( "impacts/pipe_steam" );

	
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_sm_world_fx::main();
#/		
}
