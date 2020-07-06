import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_work/screens/all_jobs.dart';
import 'package:we_work/screens/profile.dart';
import 'package:we_work/screens/resetpassword..dart';
import 'package:we_work/screens/signin_screen.dart';
import 'package:we_work/screens/signup_screen.dart';
import 'package:we_work/screens/wrapper.dart';
import 'package:we_work/screens/dashboard.dart';
import 'package:we_work/services/auth.dart';
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
      home: StreamProvider<User>.value(
        value: Auth().onAuthStateChanged,
        child: Wrapper(),
      ),
      routes: {
        '/signup': (context) => SignUp(),
        '/alljobs': (context) => AllJobs(),
        '/dashboard': (context) => Dashboard(),
        '/signin': (context) => SignIn(),
        '/reset': (context) => ResetPassword(),
        // '/profile': (context) => Profile(),
      },
    );
  }
}
