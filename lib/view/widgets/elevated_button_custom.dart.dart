import 'package:flutter/material.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final String text;
  final dynamic onPress;
  const ElevatedButtonCustomWidget({
    Key? key,
    required this.text,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.9,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
