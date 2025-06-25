if (global.thisElectricTimer <= 0) {
    // The door is considered "closed" – wall is present
    image_alpha = 1;
    
    // If we haven't created the wall yet, create it
    if (!instance_exists(mywall)) {
        mywall = instance_create_layer(x, y, "Walls", o_wall);
        
        with (mywall) {
            image_xscale = 0.25;
            image_yscale = 0.75;
        }
    }
} else {
    // The door is considered "open" – wall is removed
    image_alpha = 0.5;
    
    // If the wall still exists, destroy it
    if (instance_exists(mywall)) {
        with (mywall) {
            instance_destroy();
        }
        mywall = noone; // Make sure we reset the pointer
    }
}
