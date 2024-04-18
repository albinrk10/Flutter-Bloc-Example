import 'package:bloc/bloc.dart';
import 'package:blocs_app/config/helpers/pokemon_information.dart';
import 'package:equatable/equatable.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(const PokemonState()) {
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
      final pokemonName = await PokemonInformation.getPokemonName(id);
      add(PokemonAdded(id: id, name: pokemonName));
      return pokemonName;
    } catch (e) {
      throw Exception('Error fetching pokemon name');
    }
  }
}
