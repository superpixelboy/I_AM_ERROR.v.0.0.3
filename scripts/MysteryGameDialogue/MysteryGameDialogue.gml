function MysteryGameDialogue(){
	

		my_dialogue = [
			{ text: "The name is scratched off? WHAT THE HECK GAME IS THIS?! It looks like it's for a Super Pixel Boy.", portrait: global.player_normal, sound: global.player_voice },
			{ text: "I should check with the gang to see if they know anything about it.", portrait: global.player_normal, sound: global.player_voice, tag: "exit" }
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