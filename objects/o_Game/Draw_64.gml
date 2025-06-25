/// @description Draw GUI
// You can write your code in this editor
/*
if(room != rMenu) && (instance_exists(o_player)) 
{
	if(room != RoomHC && (global.kills > 0)) {
		//GUI not in Survival
	killtextscale = max(killtextscale * 0.95,1);
	DrawSetText(c_black,f_menu,fa_right,fa_top);
	/*old kill counter
	draw_text_transformed(display_get_gui_width()-8,12,string(global.kills) + " Kills", killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(display_get_gui_width()-10,10,string(global.kills) + " Kills", killtextscale,killtextscale,0);
	draw_set_color(c_white);
	*/
	/*
	draw_text_transformed(display_get_gui_width()-8,12,string(global.playerLevel) + " Level:", killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(display_get_gui_width()-10,10,string(global.playerLevel) + " Level", killtextscale,killtextscale,0);
	draw_set_color(c_white);
	
	DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(display_get_gui_width()-8,45,"XP: " + string(global.xp), killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(display_get_gui_width()-10,43,"XP: " + string(global.xp), killtextscale,killtextscale,0);
	draw_set_color(c_white);
	
		DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(display_get_gui_width()-8,85,"Combo " + string(global.combolevel), killtextscale*(global.combolevel/2),killtextscale*(global.combolevel/2),0);
	
	if(global.combolevel<3){
		draw_set_color(c_white);
	}
	else if (global.combolevel<6){
		draw_set_color(c_yellow);
	}
	else if (global.combolevel<9){
		draw_set_color(c_orange);
	}
	else if (global.combolevel<12){
		draw_set_color(c_red);
	}
	else{
		draw_set_color(c_black);
	}
	
	draw_text_transformed(display_get_gui_width()-10,83,"Combo " + string(global.combolevel), killtextscale*(global.combolevel/2),killtextscale*(global.combolevel/2),0);
	draw_set_color(c_white);
	}
	
	else if (room != IntroBookstore){
	killtextscale = 1;
	if(room==RoomHC){
		DrawSetText(c_black,f_menu,fa_right,fa_top);
		draw_text_transformed(display_get_gui_width()-8,12,"Wave: " + string(global.wave), killtextscale,killtextscale,0);
		draw_set_color(c_white);
		draw_text_transformed(display_get_gui_width()-10,10,"Wave: " + string(global.wave), killtextscale,killtextscale,0);
		draw_set_color(c_white);
	}

	DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(display_get_gui_width()-8,45,"DigiTokens: " + string(global.xp), killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(display_get_gui_width()-10,43,"DigiTokens: " + string(global.xp), killtextscale,killtextscale,0);
	draw_set_color(c_white);
	
		DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(display_get_gui_width()-8,85,"Combo " + string(global.combolevel), killtextscale*(global.combolevel/2),killtextscale*(global.combolevel/2),0);
	
	if(global.combolevel<3){
		draw_set_color(c_white);
	}
	else if (global.combolevel<6){
		draw_set_color(c_yellow);
	}
	else if (global.combolevel<9){
		draw_set_color(c_orange);
	}
	else if (global.combolevel<12){
		draw_set_color(c_red);
	}
	else{
		draw_set_color(c_black);
	}
	
	draw_text_transformed(display_get_gui_width()-10,83,"Combo " + string(global.combolevel), killtextscale*(global.combolevel/2),killtextscale*(global.combolevel/2),0);
	draw_set_color(c_white);
	}
}
*/
//if((room != rMenu) && (instance_exists(o_player))&&(!instance_exists(o_text)))
if((room != rMenu) && (instance_exists(o_player))&&global.showHUD)
{
	
	
	DrawSetText(c_black,f_menu,fa_right,fa_top);
	draw_text_transformed(display_get_gui_width()-8,45,global.current_objective, 1,1,0);
	draw_set_color(c_yellow);
	draw_text_transformed(display_get_gui_width()-10,43,global.current_objective, 1,1,0);
}
	