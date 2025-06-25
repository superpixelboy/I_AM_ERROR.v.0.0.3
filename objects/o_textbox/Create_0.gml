/// @description Insert description here
// You can write your code in this editor
messages = ds_list_create();
messageID = 0;

// Current message
messageText = "";
messageChar = 0;
messageSpeed = 0.3;

// Message properties
enum MSG {
	TEXT,
	NAME,
	IMAGE
}

//GUI Dimensions
var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

//Textbox dimensions
height = floor(_guiH * 0.45);
width = _guiW;

// Position on Screen
x = 0;
y= _guiH - height;

//other properties
padding = 8;