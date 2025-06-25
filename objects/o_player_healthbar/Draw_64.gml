/// @description HEALTHBAR
/*
draw_sprite(s_healthbar_background,0,healthbar_x,healthbar_y);
//draw_sprite_stretched(s_healthbar,0,healthbar_x,healthbar_y,(global.hp/global.maxhp)*healthbar_width,healthbar_height);
//draw_sprite_stretched(s_healthbar,0,healthbar_x,healthbar_y,healthbar_width,healthbar_height);
draw_sprite_stretched(
    s_healthbar, 
    0, 
    healthbar_x, 
    healthbar_y, 
    1 * healthbar_width, 
    healthbar_height
);
draw_sprite(s_healthbar_border,0,healthbar_x,healthbar_y);
show_debug_message("HP: " + string(global.hp) + " / Max HP: " + string(global.maxhp));
*/
/// @description Draw the health bar

// Step 1: Calculate the health ratio
var hp_ratio = global.hp / global.maxhp;
hp_ratio = clamp(hp_ratio, 0, 1); // Ensure the ratio is between 0 and 1

// Step 2: Set up dimensions for the health bar
var bar_width =  global.maxhp;   // Total width of the health bar
var bar_height = 15;   // Height of the health bar

// Position on the screen
var bar_x = (display_get_gui_width() * 0.1);  // 10% from the left edge
var bar_y = (display_get_gui_height() * 0.1); // 10% from the top edge

// Step 3: Draw the background bar
draw_sprite(s_Healthbar_border_old, 0, bar_x, bar_y);

// Step 4: Draw the red health bar (rectangle)
draw_set_color(c_red); // Set the draw color to red
draw_rectangle(bar_x, bar_y, bar_x + (hp_ratio * bar_width), bar_y + bar_height, false); // Draw the health rectangle

// Step 5: Reset the color (optional)
draw_set_color(c_white); // Reset color to white for other drawing

// Step 6: Draw the border on top
draw_sprite(s_Healthbar_background, 0, bar_x, bar_y);

