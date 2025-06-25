alpha = 0;
nearby = false;

my_dialogue = [

	 { text: "I completed the quest. Do I get any extra XP?", portrait: s_portrait_null_normal, sound: player_voice },
    { text: "Um, actually in this game you don't level up with XP. You complete milestones that unlock special abilities.", portrait: npc_portrait, sound: npc_voice },
	
    { text: "But enough chit chat. We have to get started. If we're lucky we will actually be able to make it out of the tavern today.", portrait: npc_portrait, sound: npc_voice },
	    { text: " Null, did you check to see how long we can stay in your grandpa's bookstore after it closes?", portrait: npc_portrait, sound: npc_voice },
		 { text: "Oh yeah...", portrait: s_portrait_null_normal_question, sound: player_voice },
		  { text: "Right, I maybe accidently forgot to tell him we were going to be playing the game today...", portrait: s_portrait_null_normal_question, sound: player_voice },
	{ text: "What's the point of having a grandpa who lives in a bookstore if we can't play H&H in it?", portrait: npc_portrait, sound: npc_voice },
   
   { text: "Right, right...Hang on to your D20. I'll go talk to him now.", portrait: s_portrait_null_normal_smile, sound: player_voice, tag: "talkedToRookieIntroCafe" }
  
];
