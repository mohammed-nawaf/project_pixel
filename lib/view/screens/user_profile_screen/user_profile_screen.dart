import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pixel/view/screens/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfileScreen extends StatelessWidget {
  final String profilePicture;
  final String profileName;
  const UserProfileScreen({
    super.key,
    required this.profilePicture,
    required this.profileName,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.teal[50],
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  CircleAvatar(
                    radius: size.height * 0.06,
                    backgroundImage: NetworkImage(profilePicture),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    profileName,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  ListCustomWidget(
                    onTap: () {},
                    leadingIcon: const Icon(
                      Icons.history,
                      color: Colors.teal,
                    ),
                    title: 'My Posts',
                    trailingIcon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListCustomWidget(
                    onTap: () {},
                    leadingIcon: const Icon(
                      Icons.location_on,
                      color: Colors.teal,
                    ),
                    title: 'Address',
                    trailingIcon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListCustomWidget(
                    onTap: () {},
                    leadingIcon: const Icon(
                      Icons.phone_in_talk,
                      color: Colors.teal,
                    ),
                    title: 'Contact',
                    trailingIcon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  ListCustomWidget(
                    onTap: () {},
                    leadingIcon: const Icon(
                      Icons.settings,
                      color: Colors.teal,
                    ),
                    title: 'Settings',
                    trailingIcon: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                  SizedBox(height: size.height * 0.03),
                  ListCustomWidget(
                    onTap: () {
                      signOut(context);
                    },
                    leadingIcon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.teal,
                    ),
                    title: 'Logout',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signOut(BuildContext context) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
        (route) => false);
  }
}

class ListCustomWidget extends StatelessWidget {
  final String title;
  final Icon leadingIcon;
  final Icon trailingIcon;
  final Function() onTap;
  ListCustomWidget({
    Key? key,
    required this.onTap,
    required this.title,
    required this.leadingIcon,
    this.trailingIcon = const Icon(null),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: leadingIcon,
      title: Text(title),
      trailing: trailingIcon,
    );
  }
}
