/// @description Step Event - Shadow movement
if(instance_exists(o_grandparoom_color)) {
    if(o_grandparoom_color.colorJustChanged) {
        x = thisX + random_range(-10, 10);
        y = thisY + random_range(-5, 5);
    }
}