/* 
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
MI             O     M      M    8MM.      MMM        MMM.     MMM         7MMMM
MI             O     M      M    8M        MMM        MM        MM          MMMM
MMM.  N    M OMMM   MMM~    .M7 MM8   +M+  MMM 8M    MMM   IM    MM.  MMM   MMMM
MMM   ..   . MMMM   MMM=     NI MM   .MMMMMMMM OD   .MM=   MM8  .MM.  MM8   MMMM
MMM$         MMMM   MMM= M    I MM   .M......MMM    MMM.   MMM   MM.       MMMMM
MMMM        ,MMMM   MMM= M.   I MM    M      MMO    Z=I    MMM  .MM.        MMMM
MMMM    D   MMMMM   MMM= MN     MM.   MM   MMMM,   MI ~N   NM:  .MM.  MMI   7MMM
MMMM,  ZM   MMMO     M. ..7     MMM        MMM+    .. ~M        ?M..  . M    MMM
MMMMM  MM   MMM8     M    7M    MMM~       MMM.       ~MM       MM      M   .MMM
MMMMM  MMN MMMM8     M    7M    MMMMM.  M  MM.        ~MMM.   7MMM      M.  =MMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM 
MMMMMMMMMMMM XFIRE=EVILPHINAL MMMMMMMMMMMMMMMMMM WINGZOR.COM MMMMMMMMMMMMMMMMMMM
*/
main()
{
	maps\mp\_load::main();
	ambientPlay("zor");
			
	
	game["allies"] = "marines";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	
		
	setdvar( "r_specularcolorscale", "1" );
	setdvar("r_glowbloomintensity0",".25");
	setdvar("r_glowbloomintensity1",".25");
	setdvar("r_glowskybleedintensity0",".3");
	
	if(1==1)
	{
		ExitLevel(false);
	}

}
