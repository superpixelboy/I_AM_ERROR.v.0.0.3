// Step Event

if (!glitching) {
    glitch_timer--;

    if (glitch_timer <= 0) {
		glitch_x=random_range(-0.5,0.5);
		glitch_y=random_range(-0.5,0.5);
        glitching = true;
        glitch_duration = irandom_range(10, 15); // Duration of glitch effect in frames
        glitch_frame = irandom(sprite_get_number(glitch_sprite) - 1); // Random frame
    }
} else {
    glitch_duration--;

    if (glitch_duration <= 0) {
        glitching = false;
        glitch_timer = irandom_range(60, 180);
    }
}
