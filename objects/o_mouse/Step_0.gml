// Step Event
vsp = vsp + grv;

if(hp > 0) {
    // Handle knockback first - increase horizontal force significantly
    if (knockBack >= 20) {
        with(instance_create_layer(x,y,layer,o_mouse_knockback)) {
            hsp = 7 * other.knockbackDir;
            vsp = -2;
            if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
            image_yscale = other.size;
            hp = other.hp;
            size = other.size;
        }
        with (mygun) instance_destroy();
        instance_destroy();
    } else if (knockBack >= 10) {
        with(instance_create_layer(x,y,layer,o_mouse_knockback)) {
            hsp = 3 * other.knockbackDir;
            if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
            image_yscale = other.size;
            hp = other.hp;
            size = other.size;
            
            if(other.knockbackDir > 0) {
                image_xscale = -1;
            } else {
                image_xscale = 1;
            }
        }
        with (mygun) instance_destroy();
        instance_destroy();
    } else if(knockBack > 7) {
        with(instance_create_layer(x,y,layer,o_mouse_knockback)) {
            hsp = 2 * other.knockbackDir;
            vsp = 2 * other.knockbackDir;
            if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
            image_yscale = other.size;
            hp = other.hp;
            size = other.size;
            if(other.knockbackDir > 0) {
                image_xscale = -1;
            } else {
                image_xscale = 1;
            }
        }
        with (mygun) instance_destroy();
        instance_destroy();
    } else if(knockBack > 0) {
        with(instance_create_layer(x,y,layer,o_mouse_knockback_small)) {
            hsp = 5 * other.knockbackDir;
            if (sign(hsp) != 0) image_xscale = sign(hsp) * other.size;
            image_yscale = other.size;
            hp = other.hp;
            size = other.size;
            image_xscale = other.image_xscale;
            image_index = 1;
        }
        instance_destroy();
    }
    // Normal movement
    else if (hitTimer == 0) {
        hsp = walksp;
			if(dazetime>0){
			
			hsp =0;
		}
		else{
		//	image_index = s_mouse_walk;
			hsp = walksp;
		}
    } else {
        hsp = 0;
    }

    // ----- ONE-WAY PLATFORM EDGE DETECTION -----
    // Check for walls OR one-way platforms when deciding to turn around at edges
    if (grounded && afraidofheights) {
        var will_fall = !place_meeting(x + hsp*20, y + 1, o_wall) && 
                        !place_meeting(x + hsp*20, y + 1, o_oneway);
        
        if (will_fall) {
            // Turn only if not already turning
            if (sign(hsp) == sign(walksp)) {
                hsp = -hsp;  // Reverse direction
                walksp = -walksp;  // Update walking direction
            }
        }
    }

    // ----- HORIZONTAL COLLISION -----
    // Check collision with wall
    if (place_meeting(x+hsp*1.25, y, o_wall)) {
        while(!place_meeting(x+sign(hsp), y, o_wall)) {
            x = x + sign(hsp);
        }
        hsp = -hsp;
        walksp = hsp;
        hsp = 0;
    }
    x = x + hsp;

    // ----- VERTICAL COLLISION -----
    grounded = false;
    
    // Check collision with wall
    if (place_meeting(x, y+vsp, o_wall)) {
        while(!place_meeting(x, y+sign(vsp), o_wall)) {
            y = y + sign(vsp);
        }
        vsp = 0;
        grounded = true;
    }
    // Check collision with one-way platform (only when falling)
    else if (vsp >= 0 && place_meeting(x, y+vsp, o_oneway) && !place_meeting(x, y, o_oneway)) {
        while(!place_meeting(x, y+1, o_oneway)) {
            y = y + 1;
        }
        vsp = 0;
        grounded = true;
    }
    
    y = y + vsp;

    // ----- ANIMATION -----
    if(hitTimer == 0&&dazetime==0) {
        if (!grounded) {
            sprite_index = s_mouse_hit;
            image_index = 0;
            image_speed = 0;
        } else {
            image_speed = 1;
            sprite_index = s_mouse_walk;
        }
        hitvsp = 0;
    } 
	else if (hitTimer>0){
        sprite_index = s_mouse_hit;
		dazetime=0;
        image_speed = 0;
        if(hitTimer == 45) {
            image_index++;
        }
        hitTimer--;
         
        if(hitvsp != 0) {
            y = hitvsp;
        } else {
            hitvsp = y - 5;
        }
    }
	else if (dazetime>0){
		 sprite_index = s_mouse_daze;
	}

    // Update image scaling
    if (hsp != 0) {
        image_xscale = sign(hsp) * size;
        image_yscale = size;
    }
	//Daze info
	if(dazetime>0){
		dazetime--;
	}
	else{
		dazetime=0;
	}
	
}