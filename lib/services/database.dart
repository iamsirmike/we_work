import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

final _firestore = Firestore.instance;

class Queries {
  final CollectionReference user = _firestore.collection("users");
  final CollectionReference profile = _firestore.collection("profile");
  Future<void> createprofile(_uid, _name, _email, _phone, _experience,
      _githublink, _resume, _applications) async {
    var result = await _firestore.collection('profile').add({
      'name': _name,
      'applications': [],
      'email': _email,
      'phone': _phone,
      'experience': _experience,
      'githublink': _githublink,
      'resume': _resume,
    }).then((value) => updateHasProfileStatus(_uid, value.documentID));
    return result;
  }

  Future updateHasProfileStatus(String uid, String pid) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnapshot =
            await transaction.get(user.document(uid));
        await transaction.update(
            freshSnapshot.reference, {'profile': profile.document(pid)});
      }).catchError((onError) {
        print(
            "UNABLE TO UPDATE PROFILE STATUS   <<<<<<<==================>>>>>>  ${onError.message}");
        return null;
      });
    } on PlatformException catch (e) {
      print(
          "UNABLE TO UPDATE PROFILE STATUS   <<<<<<==================>>>>>>  ${e.message}");
    }
  }

  Future addApplication(String uid) async {
    try {
      DocumentReference data =
          await user.document(uid).get().then((value) => value.data['profile']);
      print(data.documentID);

      Firestore.instance.runTransaction((transaction) async {
        DocumentSnapshot freshSnapshot =
            await transaction.get(user.document(data.documentID));
        // await transaction.update(
        //     freshSnapshot.reference, {'profile': profile.document(pid)});
      }).catchError((onError) {
        print(
            "UNABLE TO UPDATE PROFILE STATUS   <<<<<<<==================>>>>>>  ${onError.message}");
        return null;
      });
    } on PlatformException catch (e) {
      print(
          "UNABLE TO UPDATE PROFILE STATUS   <<<<<<==================>>>>>>  ${e.message}");
    }
  }
}
