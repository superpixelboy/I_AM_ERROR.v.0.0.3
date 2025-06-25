
if(isInvincible<=0&&!isBlocking&&isFastFall==0&&other.sprite_index == s_mouse_walk&&sprite_index != s_player_divekick){
	global.hp-=20;
	isInvincible = 60;
	mask_index =s_player_idle;
	state = PLAYERSTATE.SMALL_HIT;
	audio_play_sound(sn_punch1,5,false);
		
}
else{
//	global.stamina-=10;
}
if(other.x>x){
	hitFromR =1;
}
else{
	hitFromR = 0;
}

if(global.hp<=0) KillPlayer();