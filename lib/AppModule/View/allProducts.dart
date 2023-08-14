import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:stchealth/AppModule/Controller/AllController.dart';
import 'package:stchealth/AppModule/View/detailsScreen.dart';
import 'package:stchealth/AppModule/constant/constantColor.dart';
import 'package:stchealth/AppModule/customWidgets/myText.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({super.key});

  @override
  State<AllProducts> createState() => _AllProductsState();
}

var controller = Get.put(AllController());

class _AllProductsState extends State<AllProducts> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 3.h),
              alignment: Alignment.center,
              height: 12.h,
              width: double.infinity,
              // color: Colors.green,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.08), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 2, // Blur radius
                      offset: Offset(0, 3), // Shadow offset
                    ),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12.sp),
                      bottomRight: Radius.circular(12.sp))),
              child: myText(text: "All Products", size: 18.sp),
            ),
            Obx(() => controller.productloading.value
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: CupertinoActivityIndicator(
                        radius: 10.sp,
                        color: AppColor.primaryColor,
                      ),
                    ),
                  )
                : controller.errorProduct.value == ''
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.productList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Material(
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 10.sp),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.sp),
                                  onTap: () {
                                    controller.fetchPrductDetailsFun(
                                        id: controller.productList[index].id
                                            .toString());
                                    Get.to(DetailsScreen(),
                                        transition: Transition.circularReveal,
                                        duration:
                                            const Duration(milliseconds: 600));
                                  },
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Hero(
                                          tag: 'image',
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 2.5.h),
                                            height: 25.h,
                                            // color: Colors.red,
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    spreadRadius: 2,
                                                    blurRadius: 5,
                                                    offset: Offset(0, 2),
                                                  ),
                                                ],
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        controller
                                                            .productList[index]
                                                            .image),
                                                    fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp)),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                myText(
                                                    text: "00000 AED",
                                                    color: Colors.white,
                                                    fontweight: FontWeight.w700,
                                                    size: 15.sp),
                                                RatingBar.builder(
                                                  initialRating: controller
                                                      .productList[index]
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
                                                  itemSize: 15.sp,
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                        myText(
                                            textAlignment: TextAlign.start,
                                            text: controller
                                                .productList[index].title,
                                            fontweight: FontWeight.w300),
                                        SizedBox(height: 1.h),
                                        myText(
                                            textAlignment: TextAlign.start,
                                            text: controller
                                                .productList[index].description,
                                            fontweight: FontWeight.w400,
                                            maxline: 3),
                                        SizedBox(height: 3.h),
                                      ]),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(10.sp),
                        height: MediaQuery.of(context).size.height,
                        child: Center(
                          child: myText(
                              text: controller.errorProduct.value, maxline: 10),
                        ),
                      )),
          ],
        ),
      ),
    );
  }
}
