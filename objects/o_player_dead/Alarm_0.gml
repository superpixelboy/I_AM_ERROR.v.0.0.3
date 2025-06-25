/// @desc Reset Gamspeed
game_set_speed(60,gamespeed_fps);

if(room!=RoomHC){
	SlideTransition(TRANS_MODE.GOTO,room);
	global.hp=global.maxhp;
}
else{
	SlideTransition(TRANS_MODE.GOTO,rSurvival_End);
}