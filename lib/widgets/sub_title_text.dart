import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;

  const SubTitleText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }
}
