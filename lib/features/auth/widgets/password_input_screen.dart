import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/auth/controller/auth_controller.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/custom_text_field.dart';
import '../../../core/common/heading_text.dart';
import '../../../theme.dart';

class PasswordInputScreen extends ConsumerStatefulWidget {
  const PasswordInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordInputScreenState();
}

class _PasswordInputScreenState extends ConsumerState<PasswordInputScreen> {
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final password = ref.watch(passwordInputProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print('dfsdfa');
            pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeadingText(heading: 'Create a password'),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Create a password with at least 6 letters or numbers. it should be something that others can\'t guess.',
                      style: AppTextStyle.textStyleBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      label: 'Password',
                      height: 80,
                      isPassword: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a password';
                        } else if (value.length < 6) {
                          return 'Password must me 6 character long';
                        }
                        return null;
                      },
                    ),
                    CustomButton(
                      label: 'Next',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          password.state = passwordController.text.trim();

                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text('Already have an account?'))
            ],
          ),
        ),
      ),
    );
  }
}
