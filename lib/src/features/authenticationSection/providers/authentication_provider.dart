import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/features/authenticationSection/models/userModel.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authServices.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/authentication_service.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/userServices.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../commonServices/hive_local_storage.dart';
import '../../../constants/hive_constants.dart';
import '../../../helpers/snak_bar_widget.dart';
import '../../../utils/log_utils.dart';
import '../../bottomNavBarSection/screens/bottomNavScreen.dart';

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
          dp(msg: "user exists now logging ");
          // showErrorSnackBarMessage(message: "User Already Exists");
          makeLoadingFalse();
          GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
              .go(BottomNavScreen.route);
          await HiveLocalStorage.write(
              boxName: HiveConstants.userIdBox,
              key: HiveConstants.userIdKey,
              value: userCredential.user!.uid.toString());
          await HiveLocalStorage.write(
              boxName: HiveConstants.currentRouteBox,
              key: HiveConstants.currentRouteKey,
              value: BottomNavScreen.route);
          showSuccessSnackBarMessage(message: "Login Successfully");
          //  dp(msg: "user model", arg: userModel.toString());
        } else {
          firebaseUserServices
              .createUser(UserModel(
                  userId: userCredential.user!.uid.toString(),
                  userName: userCredential.user!.displayName.toString(),
                  emailAdress: userCredential.user!.email.toString(),
                  profilePicture: userCredential.user!.photoURL.toString(),
                  dateCreated: Timestamp.fromDate(DateTime.now())))
              .whenComplete(() async {
            makeLoadingFalse();
            await HiveLocalStorage.write(
                boxName: HiveConstants.userIdBox,
                key: HiveConstants.userIdKey,
                value: userCredential.user!.uid.toString());
            await HiveLocalStorage.write(
                boxName: HiveConstants.currentRouteBox,
                key: HiveConstants.currentRouteKey,
                value: BottomNavScreen.route);

            showSuccessSnackBarMessage(message: "User Registered Successfully");
            GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
                .go(BottomNavScreen.route);
          });
        }
      } else {
        makeLoadingFalse();

        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      makeLoadingFalse();

      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  logoutFromApp() {
    socialAuthenticationServices.logoutUserAuth();
  }
}
