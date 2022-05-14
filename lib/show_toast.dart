import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
void showToast(String message,ToastGravity gravity ,BuildContext context)=> Fluttertoast.showToast(
  gravity: gravity,
    msg: message,
  backgroundColor: Colors.grey[500],
    fontSize: 18,
  textColor: Colors.white,
);