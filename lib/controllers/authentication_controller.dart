import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_user/controllers/navigation_controller.dart';
import 'package:store_user/global_widgets/dialoges/dialoges.dart';
import 'package:store_user/global_widgets/dialoges/waiting.dart';
import 'package:store_user/models/authentication_model.dart';
import 'package:store_user/pages/sign_in_page/sign_in_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication extends NavigationController {
  Rx<AuthenticationModel> authenticationModel = AuthenticationModel().obs;

  updateCurrentUser() {
    FirebaseAuth instance = FirebaseAuth.instance;
    User? currentUser = instance.currentUser;

    authenticationModel.update((val) {
      if (currentUser != null) {
        String? userName = currentUser.displayName;
        val!.currentUserName = userName!;
      } else {
        val!.currentUserName = 'guest';
      }
    });
  }

  signUpEmail({
    required BuildContext context,
    required String userName,
    required String email,
    required String password,
  }) async {
    showWaiting();
    UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (FirebaseAuth.instance.currentUser != null) {
        await credential.user!.updateDisplayName(userName);
        _sendVerificationEmail();
        Get.to(() => const SignInPage());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.back();

        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'weak password',
            content: 'The password provided is too weak, try stronger pasword');
      } else if (e.code == 'email-already-in-use') {
        Get.back();

        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'already exists',
            content: 'The account already exists for that email.');
      }
    } catch (e) {
      Get.back();
      showMyDialoge(
          context: context,
          col: Colors.orange,
          title: 'Error',
          content: e.toString());
    }
  }

  signInEmail({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    showWaiting();

    final UserCredential credential;

    try {
      credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user!.emailVerified) {
        Get.back();

        goToCartPage();
      } else {
        Get.back();

        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'Unverified user',
            content: 'please go to your eamil to activate your account.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.back();

        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'user-not-found',
            content: 'enter the correct user');
      } else if (e.code == 'wrong-password') {
        Get.back();
        showMyDialoge(
            context: context,
            col: Colors.orange,
            title: 'Wrong password',
            content: 'enter the correct pasword');
      }
    }

    updateCurrentUser();
  }

  _sendVerificationEmail() {
    User? user = FirebaseAuth.instance.currentUser;
    user!.sendEmailVerification();
  }

  signOut() async {
    await FirebaseAuth.instance.signOut();
    updateCurrentUser();
  }

  Future<UserCredential> signInGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    updateCurrentUser();

    return userCredential;
  }
}
