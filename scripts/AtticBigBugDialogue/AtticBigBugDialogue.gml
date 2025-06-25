
function AtticBigBugDialogue(){
		my_dialogue = [{ text: "What the frick?!? This stupid bug has armor. Is there a mutagen factory nearby?", portrait: global.player_normal, sound: global.player_voice},
			{ text: "I'm going to have to get clever... Maybe I can trip the bugger and knock it down.", portrait: global.player_normal, sound: global.player_voice, tag: "kill big bug" }
		];

		var txt = instance_create_layer(x, y - 64, "GUI", o_text);
        txt.dialogue = my_dialogue;
        txt.npc_portrait = s_portrait_empty;
        txt.npc_voice = undefined;
        txt.player_voice = sn_agent_voice_blip1;
		alpha = 0;
		nearby = false;
		 
		with (o_player) {
            state = PLAYERSTATE.DIALOGUE;
        }



}