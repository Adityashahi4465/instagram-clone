import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/custom_text_field.dart';
import '../../../core/common/heading_text.dart';
import '../../../theme.dart';
import '../controller/auth_controller.dart';

class UsernameInputScreen extends ConsumerWidget {
  const UsernameInputScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = ref.watch(pageControllerProvider);
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
      body: Column(
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
                const CustomTextField(
                  label: 'Username',
                  height: 80,
                  isPassword: false,
                ),
                CustomButton(
                  onTap: () {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                ),
              ],
            ),
          ),
          TextButton(
              onPressed: () {}, child: const Text('Already have an account?'))
        ],
      ),
    );
  }
}
