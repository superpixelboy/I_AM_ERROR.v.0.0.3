//get player intputs
if (dialogue_buffer > 0) {
    dialogue_buffer--;
    exit; // ignore player input
}

if(hascontrol){
	key_left = keyboard_check(vk_left)||keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right)||keyboard_check(ord("D"));
	key_duck = keyboard_check(vk_down)||keyboard_check(ord("S"));
	key_jump = keyboard_check_pressed(vk_space);
	key_attack = mouse_check_button(mb_left)||keyboard_check(vk_lcontrol);
	key_up = keyboard_check(vk_up)||keyboard_check(ord("W"));
	key_spattack = mouse_check_button(mb_right)||keyboard_check(ord("X"));
	key_block = keyboard_check(vk_shift);
	key_ult = keyboard_check(vk_alt)||keyboard_check(ord("R"));
	key_assist = keyboard_check(ord("F"));
	
	if(key_left)||(key_right)||(key_jump)||(key_duck)||(key_block){
		controller = 0;
	}

	if (abs (gamepad_axis_value(0,gp_axislh)) > 0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}
	if (abs (gamepad_axis_value(0,gp_axislv)) > 0.2)
	{
		key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
		key_duck = max(gamepad_axis_value(0,gp_axislv),0);

	}
	

	if(gamepad_button_check_pressed(0,gp_face1))
	{
		controller = 1;
		key_jump=1;
	}
	if(gamepad_button_check_pressed(0,gp_face3))
	{
		controller = 1;
		key_attack =1;
		
	}
	if(gamepad_button_check_pressed(0,gp_face4))
	{
		controller = 1;
		key_spattack =1;
	}
	if(gamepad_button_check_pressed(0,gp_shoulderr))
	{
		controller = 1;
		key_ult =1;
	}
	if(gamepad_button_check_pressed(0,gp_paddler))
	{
		controller = 1;
		key_ult =1;
	}
		if(gamepad_button_check_pressed(0,gp_shoulderl))
	{
		controller = 1;
		key_assist =1;
	}
	if(gamepad_button_check_pressed(0,gp_paddlel))
	{
		controller = 1;
		key_assist =1;
	}
	if(gamepad_button_check(0,gp_face2))
	{
		    key_up = 0;
		  key_duck = 0;
		  vsp = 0; // Ensure no vertical speed is applied
		controller = 1;
		key_block =1;
		//show_debug_message("key_block: " + string(key_block) + ", key_up: " + string(key_up) + ", key_duck: " + string(key_duck));
show_debug_message("State: BLOCK | y: " + string(y) + " | vsp: " + string(vsp) + " | key_block: " + string(key_block));

	}
	

}
else{
	key_right = 0;
	key_left = 0;
	key_jump = 0;

}
 // D-pad inputs
    if (gamepad_button_check(0, gp_padl)) {
        key_left = 1;  // D-pad left
        controller = 1;
    }
    if (gamepad_button_check(0, gp_padr)) {
        key_right = 1;  // D-pad right
        controller = 1;
    }
    if (gamepad_button_check(0, gp_padu)) {
        key_up = 1;  // D-pad up
        controller = 1;
    }
    if (gamepad_button_check(0, gp_padd)) {
        key_duck = 1;  // D-pad down
        controller = 1;
    }

switch (state){
	case PLAYERSTATE.FREE: PlayerState_Free(); break;
	case PLAYERSTATE.ASSIST: PlayerState_Assist(); break;
	case PLAYERSTATE.ATTACK_POKE: PlayerState_Attack_Poke(); break;
	case PLAYERSTATE.SP_BLAST: PlayerState_SP_Blast(); break;
	case PLAYERSTATE.SP_BLAST2: PlayerState_SP_Blast2(); break;
	case PLAYERSTATE.SP_BLASTAIR1: PlayerState_SP_BlastAir1(); break;
	case PLAYERSTATE.SP_BLASTAIR2: PlayerState_SP_BlastAir2(); break;
	case PLAYERSTATE.SP_SWEEP: PlayerState_SP_Sweep(); break;
	case PLAYERSTATE.ATTACK_COMBO: PlayerState_Attack_Combo(); break;
	case PLAYERSTATE.ATTACK_KNOCKBACK: PlayerState_Attack_KnockBack(); break;
	case PLAYERSTATE.SMALL_HIT: PlayerState_Small_Hit(); break;
	case PLAYERSTATE.BLOCK: PlayerState_Block(); break;
	case PLAYERSTATE.DUCK_POKE: PlayerState_Duck_Poke(); break;
	case PLAYERSTATE.FAST_FALL: PlayerState_Fast_Fall(); break;
	case PLAYERSTATE.HARD_LANDING: PlayerState_Hard_Landing(); break;
	case PLAYERSTATE.JUMP_ATTACK1: PlayerState_Jump_Attack1(); break;
	case PLAYERSTATE.JUMP_ATTACK2: PlayerState_Jump_Attack2(); break;
	case PLAYERSTATE.JUMP_ATTACK3: PlayerState_Jump_Attack3(); break;
	case PLAYERSTATE.DASH: PlayerState_Dash(); break;
	case PLAYERSTATE.SP_UPPERCUT: PlayerState_SP_Uppercut(); break;
	case PLAYERSTATE.DUCK: PlayerState_Duck(); break;
	case PLAYERSTATE.SP_FIREBALL: PlayerState_SP_Fireball(); break;
	case PLAYERSTATE.DIVEKICK: PlayerState_Divekick(); break;
	case PLAYERSTATE.JUMP: PlayerState_Jump(); break;
	case PLAYERSTATE.DIALOGUE: PlayerState_Dialogue(); break;
	case PLAYERSTATE.RECEIVE_ITEM: PlayerState_Receive_Item(); break;
	case PLAYERSTATE.SPAWN: PlayerState_Spawn(); break;
	
}


//Handle Invinvibility
if(isInvincible>0){
	isInvincible--;
	image_alpha = 0.5;
}
else{
	if(healTimer==0){
		image_alpha =1;
	}
}

//handle Health update
if(global.hp<global.maxhp){
	global.hp+=0.02+healthMod;
}
//handle STAM update
if(global.stamina<global.maxstamina&&stamrefill==true){
	global.stamina+=0.1;
}
if(global.stamina<0){
	global.stamina =0;
}
//detect Falling
global.player_falling=vsp;
//dash cooldown
if(canDash>0){
		canDash--;
	}
	else{
		canDash=0;
	}
	//block cooldown
if(blockCooldown>0){
		blockCooldown--;
	}
	else{
		blockCooldown=0;
	}
	
	//Combo Timer
	if(global.combotimer>0){
		global.combotimer--;
	}
	else{
		global.combotimer=0;
		global.combolevel=0;
	}
	
//heal stuff
if(healTimer>0){
	healTimer--;
	healthMod=0.08;
	instance_create_layer(x+random_range(-5,+5), y+35+random_range(-3,+3), "Walls", o_heal_plus)
	
	if(healthFadeOut==1){
		if(image_alpha>0.5){
			image_alpha-=0.02;
		}
		else{
			healthFadeOut=0;
		}
	}
	else{
		
		if(image_alpha<=1){
			image_alpha+=0.02;
		}
		else{
			healthFadeOut=1;
		}
	}
}
else{
	healthFadeOut=1;
	image_alpha=1;
	healTimer=0;
	healthMod=0;
}
//Assist Time
if(global.thisAssistTime>0)global.thisAssistTime--;
else global.thisAssistTime=0;
//show_debug_message("assist time = "+string(global.thisAssistTime/60));

//Level counter
if(global.xp>=25&&global.playerLevel<2){
	LevelUp();
}
else if(global.xp>=75&&global.playerLevel<3){
	LevelUp();
}
else if(global.xp>=150&&global.playerLevel<4){
	LevelUp();
}
else if(global.xp>=250&&global.playerLevel<5){
	LevelUp();
}

//Dialogue and Interacting
global.interactKey = key_up;
//dialouge buffer

//Input Cooldown for handling double triggering doors and stuff
if(global.inputCoolDown>=0){
	global.inputCoolDown--;
}

//apply tv tinting
Apply_TV_Tint();

//show_debug_message("player Recieve Item:"+string(global.isRecievingItem)); 