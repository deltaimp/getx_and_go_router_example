import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Count: ${controller.count.value}')),
            const SizedBox(height: 20),
            Obx(() => Text('Random: ${controller.randomNumber.value}')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.generateRandomNumber,
              child: const Text('Generate Random'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => controller.multiply(2),
                  child: const Text('x2'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => controller.multiply(3),
                  child: const Text('x3'),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}