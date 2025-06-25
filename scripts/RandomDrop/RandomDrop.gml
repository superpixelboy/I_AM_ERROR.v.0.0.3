function RandomDrop(){
	
	
	
	
	roll = random_range(1,100);
	
	if(roll>=75&&roll<80){

		instance_create_layer(x,y,layer,o_pickup_uppercut);
	}
	else if(roll>=80&&roll<87){
		instance_create_layer(x,y,layer,o_fireball_pickup);
	}
	else if(roll>=87&&roll<93){
		instance_create_layer(x,y,layer,o_blast_pickup);
	}
	else if(roll>=93){

		instance_create_layer(x,y,layer,o_blast_pickup);
	}
	
	repeat(random_range(global.combolevel,global.combolevel*2)){
	instance_create_layer(x,y,layer,o_digitoken_1);
	}
}