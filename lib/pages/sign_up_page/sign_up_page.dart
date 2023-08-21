import 'package:flutter/material.dart';
import 'package:store_user/constants/constant.dart';
import 'package:store_user/global_widgets/forms/forms.dart';
import 'package:store_user/global_widgets/my_logo/my_logo.dart';
import 'package:store_user/global_widgets/my_sized_box/my_sized_box.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MySizedBox(),
                const MyLogo(),
                const MySizedBox(),
                const MySizedBox(),
                MyForm(
                    label: 'username',
                    controller: myController.signUpModel.value.tecUserName),
                const MySizedBox(),
                MyForm(
                    label: 'email',
                    controller: myController.signUpModel.value.tecEmail),
                const MySizedBox(),
                MyForm(
                    isObsecure: true,
                    label: 'password',
                    controller: myController.signUpModel.value.tecPassword),
                const MySizedBox(),
                // MySizedBox(),
                ElevatedButton(
                    onPressed: () {
                      myController.signUpFunc(context);
                    },
                    child: const Text('sign up')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
