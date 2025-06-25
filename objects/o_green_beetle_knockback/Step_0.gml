/// STEP EVENT for the o_green_beetle_knockback object

if (done == 0) {
    // Apply gravity
    vsp += grv;

    // -------------------------------
    // Horizontal collision with o_wall
    // -------------------------------
    if (place_meeting(x + hsp, y, o_wall)) {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
    else {
        // Create smoke if moving horizontally
        if (hsp != 0) {
            instance_create_layer(x, y, "Player", o_smoke);
        }
    }
    x += hsp;

    // -------------------------------
    // Vertical collision with o_wall
    // -------------------------------
    if (place_meeting(x, y + vsp, o_wall)) {
        // Debug collision state
        show_debug_message("Collision - VSP: " + string(vsp) + 
                           " Position: " + string(x) + "," + string(y));
        
        // If we are falling, do the landing effects
        if (vsp > 0) {
            sprite_index = s_green_beetle_hit;
            image_speed = 1;
            ScreenShake(2, 10);
            audio_play_sound(sn_big_land, 5, false);
            
            // Create dust effect
            repeat(10) {
                with (instance_create_layer(x, y, "Bullets", o_dust)) {
                    vsp = -1;
                }
            }
            done = 1;
        }
        
        // Resolve collision
        while (!place_meeting(x, y + sign(vsp), o_wall)) {
            y += sign(vsp);
        }
        vsp = 0;
    }
    else {
        // -------------------------------
        // One-way collision from above
        // -------------------------------
        // Only land if:
        // (1) vsp > 0 (we're falling),
        // (2) we aren't already inside the one-way,
        // (3) we would collide at y + vsp
        if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway)) {
            // Debug message if you want
            // show_debug_message("One-way Collision - VSP: " + string(vsp));

            // Landing effects (similar to hitting a wall)
            sprite_index = s_green_beetle_hit;
            image_speed = 1;
            ScreenShake(2, 10);
            audio_play_sound(sn_big_land, 5, false);
            
            repeat(10) {
                with (instance_create_layer(x, y, "Bullets", o_dust)) {
                    vsp = -1;
                }
            }
            done = 1;
            
            // Snap onto the top of the one-way
            while (!place_meeting(x, y + 1, o_oneway)) {
                y += 1;
            }
            vsp = 0;
        }
        else {
            // If no wall or one-way collision, keep moving
            y += vsp;
        }
    }
}

// -------------------------------
// Handle transformation timer
// -------------------------------
if (timer > 0) {
    timer--;
}
else {
    // Create new green_beetle instance
    var new_green_beetle = instance_create_layer(x, y, layer, o_green_beetle);
    with (new_green_beetle) {
        hp = other.hp;
        size = other.size;
        image_yscale = other.size;
        
        if (sign(other.hsp) != 0) {
            image_xscale = sign(other.hsp) * other.size;
        } else {
            image_xscale = other.size;
        }
    }
    instance_destroy();
}
