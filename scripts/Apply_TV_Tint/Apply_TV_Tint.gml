function Apply_TV_Tint(){
//for grandpa's room
	if(instance_exists(o_grandparoom_color)) {
	    var tint_strength = o_grandparoom_color.roomColorTintNum / 100;
	    var base_color = make_color_rgb(200, 180, 255);
	    var tint_color = make_color_rgb(50, 80, 255);
    
	    image_blend = merge_color(base_color, tint_color, tint_strength * 0.8);
	}
}