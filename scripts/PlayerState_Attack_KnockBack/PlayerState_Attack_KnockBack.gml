function PlayerState_Attack_KnockBack() {
    hsp = 0;
    vsp = 0;

    // Call ProcessAttack with safeguards against infinite loops
    ProcessAttack(s_player_knockback, s_player_knockbackHB, 3);

    // Debug current sprite and animation state
  //  show_debug_message("Sprite Index: " + string(sprite_index));
 //   show_debug_message("Animation End: " + string(animation_end()));

    // Check for animation end and transition to FREE state
    if (animation_end()) {
        state = PLAYERSTATE.FREE; 
        sprite_index = s_player_idle;
   //     show_debug_message("Transitioned to PLAYERSTATE.FREE");
    }
}
