import 'package:get/get.dart';

class LeadIndController extends GetxController {
  int selected = 0;
  updateValue(value) {
    selected = value;
    update();
  }
}
