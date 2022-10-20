import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  final Widget child;
  const BackgroundScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image(
                    image: AssetImage('assets/images/bottom_left_element.png'),
                  )),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
