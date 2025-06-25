/*
vsp = vsp +grv;

if (place_meeting(x+hsp,y,o_wall))
{
	while(!place_meeting(x+sign(hsp),y,o_wall))
	{
		x = x +sign(hsp);
	}
	hsp = -hsp;
	walksp=hsp;
}
x = x + hsp;


//vetical collision
if (place_meeting(x,y+vsp,o_wall))
{
	while(!place_meeting(x,y+sign(vsp),o_wall))
	{
		y = y +sign(vsp);
	}
	vsp = 0;
	
}



//Animation
if(hitTimer==0){
	hsp = walksp;
			hitvsp = 0;
	if (!place_meeting(x,y+1,o_wall))
	{
		sprite_index = s_frog_hit;
		image_index = 0;
		image_speed = 0;
	
	
	}
	else{
		image_speed = 1;
		sprite_index = s_frog_hop;

	}
	y = y + vsp ;
	hitvsp = 0;
}
else{
	hsp =0;
	hitTimer--;

	sprite_index = s_frog_hit;
	image_speed = 0;
	if(hitvsp != 0){
		y = hitvsp;
	}
	else{
		hitvsp = y - 5;
	}
}



if (hsp !=0){
	image_xscale = sign(hsp);
}
*/
// Add these variables at the start of your object if not already present
// Create Event (make sure these are set)

//hsp = walksp;

// Step Event
vsp = vsp + grv;

if(hp>0){
// Handle knockback first - increase horizontal force significantly
if (knockBack >= 10) 
{
	/*OLD
    // Override horizontal speed with strong knockback force
    hsp = knockbackDir * 2;  // Increased from 6 to 8
    
    // Only apply upward force at start of knockback
    if (knockBack == 15) {  // If it's the first frame of knockback
        vsp = -6;  // Stronger upward force
    }
    
    // Gradually decrease knockback
    knockBack = max(0, knockBack - 1);
    
    // Prevent normal movement logic from overriding knockback
//  walksp = 0;
*/
	
	with(instance_create_layer(x,y,layer,o_frog_knockback))
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
	with(instance_create_layer(x,y,layer,o_frog_knockback))
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
else if(knockBack >0)
{
		
		with(instance_create_layer(x,y,layer,o_frog_knockback_small))
	{
		//direction = other.hitfrom;
		//show_debug_message("directoin =" + direction);
	//	hsp = lengthdir_x(5,direction);
		//vsp = lengthdir_y(10,direction);
		hsp =  2* other.knockbackDir;
	//	show_debug_message("hsp =" + hsp);
		if (sign(hsp) != 0)	image_xscale = sign(hsp) * other.size;
			image_yscale = other.size;
		hp = other.hp;
		size = other.size;
		
	}
	with (mygun) instance_destroy();
	instance_destroy();

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
	
        sprite_index = s_frog_hit;
        image_index = 0;
        image_speed = 0;
    }
    else{
	
        image_speed = 1;
        sprite_index = s_frog_hop;
		
    }
    hitvsp = 0;
}
else{
    hitTimer--;
    sprite_index = s_frog_hit;
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