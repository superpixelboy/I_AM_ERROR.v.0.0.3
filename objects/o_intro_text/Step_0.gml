if(justLoaded>=0)
{
	justLoaded--;
}

if (!done) {
		
	if(justLoaded<=0){
		is_fast = keyboard_check(vk_space); // check if space is held
	}
	else{
		is_fast=false;
	}

    if (char_timer <= 0 && char_index < string_length(text_full)) {
        char_index += 1;
        text_shown = string_copy(text_full, 1, char_index);
      //  char_timer = is_fast ? 0 : char_speed; // make it instant if space held
	  if(!is_fast){
			char_timer = char_speed*4;
	  }

        // optional tap sound limiter
        if (tap_delay <= 0) {
            var pitch = random_range(0.9, 1.1);
			 soundBlip = sn_key_tap;
			if(is_fast){
				soundBlip = sn_key_tap_fast;
			}
			
            audio_sound_pitch(soundBlip, pitch);
            audio_play_sound(soundBlip, 0, false);
         //   tap_delay = is_fast ? 1 : 4; // faster tap rate while skipping
        }
    } else {
        char_timer -= 1;
        tap_delay -= 1;
    }

    if (char_index >= string_length(text_full)) {
        done = true;
    }

    // If you want "space" to also insta-finish the text:
    if (keyboard_check_pressed(vk_space) && !is_fast&&justLoaded<=0) {
        // optional: instantly reveal everything
      //   char_index = string_length(text_full);
    }

} else {
    if (keyboard_check_pressed(vk_space)&&justLoaded<=0) {
       // room_goto(IntroBookstore);
	   instance_create_layer(x,y,layer,o_intro_text2);
	   instance_destroy();
    }
}
