

if(hp>0){
// Handle knockback first - increase horizontal force significantly
	if (knockBack >= 20) 
	{

	
		with(instance_create_layer(x,y,layer,o_bat_knockback))
		{

				/*old uppercut
		hsp = 0.2* other.knockbackDir;
		vsp = -10;
		*/
		hsp = 8* other.knockbackDir;
		vsp = -3;
			if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
			hp = other.hp;
			size = other.size;
		
		}
		with (mygun) instance_destroy();
		instance_destroy();
	}else if (knockBack >= 10) {
		with(instance_create_layer(x,y,layer,o_bat_knockback))
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
		with (mygun) instance_destroy();
		instance_destroy();
	}
	else if(knockBack>7){
	with(instance_create_layer(x,y,layer,o_bat_knockback))
		{
			hsp = 2* other.knockbackDir;
			vsp = 2* other.knockbackDir;
			if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			hp = other.hp;
			size = other.size;
			}
		with (mygun) instance_destroy();
		instance_destroy();
	}
	else if(knockBack >0)
	{
		with(instance_create_layer(x,y,layer,o_bat_knockback_small))
		{
			hsp =  5* other.knockbackDir;
			if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
				image_yscale = other.size;
			hp = other.hp;
			size = other.size;
		}
		with (mygun) instance_destroy();
		instance_destroy();

	}
// Normal movement
	// Normal movement
else if (hitTimer == 0)
{
    switch (state) {
        case st_hover:
            hsp = 0;
            vsp = 0;
            
            // Check if player is close AND no wall or one-way is in the line
            if (distance_to_object(o_player) < 300) {
                var blockWall   = collision_line(x, y, o_player.x, o_player.y, o_wall, false, true);
                var blockOneway = collision_line(x, y, o_player.x, o_player.y, o_oneway, false, true);
                if (!blockWall && !blockOneway) {
                    state = st_chase;
                }
            }
            break;

        case st_chase:
            var dist = distance_to_object(o_player);
            if (dist < 250) {
                var blockWall   = collision_line(x, y, o_player.x, o_player.y, o_wall, false, true);
                var blockOneway = collision_line(x, y, o_player.x, o_player.y, o_oneway, false, true);
                if (!blockWall && !blockOneway) {
                    var dir = point_direction(x, y, o_player.x, o_player.y);
                    hsp = lengthdir_x(chase_speed, dir);
                    vsp = lengthdir_y(chase_speed, dir);
                }
                else {
                    // A wall or one-way is blocking
                    state = st_hover;
                }
            }
            else {
                // Too far or something else
                state = st_hover;
            }
            break;
    }
		// If you want the bat to collide with walls horizontally:
        
        if (place_meeting(x + hsp, y, o_wall)) {
            // either reverse or zero out hsp
            hsp = 0;
        }
        if (place_meeting(x, y + vsp, o_wall)) {
            // either reverse or zero out vsp
            vsp = 0;
        }

        x += hsp;
        y += vsp;

           // Flip sprite if moving horizontally
        if (hsp != 0) image_xscale = sign(hsp) * size;
        image_yscale = size; // keep consistent scale
    }

	else 
	{
	    hsp = 0;
		vsp = 0; 
	}
}


// Animation
if(hitTimer == 0){
   
    if (state == st_hover) {
        sprite_index = s_bat_flying; 
        image_speed = 1;
    }
    else if (state == st_chase) {
        sprite_index = s_bat_flying;
        image_speed = 1;
    }
	 hitvsp = 0;
}
else{
   
    sprite_index = s_bat_hit;
	image_speed = 0;
	if(hitTimer==45){
		image_index++;
	}
     hitTimer--;
	 
	if(hitvsp != 0){
        y = hitvsp;
    }
    else{
        hitvsp = y - 5;
    }
}
