/// @description Insert description here
// You can write your code in this editor
if (     sprite_index != s_mouse_stun){
	with (other)
	{
	
			ScreenShake(3,30);
			hp = hp -random_range(1,4);
			 knockBack =9;
		                // Make sure knockback direction is correct relative to the player
		                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	              
		                flash = 3;    
		                ScreenShake(3,10);
		                hitTimer = 5;
		
			flash = 6;	

	
			audio_play_sound(choose(sn_smack,sn_smack),1,false);
		hitfrom = other.direction;
		hitTimer = 45;
	//	hsp = 0;
	}
}