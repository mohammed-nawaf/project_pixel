import 'package:flutter/material.dart';
import 'package:pixel/main.dart';
import 'package:pixel/view/widgets/background_screen.dart';
import 'package:pixel/view/screens/login_screen/login_screen.dart';
import 'package:pixel/view/screens/profile_setup_screens/user_name_setup_screen.dart.dart';
import 'package:pixel/view/widgets/elevated_button_custom.dart.dart';
import 'package:pixel/view/widgets/title_custom.dart';
import 'package:pixel/view/widgets/login_or_signup_check.dart';
import 'package:pixel/view/screens/create_account_screen/widgets/password_confimation_textfield.dart';
import 'package:pixel/view/widgets/password_textfield.dart';
import 'package:pixel/view/widgets/signin_with_google.dart';
import 'package:pixel/view/widgets/username_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundScreen(
      child: Container(
        height: size.height,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.05,
              ),
              const TitleCustomWidget(
                  title: 'Create account',
                  subtitle: 'Start exploring each pixels'),
              SizedBox(
                height: size.height * 0.05,
              ),
              UserNameTextField(userNameController: userNameController),
              SizedBox(
                height: size.height * 0.03,
              ),
              PasswordTextField(passwordController: passwordController),
              SizedBox(
                height: size.height * 0.03,
              ),
              PasswordConfirmationTextFieldCustomWidget(
                confirmPasswordController: confirmPasswordController,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "By signing in you are agree to pixel's Terms of use and Privacy policy",
                style: TextStyle(fontSize: size.height * 0.016),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ElevatedButtonCustomWidget(
                  text: 'Create Account',
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      checkLoggedIn(context);
                    } else {
                      print('Data is Empty');
                    }
                  }),
              const SigninWithGoogleCustomWidget(),
              LoginOrSignupCheckCustomWidget(
                title: 'Already have account',
                buttonText: 'Sign in',
                onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: ((ctx) => LoginScreen())));
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkLoggedIn(BuildContext context) async {
    final _username = userNameController.text;
    final _password = passwordController.text;

    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.setBool(SAVE_KEY_NAME, true);

    print('username and pass match');
    Navigator.of(context).push(
        MaterialPageRoute(builder: ((ctx) => const UserNameSetupScreen())));
  }
}
