import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone/features/auth/controller/auth_controller.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/custom_text_field.dart';
import '../../../core/common/heading_text.dart';
import '../../../models/usermodel.dart';

class NameInputScreen extends ConsumerStatefulWidget {
  const NameInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NameInputScreenState();
}

class _NameInputScreenState extends ConsumerState<NameInputScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final formData = ref.watch(signUpFormDataProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                    const HeadingText(heading: 'What\'s your name'),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomTextField(
                      controller: nameController,
                      label: 'Full name',
                      height: 80,
                      isPassword: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full name';
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
                                fullName: nameController.text.trim(),
                                birthDay: formData.state.birthDay,
                                email:  formData.state.email,
                                userName: formData.state.userName,
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
                  onPressed: () {},
                  child: const Text('Already have an account?'))
            ],
          ),
        ),
      ),
    );
  }
}
