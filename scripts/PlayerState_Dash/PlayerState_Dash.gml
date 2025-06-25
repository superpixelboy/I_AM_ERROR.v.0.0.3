function PlayerState_Dash(){
	
		if(image_xscale>0){
			hsp = 5;
		}
		else{
			hsp = -5;
		}
	
	vsp = 0;

	sprite_index = s_player_dash;
	image_speed =3;
	isInvincible = 1;
	//horizontal collision
	if (place_meeting(x+hsp,y,o_wall))
	{
		while(!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x +sign(hsp);
		}
		if(image_xscale>0){
			hsp = -5;
		}
		else{
			hsp = 5;
		}
	
	}
	x = x + hsp;
	//vetical collision
	if (place_meeting(x,y+vsp,o_wall))
	{
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			audio_sound_pitch(sn_land,choose(0.8,1,1.2));
			audio_play_sound(sn_land,5,false);
			repeat(5){
				with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
				{
					vsp = -.01;
					
				}
			
			}
			y = y +sign(vsp);
		}
		vsp = 0;
		jumpnum =0;
		
	
	}

	x = x + hsp;

	y = y + vsp;
	
	if (animation_end())
	{
		canDash=dashCooldown;
		global.stamina -= dashCost;
		isInvincible = 0;
		sprite_index = s_player_idle;
		state = PLAYERSTATE.FREE;
	}
	
}