import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/config.dart';
import '../bloc/bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouter =  context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;
    
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme( isDarkmode: theme.isDarkmode ).getTheme(),
    );
  }
}