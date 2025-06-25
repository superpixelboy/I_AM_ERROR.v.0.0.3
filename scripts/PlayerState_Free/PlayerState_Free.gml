function PlayerState_Free() {

    // ---------------------------------------------
    // Horizontal Movement & Dash
    // ---------------------------------------------
    var move = key_right - key_left;
    var move = key_right - key_left;
    hsp = move * walksp;
	hasjumpattacked = 0;
	jumpStart =0;
    // Dash logic
    if (move != 0) {
        var time_now = get_timer() / 1000000;

        if (key_released && global.stamina > dashCost && canDash == 0) {
            if (move == last_key_direction && time_now - last_key_press_time < dash_threshold) {
                // Double tap detected: dash
                state = PLAYERSTATE.DASH;
            }
            last_key_press_time = time_now;
            last_key_direction = move;
            key_released = false;
        }
    } else {
        key_released = true;
    }
   	if(key_block&&global.stamina>=dashCost &&	(key_right!=0||key_left!=0)&&canDash==0){
	
		state = PLAYERSTATE.DASH;
	}
	
    // ---------------------------------------------
    // Duck / Block
    // ---------------------------------------------
    if (key_duck) {
        isDucking = true;
    } else {
        isDucking = false;
    }

    // If you're on ground and holding block
    if ((place_meeting(x, y+1, o_wall)||place_meeting(x, y+1, o_oneway)) && key_block) {
        isBlocking = true;
    } 
    else {
        isBlocking = false;
    }

    // ---------------------------------------------
    // Check for Jump Input
    // ---------------------------------------------
    // Instead of doing the jump directly, just switch states if the player presses jump.
    // canjump > 0 means we still have some jump “buffer” frames left.
    if (key_jump) {
        // Switch to our new jump state
        state = PLAYERSTATE.JUMP;
        exit; // Important to exit so we don't continue with ground collisions, etc.
    }
	
	
	
	// Near the start (or end) of PlayerState_Free()
	if (ground_check_timer > 0) {
	    ground_check_timer--;
	} else if (!place_meeting(x, y+1, o_wall) && !place_meeting(x, y+1, o_oneway)) {
	    state = PLAYERSTATE.JUMP;
	    exit;
	}

	
	
	
	
    // ---------------------------------------------
    // Ground Collisions
    // ---------------------------------------------
    // Horizontal collision
    if (place_meeting(x + hsp, y, o_wall)) {
        while(!place_meeting(x + sign(hsp), y, o_wall)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
    x += hsp;

    // Because we are in “free” (ground) state, we assume vsp = 0 or minimal:
    // but if you want to handle small slopes or edge cases, you could still do a vsp check here.
    // For standard flat ground, just keep vsp = 0:
    vsp = 0;

    // ---------------------------------------------
    // Animation & State Transitions
    // ---------------------------------------------
    // If not attacking, pick idle/run/duck animations
    if(isAttacking == 0) {
        if (hsp == 0) {
            sprite_index = s_player_idle;
            image_speed = 1;
            
            if (isDucking) {
                sprite_index = s_player_duck;
                // If you only want a “hold” frame while ducking:
                if (image_index >= image_number - 1) image_speed = 0;
                else image_speed = 1;
            }
        } else {
            sprite_index = s_player_run;
            image_speed = 1;
        }
    } 
    else {
        // Attack animation
        sprite_index = s_player_poke;
        image_speed = 1;
        if (image_index > 3) {
            isAttacking = 0;
        }
    }

    // Flip sprite based on movement
    if (hsp != 0) {
        image_xscale = sign(hsp);
    }

    // If blocking, switch to block state
    if(isBlocking&&blockCooldown==0&&global.stamina>=dashCost&&hsp==0) {
        state = PLAYERSTATE.BLOCK;
    }

    // Attack states (while on ground and not ducking)
    if(!isDucking && vsp == 0 && sprite_index != s_player_jump) {
        if(key_attack) {
            state = PLAYERSTATE.ATTACK_POKE;
        }
        if(key_spattack && powerUpUppercut > 0 && (key_right || key_left)) {
            state = PLAYERSTATE.SP_UPPERCUT;
        }
        else if(key_spattack && powerUpBlast > 0) {
            state = PLAYERSTATE.SP_BLAST;
        }
        else if(key_ult && powerUpFireball > 0 && global.sp >= 100) {
            state = PLAYERSTATE.SP_FIREBALL;
        }
		//CALL ASSIST
		else if(key_assist&&global.thisAssistTime==0){
				
				state = PLAYERSTATE.ASSIST;
		}
    }
    // Ducking states
    else if (isDucking && vsp == 0) {
        if(hsp > walksp/2 || hsp < -walksp/2) {
            state = PLAYERSTATE.SP_SWEEP;
        } else {
            state = PLAYERSTATE.DUCK;
        }
    }
}
