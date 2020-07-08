import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

final _firestore = Firestore.instance;

class Queries {
  final CollectionReference user = _firestore.collection("users");
  final CollectionReference profile = _firestore.collection("profile");
  final CollectionReference applications =
      _firestore.collection("applications");
  final CollectionReference saved = _firestore.collection("saved_jobs");

  Future<void> createprofile(_uid, _name, _email, _phone, _experience,
      _githublink, _resume, _applications) async {
    var result = await _firestore.collection('profile').add({
      'name': _name,
      'uref': user.document(_uid),
      'email': _email,
      'phone': _phone,
      'experience': _experience,
      'githublink': _githublink,
      'resume': _resume,
    });
    return result;
  }

  Future<QuerySnapshot> checkApplicationExist(
      String uid, DocumentReference jobRef) async {
    return applications
        .where('uref', isEqualTo: user.document(uid))
        .where('jobref', isEqualTo: jobRef)
        .getDocuments();
  }

  Future<QuerySnapshot> checkSavedExist(
      String uid, DocumentReference jobRef) async {
    return saved
        .where('uref', isEqualTo: user.document(uid))
        .where('jobref', isEqualTo: jobRef)
        .getDocuments();
  }

  Future addApplication(String uid, DocumentReference jobRef) async {
    try {
      QuerySnapshot applicationExist = await checkApplicationExist(uid, jobRef);

      if (applicationExist.documents.length <= 0) {
        var result = await _firestore.collection('applications').add({
          'uref': user.document(uid),
          'jobref': jobRef,
          'apply_date': FieldValue.serverTimestamp(),
          'pending': true,
        });
        return result;
      } else {
        print("Application exists");
        print(applicationExist.documents.length);
      }
    } on PlatformException catch (e) {
      print(
          "ADD APPLICATION 2   <<<<<<================= ${e.message} ===============>>>>>>");
      return e.message;
    }
  }

  Future saveJob(String uid, DocumentReference jobRef) async {
    try {
      QuerySnapshot checkSaved = await checkSavedExist(uid, jobRef);
      if (checkSaved.documents.length <= 0) {
        var result = await _firestore.collection('saved_jobs').add({
          'uref': user.document(uid),
          'jobref': jobRef,
          'save_date': FieldValue.serverTimestamp(),
        });
        return result;
      } else {
        print("Job already saved");
      }
    } on PlatformException catch (e) {
      print(
          "ADD APPLICATION 2   <<<<<<================= ${e.message} ===============>>>>>>");
      return e.message;
    }
  }
}
