import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kranti/Models/UserModel.dart';
import 'package:google_sign_in/google_sign_in.dart';

class CrudMethodsUsers {
  GoogleSignIn googleSignIn = GoogleSignIn();
  FirebaseUser user;
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser() != null) {
      user = await FirebaseAuth.instance.currentUser();
      User.uid = user.uid;
      return true;
    }

    return false;
  }

  Future<void> addUserDetails() async {
    if (await isLoggedIn()) {}
  }

  getUserDetails() async {
    if (await isLoggedIn()) {
    } else {
      print('You need to be logged in first');
    }
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  initializeUserModel() async {
    print("initializing User Model");
    if (await isLoggedIn()) {
      if (user.uid != null) {
      } else {
        print("Something Wrong happened");
      }
    } else {
      print('You need to be logged in first');
    }
  }
}
