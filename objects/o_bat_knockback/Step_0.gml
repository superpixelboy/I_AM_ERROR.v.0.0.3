/// STEP (or script) event for o_bat_knockback

if (done == 0) {
    // Gravity
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
        // Create smoke if moving
        if (hsp != 0) {
            instance_create_layer(x, y, "Player", o_smoke);
        }
    }
    x += hsp;

    // -------------------------------
    // Vertical collision with o_wall
    // -------------------------------
    if (place_meeting(x, y + vsp, o_wall)) {
        
        // If we are falling, it's a proper "landing"
        if (vsp > 0) {
            sprite_index = s_bat_stun;
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
        // One-way platform collision
        // Only check if we're falling downward
        // AND we're not already inside a one-way
        // so we only land if "approaching from above."
        // -------------------------------
        if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway)) {
            // That means we are above the one-way and about to collide

            // "Land" exactly on top
            while (!place_meeting(x, y + 1, o_oneway)) {
                y += 1;
            }
            
            // Big landing effect, just like with normal walls
            sprite_index = s_bat_stun;
            image_speed = 1;
            ScreenShake(2, 10);
            audio_play_sound(sn_big_land, 5, false);
            
            // Create dust effect
            repeat(10) {
                with (instance_create_layer(x, y, "Bullets", o_dust)) {
                    vsp = -1;
                }
            }
            vsp = 0;
            done = 1;
        }
        else {
            // Otherwise, no collision: keep moving
            y += vsp;
        }
    }
}

// -------------------------------
// Transformation timer
// -------------------------------
if (timer > 0) {
    timer--;
} 
else {
    // Transform back into a normal bat
    var new_bat = instance_create_layer(x, y, layer, o_bat);
    with (new_bat) {
        hp = other.hp;
        size = other.size;
        image_yscale = other.size;
        
        if (sign(other.hsp) != 0) {
            image_xscale = sign(other.hsp) * other.size;
        } else {
            image_xscale = other.size;
        }
        
        if (other.image_xscale < 0) {
            image_xscale = -1;
            hsp = -hsp;
            walksp = hsp;
        } else {
            image_xscale = 1;
        }
    }
    instance_destroy();
}
