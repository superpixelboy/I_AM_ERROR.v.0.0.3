/// @description Text Progression System
//move player towards center
layer_x("TitleAssets", min(layer_get_x("TitleAssets")+0.5, display_get_gui_width()*.27));

//progress Text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//Check for input from multiple sources
var input_detected = 
    mouse_check_button_pressed(mb_left) ||           // Left mouse click
    mouse_check_button_pressed(mb_right) ||          // Right mouse click
    gamepad_button_check_pressed(0, gp_face1) ||     // Gamepad A/Cross button
    gamepad_button_check_pressed(0, gp_face2) ||     // Gamepad B/Circle button
    gamepad_button_check_pressed(0, gp_face3) ||     // Gamepad X/Square button
    gamepad_button_check_pressed(0, gp_face4);       // Gamepad Y/Triangle button

//next Line
if (letters >= length) && (input_detected)
{
    if (currentline+1 == array_length_1d(endtext))
    {
        SlideTransition(TRANS_MODE.RESTART);
    }
    else
    {
        currentline++;
        letters = 0;
        length = string_length(endtext[currentline]);
    }
}