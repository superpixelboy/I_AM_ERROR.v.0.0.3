alpha = 0;
nearby = false;

image_speed=0;

my_dialogue = [
	
	{ text: "Hey grandpa, I forgot to tell you, I'm having some friends over tonight to play a game. And we were wondering if we could stay late.", portrait: s_portrait_null_normal_smile, sound: player_voice},
    { text: "Kids and  their video games. It's all just stare at a screen, sex and violence. It rots the brain.", portrait: npc_portrait, sound: npc_voice },
    { text: "Well, we're actually not playing video games tonight. We're playing an old school pen and paper RPG.", portrait: s_portrait_null_normal_smile, sound: player_voice },
    { text: "Okay, and that game it called?", portrait: npc_portrait, sound: npc_voice },
	 { text: "Hobos and Homicides.", portrait: s_portrait_null_normal_question, sound: player_voice },
    { text: "My point exactly. We didn't have terrible things like that when I was a young.", portrait: npc_portrait, sound: npc_voice },
   { text: "Hey, when you were a baby you would watch a rabbit shoot a duck in the face all day long.", portrait: s_portrait_null_normal_smile, sound: player_voice },
   { text: "They actually had value. Our cartoons had beautiful scores that introduced my generation to classical music.", portrait: npc_portrait, sound: npc_voice },
   { text: "You can't just slap some classical music on mindless fighting and say that it adds value.", portrait: s_portrait_null_normal_question, sound: player_voice },  
   { text: "Well, you're not playing your homo game with your friends in the store. I know you, and you'll make a huge mess.", portrait: npc_portrait, sound: npc_voice },
    { text: "You're going to have to play in the storage room.", portrait: npc_portrait, sound: npc_voice },
   { text: "The storage room? You mean the basement! But there are gigantic bugs down there!", portrait: s_portrait_null_normal_smile, sound: player_voice },
      { text: "Well, maybe you can use some of the moves you've picked up in your little video games to squash them.", portrait: npc_portrait, sound: npc_voice },
  
  { text: "Maybe I will...", portrait: s_portrait_null_normal_question, sound: player_voice, tag: "talked to grandpa intro" }
];
