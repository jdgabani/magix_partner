import 'package:get/get.dart';

class ProfileController extends GetxController {
  int selected = 0;
  updateValue(value) {
    selected = value;
    update();
  }
}
