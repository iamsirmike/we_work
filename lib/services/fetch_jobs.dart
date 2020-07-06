// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_work/models/job_model.dart';

class FetchJobs {
  final CollectionReference jobs = Firestore.instance.collection("jobs");
  final CollectionReference user = Firestore.instance.collection("users");

  Stream<List<Jobs>> get jobsStream {
    return jobs.snapshots().map(_jobsList);
  }

  List<Jobs> _jobsList(QuerySnapshot snapshot) {
    return snapshot.documents
        .map((job) => Jobs(
            jobRef: job.reference,
            company: job.data['company'] ?? "",
            title: job.data['title'] ?? "",
            location: job.data['location'] ?? "",
            salary: job.data['salary'] ?? "",
            status: job.data['status'] ?? "",
            description: job.data['description'] ?? "",
            options: job.data['options'] ?? "",
            type: job.data['type'] ?? ""))
        .toList();
  }

  // Stream<List<Jobs>> get applicationsStream {
  //   return jobs.snapshots().map(_applicationsList);
  // }

  Future<List> fetchApplications(String uid) async {
    DocumentReference userProfileRef =
        await user.document(uid).get().then((value) => value.data['profile']);
    return userProfileRef.get().then((value) => value.data['applications']);

    // userProfileRef.snapshots().listen((event) {
    //   List applications = event.data['applications'];
    //   return applications;
    // }).onError((error) => print(error));
  }

  // List<Jobs> _applicationsList(QuerySnapshot snapshot) {
  //   return snapshot.documents
  //       .map((job) => Jobs(
  //           jobRef: job.reference,
  //           company: job.data['company'] ?? "",
  //           title: job.data['title'] ?? "",
  //           location: job.data['location'] ?? "",
  //           salary: job.data['salary'] ?? "",
  //           status: job.data['status'] ?? "",
  //           description: job.data['description'] ?? "",
  //           options: job.data['options'] ?? "",
  //           type: job.data['type'] ?? ""))
  //       .toList();
  // }
}
