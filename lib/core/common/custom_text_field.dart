import 'package:flutter/material.dart';

import '../../theme.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final double height;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.height,
    required this.isPassword,
    required this.validator, required this.controller,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TextFormField(
        controller: widget.controller,
        autofocus: true,
        textAlignVertical: TextAlignVertical.top,
        obscureText: !widget.isPassword ? false : isObscure,
        validator: widget.validator,
        decoration: InputDecoration(
            label: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                widget.label,
              ),
            ),
            filled: true,
            fillColor: AppColors.faded.withOpacity(0.4),
            labelStyle: AppTextStyle.textStyleRegular.copyWith(
              color: AppColors.light,
              fontSize: 16,
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: isObscure
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () => setState(
                      () => isObscure = !isObscure,
                    ),
                  )
                : null,
            suffixIconColor: AppColors.light),
      ),
    );
  }
}
