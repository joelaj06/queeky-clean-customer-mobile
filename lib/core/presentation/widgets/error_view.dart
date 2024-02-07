import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Oops! You are viewing an error.',
                style: theme.titleLarge!.copyWith(height: 1.5),
              ),
              TextSpan(text: '  —  ', style: theme.titleMedium),
              TextSpan(
                text: 'Please restart the application',
                style: theme.titleMedium!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
