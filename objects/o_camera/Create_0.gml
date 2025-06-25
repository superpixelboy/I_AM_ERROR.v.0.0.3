/// @description setup camera
cam = view_camera[0];
follow = o_player;
view_w_half = camera_get_view_width(cam) /2;
view_h_half = camera_get_view_height(cam) /2;



verticalFallFollow =0;
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 10;


xTo = xstart;
yTo = ystart;

if (instance_exists(follow)){
	x=follow.x;
}