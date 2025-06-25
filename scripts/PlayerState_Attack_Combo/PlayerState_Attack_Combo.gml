function PlayerState_Attack_Combo(){
	hsp = 0;
	vsp = 0;

	ProcessAttack(s_player_combo,s_player_attackHB,2)
	
	
	if (key_attack) && (image_index > 1)
	{
		isCombo = 1;
	}
	
	if (animation_end())
	{
		if(isCombo){
			state = PLAYERSTATE.ATTACK_KNOCKBACK;
		}
		else{
			sprite_index = s_player_idle;
			state = PLAYERSTATE.FREE;
			
		}
		isCombo = 0;
	}
}