/// @description Insert description here
// You can write your code in this editor
alpha=0;
timer=0;
image_alpha=0;

//GUI Dimensions
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();
//Textbox dimensions
height = floor(_guiH * 0.45);
width = _guiW;

// Position on Screen
x = 0;
y= _guiH - height;