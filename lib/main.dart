import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram_clone/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaClone',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme().darkTheme,
      theme: AppTheme().lightTheme,
      home: const LogicScreen(),
    );
  }
}
