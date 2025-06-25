/// @description Insert description here
// You can write your code in this editor
// Create Event (in obj_music_manager)

/*
audio_stop_all();

audio_play_sound(sn_hall_o_mount_intro, 1, false);
state = "intro hall";
fight_is_over=false;
*/

// Audio channel variables for ambient room music
jazzy_cafe_channel = -1;
grandpa_news_channel = -1;
combat_channel = -1;

// Volume control
jazzy_cafe_volume = 0;
grandpa_news_volume = 0;
combat_volume = 0;
target_jazzy_volume = 0;
target_grandpa_volume = 0;
target_combat_volume = 0;

// Fade speed (adjust for smoother/faster transitions)
fade_speed = 0.05;

// Combat music state
combat_state = "none"; // "none", "intro", "looping", "finale"
fight_is_over = false;

// Current room/zone
current_zone = "intro"; // "intro", "hallway", "grandpa_room", "basement"

// Start ambient music
jazzy_cafe_channel = audio_play_sound(sn_jazzy_cafe, 1, true);
grandpa_news_channel = audio_play_sound(sn_background_grandpasroom, 1, true);


  switch (current_zone) {
        case "intro":
            target_jazzy_volume = .8;
            target_grandpa_volume = 0.0;
            break;
            
        case "hallway":
            target_jazzy_volume = 0.3;
            target_grandpa_volume = 0.4;
            break;
            
        case "grandpa_room":
            target_jazzy_volume = 0.0;
            target_grandpa_volume = 0.8;
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
	
