import 'package:flutter/material.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';

class JobCard extends StatelessWidget {
  final String company;
  final String title;
  final String location;
  final String options;
  final String type;
  final String salary;
  final String status;
  final String description;

  const JobCard(
      {this.title,
      this.location,
      this.options,
      this.salary,
      this.status,
      this.description,
      this.company,
      this.type});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          buildShowModalBottomSheet(context);
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
                          title,
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
                            company,
                            style: TextStyle(
                              color: UiColors.color5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            '- $location',
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

  Future buildShowModalBottomSheet(BuildContext context) {
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
                          title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight(context, 0.01),
                        ),
                        Text(
                          '\$$salary',
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
                              label: location,
                            ),
                            DetailsCard(
                              label: options,
                            ),
                            DetailsCard(
                              label: type,
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
                            description,
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
                                  child: Icon(
                                    Icons.bookmark_border,
                                    color: UiColors.color2,
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: UiColors.color1,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Container(
                                width: screenWidth(context, 0.7),
                                height: screenHeight(context, 0.1),
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    status == 'open' ? 'Apply' : 'Can\'t Apply',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0,
                                        color: Colors.white),
                                  ),
                                  color: status == 'open'
                                      ? UiColors.color2
                                      : Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
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
