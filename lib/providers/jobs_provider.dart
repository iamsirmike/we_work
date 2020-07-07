import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:we_work/services/database.dart';

class JobsProvider with ChangeNotifier {
  String uid;
  DocumentReference jobRef;

  CollectionReference user = Firestore.instance.collection("users");
  bool _hasApplied = false;
  bool get hasApplied => _hasApplied;

  Future checkApplicationExist(String uid, DocumentReference jobRef) async {
    DocumentReference userProfileRef =
        await user.document(uid).get().then((value) => value.data['profile']);
    userProfileRef.get().then((value) {
      List applications = value.data['applications'];
      _hasApplied = applications
          .where((element) => element.documentID == jobRef.documentID)
          .isNotEmpty;
      print(_hasApplied);
      notifyListeners();
    });
  }
}
