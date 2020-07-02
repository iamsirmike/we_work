import 'package:flutter/material.dart';
import 'package:we_work/screens/home.dart';
import 'package:we_work/screens/profile.dart';
import 'package:we_work/utils/colors.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;

  final bottomItems = [
    {'icon': Icon(Icons.home), "text": "Jobs"},
    {"icon": Icon(Icons.edit), "text": "Applications"},
    {"icon": Icon(Icons.bookmark), "text": "Saved Jobs"},
    {"icon": Icon(Icons.person), "text": "Profile"},
  ];

  final pages = [
    Home(),
    Home(),
    Home(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[currentIndex],
      // extendBody: true,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(0),
        height: height / 10,
        decoration: BoxDecoration(
          color: Theme.of(context).bottomAppBarColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: bottomItems
                .asMap()
                .map((i, icon) {
                  bool active = i == currentIndex;
                  final color = active ? UiColors.color3 : Colors.grey[500];
                  Widget button;

                  button = Column(
                    children: <Widget>[
                      IconButton(
                        icon: icon['icon'],
                        color: color,
                        onPressed: () => setState(() => currentIndex = i),
                      ),
                      Text(
                        icon["text"].toString(),
                        style: TextStyle(
                            color: color,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                  return MapEntry(i, button);
                })
                .values
                .toList(),
          ),
        ),
      ),
    );
  }
}
