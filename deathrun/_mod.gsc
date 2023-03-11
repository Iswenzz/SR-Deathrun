main()
{
	precache();

	deathrun\sys\_dvar::initDvars();

	maps\mp\gametypes\_hud::init();
	maps\mp\gametypes\_hud_message::init();
	maps\mp\gametypes\_damagefeedback::init();
	maps\mp\gametypes\_clientids::init();
	maps\mp\gametypes\_gameobjects::init();
	maps\mp\gametypes\_gameobjects::main([]);
	maps\mp\gametypes\_spawnlogic::init();
	maps\mp\gametypes\_oldschool::deletePickups();
	maps\mp\gametypes\_hud::init();
	maps\mp\gametypes\_quickmessages::init();
	maps\mp\gametypes\_weapons::init();

	sr\_mod::main();
	braxi\_mod::main();

	sr\game\_cheat::main();
	sr\game\_demo::main();
	sr\game\_perks::initPerks();
	sr\game\_defrag::main();
	sr\game\_time::main();
	sr\game\_vote::initVote();
	sr\game\_poll::initPoll();
	sr\game\_rank::initRank();
	sr\game\_hitmarker::main();
	sr\game\_killcam::main();
	sr\game\fx\_trail::main();
	sr\game\menus\_main::initMenus();
	sr\game\menus\_owner::main();
	sr\game\minigames\_main::initMinigames();
	sr\game\music\_main::initMusics();
	sr\game\weapons\_main::main();

	sr\libs\portal\_main::initPortal();

	sr\player\_hide::main();
	sr\player\_insertion::main();
	sr\player\customize\_main::initCustomize();
	sr\player\fx\_spray::main();
	sr\player\fx\_shaders::initShaders();
	sr\player\modes\_main::initModes();
	sr\player\modes\_defrag::main();
	sr\player\modes\_noclip::main();
	sr\player\modes\_pickup::main();
	sr\player\modes\_portal::main();
	sr\player\modes\_practise::main();
	sr\player\modes\_debug::main();
	sr\player\huds\_cgaz::main();
	sr\player\huds\_crosshair::main();
	sr\player\huds\_fps::main();
	sr\player\huds\_keys::main();
	sr\player\huds\_velocity::main();
	sr\player\huds\_viewkick::main();
	sr\player\huds\_voice::main();

	sr\commands\_admin::main();
	sr\commands\_debug::main();
	sr\commands\_graphics::main();
	sr\commands\_misc::main();
	sr\commands\_music::main();
	sr\commands\_player::main();
	sr\commands\_vote::main();
	sr\commands\_map::main();
	sr\commands\_defrag::main();
	sr\commands\_portal::main();

	deathrun\game\_game::main();
	deathrun\game\_map::main();
	deathrun\game\_demo::main();
	deathrun\game\_match::main();
	deathrun\game\_menus::main();
	deathrun\game\_scoreboard::main();
	deathrun\game\_leaderboards::initLeaderboards();
	deathrun\game\_pbs::initPBs();

	deathrun\player\_settings::main();
	deathrun\player\run\_main::main();
	deathrun\player\huds\_speedrun::main();
	deathrun\player\huds\_player::main();
	deathrun\player\huds\_demo::main();

	deathrun\commands\_deathrun::main();
}

precache()
{
	precacheItem("shop_mp");
	precacheItem("vip_mp");
	precacheItem("knife_mp");
	precacheItem("dog_mp");
	precacheItem("shovel_mp");
	precacheItem("rtd_mp");
	precacheItem("tomahawk_mp");
	precacheItem("fortnite_mp");

	precacheShader("time_hud");
	precacheShader("sr_shop");
	precacheShader("sr_dice");
	precacheShader("sr_vip");
	precacheShader("sr_insert");
	precacheShader("speedrunner_logo");

	precacheModel("german_sheperd_dog");
	precacheModel("collision_sphere");
	precacheModel("mil_frame_charge");
	precacheModel("ch_crate64x64");
}
