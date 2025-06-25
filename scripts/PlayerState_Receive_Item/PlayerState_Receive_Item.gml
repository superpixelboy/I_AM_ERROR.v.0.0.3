 function PlayerState_Receive_Item(){
	 global.showHUD=false;
	global.isRecievingItem=true;
	 hsp = 0; vsp = 0; // freeze movement

	 if(sprite_index != s_player_got_item){
		show_debug_message("PlayerState_Receive Item Called!");
		canExitGotItem=false;
		alarm[1] = global.item_timer;
		 audio_play_sound(sn_fanfare, 5, false);
		 image_index=0;
	 }
	  sprite_index = s_player_got_item;
	 if (animation_end())
		{
				image_speed = 0;
		}
		
	/*
    if (!dialogue_started) {
        
        dialogue_started = true;
        alarm[1] = global.item_timer;
    }*/
	
	//check for exiting button after the alarm
	if(canExitGotItem){
		hascontrol=true;
		if global.dialogue_input_detected{
				global.isRecievingItem=false;
		//Check if there is addiotonal dialogue
			if(global.item_dialogue!=undefined){
				state = PLAYERSTATE.DIALOGUE;
				if(global.item_dialogue=="coffee"){
					CoffeeTrayDialogue();
				}
				else if(global.item_dialogue=="19XX"){
					MysteryGameDialogue();
				}
				else if(global.item_dialogue=="spb"){
					SPBDialogue();
				}
				else if(global.item_dialogue=="turned on spb"){
					room_goto(rMenu_1);
				}
			
			}
			else{
				 state = PLAYERSTATE.FREE;
			}
	
		}
	}
	
	//check for keys (move this later to o_player step?
	global.dialogue_input_detected =

	key_left|| 
	key_right||
	key_duck||
	key_jump ||
	key_attack ||
	key_up ||
	key_spattack ||
	key_block ||
	key_ult ||
	key_assist
   
}