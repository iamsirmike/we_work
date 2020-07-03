import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:we_work/constants/constant.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _loading = false;
  bool _isPasswordMasked = true;
  final Auth auth = Auth(); /*  */
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  String get _email => _emailcontroller.text;
  String get _pass => _passwordcontroller.text;

  Widget snackBar(message) => SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      );

  Future<void> signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      setState(() {
        _loading = true;
      });
      dynamic user = await auth.signupwithemail(_email.trim(), _pass.trim());
      print(user);
      if (user.runtimeType != User) {
        // print(user);
        setState(() {
          _loading = false;
          switch (user) {
            case "ERROR_EMAIL_ALREADY_IN_USE":
              _scaffoldKey.currentState
                  .showSnackBar(snackBar("User already exists"));
              break;
            default:
              _scaffoldKey.currentState.showSnackBar(
                  snackBar("An unknown error occured, please try again"));
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
                        'Sign Up',
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
                            if (!regex.hasMatch(_email)) {
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
                            if ((_pass.isEmpty) || !(_pass.length > 5)) {
                              return 'Password must be more than 6';
                            }
                            return null;
                          },
                          obscureText: _isPasswordMasked,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(color: Colors.grey[500]),
                          decoration: textInputDecoration(
                            labelText: 'Password',
                            sicon: IconButton(
                                icon: Icon(
                                  _isPasswordMasked
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.black38,
                                  size: 23.0,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordMasked = !_isPasswordMasked;
                                  });
                                }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.03),
                      ),
                      SizedBox(
                        height: screenHeight(context, 0.02),
                      ),
                      Container(
                        width: screenWidth(context, 1),
                        height: screenHeight(context, 0.1),
                        child: RaisedButton(
                          onPressed: signIn,
                          child: Text('Sign Up'),
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
                          Navigator.pop(context);
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'I haave an account ',
                            style: TextStyle(color: Colors.grey[400]),
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Sign In',
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
