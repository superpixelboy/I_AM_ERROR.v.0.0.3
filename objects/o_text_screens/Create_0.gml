/// @description Insert description here
// You can write your code in this editor
currentline = 0;
letters = 0;
spd = 0.5;
text = "";
last_played_sound = noone;
can_advance = false;

if (!variable_instance_exists(id, "npc_voice")) npc_voice = noone;
if (!variable_instance_exists(id, "null_voice")) null_voice = noone;
