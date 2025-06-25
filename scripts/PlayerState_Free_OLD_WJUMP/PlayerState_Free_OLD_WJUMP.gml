function PlayerState_Free_OLD_WJUMP()
{
	//caluculate movements
	var move = key_right - key_left;
    
 
    
    // Check for double-tap dash
    if (move != 0) {  // If player is pressing a direction
        var time_now = get_timer() / 1000000;
        
        // Only check for dash if the key was previously released
        if (key_released&&global.stamina>dashCost&&canDash==0) {
            if (move == last_key_direction && 
                time_now - last_key_press_time < dash_threshold) {
                // Double tap detected - enter dash state
				/////////////////////////////
                state = PLAYERSTATE.DASH;
				
              //  hsp = move * (walksp * 2.5);
            }
            
            last_key_press_time = time_now;
            last_key_direction = move;
            key_released = false;
        }
    } else {
        // Key was released
        key_released = true;
    }
	
	
	hsp = move * walksp;

	vsp = vsp +grv;
	
	//Get Ducking
	if (place_meeting(x,y+1,o_wall)) && (key_duck){
		isDucking = true;
	//	hsp = 0;
		// mask_index =s_player_duck;
		
	}
	else{
		mask_index =s_player_idle;
		isDucking = false;
	}
	
	//Get Blocking
	if (place_meeting(x,y+1,o_wall)) && (key_block){
		isBlocking = true;
		
	//	show_debug_message("IS BLOCKING");
		
	}
	else if (key_block){
			isBlocking = false;
			global.stamina -= 15;
			state = PLAYERSTATE.FAST_FALL;
			
	}
	else{
		
		isBlocking = false;
	//	show_debug_message("IS NOT BLOCKING");
	}

	//JUMP
	canjump -=1;
	if(canjump >0 && (key_jump))
	{
		audio_play_sound(sn_jump1,5,false);
		repeat(8){
			with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
			{
				vsp = 0;
					
				}
			
		}
		
		vsp= -6;
		image_index = 0;
	
		jumpnum ++;
		if(global.stamina<10){
			jumpnum = 100;
		}
		
		
		if(jumpnum <2&&global.stamina>=10){
			canjump = 100;
			
		}
		else{
		//	global.stamina -= 20;
			canjump = 0;
		}
	}



	//horizontal collision
	if (place_meeting(x+hsp,y,o_wall))
	{
		while(!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x +sign(hsp);
		}
		hsp = 0;
	
	}
	x = x + hsp;
	//vetical collision

	if (place_meeting(x,y+vsp,o_wall))
	{
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			audio_sound_pitch(sn_land,choose(0.8,1,1.2));
			audio_play_sound(sn_land,5,false);
			repeat(5){
				with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
				{
					vsp = -.01;
					
				}
			
			}
			y = y +sign(vsp);
		}
		vsp = 0;
		jumpnum =0;
		
	
	}
	else{
			//FAST FALL
			if(key_duck){
			//	global.stamina -= 15;
			//	state = PLAYERSTATE.FAST_FALL;
			}
		
	}

	y = y + vsp;



//Animation
	if(isAttacking==0){
		if (!place_meeting(x,y+1,o_wall))
		{
			
			sprite_index = s_player_jump;
			image_speed = 1;
			
			if (sign(vsp)>0){
				image_index =5; 
				image_speed =0;
			}

		
		}	
		else{
			hasjumpattacked =0;
			canjump=10;
			image_speed = 1;
			if(hsp ==0){
				sprite_index = s_player_idle;
				if(isDucking){
					sprite_index = s_player_duck;
					if (image_index >= image_number - 1){
					    image_speed = 0;
					} 
					else{
						 image_speed = 1;
					}	
				}
			}
			else{
				sprite_index = s_player_run;
			}
		}
	
	
	}
	else{
		image_speed = 1;
		sprite_index = s_player_poke;
		if(image_index>3){
			isAttacking=0;
		}
	}

	if (hsp !=0){
		image_xscale = sign(hsp);
	}

	if(isBlocking){
		state = PLAYERSTATE.BLOCK;
	}
	
	if(!isDucking&& vsp ==0 && sprite_index!= s_player_jump){
		if(key_attack) state = PLAYERSTATE.ATTACK_POKE;
	
		
		if((key_spattack) && (powerUpUppercut>0)&&((key_right)||(key_left))){
			state = PLAYERSTATE.SP_UPPERCUT;
		}
		else if(key_spattack) && (powerUpBlast>0)
		{
			state = PLAYERSTATE.SP_BLAST;
		}
		else if((key_ult) && (powerUpFireball>0)&&global.sp>=100){
			state = PLAYERSTATE.SP_FIREBALL;
		}
	}
	else if (isDucking && vsp ==0){
		/*
		if(key_attack) state = PLAYERSTATE.DUCK_POKE;
		
		if(key_spattack) && (global.duck_powerup==1)
		{
			show_debug_message("CALLING SWEEP FROM STATE_FREE");
			state = PLAYERSTATE.SP_SWEEP;
		}
		if(key_spattack) && (global.duck_powerup==2)
		{
			show_debug_message("CALLING UPPERCUT FROM STATE_FREE");
			state = PLAYERSTATE.SP_UPPERCUT;
		}
		*/
		if(hsp==walksp||hsp==-walksp){
		//	hsp=1;
			state = PLAYERSTATE.SP_SWEEP;
		}
		else{
			state = PLAYERSTATE.DUCK;
			
		}
			
	}
	else if (sprite_index == s_player_jump&&hasjumpattacked==0){
		
		if(key_attack) state = PLAYERSTATE.JUMP_ATTACK1;
	
	}
	if (sprite_index == s_player_jump)
	{
	
		if((key_spattack) && (powerUpUppercut>0)&&((key_right)||(key_left))){
			state = PLAYERSTATE.SP_UPPERCUT;
		}
		else if((key_spattack) && (powerUpBlast>0))
		{
			show_debug_message("CALLING AIR BLAST From FREE");
			state = PLAYERSTATE.SP_BLASTAIR1;
		}
		else if(key_duck){
				state = PLAYERSTATE.FAST_FALL;
			
		}
		
		
	}
}