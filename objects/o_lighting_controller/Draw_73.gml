// Create surface if it doesn't exist
if (!surface_exists(lighting_surface)) {
    lighting_surface = surface_create(room_width, room_height);
}

// Draw to the lighting surface
surface_set_target(lighting_surface);
draw_clear_alpha(c_gray, 0.7); // Dark overlay

// Draw lights as WHITE shapes (these will become the lit areas)
gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1.0);

if(instance_exists(o_light_test)){
    with (o_light_test) {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
    }
}
if(instance_exists(o_light_circle_small)){
    with (o_light_circle_small) {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
    }
}
if(instance_exists(o_light_square_small)){
    with (o_light_square_small) {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, 1.0);
    }
}
// Draw shadows that cut back into the lights
draw_set_color(c_gray); // Same as background darkness
draw_set_alpha(0.7);    // Match your background alpha

if(instance_exists(o_shadow)){
    with (o_shadow) {
        draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_gray, 0.7);
    }
}

gpu_set_blendmode(bm_normal);
surface_reset_target();

// Apply the lighting using a different blend mode
gpu_set_blendmode_ext(bm_zero, bm_src_color);
draw_surface(lighting_surface, 0, 0);
gpu_set_blendmode(bm_normal);

// RESET DRAWING SETTINGS - Add these lines!
draw_set_color(c_white);
draw_set_alpha(1.0);