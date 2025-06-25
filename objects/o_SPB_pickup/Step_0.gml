/// @description Insert description here
// You can write your code in this editor
y = ystart + sin(get_timer()/500000)*5;
if image_alpha ==0 timer--;


if(timer<=0){
	global.story_stage = Scene.INTRO_SHOW_SPB;
	StoryManager_CheckProgress();
	instance_destroy();
}