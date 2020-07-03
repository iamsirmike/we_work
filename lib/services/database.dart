import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class Queries {
  Future<void> saveprofile(_uid, _name, _email, _phone, _experience,
      _githublink, _resume, _applications) async {
    var result = await _firestore.collection('profile').add({
      'uid': _uid,
      'name': _name,
      'email': _email,
      'phone': _phone,
      'experience': _experience,
      'githublink': _githublink,
      'resume': _resume,
      'applications': _applications
    });
    return result;
  }
}
