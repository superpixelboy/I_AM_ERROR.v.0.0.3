if (instance_exists(o_text) && global.convoTag == "NPC") {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    var sprite = dialogue[currentline].portrait;
    var sprite_w = sprite_get_width(sprite);
    var left_x = gui_w - sprite_w / 3;
    var right_x = 185;
    var portrait_y = gui_h - 200;

    var speaker_is_null = (
        sprite == s_portrait_null_normal || 
        sprite == s_portrait_null_normal_question || 
        sprite == s_portrait_null_normal_smile
    );

    var textbox_sprite = speaker_is_null ? s_textbox_left : s_textbox_right;
    draw_sprite_stretched(textbox_sprite, 0, 0, 0, gui_w, gui_h);

    var text_x = gui_w * 0.075;
    var text_y = gui_h * 0.065;

    DrawSetText(c_ltgray, f_talk, fa_left, fa_top);
 //   draw_text(text_x + 2, text_y + 2, text);
	 draw_text_ext(text_x + 2, text_y, text, 40, 675); // 600 is max width in pixels

    draw_set_color(c_white);
  //  draw_text(text_x, text_y, text);
	 draw_text_ext(text_x, text_y, text, 40, 675);

    if (speaker_is_null) {
        draw_sprite_ext(npc_portrait, 0, left_x, portrait_y, 1, 1, 0, c_white, 0.5);
        draw_sprite_ext(sprite, 0, right_x, portrait_y, 1, 1, 0, c_white, 1);
    } else {
        draw_sprite_ext(sprite, 0, left_x, portrait_y, 1, 1, 0, c_white, 1);
        draw_sprite_ext(s_portrait_null_normal, 0, right_x, portrait_y, 1, 1, 0, c_white, 0.5);
    }
}
