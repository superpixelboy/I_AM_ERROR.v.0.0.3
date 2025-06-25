/// @desc Set alpha

// if oPlayer exists and is close to the sign, do the next step
if (instance_exists(o_player)) && (point_in_circle(o_player.x,o_player.y,x,y,80))
{
 // image transparency is either 1 or increases by +0.05 every frame, whichever value is smaller.
 image_alpha = min(1,image_alpha+0.05)
}
// if image transparency is more than 0, oPlayer exists and oPlayer isn't close to the sign, do the next step
if (image_alpha > 0) && (instance_exists(o_player)) &&  (!point_in_circle(o_player.x,o_player.y,x,y,80))
{
 // image transparency reduces by 0.05 every frame
 image_alpha -= 0.05
}