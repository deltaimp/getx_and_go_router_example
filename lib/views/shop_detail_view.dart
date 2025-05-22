import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import '../controllers/shop_controller.dart';

class ShopDetailView extends StatelessWidget {
  const ShopDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ShopController>();

    return Scaffold(
      appBar: AppBar(title: const Text('Shop Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              'You have ${controller.itemCount.value} items in your cart',
              style: Theme.of(context).textTheme.headlineSmall,
            )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.go('/shop'),
              child: const Text('Back to Shop'),
            ),
          ],
        ),
      ),
    );
  }
}