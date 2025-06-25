

with (other)
{
	
		hp = hp -random_range(4,6);
			flash = 3;	
		
		 knockBack =9;
	                // Make sure knockback direction is correct relative to the player
	      knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	              
	      flash = 3;    
	       ScreenShake(2,10);
	       hitTimer = 5;
	
		audio_play_sound(choose(sn_smack,sn_smack),1,false);
	hitfrom = other.direction;
	hitTimer = 15;
//	hsp = 0;
}

instance_destroy();