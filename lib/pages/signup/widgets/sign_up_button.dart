import 'package:flutter/material.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class SignUpButton extends StatelessWidget {
  final Function press;
  bool isLoading;
  SignUpButton({
    Key? key,
    required this.press,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        press();
      },
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
                color: blueColor,
              ),
              child: const Text('Sign up'),
            ),
    );
  }
}
