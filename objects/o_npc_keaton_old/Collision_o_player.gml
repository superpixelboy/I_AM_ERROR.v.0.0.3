if(global.interactKey){
	currentline = 0;
if(point_in_circle(o_player.x,o_player.y,x,y,64) && isInConvo==0){
	global.convoTag="Keaton";
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