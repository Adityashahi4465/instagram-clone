import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/screen/registration_screen.dart';

class LogicScreen extends StatelessWidget {
  const LogicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            print('register');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const RegistrationScreen()),
              ),
            );
          },
          child: const Text('register'),
        ),
      ),
    );
  }
}
