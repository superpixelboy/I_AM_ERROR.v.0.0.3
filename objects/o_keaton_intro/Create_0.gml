alpha = 0;
nearby = false;

my_dialogue = [

    { text: "Hey Keaton, I have your black iced dark roast coffee.", portrait: s_portrait_null_normal, sound: player_voice },
    { text: "Thanks, Null. I wish I had a VCR to watch all of these trashy slashers and horror classics. ", portrait: npc_portrait, sound: npc_voice },
   { text: "I think a lot of these were my mom's old movies. She had a good taste in bad movies.", portrait: s_portrait_null_normal_question, sound: player_voice },
   { text: "Yeah! I just want to watch all of them until a ghost girl crawls her way out of the TV and sucks my soul.", portrait: npc_portrait, sound: npc_voice },
  { text: "I don't think that's how VCRs work...", portrait: s_portrait_null_normal_smile, sound: player_voice },
 { text: "Also, you don't have time to get soul sucked, we have to play H&H!", portrait: s_portrait_null_normal_smile, sound: player_voice },

 { text: "Right... I'll head right over.",  portrait: npc_portrait, sound: npc_voice, tag: "talkedToKeatonIntro" }
  
];
