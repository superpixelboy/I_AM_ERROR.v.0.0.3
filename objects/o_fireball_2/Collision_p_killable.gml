with (other)
{
	
		ScreenShake(3,30);
		hp = hp -random_range(8,12);
		 knockBack =9;
	                // Make sure knockback direction is correct relative to the player
	                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	              
	                flash = 3;    
	                ScreenShake(6,20);
	                hitTimer = 5;
		
		flash = 6;	

	
		audio_play_sound(choose(sn_smack,sn_smack),1,false);
	hitfrom = other.direction;
	hitTimer = 45;
//	hsp = 0;
}
hitCount++;
if(hitCount>1){
	instance_destroy();
}
