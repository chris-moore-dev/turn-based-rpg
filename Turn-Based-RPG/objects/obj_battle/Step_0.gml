// This code dictates the flow of battle.
// NOTE all attacks are hardcoded to call attacks[0] (a unit's first attack),
// this will be changed when support for multiple attacks is added

if (_turn == "player" && _moved == false) { // Player turn
	// Begin attack on E button pressed
	if (keyboard_check_pressed(ord("E"))) { // Zandair needs to replace this button press with UI elements
		if (_gameover == false) {
			// Determine random damage
			var _dmg = irandom_range(party_units[_p_num]._attacks[0]._dmg_min, 
			party_units[_p_num]._attacks[0]._dmg_max);
		
			// Select random enemy to target (placeholder)
			var _target = select_target(enemy_units, _e_length);
			
			// Debug message
			show_debug_message("Player " + string(_p_num) + " (" + party_units[_p_num]._name + 
			") attacked enemy " + string(_target) + " (" + enemy_units[_target]._name + ") for " + 
			string(_dmg) + " damage using " + party_units[_p_num]._attacks[0]._weapon + "!"); 
			
			// Play attack sound and flash weapon
			audio_play_sound(party_units[_p_num]._attacks[0]._sound, 1, false);
			_show_wpn = true;
		
			// Decrease targeted enemy health
			enemy_units[_target]._hp -= _dmg;
			if (enemy_units[_target]._hp <= 0) { // Check if target was killed
				enemy_units[_target]._hp = 0;
				show_debug_message(enemy_units[_target]._name + " was killed!");
				instance_destroy(enemy_units[_e_num]);
				instance_destroy(enemy_shadows[_e_num]);
				enemy_units[_e_num] = "x"; // Magic letter to let array know this unit is dead
				_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
			}
		
			if (alarm[0] < 0 && _gameover == false) {
				alarm[0] = 120; // Wait and transition to next battle state
			}
		}
		_moved = true;
	}

} else if (_turn == "enemy" && _moved == false) { // Enemy turn
	if (_gameover == false) {
		// Determine random damage
		var _dmg = irandom_range(enemy_units[_e_num]._attacks[0]._dmg_min, 
		enemy_units[_e_num]._attacks[0]._dmg_max);
		
		// Select random living player to attack
		var _target = select_target(party_units, _p_length);
		
		// Debug message
		show_debug_message("Enemy " + string(_e_num) + " (" + enemy_units[_e_num]._name + 
		") attacked player " + string(_target) + " (" + party_units[_target]._name + ") for " + 
		string(_dmg) + " damage using " + enemy_units[_e_num]._attacks[0]._weapon + "!");
		
		// Play attack sound and flash weapon
		audio_play_sound(enemy_units[_e_num]._attacks[0]._sound, 1, false);
		_show_wpn = true;
		
		// Decrease targeted player's health
			party_units[_target]._hp -= _dmg;
			if (party_units[_target]._hp <= 0) {
				party_units[_target]._hp = 0;
				show_debug_message(party_units[_target]._name + " was killed!");
				instance_destroy(party_units[_p_num]);
				instance_destroy(party_shadows[_p_num]);
				party_units[_p_num] = "x"; // Magic letter to let array know this unit is dead
				_gameover = check_gameover(party_units, enemy_units); // Check if either party is defeated
			}
		
		if (_gameover == false) {
			alarm[0] = 120; // Wait and transition to next battle state
		}
	} 
	_moved = true;
}