import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_big_text.dart';
import 'package:store_user/global_widgets/texts/my_big_title.dart';

class WelcomeTile extends StatelessWidget {
  const WelcomeTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => MyBigTitle(
        'Hi, ${myController.authenticationModel.value.currentUserName}'));
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
              iconData: Icons.person,
              title: 'wishlist',
              function: myController.goToWishListPage),
          ProfileTile(iconData: Icons.person, title: 'viewed', function: () {}),
          const AuthenticationTile(),
          const ThemeTile()
        ],
      ),
    );
  }
}

class AuthenticationTile extends StatelessWidget {
  const AuthenticationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (myController.authenticationModel.value.currentUserName == 'guest') {
        return ProfileTile(
            iconData: Icons.person,
            title: 'sign in',
            function: myController.goToSignIn);
      } else {
        return ProfileTile(
            iconData: Icons.person,
            title: 'sign out',
            function: myController.signOut);
      }
    });
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
