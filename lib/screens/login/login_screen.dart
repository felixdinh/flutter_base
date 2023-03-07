import 'package:flutter/material.dart';
import 'package:flutter_base/routes/route_path.dart';
import 'package:flutter_base/screens/login/bloc/login_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login screen',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  context.go(RoutePaths.home);
                },
                child: Text('Go to Home')),
            ElevatedButton(
                onPressed: () {
                  context.read<LoginCubit>().login();
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
