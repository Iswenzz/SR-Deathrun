main()
{ 
glift_obj = getentarray("nav","targetname");
if(isdefined(glift_obj))
{
 for(i=0;i<glift_obj.size;i++)
 {
  glift_obj[i] thread ra_glift();
 }
}
}
ra_glift()
{
	while(true) 
	{ 
		//trig waittill ("trigger"); 
		self movez (-8,5,0,0.6); 
		self waittill ("movedone"); 
		wait (1); 
		//trig waittill ("trigger"); 
		self movez (8,5,0,0.6);  
		self waittill ("movedone"); 
		wait (1); 
	}
}

