/// @description Insert description here
// You can write your code in this editor
alpha = 0;
nearby = false;

my_dialogue = [
    { text: " I have a mobile  order for... ERROR?", portrait: npc_portrait, sound: npc_voice },

	/*
	  { text: "Oh! That's me, I think.", portrait: player_normal, sound: player_voice },
	{ text: "You think your name is ERROR?", portrait: npc_portrait, sound: npc_voice },
	{ text: "My name Null, but sometimes when I order things online the computer reads Null as an empty variable and it throws an error.", portrait: player_normal, sound: player_voice },
	{ text: "I guess its a bug with the mobile system Starbrews is using.", portrait: player_normal, sound: player_voice },
	{ text: "...", portrait: npc_portrait, sound: npc_voice },
	{ text: "Okay.", portrait: npc_portrait, sound: npc_voice },
	{ text: "I actually kind of wish my name was Error, because then I could stand in my brick house say 'I AM ERROR' like that NPC in Legend of Fantasy 2.", portrait: player_surprised, sound: player_voice  },
	{ text: "...", portrait: npc_portrait, sound: npc_voice },
	{ text: "...Do you... Uh, like video games?", portrait: player_surprised, sound: player_voice  },
	{ text: "I like the zombie-mushroom show. I think that was based off of a game.", portrait: npc_portrait, sound: npc_voice },
	{ text: "YES! I love that show.", portrait: player_surprised, sound: player_voice  },
	{ text: "I mean, I haven't seen it. But I hear it's good. Mushrooms just freak me out too much.", portrait: player_surprised, sound: player_voice  },
	{ text: "Okay Error, do you need a cup holder?", portrait: npc_portrait, sound: npc_voice },
    { text: "...", portrait: player_question, sound: player_voice },
*/
	
	{ text: "Yes, please.", portrait: player_normal, sound: player_voice, tag: "give_coffee"  }


];


//start into dialogue
global.convoTag = "NPC"; //<-- important!
        just_talked = true;
        alarm[0] = game_get_speed(gamespeed_fps) * dialogue_cooldown;

        var txt = instance_create_layer(x, y - 64, "GUI", o_text);
        txt.dialogue = my_dialogue;
        txt.npc_portrait = npc_portrait;
        txt.npc_voice = npc_voice;
        txt.player_voice = player_voice;

        with (o_player) {
            state = PLAYERSTATE.DIALOGUE;
        }