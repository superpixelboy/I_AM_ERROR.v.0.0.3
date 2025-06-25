// Create Event: Initialize GUI positions

// Player stats (top-left)
health_x = 10;
health_y = 10;

stamina_x = 10;
stamina_y = health_y + 20;

sptextscale = 1;

// Specials (bottom-center)
special_x = 10; // Align with the health bar on the left
special_y = display_get_gui_height() - 50; // Still near the bottom

// Abilities (bottom-right)
abilities_x = display_get_gui_width() - 300;
abilities_y = special_y;

// Create Event
s_AbilityIcons = [
    s_IconULT_back, // Replace with the actual sprite for Neutral ability
    s_IconSPForward_back,     // Replace with the actual sprite for Air ability
	s_IconSP_back,     // Replace with the actual sprite for Up ability
    s_IconSPDown_back     // Replace with the actual sprite for Ducking ability
];