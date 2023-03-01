 /*

	Map by NitroFire
	[If you plan to use these scripts, make sure to give credit where it is due.]
	
*/

main()
{
	thread initmusic();
	thread musictrig();
	thread wehz();
	thread nitro();
	thread vipmsg();
	thread voidix();
	thread liserd();
}

initMusic()
{

		level.music = [];
 
        i = 0;
		level.music[i]["artist"] = "Illenium";
		level.music[i]["title"] = "All on You";
		level.music[i]["alias"] = "music1";
		
		i++;
		level.music[i]["artist"] = "Illenium";
		level.music[i]["title"] = "Fortress";
		level.music[i]["alias"] = "music2";
		
		i++;
		level.music[i]["artist"] = "Skrux";
		level.music[i]["title"] = "Our Fragment";
		level.music[i]["alias"] = "music3";
		
		i++;
		level.music[i]["artist"] = "T-Mass";
		level.music[i]["title"] = "Say Please";
		level.music[i]["alias"] = "music4";
		
		i++;
		level.music[i]["artist"] = "Bebe Rexha";
		level.music[i]["title"] = "Gateway Drug";
		level.music[i]["alias"] = "music5";

		precacheShader( "black" );
		precacheShader( "white" );
}
 
musicMenu()
{
   
    self endon( "death" );
 
    self thread onDeath();
    self thread onDisconnect();
 
    self.hud_music = [];
    self.selection = 0;
 
    i = 0;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 160, 200, 0.35, "left", "top", 2 );
    self.hud_music[i].sort = 880;
    self.hud_music[i] setShader( "black", 320, 160 );
   
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 180, 1, "left", "top", 1.8 );
    self.hud_music[i].sort = 883;
    self.hud_music[i] setText( ">^5>^7> Music ^5Menu ^7<^5<^7<" );
   
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 270, 204, 0.93, "left", "top", 1.8 );
    self.hud_music[i].sort = 884;
    self.hud_music[i] setText( ">^5>^7> ^7Select ^7a ^7Song ^5<^7<^5<" );
 
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 288, 360, 1, "center", "top", 1.4 );
    self.hud_music[i].sort = 885;
    self.hud_music[i] setText( "Press ^5[^7USE^5]^7: ^5Play ^7Song" );
 
    i++;
    self.hud_music[i] = braxi\_mod::addTextHud( self, 235, 360, 1, "center", "bottom", 1.4 );
    self.hud_music[i].sort = 886;
 
    for( j = 0; j < level.music.size; j++ )
    {
        i++;
        self.hud_music[i] = braxi\_mod::addTextHud( self, 172, 230+(j*16), 0.93, "left", "top", 1.4 );
        self.hud_music[i].sort = 882;
        self.hud_music[i].font = "objective";
 
        entry = level.music[j];
        self.hud_music[i] setText( entry["artist"] + " ^2-^7 " + entry["title"] );
    }
 
    i++;
    self.hud_music[self.hud_music.size] = braxi\_mod::addTextHud( self, 167, 230, 0.4, "left", "top", 1.4 );
    self.hud_music[i].sort = 881;
    indicator = self.hud_music[self.hud_music.size-1];
    indicator setShader( "white", 306, 17 );
 
    while( self.sessionstate == "playing" )
    {
        wait 0.1;
 
        if( self attackButtonPressed() )
        {
            self.hud_music[5+self.selection].alpha = 0.93;
 
            self.selection++;
            if( self.selection >= level.music.size )
                self.selection = 0;
 
            item = self.hud_music[5+self.selection];
            item.alpha = 1;
            indicator.y = item.y;
        }
        else if( self useButtonPressed() )
        {
            iPrintln( "^5Now playing: ^7" + level.music[self.selection]["artist"]+" - ^2" +level.music[self.selection]["title"] );
 
            ambientPlay( level.music[self.selection]["alias"], 3 );
            self freezeControls(0);
            level notify ( "song_picked" );
            self braxi\_rank::giveRankXp( "trap_activation" );
            break;
        }
        else if( self meleeButtonPressed() )
        {
            self freezeControls(0);
            break;
        }
    }
 
    self cleanUp();
}
 
musictrig()
{
    trigger = getEnt ( "musicmenu", "targetname" ); //musicmenu is the trigger to pick songs
    trigger setHintString( "Press ^5[^7USE^5]^7to ^5Choose ^7Music" );
 
    trigger waittill( "trigger", player );
    trigger delete();
    level endon ( "song_picked" );
    player thread musicMenu();
    player freezeControls(1);
}
 
onDeath()
{
    self endon( "disconnect" );
    self endon( "music thread terminated" );
    self waittill( "death" );
    self cleanUp();
}
 
onDisconnect()
{
    self endon( "music thread terminated" );
    self waittill( "disconnect" );
    self cleanUp();
}
 
cleanUp()
{
    if( !isDefined( self ) )
        return;
 
    if( isDefined( self.hud_music ) )
    {
        for( i = 0; i < self.hud_music.size; i++ )
        {
            if( isDefined( self.hud_music[i] ) )
                self.hud_music[i] destroy();
        }
    }
    self notify( "music thread terminated" );
}

wehz()
{
	self cleanup();
	trig = getEnt("wehz","targetname");
	trig setHintString("^0FAM^9OUS Wehz's ^3V.I.P. Secret!");
	trig waittill("trigger", player );
	ambientPlay("wehz");
	iPrintlnBold( player.name + "^5Turned on ^0FAM^9OUS Wehz's Secret Song!");
}

nitro()
{
	self cleanup();
	trig = getEnt("nitro","targetname");
	trig waittill("trigger", player );
	ambientPlay("nitro");
	iPrintlnBold( player.name + "^5Turned on ^0FAM^9OUS NitroFire's Secret Song!");
}

voidix()
{
	self cleanup();
	trig = getEnt("voidix","targetname");
	trig waittill("trigger", player );
	ambientPlay("voidix");
	iPrintLnBold( player.name + "^5Turned on ^6Voidix's ^5Boner Arising Song!");
}

liserd()
{
	self cleanup();
	trig = getEnt("liserd","targetname");
	trig waittill("trigger", player );
	ambientPlay("liserd");
	iPrintLnBold( player.name + "^5Turned on ^0FAM^9OUS Liserd's Secret Song!");
}


vipMsg()
{
  wait 5;
  if(getsubstr(self getguid(),24,32) == "c409ae43" || getsubstr(self getguid(),24,32) == "d05bc267")
    iPrintLnBold("^5Map Creator,"+self.name+" has joined the Game!");
}

