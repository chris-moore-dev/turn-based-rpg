// Enumeration of battle states (turns)
enum turn {
	player,
	enemy,
	gameover,
}

// Enumeration of items/magic to display on screen
enum display {
	weapon,
	magic_weapon,
	spell,
	prayer_book,
	prayer,
}

// Call this function to start a battle with a 
// defined set of enemies and a chosen background
function battle_start(enemies, background) {
	instance_create_depth (
		camera_get_view_x(view_camera[0]),
		camera_get_view_y(view_camera[0]),
		0,
		obj_battle,
		{enemies: enemies, trigger: id, battle_background: background}
	);
}

function resolve_state_transition(state, p_turn, e_turn, party_units, enemy_units) {
	// Switch to player turn
	if (state == turn.enemy) {
		// Update status effects before turn begins
		update_status_effects(party_units);
		// Save the position of the character that previously moved
		var p_select = p_turn;
		// Find the next living character to give the turn to
		while (true) {
			if (p_select+1 < array_length(party_units)) {
				// If p_select less than party array length,
				// check next character in party
				p_select++; 
			} else {
				// Otherwise, wrap around to beginning of party array
				p_select = 0; 
			}

			// Check to see if this character is alive
			// Otherwise, continue while() loop
			if (party_units[p_select]._is_dead == false) {
				// Give this character and their party the next turn
				p_num = p_select;
				show_debug_message("Beginning player " + string(p_select) + "'s turn")
				return turn.player;
			}
			
			show_debug_message("Player " + string(p_select) + " is dead, skipping...");
			
			// If the entire array has been searched, no characters in 
			// this party are left alive, so the game is over.
			if(p_select == p_turn) {
				state = turn.gameover;
				show_debug_message("Enemy team is victorious. [BATTLE OVER]");
				break;
			} 
		}
	}
	
	// Switch to enemy turn
	if (state == turn.player) {
		// Update status effects before turn begins
		update_status_effects(enemy_units);
		// Save the position of the character that previously moved
		var e_select = e_turn;
		// Find the next living character to give the turn to
		while (true) {
			if (e_select+1 < array_length(enemy_units)) {
				// If p_select less than party array length,
				// check next character in party
				e_select++; 
			} else {
				// Otherwise, wrap around to beginning of party array
				e_select = 0; 
			}

			// Check to see if this character is alive
			// Otherwise, continue while() loop
			if (enemy_units[e_select]._is_dead == false) {
				// Give this character and their party the next turn
				e_num = e_select;
				show_debug_message("Beginning enemy " + string(e_select) + "'s turn")
				return turn.enemy;
			}
			
			show_debug_message("Enemy " + string(e_select) + " is dead, skipping...");
			
			// If the entire array has been searched, no characters in 
			// this party are left alive, so the game is over.
			if(e_select == e_turn) {
				state = turn.gameover;
				show_debug_message("Player team is victorious. [BATTLE OVER]");
				break;
			} 
		}
	}
	
	// If either party is defeated, destroy battle instance
	if (state == turn.gameover) {
		instance_destroy();
	}
}

// Call this function to change a character's hp, 
// either positively or negatively
function change_hp(character, type, dmg) {
	if(dmg > 0) {
		// Call damage calculation function
		character._hp -= calculate_damage(character, type, dmg);
		// Check to see if this killed the selected character
		if(character._hp <= 0) { 
			kill_target(character);
		}
		// Check if character was killed
	} else {
		// If _dmg <= 0, simply add HP
		character._hp -= dmg;
	}
}

// Call this function to change a character's hp, either
// positively or negatively
function change_hp(_character, _type, _dmg) {
	if(_dmg > 0) {
		// Call damage calculation function
		_character._hp -= calculate_damage(_character, _type, _dmg);
	} else {
		// If _dmg <= 0, simply add HP
		_character._hp -= _dmg;
	}
}

// Call this function to factor in a character's damage 
// resistance before dealing damage to them
function calculate_damage(character, type, dmg) {
	var res = 0; // Target's armor resistance
	
	if (type == "slash") {
		res = (character._armor_head._prot_slash 
		+ character._armor_chest._prot_slash
		+ character._armor_legs._prot_slash);
	} else if (type == "pierce") {
		res = (character._armor_head._prot_pierce
		+ character._armor_chest._prot_pierce
		+ character._armor_legs._prot_pierce);
	} else if (type == "blunt") {
		res = (character._armor_head._prot_blunt
		+ character._armor_chest._prot_blunt
		+ character._armor_legs._prot_blunt);
	} else if (type == "magic") {
		res = (character._armor_head._prot_magic
		+ character._armor_chest._prot_magic
		+ character._armor_legs._prot_magic);
	} else if (type == "fire") {
		res = (character._armor_head._prot_fire
		+ character._armor_chest._prot_fire
		+ character._armor_legs._prot_fire);
	} else if (type == "ice") {
		res = (character._armor_head._prot_ice
		+ character._armor_chest._prot_ice
		+ character._armor_legs._prot_ice);
	}
	else {
		return 0;
	}
	
	new_dmg = ceil(dmg * ((100 - res) / 100));
	
	show_debug_message(character._name + " blocked " + string(dmg - new_dmg) 
	+ " damage due to " + string(res) + " " + string(type) 
	+ " resistance. Damage taken: " + string(new_dmg) + ".")
	
	return new_dmg;
}

// Update the targeted party's status effects
function update_status_effects(party) {
	// Check each character in the party
	for (var e = 0; e < array_length(party); e++) {
		// Check each status effect of selected character
		if(!is_undefined(party[e]._effects)) {
			for(var i = 0; i < array_length(party[e]._effects); i++) {
				// If character is alive, inflict damage
				if(party[e]._is_dead == false) {
					// Inflict random damage
					var temp = irandom_range(party[e]._effects[i]._dmg_min,
					party[e]._effects[i]._dmg_max)
					// Prayers ignore armor, so no need to call change_hp()
					party[e]._hp -= temp;
					// Check to see if status effect killed character
					if(party[e]._hp <= 0) { 
						kill_target(party[e]);
					}
					show_debug_message(string(party[e]._effects[i]._name) + " dealt "
					+ string(temp) + " damage to " + string(party[e]._name) + "!");
				}
				
				// Check if character is alive again, in case they were just killed
				if(party[e]._is_dead == false) {
					// If alive, decrease their current status effect length by 1
					party[e]._effects_remaining_turns[i]--;
					show_debug_message("Resulting duration of " + 
					string(party[e]._effects[i]._name) + ": "
					+ string(party[e]._effects_remaining_turns[i]));
					
					// If the status effect has run its course, delete it from the character
					if (party[e]._effects_remaining_turns[i] < 1) {
						array_delete(party[e]._effects, i, 1);
						array_delete(party[e]._effects_remaining_turns, i, 1);
					}
				} else {
					// If character is dead, set remaining turns on current status effect to 0
					party[e]._effects_remaining_turns[i] = 0;
				}
			}
		}
	}
}

// Kill the targeted character
function kill_target(_target) {
	// Set hp to 0 and _is_dead to true
	_target._hp = 0;
	_target._is_dead = true;
	// Make the target's shadow invisible
	if (state == turn.enemy) {
		party_shadows[target].visible = false;
	} else {
		enemy_shadows[target].visible = false;
	}
	// Make target invisible, can't 
	// destroy it or it messes things up
	_target.visible = false; 
}

// Code for showing move-related sprites
function flash_item(type) {
	if (state == turn.player) {
		if (type = display.weapon) { // Flash player weapon
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite, global.party[p_num])
			temp._sprite = party_units[p_num]._weapon._sprite;
			temp._scale = 1;
			temp._time = 1000;
		}

		if (type = display.spell) { // Flash player magic weapon
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite, global.party[p_num]);
			temp._sprite = party_units[p_num]._magic_weapon._sprite;
			temp._scale = 1;
		}

		if (type = display.magic_weapon) { // Flash player spell
			var temp = instance_create_depth(party_units[p_num].x+42, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_sprite, global.party[p_num]);
			temp._sprite = party_units[p_num]._spells[move_num]._sprite;
			temp._scale = 1;
			_show_spell = false;
		}

		if (type = display.prayer_book) { // Flash player prayer book
			var temp = instance_create_depth(party_units[p_num].x+13, party_units[p_num].y+24, party_units[p_num].depth-1,
			obj_sprite, global.party[p_num]);
			temp._sprite = party_units[p_num]._prayer_book._sprite;
			temp._scale = 1;
			_show_prayer_book = false;
		}

		if (type = display.prayer) { // Flash player prayer
			var temp = instance_create_depth(party_units[p_num].x+42, party_units[p_num].y-2, party_units[p_num].depth-1,
			obj_sprite, global.party[p_num]);
			temp._sprite = party_units[p_num]._prayers[move_num]._sprite;
			temp._scale = 1;
			_show_prayer = false;
		}
	}
	
	if (state == turn.enemy) {
		if (type = display.weapon) { // Flash enemy weapon
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._weapon._sprite;
			temp._scale = -1;
		}

		if (type = display.spell) { // Flash enemy spell
			var temp = instance_create_depth(enemy_units[e_num].x-42, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._spells[move_num]._sprite;
			temp._scale = -1;
		}

		if (type = display.magic_weapon) { // Flash enemy magic weapon
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._magic_weapon._sprite;
			temp._scale = -1;
		}

		if (type = display.prayer_book) { // Flash enemy prayer book
			var temp = instance_create_depth(enemy_units[e_num].x-13, enemy_units[e_num].y+24, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._prayer_book._sprite;
			temp._scale = -1;
		}

		if (type = display.prayer) { // Flash enemy prayer
			var temp = instance_create_depth(enemy_units[e_num].x-42, enemy_units[e_num].y-2, enemy_units[e_num].depth-1,
			obj_sprite, enemies[e_num])
			temp._sprite = enemy_units[e_num]._prayers[move_num]._sprite;
			temp._scale = -1;
		}
	}
}

// This function is run at a battle's end, and
// primarily concerns giving the party members XP
function battle_end(party_units, xp_gained) {
	// Increase XP for each party member
	for (var i = 0; i < array_length(party_units); i++) {
		if (xp_gained[i] > 0) {
			global.party[i]._xp += xp_gained[i];
			show_debug_message(string(global.party[i]._name) + " gained "
			+ string(xp_gained[i]) + " XP!");
		}
	}
}
