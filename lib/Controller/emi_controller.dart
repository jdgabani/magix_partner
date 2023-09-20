import 'package:get/get.dart';

class EmiController extends GetxController {
  double loanAmount2 = 0;
  updateValue(value) {
    loanAmount2 = value;
    update();
  }
}
