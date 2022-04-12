import 'package:flutter/material.dart';
import 'package:beitflutter/styles/app_colors.dart';

class beitButtonStyle{
  static final ButtonStyle green = ElevatedButton.styleFrom(
    // onPrimary: AppColors.blue,
    primary: AppColors.green,
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2)),
    ),
  );
}