import 'package:flutter/material.dart';


class PasswordConfirmationTextFieldCustomWidget extends StatelessWidget {
  const PasswordConfirmationTextFieldCustomWidget({
    Key? key, required this.confirmPasswordController,
  }) : super(key: key);

  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Confirm Password',
        ),
        SizedBox(
          height: size.height * 0.01,
        ),
        TextFormField(
          controller: confirmPasswordController,
          obscureText: true,
          decoration: const InputDecoration(
            isDense: true,
            suffixIcon: Icon(Icons.visibility_off),
            border: OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'This fiels is Required';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }
}
