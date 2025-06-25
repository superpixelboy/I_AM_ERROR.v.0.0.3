function PlayerState_Small_Hit() {
    // Set hit animation
    if (sprite_index != s_player_small_hit) {
        sprite_index = s_player_small_hit;
        image_speed = 1;
        image_index = 0;
    }

    // Calculate knockback direction  
    direction = point_direction(other.x, other.y, x, y);

    if (hitFromR > 0) {
        hsp = -lengthdir_x(3, direction); // Increase knockback distance
    } else {
        hsp = lengthdir_x(3, direction);
    }
    vsp = lengthdir_y(3, direction) - 0.5;

    // Horizontal movement and collision
    if (!place_meeting(x + hsp, y, o_wall)) {
        x += hsp;
    } else {
        while (!place_meeting(x + sign(hsp), y, o_wall)) {
            x += sign(hsp);
        }
        hsp = 0; // Stop horizontal movement upon collision
    }

    // Vertical movement and collision
    if (!place_meeting(x, y + vsp, o_wall)) {
        y += vsp;
    } else {
        while (!place_meeting(x, y + sign(vsp), o_wall)) {
            y += sign(vsp);
        }
        vsp = 0; // Stop vertical movement upon collision
    }

    // End hit state when animation finishes
    if (animation_end()) {
        image_speed = 1;
        sprite_index = s_player_idle;
        state = PLAYERSTATE.FREE;
    }
}
