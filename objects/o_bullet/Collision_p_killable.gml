with (other)
{
	crit = random_range(1,10)
	if(crit>=9){
		ScreenShake(5,30);
		hp = hp -random_range(2,5);
		
		flash = 6;	
	}
	else{
		hp = hp -random_range(1,2);
			flash = 3;	
	}
	
		audio_play_sound(choose(sn_smack,sn_smack),1,false);
	hitfrom = other.direction;
	hitTimer = 15;
//	hsp = 0;
}

instance_destroy();