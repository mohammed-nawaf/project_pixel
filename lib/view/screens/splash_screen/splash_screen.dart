import 'package:flutter/material.dart';
import 'package:pixel/main.dart';
import 'package:pixel/view/screens/home_screen/home_screen.dart';
import 'package:pixel/view/screens/start_info_screen/start_info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 7, 100, 176),
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 200,
          ),
        ));
  }

  Future<void> gotoStartInfoScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const StarterInfoScreen(),
    ));
  }

  Future<void> gotoStartHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedIn = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedIn == null || _userLoggedIn == false) {
      gotoStartInfoScreen();
    } else {
      gotoStartHomeScreen();
    }
  }
}
