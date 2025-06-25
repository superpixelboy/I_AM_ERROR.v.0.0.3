if(other.key_up){
	currentline = 0;
if(point_in_circle(o_player.x,o_player.y,x,y,64)) && (!instance_exists(o_text)&&isInConvo==0){
	global.convoTag="Mandy";
	with (instance_create_layer(x,y-64,layer,o_text))
	{
		isInConvo=1;
	
		with(o_player){
			 state = PLAYERSTATE.DIALOGUE;
		}
		
	}
	/*
	with (o_camera)
	{
		follow = other.id;
	}*/
}
}