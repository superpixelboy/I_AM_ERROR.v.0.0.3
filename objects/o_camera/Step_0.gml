/// @description update camera

// Ensure view dimensions are accurate
var view_width = camera_get_view_width(cam);
var view_height = camera_get_view_height(cam);
//var view_w_half = view_width / 2;
//var view_h_half = view_height / 2;

// Update destination (target camera position)
if (instance_exists(follow))
{
    // Adjust horizontal focus
    xTo = follow.x; // Center horizontally on the player
	yTo = follow.y; 
	// yTo = follow.y* verticalFallFollow;
    // Adjust vertical focus based on falling state
    if (global.player_falling > 0)
    {
		if(verticalFallFollow<1){
			verticalFallFollow+=0.015;
		}
       
    }
    else
    {
       if(verticalFallFollow>0.93){
			verticalFallFollow-=0.01;
		}
		
    }

    // Special case: if player is dead, instantly center camera on target
    if ((follow).object_index == o_player_dead)
    {
        x = xTo;
        y = yTo;
    }
}

// Smoothly update object position
x += (xTo - x) / 15; // Horizontal smoothing
y += (yTo - y) / 4;  // Faster vertical smoothing

// Clamp camera position to room boundaries
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff);

// Apply screen shake effect
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Update camera view position
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

// Parallax layers
if (layer_exists("background1"))
{
    layer_x("background1", (x / 3)+100); // Parallax effect for background layer 1
}
if (layer_exists("background2"))
{
    layer_x("background2", x / 4); // Parallax effect for background layer 2
}
if (layer_exists("foreground1"))
{
    // Uncomment and customize as needed
     layer_x("foreground1", -x *0.25);
}
if (layer_exists("foreground2"))
{
    // Uncomment and customize as needed
     layer_x("foreground2", -x *0.4);
}
