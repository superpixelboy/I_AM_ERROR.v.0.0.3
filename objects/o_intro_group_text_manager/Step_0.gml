/// @description Insert description here
// You can write your code in this editor

if(thisClickCoolDown<=0){
	 if (!keyboard_check(global.dialogue_input_detected)||mouse_check_button(mb_left)||gamepad_button_check_pressed(0,gp_face1)) {
		
		if(thisClickCoolDown!=clickCoolDown){
			if(global.groupChatNum==0||global.groupChatNum==2||global.groupChatNum==9||global.groupChatNum==12)
			{
				audio_play_sound(sn_phone_text_send, 5, false);
			}
			else{
				if(global.groupChatNum<13){
				   audio_play_sound(sn_phone_text_recieve, 5, false);
				}
			}
		}
		thisClickCoolDown=clickCoolDown;
		global.groupChatNum++;
		
		if(global.groupChatNum>=14){
	      room_goto(IntroBookstore);
		}
		
	}
}
else{
	thisClickCoolDown--;
}