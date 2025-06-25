function PlayerState_SP_Fireball()
{
	
		hsp = 0;
		vsp = 0;
		image_speed = 1;
		if(fireballLevel==0){
			image_index = 0;
			if(global.sp<200){
				fireballLevel=1;
				sprite_index = s_player_fireball1;
			}
			else if(global.sp<300){
				fireballLevel=2;
				sprite_index = s_player_fireball2;
			}
			else{
				fireballLevel=3;
				sprite_index = s_player_fireball3;
			}
		}
		if(image_index == 5){
			
			audio_play_sound(choose(sn_smack,sn_punch1),1,false);
			var xoffset = 23;
			if(image_xscale<=0) xoffset= xoffset*-.75;
			if(fireballLevel==1){
				with (instance_create_layer(x+xoffset,y+7,"Bullets",o_fireball_1))
				{
					spd = 15;
					if(other.image_xscale<=0){
						//direction = 180+ random_range(-3,3);
						direction = 180;
					}
					else{
						//direction = 0+ random_range(-3,3); 
						direction =0;
					}
					image_angle = direction;
				}
				global.sp=0;
			}
			else if(fireballLevel==2){
				with (instance_create_layer(x+xoffset,y+7,"Bullets",o_fireball_2))
				{
					spd = 17;
				if(other.image_xscale<=0){
						//direction = 180+ random_range(-3,3);
						direction = 180;
					}
					else{
						//direction = 0+ random_range(-3,3); 
						direction =0;
					}
					image_angle = direction;
				}
				global.sp=0;
			}
			else if (fireballLevel==3){
				with (instance_create_layer(x+xoffset,y+7,"Bullets",o_fireball_3))
				{
					spd = 20;
					if(other.image_xscale<=0){
						//direction = 180+ random_range(-3,3);
						direction = 180;
					}
					else{
						//direction = 0+ random_range(-3,3); 
						direction =0;
					}
					image_angle = direction;
					global.sp=0;
				}
			}
		}
		
		
		if (animation_end())
		{
				fireballLevel=0;
				image_speed = 1;
				sprite_index = s_player_idle;
				state = PLAYERSTATE.FREE;
	
		}
	
}
	


	
