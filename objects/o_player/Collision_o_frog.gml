// @desc DIE

/* OLD
instance_change(o_player_dead,true);

direction = point_direction(other.x,other.y,x,y);
hsp = lengthdir_x(6,direction);
vsp = lengthdir_y(4,direction)-10;

if(sign(hsp)!=0) image_xscale = sign(hsp);
*/

if(isInvincible<=0&&!isBlocking&&isFastFall==0){
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