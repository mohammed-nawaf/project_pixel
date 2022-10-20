import 'package:flutter/material.dart';
import 'package:pixel/view/widgets/background_screen.dart';
import 'package:pixel/view/screens/profile_setup_screens/user_dob_setup_screen.dart.dart';
import 'package:pixel/view/widgets/elevated_button_custom.dart.dart';
import 'package:pixel/view/widgets/title_custom.dart';

class UserNameSetupScreen extends StatelessWidget {
  const UserNameSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundScreen(
        child: Container(
      height: size.height,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const TitleCustomWidget(
              title: 'Complete Profile',
              subtitle: 'We would like to know your name'),
          SizedBox(
            height: size.height * 0.05,
          ),
          const Image(image: AssetImage('assets/images/complete_profile.png')),
          SizedBox(
            height: size.height * 0.05,
          ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Your Name',
            ),
          ),
          SizedBox(
            height: size.height * 0.08,
          ),
          ElevatedButtonCustomWidget(
              text: 'Next',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((ctx) => const UserDobSetupScreen())));
              }),
        ],
      ),
    ));
  }
}
