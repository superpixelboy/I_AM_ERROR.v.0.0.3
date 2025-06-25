/// STEP EVENT (or wherever you update the frog object)

// Apply gravity
vsp += grv;

// --------------------------------------------------------------------
// Knockback logic
// --------------------------------------------------------------------
if (knockBack >= 10) 
{
    with (instance_create_layer(x, y, layer, o_frog_knockback))
    {
        hsp = 3 * other.knockbackDir;
        if (sign(hsp) != 0) {
            image_xscale = sign(hsp) * other.size;
        }
        image_yscale = other.size;
        hp = other.hp;
        size = other.size;
    }
    with (mygun) instance_destroy();
    instance_destroy();
}
else if (knockBack > 7)
{
    with (instance_create_layer(x, y, layer, o_frog_knockback))
    {
        hsp = 2 * other.knockbackDir;
        vsp = 2 * other.knockbackDir;
        if (sign(hsp) != 0) {
            image_xscale = sign(hsp) * other.size;
        }
        image_yscale = other.size;
        hp = other.hp;
        size = other.size;
    }
    with (mygun) instance_destroy();
    instance_destroy();
}
else if (knockBack > 0)
{
    with (instance_create_layer(x, y, layer, o_frog_knockback_small))
    {
        hsp = 2 * other.knockbackDir;
        if (sign(hsp) != 0) {
            image_xscale = sign(hsp) * other.size;
        }
        image_yscale = other.size;
        hp = other.hp;
        size = other.size;
    }
    with (mygun) instance_destroy();
    instance_destroy();
}
else if (hitTimer == 0)
{
    // Normal movement (no knockback, not hit)
    hsp = walksp;
}
else
{
    // If currently hit, stop horizontal movement
    hsp = 0;
}

// --------------------------------------------------------------------
// Edge check (if the frog is "afraid of heights")
// --------------------------------------------------------------------
if (grounded && afraidofheights && !place_meeting(x + hsp*2, y + 1, o_wall)) {
    // Only turn around if we're still going in the same direction as hsp
    if (sign(hsp) == sign(walksp)) {
        hsp = -hsp;
        walksp = -walksp;
    }
}

// --------------------------------------------------------------------
// Horizontal collision with normal walls
// --------------------------------------------------------------------
if (place_meeting(x + hsp, y, o_wall)) {
    // Move up to the wall edge
    while (!place_meeting(x + sign(hsp), y, o_wall)) {
        x += sign(hsp);
    }
    // Reverse direction
    hsp = -hsp;
    walksp = hsp;
    hsp = 0;
}
x += hsp;

// --------------------------------------------------------------------
// Vertical collision (o_wall then o_oneway)
// --------------------------------------------------------------------
if (place_meeting(x, y + vsp, o_wall))
{
    // Land on the wall
    while (!place_meeting(x, y + sign(vsp), o_wall)) {
        y += sign(vsp);
    }
    vsp = 0;
    grounded = true;
}
else
{
    // Check if we are falling and about to hit a one-way from above
    if (vsp > 0 && !place_meeting(x, y, o_oneway) && place_meeting(x, y + vsp, o_oneway))
    {
        // Snap onto the one-way
        while (!place_meeting(x, y + 1, o_oneway)) {
            y += 1;
        }
        vsp = 0;
        grounded = true;
    }
    else
    {
        // Not colliding with floor or suitable one-way
        grounded = false;
        y += vsp;
    }
}

// --------------------------------------------------------------------
// Animation and hit timer logic
// --------------------------------------------------------------------
if (hitTimer == 0)
{
    // If the frog is in midair, use "hit" sprite or some jump sprite
    if (!place_meeting(x, y + 1, o_wall) && !place_meeting(x, y + 1, o_oneway))
    {
        sprite_index = s_frog_hit;  // or s_frog_jump, up to you
        image_index = 0;
        image_speed = 0;
    }
    else
    {
        // On the ground
        image_speed = 1;
        sprite_index = s_frog_hop;
    }
    hitvsp = 0;
}
else
{
    hitTimer--;
    sprite_index = s_frog_hit;
    image_speed = 0;
    
    // "Bounce" animation effect if needed
    if (hitvsp != 0) {
        y = hitvsp;
    }
    else {
        hitvsp = y - 5;
    }
}

// --------------------------------------------------------------------
// Update sprite scaling based on direction
// --------------------------------------------------------------------
if (hsp != 0)
{
    image_xscale = sign(hsp) * size;
}
image_yscale = size;
