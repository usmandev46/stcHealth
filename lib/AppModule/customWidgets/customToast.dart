import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


showMsgToast({required String message, Color color = Colors.red}) {
  return Fluttertoast.showToast(
    msg: message,
    backgroundColor: color,
    textColor: Colors.white,
    gravity: ToastGravity.BOTTOM,
    toastLength: Toast.LENGTH_LONG,
  );
}
