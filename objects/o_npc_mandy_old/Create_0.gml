isInConvo = 0;

speaker[0] = "Mandy";
speaker[1] = "Agent";

dialogue = [
    { text: "Hi Agent!", portrait: s_portrait_mandy, sound: sn_mandy_voice_blip1 },
    { text: "Hi Mandy!", portrait: s_portrait_null_normal, sound: sn_grandpa_voice },
    { text: "Thanks for the gift!", portrait: s_portrait_null_normal_smile, sound: sn_grandpa_voice },
    { text: "You're welcome!", portrait: s_portrait_mandy, sound: sn_mandy_voice_blip1 },
    { text: "I hope you don't mind me asking, but what's in it?", portrait: s_portrait_null_normal_question, sound: sn_grandpa_voice },
    { text: "SOMETHING THAT WILL CHANGE YOUR LIFE FOREVER!!!", portrait: s_portrait_mandy, sound: sn_mandy_voice_blip1 }
];

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(dialogue[currentline].text);
text = "";

var is_player_speaking = 0;
