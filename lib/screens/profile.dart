import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/services/database.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

const List<String> experiences = ['Senior', 'Mid-senior', 'Junior'];

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Queries queries = Queries();
  Auth auth = Auth();
  bool _loading = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _github = TextEditingController();
  TextEditingController _resume = TextEditingController();
  var _uid;
  String _applications;

  // <-- drop downmenu for experience -->
  String _selectedexperience = 'Senior';
  List<DropdownMenuItem> getDRopDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String experience in experiences) {
      var newItem =
          DropdownMenuItem(child: Text(experience), value: experience);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }

  //get current user
  Future<void> getCurrentUser() async {
    setState(() async {
      var loggedInUser = await auth.getcurrentUser();
      _uid = loggedInUser.uid;
      print(_uid);
    });
  }

//save profile data
  Future<void> _save() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        _loading = true;
      });
      try {
        await queries.saveprofile(_uid, _name.text, _email.text, _phone.text,
            _selectedexperience, _github.text, _resume.text, _applications);
        setState(() {
          _loading = false;
        });
      } catch (e) {
        print(e.toString());
      }
    }
  }

//logout
  Future<void> _logout() async {
    await auth.signOut();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UiColors.bg,
      appBar: AppBar(
        title: Text(
          'Create profile',
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.power_settings_new,
                color: Colors.red,
              ),
              onPressed: _logout)
        ],
      ),
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _loading,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _name,
                          validator: (_name) {
                            if ((_name.isEmpty)) {
                              return 'Please enter your full name';
                            }
                            return null;
                          },
                          decoration:
                              textInputDecoration(hintText: 'Your Full Name'),
                        ),
                      ),
                      TextboxSeperator(),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _email,
                          validator: (_email) {
                            if ((_email.isEmpty)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: textInputDecoration(
                              hintText: 'Your Email Address'),
                        ),
                      ),
                      TextboxSeperator(),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _phone,
                          validator: (_phone) {
                            if ((_phone.isEmpty) || !(_phone.length > 9)) {
                              return 'Please enter a valid phone number';
                            }
                            return null;
                          },
                          decoration: textInputDecoration(
                              hintText: 'Your Phone Number'),
                        ),
                      ),
                      TextboxSeperator(),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _github,
                          validator: (_github) {
                            if ((_github.isEmpty)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration: textInputDecoration(
                              hintText: 'Github / LinkedIn / Portfolio Link'),
                        ),
                      ),
                      TextboxSeperator(),
                      Container(
                        // width: screenWidth(context, 1),
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          child: DropdownButtonFormField(
                            // underline: SizedBox(),
                            hint: Text('Work Experience'),
                            decoration:
                                textInputDecoration(hintText: 'Experience'),
                            value: _selectedexperience,
                            items: getDRopDownItems(),
                            onChanged: (value) {
                              setState(() {
                                _selectedexperience = value;
                              });
                            },
                          ),
                        ),
                      ),
                      TextboxSeperator(),
                      Container(
                        decoration: BoxDecoration(
                          color: UiColors.color1,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: TextFormField(
                          controller: _resume,
                          validator: (_resume) {
                            if ((_resume.isEmpty)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          decoration:
                              textInputDecoration(hintText: 'Link to Resume'),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: screenWidth(context, 1),
                        height: screenHeight(context, 0.1),
                        child: RaisedButton(
                          onPressed: _save,
                          child: Text('Save'),
                          color: UiColors.color2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
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

class TextboxSeperator extends StatelessWidget {
  const TextboxSeperator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 7);
  }
}
