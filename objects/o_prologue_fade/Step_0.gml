/// @description Insert description here
// You can write your code in this editor
// Assume max_timer is defined, e.g., max_timer = 60;

if(fadeInTimer<=maxfadeInTimer){
	fadeInTimer++;
	image_alpha = fadeInTimer / maxfadeInTimer;
}
else{
	timer--;
	if (instance_exists(o_black)) {
	    with (o_black) {
	        instance_destroy();
	    }
	}
}

// Fade out proportionally
if(timer<=175){
	image_alpha = timer / max_timer;
}
else
{
	//image_alpha=1;
}

// When fade is done
if (timer <= 0) {
    instance_create_layer(-1000, -1000, layer, o_npc_barista_intro_starting);
    instance_destroy();
}