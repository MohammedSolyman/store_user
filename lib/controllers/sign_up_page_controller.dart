import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/sign_in_page_controller.dart';
import 'package:store_user/models/sign_up_model.dart';

class SignUpPageController extends SignInPageController {
  Rx<SignUpModel> signUpModel = SignUpModel().obs;

  void _clearTec() {
    signUpModel.update((val) {
      val!.tecEmail.text = '';
      val.tecPassword.text = '';
      val.tecUserName.text = '';
    });
  }

  signUpFunc(BuildContext context) {
    String userName = signUpModel.value.tecUserName.text;
    String email = signUpModel.value.tecEmail.text;
    String password = signUpModel.value.tecPassword.text;
    signUpEmail(
        context: context, userName: userName, email: email, password: password);
    _clearTec();
  }
}
