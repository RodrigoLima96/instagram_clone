import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/pages/signup/widgets/sign_up_button.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
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

              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                      'https://pbs.twimg.com/profile_images/1371621317749964801/eXIPVvKJ_400x400.jpg',
                    ),
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),

              const SizedBox(height: 24),
              TextFieldInputWidget(
                textEditingController: _usernameController,
                textInputType: TextInputType.text,
                hintText: 'Enter your username',
              ),
              const SizedBox(height: 24),
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
              TextFieldInputWidget(
                textEditingController: _bioController,
                textInputType: TextInputType.text,
                hintText: 'Enter your bio',
              ),
              const SizedBox(height: 24),

              const SignUpButton(),
              Flexible(flex: 2, child: Container()),
              // transition to signup
            ],
          ),
        ),
      ),
    );
  }
}
