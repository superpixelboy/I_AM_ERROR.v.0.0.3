hsp = 7;
vsp = 0;
grv =0.2;

done = 0;
timer = 300;
size = 1;

image_speed = 0;
image_index = 0;
image_alpha = 1;
ScreenShake(6,60);
audio_play_sound(sn_smack,10,false);
game_set_speed(30,gamespeed_fps);
with (o_camera) follow = other.id;

