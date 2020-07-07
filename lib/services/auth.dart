import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

//create a user class and constructor
class User {
  final String uid;
  CollectionReference users = Firestore.instance.collection("users");

  User({@required this.uid});

  Future saveUser() async {
    try {
      print(uid);
      return await users
          .document(uid)
          .setData({'active': true, 'date_join': FieldValue.serverTimestamp()})
          .then((value) => true)
          .catchError((error) => throw new Exception(error));
    } catch (e) {
      print(e);
    }
  }
}

// hook the Auth class to the abstract class
class Auth {
  final _auth = FirebaseAuth.instance;

  // convert a firebaseUser object to a user object
  User _userFromFirebase(FirebaseUser user) {
    if (user == null) {
      return null;
    }
    return User(uid: user.uid);
  }

  Stream<User> get onAuthStateChanged {
    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  Future<User> getcurrentUser() async {
    final user = await _auth.currentUser();
    return _userFromFirebase(user);
  }

  Future<User> signinAnonym() async {
    final authResult = await _auth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  // Future<User> signupwithemail(email, pass) async {
  //   final authResult = await FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: pass);
  //   authResult.user.sendEmailVerification();
  //   return _userFromFirebase(authResult.user);
  // }

  // Future<User> signinwithemail(email, pass) async {
  //   final authResult =
  //       await _auth.signInWithEmailAndPassword(email: email, password: pass);
  //   if (authResult.user.isEmailVerified)
  //     return _userFromFirebase(authResult.user);
  //   return null;
  // }

  Future<dynamic> signupwithemail(email, pass) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: pass)
          .then((value) {
        new User(uid: value.user.uid).saveUser();
        return _userFromFirebase(value.user);
      }).catchError((onError) => throw new PlatformException(
              code: onError.code, message: onError.message));
    } on PlatformException catch (e) {
      return e.code;
    }
  }

/* Made some few changes here
  Returns dynamic so that i can return the firebase exceptions if any is thrown
 */
  Future<dynamic> signinwithemail(email, pass) async {
    try {
      return await _auth
          .signInWithEmailAndPassword(email: email, password: pass)
          .then((value) => _userFromFirebase(value.user))
          .catchError((onError) => throw new PlatformException(
              code: onError.code, message: onError.message));
    } on PlatformException catch (e) {
      return e.code;
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  //sig in with google
  Future<User> signInWithGoogle() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount googleAccount = await googleSignIn.signIn();
    if (googleAccount != null) {
      final googleAuth = await googleAccount.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        final authResult = await _auth.signInWithCredential(
          GoogleAuthProvider.getCredential(
            idToken: googleAuth.idToken,
            accessToken: googleAuth.accessToken,
          ),
        );
        new User(uid: authResult.user.uid).saveUser();
        return _userFromFirebase(authResult.user);
      } else {
        throw PlatformException(
          code: 'ERROR_MISSING_GOOGLE_AUTH_TOKEN',
          message: 'Missing Google Auth Token',
        );
      }
    } else {
      throw PlatformException(
        code: 'ERROR_ABORTED_BY_USER',
        message: 'Sign in aborted by user',
      );
    }
  }

  //signout
  Future<void> signOut() async {
    // final GoogleSignIn googleSignIn = GoogleSignIn();
    // googleSignIn.signOut();
    await _auth.signOut();
  }
}
