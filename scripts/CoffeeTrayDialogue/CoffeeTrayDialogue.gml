function CoffeeTrayDialogue(){
	

		my_dialogue = [
			{ text: "Wow! That conversation went better than I thought!", portrait: global.player_normal, sound: global.player_voice },
			{ text: "Coffee is the perfect companion for a nice rainy night of hanging out with my besties and playing the hit TTRPG: Hobos & Homicides.", portrait: global.player_normal, sound: global.player_voice },
			{ text: "I've got to find the gang and give them their drinks!", portrait: global.player_normal, sound: global.player_voice, tag: "exit" }
		];

		var txt = instance_create_layer(x, y - 64, "GUI", o_text);
        txt.dialogue = my_dialogue;
        txt.npc_portrait = s_portrait_empty;
        txt.npc_voice = undefined;
        txt.player_voice = sn_agent_voice_blip1;
		alpha = 0;
		nearby = false;


}

