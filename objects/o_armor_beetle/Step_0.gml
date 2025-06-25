

// Step Event
vsp = vsp + grv;

//if(hp>0){
// Handle knockback first - increase horizontal force significantly
if(knockBack==9)
{
	//SWEEP
	with(instance_create_layer(x,y,layer,o_armor_beetle_knockback_small))
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
else if(knockBack>0){
	hitTimer=45;
}

// Normal movement
else if (hitTimer == 0)
{

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
        sprite_index = s_armor_beetle_idle;
		
    }
    hitvsp = 0;
}
else{
	
	
    hitTimer--;
    sprite_index = s_armor_beetle_block;
	if(instance_exists(o_attic_quest_manager)){
		if(!global.haspunchedbug){
			global.story_stage = Scene.INTRO_FIND_SPB;
			global.story_flags.killAtticBigBug=true;
			AtticBigBugDialogue();
			global.haspunchedbug=true;
		}
	}
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

//}