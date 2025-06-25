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
	
	x = x - initial_hsp;
	//vetical collision
	//vetical collision
	if (place_meeting(x,y+vsp,o_wall))
	{
	//	show_debug_message("The image index is: " + string(image_index)+ "--The image Number is: " + string(image_number));
	
			// If our sprite's current frame is the last frame...
	/*
	if (image_index >= image_number - 1) {
		
		    image_speed = 0;
		

		} else {
			 image_speed = 1;
		}
		*/
		if (vsp > 0){
			done =1;
			alarm[0] = 60;
				 image_speed = 1;
				 audio_play_sound(sn_select,5,false);
				repeat(5){
				with (instance_create_layer(x,bbox_bottom, "Bullets",o_dust))
				{
					vsp = -.01;
					
				}
			
			}
		}
	
		
		
		while(!place_meeting(x,y+sign(vsp),o_wall))
		{
			y = y +sign(vsp);
		
		}
		vsp = 0;
		
	
	}

	y = y + vsp;
	
}

if (image_index == image_number-1){
	
	image_index = 3;
	 image_speed = 0;
	
}


timer--;
	if(timer<0) instance_destroy();