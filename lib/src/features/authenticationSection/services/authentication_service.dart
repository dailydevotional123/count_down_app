import 'package:daily_devotional/src/features/authenticationSection/services/authServices.dart';
import 'package:daily_devotional/src/features/authenticationSection/services/userServices.dart';
import 'package:daily_devotional/src/utils/log_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/userModel.dart';

class SocialAuthenticationServices {
  FirebaseUserServices firebaseUserServices = FirebaseUserServices();
  FirebaseAuthServices firebaseAuthServices = FirebaseAuthServices();

  // static Future<User?> signInWithGoogle() async {
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //
  //   if (kIsWeb) {
  //     GoogleAuthProvider authProvider = GoogleAuthProvider();
  //
  //     try {
  //       final UserCredential userCredential =
  //           await auth.signInWithPopup(authProvider);
  //
  //       user = userCredential.user;
  //     } catch (e) {
  //       print(e);
  //     }
  //   } else {
  //     final GoogleSignIn googleSignIn = GoogleSignIn();
  //
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await googleSignIn.signIn();
  //
  //     if (googleSignInAccount != null) {
  //       final GoogleSignInAuthentication googleSignInAuthentication =
  //           await googleSignInAccount.authentication;
  //
  //       final AuthCredential credential = GoogleAuthProvider.credential(
  //         accessToken: googleSignInAuthentication.accessToken,
  //         idToken: googleSignInAuthentication.idToken,
  //       );
  //
  //       try {
  //         final UserCredential userCredential =
  //             await auth.signInWithCredential(credential);
  //
  //         user = userCredential.user;
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'account-exists-with-different-credential') {
  //           showErrorSnackBarMessage(message: e.code.toString());
  //           // ...
  //         } else if (e.code == 'invalid-credential') {
  //           showErrorSnackBarMessage(message: "Invalid Credentials");
  //           // ...
  //         }
  //       } catch (e) {
  //         // ...
  //       }
  //     }
  //   }
  //
  //   return user;
  // }

  // Future<GoogleSignInAccount> signInWithGoogle() async {
  //   try {
  //     final GoogleSignIn google = GoogleSignIn(scopes: [
  //       'email',
  //       // 'https://www.googleapis.com/auth/contacts.readonly',
  //     ]);
  //     if (await google.isSignedIn()) {
  //       await google.signOut();
  //     }
  //
  //     GoogleSignInAccount? googleUser = await google.signIn();
  //     if (googleUser != null) {
  //       log(googleUser.id);
  //       log(googleUser.email);
  //       log(googleUser.displayName!);
  //       return googleUser;
  //     } else {
  //       throw 'Unable to verify google account';
  //     }
  //   } catch (e) {
  //     print(e);
  //     throw 'Unable to connect to google services';
  //   }
  // }

  // Future<dynamic> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );
  //
  //     return await FirebaseAuth.instance.signInWithCredential(credential);
  //   } on Exception catch (e) {
  //     // TODO
  //     print('exception->$e');
  //   }
  // }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   dp(msg: "email", arg: googleUser!.email.toString());
  //
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication googleAuth =
  //       await googleUser.authentication;
  //   dp(msg: "access token", arg: googleAuth.accessToken.toString());
  //
  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   dp(msg: "credential", arg: credential.token.toString());
  //   //var information= FirebaseAuth.instance.signInWithCredential(credential);
  //
  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  // googleSignInAndGetInformation() async {
  //   try {
  //     await signInWithGoogle();
  //     var currentUser = FirebaseAuth.instance.currentUser;
  //     dp(msg: "current user name", arg: currentUser!.displayName.toString());
  //     dp(msg: "current user email", arg: currentUser.email.toString());
  //     dp(msg: "current user photo url", arg: currentUser.photoURL.toString());
  //     dp(msg: "current user photo url", arg: currentUser.uid.toString());
  //
  //     await firebaseAuthServices
  //         .fetchUserRecord("AcnJAgVLQffb9ANIfvNnQDj2v0x2")
  //         .first
  //         .then((userData) async {
  //       dp(msg: "user data", arg: userData.emailAdress.toString());
  //       dp(msg: "user id  firestore", arg: userData.userId);
  //       if (userData.userId.toString() == "AcnJAgVLQffb9ANIfvNnQDj2v0x2") {
  //         dp(msg: "user already exists");
  //         showSuccessSnackBarMessage(message: "Login Successfully");
  //       } else {
  //         dp(msg: "user not exists!registered successfully");
  //         // await firebaseUserServices
  //         //     .createUser(UserModel(
  //         //         userId: currentUser.uid.toString(),
  //         //         userName: currentUser.displayName.toString(),
  //         //         emailAdress: currentUser.email.toString(),
  //         //         profilePicture: currentUser.photoURL.toString(),
  //         //         dateCreated: Timestamp.fromDate(DateTime.now())))
  //         //     .whenComplete(() {
  //         //   showSuccessSnackBarMessage(message: "User Registered Successfully");
  //         // });
  //       }
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     dp(msg: "trace", arg: e.stackTrace.toString());
  //     dp(msg: "message", arg: e.message.toString());
  //     dp(msg: "code", arg: e.code.toString());
  //     dp(msg: "code", arg: e.email.toString());
  //     //makeLoadingFalse();
  //     return showDialog<void>(
  //       context: RoutesUtils.cNavigatorState.currentState!.context,
  //       barrierDismissible: false,
  //       // false = user must tap button, true = tap outside dialog
  //       builder: (BuildContext dialogContext) {
  //         return AlertDialog(
  //           backgroundColor: AppColors.whiteColorFull,
  //           title: const Text('ALert!'),
  //           content: Text(e.message.toString()),
  //           actions: <Widget>[
  //             ElevatedButton(
  //               child: const Text('Okay'),
  //               onPressed: () {
  //                 // makeLoadingFalse();
  //                 Navigator.of(dialogContext).pop(); // Dismiss alert dialog
  //               },
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } catch (e) {
  //     dp(msg: "catch", arg: e.toString());
  //     // Handle Unexpected Error
  //   }
  // }

  Future<User?> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final userCredential = await FirebaseAuth.instance.signInWithCredential(
          GoogleAuthProvider.credential(
            accessToken: googleAuth.accessToken,
            idToken: googleAuth.idToken,
          ),
        );
        dp(msg: "user credentials", arg: userCredential.user.toString());

        UserModel userModel = await firebaseAuthServices
            .fetchUserRecord(userCredential.user!.uid.toString())
            .first;
        if (userModel != null) {
          dp(msg: "user model", arg: userModel.toString());
        } else {
          dp(msg: "user not exist ");
        }

        // FirebaseSingleton.instance
        //     .logEvent(AnalyticsKeys.logGoogleSignInSuccessful, {
        //   AnalyticsKeys.username:
        //   userCredential.user?.email ?? AnalyticsKeys.notAvailable,
        //   AnalyticsKeys.signInMethod: AnalyticsKeys.googleLogin
        // });
        //return userCredential.user!;
      } else {
        // FirebaseSingleton.instance
        //     .logEvent(AnalyticsKeys.logGoogleSignInFailed, {});
        throw FirebaseAuthException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      // FirebaseSingleton.instance
      //     .logEvent(AnalyticsKeys.logGoogleSignInAborted, {});
      throw FirebaseAuthException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  logoutUserAuth() async {
    await GoogleSignIn().signOut();
    await firebaseAuthServices.logoutUser();
  }
}