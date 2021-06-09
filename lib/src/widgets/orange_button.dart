import 'dart:ui';

import 'package:flutter/material.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Color color;

  const OrangeButton({
    Key? key,
    required this.text,
    this.width = 150,
    this.height = 50,
    this.color = Colors.orange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: this.width,
      height: this.height,
      decoration: BoxDecoration(
        color: this.color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        '$text',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
