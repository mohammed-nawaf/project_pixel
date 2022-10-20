import 'package:flutter/material.dart';

class LoginOrSignupCheckCustomWidget extends StatelessWidget {
  final String title;
  final String buttonText;
  final dynamic onPress;

  const LoginOrSignupCheckCustomWidget({
    Key? key,
    required this.title,
    required this.buttonText,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
        TextButton(
            onPressed: onPress,
            child: Text(
              buttonText,
              style: TextStyle(color: Colors.grey[900], fontSize: 15),
            )),
      ],
    );
  }
}
