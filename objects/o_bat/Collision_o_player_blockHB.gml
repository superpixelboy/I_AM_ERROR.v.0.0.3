/// @description Insert description here
// You can write your code in this editor
with(instance_create_layer(x,y,layer,o_bat_knockback_small))
		{
			hsp =  3* other.knockbackDir;
			if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			hp = other.hp;
			size = other.size;
		
			if(other.knockbackDir>0){
				image_xscale= -1;
				}
			else{
				image_xscale= 1;
			}
		}
		instance_destroy();