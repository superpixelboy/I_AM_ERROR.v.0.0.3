function PlayerState_SP_Uppercut(){
	 show_debug_message("CALLING Uppercut");
	if(global.sp>10){
		show_debug_message(" ENOUGH SP FOR uppercut");
		image_speed=1;
		hsp = 0;
		vsp = 0;
		if(sprite_index!=s_player_sp_uppercut){
			global.sp-=10;
		}
		ProcessAttack(s_player_sp_uppercut,s_player_sp_uppercutHB,6)
	
	
	
	
		if (animation_end())
		{
			
			sprite_index = s_player_idle;
			state = PLAYERSTATE.FREE;	
	
		}
	}
	else{
		show_debug_message("NOT ENOUGH SP FOR SWEEP");
		sprite_index = s_player_idle;
		state = PLAYERSTATE.FREE;	
	}
	
}