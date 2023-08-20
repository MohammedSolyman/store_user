import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/texts/my_title.dart';

class GoogleSignIn extends StatelessWidget {
  const GoogleSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        myController.signInGoogleFunc();
      },
      child: Row(
        children: [
          SizedBox(
            height: 30,
            child: Image.asset('assets/icons/google.png'),
          ),
          const SizedBox(
            width: 20,
          ),
          const MyTitle('sign in with google')
        ],
      ),
    );
  }
}
