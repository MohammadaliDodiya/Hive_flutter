// ignore_for_file: must_be_immutable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expance_tracker_hive/viewModel/transaction_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:expance_tracker_hive/Model/transaction.dart';
import 'package:expance_tracker_hive/const.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  Box box;
  Size size;
  TransactionsList({
    Key? key,
    required this.box,
    required this.size,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // feed.length - 1 -index
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: box.length,
      itemBuilder: (context, index) {
        Trasacations? transactions = box.getAt(box.length - 1 - index);
        return Container(
            margin: EdgeInsets.all(width(size, 30)),
            decoration: BoxDecoration(
                border: Border.all(color: englishViolet),
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 5,
                    color: Colors.black.withOpacity(0.2),
                  )
                ]),
            child: ListTile(
              title: Column(
                children: [
                  SizedBox(height: height(size, 20)),
                  Text(
                    transactions!.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fSize(size, 20),
                      letterSpacing: 2,
                      color: englishViolet,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              subtitle: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        transactions.desc,
                        style: TextStyle(
                          fontSize: fSize(size, 20),
                          letterSpacing: 2,
                          color: englishViolet.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "$rupee${transactions.money}",
                        style: TextStyle(
                          fontSize: fSize(size, 20),
                          letterSpacing: 2,
                          color: transactions.isExpanse == true
                              ? Colors.red
                              : Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height(size, 5)),
                  Text(
                    transactions.date,
                    style: TextStyle(letterSpacing: 2, color: Colors.grey),
                  ),
                  SizedBox(height: height(size, 5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          tooltip: "Edit",
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: englishViolet,
                          )),
                      IconButton(
                          tooltip: "delete",
                          onPressed: () {
                            AwesomeDialog(
                              context: context,
                              btnOkColor: Colors.red,
                              dialogBackgroundColor: lavenderBlush,
                              btnCancelColor: englishViolet,
                              dialogType: DialogType.QUESTION,
                              animType: AnimType.SCALE,
                              title: 'Delete!',
                              desc: 'Are You Sure Want to delete?',
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {
                                TransactionModel()
                                    .deleteByIndex(box.length - 1 - index);
                                Provider.of<TransactionModel>(context,
                                        listen: false)
                                    .readAllTransactionAmount();
                              },
                            )..show();
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  )
                ],
              ),
            ));
      },
    );
  }
}
