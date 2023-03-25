main()
{
        maps\mp\_load::main();
       
        PreCacheItem("ak47_mp");
       
        thread trap1();
        thread trap2();
        thread trap3();
        thread trap4();
        thread trap5();
        thread trap6();
        thread trap7();
        thread Knife();
        thread Sniper();
        thread Old();
        thread secret_enter();
        thread secret_end();
        addTriggerToList("trap1_acti");
        addTriggerToList("trap2_trig");
        addTriggerToList("trap3_acti");
        addTriggerToList("trap4_acti");
        addTriggerToList("trap5_acti");
        addTriggerToList("trap6_acti");
        addTriggerToList("trap7_acti");
       
}
 
addTriggerToList(name)
{
        if(!isDefined(level.trapTriggers))
                level.trapTriggers = [];
               
        level.trapTriggers[level.trapTriggers.size] = getEnt
 
(name,"targetname");
}
 
trap1()
{
        trig1 = getEnt ("trap1_acti", "targetname");
        rotate1 = getEnt ("trap1_trap", "targetname");
       
        trig1 waittill ("trigger");
        trig1 delete();
       
        while (1)
        {
                rotate1 rotatepitch (360, 5);
                wait 2;
        }
}
 
trap2()
{      
        trig2 = getEnt ("trap2_trig", "targetname");  
        hurt1 = getEnt ("trap2_spikehurt1", "targetname");    
        hurt2 = getEnt ("trap2_spikehurt2", "targetname");
        spikes1 = getEnt ("trap2_spike1", "targetname");
        spikes2 = getEnt ("trap2_spike2", "targetname");
 
        hurt1 enablelinkto();
        hurt1 linkto (spikes1);
                hurt2 enablelinkto();
        hurt2 linkto (spikes2);
 
        trig2 waittill ("trigger");
        trig2 delete();
                while(1)
                {
                        spikes1 moveZ (-88,.3);
                        wait 0.5;
                        spikes1 moveZ (88,.3);
                        wait 0.5;
                        spikes2 moveZ (-88,.3);
                        wait 0.5;
                        spikes2 moveZ (88,.3);
                        wait 0.5;
                }
}
 
trap3()
{
        trig3 = getEnt("trap3_acti","targetname");
        brush1 = getEnt("trap3_ran1","targetname");
        brush2 = getEnt("trap3_ran2","targetname");
 
        trig3 waittill("trigger");
        trig3 delete();
        random = randomInt(2);
        switch(random)
        {
                case 0: brush1 delete();
                                break;
                               
                case 1: brush2 delete();
                                break;
                               
                default: return;
        }
}
 
trap4()
{
        trig4 = getEnt ("trap4_acti", "targetname");
        rotate1 = getEnt ("trap4_trap", "targetname");
                rotate2 = getEnt ("trap4_trap2","targetname");
       
        trig4 waittill ("trigger");
        trig4 delete();
       
        while (1)
        {
                rotate1 rotateroll (360, 2);
                wait 1;
                                rotate2 rotateroll (-360, 2);
                                wait 1;
        }
}
 
trap5()
{
        trig5 = getEnt ("trap5_acti" , "targetname");
        trap = getEnt ("trap5_trap" , "targetname");
       
        trig5 waittill ("trigger");
        trig5 delete();
               
                for(;;)
                {
        trap moveY (-128,0.5);
        wait 1;
        trap moveY (128,0.5);
        wait 1;
                }
}
 
trap6()
{
        trig6 = getEnt ("trap6_acti", "targetname");
        rotate1 = getEnt ("trap6_trap", "targetname");
       
        trig6 waittill ("trigger");
        trig6 delete();
 
        while(1)
        {
                rotate1 rotateyaw (360, 3);
                wait 1;
        }
}
 
trap7()
{
        trig7 = getEnt ("trap7_acti", "targetname");
        rotate1 = getEnt ("trap7_trap", "targetname");
       
        trig7 waittill ("trigger");
        trig7 delete();
 
        while(1)
        {
                rotate1 rotateyaw (-360, 3);
                wait 1;
        }
}
 
Sniper()
{
        level.snip_trig = getEnt( "sniper_trig", "targetname");
                level.knife_trig = getEnt( "knife_trig", "targetname");
                level.old_trig = getEnt ("map_finish", "targetname");
        jump = getEnt( "snipe_orig", "targetname" );
        acti = getEnt( "snipe_acti", "targetname" );
     
        while(1)
        {
                level.snip_trig waittill( "trigger", player );
                if( !isDefined( level.snip_trig ) )
                return;
 
                self.maxhealth = 100;
                self.health = self.maxhealth;
 
                level.knife_trig delete();
                level.old_trig delete();
 
                player takeallweapons();
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player giveweapon( "m40a3_mp" );
                player givemaxammo( "m40a3_mp" );
                player giveweapon( "remington700_mp" );
                player givemaxammo( "remington700_mp" );
                level.activ takeallweapons();      
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ giveweapon( "m40a3_mp" );
                level.activ givemaxammo( "m40a3_mp" );
                level.activ giveweapon( "remington700_mp" );
                level.activ givemaxammo( "remington700_mp" );
                iPrintlnBold( " ^2" + player.name + " ^5 has entered Sniper room^1!" );
                wait .1;
                player switchtoweapon( "m40a3_mp" );
                level.activ switchtoweapon( "m40a3_mp" );                      
                player freezecontrols(true);
                level.activ freezecontrols(true);
                wait 3;
                iPrintlnBold( "^53^1!" );
                wait 1;
                iPrintlnBold( "^52^1!" );
                wait 1;
                iPrintlnBold( "^51^1!" );
                wait 1;
                player freezecontrols(false);
                level.activ freezecontrols(false);
                player iPrintlnBold( "^5Fight^1!" );
 
                while( isAlive( player ) && isDefined( player ) )
                wait 1;      
        }      
}
 
 
Knife()
{
        level.knife_trig = getEnt( "knife_trig", "targetname");
                level.snip_trig = getEnt( "sniper_trig", "targetname");
                level.old_trig = getEnt ("map_finish", "targetname");
        jump = getEnt( "knife_orig", "targetname" );
        acti = getEnt( "knife_acti", "targetname" );
     
        while(1)
        {
                level.knife_trig waittill( "trigger", player );
                if( !isDefined( level.knife_trig ) )
                return;
 
                self.maxhealth = 100;
                self.health = self.maxhealth;
 
                level.snip_trig delete();
                level.old_trig delete();
 
                player takeallweapons();
                player SetPlayerAngles( jump.angles );
                player setOrigin( jump.origin );
                player giveweapon( "knife_mp" );
                level.activ takeallweapons();      
                level.activ setPlayerangles( acti.angles );
                level.activ setOrigin( acti.origin );
                level.activ giveweapon( "knife_mp" );
                iPrintlnBold( " ^2" + player.name + " ^5 has entered Knife room^1!" );
                wait .1;
                player switchtoweapon( "knife_mp" );
                level.activ switchtoweapon( "knife_mp" );                      
                player freezecontrols(true);
                level.activ freezecontrols(true);
                wait 3;
                iPrintlnBold( "^53^1!" );
                wait 1;
                iPrintlnBold( "^52^1!" );
                wait 1;
                iPrintlnBold( "^51^1!" );
                wait 1;
                player freezecontrols(false);
                level.activ freezecontrols(false);
                player iPrintlnBold( "^5Fight^1!" );
 
                while( isAlive( player ) && isDefined( player ) )
                wait 1;      
        }      
}
 
Old()
{
        level.old_trig = getEnt ("map_finish", "targetname");
                level.snip_trig = getEnt( "sniper_trig", "targetname");
        door = getEnt ("finish_door", "targetname");
       
        level.old_trig waittill ("trigger", player);
 
        level.old_trig delete();
        door delete();
        level.knife_trig delete();
        level.snip_trig delete();
     
        iPrintlnBold( " ^2" + player.name + " ^2Opened the old way!" );
}
 
secret_enter()
{
        level.secret_trig = getEnt ("secret_enter", "targetname");
        target1 = getEnt ("secret_startori", "targetname");
       
        for(;;)
        {
                level.secret_trig waittill ("trigger", user);
                user SetOrigin(target1.origin);
                user SetPlayerAngles( target1.angles );
                user iprintlnbold ("Welcome To The Secret!");
        }
}
 
secret_end()
{
        trig = getEnt ("secret_endtrig", "targetname");
        target1 = getEnt ("secret_end", "targetname");
       
        for(;;)
        {
                trig waittill ("trigger", user);
                user SetOrigin(target1.origin);
                user SetPlayerAngles( target1.angles );
                user iprintlnbold ("You Have Finished The Secret!");
                user giveweapon( "ak47_mp" );
                user givemaxammo( "ak47_mp" );
                wait .1;
                user switchtoweapon( "ak47_mp" );
                                user braxi\_rank::giveRankXP("", 150);
        }
}