function KillPlayer(){
// @desc DIE 
instance_change(o_player_dead, true);

// Calculate direction for blast back
direction = point_direction(other.x, other.y, x, y);
hsp = -lengthdir_x(6, direction);
vsp = lengthdir_y(4, direction) - 3;

// Pass initial blast values to the dead object
with (o_player_dead) {
    initial_hsp = other.hsp*0.3;  // Preserve horizontal speed
    initial_vsp = other.vsp;  // Preserve vertical speed
}

// Set sprite facing direction
if (sign(hsp) != 0) image_xscale = sign(hsp);

	if(room!=RoomHC){
		global.kills -= global.killsthisroom;
	}
}

