function PlayerState_Dialogue(){
	sprite_index=s_player_idle;
  // Disable movement and actions

    // Check for any input that should advance the dialogue
	
    global.dialogue_input_detected =
      /*  mouse_check_button_pressed(mb_left) ||
        mouse_check_button_pressed(mb_right) ||
        keyboard_check_pressed(vk_space) ||
        keyboard_check_pressed(vk_enter) ||
        gamepad_button_check_pressed(0, gp_face1) ||
        gamepad_button_check_pressed(0, gp_face2) ||
        gamepad_button_check_pressed(0, gp_face3) ||
        gamepad_button_check_pressed(0, gp_face4);*/
	key_left|| 
	key_right||
	key_duck||
	key_jump ||
	key_attack ||
	key_up ||
	key_spattack ||
	key_block ||
	key_ult ||
	key_assist
}