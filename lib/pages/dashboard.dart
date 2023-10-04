import 'package:flutter/material.dart';

import '../utils/temp_db.dart';
import '../widgets/cards.dart';
import '../widgets/drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const String routeName='/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Education Topics'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: topics.length,
        itemBuilder: (context, index) {
          return TopicCard(topic: topics[index]);
        },
      ),
    );
  }
}
