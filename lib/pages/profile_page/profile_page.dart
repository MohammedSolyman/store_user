import 'package:flutter/material.dart';
import 'package:store_user/pages/profile_page/components/compoenets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 35,
        ),
        WelcomeTile(),
        SizedBox(
          height: 35,
        ),
        Divider(thickness: 5),
        ProfileTiles()
      ],
    );
  }
}
