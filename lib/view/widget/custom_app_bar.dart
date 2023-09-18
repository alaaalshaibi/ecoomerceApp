import 'package:e_commerce_app/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  final String hintText;
  final void Function() onPressed;
  final void Function() onPressedFavorite;
  final void Function() onPressedSearch;
  const CustomAppBarHome({
    Key? key,
    required this.hintText,
    required this.onPressed,
    required this.onPressedSearch,
    required this.onPressedFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
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
          const SizedBox(width: 7),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[200],
            ),
            child: IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.notifications_active_outlined,
                  // size: 25,
                )),
          ),
          const SizedBox(width: 7),
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
