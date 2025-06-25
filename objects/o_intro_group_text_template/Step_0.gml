if (global.groupChatNum == visibleNum) {
	if (global.groupChatNum == visibleNum) {
		    image_alpha = lerp(image_alpha, 1, 0.1);
		} else {
		    image_alpha = lerp(image_alpha, 0, 0.1);
}
	
    
    // Smoothly interpolate y toward thisY
    var easing_speed = 0.1; // Lower = slower, smoother
    y = lerp(y, thisY, easing_speed);

    // Optional: snap to final Y if close enough to avoid micro-wiggles
    if (abs(y - thisY) < 0.5) {
        y = thisY;
    }
} else {
    image_alpha = 0;
}
