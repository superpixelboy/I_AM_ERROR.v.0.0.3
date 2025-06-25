function PlayerState_SP_Sweep(){
	// show_debug_message("CALLING SWEEP");
	//if(global.sp>10){
	//	show_debug_message(" ENOUGH SP FOR SWEEP");
		image_speed=1;
		//horizontal collision
		//caluculate movements
	//	var move = key_right - key_left;
		
		if(image_xscale>0){
			if(hsp>0){
				hsp = hsp -0.1;
			}
			else{
				hsp=0;
			}
		}
		else{
			if(hsp<0){
				hsp =hsp+0.1;
			}
			else{
				hsp = 0;
			}
		}
	if (place_meeting(x+hsp,y,o_wall))
	{
		while(!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x +sign(hsp);
		}
		hsp = 0;
	
	}
	x = x + hsp;
	
		
		ProcessAttack(s_player_sp_sweep,s_player_sp_sweepHB,5)
	
	
	
	
		if (animation_end())
		{
			
			sprite_index = s_player_duck;
			state = PLAYERSTATE.DUCK;	
	
		}
		/*
	}
	
	else{
		show_debug_message("NOT ENOUGH SP FOR SWEEP");
		sprite_index = s_player_duck;
		state = PLAYERSTATE.FREE;	*/


	
}