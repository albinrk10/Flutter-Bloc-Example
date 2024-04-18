import 'package:blocs_app/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../config/config.dart';

GetIt getIt = GetIt.instance;
void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());
  getIt.registerSingleton(GuestsBloc());
  getIt.registerSingleton(PokemonBloc(
    fetchPokemon: PokemonInformation.getPokemonName,
  ));
  // final historicBloc = getIt.registerSingleton(HistoricLocationBloc());
   getIt.registerSingleton(HistoricLocationBloc());

  getIt.registerSingleton(
    GeolocationCubit(
      onNewUserLocationCallback: getIt<HistoricLocationBloc>().onNewUserLocation,
          )..watchUserLocation(),
  );
  // getIt.registerSingleton(HistoricLocationBloc());
}
