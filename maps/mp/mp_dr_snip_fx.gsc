main()
{
	level.scr_sound["joker"] = "joker";
/#
	if ( getdvar( "clientSideEffects" ) != "1" )
		maps\createfx\mp_dr_snip_fx::main();
#/		 
}
