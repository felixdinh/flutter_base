import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Error code: 404',
              style: TextStyle(
                  color: Theme.of(context).errorColor,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            ),
            Text('PAGE NOT FOUND.',style: Theme.of(context).textTheme.labelLarge,)
          ],
        ),
      ),
    );
  }
}
