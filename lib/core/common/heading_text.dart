
import 'package:flutter/material.dart';

import '../../theme.dart';

class HeadingText extends StatelessWidget {
  final String heading;
  const HeadingText({
    super.key,
    required this.heading,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      heading,
      style: AppTextStyle.textStyleBold.copyWith(
        fontSize: 34,
      ),
    );
  }
}