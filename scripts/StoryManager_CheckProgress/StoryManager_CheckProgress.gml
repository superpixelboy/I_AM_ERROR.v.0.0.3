function StoryManager_CheckProgress(){
	switch (global.story_stage) {
		
		//=====================Intro CAFE=========================================
	    case Scene.INTRO_FIND_FRIENDS:
			if(global.story_flags.talkedToMandyIntro && global.story_flags.talkedToKeatonIntro ){
				if (instance_exists(o_npc_rookie_intro2)) {
					
					with(o_npc_rookie_intro2){
						instance_create_layer(x, y, "Entities", o_npc_rookie_intro_cafe);
									instance_destroy();
								}
					
				}
				global.current_objective = "Talk to Rookie.";
			}
			else{
				global.current_objective = "Talk to Rookie, Mandy, and Keaton.";
			}
			
	        if (global.story_flags.talkedToRookieIntro) 
			{
				with(o_npc_grandpa_intro){
					
				
						instance_create_layer(x, y, "Entities", o_npc_grandpa_intro_missing);
						instance_destroy();
				}
	            global.story_stage = Scene.INTRO_TALK_TO_GRANDPA;
	            global.current_objective = "Talk to Grandpa.";
	   
	        }
			break;
			
			case Scene.INTRO_TALK_TO_GRANDPA:
			  if (global.story_flags.talkedToGrandpaRoomIntro) 
			{
				
	            global.story_stage = Scene.INTRO_HEAD_TO_BASEMENT;
	            global.current_objective = "Clear out the basement from bugs.";
	   
	        }
	        break;
			
		case Scene.INTRO_SHOW_19XX:
	         //   global.story_stage = Scene.INTRO_SHOW_19XX;
		      global.current_objective = "Show the Mystery game to your Friends.";  
	     
			  if (global.story_flags.headToAttic) 
				{
				 global.story_stage = Scene.INTRO_FIND_SPB;
		            global.current_objective = "Head to the attic to find the SPB game console.";
				}
			 break;
		case Scene.INTRO_FIND_SPB:
		  
	     
			if (global.story_flags.killAtticBugs) 
			{
				
		        global.current_objective = "Kill the bugs!";
			}
			else if (global.story_flags.killAtticBigBug) 
			{
				
		        global.current_objective = "Press down while running to slide and trip enemies.";
			}
			else{
				  global.current_objective = "Clear the attic of bugs.";  
			}
			
			break;
			
		case Scene.INTRO_SHOW_SPB:
			  global.current_objective = "Show the Super Pixel Boy to your friends.";  
			  break
	   
	}
		show_debug_message(global.current_objective);
}