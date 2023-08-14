import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:stchealth/AppModule/Controller/AllController.dart';
import 'package:stchealth/AppModule/customWidgets/customButton.dart';
import 'package:stchealth/AppModule/customWidgets/myText.dart';

import '../constant/constantColor.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  var controller = Get.put(AllController());

  bool adjustContainer = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.productDetailsloading.value
        ? Container(
            height: double.maxFinite,
            color: Colors.white,
            child: Center(
              child: CupertinoActivityIndicator(
                radius: 10.sp,
                color: AppColor.primaryColor,
              ),
            ),
          )
        : controller.errorProductDetails.value != ''
            ? Container(
                padding: EdgeInsets.all(10.sp),
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
                child: Center(
                  child: myText(
                      text: controller.errorProductDetails.value, maxline: 10),
                ),
              )
            : Stack(
                children: [
                  Hero(
                    tag: "image",
                    child: AnimatedContainer(
                      width: double.infinity,
                      height: adjustContainer ? 48.5.h : 68.h,
                      // color: Colors.red,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  controller.productDetailsList.value.image),
                              fit: BoxFit.cover)),
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                customIconButton(
                                    icon: Icons.arrow_back_outlined,
                                    onpress: () {
                                      Get.back();
                                    }),
                                customIconButton(icon: Icons.more_vert_outlined)
                              ],
                            ),
                            SizedBox(height: 4.h),
                            myText(
                                text: "Details ",
                                color: Colors.white,
                                size: 20.sp,
                                fontweight: FontWeight.w700),
                            Spacer(),
                            myText(
                                text: "0000 AED",
                                size: 16.sp,
                                color: const Color(0xff2A404B)
                                // color: Colors.white
                                ),
                            SizedBox(height: 4.5.h)
                          ],
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    top: adjustContainer ? 45.h : 63.5.h,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedContainer(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      width: MediaQuery.of(context).size.width, // Full width
                      height: adjustContainer
                          ? 45.h
                          : 35.h, // Height of the green container
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.sp),
                          topRight: Radius.circular(30.sp),
                        ),
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: IconButton(
                                  onPressed: () {
                                    adjustContainer = !adjustContainer;
                                    setState(() {});
                                    print(
                                        "=============== value is Adjust $adjustContainer");
                                  },
                                  icon: Icon(
                                      adjustContainer
                                          ? Icons.keyboard_arrow_down_sharp
                                          : Icons.keyboard_arrow_up,
                                      size: 25.sp,
                                      color: AppColor.primaryColor)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.4),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.ios_share,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                customContainerButton(
                                    radius: 50.sp,
                                    text: "Order Now",
                                    width: 65.w)
                              ],
                            ),
                            SizedBox(height: 2.h),
                            myText(
                                text: "Description",
                                fontweight: FontWeight.w300,
                                textAlignment: TextAlign.start),
                            SizedBox(height: 1.5.h),
                            myText(
                                text: controller
                                    .productDetailsList.value.description,
                                fontweight: FontWeight.w400,
                                color: Color(0xff838396),
                                textAlignment: TextAlign.start,
                                maxline: 15),
                            SizedBox(height: 2.h),
                            adjustContainer != true
                                ? Container()
                                : AnimatedOpacity(
                                    opacity: adjustContainer ? 1 : 0,
                                    duration: const Duration(milliseconds: 500),
                                    child: Container(
                                      padding: EdgeInsets.all(8.sp),
                                      // height: 10.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xffF1F1F1)),
                                      width: double.maxFinite,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          myText(
                                              text:
                                                  "Reviews (${controller.productDetailsList.value.rating.count})",
                                              color: Color(0xff444B51)),
                                          SizedBox(height: 1.5.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              myText(
                                                  text:
                                                      "${controller.productDetailsList.value.rating.rate}",
                                                  size: 20.sp,
                                                  fontweight: FontWeight.w600,
                                                  color: Color(0xff444B51)),
                                              RatingBar.builder(
                                                initialRating: controller
                                                    .productDetailsList
                                                    .value
                                                    .rating
                                                    .rate,
                                                minRating: 1,
                                                unratedColor: Colors.grey,
                                                ignoreGestures: true,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber
                                                      .withOpacity(0.7),
                                                ),
                                                itemSize: 25.sp,
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                            SizedBox(height: 2.h)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }

  Widget customIconButton({required IconData icon, Callback? onpress}) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Icon(icon),
      ),
    );
  }
}
