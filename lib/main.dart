import 'package:blocs_app/presentation/screens/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/bloc/bloc.dart';


void main() {
  runApp(const BlocProviders());
}


class BlocProviders extends StatelessWidget {
  const BlocProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context) => UsernameCubit()),
      ], 
      child: const App()
    );
  }
}