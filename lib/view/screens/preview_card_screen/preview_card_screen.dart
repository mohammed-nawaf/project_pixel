import 'package:flutter/material.dart';
import 'package:pixel/data/api_services.dart';
import 'package:pixel/view/screens/preview_card_screen/widgets/comments.dart';
import 'package:pixel/view/screens/preview_card_screen/widgets/preview_card.dart';

class PreviewCardScreen extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String profilePicture;
  final String title;
  final String displayImage;
  final String publishDate;
  final String text;
  final int likes;
  final List<String> tags;
  const PreviewCardScreen({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.profilePicture,
    required this.title,
    required this.displayImage,
    required this.publishDate,
    required this.text,
    required this.likes,
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      appBar: AppBar(
        toolbarHeight: 75,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
        ),
        backgroundColor: Colors.teal[50],
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            // preview Card

            PreviewCard(
              profilePicture: profilePicture,
              firstName: firstName,
              lastName: lastName,
              publishDate: publishDate,
              size: size,
              displayImage: displayImage,
              likes: likes,
            ),

            // Preview Card
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                    hintText: 'Write your comment',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: const [
                  Text(
                    'Comments',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '(300)',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ),

            // Comment Section
            FutureBuilder(
                future: ApiCalls.instance.getComments(),
                builder: (context, snapshot) {
                  final comments = snapshot.data?.data!;
                  if (snapshot.hasData) {
                    return Comments(comments: comments!);
                  } else {
                    return  Center(
                      child: Container(),
                    );
                  }
                }),
            // Comment Section
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Load more',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
