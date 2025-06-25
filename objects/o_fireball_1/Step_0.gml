//timer--;

//if(timer<= 0) instance_destroy();

x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);
repeat(1){
				with (instance_create_layer(x,y, "Bullets",o_fireball_trail_1))
				{
					//vsp = 0;
					
				}
			
			}
if (place_meeting(x,y,o_wall)) && (image_index != 0)
{
	while (place_meeting(x,y,o_wall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd =0;
		audio_sound_pitch(sn_land,choose(0.8,1,1.2));
			audio_play_sound(sn_land,5,false);
		instance_change(o_hitspark,true);
		layer_add_instance("Tiles",id);
	
}