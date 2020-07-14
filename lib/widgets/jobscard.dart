import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_work/providers/jobs_provider.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/services/database.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';

class JobCard extends StatefulWidget {
  final DocumentReference jobRef;
  final String company;
  final String title;
  final String location;
  final String options;
  final String type;
  final String salary;
  final String status;
  final String description;

  JobCard(
      {this.jobRef,
      this.title,
      this.location,
      this.options,
      this.salary,
      this.status,
      this.description,
      this.company,
      this.type});

  @override
  _JobCardState createState() => _JobCardState();
}

class _JobCardState extends State<JobCard> {
  String applicationText = "Apply";
  JobsProvider jobsProvider;
  Queries queries = new Queries();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    jobsProvider = Provider.of<JobsProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          buildShowModalBottomSheet();

          WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
        },
        child: Container(
          height: screenHeight(context, 0.15),
          width: screenWidth(context, 1),
          decoration: BoxDecoration(
            color: UiColors.color1,
            borderRadius: BorderRadius.circular(12),
            // boxShadow: [
            //   BoxShadow(
            //     color: UiColors.color1,
            //     blurRadius: 1,
            //     spreadRadius: 2,
            //     offset: Offset(
            //       2,
            //       1,
            //     ),
            //   ),
            // ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: screenHeight(context, 0.1),
                  width: screenWidth(context, 0.18),
                  child: Center(
                    child: Text(
                      'weW',
                      style: TextStyle(
                        color: UiColors.color1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: UiColors.color2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  width: screenWidth(context, 0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 27.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth(context, 0.5),
                        child: Text(
                          widget.title,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Text(
                            widget.company,
                            style: TextStyle(
                              color: UiColors.color5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            '- ${widget.location}',
                            style: TextStyle(color: UiColors.color5),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Icon(Icons.more_vert),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildShowModalBottomSheet() {
    final user = Provider.of<User>(context, listen: false);
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Container(
              child: Container(
                color: Color(0xff757575),
                height: screenHeight(context, 0.92),
                child: Container(
                  decoration: BoxDecoration(
                    color: UiColors.bg,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  height: screenHeight(context, 0.92),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 50),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 150.0),
                          child: Container(
                            height: 3,
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.04),
                        ),
                        Container(
                          height: screenHeight(context, 0.1),
                          width: screenWidth(context, 0.18),
                          child: Center(
                            child: Text(
                              'weW',
                              style: TextStyle(
                                color: UiColors.color1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: UiColors.color2,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.03),
                        ),
                        Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.01),
                        ),
                        Text(
                          '\$${widget.salary}',
                          style: TextStyle(
                              // color: UiColors.color5,
                              ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.04),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailsCard(
                              label: widget.location,
                            ),
                            DetailsCard(
                              label: widget.options,
                            ),
                            DetailsCard(
                              label: widget.type,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.04),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: UiColors.color5,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.01),
                        ),
                        Container(
                          child: Text(
                            widget.description,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: screenHeight(context, 0.1),
                                width: screenWidth(context, 0.18),
                                child: Center(
                                    child: FutureBuilder<Stream<QuerySnapshot>>(
                                        future: queries.checkSavedExist(
                                            user.uid, widget.jobRef),
                                        builder: (context, snapshot) {
                                          return StreamBuilder<QuerySnapshot>(
                                              stream: snapshot?.data,
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  int count = snapshot
                                                      ?.data?.documents?.length;
                                                  return IconButton(
                                                    icon: Icon((count <= 0)
                                                        ? Icons.bookmark_border
                                                        : Icons.bookmark),
                                                    color: UiColors.color2,
                                                    onPressed: () => (count <=
                                                            0)
                                                        ? jobsProvider.saveJob(
                                                            user, widget.jobRef)
                                                        : queries.unSaveJob(
                                                            user.uid,
                                                            widget.jobRef),
                                                  );
                                                } else {
                                                  return Icon(
                                                      Icons.bookmark_border);
                                                }
                                              });
                                        })),
                                decoration: BoxDecoration(
                                  color: UiColors.color1,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                width: screenWidth(context, 0.7),
                                height: screenHeight(context, 0.1),
                                child: FutureBuilder<Stream<QuerySnapshot>>(
                                    future: queries.checkApplicationExist(
                                        user.uid, widget.jobRef),
                                    builder: (context, snapshot) {
                                      return StreamBuilder<QuerySnapshot>(
                                          stream: snapshot?.data,
                                          builder: (context, snapshot) {
                                            int applicationLen = snapshot
                                                ?.data?.documents?.length;
                                            if (snapshot.hasData) {
                                              return RaisedButton(
                                                onPressed: () =>
                                                    applicationHandler(
                                                        applicationLen, user),
                                                child: Text(
                                                  widget.status == 'open'
                                                      ? applicationLen <= 0
                                                          ? "Apply"
                                                          : "Applied"
                                                      : 'Closed',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 20.0,
                                                      color: Colors.white),
                                                ),
                                                color: widget.status == 'open'
                                                    ? applicationLen <= 0
                                                        ? UiColors.color2
                                                        : Color.fromRGBO(
                                                            15, 171, 188, 1)
                                                    : Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              );
                                            } else {
                                              return Center(child: Text("..."));
                                            }
                                          });
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  applicationHandler(int checkAppliedLen, User user) {
    if (checkAppliedLen > 0) {
      print("Already applied");
      return null;
    } else if (widget.status != "open") {
      print("Application closed");
      return null;
    } else {
      queries.addApplication(user.uid, widget.jobRef);
    }
  }
}

class DetailsCard extends StatelessWidget {
  final String label;
  const DetailsCard({
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context, 0.05),
      width: screenWidth(context, 0.27),
      decoration: BoxDecoration(
        color: UiColors.color1,
        border: Border.all(color: UiColors.color5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
