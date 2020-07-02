import 'package:flutter/material.dart';
import 'package:we_work/utils/colors.dart';
import 'package:we_work/utils/responsive.dart';
import 'package:we_work/widgets/input_decoration.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

const List<String> experiences = ['Senior', 'Mid-senior', 'Junior'];

class _ProfileState extends State<Profile> {

  // <-- drop downmenu for experience -->
  String selectedexperience = 'Senior';
  List<DropdownMenuItem> getDRopDownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String experience in experiences) {
      var newItem =
          DropdownMenuItem(child: Text(experience), value: experience);
      dropdownItems.add(newItem);
    }
    return dropdownItems;
  }
// <! ----- end drop down -->
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UiColors.bg,
      appBar: AppBar(
        title: Text(
          'Create profile',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
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
                    child: TextField(
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
                    child: TextField(
                      decoration:
                          textInputDecoration(hintText: 'Your Email Address'),
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
                    child: TextField(
                      decoration:
                          textInputDecoration(hintText: 'Your Phone Number'),
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
                    child: TextField(
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
                        decoration: textInputDecoration(hintText: 'Experience'),
                        value: selectedexperience,
                        items: getDRopDownItems(),
                        onChanged: (value) {
                          setState(() {
                            selectedexperience = value;
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
                    child: TextField(
                      decoration:
                          textInputDecoration(hintText: 'Link to Resume'),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: screenWidth(context, 1),
                    height: screenHeight(context, 0.1),
                    child: RaisedButton(
                      onPressed: () {},
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
          ],
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
