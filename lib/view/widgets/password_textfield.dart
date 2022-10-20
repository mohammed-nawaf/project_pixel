import 'package:flutter/material.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    Key? key,
   
    required this.passwordController,
  }) : super(key: key);


  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Password',
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off)),
            border: const OutlineInputBorder(),
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
