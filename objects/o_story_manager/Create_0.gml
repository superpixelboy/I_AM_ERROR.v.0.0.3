// Initialize story state
global.story_stage = Scene.INTRO_FIND_FRIENDS;

global.story_flags = {
    talkedToMandyIntro: false,
    talkedToKeatonIntro: false,
    talkedToRookieIntro: false,
	talkedToGrandpaRoomIntro: false,
	foundMysteryGame: false,
	headToAttic: false,
	killAtticBugs: false,
	killAtticBigBug: false,
	foundSPB: false
};

// (Optional) Track current objective string
global.current_objective = "Find your friends.";
