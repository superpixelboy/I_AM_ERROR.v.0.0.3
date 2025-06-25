function ProcessAttack(){

	if(sprite_index != argument0)
	{
		sprite_index = argument0;
		image_index =0;
		ds_list_clear(hitByAttack);
	}

	//use attack hitbox & check for hits
	mask_index = argument1;
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x,y,p_killable,hitByAttackNow,false);
	o_player.enemieshit = hits;
	//setup other variables
	//whatlevel of Combo
	comboLevel = argument2;


	if(hits >0&&comboLevel<2)
	{
		//Normal Attack and HitStun
		for (var i = 0; i < hits; i++)
		{
		
			//if this has not been hit by this attack
			var hitID = hitByAttackNow[|i];
			if (ds_list_find_index(hitByAttack,hitID) == -1)
			{
				ds_list_add(hitByAttack,hitID);
				with (hitID)
				{
					
				
					Generate_SP();
					if (canTakeNormalDMG){
						hp = hp -1-random_range(1,4);
						show_debug_message("OUCH!!!"+string(hp));
						flash = 3;	
					}
						
						audio_play_sound(choose(sn_smack,sn_punch1),1,false);
					hitfrom = other.direction;
					hitTimer = 45;
					
					if(other.x>x){
						with (instance_create_layer(bbox_right,other.y, "Bullets",o_hitspark))
						{
							image_xscale = -1;
						}
					}
					else{
						with (instance_create_layer(bbox_left,other.y, "Bullets",o_hitspark))
							{
								image_xscale = 1;
							}
					}
				
					

				}
			}
		}
	}
	
	else if(hits >0&&comboLevel==2)
	{
		//dive kick
		for (var i = 0; i < hits; i++)
		{
		
			//if this has not been hit by this attack
			var hitID = hitByAttackNow[|i];
			if (ds_list_find_index(hitByAttack,hitID) == -1)
			{
				ds_list_add(hitByAttack,hitID);
				with (hitID)
				{
					
				
					Generate_SP();
					
				
						hp = hp -1-random_range(1,4);
						flash = 3;	
					
						audio_play_sound(choose(sn_smack,sn_punch1),1,false);
					hitfrom = other.direction;
					hitTimer = 45;
					
					if(other.x>x){
						with (instance_create_layer(bbox_right,other.y, "Bullets",o_hitspark))
						{
							image_xscale = -1;
						}
					}
					else{
						with (instance_create_layer(bbox_left,other.y, "Bullets",o_hitspark))
							{
								image_xscale = 1;
							}
					}
				
					

				}
			}
		}
	}
	else if(hits >0&&comboLevel==3)
	{
		//knockback from combo
		audio_play_sound(sn_smack,5,false);
		
			for (var i = 0; i < hits; i++)
		    {
				 if (i >= ds_list_size(hitByAttackNow)) {
			        show_debug_message("Breaking loop: Exceeded hitByAttackNow size");
			        break;
			    }
		        var hitID = hitByAttackNow[|i];
		        if (ds_list_find_index(hitByAttack,hitID) == -1)
		        {
		            ds_list_add(hitByAttack,hitID);
		            with (hitID)
		            {
						if (canTakeNormalDMG){
							Generate_SP();
			                knockBack = 4;
			                // Make sure knockback direction is correct relative to the player
			                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
			                hp = hp - random_range(1,4);
							show_debug_message("OUCH!!!"+string(hp));
			                flash = 3;    
			                ScreenShake(6,20);
			                hitTimer = 5;
			                show_debug_message("Hit enemy! Direction: " + string(knockbackDir));
						}
		           
				   }
		        }
		    }
	}
	else if(hits >0&&comboLevel==4){
		//Duck Poke
		Generate_SP();
		for (var i = 0; i < hits; i++)
			{
		
				//if this has not been hit by this attack
				var hitID = hitByAttackNow[|i];
				if (ds_list_find_index(hitByAttack,hitID) == -1)
				{
					ds_list_add(hitByAttack,hitID);
					with (hitID)
					{
							Generate_SP();
		                knockBack =5;
		                // Make sure knockback direction is correct relative to the player
		                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
		                hp = hp - random_range(1,3);
		                flash = 3;    
		                ScreenShake(2,10);
		                hitTimer = 5;
	               
		            }
		        }
			}
	}
	else if(hits >0&&comboLevel==5){
		//SWEEP!
		audio_play_sound(sn_smack,5,false);
		
	
		for (var i = 0; i < hits; i++)
	    {
			
	        var hitID = hitByAttackNow[|i];
	        if (ds_list_find_index(hitByAttack,hitID) == -1)
	        {
	            ds_list_add(hitByAttack,hitID);
	            with (hitID)
	            {
					Generate_SP();
	                knockBack =9;
	                // Make sure knockback direction is correct relative to the player
	                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	                hp = hp - random_range(1,4)*2;
	                flash = 3;    
	                ScreenShake(6,20);
	                hitTimer = 5;
	                show_debug_message("Hit enemy! Direction: " + string(knockbackDir));
	            }
	        }
	    }
			
	}
	else if(hits >0&&comboLevel==6){
		//uppercut!
		audio_play_sound(sn_smack,5,false);
		
	
		for (var i = 0; i < hits; i++)
	    {
			
	        var hitID = hitByAttackNow[|i];
	        if (ds_list_find_index(hitByAttack,hitID) == -1)
	        {
	            ds_list_add(hitByAttack,hitID);
	            with (hitID)
	            {
						//Generate_SP();
	                knockBack =21;
	                // Make sure knockback direction is correct relative to the player
	                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	                hp = hp - random_range(1,4)*1.5;
	                flash = 3;    
	                ScreenShake(6,20);
	                hitTimer = 5;
	                show_debug_message("Hit enemy! Direction: " + string(knockbackDir));
	            }
	        }
	    }
			
	}
	ds_list_destroy(hitByAttackNow);
	mask_index = s_player_idle;
}