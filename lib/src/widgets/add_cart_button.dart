import 'package:flutter/material.dart';

import 'custom_widgets.dart';

class AddCartButton extends StatelessWidget {
  final double price;

  const AddCartButton({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
            SizedBox(width: 20),
            Text(
              '\$$price',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            OrangeButton(text: 'Add to cart'),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
