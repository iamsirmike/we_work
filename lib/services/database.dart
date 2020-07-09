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

//Checks if the current user reference and the job he is trying to apply to has a reference in the database
  Future<QuerySnapshot> checkApplicationExist(
      String uid, DocumentReference jobRef) async {
    return applications
        .where('uref', isEqualTo: user.document(uid))
        .where('jobref', isEqualTo: jobRef)
        .getDocuments();
  }

//Checks if the current user reference and the job he is trying to bookmark to has a reference in the database
  Future<Stream<QuerySnapshot>> checkSavedExist(
      String uid, DocumentReference jobRef) async {
    return saved
        .where('uref', isEqualTo: user.document(uid))
        .where('jobref', isEqualTo: jobRef)
        .snapshots();
  }

  Future addApplication(String uid, DocumentReference jobRef) async {
    try {
      QuerySnapshot applicationExist = await checkApplicationExist(uid, jobRef);

//Checks if the user has already applied to the job
      if (applicationExist.documents.length <= 0) {
        var result = await _firestore.collection('applications').add({
          'uref': user.document(uid),
          'jobref': jobRef,
          'apply_date': FieldValue.serverTimestamp(),
          'pending': true,
        });
        return result;
      } else {
        return null;
      }
    } on PlatformException catch (e) {
      print(
          "ADD APPLICATION 2   <<<<<<================= ${e.message} ===============>>>>>>");
      return e.message;
    }
  }

  Future saveJob(String uid, DocumentReference jobRef) async {
    try {
      return _firestore
          .collection('saved_jobs')
          .add({
            'uref': user.document(uid),
            'jobref': jobRef,
            'save_date': FieldValue.serverTimestamp(),
          })
          .then((value) => print("Job saved"))
          .catchError((onError) => throw new PlatformException(
              code: onError.code, message: onError.message));
    } on PlatformException catch (e) {
      print(
          "SAVE JOB FAILED   <<<<<<================= ${e.message} ===============>>>>>>");
      return e.message;
    }
  }

  Future unSaveJob(String uid, DocumentReference jobRef) async {
    try {
      QuerySnapshot savedJob = await saved
          .where('uref', isEqualTo: user.document(uid))
          .where('jobref', isEqualTo: jobRef)
          .getDocuments();
      savedJob.documents[0].reference
          .delete()
          .then((value) => print("Job unsaved..."));
    } on PlatformException catch (e) {
      print(
          "ADD APPLICATION 2   <<<<<<================= ${e.message} ===============>>>>>>");
      return e.message;
    }
  }
}
