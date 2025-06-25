/// @description Insert description here
// You can write your code in this editor
#macro st_hover 0
#macro st_chase 1
state = st_hover;
chase_speed = .5;

if(hasweapon){
	mygun = instance_create_layer(x,y,"Badguys",o_eGun)
	with (mygun)
	{
		owner = other.id;
	}
}
else if(hasbossweapon){
	mygun = instance_create_layer(x,y,"Badguys",o_eBossGun)
	with (mygun)
	{
		owner = other.id;
	}
}
else mygun = noone;
