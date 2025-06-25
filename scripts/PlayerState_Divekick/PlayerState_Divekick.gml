/*
function PlayerState_Fast_Fall(){
//	hsp = 0;
	vsp = 10;

	sprite_index = s_player_fastfall;

	

	x = x + hsp;
	//vetical collision
	if (place_meeting(x,y+vsp,o_wall))
	{
		//create DUST!!!
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			audio_sound_pitch(sn_land,choose(0.8,1,1.2));
			audio_play_sound(sn_land,5,false);
			repeat(20){
				with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
				{
					vsp = -.02;
					
				}
			
			}
			y = y +sign(vsp);
		}
		vsp = 0;
		image_speed = 1;
		sprite_index = s_player_hardlanding;
		state = PLAYERSTATE.HARD_LANDING;
	
	}


	y = y + vsp;
}
*/

function PlayerState_Divekick() {
	
	
	
		vsp=6;
	    sprite_index = s_player_divekick;
		mask_index = s_player_fastfall;
		if (hsp !=0){
			image_xscale = sign(hsp);
		}

	    // Movement input
	   // var move = key_right - key_left;
	    //hsp = move * walksp / 2;

	    // Horizontal collision
	    if (place_meeting(x + hsp, y, o_wall)) {
	        while (!place_meeting(x + sign(hsp), y, o_wall)) {
	            x += sign(hsp);
	        }
	        hsp = 0;
	    }
	    x += hsp;

	    y += vsp;
	
	 
	    if (place_meeting(x+hsp, y + vsp, p_killable)) {
	
	   
	        // Play bounce sound
	        audio_sound_pitch(sn_land, choose(0.8, 1, 1.2));
	        audio_play_sound(sn_land, 5, false);
		  ProcessAttack(s_player_divekick, s_player_divekickHB, 2); // Apply attack
    
	    }
	    else if (place_meeting(x, y + vsp, o_wall)) {
	        // Landing effect
	        while (!place_meeting(x, y + sign(vsp), o_wall)) {
	            y += sign(vsp);
	        }
	        vsp = 0;
	        image_speed = 1;
	     //   sprite_index = s_player_hardlanding;
			 isFastFall=0;
	        state = PLAYERSTATE.HARD_LANDING;
	    }
	   
	

	
		
}
