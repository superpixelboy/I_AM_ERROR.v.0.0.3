function PlayerState_Block(){
	hsp = 0;
	vsp = 0;

	

	if(sprite_index!= s_player_block){
			mywall = instance_create_layer(x,y,"Walls",o_player_blockHB);
			with(mywall)
			{
				image_xscale=other.image_xscale;
			}
			
	}
		sprite_index = s_player_block;
	//isInvincible = 1;
	/*
	if(global.stamina>=dashCost &&	(key_right!=0||key_left!=0)&&canDash==0){
	
		state = PLAYERSTATE.DASH;
	}
	*/

	
	if (animation_end())
		{
			blockCooldown=120;
			global.stamina -= dashCost;
			isInvincible = 0;
			sprite_index = s_player_idle;
			state = PLAYERSTATE.FREE;
		}							

}