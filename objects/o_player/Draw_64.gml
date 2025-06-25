
if (state == PLAYERSTATE.RECEIVE_ITEM) {
    var gui_w = display_get_gui_width();
    var gui_h = display_get_gui_height();

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

  //  draw_text(gui_w * 0.5, gui_h * 0.2, "Got Item!");
   draw_sprite_ext(s_UI_got_item, 0, gui_w * 0.5, gui_h * 0.4, 2, 2, 0, c_white, 1);
    draw_sprite_ext(global.item_sprite, 0, gui_w * 0.5, gui_h * 0.4, 2, 2, 0, c_white, 1);
    draw_sprite_ext(global.item_sprite_name, 0, gui_w * 0.5, gui_h * 0.4, 2, 2, 0, c_white, 1);
  
  //  draw_text(gui_w * 0.5, gui_h * 0.3, global.item_name);
}
