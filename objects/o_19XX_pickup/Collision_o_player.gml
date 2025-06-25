/// @description Insert description here
// You can write your code in this editor

//instance_create_layer(o_player.x,o_player.y,"Player",o_bullet);

//	audio_play_sound(sn_jump1, 1000, false);
if(other.key_up){


	if(image_alpha ==1){
		
		GiveItem("Mysterious Game Cartridge", s_19XX, "19XX");
		image_alpha =0;
	}
	else{
		image_alpha =0;
	
			
	}
	
}

