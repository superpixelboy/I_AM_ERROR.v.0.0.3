/// @description Insert description here
// You can write your code in this editor
	audio_stop_all();
image_speed=0;
if(global.kills>=50){
	image_index=1;


	audio_play_sound(sn_moon, 1000, true);
}
else{
	image_index=0;
	audio_play_sound(sn_judgeDoom, 1000, true);
}
