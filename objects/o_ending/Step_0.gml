/// @description 

//move player towards center
layer_x("TitleAssets", min(layer_get_x("TitleAssets")+0.5, display_get_gui_width()*.27));

//progress Text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//next Line
if (letters >= length) && (keyboard_check_pressed(vk_anykey))
{
	if (currentline+1 == array_length_1d(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	else{
		currentline++;
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}