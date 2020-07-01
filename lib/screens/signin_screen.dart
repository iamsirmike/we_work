import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();

  bool _loading = false;
  final Auth auth = Auth();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String get _email => _emailcontroller.text;
  String get _pass => _passwordcontroller.text;

  Future<void> signIn() async {
    setState(() {
      _loading = true;
    });
    try {
      await auth.signinwithemail(_email, _pass);
      setState(() {
        _loading = false;
      });
    } catch (error) {
      var errorMessage = error.message.toString();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sign in failed'),
              content: Text(
                'User does not exist, make sure you have typed the correct email and password',
              ),
              actions: [
                FlatButton(
                    onPressed: () {
                      setState(() {
                        _loading = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Text('OK'))
              ],
            );
          });
      print(errorMessage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _loading,
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 70.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.07),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _emailcontroller,
                          validator: (_email) {
                            if ((_email.isEmpty)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.grey[500]),
                          decoration:
                              textInputDecoration(labelText: 'Your Email'),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.03),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _passwordcontroller,
                          validator: (_pass) {
                            if ((_pass.isEmpty) || !(_pass.length > 6)) {
                              return 'Password must be more than 6';
                            }
                            return null;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.grey[500]),
                          decoration: textInputDecoration(
                            labelText: 'Password',
                            sicon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.03),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/reset'),
                        child: Container(
                          alignment: Alignment.bottomRight,
                          child: Text('Forgot password?'),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.05),
                      ),
                      Container(
                        width: screenWidth(context, 1),
                        height: screenHeight(context, 0.1),
                        child: RaisedButton(
                          onPressed: signIn,
                          child: Text('Sign In'),
                          color: UiColors.color2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.08),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Dont have an account? ',
                            style: TextStyle(color: Colors.grey[400]),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                    color: UiColors.color3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
