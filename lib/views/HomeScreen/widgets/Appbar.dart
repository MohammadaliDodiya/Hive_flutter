import 'package:expance_tracker_hive/const.dart';
import 'package:flutter/material.dart';

MyAppBar(size) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      apptitle,
      style: TextStyle(
        fontSize: fSize(size, 20),
        color: englishViolet,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
