/// Step Event or Knockback Script for the small frog knockback

if (done == 0) {
    // Gravity
    vsp += grv;

    // -------------------------------------
    // Horizontal collision with o_wall
    // -------------------------------------
    if (place_meeting(x + hsp, y, o_wall)) {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x += sign(hsp);
        }
        hsp = 0;
    }
    else {
        // Create smoke if moving
        if (hsp != 0) {
            with (instance_create_layer(x, y, "Player", o_smoke)) {
                // purely cosmetic
            }
        }
    }
    x += hsp;

    // -------------------------------------
    // Vertical collision
    // -------------------------------------
    // 1) First check normal wall
    if (place_meeting(x, y + vsp, o_wall)) {
        // If it hits a wall from above/below, transform immediately
        with (instance_create_layer(x, y, layer, o_frog_gun)) {
            hp = other.hp;
            if (sign(other.hsp) != 0) {
                image_xscale = sign(other.hsp) * other.size;
            }
            image_yscale = other.size;
            size = other.size;
        }
        instance_destroy();
    }
    else {
        // 2) Now handle one-way landing if falling from above
        if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway)) {
            // Snap to top of one-way
            while (!place_meeting(x, y + 1, o_oneway)) {
                y += 1;
            }

            // Transform on landing
            with (instance_create_layer(x, y, layer, o_frog_gun)) {
                hp = other.hp;
                if (sign(other.hsp) != 0) {
                    image_xscale = sign(other.hsp) * other.size;
                }
                image_yscale = other.size;
                size = other.size;
            }
            instance_destroy();
        }
        else {
            // Otherwise, just keep moving
            y += vsp;
        }
    }
}

// -------------------------------------
// Timer-based transformation into o_frog
// -------------------------------------
timer--;
if (timer < 0) {
    with (instance_create_layer(x, y, layer, o_frog)) {
        hp = other.hp;
        if (sign(other.hsp) != 0) {
            image_xscale = sign(other.hsp) * other.size;
        }
        image_yscale = other.size;
        size = other.size;
    }
    instance_destroy();
}
