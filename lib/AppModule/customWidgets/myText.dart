import 'package:flutter/material.dart';

Widget myText({
  int? maxline,
  required String text,
  TextAlign textAlignment = TextAlign.center,
  double size = 15,
  FontWeight fontweight = FontWeight.w500,
  Color color = Colors.black,
}) {
  return Text(
    maxLines: maxline,
    text,
    style: TextStyle(
      decoration: TextDecoration.none,
      color: color,
      fontSize: size,
      overflow: TextOverflow.ellipsis,
      fontWeight: fontweight,
      fontFamily: 'Poppins',
    ),
    textAlign: textAlignment,
  );
}
