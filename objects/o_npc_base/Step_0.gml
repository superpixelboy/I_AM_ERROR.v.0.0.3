if (!instance_exists(o_player)) exit;

if (instance_exists(o_text)) {
    alpha = 0;
    nearby = false;
    exit;
}

if (distance_to_object(o_player) < talk_distance&&!global.isRecievingItem&&global.showHUD) {
    nearby = true;
    alpha = clamp(alpha + fade_speed, 0, 1);

    if (global.interactKey && !just_talked) {
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
    }
} else {
    nearby = false;
    alpha = clamp(alpha - (fade_speed * 1.5), 0, 1);
}
