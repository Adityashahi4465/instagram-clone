import 'package:instagram_clone/features/auth/widgets/age_input_screen.dart';
import 'package:instagram_clone/features/auth/widgets/email_input_screen.dart';
import 'package:instagram_clone/features/auth/widgets/name_input_screen.dart';
import 'package:instagram_clone/features/auth/widgets/username_input_screen.dart';

import '../../features/auth/widgets/password_input_screen.dart';

List registrationPages = [
  NameInputScreen(),
  PasswordInputScreen(),
  AgeInputScreen(),
  UsernameInputScreen(),
  EmailInputScreen(),
];
