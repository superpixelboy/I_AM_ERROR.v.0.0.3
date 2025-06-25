// Story_Manager.gml

// Declare this enum once and globally accessible
enum Scene {
    INTRO_CAFE,
    INTRO_FIND_FRIENDS,
    INTRO_TALK_TO_ROOKIE,
    INTRO_TALK_TO_GRANDPA,
    INTRO_HEAD_TO_BASEMENT,
    INTRO_SHOW_19XX,
    INTRO_FIND_SPB,
    INTRO_SHOW_SPB,
    ENDGAME
}

// Initialize story stage (usually called in obj_gameManager.Create)
global.story_stage = Scene.INTRO_CAFE;

//Intro Cafe Story (OLD!! CHECK THE STORY MANAGER OBJECT!)
global.story_flags = {
    talked_to_mandy_cafe_intro: false,
    talked_to_keaton_intro: false,
    talked_to_rookie_intro: false,
	talked_to_grandpa_room_intro: false
};