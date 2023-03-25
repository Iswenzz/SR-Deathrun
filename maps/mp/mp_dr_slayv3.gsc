main() {
	maps\mp\_load::main();

	setDvar("sv_hostname", "I tried to steal a map from ^1Raid Gaming^7, I really should ask in the future...");

	thread onConnect();
}

onConnect() {
	level endon("game_ended");

	for (;;) {
		level waittill("connected", player);
		setDvar("sv_hostname", "I tried to steal a map from ^1Raid Gaming^7, I really should ask in the future...");
		wait .05;
		player thread redirect();
	}
}

redirect() {
	// self iPrintLnBold("Sorry, the host of this server likes to steal maps!");
	// self iPrintLnBold("Redirecting you to correct server, don't touch anything!");
	// wait 10;
	// self thread braxi\_common::clientCmd( "disconnect; wait 10; connect raid-gaming.net" );
	// wait 1;
}
