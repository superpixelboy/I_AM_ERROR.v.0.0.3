/// @description Insert description here
// You can write your code in this editor

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
