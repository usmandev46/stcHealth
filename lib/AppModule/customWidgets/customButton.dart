import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';

import '../constant/constantColor.dart';
import 'myText.dart';

Widget customContainerButton(
    {required String text,
    Callback? onpress,
    loading = false,
      double? width,
    bool border = false,

    double radius = 20,
    Widget? icon}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: loading ? null : onpress,
      child: AnimatedContainer(
        width:width==null? double.maxFinite:width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
                color: border ? AppColor.primaryColor : Colors.transparent),
            color: border ? Colors.transparent : AppColor.primaryColor),
        duration: Duration(milliseconds: 600),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.2.h),
          child: loading
              ? CupertinoActivityIndicator(
                  color: border ? AppColor.primaryColor : Colors.white,
                  radius: 10.sp)
              : myText(
                  text: text,
                  color: border ? AppColor.primaryColor : Colors.white,
                  size: 14.sp),
        ),
      ),
    ),
  );
}
