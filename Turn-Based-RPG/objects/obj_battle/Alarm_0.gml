// Resolve battle state transition

if (_e_state == "dead") {
	show_debug_message("Game Over! Player party wins.");
}

else if (_p_state == "dead") {
	show_debug_message("Game Over! Enemy party wins.");
}

else if (_turn == "player") {
	while (true) { // Repeat until living unit is found
		if (_e_num+1 < _e_length) {
			_e_num++; // Increment enemy party array
		} else {
			_e_num = 0; // Wrap around to index 0
		}
		
		if (enemy_units[_e_num]._hp > 0) {
			break;
		} else {
			instance_destroy(enemy_units[_e_num]);
			instance_destroy(enemy_shadows[_e_num]);
			show_debug_message("Enemy " + string(_e_num+1) + " is dead, skipping...");
		}
	}
	show_debug_message("Begin enemy " + string(_e_num+1) + "'s turn");
	_turn = "enemy"; // Switch to enemy turn
} 

else if (_turn == "enemy") { 
	while (true) { // Repeat until living unit is found
		if (_p_num+1 < _p_length) {
			_p_num++; // Increment player party array
		} else {
			_p_num = 0; // Wrap around to index 0
		}
		
		if (party_units[_p_num]._hp > 0) {
			break;
		} else {
			instance_destroy(party_units[_p_num]);
			instance_destroy(party_shadows[_p_num]);
			show_debug_message("Player " + string(_p_num+1) + " is dead, skipping...");
		}
	}
	show_debug_message("Begin player " + string(_p_num+1) + "'s turn");
	_turn = "player"; // Switch to player turn
} 


	
