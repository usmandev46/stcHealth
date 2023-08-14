import 'dart:developer';

import 'package:get/get.dart';
import 'package:stchealth/AppModule/Model/models.dart';
import 'package:stchealth/AppModule/Model/productDetailsModel.dart';
import 'package:stchealth/AppModule/Sevices/sevices.dart';

class AllController extends GetxController {
  var productList = <ProductsModel>[].obs;
  RxBool loginLoading = false.obs;

  RxBool productloading = false.obs;
  RxString errorProduct = ''.obs;

  RxBool productDetailsloading = false.obs;
  var productDetailsList = ProductsDetailsModel().obs;
  RxString errorProductDetails = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPrductFun();
  }

  Future<bool> loginFun({required Map data}) async {
    try {
      loginLoading(true);
      bool _data = await ServicesMethod.loginServices(data: data);
      loginLoading(false);
      return _data;
    } catch (e) {
      loginLoading(false);
      return false;
    }
  }

  Future<void> fetchPrductFun() async {
    errorProduct.value = '';
    try {
      productloading(true);

      var _data = await ServicesMethod.productServices();

      if (_data != null) {
        productList.value = _data;
        print(
            "==========================  List Length is : ${productList.length}");

        productloading(false);
      }

      productloading(false);
    } catch (e) {
      // showMsgToast(message: "$e");
      errorProduct.value = "$e";
      print("==========================  Errror is  is : ${e}");

      productloading(false);
    }
  }

  Future<void> fetchPrductDetailsFun({required String id}) async {
    errorProductDetails.value = '';
    try {
      productDetailsloading(true);

      var _data = await ServicesMethod.productDetailsServices(id);

      print("==========================  List data is : ${_data}");

      if (_data != null) {
        productDetailsList.value = _data;
        print(
            "==========================  List title is : ${productDetailsList.value.title}");

        productDetailsloading(false);
      }

      productDetailsloading(false);
    } catch (e) {
      // showMsgToast(message: "$e");
      errorProductDetails.value = "$e";
      print("==========================  Errror is  is : ${e}");

      productDetailsloading(false);
    }
  }
}
