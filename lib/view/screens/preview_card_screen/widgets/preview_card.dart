import 'package:flutter/material.dart';
class PreviewCard extends StatelessWidget {
  const PreviewCard({
    Key? key,
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.publishDate,
    required this.size,
    required this.displayImage,
    required this.likes,
  }) : super(key: key);

  final String profilePicture;
  final String firstName;
  final String lastName;
  final String publishDate;
  final Size size;
  final String displayImage;
  final int likes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profilePicture),
          ),
          title: Text('$firstName $lastName'),
          subtitle: Row(
            children: [
              Text(publishDate),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            '#Awsome #Cute',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ClipRRect(
          child: Image(
              fit: BoxFit.cover,
              height: size.height * 0.4,
              width: double.infinity,
              image: NetworkImage(displayImage)),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.thumb_up,
                        color: Colors.blue,
                      )),
                  Text("$likes")
                ],
              ),
              ElevatedButton(onPressed: () {}, child: const Text('Download'))
            ],
          ),
        ),
      ],
    );
  }
}