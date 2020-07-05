import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_work/models/job_model.dart';

class FetchJobs {
  final CollectionReference jobs = Firestore.instance.collection("jobs");

  Stream<List<Jobs>> get jobsStream {
    // print(jobs.snapshots().map(_jobsList).length);
    return jobs.snapshots().map(_jobsList);
  }

  List<Jobs> _jobsList(QuerySnapshot snapshot) {
    // print(snapshot.documents[0].data["company"]);
    return snapshot.documents
        .map((job) => Jobs(
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
}
