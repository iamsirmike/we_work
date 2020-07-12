import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:we_work/services/auth.dart';
import 'package:we_work/services/database.dart';
import 'package:we_work/services/fetch_profile.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/widgets/input_decoration.dart';
import 'package:we_work/models/profile_model.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

const List<String> experiences = ['Senior', 'Mid-senior', 'Junior'];

class _ProfileState extends State<Profile> {
  FetcProfile fetchProfile = new FetcProfile();
  User _user;

  @override
  void initState() {
    super.initState();
    // getCurrentUser();
    _user = Provider.of<User>(context, listen: false);
    fetchProfile.setUid = _user.uid;
  }

  //toggle enabling textfields
  bool enabled = false;
  bool enableDropDown = true;
  void enableFields() {
    setState(() {
      enabled = !enabled;
      enableDropDown = !enableDropDown;
    });
  }

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

//logout
  Future<void> _logout() async {
    await auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: UiColors.bg,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: _loading,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: _logout,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: GestureDetector(
                  onTap: enableFields,
                  child: CircleAvatar(
                    child: Icon(enabled ? Icons.done : Icons.edit),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7.0, horizontal: 15),
                child: StreamBuilder<ProfileModel>(
                    stream: fetchProfile.profileStream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        print(snapshot.error);
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 120.0),
                          child: Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                  backgroundColor: Colors.lightBlue),
                            ),
                          ),
                        );
                      }
                      ProfileModel profile = snapshot.data;
                      return Form(
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
                                enabled: enabled,
                                controller: _name,
                                validator: (_name) {
                                  if ((_name.isEmpty)) {
                                    return 'Please enter your full name';
                                  }
                                  return null;
                                },
                                decoration: textInputDecoration(
                                    // hintText: 'Your Full Name'
                                    hintText: profile.fullName),
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
                                // initialValue: profile.email,
                                controller: _email,
                                enabled: enabled,
                                validator: (_email) {
                                  if ((_email.isEmpty)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: textInputDecoration(
                                  // hintText: 'Your Email Address'
                                  hintText: profile.email,
                                  // labelText: 'Email'
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
                                enabled: enabled,
                                controller: _phone,
                                validator: (_phone) {
                                  if ((_phone.isEmpty) ||
                                      !(_phone.length > 9)) {
                                    return 'Please enter a valid phone number';
                                  }
                                  return null;
                                },
                                decoration: textInputDecoration(
                                    // hintText: 'Your Phone Number'
                                    hintText: profile.phone),
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
                                enabled: enabled,
                                controller: _github,
                                validator: (_github) {
                                  if ((_github.isEmpty)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: textInputDecoration(
                                    // hintText:
                                    // 'Github / LinkedIn / Portfolio Link'
                                    hintText: profile.github),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0.0),
                                child: IgnorePointer(
                                  ignoring: enableDropDown,
                                  child: DropdownButtonFormField(
                                    iconEnabledColor: enableDropDown
                                        ? UiColors.color5
                                        : Colors.black,
                                    hint: Text('Work Experience'),
                                    decoration: textInputDecoration(
                                        hintText: 'Experience'),
                                    value: profile.experience,
                                    style: TextStyle(color: UiColors.color5),
                                    items: getDRopDownItems(),
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedexperience = value;
                                      });
                                    },
                                  ),
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
                                enabled: enabled,
                                controller: _resume,
                                validator: (_resume) {
                                  if ((_resume.isEmpty)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                decoration: textInputDecoration(
                                    // hintText: 'Link to Resume'
                                    hintText: profile.resume),
                              ),
                            ),
                            // SizedBox(height: 20),
                            // Container(
                            //   width: screenWidth(context, 1),
                            //   height: screenHeight(context, 0.1),
                            //   child: RaisedButton(
                            //     onPressed: () {},
                            //     child: Text(
                            //       'Save',
                            //       style: TextStyle(
                            //           color: UiColors.color1,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //     color: UiColors.color2,
                            //     shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(10),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }),
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
    return SizedBox(height: 10);
  }
}
