function PlayerState_Assist(){
		hsp = 0;
		vsp = 0;
		if(global.thisAssistTime==0){
			global.thisAssistTime=global.assistTime;
			image_speed = 1;
			image_index = 0;
			
		}
		sprite_index = s_player_fireball3;
		
		
		
		
		if(image_index == 5){
			
			audio_play_sound(choose(sn_smack,sn_punch1),1,false);
			var xoffset = 25;
			if(image_xscale<=0) xoffset= xoffset*-.75;
	
				with(instance_create_layer(x+xoffset,y-7,"Bullets",o_scooter))
				{
						
						if(other.image_xscale<=0){
							image_xscale=-1;
							
							   walksp = -walksp;  // Update walking direction
							     hsp = -hsp*3;  // Reverse direction
						}
						else{
							hsp=hsp*3;
							image_xscale=1;
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