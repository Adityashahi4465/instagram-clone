import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common/custom_button.dart';
import '../../../core/common/heading_text.dart';
import '../../../models/usermodel.dart';
import '../../../theme.dart';
import '../controller/auth_controller.dart';
import 'package:intl/intl.dart';

class AgeInputScreen extends ConsumerStatefulWidget {
  const AgeInputScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeInputScreenState();
}

class _AgeInputScreenState extends ConsumerState<AgeInputScreen> {
  DateTime _selectedDate = DateTime.now();
 
  Future<void> selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(
          days: (365 * 200),
        ),
      ),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  String calculateAge(DateTime birthDate) {
    final now = DateTime.now();
    var age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age.toString();
  }

  @override
  Widget build(BuildContext context) {
    final pageController = ref.watch(pageControllerProvider);
    final formData = ref.watch(signUpFormDataProvider.notifier);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeadingText(heading: 'What\'s you date of birth'),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'User your own date of birth, even if this account is for business, a pe or something else. No onw will see this unless you choose to share it Why do I need to provide my date of birth?',
                    style: AppTextStyle.textStyleBold.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      selectDate();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 14,
                      ),
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.faded.withOpacity(0.4),
                        border: Border.all(
                          width: 1.8,
                          color: AppColors.faded,
                        ),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Birthday (${calculateAge(_selectedDate)} year old)',
                            textAlign: TextAlign.start,
                            style: AppTextStyle.textStyleRegular.copyWith(
                              fontSize: 12,
                              color: AppColors.lightGrey,
                            ),
                          ),
                          Text(
                            DateFormat("d MMMM yyyy").format(_selectedDate),
                            textAlign: TextAlign.start,
                            style: AppTextStyle.textStyleBold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomButton(
                    label: 'Next',
                    onTap: () {
                     formData.update((state) => UserModel(
                                uid: formData.state.uid,
                                fullName: formData.state.fullName,
                                birthDay: _selectedDate,
                                email: formData.state.email,
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
      ),
    );
  }
}
