import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stchealth/AppModule/Controller/bottomBarController.dart';
import 'package:stchealth/AppModule/View/allProducts.dart';
import 'package:stchealth/AppModule/customWidgets/myText.dart';

import '../constant/constantColor.dart';

class BottomBarScreen1 extends StatelessWidget {
  BottomBarScreen1({super.key});

  var bottomcontroller = Get.put(BottomBarController());

  var pageList = [
    const AllProducts(),
    Center(child: myText(text: "Cart")),
    Center(child: myText(text: "Favourite")),
    Center(child: myText(text: "Profile"))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => pageList[bottomcontroller.selectedIndex.value]),
      bottomNavigationBar: Container(
        height: 7.5.h,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.08), // Shadow color
                spreadRadius: 2, // Spread radius
                blurRadius: 2, // Blur radius
                offset: Offset(0, -3), // Shadow offset
              ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.sp),
                topRight: Radius.circular(10.sp))),
        child: Obx(() => BottomBarBubble(
              selectedIndex: bottomcontroller.selectedIndex.value,
              color: AppColor.primaryColor,
              backgroundColor: Colors.transparent,
              items: [
                BottomBarItem(
                    iconBuilder: (color) => Image.asset('assets/Home.png',
                        color: color, height: 30, width: 30)),
                BottomBarItem(
                    iconBuilder: (color) => Image.asset('assets/Cart.png',
                        color: color, height: 30, width: 30)),
                BottomBarItem(
                    iconBuilder: (color) => Image.asset('assets/Like.png',
                        color: color, height: 30, width: 30)),
                BottomBarItem(
                    iconBuilder: (color) => Image.asset('assets/User.png',
                        color: color, height: 30, width: 30)),
              ],
              onSelect: (index) {
                // implement your select function here
                bottomcontroller.changeIndex(index: index);
              },
            )),
      ),
    );
  }
}
