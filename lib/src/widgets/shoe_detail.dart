import 'package:flutter/material.dart';

class ShoeDetail extends StatelessWidget {
  final String title;
  final String description;

  const ShoeDetail({Key? key, required this.title, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              this.title,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Text(
              this.description,
              style: TextStyle(color: Colors.black54, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
