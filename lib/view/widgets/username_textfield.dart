import 'package:flutter/material.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    Key? key,
    required this.userNameController,
  }) : super(key: key);

  final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Username',
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextFormField(
          controller: userNameController,
          decoration: const InputDecoration(
            isDense: true,
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This filed is required';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}