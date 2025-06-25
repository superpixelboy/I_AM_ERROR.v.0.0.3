// Apply gravity
vsp += grv;

// Horizontal collision (walls only)
if (place_meeting(x + hsp, y, o_wall)) {
    while (!place_meeting(x + sign(hsp), y, o_wall)) {
        x += sign(hsp);
    }
    hsp = 0;
}

// Simple friction
if (hsp > 0) {
    hsp -= hsp * 0.05;
} else {
    hsp = 0;
}
x += hsp;

// Vertical collision
// Separate one-way collisions (only if going down)
var one_way_collision = (vsp > 0) && place_meeting(x, y + vsp, o_oneway);
var wall_collision    = place_meeting(x, y + vsp, o_wall);

if (wall_collision || one_way_collision) {
    // Push the coin out of either wall or one-way
    // Notice we include o_oneway in the loop only if the coin is traveling downward
    while (!place_meeting(x, y + sign(vsp), o_wall)
           && !(vsp > 0 && place_meeting(x, y + sign(vsp), o_oneway)))
    {
        y += sign(vsp);
    }
    vsp = 0;
}

if(timer>0){
	timer--;
}
// Finally apply vsp
y += vsp;
