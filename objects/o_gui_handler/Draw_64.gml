/// @description Insert description here
// You can write your code in this editor
// obj_gui_handler: DRAW GUI EVENT


// Draw the entire HUD
function draw_gui_health ()  {
    var hp_ratio = global.hp / global.maxhp;
    hp_ratio = clamp(hp_ratio, 0, 1);

    var bar_width =  global.maxhp;
    var bar_height = 15;

    var bar_x = (display_get_gui_width() * 0.1);
    var bar_y = (display_get_gui_height() * 0.1);

	hbScaler=global.playerLevel-1;
   // draw_sprite(s_Healthbar_border, hbScaler, bar_x, bar_y);
    draw_set_color(c_white);
    draw_rectangle(bar_x, bar_y, bar_x + (hp_ratio * bar_width), bar_y + bar_height, false);
    draw_set_color(c_white);
    draw_sprite(s_Healthbar_background,hbScaler, bar_x, bar_y);
	show_debug_message("health bar Scaler = "+string(hbScaler));
}

function draw_gui_stamina() {
    var stamina_ratio = global.stamina / global.maxstamina;
    stamina_ratio = clamp(stamina_ratio, 0, 1);

    var bar_width = 146;
    var bar_height = 10;

    var bar_x = (display_get_gui_width() * 0.1);
    var bar_y = (display_get_gui_height() * 0.15); // Positioned below health bar

    draw_set_color(c_blue); // Blue for stamina
    draw_rectangle(bar_x, bar_y, bar_x + (stamina_ratio * bar_width), bar_y + bar_height, false);

    draw_set_color(c_white);
}


function draw_gui_abilities() {
    var icon_scale = 2; // Scale factor for larger icons
    for (var i = 0; i < 4; i++) {
        var icon_x = abilities_x + (i * 80); // Adjust spacing for larger icons
        var icon_y = abilities_y;

        // Draw the base ability icon
        if (global.abilities[i] == "Locked") {
            draw_sprite_ext(spr_AbilityLocked, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        } else {
            draw_sprite_ext(s_AbilityIcons[i], 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }

        // If it's the Neutral Special slot (index 0) and the power-up is collected, draw the overlay
        if (i == 0 && global.finisher_powerup==1) {
             draw_sprite_ext(s_blastFinishIcon, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }
		 if (i == 1 && global.forward_powerup==1) {
			 draw_sprite_ext(s_icon_sp_uppercut, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }
		 if (i == 2 && global.up_powerup==1) {
           draw_sprite_ext(s_blastIcon, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }
	
		if (i == 3 && global.assisttype==1&&global.thisAssistTime>0) {
            draw_sprite_ext(s_Icon_Assist_back, 1, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }
		else if(i == 3 && global.assisttype==1&&global.thisAssistTime==0){
			  draw_sprite_ext(s_Icon_Assist_back, 2, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
          //  draw_sprite_ext(s_icon_sp_uppercut, 0, icon_x, icon_y, icon_scale, icon_scale, 0, c_white, 1);
        }

        // Draw the ability name below the icon
        draw_text(icon_x, icon_y + (40 * icon_scale), global.abilities[i]);
    }
}

function draw_gui_special_meter() {
   // Maximum SP we allow for the 3-level system is 300
    var sp_current = clamp(global.sp, 0, 300);
    
    var bar_width  = 200;
    var bar_height = 15;
    
    // The position to draw this stacked meter
    var bar_x = special_x;
    var bar_y = special_y;
    
    // 1) Draw the first (Yellow) bar for 0–100 SP
    {
        // How much of that first 100 is filled?
        var fill_yellow = min(sp_current, 100);
        var ratio_yellow = fill_yellow / 100; // [0..1]
        
        draw_set_color(c_yellow);
        draw_rectangle(
            bar_x,
            bar_y,
            bar_x + (ratio_yellow * bar_width),
            bar_y + bar_height,
            false
        );
    }
    
    // 2) Draw the second (Green) bar for 101–200 SP (on top)
    if (sp_current > 100) {
        // How much do we fill in the second 100 chunk?
        var fill_green = min(sp_current - 100, 100);
        var ratio_green = fill_green / 100; // [0..1]
        
        draw_set_color(c_orange);
        draw_rectangle(
            bar_x,
            bar_y,
            bar_x + (ratio_green * bar_width),
            bar_y + bar_height,
            false
        );
    }
    
    // 3) Draw the third (Purple) bar for 201–300 SP (on top)
    if (sp_current > 200) {
        // How much do we fill in the third 100 chunk?
        var fill_purple = min(sp_current - 200, 100);
        var ratio_purple = fill_purple / 100; // [0..1]
        
        draw_set_color(c_red);
        draw_rectangle(
            bar_x,
            bar_y,
            bar_x + (ratio_purple * bar_width),
            bar_y + bar_height,
            false
        );
    }
    
    // Reset color for safety
    draw_set_color(c_white);
	var spLevel = "0";
	if(global.sp<100) spLevel = "0";
	else if (global.sp<200) spLevel = "1";
	else if (global.sp<300) spLevel = "2";
	else spLevel = "MAX";
	
	

	DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(bar_x + bar_width +5,bar_y,spLevel , sptextscale,sptextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(bar_x + bar_width +7,bar_y,spLevel  , sptextscale,sptextscale,0);
	draw_set_color(c_white);
	
}


// Main Draw GUI Event
/*
draw_gui_health();       // Top-left health bar
draw_gui_stamina();      // Top-left stamina bar
draw_gui_special_meter(); // Bottom-center special meter
draw_gui_abilities();    // Bottom-right abilities
*/
