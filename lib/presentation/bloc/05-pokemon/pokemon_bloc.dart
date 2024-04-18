import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
 

  final Future<String> Function(int id) _fetchPokemonName;
  
  PokemonBloc({
    required Future<String>Function(int id) fetchPokemon
  }) :_fetchPokemonName = fetchPokemon, 
  super(const PokemonState()) {
    on<PokemonAdded>((event, emit) {
      final pokemons = Map<int, String>.from(state.pokemons);
      pokemons[event.id] = event.name;
      emit(state.copyWith(pokemons: pokemons));
    });
  }
  Future<String> fecthPokemonName(int id) async {
    if (state.pokemons.containsKey(id)) {
      return state.pokemons[id]!;
    }
    try {
      final pokemonName = await _fetchPokemonName(id);
      add(PokemonAdded(id, pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon name');
    }
  }
}
