import 'package:flutter/material.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String location;
  final String options;
  final String salary;
  final String status;
  final String description;

  const JobCard(
      {this.title,
      this.location,
      this.options,
      this.salary,
      this.status,
      this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          buildShowModalBottomSheet(context);
        },
        child: Container(
          height: screenHeight(context, 0.14),
          width: screenWidth(context, 1),
          color: UiColors.bg,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30.0,
                  // backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/vacancy.jpg'),
                ),
                SizedBox(
                  width: screenWidth(context, 0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            location,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                          SizedBox(width: 7),
                          Text(
                            status,
                            style: TextStyle(
                              color: status == 'open'
                                  ? UiColors.color3
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
                  child: Column(
                    children: [
                      Icon(
                        Icons.account_balance_wallet,
                        color: Colors.grey[400],
                      ),
                      SizedBox(height: 6),
                      Text(
                        '\$$salary',
                        style: TextStyle(color: Colors.grey[400]),
                      ),
                    ],
                  ),
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 150.0),
                          child: Container(
                            height: 3,
                            color: Colors.grey[300],
                          ),
                        ),
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage:
                              AssetImage('assets/images/vacancy.jpg'),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        Container(
                          height: screenHeight(context, 0.05),
                          width: screenWidth(context, 0.2),
                          child: Center(
                            child: Text(
                              status,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color:
                                status == 'open' ? UiColors.color3 : Colors.red,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            DetailsCard(
                              icon: Icons.access_time,
                              label: '40hrs/wk',
                            ),
                            DetailsCard(
                              icon: Icons.business_center,
                              label: options,
                            ),
                            DetailsCard(
                              icon: Icons.monetization_on,
                              label: '\$$salary',
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Description',
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            description,
                            style: TextStyle(color: Colors.grey[400]),
                          ),
                        ),
                        Container(
                          width: screenWidth(context, 1),
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
                                ? Color(0xff676767)
                                : Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
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
  final IconData icon;
  final String label;
  const DetailsCard({
    this.icon,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight(context, 0.1),
      width: screenWidth(context, 0.27),
      decoration: BoxDecoration(
        color: UiColors.color1,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: UiColors.color3,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
