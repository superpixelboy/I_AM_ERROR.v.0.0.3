function PlayerState_Jump_Attack3
(){


	
	//vertical speed
	if(o_player.enemieshit>0){
		vsp = vsp -grv*0.1;
	}
	else{
		
		vsp = vsp +grv;
	}
		y = y + vsp
if(x>0.05){
	hsp =hsp - hsp*.1;
	
	}
	else{
		hsp = 0;
		x=0;
		
	}
	x = x + hsp;
	//horizontal collision
	if (abs(hsp) > 0.05) {
	    hsp -= hsp * 0.1; // Apply deceleration
	} else {
	    hsp = 0;
	}
	x += hsp;


	//vetical collision
	if (place_meeting(x, y + vsp, o_wall)) {
	    while (!place_meeting(x, y + sign(vsp), o_wall)) {
	        y += sign(vsp); // Adjust position incrementally
	    }
	    audio_sound_pitch(sn_land, choose(0.8, 1, 1.2));
	    audio_play_sound(sn_land, 5, false);

	    // Create dust instances after the loop ends
	    for (var i = 0; i < 5; i++) {
	        instance_create_layer(x, bbox_bottom, "Bullets", o_dust);
	    }

    sprite_index = s_player_idle;
    state = PLAYERSTATE.FREE;
    vsp = 0;
	}


	ProcessAttack(s_player_jump_attack3,s_player_jump_attackHBB,4)
	
		image_speed =1;

	
	if (animation_end())
	{
		
			sprite_index = s_player_jump;
			state = PLAYERSTATE.JUMP;
	}
}