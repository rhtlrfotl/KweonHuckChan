import 'package:flutter/material.dart';
import 'package:beitflutter/styles/app_colors.dart';
import 'package:beitflutter/styles/text_styles.dart';

class CustomFormField extends StatelessWidget {
  final String headingText;
  final String hintText;
  final bool obsecureText;
  final Widget suffixIcon;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final TextEditingController controller;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;

  const CustomFormField(
      {Key? key,
      required this.validator,
      required this.headingText,
      required this.hintText,
      required this.obsecureText,
      required this.suffixIcon,
      required this.textInputType,
      required this.textInputAction,
      required this.controller,
      required this.maxLines,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 35,
            right: 35,
            bottom: 10,
          ),
          child: Text(
            headingText,
            style: KTextStyle.textFieldHeading,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          // decoration: BoxDecoration(
          //   color: AppColors.grayshade,
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              validator: validator,
              maxLines: maxLines,
              controller: controller,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              obscureText: obsecureText,
              onChanged: onChanged,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.green, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(
                      color: AppColors.grayshade,
                      width: 1.0,
                    ),
                  ),
                  filled: true,
                  hintText: hintText,
                  hintStyle: KTextStyle.textFieldHintStyle,
                  suffixIcon: suffixIcon),
              // border: InputBorder.none,
            ),
          ),
        )
      ],
    );
  }
}
