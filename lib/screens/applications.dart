import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:we_work/models/job_model.dart';
import 'package:we_work/providers/jobs_provider.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/services/fetch_jobs.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';
import 'package:we_work/widgets/jobscard.dart';

class Applications extends StatefulWidget {
  @override
  _ApplicationsState createState() => _ApplicationsState();
}

class _ApplicationsState extends State<Applications> {
  bool _loading = false;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    print(new FetchJobs().fetchApplications(user.uid));
    // print(user.uid);
    return Scaffold(
      backgroundColor: UiColors.bg,
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
                        Icon(
                          Icons.sort,
                          size: 25.0,
                          color: UiColors.color2,
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            auth.signOut();
                          },
                          child: Icon(
                            Icons.notifications_none,
                            size: 25.0,
                            color: UiColors.color2,
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
                            height: screenHeight(context, 0.04),
                          ),
                          Row(
                            children: [
                              Text(
                                'Recent jobs',
                                style: TextStyle(
                                    color: UiColors.color2,
                                    fontWeight: FontWeight.w500,
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
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: screenHeight(context, 1),
                            child: StreamBuilder<List>(
                              stream: new FetchJobs()
                                  .fetchApplications(user.uid)
                                  .asStream(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  print(snapshot.error);
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 120.0),
                                    child: Container(
                                      child: Center(
                                        child: CircularProgressIndicator(
                                            backgroundColor: Colors.lightBlue),
                                      ),
                                    ),
                                  );
                                }

                                List job = snapshot.data;
                                return ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: job.length,
                                  itemBuilder: (context, index) {
                                    // print(job[index].get().then(
                                    //     (value) => value.data['company']));

                                    // return JobCard(
                                    //   jobRef: job[index]
                                    //       .get()
                                    //       .then((value) => value.reference),
                                    //   company: job[index].get().then(
                                    //       (value) => value.data['company']),
                                    //   title: job[index]
                                    //       .get()
                                    //       .then((value) => value.data['title']),
                                    //   location: job[index].get().then(
                                    //       (value) => value.data['location']),
                                    //   options: job[index].get().then(
                                    //       (value) => value.data['options']),
                                    //   type: job[index]
                                    //       .get()
                                    //       .then((value) => value.data['type']),
                                    //   salary: job[index].get().then(
                                    //       (value) => value.data['salary']),
                                    //   status: job[index].get().then(
                                    //       (value) => value.data['status']),
                                    //   description: job[index].get().then(
                                    //       (value) => value.data['description']),
                                    // );
                                  },
                                );
                              },
                            ),
                          )
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
