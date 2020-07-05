import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:we_work/models/job_model.dart';

class FetchJobs {
  final CollectionReference jobs = Firestore.instance.collection("jobs");

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
}
