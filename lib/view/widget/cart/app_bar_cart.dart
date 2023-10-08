import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarCart extends StatelessWidget {
  const CustomAppBarCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back_ios))),
            ),
            const Expanded(
              child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'My Cart',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ),
            const Spacer()
          ],
        ),
        const Divider(),
      ],
    );
  }
}
