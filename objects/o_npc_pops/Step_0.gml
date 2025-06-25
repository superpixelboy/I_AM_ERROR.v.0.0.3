if instance_exists(o_player) {
    if (instance_exists(o_text)) {
        alpha = 0;
    } else {
        if (point_in_circle(o_player.x, o_player.y, x, y, 32)) {
            if (alpha < 1) alpha += 0.04;
            nearby = true;

            if (global.interactKey) {
                var txt = instance_create_layer(x, y - 64, "GUI", o_text);
                txt.dialogue = my_dialogue;
                txt.speaker_name = "Mandy"; // optional if you want to do speaker-specific styling
				txt.npc_portrait = s_portrait_pops; // ← Replace with correct NPC portrait
				 txt.npc_voice = sn_mandy_voice_blip1; // 🔊 NEW
				  txt.null_voice = sn_null_voice_blip1;
				
                with (o_player) {
                    state = PLAYERSTATE.DIALOGUE;
                }
            }
        } else {
            nearby = false;
            if (alpha > 0) alpha -= 0.06;
        }
    }
}
