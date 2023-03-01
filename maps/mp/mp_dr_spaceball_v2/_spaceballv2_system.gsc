main()
{
thread system();
}

    system()
    {
            //braxi\_common::cleanScreen();
            thread dohud();
            level waittill("round_started");
            thread spaceman();
     
    level.credits1 = braxi\_mod::addTextHud( self, 9, -205, 1, "left", "bottom", 1.6 );
            level.credits1.hidewheninmenu = true;
            level.credits1.horzAlign = "left";
            level.credits1.vertAlign = "bottom";
            level.credits1.glowAlpha = 1;
            level.credits1.glowColor = level.rdcl;
            level.credits1.sort = 105;
     
    level.credits2 = braxi\_mod::addTextHud( self, 9, -240, 1, "center", "bottom", 3.5 );
            level.credits2.hidewheninmenu = true;
            level.credits2.horzAlign = "center";
            level.credits2.vertAlign = "bottom";
            level.credits2.glowAlpha = 1;
            level.credits2.glowColor = level.rdcl;
            level.credits2.sort = 105;
     
    level.credits4 = braxi\_mod::addTextHud( self, 9, -205, 1, "center", "bottom", 1.6 );
            level.credits4.hidewheninmenu = true;
            level.credits4.horzAlign = "center";
            level.credits4.vertAlign = "bottom";
            level.credits4.glowAlpha = 1;
            level.credits4.glowColor = level.rdcl;
            level.credits4.sort = 105;
     
    level.credits5 = braxi\_mod::addTextHud( self, 9, -175, 1, "center", "bottom", 1.6 );
            level.credits5.hidewheninmenu = true;
            level.credits5.horzAlign = "center";
            level.credits5.vertAlign = "bottom";
            level.credits5.glowAlpha = 1;
            level.credits5.glowColor = level.rdcl;
            level.credits5.sort = 105;
     
    level.credits6 = braxi\_mod::addTextHud( self, 9, -160, 1, "center", "bottom", 1.6 );
            level.credits6.hidewheninmenu = true;
            level.credits6.horzAlign = "center";
            level.credits6.vertAlign = "bottom";
            level.credits6.glowAlpha = 1;
            level.credits6.glowColor = level.rdcl;
            level.credits6.sort = 105;
     
    level.credits7 = braxi\_mod::addTextHud( self, 9, -145, 1, "center", "bottom", 1.6 );
            level.credits7.hidewheninmenu = true;
            level.credits7.horzAlign = "center";
            level.credits7.vertAlign = "bottom";
            level.credits7.glowAlpha = 1;
            level.credits7.glowColor = level.rdcl;
            level.credits7.sort = 105;
     
     
    level.credits8 = braxi\_mod::addTextHud( self, 9, -175, 1, "left", "bottom", 1.6 );
            level.credits8.hidewheninmenu = true;
            level.credits8.horzAlign = "left";
            level.credits8.vertAlign = "bottom";
            level.credits8.glowAlpha = 1;
            level.credits8.glowColor = level.rdcl;
            level.credits8.sort = 105;
     
     
    level.credits10 = braxi\_mod::addTextHud( self, 9, -100, 1, "center", "bottom", 1.6 );
            level.credits10.hidewheninmenu = true;
            level.credits10.horzAlign = "center";
            level.credits10.vertAlign = "bottom";
            level.credits10.glowAlpha = 1;
            level.credits10.glowColor = level.rdcl;
            level.credits10.sort = 105;
     
     
    level.credits11 = braxi\_mod::addTextHud( self, -10, -205, 1, "right", "bottom", 1.6 );
            level.credits11.hidewheninmenu = true;
            level.credits11.horzAlign = "right";
            level.credits11.vertAlign = "bottom";
            level.credits11.glowAlpha = 1;
            level.credits11.glowColor = level.rdcl;
            level.credits11.sort = 105;
     
    level.credits12 = braxi\_mod::addTextHud( self, -10, -175, 1, "right", "bottom", 1.6 );
            level.credits12.hidewheninmenu = true;
            level.credits12.horzAlign = "right";
            level.credits12.vertAlign = "bottom";
            level.credits12.glowAlpha = 1;
            level.credits12.glowColor = level.rdcl;
            level.credits12.sort = 105;
     
     
            level.blackbg = newHudElem();
            level.blackbg.x = 0;
            level.blackbg.y = 0;
            level.blackbg.width = 1800;
            level.blackbg.height = 1800;
            level.blackbg.alignX = "center";
            level.blackbg.alignY = "top";
            level.blackbg.horzAlign = "center";
            level.blackbg.vertAlign = "middle";
            level.blackbg.color = (0, 0, 0);
            level.blackbg.alpha = .7;
            level.blackbg.sort = -2;
            level.blackbg.foreground = false;
            level.blackbg setShader( "black", level.blackbg.width, level.blackbg.height );
     
            level.blackbar = newHudElem();
            level.blackbar.x = 0;
            level.blackbar.y = 0;
            level.blackbar.width =  920;
            level.blackbar.height =  2;
            level.blackbar.alignX = "center";
            level.blackbar.alignY = "middle";
            level.blackbar.horzAlign = "center";
            level.blackbar.vertAlign = "middle";
            level.blackbar.color = (.1, .1, .1);
            level.blackbar.alpha = 1;
            level.blackbar.sort = -2;
            level.blackbar.foreground = false;
            level.blackbar setShader( "white", level.blackbar.width, level.blackbar.height );
     
            level.credits2.label = &"System";
            level.credits1.label = &"Welcome:";
            level.credits4.label = &"Creators:";
            level.credits5.label = &"MadLion";
            level.credits6.label = &"   &";
            level.credits7.label = &"eBc|Legend";
            level.credits11.label = &"Map Name:";
            level.credits12.label = &"Spaceball V2";
            wait 7;
            level.credits1.label = &"Song Name:";
            level.credits8.label = &"Hardwell - Spaceman";
            level.credits4.label = &"Status:";
            level.credits5.label = &"0%";
            level.credits11.label = &"Mission:";
            level.credits12.label = &"Kill The Spaceman";
            level.credits10.label = &"Good Luck !!";
            level.credits6 destroy();
            level.credits7 destroy();
            wait 0.3;
            level.credits5.label = &"5 Percent";
            wait 0.3;
            level.credits5.label = &"10 Percent";
            wait 0.3;
            level.credits5.label = &"15 Percent";
            wait 0.1;
            level.credits5.label = &"20 Percent";
            wait 0.3;
            level.credits5.label = &"25 Percent";
            wait 0.3;
            level.credits5.label = &"30 Percent";
            wait 0.3;
            level.credits5.label = &"35 Percent";
            wait 0.3;
            level.credits5.label = &"40 Percent";
            wait 0.3;
            level.credits5.label = &"45 Percent";
            wait 0.1;
            level.credits5.label = &"50 Percent";
            wait 0.1;
            level.credits5.label = &"55 Percent";
            wait 0.3;
            level.credits5.label = &"60 Percent";
            wait 0.1;
            level.credits5.label = &"65 Percent";
            wait 0.3;
            level.credits5.label = &"70 Percent";
            wait 0.1;
            level.credits5.label = &"75 Percent";
            wait 0.3;
            level.credits5.label = &"80 Percent";
            wait 0.3;
            level.credits5.label = &"85 Percent";
            wait 0.1;
            level.credits5.label = &"90 Percent";
            wait 0.1;
            level.credits5.label = &"95 Percent";
            wait 0.3;
            level.credits5.label = &"100 Percent";
            wait 0.3;
            level.credits5.label = &"Active";
            wait 3.3;
			ambientplay("music");
            level.credits1 destroy();
            level.credits2 destroy();
            level.credits3 destroy();
            level.credits4 destroy();
            level.credits5 destroy();
            level.credits8 destroy();
            level.credits10 destroy();
            level.credits11 destroy();
            level.credits12 destroy();
            level.blackbg destroy();
            level.blackbar destroy();
    }
     
    dohud()
    {
            level endon( "intermission" );
                   
            colour = randomInt(20);
            switch(colour)
            {
                    case 0:
                            level.rdcl = (1, 0, 0);
                            break;
                    case 1:
                            level.rdcl = (0.3, 0.6, 0.3);
                            break;
                    case 2:
                            level.rdcl = (0.602, 0, 0.563);
                            break;
                    case 3:
                            level.rdcl = (0.055, 0.746, 1);
                            break;
                    case 4:
                            level.rdcl = (0, 1, 0);
                            break;
                    case 5:
                            level.rdcl = (0.043, 0.203, 1);
                            break;
                    case 6:
                            level.rdcl = (0.5, 0.0, 0.8);
                            break;
                    case 7:
                            level.rdcl = (1.0, 0.0, 0.0);
                            break;
                    case 8:
                            level.rdcl = (0.9, 1.0, 0.0);
                            break;
                    case 9:
                            level.rdcl = (1.0, 0.0, 0.0);
                            break;                 
                    case 10:
                            level.rdcl = (1.0, 0.0, 0.4);
                            break;
                    case 11:
                            level.rdcl = (1.0, 0.5, 0.0);
                            break;
                    case 12:
                            level.rdcl = (0.0, 0.5, 1.0);
                            break;
                    case 13:
                            level.rdcl = (0.5, 0.0, 0.8);
                            break;
                    case 14:
                            level.rdcl = (1.0, 0.0, 0.4);
                            break;
                    case 15:
                            level.rdcl = (0.0, 0.5, 1.0);
                            break;
                    case 16:
                            level.rdcl = (0.3, 0.0, 0.3);
                            break;
                    case 17:
                            level.rdcl = (0.0, 0.5, 1.0);
                            break; 
                    case 18:
                            level.rdcl = (0.5, 0.0, 0.2);
                            break;
                    case 19:
                            level.rdcl = (0.0, 1.0, 1.0);
                            break;
                    case 20:
                            level.rdcl = (0.0, 0.0, 1.0);
                            break;
                    case 21:
                            level.rdcl = (0.0, 1.0, 1.0);
                            break;
                    default:
                            level.rdcl = (0.0, 0.0, 1.0);
                            break;
            }
    }
     
     
    spaceman()
    {
			if( self.pers["team"] == "axis" )
            level.credits3 = braxi\_mod::addTextHud( self, 9, -175, 1, "left", "bottom", 1.6 );
            level.credits3.hidewheninmenu = true;
            level.credits3.horzAlign = "left";
            level.credits3.vertAlign = "bottom";
            level.credits3.glowAlpha = 1;
            level.credits3.glowColor = level.rdcl;
            level.credits3.sort = 105;
            level.credits3 setText("Pilot" );
            wait 7;
            level.credits3 destroy();
    }