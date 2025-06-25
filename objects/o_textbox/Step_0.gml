/// @description Insert description here
// You can write your code in this editor
var _arr = messages[| messageID];

var _text = _arr[MSG.TEXT];

//Get message string
messageText = string_copy(_text, 1, messageChar);

//String not fully drown
if(messageChar <= string_length(_text)) messageChar += messageSpeed;

else if (keyboard_check_pressed(vk_anykey))||(gamepad_button_check_pressed(0,gp_face1)){
	if(messageID < ds_list_size(messages) - 1){
		messageID++;
		messageChar = 0;
	}
	//Close textbox
	else{
		instance_destroy();
	}
}