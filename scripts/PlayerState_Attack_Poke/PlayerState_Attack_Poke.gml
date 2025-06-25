function PlayerState_Attack_Poke()
{
	hsp = 0;
	vsp = 0;

	
	ProcessAttack(s_player_poke,s_player_attackHB,1)
	

	
	if (key_attack) && (image_index > 1)
	{
		isCombo = 1;
	}
	
	if (animation_end())
	{
		if(isCombo){
			state = PLAYERSTATE.ATTACK_COMBO;
			
		}
		else{
			sprite_index = s_player_idle;
			state = PLAYERSTATE.FREE;
		}
		isCombo = 0;
	}
}