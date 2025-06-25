switch (global.story_stage) {

	    case Scene.INTRO_SHOW_19XX:
			ReplaceObject(x,y,"Entities",o_npc_rookie_19XX,id);
	 break;
	    case Scene.INTRO_SHOW_SPB:
			ReplaceObject(x,y,"Entities",o_npc_rookie_spb,id);
	 break;
	
	
	}


alpha = 0;
nearby = false;

my_dialogue = [
	
    { text: "This is game going to be really fun... As long as you do exactly what I have planned.", portrait: npc_portrait, sound: npc_voice, tag: "exit" }
  
];

