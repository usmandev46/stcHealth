import 'package:get/get.dart';

class BottomBarController extends GetxController {
  RxInt selectedIndex = 0.obs;

  changeIndex({required int index}) {
    print('=======================  Index Value ${selectedIndex.value}');
    selectedIndex.value = index;
  }
}
