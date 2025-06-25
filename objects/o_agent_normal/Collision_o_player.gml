/// @description Insert description here
// You can write your code in this editor
if(other.key_up){
	if (!instance_exists(o_textbox)){
		//create
		var _tb = instance_create_layer(0,0, "Portraits", o_textbox);
		
		//Add messages to textbox's list
		var _list = _tb.messages;
		
		for (var i=0; i<array_length_1d(msg); i++){
			var _arr = msg[i];
			
			ds_list_add(_list, _arr);
		}
	}
}
