// ===== STEP EVENT =====

// Function definitions
function update_audio_zones() {
    switch (current_zone) {
        case "intro":
            target_jazzy_volume = 1.0;
            target_grandpa_volume = 0.0;
            break;
            
        case "hallway":
            target_jazzy_volume = 0.6;
            target_grandpa_volume = 0.4;
            break;
            
        case "grandpa_room":
            target_jazzy_volume = 0.0;
            target_grandpa_volume = 1.0;
            break;
            
        case "basement":
            // During combat, fade out ambient music
            if (combat_state != "none") {
                target_jazzy_volume = 0.0;
                target_grandpa_volume = 0.0;
                target_combat_volume = 1.0;
            } else {
                // Post-combat or pre-combat basement ambience
                target_jazzy_volume = 0.0;
                target_grandpa_volume = 0.0;
                target_combat_volume = 0.0;
            }
            break;
    }
}

function handle_audio_zones() {
    // Smooth volume transitions
    jazzy_cafe_volume = lerp(jazzy_cafe_volume, target_jazzy_volume, fade_speed);
    grandpa_news_volume = lerp(grandpa_news_volume, target_grandpa_volume, fade_speed);
    combat_volume = lerp(combat_volume, target_combat_volume, fade_speed);
    
    // Apply volumes to audio channels
    if (audio_is_playing(jazzy_cafe_channel)) {
        audio_sound_gain(jazzy_cafe_channel, jazzy_cafe_volume, 0);
    }
    if (audio_is_playing(grandpa_news_channel)) {
        audio_sound_gain(grandpa_news_channel, grandpa_news_volume, 0);
    }
    if (audio_is_playing(combat_channel)) {
        audio_sound_gain(combat_channel, combat_volume, 0);
    }
}

function handle_combat_music() {
    switch (combat_state) {
        case "intro":
            if (!audio_is_playing(combat_channel)) {
                combat_channel = audio_play_sound(sn_hall_mount_mid, 1, true);
                combat_state = "looping";
            }
            break;
            
        case "looping":
            if (fight_is_over) {
                audio_stop_sound(combat_channel);
                combat_channel = audio_play_sound(sn_hall_mount_end, 1, false);
                combat_state = "finale";
            }
            break;
            
        case "finale":
            if (!audio_is_playing(combat_channel)) {
                combat_state = "none";
                // Update zones to restore ambient music if needed
                update_audio_zones();
            }
            break;
    }
}

function change_zone(new_zone) {
    current_zone = new_zone;
    update_audio_zones();
}

function start_combat() {
    if (combat_state == "none") {
        combat_channel = audio_play_sound(sn_hall_o_mount_intro, 1, false);
        combat_state = "intro";
        fight_is_over = false;
        update_audio_zones(); // This will fade out ambient music
    }
}

function end_combat() {
    fight_is_over = true;
}

// Automatic room detection
function check_room_changes() {
    var new_zone = "";
    
    // Map room names to audio zones
    switch (room) {
        case IntroBookstore:
            new_zone = "intro";
            break;
        case IntroHallway:
            new_zone = "hallway";
            break;
        case IntroGrandpaRoom:
            new_zone = "grandpa_room";
            break;
        case Basement:
            new_zone = "basement";
            break;
        default:
            new_zone = current_zone; // Keep current zone if room not found
            break;
    }
    
    // Only update if zone actually changed
    if (new_zone != current_zone) {
        current_zone = new_zone;
        update_audio_zones();
    }
}

// Function calls - these run every step
check_room_changes();
handle_audio_zones();
handle_combat_music();

show_debug_message("Music Manager - Current Room: " + string(room) + " (" + room_get_name(room) + ")" + 
                  ", Zone: " + current_zone + 
                  ", Jazzy Vol: " + string(jazzy_cafe_volume) + 
                  ", Target Jazzy: " + string(target_jazzy_volume));