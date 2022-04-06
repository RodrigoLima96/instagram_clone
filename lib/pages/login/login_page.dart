import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/pages/login/widgets/sign_up_text.dart';
import 'package:instagram_clone/pages/login/widgets/login_button.dart';
import 'package:instagram_clone/pages/signup/sign_up_page.dart';
import 'package:instagram_clone/resourses/auth_methods.dart';
import 'package:instagram_clone/responsive/responsive_layout_page.dart';
import 'package:instagram_clone/utils/global_variables.dart';
import 'package:instagram_clone/utils/utils.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';
import '../../responsive/mobile_page_layout.dart';
import '../../responsive/web_page_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (res == 'success') {
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
    } else {
      // ignore: use_build_context_synchronously
      showSnackBar(context, res);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void navigatorToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignUpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webPageSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 200),
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
                LoginButton(
                    isLoading: _isLoading,
                    press: () {
                      loginUser();
                    }),
                const SizedBox(height: 50),

                // transition to signup
                SignUpText(
                  press: () {
                    navigatorToSignUpPage();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
