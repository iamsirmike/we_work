import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';
import 'package:we_work/widgets/jobscard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _loading = false;
  Auth auth = Auth();
  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.color1,
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: ListView(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'New Jobs',
                          style: TextStyle(
                              fontSize: 25.0, fontWeight: FontWeight.w400),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            auth.signOut();
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Colors.grey[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: screenHeight(context, 0.02),
                    ),
                    Container(
                      height: screenHeight(context, 0.734),
                      child: ListView(
                        children: [
                          Container(
                            height: screenHeight(context, 0.07),
                            decoration: BoxDecoration(
                              color: UiColors.bg,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: TextField(
                              decoration:
                                  textInputDecoration(hintText: 'Search jobs'),
                            ),
                          ),
                          SizedBox(
                            height: screenHeight(context, 0.04),
                          ),
                          Row(
                            children: [
                              Text(
                                'Latest Roles',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, '/alljobs');
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.grey[500]),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Container(
                              height: screenHeight(context, 0.8),
                              child: StreamBuilder<QuerySnapshot>(
                                stream: _firestore
                                    .collection('jobs')
                                    .where('status', isEqualTo: 'open')
                                    .limit(10)
                                    .snapshots(),
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
                                    final title = job.data['title'];
                                    final location = job.data['location'];
                                    final options = job.data['options'];
                                    final salary = job.data['salary'];
                                    final status = job.data['status'];
                                    final description = job.data['description'];

                                    final jobWidget = JobCard(
                                      title: title,
                                      location: location,
                                      options: options,
                                      salary: salary,
                                      status: status,
                                      description: description,
                                    );
                                    jobslistWidget.add(jobWidget);
                                  }
                                  return ListView(
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
            ),
          ],
        ),
      ),
    );
  }
}
