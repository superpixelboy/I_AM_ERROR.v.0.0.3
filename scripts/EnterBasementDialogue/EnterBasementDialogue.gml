
function EnterBasementDialogue(){
		my_dialogue = [
			{ text: "There is so much crap down here. Grandpa has got to stop buying those random shipping containers.", portrait: global.player_normal, sound: global.player_voice, tag: "exit" }
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