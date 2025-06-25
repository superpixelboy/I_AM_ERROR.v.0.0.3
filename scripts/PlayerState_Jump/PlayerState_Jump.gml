function PlayerState_Jump() {
    // ---------------------------------------------
    // INITIAL JUMP VELOCITY
    // ---------------------------------------------
    // Only apply the initial jump impulse when first entering the state
    // from the ground (not when already in air)
    if ((place_meeting(x, y+1, o_wall) || place_meeting(x, y+1, o_oneway))&&jumpStart==0) {
        // We're still on the ground when entering jump state, so apply initial impulse
        vsp = -6; // Upward velocity for jump
        
        // Jump effects
        audio_play_sound(sn_jump1, 5, false);
        repeat(8) {
            with (instance_create_layer(x, bbox_bottom, "Bullets", o_dust)) {
                vsp = 0;
            }
        }
        
        // Reset jump counter for double jump tracking
        jumpnum = 0;
		jumpStart =1;
    }
    
    // ---------------------------------------------
    // Horizontal Movement in Air
    // ---------------------------------------------
    var move = key_right - key_left;
    hsp = move * walksp;
    
    // Apply gravity
    vsp = vsp + grv;
    
    // ---------------------------------------------
    // Double Jump Logic
    // ---------------------------------------------
    if (key_jump) { // Make sure to use _pressed version for double jumps
        // Check if we can double jump
        if (jumpnum < 1 && global.stamina >= 10) {
            audio_play_sound(sn_jump1, 5, false);
            vsp = -6; // Second jump impulse
            jumpnum++; // Increment jump counter
            
            // Create dust effect on double jump
            repeat(5) {
                with (instance_create_layer(x, y, "Bullets", o_dust)) {
                    vsp = 0;
                }
            }
        }
    }
    
    // ---------------------------------------------
    // Fast Fall
    // ---------------------------------------------
    if (key_duck) {
        state = PLAYERSTATE.FAST_FALL;
        exit;
    }
    
    // Air block transitions to fast fall
    if (key_block) {
        isBlocking = false;
        global.stamina -= 15;
        state = PLAYERSTATE.FAST_FALL;
        exit;
    }
    
    // ---------------------------------------------
    // Collisions
    // ---------------------------------------------
    // Horizontal collision
    if (place_meeting(x + hsp, y, o_wall)) {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x = x + sign(hsp);
        }
        hsp = 0;
    }
    x = x + hsp;
    
    // Vertical collision - check for landing
    if (place_meeting(x, y + vsp, o_wall)) {
        while (!place_meeting(x, y + sign(vsp), o_wall)) {
            y = y + sign(vsp);
        }
        
        // Landing effects (only when falling)
        if (vsp > 0) {
            audio_sound_pitch(sn_land, choose(0.8, 1, 1.2));
            audio_play_sound(sn_land, 5, false);
            repeat(5) {
                with (instance_create_layer(x, bbox_bottom, "Bullets", o_dust)) {
                    vsp = -.01;
                }
            }
        }
        
        vsp = 0;
        
        // Return to free state if we land
        if (vsp >= 0 && place_meeting(x, y + 1, o_wall)) {
			
			//make the attic string move
			if(room==IntroHallway){
				with(o_attic_string){
					if(!swing){
						image_index=0;
						swing=1;
					}
				}
			}
			
            state = PLAYERSTATE.FREE;
            exit;
        }
    }
    
    // One-way platform collision
    else if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway)) {
        // Don't collide if player is pressing down+jump (to drop through)
        var drop_through = key_duck && key_jump;
        
        if (!drop_through) {
            while (!place_meeting(x, y + 1, o_oneway)) {
                y = y + 1;
            }
            
            // Landing effects
            audio_sound_pitch(sn_land, choose(0.8, 1, 1.2));
            audio_play_sound(sn_land, 5, false);
            repeat(5) 
                with (instance_create_layer(x, bbox_bottom, "Bullets", o_dust)) {
                    vsp = -.01;
                }
            
            
            vsp = 0;
            
            // Return to free state
            state = PLAYERSTATE.FREE;
            exit;
        }
	}
    
    // Apply vertical movement
    y = y + vsp;
    
    // ---------------------------------------------
    // Animation & State Transitions
    // ---------------------------------------------
    if (isAttacking == 0) {
        sprite_index = s_player_jump;
        image_speed = 1.2;
        
        // Use falling sprite when moving downward
        if (sign(vsp) > 0) {
            image_index = 6;
            image_speed = 0;
        }
    } else {
        // If attacking in air
        image_speed = 1;
        sprite_index = s_player_poke;
        if (image_index > 3) {
            isAttacking = 0;
        }
    }
    
    // Flip sprite based on movement
    if (hsp != 0) {
        image_xscale = sign(hsp);
    }
    
    // ---------------------------------------------
    // Air Attacks
    // ---------------------------------------------
    if (hasjumpattacked == 0 && key_attack) {
        state = PLAYERSTATE.JUMP_ATTACK1;
        exit;
    }
    
    // Special moves in air
    if (key_spattack && powerUpUppercut > 0 && (key_right || key_left)) {
        state = PLAYERSTATE.SP_UPPERCUT;
        exit;
    } 
    else if (key_spattack && powerUpBlast > 0) {
        show_debug_message("CALLING AIR BLAST From JUMP");
        state = PLAYERSTATE.SP_BLASTAIR1;
        exit;
    }

}