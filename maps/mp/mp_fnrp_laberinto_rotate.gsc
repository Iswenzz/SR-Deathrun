main()


{
rotate_obj = getentarray("rotate","targetname");
if(isdefined(rotate_obj))
{
 for(i=0;i<rotate_obj.size;i++)
 {
  rotate_obj[i] thread go_rotate();
 }
}
}

go_rotate()
{
if (!isdefined(self.speed)) self.speed = 10;
if (!isdefined(self.dir)) self.dir = "z";

	while(true)
	{

	if (self.dir == "z") self rotateYaw(360,self.speed);
 
	else if (self.dir == "x") self rotateRoll(360,self.speed);
 
	else if (self.dir == "y") self rotatePitch(360,self.speed);
 
	self waittill("rotatedone");
	}

}
	
		
