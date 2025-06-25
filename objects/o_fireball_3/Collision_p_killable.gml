with (other)
{
		 
		ScreenShake(6,30);
		hp = hp -random_range(15,22);
	
		flash = 6;	
		 knockBack =9;
	                // Make sure knockback direction is correct relative to the player
	      knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	              
	      flash = 3;    
	       ScreenShake(10,30);
	       hitTimer = 5;
	
		audio_play_sound(choose(sn_smack,sn_smack),1,false);
	hitfrom = other.direction;
	hitTimer = 15;
//	hsp = 0;
}
