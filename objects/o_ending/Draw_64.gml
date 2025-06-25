draw_set_color(c_black)
draw_rectangle(0,0, display_get_gui_width(),128,false);
draw_rectangle(0,display_get_gui_height()-128, display_get_gui_width(),display_get_gui_height(),false);

DrawSetText(c_black, f_sign, fa_center, fa_top);
draw_text(display_get_gui_width()*0.5+2, display_get_gui_height()*0.5+2, text);
draw_set_color(c_white);
draw_text(display_get_gui_width()*0.5, display_get_gui_height()*0.5, text);
