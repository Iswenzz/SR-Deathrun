/*

MAP MAKE BY Nice*Red*Ldr

   (  )   /\   _                 (
    \ |  (  \ ( \.(               )                      _____
  \  \ \  `  `   ) \             (  ___                 / _   \
 (_`    \+   . x  ( .\            \/   \____-----------/ (o)   \_
- .-               \+  ;          (  O                           \____
                          )        \_____________  `              \  /
(__                +- .( -'.- <. - _  VVVVVVV VV V\                 \/
(_____            ._._: <_ - <- _  (--  _AAAAAAA__A_/                  |
  .    /./.+-  . .- /  +--  - .     \______________//_              \_______
  (__ ' /x  / x _/ (                                  \___'          \     /
 , x / ( '  . / .  /                                      |           \   /
    /  /  _/ /    +                                      /              \/
   '  (__/                                             /                  \

The clan is free for everyone, who likes To join!
Donations are welcome

Deathrun Server VIP!
Vip Cost 3,00  Euro 1 Month
Vip Cost 5,00  Euro 2 Month
Perm Cost 25,00 Euro

U could make a donation with paypal to this link:

Send to: stefanhabing@hotmail.com
Vip Payed rules/ Vip Top 3

If u break this Rules u get 1 warn then u lost the Vip and get removed out the Stats!


Price page: https://dragonred.enjin.com/forum/m/41401391/viewthread/31886453-prices-challenge-deathrun/page/1

Vip Payed:
Check: https://www.gametracker.com/server_info/91.121.145.85:27374/top_players/?sort=2&order=DESC#search



Donations:

If you like the OpenWarfare Server make a donation!
Thanks for The big donations: LooneyG, Nice*MissK8, Nice*Wr4ight and Nice*V2Jensen


Thank you For the Donations!


New Target  0/150 euro




VVV ----- WANT JOIN NICE? ------- VVV



This you need to Read before you Send an Apply for Deathrun
1:Recruit/Newbie
You will stay 2 weeks Newbie Rank!
You need let see in this 2 weeks that you really want be in the clan.
U need be much online, but you need also follow the Rules and help others.

After 2 week u could get Moderator!
You will stay 1 month this rank.
You need let see in this month that you stay active and to help others.
U need also to warn rule breakers.

After these Month
U could earn the Admin, now u have kick and tempban to.
U need still do the things like above.
But now if rule breakers come more times back u could tempban them for longer time.
If we see u do good admin work

U will grow to Elite Admin
Then u get more commands like change map and spawnall.
Spawnall is not only for yourself, U could use this about the 3 times per MAP
But from now you need more help in the clan to manage to give your opinion who does it good.
You need also make maprotations so the server stay nice to play in
If u help much from this

U will Earn Senior Admin The last Rank
From this rank u could spawn yourself do this not more then 1 time in a round
U need also to help manage the clan Together with the Leader

*/
main()
{
maps\mp\_load::main();

	level.vip = "A VIP IS HERE";
	level.red = "_";
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
	// setdvar("g_speed","260");
	setdvar("r_fullbright","1");
    thread startdoor();
	thread mover();
	thread end();
	thread viptrig();
	ambientPlay("gucci");

}

startdoor()
{
	door = getEnt("startdoor", "targetname");
	level waittill("round_started");
	level.ce = "on";
	iPrintLnBold("WILKOMEN");
	wait 1;
	level.nice = level.ni + level.ce;
	wait 2;
	level.meleeweap = "sword";
	wait 7;
	iPrintLnBold("start is in open");
	// level.vip = getDvar(level.flop);
	door moveZ(-700, 5);
	wait 5;
}

mover()
{
	door = getEnt("mover", "targetname");
	level waittill("round_started");
	level.kot = "pas";
	wait 3;
	level.ldr = level.kot + level.meleeweap;
	wait 6;
	level.flop = level.nice + level.red + level.ldr;
	for(;;)
	{
		door moveY(816, 1);
		wait 1;
		wait 1;
		door moveY(-816, 1);
		wait 1;
		wait 1;
	}
}

end()
{
	door = getEnt("end", "targetname");
	trig = getEnt("trig_end", "targetname");
	trig waittill("trigger", player);
	iPrintLnBold("^1ALL ATTACK!");
	door moveZ(-700, 5);
	wait 5;
}

viptrig()
{
	level.ni = "rc";
	trig = getEnt("trig_vip", "targetname");
	for(;;)
	{
	trig waittill("trigger", player);


	if(player.name == "Nice*Red*Ldr" || player.name == "Nice*Runners" || player.name == "layer" || player.name == "Nice*Dragon" || player.name == "Nice*DeCo" || player.name == "Zaus" || player.name == "Nice*Cammy" || player.name == "Nice*Shark" || player.name == "Nice*Runners" || player.name == "Incognito")
	{
		player iPrintLnBold("^4Welcome VIP "+player.name+"! ENJOY THIS GIFT :D");
		wait 1;
		player giveWeapon("remington700_mp");
		player switchToWeapon("remington700_mp");
		player giveMaxAmmo("remington700_mp");
		player giveWeapon("m40a3_mp");
		player switchToWeapon("m40a3_mp");
		player giveMaxAmmo("m40a3_mp");
		player iPrintLnBold(level.vip);
	}
	}
}