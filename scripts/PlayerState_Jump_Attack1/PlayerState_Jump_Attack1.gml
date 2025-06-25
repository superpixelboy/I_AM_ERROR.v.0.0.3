function PlayerState_Jump_Attack1(){

	if(hasjumpattacked==0){
		vsp = 0;
		hasjumpattacked = 1;
	}
	
	
	//calculate vertical speed
	if(o_player.enemieshit>0){
		//vsp = vsp -grv*1;
	//	vsp = vsp -0.05;
		hsp=hsp/2;
		if(image_index<2){
			vsp = vsp-vsp*0.01;
		}
		else{
		
		}
	}
	else{
		hsp=hsp/2;
	//	vsp = vsp -grv*.5;
		if(image_index<2){
			vsp = vsp-vsp*0.01;
		}
		else{
		
		}
	}
	y = y + vsp
  //clculate horizontal speed
/*  if(x>0.05){
		hsp =hsp - hsp*.05
	
	}
	else{
		hsp = 0;
		x=0;
		
	}*/
	
	x = x + hsp;
	//horizontal collision
	if (place_meeting(x+hsp,y,o_wall))
	{
		while(!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x +sign(hsp);
		}
		hsp = 0;
	
	}

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
	
	ProcessAttack(s_player_jump_attack1,s_player_jump_attackHBA,1)
	
	image_speed =1;
	
	if (key_attack) && (image_index > 1)
	{
		isCombo = 1;
	}
	
	if((key_spattack)&&global.sp>10&& (powerUpUppercut>0)&&((key_right)||(key_left))){
		state = PLAYERSTATE.SP_UPPERCUT;
	}
	
	if (animation_end())
	{
		if(isCombo&&o_player.enemieshit>0){
			state = PLAYERSTATE.JUMP_ATTACK2;
			
		}
		else{
			sprite_index = s_player_jump;
			state = PLAYERSTATE.JUMP;
		}
		isCombo = 0;
	}
}