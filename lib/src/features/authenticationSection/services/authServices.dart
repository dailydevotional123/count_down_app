import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:daily_devotional/src/helpers/snak_bar_widget.dart';
import 'package:daily_devotional/src/routing/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/firebaseUtils.dart';
import '../../../utils/log_utils.dart';
import '../Models/userModel.dart';
import '../screens/sign_in_screen.dart';

class FirebaseAuthServices {
  ///Register User
  Future registerUser({required String email, required String password}) async {
    return await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  ///Login User
  Future<User> loginUser(
      {required String email, required String password}) async {
    UserCredential _userCred = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return _userCred.user!;
  }

  ///Reset Password
  Future resetPassword({required String email}) async {
    return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  /// check if user is approved or not from admin
  Stream<UserModel> checkIfUserAllowed(String docID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(docID)
        .snapshots()
        .map((event) {
      return UserModel.fromJson(event.data()!);
    });
  }

  //
  // ///fetch current user
  // Future<UserModel?> fetchCurrentUser({userId}) async {
  //   try {
  //     var userData = await FirebaseFirestore.instance
  //         .collection(FirebaseUtils.users)
  //         .doc(userId ?? UserServices.userId)
  //         .get();
  //
  //     if (userData.exists) {
  //       return UserModel.fromJson(userData.data() as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } on FirebaseException catch (e) {
  //     dp(msg: "Error in get user", arg: e);
  //     rethrow;
  //   }
  // }
  //
  // ///fetch current diettian user
  // Future<UserModelDietitian?> fetchCurrentDietitianUser({userId}) async {
  //   try {
  //     var userData = await FirebaseFirestore.instance
  //         .collection(FirebaseUtils.users)
  //         .doc(userId ?? UserServices.userId)
  //         .get();
  //
  //     if (userData.exists) {
  //       return UserModelDietitian.fromJson(
  //           userData.data() as Map<String, dynamic>);
  //     } else {
  //       return null;
  //     }
  //   } on FirebaseException catch (e) {
  //     dp(msg: "Error in get user", arg: e);
  //     rethrow;
  //   }
  // }

  ///Fetch User Record
  Stream<UserModel> fetchUserRecord(String userID) {
    return FirebaseFirestore.instance
        .collection(FirebaseUtils.users)
        .doc(userID)
        .snapshots()
        .map((userData) => UserModel.fromJson(userData.data()!));
  }

  /// logout user
  logoutUser() async {
    try {
      await FirebaseAuth.instance.signOut().whenComplete(() {
        GoRouter.of(RoutesUtils.cNavigatorState.currentState!.context)
            .go(SignInScreen.route);
        showSuccessSnackBarMessage(message: "LogOut Successfully");
      });
    } on FirebaseAuthException catch (e) {
      dp(msg: "Error in sign out", arg: e.toString());
      rethrow;
    }
  }

  User? getCurrentUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
