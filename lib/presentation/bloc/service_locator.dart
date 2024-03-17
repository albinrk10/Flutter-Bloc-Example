import 'package:blocs_app/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import '../../config/config.dart';

GetIt getIt = GetIt.instance;
void serviceLocatorInit() {
  getIt.registerSingleton(UsernameCubit());
  getIt.registerSingleton(RouterSimpleCubit());
  getIt.registerSingleton(CounterCubit());
  getIt.registerSingleton(ThemeCubit());

}
