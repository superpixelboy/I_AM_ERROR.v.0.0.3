/// @desc Control Menu

//Items ease in
//menu_x += (menu_x_target - menu_x) / menu_speed;

if(isVisible){
	menu_x= menu_x_target;
}
else{
	menu_x = gui_width*5;
}

if(menu_control)
{
	if(keyboard_check_pressed(vk_up)||keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if(menu_cursor >= menu_items) menu_cursor = 0;
	}
	
		if(keyboard_check_pressed(vk_down)||keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if(menu_cursor < 0 ) menu_cursor = menu_items-1;
	}
	
	if(keyboard_check_pressed(vk_enter)||keyboard_check_pressed(vk_space))
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
			audio_play_sound(sn_big_land,5,false);
		menu_control = false;
	}
	
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if (mouse_y_gui < menu_y) && (mouse_y_gui > menu_top)
	{
		menu_cursor = (menu_y - mouse_y_gui) div (menu_itemheight * 1.5);
		
		if(mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
			audio_play_sound(sn_big_land,5,false);
		menu_control = false;
		}
		
	
	}

// Gamepad thumbstick navigation
// Gamepad thumbstick navigation
var stick_y = gamepad_axis_value(0, gp_axislv);  // Get left stick vertical axis
if (stick_y < -0.5 && !stick_pressed_down) {  // Downward movement
    menu_cursor++;
    if (menu_cursor >= menu_items) menu_cursor = 0;  // Wrap to top
    stick_pressed_down = true;  // Prevent repeated triggers
} else if (stick_y > 0.5 && !stick_pressed_up) {  // Upward movement
    menu_cursor--;
    if (menu_cursor < 0) menu_cursor = menu_items - 1;  // Wrap to bottom
    stick_pressed_up = true;  // Prevent repeated triggers
} else if (stick_y > -0.5 && stick_y < 0.5) {
    // Reset stick press flags when stick is neutral
    stick_pressed_up = false;
    stick_pressed_down = false;
}

	if(gamepad_button_check_pressed(0,gp_face1))
	{
		menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
			audio_play_sound(sn_big_punch,5,false);
		menu_control = false;
	}
	if(gamepad_button_check_pressed(0,gp_face3))
	{
			menu_x_target = gui_width+200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
			audio_play_sound(sn_big_land,5,false);
		menu_control = false;
	}
	
}

if (menu_x > gui_width+150) && (menu_committed != -1)
{

	switch (menu_committed)
	{
		//case 2:  SlideTransition(TRANS_MODE.NEXT); break;
		case 2:  room_goto(rIntroText); break;
		case 1: audio_stop_all(); room_goto(IntroBookstore);  break;
		
		/*{
			
					if(!file_exists(SAVEFILE))
					{
						 SlideTransition(TRANS_MODE.NEXT); break;
					}
					else{
						var file = file_text_open_read(SAVEFILE);
						var target = file_text_read_real(file);
						global.kills = file_text_read_real(file);
						global.hasSP = file_text_read_real(file);
						file_text_close(file);
						SlideTransition(TRANS_MODE.GOTO, target);
						
					}
				}
				break;*/
		case 0: game_end(); break;
	}
}