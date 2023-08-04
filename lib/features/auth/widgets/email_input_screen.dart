import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/core/utils/extensions/username_validator.dart';
import 'package:instagram_clone/models/usermodel.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/custom_text_field.dart';
import '../../../core/common/heading_text.dart';
import '../../../core/common/loader.dart';
import '../../../theme.dart';
import '../controller/auth_controller.dart';

class EmailInputScreen extends ConsumerStatefulWidget {
  const EmailInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailInputScreenState();
}

class _EmailInputScreenState extends ConsumerState<EmailInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  void signUpWithEmail() {
    ref
        .read(authControllerProvider.notifier)
        .signUpWithEmailAndPassword(context);
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final formData = ref.watch(signUpFormDataProvider.notifier);
    final password = ref.watch(passwordInputProvider.notifier);
    final isLoading = ref.watch(authControllerProvider);
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
                    const HeadingText(heading: 'What\'s your email address?'),
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      'Enter the email address at which you can be contacted. No one will see this on you profile.',
                      style: AppTextStyle.textStyleBold.copyWith(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      controller: emailController,
                      label: 'Email address',
                      height: 80,
                      isPassword: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a email';
                        } else if (!value.isValidEmail()) {
                          return 'Please provide a valid email';
                        }
                        return null;
                      },
                    ),
                    isLoading
                        ? const Loader()
                        : CustomButton(
                            label: 'Submit',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                formData.update((state) => UserModel(
                                      uid: formData.state.uid,
                                      fullName: formData.state.fullName,
                                      birthDay: formData.state.birthDay,
                                      email: emailController.text.trim(),
                                      userName: formData.state.userName,
                                      followers: [],
                                      following: [],
                                      profilePic: '',
                                      bio: '',
                                      link: '',
                                      joinedAt: DateTime.now(),
                                    ));
                                signUpWithEmail();

                                print(
                                    'form submitted :  ${formData.state}  \n ${password.state}');
                              }
                            },
                          ),
                    const SizedBox(
                      height: 12,
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign up with Mobile Number',
                      ),
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
