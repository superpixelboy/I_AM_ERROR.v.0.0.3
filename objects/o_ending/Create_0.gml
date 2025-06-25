/// @description The Scripts to play on the ending screen
// You can write your code in this editor

endtext[0] = "null managed to stop " + string(global.kills) + " of Techtonic's minions.";
endtext[1] = "But there is still so much to do...";
endtext[2] = "null ran off into the night, ready for her next mission.";
endtext[3] = "The end...";
endtext[4] = "...for now...";

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";
