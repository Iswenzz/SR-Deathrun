main()
{
	maps\mp\_load::main();

	ambientPlay("ambient");
	
	precacheItem("m40a3_mp");
	precacheItem("remington700_mp");
	precacheItem("p90_silencer_mp");
	
	
	level._effect["bouncefx"] = LoadFX("misc/ui_pickup_available");
	game["allies"] = "sas";
	game["axis"] = "opfor";
	game["attackers"] = "axis";
	game["defenders"] = "allies";
	game["allies_soldiertype"] = "desert";
	game["axis_soldiertype"] = "desert";
	

	// Teleporters \\
	
	thread a_stage2_tp();
	thread a_stage3_tp();
	thread a_stage4_tp();
	thread s4_to_3();
	thread s3_to_2();
	thread s2_to_1();
	thread stage2_tp();
	thread stage3_tp();
	thread stage4_tp();
	thread tpsniper();
	thread tpknife();
	thread tpold();
	thread tpbounce();		
	thread secretfail1tp();
	thread secretfail2tp();
	thread secretfail3tp();
	thread secretfail4tp();
	thread secretfinish_tp();
	thread bounce_fail1tp();
	thread bounce_fail2tp();
	
	// Traps \\
	
	thread trap_1();
	thread trap_2();
	thread trap_3();	
	thread trap_4();
	thread trap_5();
	thread trap_6();
	thread trap_7();
	thread trap_8();
	thread trap_9();
	thread trap_10();
	thread trap_11();
	
	// Others \\
	
	thread moving_pf();
	thread endmap();
	thread bounceroom_wep();
	thread trucky();
	thread secret_open();
	thread fail_soundplay();
	thread addTestClients();
	thread massage();
	thread addTriggerToList( "trap1" );
	thread addTriggerToList( "trap2" );
	thread addTriggerToList( "trap3" );
	thread addTriggerToList( "trap4" );
	thread addTriggerToList( "trap5" );
	thread addTriggerToList( "trap6" );
	thread addTriggerToList( "trap7" );
	thread addTriggerToList( "trap8" );
	thread addTriggerToList( "trap9" );
	thread addTriggerToList( "trap10" );
	thread addTriggerToList( "trap11" );
	
	}
	
a_stage2_tp()
{
trig = getEnt("a_stage1_finish", "targetname");
stage2 = getEnt("a_stage2_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage2.origin );
			player setplayerangles( stage2.angles );
		}
}

a_stage3_tp()
{
trig = getEnt("a_stage2_finish", "targetname");
stage3 = getEnt("a_stage3_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage3.origin );
			player setplayerangles( stage3.angles );
		}
}

a_stage4_tp()
{
trig = getEnt("a_stage3_finish", "targetname");
stage4 = getEnt("a_stage4_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage4.origin );
			player setplayerangles( stage4.angles );
		}
}


s4_to_3()
{
trig = getEnt("a_stage4_to_3", "targetname");
s3 = getEnt("a_stage3.1_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( s3.origin );
			player setplayerangles( s3.angles );
		}
}

s3_to_2()
{
trig = getEnt("a_stage3_to_2", "targetname");
s2 = getEnt("a_stage2.1_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( s2.origin );
			player setplayerangles( s2.angles );
		}
}

s2_to_1()
{
trig = getEnt("a_stage2_to_1", "targetname");
s1 = getEnt("a_stage1.1_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( s1.origin );
			player setplayerangles( s1.angles );
		}
}

stage2_tp()
{
trig = getEnt("stage1finish_trig", "targetname");
stage2 = getEnt("stage2_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage2.origin );
			player setplayerangles( stage2.angles );
			player iprintlnbold( "Welcome to stage 2" );
		}
}

stage3_tp()
{
trig = getEnt("stage2finish_trig", "targetname");
stage3 = getEnt("stage3_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage3.origin );
			player setplayerangles( stage3.angles );
			player iprintlnbold( "Welcome to stage 3" );
		}
}

stage4_tp()
{
trig = getEnt("stage3finish_trig", "targetname");
stage4 = getEnt("stage4_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player setOrigin( stage4.origin );
			player setplayerangles( stage4.angles );
			player iprintlnbold( "Welcome to the last Stage" );
		}
}

tpsniper()
{
j_s_tp = getEnt("j_to_sniper", "targetname");
a_s_tp = getEnt("a_to_sniper", "targetname");
s_trig = getEnt("s_trig", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
	for(;;)
		{
			s_trig waittill("trigger", player);
			if(!player sr\api\_deathrun::order())
			continue;
			b_trig delete();
			o_trig delete();
			k_trig delete();
			ambientstop ( 0 );
			ambientplay ( "sniper" );
			player SetOrigin( j_s_tp.origin );
			player setplayerangles( j_s_tp.angles );
			iprintlnbold ( player.name + " Has enterted ^3Sniper ^7room" );
			player takeallweapons();
			player GiveWeapon("m40a3_mp");
			player givemaxammo("m40a3_mp");
			player GiveWeapon("remington700_mp");
			player givemaxammo("remington700_mp");
			player SwitchToWeapon( "m40a3_mp" );
			level.activ SetOrigin( a_s_tp.origin );
			level.activ setplayerangles( a_s_tp.angles );
			level.activ takeallweapons();
			level.activ GiveWeapon("m40a3_mp");
			level.activ givemaxammo("m40a3_mp");
			level.activ GiveWeapon("remington700_mp");
			level.activ givemaxammo("remington700_mp");
			level.activ SwitchToWeapon( "m40a3_mp" );
			s_trig hide();
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;
			player iprintlnbold("^5Get ready for the ^1BATTLE !");
			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
			wait 1;
			player iprintlnbold("^33");
			level.activ iprintlnbold("^33");
			wait 1;
			player iprintlnbold("^22");
			level.activ iprintlnbold("^22");
			wait 1;
			player iprintlnbold("^11");
			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);			
			player death();
			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			s_trig show();
		}
}

tpbounce()
{
j_b_tp = getEnt("j_to_bounce", "targetname");
a_b_tp = getEnt("a_to_bounce", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
	for(;;)
		{
			b_trig waittill("trigger", player);
			if(!player sr\api\_deathrun::order())
			continue;
			s_trig delete();
			o_trig delete();
			k_trig delete();
			ambientstop ( 0 );
			ambientplay ( "bounce" );
			player SetOrigin( j_b_tp.origin );
			player setplayerangles( j_b_tp.angles );
			iprintlnbold ( player.name + " Has enterted ^3Bounce ^7room" );
			player takeallweapons();
			player GiveWeapon("tomahawk_mp");
			player SwitchToWeapon( "tomahawk_mp" );
			level.activ SetOrigin( a_b_tp.origin );
			level.activ setplayerangles( a_b_tp.angles );
			level.activ takeallweapons();
			level.activ GiveWeapon("tomahawk_mp");
			level.activ SwitchToWeapon( "tomahawk_mp" );
			b_trig hide();
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;			
			player iprintlnbold("^5Get ready for the ^1BATTLE !");
			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
			wait 1;
			player iprintlnbold("^33");
			level.activ iprintlnbold("^33");
			wait 1;
			player iprintlnbold("^22");
			level.activ iprintlnbold("^22");
			wait 1;
			player iprintlnbold("^11");
			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);
			player death();
			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			b_trig show();
		}
}

tpknife()
{
j_k_tp = getEnt("j_to_knife", "targetname");
a_k_tp = getEnt("a_to_knife", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
	for(;;)
		{
			k_trig waittill("trigger", player);
			if(!player sr\api\_deathrun::order())
			continue;
			s_trig delete();
			o_trig delete();
			b_trig delete();
			player SetOrigin( j_k_tp.origin );
			player setplayerangles( j_k_tp.angles );
			iprintlnbold ( player.name + " Has enterted ^3Knife ^7room" );
			player takeallweapons();
			player GiveWeapon("knife_mp");
			player SwitchToWeapon( "knife_mp" );
			level.activ SetOrigin( a_k_tp.origin );
			level.activ setplayerangles( a_k_tp.angles );
			level.activ takeallweapons();
			level.activ GiveWeapon("knife_mp");
			level.activ SwitchToWeapon( "knife_mp" );
			k_trig hide();
			player freezeControls(1);
			level.activ freezeControls(1);
			wait 0.3;
			player iprintlnbold("^5Get ready for the ^1BATTLE !");
			level.activ iprintlnbold("^5Get ready for the ^1BATTLE !");
			wait 1;
			player iprintlnbold("^33");
			level.activ iprintlnbold("^33");
			wait 1;
			player iprintlnbold("^22");
			level.activ iprintlnbold("^22");
			wait 1;
			player iprintlnbold("^11");
			level.activ iprintlnbold("^11");
			wait 1;
			player freezeControls(0);
			level.activ freezeControls(0);
			player death();
			iprintlnbold( "^2 " + player.name + " ^7is ^1DEAD !");
			k_trig show();
		}
}

tpold()
{
j_o_tp = getEnt("j_to_old", "targetname");
b_trig = getEnt("b_trig", "targetname");
o_trig = getEnt("o_trig", "targetname");
k_trig = getEnt("k_trig", "targetname");
s_trig = getEnt("s_trig", "targetname");
block = getEnt("old_block", "targetname");
block_trig = getEnt("old_block_trig", "targetname");
	for(;;)
		{
			o_trig waittill("trigger", player);
			if(!player sr\api\_deathrun::order())
			continue;
			s_trig delete();
			b_trig delete();
			k_trig delete();
			player SetOrigin( j_o_tp.origin );
			player setplayerangles( j_o_tp.angles );
			iprintlnbold ( player.name + " Has enterted ^3Old ^7way" );
			block notsolid();
			block_trig setHintString("");
		}
}
death()
{
self endon("disconnect");
self waittill("death");
}

secretfail1tp()
{
hit = getEnt("secret_fail1_trig", "targetname");
tp = getEnt("secret_fail1_respawn", "targetname");
	for(;;)
		{
			hit waittill("trigger", player);
			wait 0.2;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
			player iprintlnbold ( "Teleported back" );
		}		
}

secretfail2tp()
{
hit = getEnt("secret_fail2_trig", "targetname");
tp = getEnt("secret_fail2_respawn", "targetname");
	for(;;)
		{
			hit waittill("trigger", player);
			wait 0.2;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
			player iprintlnbold ( "Teleported back" );
		}		
}

secretfail3tp()
{
hit = getEnt("secret_fail3_trig", "targetname");
tp = getEnt("secret_fail3_respawn", "targetname");
	for(;;)
		{
			hit waittill("trigger", player);
			wait 0.2;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
			player iprintlnbold ( "Teleported back" );
		}		
}

secretfail4tp()
{
hit = getEnt("secret_up_fail_trig", "targetname");
tp = getEnt("secret_up_fail_respawn", "targetname");
	for(;;)
		{
			hit waittill("trigger", player);
			wait 0.2;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
			player iprintlnbold ( "Teleported back" );
		}
}

secretfinish_tp()
{
trig = getEnt("secretfinish_trig", "targetname");
tp = getEnt("stage4_tp", "targetname");
	for(;;)
		{
			trig waittill("trigger", player);
			player iprintlnbold ( "Well done !" );
			iprintlnbold ( "^6 " + player.name + "^7 Has finished the secret !" );
			wait 0.1;
			player setOrigin( tp.origin );
			player setplayerangles( tp.angles );
			player giveWeapon("p90_silencer_mp");
			player switchToWeapon("p90_silencer_mp");
			player braxi\_rank::giveRankXP( "", 50 );
		}
}

bounce_fail1tp()
{
hit = getEnt("b_room_fail1_trig", "targetname");
tp1 = getEnt("j_b_room_fail1", "targetname");
tp2 = getEnt("a_b_room_fail1", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			wait 0.1;
			if (player.pers["team"] == "axis")
			{
			player setOrigin( tp2.origin );
			player setplayerangles( tp2.angles );
			player iprintlnbold ( "Teleported back" );
			}
			else
			{
				if( player.pers["team"] == "allies")
				{
				wait 0.1;
				player setOrigin( tp1.origin );
				player setplayerangles( tp1.angles );
				player iprintlnbold ( "Teleported back" );
				}
			}
		}
}

bounce_fail2tp()
{
hit = getEnt("b_room_fail2_trig", "targetname");
tp1 = getEnt("j_b_room_fail2", "targetname");
tp2 = getEnt("a_b_room_fail2", "targetname");
	while(1)
		{
			hit waittill("trigger", player);
			wait 0.1;
			if (player.pers["team"] == "axis")
			{
			player setOrigin( tp2.origin );
			player setplayerangles( tp2.angles );
			player iprintlnbold ( "Teleported back" );
			}
			else
			{
				if( player.pers["team"] == "allies")
				{
				wait 0.1;
				player setOrigin( tp1.origin );
				player setplayerangles( tp1.angles );
				player iprintlnbold ( "Teleported back" );
				}
			}
		}
}

trap_1()
{
pf1 = getEnt("t1_pf1", "targetname");
pf2 = getEnt("t1_pf2", "targetname");
pf3 = getEnt("t1_pf3", "targetname");
pf4 = getEnt("t1_pf4", "targetname");
t1_trig = getEnt("trap1", "targetname");
t1_trig waittill("trigger", player);
t1_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		a = RandomInt( 4 );
		if(a==1)
		{
		pf1 notsolid();
		pf4 notsolid();
		}
		else if(a==2)
		{
		pf1 notsolid();
		pf3 notsolid();
		}
		else if(a==3)
		{
		pf2 notsolid();
		pf3 notsolid();
		}
		else
		{
		pf2 notsolid();
		pf4 notsolid();
		}
	}
}

trap_2()
{
pf = getEnt("t2_pf", "targetname");
bounce = getEnt("t2_bounce", "targetname");
bounce2 = getEnt("t2_bounce2", "targetname");
bounce3 = getEnt("t2_bounce3", "targetname");
t2_trig = getEnt("trap2", "targetname");
t2_trig waittill("trigger", player);
t2_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		b = RandomInt( 4 );
		if(b==1)
		{
		pf notsolid();
		}
		else if(b==2)
		{
		bounce notsolid();
		bounce2 notsolid();
		}
		else if(b==3)
		{
		bounce notsolid();
		bounce3 notsolid();
		}
		else
		{
		pf notsolid();
		}
	}
}

trap_3()
{
pf1 = getEnt("t3_pf1", "targetname");
pf2 = getEnt("t3_pf2", "targetname");
pf3 = getEnt("t3_pf3", "targetname");
p1 = getEnt("t3_p1", "targetname");
p2 = getEnt("t3_p2", "targetname");
p3 = getEnt("t3_p3", "targetname");
t3_trig = getEnt("trap3", "targetname");
t3_trig waittill("trigger", player);
t3_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while(1)
		{
		pf1 rotateyaw ( 950, 3);
		pf2 rotateyaw ( 950, 3);
		pf3 rotateyaw ( 950, 3);
		p1 rotateyaw (-660, 3);
		p2 rotateyaw (-660, 3);
		p3 rotateyaw (-660, 3);
		wait 3;
		}
	}
}

trap_4()
{
plat = getEnt("t4_pf", "targetname");
t4_trig = getEnt("trap4", "targetname");
t4_trig waittill("trigger", player);
t4_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		while(1)
		{
			plat rotateyaw ( 420, 3 ,0);
			wait 1;
		}
	}
}

trap_5()
{
t5_trig = getEnt("trap5", "targetname");
t5_trig waittill("trigger", player);
t5_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		thread spikes_right();
		thread spikes_left();
	}
}

trap_6()
{
pf1 = getEnt("t6_group1", "targetname");
pf2 = getEnt("t6_group2", "targetname");
pf3 = getEnt("t6_group3", "targetname");
pf4 = getEnt("t6_group4", "targetname");
t6_trig = getEnt("trap6", "targetname");
t6_trig waittill("trigger", player);
t6_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		for(;;)
		{
			pf1 movez(100, 2);
			pf2 movez(-100, 2);
			pf3 movez(-100, 2);
			pf4 movez(100, 2);
			wait 2;
			pf1 movez(-100, 2);
			pf2 movez(100, 2);
			pf3 movez(100, 2);
			pf4 movez(-100, 2);
			wait 2;
		}
	}
}

trap_7()
{
pf = getEnt("moving_pf", "targetname");
t7_trig = getEnt("trap7", "targetname");
t7_trig waittill("trigger", player);
t7_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		pf rotateroll(360, 1);
		pf rotatepitch(360, 1);
	}
}

trap_8()
{
group1 = getEnt("t8_bnc", "targetname");
group2 = getEnt("t8_pf", "targetname");
t8_trig = getEnt("trap8", "targetname");
t8_trig waittill("trigger", player);
t8_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
	group2 notsolid();
		while(1)
		{
			group1 rotatepitch(360, 2);
			wait 3.3;
		}
	}
}

trap_9()
{
brush1 = getEnt("t9_brush1", "targetname");
brush2 = getEnt("t9_brush2", "targetname");
t9_trig = getEnt("trap9", "targetname");
t9_trig waittill("trigger", player);
t9_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		c = randomInt( 2 );
		if(c==1)
		{
		brush2 notsolid();
			while(1)
			{
			brush1 rotatepitch(720, 3);
			wait 5;
			}
		}
		else
		{
		brush1 notsolid();
			while(1)
			{
			brush2 rotatepitch(720, 3);
			wait 5;
			}	
		}
	}
}

trap_10()
{
pf = getEnt("t10_block", "targetname");
group2 = getEnt("t10_unlock", "targetname");
t10_trig = getEnt("trap10", "targetname");
t10_trig waittill("trigger", player);
t10_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		group2 enablelinkto ();
		group2 linkto (pf);
		pf movez(150, 0.5);
		pf waittill("movedone");
		wait 2;
		group2 hide();
		group2 notsolid();
	}
}

trap_11()
{
pf = getEnt("t11_pf", "targetname");
t11_trig = getEnt("trap11", "targetname");
t11_trig waittill("trigger", player);
t11_trig delete();
if( isDefined( level.trapsDisabled ) && level.trapsDisabled){player iPrintLnBold("^2You are a noob");}
	else
	{
		pf notsolid();
	}
}

moving_pf()
{
pf = getEnt("moving_pf", "targetname");
	for(;;)
	{
		pf movey(472, 7, 1, 2);
		pf waittill("movedone");
		wait(0.5);
		pf movey(-472, 7, 1, 2);
		pf waittill("movedone");
		wait(0.5);
	}
}

endmap()
{
endtrig = getEnt("endmap_trig", "targetname");
endtrig waittill("trigger", player);
iprintlnbold ("^2" + player.name + " ^7Has finished the map ^1First!");
}

trucky()
{
truck = getEnt("trucky", "targetname");
truck2 = getEnt("trucky2", "targetname");
	while(1)
	{
		truck rotateyaw ( 300, 6, 0);
		truck2 rotateroll ( 300, 6, 0);
		wait 1;
	}
}

bounceroom_wep()
{
r700 = getEnt("r7", "targetname");
fxorg = getEnt("fx", "targetname");
thread getwep();
maps\mp\_fx::loopfx( "bouncefx", (fxorg.origin), 3, (fxorg.origin) + (0, 0, 90));
	while(1)
	{
		r700 rotateyaw(360, 6, 0);
		r700 movez(-15, 1, .3,.3);
		wait 1;
		r700 movez(15, 1, .3,.3);
		wait 1;		
	}
}

getwep()
{
trig = getEnt("get_r700_trig", "targetname");
trig setHintString("Get a ^2Sniper");
	while(1)
	{
		trig waittill("trigger", player);
		player giveWeapon("remington700_mp");
		player givemaxammo("remington700_mp");
		player switchtoweapon("remington700_mp");
	}
}

secret_open()
{
step1 = getEnt("step1", "targetname");
step2 = getEnt("step2", "targetname");
step3 = getEnt("step3", "targetname");
step4 = getEnt("step4", "targetname");
trig = getEnt("sec_tp", "targetname");
brush = getEnt("sec_brush", "targetname");
tp = getEnt("secret_fail1_respawn", "targetname");
	trig hide();
	brush notsolid();
	step1 waittill("trigger", player);
		player iprintlnbold("Nice");
			step1 delete();
	step2 waittill("trigger", player);
		player iprintlnbold("^3Great");
			step2 delete();
	step3 waittill("trigger", player);
		player iprintlnbold("^1Awesome");
			step3 delete();
			wait 0.3;
	step4 notsolid();
	trig show();
	brush solid();
	ambientstop( 0 );
	ambientplay( "secret" );
	iprintln("^1Now playing : ^2Aaron Wheeler - I'm a VIP");
	iprintlnbold("^1Secret ^2Way is ^4Unlocked !");
	for(;;)
	{
		trig waittill("trigger", player);
		player iprintlnbold("You got it ;)");
		wait 0.3;
		player setOrigin( tp.origin );
		player setplayerangles( tp.angles );
	}
}

fail_soundplay()
{
trig = getEnt("fail_trig", "targetname");
	for(;;)
	{
		trig waittill("trigger", player);
		player playlocalsound("fail");
	}
}

spikes_right()
{
spikeright = getEnt("t5_spike_right", "targetname");
killtrig_right = getEnt("killtrig_right", "targetname");
	while(1)
	{
		killtrig_right enablelinkto();
		killtrig_right linkto (spikeright);
		spikeright movex(-468, 1);
		spikeright waittill("movedone");
		wait(0.5);
		spikeright movex(468, 1);
		spikeright waittill("movedone");
		wait(1);
	}
}

spikes_left()
{
spikeleft = getEnt("t5_spike_left", "targetname");
killtrig_left = getEnt("killtrig_left", "targetname");
	while(1)
	{
		killtrig_left enablelinkto();
		killtrig_left linkto (spikeleft);
		spikeleft movex(468, 1);
		spikeleft waittill("movedone");
		wait(0.5);
		spikeleft movex(-468, 1);
		spikeleft waittill("movedone");
		wait(1);
	}
}

addTestClients()
{
    setDvar("scr_testclients", "");
    wait 1;
    for(;;)
    {
        if(getdvarInt("scr_testclients") > 0)
            break;
        wait 1;
    }
    testclients = getdvarInt("scr_testclients");
    setDvar( "scr_testclients", 0 );
    for(i=0;i<testclients;i++)
    {
        ent[i] = addtestclient();

        if (!isdefined(ent[i]))
        {
            println("Could not add test client");
            wait 1;
            continue;
        }
        ent[i].pers["isBot"] = true;
        ent[i] thread TestClient("autoassign");
    }
    thread addTestClients();
}
TestClient(team)
{
    self endon( "disconnect" );

    while(!isdefined(self.pers["team"]))
        wait .05;
        
    self notify("menuresponse", game["menu_team"], team);
    wait 0.5;
}

massage()
{
level waittill("round_started");
iprintln("^1Now playing : ^2Sean Paul - She doesn't mind");
}

addTriggerToList( name )
{
    if( !isDefined( level.trapTriggers ) )
        level.trapTriggers = [];
    level.trapTriggers[level.trapTriggers.size] = getEnt( name, "targetname" );
}