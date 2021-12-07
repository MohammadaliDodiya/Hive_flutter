// ignore_for_file: unused_element

import 'dart:core';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expance_tracker_hive/Model/transaction.dart';
import 'package:expance_tracker_hive/const.dart';
import 'package:expance_tracker_hive/viewModel/transaction_viewModel.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/Appbar.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/CommonButton.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/dilogBox.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/mainCards.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/transactionsList.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    readData();
  }

  readData() async =>
      await Provider.of<TransactionModel>(context, listen: false)
          .readAllTransactionAmount();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: lavenderBlush,
      appBar: MyAppBar(size),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(20),
                height: height(size, 150),
                decoration: BoxDecoration(
                  color: englishViolet,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Consumer<TransactionModel>(
                  builder: (context, value, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainCards(
                            title: "Income",
                            money: value.totalIncome,
                            onTap: () {},
                            size: size),
                        MainCards(
                            title: "Expanse",
                            money: value.totalexpanse,
                            onTap: () {},
                            size: size),
                        MainCards(
                            title: "On Hand",
                            money: value.totalAmount,
                            onTap: () {},
                            grandTotal: true,
                            size: size),
                      ],
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonButton(
                    size: size,
                    onTap: () {
                      DialogBox(context: context, size: size, isExpanse: false);
                    },
                    title: 'Add Income',
                  ),
                  SizedBox(width: 20),
                  CommonButton(
                    size: size,
                    onTap: () {
                      DialogBox(context: context, size: size, isExpanse: true);
                    },
                    title: 'Add Expanse',
                  ),
                ],
              ),
            ),
            SizedBox(height: height(size, 20)),
            Container(
              margin: EdgeInsets.symmetric(horizontal: width(size, 30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Clear all records..",
                    style: TextStyle(
                        color: englishViolet,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () async {
                        AwesomeDialog(
                          context: context,
                          btnOkColor: Colors.red,
                          dialogBackgroundColor: lavenderBlush,
                          btnCancelColor: englishViolet,
                          dialogType: DialogType.QUESTION,
                          animType: AnimType.SCALE,
                          title: 'Delete!',
                          desc: 'Are You Sure Want to delete All Records?',
                          btnCancelOnPress: () {},
                          btnOkOnPress: () async {
                            await TransactionModel().deleteAll();
                            await Provider.of<TransactionModel>(context,
                                    listen: false)
                                .readAllTransactionAmount();
                          },
                        )..show();
                      },
                      icon: Icon(
                        Icons.clear_all,
                        color: Colors.red,
                      )),
                ],
              ),
            ),
            Container(
              height: height(size, 580),
              child: ValueListenableBuilder(
                valueListenable: TransactionModel().hiveListen(),
                builder: (BuildContext context, Box<Trasacations> box,
                    Widget? child) {
                  return TransactionsList(
                    box: box,
                    size: size,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
