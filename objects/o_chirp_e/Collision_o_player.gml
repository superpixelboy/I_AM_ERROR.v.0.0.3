if(other.key_up){

	if(point_in_circle(o_player.x,o_player.y,x,y,64)) && (!instance_exists(o_text)){
		with (instance_create_layer(x,y-64,layer,o_text))
		{
			text = other.text;
			length = string_length(text);
		
		}
		with (o_camera)
		{
			follow = other.id;
		}
	}
}