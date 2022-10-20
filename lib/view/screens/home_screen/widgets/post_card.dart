import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:pixel/view/screens/preview_card_screen/preview_card_screen.dart';

class PostCardCustomWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String title;
  final String displayImage;
  final String publishDate;
  final String text;
  final int likes;
  final List<String> tags;

  PostCardCustomWidget({
    Key? key,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.displayImage,
    required this.publishDate,
    required this.likes,
    this.title = '',
    this.text = '',
    this.tags = const [],
  }) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      key: _scaffoldKey,
      padding: const EdgeInsets.only(bottom: 8),
      child: Card(
        elevation: 0,
        child: Column(
          children: [
            postCardHeader(),
            postCardImage(size),
            postCardFooter(size),
          ],
        ),
      ),
    );
  }

  SizedBox postCardFooter(Size size) {
    return SizedBox(
      height: size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            '#Awsome #Cute',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  SvgPicture.asset('assets/icons/fa_comment.svg'),
                  const Text('2')
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  SvgPicture.asset('assets/icons/like_hand.svg'),
                  Text('$likes')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox postCardImage(Size size) {
    return SizedBox(
      child: GestureDetector(
        onTap: () {
          Navigator.of(_scaffoldKey.currentContext!)
              .push(MaterialPageRoute(builder: (ctx) {
            return PreviewCardScreen(
                firstName: firstName,
                lastName: lastName,
                profilePicture: profilePicture,
                title: title,
                displayImage: displayImage,
                publishDate: publishDate,
                text: text,
                likes: likes,
                tags: tags);
          }));
        },
        child: ClipRRect(
          child: Image(
              fit: BoxFit.cover,
              height: size.height * 0.20,
              width: double.infinity,
              image: NetworkImage(displayImage)),
        ),
      ),
    );
  }

  ListTile postCardHeader() {
    return ListTile(
      tileColor: Colors.teal[50],
      leading: CircleAvatar(
        backgroundImage: NetworkImage(profilePicture),
      ),
      title: Text('$firstName $lastName'),
      subtitle: Text(publishDate),
      trailing: SvgPicture.asset(
        'assets/icons/download.svg',
      ),
    );
  }
}
