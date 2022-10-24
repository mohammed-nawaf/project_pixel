import 'package:flutter/material.dart';
import 'package:pixel/data/api_services.dart';
import 'package:pixel/models/posts_model/posts_model.dart';

import 'package:pixel/view/screens/home_screen/widgets/post_card.dart';
import 'package:pixel/view/screens/home_screen/widgets/share_snap_custom_widget.dart';
import 'package:pixel/view/screens/home_screen/widgets/tabar_custom_widget.dart';
import 'package:pixel/view/screens/user_profile_screen/user_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // @override
  // void initState() {
  //   ApiCalls.instance.getUser();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await ApiCalls().getAllPosts();
    // });
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.teal[50],
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: size.height * 0.02),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    width: size.width * 0.75,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isDense: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                width: 0, style: BorderStyle.none)),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                FutureBuilder(
                  future: ApiCalls.instance.getUser(),
                  builder: (context, snapshot) {
                    final user = snapshot.data?.data!;
                    if (snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SizedBox(
                          width: size.width * 0.04,
                          child: ListView.builder(
                            controller:
                                ScrollController(keepScrollOffset: true),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  final name =
                                      '${user[index].firstName!} ${user[index].lastName!}';
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => UserProfileScreen(
                                        profileName: name,
                                        profilePicture: user[index].picture!),
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle),
                                  child: Image(
                                      image:
                                          NetworkImage(user![index].picture!)),
                                ),
                                // child: CircleAvatar(
                                //     radius: 25,
                                //     backgroundImage:
                                //         NetworkImage(user![index].picture!)),
                              );
                            },
                            itemCount: 1,
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ],
            ),
            const ShareSnapCustomWidget(),
            const TabBarCustomWidget(),
            FutureBuilder<PostsModel>(
                future: ApiCalls.instance.getAllPosts(),
                builder: (context, snapshot) {
                  final posts = snapshot.data?.data!;

                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: true),
                      itemBuilder: (BuildContext context, index) {
                        return PostCardCustomWidget(
                          firstName: posts[index].owner!.firstName!,
                          lastName: posts[index].owner!.lastName!,
                          profilePicture: posts[index].owner!.picture!,
                          displayImage: posts[index].image!,
                          publishDate: posts[index].publishDate!,
                          likes: posts[index].likes!,
                        );
                      },
                      itemCount: posts!.length,
                    );
                  } else {
                    return Container();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
