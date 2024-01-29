//runs each frame
//IMPORTANT: OBJECTS MUST BE MARKED "Solid" TO HAVE WORKING NON-BASIC COLLISION WITH PLAYER

if (keyboard_check(ord("W")) && place_free(x, y - collision_speed)) { //move up, place_free handles collisions with objects marked solid. More infor on place_free in documentation.
	y -= _speed;
	image_index = 1;
	facing = 2;
}

if (keyboard_check(ord("A")) && place_free(x - collision_speed, y)) { //move left
	x -= _speed;
	image_index = 2;
	facing = 3;
}

if (keyboard_check(ord("S")) && place_free(x, y + collision_speed)) { //move down
	y += _speed;
	image_index = 0;
	facing = 1;
}

if (keyboard_check(ord("D")) && place_free(x + collision_speed, y)) { //move right
	x += _speed;
	image_index = 3;
	facing = 4;
}
if keyboard_check_pressed(ord("P")) {
    if (!instance_exists(obj_stats_screen)) {
        instance_create_layer(0, 0, "Stats", obj_stats_screen); // Open the stats screen when "P" is pressed
    } else {
        instance_destroy(obj_stats_screen); // Close the stats screen when "P" is pressed again
    }
}