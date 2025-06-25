/// @description Insert description here
// You can write your code in this editor
//set text font
draw_set_font(f_sign);
var halfw = display_get_gui_width() * 0.5;
// Draw textbox
draw_sprite_ext(s_prologue_screen,0,x-halfw,display_get_gui_height()*0.25, 1,1,0, c_white, alpha);
