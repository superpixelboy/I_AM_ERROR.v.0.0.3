function SPBDialogue(){
	

		my_dialogue = [
		
			{ text: "I've got the SUPER PIXEL BOY! Time to head back to the gang and test it out.", portrait: global.player_normal, sound: global.player_voice, tag: "exit" }
		];

		var txt = instance_create_layer(x, y - 64, "GUI", o_text);
        txt.dialogue = my_dialogue;
        txt.npc_portrait = s_portrait_empty;
        txt.npc_voice = undefined;
        txt.player_voice = sn_agent_voice_blip1;
		alpha = 0;
		nearby = false;

		global.foundMysteryGame=true;

}