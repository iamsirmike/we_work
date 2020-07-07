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

class SavedJobs extends StatefulWidget {
  @override
  _SavedJobsState createState() => _SavedJobsState();
}

class _SavedJobsState extends State<SavedJobs> {
  bool _loading = false;
  Auth auth = Auth();
  FetchJobs fetchJobs = new FetchJobs();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context, listen: false);
    fetchJobs.setUid = user.uid;

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
                                'Saved Jobs',
                                style: TextStyle(
                                    color: UiColors.color2,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20.0),
                              ),
                              Spacer(),
                            ],
                          ),
                          Container(
                              height: screenHeight(context, 1),
                              child: StreamBuilder<List<Stream<Jobs>>>(
                                  stream: fetchJobs.savedJobsStream,
                                  builder: (context, snapshot) {
                                    if (!snapshot.hasData) {
                                      // print(snapshot.error);
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

                                    List jobs = snapshot.data;
                                    return ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: jobs.length,
                                      itemBuilder: (context, index) {
                                        return StreamBuilder<Jobs>(
                                            stream: jobs[index],
                                            builder: (context, snapshot) {
                                              if (!snapshot.hasData) {
                                                // print(snapshot.error);
                                                return Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 120.0),
                                                  child: Container(
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                              backgroundColor:
                                                                  Colors
                                                                      .lightBlue),
                                                    ),
                                                  ),
                                                );
                                              }
                                              Jobs job = snapshot.data;
                                              return JobCard(
                                                jobRef: job.jobRef,
                                                company: job.company,
                                                title: job.title,
                                                location: job.location,
                                                options: job.options,
                                                type: job.type,
                                                salary: job.salary,
                                                status: job.status,
                                                description: job.description,
                                              );
                                            });
                                      },
                                    );
                                  }))
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
