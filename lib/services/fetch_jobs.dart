import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:we_work/models/job_model.dart';
import 'package:we_work/services/auth.dart';

class FetchJobs {
  final CollectionReference jobs = Firestore.instance.collection("jobs");
  final CollectionReference user = Firestore.instance.collection("users");
  final CollectionReference applications =
      Firestore.instance.collection('applications');
  final CollectionReference savedJobs =
      Firestore.instance.collection('saved_jobs');

  StreamSubscription<String> _data;
  Completer<String> completer = Completer();

  String _uid;

  set setUid(String uid) {
    _uid = uid ?? null;
  }

  Stream<Future<List<Jobs>>> get jobsStream {
    return jobs.snapshots().map(_jobsList);
  }

  Future<List<Jobs>> _jobsList(QuerySnapshot snapshot) async {
    List<DocumentSnapshot> jobSnaps = snapshot.documents;
    return await compute(parseJobs, jobSnaps);
  }

//APPLICATIONS
  Stream<List<Stream<Jobs>>> get applicationsStream {
    return applications
        .where('uref', isEqualTo: user.document(_uid))
        .snapshots()
        .map(_applicationList);
  }

  List<Stream<Jobs>> _applicationList(QuerySnapshot snapshot) {
    return snapshot.documents.map((application) {
      DocumentReference docref = application.data['jobref'];
      return docref.snapshots().map((job) => Jobs.fromSnapshot(job));
    }).toList();
  }

//SAVED JOBS
  Stream<List<Stream<Jobs>>> get savedJobsStream {
    return savedJobs
        .where('uref', isEqualTo: user.document(_uid))
        .snapshots()
        .map(_savedJobsList);
  }

  List<Stream<Jobs>> _savedJobsList(QuerySnapshot snapshot) {
    return snapshot.documents.map((application) {
      DocumentReference docref = application.data['jobref'];
      return docref.snapshots().map((job) => Jobs.fromSnapshot(job));
    }).toList();
  }
}

List<Jobs> parseJobs(List<DocumentSnapshot> jobs) {
  return jobs.map<Jobs>((job) => Jobs.fromSnapshot(job)).toList();
}
