/// @description Insert description here
// You can write your code in this editor

x = owner.x;
y= owner.y+10;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if(instance_exists(o_player))
{
	if(o_player.x<x) image_yscale = -image_yscale;
	if (point_distance(o_player.x,o_player.y,x,y) < 600)
	{
		image_angle = point_direction(x,y,o_player.x,o_player.y);
	
	if(owner.sprite_index==s_frog_hop){
		countDown--;
	}
	
	if(countDown <= 0){
				countDown = countDownRate;
			if(!collision_line(x,y,o_player.x,o_player.y,o_wall,false,false))
			{
			
				//bullet code here
				audio_sound_pitch(sn_punch1,choose(0.8,1.0,1.2));
				audio_play_sound(sn_punch1,5,false);
				with(instance_create_layer(x,y,"Badguys",o_eBlast))
				{
					spd = 2;
					direction = other.image_angle + random_range(-3,3);
					image_angle = direction;
				}
			}
			
			
		}
	}
		
	
}