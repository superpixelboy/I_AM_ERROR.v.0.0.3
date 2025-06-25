/// @desc move to next room
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

if(other.key_up){
	//SlideTransition(TRANS_MODE.GOTO,rW1T3);
	
}
