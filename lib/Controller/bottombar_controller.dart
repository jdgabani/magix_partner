import 'package:get/get.dart';

class BottomBarController extends GetxController {
  int selected = 0;
  updateValue(value) {
    selected = value;
    update();
  }
}
