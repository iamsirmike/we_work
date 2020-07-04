import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';
import 'package:we_work/widgets/jobscard.dart';

class AllJobs extends StatefulWidget {
  @override
  _AllJobsState createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  bool _loading = false;
  Auth auth = Auth();
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.bg,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: UiColors.color2,
                      ),
                    ),
                    SizedBox(
                      height: screenHeight(context, 0.02),
                    ),
                    Container(
                      height: screenHeight(context, 0.9),
                      child: ListView(
                        children: [
                          Container(
                            height: screenHeight(context, 0.09),
                            decoration: BoxDecoration(
                              color: UiColors.color1,
                              borderRadius: BorderRadius.circular(
                                25,
                              ),
                            ),
                            child: TextField(
                              decoration: textInputDecoration(
                                hintText: 'Search jobs',
                                sicon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context, 0.025),
                          ),
                          Text(
                            'Browse jobs',
                            style: TextStyle(
                                color: UiColors.color2,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0),
                          ),
                          Spacer(),
                          Expanded(
                            child: Container(
                              height: screenHeight(context, 0.9),
                              child: StreamBuilder<QuerySnapshot>(
                                stream:
                                    _firestore.collection('jobs').snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 120.0),
                                      child: Container(
                                        child: Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor:
                                                  Colors.lightBlue),
                                        ),
                                      ),
                                    );
                                  }
                                  final jobData = snapshot.data.documents;
                                  List<JobCard> jobslistWidget = [];
                                  for (var job in jobData) {
                                    final company = job.data['company'];
                                    final title = job.data['title'];
                                    final location = job.data['location'];
                                    final options = job.data['options'];
                                    final type = job.data['type'];
                                    final salary = job.data['salary'];
                                    final status = job.data['status'];
                                    final description = job.data['description'];

                                    final jobWidget = JobCard(
                                      company: company,
                                      title: title,
                                      location: location,
                                      options: options,
                                      type: type,
                                      salary: salary,
                                      status: status,
                                      description: description,
                                    );
                                    jobslistWidget.add(jobWidget);
                                  }
                                  return ListView(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    children: jobslistWidget,
                                  );
                                },
                              ),
                            ),
                          )
                          // ...jobData
                          //     .getRange(0, 10)
                          //     .map((index) => jobCard(context, index))
                          //     .toList(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
