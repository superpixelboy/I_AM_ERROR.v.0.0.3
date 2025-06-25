/// @description Insert description here
// You can write your code in this editor
//KillPlayer();
with (other) instance_destroy();
if(isInvincible<=0&&!isBlocking){
	global.hp-=10;
	isInvincible = 30;
	state = PLAYERSTATE.SMALL_HIT;
	audio_play_sound(sn_punch1,5,false);
}
else{
	global.stamina-=10;
}

if(other.x>x){
	hitFromR =1;
}
else{
	hitFromR = 0;
}
if(global.hp<=0) KillPlayer();