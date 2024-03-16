import 'package:blocs_app/presentation/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/config.dart';
import 'presentation/bloc/bloc.dart';

void main() {
  runApp(const BlocProviders());
}

class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      //Usamos lazy false para que inicie todos lo bloc al iniciar la app, true en caso contrario
      BlocProvider(
        create: (context) => UsernameCubit(),
        lazy: false,
      ),
      BlocProvider(create: (context) => RouterSimpleCubit()),
      BlocProvider(create: (context) => CounterCubit()),
    ], child: const App());
  }
}
