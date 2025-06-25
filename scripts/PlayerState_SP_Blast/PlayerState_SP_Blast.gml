function PlayerState_SP_Blast()
{
	if(global.sp>10){
		hsp = 0;
		vsp = +2;
		image_speed = 1;
		
		if(sprite_index != s_player_blast1){
			blastCombo=0;
				global.sp = global.sp-10;
			audio_play_sound(choose(sn_smack,sn_punch1),1,false);
			with (instance_create_layer(x,y,"Bullets",o_bullet))
			{
				spd = 10;
				if(other.image_xscale<=0){
					direction = 180+ random_range(-3,3);
				}
				else{
					direction = 0+ random_range(-3,3); 
				}
				image_angle = direction;
			}
				sprite_index = s_player_blast1;
		}
		
	
		if((key_spattack) && (powerUpBlast>0)&&image_index>1)
		{
			blastCombo =1;
		}
	
		if (animation_end())
		{
				if(blastCombo==0){
					image_speed = 1;
					sprite_index = s_player_idle;
					state = PLAYERSTATE.FREE;
				}
				else{
						state = PLAYERSTATE.SP_BLAST2;
				}
	
		}
	
	}
	else{
			image_speed = 1;
				sprite_index = s_player_idle;
				state = PLAYERSTATE.FREE;
	}
}