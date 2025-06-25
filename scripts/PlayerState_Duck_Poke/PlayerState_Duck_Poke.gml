function PlayerState_Duck_Poke(){
	hsp = 0;
	vsp = 0;

		image_speed = 1;

	ProcessAttack(s_player_duck_poke,s_player_attack_lowHB,4)

	

	
	if (animation_end())
	{
		sprite_index = s_player_duck;
		state = PLAYERSTATE.FREE;
	}
}