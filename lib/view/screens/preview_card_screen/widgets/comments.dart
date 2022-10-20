import 'package:flutter/material.dart';
import 'package:pixel/models/comments_model/comments_model.dart';
class Comments extends StatelessWidget {
  const Comments({
    Key? key,
    required this.comments,
  }) : super(key: key);

  final List<Data> comments;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        controller: ScrollController(keepScrollOffset: true),
        itemBuilder: (ctx, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(comments[index].owner!.picture!),
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comments[index].owner!.firstName!,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    comments[index].publishDate!,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                comments[index].message!,
                style: TextStyle(
                    fontSize: 18, color: Colors.black),
              ),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const Divider();
        },
        itemCount: comments.length);
  }
}