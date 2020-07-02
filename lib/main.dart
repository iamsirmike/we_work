import 'package:flutter/material.dart';
import 'package:we_work/screens/all_jobs.dart';
import 'package:we_work/screens/resetpassword..dart';
import 'package:we_work/screens/signin_screen.dart';
import 'package:we_work/screens/signup_screen.dart';
import 'package:we_work/screens/wrapper.dart';
import 'package:we_work/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(color: UiColors.bg),
      ),
      home: Wrapper(),
      routes: {
        '/signup': (context) => SignUp(),
        '/alljobs': (context) => AllJobs(),
        '/signin': (context) => SignIn(),
         '/reset': (context) => ResetPassword(),
      },
    );
  }
}
