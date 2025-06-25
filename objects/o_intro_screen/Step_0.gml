/// @description Insert description here
// You can write your code in this editor

if(sprite_index!=s_intro_screen_repeat&&image_index>20){
	if(!audioLoop){
		audio_play_sound(sn_glitch_intro_loop, 1000, true);
		audioLoop=true;
	}
}
if(animation_end()&&sprite_index!=s_intro_screen_repeat){
	with (o_menu) {
		isVisible = true;
	}
	sprite_index=s_intro_screen_repeat;
}

if(sprite_index==s_intro_screen_repeat){
	if(image_index==random_range(1,20)){
		image_speed=random_range(1,5);
		image_index=random_range(0,6)
	}
}