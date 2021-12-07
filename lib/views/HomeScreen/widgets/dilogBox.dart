// ignore_for_file: must_be_immutable

import 'package:expance_tracker_hive/viewModel/transaction_viewModel.dart';
import 'package:expance_tracker_hive/views/HomeScreen/widgets/CommonButton.dart';
import 'package:flutter/material.dart';

import 'package:expance_tracker_hive/const.dart';
import 'package:provider/provider.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

DialogBox({context, size, isExpanse}) {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        elevation: 10,
        content: Container(
          height: 0.4 * size.height,
          width: 0.8 * size.width,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isExpanse == false ? "Add Income" : "Add Expanse",
                    style: TextStyle(
                        color: isExpanse == false ? englishViolet : Colors.red,
                        fontSize: fSize(size, 20),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              // SizedBox(height: height(size, 50)),
              Spacer(),

              _TextField(
                controller: titleController,
                hintText: "Title",
              ),
              SizedBox(height: height(size, height(size, 20))),
              _TextField(
                controller: descController,
                hintText: "Description",
              ),
              SizedBox(height: height(size, height(size, 20))),
              _TextField(
                controller: amountController,
                hintText: "Amount",
                textInputType: TextInputType.number,
              ),
              SizedBox(height: height(size, height(size, 20))),
              CommonButton(
                title: 'Save',
                size: size,
                onTap: () {
                  TransactionModel().addTranscation(
                      isExpanse: isExpanse,
                      title: titleController.text,
                      amount: amountController.text,
                      desc: descController.text);
                  Provider.of<TransactionModel>(context, listen: false)
                      .readAllTransactionAmount();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: height(size, height(size, 20))),
              Spacer(),
            ],
          ),
        ),
      );
    },
  );
}

_TextField({controller, hintText, textInputType}) {
  return TextFormField(
    keyboardType: textInputType ?? TextInputType.text,
    controller: controller,
    decoration: InputDecoration(
      label: Text(hintText),
      labelStyle: TextStyle(
        color: englishViolet,
      ),
      fillColor: Colors.grey,
      focusColor: Colors.grey,
      contentPadding: EdgeInsets.all(10),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: englishViolet),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
    ),
  );
}
