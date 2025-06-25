/// @description Insert description here
// You can write your code in this editor
//window_set_fullscreen(!window_get_fullscreen());

global.hasSP = false;
global.kills = 0;
global.killsthisroom = 0;
killtextscale = 1;

global.maxhp = 50;
global.hp = global.maxhp;
global.maxstamina=100;
global.stamina = global.maxstamina;
global.maxsp = 300;
global.sp = 0;
global.finisher_powerup=0;
global.up_powerup =0;
global.air_powerup =0;
global.forward_powerup =0;
global.duck_powerup =0;
global.player_falling =0;
global.wave =1;
global.xp=0;
global.combolevel=0;
global.combotime=900;
global.combotimer=0;
global.assisttype=1;
global.hasassit=1;
global.assistTime=3600;
//global.assistTime=600;
global.thisAssistTime=global.assistTime;
global.playerLevel=1;
global.stageLevel=1;
global.convoTag="";
global.interactKey=0;
global.in_dialogue=0;
//set global portrait info
global.player_normal = s_portrait_null_normal;
global.player_voice = sn_agent_voice_blip1;

global.dialogue_input_detected=0;
global.isRecievingItem=false;
//for double triggering Doors and stuff
global.inputCoolDown=0;
global.showHUD=false;

global.abilities = [
    "Finisher", // Replace with your actual ability names
    "Air Special",
	"Special",
    "Ducking Special"
];

//Doors and Transitions
global.entry_label = "";

/// Create Event of obj_controller
global.tier1_rooms = [ rW1T1_1, rW1T1_2, rW1T1_3, rW1T1_4 ];
global.tier2_rooms = [ rW1T2_1, rW1T2_2, rW1T2_3, rW1T2_4 ];

// How many Tier 1 rooms must be completed
global.TIER1_REQUIRED = 3; 

// Tracking how many Tier 1 rooms have been completed so far
global.tier1_count = 0; 

//Gate 1
global.gate1 = 0; 

// How many Tier 1 rooms must be completed
global.TIER2_REQUIRED = 3; 

// Tracking how many Tier 1 rooms have been completed so far
global.tier2_count = 0; 

if (!instance_exists(o_story_manager)) {
    instance_create_layer(x, y, "Controllers", o_story_manager);
}