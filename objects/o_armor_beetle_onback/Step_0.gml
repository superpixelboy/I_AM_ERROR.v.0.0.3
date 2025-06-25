

// Step Event
vsp = vsp + grv;



if(onBackTime>0)onBackTime--;
else{
	with(instance_create_layer(x,y,layer,o_armor_beetle))
	{
		//direction = other.hitfrom;
		//show_debug_message("directoin =" + direction);
	//	hsp = lengthdir_x(5,direction);
		//vsp = lengthdir_y(10,direction);
		hsp =  3* other.knockbackDir;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	instance_destroy();
}

if(hp>0){
// Handle knockback first - increase horizontal force significantly

/*
if (knockBack >= 20) 
{

	with(instance_create_layer(x,y,layer,o_armor_beetle_knockback))
	{
	
		hsp = 5* other.knockbackDir;
		vsp = -2;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	with (mygun) instance_destroy();
	instance_destroy();
}else if (knockBack >= 10) 
{

	
	with(instance_create_layer(x,y,layer,o_armor_beetle_knockback))
	{
		//direction = other.hitfrom;
		//show_debug_message("directoin =" + direction);
	//	hsp = lengthdir_x(5,direction);
		//vsp = lengthdir_y(10,direction);
		hsp =  3* other.knockbackDir;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	with (mygun) instance_destroy();
	instance_destroy();
}
else if(knockBack>7){
	with(instance_create_layer(x,y,layer,o_armor_beetle_knockback))
		{
		//direction = other.hitfrom;
		//show_debug_message("directoin =" + direction);
	//	hsp = lengthdir_x(5,direction);
		//vsp = lengthdir_y(10,direction);
		hsp = 2* other.knockbackDir;
		vsp = 2* other.knockbackDir;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	with (mygun) instance_destroy();
	instance_destroy();
}


*/
if(knockBack >0)
{
		
		/*
		with(instance_create_layer(x,y,layer,o_armor_beetle_knockback))
	{
		//direction = other.hitfrom;
		//show_debug_message("directoin =" + direction);
	//	hsp = lengthdir_x(5,direction);
		//vsp = lengthdir_y(10,direction);
		hsp =  3* other.knockbackDir;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	with (mygun) instance_destroy();
	instance_destroy();
*/
}
// Normal movement
else if (hitTimer == 0)
{
//   walksp = 1;  // Reset walk speed
 
	/*
    if (place_meeting(x+hsp,y,o_wall))
    {
        while(!place_meeting(x+sign(hsp),y,o_wall))
        {
            x = x + sign(hsp);
        }
        hsp = -hsp;
        walksp = hsp;
    }*/
    hsp = walksp;
} 
else 
{
    hsp = 0;
}

// Prevent walking off edges
if (grounded && afraidofheights && !place_meeting(x + hsp*2, y + 1, o_wall)) 
{
    // Turn only if not already turning
    if (sign(hsp) == sign(walksp)) {
        hsp = -hsp;  // Reverse direction
        walksp = -walksp;  // Update walking direction
    }
}



// Horizontal collision

if (place_meeting(x+hsp,y,o_wall))
{
	while(!place_meeting(x+sign(hsp),y,o_wall))
	{
		x = x +sign(hsp);
	}
	
	hsp = -hsp;
	walksp=hsp;
	hsp = 0;
}
x = x + hsp;

// Vertical collision
if (place_meeting(x,y+vsp,o_wall))
{
    while(!place_meeting(x,y+sign(vsp),o_wall))
    {
        y = y + sign(vsp);
		
		
    }
	
	
    vsp = 0;
	grounded = true;
}

else{
	grounded = false;
}
y = y + vsp;




// Animation
if(hitTimer == 0){
    if (!place_meeting(x,y+1,o_wall))
    {
	
        sprite_index = s_armor_beetle_hit;
        image_index = 0;
        image_speed = 0;
    }
    else{
	
        image_speed = 1;
        sprite_index = s_armor_beetle_onback;
		
    }
    hitvsp = 0;
}
else{
    hitTimer--;
    sprite_index = s_armor_beetle_hit;
    image_speed = 0;
    if(hitvsp != 0){
        y = hitvsp;
    }
    else{
        hitvsp = y - 5;
    }
}

//update image scaling
if (hsp != 0){
    image_xscale = sign(hsp) * size;
	image_yscale = size;
}

}