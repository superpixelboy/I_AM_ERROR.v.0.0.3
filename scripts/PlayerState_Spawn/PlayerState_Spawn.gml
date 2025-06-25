function PlayerState_Spawn() {
    vsp = 0; // Cancel any inherited vertical speed

    if (spawn_timer > 0) {
        spawn_timer--;
    } else {
        // Wait until we are grounded
        if (place_meeting(x, y+1, o_wall) || place_meeting(x, y+1, o_oneway)) {
            state = PLAYERSTATE.FREE;
            exit;
        }
    }

    // Optional: show idle sprite during spawn
    sprite_index = s_player_idle;
    image_speed = 1;
}
