import 'package:flutter/material.dart';

class ShoeSizePreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 430,
        decoration: BoxDecoration(
          color: Color(0xffFFCF53),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Column(
          children: [
            _ShoeShadow(),
            _Sizes(),
          ],
        ),
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          Positioned(
            child: _Shadow(),
            bottom: 20,
            right: 0,
          ),
          Image(image: AssetImage('assets/images/azul.png'))
        ],
      ),
    );
  }
}

class _Shadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}

class _Sizes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizeBox(size: 7.0),
          _SizeBox(size: 7.5),
          _SizeBox(size: 8.0),
          _SizeBox(size: 8.5),
          _SizeBox(
            size: 9.0,
            selected: true,
          ),
          _SizeBox(size: 9.5),
        ],
      ),
    );
  }
}

class _SizeBox extends StatelessWidget {
  final double size;
  final bool selected;

  _SizeBox({required this.size, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 45,
      height: 45,
      child: Text(
        '${size.toString().replaceAll('.0', '')}',
        style: TextStyle(
          color: selected ? Colors.white : Color(0xffF1A23A),
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      decoration: BoxDecoration(
        color: selected ? Color(0xffEAA14E) : Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          if (selected)
            BoxShadow(
              color: Color(0xffEAA14E),
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
        ],
      ),
    );
  }
}
