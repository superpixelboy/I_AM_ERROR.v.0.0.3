if (instance_exists(o_text)&&global.convoTag=="Mandy") {
	// === GUI Setup ===
	var gui_w = display_get_gui_width();
	var gui_h = display_get_gui_height();

	// === Portraits ===
	var sprite = dialogue[currentline].portrait;
	var sprite_w = sprite_get_width(sprite);
	var left_x = gui_w - sprite_w / 3;
	var right_x = 120;
	var portrait_y = gui_h - 256;
	
	// === Who's speaking? ===
	var speaker_is_null = (sprite == s_portrait_null_normal||sprite == s_portrait_null_normal_question||sprite == s_portrait_null_normal_smile);
	var textbox_sprite = speaker_is_null ? s_textbox_left : s_textbox_right;

	// === Draw speech bubble (fullscreen sprite with transparent background)
draw_sprite_stretched(textbox_sprite, 0, 0, 0, display_get_gui_width(), display_get_gui_height());


	// === Text position (centered within the box area on the sprite)
	var text_x = gui_w * 0.5;
	var text_y = gui_h * 0.15; // adjust based on your box art!

	DrawSetText(c_gray, f_menu, fa_center, fa_middle);
	draw_text(text_x + 2, text_y + 2, text); // shadow
	draw_set_color(c_black);
	draw_text(text_x, text_y, text);



	var speaker_is_null = (sprite == s_portrait_null_normal||sprite == s_portrait_null_normal_question||sprite == s_portrait_null_normal_smile);

	if (speaker_is_null) {
	    draw_sprite_ext(npc_portrait, 0, left_x, portrait_y, 1, 1, 0, c_white, 0.5);
	    draw_sprite_ext(sprite, 0, right_x, portrait_y, 1, 1, 0, c_white, 1);
	} else {
	    draw_sprite_ext(sprite, 0, left_x, portrait_y, 1, 1, 0, c_white, 1);
	    draw_sprite_ext(s_portrait_null_normal, 0, right_x, portrait_y, 1, 1, 0, c_white, 0.5);
	}
}
