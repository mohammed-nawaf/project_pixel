import 'package:flutter/material.dart';
import 'package:pixel/view/widgets/background_screen.dart';
import 'package:pixel/view/screens/login_screen/login_screen.dart';
import 'package:pixel/view/widgets/elevated_button_custom.dart.dart';

class StarterInfoScreen extends StatelessWidget {
  const StarterInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundScreen(
      child: SizedBox(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: size.height * 0.35,
              image: const AssetImage(
                'assets/images/splash_image.png',
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Image(
              image: const AssetImage('assets/images/logo.png'),
              height: size.height * 0.08,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Lets share those awsome clicks \n camera is an extension of eyes',
              style: TextStyle(fontSize: size.height * 0.025),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButtonCustomWidget(
              text: 'Get Started',
              onPress: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) =>  LoginScreen(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
