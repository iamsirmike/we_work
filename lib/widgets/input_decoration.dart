import 'package:flutter/material.dart';
import 'package:we_work/utils/colors.dart';

InputDecoration textInputDecoration({Icon sicon, String labelText, String hintText}) {
  return InputDecoration(
    labelText: labelText,
    hintText: hintText,
    labelStyle: TextStyle(color: Colors.grey[500]),
     hintStyle: TextStyle(color: Colors.grey[500]),
    suffixIcon: sicon,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: UiColors.bg,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: UiColors.color2,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: UiColors.color2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        width: 1,
        color: Colors.red,
      ),
    ),
  );
}
