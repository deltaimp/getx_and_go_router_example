import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../controllers/shop_controller.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shop')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text('Items: ${controller.itemCount.value}')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/shop/detail'),
              child: const Text('Go to Detail'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}