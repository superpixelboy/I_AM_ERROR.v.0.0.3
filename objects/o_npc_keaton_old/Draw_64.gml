if (isInConvo) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();
    var line = dialogue[currentline];
    var sprite = line.portrait;

    draw_sprite_stretched(s_textbox_right, 0, 0, 0, gui_w, gui_h);

    var text_x = gui_w * 0.5;
    var text_y = gui_h * 0.15;

    draw_set_color(c_gray);
    draw_text(text_x + 2, text_y + 2, text);

    draw_set_color(c_black);
    draw_text(text_x, text_y, text);

    var left_x = gui_w - sprite_get_width(sprite) / 3;
    var right_x = 120;
    var portrait_y = gui_h - 256;

    draw_sprite_ext(sprite, 0, left_x, portrait_y, 1, 1, 0, c_white, 1);
    draw_sprite_ext(s_portrait_null_normal, 0, right_x, portrait_y, 1, 1, 0, c_white, 0.5);
}
