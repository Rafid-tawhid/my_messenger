import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String mainDescription;

  ProfileWidget({
    required this.avatarUrl,
    required this.name,
    required this.mainDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 2),
        Text(
          mainDescription,
          style: TextStyle(fontSize: 16, color: Colors.grey),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}