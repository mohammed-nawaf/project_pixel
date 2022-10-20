import 'package:flutter/material.dart';
import 'package:pixel/data/api_services.dart';
import 'package:pixel/view/screens/user_profile_screen/user_profile_screen.dart';

class Sample extends StatelessWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: FutureBuilder(
        future: ApiCalls.instance.getUser(),
        builder: (context, snapshot) {
          final user = snapshot.data?.data!;
          if (snapshot.hasData) {
            return ListView.builder(
              controller: ScrollController(keepScrollOffset: true),
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
                  child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(user![index].picture!)),
                );
              },
              itemCount: 1,
            );
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
