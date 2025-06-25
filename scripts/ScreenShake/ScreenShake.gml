/// @desc ScreenShake(magnitude, frames)
/// @arg Magnitude sets the srtenthg of the shake 
/// @sarg Frames set the lengths of time

with (o_camera)
{
	if (argument0 > shake_remain)
	{
		shake_magnitude = argument0;
		shake_remain = argument0;
		shake_length = argument1;
	}
}