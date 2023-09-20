import 'package:get/get.dart';

class LoanController extends GetxController {
  RxInt selected = 0.obs;
  updateValue(value) {
    selected = value;
    update();
  }
}
