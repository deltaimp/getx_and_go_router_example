import 'package:get/get.dart';

class ShopController extends GetxController {
  // Logica semplice per lo shop
  final itemCount = 0.obs;
  void addItem() => itemCount.value++;
}