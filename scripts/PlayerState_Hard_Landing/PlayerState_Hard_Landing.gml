function PlayerState_Hard_Landing(){
	hsp = 0;
	vsp = 0;
	 while (place_meeting(x, y , o_wall)) {
		
            y -= 1;
        }
	image_speed = .75;
	if(sprite_index!=s_player_hardlanding){
		image_index=0;
			audio_sound_pitch(sn_land,choose(0.8,1,1.2));
			audio_play_sound(sn_land,5,false);
			repeat(20){
				with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
				{
					vsp = -.01;
					
				}
			
			}
	}

	sprite_index = s_player_hardlanding;
	mask_index = s_player_hardlanding;
	if(key_attack) state = PLAYERSTATE.ATTACK_POKE;
	

	
	if (animation_end())
	{
		sprite_index = s_player_idle;
		state = PLAYERSTATE.FREE;
	}
}