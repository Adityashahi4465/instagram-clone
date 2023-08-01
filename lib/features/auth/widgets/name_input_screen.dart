import 'package:flutter/material.dart';
import 'package:instagram_clone/features/auth/screen/registration_screen.dart';

import '../../../core/constants/typography.dart';
import '../../../theme.dart';

class NameInputScreen extends StatelessWidget {
  const NameInputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_rounded),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'What\'s your name?',
                  style: Typogaphy.medium.copyWith(
                    color: Colors.white,
                    fontSize: 34,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextField(
                  maxLines: 2,
                  decoration: InputDecoration(
                    label: const Text('Full Nmae'),
                    filled: true,
                    fillColor: AppColors.grey,
              
                  
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                InkWell(
                  onTap: () => nextPage(),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(34),
                    ),
                    child: const Center(child: Text('Next')),
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Already have an account?'),
          ),
        ],
      ),
    );
  }
}
