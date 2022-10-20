import 'package:flutter/material.dart';

class TitleCustomWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleCustomWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            fontSize: size.height * 0.03, fontWeight: FontWeight.bold),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          subtitle,
          style: TextStyle(
              fontSize: size.height * 0.02,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]),
        ),
      ),
    );
  }
}
