import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/pages/signup/widgets/sign_up_button.dart';
import 'package:instagram_clone/resourses/auth_methods.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

import '../../responsive/mobile_page_layout.dart';
import '../../responsive/responsive_layout_page.dart';
import '../../responsive/web_page_layout.dart';

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
  Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    setState(() {
      _image = img;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      _isLoading = false;
    });
    if (res != 'success') {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webPageLayout: WebPageLayout(),
            mobilePageLayout: MobilePageLayout(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                SvgPicture.asset('assets/images/instagram_logo.svg'),
                const SizedBox(height: 64),

                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                              'https://as2.ftcdn.net/v2/jpg/02/15/84/43/1000_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg',
                            ),
                          ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                        onPressed: () {
                          selectImage();
                        },
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

                SignUpButton(
                  isLoading: _isLoading,
                  press: () {
                    signUpUser();
                  },
                ),
                // Flexible(flex: 2, child: Container()),
                // transition to signup
              ],
            ),
          ),
        ),
      ),
    );
  }
}
