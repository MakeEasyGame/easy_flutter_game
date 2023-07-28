import 'package:flutter/material.dart';

class ReadyView extends StatelessWidget {
  const ReadyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed('/game');
          },
          child: const Text('Start Game'),
        )
      ),
    );
  }
}
