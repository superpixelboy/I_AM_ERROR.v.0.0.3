/// @desc move to next room

if(other.key_up&&global.inputCoolDown<=0&&global.story_stage == ""){
   
	global.inputCoolDown=15;
	global.entry_label = "";
     room_goto(rMenu);
    
}


/*
if(keyboard_check_pressed(ord("W"))||keyboard_check_pressed(vk_up))
	{
	if(playSound!=0){
		audio_play_sound(sn_jump1,5,false);
		playSound = 0;
	}

	with (o_player)
	{
		if(hascontrol)
		{
			hascontrol = false;
			SlideTransition(TRANS_MODE.GOTO,other.target);
		
		}
	}
}
*/
/*
if(other.key_up){
    /// Example: Step or Collision Event in an exit object
    if (global.tier1_count < global.TIER1_REQUIRED) {
        // We still need Tier 1 rooms
        var _rIndex = irandom(array_length(global.tier1_rooms) - 1);
        var _nextRoom = global.tier1_rooms[_rIndex];
        
        // Remove the chosen room from the array so we don't pick it again
        array_delete(global.tier1_rooms, _rIndex, 1);
        
        // Transition to the chosen room
        room_goto(_nextRoom);
        
        // Increase the count to track progress
        global.tier1_count += 1; 
    } 
	else if(global.gate1<1){
	
        var _nextRoom = rW1T1_gate;
        
       
        
        // Transition to the chosen room
        room_goto(_nextRoom);
        
        // Increase the count to track progress
        global.gate1 += 1; 
	}
	else if (global.tier2_count < global.TIER2_REQUIRED) {
        // We still need Tier 1 rooms
        var _rIndex = irandom(array_length(global.tier2_rooms) - 1);
        var _nextRoom = global.tier2_rooms[_rIndex];
        
        // Remove the chosen room from the array so we don't pick it again
        array_delete(global.tier2_rooms, _rIndex, 1);
        
        // Transition to the chosen room
        room_goto(_nextRoom);
        
        // Increase the count to track progress
        global.tier2_count += 1; 
    }else {
     
        var _nextRoom = IntroBookstore;
        
 
        
        // Transition to the chosen room
        room_goto(_nextRoom);
    }
}
*/