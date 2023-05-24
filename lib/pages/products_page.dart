import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xiaoyan_web/i10n/message_controller.dart';
import 'package:xiaoyan_web/pages/unknown_route_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  MessagesController messagesController = Get.put(MessagesController());

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('xiaoyan'.tr,
                style: const TextStyle(color: Colors.pink, fontSize: 30)),
            ElevatedButton(
                onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UnKnownRoutePage()))
                    .then((value) => print('---un:$value')),
                // onPressed: () => messagesController.changeLanguage('zh', "CN"),
                child: const Text("切换中文")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => messagesController.changeLanguage('en', "US"),
                child: const Text("切换英文")),
            RawKeyboardListener(
                focusNode: focusNode,
                child: const TextField(
                  showCursor: true,
                  readOnly: false,
                ))
          ],
        ),
      ),
    );
  }
}
