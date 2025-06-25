if (done == 0) {
    vsp = vsp + grv;
    
    // Horizontal collision
    if (place_meeting(x+hsp, y, o_wall)) {
        while(!place_meeting(x+sign(hsp), y, o_wall)) {
            x = x + sign(hsp);
        }
        hsp = 0;
    } else {
        // Create smoke effect when moving
        with (instance_create_layer(x, y, "Player", o_smoke)) {
            // Smoke effect logic
        }
    }
    x = x + hsp;
    
    // Vertical collision - Wall check
    if (place_meeting(x, y+vsp, o_wall)) {
        // Transform back to regular mouse upon hitting a wall
        with(instance_create_layer(x, y, layer, o_mouse)) {
            hp = other.hp;
            size = other.size;
            image_yscale = other.size;
            image_xscale = other.image_xscale;
        }
        instance_destroy();
    }
    // Vertical collision - One-way platform check (only when falling)
    else if (vsp > 0 && place_meeting(x, y+vsp, o_oneway) && !place_meeting(x, y, o_oneway)) {
        // Transform back to regular mouse upon landing on a platform
        with(instance_create_layer(x, y, layer, o_mouse)) {
            hp = other.hp;
            size = other.size;
            image_yscale = other.size;
            image_xscale = other.image_xscale;
        }
        instance_destroy();
    }
    
    y = y + vsp;
}

// Handle transformation timer
timer--;
if(timer < 0) {
    // Transform back to regular mouse when timer expires
    with(instance_create_layer(x, y, layer, o_mouse)) {
        hp = other.hp;
        size = other.size;
        image_yscale = other.size;
        image_xscale = other.image_xscale;
    }
    instance_destroy();
}