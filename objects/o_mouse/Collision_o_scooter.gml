/// @description Insert description here
// You can write your code in this editor
  knockBack =9;
	                // Make sure knockback direction is correct relative to the player
	                knockbackDir = (x > other.x) ? 1 : -1;  // Changed the logic to match direction
	                hp = hp - random_range(1,4);
	                flash = 3;    
	                ScreenShake(6,20);
	                hitTimer = 5;