import 'package:flutter/material.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Address'),
          centerTitle: true,
        ),
      ),
    );
  }
}
