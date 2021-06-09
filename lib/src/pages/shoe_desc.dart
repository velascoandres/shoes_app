import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    changeStatusLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: 'shoe-1',
                child: ShoeSizePreview(fullScreen: true),
              ),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    changeStatusDark();
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  ShoeDetail(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),
                  _BuyNow(price: 180.0),
                  _AvalaibleColors(),
                  _LikeSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LikeSettings extends StatelessWidget {
  const _LikeSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _ShadowButton(Icon(Icons.star, color: Colors.red)),
          _ShadowButton(Icon(Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4))),
          _ShadowButton(
              Icon(Icons.settings, color: Colors.grey.withOpacity(0.4))),
        ],
      ),
    );
  }
}

class _ShadowButton extends StatelessWidget {
  final Icon icon;

  _ShadowButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          )
        ],
      ),
    );
  }
}

class _AvalaibleColors extends StatelessWidget {
  const _AvalaibleColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _ColorButton(
                    color: Color(0xffC6D642),
                    index: 1,
                    assetPath: 'assets/images/verde.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _ColorButton(
                    color: Color(0xffFFAD29),
                    index: 2,
                    assetPath: 'assets/images/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _ColorButton(
                    color: Color(0xff2099F1),
                    index: 3,
                    assetPath: 'assets/images/azul.png',
                  ),
                ),
                _ColorButton(
                  color: Color(0xff364D56),
                  index: 4,
                  assetPath: 'assets/images/negro.png',
                ),
              ],
            ),
          ),
          OrangeButton(
            text: 'More Related Items',
            width: 170,
            height: 30,
            color: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String assetPath;

  const _ColorButton({
    Key? key,
    required this.color,
    required this.index,
    required this.assetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.assetImage = this.assetPath;
      },
      child: FadeInLeft(
        delay: Duration(milliseconds: this.index * 100),
        duration: Duration(milliseconds: 300),
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: this.color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _BuyNow extends StatelessWidget {
  final double price;

  const _BuyNow({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: [
            Text(
              '\$$price',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Bounce(
              delay: Duration(seconds: 1),
              from: 8,
              child: OrangeButton(
                text: 'Buy now',
                width: 120,
                height: 40,
              ),
            ),
            SizedBox(width: 20)
          ],
        ),
      ),
    );
  }
}
