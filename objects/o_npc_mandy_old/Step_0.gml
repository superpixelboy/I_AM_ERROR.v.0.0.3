// Top of Step event
var previous_letters = floor(letters);

letters += spd;

// Determine how many letters to show now
var current_letters = floor(letters);
text = string_copy(dialogue[currentline].text, 1, floor(letters));
layer_x("TitleAssets", min(layer_get_x("TitleAssets") + 0.5, display_get_gui_width() * 0.27));

var input_detected = global.dialogue_input_detected;

// If a new letter was added, play the sound
if (instance_exists(o_text) && letters < string_length(dialogue[currentline].text)) {
	// If we're still typing out text
	if (current_letters > previous_letters && current_letters mod 2 == 0) {
		var snd = dialogue[currentline].sound;
		if (snd != noone) {
			var pitch = random_range(0.85, 1.15);
			audio_play_sound(snd, 0, false);
			audio_sound_pitch(snd, pitch);
		}
	}
	if (letters >= string_length(dialogue[currentline].text)) {
		audio_stop_sound(dialogue[currentline].sound);
	}
}

if (letters >= string_length(dialogue[currentline].text) && input_detected)
{
	
	
    if (currentline + 1 >= array_length(dialogue))
    {
        currentline = 0;
        letters = 0;
        isInConvo = 0;

        with (o_player) {
            state = PLAYERSTATE.FREE;
        }

        with (o_text) {
            instance_destroy();
        }
		
    }
    else
    {
        currentline++;
        letters = 0;
    }
}


if instance_exists(o_player){
	
	if instance_exists(o_text){
			alpha =0;
	}
	else{
		if(point_in_circle(o_player.x,o_player.y,x,y,32)){
			if(alpha<1){
				alpha=alpha+0.04;
			}
			nearby = true;
		
	
		}
		else{
			nearby = false;
			if(alpha>0){
				alpha=alpha-0.06;
			}
		}
	
	}
	
 }

