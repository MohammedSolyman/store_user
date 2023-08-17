import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';

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
        MyBigTitle('Hi, guest'),
        SizedBox(
          height: 35,
        ),
        Divider(thickness: 5),
        ProfileTiles()
      ],
    );
  }
}

class ProfileTiles extends StatelessWidget {
  const ProfileTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ProfileTile(
              iconData: Icons.person, title: 'address', function: () {}),
          ProfileTile(iconData: Icons.person, title: 'orders', function: () {}),
          ProfileTile(
              iconData: Icons.person, title: 'wishlist', function: () {}),
          ProfileTile(iconData: Icons.person, title: 'viewed', function: () {}),
          ProfileTile(
              iconData: Icons.person, title: 'sign in', function: () {}),
          const ThemeTile()
        ],
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile(
      {required this.iconData,
      required this.title,
      required this.function,
      super.key});

  final IconData iconData;
  final String title;
  final Function function;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              size: 30,
            ),
            const SizedBox(
              width: 20,
            ),
            MyBigText(title),
          ],
        ),
        IconButton(
            onPressed: () {
              function();
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 30,
            ))
      ],
    );
  }
}

class ThemeTile extends StatelessWidget {
  const ThemeTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Icon(
              Icons.brightness_4,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            MyBigText('theme'),
          ],
        ),
        Obx(() {
          return Switch(
              value: myController.themeModel.value.themeModeBool,
              onChanged: (b) {
                myController.toggleMode(b);
              });
        })
      ],
    );
  }
}
