import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBarHome extends StatelessWidget {
  final bool isFavorite;
  final bool isBack;
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controllerText;
  final void Function()? onPressedFavorite;
  final void Function() onPressedSearch;
  const CustomAppBarHome({
    Key? key,
    required this.hintText,
    required this.onPressedSearch,
    this.onPressedFavorite,
    this.controllerText,
    this.onChanged,
    this.isFavorite = true,
    this.isBack = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          if (isBack)
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
          if (isBack) const SizedBox(width: 7),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              controller: controllerText,
              cursorColor: AppColor.black,
              cursorHeight: 30,
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: const TextStyle(fontSize: 17),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: IconButton(
                        onPressed: onPressedSearch,
                        icon: const Icon(Icons.search)),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),
                  filled: true,
                  fillColor: Colors.grey[200]),
            ),
          ),
          if (isFavorite) const SizedBox(width: 7),
          if (isFavorite)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: IconButton(
                  onPressed: onPressedFavorite,
                  icon: const Icon(
                    Icons.favorite_border_outlined,
                    // size: 25,
                  )),
            )
        ],
      ),
    );
  }
}
