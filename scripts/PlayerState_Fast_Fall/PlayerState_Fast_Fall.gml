function PlayerState_Fast_Fall()
{
    // ---------- State‑init things ----------
    isFastFall = 1;

    // Only set the default sprite if we're NOT in the middle of the land
    // or rise animations – otherwise we'd overwrite them every step.
    if (sprite_index != s_player_fastfall_land
        && sprite_index != s_player_fastfall_up)
    {
        sprite_index = s_player_fastfall;
        mask_index   = s_player_fastfall;
    }

    // Face the move direction
    if (hsp != 0) image_xscale = sign(hsp);

    // ---------- Horizontal movement ----------
    var move = key_right - key_left;
    hsp      = move * walksp / 2;

    if (place_meeting(x + hsp, y, o_wall))
    {
        while (!place_meeting(x + sign(hsp), y, o_wall))
            x += sign(hsp);
        hsp = 0;
    }
    x += hsp;

    // ---------- One‑way / drop‑through bookkeeping ----------
    var falling_through  = false;
    var is_on_platform   = place_meeting(x, y + 1, o_oneway);

    if (key_duck && place_meeting(x, y + vsp, o_oneway) && !skiponeway)
    {
        skiponeway     = 1;
        falling_through = true;
    }

    // ---------- Pogo‑bounce off enemies ----------
    if (place_meeting(x, y + vsp / 2, p_killable))
    {
        ffTimer = 0;

        // Bounce upward with light easing
        vsp = (vsp > 0) ? lerp(vsp, -15, 1.3) : -15;

        // Play feedback & apply attack
        audio_sound_pitch(sn_land, choose(0.8, 1, 1.2));
        audio_play_sound(sn_land, 5, false);
        ProcessAttack(s_player_fastfall, s_player_fastfallHB, 5);

        //-----------------------------------------
        // NEW  ✧  trigger the “land” animation
        //-----------------------------------------
        sprite_index = s_player_fastfall_land;
        image_index  = 0;
        image_speed  = 1;
        //-----------------------------------------
    }
    // ---------- Ground / platform collisions ----------
    else if (place_meeting(x, y + vsp, o_wall))
    {
        while (!place_meeting(x, y + sign(vsp), o_wall))
            y += sign(vsp);

        vsp        = 0;
        image_speed = 1;
        isFastFall = 0;

        repeat (20)
        {
            with (instance_create_layer(x, bbox_bottom, "Bullets", o_dust))
                vsp = -0.02;
        }
        state = PLAYERSTATE.HARD_LANDING;
    }
    else if (place_meeting(x, y + vsp, o_oneway) && !skiponeway)
    {
        while (!place_meeting(x, y + sign(vsp), o_oneway))
            y += sign(vsp);

        vsp        = 0;
        image_speed = 1;
        isFastFall = 0;

        repeat (20)
        {
            with (instance_create_layer(x, bbox_bottom, "Bullets", o_dust))
                vsp = -0.02;
        }
        state = PLAYERSTATE.HARD_LANDING;
    }
    else
    {
        // ---------- Airborne physics ----------
        if (skiponeway && !is_on_platform && !place_meeting(x, y + 5, o_oneway))
            skiponeway = 0;

        // Ease‑in / ease‑out gravity
        if (vsp < 0)
            vsp = lerp(vsp,  1, 0.20);  // slowing near apex
        else
            vsp = lerp(vsp,  8.5, 0.10); // speeding up when falling

        ffTimer += 0.1;
    }

    //---------------------------------------------
    // NEW  ✧  sprite transitions after the bounce
    //---------------------------------------------
    // 1) Once the “land” animation finishes, decide whether we're going up or down
    if (sprite_index == s_player_fastfall_land && image_index >= image_number - 1)
    {
        if (vsp < 0)  // rising
        {
            sprite_index = s_player_fastfall_up;
            image_index  = 0;
        }
        else          // somehow still falling
        {
            sprite_index = s_player_fastfall;
            image_index  = 0;
        }
    }
    // 2) While using the “up” sprite, swap back when we start descending
    else if (sprite_index == s_player_fastfall_up && vsp >= 0)
    {
        sprite_index = s_player_fastfall;
        image_index  = 0;
    }
    //---------------------------------------------

    y += vsp;
}
