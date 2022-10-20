import 'package:flutter/material.dart';

class SigninWithGoogleCustomWidget extends StatelessWidget {
  const SigninWithGoogleCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * 0.05,
          child: TextButton.icon(
              onPressed: () {},
              icon: Image(
                fit: BoxFit.cover,
                image: const AssetImage('assets/images/google_logo.png'),
                width: size.width * 0.1,
                height: size.height * 0.05,
              ),
              label: Text(
                'Sign in with Google',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
                ),
              )),
        ),
      ],
    );
  }
}
