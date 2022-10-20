import 'package:flutter/material.dart';
import 'package:pixel/view/screens/create_account_screen/create_account_screen.dart';
import 'package:pixel/view/screens/home_screen/home_screen.dart';
import 'package:pixel/view/screens/profile_setup_screens/complete_profile_splash_screen.dart';

import 'package:pixel/view/screens/splash_screen/splash_screen.dart';
import 'package:pixel/view/screens/user_profile_screen/user_profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

const SAVE_KEY_NAME = 'UserLoggedIn';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}
