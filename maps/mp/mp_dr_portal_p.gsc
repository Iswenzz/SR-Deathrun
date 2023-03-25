//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//    __              ___                 \\
//   /\ \            /\_ \                \\
//   \ \ \        ___\//\ \    ____       \\
//    \ \ \  __  / __`\\ \ \  /\_ ,`\     \\
//     \ \ \L\ \/\ \L\ \\_\ \_\/_/  /_    \\
//      \ \____/\ \____//\____\ /\____\   \\
//       \/___/  \/___/ \/____/ \/____/   \\
// 								          \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\
//Map by Lolz      |      Scripted by Lolz\\
//        Nickname i have in game :       \\
//   Lolz :] -SuX Lolz :] -#FNRP#Lolz :]  \\
//            xFire: alex1528             \\
//    Steam: iswenzz1528 / SuX Lolz :]    \\
//////////////////////\\\\\\\\\\\\\\\\\\\\\\

#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include common_scripts\utility;
#include braxi\_common;

main()
{
	//NG
	level.portalgun_w = "w_portalgun";
	level.portalgun_v = "v_portalgun";
	level.portalgun = "portalgun";
	level.portalgun_bendi = "portalgun_bendi";
	level.portalcheckdist = 700;
	level.maxdistance =  4000;
	level.pickup_maxdist = 100;
	level.pickup_object_distance = 40;
	level.throw_max_force = 30;
	level.portals = [];
	level.portalobjects = [];
	self.portal["blue_exist"]	= false;
	self.portal["red_exist"] 	= false;
	self.portal["object"] = undefined;
	//PRECACHE**
	preCacheShader("reticle_portal");
	preCacheShader("reticle_portal_blue");
	preCacheShader("reticle_portal_red");
	preCacheShader("reticle_portal_both");
	preCacheItem( level.portalgun );
	preCacheItem( level.portalgun_bendi );
	preCacheModel( "v_portalgun" );
	preCacheModel( "w_portalgun" );
	preCacheModel( "collision_wall_100x75" );
	preCacheModel( "collision_sphere" );
	preCacheModel( "cube" );
	preCacheModel( "companion_cube" );
	preCacheModel( "energy_ball" );
	preCacheModel( "portal_dummy_blue" );
	preCacheModel( "portal_dummy_red" );
	preCacheModel( "portal_blue" );
	preCacheModel( "portal_red" );
	//PRECACHE*
	
	//EFFECT**
	level.fx1 = loadfx("portal/tag_fx1_e");
	level.mdr = loadfx("fire/firelp_small_dl");
	level._effect["bullettest"]				= loadfx("portal/bullettest");
	level._effect["blueportal_open"]		= loadfx("portal/portal_blue_open");
	level._effect["redportal_open"]			= loadfx("portal/portal_red_open");
	level._effect["blueportal_close"]		= loadfx("portal/portal_blue_close");
	level._effect["redportal_close"]		= loadfx("portal/portal_red_close");
	level._effect["blueportal_fail"]		= loadfx("portal/portal_blue_fail");
	level._effect["redportal_fail"]			= loadfx("portal/portal_red_fail");
	level._effect["portalballblue"]			= loadfx("portal/portal_ball_blue");
	level._effect["portalballred"]			= loadfx("portal/portal_ball_red");
	level._effect["projected_wall"]			= loadfx("portal/projected_wall");
	level._effect["projected_wall_end"]		= loadfx("portal/projected_wall_end");
	level._effect["redlaser"]				= loadfx("portal/redlaser");
	//BULLET IMPACTS
	level._effects["impact_bark"] = 	 	 	 	 loadfx("impacts/large_woodhit");
	level._effects["impact_brick"] = 	 	 	 	 loadfx("impacts/small_brick");
	level._effects["impact_carpet"] = 	 	 	 	 loadfx("impacts/default_hit");
	level._effects["impact_cloth"] = 	 	 	 	 loadfx("impacts/cloth_hit");
	level._effects["impact_concrete"] = 	 	 	 loadfx("impacts/small_concrete");
	level._effects["impact_dirt"] = 	 	 	 	 loadfx("impacts/small_dirt");
	level._effects["impact_flesh"] = 	 	 	 	 loadfx("impacts/flesh_hit");
	level._effects["impact_foliage"] = 	 	 		 loadfx("impacts/small_foliage");
	level._effects["impact_glass"] = 	 	 	 	 loadfx("impacts/small_glass");
	level._effects["impact_grass"] = 	 	 	 	 loadfx("impacts/small_grass");
	level._effects["impact_gravel"] = 	 	 	 	 loadfx("impacts/small_gravel");
	level._effects["impact_ice"] = 	 	 	 		 loadfx("impacts/small_snowhit");
	level._effects["impact_metal"] = 	 	 	 	 loadfx("impacts/small_metalhit");
	level._effects["impact_mud"] =	 	 	 	 	 loadfx("impacts/small_mud");
	level._effects["impact_paper"] = 	 	 	 	 loadfx("impacts/default_hit");
	level._effects["impact_plaster"] = 	 	 		 loadfx("impacts/small_concrete");
	level._effects["impact_rock"] = 	 	 	 	 loadfx("impacts/small_rock");
	level._effects["impact_sand"] = 	 	 	 	 loadfx("impacts/small_dirt");
	level._effects["impact_snow"] = 	 	 	 	 loadfx("impacts/small_snowhit");
	level._effects["impact_water"] = 	 	 	 	 loadfx("impacts/small_waterhit");
	level._effects["impact_wood"] = 	 	 	 	 loadfx("impacts/large_woodhit");
	level._effects["impact_asphalt"] = 	 	 		 loadfx("impacts/small_concrete");
	level._effects["impact_ceramic"] = 	 	 		 loadfx("impacts/small_ceramic");
	level._effects["impact_plastic"] = 	 	 		 loadfx("impacts/large_plastic");
	level._effects["impact_rubber"] = 	 	 	 	 loadfx("impacts/default_hit");
	level._effects["impact_cushion"] = 	 	 	 	 loadfx("impacts/cushion_hit");
	level._effects["impact_fruit"] = 	 	 	 	 loadfx("impacts/default_hit");
	level._effects["impact_paintedmetal"] = 	 	 loadfx("impacts/large_metal_painted_hit");
	level._effects["impact_flesh_body_nonfatal"] = 	 loadfx("impacts/flesh_hit_body_nonfatal");
	level._effects["impact_flesh_body_fatal"] = 	 loadfx("impacts/flesh_hit_body_fatal_exit");
	level._effects["impact_flesh_head_nonfatal"] =   loadfx("impacts/flesh_hit_body_nonfatal");
	level._effects["impact_default"] = 	 	 	 	 loadfx("impacts/default_hit");
	//EFFECT*
	
	//THREAD**
	thread onPlayerConnected();
	//THREAD*
}

onPlayerConnected()
{
	for(;;)
	{
	level waittill("connected", player);
	player thread onPlayer();
	}
}

onRound()
{
	for(;;)
	{
	level waittill("round_started");
	self thread onPlayer(); //ng
	}
}

onPlayer()
{
	for(;;)
	{
	level waittill("player_spawn",player);
	player thread onRound();
	player.portal["hud"] = NewClientHudElem( self );
	player thread hud();
	player thread color();
	player thread watchUsage();
	//wait 10;
	//player thread fxgun();
	}
}

/*fxgun()
{
	if(isDefined(self.portalweap)) {
		self thread fx1();
		iprintlnbold("portalgun defined, fx thread");
	}
}

fx1()
{
	weap = self getCurrentWeapon();
	pos = (20,20,-5);
	wait 1;
	
	while(1) {
		wait 0.05;
		forward = vector_scale(anglesToForward(self.angles), 4);
		up = vector_scale(anglesToUp(self.angles), -1);
		playFX(level.fx1, self eyepos() + forward);
	}
}*/

color()
{
	use = undefined;
	
	while(1) {
		if(self attackButtonPressed()) {
			if(use!=true) {
				use = true;
				self thread braxi\_common::clientCmd( "openscriptmenu -1 blue;" );
				wait 0.1;
				use = false;
			}
		}
		if(self adsButtonPressed()) {
			if(use!=true) {
				use = true;
				self thread braxi\_common::clientCmd( "openscriptmenu -1 red;" );
				wait 0.1;
				use = false;
			}
		}
	wait .05;
	}
}

hud()
{
	while(1) {
		if( self getCurrentWeapon() != level.portalgun ) {
			thread updatehud( "none" );
			wait .5;
			continue;
		}
		if( self getCurrentWeapon() == level.portalgun ) {
			thread updatehud( "default" );
			wait .5;
			continue;
		}
		if( self.portal["blue_exist"] ) {
			self updatehud( "blue" );
			wait .5;
			continue;
		}
		if( self.portal["red_exist"] ) {
			self updatehud( "red" );
			wait .5;
			continue;
		}
	wait .5;
	}
}

updateHud( color )
{
	NewShader = "";
	
	img = "reticle_portal";
	
	if( color == "none" )
	{
		self.portal["hud"].alpha = 0;
		return;
	}
	
	if( color == "default" )
		NewShader = img;
	
	if( color == "red" || color == "blue" )
	{
		if( self.portal[ othercolor( color ) + "_exist"] )
			newShader = img + "_both";
		else
			newShader = img + "_" + color;
	}
	
	size = 64;
	self.portal["hud"] setShader( NewShader, size, size );
	self.portal["hud"].AlignX = "center";
	self.portal["hud"].AlignY = "middle";
	self.portal["hud"].horzAlign = "center_safearea";
	self.portal["hud"].vertAlign = "center_safearea";
	
	self.portal["hud"].alpha = 1;
	
}

othercolor( color )
{
	if( color == "red" )
		return "blue";
	else
		return "red";
}

watchUsage()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	
	while(1)
	{
		self waittill( "menuresponse", menu, response );
			
			if( self.pers["team"] != "spectator" )
			{
				if( !self isonladder() && !self ismantling() && !self.throwingGrenade )
				{
					if( self getCurrentWeapon() == level.portalgun )
					{
						if( ( response == "blue" || response == "red" ) )
						{
							self playlocalsound( "portal_gun_shoot_"+response );
							self thread setup_portal( response );
							wait 0.3;
						}
						
						/*else if( response == "pickup" )
						{
							self thread portal\pickup::pickup_init();
							wait 0.3;
						}
					else if( self getCurrentWeapon() == level.portalgun_bendi )
					{
						if( response == "pickup" )
						{
							self thread portal\pickup::pickup_init();
							wait 0.4;
						}
					}*/
					
					//else
				wait 0.1;
				}
				//else
			wait 0.1;
			}
			//else
		wait 0.5;
		}
	}
}


setup_portal(color)
{
	//othercolor = othercolor( color );
	
	eye = self eyepos();
	forward = anglesToForward( self getPlayerAngles() ) * level.maxdistance;
	
	trace = trace_array( eye, eye + forward, false, level.portalobjects );
	
	oldpos = trace["position"];
	pos = oldpos;
	normal = trace["normal"];
	angles = vectortoangles( normal );
	
		trace["position"] = pos;
		trace["fx_position"] = pos + normal*1;
		trace["start_position"] = eye;
		trace["old_position"] = oldpos;
		trace["angles"] = angles;
		
		oldpos = trace["old_position"];
		fxpos = trace["fx_position"];
		p = trace["start_position"];
		p += vectornormalize( oldpos - p ) * 33;
		
		self.owner = self;
		
		speed = 1500;
	
	t = length( fxpos - p ) / speed*1.5;
	
	if( t > 0.5 )
		t = 0.5;
	
	bullet = spawn( "script_model" , (-10000,0,0) );
	bullet setmodel( "collision_sphere" );
	
	wait 0.05;
	
	playfxontag( level._effect["portalball"+color], bullet, "collision_sphere" );
	
	angles = self.owner getplayerangles();
	
	f = anglestoforward(angles);
	u = anglestoup(angles);
	r = vectorprod(f,u);
	
	bullet move_curve( self.owner eyepos() + f*22 + u*-6 + r, oldpos,trace["position"], t );
		
		playfx( level._effect[color+"portal_fail"], trace["position"]);
}

playSoundOnPosition( soundAlias, pos, local )
{
	soundObj = spawn("script_model", pos);
	if( isdefined( local ) && local )
		soundObj playSoundToPlayer( soundAlias, self );
	soundObj playSound( soundAlias );
	soundObj delete();
}

trace_array( start, end, hit_players, ignore_array )
{
	time = 1;
	
	if(!isdefined(ignore_array))
		ignore_ent = undefined;
	
	else
		ignore_ent = ignore_array[0];
	
	if( !isdefined(hit_players) )
		hit_players = false;
	
	trace = bullettrace( start, end, hit_players, ignore_ent );
	{
		drawline( start, trace["position"],time, (1,0.3,0.2)*(trace["fraction"]!=1) + (0,1,0)*(trace["fraction"]==1) );
		if( trace["fraction"] != 1 )
			drawline( trace["position"], end,time, (1,1,0.3) );
		level.debugtracenum++;
	}
	
	if( isdefined(ignore_array) )
		if( isdefined(trace["entity"]) )
			if( trace["entity"] isinarray(ignore_array) )
				return trace_array_raw( trace["position"], end, hit_players, ignore_array, trace["entity"], trace["fraction"] );
	
	return trace;
}

trace_array_raw( start, end, hit_players, ignore_array, ignore_ent, fraction_add )
{
	trace = bullettrace( start, end, hit_players, ignore_ent );
	
	trace["fraction"] = fraction_add + (1-fraction_add)*trace["fraction"];	
	
	if( isdefined(trace["entity"]) )
		if( trace["entity"] isinarray(ignore_array) )
			return trace_array_raw( trace["position"], end, hit_players, ignore_array, trace["entity"], trace["fraction"] );
	
	return trace;
}

random_color()
{
	return (randomint(100)/100,randomint(100)/100,randomint(100)/100 );
}

random_color_dark()
{
	return (randomint(50)/100,randomint(50)/100,randomint(50)/100 );
}

drawline( from, to, time, color )
{
	thread draw_line( from, to, time, color );
}

draw_line( from, to, time, color )
{
	
	if( !isdefined( color ) )
		color = random_color_dark();
	
	if( !isdefined( time ) || time==0 )
		time = -1;
	
	time = int(time*20);
	
	for( i = 0; i != time; i++ )
	{
		line( from, to, color, true );
		wait 0.05;
	}
}

eyepos()
{
	return self eye() + self.origin;
}

eyeposang()
{
	return self getEye() + self.origin + self.angles;
}

getheight()
{
	switch(self getstance())
	{
		case "crouch":	height = (0,0,52);
		break;
		case "prone":	height = (0,0,31);
		break;
		default:		height = (0,0,72);
	}
	return height;
}

getcenter()
{
	return self getheight()/2;
}

centerpos()
{
	return self.origin + self getcenter();
}

eye()
{
	
	switch(self getstance())
	{
		case "crouch":	height = (0,0,40);
		break;
		case "prone":	height = (0,0,11);
		break;
		default:		height = (0,0,60);
	}
	
	right = anglestoright( self getplayerangles() );
	
	lean_offset = vectordot( right, ( self gettagorigin( "tag_eye" ) - self.origin ) );
	
	if( abs(lean_offset) > 7 )
		height += right * sign( lean_offset ) * 14.67 + (0,0,-3.125);
	
	return height;
}

isinarray( array )
{
	for( i=0; i<array.size; i++ )
	{
		if( self==array[i] )
		{
			return true;
		}
	}
	return false;
}

playOpenSound( color, soundPos )
{
	self endon( "stop_fx" );
	
	wait 0.3;
	
	playSoundOnPosition( "portal_open", soundPos );
	playSoundOnPosition( "portal_open_"+self.color, soundPos );
	
}


move_curve( p, q1, q2, t )
{
	//self hide();
	
	self.origin = p;
	
	n = 6;			//edges in curve
	curve = 1;		//curve amount (x*0.5) ( > 1 ), 0.5 = linear interpolate
	
	if( t < 0.3 )
	{
		n = 3;
		t *= 1.5;
	}
	
	vec1 = q1 - p;
	vec2 = q2 - q1;
	
	t /= n;
	
	vecx = (0,0,0);
	
	for( i = 1; i < n+1 ; i++ )
	{
		if( i != 1 )
			wait t;
		fraction = exp( i / n, curve * 2);
		vec = vec2*fraction + i*vec1/n;
		//t = length( vec - vecx ) / (n * speed);
		vecx = vec;
		pos = p + vec;
		//pos = (int(pos[0]),int(pos[1]),int(pos[2]));
		self moveto( pos, t );
	}
	
	self thread delete_fx_after_time( t );
}

exp( base, e )
{
	if( e < 0 )
	{
		base = 1/base;
		e*=-1;
	}
	output = 1;
	for( i = 0; i < e; i++)
		output *= base;
	return output;
}

vectorprod( vec1, vec2 )
{
	return ( (vec1[1]*vec2[2]-vec1[2]*vec2[1]), (vec1[2]*vec2[0]-vec1[0]*vec2[2]), (vec1[0]*vec2[1]-vec1[1]*vec2[0]) );
}

delete_fx_after_time( t )	//deleting a spawned fx is buggy
{
	wait t;
	self moveto( (0,0,100000), 0.05 );
	wait 0.1;
	self delete();
}


//END
