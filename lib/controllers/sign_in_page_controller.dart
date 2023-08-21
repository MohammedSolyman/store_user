import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/authentication_controller.dart';
import 'package:store_user/models/sign_in__page_model.dart';

class SignInPageController extends Authentication {
  Rx<SignInModel> signInModel = SignInModel().obs;

  void _clearTec() {
    signInModel.update((val) {
      val!.tecEmail.text = '';
      val.tecPassword.text = '';
    });
  }

  signInFunc(BuildContext context) {
    String email = signInModel.value.tecEmail.text;
    String password = signInModel.value.tecPassword.text;
    signInEmail(context: context, email: email, password: password);
    _clearTec();
  }

  signInGoogleFunc() async {
    await signInGoogle();
    goToCartPage();
  }
}
