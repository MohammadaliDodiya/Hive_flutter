// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'package:expance_tracker_hive/const.dart';

class MainCards extends StatelessWidget {
  String title;
  int money;
  Size size;
  bool? grandTotal;
  void Function()? onTap;
  MainCards({
    Key? key,
    required this.money,
    required this.size,
    required this.title,
    this.grandTotal,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height(size, 100),
        width: width(size, 250),
        padding: EdgeInsets.all(width(size, 12)),
        decoration: BoxDecoration(
            color: englishViolet,
            borderRadius: BorderRadius.circular(width(size, 20)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(2, 2),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.5))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: fSize(size, 15),
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                letterSpacing: width(size, 2),
              ),
            ),
            Text(
              "$rupee $money",
              style: TextStyle(
                fontSize: fSize(size, 18),
                color: grandTotal == true
                    ? money == 0
                        ? lavenderBlush
                        : money >= 1
                            ? Colors.greenAccent
                            : Colors.red
                    : lavenderBlush,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
