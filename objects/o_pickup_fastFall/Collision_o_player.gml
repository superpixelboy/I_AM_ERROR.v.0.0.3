/// @description Insert description here
// You can write your code in this editor

//instance_create_layer(o_player.x,o_player.y,"Player",o_bullet);

//	audio_play_sound(sn_jump1, 1000, false);
if(other.key_up){

	if (global.air_powerup!=1){
	global.hasSP = true;
	global.air_powerup=1;
	other.powerUpFastFall ++;
	
	if(image_alpha ==1) audio_play_sound(sn_jump1,1,false);
	image_alpha =0;
	}
	else{
		image_alpha =0;
		
		
	}
	
	
}

