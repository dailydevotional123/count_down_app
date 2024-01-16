import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/features/authenticationSection/models/userModel.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authServices.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authentication_service.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/userServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../helpers/snak_bar_widget.dart';
import '../../../utils/log_utils.dart';

class AuthenticationProvider extends ChangeNotifier {
  bool isLoading = false;

  makeLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  makeLoadingFalse() {
    isLoading = false;
    notifyListeners();
  }

  SocialAuthenticationServices socialAuthenticationServices =
      SocialAuthenticationServices();
  FirebaseUserServices firebaseUserServices = FirebaseUserServices();
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  // signInWithGoogle() {
  //   makeLoadingTrue();
  //   socialAuthenticationServices.googleSignIn().then((value) {
  //     makeLoadingFalse();
  //   });
  // }

  Future<User?> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        makeLoadingTrue();
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          ),
        );
        dp(msg: "user credentials", arg: userCredential.user.toString());

        bool? isExistUser = await firebaseAuthServices.fetchCurrentUser(
            userId: userCredential.user!.uid.toString());

        // UserModel userModel = await firebaseAuthServices
        //     .fetchCurrentUser(userCredential.user!.uid.toString())
        //     .first;
        if (isExistUser == true) {
          dp(msg: "user exists ");
          showErrorSnackBarMessage(message: "User Already Exists");
          makeLoadingFalse();
          //  dp(msg: "user model", arg: userModel.toString());
        } else {
          firebaseUserServices
              .createUser(UserModel(
                  userId: userCredential.user!.uid.toString(),
                  userName: userCredential.user!.displayName.toString(),
                  emailAdress: userCredential.user!.email.toString(),
                  profilePicture: userCredential.user!.photoURL.toString(),
                  dateCreated: Timestamp.fromDate(DateTime.now())))
              .whenComplete(() {
            makeLoadingFalse();
            showSuccessSnackBarMessage(message: "User Registered Successfully");
          });
          // GoogleSignIn().signOut();
          // FirebaseAuth.instance.signOut();

          // dp(msg: "user not exists ");
          // showErrorSnackBarMessage(message: "User Not Exists ");
          // dp(msg: "user not exist ");
        }

        // FirebaseSingleton.instance
        //     .logEvent(AnalyticsKeys.logGoogleSignInSuccessful, {
        //   AnalyticsKeys.username:
        //   userCredential.user?.email ?? AnalyticsKeys.notAvailable,
        //   AnalyticsKeys.signInMethod: AnalyticsKeys.googleLogin
        // });
        //return userCredential.user!;
      } else {
        makeLoadingFalse();
        // FirebaseSingleton.instance
        //     .logEvent(AnalyticsKeys.logGoogleSignInFailed, {});
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      makeLoadingFalse();
      // FirebaseSingleton.instance
      //     .logEvent(AnalyticsKeys.logGoogleSignInAborted, {});
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }
}
