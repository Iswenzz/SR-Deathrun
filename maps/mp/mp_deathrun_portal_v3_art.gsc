main()
{
	level.tweakfile = true;
 
	setdvar( "scr_fog_disable", "0" );
	setExpFog( 1000, 2500, 0.501961, 0.501961, 0.45098, 0 );
	VisionSetNaked( "mp_deathrun_portal_v3", 0 );
}

