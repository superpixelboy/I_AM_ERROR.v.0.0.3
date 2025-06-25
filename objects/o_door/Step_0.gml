/// @description Insert description here
// You can write your code in this editor
if instance_exists(o_player){
	if(point_in_circle(o_player.x,o_player.y,x,y,64)){
		if(alpha<1){
			alpha=alpha+0.04;
		}
		nearby = true;
	//	if(keyboard_check_pressed(ord("W"))||keyboard_check_pressed(vk_up))
	
	
		//SlideTransition(TRANS_MODE.GOTO,other.target);
		
	
	}
	else{
		nearby = false;
		if(alpha>0){
			alpha=alpha-0.06;
		}
	}
 }