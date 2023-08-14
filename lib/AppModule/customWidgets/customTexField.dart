import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'myText.dart';

Widget customLoginTextField(
    {required String label,
    Widget? prefixIcon,
    bool obscure = false,
    Widget? sufixIcon,
    TextInputType? keyboard,
    String? Function(String?)? validator,
    String? Function(String?)? onChange,
    TextEditingController? controller}) {
  return Container(
    margin: EdgeInsets.only(bottom: 2.h),
    height: validator != null && validator("") != null ? 9.h : 7.h,
    // height: 7.5.h,
    // decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(20.sp), color: Colors.black12),
    child: TextFormField(
      obscuringCharacter: '*',
      obscureText: obscure,
      controller: controller,
      validator: validator,
      keyboardType: keyboard,
      onChanged: onChange,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: sufixIcon,
        label: myText(text: label, color: Colors.black54),
      ),
    ),
  );
}
