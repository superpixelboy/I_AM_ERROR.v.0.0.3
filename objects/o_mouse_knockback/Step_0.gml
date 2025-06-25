// For the large knockback object (o_mouse_knockback)
if (done == 0) {
    vsp = vsp + grv;
    
    // Apply horizontal friction to slow down the sliding
    hsp = approach(hsp, 0, 0.15); // Gradually reduce horizontal speed
    
    // Horizontal collision
    if (place_meeting(x + hsp, y, o_wall)) {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x = x + sign(hsp);
        }
        hsp = 0;
    } else {
        // Create smoke only when moving at significant speed
        if (abs(hsp) > 0.5) {
            instance_create_layer(x, y, "Player", o_smoke);
        }
    }
    x = x + hsp;
    
    // Vertical collision - Wall check
    var landed = false;
    if (place_meeting(x, y + vsp, o_wall)) {
        // Debug collision state
        show_debug_message("Wall Collision - VSP: " + string(vsp) + " Position: " + string(x) + "," + string(y));
        
        // Resolve collision
        while (!place_meeting(x, y + sign(vsp), o_wall)) {
            y = y + sign(vsp);
        }
        vsp = 0;
        landed = (vsp > 0); // Only count as landed if we were falling
    }
    // Vertical collision - One-way platform check (only when falling)
    else if (vsp > 0 && place_meeting(x, y + vsp, o_oneway) && !place_meeting(x, y, o_oneway)) {
        // Debug collision state
        show_debug_message("Platform Collision - VSP: " + string(vsp) + " Position: " + string(x) + "," + string(y));
        
        // Resolve collision
        while (!place_meeting(x, y + 1, o_oneway)) {
            y = y + 1;
        }
        vsp = 0;
        landed = true; // We've landed on a platform
    }
    
    // Apply landing effects if we actually landed
    if (landed) {
        sprite_index = s_mouse_stun;
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
        
        // Force hsp to 0 when landing
        hsp = 0;
    }
    
    y = y + vsp;
    
    // Stop completely if barely moving and on ground
    if (abs(hsp) < 0.1 && (place_meeting(x, y+1, o_wall) || place_meeting(x, y+1, o_oneway))) {
        hsp = 0;
        done = 1; // Set to done state once stopped
    }
}

// Handle transformation timer
if (timer > 0) {
    timer--;
} else {
    // Create new mouse instance
    var new_mouse = instance_create_layer(x, y, layer, o_mouse);
    with (new_mouse) {
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
if (done == 1) {
    // Force the stun sprite & speed to 0
    sprite_index = s_mouse_stun;
    image_speed = 1;
    hsp = 0;
    // Possibly skip further knockback code
    exit; 
}

// Add this helper function at the start of your game
// (usually in a Script file or in a controller object)
function approach(current, target, amount) {
    if (current < target) {
        return min(current + amount, target);
    } else {
        return max(current - amount, target);
    }
}