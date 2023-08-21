import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/forms/forms.dart';
import 'package:store_user/global_widgets/my_logo/my_logo.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';
import 'package:store_user/pages/sign_in_page/components/google_sign_in.dart';
import 'package:store_user/pages/sign_in_page/components/my_line.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MySizedBox(),
                const MyLogo(),
                const MySizedBox(),
                const MySizedBox(),
                MyForm(
                    label: 'email',
                    controller: myController.signInModel.value.tecEmail),
                const MySizedBox(),
                MyForm(
                    isObsecure: true,
                    label: 'password',
                    controller: myController.signInModel.value.tecPassword),
                const MySizedBox(),
                const MyLine(),
                const MySizedBox(),
                ElevatedButton(
                    onPressed: () {
                      myController.signInFunc(context);
                    },
                    child: const Text('sign in')),
                const MySizedBox(),
                const MySizedBox(),
                const GoogleSignIn()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
