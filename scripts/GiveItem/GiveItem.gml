 /// GiveItem(name, sprite, followup_dialogue)
function GiveItem(){
	show_debug_message("Give Item Called!");
	global.item_name = argument0;
	global.item_sprite = argument1;
	global.item_dialogue = argument2;
	global.item_sprite_name = argument3;
	global.item_timer = room_speed * 1.5;
	global.isRecievingItem=true;
	
	with (o_player) {
	    state = PLAYERSTATE.RECEIVE_ITEM;
	    dialogue_started = false;
	}
}
