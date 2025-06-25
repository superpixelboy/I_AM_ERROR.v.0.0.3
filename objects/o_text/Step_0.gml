// === Letter typing setup ===
var previous_letters = floor(letters);
letters += spd;
var current_letters = floor(letters);



// === Get current line
var fulltext = dialogue[currentline].text;
text = string_copy(fulltext, 1, current_letters);

// === Determine speaker
var sprite = dialogue[currentline].portrait;
var speaker_is_null =
    (sprite == s_portrait_null_normal ||
     sprite == s_portrait_null_normal_question ||
     sprite == s_portrait_null_normal_smile);

// === Choose default sound
var snd = speaker_is_null ? null_voice : npc_voice;

// === Optional: override with line-specific sound
if (dialogue[currentline].sound != undefined && dialogue[currentline].sound != noone) {
    snd = dialogue[currentline].sound;
}

// === Play sound if new letters typed
if (current_letters > previous_letters && current_letters mod 2 == 0) {
    if (snd != noone) {
        var pitch = random_range(0.85, 1.15);
        last_played_sound = snd; // save reference
        var inst = audio_play_sound(snd, 0, false);
        audio_sound_pitch(snd, pitch);
    }
}

// === Stop sound if full line typed
if (letters >= string_length(fulltext)) {
    if (last_played_sound != noone) {
        audio_stop_sound(last_played_sound);
        last_played_sound = noone; // reset
    }
}

// === Advance to next line if input pressed

    // Player pressed the key → advance
 if (letters >= string_length(fulltext)) {
    if (!keyboard_check(global.dialogue_input_detected)||mouse_check_button(mb_left)||gamepad_button_check_pressed(0,gp_face1)) {
        can_advance = true;
    }

    if (can_advance && keyboard_check_pressed(global.dialogue_input_detected)||mouse_check_button(mb_left)||gamepad_button_check_pressed(0,gp_face1)) {
        currentline++; // ✅ FIRST: increment the line!

        if (currentline >= array_length(dialogue)) {
            var lastline = dialogue[currentline - 1];

            // === Trigger item receive or other effects based on tags ===
            if (is_struct(lastline)) {
                if (lastline.tag != undefined) {
                    switch (lastline.tag) {
						//=============Intro Cafe====================
                        case "give_coffee":
                            GiveItem("Coffee (And Tray)", s_item_coffee, "coffee",s_UI_got_item_coffee);
                           break;
						case "talkedToRookieIntro":
								with(o_wall_intro){
									instance_destroy();
								}
								with(o_npc_rookie_intro){
									instance_create_layer(x, y, "Entities", o_npc_rookie_intro2);
									instance_destroy();
								}
								  with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
				            }
                           break;
						case "talkedToMandyIntro":
							global.story_flags.talkedToMandyIntro=true;
								with(o_mandy_intro){
									instance_destroy();
								}
								 instance_create_layer(330, 213, "Entities", o_mandy_intro_cafe);
								  with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
								StoryManager_CheckProgress()
				            }
                           break;
						   case "talkedToKeatonIntro":
							global.story_flags.talkedToKeatonIntro=true;
								with(o_keaton_intro){
									instance_destroy();
								}
								 instance_create_layer(300, 213, "Entities", o_keaton_intro_cafe);
								  with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
								StoryManager_CheckProgress()
				            }
                           break;
						   //Talk to Rookie after Keaton and Mandy
						   	case "talkedToRookieIntroCafe":
							global.story_flags.talkedToRookieIntro=true;
							
								  with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
				            }
							StoryManager_CheckProgress()
                           break;
						   
						   //talkjed to Grandpa about starting the game
						   case "talked to grandpa intro":
						   global.story_flags.talkedToGrandpaRoomIntro=true;
						    with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
							}
						  StoryManager_CheckProgress();
                           break;
						   
						   	
							//talked to friends about 19XX. Going to find SPB in attic
						case "head to attic":
						   global.story_flags.headToAttic=true;
						    with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
							}
						  StoryManager_CheckProgress();
                           break;
						   
						//kill attic bigs
						case "kill attic bugs":
						   global.story_flags.headToAttic=true;
						    with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
							}
						  StoryManager_CheckProgress();
                           break;
						   
							//kill attic bigs
						case "kill big bug":
						   global.story_flags.headToAttic=true;
						    with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
							}
						  StoryManager_CheckProgress();
                           break;
						   
						   	//Turn on the SPB
						case "turned on spb":
						  
							GiveItem("Playing Mystery Game!!!",s_spb,"turned on spb");
						//	room_goto(rPrologueEnd);
                           break;
						   
						//========EXIT dialoge with nothing=================
						case "exit":
						   with (o_player) {
				                dialogue_buffer = room_speed * 0.2;
				                state = PLAYERSTATE.FREE;
				            }
						
                    }
                }
				else{
	            // === Exit dialogue as normal
		            with (o_player) {
		                dialogue_buffer = room_speed * 0.2;
		                state = PLAYERSTATE.FREE;
		            }
			}
            }
			else{
	            // === Exit dialogue as normal
		            with (o_player) {
		                dialogue_buffer = room_speed * 0.2;
		                state = PLAYERSTATE.FREE;
		            }
			}
			global.showHUD=true;
            instance_destroy();
        } else {
            letters = 0;
            text = "";
            can_advance = false; // reset the gate
        }
    }
}