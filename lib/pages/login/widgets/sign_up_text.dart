import 'package:flutter/material.dart';

class SignUpText extends StatelessWidget {
  final Function press;
  const SignUpText({
    Key? key,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: const Text('Don´t have an account?'),
        ),
        GestureDetector(
          onTap: () {
            press();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: const Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
