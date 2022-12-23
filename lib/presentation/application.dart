import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_tony_pyzev/presentation/screens/home/cubit/home_cubit.dart';
import 'package:test_task_tony_pyzev/presentation/screens/home/home_screen.dart';
import 'package:test_task_tony_pyzev/presentation/theme/app_theme.dart';

class Application extends StatelessWidget {
  final String _title = 'Test Task';

  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit()..initState(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: _title,
            theme: AppTheme().appTheme,
            debugShowCheckedModeBanner: false,
            home: HomeScreen(
              cubit: context.read<HomeCubit>(),
            ),
          );
        },
      ),
    );
  }
}
