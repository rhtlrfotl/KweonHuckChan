import 'package:flutter/material.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/text_styles.dart';

class CustomFormFieldBeit extends StatelessWidget {
  const CustomFormFieldBeit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        // color: AppColors.grayshade,
          borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green, width: 1.0),
            borderRadius: BorderRadius.circular(15.0),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: AppColors.grayshade,
          hintText: "enter any textss",
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          return null;
        },
      ),
    );
  }
}
