function PlayerState_Block_OLD(){
	hsp = 0;
	vsp = 0;

	if(sprite_index!= s_player_block){
			mywall = instance_create_layer(x,y,"Walls",o_wall);

			with(mywall)
			{
				image_xscale = .25;
				image_yscale = .75;
			}
	}
	sprite_index = s_player_block;
//	isInvincible = 1;
	
	if(image_index < image_number - 1){
		image_speed=2;
	}
	else{
		image_speed=0;
		
	}
	
	if(global.stamina>=dashCost &&	(key_right!=0||key_left!=0)&&canDash==0){
		with (mywall){
	
					instance_destroy();
			}
		
		state = PLAYERSTATE.DASH;
	}
	
	if(key_block==0)
	{
		sprite_index = s_player_idle;
			state = PLAYERSTATE.FREE;
			with (mywall){
	
					instance_destroy();
			}
		//	isInvincible = 0;
		//	isInvincible = 0;
	}
	


}