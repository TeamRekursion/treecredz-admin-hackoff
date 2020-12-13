import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:treecredz_admin/presentation/themes/theme.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ScanWidget extends StatelessWidget {
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final users = FirebaseFirestore.instance.collection("users");

  Future<void> doTransaction(userID) {
    users.doc(userID).collection("transactions").add({
      "credits": double.parse(_titleController.value.text),
      "spent": false,
      "title": "Tommy Hilfi",
      "location": "Orion Mall",
      "amount": 1900,
    });
    return users.doc(userID).update({
      "balance": FieldValue.increment(double.parse(_titleController.value.text))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 180,
          width: 180,
          child: LottieBuilder.asset("assets/lottie/tree_plant.json"),
        ),
        SizedBox(height: MediaQuery.of(context).size.height / 8),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: MaterialButton(
            child: Text(
              "Scan a QR Code?",
              style: TextStyle(color: Colors.white),
            ),
            color: mediumGreen,
            onPressed: () async {
              String qrResult = await scanner.scan();
              if (qrResult != null) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => Dialog(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 24),
                              Container(
                                child: Text(
                                  "How many credz should be transferred?",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: darkGreen,
                                  ),
                                ),
                              ),
                              SizedBox(height: 24),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 4),
                                child: TextFormField(
                                  controller: _titleController,
                                  decoration: InputDecoration(
                                    hintText: "TreeCredz",
                                  ),
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value == "0") {
                                      return "Enter greater value than 0";
                                    }
                                    if (value.isEmpty) {
                                      return "Cant be empty";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              SizedBox(height: 32),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    color: Colors.black54,
                                    textColor: Colors.white,
                                  ),
                                  SizedBox(width: 16),
                                  MaterialButton(
                                    child: Text(
                                      "Pay",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState.validate()) {
                                        doTransaction(qrResult);
                                        Navigator.of(context).pop();
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                            content: Padding(
                                              padding: EdgeInsets.all(16),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Payment Successful!",
                                                    style: TextStyle(
                                                      color: darkGreen,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(height: 32),
                                                  Container(
                                                    height: 60,
                                                    width: 60,
                                                    child: Image.asset(
                                                      "assets/images/done_icon.png",
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                    textColor: Colors.white,
                                    color: mediumGreen,
                                  ),
                                  SizedBox(width: 2),
                                ],
                              ),
                              SizedBox(height: 24),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
