//////////////////////////////////////////////////////////////
//////////////////////map by jerkan///////////////////////////
//////////////////////////////////////////////////////////////
/////////////////////XFire: jerkan18//////////////////////////
//////////////////////////////////////////////////////////////
///////////////////e-mail: jerkan@net.hr//////////////////////
//////////////////////////////////////////////////////////////
////////////////www.jerkanmaps.weebly.com/////////////////////
//////////////////////////////////////////////////////////////

main()
{

  entTransporter = getentarray("enter","targetname");
  if(isdefined(entTransporter))
  {
    for(lp=0;lp<entTransporter.size;lp=lp+1)
      entTransporter[lp] thread Transporter();
  }


}

transporter()
{
  while(true)
  {
   self waittill("trigger",other);
   if(self.target == "gohere3")
   {
	   ///////RESPECT SCRIPT/////////////////////////
        if(!other sr\api\_deathrun::order())
            continue;
	///////RESPECT SCRIPT END/////////////////////////
	PlayFX( level._effect["artillery_flash"], level.old_fx.origin );
	level.gohere3 PlaySound("course_clear");

	level.mreza_w Solid();
	level.mreza_s Solid();
	level.mreza_w show();
	level.mreza_s show();
   }
   entTarget = getent(self.target, "targetname");
   wait(0.10);
   other setorigin(entTarget.origin);
   other setplayerangles(entTarget.angles);
   wait(0.10);
  }
}