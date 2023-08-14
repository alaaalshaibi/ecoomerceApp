import 'package:flutter/material.dart';

class CustomBodyAuth extends StatelessWidget {
  final String bodyText;
  const CustomBodyAuth({
    super.key,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        bodyText,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
