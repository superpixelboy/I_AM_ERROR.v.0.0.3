/// STEP EVENT or wherever the gun logic is

// Position the gun based on the owner (frog, etc.)
x = owner.x;
y = owner.y + 10;

// Scale
image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(o_player))
{
    // Flip Y-scale if player is to the left (so it mirrors properly)
    if (o_player.x < x) {
        image_yscale = -image_yscale;
    }
    
    // Player detection range
    if (point_distance(o_player.x, o_player.y, x, y) < 600)
    {
        // Aim at player
        image_angle = point_direction(x, y, o_player.x, o_player.y);
        
        // Only start countdown if the owner is in the "hop" sprite (example logic)
        if (owner.sprite_index == s_frog_hop) {
            countDown--;
        }
        
        // Time to shoot
        if (countDown <= 0) {
            countDown = countDownRate;
            
            // --- Check line of sight for BOTH wall and one-way ---
            var blockWall   = collision_line(x, y, o_player.x, o_player.y, o_wall,   false, false);
            var blockOneway = collision_line(x, y, o_player.x, o_player.y, o_oneway, false, false);
            
            if (!blockWall && !blockOneway)
            {
                // If NEITHER is blocking, we can shoot
                audio_sound_pitch(sn_punch1, choose(0.8, 1.0, 1.2));
                audio_play_sound(sn_punch1, 5, false);
                
                with (instance_create_layer(x, y, "Badguys", o_eBlast))
                {
                    spd = 2;
                    direction = other.image_angle + random_range(-3, 3);
                    image_angle = direction;
                }
            }
        }
    }
}
