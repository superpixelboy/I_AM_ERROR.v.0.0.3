if (isInConvo) {
    var fulltext = dialogue[currentline].text;
    letters += spd;
    text = string_copy(fulltext, 1, floor(letters));

    if (letters >= string_length(fulltext)) {
        if (global.dialogue_input_detected) {
            currentline++;
            if (currentline >= array_length(dialogue)) {
                isInConvo = false;
                currentline = 0;
                letters = 0;

                with (o_player) {
                    state = PLAYERSTATE.FREE;
                }
            } else {
                letters = 0;
                text = "";
            }
        }
    }
}
else {
    if (point_in_circle(o_player.x, o_player.y, x, y, 64)) {
        nearby = true;
        alpha = min(alpha + 0.1, 1);

        if (global.dialogue_input_detected) {
            isInConvo = true;
            currentline = 0;
            letters = 0;
            text = "";

            with (o_player) {
                state = PLAYERSTATE.DIALOGUE;
            }
        }
    } else {
        nearby = false;
        alpha = max(alpha - 0.1, 0);
    }
}
