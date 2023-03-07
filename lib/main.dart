import 'package:flutter/material.dart';
import 'package:flutter_base/config/app_config.dart';
import 'package:flutter_base/screens/login/bloc/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'routes/router.dart';

Future<void> main() async {
  await AppConfig.initialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Builder(
        builder: (context) {
          return MaterialApp.router(
            title: 'Template Base',
            theme: ThemeData(primarySwatch: Colors.blue),
            routerConfig: AppRouter(context.read<LoginCubit>()).router,
          );
        },
      ),
    );
  }
}
