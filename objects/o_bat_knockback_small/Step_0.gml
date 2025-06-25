/// o_bat_knockback_small Step Event

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
        // Create some smoke if we're moving horizontally
        if (hsp != 0) {
            instance_create_layer(x, y, "Player", o_smoke);
        }
    }
    x += hsp;

    // -------------------------------
    // Vertical collision with o_wall
    // -------------------------------
    if (place_meeting(x, y + vsp, o_wall)) {
        // If we collide with a wall from above or below, transform immediately
        with (instance_create_layer(x, y, layer, o_bat)) {
            hp = other.hp;
            if (sign(other.hsp) != 0) image_xscale = sign(other.hsp) * other.size;
            image_yscale = other.size;
            size = other.size;
        }
        instance_destroy();
    }
    else {
        // ----------------------------------
        // One-way platform collision from above
        // ----------------------------------
        // Only land if we are falling (vsp > 0) and we aren't already inside the one-way
        if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway)) {
            // Snap onto one-way
            while (!place_meeting(x, y + 1, o_oneway)) {
                y += 1;
            }
            vsp = 0;

            // Transform into normal bat
            with (instance_create_layer(x, y, layer, o_bat)) {
                hp = other.hp;
                if (sign(other.hsp) != 0) image_xscale = sign(other.hsp) * other.size;
                image_yscale = other.size;
                size = other.size;
            }
            instance_destroy();
        }
        else {
            // No collision or passing through → just keep moving vertically
            y += vsp;
        }
    }
}

// -------------------------------
// Timer-based transformation
// -------------------------------
timer--;
if (timer < 0) {
    with (instance_create_layer(x, y, layer, o_bat)) {
        hp = other.hp;
        if (sign(other.hsp) != 0) image_xscale = sign(other.hsp) * other.size;
        image_yscale = other.size;
        size = other.size;
    }
    instance_destroy();
}
