import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/utils/extensions/username_validator.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/custom_text_field.dart';
import '../../../core/common/heading_text.dart';
import '../../../models/usermodel.dart';
import '../../../theme.dart';
import '../controller/auth_controller.dart';

class UsernameInputScreen extends ConsumerStatefulWidget {
  const UsernameInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UsernameInputScreenState();
}

class _UsernameInputScreenState extends ConsumerState<UsernameInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final formData = ref.watch(signUpFormDataProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(heading: 'Create an username'),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Add a username or use our suggestion. You can change this at any time.',
                    style: AppTextStyle.textStyleBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextField(
                    controller: usernameController,
                    label: 'Username',
                    height: 80,
                    isPassword: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter a password';
                      } else if (value.length < 3) {
                        return 'username must me more the 3 characters';
                      } else if (!value.isValidUsername()) {
                        return 'please a valid username';
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                    label: 'Next',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        formData.update((state) => UserModel(
                              uid: formData.state.uid,
                              fullName: formData.state.fullName,
                              birthDay: formData.state.birthDay,
                              email: formData.state.email,
                              userName: usernameController.text.trim(),
                              followers: [],
                              following: [],
                              profilePic: '',
                              bio: '',
                              link: '',
                              joinedAt: DateTime.now(),
                            ));
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
                onPressed: () {}, child: const Text('Already have an account?'))
          ],
        ),
      ),
    );
  }
}
