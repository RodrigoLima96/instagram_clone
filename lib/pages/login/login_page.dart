import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/pages/login/widgets/sign_up_text.dart';
import 'package:instagram_clone/pages/login/widgets/login_button.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              SvgPicture.asset('assets/images/instagram_logo.svg'),
              const SizedBox(height: 64),
              TextFieldInputWidget(
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your email',
              ),
              const SizedBox(height: 24),
              TextFieldInputWidget(
                textEditingController: _passwordController,
                textInputType: TextInputType.emailAddress,
                hintText: 'Enter your password',
                isPass: true,
              ),
              const SizedBox(height: 24),
              const LoginButton(),
              Flexible(flex: 2, child: Container()),
              // transition to signup
              const SignUpText()
            ],
          ),
        ),
      ),
    );
  }
}
