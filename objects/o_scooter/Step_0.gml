// Step Event
vsp = vsp + grv;
thisStaticTimer--;
lifeTimer--;

if(lifeTimer<=0){
	instance_destroy();
}
/*
if(thisStaticTimer<=0&&grounded){
	 instance_create_layer(x, y+33, "Badguys", o_scoot_static)
              
	thisStaticTimer=staticTimer;
}*/
if (!place_meeting(x, y, o_scoot_static)&&grounded) {
	instance_create_layer(x, y+33, "Badguys", o_scoot_static)
}
    // Normal movement
			hsp = walksp;
	

    // ----- ONE-WAY PLATFORM EDGE DETECTION -----
    // Check for walls OR one-way platforms when deciding to turn around at edges
    if (grounded && afraidofheights) {
        var will_fall = !place_meeting(x + hsp*1, y + 1, o_wall) && 
                        !place_meeting(x + hsp*1, y + 1, o_oneway);
        
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
 
        if (!grounded) {
            sprite_index = s_scooter_scoot;
          
          
        } else {
          
            sprite_index = s_scooter_scoot;
        }
      
     
	


    // Update image scaling
    if (hsp != 0) {
        image_xscale = sign(hsp) * size;
        image_yscale = size;
    }

