import 'dart:math';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final count = 0.obs;
  final randomNumber = 0.obs;

  void generateRandomNumber() {
    randomNumber.value = Random().nextInt(10) + 1;
  }

  void increment() => count.value++;
  void multiply(int n) => count.value *= n;
}