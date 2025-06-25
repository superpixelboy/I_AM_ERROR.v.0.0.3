// Draw GUI Event
// Draw GUI Event

if (glitching) {
    var scale = 2;
    var screen_x = display_get_width() *glitch_x;
    var screen_y = display_get_height() *glitch_y;

    draw_sprite_ext(
        glitch_sprite,
        glitch_frame,
        screen_x,
        screen_y,
        scale, scale, // xscale, yscale
        0,            // rotation
        c_white,
        1             // alpha
    );
}
