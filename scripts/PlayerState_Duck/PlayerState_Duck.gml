function PlayerState_Duck(){
//Get Ducking
	if (key_duck){
		isDucking = true;
		hsp = 0;
		hsp = 0;
		vsp = 0;
		sprite_index = s_player_duck;
		mask_index =s_player_duck;
		image_speed = 1;

			//if(key_attack) state = PLAYERSTATE.ATTACK_POKE;
		
			if(key_spattack) && (global.duck_powerup==1)
			{
				show_debug_message("CALLING SWEEP FROM STATE_FREE");
				state = PLAYERSTATE.SP_SWEEP;
			}
			/*
			if(key_spattack) && (global.duck_powerup==2)
			{
				show_debug_message("CALLING UPPERCUT FROM STATE_FREE");
				state = PLAYERSTATE.SP_UPPERCUT;
			}*/
		
		if((key_jump)&&place_meeting(x, y+1, o_oneway)){
			vsp=vsp+1;
			skiponeway=1;
			state = PLAYERSTATE.JUMP;
		}
		
		if (animation_end())
		{
				image_speed = 0;
		}
		
	}
	else{
		mask_index =s_player_idle;
		isDucking = false;
		sprite_index = s_player_idle;
		state = PLAYERSTATE.FREE;
	}

}
	
