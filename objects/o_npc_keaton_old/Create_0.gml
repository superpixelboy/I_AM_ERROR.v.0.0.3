isInConvo = false;

speaker[0] = "Keaton";
speaker[1] = "Agent";

dialogue = [
    { text: "Eventhough Birthdays were invented by big candy to\nsell chocolates. I hope you have a good one.", portrait: s_portrait_keaton, sound:  sn_grandpa_voice },
    { text: "Thanks Keaton...", portrait: s_portrait_null_normal, sound: sn_grandpa_voice },
    { text: "Does that mean that you bought me chocolates?", portrait: s_portrait_null_normal_question, sound: sn_grandpa_voice },
    { text: "No. I would never do that. I found a black flower for you.", portrait: s_portrait_keaton, sound: sn_grandpa_voice },
    { text: "Okay. But you kind of ruined the surprise.", portrait: s_portrait_null_normal_smile, sound: sn_grandpa_voice },
	{ text: "Surprises were invented by C-Mart to sell toys.", portrait: s_portrait_keaton, sound: sn_grandpa_voice }
];

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(dialogue[currentline].text);
text = "";
text_ready = false;

var is_player_speaking = 0;
