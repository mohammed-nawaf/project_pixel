import 'package:flutter/material.dart';
import 'package:pixel/view/screens/profile_setup_screens/complete_profile_splash_screen.dart';
import 'package:pixel/view/widgets/background_screen.dart';
import 'package:pixel/view/screens/home_screen/home_screen.dart';
import 'package:pixel/view/widgets/elevated_button_custom.dart.dart';
import 'package:pixel/view/widgets/title_custom.dart';

class UserProfilePicSetupScreen extends StatelessWidget {
  const UserProfilePicSetupScreen({super.key});

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
                title: 'Complete Profile', subtitle: 'Upload profile pic'),
            SizedBox(
              height: size.height * 0.1,
            ),

            // profile picture upload

            Container(
              height: size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[300],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: size.height * 0.12,
                    bottom: 0,
                    child: IconButton(
                        onPressed: () {},
                        icon: const Image(
                            image: AssetImage('assets/images/cam_icon.png'))),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: size.height * 0.2,
            ),
            ElevatedButtonCustomWidget(
                text: 'Next',
                onPress: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: ((ctx) =>  const CompleteProfileSplashScreen())));
                }),
          ],
        ),
      ),
    );
  }
}
