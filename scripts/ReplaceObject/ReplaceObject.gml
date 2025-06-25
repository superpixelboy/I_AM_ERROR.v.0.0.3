function ReplaceObject(x, y, layer, new_object, target) {
    instance_create_layer(x, y, layer, new_object);
    with (target) {
        instance_destroy();
    }
}

/*============Example of how to call:

ReplaceObject(x, y, "Instances", obj_newThing, id);

*/