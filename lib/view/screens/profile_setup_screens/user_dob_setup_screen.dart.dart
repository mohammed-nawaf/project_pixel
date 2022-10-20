import 'package:flutter/material.dart';
import 'package:pixel/view/widgets/background_screen.dart';
import 'package:pixel/view/screens/profile_setup_screens/user_profile_pic_setup_screen.dart.dart';
import 'package:pixel/view/widgets/elevated_button_custom.dart.dart';
import 'package:pixel/view/widgets/title_custom.dart';

class UserDobSetupScreen extends StatelessWidget {
  const UserDobSetupScreen({super.key});

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
              title: 'Complete Profile', subtitle: 'Wish you birthday on'),
          SizedBox(
            height: size.height * 0.05,
          ),
          CalendarDatePicker(
              initialDate: DateTime.now(),
              firstDate: DateTime(1940),
              lastDate: DateTime(2030),
              onDateChanged: (value) {}),
          SizedBox(
            height: size.height * 0.05,
          ),
          ElevatedButtonCustomWidget(
              text: 'Next',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((ctx) => const UserProfilePicSetupScreen())));
              }),
        ],
      ),
    ));
  }
}
