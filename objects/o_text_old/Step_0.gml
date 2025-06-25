/// @dec Progress Text

letters += spd;
text_current = string_copy(text,1,letters);

draw_set_font(f_sign);

if(h == 0) h = string_height(text);
w = string_width(text_current);

//destroy when done
/*
if(letters >= length) && ((keyboard_check_pressed(vk_anykey))||(gamepad_button_check_pressed(0,gp_face1)))
{
	instance_destroy();
	with(o_camera) follow = o_player;
}
*/