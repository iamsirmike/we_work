import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:we_work/screens/dashboard.dart';
import 'package:we_work/screens/signin_screen.dart';
import 'package:we_work/services/auth.dart';

class Wrapper extends StatelessWidget {
  final Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // print(user);

    return user == null ? SignIn() : Dashboard();

    // return StreamBuilder<User>(
    //     stream: auth.onAuthStateChanged,
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.active) {
    //         User user = snapshot?.data;
    //         if (user == null) {
    //           return SignIn(
    //               // auth: auth,
    //               );
    //         }
    //         return Dashboard();
    //       } else {
    //         return Scaffold(
    //           body: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     });
  }
}
