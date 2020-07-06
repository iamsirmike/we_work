import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_work/models/job_model.dart';
import 'package:we_work/services/auth.dart';

class FetchJobs {
  final CollectionReference jobs = Firestore.instance.collection("jobs");
  final CollectionReference user = Firestore.instance.collection("users");
  final CollectionReference applications =
      Firestore.instance.collection('applications');

  String _uid;

  set setUid(String uid) {
    _uid = uid ?? null;
  }

  Stream<List<Jobs>> get jobsStream {
    return jobs.snapshots().map(_jobsList);
  }

  List<Jobs> _jobsList(QuerySnapshot snapshot) {
    print(snapshot.documents);
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

  Stream<List<Jobs>> get applicationsStream {
    return applications
        .where('uref', isEqualTo: user.document(_uid))
        .snapshots()
        .map(_applicationList);
  }

  List<Jobs> _applicationList(QuerySnapshot snapshot) {
    return snapshot.documents.map((application) {
      // print(application.data['jobref']);
      // // application.data['jobref'].snapshots().listen((value) {
      // // });

      return Jobs(
          company: "Company",
          title: "Title",
          location: "Location",
          salary: "Salary",
          status: "Status",
          description: "Description",
          options: "Options",
          type: "Type");
    }).toList();
  }

  // DocumentReference jobRef;
  // String company;
  // String title;
  // String location;
  // String options;
  // String status;
  // String salary;
  // String description;
  // String type;
}
