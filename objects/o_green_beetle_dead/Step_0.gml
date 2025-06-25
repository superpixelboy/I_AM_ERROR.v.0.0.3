if (done == 0){
	vsp = vsp +grv;

	//horizontal collision
	if (place_meeting(x+hsp,y,o_wall))
	{
		while(!place_meeting(x+sign(hsp),y,o_wall))
		{
			x = x +sign(hsp);
		}
		hsp = 0;
	
	}
	x = x + hsp;
	//vetical collision
	//vetical collision
	if (place_meeting(x,y+vsp,o_wall))
	{
	//	show_debug_message("The image index is: " + string(image_index)+ "--The image Number is: " + string(image_number));
	
			// If our sprite's current frame is the last frame...
		if (image_index >= image_number - 1) {
		
		    image_speed = 0;
		

		} else {
			 image_speed = 1;
		}
		
		if (vsp > 0){
			done =1;
			
		}
		
		
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			y = y +sign(vsp);
		}
		vsp = 0;
	
	}

	y = y + vsp;
	
}




if (animation_end()){
	

	 image_speed = 0;
	
}
else if(image_index == image_number-3){
	ScreenShake(2,10);
	
	if(size>1){
		audio_play_sound(sn_select,5,false);
	}
	else{
			audio_play_sound(sn_big_land,5,false);
	}
}



timer--;


if(room==Basement&&global.bugsKilled==4&&timer>0){
	with (o_music_manager) {
		if(!fight_is_over){
			audio_stop_sound(sn_hall_mount_mid);
			audio_play_sound(sn_hall_mount_end, 1, false);
			fight_is_over=true;
		}
	}
}

if(timer<=0){

	//Basement code
	if(room==Basement){
		//count kill
		global.bugsKilled++;
		if(global.bugsKilled==5){
				instance_create_layer(x,y,layer,o_19XX_pickup);
			}
		}
	//ATTIC code
	if(room==Attic){

		}
	
	instance_destroy();
}


