// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:expance_tracker_hive/const.dart';

class CommonButton extends StatelessWidget {
  String title;
  Size size;

  void Function()? onTap;
  CommonButton({
    Key? key,
    required this.title,
    required this.size,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.015, horizontal: size.width * 0.05),
        decoration: BoxDecoration(
          color: englishViolet,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: lavenderBlush,
              fontSize: fSize(size, 18),
              letterSpacing: 1,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
