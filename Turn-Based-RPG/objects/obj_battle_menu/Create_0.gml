_move_types = ["Attack", "Magic", "Prayer"] //The types of moves all characters can use
_move_choices = []; //The moves available to each individual character
_pos = 0;
_types_length = array_length(_move_types);
_choices_length = array_length(_move_choices);
_player_party = [];
_enemy_party = [];
_p_length = array_length(_player_party);
_e_length = array_length(_enemy_party);
_p_num = 0;
_selected_type = noone;
_selected_move = noone;
_selected_target = noone;
_exists = noone;
_delay = true;
_finished = false;
