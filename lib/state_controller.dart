import 'package:get/get.dart';

class StateController extends GetxController{
  RxInt currentIndex = 0.obs;
  RxInt selectedOption = 0.obs;
  RxList options = [
    'None',
    'Reverse',
    'Enlarge Center Page',
    'Page Snapping',
    'Enable Infinite Scroll'
  ].obs;
}