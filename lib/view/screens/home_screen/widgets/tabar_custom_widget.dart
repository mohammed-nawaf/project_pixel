import 'package:flutter/material.dart';
class TabBarCustomWidget extends StatelessWidget {
  const TabBarCustomWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Column(
        children: const [
          TabBar(
            physics: BouncingScrollPhysics(),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(),
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Nature',
              ),
              Tab(
                text: 'Beach',
              ),
              Tab(
                text: 'Vehicles',
              ),
              Tab(
                text: 'Models',
              ),
              Tab(
                text: 'Architecture',
              ),
              Tab(
                text: 'Business',
              ),
              Tab(
                text: 'Fashion',
              ),
              Tab(
                text: 'Food & Drink',
              ),
              Tab(
                text: 'Film',
              ),
              Tab(
                text: 'Streat',
              ),
              Tab(
                text: 'Health',
              ),
              Tab(
                text: 'Wellness',
              ),
            ],
          ),
        ],
      ),
    );
  }
}